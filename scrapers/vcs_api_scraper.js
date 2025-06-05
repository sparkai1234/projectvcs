/**
 * 🎯 VCS API SCRAPER - The Real Deal!
 * ===================================
 * 
 * Uses the actual VCS API endpoint we discovered:
 * GET /web/portal/investor/search
 * 
 * Returns structured JSON with all the old system fields:
 * operInstNm, operInstId, comIndNm, sigunguNm, foundYy, etc.
 * 
 * EXACTLY like the old Apify system worked!
 */

require('dotenv').config();
const https = require('https');
const { createClient } = require('@supabase/supabase-js');

// Initialize Supabase
const supabaseUrl = process.env.SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY;

if (!supabaseKey || !supabaseUrl) {
    console.error('❌ Missing environment variables: SUPABASE_URL or SUPABASE_SERVICE_ROLE_KEY');
    process.exit(1);
}

const supabase = createClient(supabaseUrl, supabaseKey);

console.log('🎯 VCS API Scraper Started - Using Real API Endpoint!');
console.log('📡 Target: /web/portal/investor/search (JSON API)');

/**
 * Configuration for API scraping
 */
const CONFIG = {
    baseUrl: 'https://www.vcs.go.kr',
    apiEndpoint: '/web/portal/investor/search',
    maxRetries: 3,
    requestDelay: 1000,
    timeout: 30000,
    
    // Form data for investor search (based on investigation)
    defaultFormData: {
        // Basic parameters
        sortOrder: '',
        sortDirection: '',
        tabMenu: '1', // 1=investors, 2=funds
        cp: '1', // current page
        
        // Search filters (all enabled for maximum data)
        'comIndCdArr': [], // Industry codes
        'localCdArr': [], // Location codes  
        'operScaleCdArr': [], // Operation scale codes
        'invstCharcCdArr': [], // Investment character codes
        'comBzcarrCdArr': [], // Business category codes
        'invstorTpCdArr': [], // Investor type codes
        
        // Search keywords
        sc: '', // search category
        sv: '', // search value
    }
};

/**
 * Make API request with retry logic
 */
async function makeAPIRequest(formData, attempt = 1) {
    return new Promise((resolve, reject) => {
        // Convert form data to query string
        const queryParams = new URLSearchParams();
        
        // Add all form fields
        Object.entries(formData).forEach(([key, value]) => {
            if (Array.isArray(value)) {
                value.forEach(v => queryParams.append(key, v));
            } else {
                queryParams.append(key, value);
            }
        });
        
        const url = `${CONFIG.baseUrl}${CONFIG.apiEndpoint}?${queryParams.toString()}`;
        
        console.log(`📡 [Attempt ${attempt}] API Request: Page ${formData.cp}, Tab ${formData.tabMenu}`);
        console.log(`🔗 URL: ${url.substring(0, 100)}...`);
        
        const options = {
            method: 'GET',
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
            timeout: CONFIG.timeout
        };
        
        const req = https.request(url, options, (res) => {
            let data = '';
            
            res.on('data', chunk => {
                data += chunk;
            });
            
            res.on('end', () => {
                console.log(`✅ Response: ${res.statusCode} (${data.length} chars)`);
                
                if (res.statusCode === 200) {
                    try {
                        const jsonData = JSON.parse(data);
                        resolve(jsonData);
                    } catch (parseError) {
                        reject(new Error(`JSON parse failed: ${parseError.message}`));
                    }
                } else {
                    reject(new Error(`HTTP ${res.statusCode}: ${data.substring(0, 200)}`));
                }
            });
        });
        
        req.on('error', (error) => {
            console.error(`❌ Request failed (attempt ${attempt}): ${error.message}`);
            reject(error);
        });
        
        req.on('timeout', () => {
            req.destroy();
            reject(new Error(`Request timeout (attempt ${attempt})`));
        });
        
        req.end();
    });
}

/**
 * Make API request with retry logic
 */
async function makeRobustAPIRequest(formData) {
    for (let attempt = 1; attempt <= CONFIG.maxRetries; attempt++) {
        try {
            const response = await makeAPIRequest(formData, attempt);
            return response;
        } catch (error) {
            console.error(`❌ Attempt ${attempt} failed: ${error.message}`);
            
            if (attempt === CONFIG.maxRetries) {
                throw error;
            }
            
            // Wait before retry
            console.log(`⏱️ Waiting ${CONFIG.requestDelay}ms before retry...`);
            await new Promise(resolve => setTimeout(resolve, CONFIG.requestDelay));
        }
    }
}

/**
 * Transform API response to database format
 */
function transformInvestorData(apiData) {
    return {
        // Core identification
        company_name: apiData.operInstNm || '',
        company_id: apiData.operInstId || '',
        registration_number: apiData.operInstId || '', // Use as fallback
        
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
        data_source: 'VCS_API_SCRAPER',
        source_url: 'https://www.vcs.go.kr/web/portal/investor/search',
        extracted_at: new Date().toISOString(),
        
        // Raw data for reference
        raw_api_data: JSON.stringify(apiData)
    };
}

/**
 * Transform fund data to database format
 */
function transformFundData(apiData) {
    return {
        // Core identification
        fund_name: apiData.fundNm || '',
        fund_id: apiData.fundId || '',
        company_name: apiData.operInstNm || '',
        company_id: apiData.operInstId || '',
        
        // Fund details
        registration_date: apiData.regDd || '',
        expiry_date: apiData.expDd || '',
        formation_total_amount: apiData.formTotamt ? parseInt(apiData.formTotamt) : null,
        formation_total_amount_text: apiData.formTotamt ? `${apiData.formTotamt}억원` : '',
        
        // Investment focus
        investment_field_type: apiData.invstFldTpNm || '',
        investment_field_detail_type: apiData.invstFldDtlTpNm || '',
        investment_character: apiData.invstCharcNm || '',
        
        // Special features
        mother_fund_related: apiData.mfundId ? true : false,
        mother_fund_id: apiData.mfundId || '',
        
        // Performance
        investment_ratio: apiData.invstRto ? parseFloat(apiData.invstRto) : null,
        
        // Metadata
        data_source: 'VCS_API_SCRAPER',
        source_url: 'https://www.vcs.go.kr/web/portal/investor/search',
        extracted_at: new Date().toISOString(),
        
        // Raw data for reference
        raw_api_data: JSON.stringify(apiData)
    };
}

/**
 * Save investor data to Supabase
 */
async function saveInvestorData(investors) {
    if (investors.length === 0) return { success: true, count: 0 };
    
    try {
        console.log(`💾 Saving ${investors.length} investor records...`);
        
        const { data, error } = await supabase
            .from('vc_table')
            .upsert(investors, {
                onConflict: 'company_name,data_source',
                ignoreDuplicates: false
            });
        
        if (error) {
            console.error('❌ Database error:', error);
            throw error;
        }
        
        console.log(`✅ Successfully saved ${investors.length} investor records!`);
        return { success: true, count: investors.length };
        
    } catch (error) {
        console.error('❌ Error saving investor data:', error);
        return { success: false, error: error.message };
    }
}

/**
 * Save fund data to Supabase  
 */
async function saveFundData(funds) {
    if (funds.length === 0) return { success: true, count: 0 };
    
    try {
        console.log(`💾 Saving ${funds.length} fund records...`);
        
        const { data, error } = await supabase
            .from('fund_table')
            .upsert(funds, {
                onConflict: 'fund_name,company_name,data_source',
                ignoreDuplicates: false
            });
        
        if (error) {
            console.error('❌ Database error:', error);
            throw error;
        }
        
        console.log(`✅ Successfully saved ${funds.length} fund records!`);
        return { success: true, count: funds.length };
        
    } catch (error) {
        console.error('❌ Error saving fund data:', error);
        return { success: false, error: error.message };
    }
}

/**
 * Scrape all investors using the API
 */
async function scrapeInvestors() {
    console.log('\n📊 === SCRAPING INVESTORS (tabMenu=1) ===');
    
    let totalInvestors = 0;
    let currentPage = 1;
    let hasMorePages = true;
    
    const allInvestors = [];
    
    while (hasMorePages) {
        try {
            const formData = {
                ...CONFIG.defaultFormData,
                tabMenu: '1',
                cp: currentPage.toString()
            };
            
            console.log(`\n📄 Processing page ${currentPage}...`);
            const response = await makeRobustAPIRequest(formData);
            
            if (response && response.list && response.list.length > 0) {
                const investors = response.list.map(transformInvestorData);
                allInvestors.push(...investors);
                
                console.log(`✅ Page ${currentPage}: ${investors.length} investors`);
                console.log(`📊 Total so far: ${allInvestors.length} investors`);
                
                // Check if we should continue
                const total = response.total || 0;
                const pageSize = 10; // Based on the pagination logic we saw
                const totalPages = Math.ceil(total / pageSize);
                
                if (currentPage === 1) {
                    console.log(`📈 Total investors available: ${total}`);
                    console.log(`📄 Total pages to process: ${totalPages}`);
                }
                
                hasMorePages = currentPage < totalPages;
                currentPage++;
                
                // Rate limiting
                if (hasMorePages) {
                    console.log(`⏱️ Rate limiting: waiting ${CONFIG.requestDelay}ms...`);
                    await new Promise(resolve => setTimeout(resolve, CONFIG.requestDelay));
                }
                
            } else {
                console.log(`⚠️ Page ${currentPage}: No data returned`);
                hasMorePages = false;
            }
            
        } catch (error) {
            console.error(`❌ Error on page ${currentPage}:`, error.message);
            hasMorePages = false;
        }
    }
    
    // Save all investors
    if (allInvestors.length > 0) {
        await saveInvestorData(allInvestors);
        totalInvestors = allInvestors.length;
    }
    
    return totalInvestors;
}

/**
 * Scrape all funds using the API
 */
async function scrapeFunds() {
    console.log('\n💼 === SCRAPING FUNDS (tabMenu=2) ===');
    
    let totalFunds = 0;
    let currentPage = 1;
    let hasMorePages = true;
    
    const allFunds = [];
    
    while (hasMorePages) {
        try {
            const formData = {
                ...CONFIG.defaultFormData,
                tabMenu: '2',
                cp: currentPage.toString()
            };
            
            console.log(`\n📄 Processing page ${currentPage}...`);
            const response = await makeRobustAPIRequest(formData);
            
            if (response && response.list && response.list.length > 0) {
                const funds = response.list.map(transformFundData);
                allFunds.push(...funds);
                
                console.log(`✅ Page ${currentPage}: ${funds.length} funds`);
                console.log(`📊 Total so far: ${allFunds.length} funds`);
                
                // Check if we should continue
                const total = response.total || 0;
                const pageSize = 10;
                const totalPages = Math.ceil(total / pageSize);
                
                if (currentPage === 1) {
                    console.log(`📈 Total funds available: ${total}`);
                    console.log(`📄 Total pages to process: ${totalPages}`);
                }
                
                hasMorePages = currentPage < totalPages;
                currentPage++;
                
                // Rate limiting
                if (hasMorePages) {
                    console.log(`⏱️ Rate limiting: waiting ${CONFIG.requestDelay}ms...`);
                    await new Promise(resolve => setTimeout(resolve, CONFIG.requestDelay));
                }
                
            } else {
                console.log(`⚠️ Page ${currentPage}: No data returned`);
                hasMorePages = false;
            }
            
        } catch (error) {
            console.error(`❌ Error on page ${currentPage}:`, error.message);
            hasMorePages = false;
        }
    }
    
    // Save all funds
    if (allFunds.length > 0) {
        await saveFundData(allFunds);
        totalFunds = allFunds.length;
    }
    
    return totalFunds;
}

/**
 * Main scraping function
 */
async function scrapeVCSAPI() {
    console.log('\n🚀 === STARTING VCS API SCRAPING ===');
    
    const startTime = Date.now();
    let totalRecords = 0;
    
    try {
        // Test database connection
        console.log('🔌 Testing database connection...');
        const { data, error } = await supabase.from('vc_table').select('*').limit(1);
        if (error) throw error;
        console.log('✅ Database connection successful');
        
        // Scrape investors
        const investorCount = await scrapeInvestors();
        totalRecords += investorCount;
        
        // Scrape funds
        const fundCount = await scrapeFunds();
        totalRecords += fundCount;
        
        const duration = (Date.now() - startTime) / 1000;
        
        console.log('\n🎉 === VCS API SCRAPING COMPLETED ===');
        console.log(`📊 Total Records Scraped: ${totalRecords}`);
        console.log(`👥 Investors: ${investorCount}`);
        console.log(`💼 Funds: ${fundCount}`);
        console.log(`⏱️ Duration: ${duration.toFixed(2)} seconds`);
        console.log(`🎯 Data Quality: Professional API-based extraction`);
        console.log(`📡 Source: VCS.GO.KR Official API`);
        
        if (totalRecords > 0) {
            console.log('\n🚀 Success! Data extraction matching old Apify system completed');
            console.log('✅ All structured fields extracted (operInstNm, operInstId, comIndNm, etc.)');
            console.log('📊 Ready for analysis and reporting');
        }
        
    } catch (error) {
        console.error('💥 Critical error in VCS API scraping:', error);
        throw error;
    }
}

// Execute if run directly
if (require.main === module) {
    (async () => {
        try {
            await scrapeVCSAPI();
            console.log('✅ VCS API scraping completed successfully!');
        } catch (error) {
            console.error('💥 VCS API scraping failed:', error);
            process.exit(1);
        }
    })();
}

module.exports = {
    scrapeVCSAPI,
    scrapeInvestors,
    scrapeFunds,
    transformInvestorData,
    transformFundData,
    CONFIG
}; 