// IMMEDIATE SCALED VC Scraper - Maximum Data Collection
const https = require('https');
const { URL } = require('url');

// Scaled configuration for comprehensive collection
const CONFIG = {
    dataType: 'VC',
    airtableApiKey: 'patOUfAsek4nbpvHm.49789ced0e2b0304bdc507f110d936277cd3da18ec3efc9347c93e6a1810919e',
    airtableBaseId: 'appdR8V9lJaRW8VkR',
    airtableTableName: 'VC Table',
    maxPages: 200,  // DRAMATICALLY INCREASED FROM 50
    startPage: 51,  // Start from where previous scraping left off
    enableDetailedLogging: true,
    batchSize: 10,  // Smaller batches for reliability
    delayBetweenRequests: 2000  // 2 second delay for stability
};

console.log(`🚀 SCALED VC SCRAPER - Target: ${CONFIG.maxPages} pages (Starting from page ${CONFIG.startPage})`);
console.log(`   Expected to collect 2000+ additional VC company records`);

// Base scraping configuration
const baseUrl = 'https://vcs.go.kr/vc/data/vcCmpnyListAjax.do';
const tabMenu = 'vc_data';
const commonQueryParams = 'tabMenu=' + tabMenu + '&searchKeywordType=all&searchKeyword=&region=&vcType=&investTrend=&investField=&orderBy=ESTBL_DE';

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
                'Referer': 'https://vcs.go.kr/vc/data/vcCmpnyList.do'
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
                    'Company ID': record.cmpnyId || '',
                    'Company Name': record.cmpnyNm || '',
                    'Registration Number': record.bizrno || '',
                    'Representative': record.rprsntrNm || '',
                    'Establishment Date': record.estblDe || '',
                    'Capital Amount': record.capitalAmount || '',
                    'Address': record.adres || '',
                    'Phone': record.telno || '',
                    'Email': record.email || '',
                    'Website': record.hmpgAdres || '',
                    'VC Type': record.vcSeNm || '',
                    'Region': record.ctpvNm || '',
                    'Investment Field': record.investField || '',
                    'Investment Trend': record.investTrend || '',
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

const runScaledVCScraper = async () => {
    console.log(`🎯 Starting SCALED VC data collection from page ${CONFIG.startPage}...`);
    
    let allRecords = [];
    let page = CONFIG.startPage;
    let hasMore = true;
    let totalProcessed = 0;
    let totalUploaded = 0;
    const startTime = Date.now();

    try {
        while (hasMore && page <= CONFIG.maxPages) {
            const url = `${baseUrl}?${commonQueryParams}&cp=${page}`;
            
            console.log(`📄 Fetching VC page ${page}/${CONFIG.maxPages}...`);
            
            const response = await makeRequest(url);
            const json = response.body;
            
            if (page === CONFIG.startPage) {
                console.log(`📊 Found ${json.total} total VC entries in database`);
            }
            
            const items = json.list || [];
            
            if (items.length > 0) {
                allRecords.push(...items);
                totalProcessed += items.length;
                console.log(`✅ Collected ${items.length} VC records from page ${page} (Total: ${totalProcessed})`);
                
                // Upload in batches for better performance and reliability
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
                            // Continue with next batch to avoid losing all progress
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

        console.log(`\n🎉 SCALED VC COLLECTION COMPLETE!`);
        console.log(`   📊 Total Records Processed: ${totalProcessed}`);
        console.log(`   📤 Total Records Uploaded: ${totalUploaded}`);
        console.log(`   📄 Pages Scraped: ${page - CONFIG.startPage}`);
        console.log(`   ⏱️ Duration: ${duration.toFixed(1)} seconds`);
        console.log(`   🚀 Rate: ${(totalProcessed/duration).toFixed(1)} records/second`);
        console.log(`   📈 Success Rate: ${((totalUploaded/totalProcessed)*100).toFixed(1)}%`);

    } catch (error) {
        console.error(`❌ Scaled VC scraping failed: ${error.message}`);
        throw error;
    }
};

runScaledVCScraper().catch(console.error);
