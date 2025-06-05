/**
 * 🔄 VCS UPSERT BATCH CREATOR
 * ===========================
 * 
 * Splits large UPSERT SQL into smaller batches that work with Supabase SQL Editor
 * Creates manageable 50-record batches for safe import
 */

const fs = require('fs');
const path = require('path');

console.log('🔄 Creating VCS UPSERT batches for SQL Editor...');

/**
 * Configuration
 */
const CONFIG = {
    dataDir: 'vcs_api_data',
    batchSize: 50, // Records per batch file
    outputPrefix: 'vcs_upsert_batch_'
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
 * Map VCS API data to actual vc_table schema
 */
function mapInvestorToSchema(apiData) {
    // Helper function to parse Korean year format (e.g., "6년 1개월" -> 2019)
    function parseKoreanYear(foundYy) {
        if (!foundYy || foundYy === '0' || foundYy === '') return null;
        
        // Extract numeric part from strings like "6년 1개월"
        const numericMatch = foundYy.match(/(\d+)년/);
        if (numericMatch) {
            const yearsAgo = parseInt(numericMatch[1]);
            // Calculate the founding year (current year - years ago)
            const currentYear = new Date().getFullYear();
            const foundingYear = currentYear - yearsAgo;
            return `${foundingYear}-01-01`;
        }
        
        // If it's already a numeric year
        const numericYear = parseInt(foundYy);
        if (!isNaN(numericYear) && numericYear > 1980 && numericYear <= new Date().getFullYear()) {
            return `${numericYear}-01-01`;
        }
        
        return null;
    }
    
    return {
        // Core identification (exact matches)
        company_id: apiData.operInstId || '',
        company_name: apiData.operInstNm || '',
        representative: apiData.repNm || '',
        
        // Date field (match established_date) - FIXED
        established_date: parseKoreanYear(apiData.foundYy),
        
        // Location and contact
        location: apiData.sigunguNm || '', // Use location field
        zip_code: apiData.headofcZipcd || '',
        
        // Company details
        company_type: apiData.operInstTpNm || '', // Use company_type field
        industry: apiData.comIndNm || '',
        
        // Financial information  
        operating_amount: apiData.operBoundAmt ? parseFloat(apiData.operBoundAmt) : null,
        founded: apiData.foundYy || '', // Keep original format for founded field
        
        // Status and metadata
        status: 'Active',
        apify_source: 'VCS_API_SCRAPER', // Use apify_source field
        
        // JSON fields for additional data
        contact_info: JSON.stringify({
            phone: apiData.telno || '',
            address: apiData.headofcAddr || '',
            zip_code: apiData.headofcZipcd || ''
        }),
        
        disclosure_data: JSON.stringify({
            // VCS specific fields
            operator_type_code: apiData.operInstTpCd || '',
            operator_type_name: apiData.operInstTpNm || '',
            operating_scale_code: apiData.operScaleCd || '',
            business_category_code: apiData.comBzcarrCd || '',
            strategy_planner: apiData.strtplanerYn === 'Y' ? 'Yes' : 'No',
            professional_angel: apiData.pfAnglYn === 'Y' ? 'Yes' : 'No',
            investment_character: apiData.invstCharcNm || '',
            operating_amount_text: apiData.operBoundAmt ? `${apiData.operBoundAmt}억원` : '',
            source_url: 'https://www.vcs.go.kr/web/portal/investor/search',
            extracted_at: new Date().toISOString(),
            // Store original founded year for reference
            founded_original: apiData.foundYy || ''
        }),
        
        // Timestamps
        import_date: new Date().toISOString()
    };
}

/**
 * Generate UPSERT SQL for a batch of investors
 */
function generateBatchUpsertSQL(investors, batchNumber, totalBatches) {
    const startRecord = (batchNumber - 1) * CONFIG.batchSize + 1;
    const endRecord = Math.min(batchNumber * CONFIG.batchSize, startRecord + investors.length - 1);
    
    let sql = `-- VCS UPSERT Batch ${batchNumber}/${totalBatches} (Records ${startRecord}-${endRecord})\n`;
    sql += '-- Uses ON CONFLICT DO UPDATE to insert new or update existing records\n';
    sql += '-- Safe to run multiple times - handles duplicates gracefully\n';
    sql += `-- Generated at: ${new Date().toISOString()}\n\n`;
    
    investors.forEach((investor, index) => {
        const mapped = mapInvestorToSchema(investor);
        const recordNumber = startRecord + index;
        
        sql += `-- Record ${recordNumber}: ${mapped.company_name}\n`;
        sql += `INSERT INTO vc_table (\n`;
        sql += `  company_id, company_name, representative, established_date,\n`;
        sql += `  location, zip_code, company_type, industry,\n`;
        sql += `  operating_amount, founded, status, apify_source,\n`;
        sql += `  contact_info, disclosure_data, import_date\n`;
        sql += `) VALUES (\n`;
        sql += `  '${mapped.company_id}',\n`;
        sql += `  '${mapped.company_name.replace(/'/g, "''")}',\n`;
        sql += `  '${mapped.representative.replace(/'/g, "''")}',\n`;
        sql += `  ${mapped.established_date ? `'${mapped.established_date}'` : 'NULL'},\n`;
        sql += `  '${mapped.location.replace(/'/g, "''")}',\n`;
        sql += `  '${mapped.zip_code}',\n`;
        sql += `  '${mapped.company_type.replace(/'/g, "''")}',\n`;
        sql += `  '${mapped.industry.replace(/'/g, "''")}',\n`;
        sql += `  ${mapped.operating_amount || 'NULL'},\n`;
        sql += `  '${mapped.founded}',\n`;
        sql += `  '${mapped.status}',\n`;
        sql += `  '${mapped.apify_source}',\n`;
        sql += `  '${mapped.contact_info.replace(/'/g, "''")}'::jsonb,\n`;
        sql += `  '${mapped.disclosure_data.replace(/'/g, "''")}'::jsonb,\n`;
        sql += `  '${mapped.import_date}'\n`;
        sql += `)\n`;
        sql += `ON CONFLICT (company_id) DO UPDATE SET\n`;
        sql += `  company_name = EXCLUDED.company_name,\n`;
        sql += `  representative = EXCLUDED.representative,\n`;
        sql += `  established_date = EXCLUDED.established_date,\n`;
        sql += `  location = EXCLUDED.location,\n`;
        sql += `  zip_code = EXCLUDED.zip_code,\n`;
        sql += `  company_type = EXCLUDED.company_type,\n`;
        sql += `  industry = EXCLUDED.industry,\n`;
        sql += `  operating_amount = EXCLUDED.operating_amount,\n`;
        sql += `  founded = EXCLUDED.founded,\n`;
        sql += `  status = EXCLUDED.status,\n`;
        sql += `  apify_source = EXCLUDED.apify_source,\n`;
        sql += `  contact_info = EXCLUDED.contact_info,\n`;
        sql += `  disclosure_data = EXCLUDED.disclosure_data,\n`;
        sql += `  import_date = EXCLUDED.import_date,\n`;
        sql += `  updated_at = NOW();\n\n`;
    });
    
    sql += `-- Batch ${batchNumber} completed! ${investors.length} records processed.\n`;
    sql += `-- Progress: ${endRecord}/${(batchNumber === totalBatches ? endRecord : 717)} total records\n\n`;
    
    if (batchNumber === totalBatches) {
        sql += '-- Final verification query\n';
        sql += 'SELECT \n';
        sql += "  'VCS UPSERT Batch Import Completed' as status,\n";
        sql += '  COUNT(*) as total_vcs_records,\n';
        sql += '  COUNT(DISTINCT company_id) as unique_companies,\n';
        sql += '  MAX(updated_at) as last_updated\n';
        sql += "FROM vc_table WHERE apify_source = 'VCS_API_SCRAPER';\n";
    }
    
    return sql;
}

/**
 * Main processing function
 */
function createUpsertBatches() {
    console.log('\n🚀 === CREATING VCS UPSERT BATCHES ===');
    
    try {
        // Check if source directory exists
        if (!fs.existsSync(CONFIG.dataDir)) {
            console.error(`❌ Source directory not found: ${CONFIG.dataDir}`);
            console.error('💡 Run "npm run vcs:api-file" first to scrape the data');
            return;
        }
        
        // Read investor data
        const investorsFile = path.join(CONFIG.dataDir, 'investors_complete.json');
        if (!fs.existsSync(investorsFile)) {
            console.error(`❌ Investors file not found: ${investorsFile}`);
            return;
        }
        
        const investorsData = readJSONFile(investorsFile);
        if (!investorsData || !investorsData.data) {
            console.error('❌ Invalid investors data format');
            return;
        }
        
        const investors = investorsData.data;
        console.log(`📊 Found ${investors.length} investors to process`);
        
        // Calculate batches
        const totalBatches = Math.ceil(investors.length / CONFIG.batchSize);
        console.log(`📁 Creating ${totalBatches} batch files (${CONFIG.batchSize} records each)`);
        
        // Create batch files
        for (let i = 0; i < totalBatches; i++) {
            const batchNumber = i + 1;
            const startIndex = i * CONFIG.batchSize;
            const endIndex = Math.min(startIndex + CONFIG.batchSize, investors.length);
            const batchInvestors = investors.slice(startIndex, endIndex);
            
            const batchSQL = generateBatchUpsertSQL(batchInvestors, batchNumber, totalBatches);
            const fileName = `${CONFIG.outputPrefix}${batchNumber.toString().padStart(2, '0')}.sql`;
            
            fs.writeFileSync(fileName, batchSQL);
            console.log(`✅ Created: ${fileName} (${batchInvestors.length} records)`);
        }
        
        console.log('\n🎉 === VCS UPSERT BATCHES CREATED ===');
        console.log(`📊 Total: ${totalBatches} batch files`);
        console.log(`📁 Files: ${CONFIG.outputPrefix}01.sql to ${CONFIG.outputPrefix}${totalBatches.toString().padStart(2, '0')}.sql`);
        console.log('\n🚀 Next steps:');
        console.log('1. Run batch files in order (01, 02, 03, etc.)');
        console.log('2. Each file is small enough for Supabase SQL Editor');
        console.log('3. Safe to re-run any batch if needed (UPSERT logic)');
        console.log('4. Final batch will show completion status');
        
    } catch (error) {
        console.error('💥 Error creating UPSERT batches:', error);
    }
}

// Execute if run directly
if (require.main === module) {
    createUpsertBatches();
}

module.exports = {
    createUpsertBatches
}; 