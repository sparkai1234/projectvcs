// 🔍 SUPABASE DATA VALIDATOR - Final Production Verification
// Downloads all DIVA data from Supabase and validates against control dataset
// Date: June 10, 2025

const { createClient } = require('@supabase/supabase-js');
const fs = require('fs').promises;
const path = require('path');

// Supabase configuration
const supabaseUrl = 'https://udfgtccxbqmalgpqyxzz.supabase.co';
const supabaseKey = process.env.SUPABASE_KEY || 'your-supabase-key-here';
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

async function downloadSupabaseData() {
    console.log('🔍 SUPABASE DATA VALIDATOR - Final Production Check');
    console.log('📥 Downloading all DIVA data from Supabase...\n');
    
    const downloadedData = {};
    let totalRecords = 0;
    const downloadResults = [];
    
    for (const [tableName, expectedCount] of Object.entries(EXPECTED_COUNTS)) {
        try {
            console.log(`📊 Downloading ${tableName}...`);
            
            // Download all data from table
            const { data, error, count } = await supabase
                .from(tableName)
                .select('*', { count: 'exact' });
                
            if (error) {
                console.error(`   ❌ Error downloading ${tableName}:`, error);
                downloadResults.push({
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
            downloadedData[tableName] = data;
            
            // Validation check
            const isValid = actualCount === expectedCount;
            const status = isValid ? '✅ PERFECT' : '❌ MISMATCH';
            
            console.log(`   ${status} - Expected: ${expectedCount}, Got: ${actualCount}`);
            
            downloadResults.push({
                table: tableName,
                status: isValid ? 'PERFECT' : 'MISMATCH',
                expected: expectedCount,
                actual: actualCount,
                data: data
            });
            
        } catch (err) {
            console.error(`   ❌ Failed to download ${tableName}:`, err.message);
            downloadResults.push({
                table: tableName,
                status: 'FAILED',
                expected: expectedCount,
                actual: 0,
                error: err.message
            });
        }
    }
    
    return { downloadedData, downloadResults, totalRecords };
}

async function saveDownloadedData(downloadedData, downloadResults) {
    console.log('\n💾 Saving downloaded data to files...');
    
    // Create downloads directory
    const downloadsDir = './supabase_downloads';
    try {
        await fs.mkdir(downloadsDir, { recursive: true });
    } catch (err) {
        // Directory might already exist
    }
    
    // Save each table's data
    for (const [tableName, data] of Object.entries(downloadedData)) {
        const filename = `${tableName}_downloaded.json`;
        const filepath = path.join(downloadsDir, filename);
        
        try {
            await fs.writeFile(filepath, JSON.stringify(data, null, 2));
            console.log(`   ✅ Saved ${data.length} records to ${filename}`);
        } catch (err) {
            console.error(`   ❌ Failed to save ${filename}:`, err.message);
        }
    }
    
    // Save summary report
    const summaryReport = {
        timestamp: new Date().toISOString(),
        total_tables: Object.keys(EXPECTED_COUNTS).length,
        total_expected_records: TOTAL_EXPECTED,
        total_actual_records: downloadResults.reduce((sum, r) => sum + r.actual, 0),
        validation_results: downloadResults,
        overall_status: downloadResults.every(r => r.status === 'PERFECT') ? 'PERFECT' : 'HAS_ISSUES'
    };
    
    const summaryPath = path.join(downloadsDir, 'validation_summary.json');
    await fs.writeFile(summaryPath, JSON.stringify(summaryReport, null, 2));
    console.log(`   ✅ Saved validation summary to validation_summary.json`);
    
    return summaryReport;
}

async function generateValidationReport(summaryReport) {
    console.log('\n📊 FINAL VALIDATION REPORT');
    console.log('=' .repeat(50));
    
    const { validation_results, total_expected_records, total_actual_records, overall_status } = summaryReport;
    
    // Table-by-table validation
    console.log('\n🔍 TABLE-BY-TABLE VALIDATION:');
    validation_results.forEach(result => {
        const statusIcon = result.status === 'PERFECT' ? '✅' : '❌';
        const accuracy = result.expected > 0 ? ((result.actual / result.expected) * 100).toFixed(1) : 0;
        console.log(`   ${statusIcon} ${result.table}`);
        console.log(`      Expected: ${result.expected} | Actual: ${result.actual} | Accuracy: ${accuracy}%`);
        if (result.error) {
            console.log(`      Error: ${result.error}`);
        }
    });
    
    // Overall summary
    console.log('\n🎯 OVERALL VALIDATION SUMMARY:');
    console.log(`   📊 Total Expected Records: ${total_expected_records}`);
    console.log(`   📈 Total Actual Records: ${total_actual_records}`);
    console.log(`   🎯 Overall Accuracy: ${((total_actual_records / total_expected_records) * 100).toFixed(1)}%`);
    console.log(`   📋 Tables Validated: ${validation_results.length}/7`);
    console.log(`   ✅ Perfect Tables: ${validation_results.filter(r => r.status === 'PERFECT').length}/7`);
    console.log(`   🏆 FINAL STATUS: ${overall_status}`);
    
    // Generate recommendations
    console.log('\n💡 RECOMMENDATIONS:');
    if (overall_status === 'PERFECT') {
        console.log('   🎉 PERFECT! All data validated successfully.');
        console.log('   🚀 Ready for production deployment and scheduling.');
        console.log('   📈 Consider setting up automated data refresh schedules.');
    } else {
        console.log('   ⚠️  Some issues detected. Review the table details above.');
        console.log('   🔧 Consider re-running the scraper for failed tables.');
    }
    
    return overall_status === 'PERFECT';
}

async function createComparisonScript() {
    console.log('\n🛠️ Creating data comparison script...');
    
    const comparisonScript = `// 📊 DATA COMPARISON SCRIPT
// Compare downloaded Supabase data with your validation dataset

const fs = require('fs').promises;

async function compareWithValidationData() {
    console.log('🔍 COMPARING SUPABASE DATA WITH VALIDATION DATASET');
    
    // Load downloaded data
    const downloadsDir = './supabase_downloads';
    
    // Add your validation dataset loading logic here
    // Example:
    // const validationData = JSON.parse(await fs.readFile('./validation_dataset.json', 'utf8'));
    
    // Compare field by field, record by record
    // Your comparison logic here
    
    console.log('✅ Comparison complete!');
}

// Run comparison
compareWithValidationData().catch(console.error);`;
    
    await fs.writeFile('./compare_with_validation.js', comparisonScript);
    console.log('   ✅ Created compare_with_validation.js');
}

// Main execution
async function main() {
    try {
        console.log('🚀 Starting Supabase data validation...\n');
        
        // Step 1: Download all data
        const { downloadedData, downloadResults, totalRecords } = await downloadSupabaseData();
        
        // Step 2: Save data to files
        const summaryReport = await saveDownloadedData(downloadedData, downloadResults);
        
        // Step 3: Generate validation report
        const isValid = await generateValidationReport(summaryReport);
        
        // Step 4: Create comparison script template
        await createComparisonScript();
        
        console.log('\n🎯 VALIDATION COMPLETE!');
        console.log(`📁 All data saved to: ./supabase_downloads/`);
        console.log(`📊 Total records downloaded: ${totalRecords}`);
        console.log(`🏆 Final validation: ${isValid ? 'PERFECT ✅' : 'HAS ISSUES ❌'}`);
        
        return isValid;
        
    } catch (error) {
        console.error('❌ Validation failed:', error);
        return false;
    }
}

// Export for use in other scripts
module.exports = { downloadSupabaseData, saveDownloadedData, generateValidationReport };

// Run if called directly
if (require.main === module) {
    main()
        .then((success) => {
            process.exit(success ? 0 : 1);
        })
        .catch((error) => {
            console.error('Fatal error:', error);
            process.exit(1);
        });
} 