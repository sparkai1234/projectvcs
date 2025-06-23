require('dotenv').config();
const { createClient } = require('@supabase/supabase-js');

const supabaseUrl = process.env.SUPABASE_URL;
const supabaseServiceKey = process.env.SUPABASE_SERVICE_ROLE_KEY;

const supabase = createClient(supabaseUrl, supabaseServiceKey);

async function checkDuplicates() {
    console.log('🔍 Duplicate Detection Analysis');
    console.log('=' .repeat(40));
    
    try {
        // 1. VC Table Duplicate Analysis
        console.log('\n👥 VC TABLE DUPLICATE ANALYSIS:');
        
        // Check for duplicate VCs by name + company
        const { data: vcDuplicates } = await supabase
            .from('vc_table')
            .select('name, company_name, COUNT(*)')
            .not('name', 'is', null)
            .not('company_name', 'is', null);
            
        // Get all VCs to analyze manually
        const { data: allVCs } = await supabase
            .from('vc_table')
            .select('id, name, company_name, position, created_at');
            
        if (allVCs) {
            const vcMap = new Map();
            const vcDuplicateGroups = [];
            
            allVCs.forEach(vc => {
                const key = `${vc.name || ''}_${vc.company_name || ''}`.toLowerCase();
                if (!vcMap.has(key)) {
                    vcMap.set(key, []);
                }
                vcMap.get(key).push(vc);
            });
            
            // Find duplicate groups
            vcMap.forEach((group, key) => {
                if (group.length > 1 && key !== '_') {
                    vcDuplicateGroups.push({ key, count: group.length, records: group });
                }
            });
            
            console.log(`📊 Total VCs: ${allVCs.length}`);
            console.log(`🔄 Duplicate Groups: ${vcDuplicateGroups.length}`);
            console.log(`⚠️ Duplicate Records: ${vcDuplicateGroups.reduce((sum, group) => sum + (group.count - 1), 0)}`);
            
            if (vcDuplicateGroups.length > 0) {
                console.log('\n🔍 Sample VC Duplicates:');
                vcDuplicateGroups.slice(0, 3).forEach((group, i) => {
                    console.log(`   ${i+1}. "${group.records[0].name}" at "${group.records[0].company_name}" (${group.count} copies)`);
                    group.records.forEach((record, j) => {
                        console.log(`      ${j+1}) ID: ${record.id} | Created: ${new Date(record.created_at).toLocaleString()}`);
                    });
                });
            }
        }
        
        // 2. Fund Table Duplicate Analysis
        console.log('\n💰 FUND TABLE DUPLICATE ANALYSIS:');
        
        const { data: allFunds } = await supabase
            .from('fund_table')
            .select('id, fund_name, fund_name_en, fund_type, investment_focus, created_at');
            
        if (allFunds) {
            const fundMap = new Map();
            const fundDuplicateGroups = [];
            
            allFunds.forEach(fund => {
                // Use fund_name as primary key for duplicate detection
                const key = (fund.fund_name || fund.fund_name_en || '').toLowerCase().trim();
                if (!fundMap.has(key)) {
                    fundMap.set(key, []);
                }
                fundMap.get(key).push(fund);
            });
            
            // Find duplicate groups
            fundMap.forEach((group, key) => {
                if (group.length > 1 && key !== '') {
                    fundDuplicateGroups.push({ key, count: group.length, records: group });
                }
            });
            
            console.log(`📊 Total Funds: ${allFunds.length}`);
            console.log(`🔄 Duplicate Groups: ${fundDuplicateGroups.length}`);
            console.log(`⚠️ Duplicate Records: ${fundDuplicateGroups.reduce((sum, group) => sum + (group.count - 1), 0)}`);
            
            if (fundDuplicateGroups.length > 0) {
                console.log('\n🔍 Sample Fund Duplicates:');
                fundDuplicateGroups.slice(0, 5).forEach((group, i) => {
                    console.log(`   ${i+1}. "${group.key}" (${group.count} copies)`);
                    group.records.slice(0, 3).forEach((record, j) => {
                        console.log(`      ${j+1}) ID: ${record.id} | Type: ${record.fund_type || 'N/A'} | Created: ${new Date(record.created_at).toLocaleString()}`);
                    });
                });
                
                // Show top duplicate offenders
                const topDuplicates = fundDuplicateGroups
                    .sort((a, b) => b.count - a.count)
                    .slice(0, 3);
                    
                console.log('\n🏆 TOP DUPLICATE OFFENDERS:');
                topDuplicates.forEach((group, i) => {
                    console.log(`   ${i+1}. "${group.key}" - ${group.count} copies`);
                });
            }
        }
        
        // 3. Summary & Impact Analysis
        console.log('\n📊 DUPLICATION IMPACT SUMMARY:');
        
        let vcDuplicateGroups = [];
        if (allVCs) {
            const vcMap = new Map();
            allVCs.forEach(vc => {
                const key = `${vc.name || ''}_${vc.company_name || ''}`.toLowerCase();
                if (!vcMap.has(key)) {
                    vcMap.set(key, []);
                }
                vcMap.get(key).push(vc);
            });
            
            vcMap.forEach((group, key) => {
                if (group.length > 1 && key !== '_') {
                    vcDuplicateGroups.push({ key, count: group.length, records: group });
                }
            });
        }
        
        const vcDuplicateCount = vcDuplicateGroups?.reduce((sum, group) => sum + (group.count - 1), 0) || 0;
        const fundDuplicateCount = fundDuplicateGroups?.reduce((sum, group) => sum + (group.count - 1), 0) || 0;
        const totalDuplicates = vcDuplicateCount + fundDuplicateCount;
        
        console.log(`⚠️ VC Duplicates: ${vcDuplicateCount} records`);
        console.log(`⚠️ Fund Duplicates: ${fundDuplicateCount} records`);
        console.log(`💥 Total Duplicates: ${totalDuplicates} records`);
        
        const cleanVCs = (allVCs?.length || 0) - vcDuplicateCount;
        const cleanFunds = (allFunds?.length || 0) - fundDuplicateCount;
        const cleanTotal = cleanVCs + cleanFunds;
        
        console.log(`✅ Clean VCs: ${cleanVCs}`);
        console.log(`✅ Clean Funds: ${cleanFunds}`);
        console.log(`🎯 Clean Total: ${cleanTotal} records`);
        
        // Compare with expected
        console.log('\n🎯 EXPECTED vs CLEAN DATA:');
        console.log(`👥 VCs: ${cleanVCs}/717 expected (${((cleanVCs/717)*100).toFixed(1)}%)`);
        console.log(`💰 Funds: ${cleanFunds}/3689 expected (${((cleanFunds/3689)*100).toFixed(1)}%)`);
        console.log(`📊 Total: ${cleanTotal}/4406 expected (${((cleanTotal/4406)*100).toFixed(1)}%)`);
        
        // 4. Deduplication Recommendation
        console.log('\n💡 RECOMMENDATIONS:');
        if (totalDuplicates > 100) {
            console.log('🚨 HIGH DUPLICATION DETECTED - Immediate cleanup needed');
            console.log('🔧 Run: node remove_duplicates.js (to be created)');
            console.log('📊 Expected reduction: ~' + totalDuplicates + ' records');
        } else if (totalDuplicates > 10) {
            console.log('⚠️ MODERATE DUPLICATION - Cleanup recommended');
            console.log('🔧 Consider running deduplication script');
        } else {
            console.log('✅ LOW DUPLICATION - Data quality is good');
        }
        
        console.log('\n⚡ NEXT STEPS:');
        console.log('1. Review duplicate samples above');
        console.log('2. Run deduplication if needed');
        console.log('3. Implement unique constraints');
        console.log('4. Monitor future runs for duplicates');
        
        return {
            vcDuplicates: vcDuplicateCount,
            fundDuplicates: fundDuplicateCount,
            totalDuplicates,
            cleanTotal
        };
        
    } catch (error) {
        console.error('💥 Duplicate Check Error:', error.message);
        return null;
    }
}

checkDuplicates().then(results => {
    if (results) {
        console.log(`\n🔍 Duplicate analysis completed. Found ${results.totalDuplicates} duplicates.`);
    }
}); 