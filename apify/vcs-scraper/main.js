/**
 * 🇰🇷 VCS WEEKLY SCRAPER - APIFY ACTOR v2.2.0 - SUPABASE INTEGRATED EXTRACTION
 * ===============================================================================
 * 
 * UNLIMITED EXTRACTION UPDATE:
 * - Automatically extracts FULL dataset (717 investors + 3689 funds)
 * - Smart pagination: calculates total pages from API response
 * - No artificial maxPages limit for complete data
 * - Fixed missing tabMenu parameter handling (like local scraper)
 * - Enhanced debugging to see actual API responses
 * - Fixed Apify SDK v3 compatibility (Actor.main instead of Apify.main)
 * - Uses REAL VCS API endpoints (like proven local scraper)
 * - Direct /web/portal/investor/search API calls
 * - Full pagination support for complete dataset
 * - Targets ALL available records (4,400+ total)
 * - Structured JSON responses instead of HTML parsing
 * - Professional API-based extraction approach
 */

const { Actor } = require('apify');
const { createClient } = require('@supabase/supabase-js');
const https = require('https');

// VCS API Configuration (based on proven local scraper)
const VCS_API_CONFIG = {
    baseUrl: 'https://www.vcs.go.kr',
    searchEndpoint: '/web/portal/investor/search',
    headers: {
        'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        'Accept': 'application/json, text/javascript, */*; q=0.01',
        'Accept-Language': 'ko-KR,ko;q=0.9,en;q=0.8',
        'Accept-Encoding': 'gzip, deflate, br',
        'Connection': 'keep-alive',
        'Cache-Control': 'no-cache',
        'X-Requested-With': 'XMLHttpRequest',
        'Referer': 'https://www.vcs.go.kr/web/portal/investor/list'
    },
    defaultParams: {
        sortOrder: '',
        sortDirection: '',
        cp: '1',
        sc: '',
        sv: '',
        comIndCdArr: [],
        localCdArr: [],
        operScaleCdArr: [],
        invstCharcCdArr: [],
        comBzcarrCdArr: [],
        invstorTpCdArr: []
    }
};

// Supabase Configuration
const SUPABASE_CONFIG = {
    url: 'https://udfgtccxbqmalgpqyxzz.supabase.co',
    // Supabase credentials will come from Actor input or environment
    key: null, // Will be set from input
    client: null // Will be initialized when credentials are available
};

Actor.main(async () => {
    console.log('🇰🇷 VCS Weekly Scraper Actor Started - v2.2.0 - SUPABASE INTEGRATED');
    console.log(`🕐 Execution time: ${new Date().toISOString()}`);
    
    // Get input configuration
    const input = await Actor.getInput() || {};
    const {
        updateMode = 'incremental',
        maxPages = 999, // High default for complete extraction
        dataSource = 'both',
        exportToSupabase = false,
        testMode = false,
        unlimitedExtraction = true // New parameter for complete dataset
    } = input;
    
    // Initialize Supabase if credentials are provided
    let supabaseClient = null;
    if (exportToSupabase) {
        const supabaseUrl = input.supabaseUrl || process.env.SUPABASE_URL || SUPABASE_CONFIG.url;
        const supabaseKey = input.supabaseKey || process.env.SUPABASE_SERVICE_ROLE_KEY || process.env.SUPABASE_KEY;
        
        console.log('🔍 SUPABASE CREDENTIAL DEBUG:');
        console.log(`URL from input: ${input.supabaseUrl ? 'PROVIDED' : 'NOT PROVIDED'}`);
        console.log(`Key from input: ${input.supabaseKey ? 'PROVIDED' : 'NOT PROVIDED'}`);
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
                
                // Test connection immediately
                console.log('🧪 Testing Supabase connection...');
                const { data, error } = await supabaseClient
                    .from('vc_table')
                    .select('count(*)', { count: 'exact', head: true });
                    
                if (error) {
                    console.log('❌ Supabase connection test failed:', error.message);
                } else {
                    console.log('✅ Supabase connection test successful!');
                }
                
            } catch (error) {
                console.error('❌ Failed to initialize Supabase client:', error.message);
                console.log('⚠️ Continuing without Supabase integration...');
                supabaseClient = null;
            }
        } else {
            console.log('⚠️ Missing Supabase credentials - continuing without database integration');
            console.log('💡 To enable Supabase: provide supabaseUrl and supabaseKey in Actor input');
        }
    }
    
    console.log('⚙️ Actor Configuration loaded:');
    console.log(`📊 Update Mode: ${updateMode}`);
    console.log(`📄 Max Pages: ${maxPages}`);
    console.log(`🎯 Data Source: ${dataSource}`);
    console.log(`💾 Export to Supabase: ${exportToSupabase}`);
    console.log(`🔗 Supabase Client Ready: ${!!supabaseClient}`);
    console.log(`🧪 Test Mode: ${testMode}`);
    console.log(`🚀 Unlimited Extraction: ${unlimitedExtraction}`);
    console.log(`📍 Platform: Apify Cloud`);
    console.log(`🔧 Optimization: v2.1.3 with UNLIMITED EXTRACTION (Complete Dataset)`);
    console.log(`🎯 Target: ${VCS_API_CONFIG.baseUrl}${VCS_API_CONFIG.searchEndpoint}`);
    
    console.log('🚀 Starting VCS data extraction with API-POWERED workflow...');
    
    try {
        const results = await scrapeVCSWithAPI({ updateMode, maxPages, dataSource, testMode, unlimitedExtraction, supabaseClient, exportToSupabase });
        
        // Save final results to Apify dataset
        await Actor.pushData({
            timestamp: new Date().toISOString(),
            source: 'VCS_WEEKLY_SCRAPER_APIFY_API_POWERED',
            version: '2.1.3',
            updateMode,
            dataSource,
            success: true,
            totalRecords: results.totalRecords,
            investors: results.investors,
            funds: results.funds,
            executionTime: results.executionTime,
            platform: 'Apify Cloud',
            executionId: process.env.APIFY_ACT_RUN_ID,
            optimization_version: '2.1.3',
            breakthrough: 'UNLIMITED EXTRACTION: Complete dataset (717 investors + 3689 funds)',
            target_volume: {
                expected_investors: '717',
                expected_funds: '3689',
                total_expected: '4406',
                achieved_investors: results.investors,
                achieved_funds: results.funds,
                achievement_rate: `${Math.round((results.totalRecords / 4406) * 100)}%`
            }
        });

        console.log('🎉 === VCS WEEKLY SCRAPING COMPLETED (API-POWERED) ===');
        console.log(`📊 Total records extracted: ${results.totalRecords}`);
        console.log(`👥 Investors: ${results.investors}`);
        console.log(`💰 Funds: ${results.funds}`);
        console.log(`⏱️ Total duration: ${results.executionTime} seconds`);
        console.log(`📅 Update mode: ${updateMode}`);
        console.log(`🏷️ Data source: ${dataSource}`);
        console.log(`📍 Platform: Apify Cloud`);
        console.log(`🔧 Optimization: v2.1.3 with UNLIMITED EXTRACTION (Complete Dataset)`);
        console.log(`🎯 API Endpoint: ${VCS_API_CONFIG.baseUrl}${VCS_API_CONFIG.searchEndpoint}`);
        
        console.log('✅ VCS Weekly Scraper Actor completed with API-POWERED workflow');
        
    } catch (error) {
        console.error('💥 VCS scraping failed:', error);
        
        // Save error information
        await Actor.pushData({
            timestamp: new Date().toISOString(),
            source: 'VCS_WEEKLY_SCRAPER_APIFY_API_POWERED',
            version: '2.1.1',
            success: false,
            error: error.message,
            errorStack: error.stack,
            updateMode,
            dataSource,
            platform: 'Apify Cloud',
            executionId: process.env.APIFY_ACT_RUN_ID,
            optimization_version: '2.1.1',
            breakthrough: 'FAILED: API-powered + SDK fixed approach encountered error'
        });
        
        throw error;
    }
});

/**
 * API-powered VCS scraping function
 */
async function scrapeVCSWithAPI({ updateMode, maxPages, dataSource, testMode, unlimitedExtraction, supabaseClient, exportToSupabase }) {
    const startTime = Date.now();
    let totalInvestors = 0;
    let totalFunds = 0;
    
    console.log('🌐 Starting VCS API-powered scraping...');
    console.log(`🎯 Using proven API endpoint: ${VCS_API_CONFIG.baseUrl}${VCS_API_CONFIG.searchEndpoint}`);
    
    try {
        // Scrape investors if needed
        if (dataSource === 'investors' || dataSource === 'both') {
            console.log('\n👥 === SCRAPING INVESTORS (tabMenu=1) ===');
            totalInvestors = await scrapeVCSInvestorsAPI({ maxPages, testMode, unlimitedExtraction, supabaseClient, exportToSupabase });
        }
        
        // Scrape funds if needed  
        if (dataSource === 'funds' || dataSource === 'both') {
            console.log('\n💰 === SCRAPING FUNDS (tabMenu=2) ===');
            totalFunds = await scrapeVCSFundsAPI({ maxPages, testMode, unlimitedExtraction, supabaseClient, exportToSupabase });
        }
        
        const executionTime = Math.round((Date.now() - startTime) / 1000);
        const totalRecords = totalInvestors + totalFunds;
        
        return {
            totalRecords,
            investors: totalInvestors,
            funds: totalFunds,
            executionTime
        };
        
    } catch (error) {
        console.error('💥 API scraping failed:', error);
        throw error;
    }
}

/**
 * Scrape investors using VCS API
 */
async function scrapeVCSInvestorsAPI({ maxPages, testMode, unlimitedExtraction, supabaseClient, exportToSupabase }) {
    console.log('📊 Starting investor API scraping...');
    
    let totalInvestors = 0;
    let currentPage = 1;
    let hasMorePages = true;
    
    const allInvestors = [];
    
    while (hasMorePages && currentPage <= maxPages) {
        try {
            console.log(`📄 Processing investor page ${currentPage}...`);
            
            // Build API URL with parameters (exactly like local scraper)
            const formData = {
                ...VCS_API_CONFIG.defaultParams,
                tabMenu: '1',  // Critical: Investors tab
                cp: currentPage.toString()
            };
            
            const params = new URLSearchParams();
            Object.entries(formData).forEach(([key, value]) => {
                if (Array.isArray(value)) {
                    value.forEach(v => params.append(key, v));
                } else {
                    params.append(key, value);
                }
            });
            
            const apiUrl = `${VCS_API_CONFIG.baseUrl}${VCS_API_CONFIG.searchEndpoint}?${params.toString()}`;
            console.log(`🔗 API URL: ${apiUrl.substring(0, 100)}...`);
            
            // Make API request
            const response = await makeVCSAPIRequest(apiUrl);
            
            if (response && response.list && response.list.length > 0) {
                const investors = response.list.map(transformInvestorData);
                allInvestors.push(...investors);
                
                console.log(`✅ Page ${currentPage}: ${investors.length} investors`);
                console.log(`📊 Total investors so far: ${allInvestors.length}`);
                
                // Upsert to Supabase if enabled
                console.log(`🔍 DEBUG: exportToSupabase=${exportToSupabase}, supabaseClient=${!!supabaseClient}`);
                if (exportToSupabase && supabaseClient) {
                    console.log(`💾 Upserting ${investors.length} investors to Supabase...`);
                    let successCount = 0;
                    let errorCount = 0;
                    
                    for (const investor of investors) {
                        const result = await upsertInvestorToSupabase(supabaseClient, investor);
                        if (result.success) {
                            successCount++;
                        } else {
                            errorCount++;
                        }
                        
                        // Rate limiting for Supabase
                        await new Promise(resolve => setTimeout(resolve, 100));
                    }
                    
                    console.log(`✅ Supabase upsert complete: ${successCount} success, ${errorCount} errors`);
                }
                
                // Check pagination  
                const total = response.total || 0;
                const pageSize = 10;
                const totalPages = Math.ceil(total / pageSize);
                
                if (currentPage === 1) {
                    console.log(`📈 Total investors available: ${total}`);
                    if (unlimitedExtraction) {
                        console.log(`📄 Total pages to process: ${totalPages} (UNLIMITED EXTRACTION)`);
                    } else {
                        console.log(`📄 Total pages to process: ${Math.min(totalPages, maxPages)} (limited by maxPages)`);
                    }
                }
                
                // Smart pagination: unlimited extraction or respect maxPages
                if (unlimitedExtraction) {
                    hasMorePages = currentPage < totalPages;
                } else {
                    hasMorePages = currentPage < totalPages && currentPage < maxPages;
                }
                currentPage++;
                
                // Rate limiting
                if (hasMorePages) {
                    console.log(`⏱️ Rate limiting: waiting 1000ms...`);
                    await new Promise(resolve => setTimeout(resolve, 1000));
                }
                
            } else {
                console.log(`⚠️ Page ${currentPage}: No data returned`);
                hasMorePages = false;
            }
            
            // Test mode: only first page
            if (testMode && currentPage > 1) {
                console.log('🧪 Test mode: stopping after first page');
                hasMorePages = false;
            }
            
        } catch (error) {
            console.error(`❌ Error on investor page ${currentPage}:`, error.message);
            hasMorePages = false;
        }
    }
    
    totalInvestors = allInvestors.length;
    
    // Store investors in Apify dataset
    if (allInvestors.length > 0) {
        console.log(`💾 Saving ${allInvestors.length} investors to Apify dataset...`);
        await Actor.pushData({
            type: 'investors',
            count: allInvestors.length,
            data: allInvestors,
            timestamp: new Date().toISOString(),
            source: 'VCS_API_INVESTORS'
        });
    }
    
    return totalInvestors;
}

/**
 * Scrape funds using VCS API
 */
async function scrapeVCSFundsAPI({ maxPages, testMode, unlimitedExtraction, supabaseClient, exportToSupabase }) {
    console.log('💰 Starting funds API scraping...');
    
    let totalFunds = 0;
    let currentPage = 1;
    let hasMorePages = true;
    
    const allFunds = [];
    
    while (hasMorePages && currentPage <= maxPages) {
        try {
            console.log(`📄 Processing funds page ${currentPage}...`);
            
            // Build API URL with parameters (exactly like local scraper)
            const formData = {
                ...VCS_API_CONFIG.defaultParams,
                tabMenu: '2',  // Critical: Funds tab
                cp: currentPage.toString()
            };
            
            const params = new URLSearchParams();
            Object.entries(formData).forEach(([key, value]) => {
                if (Array.isArray(value)) {
                    value.forEach(v => params.append(key, v));
                } else {
                    params.append(key, value);
                }
            });
            
            const apiUrl = `${VCS_API_CONFIG.baseUrl}${VCS_API_CONFIG.searchEndpoint}?${params.toString()}`;
            console.log(`🔗 API URL: ${apiUrl.substring(0, 100)}...`);
            
            // Make API request
            const response = await makeVCSAPIRequest(apiUrl);
            
            if (response && response.list && response.list.length > 0) {
                const funds = response.list.map(transformFundData);
                allFunds.push(...funds);
                
                console.log(`✅ Page ${currentPage}: ${funds.length} funds`);
                console.log(`📊 Total funds so far: ${allFunds.length}`);
                
                // Upsert to Supabase if enabled
                console.log(`🔍 DEBUG: exportToSupabase=${exportToSupabase}, supabaseClient=${!!supabaseClient}`);
                if (exportToSupabase && supabaseClient) {
                    console.log(`💾 Upserting ${funds.length} funds to Supabase...`);
                    let successCount = 0;
                    let errorCount = 0;
                    
                    for (const fund of funds) {
                        const result = await upsertFundToSupabase(supabaseClient, fund);
                        if (result.success) {
                            successCount++;
                        } else {
                            errorCount++;
                        }
                        
                        // Rate limiting for Supabase
                        await new Promise(resolve => setTimeout(resolve, 100));
                    }
                    
                    console.log(`✅ Supabase upsert complete: ${successCount} success, ${errorCount} errors`);
                }
                
                // Check pagination
                const total = response.total || 0;
                const pageSize = 10;
                const totalPages = Math.ceil(total / pageSize);
                
                if (currentPage === 1) {
                    console.log(`📈 Total funds available: ${total}`);
                    if (unlimitedExtraction) {
                        console.log(`📄 Total pages to process: ${totalPages} (UNLIMITED EXTRACTION)`);
                    } else {
                        console.log(`📄 Total pages to process: ${Math.min(totalPages, maxPages)} (limited by maxPages)`);
                    }
                }
                
                // Smart pagination: unlimited extraction or respect maxPages
                if (unlimitedExtraction) {
                    hasMorePages = currentPage < totalPages;
                } else {
                    hasMorePages = currentPage < totalPages && currentPage < maxPages;
                }
                currentPage++;
                
                // Rate limiting
                if (hasMorePages) {
                    console.log(`⏱️ Rate limiting: waiting 1000ms...`);
                    await new Promise(resolve => setTimeout(resolve, 1000));
                }
                
            } else {
                console.log(`⚠️ Page ${currentPage}: No data returned`);
                hasMorePages = false;
            }
            
            // Test mode: only first page
            if (testMode && currentPage > 1) {
                console.log('🧪 Test mode: stopping after first page');
                hasMorePages = false;
            }
            
        } catch (error) {
            console.error(`❌ Error on funds page ${currentPage}:`, error.message);
            hasMorePages = false;
        }
    }
    
    totalFunds = allFunds.length;
    
    // Store funds in Apify dataset
    if (allFunds.length > 0) {
        console.log(`💾 Saving ${allFunds.length} funds to Apify dataset...`);
        await Actor.pushData({
            type: 'funds',
            count: allFunds.length,
            data: allFunds,
            timestamp: new Date().toISOString(),
            source: 'VCS_API_FUNDS'
        });
    }
    
    return totalFunds;
}

/**
 * Make VCS API request with proper headers
 */
async function makeVCSAPIRequest(url) {
    return new Promise((resolve, reject) => {
        const options = {
            method: 'GET',
            headers: VCS_API_CONFIG.headers,
            timeout: 30000
        };
        
        const req = https.get(url, options, (res) => {
            let data = '';
            
            res.on('data', chunk => {
                data += chunk;
            });
            
            res.on('end', () => {
                console.log(`✅ API Response: ${res.statusCode} (${data.length} chars)`);
                
                if (res.statusCode === 200) {
                    try {
                        // Debug: Show first part of response
                        console.log(`🔍 Response preview: ${data.substring(0, 200)}...`);
                        
                        const jsonData = JSON.parse(data);
                        console.log(`📊 Parsed JSON keys: [${Object.keys(jsonData).join(', ')}]`);
                        if (jsonData.list) {
                            console.log(`📋 List length: ${jsonData.list.length}`);
                        }
                        if (jsonData.total !== undefined) {
                            console.log(`📈 Total count: ${jsonData.total}`);
                        }
                        
                        resolve(jsonData);
                    } catch (parseError) {
                        console.log(`❌ Raw response causing parse error: ${data}`);
                        reject(new Error(`JSON parse failed: ${parseError.message}`));
                    }
                } else {
                    reject(new Error(`HTTP ${res.statusCode}: ${data.substring(0, 200)}`));
                }
            });
        });
        
        req.on('error', (error) => {
            reject(error);
        });
        
        req.on('timeout', () => {
            req.destroy();
            reject(new Error('Request timeout'));
        });
        
        req.end();
    });
}

/**
 * Transform investor API data to structured format
 */
function transformInvestorData(apiData) {
    return {
        // Core identification
        company_name: apiData.operInstNm || '',
        company_id: apiData.operInstId || '',
        registration_number: apiData.operInstId || '',
        
        // Company details
        representative: apiData.repNm || '',
        establishment_date: apiData.foundYy ? `${apiData.foundYy}-01-01` : null,
        address: apiData.headofcAddr || '',
        zip_code: apiData.headofcZipcd || '',
        phone: apiData.telno || '',
        
        // Business information
        business_type: apiData.operInstTpNm || '',
        business_category: apiData.comBzcarrCd || '',
        industry: apiData.comIndNm || '',
        location: apiData.sigunguNm || '',
        
        // Financial information
        operating_scale: apiData.operScaleCd || '',
        operating_amount: apiData.operBoundAmt ? parseInt(apiData.operBoundAmt) : null,
        operating_amount_text: apiData.operBoundAmt ? `${apiData.operBoundAmt}억원` : '',
        
        // Special characteristics
        strategy_planner: apiData.strtplanerYn === 'Y' ? 'Yes' : 'No',
        professional_angel: apiData.pfAnglYn === 'Y' ? 'Yes' : 'No',
        investment_character: apiData.invstCharcNm || '',
        
        // Metadata
        data_source: 'VCS_API_APIFY',
        source_url: VCS_API_CONFIG.baseUrl + VCS_API_CONFIG.searchEndpoint,
        extracted_at: new Date().toISOString(),
        
        // Raw data for reference
        raw_api_data: JSON.stringify(apiData)
    };
}

/**
 * Transform fund API data to structured format
 */
function transformFundData(apiData) {
    return {
        // Core fund information
        fund_name: apiData.fundNm || '',
        fund_id: apiData.fundId || '',
        fund_code: apiData.fundCd || '',
        
        // Management information
        management_company: apiData.mngcoNm || '',
        management_company_id: apiData.mngcoId || '',
        
        // Fund details
        fund_type: apiData.fundTpNm || '',
        fund_scale: apiData.fundScale ? parseInt(apiData.fundScale) : null,
        fund_scale_text: apiData.fundScale ? `${apiData.fundScale}억원` : '',
        establishment_date: apiData.foundDt || '',
        duration_years: apiData.durtnYy ? parseInt(apiData.durtnYy) : null,
        
        // Investment focus
        investment_field: apiData.invstFldNm || '',
        investment_stage: apiData.invstStageNm || '',
        investment_region: apiData.invstRegnNm || '',
        
        // Fund status
        fund_status: apiData.fundStatNm || '',
        closing_status: apiData.clsingStatNm || '',
        
        // Metadata
        data_source: 'VCS_API_APIFY',
        source_url: VCS_API_CONFIG.baseUrl + VCS_API_CONFIG.searchEndpoint,
        extracted_at: new Date().toISOString(),
        
        // Raw data for reference
        raw_api_data: JSON.stringify(apiData)
    };
}

/**
 * Transform investor data for Supabase vc_table
 */
function transformInvestorForSupabase(investorData) {
    return {
        // Primary identifier - ensure uniqueness
        company_id: investorData.company_id || investorData.registration_number || `vc_${Date.now()}_${Math.random().toString(36).substr(2, 9)}`,
        company_name: investorData.company_name || 'Unknown Company',
        company_name_en: null, // VCS doesn't provide English names
        
        // Location and representative info
        location: investorData.location || investorData.address || null,
        representative: investorData.representative || null,
        established_date: investorData.establishment_date || null,
        company_type: investorData.business_type || investorData.business_category || null,
        website_url: null, // VCS API doesn't provide website URLs
        
        // Contact information as JSONB
        contact_info: {
            address: investorData.address || null,
            zip_code: investorData.zip_code || null,
            phone: investorData.phone || null,
            fax: null,
            email: null
        },
        
        // Disclosure data as JSONB
        disclosure_data: {
            industry: investorData.industry || null,
            business_category: investorData.business_category || null,
            operating_scale: investorData.operating_scale || null,
            operating_amount: investorData.operating_amount || null,
            operating_amount_text: investorData.operating_amount_text || null,
            strategy_planner: investorData.strategy_planner || null,
            pf_angel: investorData.professional_angel || null,
            investment_character: investorData.investment_character || null,
            raw_data: JSON.parse(investorData.raw_api_data || '{}')
        },
        
        // Metadata
        apify_source: 'VCS_SCRAPER_V2.1.3_SUPABASE_INTEGRATED',
        created_at: new Date().toISOString(),
        updated_at: new Date().toISOString()
    };
}

/**
 * Transform fund data for Supabase fund_table
 */
function transformFundForSupabase(fundData) {
    return {
        // Use management company ID as the company_id to link to vc_table
        company_id: fundData.management_company_id || fundData.fund_id || `fund_mgmt_${Date.now()}_${Math.random().toString(36).substr(2, 9)}`,
        fund_name: fundData.fund_name || 'Unknown Fund',
        fund_name_en: null, // VCS doesn't provide English names
        fund_type: fundData.fund_type || null,
        
        // Financial information
        commitment_amount: null, // VCS doesn't provide commitment amount
        fund_size: fundData.fund_scale || null,
        establishment_date: fundData.establishment_date ? new Date(fundData.establishment_date).toISOString().split('T')[0] : null,
        fund_status: fundData.fund_status || fundData.closing_status || null,
        representative: null, // VCS doesn't provide fund representative
        
        // Investment focus as array
        investment_focus: fundData.investment_field ? [fundData.investment_field] : [],
        
        // Fund details as JSONB
        fund_details: {
            fund_code: fundData.fund_code || null,
            management_company: fundData.management_company || null,
            management_company_id: fundData.management_company_id || null,
            fund_scale_text: fundData.fund_scale_text || null,
            duration_years: fundData.duration_years || null,
            investment_stage: fundData.investment_stage || null,
            investment_region: fundData.investment_region || null,
            closing_status: fundData.closing_status || null,
            raw_data: JSON.parse(fundData.raw_api_data || '{}')
        },
        
        // Metadata
        apify_source: 'VCS_SCRAPER_V2.1.3_SUPABASE_INTEGRATED',
        created_at: new Date().toISOString(),
        updated_at: new Date().toISOString()
    };
}

/**
 * Upsert investor data to Supabase
 */
async function upsertInvestorToSupabase(supabaseClient, investorData) {
    if (!supabaseClient) return { success: false, error: 'No Supabase client' };
    
    try {
        const supabaseData = transformInvestorForSupabase(investorData);
        
        const { data, error } = await supabaseClient
            .from('vc_table')
            .upsert(supabaseData, {
                onConflict: 'company_id',
                ignoreDuplicates: false
            })
            .select();
            
        if (error) {
            console.error(`❌ Supabase upsert error for ${supabaseData.company_name}:`, error.message);
            return { success: false, error: error.message };
        }
        
        console.log(`✅ Upserted investor: ${supabaseData.company_name}`);
        return { success: true, data };
        
    } catch (error) {
        console.error(`💥 Critical error upserting investor:`, error.message);
        return { success: false, error: error.message };
    }
}

/**
 * Upsert fund data to Supabase
 */
async function upsertFundToSupabase(supabaseClient, fundData) {
    if (!supabaseClient) return { success: false, error: 'No Supabase client' };
    
    try {
        const supabaseData = transformFundForSupabase(fundData);
        
        const { data, error } = await supabaseClient
            .from('fund_table')
            .upsert(supabaseData, {
                onConflict: 'fund_name', // Using fund_name as unique identifier
                ignoreDuplicates: false
            })
            .select();
            
        if (error) {
            console.error(`❌ Supabase upsert error for ${supabaseData.fund_name}:`, error.message);
            return { success: false, error: error.message };
        }
        
        console.log(`✅ Upserted fund: ${supabaseData.fund_name}`);
        return { success: true, data };
        
    } catch (error) {
        console.error(`💥 Critical error upserting fund:`, error.message);
        return { success: false, error: error.message };
    }
} 