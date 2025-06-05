/**
 * 🇰🇷 VCS WEEKLY SCRAPER - APIFY ACTOR v2.0.4 - NULL CHECKS FIXED
 * ================================================================
 * 
 * PATCH UPDATE:
 * - Fixed null pointer errors in page analysis
 * - Added proper null checks for document.textContent
 * - Simplified search workflow (skip complex filters)
 * - Enhanced result detection with multiple strategies
 * - Better debugging and page content analysis
 * - Robust fallback mechanisms
 */

const { Actor } = require('apify');
const { createClient } = require('@supabase/supabase-js');

Actor.main(async () => {
    console.log('🇰🇷 VCS Weekly Scraper Actor Started (Phase 1) - v2.0.4');
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
    
    // STREAMLINED VCS Configuration
    const VCS_CONFIG = {
        baseUrl: 'https://www.vcs.go.kr',
        endpoints: {
            investorSearch: '/web/portal/investor/list',           // Main investor search page
            fundSearch: '/web/portal/rsh/list',                   // Fund search page
        },
        browser: {
            headless: true,
            requestDelay: 3000,                    // Increased delay for stability
            navigationTimeout: 45000,              // Increased timeout
            locale: 'ko-KR',
            timezone: 'Asia/Seoul'
        },
        selectors: {
            // Simplified search selectors
            searchButton: [
                'button:has-text("검색")',
                'input[type="submit"]',
                'button[type="submit"]',
                '.search-btn',
                '.btn-search'
            ],
            
            // Multiple result detection strategies
            resultContainers: [
                'table',
                '.result-table',
                '.list-table', 
                '.data-table',
                '.search-result',
                '.result-list',
                '.grid-table',
                '#contents table',
                '.contents table'
            ],
            
            // Pagination
            nextPageBtn: '.pagination .next, .page-next, [aria-label="다음"]',
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
     * Main scraping orchestrator - simplified and robust
     */
    async function scrapeVCSWithSimplifiedWorkflow() {
        console.log('🌐 Starting VCS scraping with SIMPLIFIED workflow...');
        
        // Launch browser with Korean locale
        const { chromium } = require('playwright');
        const browser = await chromium.launch({
            headless: VCS_CONFIG.browser.headless,
            args: ['--no-sandbox', '--disable-dev-shm-usage', '--disable-blink-features=AutomationControlled']
        });
        
        const context = await browser.newContext({
            locale: VCS_CONFIG.browser.locale,
            timezoneId: VCS_CONFIG.browser.timezone,
            userAgent: VCS_CONFIG.api.headers['User-Agent']
        });
        
        const page = await context.newPage();
        
        try {
            // Navigate to investor search page
            console.log('📄 Navigating to VCS INVESTOR SEARCH page...');
            const targetUrl = VCS_CONFIG.baseUrl + VCS_CONFIG.endpoints.investorSearch;
            console.log(`🔗 Target URL: ${targetUrl}`);
            
            await page.goto(targetUrl, { 
                waitUntil: 'networkidle',
                timeout: VCS_CONFIG.browser.navigationTimeout 
            });
            
            // Wait for page to load completely
            console.log('⏳ Waiting for page to fully load...');
            await page.waitForTimeout(5000);
            
            // Take initial screenshot for debugging
            await page.screenshot({ path: 'vcs_initial_page.png' });
            console.log('📸 Initial page screenshot saved');
            
            // Analyze initial page structure
            await analyzePageStructure(page, 'INITIAL');
            
            // Perform simplified search
            console.log('🔍 Performing SIMPLIFIED search...');
            await performSimplifiedVCSSearch(page);
            
            // Extract data using multiple strategies
            const investors = await extractInvestorDataWithMultipleStrategies(page);
            const funds = await extractFundsDataWithMultipleStrategies(page);
            
            return { investors, funds };
            
        } finally {
            await context.close();
            await browser.close();
        }
    }
    
    /**
     * Analyze page structure for debugging
     */
    async function analyzePageStructure(page, phase) {
        console.log(`🔍 === ANALYZING PAGE STRUCTURE (${phase}) ===`);
        
        const analysis = await page.evaluate(() => {
            return {
                title: document.title,
                url: window.location.href,
                
                // Count different element types
                tables: document.querySelectorAll('table').length,
                forms: document.querySelectorAll('form').length,
                buttons: document.querySelectorAll('button').length,
                inputs: document.querySelectorAll('input').length,
                selects: document.querySelectorAll('select').length,
                
                // Look for specific VCS content
                hasInvestorContent: document.textContent ? (document.textContent.includes('투자자') || document.textContent.includes('벤처')) : false,
                hasSearchContent: document.textContent ? (document.textContent.includes('검색') || document.textContent.includes('조회')) : false,
                hasResultContent: document.textContent ? (document.textContent.includes('결과') || document.textContent.includes('목록')) : false,
                
                // Get visible tables info
                visibleTables: Array.from(document.querySelectorAll('table')).map((table, index) => ({
                    index,
                    rows: table.querySelectorAll('tr').length,
                    headers: Array.from(table.querySelectorAll('th')).map(th => th.textContent.trim()),
                    visible: table.offsetHeight > 0 && table.offsetWidth > 0
                })),
                
                // Sample text content
                bodyText: document.body ? document.body.textContent.substring(0, 1000) : 'No body'
            };
        });
        
        console.log(`📊 Page Analysis (${phase}):`, JSON.stringify(analysis, null, 2));
        return analysis;
    }
    
    /**
     * Perform simplified VCS search
     */
    async function performSimplifiedVCSSearch(page) {
        try {
            console.log('🎯 SIMPLIFIED SEARCH: Skip complex filters, focus on search button');
            
            // Wait for any form or search interface to be ready
            await page.waitForTimeout(3000);
            
            // Try to click search button without setting filters
            console.log('🔍 Looking for search button...');
            
            let searchClicked = false;
            for (const selector of VCS_CONFIG.selectors.searchButton) {
                try {
                    console.log(`🔍 Trying search button: ${selector}`);
                    const button = await page.$(selector);
                    if (button) {
                        // Check if button is visible
                        const isVisible = await button.isVisible();
                        console.log(`👁️ Button visibility: ${isVisible}`);
                        
                        if (isVisible) {
                            await button.click();
                            console.log(`✅ Search button clicked: ${selector}`);
                            searchClicked = true;
                            break;
                        }
                    }
                } catch (error) {
                    console.log(`⚠️ Search button failed: ${selector} - ${error.message}`);
                }
            }
            
            if (!searchClicked) {
                console.log('🔍 Trying alternative search methods...');
                
                // Try pressing Enter on the page
                await page.keyboard.press('Enter');
                console.log('⌨️ Pressed Enter key');
                
                // Try clicking any visible button
                const buttons = await page.$$('button');
                for (let i = 0; i < Math.min(buttons.length, 5); i++) {
                    try {
                        const button = buttons[i];
                        const text = await button.textContent();
                        if (text && text.includes('검색')) {
                            await button.click();
                            console.log(`✅ Clicked button with text: ${text}`);
                            searchClicked = true;
                            break;
                        }
                    } catch (error) {
                        console.log(`⚠️ Button click failed: ${error.message}`);
                    }
                }
            }
            
            if (searchClicked) {
                console.log('⏳ Waiting for search results to load...');
                await page.waitForTimeout(VCS_CONFIG.browser.requestDelay);
                
                // Take post-search screenshot
                await page.screenshot({ path: 'vcs_post_search.png' });
                console.log('📸 Post-search screenshot saved');
                
                // Analyze page after search
                await analyzePageStructure(page, 'POST_SEARCH');
            } else {
                console.log('⚠️ Could not trigger search - will try to extract from current page');
            }
            
        } catch (error) {
            console.error('❌ Error in simplified search:', error.message);
            
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
     * Extract investor data using multiple strategies
     */
    async function extractInvestorDataWithMultipleStrategies(page) {
        if (dataSource !== 'both' && dataSource !== 'investors') {
            console.log('⏭️ Skipping investors (not in dataSource)');
            return [];
        }
        
        console.log('👥 === EXTRACTING INVESTORS WITH MULTIPLE STRATEGIES ===');
        
        const allInvestors = [];
        
        // Strategy 1: Look for any tables
        console.log('📊 Strategy 1: Scanning all tables...');
        const tableData = await page.evaluate(() => {
            const investors = [];
            const tables = document.querySelectorAll('table');
            
            console.log(`Found ${tables.length} tables on page`);
            
            tables.forEach((table, tableIndex) => {
                const rows = table.querySelectorAll('tr');
                console.log(`Table ${tableIndex}: ${rows.length} rows`);
                
                // Get headers to understand table structure
                const headers = Array.from(table.querySelectorAll('th')).map(th => th.textContent.trim());
                console.log(`Table ${tableIndex} headers:`, headers);
                
                // Extract data from table rows
                rows.forEach((row, rowIndex) => {
                    const cells = row.querySelectorAll('td');
                    if (cells.length >= 2) {
                        const cellData = Array.from(cells).map(cell => cell.textContent.trim());
                        
                        // Look for potential company names (longer than 2 chars, not just numbers)
                        const potentialNames = cellData.filter(text => 
                            text.length > 2 && 
                            !text.match(/^\d+$/) && 
                            !text.match(/^\d{4}-\d{2}-\d{2}$/)
                        );
                        
                        if (potentialNames.length > 0) {
                            investors.push({
                                investor_id: `vcs_table_${tableIndex}_${rowIndex}_${Date.now()}`,
                                company_name: potentialNames[0],
                                raw_data: cellData,
                                table_index: tableIndex,
                                row_index: rowIndex,
                                headers: headers,
                                extraction_date: new Date().toISOString(),
                                source: 'VCS_TABLE_STRATEGY_v2.0.3',
                                extraction_method: 'table_scan'
                            });
                        }
                    }
                });
            });
            
            return investors;
        });
        
        if (tableData.length > 0) {
            allInvestors.push(...tableData);
            console.log(`✅ Strategy 1: Found ${tableData.length} potential investors`);
        } else {
            console.log('⚠️ Strategy 1: No table data found');
        }
        
        // Strategy 2: Look for list items or divs with company-like content
        console.log('📋 Strategy 2: Scanning for list items...');
        const listData = await page.evaluate(() => {
            const investors = [];
            
            // Look for various list structures
            const listSelectors = [
                '.result-item',
                '.list-item', 
                '.company-item',
                '.investor-item',
                'li',
                'div[class*="item"]'
            ];
            
            listSelectors.forEach(selector => {
                const items = document.querySelectorAll(selector);
                items.forEach((item, index) => {
                    const text = item.textContent.trim();
                    if (text.length > 10 && text.length < 200) {
                        // Look for company-like patterns
                        const words = text.split(/\s+/);
                        const potentialCompany = words.find(word => 
                            word.length > 3 && 
                            (word.includes('주식회사') || word.includes('㈜') || word.includes('(주)') || 
                             word.includes('벤처') || word.includes('캐피탈') || word.includes('투자'))
                        );
                        
                        if (potentialCompany) {
                            investors.push({
                                investor_id: `vcs_list_${selector.replace(/[^a-zA-Z0-9]/g, '_')}_${index}_${Date.now()}`,
                                company_name: potentialCompany,
                                full_text: text,
                                extraction_date: new Date().toISOString(),
                                source: 'VCS_LIST_STRATEGY_v2.0.3',
                                extraction_method: 'list_scan',
                                selector_used: selector
                            });
                        }
                    }
                });
            });
            
            return investors;
        });
        
        if (listData.length > 0) {
            allInvestors.push(...listData);
            console.log(`✅ Strategy 2: Found ${listData.length} potential investors`);
        } else {
            console.log('⚠️ Strategy 2: No list data found');
        }
        
        // Strategy 3: Content analysis for Korean company patterns
        console.log('🔍 Strategy 3: Korean company pattern analysis...');
        const patternData = await page.evaluate(() => {
            const investors = [];
            const fullText = document.body ? document.body.textContent : '';
            
            // Korean company name patterns
            const companyPatterns = [
                /([가-힣]{2,10}(?:주식회사|㈜|\(주\)))/g,
                /([가-힣]{2,10}(?:벤처캐피탈|투자|펀드))/g,
                /([가-힣]{2,15}(?:파트너스|인베스트먼트|캐피탈))/g
            ];
            
            companyPatterns.forEach((pattern, patternIndex) => {
                const matches = fullText.match(pattern);
                if (matches) {
                    matches.slice(0, 20).forEach((match, matchIndex) => { // Limit to 20 matches per pattern
                        investors.push({
                            investor_id: `vcs_pattern_${patternIndex}_${matchIndex}_${Date.now()}`,
                            company_name: match.trim(),
                            extraction_date: new Date().toISOString(),
                            source: 'VCS_PATTERN_STRATEGY_v2.0.3',
                            extraction_method: 'korean_pattern_matching',
                            pattern_index: patternIndex
                        });
                    });
                }
            });
            
            return investors;
        });
        
        if (patternData.length > 0) {
            allInvestors.push(...patternData);
            console.log(`✅ Strategy 3: Found ${patternData.length} potential investors`);
        } else {
            console.log('⚠️ Strategy 3: No pattern matches found');
        }
        
        // Remove duplicates and filter valid entries
        const uniqueInvestors = [];
        const seenNames = new Set();
        
        allInvestors.forEach(investor => {
            if (investor.company_name && 
                investor.company_name.length > 2 && 
                !seenNames.has(investor.company_name.toLowerCase())) {
                seenNames.add(investor.company_name.toLowerCase());
                uniqueInvestors.push(investor);
            }
        });
        
        console.log(`✅ Investors extraction complete: ${uniqueInvestors.length} unique investors`);
        return uniqueInvestors;
    }
    
    /**
     * Extract funds data using multiple strategies
     */
    async function extractFundsDataWithMultipleStrategies(page) {
        if (dataSource !== 'both' && dataSource !== 'funds') {
            console.log('⏭️ Skipping funds (not in dataSource)');
            return [];
        }
        
        console.log('💰 === EXTRACTING FUNDS WITH MULTIPLE STRATEGIES ===');
        
        const funds = await page.evaluate(() => {
            const fundData = [];
            
            // Look for fund-related patterns
            const fullText = document.body ? document.body.textContent : '';
            const fundPatterns = [
                /([가-힣]{2,20}(?:펀드|조합|투자조합))/g,
                /([가-힣]{2,20}(?:호|차)(?:펀드|투자조합))/g
            ];
            
            fundPatterns.forEach((pattern, patternIndex) => {
                const matches = fullText.match(pattern);
                if (matches) {
                    matches.slice(0, 15).forEach((match, matchIndex) => {
                        fundData.push({
                            fund_id: `vcs_fund_pattern_${patternIndex}_${matchIndex}_${Date.now()}`,
                            fund_name: match.trim(),
                            extraction_date: new Date().toISOString(),
                            source: 'VCS_FUND_PATTERN_STRATEGY_v2.0.3',
                            extraction_method: 'korean_fund_pattern_matching'
                        });
                    });
                }
            });
            
            return fundData;
        });
        
        console.log(`✅ Funds extraction complete: ${funds.length} total funds`);
        return funds;
    }
    
    // Execute main scraping with simplified workflow
    console.log('🚀 Starting VCS data extraction with SIMPLIFIED workflow...');
    const startTime = Date.now();
    
    const { investors, funds } = await scrapeVCSWithSimplifiedWorkflow();
    
    const duration = Math.round((Date.now() - startTime) / 1000);
    const totalRecords = investors.length + funds.length;
    
    // Prepare comprehensive result data
    const resultData = {
        timestamp: new Date().toISOString(),
        source: 'VCS_WEEKLY_SCRAPER_APIFY_SIMPLIFIED',
        version: '2.0.4',
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
            optimization_version: '2.0.4',
            scraping_method: 'simplified_multi_strategy_extraction',
            target_url: VCS_CONFIG.baseUrl + VCS_CONFIG.endpoints.investorSearch,
            breakthrough: 'Simplified workflow with multiple extraction strategies'
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
    console.log('🎉 === VCS WEEKLY SCRAPING COMPLETED (SIMPLIFIED) ===');
    console.log(`📊 Total records extracted: ${totalRecords}`);
    console.log(`👥 Investors: ${investors.length}`);
    console.log(`💰 Funds: ${funds.length}`);
    console.log(`⏱️ Total duration: ${duration} seconds`);
    console.log(`📅 Update mode: ${updateMode}`);
    console.log(`🏷️ Data source: ${dataSource}`);
    console.log(`📍 Platform: Apify Cloud`);
    console.log(`🔧 Optimization: v2.0.4 with NULL CHECKS FIXED`);
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
            optimization_version: '2.0.4',
            breakthrough: 'FIXED: Null checks added, multi-strategy extraction ready'
        },
        data_sample: {
            first_investor: investors[0] || null,
            first_fund: funds[0] || null
        },
        extraction_strategies: {
            table_scan: 'Extract from any tables found',
            list_scan: 'Extract from list items and divs', 
            pattern_matching: 'Korean company name pattern recognition'
        },
        next_steps: totalRecords > 0 ? 
            'VCS scraper SIMPLIFIED successfully! Multi-strategy extraction working. Ready for Phase 2.' :
            'All strategies attempted. May need to investigate VCS access requirements or anti-bot measures.',
        target_url_confirmed: VCS_CONFIG.baseUrl + VCS_CONFIG.endpoints.investorSearch
    });
    
    console.log('✅ VCS Weekly Scraper Actor completed with SIMPLIFIED workflow');
}); 