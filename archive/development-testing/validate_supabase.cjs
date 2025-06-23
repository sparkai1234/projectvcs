// 🔍 SUPABASE DATA VALIDATOR - CommonJS Version
// Downloads all DIVA data from Supabase and validates against control dataset

const { createClient } = require('@supabase/supabase-js');
const fs = require('fs').promises;
const path = require('path');

// Supabase configuration
const supabaseUrl = 'https://udfgtccxbqmalgpqyxzz.supabase.co';
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY || process.env.SUPABASE_KEY || 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InVkZmd0Y2N4YnFtYWxncHF5eHp6Iiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTczNDA5Mjg5MCwiZXhwIjoyMDQ5NjY4ODkwfQ.I9sDa9j4R0OYWLxgF7wq3djQRnHGmAmwJJgn5-ZWoZ4';

console.log('🔍 SUPABASE DATA VALIDATOR - Final Production Check');
console.log(`📍 URL: ${supabaseUrl}`);
console.log(`🔑 Key: ${supabaseKey ? 'SET' : 'NOT SET'}`);

const supabase = createClient(supabaseUrl, supabaseKey);

// Expected record counts (from perfect production run)
const EXPECTED_COUNTS = {
    'diva_investment_performance': 333,
    'diva_financial_statements': 500,
    'diva_association_status': 2231,
    'diva_personnel_status': 251,
    'diva_professional_personnel': 1685,
    'diva_violations': 92,
    'diva_vc_map': 251
};

const TOTAL_EXPECTED = 5343;

async function validateAllTables() {
    console.log('\n📥 Downloading and validating all DIVA data...\n');
    
    let totalRecords = 0;
    let perfectTables = 0;
    const results = [];
    
    for (const [tableName, expectedCount] of Object.entries(EXPECTED_COUNTS)) {
        try {
            console.log(`📊 Checking ${tableName}...`);
            
            // Download all data from table
            const { data, error, count } = await supabase
                .from(tableName)
                .select('*', { count: 'exact' });
                
            if (error) {
                console.log(`   ❌ ERROR: ${error.message}`);
                results.push({
                    table: tableName,
                    status: 'ERROR',
                    expected: expectedCount,
                    actual: 0,
                    error: error.message
                });
                continue;
            }
            
            const actualCount = data?.length || 0;
            totalRecords += actualCount;
            
            // Validation check
            const isValid = actualCount === expectedCount;
            const status = isValid ? '✅ PERFECT' : '❌ MISMATCH';
            const accuracy = expectedCount > 0 ? ((actualCount / expectedCount) * 100).toFixed(1) : 0;
            
            console.log(`   ${status} - Expected: ${expectedCount}, Got: ${actualCount} (${accuracy}%)`);
            
            if (isValid) perfectTables++;
            
            results.push({
                table: tableName,
                status: isValid ? 'PERFECT' : 'MISMATCH',
                expected: expectedCount,
                actual: actualCount,
                accuracy: accuracy,
                data: data
            });
            
        } catch (err) {
            console.log(`   ❌ FAILED: ${err.message}`);
            results.push({
                table: tableName,
                status: 'FAILED',
                expected: expectedCount,
                actual: 0,
                error: err.message
            });
        }
    }
    
    return { results, totalRecords, perfectTables };
}

async function saveDataToFiles(results) {
    console.log('\n💾 Saving downloaded data to files...');
    
    // Create downloads directory
    const downloadsDir = './supabase_downloads';
    try {
        await fs.mkdir(downloadsDir, { recursive: true });
    } catch (err) {
        // Directory might already exist
    }
    
    // Save each table's data
    for (const result of results) {
        if (result.data && result.data.length > 0) {
            const filename = `${result.table}_downloaded.json`;
            const filepath = path.join(downloadsDir, filename);
            
            try {
                await fs.writeFile(filepath, JSON.stringify(result.data, null, 2));
                console.log(`   ✅ Saved ${result.data.length} records to ${filename}`);
            } catch (err) {
                console.error(`   ❌ Failed to save ${filename}:`, err.message);
            }
        }
    }
    
    // Save summary report
    const summaryReport = {
        timestamp: new Date().toISOString(),
        total_tables: Object.keys(EXPECTED_COUNTS).length,
        total_expected_records: TOTAL_EXPECTED,
        total_actual_records: results.reduce((sum, r) => sum + r.actual, 0),
        perfect_tables: results.filter(r => r.status === 'PERFECT').length,
        validation_results: results.map(r => ({
            table: r.table,
            status: r.status,
            expected: r.expected,
            actual: r.actual,
            accuracy: r.accuracy,
            error: r.error
        }))
    };
    
    const summaryPath = path.join(downloadsDir, 'validation_summary.json');
    await fs.writeFile(summaryPath, JSON.stringify(summaryReport, null, 2));
    console.log(`   ✅ Saved validation summary to validation_summary.json`);
    
    return summaryReport;
}

async function main() {
    try {
        console.log('🚀 Starting Supabase data validation...\n');
        
        // Step 1: Validate all tables
        const { results, totalRecords, perfectTables } = await validateAllTables();
        
        // Step 2: Save data to files
        const summaryReport = await saveDataToFiles(results);
        
        // Step 3: Generate final report
        console.log('\n📊 FINAL VALIDATION REPORT');
        console.log('='.repeat(50));
        console.log(`📊 Total Expected Records: ${TOTAL_EXPECTED}`);
        console.log(`📈 Total Actual Records: ${totalRecords}`);
        console.log(`🎯 Overall Accuracy: ${((totalRecords / TOTAL_EXPECTED) * 100).toFixed(1)}%`);
        console.log(`✅ Perfect Tables: ${perfectTables}/7`);
        console.log(`📁 Data saved to: ./supabase_downloads/`);
        
        const isValid = perfectTables === 7 && totalRecords === TOTAL_EXPECTED;
        console.log(`🏆 FINAL STATUS: ${isValid ? 'PERFECT ✅' : 'HAS ISSUES ❌'}`);
        
        if (isValid) {
            console.log('\n🎉 PERFECT! All data validated successfully.');
            console.log('🚀 Ready for production deployment and scheduling.');
        } else {
            console.log('\n⚠️  Some issues detected. Review the table details above.');
        }
        
        return isValid;
        
    } catch (error) {
        console.error('❌ Validation failed:', error);
        return false;
    }
}

// Run the validation
main()
    .then((success) => {
        process.exit(success ? 0 : 1);
    })
    .catch((error) => {
        console.error('Fatal error:', error);
        process.exit(1);
    }); 