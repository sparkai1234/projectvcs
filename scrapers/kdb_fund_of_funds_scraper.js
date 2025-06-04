/**
 * 🏦 KDB FUND OF FUNDS SCRAPER
 * ============================
 * 
 * Scrapes Korea Development Bank (KDB) Fund of Funds data
 * - Government VC investment backing decisions
 * - Fund allocation and performance data
 * - Investment criteria and portfolio companies
 * - Risk assessments and compliance data
 * 
 * ULTIMATE VALUE: Government funding decisions, official backing criteria, performance metrics
 */

require('dotenv').config();
const https = require('https');
const http = require('http');
const { createClient } = require('@supabase/supabase-js');

// Configuration
const CONFIG = {
    baseUrls: {
        disclosures: 'https://www.kdb.co.kr/CHBIPA49N00.act',
        ir: 'https://www.kdb.co.kr/CHGLIR05N00.act',
        sustainability: 'https://www.kdb.co.kr/CHGLIR05N00.act',
        ventureDivision: 'https://www.kdb.co.kr/CHGFBF05N00.act'
    },
    timeout: 45000,
    userAgent: 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
    delayBetweenRequests: 3000,
    maxRetries: 3,
    
    // KDB specific data types to search for
    dataTypes: [
        '벤처캐피탈',           // Venture Capital
        '펀드오브펀즈',         // Fund of Funds
        '투자조합',             // Investment Partnership
        '출자',                 // Investment/Funding
        '모태펀드',             // Korea Fund of Funds
        '벤처투자',             // Venture Investment
        '창업투자조합',         // Startup Investment Partnership
        '기업성장펀드',         // Corporate Growth Fund
        '혁신성장펀드'          // Innovation Growth Fund
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

console.log('🏦 KDB Fund of Funds Scraper Started');
console.log(`🎯 Target: Korea Development Bank VC investment data`);

/**
 * Make HTTP request with proper headers
 */
async function makeRequest(url, options = {}) {
    return new Promise((resolve, reject) => {
        const urlObj = new URL(url);
        const isHttps = urlObj.protocol === 'https:';
        const requestLib = isHttps ? https : http;
        
        const requestOptions = {
            hostname: urlObj.hostname,
            port: urlObj.port || (isHttps ? 443 : 80),
            path: urlObj.pathname + urlObj.search,
            method: options.method || 'GET',
            headers: {
                'User-Agent': CONFIG.userAgent,
                'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,*/*;q=0.8',
                'Accept-Language': 'ko-KR,ko;q=0.9,en;q=0.8',
                'Accept-Encoding': 'gzip, deflate, br',
                'Connection': 'keep-alive',
                'Cache-Control': 'no-cache',
                'Referer': 'https://www.kdb.co.kr/',
                ...options.headers
            },
            timeout: CONFIG.timeout
        };

        console.log(`📡 Requesting KDB data: ${url.substring(0, 80)}...`);

        const req = requestLib.request(requestOptions, (res) => {
            let data = '';
            
            res.on('data', (chunk) => {
                data += chunk;
            });
            
            res.on('end', () => {
                console.log(`✅ KDB response: ${res.statusCode} (${data.length} chars)`);
                resolve({
                    statusCode: res.statusCode,
                    headers: res.headers,
                    body: data
                });
            });
        });

        req.on('error', (err) => {
            console.error(`❌ KDB request failed: ${err.message}`);
            reject(err);
        });

        req.on('timeout', () => {
            req.destroy();
            reject(new Error('KDB request timeout'));
        });

        if (options.data) {
            req.write(options.data);
        }
        
        req.end();
    });
}

/**
 * Parse KDB fund disclosure data
 */
function parseKDBFundData(html, dataSource) {
    const fundRecords = [];
    
    try {
        console.log(`🔍 Parsing KDB fund data from ${dataSource}`);
        
        // Look for tables containing fund information
        const tableRegex = /<table[^>]*>(.*?)<\/table>/gis;
        const tables = html.match(tableRegex) || [];
        
        console.log(`Found ${tables.length} tables in KDB response`);
        
        for (const table of tables) {
            const rowRegex = /<tr[^>]*>(.*?)<\/tr>/gis;
            const rows = table.match(rowRegex) || [];
            
            for (const row of rows) {
                const cellRegex = /<td[^>]*>(.*?)<\/td>/gis;
                const cells = [];
                let match;
                
                while ((match = cellRegex.exec(row)) !== null) {
                    const cellContent = match[1]
                        .replace(/<[^>]*>/g, '')
                        .replace(/&nbsp;/g, ' ')
                        .replace(/&amp;/g, '&')
                        .trim();
                    cells.push(cellContent);
                }
                
                // Parse fund-related rows
                if (cells.length >= 3 && containsFundKeywords(cells.join(' '))) {
                    const record = parseKDBFundRow(cells, dataSource);
                    if (record) {
                        fundRecords.push(record);
                    }
                }
            }
        }
        
        // Also parse list items and div structures
        const listRegex = /<li[^>]*>(.*?)<\/li>/gis;
        const listItems = html.match(listRegex) || [];
        
        for (const item of listItems) {
            if (containsFundKeywords(item)) {
                const record = parseKDBListItem(item, dataSource);
                if (record) {
                    fundRecords.push(record);
                }
            }
        }
        
        console.log(`✅ Parsed ${fundRecords.length} KDB fund records`);
        return fundRecords;
        
    } catch (error) {
        console.error(`❌ Error parsing KDB fund data: ${error.message}`);
        return [];
    }
}

/**
 * Check if content contains fund-related keywords
 */
function containsFundKeywords(content) {
    const keywords = [
        '벤처캐피탈', '펀드', '투자조합', '출자', '모태펀드',
        'VC', 'Fund', 'Investment', 'Venture', 'PE',
        '창업투자', '성장펀드', '혁신펀드', '스타트업'
    ];
    
    return keywords.some(keyword => content.includes(keyword));
}

/**
 * Parse individual KDB fund row
 */
function parseKDBFundRow(cells, dataSource) {
    try {
        // Extract fund information from table row
        const fundName = cells[0] || '';
        const fundType = cells[1] || '';
        const investmentAmount = cells[2] || '';
        const investmentDate = cells[3] || '';
        const status = cells[4] || '';
        
        if (!fundName || fundName.length < 3) {
            return null;
        }
        
        return {
            fund_name: fundName,
            fund_type: normalizeFundType(fundType),
            investment_amount: parseKoreanAmount(investmentAmount),
            investment_amount_text: investmentAmount,
            investment_date: parseKoreanDate(investmentDate),
            status: status || 'Active',
            
            // KDB specific fields
            government_backing: true,
            backing_institution: 'Korea Development Bank (KDB)',
            backing_type: determineBacking(fundType, investmentAmount),
            risk_level: assessRiskLevel(fundType, status),
            
            // Investment details
            currency: 'KRW',
            investment_stage: extractInvestmentStage(fundType),
            sector_focus: extractSectorFocus(fundName, fundType),
            
            // Performance and compliance
            performance_metrics: null,
            compliance_status: status,
            reporting_frequency: 'Quarterly',
            
            // Metadata
            data_source: dataSource,
            extracted_at: new Date().toISOString(),
            source_url: CONFIG.baseUrls.disclosures,
            data_type: 'kdb_fund_disclosure'
        };
        
    } catch (error) {
        console.error(`❌ Error parsing KDB fund row: ${error.message}`);
        return null;
    }
}

/**
 * Parse KDB list item for fund information
 */
function parseKDBListItem(item, dataSource) {
    try {
        const cleanItem = item.replace(/<[^>]*>/g, '').trim();
        
        // Look for fund patterns in list items
        const fundPatterns = [
            /(.+펀드)\s*:\s*([0-9,]+억원?)/,
            /(.+벤처)\s*([0-9,]+)\s*(억원?|만원?)/,
            /(.+투자조합)\s*(.+)/,
            /(.+VC)\s*(.+)/
        ];
        
        for (const pattern of fundPatterns) {
            const match = cleanItem.match(pattern);
            if (match) {
                return {
                    fund_name: match[1].trim(),
                    investment_amount: parseKoreanAmount(match[2] || ''),
                    investment_amount_text: match[2] || '',
                    fund_type: 'Government Backed Fund',
                    government_backing: true,
                    backing_institution: 'Korea Development Bank (KDB)',
                    backing_type: 'Direct Investment',
                    status: 'Active',
                    
                    // Metadata
                    data_source: dataSource,
                    extracted_at: new Date().toISOString(),
                    source_url: CONFIG.baseUrls.disclosures,
                    data_type: 'kdb_fund_list_item'
                };
            }
        }
        
        return null;
        
    } catch (error) {
        console.error(`❌ Error parsing KDB list item: ${error.message}`);
        return null;
    }
}

/**
 * Parse Korean amounts (억원, 만원, etc.)
 */
function parseKoreanAmount(amountStr) {
    if (!amountStr || amountStr === '-') {
        return null;
    }
    
    // Remove commas and extract numbers
    let cleanAmount = amountStr.replace(/[,\s]/g, '');
    
    // Handle Korean units
    let multiplier = 1;
    if (cleanAmount.includes('조')) {
        multiplier = 1000000000000; // 1 trillion
        cleanAmount = cleanAmount.replace('조', '');
    } else if (cleanAmount.includes('억')) {
        multiplier = 100000000; // 100 million
        cleanAmount = cleanAmount.replace('억', '');
    } else if (cleanAmount.includes('만')) {
        multiplier = 10000; // 10 thousand
        cleanAmount = cleanAmount.replace('만', '');
    } else if (cleanAmount.includes('천')) {
        multiplier = 1000; // 1 thousand
        cleanAmount = cleanAmount.replace('천', '');
    }
    
    cleanAmount = cleanAmount.replace(/[^0-9.]/g, '');
    const amount = parseFloat(cleanAmount);
    
    return isNaN(amount) ? null : Math.round(amount * multiplier);
}

/**
 * Parse Korean dates
 */
function parseKoreanDate(dateStr) {
    if (!dateStr || dateStr === '-') {
        return null;
    }
    
    try {
        // Handle various Korean date formats
        let cleanDate = dateStr.replace(/[^\d-./]/g, '');
        
        if (cleanDate.length === 8) {
            // YYYYMMDD
            cleanDate = `${cleanDate.substring(0, 4)}-${cleanDate.substring(4, 6)}-${cleanDate.substring(6, 8)}`;
        }
        
        const date = new Date(cleanDate);
        return isNaN(date.getTime()) ? null : date.toISOString().split('T')[0];
        
    } catch (error) {
        return null;
    }
}

/**
 * Normalize fund type
 */
function normalizeFundType(fundType) {
    const typeMap = {
        '벤처캐피탈': 'Venture Capital',
        '펀드오브펀즈': 'Fund of Funds',
        '투자조합': 'Investment Partnership',
        '창업투자조합': 'Startup Investment Partnership',
        '기업성장펀드': 'Corporate Growth Fund',
        '혁신성장펀드': 'Innovation Growth Fund',
        '모태펀드': 'Korea Fund of Funds'
    };
    
    return typeMap[fundType] || fundType || 'Government Backed Fund';
}

/**
 * Determine backing type
 */
function determineBacking(fundType, amount) {
    if (fundType.includes('출자') || fundType.includes('투자')) {
        return 'Direct Investment';
    }
    if (fundType.includes('보증') || fundType.includes('지원')) {
        return 'Guarantee/Support';
    }
    if (amount && parseKoreanAmount(amount) > 1000000000) { // Over 10억
        return 'Major Investment';
    }
    return 'Standard Investment';
}

/**
 * Assess risk level
 */
function assessRiskLevel(fundType, status) {
    if (status && (status.includes('중단') || status.includes('실패'))) {
        return 'High Risk';
    }
    if (fundType.includes('혁신') || fundType.includes('창업')) {
        return 'Medium-High Risk';
    }
    if (fundType.includes('안정') || fundType.includes('성장')) {
        return 'Medium Risk';
    }
    return 'Low-Medium Risk';
}

/**
 * Extract investment stage
 */
function extractInvestmentStage(fundType) {
    if (fundType.includes('창업') || fundType.includes('초기')) {
        return 'Early Stage';
    }
    if (fundType.includes('성장') || fundType.includes('확장')) {
        return 'Growth Stage';
    }
    if (fundType.includes('후기') || fundType.includes('성숙')) {
        return 'Late Stage';
    }
    return 'Mixed Stage';
}

/**
 * Extract sector focus
 */
function extractSectorFocus(fundName, fundType) {
    const sectors = [];
    
    if (fundName.includes('바이오') || fundType.includes('바이오')) {
        sectors.push('Biotechnology');
    }
    if (fundName.includes('IT') || fundName.includes('소프트웨어')) {
        sectors.push('Information Technology');
    }
    if (fundName.includes('제조') || fundName.includes('산업')) {
        sectors.push('Manufacturing');
    }
    if (fundName.includes('에너지') || fundName.includes('친환경')) {
        sectors.push('Clean Energy');
    }
    if (fundName.includes('핀테크') || fundName.includes('금융')) {
        sectors.push('Fintech');
    }
    
    return sectors.length > 0 ? sectors.join(', ') : 'General';
}

/**
 * Save KDB fund records to Supabase
 */
async function saveKDBFundRecords(records) {
    if (records.length === 0) {
        console.log('⚠️ No KDB fund records to save');
        return { success: true, count: 0 };
    }
    
    try {
        console.log(`💾 Saving ${records.length} KDB fund records to Supabase...`);
        
        const { data, error } = await supabase
            .from('kdb_fund_of_funds_raw')
            .upsert(records, {
                onConflict: 'fund_name,investment_date,data_source',
                ignoreDuplicates: false
            });
        
        if (error) {
            console.error(`❌ Database error for KDB funds:`, error);
            throw error;
        }
        
        console.log(`🎉 Successfully saved ${records.length} KDB fund records!`);
        return { success: true, count: records.length };
        
    } catch (error) {
        console.error('❌ Error saving KDB fund data to database:', error);
        return { success: false, error: error.message };
    }
}

/**
 * Scrape KDB Fund of Funds data
 */
async function scrapeKDBFundData() {
    console.log('\n🚀 === STARTING KDB FUND OF FUNDS SCRAPING ===');
    
    const startTime = Date.now();
    let totalRecords = 0;
    let totalErrors = 0;
    
    try {
        // Test database connection
        console.log('🔌 Testing Supabase connection...');
        
        const testRecord = {
            fund_name: 'CONNECTION_TEST_' + Date.now(),
            fund_type: 'test',
            government_backing: true,
            backing_institution: 'test',
            data_source: 'CONNECTION_TEST',
            data_type: 'connection_test',
            extracted_at: new Date().toISOString()
        };
        
        const { error: insertError } = await supabase
            .from('kdb_fund_of_funds_raw')
            .insert([testRecord]);
        
        if (insertError) {
            console.error('❌ Supabase connection failed:', insertError);
            return;
        }
        
        // Clean up test record
        await supabase
            .from('kdb_fund_of_funds_raw')
            .delete()
            .eq('fund_name', testRecord.fund_name);
        
        console.log('✅ Connected to Supabase. Ready to scrape KDB data!');
        
        // Scrape different KDB data sources
        const dataSources = [
            { url: CONFIG.baseUrls.disclosures, name: 'KDB_Disclosures' },
            { url: CONFIG.baseUrls.ir, name: 'KDB_IR' },
            { url: CONFIG.baseUrls.sustainability, name: 'KDB_Sustainability' }
        ];
        
        for (const source of dataSources) {
            try {
                console.log(`\n📊 === SCRAPING ${source.name} ===`);
                
                const response = await makeRequest(source.url);
                
                if (response.statusCode !== 200) {
                    console.error(`❌ HTTP ${response.statusCode} for ${source.name}`);
                    continue;
                }
                
                const records = parseKDBFundData(response.body, source.name);
                
                if (records.length > 0) {
                    const saveResult = await saveKDBFundRecords(records);
                    if (saveResult.success) {
                        totalRecords += saveResult.count;
                        console.log(`✅ ${source.name}: ${saveResult.count} records saved`);
                    }
                }
                
                // Rate limiting
                console.log(`⏱️ Waiting ${CONFIG.delayBetweenRequests}ms...`);
                await new Promise(resolve => setTimeout(resolve, CONFIG.delayBetweenRequests));
                
            } catch (error) {
                console.error(`❌ Failed to scrape ${source.name}:`, error.message);
                totalErrors++;
            }
        }
        
        const duration = (Date.now() - startTime) / 1000;
        
        console.log('\n🎉 === KDB FUND OF FUNDS SCRAPING COMPLETED ===');
        console.log(`🏦 Total KDB Fund Records: ${totalRecords}`);
        console.log(`❌ Total Errors: ${totalErrors}`);
        console.log(`⏱️ Duration: ${duration.toFixed(2)} seconds`);
        
        if (totalRecords > 0) {
            console.log('🚀 Next steps:');
            console.log('1. Analyze government backing patterns');
            console.log('2. Create fund performance metrics');
            console.log('3. Build risk assessment models');
            console.log('4. Generate investment recommendation engine');
        }
        
    } catch (error) {
        console.error('💥 Critical error in KDB fund scraping:', error);
        throw error;
    }
}

// Execute if run directly
if (require.main === module) {
    (async () => {
        try {
            await scrapeKDBFundData();
            console.log('✅ KDB Fund of Funds scraping completed successfully!');
        } catch (error) {
            console.error('💥 KDB Fund of Funds scraping failed:', error);
            process.exit(1);
        }
    })();
}

module.exports = {
    scrapeKDBFundData,
    parseKDBFundData,
    saveKDBFundRecords,
    CONFIG
}; 