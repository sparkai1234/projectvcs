/**
 * 🏛️ KVIC API SCRAPER - ULTIMATE KOREAN VC DATA SOURCE
 * ====================================================
 * 
 * Scrapes Korea Venture Investment Corporation (KVIC) official API data
 * - Government venture investment statistics
 * - Official fund performance metrics
 * - Portfolio company success rates
 * - Investment trend analysis
 * - Regulatory compliance data
 * 
 * ULTIMATE VALUE: Official government VC ecosystem data - the most authoritative source
 */

require('dotenv').config();
const https = require('https');
const http = require('http');
const { createClient } = require('@supabase/supabase-js');

// Configuration
const CONFIG = {
    baseUrl: 'https://www.kvic.or.kr/open',
    apiEndpoints: {
        investment_stats: '/api/investment/statistics',
        fund_data: '/api/fund/list',
        portfolio_companies: '/api/portfolio/companies',
        performance_metrics: '/api/performance/metrics',
        sector_analysis: '/api/sector/analysis',
        trend_data: '/api/trends/investment',
        compliance_data: '/api/compliance/reports'
    },
    
    // KVIC API configuration
    timeout: 60000, // KVIC might be slower due to data volume
    userAgent: 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
    delayBetweenRequests: 1000, // Official API, can be faster
    maxRetries: 5,
    
    // Data categories KVIC typically provides
    dataCategories: [
        'venture_investment',
        'startup_funding', 
        'fund_performance',
        'portfolio_analysis',
        'market_trends',
        'sector_statistics',
        'regulatory_compliance',
        'success_metrics'
    ],
    
    // Investment stages KVIC tracks
    investmentStages: [
        'seed',
        'early',
        'growth', 
        'expansion',
        'later',
        'bridge',
        'ipo_preparation'
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

console.log('🏛️ KVIC API Scraper Started');
console.log(`🎯 Target: Korea Venture Investment Corporation - Official Government VC Data`);

/**
 * Make authenticated API request to KVIC
 */
async function makeKVICRequest(endpoint, params = {}, apiKey = null) {
    return new Promise((resolve, reject) => {
        // Construct URL with parameters
        const queryParams = new URLSearchParams(params);
        const url = `${CONFIG.baseUrl}${endpoint}${queryParams.toString() ? '?' + queryParams.toString() : ''}`;
        
        const urlObj = new URL(url);
        const isHttps = urlObj.protocol === 'https:';
        const requestLib = isHttps ? https : http;
        
        const requestOptions = {
            hostname: urlObj.hostname,
            port: urlObj.port || (isHttps ? 443 : 80),
            path: urlObj.pathname + urlObj.search,
            method: 'GET',
            headers: {
                'User-Agent': CONFIG.userAgent,
                'Accept': 'application/json, text/plain, */*',
                'Accept-Language': 'ko-KR,ko;q=0.9,en;q=0.8',
                'Accept-Encoding': 'gzip, deflate, br',
                'Connection': 'keep-alive',
                'Cache-Control': 'no-cache',
                'Referer': 'https://www.kvic.or.kr/',
                'X-Requested-With': 'XMLHttpRequest'
            },
            timeout: CONFIG.timeout
        };

        // Add API key if provided
        if (apiKey) {
            requestOptions.headers['Authorization'] = `Bearer ${apiKey}`;
            requestOptions.headers['X-API-Key'] = apiKey;
        }

        console.log(`📡 Requesting KVIC API: ${endpoint}`);
        console.log(`🔗 Full URL: ${url.substring(0, 100)}...`);

        const req = requestLib.request(requestOptions, (res) => {
            let data = '';
            let isGzipped = res.headers['content-encoding'] === 'gzip';
            
            res.on('data', (chunk) => {
                data += chunk;
            });
            
            res.on('end', () => {
                console.log(`✅ KVIC API response: ${res.statusCode} (${data.length} chars)`);
                
                try {
                    // Try to parse as JSON first
                    if (res.headers['content-type']?.includes('application/json')) {
                        const jsonData = JSON.parse(data);
                        resolve({
                            statusCode: res.statusCode,
                            headers: res.headers,
                            body: jsonData,
                            success: true,
                            endpoint: endpoint
                        });
                    } else {
                        // Handle non-JSON responses (HTML, XML, etc.)
                        resolve({
                            statusCode: res.statusCode,
                            headers: res.headers,
                            body: data,
                            success: res.statusCode === 200,
                            endpoint: endpoint,
                            contentType: res.headers['content-type']
                        });
                    }
                } catch (parseError) {
                    console.log(`⚠️ JSON parse failed, returning raw data: ${parseError.message}`);
                    resolve({
                        statusCode: res.statusCode,
                        headers: res.headers,
                        body: data,
                        success: res.statusCode === 200,
                        endpoint: endpoint,
                        parseError: parseError.message
                    });
                }
            });
        });

        req.on('error', (err) => {
            console.error(`❌ KVIC API request failed: ${err.message}`);
            reject(err);
        });

        req.on('timeout', () => {
            req.destroy();
            reject(new Error('KVIC API request timeout'));
        });

        req.end();
    });
}

/**
 * Parse KVIC investment statistics data
 */
function parseKVICInvestmentStats(data, endpoint) {
    const records = [];
    
    try {
        console.log(`🔍 Parsing KVIC investment stats from ${endpoint}`);
        
        // Handle different data formats KVIC might return
        let investments = [];
        
        if (Array.isArray(data)) {
            investments = data;
        } else if (data.data && Array.isArray(data.data)) {
            investments = data.data;
        } else if (data.result && Array.isArray(data.result)) {
            investments = data.result;
        } else if (data.items && Array.isArray(data.items)) {
            investments = data.items;
        }
        
        for (const investment of investments) {
            const record = {
                // Core investment data
                investment_id: investment.id || investment.투자ID || investment.investment_id,
                company_name: investment.company_name || investment.기업명 || investment.companyName,
                fund_name: investment.fund_name || investment.펀드명 || investment.fundName,
                investment_amount: parseKoreanAmount(investment.investment_amount || investment.투자금액 || investment.amount),
                investment_amount_text: investment.investment_amount || investment.투자금액 || investment.amount,
                investment_date: parseKoreanDate(investment.investment_date || investment.투자일자 || investment.date),
                investment_stage: normalizeInvestmentStage(investment.stage || investment.단계 || investment.투자단계),
                
                // Company details
                company_sector: investment.sector || investment.업종 || investment.industry,
                company_type: investment.company_type || investment.기업형태 || investment.type,
                company_location: investment.location || investment.소재지 || investment.address,
                company_employees: parseNumber(investment.employees || investment.직원수 || investment.employee_count),
                
                // Fund details
                fund_type: investment.fund_type || investment.펀드유형 || investment.fundType,
                fund_manager: investment.fund_manager || investment.운용사 || investment.manager,
                fund_size: parseKoreanAmount(investment.fund_size || investment.펀드규모 || investment.fundSize),
                
                // Investment context
                round_type: investment.round_type || investment.라운드 || investment.round,
                lead_investor: investment.lead_investor || investment.주관투자사 || investment.leadInvestor,
                co_investors: investment.co_investors || investment.공동투자사 || investment.coInvestors,
                
                // Performance indicators
                valuation: parseKoreanAmount(investment.valuation || investment.기업가치 || investment.company_value),
                roi_expectation: investment.roi_expectation || investment.기대수익률 || investment.expectedROI,
                exit_strategy: investment.exit_strategy || investment.회수전략 || investment.exitStrategy,
                
                // Government classification
                government_program: investment.government_program || investment.정부사업 || investment.program,
                support_type: investment.support_type || investment.지원유형 || investment.supportType,
                regulatory_status: investment.regulatory_status || investment.규제현황 || investment.regulation,
                
                // Metadata
                data_source: 'KVIC_API',
                endpoint: endpoint,
                extracted_at: new Date().toISOString(),
                data_type: 'kvic_investment_statistics'
            };
            
            // Only add if we have minimum required data
            if (record.company_name || record.fund_name) {
                records.push(record);
            }
        }
        
        console.log(`✅ Parsed ${records.length} KVIC investment records`);
        return records;
        
    } catch (error) {
        console.error(`❌ Error parsing KVIC investment stats: ${error.message}`);
        return [];
    }
}

/**
 * Parse KVIC fund performance data
 */
function parseKVICFundData(data, endpoint) {
    const records = [];
    
    try {
        console.log(`🔍 Parsing KVIC fund data from ${endpoint}`);
        
        let funds = [];
        
        if (Array.isArray(data)) {
            funds = data;
        } else if (data.funds && Array.isArray(data.funds)) {
            funds = data.funds;
        } else if (data.data && Array.isArray(data.data)) {
            funds = data.data;
        }
        
        for (const fund of funds) {
            const record = {
                // Core fund information
                fund_id: fund.id || fund.펀드ID || fund.fund_id,
                fund_name: fund.fund_name || fund.펀드명 || fund.name,
                fund_type: fund.fund_type || fund.펀드유형 || fund.type,
                fund_size: parseKoreanAmount(fund.fund_size || fund.펀드규모 || fund.size),
                fund_size_text: fund.fund_size || fund.펀드규모 || fund.size,
                
                // Management details
                management_company: fund.management_company || fund.운용사 || fund.manager,
                fund_manager: fund.fund_manager || fund.펀드매니저 || fund.pm,
                establishment_date: parseKoreanDate(fund.establishment_date || fund.설정일 || fund.inception),
                maturity_date: parseKoreanDate(fund.maturity_date || fund.만기일 || fund.maturity),
                
                // Investment strategy
                investment_stage: fund.investment_stage || fund.투자단계 || fund.stage,
                target_sector: fund.target_sector || fund.대상업종 || fund.sector,
                geographic_focus: fund.geographic_focus || fund.투자지역 || fund.geography,
                investment_strategy: fund.investment_strategy || fund.투자전략 || fund.strategy,
                
                // Performance metrics
                total_committed: parseKoreanAmount(fund.total_committed || fund.총약정액 || fund.commitment),
                total_called: parseKoreanAmount(fund.total_called || fund.총납입액 || fund.called),
                total_invested: parseKoreanAmount(fund.total_invested || fund.총투자액 || fund.invested),
                portfolio_companies: parseNumber(fund.portfolio_companies || fund.포트폴리오기업수 || fund.portfolio_count),
                
                // Returns and performance
                irr: parsePercentage(fund.irr || fund.내부수익률 || fund.internal_return),
                multiple: parseNumber(fund.multiple || fund.배수 || fund.return_multiple),
                realized_value: parseKoreanAmount(fund.realized_value || fund.실현가치 || fund.realized),
                unrealized_value: parseKoreanAmount(fund.unrealized_value || fund.미실현가치 || fund.unrealized),
                
                // Fund status
                fund_status: fund.fund_status || fund.펀드상태 || fund.status,
                investment_period: fund.investment_period || fund.투자기간 || fund.inv_period,
                harvest_period: fund.harvest_period || fund.회수기간 || fund.harvest_period,
                
                // Government relation
                government_fund: parseBoolean(fund.government_fund || fund.정부펀드 || fund.gov_fund),
                mother_fund: fund.mother_fund || fund.모태펀드 || fund.fund_of_funds,
                support_program: fund.support_program || fund.지원사업 || fund.program,
                
                // Metadata
                data_source: 'KVIC_API',
                endpoint: endpoint,
                extracted_at: new Date().toISOString(),
                data_type: 'kvic_fund_performance'
            };
            
            if (record.fund_name) {
                records.push(record);
            }
        }
        
        console.log(`✅ Parsed ${records.length} KVIC fund records`);
        return records;
        
    } catch (error) {
        console.error(`❌ Error parsing KVIC fund data: ${error.message}`);
        return [];
    }
}

/**
 * Parse KVIC portfolio company data
 */
function parseKVICPortfolioData(data, endpoint) {
    const records = [];
    
    try {
        console.log(`🔍 Parsing KVIC portfolio data from ${endpoint}`);
        
        let companies = [];
        
        if (Array.isArray(data)) {
            companies = data;
        } else if (data.companies && Array.isArray(data.companies)) {
            companies = data.companies;
        } else if (data.portfolio && Array.isArray(data.portfolio)) {
            companies = data.portfolio;
        }
        
        for (const company of companies) {
            const record = {
                // Company identification
                company_id: company.id || company.기업ID || company.company_id,
                company_name: company.company_name || company.기업명 || company.name,
                business_number: company.business_number || company.사업자번호 || company.reg_number,
                
                // Business details
                industry: company.industry || company.업종 || company.sector,
                business_model: company.business_model || company.사업모델 || company.model,
                main_product: company.main_product || company.주력제품 || company.product,
                target_market: company.target_market || company.목표시장 || company.market,
                
                // Company metrics
                establishment_date: parseKoreanDate(company.establishment_date || company.설립일 || company.founded),
                employees: parseNumber(company.employees || company.직원수 || company.employee_count),
                annual_revenue: parseKoreanAmount(company.annual_revenue || company.연매출 || company.revenue),
                total_funding: parseKoreanAmount(company.total_funding || company.총투자유치액 || company.funding),
                
                // Investment details
                first_investment_date: parseKoreanDate(company.first_investment_date || company.첫투자일 || company.first_inv),
                latest_investment_date: parseKoreanDate(company.latest_investment_date || company.최근투자일 || company.latest_inv),
                investment_rounds: parseNumber(company.investment_rounds || company.투자라운드수 || company.rounds),
                current_stage: company.current_stage || company.현재단계 || company.stage,
                
                // Performance indicators
                revenue_growth: parsePercentage(company.revenue_growth || company.매출성장률 || company.growth),
                employee_growth: parsePercentage(company.employee_growth || company.고용증가율 || company.emp_growth),
                market_share: parsePercentage(company.market_share || company.시장점유율 || company.share),
                
                // Exit information
                exit_status: company.exit_status || company.회수현황 || company.exit,
                exit_date: parseKoreanDate(company.exit_date || company.회수일 || company.exit_date),
                exit_method: company.exit_method || company.회수방법 || company.exit_method,
                exit_value: parseKoreanAmount(company.exit_value || company.회수가치 || company.exit_value),
                
                // Location and contact
                headquarters: company.headquarters || company.본사소재지 || company.location,
                website: company.website || company.웹사이트 || company.url,
                ceo_name: company.ceo_name || company.대표자명 || company.ceo,
                
                // Metadata
                data_source: 'KVIC_API',
                endpoint: endpoint,
                extracted_at: new Date().toISOString(),
                data_type: 'kvic_portfolio_company'
            };
            
            if (record.company_name) {
                records.push(record);
            }
        }
        
        console.log(`✅ Parsed ${records.length} KVIC portfolio company records`);
        return records;
        
    } catch (error) {
        console.error(`❌ Error parsing KVIC portfolio data: ${error.message}`);
        return [];
    }
}

/**
 * Utility functions for data parsing
 */
function parseKoreanAmount(amountStr) {
    if (!amountStr || amountStr === '-' || amountStr === '') {
        return null;
    }
    
    let cleanAmount = String(amountStr).replace(/[,\s]/g, '');
    
    let multiplier = 1;
    if (cleanAmount.includes('조')) {
        multiplier = 1000000000000;
        cleanAmount = cleanAmount.replace('조', '');
    } else if (cleanAmount.includes('억')) {
        multiplier = 100000000;
        cleanAmount = cleanAmount.replace('억', '');
    } else if (cleanAmount.includes('만')) {
        multiplier = 10000;
        cleanAmount = cleanAmount.replace('만', '');
    } else if (cleanAmount.includes('천')) {
        multiplier = 1000;
        cleanAmount = cleanAmount.replace('천', '');
    }
    
    cleanAmount = cleanAmount.replace(/[^0-9.]/g, '');
    const amount = parseFloat(cleanAmount);
    
    return isNaN(amount) ? null : Math.round(amount * multiplier);
}

function parseKoreanDate(dateStr) {
    if (!dateStr || dateStr === '-' || dateStr === '') {
        return null;
    }
    
    try {
        let cleanDate = String(dateStr).replace(/[^\d-./년월일]/g, '');
        cleanDate = cleanDate.replace(/[년월일]/g, '-');
        cleanDate = cleanDate.replace(/--+/g, '-');
        cleanDate = cleanDate.replace(/^-|-$/g, '');
        
        if (cleanDate.length === 8) {
            cleanDate = `${cleanDate.substring(0, 4)}-${cleanDate.substring(4, 6)}-${cleanDate.substring(6, 8)}`;
        }
        
        const date = new Date(cleanDate);
        return isNaN(date.getTime()) ? null : date.toISOString().split('T')[0];
    } catch (error) {
        return null;
    }
}

function parseNumber(numStr) {
    if (!numStr || numStr === '-' || numStr === '') {
        return null;
    }
    
    const cleanNum = String(numStr).replace(/[^0-9.]/g, '');
    const num = parseFloat(cleanNum);
    
    return isNaN(num) ? null : num;
}

function parsePercentage(pctStr) {
    if (!pctStr || pctStr === '-' || pctStr === '') {
        return null;
    }
    
    const cleanPct = String(pctStr).replace(/[^0-9.-]/g, '');
    const pct = parseFloat(cleanPct);
    
    return isNaN(pct) ? null : pct;
}

function parseBoolean(boolStr) {
    if (!boolStr) return null;
    
    const str = String(boolStr).toLowerCase();
    return str === 'true' || str === 'yes' || str === 'y' || str === '1' || str === '예' || str === '참';
}

function normalizeInvestmentStage(stage) {
    if (!stage) return null;
    
    const stageMap = {
        '시드': 'Seed',
        '초기': 'Early',
        '성장': 'Growth',
        '확장': 'Expansion', 
        '후기': 'Later',
        '브릿지': 'Bridge',
        'IPO준비': 'IPO Preparation'
    };
    
    for (const [korean, english] of Object.entries(stageMap)) {
        if (String(stage).includes(korean)) {
            return english;
        }
    }
    
    return stage;
}

/**
 * Save KVIC data to Supabase
 */
async function saveKVICData(records, tableName) {
    if (records.length === 0) {
        console.log(`⚠️ No KVIC ${tableName} records to save`);
        return { success: true, count: 0 };
    }
    
    try {
        console.log(`💾 Saving ${records.length} KVIC ${tableName} records to Supabase...`);
        
        const { data, error } = await supabase
            .from(tableName)
            .upsert(records, {
                onConflict: 'company_name,fund_name,investment_date,data_source',
                ignoreDuplicates: false
            });
        
        if (error) {
            console.error(`❌ Database error for KVIC ${tableName}:`, error);
            throw error;
        }
        
        console.log(`🎉 Successfully saved ${records.length} KVIC ${tableName} records!`);
        return { success: true, count: records.length };
        
    } catch (error) {
        console.error(`❌ Error saving KVIC ${tableName} data to database:`, error);
        return { success: false, error: error.message };
    }
}

/**
 * Main KVIC API scraping function
 */
async function scrapeKVICData(apiKey = null) {
    console.log('\n🚀 === STARTING KVIC API SCRAPING ===');
    
    const startTime = Date.now();
    let totalRecords = 0;
    let totalErrors = 0;
    
    try {
        // Test database connection first
        console.log('🔌 Testing Supabase connection...');
        
        const testRecord = {
            company_name: 'CONNECTION_TEST_' + Date.now(),
            data_source: 'KVIC_API',
            data_type: 'connection_test',
            extracted_at: new Date().toISOString()
        };
        
        const { error: insertError } = await supabase
            .from('kvic_investment_raw')
            .insert([testRecord]);
        
        if (insertError) {
            console.error('❌ Supabase connection failed:', insertError);
            return;
        }
        
        // Clean up test record
        await supabase
            .from('kvic_investment_raw')
            .delete()
            .eq('company_name', testRecord.company_name);
        
        console.log('✅ Connected to Supabase. Ready to scrape KVIC data!');
        
        if (!apiKey) {
            console.log('⚠️ No API key provided. Using public endpoints only.');
            console.log('💡 To access full KVIC data, set KVIC_API_KEY environment variable');
        }
        
        // Define scraping targets
        const scrapingTargets = [
            {
                endpoint: CONFIG.apiEndpoints.investment_stats,
                parser: parseKVICInvestmentStats,
                table: 'kvic_investment_raw',
                name: 'Investment Statistics'
            },
            {
                endpoint: CONFIG.apiEndpoints.fund_data,
                parser: parseKVICFundData,
                table: 'kvic_fund_raw', 
                name: 'Fund Data'
            },
            {
                endpoint: CONFIG.apiEndpoints.portfolio_companies,
                parser: parseKVICPortfolioData,
                table: 'kvic_portfolio_raw',
                name: 'Portfolio Companies'
            }
        ];
        
        // Scrape each endpoint
        for (const target of scrapingTargets) {
            try {
                console.log(`\n📊 === SCRAPING KVIC ${target.name} ===`);
                
                const response = await makeKVICRequest(target.endpoint, {}, apiKey);
                
                if (!response.success) {
                    console.error(`❌ Failed to get ${target.name}: HTTP ${response.statusCode}`);
                    totalErrors++;
                    continue;
                }
                
                const records = target.parser(response.body, target.endpoint);
                
                if (records.length > 0) {
                    const saveResult = await saveKVICData(records, target.table);
                    if (saveResult.success) {
                        totalRecords += saveResult.count;
                        console.log(`✅ ${target.name}: ${saveResult.count} records saved`);
                    }
                } else {
                    console.log(`⚠️ ${target.name}: No records found`);
                }
                
                // Rate limiting
                console.log(`⏱️ Waiting ${CONFIG.delayBetweenRequests}ms...`);
                await new Promise(resolve => setTimeout(resolve, CONFIG.delayBetweenRequests));
                
            } catch (error) {
                console.error(`❌ Failed to scrape ${target.name}:`, error.message);
                totalErrors++;
            }
        }
        
        const duration = (Date.now() - startTime) / 1000;
        
        console.log('\n🎉 === KVIC API SCRAPING COMPLETED ===');
        console.log(`🏛️ Total KVIC Records: ${totalRecords}`);
        console.log(`❌ Total Errors: ${totalErrors}`);
        console.log(`⏱️ Duration: ${duration.toFixed(2)} seconds`);
        console.log(`📊 Data Source: Korea Venture Investment Corporation (Official Government Data)`);
        
        if (totalRecords > 0) {
            console.log('🚀 Next steps:');
            console.log('1. Analyze official government investment patterns');
            console.log('2. Cross-reference with private fund data');
            console.log('3. Build comprehensive market intelligence');
            console.log('4. Generate investment opportunity alerts');
        }
        
    } catch (error) {
        console.error('💥 Critical error in KVIC API scraping:', error);
        throw error;
    }
}

// Execute if run directly
if (require.main === module) {
    (async () => {
        try {
            // Check for API key in environment
            const apiKey = process.env.KVIC_API_KEY;
            await scrapeKVICData(apiKey);
            console.log('✅ KVIC API scraping completed successfully!');
        } catch (error) {
            console.error('💥 KVIC API scraping failed:', error);
            process.exit(1);
        }
    })();
}

module.exports = {
    scrapeKVICData,
    parseKVICInvestmentStats,
    parseKVICFundData,
    parseKVICPortfolioData,
    CONFIG
}; 