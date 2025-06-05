/**
 * 🕵️ VCS API INVESTIGATOR
 * =======================
 * 
 * Monitors network requests on VCS.GO.KR to find the real API endpoints
 * that return structured JSON data (like the old Apify system used)
 * 
 * Target: Find endpoints with operInstNm, operInstId, comIndNm, etc.
 */

require('dotenv').config();
const { chromium } = require('playwright');
const fs = require('fs');

console.log('🕵️ VCS API Investigator Started');
console.log('🎯 Goal: Find the real JSON API endpoints used by VCS.GO.KR');

/**
 * Monitor all network requests and capture API calls
 */
async function investigateVCSAPIs() {
    console.log('\n🚀 === STARTING VCS API INVESTIGATION ===');
    
    let browser = null;
    const apiCalls = [];
    const startTime = Date.now();
    
    try {
        // Launch browser with network monitoring
        console.log('🌐 Launching browser with network monitoring...');
        browser = await chromium.launch({ 
            headless: false, // Keep visible to see what's happening
            timeout: 30000 
        });
        
        const context = await browser.newContext({
            userAgent: 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36'
        });
        
        const page = await context.newPage();
        
        // Capture all network requests
        page.on('request', request => {
            const url = request.url();
            const method = request.method();
            const headers = request.headers();
            const postData = request.postData();
            
            console.log(`🌐 ${method} ${url}`);
            
            // Log interesting requests
            if (url.includes('vcs.go.kr') && 
                (method === 'POST' || url.includes('ajax') || url.includes('api') || url.includes('data'))) {
                
                console.log(`  📍 INTERESTING: ${method} ${url}`);
                if (postData) {
                    console.log(`  📝 POST Data: ${postData.substring(0, 200)}...`);
                }
            }
        });
        
        // Capture responses
        page.on('response', async response => {
            const url = response.url();
            const status = response.status();
            const contentType = response.headers()['content-type'] || '';
            
            // Focus on JSON responses from VCS
            if (url.includes('vcs.go.kr') && 
                status === 200 && 
                (contentType.includes('application/json') || contentType.includes('text/json'))) {
                
                try {
                    const responseText = await response.text();
                    
                    console.log(`\n🎯 JSON RESPONSE FOUND!`);
                    console.log(`URL: ${url}`);
                    console.log(`Content-Type: ${contentType}`);
                    console.log(`Size: ${responseText.length} chars`);
                    
                    // Try to parse as JSON
                    try {
                        const jsonData = JSON.parse(responseText);
                        console.log(`✅ Valid JSON structure detected`);
                        
                        // Look for the field names from the old system
                        const oldSystemFields = [
                            'operInstNm', 'operInstId', 'comIndNm', 'sigunguNm', 
                            'foundYy', 'operInstTpNm', 'operScaleCd', 'operBoundAmt',
                            'comBzcarrCd', 'headofcZipcd', 'strtplanerYn'
                        ];
                        
                        const responseStr = JSON.stringify(jsonData);
                        const foundFields = oldSystemFields.filter(field => 
                            responseStr.includes(field)
                        );
                        
                        if (foundFields.length > 0) {
                            console.log(`🎉 BINGO! Found old system fields: ${foundFields.join(', ')}`);
                        }
                        
                        // Save this API call info
                        apiCalls.push({
                            url: url,
                            method: response.request().method(),
                            status: status,
                            contentType: contentType,
                            responseSize: responseText.length,
                            foundFields: foundFields,
                            sampleData: JSON.stringify(jsonData).substring(0, 500),
                            timestamp: new Date().toISOString()
                        });
                        
                    } catch (parseError) {
                        console.log(`❌ JSON parse failed: ${parseError.message}`);
                    }
                    
                } catch (textError) {
                    console.log(`❌ Could not get response text: ${textError.message}`);
                }
            }
        });
        
        console.log('\n📍 Step 1: Loading VCS investor search page...');
        await page.goto('https://www.vcs.go.kr/web/portal/investor/list', { 
            waitUntil: 'networkidle',
            timeout: 30000 
        });
        
        console.log('✅ Page loaded, waiting for dynamic content...');
        await page.waitForTimeout(5000);
        
        console.log('\n📍 Step 2: Triggering search to find API calls...');
        
        // Try to trigger a search to see API calls
        try {
            // Look for search button and click it
            const searchButtons = [
                'button:has-text("검색")',
                'input[type="submit"]',
                '.search-btn',
                '#searchBtn',
                'button[onclick*="search"]'
            ];
            
            for (const selector of searchButtons) {
                try {
                    const button = page.locator(selector).first();
                    if (await button.isVisible()) {
                        console.log(`🔍 Found search button: ${selector}`);
                        await button.click();
                        console.log('✅ Search button clicked, monitoring API calls...');
                        await page.waitForTimeout(5000);
                        break;
                    }
                } catch (e) {
                    // Try next selector
                }
            }
        } catch (searchError) {
            console.log(`ℹ️ Could not trigger search: ${searchError.message}`);
        }
        
        console.log('\n📍 Step 3: Trying pagination to trigger more API calls...');
        
        // Try to click pagination or load more results
        try {
            const paginationSelectors = [
                'a:has-text("다음")',
                'a:has-text("2")',
                '.pagination a',
                '.next',
                'button:has-text("더보기")'
            ];
            
            for (const selector of paginationSelectors) {
                try {
                    const element = page.locator(selector).first();
                    if (await element.isVisible()) {
                        console.log(`📄 Found pagination element: ${selector}`);
                        await element.click();
                        console.log('✅ Pagination clicked, monitoring API calls...');
                        await page.waitForTimeout(5000);
                        break;
                    }
                } catch (e) {
                    // Try next selector
                }
            }
        } catch (paginationError) {
            console.log(`ℹ️ Could not trigger pagination: ${paginationError.message}`);
        }
        
        console.log('\n📍 Step 4: Trying fund/portfolio tab to find more APIs...');
        
        // Try switching to fund tab
        try {
            const fundTab = page.locator('text=펀드/조합 보기').first();
            if (await fundTab.isVisible()) {
                console.log('🔍 Found fund tab, clicking...');
                await fundTab.click();
                console.log('✅ Fund tab clicked, monitoring API calls...');
                await page.waitForTimeout(5000);
            }
        } catch (tabError) {
            console.log(`ℹ️ Could not click fund tab: ${tabError.message}`);
        }
        
        const duration = (Date.now() - startTime) / 1000;
        
        console.log('\n🎉 === VCS API INVESTIGATION COMPLETED ===');
        console.log(`⏱️ Duration: ${duration.toFixed(2)} seconds`);
        console.log(`📊 Total API calls captured: ${apiCalls.length}`);
        
        if (apiCalls.length > 0) {
            console.log('\n📋 DISCOVERED API ENDPOINTS:');
            apiCalls.forEach((call, index) => {
                console.log(`\n${index + 1}. ${call.method} ${call.url}`);
                console.log(`   📊 Status: ${call.status}, Size: ${call.responseSize} chars`);
                console.log(`   🏷️ Content-Type: ${call.contentType}`);
                if (call.foundFields.length > 0) {
                    console.log(`   🎯 OLD SYSTEM FIELDS: ${call.foundFields.join(', ')}`);
                }
                console.log(`   📝 Sample: ${call.sampleData}`);
            });
            
            // Save detailed results to file
            const resultsFile = 'vcs_api_investigation_results.json';
            fs.writeFileSync(resultsFile, JSON.stringify(apiCalls, null, 2));
            console.log(`\n💾 Detailed results saved to: ${resultsFile}`);
            
            // Find the best API endpoint
            const bestAPI = apiCalls.find(call => call.foundFields.length > 0) || 
                           apiCalls.find(call => call.responseSize > 1000) ||
                           apiCalls[0];
            
            if (bestAPI) {
                console.log(`\n🏆 RECOMMENDED API ENDPOINT:`);
                console.log(`URL: ${bestAPI.url}`);
                console.log(`Method: ${bestAPI.method}`);
                if (bestAPI.foundFields.length > 0) {
                    console.log(`Contains old system fields: ${bestAPI.foundFields.join(', ')}`);
                }
            }
            
        } else {
            console.log('\n⚠️ No JSON API calls detected');
            console.log('💡 The site might be using:');
            console.log('   - Server-side rendering');
            console.log('   - WebSocket connections');
            console.log('   - Different request patterns');
            console.log('   - Authentication requirements');
        }
        
    } catch (error) {
        console.error('💥 Investigation failed:', error);
    } finally {
        if (browser) {
            // Keep browser open for 10 seconds to see results
            console.log('\n⏰ Keeping browser open for 10 seconds for manual inspection...');
            await new Promise(resolve => setTimeout(resolve, 10000));
            await browser.close();
        }
    }
}

// Execute investigation
if (require.main === module) {
    (async () => {
        try {
            await investigateVCSAPIs();
            console.log('✅ VCS API investigation completed successfully!');
        } catch (error) {
            console.error('💥 Investigation failed:', error);
            process.exit(1);
        }
    })();
}

module.exports = {
    investigateVCSAPIs
}; 