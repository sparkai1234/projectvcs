/**
 * 🔍 TABLE VERIFICATION SCRIPT
 * ============================
 * 
 * Quick script to verify all required tables exist after manual setup
 */

require('dotenv').config();
const { createClient } = require('@supabase/supabase-js');

const supabaseUrl = process.env.SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY;

if (!supabaseUrl || !supabaseKey) {
    console.error('❌ Missing environment variables');
    process.exit(1);
}

const supabase = createClient(supabaseUrl, supabaseKey);

async function verifyAllTables() {
    console.log('🔍 === TABLE VERIFICATION ===\n');
    
    const expectedTables = [
        { name: 'kdb_fund_of_funds_raw', category: 'Fund of Funds' },
        { name: 'kgrowth_fund_of_funds_raw', category: 'Fund of Funds' },
        { name: 'kvic_investment_raw', category: 'KVIC API' },
        { name: 'kvic_fund_raw', category: 'KVIC API' },
        { name: 'kvic_portfolio_raw', category: 'KVIC API' },
        { name: 'pdf_analysis_results', category: 'PDF AI Analysis' },
        { name: 'ai_trend_insights', category: 'PDF AI Analysis' },
        { name: 'investment_intelligence_insights', category: 'PDF AI Analysis' },
        { name: 'trend_reports', category: 'PDF AI Analysis' }
    ];
    
    let successCount = 0;
    const results = {};
    
    for (const table of expectedTables) {
        try {
            const { data, error } = await supabase
                .from(table.name)
                .select('*')
                .limit(1);
            
            if (error) {
                console.log(`❌ ${table.name}: ${error.message}`);
                results[table.category] = results[table.category] || { success: 0, total: 0 };
                results[table.category].total++;
            } else {
                console.log(`✅ ${table.name}: EXISTS`);
                successCount++;
                results[table.category] = results[table.category] || { success: 0, total: 0 };
                results[table.category].success++;
                results[table.category].total++;
            }
        } catch (err) {
            console.log(`❌ ${table.name}: ERROR - ${err.message}`);
            results[table.category] = results[table.category] || { success: 0, total: 0 };
            results[table.category].total++;
        }
    }
    
    console.log(`\n📊 === SUMMARY BY CATEGORY ===`);
    for (const [category, stats] of Object.entries(results)) {
        const status = stats.success === stats.total ? '✅' : '❌';
        console.log(`${status} ${category}: ${stats.success}/${stats.total} tables`);
    }
    
    console.log(`\n🎯 === OVERALL RESULT ===`);
    console.log(`Total: ${successCount}/${expectedTables.length} tables created`);
    
    if (successCount === expectedTables.length) {
        console.log('🎉 ALL TABLES CREATED SUCCESSFULLY!');
        console.log('✅ Ready to start scraping and analysis');
        return true;
    } else {
        console.log('⚠️ Some tables are missing - complete manual setup first');
        console.log('\n💡 Next steps:');
        console.log('1. Go to Supabase Dashboard → SQL Editor');
        console.log('2. Run the SQL files that failed');
        console.log('3. Run this script again to verify');
        return false;
    }
}

// Execute verification
(async () => {
    try {
        await verifyAllTables();
    } catch (error) {
        console.error('💥 Verification failed:', error);
        process.exit(1);
    }
})(); 