// IMMEDIATE SCALED Fund Scraper - Maximum Data Collection
const https = require('https');
const { URL } = require('url');

// Scaled configuration for comprehensive collection
const CONFIG = {
    dataType: 'Fund',
    airtableApiKey: 'patOUfAsek4nbpvHm.49789ced0e2b0304bdc507f110d936277cd3da18ec3efc9347c93e6a1810919e',
    airtableBaseId: 'appdR8V9lJaRW8VkR',
    airtableTableName: 'Fund Table',
    maxPages: 150,  // DRAMATICALLY INCREASED
    startPage: 1,   // Start from beginning for funds
    enableDetailedLogging: true,
    batchSize: 10,  // Smaller batches for reliability
    delayBetweenRequests: 2000  // 2 second delay for stability
};

console.log(`🏦 SCALED FUND SCRAPER - Target: ${CONFIG.maxPages} pages`);
console.log(`   Expected to collect 1500+ Fund records`);

// Base scraping configuration  
const baseUrl = 'https://vcs.go.kr/vc/data/vcFndListAjax.do';
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
                'Referer': 'https://vcs.go.kr/vc/data/vcFndList.do'
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
        
        req.setTimeout(30000, () => {
            req.destroy();
            reject(new Error('Request timeout'));
        });

        req.end();
    });
}

async function uploadToAirtable(records) {
    return new Promise((resolve, reject) => {
        const airtableData = JSON.stringify({
            records: records.map(record => ({
                fields: {
                    'Fund ID': record.fndId || '',
                    'Fund Name': record.fndNm || '',
                    'VC Company Name': record.cmpnyNm || '',
                    'Fund Type': record.fndSeNm || '',
                    'Fund Size': record.fndScl || '',
                    'Establishment Date': record.fndEstblDe || '',
                    'Fund Period': record.fndPrd || '',
                    'Investment Field': record.investField || '',
                    'Fund Status': record.fndSttus || '',
                    'Region': record.ctpvNm || '',
                    'Representative': record.rprsntrNm || '',
                    'Contact Info': record.cntctInfo || '',
                    'Description': record.fndIntrcn || '',
                    'Data Source': 'vcs.go.kr - Scaled Collection',
                    'Last Updated': new Date().toISOString()
                }
            }))
        });

        const requestOptions = {
            hostname: 'api.airtable.com',
            port: 443,
            path: `/v0/${CONFIG.airtableBaseId}/${encodeURIComponent(CONFIG.airtableTableName)}`,
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

const runScaledFundScraper = async () => {
    console.log(`🎯 Starting SCALED Fund data collection...`);
    
    let allRecords = [];
    let page = CONFIG.startPage;
    let hasMore = true;
    let totalProcessed = 0;
    let totalUploaded = 0;
    const startTime = Date.now();

    try {
        while (hasMore && page <= CONFIG.maxPages) {
            const url = `${baseUrl}?${commonQueryParams}&cp=${page}`;
            
            console.log(`📄 Fetching Fund page ${page}/${CONFIG.maxPages}...`);
            
            const response = await makeRequest(url);
            const json = response.body;
            
            if (page === 1) {
                console.log(`📊 Found ${json.total} total Fund entries in database`);
            }
            
            const items = json.list || [];
            
            if (items.length > 0) {
                allRecords.push(...items);
                totalProcessed += items.length;
                console.log(`✅ Collected ${items.length} Fund records from page ${page} (Total: ${totalProcessed})`);
                
                // Upload in batches for better performance
                if (allRecords.length >= CONFIG.batchSize) {
                    console.log(`📤 Uploading batch of ${allRecords.length} records...`);
                    try {
                        await uploadToAirtable(allRecords);
                        totalUploaded += allRecords.length;
                        console.log(`✅ Batch uploaded successfully (Total uploaded: ${totalUploaded})`);
                        allRecords = []; // Clear batch
                    } catch (uploadError) {
                        console.log(`❌ Batch upload failed: ${uploadError.message}`);
                        console.log(`   Retrying upload in 5 seconds...`);
                        await new Promise(resolve => setTimeout(resolve, 5000));
                        
                        // Retry upload
                        try {
                            await uploadToAirtable(allRecords);
                            totalUploaded += allRecords.length;
                            console.log(`✅ Retry upload successful (Total uploaded: ${totalUploaded})`);
                            allRecords = [];
                        } catch (retryError) {
                            console.log(`❌ Retry failed: ${retryError.message}`);
                            allRecords = [];
                        }
                    }
                }
                
                page++;
                
                // Rate limiting
                await new Promise(resolve => setTimeout(resolve, CONFIG.delayBetweenRequests));
            } else {
                hasMore = false;
                console.log(`🏁 No more data available after page ${page-1}`);
            }
        }

        // Upload remaining records
        if (allRecords.length > 0) {
            console.log(`📤 Uploading final batch of ${allRecords.length} records...`);
            try {
                await uploadToAirtable(allRecords);
                totalUploaded += allRecords.length;
                console.log(`✅ Final batch uploaded successfully`);
            } catch (uploadError) {
                console.log(`❌ Final batch upload failed: ${uploadError.message}`);
            }
        }

        const endTime = Date.now();
        const duration = (endTime - startTime) / 1000;

        console.log(`\n🎉 SCALED FUND COLLECTION COMPLETE!`);
        console.log(`   📊 Total Records Processed: ${totalProcessed}`);
        console.log(`   📤 Total Records Uploaded: ${totalUploaded}`);
        console.log(`   📄 Pages Scraped: ${page - CONFIG.startPage}`);
        console.log(`   ⏱️ Duration: ${duration.toFixed(1)} seconds`);
        console.log(`   🚀 Rate: ${(totalProcessed/duration).toFixed(1)} records/second`);
        console.log(`   📈 Success Rate: ${((totalUploaded/totalProcessed)*100).toFixed(1)}%`);

    } catch (error) {
        console.error(`❌ Scaled Fund scraping failed: ${error.message}`);
        throw error;
    }
};

runScaledFundScraper().catch(console.error);
