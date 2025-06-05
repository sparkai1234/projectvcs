/**
 * 🤖 VCS DAILY UPDATER
 * ====================
 * 
 * Automated script to keep VCS data up-to-date
 * Can be run via cron job, GitHub Actions, or scheduled tasks
 */

require('dotenv').config();
const fs = require('fs');
const path = require('path');
const { createClient } = require('@supabase/supabase-js');

// Import our existing scrapers
const { scrapeVCSAPI } = require('../scrapers/vcs_api_scraper_file_output.js');

console.log('🤖 VCS Daily Updater Started');
console.log(`🕐 Execution time: ${new Date().toISOString()}`);

/**
 * Configuration
 */
const CONFIG = {
    logDir: 'automation/logs',
    updateDataDir: 'vcs_daily_updates',
    retentionDays: 7, // Keep logs for 7 days
    enableNotifications: false // Can add email/Slack notifications later
};

/**
 * Ensure directories exist
 */
function ensureDirectories() {
    [CONFIG.logDir, CONFIG.updateDataDir].forEach(dir => {
        if (!fs.existsSync(dir)) {
            fs.mkdirSync(dir, { recursive: true });
            console.log(`📁 Created directory: ${dir}`);
        }
    });
}

/**
 * Create timestamped log
 */
function createLog(content) {
    const timestamp = new Date().toISOString().replace(/[:.]/g, '-');
    const logFile = path.join(CONFIG.logDir, `vcs_update_${timestamp}.log`);
    
    const logContent = {
        timestamp: new Date().toISOString(),
        status: content.status,
        records_found: content.records_found || 0,
        records_new: content.records_new || 0,
        records_updated: content.records_updated || 0,
        errors: content.errors || [],
        duration_seconds: content.duration_seconds || 0,
        details: content.details || {}
    };
    
    fs.writeFileSync(logFile, JSON.stringify(logContent, null, 2));
    console.log(`📝 Log saved: ${logFile}`);
    return logFile;
}

/**
 * Clean old logs
 */
function cleanOldLogs() {
    if (!fs.existsSync(CONFIG.logDir)) return;
    
    const files = fs.readdirSync(CONFIG.logDir);
    const cutoffDate = new Date();
    cutoffDate.setDate(cutoffDate.getDate() - CONFIG.retentionDays);
    
    let cleanedCount = 0;
    files.forEach(file => {
        const filePath = path.join(CONFIG.logDir, file);
        const stats = fs.statSync(filePath);
        
        if (stats.mtime < cutoffDate) {
            fs.unlinkSync(filePath);
            cleanedCount++;
        }
    });
    
    if (cleanedCount > 0) {
        console.log(`🧹 Cleaned ${cleanedCount} old log files`);
    }
}

/**
 * Compare with existing data to find new/updated records
 */
async function compareWithExisting(newData) {
    const supabaseUrl = process.env.SUPABASE_URL;
    const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY;
    
    if (!supabaseUrl || !supabaseKey) {
        console.log('⚠️ No database credentials - treating all as new records');
        return {
            newInvestors: newData.investors || [],
            newFunds: newData.funds || [],
            updatedInvestors: [],
            updatedFunds: []
        };
    }
    
    try {
        const supabase = createClient(supabaseUrl, supabaseKey);
        
        // Get existing data from database
        console.log('🔍 Checking existing database records...');
        
        const { data: existingInvestors } = await supabase
            .from('vc_table')
            .select('company_id, company_name, extracted_at')
            .eq('data_source', 'VCS_API_SCRAPER');
            
        const { data: existingFunds } = await supabase
            .from('fund_table')
            .select('fund_id, fund_name, company_id, extracted_at')
            .eq('data_source', 'VCS_API_SCRAPER');
        
        const existingInvestorIds = new Set(existingInvestors?.map(i => i.company_id) || []);
        const existingFundIds = new Set(existingFunds?.map(f => `${f.fund_id}-${f.company_id}`) || []);
        
        // Find new records
        const newInvestors = newData.investors?.filter(inv => 
            !existingInvestorIds.has(inv.operInstId)
        ) || [];
        
        const newFunds = newData.funds?.filter(fund => 
            !existingFundIds.has(`${fund.fundId}-${fund.operInstId}`)
        ) || [];
        
        console.log(`📊 Found ${newInvestors.length} new investors, ${newFunds.length} new funds`);
        
        return {
            newInvestors,
            newFunds,
            updatedInvestors: [], // For now, focus on new records
            updatedFunds: [],
            existingInvestors: existingInvestors?.length || 0,
            existingFunds: existingFunds?.length || 0
        };
        
    } catch (error) {
        console.error('❌ Error comparing with existing data:', error.message);
        // Fallback: treat all as new
        return {
            newInvestors: newData.investors || [],
            newFunds: newData.funds || [],
            updatedInvestors: [],
            updatedFunds: []
        };
    }
}

/**
 * Save update data to timestamped directory
 */
function saveUpdateData(data, comparison) {
    const timestamp = new Date().toISOString().replace(/[:.]/g, '-');
    const updateDir = path.join(CONFIG.updateDataDir, `update_${timestamp}`);
    
    if (!fs.existsSync(updateDir)) {
        fs.mkdirSync(updateDir, { recursive: true });
    }
    
    // Save new records only
    if (comparison.newInvestors.length > 0) {
        const newInvestorsFile = path.join(updateDir, 'new_investors.json');
        fs.writeFileSync(newInvestorsFile, JSON.stringify({
            count: comparison.newInvestors.length,
            timestamp: new Date().toISOString(),
            data: comparison.newInvestors
        }, null, 2));
        console.log(`💾 Saved ${comparison.newInvestors.length} new investors to: ${newInvestorsFile}`);
    }
    
    if (comparison.newFunds.length > 0) {
        const newFundsFile = path.join(updateDir, 'new_funds.json');
        fs.writeFileSync(newFundsFile, JSON.stringify({
            count: comparison.newFunds.length,
            timestamp: new Date().toISOString(),
            data: comparison.newFunds
        }, null, 2));
        console.log(`💾 Saved ${comparison.newFunds.length} new funds to: ${newFundsFile}`);
    }
    
    // Save summary
    const summaryFile = path.join(updateDir, 'update_summary.json');
    fs.writeFileSync(summaryFile, JSON.stringify({
        timestamp: new Date().toISOString(),
        total_scraped: {
            investors: data.investors?.length || 0,
            funds: data.funds?.length || 0
        },
        existing_in_db: {
            investors: comparison.existingInvestors || 0,
            funds: comparison.existingFunds || 0
        },
        new_records: {
            investors: comparison.newInvestors.length,
            funds: comparison.newFunds.length
        },
        updated_records: {
            investors: comparison.updatedInvestors.length,
            funds: comparison.updatedFunds.length
        }
    }, null, 2));
    
    return updateDir;
}

/**
 * Main update function
 */
async function runDailyUpdate() {
    const startTime = Date.now();
    const logData = {
        status: 'started',
        errors: []
    };
    
    try {
        console.log('\n🚀 === VCS DAILY UPDATE STARTED ===');
        
        // Clean up old files
        ensureDirectories();
        cleanOldLogs();
        
        // Step 1: Scrape latest data
        console.log('\n📡 Step 1: Scraping latest VCS data...');
        
        // Change working directory to scraper's expected location
        const originalDir = process.cwd();
        
        // Run the scraper (it saves to vcs_api_data/)
        await scrapeVCSAPI();
        
        // Read the scraped data
        const investorsFile = 'vcs_api_data/investors_complete.json';
        const fundsFile = 'vcs_api_data/funds_complete.json';
        
        if (!fs.existsSync(investorsFile) || !fs.existsSync(fundsFile)) {
            throw new Error('Scraping failed - data files not found');
        }
        
        const investorsData = JSON.parse(fs.readFileSync(investorsFile, 'utf8'));
        const fundsData = JSON.parse(fs.readFileSync(fundsFile, 'utf8'));
        
        const scrapedData = {
            investors: investorsData.data || [],
            funds: fundsData.data || []
        };
        
        logData.records_found = scrapedData.investors.length + scrapedData.funds.length;
        console.log(`✅ Scraped ${logData.records_found} total records`);
        
        // Step 2: Compare with existing data
        console.log('\n🔍 Step 2: Comparing with existing database...');
        const comparison = await compareWithExisting(scrapedData);
        
        logData.records_new = comparison.newInvestors.length + comparison.newFunds.length;
        logData.records_updated = comparison.updatedInvestors.length + comparison.updatedFunds.length;
        
        // Step 3: Save update data
        console.log('\n💾 Step 3: Saving update data...');
        const updateDir = saveUpdateData(scrapedData, comparison);
        
        // Step 4: Generate update report
        const duration = (Date.now() - startTime) / 1000;
        logData.duration_seconds = duration;
        logData.status = 'completed';
        logData.details = {
            update_directory: updateDir,
            new_investors: comparison.newInvestors.length,
            new_funds: comparison.newFunds.length,
            existing_investors: comparison.existingInvestors,
            existing_funds: comparison.existingFunds
        };
        
        console.log('\n🎉 === VCS DAILY UPDATE COMPLETED ===');
        console.log(`📊 Total Records Scraped: ${logData.records_found}`);
        console.log(`🆕 New Records Found: ${logData.records_new}`);
        console.log(`⏱️ Duration: ${duration.toFixed(2)} seconds`);
        console.log(`📁 Update Data: ${updateDir}`);
        
        if (logData.records_new > 0) {
            console.log('\n🚀 NEW RECORDS DETECTED! Ready for import to database.');
            console.log('💡 Next steps: Use the saved JSON files to update your database');
        } else {
            console.log('\n✅ No new records found. Database is up to date.');
        }
        
    } catch (error) {
        console.error('💥 Daily update failed:', error.message);
        logData.status = 'failed';
        logData.errors.push(error.message);
        logData.duration_seconds = (Date.now() - startTime) / 1000;
    }
    
    // Always create log
    createLog(logData);
    
    return logData;
}

// Execute if run directly
if (require.main === module) {
    (async () => {
        try {
            await runDailyUpdate();
        } catch (error) {
            console.error('💥 Critical error in daily updater:', error);
            process.exit(1);
        }
    })();
}

module.exports = {
    runDailyUpdate,
    CONFIG
}; 