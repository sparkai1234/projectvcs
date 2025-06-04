// This script fetches all pages of Fund data from the API and sends them to a Google Sheet.

const { ApifyClient } = require('apify-client');

(async () => {
    // Check for required environment variables
    if (!process.env.APIFY_API_TOKEN) {
        console.error('Error: APIFY_API_TOKEN environment variable is not set');
        console.error('Please set it using: $env:APIFY_API_TOKEN="your-token-here"');
        process.exit(1);
    }

    // Initialize the ApifyClient with API token
    const client = new ApifyClient({
        token: process.env.APIFY_API_TOKEN
    });

    let page = 1;
    let hasMore = true;
    const results = [];
    let totalCount = 0;

    while (hasMore) {
        // Modified URL with tabMenu=2 for Fund data
        const url = `https://www.vcs.go.kr/web/portal/investor/search?sortOrder=&sortDirection=&tabMenu=2&cp=${page}&comIndCdArr=1&_comIndCdArr=on&comIndCdArr=2&_comIndCdArr=on&comIndCdArr=3&_comIndCdArr=on&comIndCdArr=4&_comIndCdArr=on&comIndCdArr=5&_comIndCdArr=on&comIndCdArr=6&_comIndCdArr=on&comIndCdArr=7&_comIndCdArr=on&comIndCdArr=8&_comIndCdArr=on&comIndCdArr=9&_comIndCdArr=on&_invstComLocCdArr=on&_invstComLocCdArr=on&_invstComLocCdArr=on&_localCdArr=on&_localCdArr=on&_localCdArr=on&_localCdArr=on&_localCdArr=on&_localCdArr=on&_localCdArr=on&_localCdArr=on&_localCdArr=on&_localCdArr=on&_operScaleCdArr=on&_operScaleCdArr=on&_operScaleCdArr=on&_operScaleCdArr=on&_operScaleCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_comBzcarrCdArr=on&_comBzcarrCdArr=on&_comBzcarrCdArr=on&_comBzcarrCdArr=on&_comBzcarrCdArr=on&_comBzcarrCdArr=on&_invstorTpCdArr=on&_invstorTpCdArr=on&_invstorTpCdArr=on&_invstorTpCdArr=on&_invstorTpCdArr=on&_invstorTpCdArr=on&_invstorTpCdArr=on&_invstorTpCdArr=on&sc=operInstNm&sv=`;

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

    console.log(`Scraped a total of ${totalCount} Fund entries. Sending data to Google Sheet...`);

    // Validate data before sending
    if (!results || results.length === 0) {
        console.error('No data to send to Google Sheets');
        return;
    }

    // Format data for Google Sheets
    const formattedData = results.map(item => ({
        fundId: item.fundId || '',
        regDd: item.regDd || '',
        fundNm: item.fundNm || '',
        formTotamt: item.formTotamt || '',
        invstCharcCd: item.invstCharcCd || '',
        comIndCd: item.comIndCd || '',
        operInstId: item.operInstId || '',
        operInstNm: item.operInstNm || '',
        expDd: item.expDd || '',
        invstFldTpNm: item.invstFldTpNm || '',
        invstFldDtlTpNm: item.invstFldDtlTpNm || ''
    }));

    // Log the first item to verify data structure
    console.log('Sample formatted data item:', JSON.stringify(formattedData[0], null, 2));

    // Call the Google Sheets Import & Export actor to send data to the spreadsheet
    try {
        // Check for required Google OAuth credentials
        if (!process.env.GOOGLE_CLIENT_ID || !process.env.GOOGLE_CLIENT_SECRET) {
            throw new Error('Missing Google OAuth credentials. Please set GOOGLE_CLIENT_ID and GOOGLE_CLIENT_SECRET environment variables.');
        }

        const config = {
            mode: 'append',
            spreadsheetId: '1G9Ufk8muZUeq9RAiOzVvkI93xd0JygAvrQKY8xz-prk',
            sheetName: 'Fund Data',
            authType: 'oauth2',
            clientId: process.env.GOOGLE_CLIENT_ID,
            clientSecret: process.env.GOOGLE_CLIENT_SECRET,
            redirectUri: 'https://console.apify.com/oauth2/callback',
            parsedData: formattedData,
            // Simplified configuration
            keepSheetColumnOrder: false,
            createBackup: false,
            deduplicateByEquality: false,
            // Add these options
            limit: 100000,
            offset: 0,
            tokensStore: 'google-oauth-tokens'
        };

        console.log('Calling Google Sheets actor with config:', {
            ...config,
            clientSecret: config.clientSecret ? '[REDACTED]' : undefined,
            parsedData: `[${formattedData.length} items]`
        });

        // First, try to get the dataset ID
        const dataset = await client.dataset('CYbQsdfe4qOETw5WH').get();
        console.log('Using dataset:', dataset.id);

        const googleSheetsActorCall = await client.actor('lukaskrivka/google-sheets').call(config);

        console.log('Google Sheets Import & Export actor finished with status:', googleSheetsActorCall.status);
        
        if (googleSheetsActorCall.status === 'FAILED') {
            console.error('Google Sheets actor failed. Full response:', JSON.stringify(googleSheetsActorCall, null, 2));
            
            // Check for specific error types
            if (googleSheetsActorCall.error) {
                if (googleSheetsActorCall.error.includes('authentication')) {
                    console.error('Authentication error detected. Please check:');
                    console.error('1. GOOGLE_CLIENT_ID is set correctly');
                    console.error('2. GOOGLE_CLIENT_SECRET is set correctly');
                    console.error('3. The OAuth2 credentials are properly configured in Google Cloud Console');
                    console.error('4. The redirect URI matches exactly: https://console.apify.com/oauth2/callback');
                } else if (googleSheetsActorCall.error.includes('spreadsheet')) {
                    console.error('Spreadsheet error detected. Please check:');
                    console.error('1. The spreadsheet ID is correct');
                    console.error('2. The sheet name exists');
                    console.error('3. You have write access to the spreadsheet');
                }
            }
        } else {
            console.log('Successfully sent data to Google Sheets!');
        }

    } catch (error) {
        console.error('Error calling Google Sheets Import & Export actor:', error);
        console.error('Error details:', JSON.stringify(error, null, 2));
        
        if (error.message) {
            if (error.message.includes('authentication')) {
                console.error('Authentication error detected. Please check your credentials.');
            } else if (error.message.includes('spreadsheet')) {
                console.error('Spreadsheet error detected. Please check your spreadsheet settings.');
            }
        }
    }
})();