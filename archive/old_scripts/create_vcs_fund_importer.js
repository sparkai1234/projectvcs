/**
 * 💰 VCS FUND IMPORTER
 * ====================
 * 
 * Imports VCS fund data to fund_table with proper schema mapping
 * Handles 3,689 fund records from VCS API
 */

const fs = require('fs');
const path = require('path');

console.log('💰 Creating VCS Fund import for fund_table...');

/**
 * Configuration
 */
const CONFIG = {
    dataDir: 'vcs_api_data',
    outputFile: 'vcs_funds_import.sql',
    batchSize: 50, // For batch files
    batchPrefix: 'vcs_funds_batch_'
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
 * Map VCS fund data to fund_table schema
 */
function mapFundToSchema(apiData) {
    // Helper function to parse dates
    function parseDate(dateStr) {
        if (!dateStr) return null;
        // VCS dates are in YYYY-MM-DD format
        return dateStr;
    }
    
    // Helper function to parse amounts (they come as strings like "465.0")
    function parseAmount(amountStr) {
        if (!amountStr || amountStr === '0.0') return null;
        const amount = parseFloat(amountStr);
        // Convert to KRW (assuming the values are in hundreds of millions)
        return Math.round(amount * 100000000); // Convert 465.0 -> 46,500,000,000 KRW
    }
    
    return {
        // Use VCS operator ID as company_id (links to vc_table)
        company_id: apiData.operInstId || '',
        
        // Fund identification
        fund_name: apiData.fundNm || '',
        fund_name_en: null, // VCS doesn't provide English names
        fund_type: 'VCS Registered Fund', // Standard type for VCS funds
        
        // Financial information
        commitment_amount: parseAmount(apiData.formTotamt),
        fund_size: parseAmount(apiData.formTotamt), // Same as commitment for VCS data
        
        // Dates
        establishment_date: parseDate(apiData.regDd),
        
        // Status (determine from expiry date)
        fund_status: (() => {
            if (!apiData.expDd) return 'Active';
            const expiry = new Date(apiData.expDd);
            const now = new Date();
            return expiry > now ? 'Active' : 'Expired';
        })(),
        
        // Representative (get from operator name since no specific person)
        representative: apiData.operInstNm || '',
        
        // Investment focus (derive from industry and field codes)
        investment_focus: (() => {
            const focus = [];
            
            // Add investment field details
            if (apiData.invstFldDtlTpNm) {
                focus.push(apiData.invstFldDtlTpNm);
            }
            
            // Add investment field type
            if (apiData.invstFldTpNm && apiData.invstFldTpNm !== apiData.invstFldDtlTpNm) {
                focus.push(apiData.invstFldTpNm);
            }
            
            return focus.length > 0 ? `{${focus.map(f => `"${f}"`).join(',')}}` : null;
        })(),
        
        // Fund details as JSONB
        fund_details: JSON.stringify({
            // VCS specific fields
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
        apify_source: 'VCS_API_SCRAPER',
        
        // Timestamps
        import_date: new Date().toISOString()
    };
}

/**
 * Generate UPSERT SQL for funds
 */
function generateFundUpsertSQL(funds, batchInfo = null) {
    console.log('\n💰 === GENERATING FUND UPSERT SQL ===');
    
    let sql = '';
    
    if (batchInfo) {
        sql += `-- VCS Fund UPSERT Batch ${batchInfo.number}/${batchInfo.total} (Records ${batchInfo.start}-${batchInfo.end})\n`;
        sql += '-- Uses ON CONFLICT DO UPDATE to insert new or update existing funds\n';
    } else {
        sql += '-- VCS Fund Data UPSERT Import SQL (Handles Duplicates)\n';
        sql += '-- Uses ON CONFLICT DO UPDATE to insert new or update existing funds\n';
    }
    
    sql += '-- Generated from VCS API Scraper fund data\n';
    sql += `-- Generated at: ${new Date().toISOString()}\n`;
    sql += '-- Schema: Matches fund_table structure\n\n';
    
    if (funds.length === 0) {
        sql += '-- No fund data to import\n';
        return sql;
    }
    
    sql += '-- FUND DATA (UPSERT - Safe for Duplicates)\n';
    sql += `-- Processing ${funds.length} fund records\n`;
    sql += '-- Will INSERT new records or UPDATE existing ones\n\n';
    
    funds.forEach((fund, index) => {
        const mapped = mapFundToSchema(fund);
        const recordNumber = batchInfo ? batchInfo.start + index : index + 1;
        
        sql += `-- Record ${recordNumber}: ${mapped.fund_name}\n`;
        sql += `INSERT INTO fund_table (\n`;
        sql += `  company_id, fund_name, fund_name_en, fund_type,\n`;
        sql += `  commitment_amount, fund_size, establishment_date, fund_status,\n`;
        sql += `  representative, investment_focus, fund_details, apify_source\n`;
        sql += `) VALUES (\n`;
        sql += `  '${mapped.company_id}',\n`;
        sql += `  '${mapped.fund_name.replace(/'/g, "''")}',\n`;
        sql += `  ${mapped.fund_name_en ? `'${mapped.fund_name_en}'` : 'NULL'},\n`;
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
        sql += `  fund_name_en = EXCLUDED.fund_name_en,\n`;
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
        sql += `-- Batch ${batchInfo.number} completed! ${funds.length} fund records processed.\n`;
        sql += `-- Progress: ${batchInfo.end}/${(batchInfo.number === batchInfo.total ? batchInfo.end : 3689)} total records\n\n`;
        
        if (batchInfo.number === batchInfo.total) {
            sql += '-- Final verification query\n';
            sql += 'SELECT \n';
            sql += "  'VCS Fund UPSERT Import Completed' as status,\n";
            sql += '  COUNT(*) as total_vcs_funds,\n';
            sql += '  COUNT(DISTINCT company_id) as unique_operators,\n';
            sql += '  SUM(commitment_amount) / 1000000000 as total_commitment_billions_krw,\n';
            sql += '  MAX(updated_at) as last_updated\n';
            sql += "FROM fund_table WHERE apify_source = 'VCS_API_SCRAPER';\n";
        }
    } else {
        sql += '-- Import completed!\n';
        sql += `-- Total funds processed: ${funds.length}\n`;
        sql += '-- Records were either inserted (if new) or updated (if existing)\n\n';
        
        sql += '-- Verification query\n';
        sql += 'SELECT \n';
        sql += "  'VCS Fund Import Completed' as status,\n";
        sql += '  COUNT(*) as total_vcs_funds,\n';
        sql += '  COUNT(DISTINCT company_id) as unique_operators,\n';
        sql += '  SUM(commitment_amount) / 1000000000 as total_commitment_billions_krw\n';
        sql += "FROM fund_table WHERE apify_source = 'VCS_API_SCRAPER';\n";
    }
    
    return sql;
}

/**
 * Create batch files for fund import
 */
function createFundBatches(funds) {
    console.log('\n📁 === CREATING FUND BATCH FILES ===');
    
    const totalBatches = Math.ceil(funds.length / CONFIG.batchSize);
    console.log(`📊 Creating ${totalBatches} batch files (${CONFIG.batchSize} records each)`);
    
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
        
        const batchSQL = generateFundUpsertSQL(batchFunds, batchInfo);
        const fileName = `${CONFIG.batchPrefix}${batchNumber.toString().padStart(2, '0')}.sql`;
        
        fs.writeFileSync(fileName, batchSQL);
        console.log(`✅ Created: ${fileName} (${batchFunds.length} records)`);
    }
    
    return totalBatches;
}

/**
 * Main processing function
 */
function createVCSFundImporter() {
    console.log('\n🚀 === CREATING VCS FUND IMPORTER ===');
    
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
        
        // Create single large file
        console.log('\n💰 Creating single UPSERT file...');
        const sqlContent = generateFundUpsertSQL(funds);
        fs.writeFileSync(CONFIG.outputFile, sqlContent);
        console.log(`📄 Full SQL saved to: ${CONFIG.outputFile}`);
        
        // Create batch files  
        const totalBatches = createFundBatches(funds);
        
        console.log('\n🎉 === VCS FUND IMPORTER CREATED ===');
        console.log(`📊 Processed: ${funds.length} fund records`);
        console.log(`📁 Single file: ${CONFIG.outputFile}`);
        console.log(`📁 Batch files: ${CONFIG.batchPrefix}01.sql to ${CONFIG.batchPrefix}${totalBatches.toString().padStart(2, '0')}.sql`);
        console.log('\n🚀 Next steps:');
        console.log('1. Use batch files for Supabase SQL Editor (recommended)');
        console.log('2. Each batch is small enough for SQL Editor');
        console.log('3. UPSERT logic handles duplicates safely');
        console.log('4. Links to existing vc_table via company_id');
        
    } catch (error) {
        console.error('💥 Error creating VCS fund importer:', error);
    }
}

// Execute if run directly
if (require.main === module) {
    createVCSFundImporter();
}

module.exports = {
    createVCSFundImporter,
    mapFundToSchema
}; 