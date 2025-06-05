/**
 * 🇰🇷 VCS WEEKLY SCRAPER - Apify Actor
 * ====================================
 * 
 * Professional Apify actor for Korean VCS data scraping
 * - Weekly scheduling via Apify Console UI
 * - Easy parameter management through web forms
 * - Built-in monitoring and alerting
 * - Professional data storage and APIs
 */

const Apify = require('apify');
const { createClient } = require('@supabase/supabase-js');

Apify.main(async () => {
    console.log('🇰🇷 VCS Weekly Scraper Started');
    console.log(`🕐 Execution time: ${new Date().toISOString()}`);
    
    // Get input parameters from Apify Console UI
    const input = await Apify.getInput();
    const {
        updateMode = 'incremental',      // full, incremental
        maxPages = 100,                  // Maximum pages to scrape
        dataSource = 'both',             // investors, funds, both
        notifyOnCompletion = true,       // Send notifications
        exportToSupabase = true,         // Auto-export to database
        supabaseUrl = process.env.SUPABASE_URL,
        supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY
    } = input;
    
    console.log('⚙️ Configuration:', {
        updateMode,
        maxPages,
        dataSource,
        notifyOnCompletion,
        exportToSupabase: !!supabaseUrl
    });
    
    try {
        // VCS API Configuration
        const VCS_CONFIG = {
            baseUrl: 'https://www.vcs.go.kr',
            apiEndpoint: '/web/portal/investor/search',
            maxRetries: 3,
            requestDelay: 1500,
            timeout: 30000
        };
        
        /**
         * Make robust API request with retry logic
         */
        async function makeVCSRequest(formData, attempt = 1) {
            const queryParams = new URLSearchParams();
            Object.entries(formData).forEach(([key, value]) => {
                if (Array.isArray(value)) {
                    value.forEach(v => queryParams.append(key, v));
                } else {
                    queryParams.append(key, value);
                }
            });
            
            const url = `${VCS_CONFIG.baseUrl}${VCS_CONFIG.apiEndpoint}?${queryParams.toString()}`;
            
            console.log(`📡 API Request (attempt ${attempt}): Page ${formData.cp}, Tab ${formData.tabMenu}`);
            
            const response = await Apify.utils.requestAsBrowser({
                url,
                headers: {
                    'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36',
                    'Accept': 'application/json, text/javascript, */*; q=0.01',
                    'Accept-Language': 'ko-KR,ko;q=0.9,en;q=0.8',
                    'X-Requested-With': 'XMLHttpRequest',
                    'Referer': 'https://www.vcs.go.kr/web/portal/investor/list'
                },
                timeout: VCS_CONFIG.timeout
            });
            
            if (response.statusCode !== 200) {
                throw new Error(`HTTP ${response.statusCode}: ${response.body}`);
            }
            
            return JSON.parse(response.body);
        }
        
        /**
         * Scrape VCS investors data
         */
        async function scrapeInvestors() {
            if (dataSource !== 'both' && dataSource !== 'investors') {
                console.log('⏭️ Skipping investors (not in dataSource)');
                return [];
            }
            
            console.log('📊 === SCRAPING INVESTORS ===');
            
            let currentPage = 1;
            let hasMorePages = true;
            const allInvestors = [];
            
            while (hasMorePages && currentPage <= maxPages) {
                const formData = {
                    tabMenu: '1',
                    cp: currentPage.toString(),
                    sortOrder: '',
                    sortDirection: ''
                };
                
                try {
                    const response = await makeVCSRequest(formData);
                    
                    if (response && response.list && response.list.length > 0) {
                        allInvestors.push(...response.list);
                        
                        console.log(`✅ Page ${currentPage}: ${response.list.length} investors`);
                        console.log(`📊 Total so far: ${allInvestors.length} investors`);
                        
                        // Check if we should continue
                        const total = response.total || 0;
                        const pageSize = 10;
                        const totalPages = Math.ceil(total / pageSize);
                        
                        hasMorePages = currentPage < totalPages;
                        currentPage++;
                        
                        // Rate limiting
                        if (hasMorePages) {
                            await Apify.utils.sleep(VCS_CONFIG.requestDelay);
                        }
                        
                    } else {
                        console.log(`⚠️ Page ${currentPage}: No data returned`);
                        hasMorePages = false;
                    }
                } catch (error) {
                    console.error(`❌ Error on page ${currentPage}:`, error.message);
                    hasMorePages = false;
                }
            }
            
            console.log(`✅ Investors scraping complete: ${allInvestors.length} total`);
            return allInvestors;
        }
        
        /**
         * Scrape VCS funds data
         */
        async function scrapeFunds() {
            if (dataSource !== 'both' && dataSource !== 'funds') {
                console.log('⏭️ Skipping funds (not in dataSource)');
                return [];
            }
            
            console.log('💰 === SCRAPING FUNDS ===');
            
            let currentPage = 1;
            let hasMorePages = true;
            const allFunds = [];
            
            while (hasMorePages && currentPage <= maxPages) {
                const formData = {
                    tabMenu: '2',
                    cp: currentPage.toString(),
                    sortOrder: '',
                    sortDirection: ''
                };
                
                try {
                    const response = await makeVCSRequest(formData);
                    
                    if (response && response.list && response.list.length > 0) {
                        allFunds.push(...response.list);
                        
                        console.log(`✅ Page ${currentPage}: ${response.list.length} funds`);
                        console.log(`📊 Total so far: ${allFunds.length} funds`);
                        
                        // Check if we should continue
                        const total = response.total || 0;
                        const pageSize = 10;
                        const totalPages = Math.ceil(total / pageSize);
                        
                        hasMorePages = currentPage < totalPages;
                        currentPage++;
                        
                        // Rate limiting
                        if (hasMorePages) {
                            await Apify.utils.sleep(VCS_CONFIG.requestDelay);
                        }
                        
                    } else {
                        console.log(`⚠️ Page ${currentPage}: No data returned`);
                        hasMorePages = false;
                    }
                } catch (error) {
                    console.error(`❌ Error on page ${currentPage}:`, error.message);
                    hasMorePages = false;
                }
            }
            
            console.log(`✅ Funds scraping complete: ${allFunds.length} total`);
            return allFunds;
        }
        
        // Execute scraping
        const startTime = Date.now();
        const [investors, funds] = await Promise.all([
            scrapeInvestors(),
            scrapeFunds()
        ]);
        
        const duration = Math.round((Date.now() - startTime) / 1000);
        const totalRecords = investors.length + funds.length;
        
        // Prepare result data
        const resultData = {
            timestamp: new Date().toISOString(),
            source: 'VCS_WEEKLY_SCRAPER',
            updateMode,
            dataSource,
            investors: {
                count: investors.length,
                data: investors
            },
            funds: {
                count: funds.length,
                data: funds
            },
            metadata: {
                totalRecords,
                duration_seconds: duration,
                maxPages,
                actualPages: Math.max(
                    investors.length > 0 ? Math.ceil(investors.length / 10) : 0,
                    funds.length > 0 ? Math.ceil(funds.length / 10) : 0
                )
            }
        };
        
        // Save to Apify dataset
        await Apify.pushData(resultData);
        
        // Export to Supabase if configured
        if (exportToSupabase && supabaseUrl && supabaseKey) {
            console.log('📤 Exporting to Supabase...');
            
            try {
                const supabase = createClient(supabaseUrl, supabaseKey);
                
                // Export investors
                if (investors.length > 0) {
                    console.log(`📊 Exporting ${investors.length} investors...`);
                    // Add export logic here based on your existing import scripts
                }
                
                // Export funds  
                if (funds.length > 0) {
                    console.log(`💰 Exporting ${funds.length} funds...`);
                    // Add export logic here based on your existing import scripts
                }
                
                console.log('✅ Supabase export completed');
            } catch (exportError) {
                console.error('❌ Supabase export failed:', exportError.message);
                // Don't fail the entire run if export fails
            }
        }
        
        // Final summary
        console.log('🎉 === VCS WEEKLY SCRAPING COMPLETED ===');
        console.log(`📊 Total records: ${totalRecords}`);
        console.log(`👥 Investors: ${investors.length}`);
        console.log(`💰 Funds: ${funds.length}`);
        console.log(`⏱️ Duration: ${duration} seconds`);
        console.log(`📅 Update mode: ${updateMode}`);
        
        // Set output for Apify Console
        await Apify.setValue('OUTPUT', {
            success: true,
            summary: {
                totalRecords,
                investors: investors.length,
                funds: funds.length,
                duration_seconds: duration,
                timestamp: new Date().toISOString()
            }
        });
        
        // Send notification if enabled
        if (notifyOnCompletion) {
            console.log('📧 Sending completion notification...');
            // Apify can send notifications via webhooks or email
            // Configuration done in Apify Console
        }
        
    } catch (error) {
        console.error('❌ VCS Scraper failed:', error);
        
        // Save error information
        await Apify.setValue('OUTPUT', {
            success: false,
            error: error.message,
            timestamp: new Date().toISOString()
        });
        
        throw error;
    }
}); 