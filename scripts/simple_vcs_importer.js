/**
 * 📥 SIMPLE VCS DATA IMPORTER
 * ===========================
 * 
 * A simpler approach to importing VCS data to Supabase
 * Handles API key issues and provides fallback options
 */

const fs = require('fs');
const path = require('path');

console.log('📥 Simple VCS Data Importer Started');

/**
 * Configuration
 */
const CONFIG = {
    dataDir: 'vcs_api_data',
    outputFile: 'vcs_data_for_manual_import.json'
};

/**
 * Transform investor data to simplified format
 */
function transformInvestorData(apiData) {
    return {
        // Core identification
        company_name: apiData.operInstNm || '',
        company_id: apiData.operInstId || '',
        
        // Company details  
        representative: apiData.repNm || '',
        establishment_year: apiData.foundYy || '',
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
        operating_amount: apiData.operBoundAmt || '',
        operating_amount_text: apiData.operBoundAmt ? `${apiData.operBoundAmt}억원` : '',
        
        // Special characteristics
        strategy_planner: apiData.strtplanerYn === 'Y' ? 'Yes' : 'No',
        professional_angel: apiData.pfAnglYn === 'Y' ? 'Yes' : 'No',
        investment_character: apiData.invstCharcNm || '',
        
        // Original VCS fields
        vcs_operator_type_code: apiData.operInstTpCd || '',
        vcs_operator_type_name: apiData.operInstTpNm || '',
        vcs_operating_scale_code: apiData.operScaleCd || '',
        vcs_business_category_code: apiData.comBzcarrCd || '',
        vcs_founded_period: apiData.foundYy || '',
        
        // Metadata
        data_source: 'VCS_API_SCRAPER',
        source_url: 'https://www.vcs.go.kr/web/portal/investor/search',
        extracted_at: new Date().toISOString()
    };
}

/**
 * Transform fund data to simplified format
 */
function transformFundData(apiData) {
    return {
        // Core identification
        fund_name: apiData.fundNm || '',
        fund_id: apiData.fundId || '',
        company_name: apiData.operInstNm || '',
        company_id: apiData.operInstId || '',
        
        // Fund details
        registration_date: apiData.regDd || '',
        expiry_date: apiData.expDd || '',
        formation_total_amount: apiData.formTotamt || '',
        formation_total_amount_text: apiData.formTotamt ? `${apiData.formTotamt}억원` : '',
        
        // Investment focus
        investment_field_type: apiData.invstFldTpNm || '',
        investment_field_detail_type: apiData.invstFldDtlTpNm || '',
        investment_character: apiData.invstCharcNm || '',
        
        // Special features
        mother_fund_related: apiData.mfundId ? true : false,
        mother_fund_id: apiData.mfundId || '',
        
        // Performance
        investment_ratio: apiData.invstRto || '',
        
        // Metadata
        data_source: 'VCS_API_SCRAPER',
        source_url: 'https://www.vcs.go.kr/web/portal/investor/search',
        extracted_at: new Date().toISOString()
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
 * Process investors data
 */
function processInvestors() {
    console.log('\n👥 === PROCESSING INVESTORS ===');
    
    const investorsFile = path.join(CONFIG.dataDir, 'investors_complete.json');
    
    if (!fs.existsSync(investorsFile)) {
        console.error(`❌ Investors file not found: ${investorsFile}`);
        return [];
    }
    
    const investorsData = readJSONFile(investorsFile);
    if (!investorsData || !investorsData.data) {
        console.error('❌ Invalid investors data format');
        return [];
    }
    
    const investors = investorsData.data;
    console.log(`📊 Found ${investors.length} investors`);
    
    // Transform all investors
    const transformedInvestors = investors.map(transformInvestorData);
    console.log(`✅ Transformed ${transformedInvestors.length} investor records`);
    
    return transformedInvestors;
}

/**
 * Process funds data
 */
function processFunds() {
    console.log('\n💼 === PROCESSING FUNDS ===');
    
    const fundsFile = path.join(CONFIG.dataDir, 'funds_complete.json');
    
    if (!fs.existsSync(fundsFile)) {
        console.error(`❌ Funds file not found: ${fundsFile}`);
        return [];
    }
    
    const fundsData = readJSONFile(fundsFile);
    if (!fundsData || !fundsData.data) {
        console.error('❌ Invalid funds data format');
        return [];
    }
    
    const funds = fundsData.data;
    console.log(`📊 Found ${funds.length} funds`);
    
    // Transform all funds
    const transformedFunds = funds.map(transformFundData);
    console.log(`✅ Transformed ${transformedFunds.length} fund records`);
    
    return transformedFunds;
}

/**
 * Generate SQL INSERT statements
 */
function generateSQLInserts(investors, funds) {
    console.log('\n📝 === GENERATING SQL INSERTS ===');
    
    let sql = '-- VCS Data Import SQL\n';
    sql += '-- Generated from VCS API Scraper data\n';
    sql += `-- Generated at: ${new Date().toISOString()}\n\n`;
    
    // Investors SQL
    if (investors.length > 0) {
        sql += '-- INVESTORS DATA\n';
        sql += '-- Insert into vc_table\n\n';
        
        investors.forEach((investor, index) => {
            sql += `INSERT INTO vc_table (\n`;
            sql += `  company_name, company_id, representative, establishment_date,\n`;
            sql += `  address, zip_code, phone, business_type, business_category,\n`;
            sql += `  industry, location, operating_scale, operating_amount,\n`;
            sql += `  operating_amount_text, strategy_planner, professional_angel,\n`;
            sql += `  investment_character, data_source, source_url, extracted_at\n`;
            sql += `) VALUES (\n`;
            sql += `  '${investor.company_name.replace(/'/g, "''")}',\n`;
            sql += `  '${investor.company_id}',\n`;
            sql += `  '${investor.representative.replace(/'/g, "''")}',\n`;
            sql += `  ${investor.establishment_year ? `'${investor.establishment_year}-01-01'` : 'NULL'},\n`;
            sql += `  '${investor.address.replace(/'/g, "''")}',\n`;
            sql += `  '${investor.zip_code}',\n`;
            sql += `  '${investor.phone}',\n`;
            sql += `  '${investor.business_type.replace(/'/g, "''")}',\n`;
            sql += `  '${investor.business_category}',\n`;
            sql += `  '${investor.industry.replace(/'/g, "''")}',\n`;
            sql += `  '${investor.location.replace(/'/g, "''")}',\n`;
            sql += `  '${investor.operating_scale}',\n`;
            sql += `  ${investor.operating_amount ? investor.operating_amount : 'NULL'},\n`;
            sql += `  '${investor.operating_amount_text.replace(/'/g, "''")}',\n`;
            sql += `  '${investor.strategy_planner}',\n`;
            sql += `  '${investor.professional_angel}',\n`;
            sql += `  '${investor.investment_character.replace(/'/g, "''")}',\n`;
            sql += `  '${investor.data_source}',\n`;
            sql += `  '${investor.source_url}',\n`;
            sql += `  '${investor.extracted_at}'\n`;
            sql += `);\n\n`;
            
            if (index > 0 && index % 50 === 0) {
                sql += `-- Processed ${index + 1} investors so far...\n\n`;
            }
        });
    }
    
    // Funds SQL  
    if (funds.length > 0) {
        sql += '\n-- FUNDS DATA\n';
        sql += '-- Insert into fund_table\n\n';
        
        funds.forEach((fund, index) => {
            sql += `INSERT INTO fund_table (\n`;
            sql += `  fund_name, fund_id, company_name, company_id,\n`;
            sql += `  registration_date, expiry_date, formation_total_amount,\n`;
            sql += `  formation_total_amount_text, investment_field_type,\n`;
            sql += `  investment_field_detail_type, investment_character,\n`;
            sql += `  mother_fund_related, mother_fund_id, investment_ratio,\n`;
            sql += `  data_source, source_url, extracted_at\n`;
            sql += `) VALUES (\n`;
            sql += `  '${fund.fund_name.replace(/'/g, "''")}',\n`;
            sql += `  '${fund.fund_id}',\n`;
            sql += `  '${fund.company_name.replace(/'/g, "''")}',\n`;
            sql += `  '${fund.company_id}',\n`;
            sql += `  ${fund.registration_date ? `'${fund.registration_date}'` : 'NULL'},\n`;
            sql += `  ${fund.expiry_date ? `'${fund.expiry_date}'` : 'NULL'},\n`;
            sql += `  ${fund.formation_total_amount ? fund.formation_total_amount : 'NULL'},\n`;
            sql += `  '${fund.formation_total_amount_text.replace(/'/g, "''")}',\n`;
            sql += `  '${fund.investment_field_type.replace(/'/g, "''")}',\n`;
            sql += `  '${fund.investment_field_detail_type.replace(/'/g, "''")}',\n`;
            sql += `  '${fund.investment_character.replace(/'/g, "''")}',\n`;
            sql += `  ${fund.mother_fund_related},\n`;
            sql += `  '${fund.mother_fund_id}',\n`;
            sql += `  ${fund.investment_ratio ? fund.investment_ratio : 'NULL'},\n`;
            sql += `  '${fund.data_source}',\n`;
            sql += `  '${fund.source_url}',\n`;
            sql += `  '${fund.extracted_at}'\n`;
            sql += `);\n\n`;
            
            if (index > 0 && index % 50 === 0) {
                sql += `-- Processed ${index + 1} funds so far...\n\n`;
            }
        });
    }
    
    sql += '-- Import completed!\n';
    sql += `-- Total investors: ${investors.length}\n`;
    sql += `-- Total funds: ${funds.length}\n`;
    sql += `-- Total records: ${investors.length + funds.length}\n`;
    
    return sql;
}

/**
 * Main processing function
 */
function processVCSData() {
    console.log('\n🚀 === STARTING VCS DATA PROCESSING ===');
    
    const startTime = Date.now();
    
    try {
        // Check if source directory exists
        if (!fs.existsSync(CONFIG.dataDir)) {
            console.error(`❌ Source directory not found: ${CONFIG.dataDir}`);
            console.error('💡 Run "npm run vcs:api-file" first to scrape the data');
            process.exit(1);
        }
        
        // Process investors
        const investors = processInvestors();
        
        // Process funds
        const funds = processFunds();
        
        const totalRecords = investors.length + funds.length;
        
        if (totalRecords === 0) {
            console.error('❌ No data to process');
            process.exit(1);
        }
        
        // Create consolidated data structure
        const consolidatedData = {
            metadata: {
                total_records: totalRecords,
                investors_count: investors.length,
                funds_count: funds.length,
                processed_at: new Date().toISOString(),
                source: 'VCS API Scraper',
                data_quality: 'Professional API-based extraction'
            },
            investors: investors,
            funds: funds
        };
        
        // Save consolidated JSON
        fs.writeFileSync(CONFIG.outputFile, JSON.stringify(consolidatedData, null, 2));
        console.log(`💾 Consolidated data saved to: ${CONFIG.outputFile}`);
        
        // Generate SQL file
        const sqlContent = generateSQLInserts(investors, funds);
        const sqlFile = CONFIG.outputFile.replace('.json', '.sql');
        fs.writeFileSync(sqlFile, sqlContent);
        console.log(`📄 SQL import file saved to: ${sqlFile}`);
        
        const duration = (Date.now() - startTime) / 1000;
        
        console.log('\n🎉 === VCS DATA PROCESSING COMPLETED ===');
        console.log(`📊 Total Records Processed: ${totalRecords}`);
        console.log(`👥 Investors: ${investors.length}`);
        console.log(`💼 Funds: ${funds.length}`);
        console.log(`⏱️ Duration: ${duration.toFixed(2)} seconds`);
        console.log(`📁 Output Files:`);
        console.log(`   - JSON: ${CONFIG.outputFile}`);
        console.log(`   - SQL:  ${sqlFile}`);
        
        console.log('\n🚀 Next Steps:');
        console.log('1. Option A: Fix Supabase credentials and run the automated importer');
        console.log('2. Option B: Use the SQL file to manually import via Supabase Dashboard');
        console.log('3. Option C: Use the JSON file for custom import scripts');
        
    } catch (error) {
        console.error('💥 Critical error in VCS data processing:', error);
        throw error;
    }
}

// Execute if run directly
if (require.main === module) {
    processVCSData();
}

module.exports = {
    processVCSData,
    processInvestors,
    processFunds,
    transformInvestorData,
    transformFundData
}; 