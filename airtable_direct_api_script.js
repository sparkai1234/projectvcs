// This script scrapes VC or Fund data and sends it directly to Airtable using REST API.

const { Actor } = require('apify');
const https = require('https');
const { URL } = require('url');

(async () => {
    // Initialize the Apify SDK
    await Actor.init();

    // Get input parameters
    const input = await Actor.getInput();
    const { dataType, airtableApiKey, airtableBaseId, airtableTableName } = input || {};

    // Validate input
    if (!dataType || (dataType !== 'VC' && dataType !== 'Fund')) {
        console.error('Error: Invalid or missing dataType input. Must be \'VC\' or \'Fund\'.');
        await Actor.exit();
        return;
    }
    if (!airtableApiKey || !airtableBaseId || !airtableTableName) {
         console.error('Error: Missing Airtable credentials or table name in input.');
         console.error('Required: airtableApiKey, airtableBaseId, airtableTableName');
         await Actor.exit();
         return;
    }

    console.log(`Starting scraper for data type: ${dataType}`);

    // Function to make HTTPS requests
    const makeRequest = (url) => {
        return new Promise((resolve, reject) => {
            const urlObj = new URL(url);
            const options = {
                hostname: urlObj.hostname,
                path: urlObj.pathname + urlObj.search,
                method: 'GET',
                headers: {
                    'Accept': 'application/json, text/javascript, */*; q=0.01',
                    'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36',
                    'X-Requested-With': 'XMLHttpRequest',
                }
            };

            const req = https.request(options, (res) => {
                let data = '';
                res.on('data', (chunk) => {
                    data += chunk;
                });
                res.on('end', () => {
                    try {
                        const jsonData = JSON.parse(data);
                        resolve({ body: jsonData, statusCode: res.statusCode });
                    } catch (error) {
                        reject(new Error(`Failed to parse JSON: ${error.message}`));
                    }
                });
            });

            req.on('error', (error) => {
                reject(error);
            });

            req.end();
        });
    };

    // Function to transform Korean data to Airtable fields
    const transformDataForAirtable = (item) => {
        return {
            'Name': item.operInstNm || '', // Company name - maps to Name field
            'Notes': [
                `Type: ${dataType} Company`,
                `Company ID: ${item.operInstId || 'N/A'}`,
                `Industry: ${item.comIndNm || 'N/A'}`,
                `Location: ${item.sigunguNm || 'N/A'}`,
                `Founded: ${item.foundYy || 'N/A'}`,
                `Company Type: ${item.operInstTpNm || 'N/A'}`,
                `Operating Scale: ${item.operScaleCd || 'N/A'}`,
                `Operating Amount: ${item.operBoundAmt || 'N/A'}`,
                `Business Category: ${item.comBzcarrCd || 'N/A'}`,
                `Zip Code: ${item.headofcZipcd || 'N/A'}`,
                `Strategy Planner: ${item.strtplanerYn || 'N/A'}`,
                `PF Angel: ${item.pfAnglYn || 'N/A'}`,
                `Import Date: ${new Date().toISOString()}`
            ].join('\n')
            // Only using Name and Notes fields to avoid dropdown permission issues
            // Assignee and Status fields will remain empty to avoid permission errors
        };
    };

    let page = 1;
    let hasMore = true;
    const results = [];
    let totalCount = 0;

    // Determine the API URL based on dataType
    const baseUrl = 'https://www.vcs.go.kr/web/portal/investor/search';
    const tabMenu = dataType === 'VC' ? 1 : 2; // 1 for VC, 2 for Fund
    const commonQueryParams = 'sortOrder=&sortDirection=&comIndCdArr=1&_comIndCdArr=on&comIndCdArr=2&_comIndCdArr=on&comIndCdArr=3&_comIndCdArr=on&comIndCdArr=4&_comIndCdArr=on&comIndCdArr=5&_comIndCdArr=on&comIndCdArr=6&_comIndCdArr=on&comIndCdArr=7&_comIndCdArr=on&comIndCdArr=8&_comIndCdArr=on&comIndCdArr=9&_comIndCdArr=on&_invstComLocCdArr=on&_invstComLocCdArr=on&_invstComLocCdArr=on&_localCdArr=on&_localCdArr=on&_localCdArr=on&_localCdArr=on&_localCdArr=on&_localCdArr=on&_localCdArr=on&_localCdArr=on&_localCdArr=on&_localCdArr=on&_operScaleCdArr=on&_operScaleCdArr=on&_operScaleCdArr=on&_operScaleCdArr=on&_operScaleCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_comBzcarrCdArr=on&_comBzcarrCdArr=on&_comBzcarrCdArr=on&_comBzcarrCdArr=on&_comBzcarrCdArr=on&_comBzcarrCdArr=on&_invstorTpCdArr=on&_invstorTpCdArr=on&_invstorTpCdArr=on&_invstorTpCdArr=on&_invstorTpCdArr=on&_invstorTpCdArr=on&_invstorTpCdArr=on&_invstorTpCdArr=on&sc=operInstNm&sv=';

    while (hasMore) {
        const url = `${baseUrl}?tabMenu=${tabMenu}&cp=${page}&${commonQueryParams}`;

        console.log(`Requesting page ${page} for ${dataType} data...`);

        try {
            // Use our custom request function
            const response = await makeRequest(url);
            const json = response.body;

            // Print the first response to see the structure
            if (page === 1) {
                console.log(`Sample ${dataType} response:`, JSON.stringify(json, null, 2));
            }

            const items = json.list || [];
            if (items.length > 0) {
                results.push(...items);
                totalCount += items.length;
                page++;
            } else {
                hasMore = false;
            }
        } catch (e) {
            console.error(`Failed to fetch or parse page ${page} for ${dataType} data:`, e);
            hasMore = false;
            continue;
        }
    }

    console.log(`Scraped a total of ${totalCount} ${dataType} entries.`);

    if (results.length > 0) {
        // Send data to Airtable using REST API
        try {
            console.log(`Attempting to connect to Airtable Base ID: ${airtableBaseId}, Table: ${airtableTableName}`);
            
            // Function to make HTTP request to Airtable
            const sendToAirtable = (records) => {
                return new Promise((resolve, reject) => {
                    const transformedRecords = records.map(item => ({ fields: transformDataForAirtable(item) }));
                    const data = JSON.stringify({
                        records: transformedRecords
                    });
                    
                    // Debug: Log the first record to see what we're sending
                    if (transformedRecords.length > 0) {
                        console.log('Sample record being sent to Airtable:', JSON.stringify(transformedRecords[0], null, 2));
                    }
                    
                    const options = {
                        hostname: 'api.airtable.com',
                        path: `/v0/${airtableBaseId}/${encodeURIComponent(airtableTableName)}`,
                        method: 'POST',
                        headers: {
                            'Authorization': `Bearer ${airtableApiKey}`,
                            'Content-Type': 'application/json',
                            'Content-Length': Buffer.byteLength(data)
                        }
                    };

                    const req = https.request(options, (res) => {
                        let responseBody = '';
                        res.on('data', (chunk) => {
                            responseBody += chunk;
                        });
                        res.on('end', () => {
                            if (res.statusCode >= 200 && res.statusCode < 300) {
                                resolve(JSON.parse(responseBody));
                            } else {
                                console.error(`Airtable API Error - Status: ${res.statusCode}`);
                                console.error(`Response Body: ${responseBody}`);
                                reject(new Error(`HTTP ${res.statusCode}: ${responseBody}`));
                            }
                        });
                    });

                    req.on('error', (error) => {
                        console.error('Request error:', error);
                        reject(error);
                    });

                    req.write(data);
                    req.end();
                });
            };

            console.log(`Sending ${results.length} records to Airtable...`);

            // Send records in batches of 10 (Airtable API limit)
            for (let i = 0; i < results.length; i += 10) {
                const batch = results.slice(i, i + 10);
                await sendToAirtable(batch);
                console.log(`Sent batch ${Math.floor(i / 10) + 1}...`);
                // Add a small delay to avoid hitting rate limits
                await new Promise(resolve => setTimeout(resolve, 100));
            }

            console.log(`Successfully exported ${results.length} ${dataType} entries to Airtable.`);
        } catch (error) {
            console.error(`Error exporting ${dataType} data to Airtable:`, error);
            console.error('Airtable error details:', error.message);
            // Save scraped data to dataset if Airtable export fails
            await Actor.pushData(results);
            console.log(`Saved scraped ${dataType} data to dataset due to Airtable export error.`);
        }
    } else {
        console.log(`No ${dataType} entries scraped, skipping Airtable export.`);
    }

    // Exit the actor
    await Actor.exit();
})(); 