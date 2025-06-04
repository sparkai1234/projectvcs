// Korean VC Scraper - Apify Actor
// Scrapes VC company data from Korean VC database and sends to Airtable
const Apify = require('apify');

Apify.main(async () => {
    console.log('🚀 Starting Korean VC Scraper Actor...');

    // Get input configuration
    const input = await Apify.getInput();
    const {
        airtableApiKey = 'patOUfAsek4nbpvHm.49789ced0e2b0304bdc507f110d936277cd3da18ec3efc9347c93e6a1810919e',
        airtableBaseId = 'appdR8V9lJaRW8VkR',
        airtableTableName = 'VC Table',
        maxPages = null, // null means scrape all pages
        startPage = 1,
        batchSize = 10, // Airtable API limit
        delayBetweenRequests = 200,
        delayBetweenBatches = 500
    } = input || {};

    console.log(`📊 Configuration:
    • Table: ${airtableTableName}
    • Max Pages: ${maxPages || 'ALL'}
    • Start Page: ${startPage}
    • Batch Size: ${batchSize}
    • Request Delay: ${delayBetweenRequests}ms
    • Batch Delay: ${delayBetweenBatches}ms`);

    // Initialize request queue and dataset
    const requestQueue = await Apify.openRequestQueue();
    const dataset = await Apify.openDataset();

    // Function to transform VC data for Airtable
    const transformVCDataForAirtable = (item) => {
        return {
            'Company Name': item.operInstNm || '',
            'Company Name (Korean)': item.operInstNm || '',
            'Company ID': item.operInstId || '',
            'Industry': item.comIndNm || '',
            'Location': item.sigunguNm || '',
            'Founded': item.foundYy || '',
            'Company Type': item.operInstTpNm || '',
            'Operating Scale': item.operScaleCd || '',
            'Operating Amount': item.operBoundAmt ? parseFloat(item.operBoundAmt) : null,
            'Business Category': item.comBzcarrCd || '',
            'Zip Code': item.headofcZipcd || '',
            'Strategy Planner': item.strtplanerYn === 'Y' ? 'Yes' : 'No',
            'Notes': [
                `=== VC COMPANY INFORMATION ===`,
                `Company Name: ${item.operInstNm || 'N/A'}`,
                `Company ID: ${item.operInstId || 'N/A'}`,
                `Industry: ${item.comIndNm || 'N/A'}`,
                ``,
                `=== LOCATION & DETAILS ===`,
                `Location: ${item.sigunguNm || 'N/A'}`,
                `Zip Code: ${item.headofcZipcd || 'N/A'}`,
                `Company Type: ${item.operInstTpNm || 'N/A'}`,
                `Founded: ${item.foundYy || 'N/A'}`,
                ``,
                `=== BUSINESS INFORMATION ===`,
                `Operating Scale: ${item.operScaleCd || 'N/A'}`,
                `Operating Amount: ${item.operBoundAmt || 'N/A'}`,
                `Business Category: ${item.comBzcarrCd || 'N/A'}`,
                `Strategy Planner: ${item.strtplanerYn === 'Y' ? 'Yes' : 'No'}`,
                ``,
                `=== IMPORT INFO ===`,
                `Data Type: VC Company`,
                `Import Date: ${new Date().toISOString()}`,
                `Source: Korean VC Database (vcs.go.kr)`
            ].join('\n')
        };
    };

    // Function to send data to Airtable
    const sendToAirtable = async (records) => {
        const transformedRecords = records.map(item => ({
            fields: transformVCDataForAirtable(item)
        }));

        const requestOptions = {
            url: `https://api.airtable.com/v0/${airtableBaseId}/${encodeURIComponent(airtableTableName)}`,
            method: 'POST',
            headers: {
                'Authorization': `Bearer ${airtableApiKey}`,
                'Content-Type': 'application/json'
            },
            json: {
                records: transformedRecords
            }
        };

        try {
            const response = await Apify.utils.requestAsBrowser(requestOptions);
            if (response.statusCode >= 200 && response.statusCode < 300) {
                console.log(`✅ Successfully sent ${records.length} records to Airtable`);
                return response.body;
            } else {
                throw new Error(`Airtable API error: ${response.statusCode} - ${JSON.stringify(response.body)}`);
            }
        } catch (error) {
            console.error(`❌ Failed to send to Airtable:`, error.message);
            throw error;
        }
    };

    // Add initial page to queue
    const baseUrl = 'https://www.vcs.go.kr/web/portal/investor/search';
    const tabMenu = 1; // 1 for VC companies
    const commonQueryParams = 'sortOrder=&sortDirection=&comIndCdArr=1&_comIndCdArr=on&comIndCdArr=2&_comIndCdArr=on&comIndCdArr=3&_comIndCdArr=on&comIndCdArr=4&_comIndCdArr=on&comIndCdArr=5&_comIndCdArr=on&comIndCdArr=6&_comIndCdArr=on&comIndCdArr=7&_comIndCdArr=on&comIndCdArr=8&_comIndCdArr=on&comIndCdArr=9&_comIndCdArr=on&_invstComLocCdArr=on&_invstComLocCdArr=on&_invstComLocCdArr=on&_localCdArr=on&_localCdArr=on&_localCdArr=on&_localCdArr=on&_localCdArr=on&_localCdArr=on&_localCdArr=on&_localCdArr=on&_localCdArr=on&_operScaleCdArr=on&_operScaleCdArr=on&_operScaleCdArr=on&_operScaleCdArr=on&_operScaleCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_comBzcarrCdArr=on&_comBzcarrCdArr=on&_comBzcarrCdArr=on&_comBzcarrCdArr=on&_comBzcarrCdArr=on&_comBzcarrCdArr=on&_invstorTpCdArr=on&_invstorTpCdArr=on&_invstorTpCdArr=on&_invstorTpCdArr=on&_invstorTpCdArr=on&_invstorTpCdArr=on&_invstorTpCdArr=on&_invstorTpCdArr=on&sc=operInstNm&sv=';

    await requestQueue.addRequest({
        url: `${baseUrl}?tabMenu=${tabMenu}&cp=${startPage}&${commonQueryParams}`,
        userData: { page: startPage, isFirstPage: true }
    });

    // Set up crawler
    const crawler = new Apify.BasicCrawler({
        requestQueue,
        maxRequestRetries: 3,
        
        handleRequestFunction: async ({ request }) => {
            const { page, isFirstPage } = request.userData;
            
            console.log(`📄 Processing page ${page}...`);

            try {
                const response = await Apify.utils.requestAsBrowser({
                    url: request.url,
                    headers: {
                        'Accept': 'application/json, text/javascript, */*; q=0.01',
                        'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36',
                        'X-Requested-With': 'XMLHttpRequest',
                    }
                });

                if (response.statusCode !== 200) {
                    throw new Error(`HTTP ${response.statusCode}`);
                }

                const json = response.body;
                
                // Handle different response formats
                let responseData = json;
                if (Array.isArray(json) && json.length > 0) {
                    responseData = json[0];
                } else if (typeof json === 'string') {
                    try {
                        responseData = JSON.parse(json);
                    } catch (e) {
                        console.log('🔍 DEBUG - Failed to parse JSON string');
                        responseData = json;
                    }
                }
                
                const items = responseData.list || [];
                const total = responseData.total || 0;

                if (isFirstPage) {
                    console.log(`📊 Found ${total} total VC companies in database`);
                    
                    // Add additional pages to queue if needed
                    if (items.length > 0) {
                        const totalPages = Math.ceil(total / items.length);
                        const pagesToScrape = maxPages ? Math.min(maxPages, totalPages) : totalPages;
                        
                        console.log(`🎯 Will scrape ${pagesToScrape} pages (${items.length} items per page)`);
                        
                        // Add remaining pages to queue
                        for (let p = startPage + 1; p <= pagesToScrape; p++) {
                            await requestQueue.addRequest({
                                url: `${baseUrl}?tabMenu=${tabMenu}&cp=${p}&${commonQueryParams}`,
                                userData: { page: p, isFirstPage: false }
                            });
                        }
                    }
                }

                if (items.length > 0) {
                    // Store data in dataset
                    await dataset.pushData(items);
                    console.log(`✅ Stored ${items.length} VC companies from page ${page}`);

                    // Send to Airtable in batches
                    for (let i = 0; i < items.length; i += batchSize) {
                        const batch = items.slice(i, i + batchSize);
                        await sendToAirtable(batch);
                        
                        // Delay between batches
                        if (i + batchSize < items.length) {
                            await Apify.utils.sleep(delayBetweenBatches);
                        }
                    }
                } else {
                    console.log(`ℹ️  No items found on page ${page}`);
                }

                // Delay between requests
                await Apify.utils.sleep(delayBetweenRequests);

            } catch (error) {
                console.error(`❌ Error processing page ${page}:`, error.message);
                throw error;
            }
        },

        handleFailedRequestFunction: async ({ request }) => {
            console.error(`❌ Request failed after retries: ${request.url}`);
            console.error(`   Reason: ${request.errorMessages.join(', ')}`);
        }
    });

    // Run the crawler
    console.log('🔍 Starting to crawl Korean VC data...');
    await crawler.run();

    // Get final stats
    const datasetInfo = await dataset.getInfo();
    console.log('🎉 Crawling completed!');
    console.log(`📊 Total items scraped: ${datasetInfo.itemCount}`);
    console.log('✅ All VC data has been sent to Airtable with proper field mapping!');
}); 