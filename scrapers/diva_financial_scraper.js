/**
 * 🏦 DIVA FINANCIAL DATA SCRAPER
 * ============================
 * 
 * Scrapes financial data from http://diva.kvca.or.kr/div/dii/DivItmFsInq
 * - Balance Sheet (재무상태표): Assets, Liabilities, Equity
 * - Income Statement (손익계산서): Revenue, Expenses, Profit
 * - Historical data from 2002-2024
 * 
 * HIGH-VALUE DATA: Financial health, fund size assessment, performance analysis
 */

const https = require('https');
const { createClient } = require('@supabase/supabase-js');

// Configuration
const CONFIG = {
    maxPages: 10,
    delayBetweenRequests: 2000,
    timeout: 30000,
    userAgent: 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
    baseUrl: 'http://diva.kvca.or.kr/div/dii/DivItmFsInq',
    targetYears: [2024, 2023, 2022, 2021, 2020],  // Start with recent years
    targetStatements: ['balance_sheet', 'income_statement']
};

// Initialize Supabase client
const supabaseUrl = process.env.SUPABASE_URL || 'https://udfgtccxbqmalgpqyxzz.supabase.co';
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY;

if (!supabaseKey) {
    console.error('❌ SUPABASE_SERVICE_ROLE_KEY environment variable is required');
    process.exit(1);
}

const supabase = createClient(supabaseUrl, supabaseKey);

console.log('🏦 DIVA Financial Scraper Started');
console.log(`📊 Target Years: ${CONFIG.targetYears.join(', ')}`);
console.log(`📋 Target Statements: ${CONFIG.targetStatements.join(', ')}`);

/**
 * Make HTTP request with proper error handling
 */
async function makeRequest(url, options = {}) {
    return new Promise((resolve, reject) => {
        const requestOptions = {
            headers: {
                'User-Agent': CONFIG.userAgent,
                'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,*/*;q=0.8',
                'Accept-Language': 'ko-KR,ko;q=0.9,en;q=0.8',
                'Accept-Encoding': 'gzip, deflate',
                'Connection': 'keep-alive',
                'Upgrade-Insecure-Requests': '1',
                ...options.headers
            },
            timeout: CONFIG.timeout
        };

        console.log(`📡 Requesting: ${url}`);

        const req = https.request(url, requestOptions, (res) => {
            let data = '';
            
            res.on('data', (chunk) => {
                data += chunk;
            });
            
            res.on('end', () => {
                console.log(`✅ Response received: ${res.statusCode} (${data.length} chars)`);
                resolve({
                    statusCode: res.statusCode,
                    headers: res.headers,
                    body: data
                });
            });
        });

        req.on('error', (err) => {
            console.error(`❌ Request failed: ${err.message}`);
            reject(err);
        });

        req.on('timeout', () => {
            req.destroy();
            reject(new Error('Request timeout'));
        });

        req.end();
    });
}

/**
 * Parse financial data from HTML response
 */
function parseFinancialData(html, year, statementType) {
    const financialRecords = [];
    
    try {
        // This is a simplified parser - in reality, you'd need to parse the actual HTML structure
        // The DIVA site likely uses tables or structured data that we can extract
        
        console.log(`🔍 Parsing ${statementType} data for year ${year}`);
        
        // Look for table structures with financial data
        const tableRegex = /<table[^>]*>(.*?)<\/table>/gis;
        const tables = html.match(tableRegex) || [];
        
        console.log(`Found ${tables.length} tables in response`);
        
        for (const table of tables) {
            // Parse table rows for financial data
            const rowRegex = /<tr[^>]*>(.*?)<\/tr>/gis;
            const rows = table.match(rowRegex) || [];
            
            for (const row of rows) {
                // Extract company data from each row
                const cellRegex = /<td[^>]*>(.*?)<\/td>/gis;
                const cells = [];
                let match;
                
                while ((match = cellRegex.exec(row)) !== null) {
                    // Clean up cell content
                    const cellContent = match[1]
                        .replace(/<[^>]*>/g, '')  // Remove HTML tags
                        .replace(/&nbsp;/g, ' ')  // Replace &nbsp;
                        .trim();
                    cells.push(cellContent);
                }
                
                // Process cells based on statement type
                if (cells.length >= 6 && cells[0] && cells[0] !== '회사명') {
                    const record = parseFinancialRow(cells, year, statementType);
                    if (record) {
                        financialRecords.push(record);
                    }
                }
            }
        }
        
        console.log(`✅ Parsed ${financialRecords.length} financial records`);
        return financialRecords;
        
    } catch (error) {
        console.error(`❌ Error parsing financial data: ${error.message}`);
        return [];
    }
}

/**
 * Parse individual financial data row
 */
function parseFinancialRow(cells, year, statementType) {
    try {
        const companyName = cells[0];
        const sourceType = cells[1] || '고유계정';  // 고유계정/조합
        const fiscalMonth = parseInt(cells[2]) || 12;
        const accountingStandard = cells[3] || '일반';
        const financialType = cells[4] || '개별';
        
        // Generate company ID from company name
        const companyId = generateCompanyId(companyName);
        
        const record = {
            company_id: companyId,
            company_name: companyName,
            fiscal_year: year,
            fiscal_month: fiscalMonth,
            accounting_standard: accountingStandard,
            financial_type: financialType,
            source_type: sourceType,
            extracted_at: new Date().toISOString(),
            source_url: CONFIG.baseUrl,
            data_quality_score: 85.0  // Base score
        };
        
        if (statementType === 'balance_sheet') {
            // Balance Sheet fields
            record.total_assets = parseAmount(cells[5]);
            record.startup_investment_assets = parseAmount(cells[6]);
            record.total_liabilities = parseAmount(cells[7]);
            record.capital_stock = parseAmount(cells[8]);
            record.total_equity = parseAmount(cells[9]);
            
            // Calculate ratios
            if (record.total_assets && record.total_liabilities) {
                record.debt_to_equity_ratio = record.total_liabilities / (record.total_assets - record.total_liabilities);
            }
            if (record.total_assets && record.startup_investment_assets) {
                record.investment_asset_ratio = record.startup_investment_assets / record.total_assets;
            }
            
        } else if (statementType === 'income_statement') {
            // Income Statement fields
            record.operating_revenue = parseAmount(cells[5]);
            record.operating_expenses = parseAmount(cells[6]);
            record.operating_profit = parseAmount(cells[7]);
            record.profit_before_tax = parseAmount(cells[8]);
            record.net_income = parseAmount(cells[9]);
        }
        
        return record;
        
    } catch (error) {
        console.error(`❌ Error parsing row: ${error.message}`);
        return null;
    }
}

/**
 * Parse financial amounts (handle Korean number formats)
 */
function parseAmount(amountStr) {
    if (!amountStr || amountStr === '-' || amountStr === '') {
        return null;
    }
    
    // Remove commas and parse as integer
    const cleanAmount = amountStr.replace(/,/g, '');
    const amount = parseInt(cleanAmount);
    
    return isNaN(amount) ? null : amount;
}

/**
 * Generate company ID from company name
 */
function generateCompanyId(companyName) {
    // Create a consistent ID from company name
    // This should match the pattern used in vc_table if possible
    return companyName
        .replace(/[^\w가-힣]/g, '')  // Keep only alphanumeric and Korean chars
        .substring(0, 50);
}

/**
 * Save financial records to Supabase
 */
async function saveFinancialRecords(records) {
    if (records.length === 0) {
        console.log('⚠️ No records to save');
        return { success: true, count: 0 };
    }
    
    try {
        console.log(`💾 Saving ${records.length} financial records to Supabase...`);
        
        // Insert records in batches to avoid timeout
        const batchSize = 50;
        let totalInserted = 0;
        
        for (let i = 0; i < records.length; i += batchSize) {
            const batch = records.slice(i, i + batchSize);
            
            const { data, error } = await supabase
                .from('diva_financial_raw')
                .upsert(batch, {
                    onConflict: 'company_id,fiscal_year,fiscal_month,source_type',
                    ignoreDuplicates: false
                });
            
            if (error) {
                console.error(`❌ Database error for batch ${i / batchSize + 1}:`, error);
                throw error;
            }
            
            totalInserted += batch.length;
            console.log(`✅ Batch ${i / batchSize + 1}: ${batch.length} records saved`);
            
            // Brief delay between batches
            await new Promise(resolve => setTimeout(resolve, 100));
        }
        
        console.log(`🎉 Successfully saved ${totalInserted} financial records!`);
        return { success: true, count: totalInserted };
        
    } catch (error) {
        console.error('❌ Error saving to database:', error);
        return { success: false, error: error.message };
    }
}

/**
 * Scrape financial data for a specific year and statement type
 */
async function scrapeFinancialData(year, statementType) {
    console.log(`\n📊 === SCRAPING ${statementType.toUpperCase()} FOR ${year} ===`);
    
    try {
        // Construct URL for specific year and statement type
        let url = `${CONFIG.baseUrl}?year=${year}`;
        
        // Add statement type parameters
        if (statementType === 'balance_sheet') {
            url += '&statement=bs';  // Balance Sheet
        } else if (statementType === 'income_statement') {
            url += '&statement=is';  // Income Statement
        }
        
        const response = await makeRequest(url);
        
        if (response.statusCode !== 200) {
            console.error(`❌ HTTP ${response.statusCode} for ${year} ${statementType}`);
            return [];
        }
        
        const records = parseFinancialData(response.body, year, statementType);
        
        if (records.length > 0) {
            const saveResult = await saveFinancialRecords(records);
            if (saveResult.success) {
                console.log(`✅ ${year} ${statementType}: ${saveResult.count} records saved`);
            }
        }
        
        return records;
        
    } catch (error) {
        console.error(`❌ Error scraping ${year} ${statementType}:`, error.message);
        return [];
    }
}

/**
 * Main scraping function
 */
async function scrapeAllFinancialData() {
    console.log('\n🚀 === STARTING DIVA FINANCIAL DATA SCRAPING ===');
    
    const startTime = Date.now();
    let totalRecords = 0;
    let totalErrors = 0;
    
    try {
        // Test database connection
        console.log('🔌 Testing Supabase connection...');
        const { data, error } = await supabase
            .from('diva_financial_raw')
            .select('count(*)', { count: 'exact', head: true });
        
        if (error) {
            console.error('❌ Supabase connection failed:', error);
            return;
        }
        
        console.log(`✅ Connected to Supabase. Current records: ${data || 'unknown'}`);
        
        // Scrape each year and statement type
        for (const year of CONFIG.targetYears) {
            for (const statementType of CONFIG.targetStatements) {
                try {
                    const records = await scrapeFinancialData(year, statementType);
                    totalRecords += records.length;
                    
                    // Rate limiting
                    console.log(`⏱️ Waiting ${CONFIG.delayBetweenRequests}ms...`);
                    await new Promise(resolve => setTimeout(resolve, CONFIG.delayBetweenRequests));
                    
                } catch (error) {
                    console.error(`❌ Failed to scrape ${year} ${statementType}:`, error.message);
                    totalErrors++;
                }
            }
        }
        
        const duration = (Date.now() - startTime) / 1000;
        
        console.log('\n🎉 === FINANCIAL DATA SCRAPING COMPLETED ===');
        console.log(`📊 Total Records: ${totalRecords}`);
        console.log(`❌ Total Errors: ${totalErrors}`);
        console.log(`⏱️ Duration: ${duration.toFixed(2)} seconds`);
        
        if (totalRecords > 0) {
            console.log('🚀 Next steps:');
            console.log('1. Create investment performance scraper');
            console.log('2. Build financial analysis queries');
            console.log('3. Create financial health scoring');
        }
        
    } catch (error) {
        console.error('💥 Critical error in main scraping function:', error);
        throw error;
    }
}

// Execute if run directly
if (require.main === module) {
    (async () => {
        try {
            await scrapeAllFinancialData();
            console.log('✅ Financial scraping completed successfully!');
        } catch (error) {
            console.error('💥 Financial scraping failed:', error);
            process.exit(1);
        }
    })();
}

module.exports = {
    scrapeAllFinancialData,
    scrapeFinancialData,
    parseFinancialData,
    saveFinancialRecords,
    CONFIG
}; 