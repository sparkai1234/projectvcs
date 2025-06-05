/**
 * 🔄 VCS UPSERT SQL GENERATOR
 * ===========================
 * 
 * Generates UPSERT SQL that handles duplicate company_ids properly
 * Uses ON CONFLICT DO UPDATE to insert new or update existing records
 */

const fs = require('fs');
const path = require('path');

console.log('🔄 Creating VCS UPSERT SQL that handles duplicates...');

/**
 * Configuration
 */
const CONFIG = {
    dataDir: 'vcs_api_data',
    outputFile: 'vcs_data_upsert.sql'
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
 * Generate UPSERT SQL INSERT statements
 */
function generateUpsertSQL(investors) {
    console.log('\n🔄 === GENERATING UPSERT SQL ===');
    
    let sql = '-- VCS Data UPSERT Import SQL (Handles Duplicates)\n';
    sql += '-- Uses ON CONFLICT DO UPDATE to insert new or update existing records\n';
    sql += '-- Generated from VCS API Scraper data\n';
    sql += `-- Generated at: ${new Date().toISOString()}\n`;
    sql += '-- Schema: Matches actual vc_table structure\n\n';
    
    if (investors.length === 0) {
        sql += '-- No investor data to import\n';
        return sql;
    }
    
    sql += '-- INVESTORS DATA (UPSERT - Safe for Duplicates)\n';
    sql += `-- Processing ${investors.length} investor records\n`;
    sql += '-- Will INSERT new records or UPDATE existing ones based on company_id\n\n';
    
    investors.forEach((investor, index) => {
        const mapped = mapInvestorToSchema(investor);
        
        sql += `-- Record ${index + 1}: ${mapped.company_name}\n`;
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
        
        if ((index + 1) % 50 === 0) {
            sql += `-- Processed ${index + 1} investors so far...\n\n`;
        }
    });
    
    sql += '-- UPSERT completed!\n';
    sql += `-- Total investors processed: ${investors.length}\n`;
    sql += '-- Records were either inserted (if new) or updated (if existing)\n\n';
    
    sql += '-- Verify the import results\n';
    sql += 'SELECT \n';
    sql += "  'VCS UPSERT Import Completed' as status,\n";
    sql += '  COUNT(*) as total_vcs_records,\n';
    sql += '  COUNT(DISTINCT company_id) as unique_companies,\n';
    sql += '  MIN(import_date) as first_import,\n';
    sql += '  MAX(import_date) as last_import\n';
    sql += "FROM vc_table WHERE apify_source = 'VCS_API_SCRAPER';\n";
    
    return sql;
}

/**
 * Main processing function
 */
function createUpsertSQL() {
    console.log('\n🚀 === CREATING VCS UPSERT SQL ===');
    
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
        
        // Generate UPSERT SQL
        const sqlContent = generateUpsertSQL(investors);
        fs.writeFileSync(CONFIG.outputFile, sqlContent);
        console.log(`📄 UPSERT SQL saved to: ${CONFIG.outputFile}`);
        
        console.log('\n🎉 === VCS UPSERT SQL CREATED ===');
        console.log(`📊 Processed: ${investors.length} investor records`);
        console.log(`📁 Output: ${CONFIG.outputFile}`);
        console.log('\n🚀 Next steps:');
        console.log('1. Test with vcs_upsert_import.sql first (3 records)');
        console.log('2. If test works, run the full vcs_data_upsert.sql');
        console.log('3. This will safely handle any duplicate records');
        console.log('4. New records will be inserted, existing ones updated');
        
    } catch (error) {
        console.error('💥 Error creating UPSERT SQL:', error);
    }
}

// Execute if run directly
if (require.main === module) {
    createUpsertSQL();
}

module.exports = {
    createUpsertSQL,
    mapInvestorToSchema
}; 