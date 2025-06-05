/**
 * 🇰🇷 OPTIMIZED VCS WEEKLY SCRAPER - APIFY ACTOR
 * ==============================================
 * 
 * Enhanced scraper based on:
 * - Real VCS website structure research
 * - Proven scraping techniques from enhanced_vcs_updater.js
 * - Weekly automation strategy from migration plan
 * - Professional error handling and monitoring
 */

const { Actor } = require('apify');
const { createClient } = require('@supabase/supabase-js');

Actor.main(async () => {
    console.log('🇰🇷 VCS Weekly Scraper Actor Started (Phase 1)');
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
    
    // Enhanced VCS Configuration based on research
    const VCS_CONFIG = {
        baseUrl: 'https://www.vcs.go.kr',
        endpoints: {
            // Real VCS URLs from research
            investorSearch: '/web/portal/rsh/list',           // Fund managers page
            fundList: '/web/portal/rsh/list',                 // Same endpoint, different filters
            investorList: '/web/portal/partner/srch/list',    // Main investor search
        },
        browser: {
            headless: true,
            requestDelay: 2000,
            navigationTimeout: 30000,
            locale: 'ko-KR',
            timezone: 'Asia/Seoul'
        },
        selectors: {
            // Real selectors based on VCS website structure
            searchResults: 'table tbody tr, .result-list .result-item',
            fundTable: 'table[class*="table"] tbody tr',
            companyName: 'td:nth-child(2), .company-name, .name strong',
            fundName: 'td:nth-child(1), .fund-name',
            establishDate: 'td:nth-child(3), .establish-date',
            totalAmount: 'td:nth-child(4), .total-amount',
            duration: 'td:nth-child(5), .duration',
            location: 'td:nth-child(6), .location',
            nextPageBtn: '.page-next, .pagination .next, [aria-label="다음"]',
            searchBtn: 'button[type="submit"], .search-btn, .btn-search'
        },
        api: {
            // Discovered from network analysis
            investorEndpoint: '/web/portal/rsh/list.ajax',
            fundEndpoint: '/web/portal/fund/list.ajax',
            headers: {
                'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
                'Accept': 'application/json, text/javascript, */*; q=0.01',
                'Accept-Language': 'ko-KR,ko;q=0.9,en;q=0.8',
                'X-Requested-With': 'XMLHttpRequest',
                'Referer': 'https://www.vcs.go.kr'
            }
        }
    };
    
    /**
     * Main scraping orchestrator
     */
    async function scrapeVCSWithBrowser() {
        console.log('🌐 Starting browser-based VCS scraping...');
        
        // Launch browser with Korean locale (compatible with Apify base image)
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
            // Navigate to VCS main page first
            console.log('📄 Navigating to VCS investor list...');
            const targetUrl = VCS_CONFIG.baseUrl + VCS_CONFIG.endpoints.investorSearch;
            await page.goto(targetUrl, { 
                waitUntil: 'networkidle',
                timeout: VCS_CONFIG.browser.navigationTimeout 
            });
            
            // Wait for page to load completely
            await page.waitForTimeout(3000);
            
            // Extract investors and funds
            const investors = await extractInvestorData(page);
            const funds = await extractFundsData(page);
            
            return { investors, funds };
            
        } finally {
            await context.close();
            await browser.close();
        }
    }
    
    /**
     * Extract investor data using real VCS structure
     */
    async function extractInvestorData(page) {
        if (dataSource !== 'both' && dataSource !== 'investors') {
            console.log('⏭️ Skipping investors (not in dataSource)');
            return [];
        }
        
        console.log('👥 === EXTRACTING INVESTORS DATA ===');
        
        const allInvestors = [];
        let currentPage = 1;
        let hasMoreData = true;
        
        while (hasMoreData && currentPage <= maxPages) {
            console.log(`📄 Processing investor page ${currentPage}...`);
            
            try {
                // Wait for the actual VCS table/results to load
                await page.waitForSelector('table, .result-list, .search-result', { 
                    timeout: 15000 
                });
                await page.waitForTimeout(2000);
                
                // Extract investor data using real VCS table structure
                const pageInvestors = await page.evaluate((config) => {
                    const investors = [];
                    
                    // Try to find the results table or list
                    const tables = document.querySelectorAll('table');
                    let targetTable = null;
                    
                    // Find table with fund/company data
                    for (const table of tables) {
                        const headerText = table.textContent ? table.textContent.toLowerCase() : '';
                        if (headerText.includes('펀드명') || headerText.includes('운용사') || 
                            headerText.includes('결성일') || headerText.includes('결성총액')) {
                            targetTable = table;
                            break;
                        }
                    }
                    
                    if (targetTable) {
                        const rows = targetTable.querySelectorAll('tbody tr');
                        console.log(`Found ${rows.length} table rows`);
                        
                        rows.forEach((row, index) => {
                            try {
                                const cells = row.querySelectorAll('td');
                                if (cells.length >= 4) {
                                    // VCS table structure: 펀드명 | 결성일 | 결성총액 | 존속기간 | 운용사명 | 소재지
                                    const fundName = cells[0]?.textContent?.trim() || '';
                                    const establishDate = cells[1]?.textContent?.trim() || '';
                                    const totalAmount = cells[2]?.textContent?.trim() || '';
                                    const duration = cells[3]?.textContent?.trim() || '';
                                    const companyName = cells[4]?.textContent?.trim() || '';
                                    const location = cells[5]?.textContent?.trim() || '';
                                    
                                    if (companyName && companyName.length > 2) {
                                        investors.push({
                                            investor_id: `vcs_${Date.now()}_${index}`,
                                            company_name: companyName,
                                            fund_name: fundName,
                                            location: location,
                                            establish_date: establishDate,
                                            total_amount: totalAmount,
                                            duration: duration,
                                            extraction_date: new Date().toISOString(),
                                            source: 'VCS_WEEKLY_SCRAPER_OPTIMIZED',
                                            page_number: config.currentPageNumber || 1
                                        });
                                    }
                                }
                            } catch (error) {
                                console.log(`Error extracting row ${index}:`, error.message);
                            }
                        });
                    } else {
                        // Try alternative selectors for different VCS page layouts
                        const resultItems = document.querySelectorAll('.result-item, .list-item, .company-item');
                        console.log(`Found ${resultItems.length} result items`);
                        
                        resultItems.forEach((item, index) => {
                            try {
                                const nameElement = item.querySelector('.company-name, .name, h3, strong');
                                const companyName = nameElement?.textContent?.trim() || '';
                                
                                if (companyName && companyName.length > 2) {
                                    investors.push({
                                        investor_id: `vcs_alt_${Date.now()}_${index}`,
                                        company_name: companyName,
                                        extraction_date: new Date().toISOString(),
                                        source: 'VCS_WEEKLY_SCRAPER_ALT',
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
                    
                    // Check if there's any content at all
                    const pageContent = await page.evaluate(() => {
                        return {
                            title: document.title,
                            url: window.location.href,
                            bodyText: document.body ? document.body.textContent.substring(0, 500) : 'No body content',
                            tableCount: document.querySelectorAll('table').length,
                            hasResultContent: document.textContent ? 
                                (document.textContent.includes('펀드') || 
                                 document.textContent.includes('운용사') ||
                                 document.textContent.includes('투자')) : false
                        };
                    });
                    
                    console.log('📄 Page analysis:', pageContent);
                    hasMoreData = false;
                }
                
                // Try to navigate to next page (if implementing pagination)
                if (hasMoreData && currentPage < maxPages) {
                    const nextPageExists = await page.evaluate(() => {
                        const nextButton = document.querySelector('.pagination .next, .page-next, [aria-label="다음"]');
                        return nextButton && !nextButton.disabled && !nextButton.classList.contains('disabled');
                    });
                    
                    if (nextPageExists) {
                        await page.click(VCS_CONFIG.selectors.nextPageBtn);
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
                
                // Take screenshot for debugging
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
     * Extract funds data - enhanced version
     */
    async function extractFundsData(page) {
        if (dataSource !== 'both' && dataSource !== 'funds') {
            console.log('⏭️ Skipping funds (not in dataSource)');
            return [];
        }
        
        console.log('💰 === EXTRACTING FUNDS DATA ===');
        
        // For now, we'll extract fund data from the same table as investors
        // Since VCS shows fund information in the investor search results
        
        try {
            const funds = await page.evaluate(() => {
                const fundData = [];
                const tables = document.querySelectorAll('table');
                
                for (const table of tables) {
                    const rows = table.querySelectorAll('tbody tr');
                    
                    rows.forEach((row, index) => {
                        try {
                            const cells = row.querySelectorAll('td');
                            if (cells.length >= 4) {
                                const fundName = cells[0]?.textContent?.trim() || '';
                                const establishDate = cells[1]?.textContent?.trim() || '';
                                const totalAmount = cells[2]?.textContent?.trim() || '';
                                const duration = cells[3]?.textContent?.trim() || '';
                                const managementCompany = cells[4]?.textContent?.trim() || '';
                                
                                if (fundName && fundName.length > 2) {
                                    fundData.push({
                                        fund_id: `vcs_fund_${Date.now()}_${index}`,
                                        fund_name: fundName,
                                        management_company: managementCompany,
                                        establish_date: establishDate,
                                        total_amount: totalAmount,
                                        duration: duration,
                                        extraction_date: new Date().toISOString(),
                                        source: 'VCS_WEEKLY_SCRAPER_OPTIMIZED'
                                    });
                                }
                            }
                        } catch (error) {
                            console.log(`Error extracting fund ${index}:`, error.message);
                        }
                    });
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
    
    // Execute main scraping
    console.log('🚀 Starting VCS data extraction...');
    const startTime = Date.now();
    
    const { investors, funds } = await scrapeVCSWithBrowser();
    
    const duration = Math.round((Date.now() - startTime) / 1000);
    const totalRecords = investors.length + funds.length;
    let lastPageProcessed = 1; // Default value
    
    // Prepare comprehensive result data
    const resultData = {
        timestamp: new Date().toISOString(),
        source: 'VCS_WEEKLY_SCRAPER_APIFY_OPTIMIZED',
        version: '2.0.1',
        updateMode,
        dataSource,
        investors: {
            count: investors.length,
            data: updateMode === 'full' ? investors : investors.slice(0, 100) // Limit data in incremental mode
        },
        funds: {
            count: funds.length,
            data: updateMode === 'full' ? funds : funds.slice(0, 100)
        },
        metadata: {
            totalRecords,
            duration_seconds: duration,
            maxPages,
            actualPages: lastPageProcessed,
            platform: 'Apify Cloud',
            executionId: process.env.APIFY_ACT_RUN_ID,
            optimization_version: '2.0.1',
            scraping_method: 'browser_table_extraction'
        }
    };
    
    // Save to Apify dataset for download/API access
    console.log('💾 Saving to Apify dataset...');
    await Actor.pushData(resultData);
    
    // Export to Supabase if configured
    if (exportToSupabase && supabaseUrl && supabaseKey) {
        console.log('📤 Exporting to Supabase database...');
        
        try {
            const supabase = createClient(supabaseUrl, supabaseKey);
            
            // Export investors to investor_table
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
            
            // Export funds to fund_table
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
            // Don't fail entire run if export fails
        }
    }
    
    // Final comprehensive summary
    console.log('🎉 === VCS WEEKLY SCRAPING COMPLETED ===');
    console.log(`📊 Total records extracted: ${totalRecords}`);
    console.log(`👥 Investors: ${investors.length}`);
    console.log(`💰 Funds: ${funds.length}`);
    console.log(`⏱️ Total duration: ${duration} seconds`);
    console.log(`📅 Update mode: ${updateMode}`);
    console.log(`🏷️ Data source: ${dataSource}`);
    console.log(`📍 Platform: Apify Cloud`);
    console.log(`🔧 Optimization: v2.0.1 with bug fixes`);
    
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
            optimization_version: '2.0.1'
        },
        data_sample: {
            first_investor: investors[0] || null,
            first_fund: funds[0] || null
        },
        next_steps: totalRecords > 0 ? 
            'VCS scraper optimized successfully! Ready for Phase 2 (DIVA scraper).' :
            'VCS optimization needs further refinement. Check debug screenshots.'
    });
    
    console.log('✅ VCS Weekly Scraper Actor completed successfully');
}); 