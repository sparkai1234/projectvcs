/**
 * 🤖 AUTOMATED VCS FUND IMPORT
 * ============================
 * 
 * Automatically imports all VCS fund batches using Supabase client
 * No more manual copy-paste - fully automated!
 */

require('dotenv').config();
const { createClient } = require('@supabase/supabase-js');
const fs = require('fs');
const path = require('path');

console.log('🤖 VCS Fund AUTOMATED Import Starting...');

// Supabase configuration
const supabaseUrl = process.env.SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY;

if (!supabaseUrl || !supabaseKey) {
    console.error('❌ Missing environment variables: SUPABASE_URL or SUPABASE_SERVICE_ROLE_KEY');
    console.error('💡 Make sure your .env file has these values');
    process.exit(1);
}

const supabase = createClient(supabaseUrl, supabaseKey);

/**
 * Configuration
 */
const CONFIG = {
    batchPrefix: 'vcs_funds_simple_batch_',
    totalBatches: 74,
    delayBetweenBatches: 1000, // 1 second delay between batches
    maxRetries: 3
};

/**
 * Execute a single SQL batch file
 */
async function executeBatchFile(batchNumber) {
    const fileName = `${CONFIG.batchPrefix}${batchNumber.toString().padStart(2, '0')}.sql`;
    
    try {
        // Check if file exists
        if (!fs.existsSync(fileName)) {
            throw new Error(`Batch file ${fileName} not found`);
        }
        
        // Read SQL content
        const sqlContent = fs.readFileSync(fileName, 'utf8');
        
        // Extract individual INSERT statements
        const insertStatements = sqlContent
            .split('\n')
            .filter(line => line.trim().startsWith('INSERT INTO fund_table'))
            .map(line => {
                // Find the complete INSERT statement
                let statement = line;
                const lines = sqlContent.split('\n');
                const startIndex = lines.indexOf(line);
                
                // Collect all lines until we hit the semicolon
                for (let i = startIndex; i < lines.length; i++) {
                    if (i > startIndex) {
                        statement += '\n' + lines[i];
                    }
                    if (lines[i].trim().endsWith(');')) {
                        break;
                    }
                }
                
                return statement;
            });
        
        console.log(`📁 Batch ${batchNumber}: Found ${insertStatements.length} INSERT statements`);
        
        // Execute each INSERT statement
        let successCount = 0;
        let errorCount = 0;
        
        for (let i = 0; i < insertStatements.length; i++) {
            try {
                const { error } = await supabase.rpc('exec_sql', { 
                    sql_query: insertStatements[i] 
                });
                
                if (error) {
                    console.error(`  ❌ Record ${i + 1} failed:`, error.message);
                    errorCount++;
                } else {
                    successCount++;
                }
            } catch (err) {
                console.error(`  ❌ Record ${i + 1} error:`, err.message);
                errorCount++;
            }
        }
        
        return { 
            batchNumber, 
            fileName, 
            totalRecords: insertStatements.length,
            successCount, 
            errorCount,
            success: errorCount === 0
        };
        
    } catch (error) {
        console.error(`❌ Batch ${batchNumber} failed:`, error.message);
        return { 
            batchNumber, 
            fileName, 
            totalRecords: 0,
            successCount: 0, 
            errorCount: 1,
            success: false,
            error: error.message
        };
    }
}

/**
 * Execute all batch files with retry logic
 */
async function executeAllBatches() {
    console.log(`\n🚀 === STARTING AUTOMATED IMPORT OF ${CONFIG.totalBatches} BATCHES ===\n`);
    
    const results = [];
    let totalSuccess = 0;
    let totalErrors = 0;
    
    for (let batchNumber = 1; batchNumber <= CONFIG.totalBatches; batchNumber++) {
        console.log(`\n📦 Processing Batch ${batchNumber}/${CONFIG.totalBatches}...`);
        
        let result = null;
        let retryCount = 0;
        
        // Retry logic
        while (retryCount < CONFIG.maxRetries && (!result || !result.success)) {
            if (retryCount > 0) {
                console.log(`  🔄 Retry ${retryCount}/${CONFIG.maxRetries}`);
                await new Promise(resolve => setTimeout(resolve, 2000)); // 2 second delay on retry
            }
            
            result = await executeBatchFile(batchNumber);
            retryCount++;
        }
        
        if (result.success) {
            console.log(`  ✅ Batch ${batchNumber}: ${result.successCount} records imported successfully`);
            totalSuccess += result.successCount;
        } else {
            console.log(`  ❌ Batch ${batchNumber}: Failed after ${CONFIG.maxRetries} retries`);
            if (result.error) {
                console.log(`     Error: ${result.error}`);
            }
            totalErrors += result.errorCount;
        }
        
        results.push(result);
        
        // Progress indicator
        const progress = ((batchNumber / CONFIG.totalBatches) * 100).toFixed(1);
        console.log(`  📊 Progress: ${progress}% (${totalSuccess} records imported so far)`);
        
        // Delay between batches to avoid overwhelming the database
        if (batchNumber < CONFIG.totalBatches) {
            await new Promise(resolve => setTimeout(resolve, CONFIG.delayBetweenBatches));
        }
    }
    
    return { results, totalSuccess, totalErrors };
}

/**
 * Generate final report
 */
function generateReport(results, totalSuccess, totalErrors) {
    console.log('\n🎉 === AUTOMATED IMPORT COMPLETED ===\n');
    
    const successfulBatches = results.filter(r => r.success).length;
    const failedBatches = results.filter(r => !r.success).length;
    
    console.log(`📊 SUMMARY:`);
    console.log(`  ✅ Successful batches: ${successfulBatches}/${CONFIG.totalBatches}`);
    console.log(`  ❌ Failed batches: ${failedBatches}/${CONFIG.totalBatches}`);
    console.log(`  💰 Total records imported: ${totalSuccess}`);
    console.log(`  🚫 Total errors: ${totalErrors}`);
    
    if (failedBatches > 0) {
        console.log(`\n❌ FAILED BATCHES:`);
        results
            .filter(r => !r.success)
            .forEach(r => {
                console.log(`  • Batch ${r.batchNumber}: ${r.fileName} - ${r.error || 'Unknown error'}`);
            });
        
        console.log('\n💡 NEXT STEPS:');
        console.log('1. Check the failed batches manually');
        console.log('2. Re-run specific batches if needed');
        console.log('3. Verify data integrity');
    } else {
        console.log('\n🎉 ALL BATCHES IMPORTED SUCCESSFULLY!');
        console.log('✅ VCS Fund import is now complete!');
    }
    
    // Final verification
    console.log('\n🔍 Run this query in Supabase to verify:');
    console.log(`SELECT 
  'VCS Fund Import Completed' as status,
  COUNT(*) as total_vcs_funds,
  COUNT(DISTINCT company_id) as unique_operators,
  SUM(fund_size) / 1000000000 as total_fund_size_billions_krw
FROM fund_table WHERE apify_source = 'VCS_API_SCRAPER';`);
}

/**
 * Main execution function
 */
async function runAutomatedImport() {
    try {
        console.log('🔐 Testing Supabase connection...');
        const { data, error } = await supabase.from('fund_table').select('count(*)', { count: 'exact', head: true });
        
        if (error) {
            console.error('❌ Supabase connection failed:', error.message);
            console.error('💡 Check your SUPABASE_URL and SUPABASE_SERVICE_ROLE_KEY');
            return;
        }
        
        console.log('✅ Supabase connection successful!');
        console.log(`📊 Current fund_table records: ${data?.count || 0}`);
        
        const { results, totalSuccess, totalErrors } = await executeAllBatches();
        generateReport(results, totalSuccess, totalErrors);
        
    } catch (error) {
        console.error('💥 Automated import failed:', error);
    }
}

// Execute if run directly
if (require.main === module) {
    runAutomatedImport();
}

module.exports = {
    runAutomatedImport,
    executeBatchFile
}; 