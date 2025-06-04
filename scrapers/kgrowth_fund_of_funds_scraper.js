/**
 * 🌱 K-GROWTH FUND OF FUNDS SCRAPER
 * =================================
 * 
 * Scrapes K-Growth (Korea Growth Investment) Fund of Funds data
 * - Private Fund of Funds investment decisions
 * - Portfolio company performance metrics
 * - Stage-specific VC/PE fund investments
 * - Growth Ladder Fund (GLF) portfolio data
 * 
 * MEGA VALUE: Korea's largest private FoF data, investment patterns, performance tracking
 */

require('dotenv').config();
const https = require('https');
const http = require('http');
const { createClient } = require('@supabase/supabase-js');

// Configuration
const CONFIG = {
    baseUrls: {
        main: 'https://eng.kgrowth.or.kr',
        korean: 'https://m.kgrowth.or.kr',
        notices: 'https://m.kgrowth.or.kr/notice.asp',
        portfolio: 'https://eng.kgrowth.or.kr/portfolio',
        performance: 'https://eng.kgrowth.or.kr/performance'
    },
    timeout: 45000,
    userAgent: 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
    delayBetweenRequests: 2500,
    maxRetries: 3,
    
    // K-Growth specific search parameters
    searchParams: [
        { str_type: 2, tab: 1 },  // News
        { str_type: 2, tab: 2 },  // Fund announcements
        { str_type: 1, tab: 1 },  // Investment reports
        { str_type: 3, tab: 1 }   // Performance data
    ],
    
    // Investment stages and types K-Growth focuses on
    investmentTypes: [
        'Seed Stage',
        'Early Stage', 
        'Expansion Stage',
        'Growth Stage',
        'Mature & Distressed',
        'SME Investment',
        'PE/VC Funds',
        'Growth Ladder Fund'
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

console.log('🌱 K-Growth Fund of Funds Scraper Started');
console.log(`💰 Target: Korea's largest private Fund of Funds (USD 2.1bn+ AUM)`);

/**
 * Make HTTP request with Korean site optimization
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
                'Referer': CONFIG.baseUrls.main,
                ...options.headers
            },
            timeout: CONFIG.timeout
        };

        console.log(`📡 Requesting K-Growth data: ${url.substring(0, 80)}...`);

        const req = requestLib.request(requestOptions, (res) => {
            let data = '';
            
            res.on('data', (chunk) => {
                data += chunk;
            });
            
            res.on('end', () => {
                console.log(`✅ K-Growth response: ${res.statusCode} (${data.length} chars)`);
                resolve({
                    statusCode: res.statusCode,
                    headers: res.headers,
                    body: data
                });
            });
        });

        req.on('error', (err) => {
            console.error(`❌ K-Growth request failed: ${err.message}`);
            reject(err);
        });

        req.on('timeout', () => {
            req.destroy();
            reject(new Error('K-Growth request timeout'));
        });

        if (options.data) {
            req.write(options.data);
        }
        
        req.end();
    });
}

/**
 * Parse K-Growth fund investment data
 */
function parseKGrowthFundData(html, dataSource, searchParams) {
    const fundRecords = [];
    
    try {
        console.log(`🔍 Parsing K-Growth fund data from ${dataSource}`);
        
        // Parse tables with investment data
        const tableRegex = /<table[^>]*>(.*?)<\/table>/gis;
        const tables = html.match(tableRegex) || [];
        
        console.log(`Found ${tables.length} tables in K-Growth response`);
        
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
                        .replace(/&gt;/g, '>')
                        .replace(/&lt;/g, '<')
                        .trim();
                    cells.push(cellContent);
                }
                
                // Parse fund investment rows
                if (cells.length >= 3 && containsKGrowthKeywords(cells.join(' '))) {
                    const record = parseKGrowthFundRow(cells, dataSource, searchParams);
                    if (record) {
                        fundRecords.push(record);
                    }
                }
            }
        }
        
        // Parse notice/announcement format
        const noticeRegex = /<div[^>]*class="[^"]*notice[^"]*"[^>]*>(.*?)<\/div>/gis;
        const notices = html.match(noticeRegex) || [];
        
        for (const notice of notices) {
            if (containsKGrowthKeywords(notice)) {
                const record = parseKGrowthNotice(notice, dataSource);
                if (record) {
                    fundRecords.push(record);
                }
            }
        }
        
        // Parse list items for fund information
        const listRegex = /<li[^>]*>(.*?)<\/li>/gis;
        const listItems = html.match(listRegex) || [];
        
        for (const item of listItems) {
            if (containsKGrowthKeywords(item)) {
                const record = parseKGrowthListItem(item, dataSource);
                if (record) {
                    fundRecords.push(record);
                }
            }
        }
        
        console.log(`✅ Parsed ${fundRecords.length} K-Growth fund records`);
        return fundRecords;
        
    } catch (error) {
        console.error(`❌ Error parsing K-Growth fund data: ${error.message}`);
        return [];
    }
}

/**
 * Check if content contains K-Growth specific keywords
 */
function containsKGrowthKeywords(content) {
    const keywords = [
        // Korean keywords
        '펀드', '투자', '출자', '조합', '벤처', 'VC', 'PE',
        '성장', '창업', 'SME', '중소기업', '스타트업',
        '포트폴리오', '운용', '자산', '수익',
        
        // English keywords
        'Fund', 'Investment', 'Venture', 'Growth', 'Capital',
        'Portfolio', 'GLF', 'AUM', 'Commitment', 'LP',
        'Startup', 'SME', 'Private Equity'
    ];
    
    return keywords.some(keyword => content.includes(keyword));
}

/**
 * Parse individual K-Growth fund row
 */
function parseKGrowthFundRow(cells, dataSource, searchParams) {
    try {
        // Expected formats vary, so we need flexible parsing
        let fundName = '';
        let investmentAmount = '';
        let investmentDate = '';
        let fundType = '';
        let stage = '';
        
        // Try different cell arrangements
        if (cells.length >= 5) {
            // Format: [번호, 펀드명, 투자금액, 투자일, 단계]
            fundName = cells[1];
            investmentAmount = cells[2];
            investmentDate = cells[3];
            stage = cells[4];
        } else if (cells.length >= 4) {
            // Format: [펀드명, 투자금액, 투자일, 상태]
            fundName = cells[0];
            investmentAmount = cells[1];
            investmentDate = cells[2];
            fundType = cells[3];
        } else if (cells.length >= 3) {
            // Format: [펀드명, 투자금액, 기타정보]
            fundName = cells[0];
            investmentAmount = cells[1];
            fundType = cells[2];
        }
        
        if (!fundName || fundName.length < 3) {
            return null;
        }
        
        return {
            fund_name: fundName,
            fund_type: normalizeKGrowthFundType(fundType, stage),
            investment_amount: parseKoreanAmount(investmentAmount),
            investment_amount_text: investmentAmount,
            investment_date: parseKoreanDate(investmentDate),
            investment_stage: normalizeInvestmentStage(stage, fundType),
            
            // K-Growth specific fields
            fund_of_funds: 'K-Growth',
            fof_type: 'Private Fund of Funds',
            aum_category: determineAUMCategory(investmentAmount),
            glf_related: isGLFRelated(fundName, fundType),
            
            // Investment classification
            target_companies: extractTargetCompanies(fundType, stage),
            geographic_focus: extractGeographicFocus(fundName, fundType),
            sector_focus: extractSectorFocus(fundName, fundType),
            
            // Performance tracking
            performance_tier: assessPerformanceTier(investmentAmount, stage),
            risk_profile: assessRiskProfile(stage, fundType),
            
            // Search context
            search_type: searchParams ? searchParams.str_type : null,
            search_tab: searchParams ? searchParams.tab : null,
            
            // Metadata
            data_source: dataSource,
            extracted_at: new Date().toISOString(),
            source_url: CONFIG.baseUrls.korean,
            data_type: 'kgrowth_fund_investment'
        };
        
    } catch (error) {
        console.error(`❌ Error parsing K-Growth fund row: ${error.message}`);
        return null;
    }
}

/**
 * Parse K-Growth notice/announcement
 */
function parseKGrowthNotice(notice, dataSource) {
    try {
        const cleanNotice = notice.replace(/<[^>]*>/g, '').trim();
        
        // Look for fund-related announcements
        const fundPatterns = [
            /(.+펀드)\s*(.+조)\s*(.+)/,
            /(.+벤처)\s*(.+억)\s*(.+)/,
            /(.+투자)\s*(.+)\s*발표/,
            /(GLF|Growth Ladder Fund)\s*(.+)/
        ];
        
        for (const pattern of fundPatterns) {
            const match = cleanNotice.match(pattern);
            if (match) {
                return {
                    fund_name: match[1].trim(),
                    announcement_details: cleanNotice,
                    fund_type: 'Announced Fund',
                    fund_of_funds: 'K-Growth',
                    fof_type: 'Private Fund of Funds',
                    
                    // Extract amount if present
                    investment_amount: parseKoreanAmount(match[2] || ''),
                    investment_amount_text: match[2] || '',
                    
                    // Metadata
                    data_source: dataSource,
                    extracted_at: new Date().toISOString(),
                    source_url: CONFIG.baseUrls.korean,
                    data_type: 'kgrowth_fund_announcement'
                };
            }
        }
        
        return null;
        
    } catch (error) {
        console.error(`❌ Error parsing K-Growth notice: ${error.message}`);
        return null;
    }
}

/**
 * Parse K-Growth list item
 */
function parseKGrowthListItem(item, dataSource) {
    try {
        const cleanItem = item.replace(/<[^>]*>/g, '').trim();
        
        // Look for fund information in list format
        const listPatterns = [
            /(.+펀드)\s*:\s*(.+)/,
            /(.+VC)\s*-\s*(.+)/,
            /(.+투자조합)\s*(.+)/,
            /(Portfolio|포트폴리오)\s*:\s*(.+)/
        ];
        
        for (const pattern of listPatterns) {
            const match = cleanItem.match(pattern);
            if (match) {
                return {
                    fund_name: match[1].trim(),
                    description: match[2].trim(),
                    fund_type: 'Listed Fund',
                    fund_of_funds: 'K-Growth',
                    fof_type: 'Private Fund of Funds',
                    
                    // Metadata
                    data_source: dataSource,
                    extracted_at: new Date().toISOString(),
                    source_url: CONFIG.baseUrls.korean,
                    data_type: 'kgrowth_fund_list'
                };
            }
        }
        
        return null;
        
    } catch (error) {
        console.error(`❌ Error parsing K-Growth list item: ${error.message}`);
        return null;
    }
}

/**
 * Parse Korean amounts with proper unit handling
 */
function parseKoreanAmount(amountStr) {
    if (!amountStr || amountStr === '-' || amountStr === '') {
        return null;
    }
    
    // Remove commas and spaces
    let cleanAmount = amountStr.replace(/[,\s]/g, '');
    
    // Handle Korean and English units
    let multiplier = 1;
    if (cleanAmount.includes('조') || cleanAmount.includes('trillion')) {
        multiplier = 1000000000000; // 1 trillion
        cleanAmount = cleanAmount.replace(/(조|trillion)/g, '');
    } else if (cleanAmount.includes('억') || cleanAmount.includes('billion')) {
        multiplier = 100000000; // 100 million (Korean 억)
        cleanAmount = cleanAmount.replace(/(억|billion)/g, '');
    } else if (cleanAmount.includes('만') || cleanAmount.includes('million')) {
        multiplier = 10000; // 10 thousand (Korean 만)
        cleanAmount = cleanAmount.replace(/(만|million)/g, '');
    } else if (cleanAmount.includes('천') || cleanAmount.includes('thousand')) {
        multiplier = 1000; // 1 thousand
        cleanAmount = cleanAmount.replace(/(천|thousand)/g, '');
    }
    
    // Handle USD amounts
    if (cleanAmount.includes('USD') || cleanAmount.includes('$')) {
        cleanAmount = cleanAmount.replace(/(USD|\$)/g, '');
        // Convert USD to KRW (approximate rate: 1 USD = 1300 KRW)
        multiplier *= 1300;
    }
    
    cleanAmount = cleanAmount.replace(/[^0-9.]/g, '');
    const amount = parseFloat(cleanAmount);
    
    return isNaN(amount) ? null : Math.round(amount * multiplier);
}

/**
 * Parse Korean dates
 */
function parseKoreanDate(dateStr) {
    if (!dateStr || dateStr === '-' || dateStr === '') {
        return null;
    }
    
    try {
        // Handle various date formats
        let cleanDate = dateStr.replace(/[^\d-./년월일]/g, '');
        
        // Remove Korean date markers
        cleanDate = cleanDate.replace(/[년월일]/g, '-');
        cleanDate = cleanDate.replace(/--+/g, '-');
        cleanDate = cleanDate.replace(/^-|-$/g, '');
        
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
 * Normalize K-Growth fund types
 */
function normalizeKGrowthFundType(fundType, stage) {
    const typeMap = {
        '벤처캐피탈': 'Venture Capital Fund',
        'PE펀드': 'Private Equity Fund',
        '성장펀드': 'Growth Fund',
        '창업펀드': 'Startup Fund',
        'SME펀드': 'SME Investment Fund',
        '글로벌펀드': 'Global Fund',
        'GLF': 'Growth Ladder Fund'
    };
    
    // Check for GLF (Growth Ladder Fund)
    if (fundType.includes('GLF') || fundType.includes('Growth Ladder')) {
        return 'Growth Ladder Fund';
    }
    
    // Map by stage if fund type is unclear
    if (stage) {
        if (stage.includes('초기') || stage.includes('seed')) {
            return 'Early Stage Fund';
        }
        if (stage.includes('성장') || stage.includes('growth')) {
            return 'Growth Stage Fund';
        }
        if (stage.includes('성숙') || stage.includes('mature')) {
            return 'Mature Stage Fund';
        }
    }
    
    return typeMap[fundType] || fundType || 'Private Fund';
}

/**
 * Normalize investment stage
 */
function normalizeInvestmentStage(stage, fundType) {
    const stageMap = {
        '시드': 'Seed',
        '초기': 'Early',
        '성장': 'Growth', 
        '확장': 'Expansion',
        '성숙': 'Mature',
        '회복': 'Distressed'
    };
    
    for (const [korean, english] of Object.entries(stageMap)) {
        if (stage.includes(korean)) {
            return english;
        }
    }
    
    // Infer from fund type
    if (fundType.includes('창업') || fundType.includes('startup')) {
        return 'Early';
    }
    if (fundType.includes('성장') || fundType.includes('growth')) {
        return 'Growth';
    }
    
    return 'Mixed';
}

/**
 * Determine AUM category
 */
function determineAUMCategory(investmentAmount) {
    const amount = parseKoreanAmount(investmentAmount) || 0;
    
    if (amount >= 100000000000) { // 1000억 이상
        return 'Large (>1000억)';
    } else if (amount >= 50000000000) { // 500억 이상
        return 'Medium-Large (500-1000억)';
    } else if (amount >= 10000000000) { // 100억 이상
        return 'Medium (100-500억)';
    } else if (amount > 0) {
        return 'Small (<100억)';
    }
    return 'Unknown';
}

/**
 * Check if GLF related
 */
function isGLFRelated(fundName, fundType) {
    return fundName.includes('GLF') || 
           fundName.includes('Growth Ladder') ||
           fundType.includes('GLF') ||
           fundType.includes('Growth Ladder');
}

/**
 * Extract target companies
 */
function extractTargetCompanies(fundType, stage) {
    const targets = [];
    
    if (fundType.includes('SME') || fundType.includes('중소기업')) {
        targets.push('SMEs');
    }
    if (fundType.includes('스타트업') || fundType.includes('startup')) {
        targets.push('Startups');
    }
    if (fundType.includes('벤처') || fundType.includes('venture')) {
        targets.push('Venture Companies');
    }
    if (stage.includes('창업') || stage.includes('초기')) {
        targets.push('Early-stage Companies');
    }
    
    return targets.length > 0 ? targets.join(', ') : 'General';
}

/**
 * Extract geographic focus
 */
function extractGeographicFocus(fundName, fundType) {
    if (fundName.includes('글로벌') || fundName.includes('Global')) {
        return 'Global';
    }
    if (fundName.includes('아시아') || fundName.includes('Asia')) {
        return 'Asia';
    }
    if (fundName.includes('한국') || fundName.includes('Korea')) {
        return 'Korea';
    }
    return 'Korea-focused';
}

/**
 * Extract sector focus
 */
function extractSectorFocus(fundName, fundType) {
    const sectors = [];
    
    if (fundName.includes('바이오') || fundType.includes('바이오')) {
        sectors.push('Biotech');
    }
    if (fundName.includes('IT') || fundName.includes('ICT')) {
        sectors.push('IT/ICT');
    }
    if (fundName.includes('핀테크') || fundName.includes('fintech')) {
        sectors.push('Fintech');
    }
    if (fundName.includes('제조') || fundName.includes('manufacturing')) {
        sectors.push('Manufacturing');
    }
    if (fundName.includes('에너지') || fundName.includes('energy')) {
        sectors.push('Energy');
    }
    
    return sectors.length > 0 ? sectors.join(', ') : 'Sector Agnostic';
}

/**
 * Assess performance tier
 */
function assessPerformanceTier(investmentAmount, stage) {
    const amount = parseKoreanAmount(investmentAmount) || 0;
    
    if (amount >= 100000000000) { // 1000억 이상
        return 'Tier 1 (Large Fund)';
    } else if (amount >= 50000000000) { // 500억 이상
        return 'Tier 2 (Medium-Large Fund)';
    } else if (amount >= 10000000000) { // 100억 이상
        return 'Tier 3 (Medium Fund)';
    }
    return 'Tier 4 (Small Fund)';
}

/**
 * Assess risk profile
 */
function assessRiskProfile(stage, fundType) {
    if (stage.includes('시드') || stage.includes('seed') || stage.includes('창업')) {
        return 'High Risk';
    }
    if (stage.includes('초기') || stage.includes('early')) {
        return 'Medium-High Risk';
    }
    if (stage.includes('성장') || stage.includes('growth')) {
        return 'Medium Risk';
    }
    if (stage.includes('성숙') || stage.includes('mature')) {
        return 'Low-Medium Risk';
    }
    return 'Medium Risk';
}

/**
 * Save K-Growth fund records to Supabase
 */
async function saveKGrowthFundRecords(records) {
    if (records.length === 0) {
        console.log('⚠️ No K-Growth fund records to save');
        return { success: true, count: 0 };
    }
    
    try {
        console.log(`💾 Saving ${records.length} K-Growth fund records to Supabase...`);
        
        const { data, error } = await supabase
            .from('kgrowth_fund_of_funds_raw')
            .upsert(records, {
                onConflict: 'fund_name,investment_date,data_source',
                ignoreDuplicates: false
            });
        
        if (error) {
            console.error(`❌ Database error for K-Growth funds:`, error);
            throw error;
        }
        
        console.log(`🎉 Successfully saved ${records.length} K-Growth fund records!`);
        return { success: true, count: records.length };
        
    } catch (error) {
        console.error('❌ Error saving K-Growth fund data to database:', error);
        return { success: false, error: error.message };
    }
}

/**
 * Scrape K-Growth Fund of Funds data
 */
async function scrapeKGrowthFundData() {
    console.log('\n🚀 === STARTING K-GROWTH FUND OF FUNDS SCRAPING ===');
    
    const startTime = Date.now();
    let totalRecords = 0;
    let totalErrors = 0;
    
    try {
        // Test database connection
        console.log('🔌 Testing Supabase connection...');
        
        const testRecord = {
            fund_name: 'CONNECTION_TEST_' + Date.now(),
            fund_type: 'test',
            fund_of_funds: 'K-Growth',
            fof_type: 'test',
            data_source: 'CONNECTION_TEST',
            data_type: 'connection_test',
            extracted_at: new Date().toISOString()
        };
        
        const { error: insertError } = await supabase
            .from('kgrowth_fund_of_funds_raw')
            .insert([testRecord]);
        
        if (insertError) {
            console.error('❌ Supabase connection failed:', insertError);
            return;
        }
        
        // Clean up test record
        await supabase
            .from('kgrowth_fund_of_funds_raw')
            .delete()
            .eq('fund_name', testRecord.fund_name);
        
        console.log('✅ Connected to Supabase. Ready to scrape K-Growth data!');
        
        // Scrape different K-Growth data sources
        for (const searchParam of CONFIG.searchParams) {
            try {
                const url = `${CONFIG.baseUrls.notices}?str_type=${searchParam.str_type}&tab=${searchParam.tab}`;
                const dataSource = `KGrowth_Type${searchParam.str_type}_Tab${searchParam.tab}`;
                
                console.log(`\n📊 === SCRAPING ${dataSource} ===`);
                
                const response = await makeRequest(url);
                
                if (response.statusCode !== 200) {
                    console.error(`❌ HTTP ${response.statusCode} for ${dataSource}`);
                    continue;
                }
                
                const records = parseKGrowthFundData(response.body, dataSource, searchParam);
                
                if (records.length > 0) {
                    const saveResult = await saveKGrowthFundRecords(records);
                    if (saveResult.success) {
                        totalRecords += saveResult.count;
                        console.log(`✅ ${dataSource}: ${saveResult.count} records saved`);
                    }
                }
                
                // Rate limiting
                console.log(`⏱️ Waiting ${CONFIG.delayBetweenRequests}ms...`);
                await new Promise(resolve => setTimeout(resolve, CONFIG.delayBetweenRequests));
                
            } catch (error) {
                console.error(`❌ Failed to scrape search param ${JSON.stringify(searchParam)}:`, error.message);
                totalErrors++;
            }
        }
        
        // Also scrape main English pages
        const englishSources = [
            { url: CONFIG.baseUrls.main, name: 'KGrowth_Main' },
            { url: CONFIG.baseUrls.portfolio, name: 'KGrowth_Portfolio' }
        ];
        
        for (const source of englishSources) {
            try {
                console.log(`\n📊 === SCRAPING ${source.name} ===`);
                
                const response = await makeRequest(source.url);
                
                if (response.statusCode !== 200) {
                    console.error(`❌ HTTP ${response.statusCode} for ${source.name}`);
                    continue;
                }
                
                const records = parseKGrowthFundData(response.body, source.name, null);
                
                if (records.length > 0) {
                    const saveResult = await saveKGrowthFundRecords(records);
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
        
        console.log('\n🎉 === K-GROWTH FUND OF FUNDS SCRAPING COMPLETED ===');
        console.log(`🌱 Total K-Growth Fund Records: ${totalRecords}`);
        console.log(`❌ Total Errors: ${totalErrors}`);
        console.log(`⏱️ Duration: ${duration.toFixed(2)} seconds`);
        console.log(`💰 AUM Coverage: USD 2.1bn+ managed by Korea's largest private FoF`);
        
        if (totalRecords > 0) {
            console.log('🚀 Next steps:');
            console.log('1. Analyze GLF (Growth Ladder Fund) performance');
            console.log('2. Create stage-specific investment patterns');
            console.log('3. Build SME success prediction models');
            console.log('4. Generate private FoF benchmarking');
        }
        
    } catch (error) {
        console.error('💥 Critical error in K-Growth fund scraping:', error);
        throw error;
    }
}

// Execute if run directly
if (require.main === module) {
    (async () => {
        try {
            await scrapeKGrowthFundData();
            console.log('✅ K-Growth Fund of Funds scraping completed successfully!');
        } catch (error) {
            console.error('💥 K-Growth Fund of Funds scraping failed:', error);
            process.exit(1);
        }
    })();
}

module.exports = {
    scrapeKGrowthFundData,
    parseKGrowthFundData,
    saveKGrowthFundRecords,
    CONFIG
}; 