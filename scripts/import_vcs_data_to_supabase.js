/**
 * 📥 VCS DATA IMPORTER TO SUPABASE
 * ================================
 * 
 * Imports the successfully scraped VCS data from JSON files to Supabase
 * 
 * Source: vcs_api_data/ directory (4,406 records)
 * Target: Supabase vc_table and fund_table
 */

require('dotenv').config();
const fs = require('fs');
const path = require('path');
const { createClient } = require('@supabase/supabase-js');

// Initialize Supabase
const supabaseUrl = process.env.SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY;

if (!supabaseKey || !supabaseUrl) {
    console.error('❌ Missing environment variables: SUPABASE_URL or SUPABASE_SERVICE_ROLE_KEY');
    process.exit(1);
}

console.log('📥 VCS Data Importer Started');
console.log(`🔗 Target Database: ${supabaseUrl}`);
console.log(`🔑 Using Service Role Key: ${supabaseKey.substring(0, 20)}...`);

const supabase = createClient(supabaseUrl, supabaseKey);

/**
 * Configuration
 */
const CONFIG = {
    dataDir: 'vcs_api_data',
    batchSize: 50, // Import in batches to avoid timeout
    retryAttempts: 3
};

/**
 * Transform investor data to database format
 */
function transformInvestorForDB(apiData) {
    return {
        // Core identification
        company_name: apiData.operInstNm || '',
        company_id: apiData.operInstId || '',
        registration_number: apiData.operInstId || '',
        
        // Company details  
        representative: apiData.repNm || '',
        establishment_date: apiData.foundYy ? `${apiData.foundYy}` : null,
        address: apiData.headofcAddr || '',
        zip_code: apiData.headofcZipcd || '',
        phone: apiData.telno || '',
        
        // Business information
        business_type: apiData.operInstTpNm || '',
        business_category: apiData.comBzcarrCd || '',
        industry: apiData.comIndNm || '',
        location: apiData.sigunguNm || '',
        
        // Financial information
        operating_scale: apiData.operScaleCd || '',
        operating_amount: apiData.operBoundAmt ? parseFloat(apiData.operBoundAmt) : null,
        operating_amount_text: apiData.operBoundAmt ? `${apiData.operBoundAmt}억원` : '',
        
        // Special characteristics
        strategy_planner: apiData.strtplanerYn === 'Y' ? 'Yes' : 'No',
        professional_angel: apiData.pfAnglYn === 'Y' ? 'Yes' : 'No',
        investment_character: apiData.invstCharcNm || '',
        
        // VCS specific fields (preserve original structure)
        vcs_operator_type_code: apiData.operInstTpCd || '',
        vcs_operator_type_name: apiData.operInstTpNm || '',
        vcs_operating_scale_code: apiData.operScaleCd || '',
        vcs_business_category_code: apiData.comBzcarrCd || '',
        vcs_founded_period: apiData.foundYy || '',
        
        // Metadata
        data_source: 'VCS_API_SCRAPER',
        source_url: 'https://www.vcs.go.kr/web/portal/investor/search',
        extracted_at: new Date().toISOString(),
        
        // Raw data for reference
        raw_api_data: JSON.stringify(apiData)
    };
}

/**
 * Transform fund data to database format
 */
function transformFundForDB(apiData) {
    return {
        // Core identification
        fund_name: apiData.fundNm || '',
        fund_id: apiData.fundId || '',
        company_name: apiData.operInstNm || '',
        company_id: apiData.operInstId || '',
        
        // Fund details
        registration_date: apiData.regDd || '',
        expiry_date: apiData.expDd || '',
        formation_total_amount: apiData.formTotamt ? parseFloat(apiData.formTotamt) : null,
        formation_total_amount_text: apiData.formTotamt ? `${apiData.formTotamt}억원` : '',
        
        // Investment focus
        investment_field_type: apiData.invstFldTpNm || '',
        investment_field_detail_type: apiData.invstFldDtlTpNm || '',
        investment_character: apiData.invstCharcNm || '',
        
        // Special features
        mother_fund_related: apiData.mfundId ? true : false,
        mother_fund_id: apiData.mfundId || '',
        
        // Performance
        investment_ratio: apiData.invstRto ? parseFloat(apiData.invstRto) : null,
        
        // Metadata
        data_source: 'VCS_API_SCRAPER',
        source_url: 'https://www.vcs.go.kr/web/portal/investor/search',
        extracted_at: new Date().toISOString(),
        
        // Raw data for reference
        raw_api_data: JSON.stringify(apiData)
    };
}

/**
 * Read and parse JSON file
 */
function readJSONFile(filePath) {
    try {
        const data = fs.readFileSync(filePath, 'utf8');
        return JSON.parse(data);
    } catch (error) {
        console.error(`❌ Error reading ${filePath}:`, error.message);
        return null;
    }
}

/**
 * Import data in batches with retry logic
 */
async function importBatch(tableName, records, batchNum, totalBatches) {
    for (let attempt = 1; attempt <= CONFIG.retryAttempts; attempt++) {
        try {
            console.log(`📤 Importing batch ${batchNum}/${totalBatches} to ${tableName} (${records.length} records, attempt ${attempt})`);
            
            const { data, error } = await supabase
                .from(tableName)
                .upsert(records, {
                    onConflict: tableName === 'vc_table' ? 'company_name,data_source' : 'fund_name,company_name,data_source',
                    ignoreDuplicates: false
                });
            
            if (error) {
                throw error;
            }
            
            console.log(`✅ Batch ${batchNum}/${totalBatches} imported successfully`);
            return { success: true, count: records.length };
            
        } catch (error) {
            console.error(`❌ Batch ${batchNum} attempt ${attempt} failed:`, error.message);
            
            if (attempt === CONFIG.retryAttempts) {
                console.error(`💥 Batch ${batchNum} failed after ${CONFIG.retryAttempts} attempts`);
                return { success: false, error: error.message };
            }
            
            // Wait before retry
            console.log(`⏱️ Waiting 2 seconds before retry...`);
            await new Promise(resolve => setTimeout(resolve, 2000));
        }
    }
}

/**
 * Import investors data
 */
async function importInvestors() {
    console.log('\n👥 === IMPORTING INVESTORS ===');
    
    const investorsFile = path.join(CONFIG.dataDir, 'investors_complete.json');
    
    if (!fs.existsSync(investorsFile)) {
        console.error(`❌ Investors file not found: ${investorsFile}`);
        return { success: false, count: 0 };
    }
    
    const investorsData = readJSONFile(investorsFile);
    if (!investorsData || !investorsData.data) {
        console.error('❌ Invalid investors data format');
        return { success: false, count: 0 };
    }
    
    const investors = investorsData.data;
    console.log(`📊 Found ${investors.length} investors to import`);
    
    // Transform all investors
    const transformedInvestors = investors.map(transformInvestorForDB);
    
    // Import in batches
    const batches = [];
    for (let i = 0; i < transformedInvestors.length; i += CONFIG.batchSize) {
        batches.push(transformedInvestors.slice(i, i + CONFIG.batchSize));
    }
    
    console.log(`📦 Split into ${batches.length} batches of ${CONFIG.batchSize} records each`);
    
    let successCount = 0;
    let failureCount = 0;
    
    for (let i = 0; i < batches.length; i++) {
        const result = await importBatch('vc_table', batches[i], i + 1, batches.length);
        
        if (result.success) {
            successCount += result.count;
        } else {
            failureCount += batches[i].length;
        }
        
        // Small delay between batches
        if (i < batches.length - 1) {
            await new Promise(resolve => setTimeout(resolve, 500));
        }
    }
    
    console.log(`✅ Investors import completed: ${successCount} success, ${failureCount} failed`);
    return { success: failureCount === 0, count: successCount };
}

/**
 * Import funds data
 */
async function importFunds() {
    console.log('\n💼 === IMPORTING FUNDS ===');
    
    const fundsFile = path.join(CONFIG.dataDir, 'funds_complete.json');
    
    if (!fs.existsSync(fundsFile)) {
        console.error(`❌ Funds file not found: ${fundsFile}`);
        return { success: false, count: 0 };
    }
    
    const fundsData = readJSONFile(fundsFile);
    if (!fundsData || !fundsData.data) {
        console.error('❌ Invalid funds data format');
        return { success: false, count: 0 };
    }
    
    const funds = fundsData.data;
    console.log(`📊 Found ${funds.length} funds to import`);
    
    // Transform all funds
    const transformedFunds = funds.map(transformFundForDB);
    
    // Import in batches
    const batches = [];
    for (let i = 0; i < transformedFunds.length; i += CONFIG.batchSize) {
        batches.push(transformedFunds.slice(i, i + CONFIG.batchSize));
    }
    
    console.log(`📦 Split into ${batches.length} batches of ${CONFIG.batchSize} records each`);
    
    let successCount = 0;
    let failureCount = 0;
    
    for (let i = 0; i < batches.length; i++) {
        const result = await importBatch('fund_table', batches[i], i + 1, batches.length);
        
        if (result.success) {
            successCount += result.count;
        } else {
            failureCount += batches[i].length;
        }
        
        // Small delay between batches
        if (i < batches.length - 1) {
            await new Promise(resolve => setTimeout(resolve, 500));
        }
    }
    
    console.log(`✅ Funds import completed: ${successCount} success, ${failureCount} failed`);
    return { success: failureCount === 0, count: successCount };
}

/**
 * Test database connection
 */
async function testConnection() {
    console.log('🔌 Testing database connection...');
    
    try {
        // Test with a simple query
        const { data, error } = await supabase
            .from('vc_table')
            .select('count(*)', { count: 'exact' })
            .limit(1);
        
        if (error) {
            throw error;
        }
        
        console.log('✅ Database connection successful');
        return true;
        
    } catch (error) {
        console.error('❌ Database connection failed:', error.message);
        console.error('💡 Check your SUPABASE_URL and SUPABASE_SERVICE_ROLE_KEY');
        return false;
    }
}

/**
 * Main import function
 */
async function importVCSData() {
    console.log('\n🚀 === STARTING VCS DATA IMPORT ===');
    
    const startTime = Date.now();
    
    try {
        // Test connection first
        const connected = await testConnection();
        if (!connected) {
            console.error('💥 Cannot proceed without database connection');
            process.exit(1);
        }
        
        // Import investors
        const investorResult = await importInvestors();
        
        // Import funds
        const fundResult = await importFunds();
        
        const duration = (Date.now() - startTime) / 1000;
        const totalRecords = investorResult.count + fundResult.count;
        
        console.log('\n🎉 === VCS DATA IMPORT COMPLETED ===');
        console.log(`📊 Total Records Imported: ${totalRecords}`);
        console.log(`👥 Investors: ${investorResult.count}`);
        console.log(`💼 Funds: ${fundResult.count}`);
        console.log(`⏱️ Duration: ${duration.toFixed(2)} seconds`);
        console.log(`🎯 Source: VCS API Scraped Data`);
        console.log(`📡 Target: Supabase Database`);
        
        if (totalRecords > 0) {
            console.log('\n🚀 Success! Korean VC Intelligence Database is now populated!');
            console.log('✅ All structured VCS data imported');
            console.log('📊 Ready for analysis and reporting');
        }
        
        // Create import summary
        const summary = {
            import_completed_at: new Date().toISOString(),
            total_records_imported: totalRecords,
            investors_imported: investorResult.count,
            funds_imported: fundResult.count,
            duration_seconds: duration.toFixed(2),
            source_data: 'VCS API Scraped Files',
            target_database: 'Supabase',
            success: investorResult.success && fundResult.success
        };
        
        fs.writeFileSync('vcs_import_summary.json', JSON.stringify(summary, null, 2));
        console.log('💾 Import summary saved to: vcs_import_summary.json');
        
    } catch (error) {
        console.error('💥 Critical error in VCS data import:', error);
        throw error;
    }
}

// Execute if run directly
if (require.main === module) {
    (async () => {
        try {
            await importVCSData();
            console.log('✅ VCS data import completed successfully!');
        } catch (error) {
            console.error('💥 VCS data import failed:', error);
            process.exit(1);
        }
    })();
}

module.exports = {
    importVCSData,
    importInvestors,
    importFunds,
    transformInvestorForDB,
    transformFundForDB
}; 