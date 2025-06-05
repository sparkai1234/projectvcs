import { createClient } from '@supabase/supabase-js';

const supabaseUrl = process.env.SUPABASE_URL;
const supabaseServiceKey = process.env.SUPABASE_SERVICE_ROLE_KEY;
const supabase = createClient(supabaseUrl, supabaseServiceKey);

console.log('🧹 === SUPABASE DUPLICATE CLEANUP ===');
console.log(`🕐 Cleanup Time: ${new Date().toISOString()}`);

async function checkAndCleanupDuplicates() {
    try {
        console.log('\n📊 STEP 1: CHECKING CURRENT DUPLICATES...');
        
        // Check VC duplicates
        const { data: vcDuplicates, error: vcError } = await supabase.rpc('exec_sql', {
            sql: `
                SELECT 
                    company_name,
                    COUNT(*) as duplicate_count
                FROM vc_table 
                GROUP BY company_name 
                HAVING COUNT(*) > 1
                ORDER BY duplicate_count DESC
                LIMIT 10;
            `
        });
        
        if (vcError) {
            console.log('🔍 VC Duplicate Check (Manual)...');
            // Fallback to manual check
            const { data: allVCs } = await supabase.from('vc_table').select('company_name');
            if (allVCs) {
                const vcNames = {};
                let vcDupeCount = 0;
                allVCs.forEach(vc => {
                    const name = vc.company_name;
                    if (vcNames[name]) {
                        vcDupeCount++;
                    } else {
                        vcNames[name] = 1;
                    }
                });
                console.log(`📋 VC Duplicates Found: ${vcDupeCount}`);
            }
        } else {
            console.log(`📋 VC Duplicates Found: ${vcDuplicates?.length || 0}`);
            if (vcDuplicates && vcDuplicates.length > 0) {
                vcDuplicates.forEach((vc, i) => {
                    console.log(`   ${i+1}. ${vc.company_name}: ${vc.duplicate_count} copies`);
                });
            }
        }
        
        // Check Fund duplicates
        console.log('\n🔍 Fund Duplicate Check...');
        const { data: allFunds } = await supabase.from('fund_table').select('fund_name');
        if (allFunds) {
            const fundNames = {};
            let fundDupeCount = 0;
            const duplicatedFunds = [];
            
            allFunds.forEach(fund => {
                const name = fund.fund_name;
                if (fundNames[name]) {
                    fundDupeCount++;
                    if (!duplicatedFunds.includes(name)) {
                        duplicatedFunds.push(name);
                    }
                } else {
                    fundNames[name] = 1;
                }
            });
            
            console.log(`📋 Fund Duplicates Found: ${fundDupeCount} duplicate entries`);
            console.log(`📋 Unique Fund Names with Dupes: ${duplicatedFunds.length}`);
            
            if (duplicatedFunds.length > 0) {
                console.log(`📝 Sample Duplicated Funds:`);
                duplicatedFunds.slice(0, 5).forEach((name, i) => {
                    console.log(`   ${i+1}. ${name}`);
                });
            }
        }
        
        console.log('\n🧹 STEP 2: CLEANUP DUPLICATES...');
        
        // Get counts before cleanup
        const { count: vcCountBefore } = await supabase.from('vc_table').select('*', { count: 'exact' });
        const { count: fundCountBefore } = await supabase.from('fund_table').select('*', { count: 'exact' });
        
        console.log(`📊 Before Cleanup: ${vcCountBefore} VCs, ${fundCountBefore} Funds`);
        
        // Cleanup VCs - Get all VCs and identify duplicates
        const { data: allVCsForCleanup } = await supabase
            .from('vc_table')
            .select('id, company_name, created_at')
            .order('company_name, created_at desc');
            
        if (allVCsForCleanup) {
            const vcToDelete = [];
            const seen = new Set();
            
            allVCsForCleanup.forEach(vc => {
                if (seen.has(vc.company_name)) {
                    vcToDelete.push(vc.id);
                } else {
                    seen.add(vc.company_name);
                }
            });
            
            if (vcToDelete.length > 0) {
                console.log(`🗑️ Removing ${vcToDelete.length} duplicate VCs...`);
                const { error: deleteVcError } = await supabase
                    .from('vc_table')
                    .delete()
                    .in('id', vcToDelete);
                    
                if (deleteVcError) {
                    console.error('❌ VC cleanup error:', deleteVcError.message);
                } else {
                    console.log(`✅ Successfully removed ${vcToDelete.length} duplicate VCs`);
                }
            } else {
                console.log(`✅ No VC duplicates to remove`);
            }
        }
        
        // Cleanup Funds - Get all Funds and identify duplicates
        const { data: allFundsForCleanup } = await supabase
            .from('fund_table')
            .select('id, fund_name, created_at')
            .order('fund_name, created_at desc');
            
        if (allFundsForCleanup) {
            const fundToDelete = [];
            const seen = new Set();
            
            allFundsForCleanup.forEach(fund => {
                if (seen.has(fund.fund_name)) {
                    fundToDelete.push(fund.id);
                } else {
                    seen.add(fund.fund_name);
                }
            });
            
            if (fundToDelete.length > 0) {
                console.log(`🗑️ Removing ${fundToDelete.length} duplicate Funds...`);
                
                // Delete in batches to avoid timeout
                const batchSize = 100;
                let deletedCount = 0;
                
                for (let i = 0; i < fundToDelete.length; i += batchSize) {
                    const batch = fundToDelete.slice(i, i + batchSize);
                    const { error: deleteFundError } = await supabase
                        .from('fund_table')
                        .delete()
                        .in('id', batch);
                        
                    if (deleteFundError) {
                        console.error(`❌ Fund cleanup error (batch ${Math.floor(i/batchSize) + 1}):`, deleteFundError.message);
                    } else {
                        deletedCount += batch.length;
                        console.log(`✅ Batch ${Math.floor(i/batchSize) + 1}: Removed ${batch.length} duplicate funds`);
                    }
                }
                
                console.log(`✅ Total: Successfully removed ${deletedCount} duplicate Funds`);
            } else {
                console.log(`✅ No Fund duplicates to remove`);
            }
        }
        
        // Get counts after cleanup
        const { count: vcCountAfter } = await supabase.from('vc_table').select('*', { count: 'exact' });
        const { count: fundCountAfter } = await supabase.from('fund_table').select('*', { count: 'exact' });
        
        console.log('\n📊 STEP 3: CLEANUP RESULTS');
        console.log(`✅ VCs: ${vcCountBefore} → ${vcCountAfter} (removed ${vcCountBefore - vcCountAfter})`);
        console.log(`✅ Funds: ${fundCountBefore} → ${fundCountAfter} (removed ${fundCountBefore - fundCountAfter})`);
        console.log(`🎯 Total: ${vcCountAfter + fundCountAfter} records (removed ${(vcCountBefore + fundCountBefore) - (vcCountAfter + fundCountAfter)})`);
        
        console.log('\n🎉 CLEANUP COMPLETE!');
        console.log('💡 Database now contains only unique records');
        
    } catch (error) {
        console.error('❌ Cleanup error:', error.message);
    }
}

checkAndCleanupDuplicates(); 