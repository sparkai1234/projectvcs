const { ApifyClient } = require('apify-client');
const { exec } = require('child_process');
const util = require('util');
const fs = require('fs').promises; // Add back file system module
const execPromise = util.promisify(exec);

// Load environment variables from .env file
require('dotenv').config();

// Get environment variables
const APIFY_API_TOKEN = process.env.APIFY_API_TOKEN;
// Airtable credentials will be read by the actor from its environment variables
// const AIRTABLE_API_KEY = process.env.AIRTABLE_API_KEY; // Removed
// const AIRTABLE_BASE_ID = process.env.AIRTABLE_BASE_ID; // Removed
// const AIRTABLE_FUND_TABLE_NAME = process.env.AIRTABLE_FUND_TABLE_NAME; // Removed

if (!APIFY_API_TOKEN) {
    console.error('Error: APIFY_API_TOKEN environment variable is not set');
    console.error('Please set it using: $env:APIFY_API_TOKEN="your-token-here"');
    process.exit(1);
}

// Removed Airtable environment variable checks
// if (!AIRTABLE_API_KEY) { ... }
// if (!AIRTABLE_BASE_ID) { ... }
// if (!AIRTABLE_FUND_TABLE_NAME) { ... }

// Initialize the ApifyClient with API token
const client = new ApifyClient({
    token: APIFY_API_TOKEN,
});

async function runScraper() {
    try {
        console.log('Starting Funds scraper actor via API...');

        // Read the scraper code from the new airtable direct API script
        const scraperCode = await fs.readFile('airtable_direct_api_script.js', 'utf8');

        // Run your custom scraper actor (Funds data)
        // Airtable credentials will be read from the actor's environment variables
        const run = await client.actor("ECFcJkFqhtxYGqqGy").call({
            code: scraperCode, // Pass the scraper code as input
            dataType: 'Fund', // Specify the data type
            // Input parameters for the actor to read Airtable credentials
            airtableApiKey: process.env.AIRTABLE_API_KEY, // Pass from local .env for actor input
            airtableBaseId: process.env.AIRTABLE_BASE_ID, // Pass from local .env for actor input
            airtableTableName: process.env.AIRTABLE_FUND_TABLE_NAME, // Pass from local .env for actor input
        });

        console.log('Funds scraper actor finished successfully. Run ID:', run.id);
        console.log('Check Apify Console logs for scraping and Airtable export status.');

        // Removed fetching data from dataset and calling Airtable actor locally
        // console.log('Fetching data from dataset ID:', run.defaultDatasetId);
        // const { items } = await client.dataset(run.defaultDatasetId).listItems();
        // console.log(`Retrieved ${items.length} items from dataset`);
        // ... Airtable export code removed ...

    } catch (error) {
        console.error('Error starting Funds scraper actor:', error);
    }
}

runScraper(); 