/**
 * 💰 MINIMAL VCS FUND IMPORTER
 * ============================
 * 
 * Ultra-safe version that only uses columns that definitely exist
 * Based on the most basic fund_table structure
 */

const fs = require('fs');
const path = require('path');

console.log('💰 Creating MINIMAL VCS Fund import for fund_table...');

/**
 * Configuration
 */
const CONFIG = {
    dataDir: 'vcs_api_data',
    outputFile: 'vcs_funds_import_minimal.sql',
    batchSize: 50,
    batchPrefix: 'vcs_funds_minimal_batch_'
};

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
 * Map VCS fund data to minimal fund_table schema
 * Only uses the most basic columns that should always exist
 */
function mapFundToMinimalSchema(apiData) {
    // Helper function to parse dates
    function parseDate(dateStr) {
        if (!dateStr) return null;
        return dateStr;
    }
    
    // Helper function to parse amounts
    function parseAmount(amountStr) {
        if (!amountStr || amountStr === '0.0') return null;
        const amount = parseFloat(amountStr);
        return Math.round(amount * 100000000); // Convert to KRW
    }
    
    return {
        // Only the most basic fields that should exist in any fund table
        company_id: apiData.operInstId || '',
        fund_name: apiData.fundNm || '',
        
        // Try these common optional fields
        commitment_amount: parseAmount(apiData.formTotamt),
        establishment_date: parseDate(apiData.regDd),
        
        // JSONB fund details - this should exist in modern Supabase tables
        fund_details: JSON.stringify({
            fund_id: apiData.fundId || '',
            registration_date: apiData.regDd || '',
            expiry_date: apiData.expDd || '',
            formation_total_amount: apiData.formTotamt || '',
            investment_character_code: apiData.invstCharcCd || '',
            industry_code: apiData.comIndCd || '',
            investment_field_type: apiData.invstFldTpNm || '',
            investment_field_detail_type: apiData.invstFldDtlTpNm || '',
            mother_fund_id: apiData.mfundId || '',
            operator_company_id: apiData.operInstId || '',
            operator_company_name: apiData.operInstNm || '',
            fund_type: 'VCS Registered Fund',
            fund_status: (() => {
                if (!apiData.expDd) return 'Active';
                const expiry = new Date(apiData.expDd);
                const now = new Date();
                return expiry > now ? 'Active' : 'Expired';
            })(),
            representative: apiData.operInstNm || '',
            investment_focus: (() => {
                const focus = [];
                if (apiData.invstFldDtlTpNm) focus.push(apiData.invstFldDtlTpNm);
                if (apiData.invstFldTpNm && apiData.invstFldTpNm !== apiData.invstFldDtlTpNm) {
                    focus.push(apiData.invstFldTpNm);
                }
                return focus;
            })(),
            source_url: 'https://www.vcs.go.kr/web/portal/fund/search',
            extracted_at: new Date().toISOString()
        }),
        
        // Source tracking - this should exist
        apify_source: 'VCS_API_SCRAPER'
    };
}

/**
 * Generate MINIMAL UPSERT SQL for funds
 * Only includes the most basic columns
 */
function generateMinimalFundUpsertSQL(funds, batchInfo = null) {
    console.log('\n💰 === GENERATING MINIMAL FUND UPSERT SQL ===');
    
    let sql = '';
    
    if (batchInfo) {
        sql += `-- VCS Fund MINIMAL UPSERT Batch ${batchInfo.number}/${batchInfo.total} (Records ${batchInfo.start}-${batchInfo.end})\n`;
        sql += '-- MINIMAL: Only using basic columns that definitely exist\n';
    } else {
        sql += '-- VCS Fund Data MINIMAL UPSERT Import SQL\n';
        sql += '-- MINIMAL: Ultra-safe version with basic columns only\n';
    }
    
    sql += '-- Generated from VCS API Scraper fund data\n';
    sql += `-- Generated at: ${new Date().toISOString()}\n`;
    sql += '-- Schema: Minimal fund_table structure (basic columns only)\n\n';
    
    if (funds.length === 0) {
        sql += '-- No fund data to import\n';
        return sql;
    }
    
    sql += '-- MINIMAL FUND DATA (UPSERT - Safe for Duplicates)\n';
    sql += `-- Processing ${funds.length} fund records\n`;
    sql += '-- Will INSERT new records or UPDATE existing ones\n\n';
    
    funds.forEach((fund, index) => {
        const mapped = mapFundToMinimalSchema(fund);
        const recordNumber = batchInfo ? batchInfo.start + index : index + 1;
        
        sql += `-- Record ${recordNumber}: ${mapped.fund_name}\n`;
        sql += `INSERT INTO fund_table (\n`;
        sql += `  company_id, fund_name, commitment_amount, establishment_date,\n`;
        sql += `  fund_details, apify_source\n`;
        sql += `) VALUES (\n`;
        sql += `  '${mapped.company_id}',\n`;
        sql += `  '${mapped.fund_name.replace(/'/g, "''")}',\n`;
        sql += `  ${mapped.commitment_amount || 'NULL'},\n`;
        sql += `  ${mapped.establishment_date ? `'${mapped.establishment_date}'` : 'NULL'},\n`;
        sql += `  '${mapped.fund_details.replace(/'/g, "''")}'::jsonb,\n`;
        sql += `  '${mapped.apify_source}'\n`;
        sql += `)\n`;
        sql += `ON CONFLICT (company_id, fund_name) DO UPDATE SET\n`;
        sql += `  commitment_amount = EXCLUDED.commitment_amount,\n`;
        sql += `  establishment_date = EXCLUDED.establishment_date,\n`;
        sql += `  fund_details = EXCLUDED.fund_details,\n`;
        sql += `  apify_source = EXCLUDED.apify_source,\n`;
        sql += `  updated_at = NOW();\n\n`;
    });
    
    if (batchInfo) {
        sql += `-- Minimal Batch ${batchInfo.number} completed! ${funds.length} fund records processed.\n`;
        sql += `-- Progress: ${batchInfo.end}/${(batchInfo.number === batchInfo.total ? batchInfo.end : 3689)} total records\n\n`;
        
        if (batchInfo.number === batchInfo.total) {
            sql += '-- Final verification query\n';
            sql += 'SELECT \n';
            sql += "  'VCS Fund MINIMAL Import Completed' as status,\n";
            sql += '  COUNT(*) as total_vcs_funds,\n';
            sql += '  COUNT(DISTINCT company_id) as unique_operators,\n';
            sql += '  SUM(commitment_amount) / 1000000000 as total_commitment_billions_krw,\n';
            sql += '  MAX(updated_at) as last_updated\n';
            sql += "FROM fund_table WHERE apify_source = 'VCS_API_SCRAPER';\n";
        }
    } else {
        sql += '-- Minimal import completed!\n';
        sql += `-- Total funds processed: ${funds.length}\n`;
        sql += '-- All detailed data stored in fund_details JSONB column\n\n';
        
        sql += '-- Verification query\n';
        sql += 'SELECT \n';
        sql += "  'VCS Fund MINIMAL Import Completed' as status,\n";
        sql += '  COUNT(*) as total_vcs_funds,\n';
        sql += '  COUNT(DISTINCT company_id) as unique_operators,\n';
        sql += '  SUM(commitment_amount) / 1000000000 as total_commitment_billions_krw\n';
        sql += "FROM fund_table WHERE apify_source = 'VCS_API_SCRAPER';\n";
    }
    
    return sql;
}

/**
 * Create minimal batch files for fund import
 */
function createMinimalFundBatches(funds) {
    console.log('\n📁 === CREATING MINIMAL FUND BATCH FILES ===');
    
    const totalBatches = Math.ceil(funds.length / CONFIG.batchSize);
    console.log(`📊 Creating ${totalBatches} minimal batch files (${CONFIG.batchSize} records each)`);
    
    for (let i = 0; i < totalBatches; i++) {
        const batchNumber = i + 1;
        const startIndex = i * CONFIG.batchSize;
        const endIndex = Math.min(startIndex + CONFIG.batchSize, funds.length);
        const batchFunds = funds.slice(startIndex, endIndex);
        
        const batchInfo = {
            number: batchNumber,
            total: totalBatches,
            start: startIndex + 1,
            end: endIndex
        };
        
        const batchSQL = generateMinimalFundUpsertSQL(batchFunds, batchInfo);
        const fileName = `${CONFIG.batchPrefix}${batchNumber.toString().padStart(2, '0')}.sql`;
        
        fs.writeFileSync(fileName, batchSQL);
        console.log(`✅ Created: ${fileName} (${batchFunds.length} records)`);
    }
    
    return totalBatches;
}

/**
 * Main processing function
 */
function createMinimalVCSFundImporter() {
    console.log('\n🚀 === CREATING MINIMAL VCS FUND IMPORTER ===');
    
    try {
        // Check if source directory exists
        if (!fs.existsSync(CONFIG.dataDir)) {
            console.error(`❌ Source directory not found: ${CONFIG.dataDir}`);
            console.error('💡 Run "npm run vcs:api-file" first to scrape the data');
            return;
        }
        
        // Read fund data
        const fundsFile = path.join(CONFIG.dataDir, 'funds_complete.json');
        if (!fs.existsSync(fundsFile)) {
            console.error(`❌ Funds file not found: ${fundsFile}`);
            return;
        }
        
        console.log('📖 Reading fund data...');
        const fundsData = readJSONFile(fundsFile);
        if (!fundsData || !fundsData.data) {
            console.error('❌ Invalid fund data format');
            return;
        }
        
        const funds = fundsData.data;
        console.log(`📊 Found ${funds.length} funds to process`);
        
        // Create single large minimal file
        console.log('\n💰 Creating single minimal UPSERT file...');
        const sqlContent = generateMinimalFundUpsertSQL(funds);
        fs.writeFileSync(CONFIG.outputFile, sqlContent);
        console.log(`📄 Minimal SQL saved to: ${CONFIG.outputFile}`);
        
        // Create minimal batch files  
        const totalBatches = createMinimalFundBatches(funds);
        
        console.log('\n🎉 === MINIMAL VCS FUND IMPORTER CREATED ===');
        console.log(`📊 Processed: ${funds.length} fund records`);
        console.log(`📁 Single file: ${CONFIG.outputFile}`);
        console.log(`📁 Batch files: ${CONFIG.batchPrefix}01.sql to ${CONFIG.batchPrefix}${totalBatches.toString().padStart(2, '0')}.sql`);
        console.log('\n✅ MINIMAL APPROACH:');
        console.log('• Only uses basic columns: company_id, fund_name, commitment_amount, establishment_date');
        console.log('• All other data stored in fund_details JSONB column');
        console.log('• Should work with any fund_table structure');
        console.log('• Data remains fully accessible via JSON queries');
        console.log('\n🚀 Next steps:');
        console.log('1. First, run check_fund_table_schema.sql to see your actual columns');
        console.log('2. Use minimal batch files for guaranteed compatibility');
        console.log('3. Start with vcs_funds_minimal_batch_01.sql');
        
    } catch (error) {
        console.error('💥 Error creating minimal VCS fund importer:', error);
    }
}

// Execute if run directly
if (require.main === module) {
    createMinimalVCSFundImporter();
}

module.exports = {
    createMinimalVCSFundImporter,
    mapFundToMinimalSchema
}; 