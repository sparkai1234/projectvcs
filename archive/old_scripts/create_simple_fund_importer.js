/**
 * 💰 SIMPLE VCS FUND IMPORTER
 * ===========================
 * 
 * Simple INSERT version without UPSERT conflicts
 * Matches exact fund_table schema but uses basic INSERTs
 */

const fs = require('fs');
const path = require('path');

console.log('💰 Creating SIMPLE VCS Fund import for fund_table...');

/**
 * Configuration
 */
const CONFIG = {
    dataDir: 'vcs_api_data',
    outputFile: 'vcs_funds_import_simple.sql',
    batchSize: 50,
    batchPrefix: 'vcs_funds_simple_batch_'
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
 * Same mapping as exact version but for simple inserts
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
 * Generate SIMPLE INSERT SQL for funds
 * No UPSERT logic - just clean inserts
 */
function generateSimpleFundInsertSQL(funds, batchInfo = null) {
    console.log('\n💰 === GENERATING SIMPLE FUND INSERT SQL ===');
    
    let sql = '';
    
    if (batchInfo) {
        sql += `-- VCS Fund SIMPLE INSERT Batch ${batchInfo.number}/${batchInfo.total} (Records ${batchInfo.start}-${batchInfo.end})\n`;
        sql += '-- SIMPLE: Basic INSERTs without conflict handling\n';
    } else {
        sql += '-- VCS Fund Data SIMPLE INSERT SQL\n';
        sql += '-- SIMPLE: Basic INSERT statements\n';
    }
    
    sql += '-- Generated from VCS API Scraper fund data\n';
    sql += `-- Generated at: ${new Date().toISOString()}\n`;
    sql += '-- Schema: Matches fund_table structure\n\n';
    
    if (funds.length === 0) {
        sql += '-- No fund data to import\n';
        return sql;
    }
    
    sql += '-- SIMPLE FUND DATA (INSERT - New Records Only)\n';
    sql += `-- Processing ${funds.length} fund records\n`;
    sql += '-- Will INSERT new records\n\n';
    
    funds.forEach((fund, index) => {
        const mapped = mapFundToSchema(fund);
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
        sql += `);\n\n`;
    });
    
    if (batchInfo) {
        sql += `-- Simple Batch ${batchInfo.number} completed! ${funds.length} fund records processed.\n`;
        sql += `-- Progress: ${batchInfo.end}/${(batchInfo.number === batchInfo.total ? batchInfo.end : 3689)} total records\n\n`;
        
        if (batchInfo.number === batchInfo.total) {
            sql += '-- Final verification query\n';
            sql += 'SELECT \n';
            sql += "  'VCS Fund SIMPLE Import Completed' as status,\n";
            sql += '  COUNT(*) as total_vcs_funds,\n';
            sql += '  COUNT(DISTINCT company_id) as unique_operators,\n';
            sql += '  SUM(fund_size) / 1000000000 as total_fund_size_billions_krw,\n';
            sql += '  MAX(import_date) as last_imported\n';
            sql += "FROM fund_table WHERE apify_source = 'VCS_API_SCRAPER';\n";
        }
    } else {
        sql += '-- Simple import completed!\n';
        sql += `-- Total funds processed: ${funds.length}\n`;
        sql += '-- All records inserted as new entries\n\n';
        
        sql += '-- Verification query\n';
        sql += 'SELECT \n';
        sql += "  'VCS Fund SIMPLE Import Completed' as status,\n";
        sql += '  COUNT(*) as total_vcs_funds,\n';
        sql += '  COUNT(DISTINCT company_id) as unique_operators,\n';
        sql += '  SUM(fund_size) / 1000000000 as total_fund_size_billions_krw\n';
        sql += "FROM fund_table WHERE apify_source = 'VCS_API_SCRAPER';\n";
    }
    
    return sql;
}

/**
 * Create simple batch files for fund import
 */
function createSimpleFundBatches(funds) {
    console.log('\n📁 === CREATING SIMPLE FUND BATCH FILES ===');
    
    const totalBatches = Math.ceil(funds.length / CONFIG.batchSize);
    console.log(`📊 Creating ${totalBatches} simple batch files (${CONFIG.batchSize} records each)`);
    
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
        
        const batchSQL = generateSimpleFundInsertSQL(batchFunds, batchInfo);
        const fileName = `${CONFIG.batchPrefix}${batchNumber.toString().padStart(2, '0')}.sql`;
        
        fs.writeFileSync(fileName, batchSQL);
        console.log(`✅ Created: ${fileName} (${batchFunds.length} records)`);
    }
    
    return totalBatches;
}

/**
 * Main processing function
 */
function createSimpleVCSFundImporter() {
    console.log('\n🚀 === CREATING SIMPLE VCS FUND IMPORTER ===');
    
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
        
        // Create single large simple file
        console.log('\n💰 Creating single simple INSERT file...');
        const sqlContent = generateSimpleFundInsertSQL(funds);
        fs.writeFileSync(CONFIG.outputFile, sqlContent);
        console.log(`📄 Simple SQL saved to: ${CONFIG.outputFile}`);
        
        // Create simple batch files  
        const totalBatches = createSimpleFundBatches(funds);
        
        console.log('\n🎉 === SIMPLE VCS FUND IMPORTER CREATED ===');
        console.log(`📊 Processed: ${funds.length} fund records`);
        console.log(`📁 Single file: ${CONFIG.outputFile}`);
        console.log(`📁 Batch files: ${CONFIG.batchPrefix}01.sql to ${CONFIG.batchPrefix}${totalBatches.toString().padStart(2, '0')}.sql`);
        console.log('\n✅ SIMPLE APPROACH:');
        console.log('• Uses basic INSERT statements');
        console.log('• No conflict resolution needed');
        console.log('• Perfect schema match');
        console.log('• Will create new records only');
        console.log('\n🚀 Ready to import:');
        console.log('1. Start with vcs_funds_simple_batch_01.sql');
        console.log('2. Simple INSERT - should work without conflicts!');
        
    } catch (error) {
        console.error('💥 Error creating simple VCS fund importer:', error);
    }
}

// Execute if run directly
if (require.main === module) {
    createSimpleVCSFundImporter();
}

module.exports = {
    createSimpleVCSFundImporter,
    mapFundToSchema
}; 