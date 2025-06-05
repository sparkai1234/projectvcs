/**
 * 💰 EXACT VCS FUND IMPORTER
 * ==========================
 * 
 * Matches the EXACT fund_table schema provided by user
 * Uses actual columns that exist in their database
 */

const fs = require('fs');
const path = require('path');

console.log('💰 Creating EXACT VCS Fund import for fund_table...');

/**
 * Configuration
 */
const CONFIG = {
    dataDir: 'vcs_api_data',
    outputFile: 'vcs_funds_import_exact.sql',
    batchSize: 50,
    batchPrefix: 'vcs_funds_exact_batch_'
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
 * Map VCS fund data to EXACT fund_table schema
 * Based on actual schema: id, company_id, fund_name, fund_size, establishment_date, 
 * fund_status, representative, apify_source, created_at, updated_at, fund_id, 
 * company_name, investment_detail, expiry_date, notes, import_date
 */
function mapFundToExactSchema(apiData) {
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
    
    // Helper function to determine status
    function determineFundStatus(expDd) {
        if (!expDd) return 'Active';
        const expiry = new Date(expDd);
        const now = new Date();
        return expiry > now ? 'Active' : 'Expired';
    }
    
    // Helper function to create investment detail
    function createInvestmentDetail(apiData) {
        const details = [];
        
        if (apiData.invstFldTpNm) {
            details.push(`투자분야: ${apiData.invstFldTpNm}`);
        }
        if (apiData.invstFldDtlTpNm) {
            details.push(`세부분야: ${apiData.invstFldDtlTpNm}`);
        }
        if (apiData.invstCharcCd) {
            details.push(`투자성격코드: ${apiData.invstCharcCd}`);
        }
        if (apiData.comIndCd) {
            details.push(`산업코드: ${apiData.comIndCd}`);
        }
        if (apiData.formTotamt) {
            details.push(`조성총액: ${apiData.formTotamt}억원`);
        }
        
        return details.length > 0 ? details.join(' | ') : null;
    }
    
    // Helper function to create notes with all metadata
    function createNotes(apiData) {
        const notes = {
            fund_type: 'VCS Registered Fund',
            vcs_fund_id: apiData.fundId || '',
            mother_fund_id: apiData.mfundId || '',
            investment_character_code: apiData.invstCharcCd || '',
            industry_code: apiData.comIndCd || '',
            investment_field_type: apiData.invstFldTpNm || '',
            investment_field_detail_type: apiData.invstFldDtlTpNm || '',
            formation_total_amount: apiData.formTotamt || '',
            source_url: 'https://www.vcs.go.kr/web/portal/fund/search',
            extracted_at: new Date().toISOString()
        };
        
        return JSON.stringify(notes);
    }
    
    return {
        // Required fields
        company_id: apiData.operInstId || '',
        fund_name: apiData.fundNm || '',
        
        // Map to existing columns
        fund_size: parseAmount(apiData.formTotamt),
        establishment_date: parseDate(apiData.regDd),
        fund_status: determineFundStatus(apiData.expDd),
        representative: apiData.operInstNm || '',
        apify_source: 'VCS_API_SCRAPER',
        
        // Additional fields that exist in schema
        fund_id: apiData.fundId || '',
        company_name: apiData.operInstNm || '',
        investment_detail: createInvestmentDetail(apiData),
        expiry_date: parseDate(apiData.expDd),
        notes: createNotes(apiData),
        import_date: new Date().toISOString()
    };
}

/**
 * Generate EXACT UPSERT SQL for funds
 * Uses the exact column names from the actual schema
 */
function generateExactFundUpsertSQL(funds, batchInfo = null) {
    console.log('\n💰 === GENERATING EXACT FUND UPSERT SQL ===');
    
    let sql = '';
    
    if (batchInfo) {
        sql += `-- VCS Fund EXACT UPSERT Batch ${batchInfo.number}/${batchInfo.total} (Records ${batchInfo.start}-${batchInfo.end})\n`;
        sql += '-- EXACT: Uses actual fund_table schema columns\n';
    } else {
        sql += '-- VCS Fund Data EXACT UPSERT Import SQL\n';
        sql += '-- EXACT: Perfectly matches your fund_table schema\n';
    }
    
    sql += '-- Generated from VCS API Scraper fund data\n';
    sql += `-- Generated at: ${new Date().toISOString()}\n`;
    sql += '-- Schema: Exact match to actual fund_table structure\n\n';
    
    if (funds.length === 0) {
        sql += '-- No fund data to import\n';
        return sql;
    }
    
    sql += '-- EXACT FUND DATA (UPSERT - Safe for Duplicates)\n';
    sql += `-- Processing ${funds.length} fund records\n`;
    sql += '-- Will INSERT new records or UPDATE existing ones\n\n';
    
    funds.forEach((fund, index) => {
        const mapped = mapFundToExactSchema(fund);
        const recordNumber = batchInfo ? batchInfo.start + index : index + 1;
        
        sql += `-- Record ${recordNumber}: ${mapped.fund_name}\n`;
        sql += `INSERT INTO fund_table (\n`;
        sql += `  company_id, fund_name, fund_size, establishment_date, fund_status,\n`;
        sql += `  representative, apify_source, fund_id, company_name, investment_detail,\n`;
        sql += `  expiry_date, notes, import_date\n`;
        sql += `) VALUES (\n`;
        sql += `  '${mapped.company_id}',\n`;
        sql += `  '${mapped.fund_name.replace(/'/g, "''")}',\n`;
        sql += `  ${mapped.fund_size || 'NULL'},\n`;
        sql += `  ${mapped.establishment_date ? `'${mapped.establishment_date}'` : 'NULL'},\n`;
        sql += `  ${mapped.fund_status ? `'${mapped.fund_status}'` : 'NULL'},\n`;
        sql += `  ${mapped.representative ? `'${mapped.representative.replace(/'/g, "''")}'` : 'NULL'},\n`;
        sql += `  '${mapped.apify_source}',\n`;
        sql += `  ${mapped.fund_id ? `'${mapped.fund_id}'` : 'NULL'},\n`;
        sql += `  ${mapped.company_name ? `'${mapped.company_name.replace(/'/g, "''")}'` : 'NULL'},\n`;
        sql += `  ${mapped.investment_detail ? `'${mapped.investment_detail.replace(/'/g, "''")}'` : 'NULL'},\n`;
        sql += `  ${mapped.expiry_date ? `'${mapped.expiry_date}'` : 'NULL'},\n`;
        sql += `  ${mapped.notes ? `'${mapped.notes.replace(/'/g, "''")}'` : 'NULL'},\n`;
        sql += `  '${mapped.import_date}'\n`;
        sql += `)\n`;
        sql += `ON CONFLICT (company_id, fund_name) DO UPDATE SET\n`;
        sql += `  fund_size = EXCLUDED.fund_size,\n`;
        sql += `  establishment_date = EXCLUDED.establishment_date,\n`;
        sql += `  fund_status = EXCLUDED.fund_status,\n`;
        sql += `  representative = EXCLUDED.representative,\n`;
        sql += `  apify_source = EXCLUDED.apify_source,\n`;
        sql += `  fund_id = EXCLUDED.fund_id,\n`;
        sql += `  company_name = EXCLUDED.company_name,\n`;
        sql += `  investment_detail = EXCLUDED.investment_detail,\n`;
        sql += `  expiry_date = EXCLUDED.expiry_date,\n`;
        sql += `  notes = EXCLUDED.notes,\n`;
        sql += `  import_date = EXCLUDED.import_date,\n`;
        sql += `  updated_at = NOW();\n\n`;
    });
    
    if (batchInfo) {
        sql += `-- Exact Batch ${batchInfo.number} completed! ${funds.length} fund records processed.\n`;
        sql += `-- Progress: ${batchInfo.end}/${(batchInfo.number === batchInfo.total ? batchInfo.end : 3689)} total records\n\n`;
        
        if (batchInfo.number === batchInfo.total) {
            sql += '-- Final verification query\n';
            sql += 'SELECT \n';
            sql += "  'VCS Fund EXACT Import Completed' as status,\n";
            sql += '  COUNT(*) as total_vcs_funds,\n';
            sql += '  COUNT(DISTINCT company_id) as unique_operators,\n';
            sql += '  SUM(fund_size) / 1000000000 as total_fund_size_billions_krw,\n';
            sql += '  MAX(updated_at) as last_updated\n';
            sql += "FROM fund_table WHERE apify_source = 'VCS_API_SCRAPER';\n";
        }
    } else {
        sql += '-- Exact import completed!\n';
        sql += `-- Total funds processed: ${funds.length}\n`;
        sql += '-- Perfectly matches your fund_table schema\n\n';
        
        sql += '-- Verification query\n';
        sql += 'SELECT \n';
        sql += "  'VCS Fund EXACT Import Completed' as status,\n";
        sql += '  COUNT(*) as total_vcs_funds,\n';
        sql += '  COUNT(DISTINCT company_id) as unique_operators,\n';
        sql += '  SUM(fund_size) / 1000000000 as total_fund_size_billions_krw\n';
        sql += "FROM fund_table WHERE apify_source = 'VCS_API_SCRAPER';\n";
    }
    
    return sql;
}

/**
 * Create exact batch files for fund import
 */
function createExactFundBatches(funds) {
    console.log('\n📁 === CREATING EXACT FUND BATCH FILES ===');
    
    const totalBatches = Math.ceil(funds.length / CONFIG.batchSize);
    console.log(`📊 Creating ${totalBatches} exact batch files (${CONFIG.batchSize} records each)`);
    
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
        
        const batchSQL = generateExactFundUpsertSQL(batchFunds, batchInfo);
        const fileName = `${CONFIG.batchPrefix}${batchNumber.toString().padStart(2, '0')}.sql`;
        
        fs.writeFileSync(fileName, batchSQL);
        console.log(`✅ Created: ${fileName} (${batchFunds.length} records)`);
    }
    
    return totalBatches;
}

/**
 * Main processing function
 */
function createExactVCSFundImporter() {
    console.log('\n🚀 === CREATING EXACT VCS FUND IMPORTER ===');
    
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
        
        // Create single large exact file
        console.log('\n💰 Creating single exact UPSERT file...');
        const sqlContent = generateExactFundUpsertSQL(funds);
        fs.writeFileSync(CONFIG.outputFile, sqlContent);
        console.log(`📄 Exact SQL saved to: ${CONFIG.outputFile}`);
        
        // Create exact batch files  
        const totalBatches = createExactFundBatches(funds);
        
        console.log('\n🎉 === EXACT VCS FUND IMPORTER CREATED ===');
        console.log(`📊 Processed: ${funds.length} fund records`);
        console.log(`📁 Single file: ${CONFIG.outputFile}`);
        console.log(`📁 Batch files: ${CONFIG.batchPrefix}01.sql to ${CONFIG.batchPrefix}${totalBatches.toString().padStart(2, '0')}.sql`);
        console.log('\n✅ EXACT SCHEMA MAPPING:');
        console.log('• company_id → VCS operInstId');
        console.log('• fund_name → VCS fundNm'); 
        console.log('• fund_size → VCS formTotamt (converted to KRW)');
        console.log('• establishment_date → VCS regDd');
        console.log('• fund_status → Active/Expired (based on expiry)');
        console.log('• representative → VCS operInstNm');
        console.log('• fund_id → VCS fundId');
        console.log('• company_name → VCS operInstNm');
        console.log('• investment_detail → VCS investment fields');
        console.log('• expiry_date → VCS expDd');
        console.log('• notes → JSON with all VCS metadata');
        console.log('\n🚀 Ready to import:');
        console.log('1. Start with vcs_funds_exact_batch_01.sql');
        console.log('2. Perfect schema match - should work flawlessly!');
        
    } catch (error) {
        console.error('💥 Error creating exact VCS fund importer:', error);
    }
}

// Execute if run directly
if (require.main === module) {
    createExactVCSFundImporter();
}

module.exports = {
    createExactVCSFundImporter,
    mapFundToExactSchema
}; 