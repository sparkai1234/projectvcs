/**
 * 🇰🇷 VCS Weekly Scraper Actor - v2.2.4 - FIXED SCHEMA ISSUES
 * =============================================================
 * 
 * Fixed transformation functions to properly map Korean API responses
 * to Supabase database schema. Fixed schema mismatches: removed 
 * non-existent operating_scale column, fixed Fund table upsert conflicts.
 * Maintains enhanced operating amounts with proper data integrity.
 */

const { Actor } = require('apify');
const { createClient } = require('@supabase/supabase-js');
const https = require('https');
const { URL } = require('url');

/**
 * Parse Korean duration format and convert to establishment date
 * Examples: "6년 1개월" -> calculates date 6 years 1 month ago
 */
function parseKoreanDurationToDate(durationStr) {
    if (!durationStr || durationStr === '-') return null;
    
    try {
        // Extract years and months from Korean duration string
        const yearMatch = durationStr.match(/(\d+)년/);
        const monthMatch = durationStr.match(/(\d+)개월/);
        
        const years = yearMatch ? parseInt(yearMatch[1]) : 0;
        const months = monthMatch ? parseInt(monthMatch[1]) : 0;
        
        if (years === 0 && months === 0) return null;
        
        // Calculate establishment date (current date - duration)
        const currentDate = new Date();
        const totalMonths = years * 12 + months;
        
        // Calculate establishment date
        const establishmentDate = new Date(currentDate);
        establishmentDate.setMonth(establishmentDate.getMonth() - totalMonths);
        
        // Return in ISO date format (YYYY-MM-DD)
        return establishmentDate.toISOString().split('T')[0];
        
    } catch (error) {
        console.log(`⚠️ Failed to parse Korean duration "${durationStr}":`, error.message);
        return null;
    }
}

Actor.main(async () => {
    console.log('🇰🇷 VCS Weekly Scraper Actor Started - v2.2.6 - FIXED BIGINT & DUPLICATE KEYS');
    console.log(`🕐 Execution time: ${new Date().toISOString()}`);
    
    // Get input configuration
    const input = await Actor.getInput();
    
    // Configuration with defaults
    const config = {
        updateMode: input?.updateMode || 'incremental',
        maxPages: input?.maxPages || 999,
        dataSource: input?.dataSource || 'both',
        exportToSupabase: input?.exportToSupabase !== false,
        testMode: input?.testMode || false,
        unlimitedExtraction: input?.unlimitedExtraction !== false
    };
    
    console.log('⚙️ Actor Configuration loaded:');
    console.log(`📊 Update Mode: ${config.updateMode}`);
    console.log(`📄 Max Pages: ${config.maxPages}`);
    console.log(`🎯 Data Source: ${config.dataSource}`);
    console.log(`💾 Export to Supabase: ${config.exportToSupabase}`);
    console.log(`🧪 Test Mode: ${config.testMode}`);
    console.log(`🚀 Unlimited Extraction: ${config.unlimitedExtraction}`);
    
    // Initialize Supabase client
    let supabaseClient = null;
    if (config.exportToSupabase) {
        const supabaseUrl = input?.supabaseUrl || process.env.SUPABASE_URL || 'https://udfgtccxbqmalgpqyxzz.supabase.co';
        const supabaseKey = input?.supabaseKey || process.env.SUPABASE_SERVICE_ROLE_KEY || process.env.SUPABASE_KEY;
        
        console.log('🔍 SUPABASE CREDENTIAL DEBUG:');
        console.log(`URL from input: ${input?.supabaseUrl ? 'PROVIDED' : 'NOT PROVIDED'}`);
        console.log(`Key from input: ${input?.supabaseKey ? 'PROVIDED' : 'NOT PROVIDED'}`);
        console.log(`URL from env SUPABASE_URL: ${process.env.SUPABASE_URL ? 'SET' : 'NOT SET'}`);
        console.log(`Key from env SUPABASE_SERVICE_ROLE_KEY: ${process.env.SUPABASE_SERVICE_ROLE_KEY ? 'SET' : 'NOT SET'}`);
        console.log(`Key from env SUPABASE_KEY: ${process.env.SUPABASE_KEY ? 'SET' : 'NOT SET'}`);
        console.log(`Final URL: ${supabaseUrl}`);
        console.log(`Final Key: ${supabaseKey ? 'AVAILABLE' : 'MISSING'}`);
        
        if (supabaseUrl && supabaseKey) {
            try {
                supabaseClient = createClient(supabaseUrl, supabaseKey);
                console.log('✅ Supabase client initialized successfully');
                console.log(`📍 Supabase URL: ${supabaseUrl}`);
                console.log(`🔑 Service Key: ${supabaseKey.substring(0, 20)}...`);
                
                // Test connection
                console.log('🧪 Testing Supabase connection...');
                const { data, error } = await supabaseClient.from('vc_table').select('count').limit(1);
                if (error) {
                    console.log('❌ Supabase connection test failed:', error.message);
                } else {
                    console.log('✅ Supabase connection test passed');
                }
            } catch (error) {
                console.error('❌ Failed to initialize Supabase client:', error.message);
                supabaseClient = null;
            }
        } else {
            console.log('❌ Missing Supabase credentials - continuing without Supabase export');
        }
    }
    
    console.log(`🔗 Supabase Client Ready: ${!!supabaseClient}`);
    console.log(`📍 Platform: ${Actor.isAtHome() ? 'Apify Cloud' : 'Local Development'}`);
    console.log('🔧 Optimization: v2.2.5 with NUMERIC OVERFLOW & CONSTRAINT FIXES');
    console.log('🎯 Target: https://www.vcs.go.kr/web/portal/investor/search');
    
    // Start scraping with API-powered workflow
    console.log('🚀 Starting VCS data extraction with CORRECTED Korean mapping...');
    await scrapeVCSData(config, supabaseClient);
    
    console.log('🎉 === VCS WEEKLY SCRAPING COMPLETED (FIXED FUND AMOUNTS) ===');
});

/**
 * Main VCS scraping function with corrected Korean field mapping
 */
async function scrapeVCSData(config, supabaseClient) {
    console.log('🌐 Starting VCS API-powered scraping...');
    console.log('🎯 Using proven API endpoint: https://www.vcs.go.kr/web/portal/investor/search');
    
    const stats = {
        totalInvestors: 0,
        totalFunds: 0,
        totalRecords: 0
    };
    
    // Scrape investors (tabMenu=1) and funds (tabMenu=2)
    if (config.dataSource === 'both' || config.dataSource === 'investors') {
        console.log('\n👥 === SCRAPING INVESTORS (tabMenu=1) ===');
        stats.totalInvestors = await scrapeInvestors(config, supabaseClient);
    }
    
    if (config.dataSource === 'both' || config.dataSource === 'funds') {
        console.log('\n💰 === SCRAPING FUNDS (tabMenu=2) ===');
        stats.totalFunds = await scrapeFunds(config, supabaseClient);
    }
    
    stats.totalRecords = stats.totalInvestors + stats.totalFunds;
    
    console.log(`📊 Total records extracted: ${stats.totalRecords}`);
    console.log(`👥 Investors: ${stats.totalInvestors}`);
    console.log(`💰 Funds: ${stats.totalFunds}`);
    console.log(`📅 Update mode: ${config.updateMode}`);
    console.log(`🏷️ Data source: ${config.dataSource}`);
    console.log(`📍 Platform: ${Actor.isAtHome() ? 'Apify Cloud' : 'Local Development'}`);
    console.log('🔧 Optimization: v2.2.5 with NUMERIC OVERFLOW & CONSTRAINT FIXES');
    console.log('🎯 API Endpoint: https://www.vcs.go.kr/web/portal/investor/search');
}

/**
 * Scrape VCS investors with corrected Korean field mapping
 */
async function scrapeInvestors(config, supabaseClient) {
    console.log('📊 Starting investor API scraping...');
    
    let totalInvestors = 0;
    let page = 1;
    
    while (page <= config.maxPages) {
        console.log(`📄 Processing investor page ${page}...`);
        
        const url = `https://www.vcs.go.kr/web/portal/investor/search?sortOrder=&sortDirection=&cp=${page}&sc=&sv=&tabMenu=1`;
        console.log(`🔗 API URL: ${url.substring(0, 100)}...`);
        
        try {
            const response = await makeRequest(url);
            
            if (!response.success) {
                console.log(`❌ Failed to fetch page ${page}: ${response.error}`);
                break;
            }
            
            const data = response.body;
            console.log(`✅ API Response: ${response.statusCode} (${JSON.stringify(data).length} chars)`);
            console.log(`🔍 Response preview: ${JSON.stringify(data).substring(0, 200)}...`);
            console.log(`📊 Parsed JSON keys: [${Object.keys(data).join(', ')}]`);
            console.log(`📋 List length: ${data.list ? data.list.length : 0}`);
            console.log(`📈 Total count: ${data.total || 0}`);
            
            const investors = data.list || [];
            if (investors.length === 0) {
                console.log(`🏁 No more investors on page ${page}`);
                break;
            }
            
            console.log(`✅ Page ${page}: ${investors.length} investors`);
            totalInvestors += investors.length;
            console.log(`📊 Total investors so far: ${totalInvestors}`);
            
            // Export to Supabase with corrected transformations
            if (config.exportToSupabase && supabaseClient) {
                console.log(`🔍 DEBUG: exportToSupabase=${config.exportToSupabase}, supabaseClient=${!!supabaseClient}`);
                console.log(`💾 Upserting ${investors.length} investors to Supabase...`);
                await upsertInvestorsToSupabase(supabaseClient, investors);
            }
            
            // Save to Apify dataset
            await Actor.pushData(investors.map(investor => ({
                ...investor,
                dataType: 'investor',
                scrapedAt: new Date().toISOString(),
                source: 'VCS_API_v2.2.5_FIXED_NUMERIC_OVERFLOW'
            })));
            
            // Rate limiting
            console.log('⏱️ Rate limiting: waiting 1000ms...');
            await new Promise(resolve => setTimeout(resolve, 1000));
            
            page++;
        } catch (error) {
            console.error(`💥 Error on investor page ${page}:`, error.message);
            break;
        }
    }
    
    console.log(`💾 Saving ${totalInvestors} investors to Apify dataset...`);
    return totalInvestors;
}

/**
 * Scrape VCS funds with corrected Korean field mapping
 */
async function scrapeFunds(config, supabaseClient) {
    console.log('📊 Starting fund API scraping...');
    
    let totalFunds = 0;
    let page = 1;
    
    while (page <= config.maxPages) {
        console.log(`📄 Processing funds page ${page}...`);
        
        const url = `https://www.vcs.go.kr/web/portal/investor/search?sortOrder=&sortDirection=&cp=${page}&sc=&sv=&tabMenu=2`;
        console.log(`🔗 API URL: ${url.substring(0, 100)}...`);
        
        try {
            const response = await makeRequest(url);
            
            if (!response.success) {
                console.log(`❌ Failed to fetch page ${page}: ${response.error}`);
                break;
            }
            
            const data = response.body;
            console.log(`✅ API Response: ${response.statusCode} (${JSON.stringify(data).length} chars)`);
            console.log(`🔍 Response preview: ${JSON.stringify(data).substring(0, 200)}...`);
            console.log(`📊 Parsed JSON keys: [${Object.keys(data).join(', ')}]`);
            console.log(`📋 List length: ${data.list ? data.list.length : 0}`);
            console.log(`📈 Total count: ${data.total || 0}`);
            
            const funds = data.list || [];
            if (funds.length === 0) {
                console.log(`🏁 No more funds on page ${page}`);
                break;
            }
            
            console.log(`✅ Page ${page}: ${funds.length} funds`);
            totalFunds += funds.length;
            console.log(`📊 Total funds so far: ${totalFunds}`);
            
            // Export to Supabase with corrected transformations
            if (config.exportToSupabase && supabaseClient) {
                console.log(`🔍 DEBUG: exportToSupabase=${config.exportToSupabase}, supabaseClient=${!!supabaseClient}`);
                console.log(`💾 Upserting ${funds.length} funds to Supabase...`);
                await upsertFundsToSupabase(supabaseClient, funds);
            }
            
            // Save to Apify dataset
            await Actor.pushData(funds.map(fund => ({
                ...fund,
                dataType: 'fund',
                scrapedAt: new Date().toISOString(),
                source: 'VCS_API_v2.2.5_FIXED_NUMERIC_OVERFLOW'
            })));
            
            // Rate limiting
            console.log('⏱️ Rate limiting: waiting 1000ms...');
            await new Promise(resolve => setTimeout(resolve, 1000));
            
            page++;
        } catch (error) {
            console.error(`💥 Error on fund page ${page}:`, error.message);
            break;
        }
    }
    
    console.log(`💾 Saving ${totalFunds} funds to Apify dataset...`);
    return totalFunds;
}

/**
 * 🔧 CORRECTED: Transform VC Investor data using actual Korean API field names
 */
function transformInvestorForSupabase(investorData) {
    // 💰 CRITICAL: Parse operating amount from Korean API (operBoundAmt is in billions of won)
    const operatingAmountBillions = investorData.operBoundAmt ? parseFloat(investorData.operBoundAmt) : null;
    
    return {
        // 🎯 CRITICAL: Company ID is the universal linking field
        company_id: investorData.operInstId || `vc_${Date.now()}_${Math.random().toString(36).substr(2, 9)}`,
        
        // Basic company information using CORRECT Korean API field names
        company_name: investorData.operInstNm || 'Unknown Company',
        company_name_en: null,
        location: investorData.sigunguNm || null,  // 서울 강남구
        representative: null, // Not provided in API
        established_date: parseKoreanDurationToDate(investorData.foundYy), // Convert "6년 1개월" to date
        company_type: investorData.operInstTpNm || null, // 기타운용사
        website_url: null, // Not provided in API
        
        // 💰 CRITICAL FIX: Operating amount as integer (rounded billions) for bigint compatibility
        operating_amount: operatingAmountBillions ? Math.round(operatingAmountBillions) : null, // Convert 252.5 → 253
        
        // Contact information
        contact_info: {
            address: null, // Not provided in detail
            zip_code: investorData.headofcZipcd || null, // 06164
            phone: null, // Not provided in API
            fax: null,
            email: null
        },
        
        // 🏢 Business data using CORRECT Korean field names
        disclosure_data: {
            industry: investorData.comIndNm || null, // 유통/서비스
            business_category: investorData.comBzcarrCd || null, // 4
            operating_scale_code: investorData.operScaleCd || null, // 1
            operating_amount_billions: operatingAmountBillions, // Store original billions value
            operating_amount_text: investorData.operBoundAmt || null, // Original text: "252.5"
            operating_amount_display: operatingAmountBillions ? `${operatingAmountBillions}억원` : null, // "252.5억원"
            strategy_planner: investorData.strtplanerYn === 'Y' ? true : false, // Y/N
            pf_angel: investorData.pfAnglYn === 'Y' ? true : false, // Y/N
            investment_character: null,
            raw_data: investorData // Store complete original data
        },
        
        // Metadata
        apify_source: 'VCS_SCRAPER_V2.2.6_FIXED_BIGINT_DUPLICATES',
        created_at: new Date().toISOString(),
        updated_at: new Date().toISOString()
    };
}

/**
 * 🔧 CORRECTED: Transform Fund data using actual Korean API field names
 */
function transformFundForSupabase(fundData) {
    // Parse fund amount from Korean API (formTotamt is in billions of won)
    const fundAmountBillions = fundData.formTotamt ? parseFloat(fundData.formTotamt) : null;
    
    return {
        // 🎯 CRITICAL: Company ID links to VC table (same operInstId)
        company_id: fundData.operInstId || `fund_mgmt_${Date.now()}_${Math.random().toString(36).substr(2, 9)}`,
        
        // Fund identification using CORRECT Korean API field names with unique suffix
        fund_name: fundData.fundNm ? `${fundData.fundNm}_${fundData.operInstId}` : `Unknown Fund_${Date.now()}`, // Make unique
        fund_name_en: null,
        fund_type: fundData.invstFldTpNm || null, // 일반
        
        // 💰 CRITICAL FIX: Fund amounts as integers (rounded billions) for bigint compatibility
        commitment_amount: fundAmountBillions ? Math.round(fundAmountBillions) : null, // Convert 27.5 → 28
        fund_size: fundAmountBillions ? Math.round(fundAmountBillions) : null, // Rounded for bigint
        
        // Dates using CORRECT Korean API field names
        establishment_date: fundData.regDd || null, // 2023-04-26
        fund_status: null, // Not directly provided
        representative: null, // Not provided
        
        // Investment focus
        investment_focus: fundData.invstFldDtlTpNm ? [fundData.invstFldDtlTpNm] : [], // 중소/벤처일반
        
        // 💰 Fund details using CORRECT Korean field names
        fund_details: {
            fund_code: fundData.fundId || null, // AS20230326
            fund_id: fundData.fundId || null, // AS20230326
            management_company: fundData.operInstNm || null, // 힐스프링인베스트먼트
            management_company_id: fundData.operInstId || null, // OP20220223 (LINKS TO VC TABLE!)
            fund_scale_text: fundData.formTotamt ? `${fundData.formTotamt}억원` : null,
            fund_amount_billions: fundAmountBillions, // Store original billions value
            registration_date: fundData.regDd || null, // 2023-04-26
            expiry_date: fundData.expDd || null, // 2031-04-25
            investment_stage: fundData.invstFldTpNm || null, // 일반
            investment_character_code: fundData.invstCharcCd || null, // 02
            company_industry_code: fundData.comIndCd || null, // 9
            raw_data: fundData // Store complete original data
        },
        
        // Metadata
        apify_source: 'VCS_SCRAPER_V2.2.6_FIXED_BIGINT_DUPLICATES',
        created_at: new Date().toISOString(),
        updated_at: new Date().toISOString()
    };
}

/**
 * Upsert investors to Supabase with corrected transformations
 */
async function upsertInvestorsToSupabase(supabaseClient, investors) {
    let successCount = 0;
    let errorCount = 0;
    
    for (const investor of investors) {
        try {
            const transformedData = transformInvestorForSupabase(investor);
            
            const { data, error } = await supabaseClient
                .from('vc_table')
                .upsert(transformedData, {
                    onConflict: 'company_id',
                    ignoreDuplicates: false
                })
                .select();
                
            if (error) {
                console.log(`❌ Supabase error for ${transformedData.company_name}:`, error.message);
                errorCount++;
            } else {
                console.log(`✅ Upserted investor: ${transformedData.company_name}`);
                successCount++;
            }
        } catch (error) {
            console.log(`💥 Critical error upserting investor:`, error.message);
            errorCount++;
        }
    }
    
    console.log(`✅ Supabase upsert complete: ${successCount} success, ${errorCount} errors`);
}

/**
 * Upsert funds to Supabase with corrected transformations
 */
async function upsertFundsToSupabase(supabaseClient, funds) {
    let successCount = 0;
    let errorCount = 0;
    
    for (const fund of funds) {
        try {
            const transformedData = transformFundForSupabase(fund);
            
            const { data, error } = await supabaseClient
                .from('fund_table')
                .insert(transformedData)
                .select();
                
            if (error) {
                console.log(`❌ Supabase error for ${transformedData.fund_name}:`, error.message);
                errorCount++;
            } else {
                console.log(`✅ Upserted fund: ${transformedData.fund_name}`);
                successCount++;
            }
        } catch (error) {
            console.log(`💥 Critical error upserting fund:`, error.message);
            errorCount++;
        }
    }
    
    console.log(`✅ Supabase upsert complete: ${successCount} success, ${errorCount} errors`);
}

/**
 * Make HTTP request to VCS API
 */
async function makeRequest(url) {
    return new Promise((resolve, reject) => {
        const parsedUrl = new URL(url);
        const requestOptions = {
            hostname: parsedUrl.hostname,
            port: parsedUrl.port,
            path: parsedUrl.pathname + parsedUrl.search,
            method: 'GET',
            headers: {
                'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36',
                'Accept': 'application/json, text/plain, */*',
                'Accept-Language': 'ko-KR,ko;q=0.9,en;q=0.8',
                'Referer': 'https://www.vcs.go.kr/web/portal/investor/list'
            }
        };

        const req = https.request(requestOptions, (res) => {
            let data = '';
            res.on('data', (chunk) => {
                data += chunk;
            });
            res.on('end', () => {
                try {
                    if (data.trim().startsWith('{') || data.trim().startsWith('[')) {
                        const jsonData = JSON.parse(data);
                        resolve({ statusCode: res.statusCode, body: jsonData, success: true });
                    } else {
                        resolve({ statusCode: res.statusCode, body: data, success: false, error: 'NOT_JSON' });
                    }
                } catch (e) {
                    resolve({ statusCode: res.statusCode, body: data, success: false, error: 'JSON_PARSE_ERROR' });
                }
            });
        });

        req.on('error', (err) => {
            reject(err);
        });
        
        req.setTimeout(30000, () => {
            req.destroy();
            reject(new Error('Request timeout after 30 seconds'));
        });

        req.end();
    });
} 