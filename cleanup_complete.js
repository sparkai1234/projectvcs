require('dotenv').config();
const { createClient } = require('@supabase/supabase-js');

const supabase = createClient(process.env.SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

async function completeCleanup() {
    console.log('🧹 Complete Database Cleanup');
    console.log('Handling foreign key constraints...\n');
    
    try {
        // Delete dependent tables first
        console.log('🔄 Clearing contacts_matched table...');
        await supabase.from('contacts_matched').delete().neq('id', '00000000-0000-0000-0000-000000000000');
        console.log('✅ Cleared contacts_matched');
        
        // Now delete VC table
        console.log('🔄 Clearing vc_table...');
        await supabase.from('vc_table').delete().neq('id', '00000000-0000-0000-0000-000000000000');
        console.log('✅ Cleared vc_table');
        
        // Fund table should already be clear
        console.log('🔄 Verifying fund_table is clear...');
        const { count: fundCount } = await supabase.from('fund_table').select('*', { count: 'exact' });
        if (fundCount > 0) {
            await supabase.from('fund_table').delete().neq('id', '00000000-0000-0000-0000-000000000000');
            console.log('✅ Cleared fund_table');
        } else {
            console.log('✅ Fund table already clear');
        }
        
        // Final verification
        console.log('\n🔍 Final Verification:');
        const { count: vcCount } = await supabase.from('vc_table').select('*', { count: 'exact' });
        const { count: finalFundCount } = await supabase.from('fund_table').select('*', { count: 'exact' });
        const { count: contactsCount } = await supabase.from('contacts_matched').select('*', { count: 'exact' });
        
        console.log(`👥 VCs remaining: ${vcCount || 0}`);
        console.log(`💰 Funds remaining: ${finalFundCount || 0}`);
        console.log(`📞 Contacts remaining: ${contactsCount || 0}`);
        console.log(`📊 Total remaining: ${(vcCount || 0) + (finalFundCount || 0) + (contactsCount || 0)}`);
        
        if ((vcCount || 0) === 0 && (finalFundCount || 0) === 0 && (contactsCount || 0) === 0) {
            console.log('\n🎉 DATABASE COMPLETELY CLEAN!');
            console.log('✅ Ready for 100% authentic fresh run');
            console.log('🚀 No historical data contamination');
            console.log('🎯 Perfect baseline for monitoring');
        } else {
            console.log('\n⚠️ Some records may still remain');
        }
        
        console.log('\n⚡ READY FOR FRESH RUN:');
        console.log('1. Start fresh VCS scraper on Apify');
        console.log('2. Monitor: node monitor_fresh_run.js');
        console.log('3. Target: Exactly 4,406 records (717 VCs + 3,689 funds)');
        
    } catch (error) {
        console.error('💥 Cleanup error:', error.message);
    }
}

completeCleanup(); 