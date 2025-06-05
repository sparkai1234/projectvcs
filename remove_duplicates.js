require('dotenv').config();
const { createClient } = require('@supabase/supabase-js');

const supabaseUrl = process.env.SUPABASE_URL;
const supabaseServiceKey = process.env.SUPABASE_SERVICE_ROLE_KEY;

const supabase = createClient(supabaseUrl, supabaseServiceKey);

async function removeDuplicates() {
    console.log('🧹 VCS Database Deduplication');
    console.log('=' .repeat(35));
    
    let totalRemoved = 0;
    
    try {
        // 1. Remove Fund Duplicates
        console.log('\n💰 DEDUPLICATING FUND TABLE:');
        
        const { data: allFunds } = await supabase
            .from('fund_table')
            .select('id, fund_name, fund_name_en, fund_type, investment_focus, created_at')
            .order('created_at', { ascending: true }); // Oldest first
            
        if (allFunds) {
            const fundMap = new Map();
            const duplicatesToRemove = [];
            
            // Group funds by name
            allFunds.forEach(fund => {
                const key = (fund.fund_name || fund.fund_name_en || '').toLowerCase().trim();
                if (key === '') return; // Skip empty names
                
                if (!fundMap.has(key)) {
                    fundMap.set(key, fund); // Keep the first (oldest) record
                } else {
                    duplicatesToRemove.push(fund.id); // Mark newer duplicates for removal
                }
            });
            
            console.log(`📊 Total Funds: ${allFunds.length}`);
            console.log(`🗑️ Duplicates to Remove: ${duplicatesToRemove.length}`);
            
            if (duplicatesToRemove.length > 0) {
                console.log('\n🔄 Removing fund duplicates in batches...');
                
                // Remove in batches of 100 to avoid timeout
                const batchSize = 100;
                for (let i = 0; i < duplicatesToRemove.length; i += batchSize) {
                    const batch = duplicatesToRemove.slice(i, i + batchSize);
                    
                    const { error } = await supabase
                        .from('fund_table')
                        .delete()
                        .in('id', batch);
                        
                    if (error) {
                        console.error(`❌ Batch ${Math.floor(i/batchSize) + 1} Error:`, error.message);
                    } else {
                        console.log(`✅ Batch ${Math.floor(i/batchSize) + 1}: Removed ${batch.length} duplicates`);
                        totalRemoved += batch.length;
                    }
                    
                    // Small delay between batches
                    await new Promise(resolve => setTimeout(resolve, 500));
                }
            }
        }
        
        // 2. Remove VC Duplicates
        console.log('\n👥 DEDUPLICATING VC TABLE:');
        
        const { data: allVCs } = await supabase
            .from('vc_table')
            .select('id, name, company_name, position, created_at')
            .order('created_at', { ascending: true }); // Oldest first
            
        if (allVCs) {
            const vcMap = new Map();
            const vcDuplicatesToRemove = [];
            
            // Group VCs by name + company
            allVCs.forEach(vc => {
                const key = `${vc.name || ''}_${vc.company_name || ''}`.toLowerCase().trim();
                if (key === '_' || key === '') return; // Skip empty records
                
                if (!vcMap.has(key)) {
                    vcMap.set(key, vc); // Keep the first (oldest) record
                } else {
                    vcDuplicatesToRemove.push(vc.id); // Mark newer duplicates for removal
                }
            });
            
            console.log(`📊 Total VCs: ${allVCs.length}`);
            console.log(`🗑️ VC Duplicates to Remove: ${vcDuplicatesToRemove.length}`);
            
            if (vcDuplicatesToRemove.length > 0) {
                console.log('\n🔄 Removing VC duplicates...');
                
                const { error } = await supabase
                    .from('vc_table')
                    .delete()
                    .in('id', vcDuplicatesToRemove);
                    
                if (error) {
                    console.error('❌ VC Deduplication Error:', error.message);
                } else {
                    console.log(`✅ Removed ${vcDuplicatesToRemove.length} VC duplicates`);
                    totalRemoved += vcDuplicatesToRemove.length;
                }
            }
        }
        
        // 3. Verify Results
        console.log('\n🔍 POST-DEDUPLICATION VERIFICATION:');
        
        const { count: finalVCCount } = await supabase
            .from('vc_table')
            .select('*', { count: 'exact' });
            
        const { count: finalFundCount } = await supabase
            .from('fund_table')
            .select('*', { count: 'exact' });
            
        console.log(`👥 Final VC Count: ${finalVCCount || 0}`);
        console.log(`💰 Final Fund Count: ${finalFundCount || 0}`);
        console.log(`📊 Final Total: ${(finalVCCount || 0) + (finalFundCount || 0)}`);
        console.log(`🗑️ Total Removed: ${totalRemoved} duplicates`);
        
        // 4. Compare with Expected
        console.log('\n🎯 COMPARISON WITH EXPECTED:');
        const expectedVCs = 717;
        const expectedFunds = 3689;
        const expectedTotal = 4406;
        
        console.log(`👥 VCs: ${finalVCCount || 0}/${expectedVCs} (${(((finalVCCount || 0)/expectedVCs)*100).toFixed(1)}%)`);
        console.log(`💰 Funds: ${finalFundCount || 0}/${expectedFunds} (${(((finalFundCount || 0)/expectedFunds)*100).toFixed(1)}%)`);
        console.log(`📊 Total: ${(finalVCCount || 0) + (finalFundCount || 0)}/${expectedTotal} (${((((finalVCCount || 0) + (finalFundCount || 0))/expectedTotal)*100).toFixed(1)}%)`);
        
        // 5. Success Summary
        console.log('\n🎉 DEDUPLICATION SUMMARY:');
        if (totalRemoved > 0) {
            console.log(`✅ Successfully removed ${totalRemoved} duplicate records`);
            console.log(`🧹 Database is now cleaner and more accurate`);
            console.log(`📈 Data quality improved significantly`);
        } else {
            console.log(`✅ No duplicates found - database was already clean`);
        }
        
        console.log('\n⚡ NEXT STEPS:');
        console.log('1. Run: node check_duplicates.js (verify cleanup)');
        console.log('2. Run: node check_data_flow.js (updated statistics)');
        console.log('3. Consider adding unique constraints to prevent future duplicates');
        console.log('4. Monitor scraper runs for duplicate prevention');
        
        return {
            removed: totalRemoved,
            finalVCs: finalVCCount || 0,
            finalFunds: finalFundCount || 0,
            finalTotal: (finalVCCount || 0) + (finalFundCount || 0)
        };
        
    } catch (error) {
        console.error('💥 Deduplication Error:', error.message);
        return null;
    }
}

// Safety confirmation
console.log('⚠️  WARNING: This will permanently delete duplicate records');
console.log('📋 Make sure you have reviewed the duplicates first with: node check_duplicates.js');
console.log('🔄 Starting deduplication in 3 seconds...\n');

setTimeout(() => {
    removeDuplicates().then(results => {
        if (results) {
            console.log(`\n🏁 Deduplication completed. Removed ${results.removed} records.`);
            console.log(`📊 Final count: ${results.finalTotal} records (${results.finalVCs} VCs + ${results.finalFunds} funds)`);
        }
    });
}, 3000); 