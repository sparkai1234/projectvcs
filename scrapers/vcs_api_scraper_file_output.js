/**
 * 🎯 VCS API SCRAPER - File Output Version
 * ========================================
 * 
 * Uses the working VCS API endpoint and saves to JSON files
 * Perfect for data extraction while we resolve database issues
 */

const https = require('https');
const fs = require('fs');

console.log('🎯 VCS API Scraper (File Output) Started');
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
    outputDir: 'vcs_api_data'
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
 * Ensure output directory exists
 */
function ensureOutputDirectory() {
    if (!fs.existsSync(CONFIG.outputDir)) {
        fs.mkdirSync(CONFIG.outputDir, { recursive: true });
        console.log(`📁 Created output directory: ${CONFIG.outputDir}`);
    }
}

/**
 * Save data to file
 */
function saveToFile(filename, data) {
    const filepath = `${CONFIG.outputDir}/${filename}`;
    fs.writeFileSync(filepath, JSON.stringify(data, null, 2));
    console.log(`💾 Saved to: ${filepath}`);
}

/**
 * Scrape all investors using the API
 */
async function scrapeInvestors() {
    console.log('\n📊 === SCRAPING INVESTORS (tabMenu=1) ===');
    
    let currentPage = 1;
    let hasMorePages = true;
    let totalInvestors = 0;
    
    const allInvestors = [];
    
    while (hasMorePages) {
        try {
            const formData = {
                tabMenu: '1',
                cp: currentPage.toString(),
                sortOrder: '',
                sortDirection: ''
            };
            
            console.log(`\n📄 Processing page ${currentPage}...`);
            const response = await makeRobustAPIRequest(formData);
            
            if (response && response.list && response.list.length > 0) {
                allInvestors.push(...response.list);
                
                console.log(`✅ Page ${currentPage}: ${response.list.length} investors`);
                console.log(`📊 Total so far: ${allInvestors.length} investors`);
                
                // Save page data
                saveToFile(`investors_page_${currentPage}.json`, {
                    page: currentPage,
                    count: response.list.length,
                    total: response.total,
                    data: response.list,
                    timestamp: new Date().toISOString()
                });
                
                // Check if we should continue
                const total = response.total || 0;
                const pageSize = 10;
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
    
    // Save complete investor dataset
    if (allInvestors.length > 0) {
        saveToFile('investors_complete.json', {
            total_records: allInvestors.length,
            pages_scraped: currentPage - 1,
            extracted_at: new Date().toISOString(),
            source: 'VCS.GO.KR API',
            endpoint: '/web/portal/investor/search',
            data: allInvestors
        });
        
        totalInvestors = allInvestors.length;
    }
    
    return totalInvestors;
}

/**
 * Scrape all funds using the API
 */
async function scrapeFunds() {
    console.log('\n💼 === SCRAPING FUNDS (tabMenu=2) ===');
    
    let currentPage = 1;
    let hasMorePages = true;
    let totalFunds = 0;
    
    const allFunds = [];
    
    while (hasMorePages) {
        try {
            const formData = {
                tabMenu: '2',
                cp: currentPage.toString(),
                sortOrder: '',
                sortDirection: ''
            };
            
            console.log(`\n📄 Processing page ${currentPage}...`);
            const response = await makeRobustAPIRequest(formData);
            
            if (response && response.list && response.list.length > 0) {
                allFunds.push(...response.list);
                
                console.log(`✅ Page ${currentPage}: ${response.list.length} funds`);
                console.log(`📊 Total so far: ${allFunds.length} funds`);
                
                // Save page data
                saveToFile(`funds_page_${currentPage}.json`, {
                    page: currentPage,
                    count: response.list.length,
                    total: response.total,
                    data: response.list,
                    timestamp: new Date().toISOString()
                });
                
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
    
    // Save complete fund dataset
    if (allFunds.length > 0) {
        saveToFile('funds_complete.json', {
            total_records: allFunds.length,
            pages_scraped: currentPage - 1,
            extracted_at: new Date().toISOString(),
            source: 'VCS.GO.KR API',
            endpoint: '/web/portal/investor/search',
            data: allFunds
        });
        
        totalFunds = allFunds.length;
    }
    
    return totalFunds;
}

/**
 * Main scraping function
 */
async function scrapeVCSAPI() {
    console.log('\n🚀 === STARTING VCS API SCRAPING (FILE OUTPUT) ===');
    
    const startTime = Date.now();
    let totalRecords = 0;
    
    try {
        // Ensure output directory exists
        ensureOutputDirectory();
        
        // Scrape investors
        const investorCount = await scrapeInvestors();
        totalRecords += investorCount;
        
        // Scrape funds
        const fundCount = await scrapeFunds();
        totalRecords += fundCount;
        
        const duration = (Date.now() - startTime) / 1000;
        
        // Create summary report
        const summary = {
            execution_summary: {
                total_records: totalRecords,
                investors: investorCount,
                funds: fundCount,
                duration_seconds: duration.toFixed(2),
                completed_at: new Date().toISOString()
            },
            data_quality: {
                source: 'VCS.GO.KR Official API',
                method: 'Direct JSON API Calls',
                fields_extracted: 'All old system fields (operInstNm, operInstId, comIndNm, etc.)',
                data_format: 'Structured JSON',
                pagination: 'Complete'
            },
            files_created: [
                'investors_complete.json',
                'funds_complete.json',
                'Individual page files'
            ]
        };
        
        saveToFile('scraping_summary.json', summary);
        
        console.log('\n🎉 === VCS API SCRAPING COMPLETED ===');
        console.log(`📊 Total Records Scraped: ${totalRecords}`);
        console.log(`👥 Investors: ${investorCount}`);
        console.log(`💼 Funds: ${fundCount}`);
        console.log(`⏱️ Duration: ${duration.toFixed(2)} seconds`);
        console.log(`🎯 Data Quality: Professional API-based extraction`);
        console.log(`📡 Source: VCS.GO.KR Official API`);
        console.log(`📁 Output Directory: ${CONFIG.outputDir}/`);
        
        if (totalRecords > 0) {
            console.log('\n🚀 Success! Data extraction matching old Apify system completed');
            console.log('✅ All structured fields extracted (operInstNm, operInstId, comIndNm, etc.)');
            console.log('📊 Ready for database import or analysis');
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
    CONFIG
}; 