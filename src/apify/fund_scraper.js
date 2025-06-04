// This script fetches all pages of Fund data from the API and sends them to a Google Sheet.

const { Actor } = require('apify');

(async () => {
    // Initialize the Apify SDK
    await Actor.init();

    // Get the dataset ID for this run from environment variables
    const currentDatasetId = process.env.APIFY_DATASET_ID;
    console.log('Current Dataset ID:', currentDatasetId);
    // ...
    const config = {
        // ... other config ...
        datasetId: currentDatasetId, // Pass the dataset ID
    };
    let page = 1;
    let hasMore = true;
    const results = [];
    let totalCount = 0;

    while (hasMore) {
        // Modified URL with tabMenu=2 for Fund data
        const url = `https://www.vcs.go.kr/web/portal/investor/search?sortOrder=&sortDirection=&tabMenu=2&cp=${page}&comIndCdArr=1&_comIndCdArr=on&comIndCdArr=2&_comIndCdArr=on&comIndCdArr=3&_comIndCdArr=on&comIndCdArr=4&_comIndCdArr=on&comIndCdArr=5&_comIndCdArr=on&comIndCdArr=6&_comIndCdArr=on&comIndCdArr=7&_comIndCdArr=on&comIndCdArr=8&_comIndCdArr=on&comIndCdArr=9&_comIndCdArr=on&_invstComLocCdArr=on&_invstComLocCdArr=on&_invstComLocCdArr=on&_localCdArr=on&_localCdArr=on&_localCdArr=on&_localCdArr=on&_localCdArr=on&_localCdArr=on&_localCdArr=on&_localCdArr=on&_localCdArr=on&_localCdArr=on&_operScaleCdArr=on&_operScaleCdArr=on&_operScaleCdArr=on&_operScaleCdArr=on&_operScaleCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_comBzcarrCdArr=on&_comBzcarrCdArr=on&_comBzcarrCdArr=on&_comBzcarrCdArr=on&_comBzcarrCdArr=on&_comBzcarrCdArr=on&_invstorTpCdArr=on&_invstorTpCdArr=on&_invstorTpCdArr=on&_invstorTpCdArr=on&_invstorTpCdArr=on&_invstorTpCdArr=on&_invstorTpCdArr=on&_invstorTpCdArr=on&sc=operInstNm&sv=`;

        console.log(`Requesting page ${page}...`);

        try {
            const response = await fetch(url, {
                headers: {
                    'Accept': 'application/json, text/javascript, */*; q=0.01',
                    'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36',
                    'X-Requested-With': 'XMLHttpRequest',
                }
            });

            if (!response.ok) {
                throw new Error(`HTTP error! status: ${response.status}`);
            }

            const json = await response.json();

            // Print the first response to see the structure
            if (page === 1) {
                console.log('Sample response:', JSON.stringify(json, null, 2));
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
            console.error(`Failed to fetch or parse page ${page}:`, e);
            hasMore = false;
            continue;
        }
    }

    // Save data to Apify dataset
    await Actor.pushData(results);

    console.log(`Scraped a total of ${totalCount} Fund entries. Sending data to Google Sheet...`);

    // Validate data before sending
    if (!results || results.length === 0) {
        console.error('No data to send to Google Sheets');
        await Actor.exit();
        return;
    }

    // Log the first item to verify data structure
    console.log('Sample data item:', JSON.stringify(results[0], null, 2));

    // Call the Google Sheets Import & Export actor to send data to the spreadsheet
    try {
        const config = {
            mode: 'append',
            spreadsheetId: '1G9Ufk8muZUeq9RAiOzVvkI93xd0JygAvrQKY8xz-prk',
            sheetName: 'Fund Data',
            // Use OAuth2 authentication
            authType: 'oauth2',
            clientId: process.env.GOOGLE_CLIENT_ID,
            clientSecret: process.env.GOOGLE_CLIENT_SECRET,
            redirectUri: 'https://console.apify.com/oauth2/callback',
            datasetId: currentDatasetId, // Pass the dataset ID
        };

        console.log('Calling Google Sheets actor with config:', {
            ...config,
            clientSecret: config.clientSecret ? '' : undefined,
        });

        const googleSheetsActorCall = await Actor.call(
            'lukaskrivka/google-sheets',
            config
        );

        console.log('Google Sheets Import & Export actor finished with status:', googleSheetsActorCall.status);
        
        if (googleSheetsActorCall.status === 'FAILED') {
            console.error('Google Sheets actor failed. Full response:', JSON.stringify(googleSheetsActorCall, null, 2));
            
            // Check for authentication errors
            if (googleSheetsActorCall.error && googleSheetsActorCall.error.includes('authentication')) {
                console.error('Authentication error detected. Please check:');
                console.error('1. GOOGLE_CLIENT_ID is set in Apify environment variables');
                console.error('2. GOOGLE_CLIENT_SECRET is set in Apify environment variables');
                console.error('3. The OAuth2 credentials are properly configured in Google Cloud Console');
            }
        }

    } catch (error) {
        console.error('Error calling Google Sheets Import & Export actor:', error);
        console.error('Error details:', JSON.stringify(error, null, 2));
        
        // Check for authentication errors in the catch block too
        if (error.message && error.message.includes('authentication')) {
            console.error('Authentication error detected. Please check:');
            console.error('1. GOOGLE_CLIENT_ID is set in Apify environment variables');
            console.error('2. GOOGLE_CLIENT_SECRET is set in Apify environment variables');
            console.error('3. The OAuth2 credentials are properly configured in Google Cloud Console');
        }
    }

    // Exit the actor
    await Actor.exit();
})();