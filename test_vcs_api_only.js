/**
 * 🧪 VCS API Test - No Database Required
 * =====================================
 * 
 * Test the VCS API endpoint directly to verify it works
 * without needing Supabase connection
 */

const https = require('https');

console.log('🧪 Testing VCS API endpoint directly...');

/**
 * Test VCS API endpoint
 */
async function testVCSAPI() {
    const baseUrl = 'https://www.vcs.go.kr';
    const apiEndpoint = '/web/portal/investor/search';
    
    // Form data for investor search (first page)
    const queryParams = new URLSearchParams({
        tabMenu: '1', // 1=investors, 2=funds
        cp: '1', // current page
        sortOrder: '',
        sortDirection: ''
    });
    
    const url = `${baseUrl}${apiEndpoint}?${queryParams.toString()}`;
    
    console.log(`📡 Testing API: ${url}`);
    
    return new Promise((resolve, reject) => {
        const options = {
            method: 'GET',
            headers: {
                'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
                'Accept': 'application/json, text/javascript, */*; q=0.01',
                'Accept-Language': 'ko-KR,ko;q=0.9,en;q=0.8',
                'Connection': 'keep-alive',
                'X-Requested-With': 'XMLHttpRequest',
                'Referer': 'https://www.vcs.go.kr/web/portal/investor/list'
            },
            timeout: 30000
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
                        console.log('🎉 SUCCESS! JSON response received');
                        console.log('📊 Response structure:', Object.keys(jsonData));
                        
                        if (jsonData.list && jsonData.list.length > 0) {
                            console.log(`📈 Found ${jsonData.list.length} records`);
                            console.log('🏷️ Sample record fields:', Object.keys(jsonData.list[0]));
                            
                            // Look for the old system fields
                            const oldFields = ['operInstNm', 'operInstId', 'comIndNm', 'sigunguNm'];
                            const foundFields = oldFields.filter(field => 
                                JSON.stringify(jsonData).includes(field)
                            );
                            
                            if (foundFields.length > 0) {
                                console.log('🎯 OLD SYSTEM FIELDS FOUND:', foundFields.join(', '));
                            }
                        }
                        
                        resolve(jsonData);
                        
                    } catch (parseError) {
                        console.error('❌ JSON parse failed:', parseError.message);
                        console.log('📄 Raw response preview:', data.substring(0, 200));
                        reject(parseError);
                    }
                } else {
                    console.error(`❌ HTTP ${res.statusCode}: ${data.substring(0, 200)}`);
                    reject(new Error(`HTTP ${res.statusCode}`));
                }
            });
        });
        
        req.on('error', (error) => {
            console.error(`❌ Request failed: ${error.message}`);
            reject(error);
        });
        
        req.on('timeout', () => {
            req.destroy();
            reject(new Error('Request timeout'));
        });
        
        req.end();
    });
}

// Run test
(async () => {
    try {
        const result = await testVCSAPI();
        console.log('\n🎉 VCS API test successful!');
        console.log('✅ The endpoint is working and returns JSON data');
        console.log('🚀 Ready to implement the full scraper');
    } catch (error) {
        console.error('\n💥 VCS API test failed:', error.message);
        console.log('❌ Need to investigate the API endpoint further');
    }
})(); 