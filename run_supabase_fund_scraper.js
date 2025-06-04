/**
 * 🏦 APIFY FUND SCRAPER RUNNER - SUPABASE VERSION
 * ===============================================
 * 
 * Runs the Fund scraper via Apify API and sends data to Supabase
 * Based on your working run_scraper_api_funds_airtable.js pattern
 */

const { ApifyClient } = require('apify-client');
const fs = require('fs').promises;

// Load environment variables
require('dotenv').config();

// Get environment variables
const APIFY_API_TOKEN = process.env.APIFY_API_TOKEN;
const SUPABASE_URL = process.env.SUPABASE_URL;
const SUPABASE_KEY = process.env.SUPABASE_KEY;

if (!APIFY_API_TOKEN) {
    console.error('❌ Error: APIFY_API_TOKEN environment variable is not set');
    console.error('Please set it using: $env:APIFY_API_TOKEN="your-token-here"');
    process.exit(1);
}

if (!SUPABASE_URL || !SUPABASE_KEY) {
    console.error('❌ Error: SUPABASE_URL and SUPABASE_KEY environment variables must be set');
    console.error('Please set them in your .env file');
    process.exit(1);
}

// Initialize the ApifyClient with API token
const client = new ApifyClient({
    token: APIFY_API_TOKEN,
});

async function runFundScraper() {
    try {
        console.log('🚀 Starting Fund scraper for Supabase...');

        // Read the working Supabase Fund scraper code
        const scraperCode = await fs.readFile('supabase_fund_scraper_working.js', 'utf8');

        // Run your custom scraper actor (Fund data for Supabase)
        const run = await client.actor("ECFcJkFqhtxYGqqGy").call({
            code: scraperCode,
            dataType: 'Fund',
            maxPages: 5, // Start with 5 pages for testing
            
            // Pass Supabase credentials as input
            supabaseUrl: SUPABASE_URL,
            supabaseKey: SUPABASE_KEY
        });

        console.log('✅ Fund scraper finished successfully!');
        console.log('📊 Run ID:', run.id);
        console.log('📋 Check Apify Console for detailed logs');
        console.log('🗄️ Check Supabase fund_table for imported data');

        // Get basic stats
        if (run.defaultDatasetId) {
            try {
                const { items } = await client.dataset(run.defaultDatasetId).listItems();
                console.log(`📈 Dataset contains ${items.length} records`);
                
                if (items.length > 0) {
                    console.log('🔍 Sample record structure:');
                    console.log(JSON.stringify(items[0], null, 2));
                }
            } catch (datasetError) {
                console.log('⚠️ Could not fetch dataset info:', datasetError.message);
            }
        }

    } catch (error) {
        console.error('💥 Error running Fund scraper:', error.message);
        process.exit(1);
    }
}

// Execute the scraper
runFundScraper(); 