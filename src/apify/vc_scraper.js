// This script fetches all pages of VC data from the API and sends them to a Google Sheet.

const { Actor, utils } = require('apify');
// const fetch = require('node-fetch'); // Assuming node-fetch is available in the actor environment

(async () => {
    // Initialize the Apify SDK
    await Actor.init();

    // Get input parameters
    const input = await Actor.getInput();
    const { dataType } = input || {}; // Expecting input like { dataType: 'VC' } or { dataType: 'Fund' }

    if (!dataType || (dataType !== 'VC' && dataType !== 'Fund')) {
        console.error('Error: Invalid or missing dataType input. Must be \'VC\' or \'Fund\'.');
        await Actor.exit();
        return;
    }

    console.log(`Starting scraper for data type: ${dataType}`);

    let page = 1;
    let hasMore = true;
    const results = [];
    let totalCount = 0;

    // Determine the API URL based on dataType
    const baseUrl = 'https://www.vcs.go.kr/web/portal/investor/search';
    const tabMenu = dataType === 'VC' ? 1 : 2; // 1 for VC, 2 for Fund
    const commonQueryParams = 'sortOrder=&sortDirection=&comIndCdArr=1&_comIndCdArr=on&comIndCdArr=2&_comIndCdArr=on&comIndCdArr=3&_comIndCdArr=on&comIndCdArr=4&_comIndCdArr=on&comIndCdArr=5&_comIndCdArr=on&comIndCdArr=6&_comIndCdArr=on&comIndCdArr=7&_comIndCdArr=on&comIndCdArr=8&_comIndCdArr=on&comIndCdArr=9&_comIndCdArr=on&_invstComLocCdArr=on&_invstComLocCdArr=on&_invstComLocCdArr=on&_localCdArr=on&_localCdArr=on&_localCdArr=on&_localCdArr=on&_localCdArr=on&_localCdArr=on&_localCdArr=on&_localCdArr=on&_localCdArr=on&_localCdArr=on&_operScaleCdArr=on&_operScaleCdArr=on&_operScaleCdArr=on&_operScaleCdArr=on&_operScaleCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_comBzcarrCdArr=on&_comBzcarrCdArr=on&_comBzcarrCdArr=on&_comBzcarrCdArr=on&_comBzcarrCdArr=on&_comBzcarrCdArr=on&_invstorTpCdArr=on&_invstorTpCdArr=on&_invstorTpCdArr=on&_invstorTpCdArr=on&_invstorTpCdArr=on&_invstorTpCdArr=on&_invstorTpCdArr=on&_invstorTpCdArr=on&sc=operInstNm&sv=';

    while (hasMore) {
        const url = `${baseUrl}?tabMenu=${tabMenu}&cp=${page}&${commonQueryParams}`;

        console.log(`Requesting page ${page} for ${dataType} data...`);

        try {
            // Use Apify's built-in request utility
            const response = await utils.requestAsBrowser({
                url: url,
                method: 'GET',
                headers: {
                    'Accept': 'application/json, text/javascript, */*; q=0.01',
                    'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36',
                    'X-Requested-With': 'XMLHttpRequest',
                },
                // Apify utilities often return the parsed body directly for JSON
                json: true,
            });

            // The response is the parsed JSON body when json: true is used
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
            // Continue to try next page if possible, or exit if no more pages
            if (json && json.list && json.list.length === 0) {
                hasMore = false; // No more data if the list is empty on error
            } else {
                // If error occurred mid-pagination, we might have missed data
                // For this basic version, we'll stop, but could add retry logic
                console.warn(`Stopping ${dataType} scraping due to error. Data might be incomplete.`);
                hasMore = false;
            }
            continue;
        }
    }

    console.log(`Scraped a total of ${totalCount} ${dataType} entries.`);

    // Save data to Apify dataset
    // The Airtable exporter will read from this dataset
    await Actor.pushData(results);

    console.log(`Pushed ${totalCount} ${dataType} entries to dataset.`);

    // Exit the actor
    await Actor.exit();
})();