/**
 * 🏦 TEST KOREAN FUND API - CLEAN DEBUG VERSION
 * =============================================
 * 
 * Clean test version to debug the Korean VC API response
 * - NO Supabase dependency at all
 * - Only tests API response format
 * - Helps identify what data structure we're getting
 */

const https = require('https');
const { URL } = require('url');

console.log('🔧 CLEAN API TEST - Starting Debug...');
console.log('Node.js version:', process.version);

// Test configuration
const CONFIG = {
    maxPages: 3,
    startPage: 1,
    delayBetweenRequests: 2000
};

console.log(`🏦 API TEST - Target: ${CONFIG.maxPages} pages`);

// Korean VC Database API
const baseUrl = 'https://www.vcs.go.kr/vc/data/vcFndListAjax.do';
const tabMenu = 'vc_fund';
const commonQueryParams = 'tabMenu=' + tabMenu + '&searchKeywordType=all&searchKeyword=&region=&vcType=&fndType=&orderBy=FND_ESTBL_DE';

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
                'Referer': 'https://www.vcs.go.kr/vc/data/vcFndList.do'
            }
        };

        console.log(`\n📡 === REQUEST DETAILS ===`);
        console.log(`URL: ${url}`);
        console.log(`Hostname: ${requestOptions.hostname}`);
        console.log(`Path: ${requestOptions.path}`);

        const req = https.request(requestOptions, (res) => {
            let data = '';
            res.on('data', (chunk) => {
                data += chunk;
            });
            res.on('end', () => {
                console.log(`\n📊 === RESPONSE ANALYSIS ===`);
                console.log(`Status: ${res.statusCode}`);
                console.log(`Content-Type: ${res.headers['content-type']}`);
                console.log(`Content-Length: ${data.length} characters`);
                
                console.log(`\n📄 First 300 characters:`);
                console.log(data.substring(0, 300));
                
                console.log(`\n📄 Last 200 characters:`);
                console.log(data.substring(Math.max(0, data.length - 200)));
                
                // Analyze response format
                const isHTML = data.trim().startsWith('<');
                const isJSON = data.trim().startsWith('{') || data.trim().startsWith('[');
                
                console.log(`\n🔍 === FORMAT ANALYSIS ===`);
                console.log(`Is HTML: ${isHTML}`);
                console.log(`Is JSON: ${isJSON}`);
                
                if (isHTML) {
                    console.log(`⚠️ Received HTML - analyzing content...`);
                    
                    if (data.includes('404') || data.includes('Not Found')) {
                        console.log(`❌ 404 Not Found detected`);
                    }
                    if (data.includes('403') || data.includes('Forbidden')) {
                        console.log(`❌ 403 Forbidden detected`);
                    }
                    if (data.includes('login') || data.includes('로그인')) {
                        console.log(`🔐 Login required detected`);
                    }
                    if (data.includes('redirect') || data.includes('location.href')) {
                        console.log(`🔄 Redirect detected`);
                    }
                    if (data.includes('javascript') && data.includes('location')) {
                        console.log(`📜 JavaScript redirect detected`);
                    }
                }
                
                if (isJSON) {
                    try {
                        const jsonData = JSON.parse(data);
                        console.log(`✅ Valid JSON received!`);
                        console.log(`📊 JSON Keys:`, Object.keys(jsonData));
                        
                        if (jsonData.total !== undefined) {
                            console.log(`📊 Total records: ${jsonData.total}`);
                        }
                        
                        if (jsonData.list && Array.isArray(jsonData.list)) {
                            console.log(`📋 List length: ${jsonData.list.length}`);
                            if (jsonData.list.length > 0) {
                                console.log(`🔍 First item keys:`, Object.keys(jsonData.list[0]));
                                console.log(`📋 Sample record:`, JSON.stringify(jsonData.list[0], null, 2));
                            }
                        }
                        
                        resolve({ statusCode: res.statusCode, body: jsonData, success: true });
                    } catch (e) {
                        console.log(`❌ JSON parse failed: ${e.message}`);
                        resolve({ statusCode: res.statusCode, body: data, success: false, error: 'JSON_PARSE_ERROR' });
                    }
                } else {
                    console.log(`❌ Non-JSON response received`);
                    resolve({ statusCode: res.statusCode, body: data, success: false, error: 'NOT_JSON' });
                }
            });
        });

        req.on('error', (err) => {
            console.log(`❌ Request failed: ${err.message}`);
            reject(err);
        });
        
        req.setTimeout(30000, () => {
            req.destroy();
            reject(new Error('Request timeout after 30 seconds'));
        });

        req.end();
    });
}

async function testApiAccess() {
    console.log(`\n🎯 === STARTING API TEST ===`);
    
    let totalRecords = 0;
    const startTime = Date.now();

    try {
        for (let page = CONFIG.startPage; page <= CONFIG.maxPages; page++) {
            const url = `${baseUrl}?${commonQueryParams}&cp=${page}`;
            
            console.log(`\n📄 === TESTING PAGE ${page}/${CONFIG.maxPages} ===`);
            
            const response = await makeRequest(url);
            
            if (!response.success) {
                console.log(`❌ Page ${page} failed: ${response.error}`);
                
                // Try alternative approaches
                console.log(`\n🔄 Trying alternative URLs...`);
                
                const alternatives = [
                    'https://vcs.go.kr/vc/data/vcFndListAjax.do',  // No www
                    'http://www.vcs.go.kr/vc/data/vcFndListAjax.do',  // HTTP instead of HTTPS
                    'https://www.vcs.go.kr/vc/data/vcFndList.do'   // Main page instead of Ajax
                ];
                
                for (const altUrl of alternatives) {
                    console.log(`Testing: ${altUrl}`);
                    try {
                        const altResponse = await makeRequest(`${altUrl}?${commonQueryParams}&cp=${page}`);
                        if (altResponse.success) {
                            console.log(`✅ Alternative URL worked: ${altUrl}`);
                            break;
                        }
                    } catch (error) {
                        console.log(`Failed: ${error.message}`);
                    }
                    
                    // Brief delay between alternative attempts
                    await new Promise(resolve => setTimeout(resolve, 1000));
                }
                break;
            }
            
            const json = response.body;
            const items = json.list || json.data || json.items || [];
            
            console.log(`✅ Page ${page}: Found ${items.length} items`);
            totalRecords += items.length;
            
            if (items.length === 0) {
                console.log(`🏁 No more data after page ${page}`);
                break;
            }
            
            // Rate limiting
            console.log(`⏱️ Waiting ${CONFIG.delayBetweenRequests}ms...`);
            await new Promise(resolve => setTimeout(resolve, CONFIG.delayBetweenRequests));
        }
        
        const duration = (Date.now() - startTime) / 1000;
        
        console.log(`\n🎉 === TEST COMPLETED ===`);
        console.log(`📊 Total Records Found: ${totalRecords}`);
        console.log(`⏱️ Duration: ${duration.toFixed(2)} seconds`);
        console.log(`🌐 Source: www.vcs.go.kr`);
        console.log(`📋 Status: ${totalRecords > 0 ? '✅ API WORKING' : '❌ API NOT ACCESSIBLE'}`);
        
        if (totalRecords > 0) {
            console.log(`\n💡 CONCLUSION: The API is working and returning data!`);
            console.log(`🔧 Next step: Create proper scraper with Supabase integration`);
        } else {
            console.log(`\n⚠️ CONCLUSION: API not accessible or changed`);
            console.log(`🔧 Next step: Investigate alternative endpoints or authentication`);
        }
        
    } catch (error) {
        console.log(`💥 Critical error: ${error.message}`);
        throw error;
    }
}

// Execute test
(async () => {
    try {
        console.log('🚀 Starting Korean VC API Test...');
        await testApiAccess();
        console.log('✅ API test completed!');
    } catch (error) {
        console.error('💥 Test failed:', error);
        process.exit(1);
    }
})(); 