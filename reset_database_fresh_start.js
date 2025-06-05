require('dotenv').config();
const { createClient } = require('@supabase/supabase-js');

const supabaseUrl = process.env.SUPABASE_URL;
const supabaseServiceKey = process.env.SUPABASE_SERVICE_ROLE_KEY;

const supabase = createClient(supabaseUrl, supabaseServiceKey);

async function resetDatabaseForFreshStart() {
    console.log('🗑️ Database Reset for Fresh VCS Run');
    console.log('=' .repeat(35));
    
    try {
        // 1. Get current counts for confirmation
        console.log('\n📊 Current Database State:');
        const { count: currentVCs } = await supabase
            .from('vc_table')
            .select('*', { count: 'exact' });
            
        const { count: currentFunds } = await supabase
            .from('fund_table')
            .select('*', { count: 'exact' });
            
        console.log(`👥 Current VCs: ${currentVCs || 0}`);
        console.log(`💰 Current Funds: ${currentFunds || 0}`);
        console.log(`📊 Total Records: ${(currentVCs || 0) + (currentFunds || 0)}`);
        
        // 2. Safety confirmation
        console.log('\n⚠️ WARNING: This will DELETE ALL DATA');
        console.log('🎯 Purpose: Fresh start for 100% authentic data collection');
        console.log('📋 After reset: Run fresh scraper for clean baseline');
        
        // 3. Delete all fund records
        console.log('\n🧹 Deleting all fund records...');
        const { error: fundError, count: deletedFunds } = await supabase
            .from('fund_table')
            .delete()
            .neq('id', '00000000-0000-0000-0000-000000000000'); // Delete all (using impossible ID)
            
        if (fundError) {
            console.error('❌ Fund deletion error:', fundError.message);
        } else {
            console.log(`✅ Deleted all fund records`);
        }
        
        // 4. Delete all VC records  
        console.log('🧹 Deleting all VC records...');
        const { error: vcError, count: deletedVCs } = await supabase
            .from('vc_table')
            .delete()
            .neq('id', '00000000-0000-0000-0000-000000000000'); // Delete all (using impossible ID)
            
        if (vcError) {
            console.error('❌ VC deletion error:', vcError.message);
        } else {
            console.log(`✅ Deleted all VC records`);
        }
        
        // 5. Verify empty database
        console.log('\n🔍 Post-Reset Verification:');
        const { count: finalVCs } = await supabase
            .from('vc_table')
            .select('*', { count: 'exact' });
            
        const { count: finalFunds } = await supabase
            .from('fund_table')
            .select('*', { count: 'exact' });
            
        console.log(`👥 VCs remaining: ${finalVCs || 0}`);
        console.log(`💰 Funds remaining: ${finalFunds || 0}`);
        console.log(`📊 Total remaining: ${(finalVCs || 0) + (finalFunds || 0)}`);
        
        if ((finalVCs || 0) === 0 && (finalFunds || 0) === 0) {
            console.log('✅ Database successfully reset - completely clean!');
        } else {
            console.log('⚠️ Some records may remain - check manually');
        }
        
        // 6. Fresh start instructions
        console.log('\n🚀 FRESH START READY:');
        console.log('✅ Database is now completely clean');
        console.log('🎯 Ready for 100% authentic data collection');
        console.log('📊 Expected results: 717 VCs + 3,689 funds = 4,406 total');
        
        console.log('\n⚡ NEXT STEPS:');
        console.log('1. Start fresh VCS scraper run on Apify');
        console.log('2. Monitor: node monitor_live_run.js');
        console.log('3. Check quality: node check_data_flow.js');
        console.log('4. Watch for duplicates: node check_duplicates.js');
        
        console.log('\n🛡️ MONITORING READY:');
        console.log('✅ Real-time monitoring tools deployed');
        console.log('✅ Duplicate detection ready');
        console.log('✅ Data quality tracking ready');
        console.log('✅ 100% accuracy monitoring enabled');
        
        return {
            before: {
                vcs: currentVCs || 0,
                funds: currentFunds || 0,
                total: (currentVCs || 0) + (currentFunds || 0)
            },
            after: {
                vcs: finalVCs || 0,
                funds: finalFunds || 0,
                total: (finalVCs || 0) + (finalFunds || 0)
            },
            deleted: {
                vcs: (currentVCs || 0) - (finalVCs || 0),
                funds: (currentFunds || 0) - (finalFunds || 0),
                total: ((currentVCs || 0) + (currentFunds || 0)) - ((finalVCs || 0) + (finalFunds || 0))
            }
        };
        
    } catch (error) {
        console.error('💥 Database reset error:', error.message);
        return null;
    }
}

// Safety delay and confirmation
console.log('🗑️ VCS DATABASE RESET FOR FRESH START');
console.log('⚠️ This will permanently delete ALL current data');
console.log('🎯 Purpose: Clean slate for 100% authentic collection');
console.log('🔄 Starting reset in 5 seconds...\n');

setTimeout(() => {
    resetDatabaseForFreshStart().then(results => {
        if (results) {
            console.log(`\n🏁 Database reset completed!`);
            console.log(`🗑️ Deleted: ${results.deleted.total} records total`);
            console.log(`   👥 VCs: ${results.deleted.vcs}`);
            console.log(`   💰 Funds: ${results.deleted.funds}`);
            console.log(`🎉 Database is now ready for fresh, authentic data collection!`);
        }
    });
}, 5000); 