/**
 * 💰 CORRECTED VCS FUND IMPORTER
 * ==============================
 * 
 * Fixed version that matches actual fund_table schema
 * Handles missing columns gracefully
 */

const fs = require('fs');
const path = require('path');

console.log('💰 Creating CORRECTED VCS Fund import for fund_table...');

/**
 * Configuration
 */
const CONFIG = {
    dataDir: 'vcs_api_data',
    outputFile: 'vcs_funds_import_corrected.sql',
    batchSize: 50,
    batchPrefix: 'vcs_funds_corrected_batch_'
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
 * Map VCS fund data to fund_table schema (CORRECTED VERSION)
 * Only uses columns that definitely exist
 */
function mapFundToSchema(apiData) {
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
        // Required fields that exist in all fund_table versions
        company_id: apiData.operInstId || '',
        fund_name: apiData.fundNm || '',
        fund_type: 'VCS Registered Fund',
        
        // Optional financial fields
        commitment_amount: parseAmount(apiData.formTotamt),
        fund_size: parseAmount(apiData.formTotamt),
        
        // Date fields
        establishment_date: parseDate(apiData.regDd),
        
        // Status determination
        fund_status: (() => {
            if (!apiData.expDd) return 'Active';
            const expiry = new Date(apiData.expDd);
            const now = new Date();
            return expiry > now ? 'Active' : 'Expired';
        })(),
        
        // Representative
        representative: apiData.operInstNm || '',
        
        // Investment focus array
        investment_focus: (() => {
            const focus = [];
            if (apiData.invstFldDtlTpNm) focus.push(apiData.invstFldDtlTpNm);
            if (apiData.invstFldTpNm && apiData.invstFldTpNm !== apiData.invstFldDtlTpNm) {
                focus.push(apiData.invstFldTpNm);
            }
            return focus.length > 0 ? `{${focus.map(f => `"${f}"`).join(',')}}` : null;
        })(),
        
        // JSONB fund details
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
            source_url: 'https://www.vcs.go.kr/web/portal/fund/search',
            extracted_at: new Date().toISOString()
        }),
        
        // Source tracking
        apify_source: 'VCS_API_SCRAPER'
    };
}

/**
 * Generate CORRECTED UPSERT SQL for funds
 * Only includes columns that exist in the actual table
 */
function generateCorrectedFundUpsertSQL(funds, batchInfo = null) {
    console.log('\n💰 === GENERATING CORRECTED FUND UPSERT SQL ===');
    
    let sql = '';
    
    if (batchInfo) {
        sql += `-- VCS Fund CORRECTED UPSERT Batch ${batchInfo.number}/${batchInfo.total} (Records ${batchInfo.start}-${batchInfo.end})\n`;
        sql += '-- FIXED: Removed fund_name_en column that does not exist\n';
    } else {
        sql += '-- VCS Fund Data CORRECTED UPSERT Import SQL\n';
        sql += '-- FIXED: Adapted to actual fund_table schema\n';
    }
    
    sql += '-- Generated from VCS API Scraper fund data\n';
    sql += `-- Generated at: ${new Date().toISOString()}\n`;
    sql += '-- Schema: Matches actual fund_table structure (no fund_name_en)\n\n';
    
    if (funds.length === 0) {
        sql += '-- No fund data to import\n';
        return sql;
    }
    
    sql += '-- CORRECTED FUND DATA (UPSERT - Safe for Duplicates)\n';
    sql += `-- Processing ${funds.length} fund records\n`;
    sql += '-- Will INSERT new records or UPDATE existing ones\n\n';
    
    funds.forEach((fund, index) => {
        const mapped = mapFundToSchema(fund);
        const recordNumber = batchInfo ? batchInfo.start + index : index + 1;
        
        sql += `-- Record ${recordNumber}: ${mapped.fund_name}\n`;
        sql += `INSERT INTO fund_table (\n`;
        sql += `  company_id, fund_name, fund_type,\n`;
        sql += `  commitment_amount, fund_size, establishment_date, fund_status,\n`;
        sql += `  representative, investment_focus, fund_details, apify_source\n`;
        sql += `) VALUES (\n`;
        sql += `  '${mapped.company_id}',\n`;
        sql += `  '${mapped.fund_name.replace(/'/g, "''")}',\n`;
        sql += `  '${mapped.fund_type}',\n`;
        sql += `  ${mapped.commitment_amount || 'NULL'},\n`;
        sql += `  ${mapped.fund_size || 'NULL'},\n`;
        sql += `  ${mapped.establishment_date ? `'${mapped.establishment_date}'` : 'NULL'},\n`;
        sql += `  '${mapped.fund_status}',\n`;
        sql += `  '${mapped.representative.replace(/'/g, "''")}',\n`;
        sql += `  ${mapped.investment_focus ? `'${mapped.investment_focus}'` : 'NULL'},\n`;
        sql += `  '${mapped.fund_details.replace(/'/g, "''")}'::jsonb,\n`;
        sql += `  '${mapped.apify_source}'\n`;
        sql += `)\n`;
        sql += `ON CONFLICT (company_id, fund_name) DO UPDATE SET\n`;
        sql += `  fund_type = EXCLUDED.fund_type,\n`;
        sql += `  commitment_amount = EXCLUDED.commitment_amount,\n`;
        sql += `  fund_size = EXCLUDED.fund_size,\n`;
        sql += `  establishment_date = EXCLUDED.establishment_date,\n`;
        sql += `  fund_status = EXCLUDED.fund_status,\n`;
        sql += `  representative = EXCLUDED.representative,\n`;
        sql += `  investment_focus = EXCLUDED.investment_focus,\n`;
        sql += `  fund_details = EXCLUDED.fund_details,\n`;
        sql += `  apify_source = EXCLUDED.apify_source,\n`;
        sql += `  updated_at = NOW();\n\n`;
    });
    
    if (batchInfo) {
        sql += `-- Corrected Batch ${batchInfo.number} completed! ${funds.length} fund records processed.\n`;
        sql += `-- Progress: ${batchInfo.end}/${(batchInfo.number === batchInfo.total ? batchInfo.end : 3689)} total records\n\n`;
        
        if (batchInfo.number === batchInfo.total) {
            sql += '-- Final verification query\n';
            sql += 'SELECT \n';
            sql += "  'VCS Fund CORRECTED Import Completed' as status,\n";
            sql += '  COUNT(*) as total_vcs_funds,\n';
            sql += '  COUNT(DISTINCT company_id) as unique_operators,\n';
            sql += '  SUM(commitment_amount) / 1000000000 as total_commitment_billions_krw,\n';
            sql += '  MAX(updated_at) as last_updated\n';
            sql += "FROM fund_table WHERE apify_source = 'VCS_API_SCRAPER';\n";
        }
    } else {
        sql += '-- Corrected import completed!\n';
        sql += `-- Total funds processed: ${funds.length}\n`;
        sql += '-- Schema adapted to actual fund_table structure\n\n';
        
        sql += '-- Verification query\n';
        sql += 'SELECT \n';
        sql += "  'VCS Fund CORRECTED Import Completed' as status,\n";
        sql += '  COUNT(*) as total_vcs_funds,\n';
        sql += '  COUNT(DISTINCT company_id) as unique_operators,\n';
        sql += '  SUM(commitment_amount) / 1000000000 as total_commitment_billions_krw\n';
        sql += "FROM fund_table WHERE apify_source = 'VCS_API_SCRAPER';\n";
    }
    
    return sql;
}

/**
 * Create corrected batch files for fund import
 */
function createCorrectedFundBatches(funds) {
    console.log('\n📁 === CREATING CORRECTED FUND BATCH FILES ===');
    
    const totalBatches = Math.ceil(funds.length / CONFIG.batchSize);
    console.log(`📊 Creating ${totalBatches} corrected batch files (${CONFIG.batchSize} records each)`);
    
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
        
        const batchSQL = generateCorrectedFundUpsertSQL(batchFunds, batchInfo);
        const fileName = `${CONFIG.batchPrefix}${batchNumber.toString().padStart(2, '0')}.sql`;
        
        fs.writeFileSync(fileName, batchSQL);
        console.log(`✅ Created: ${fileName} (${batchFunds.length} records)`);
    }
    
    return totalBatches;
}

/**
 * Main processing function
 */
function createCorrectedVCSFundImporter() {
    console.log('\n🚀 === CREATING CORRECTED VCS FUND IMPORTER ===');
    
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
        
        // Create single large corrected file
        console.log('\n💰 Creating single corrected UPSERT file...');
        const sqlContent = generateCorrectedFundUpsertSQL(funds);
        fs.writeFileSync(CONFIG.outputFile, sqlContent);
        console.log(`📄 Corrected SQL saved to: ${CONFIG.outputFile}`);
        
        // Create corrected batch files  
        const totalBatches = createCorrectedFundBatches(funds);
        
        console.log('\n🎉 === CORRECTED VCS FUND IMPORTER CREATED ===');
        console.log(`📊 Processed: ${funds.length} fund records`);
        console.log(`📁 Single file: ${CONFIG.outputFile}`);
        console.log(`📁 Batch files: ${CONFIG.batchPrefix}01.sql to ${CONFIG.batchPrefix}${totalBatches.toString().padStart(2, '0')}.sql`);
        console.log('\n✅ FIXES APPLIED:');
        console.log('• Removed fund_name_en column reference');
        console.log('• Adapted to actual fund_table schema');
        console.log('• Maintained all other functionality');
        console.log('\n🚀 Next steps:');
        console.log('1. Use corrected batch files for Supabase SQL Editor');
        console.log('2. Start with vcs_funds_corrected_batch_01.sql');
        console.log('3. Each batch is adapted to your actual table schema');
        
    } catch (error) {
        console.error('💥 Error creating corrected VCS fund importer:', error);
    }
}

// Execute if run directly
if (require.main === module) {
    createCorrectedVCSFundImporter();
}

module.exports = {
    createCorrectedVCSFundImporter,
    mapFundToSchema
}; 