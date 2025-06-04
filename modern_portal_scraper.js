// MODERN PORTAL SCRAPER - Working with Live www.vcs.go.kr/web/portal/
const https = require('https');
const { URL } = require('url');

// Modern portal configuration
const CONFIG = {
    airtableApiKey: 'patOUfAsek4nbpvHm.49789ced0e2b0304bdc507f110d936277cd3da18ec3efc9347c93e6a1810919e',
    airtableBaseId: 'appdR8V9lJaRW8VkR',
    fundTableName: 'Fund Table',
    vcTableName: 'VC Table',
    maxPages: 50,
    batchSize: 10,
    delayBetweenRequests: 2000
};

console.log(`🚀 MODERN PORTAL SCRAPER - Using Live Portal`);
console.log(`🔗 Base URL: https://www.vcs.go.kr/web/portal/`);

// Test different potential AJAX endpoints for the modern portal
const POTENTIAL_ENDPOINTS = [
    'https://www.vcs.go.kr/web/portal/investor/ajax/list',
    'https://www.vcs.go.kr/web/portal/ajax/investor/list', 
    'https://www.vcs.go.kr/web/portal/ajax/investorList',
    'https://www.vcs.go.kr/web/ajax/portal/investor/list',
    'https://www.vcs.go.kr/ajax/web/portal/investor/list'
];

async function discoverWorkingEndpoint() {
    console.log('🔍 Discovering working AJAX endpoints...');
    
    // First, let's analyze the investor list page for AJAX calls
    console.log('\n📄 Analyzing investor portal page...');
    
    try {
        const portalPage = await makeRequest('https://www.vcs.go.kr/web/portal/investor/list');
        
        if (portalPage.statusCode === 200 && typeof portalPage.body === 'string') {
            console.log('✅ Portal page loaded successfully');
            
            // Look for AJAX endpoints in the page source
            const ajaxMatches = portalPage.body.match(/["']([^"']*ajax[^"']*)["']/gi);
            const urlMatches = portalPage.body.match(/url\s*:\s*["']([^"']*)["']/gi);
            
            if (ajaxMatches || urlMatches) {
                console.log('🔍 Found potential AJAX endpoints in page:');
                
                const allMatches = [
                    ...(ajaxMatches || []).map(m => m.replace(/["']/g, '')),
                    ...(urlMatches || []).map(m => m.replace(/url\s*:\s*["']/g, '').replace(/["']/g, ''))
                ];
                
                const uniqueEndpoints = [...new Set(allMatches)]
                    .filter(url => url.includes('ajax') || url.includes('list'))
                    .slice(0, 10);
                
                uniqueEndpoints.forEach(endpoint => {
                    console.log(`   • ${endpoint}`);
                });
                
                // Test these discovered endpoints
                for (const endpoint of uniqueEndpoints) {
                    try {
                        const fullUrl = endpoint.startsWith('http') ? endpoint : `https://www.vcs.go.kr${endpoint}`;
                        console.log(`\n🧪 Testing discovered endpoint: ${fullUrl}`);
                        
                        const result = await testEndpointWithParams(fullUrl);
                        if (result.success) {
                            return result;
                        }
                    } catch (e) {
                        console.log(`   ❌ Failed: ${e.message}`);
                    }
                }
            }
        }
        
    } catch (error) {
        console.log(`❌ Portal analysis failed: ${error.message}`);
    }
    
    // Fallback: Test predefined endpoints
    console.log('\n🔧 Testing predefined endpoint patterns...');
    
    for (const endpoint of POTENTIAL_ENDPOINTS) {
        try {
            console.log(`📡 Testing: ${endpoint}`);
            const result = await testEndpointWithParams(endpoint);
            
            if (result.success) {
                return result;
            }
            
        } catch (error) {
            console.log(`   ❌ ${error.message}`);
        }
    }
    
    return { success: false };
}

async function testEndpointWithParams(baseUrl) {
    // Test with different parameter combinations
    const paramSets = [
        'page=1&size=10',
        'cp=1&limit=10',
        'pageNo=1&pageSize=10',
        'p=1&cnt=10',
        'currentPage=1',
        'draw=1&start=0&length=10'
    ];
    
    for (const params of paramSets) {
        try {
            const fullUrl = `${baseUrl}?${params}`;
            const result = await makeRequest(fullUrl);
            
            console.log(`   📊 Status: ${result.statusCode} | Params: ${params}`);
            
            if (result.statusCode === 200 && result.body) {
                if (typeof result.body === 'object' && (result.body.list || result.body.data || result.body.records)) {
                    console.log(`   ✅ Found data! Keys: ${Object.keys(result.body).join(', ')}`);
                    return { 
                        success: true, 
                        endpoint: fullUrl, 
                        data: result.body,
                        params: params
                    };
                }
            }
            
        } catch (error) {
            // Continue testing other parameter sets
        }
    }
    
    return { success: false };
}

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
                'Referer': 'https://www.vcs.go.kr/web/portal/investor/list',
                'X-Requested-With': 'XMLHttpRequest'
            }
        };

        const req = https.request(requestOptions, (res) => {
            let data = '';
            res.on('data', (chunk) => {
                data += chunk;
            });
            res.on('end', () => {
                try {
                    const jsonData = JSON.parse(data);
                    resolve({ statusCode: res.statusCode, body: jsonData });
                } catch (e) {
                    resolve({ statusCode: res.statusCode, body: data });
                }
            });
        });

        req.on('error', (err) => {
            reject(err);
        });
        
        req.setTimeout(15000, () => {
            req.destroy();
            reject(new Error('Request timeout'));
        });

        req.end();
    });
}

async function uploadToAirtable(records, tableName) {
    return new Promise((resolve, reject) => {
        const airtableData = JSON.stringify({
            records: records.map(record => ({
                fields: {
                    ...record,
                    'Data Source': 'www.vcs.go.kr/web/portal - Modern Portal',
                    'Last Updated': new Date().toISOString()
                }
            }))
        });

        const requestOptions = {
            hostname: 'api.airtable.com',
            port: 443,
            path: `/v0/${CONFIG.airtableBaseId}/${encodeURIComponent(tableName)}`,
            method: 'POST',
            headers: {
                'Authorization': `Bearer ${CONFIG.airtableApiKey}`,
                'Content-Type': 'application/json',
                'Content-Length': Buffer.byteLength(airtableData)
            }
        };

        const req = https.request(requestOptions, (res) => {
            let data = '';
            res.on('data', (chunk) => {
                data += chunk;
            });
            res.on('end', () => {
                if (res.statusCode === 200) {
                    resolve(JSON.parse(data));
                } else {
                    reject(new Error(`Airtable upload failed: ${res.statusCode} - ${data}`));
                }
            });
        });

        req.on('error', (err) => {
            reject(err);
        });

        req.write(airtableData);
        req.end();
    });
}

async function runModernPortalScraper() {
    console.log('\n🎯 Starting Modern Portal Discovery and Scraping...');
    
    try {
        // Discover working endpoint
        const discovery = await discoverWorkingEndpoint();
        
        if (!discovery.success) {
            console.log('❌ No working endpoints discovered');
            console.log('💡 The portal may require session authentication or use different patterns');
            return;
        }
        
        console.log(`\n🎉 WORKING ENDPOINT DISCOVERED!`);
        console.log(`✅ URL: ${discovery.endpoint}`);
        console.log(`📊 Sample data structure: ${JSON.stringify(discovery.data).substring(0, 200)}...`);
        
        // If we found data, analyze its structure
        if (discovery.data) {
            console.log('\n🔍 Data Structure Analysis:');
            console.log(`   • Response keys: ${Object.keys(discovery.data).join(', ')}`);
            
            const dataArray = discovery.data.list || discovery.data.data || discovery.data.records || [];
            if (dataArray.length > 0) {
                console.log(`   • Record count: ${dataArray.length}`);
                console.log(`   • Sample record keys: ${Object.keys(dataArray[0]).join(', ')}`);
                
                // This would be where we'd continue scraping with pagination
                console.log('\n💡 Ready to implement full scraping with this endpoint!');
            }
        }
        
    } catch (error) {
        console.log(`❌ Modern portal scraping failed: ${error.message}`);
        console.error(error);
    }
}

// Start the modern portal scraper
runModernPortalScraper(); 