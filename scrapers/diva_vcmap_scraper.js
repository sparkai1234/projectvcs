/**
 * 🗺️ DIVA VC MAP SCRAPER
 * ======================
 * 
 * Scrapes VC MAP data from http://diva.kvca.or.kr/div/dii/DivItmVcmapInq
 * - Company rankings by personnel and professional staff
 * - Investment patterns (industry, region, company age)
 * - Setup dates, registration info, fund status
 * - Investment amounts and geographic analysis
 * 
 * HIGH-VALUE DATA: Competitive intelligence, market positioning, investment patterns
 */

require('dotenv').config();
const https = require('https');
const http = require('http');
const { createClient } = require('@supabase/supabase-js');

// Configuration
const CONFIG = {
    baseUrl: 'http://diva.kvca.or.kr/div/dii/DivItmVcmapInq',
    timeout: 30000,
    userAgent: 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
    delayBetweenRequests: 2000,
    maxPages: 20,
    // Different sorting criteria available
    sortCriteria: ['인력총수', '전문인력수'], // Total personnel, Professional staff
    // Different map views available
    mapTypes: [
        '인력현황',        // Personnel status
        '설립일,등록일',   // Setup/registration dates
        '운영조합현황',    // Operating fund status
        '투자금액',        // Investment amounts
        '업종별투자패턴',  // Industry investment patterns
        '지역별투자패턴',  // Regional investment patterns
        '업력별투자패턴'   // Company age investment patterns
    ]
};

// Initialize Supabase client
const supabaseUrl = process.env.SUPABASE_URL || 'https://udfgtccxbqmalgpqyxzz.supabase.co';
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY;

if (!supabaseKey) {
    console.error('❌ SUPABASE_SERVICE_ROLE_KEY environment variable is required');
    process.exit(1);
}

const supabase = createClient(supabaseUrl, supabaseKey);

console.log('🗺️ DIVA VC MAP Scraper Started');
console.log(`📊 Sort Criteria: ${CONFIG.sortCriteria.join(', ')}`);
console.log(`🎯 Map Types: ${CONFIG.mapTypes.join(', ')}`);

/**
 * Make HTTP request to get page content
 */
async function makeRequest(url, options = {}) {
    return new Promise((resolve, reject) => {
        const requestOptions = {
            headers: {
                'User-Agent': CONFIG.userAgent,
                'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,*/*;q=0.8',
                'Accept-Language': 'ko-KR,ko;q=0.9,en;q=0.8',
                'Connection': 'keep-alive',
                'Referer': CONFIG.baseUrl,
                ...options.headers
            },
            timeout: CONFIG.timeout
        };

        console.log(`📡 Requesting VC MAP data: ${url.substring(0, 100)}...`);

        const req = http.request(url, requestOptions, (res) => {
            let data = '';
            
            res.on('data', (chunk) => {
                data += chunk;
            });
            
            res.on('end', () => {
                console.log(`✅ VC MAP response: ${res.statusCode} (${data.length} chars)`);
                resolve({
                    statusCode: res.statusCode,
                    headers: res.headers,
                    body: data
                });
            });
        });

        req.on('error', (err) => {
            console.error(`❌ VC MAP request failed: ${err.message}`);
            reject(err);
        });

        req.on('timeout', () => {
            req.destroy();
            reject(new Error('VC MAP request timeout'));
        });

        req.end();
    });
}

/**
 * Parse VC MAP data from HTML response
 */
function parseVCMapData(html, mapType, sortBy) {
    const vcMapRecords = [];
    
    try {
        console.log(`🔍 Parsing VC MAP data for ${mapType} (sorted by ${sortBy})`);
        
        // Look for main data table
        const tableRegex = /<table[^>]*>(.*?)<\/table>/gis;
        const tables = html.match(tableRegex) || [];
        
        console.log(`Found ${tables.length} tables in VC MAP response`);
        
        for (const table of tables) {
            // Look for data rows (skip header rows)
            const rowRegex = /<tr[^>]*>(.*?)<\/tr>/gis;
            const rows = table.match(rowRegex) || [];
            
            for (const row of rows) {
                // Extract cell data
                const cellRegex = /<td[^>]*>(.*?)<\/td>/gis;
                const cells = [];
                let match;
                
                while ((match = cellRegex.exec(row)) !== null) {
                    // Clean up cell content
                    const cellContent = match[1]
                        .replace(/<[^>]*>/g, '')  // Remove HTML tags
                        .replace(/&nbsp;/g, ' ')  // Replace &nbsp;
                        .replace(/&amp;/g, '&')  // Replace &amp;
                        .trim();
                    cells.push(cellContent);
                }
                
                // Process cells for VC MAP data
                if (cells.length >= 3 && cells[0] && 
                    !cells[0].includes('순위') && !cells[0].includes('회사명') && 
                    cells[0] !== '' && !isNaN(parseInt(cells[0]))) {
                    
                    const record = parseVCMapRow(cells, mapType, sortBy);
                    if (record) {
                        vcMapRecords.push(record);
                    }
                }
            }
        }
        
        console.log(`✅ Parsed ${vcMapRecords.length} VC MAP records`);
        return vcMapRecords;
        
    } catch (error) {
        console.error(`❌ Error parsing VC MAP data: ${error.message}`);
        return [];
    }
}

/**
 * Parse individual VC MAP row
 */
function parseVCMapRow(cells, mapType, sortBy) {
    try {
        const ranking = parseInt(cells[0]) || null;
        const companyName = cells[1];
        const companyId = generateCompanyId(companyName);
        
        // Base record structure
        const record = {
            company_name: companyName,              // Primary identifier - links to vc_table.company_name
            company_id: companyId,                  // Secondary identifier - for compatibility
            ranking: ranking,
            map_type: mapType,
            sort_criteria: sortBy,
            
            // Personnel data (common fields)
            total_personnel: null,
            professional_personnel: null,
            
            // Investment data
            total_investment_amount: null,
            fund_count: null,
            portfolio_companies_count: null,
            
            // Dates
            establishment_date: null,
            registration_date: null,
            
            // Geographic data
            headquarters_region: null,
            investment_regions: null,
            
            // Investment patterns
            industry_focus: null,
            investment_stage_focus: null,
            target_company_age: null,
            
            // Metadata
            extracted_at: new Date().toISOString(),
            source_url: CONFIG.baseUrl,
            data_source: 'diva_vcmap'
        };
        
        // Parse different data types based on map type
        if (mapType === '인력현황') {
            // Personnel status: [순위, 회사명, 인력총수, 전문인력수]
            record.total_personnel = parseNumber(cells[2]);
            record.professional_personnel = parseNumber(cells[3]);
            
        } else if (mapType === '설립일,등록일') {
            // Setup dates: [순위, 회사명, 설립일, 등록일]
            record.establishment_date = parseDate(cells[2]);
            record.registration_date = parseDate(cells[3]);
            
        } else if (mapType === '운영조합현황') {
            // Fund status: [순위, 회사명, 조합수, 총약정금액]
            record.fund_count = parseNumber(cells[2]);
            record.total_investment_amount = parseAmount(cells[3]);
            
        } else if (mapType === '투자금액') {
            // Investment amounts: [순위, 회사명, 총투자금액, 포트폴리오수]
            record.total_investment_amount = parseAmount(cells[2]);
            record.portfolio_companies_count = parseNumber(cells[3]);
            
        } else if (mapType === '업종별투자패턴') {
            // Industry patterns: [순위, 회사명, 주요업종, 투자비중]
            record.industry_focus = cells[2];
            record.investment_ratio = parsePercentage(cells[3]);
            
        } else if (mapType === '지역별투자패턴') {
            // Regional patterns: [순위, 회사명, 주요지역, 투자비중]
            record.headquarters_region = cells[2];
            record.investment_ratio = parsePercentage(cells[3]);
            
        } else if (mapType === '업력별투자패턴') {
            // Company age patterns: [순위, 회사명, 주요업력, 투자비중]
            record.target_company_age = cells[2];
            record.investment_ratio = parsePercentage(cells[3]);
        }
        
        return record;
        
    } catch (error) {
        console.error(`❌ Error parsing VC MAP row: ${error.message}`);
        console.error(`Row data: ${JSON.stringify(cells)}`);
        return null;
    }
}

/**
 * Parse numbers from Korean text
 */
function parseNumber(numberStr) {
    if (!numberStr || numberStr === '-' || numberStr === '') {
        return null;
    }
    
    // Remove commas and parse
    const cleanNumber = numberStr.replace(/,/g, '');
    const number = parseInt(cleanNumber);
    
    return isNaN(number) ? null : number;
}

/**
 * Parse amounts with Korean units
 */
function parseAmount(amountStr) {
    if (!amountStr || amountStr === '-' || amountStr === '') {
        return null;
    }
    
    // Handle Korean units: 억 (100M), 만 (10K), 천 (1K)
    let multiplier = 1;
    if (amountStr.includes('억')) {
        multiplier = 100000000; // 100 million
        amountStr = amountStr.replace('억', '');
    } else if (amountStr.includes('만')) {
        multiplier = 10000; // 10 thousand
        amountStr = amountStr.replace('만', '');
    } else if (amountStr.includes('천')) {
        multiplier = 1000; // 1 thousand
        amountStr = amountStr.replace('천', '');
    }
    
    // Remove commas and other non-numeric characters except decimal point
    const cleanAmount = amountStr.replace(/[^0-9.-]/g, '');
    const amount = parseFloat(cleanAmount);
    
    return isNaN(amount) ? null : Math.round(amount * multiplier);
}

/**
 * Parse percentage values
 */
function parsePercentage(percentStr) {
    if (!percentStr || percentStr === '-' || percentStr === '') {
        return null;
    }
    
    const cleanPercent = percentStr.replace(/[^0-9.-]/g, '');
    const percent = parseFloat(cleanPercent);
    
    return isNaN(percent) ? null : percent;
}

/**
 * Parse date strings
 */
function parseDate(dateStr) {
    if (!dateStr || dateStr === '-' || dateStr === '') {
        return null;
    }
    
    try {
        // Handle various Korean date formats
        let cleanDate = dateStr.replace(/[^\d-/.]/g, '');
        
        // Convert to ISO format if needed
        if (cleanDate.length === 8) {
            // YYYYMMDD format
            cleanDate = `${cleanDate.substring(0, 4)}-${cleanDate.substring(4, 6)}-${cleanDate.substring(6, 8)}`;
        }
        
        const date = new Date(cleanDate);
        return isNaN(date.getTime()) ? null : date.toISOString().split('T')[0];
        
    } catch (error) {
        return null;
    }
}

/**
 * Generate company ID from company name
 */
function generateCompanyId(companyName) {
    if (!companyName) return null;
    
    return companyName
        .replace(/[^\w가-힣]/g, '')  // Keep only alphanumeric and Korean chars
        .substring(0, 50);
}

/**
 * Save VC MAP records to Supabase
 */
async function saveVCMapRecords(records) {
    if (records.length === 0) {
        console.log('⚠️ No VC MAP records to save');
        return { success: true, count: 0 };
    }
    
    try {
        console.log(`💾 Saving ${records.length} VC MAP records to Supabase...`);
        
        // Insert records in batches
        const batchSize = 50;
        let totalInserted = 0;
        
        for (let i = 0; i < records.length; i += batchSize) {
            const batch = records.slice(i, i + batchSize);
            
            const { data, error } = await supabase
                .from('diva_vcmap_raw')
                .upsert(batch, {
                    onConflict: 'company_name,map_type,sort_criteria',
                    ignoreDuplicates: false
                });
            
            if (error) {
                console.error(`❌ Database error for VC MAP batch ${i / batchSize + 1}:`, error);
                throw error;
            }
            
            totalInserted += batch.length;
            console.log(`✅ VC MAP batch ${i / batchSize + 1}: ${batch.length} records saved`);
            
            // Brief delay between batches
            await new Promise(resolve => setTimeout(resolve, 200));
        }
        
        console.log(`🎉 Successfully saved ${totalInserted} VC MAP records!`);
        return { success: true, count: totalInserted };
        
    } catch (error) {
        console.error('❌ Error saving VC MAP data to database:', error);
        return { success: false, error: error.message };
    }
}

/**
 * Scrape VC MAP data for specific parameters
 */
async function scrapeVCMapData(mapType, sortBy, page = 1) {
    console.log(`\n🗺️ === SCRAPING VC MAP: ${mapType} (${sortBy}) - PAGE ${page} ===`);
    
    try {
        // Construct URL with parameters
        let url = `${CONFIG.baseUrl}?구분=${encodeURIComponent(mapType)}&정렬기준=${encodeURIComponent(sortBy)}`;
        
        if (page > 1) {
            url += `&page=${page}`;
        }
        
        const response = await makeRequest(url);
        
        if (response.statusCode !== 200) {
            console.error(`❌ HTTP ${response.statusCode} for VC MAP ${mapType}`);
            return [];
        }
        
        const records = parseVCMapData(response.body, mapType, sortBy);
        
        if (records.length > 0) {
            const saveResult = await saveVCMapRecords(records);
            if (saveResult.success) {
                console.log(`✅ VC MAP ${mapType}: ${saveResult.count} records saved`);
            }
        }
        
        return records;
        
    } catch (error) {
        console.error(`❌ Error scraping VC MAP ${mapType}:`, error.message);
        return [];
    }
}

/**
 * Main scraping function
 */
async function scrapeAllVCMapData() {
    console.log('\n🚀 === STARTING DIVA VC MAP SCRAPING ===');
    
    const startTime = Date.now();
    let totalRecords = 0;
    let totalErrors = 0;
    
    try {
        // Test database connection with a simple insert test instead of count
        console.log('🔌 Testing Supabase connection...');
        
        try {
            // Try a simple test insert and delete
            const testRecord = {
                company_name: 'CONNECTION_TEST_' + Date.now(),
                company_id: 'TEST',
                ranking: 999,
                map_type: 'connection_test',
                sort_criteria: 'test',
                extracted_at: new Date().toISOString()
            };
            
            const { error: insertError } = await supabase
                .from('diva_vcmap_raw')
                .insert([testRecord]);
            
            if (insertError) {
                console.error('❌ Supabase connection failed:', insertError);
                return;
            }
            
            // Clean up test record
            await supabase
                .from('diva_vcmap_raw')
                .delete()
                .eq('company_name', testRecord.company_name);
            
            console.log('✅ Connected to Supabase. Ready to scrape VC MAP data!');
            
        } catch (connError) {
            console.error('❌ Supabase connection failed:', connError);
            return;
        }
        
        // Scrape each map type and sort criteria combination
        for (const mapType of CONFIG.mapTypes) {
            for (const sortBy of CONFIG.sortCriteria) {
                try {
                    const records = await scrapeVCMapData(mapType, sortBy);
                    totalRecords += records.length;
                    
                    // Rate limiting
                    console.log(`⏱️ Waiting ${CONFIG.delayBetweenRequests}ms...`);
                    await new Promise(resolve => setTimeout(resolve, CONFIG.delayBetweenRequests));
                    
                } catch (error) {
                    console.error(`❌ Failed to scrape VC MAP ${mapType} (${sortBy}):`, error.message);
                    totalErrors++;
                }
            }
        }
        
        const duration = (Date.now() - startTime) / 1000;
        
        console.log('\n🎉 === VC MAP SCRAPING COMPLETED ===');
        console.log(`🗺️ Total VC MAP Records: ${totalRecords}`);
        console.log(`❌ Total Errors: ${totalErrors}`);
        console.log(`⏱️ Duration: ${duration.toFixed(2)} seconds`);
        
        if (totalRecords > 0) {
            console.log('🚀 Next steps:');
            console.log('1. Create VC ranking analysis');
            console.log('2. Build investment pattern insights');
            console.log('3. Generate competitive positioning');
            console.log('4. Create geographic analysis');
        }
        
    } catch (error) {
        console.error('💥 Critical error in VC MAP scraping:', error);
        throw error;
    }
}

// Execute if run directly
if (require.main === module) {
    (async () => {
        try {
            await scrapeAllVCMapData();
            console.log('✅ VC MAP scraping completed successfully!');
        } catch (error) {
            console.error('💥 VC MAP scraping failed:', error);
            process.exit(1);
        }
    })();
}

module.exports = {
    scrapeAllVCMapData,
    scrapeVCMapData,
    parseVCMapData,
    saveVCMapRecords,
    CONFIG
}; 