/**
 * 🇰🇷 OPTIMIZED VCS WEEKLY SCRAPER - APIFY ACTOR v2.0.2
 * ====================================================
 * 
 * BREAKTHROUGH UPDATE:
 * - Fixed target URL to correct investor search page
 * - Implemented proper search workflow with filters
 * - Added search button interaction
 * - Enhanced data extraction from real search results
 */

const { Actor } = require('apify');
const { createClient } = require('@supabase/supabase-js');

Actor.main(async () => {
    console.log('🇰🇷 VCS Weekly Scraper Actor Started (Phase 1) - v2.0.2');
    console.log(`🕐 Execution time: ${new Date().toISOString()}`);
    
    // Get input parameters from Apify Console UI
    const input = await Actor.getInput() || {};
    const {
        updateMode = 'incremental',    // full, incremental
        maxPages = 10,                 // Reasonable limit for weekly updates
        dataSource = 'both',           // investors, funds, both  
        exportToSupabase = false,      // Enable when ready
        supabaseUrl = process.env.SUPABASE_URL,
        supabaseKey = process.env.SUPABASE_ANON_KEY
    } = input;
    
    console.log('⚙️ Actor Configuration loaded:');
    console.log(`📊 Update Mode: ${updateMode}`);
    console.log(`📄 Max Pages: ${maxPages}`);
    console.log(`🎯 Data Source: ${dataSource}`);
    console.log(`💾 Export to Supabase: ${exportToSupabase}`);
    
    // CORRECTED VCS Configuration - targeting the right investor search page
    const VCS_CONFIG = {
        baseUrl: 'https://www.vcs.go.kr',
        endpoints: {
            // CORRECTED: Use the proper investor search page
            investorSearch: '/web/portal/investor/list',           // Main investor search page
            fundSearch: '/web/portal/rsh/list',                   // Fund search page
        },
        browser: {
            headless: true,
            requestDelay: 2000,
            navigationTimeout: 30000,
            locale: 'ko-KR',
            timezone: 'Asia/Seoul'
        },
        selectors: {
            // Search interface selectors
            searchForm: 'form, .search-form',
            searchButton: 'button[type="submit"], .search-btn, input[type="submit"]',
            expertSearchButton: '전문검색',
            
            // Filter selectors - set all to "전체" (All) for maximum results
            industryFilter: 'select[name*="industry"], input[name*="industry"]',
            locationFilter: 'select[name*="location"], input[name*="location"]', 
            scaleFilter: 'select[name*="scale"], input[name*="scale"]',
            characterFilter: 'select[name*="character"], input[name*="character"]',
            typeFilter: 'select[name*="type"], input[name*="type"]',
            
            // Results table selectors
            resultsTable: 'table, .result-table, .list-table',
            resultRows: 'tbody tr, .result-row',
            
            // Pagination
            nextPageBtn: '.pagination .next, .page-next, [aria-label="다음"]',
            pageNumbers: '.pagination a, .page-num',
            
            // Data extraction selectors
            companyName: 'td:nth-child(1), td:nth-child(2), .company-name',
            location: 'td:nth-child(3), .location',
            scale: 'td:nth-child(4), .scale',
            contact: 'td:nth-child(5), .contact'
        },
        api: {
            headers: {
                'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
                'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,*/*;q=0.8',
                'Accept-Language': 'ko-KR,ko;q=0.9,en;q=0.8',
                'Accept-Encoding': 'gzip, deflate, br',
                'Connection': 'keep-alive',
                'Upgrade-Insecure-Requests': '1',
                'Referer': 'https://www.vcs.go.kr'
            }
        }
    };
    
    /**
     * Main scraping orchestrator with correct workflow
     */
    async function scrapeVCSWithCorrectWorkflow() {
        console.log('🌐 Starting VCS scraping with CORRECTED investor search workflow...');
        
        // Launch browser with Korean locale
        const { chromium } = require('playwright');
        const browser = await chromium.launch({
            headless: VCS_CONFIG.browser.headless,
            args: ['--no-sandbox', '--disable-dev-shm-usage']
        });
        
        const context = await browser.newContext({
            locale: VCS_CONFIG.browser.locale,
            timezoneId: VCS_CONFIG.browser.timezone,
            userAgent: VCS_CONFIG.api.headers['User-Agent']
        });
        
        const page = await context.newPage();
        
        try {
            // Navigate to CORRECT investor search page
            console.log('📄 Navigating to VCS INVESTOR SEARCH page...');
            const targetUrl = VCS_CONFIG.baseUrl + VCS_CONFIG.endpoints.investorSearch;
            console.log(`🔗 Target URL: ${targetUrl}`);
            
            await page.goto(targetUrl, { 
                waitUntil: 'networkidle',
                timeout: VCS_CONFIG.browser.navigationTimeout 
            });
            
            // Wait for page to load completely
            await page.waitForTimeout(3000);
            
            // CRITICAL: Perform search to trigger data display
            console.log('🔍 Performing search to trigger data display...');
            await performVCSSearch(page);
            
            // Extract investors and funds from search results
            const investors = await extractInvestorDataFromSearchResults(page);
            const funds = await extractFundsDataFromSearchResults(page);
            
            return { investors, funds };
            
        } finally {
            await context.close();
            await browser.close();
        }
    }
    
    /**
     * Perform VCS search with proper filter settings
     */
    async function performVCSSearch(page) {
        try {
            console.log('🎛️ Setting up search filters...');
            
            // Wait for search form to be available
            await page.waitForSelector('form, .search-area, .search-box', { timeout: 10000 });
            
            // Set all filters to "전체" (All) for maximum results
            // This ensures we get the broadest possible dataset
            
            // Look for dropdown selectors and set them to "전체"
            const dropdowns = await page.$$('select');
            console.log(`📋 Found ${dropdowns.length} dropdown filters`);
            
            for (const dropdown of dropdowns) {
                try {
                    // Try to select "전체" option
                    await dropdown.selectOption('전체');
                    console.log('✅ Set filter to "전체"');
                } catch (error) {
                    // If "전체" doesn't work, try selecting the first option
                    try {
                        await dropdown.selectOption({ index: 0 });
                        console.log('✅ Set filter to first option');
                    } catch (err) {
                        console.log('⚠️ Could not set filter:', err.message);
                    }
                }
            }
            
            // Click search button to trigger results
            console.log('🔍 Clicking search button...');
            
            // Try different search button selectors
            const searchButtonSelectors = [
                'button:has-text("검색")',
                'input[type="submit"]',
                'button[type="submit"]',
                '.search-btn',
                '.btn-search',
                'button:has-text("전문검색")'
            ];
            
            let searchClicked = false;
            for (const selector of searchButtonSelectors) {
                try {
                    const button = await page.$(selector);
                    if (button) {
                        await button.click();
                        console.log(`✅ Search button clicked: ${selector}`);
                        searchClicked = true;
                        break;
                    }
                } catch (error) {
                    console.log(`⚠️ Search button selector failed: ${selector}`);
                }
            }
            
            if (!searchClicked) {
                // Try pressing Enter on the form
                console.log('🔍 Trying to submit form with Enter key...');
                await page.keyboard.press('Enter');
            }
            
            // Wait for search results to load
            console.log('⏳ Waiting for search results...');
            await page.waitForTimeout(5000);
            
            // Take a screenshot for debugging
            await page.screenshot({ path: 'vcs_search_results.png' });
            console.log('📸 Search results screenshot saved');
            
        } catch (error) {
            console.error('❌ Error performing VCS search:', error.message);
            
            // Take error screenshot
            try {
                await page.screenshot({ path: 'vcs_search_error.png' });
                console.log('📸 Error screenshot saved');
            } catch (screenshotError) {
                console.log('📸 Could not save error screenshot');
            }
        }
    }
    
    /**
     * Extract investor data from search results
     */
    async function extractInvestorDataFromSearchResults(page) {
        if (dataSource !== 'both' && dataSource !== 'investors') {
            console.log('⏭️ Skipping investors (not in dataSource)');
            return [];
        }
        
        console.log('👥 === EXTRACTING INVESTORS FROM SEARCH RESULTS ===');
        
        const allInvestors = [];
        let currentPage = 1;
        let hasMoreData = true;
        
        while (hasMoreData && currentPage <= maxPages) {
            console.log(`📄 Processing search results page ${currentPage}...`);
            
            try {
                // Wait for results table
                await page.waitForSelector('table, .result-list, .data-table', { timeout: 15000 });
                await page.waitForTimeout(2000);
                
                // Extract investor data from search results table
                const pageInvestors = await page.evaluate((config) => {
                    const investors = [];
                    
                    // Find the main results table
                    const tables = document.querySelectorAll('table');
                    let resultsTable = null;
                    
                    // Look for table with investor data columns
                    for (const table of tables) {
                        const headerText = table.textContent ? table.textContent.toLowerCase() : '';
                        if (headerText.includes('투자사') || headerText.includes('벤처') || 
                            headerText.includes('펀드') || headerText.includes('운용사') ||
                            headerText.includes('소재지') || headerText.includes('규모')) {
                            resultsTable = table;
                            break;
                        }
                    }
                    
                    if (resultsTable) {
                        const rows = resultsTable.querySelectorAll('tbody tr');
                        console.log(`Found ${rows.length} investor result rows`);
                        
                        rows.forEach((row, index) => {
                            try {
                                const cells = row.querySelectorAll('td');
                                if (cells.length >= 3) {
                                    // Extract data based on typical VCS investor table structure
                                    const companyName = cells[0]?.textContent?.trim() || cells[1]?.textContent?.trim() || '';
                                    const location = cells[2]?.textContent?.trim() || '';
                                    const scale = cells[3]?.textContent?.trim() || '';
                                    const contact = cells[4]?.textContent?.trim() || '';
                                    const details = cells[5]?.textContent?.trim() || '';
                                    
                                    if (companyName && companyName.length > 2) {
                                        investors.push({
                                            investor_id: `vcs_investor_${Date.now()}_${index}`,
                                            company_name: companyName,
                                            location: location,
                                            operation_scale: scale,
                                            contact_info: contact,
                                            additional_details: details,
                                            extraction_date: new Date().toISOString(),
                                            source: 'VCS_INVESTOR_SEARCH_CORRECTED',
                                            page_number: config.currentPageNumber || 1,
                                            search_method: 'filtered_search_results'
                                        });
                                    }
                                }
                            } catch (error) {
                                console.log(`Error extracting investor row ${index}:`, error.message);
                            }
                        });
                    } else {
                        // Try alternative extraction for different layouts
                        const resultItems = document.querySelectorAll('.result-item, .investor-item, .company-item');
                        console.log(`Found ${resultItems.length} alternative result items`);
                        
                        resultItems.forEach((item, index) => {
                            try {
                                const nameElement = item.querySelector('.name, .company-name, h3, strong');
                                const companyName = nameElement?.textContent?.trim() || '';
                                
                                if (companyName && companyName.length > 2) {
                                    investors.push({
                                        investor_id: `vcs_investor_alt_${Date.now()}_${index}`,
                                        company_name: companyName,
                                        extraction_date: new Date().toISOString(),
                                        source: 'VCS_INVESTOR_SEARCH_ALT',
                                        page_number: config.currentPageNumber || 1
                                    });
                                }
                            } catch (error) {
                                console.log(`Error extracting item ${index}:`, error.message);
                            }
                        });
                    }
                    
                    return investors;
                }, { currentPageNumber: currentPage });
                
                if (pageInvestors.length > 0) {
                    allInvestors.push(...pageInvestors);
                    console.log(`✅ Page ${currentPage}: Found ${pageInvestors.length} investors`);
                    console.log(`📊 Total so far: ${allInvestors.length} investors`);
                } else {
                    console.log(`⚠️ Page ${currentPage}: No investors found`);
                    
                    // Analyze page content for debugging
                    const pageAnalysis = await page.evaluate(() => {
                        return {
                            title: document.title,
                            url: window.location.href,
                            tableCount: document.querySelectorAll('table').length,
                            hasSearchResults: document.textContent ? 
                                (document.textContent.includes('검색결과') || 
                                 document.textContent.includes('조회') ||
                                 document.textContent.includes('투자사')) : false,
                            bodyText: document.body ? document.body.textContent.substring(0, 500) : 'No body content'
                        };
                    });
                    
                    console.log('📄 Page analysis:', pageAnalysis);
                    
                    // If no results found, stop searching
                    hasMoreData = false;
                }
                
                // Handle pagination
                if (hasMoreData && currentPage < maxPages) {
                    const nextPageExists = await page.evaluate(() => {
                        const nextButton = document.querySelector('.pagination .next, .page-next, [aria-label="다음"]');
                        return nextButton && !nextButton.disabled && !nextButton.classList.contains('disabled');
                    });
                    
                    if (nextPageExists) {
                        console.log(`📄 Moving to page ${currentPage + 1}...`);
                        await page.click('.pagination .next, .page-next, [aria-label="다음"]');
                        await page.waitForTimeout(VCS_CONFIG.browser.requestDelay);
                        currentPage++;
                    } else {
                        console.log('📄 No more pages available');
                        hasMoreData = false;
                    }
                } else {
                    hasMoreData = false;
                }
                
            } catch (error) {
                console.error(`❌ Error on page ${currentPage}:`, error.message);
                
                // Take debug screenshot
                try {
                    await page.screenshot({ path: `debug_page_${currentPage}.png` });
                    console.log(`📸 Debug screenshot saved: debug_page_${currentPage}.png`);
                } catch (screenshotError) {
                    console.log('📸 Could not save debug screenshot');
                }
                
                hasMoreData = false;
            }
        }
        
        console.log(`✅ Investors extraction complete: ${allInvestors.length} total investors`);
        return allInvestors;
    }
    
    /**
     * Extract funds data from search results
     */
    async function extractFundsDataFromSearchResults(page) {
        if (dataSource !== 'both' && dataSource !== 'funds') {
            console.log('⏭️ Skipping funds (not in dataSource)');
            return [];
        }
        
        console.log('💰 === EXTRACTING FUNDS FROM SEARCH RESULTS ===');
        
        try {
            // Switch to fund view if available
            const fundViewButton = await page.$('button:has-text("펀드/조합 보기"), .fund-view');
            if (fundViewButton) {
                console.log('🔄 Switching to fund/partnership view...');
                await fundViewButton.click();
                await page.waitForTimeout(3000);
            }
            
            const funds = await page.evaluate(() => {
                const fundData = [];
                const tables = document.querySelectorAll('table');
                
                for (const table of tables) {
                    const headerText = table.textContent ? table.textContent.toLowerCase() : '';
                    if (headerText.includes('펀드') || headerText.includes('조합') || 
                        headerText.includes('결성') || headerText.includes('운용')) {
                        
                        const rows = table.querySelectorAll('tbody tr');
                        
                        rows.forEach((row, index) => {
                            try {
                                const cells = row.querySelectorAll('td');
                                if (cells.length >= 4) {
                                    const fundName = cells[0]?.textContent?.trim() || '';
                                    const establishDate = cells[1]?.textContent?.trim() || '';
                                    const totalAmount = cells[2]?.textContent?.trim() || '';
                                    const managementCompany = cells[3]?.textContent?.trim() || '';
                                    const duration = cells[4]?.textContent?.trim() || '';
                                    
                                    if (fundName && fundName.length > 2) {
                                        fundData.push({
                                            fund_id: `vcs_fund_corrected_${Date.now()}_${index}`,
                                            fund_name: fundName,
                                            management_company: managementCompany,
                                            establish_date: establishDate,
                                            total_amount: totalAmount,
                                            duration: duration,
                                            extraction_date: new Date().toISOString(),
                                            source: 'VCS_INVESTOR_SEARCH_CORRECTED'
                                        });
                                    }
                                }
                            } catch (error) {
                                console.log(`Error extracting fund ${index}:`, error.message);
                            }
                        });
                    }
                }
                
                return fundData;
            });
            
            console.log(`✅ Funds extraction complete: ${funds.length} total funds`);
            return funds;
            
        } catch (error) {
            console.error('❌ Error extracting funds:', error.message);
            return [];
        }
    }
    
    // Execute main scraping with corrected workflow
    console.log('🚀 Starting VCS data extraction with CORRECTED workflow...');
    const startTime = Date.now();
    
    const { investors, funds } = await scrapeVCSWithCorrectWorkflow();
    
    const duration = Math.round((Date.now() - startTime) / 1000);
    const totalRecords = investors.length + funds.length;
    
    // Prepare comprehensive result data
    const resultData = {
        timestamp: new Date().toISOString(),
        source: 'VCS_WEEKLY_SCRAPER_APIFY_CORRECTED',
        version: '2.0.2',
        updateMode,
        dataSource,
        investors: {
            count: investors.length,
            data: updateMode === 'full' ? investors : investors.slice(0, 100)
        },
        funds: {
            count: funds.length,
            data: updateMode === 'full' ? funds : funds.slice(0, 100)
        },
        metadata: {
            totalRecords,
            duration_seconds: duration,
            maxPages,
            platform: 'Apify Cloud',
            executionId: process.env.APIFY_ACT_RUN_ID,
            optimization_version: '2.0.2',
            scraping_method: 'corrected_investor_search_workflow',
            target_url: VCS_CONFIG.baseUrl + VCS_CONFIG.endpoints.investorSearch,
            breakthrough: 'Fixed target URL and implemented proper search workflow'
        }
    };
    
    // Save to Apify dataset
    console.log('💾 Saving to Apify dataset...');
    await Actor.pushData(resultData);
    
    // Export to Supabase if configured
    if (exportToSupabase && supabaseUrl && supabaseKey) {
        console.log('📤 Exporting to Supabase database...');
        
        try {
            const supabase = createClient(supabaseUrl, supabaseKey);
            
            if (investors.length > 0) {
                console.log(`👥 Exporting ${investors.length} investors to Supabase...`);
                
                const { data, error } = await supabase
                    .from('investor_table')
                    .upsert(investors, { 
                        onConflict: 'investor_id',
                        returning: 'minimal'
                    });
                
                if (error) {
                    console.error('❌ Investor export error:', error.message);
                } else {
                    console.log('✅ Investors exported successfully');
                }
            }
            
            if (funds.length > 0) {
                console.log(`💰 Exporting ${funds.length} funds to Supabase...`);
                
                const { data, error } = await supabase
                    .from('fund_table')
                    .upsert(funds, { 
                        onConflict: 'fund_id',
                        returning: 'minimal'
                    });
                
                if (error) {
                    console.error('❌ Fund export error:', error.message);
                } else {
                    console.log('✅ Funds exported successfully');
                }
            }
            
            console.log('✅ Supabase export completed successfully');
            
        } catch (exportError) {
            console.error('❌ Supabase export failed:', exportError.message);
        }
    }
    
    // Final comprehensive summary
    console.log('🎉 === VCS WEEKLY SCRAPING COMPLETED (CORRECTED) ===');
    console.log(`📊 Total records extracted: ${totalRecords}`);
    console.log(`👥 Investors: ${investors.length}`);
    console.log(`💰 Funds: ${funds.length}`);
    console.log(`⏱️ Total duration: ${duration} seconds`);
    console.log(`📅 Update mode: ${updateMode}`);
    console.log(`🏷️ Data source: ${dataSource}`);
    console.log(`📍 Platform: Apify Cloud`);
    console.log(`🔧 Optimization: v2.0.2 with CORRECTED investor search workflow`);
    console.log(`🎯 Target URL: ${VCS_CONFIG.baseUrl + VCS_CONFIG.endpoints.investorSearch}`);
    
    // Set structured output for Apify Console monitoring
    await Actor.setValue('OUTPUT', {
        success: totalRecords > 0,
        summary: {
            totalRecords,
            investors: investors.length,
            funds: funds.length,
            duration_seconds: duration,
            updateMode,
            dataSource,
            optimization_version: '2.0.2',
            breakthrough: 'CORRECTED: Fixed target URL to proper investor search page'
        },
        data_sample: {
            first_investor: investors[0] || null,
            first_fund: funds[0] || null
        },
        next_steps: totalRecords > 0 ? 
            'VCS scraper CORRECTED successfully! Real data extraction achieved. Ready for Phase 2.' :
            'Need to verify search button interaction and result table parsing.',
        target_url_corrected: VCS_CONFIG.baseUrl + VCS_CONFIG.endpoints.investorSearch
    });
    
    console.log('✅ VCS Weekly Scraper Actor completed with CORRECTED workflow');
}); 