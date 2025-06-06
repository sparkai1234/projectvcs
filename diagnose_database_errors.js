const { createClient } = require('@supabase/supabase-js');

async function diagnoseDatabaseErrors() {
    console.log('🔍 Diagnosing DIVA Database Insertion Errors...');
    
    const supabase = createClient(
        'https://udfgtccxbqmalgpqyxzz.supabase.co',
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InVkZmd0Y2N4YnFtYWxncHF5eHp6Iiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc0ODk0NjY5NiwiZXhwIjoyMDY0NTIyNjk2fQ.JgyEKjOhuZpNCCOadsaK90Q8CcoPf_rgdtSXh-1BU18'
    );
    
    // Test data structures for all tables
    const testData = {
        diva_investment_performance_raw: {
            company_name: 'Test Company',
            individual_avoidance_count: 1,
            individual_amount: 1000000,
            partnership_avoidance_count: 2,
            partnership_amount: 2000000,
            total_avoidance_count: 3,
            total_amount: 3000000,
            extracted_at: new Date().toISOString(),
            source_url: 'http://test.url'
        },
        
        diva_financial_raw: {
            company_name: 'Test Company',
            fiscal_year: 2024,
            accounting_standard: 'K-IFRS',
            total_assets: 1000000000,
            total_liabilities: 500000000,
            total_equity: 500000000,
            operating_revenue: 200000000,
            operating_profit: 50000000,
            net_income: 40000000,
            startup_investment_assets: 300000000,
            extracted_at: new Date().toISOString(),
            source_url: 'http://test.url'
        },
        
        diva_personnel_raw: {
            company_name: 'Test Company',
            total_personnel: 10,
            professional_staff: 5,
            investment_review_staff: 3,
            management_support_staff: 2,
            extracted_at: new Date().toISOString(),
            source_url: 'http://test.url'
        },
        
        diva_violation_raw: {
            number: 'TEST_' + Date.now(),
            company_name: 'Test Company',
            action_date: '2025-06-06',
            action_end_date: null,
            classification_name: '-',
            correction_type: '전자보고',
            violation_type: '1년간 미투자',
            action_type: '경고',
            extracted_at: new Date().toISOString(),
            source_url: 'http://test.url'
        },
        
        diva_association_raw: {
            company_name: 'Test Company',
            fund_name: 'Test Fund',
            total_commitment: 1000000000,
            called_amount: 500000000,
            establishment_date: '2020-01-01',
            fund_duration_years: 7,
            fund_status: '운용중',
            investment_focus: 'IT',
            extracted_at: new Date().toISOString(),
            source_url: 'http://test.url'
        },
        
        diva_professional_raw: {
            company_name: 'Test Company',
            professional_name: 'Test Person',
            position: 'Investment Manager',
            experience: '5년',
            specialization: 'IT',
            extracted_at: new Date().toISOString(),
            source_url: 'http://test.url'
        },
        
        vc_map: {
            rank: 1,
            company_name: 'Test Company',
            personnel_count: 10,
            professional_count: 5,
            extracted_at: new Date().toISOString(),
            source_url: 'http://test.url'
        }
    };
    
    console.log('📋 Testing all table structures...\n');
    
    const results = {};
    
    for (const [tableName, testRecord] of Object.entries(testData)) {
        console.log(`🧪 Testing ${tableName}...`);
        
        try {
            const { data, error } = await supabase
                .from(tableName)
                .insert(testRecord)
                .select();
            
            if (error) {
                console.error(`❌ ${tableName}: ${error.message}`);
                results[tableName] = {
                    status: 'ERROR',
                    error: error.message,
                    code: error.code,
                    details: error.details,
                    hint: error.hint
                };
                
                // Provide specific fixes for common errors
                if (error.message.includes('does not exist')) {
                    console.log(`💡 FIX: Table ${tableName} doesn't exist. Create it first.`);
                } else if (error.message.includes('column') && error.message.includes('does not exist')) {
                    const columnMatch = error.message.match(/column "([^"]+)"/);
                    if (columnMatch) {
                        console.log(`💡 FIX: Add missing column: ALTER TABLE ${tableName} ADD COLUMN ${columnMatch[1]} TEXT;`);
                    }
                } else if (error.message.includes('violates not-null constraint')) {
                    console.log(`💡 FIX: Add missing required fields or make columns nullable.`);
                }
            } else {
                console.log(`✅ ${tableName}: Working correctly`);
                results[tableName] = { status: 'SUCCESS', recordId: data[0]?.id };
                
                // Clean up test record
                if (data[0]?.id) {
                    await supabase.from(tableName).delete().eq('id', data[0].id);
                } else if (testRecord.number) {
                    await supabase.from(tableName).delete().eq('number', testRecord.number);
                }
            }
        } catch (err) {
            console.error(`❌ ${tableName}: Unexpected error - ${err.message}`);
            results[tableName] = { status: 'EXCEPTION', error: err.message };
        }
        
        console.log(''); // Empty line for readability
    }
    
    // Summary
    console.log('📊 DIAGNOSIS SUMMARY:');
    console.log('=====================');
    
    const successCount = Object.values(results).filter(r => r.status === 'SUCCESS').length;
    const errorCount = Object.values(results).filter(r => r.status === 'ERROR').length;
    
    console.log(`✅ Working tables: ${successCount}/${Object.keys(testData).length}`);
    console.log(`❌ Tables with errors: ${errorCount}/${Object.keys(testData).length}`);
    
    if (errorCount > 0) {
        console.log('\n🔧 REQUIRED FIXES:');
        for (const [tableName, result] of Object.entries(results)) {
            if (result.status === 'ERROR') {
                console.log(`\n${tableName}:`);
                console.log(`  Error: ${result.error}`);
                if (result.hint) console.log(`  Hint: ${result.hint}`);
            }
        }
    } else {
        console.log('\n🎉 All tables are working correctly!');
    }
    
    return results;
}

// Run the diagnosis
if (require.main === module) {
    diagnoseDatabaseErrors().catch(console.error);
}

module.exports = { diagnoseDatabaseErrors }; 