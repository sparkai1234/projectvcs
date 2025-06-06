const { Actor } = require('apify');
const { PuppeteerCrawler } = require('crawlee');

/**
 * 🧪 DIVA Data Extraction Test
 * Verifies that all handlers work correctly and extract data
 */

async function testDataExtraction() {
    console.log('🧪 Starting DIVA Data Extraction Test...');
    
    // Test configuration - limit to small sample
    const testConfig = {
        maxPages: 2,
        delay: 1000,
        baseUrl: 'http://diva.kvca.or.kr',
        dataSource: ['vc_map', 'violations'], // Start with these two
        includeStatisticsPDFs: false,
        exportToSupabase: false, // Disable for testing
        headless: false // Show browser for debugging
    };
    
    console.log('📋 Test Configuration:', testConfig);
    
    // Setup crawler for testing
    const crawler = new PuppeteerCrawler({
        launchContext: {
            launchOptions: {
                headless: testConfig.headless,
                args: [
                    '--no-sandbox',
                    '--disable-setuid-sandbox',
                    '--disable-dev-shm-usage',
                    '--lang=ko-KR,ko,en-US,en',
                    '--accept-lang=ko-KR,ko,en-US,en'
                ]
            }
        },
        
        requestHandlerTimeoutSecs: 300,
        
        requestHandler: async ({ page, request }) => {
            console.log(`🔍 Testing: ${request.url}`);
            
            try {
                await page.waitForSelector('body', { timeout: 30000 });
                await sleep(testConfig.delay);
                
                const url = request.url;
                
                // Test VC MAP extraction
                if (url.includes('DivItmVcmapInq')) {
                    console.log('🗺️ Testing VC MAP extraction...');
                    await testVCMapExtraction(page);
                }
                // Test Violations extraction  
                else if (url.includes('DivItmViolInq')) {
                    console.log('⚖️ Testing Violations extraction...');
                    await testViolationsExtraction(page);
                }
                
            } catch (error) {
                console.error(`❌ Test error for ${request.url}:`, error.message);
                throw error;
            }
        },
        
        failedRequestHandler: async ({ request }) => {
            console.error(`🚫 Test request failed: ${request.url}`);
        }
    });
    
    // Test URLs
    const testRequests = [
        {
            url: 'http://diva.kvca.or.kr/div/dii/DivItmVcmapInq',
            userData: { dataSource: 'vc_map', pageType: 'test' }
        },
        {
            url: 'http://diva.kvca.or.kr/div/dii/DivItmViolInq', 
            userData: { dataSource: 'violations', pageType: 'test' }
        }
    ];
    
    console.log(`🚀 Starting test with ${testRequests.length} URLs...`);
    await crawler.run(testRequests);
    
    console.log('✅ DIVA Data Extraction Test completed!');
}

/**
 * Test VC MAP data extraction
 */
async function testVCMapExtraction(page) {
    try {
        // Setup filters
        await setupTestFilters(page);
        
        // Extract VC MAP data
        const vcMapData = await page.evaluate(() => {
            const data = [];
            const tables = document.querySelectorAll('table');
            console.log(`Found ${tables.length} tables on VC MAP page`);
            
            const rows = document.querySelectorAll('table tbody tr');
            console.log(`Found ${rows.length} VC MAP rows to process`);
            
            rows.forEach((row, index) => {
                const cells = row.querySelectorAll('td');
                console.log(`VC MAP row ${index}: ${cells.length} cells`);
                
                if (cells.length >= 4) {
                    const record = {
                        rank: cells[0]?.textContent?.trim(),
                        companyName: cells[1]?.textContent?.trim(),
                        personnelCount: cells[2]?.textContent?.trim(),
                        professionalCount: cells[3]?.textContent?.trim(),
                        rowIndex: index
                    };
                    
                    console.log(`Extracted VC MAP record:`, record);
                    data.push(record);
                }
            });
            
            return data;
        });
        
        console.log(`✅ VC MAP Test: Extracted ${vcMapData.length} records`);
        vcMapData.slice(0, 3).forEach((record, i) => {
            console.log(`   ${i+1}. ${record.companyName} - Rank: ${record.rank}, Personnel: ${record.personnelCount}, Professional: ${record.professionalCount}`);
        });
        
        return vcMapData.length > 0;
        
    } catch (error) {
        console.error('❌ VC MAP test error:', error);
        return false;
    }
}

/**
 * Test Violations data extraction
 */
async function testViolationsExtraction(page) {
    try {
        // Setup filters
        await setupTestFilters(page);
        
        // Extract Violations data
        const violationData = await page.evaluate(() => {
            const data = [];
            const tables = document.querySelectorAll('table');
            console.log(`Found ${tables.length} tables on Violations page`);
            
            const rows = document.querySelectorAll('table tbody tr');
            console.log(`Found ${rows.length} violation rows to process`);
            
            rows.forEach((row, index) => {
                const cells = row.querySelectorAll('td');
                console.log(`Violation row ${index}: ${cells.length} cells`);
                
                if (cells.length >= 7) {
                    const record = {
                        number: cells[0]?.textContent?.trim(),
                        companyName: cells[1]?.textContent?.trim(),
                        actionDate: cells[2]?.textContent?.trim(),
                        actionEndDate: cells[3]?.textContent?.trim(),
                        classificationName: cells[4]?.textContent?.trim(),
                        correctionType: cells[5]?.textContent?.trim(),
                        violationType: cells[6]?.textContent?.trim(),
                        actionType: cells.length > 7 ? cells[7]?.textContent?.trim() : '',
                        rowIndex: index
                    };
                    
                    console.log(`Extracted violation record:`, record);
                    data.push(record);
                }
            });
            
            return data;
        });
        
        console.log(`✅ Violations Test: Extracted ${violationData.length} records`);
        violationData.slice(0, 3).forEach((record, i) => {
            console.log(`   ${i+1}. ${record.companyName} - ${record.violationType}, Action: ${record.actionDate}`);
        });
        
        return violationData.length > 0;
        
    } catch (error) {
        console.error('❌ Violations test error:', error);
        return false;
    }
}

/**
 * Setup test filters (simplified version)
 */
async function setupTestFilters(page) {
    console.log('⚙️ Setting up test filters...');
    
    try {
        // Wait for form elements
        await page.waitForSelector('form, .search-form, table', { timeout: 10000 });
        
        // Try to click search button if present
        const searchButtons = await page.$$('button[type="submit"], input[type="submit"], .btn-search');
        if (searchButtons.length > 0) {
            console.log('🔍 Clicking search button...');
            await searchButtons[0].click();
            await sleep(2000);
        }
        
    } catch (e) {
        console.log('⚠️ Filter setup skipped:', e.message);
    }
}

/**
 * Sleep helper function
 */
function sleep(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
}

// Run the test
if (require.main === module) {
    testDataExtraction().catch(console.error);
}

module.exports = { testDataExtraction }; 