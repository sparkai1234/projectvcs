const Apify = require('apify');
const { ApifyDatasetClient } = require('apify-client');

/**
 * DIVA Fund Disclosure Scraper
 * Scrapes comprehensive fund disclosure data from http://diva.kvca.or.kr/div/cmn/DivDisclsMainInq
 * 
 * Features:
 * - Handles Korean text encoding
 * - Navigates dynamic forms and pagination
 * - Extracts fund performance and regulatory data
 * - Outputs structured JSON for Airtable integration
 */

Apify.main(async () => {
    console.log('🚀 Starting DIVA Fund Disclosure Scraper...');
    
    const input = await Apify.getInput();
    
    // Configuration with defaults
    const config = {
        maxPages: input.maxPages || 50,
        delay: input.delay || 2000,
        baseUrl: 'http://diva.kvca.or.kr',
        startUrl: 'http://diva.kvca.or.kr/div/cmn/DivDisclsMainInq',
        includePerformanceData: input.includePerformanceData !== false,
        outputToAirtable: input.outputToAirtable || false,
        airtableConfig: input.airtableConfig || null
    };
    
    console.log('📋 Configuration:', JSON.stringify(config, null, 2));
    
    // Setup crawler with Korean language support
    const crawler = new Apify.PuppeteerCrawler({
        launchOptions: {
            headless: input.headless !== false,
            args: [
                '--no-sandbox',
                '--disable-setuid-sandbox',
                '--disable-dev-shm-usage',
                '--lang=ko-KR,ko,en-US,en',
                '--accept-lang=ko-KR,ko,en-US,en'
            ]
        },
        
        requestHandlerTimeoutSecs: 180,
        
        handlePageFunction: async ({ page, request }) => {
            console.log(`🔍 Processing: ${request.url}`);
            
            try {
                // Wait for page to load completely
                await page.waitForSelector('body', { timeout: 30000 });
                await page.waitForTimeout(config.delay);
                
                // Handle different page types
                const url = request.url;
                
                if (url.includes('DivDisclsMainInq')) {
                    await handleMainSearchPage(page, config);
                } else if (url.includes('fundDetail') || url.includes('disclosure')) {
                    await handleFundDetailPage(page, config);
                } else {
                    console.log(`⚠️ Unknown page type: ${url}`);
                }
                
            } catch (error) {
                console.error(`❌ Error processing ${request.url}:`, error.message);
                throw error;
            }
        },
        
        // Handle failed requests
        handleFailedRequestFunction: async ({ request }) => {
            console.error(`🚫 Request failed: ${request.url}`);
            console.error(`Error: ${request.errorMessages}`);
        }
    });
    
    // Start with the main disclosure page
    await crawler.run([{
        url: config.startUrl,
        userData: { pageType: 'main' }
    }]);
    
    console.log('✅ DIVA Fund Disclosure Scraper completed!');
});

/**
 * Handle the main search/listing page
 */
async function handleMainSearchPage(page, config) {
    console.log('🏠 Processing main disclosure page...');
    
    try {
        // Wait for search form to load
        await page.waitForSelector('form, .search-form, #searchForm', { timeout: 15000 });
        
        // Check if there are search filters to set
        const hasFilters = await page.$('.search-filter, .filter-section');
        
        if (hasFilters) {
            console.log('🔧 Setting up search filters...');
            await setupSearchFilters(page);
        }
        
        // Get initial results
        await extractFundListings(page, config);
        
        // Handle pagination
        let currentPage = 1;
        const maxPages = config.maxPages;
        
        while (currentPage < maxPages) {
            const hasNextPage = await handlePagination(page, currentPage);
            if (!hasNextPage) break;
            
            currentPage++;
            await page.waitForTimeout(config.delay);
            await extractFundListings(page, config);
        }
        
    } catch (error) {
        console.error('❌ Error in main page handling:', error);
        throw error;
    }
}

/**
 * Set up search filters for comprehensive data extraction
 */
async function setupSearchFilters(page) {
    console.log('⚙️ Configuring search filters...');
    
    try {
        // Try to select "전체" (All) options where available
        const allOptions = await page.$$('option[value=""], option[value="all"], option:contains("전체")');
        
        for (const option of allOptions) {
            await option.click();
            await page.waitForTimeout(500);
        }
        
        // Set date range if available (last 5 years)
        const dateInputs = await page.$$('input[type="date"], .date-picker');
        if (dateInputs.length >= 2) {
            const endDate = new Date();
            const startDate = new Date();
            startDate.setFullYear(endDate.getFullYear() - 5);
            
            await dateInputs[0].type(startDate.toISOString().split('T')[0]);
            await dateInputs[1].type(endDate.toISOString().split('T')[0]);
        }
        
        // Click search button
        const searchButton = await page.$('button[type="submit"], .search-btn, #searchBtn');
        if (searchButton) {
            await searchButton.click();
            await page.waitForTimeout(2000);
        }
        
    } catch (error) {
        console.log('⚠️ Filter setup failed (continuing anyway):', error.message);
    }
}

/**
 * Extract fund listings from the current page
 */
async function extractFundListings(page, config) {
    console.log('📊 Extracting fund listings...');
    
    try {
        // Wait for results table
        await page.waitForSelector('table, .fund-list, .disclosure-list', { timeout: 10000 });
        
        // Extract fund data from table rows
        const fundData = await page.evaluate(() => {
            const funds = [];
            
            // Try multiple table selectors
            const tables = document.querySelectorAll('table tbody tr, .fund-item, .disclosure-item');
            
            tables.forEach((row, index) => {
                try {
                    const cells = row.querySelectorAll('td, .cell, .field');
                    
                    if (cells.length < 3) return; // Skip if not enough data
                    
                    const fund = {
                        rowIndex: index,
                        companyName: extractText(cells[0]) || extractText(row.querySelector('.company-name')),
                        fundName: extractText(cells[1]) || extractText(row.querySelector('.fund-name')),
                        registrationDate: extractText(cells[2]) || extractText(row.querySelector('.reg-date')),
                        maturityDate: extractText(cells[3]) || extractText(row.querySelector('.maturity-date')),
                        settlementMonth: extractText(cells[4]) || extractText(row.querySelector('.settlement')),
                        durationType: extractText(cells[5]) || extractText(row.querySelector('.duration-type')),
                        accountType: extractText(cells[6]) || extractText(row.querySelector('.account-type')),
                        purposeType: extractText(cells[7]) || extractText(row.querySelector('.purpose-type')),
                        investmentSector: extractText(cells[8]) || extractText(row.querySelector('.investment-sector')),
                        benchmarkReturn: extractText(cells[9]) || extractText(row.querySelector('.benchmark-return')),
                        totalCommitment: extractText(cells[10]) || extractText(row.querySelector('.total-commitment')),
                        detailUrl: null
                    };
                    
                    // Look for detail page link
                    const detailLink = row.querySelector('a[href*="detail"], a[href*="disclosure"]');
                    if (detailLink) {
                        fund.detailUrl = detailLink.href;
                    }
                    
                    // Only add if we have essential data
                    if (fund.companyName && fund.fundName) {
                        funds.push(fund);
                    }
                    
                } catch (error) {
                    console.error(`Error extracting row ${index}:`, error);
                }
            });
            
            return funds;
            
            // Helper function to extract and clean text
            function extractText(element) {
                if (!element) return null;
                return element.textContent.trim().replace(/\s+/g, ' ');
            }
        });
        
        console.log(`📈 Extracted ${fundData.length} fund records from current page`);
        
        // Save the data
        for (const fund of fundData) {
            await Apify.pushData({
                ...fund,
                extractedAt: new Date().toISOString(),
                sourceUrl: page.url(),
                dataType: 'fund_listing'
            });
        }
        
        // Queue detail pages if URLs found
        const detailUrls = fundData
            .filter(fund => fund.detailUrl)
            .map(fund => ({ url: fund.detailUrl, userData: { pageType: 'detail', fundInfo: fund } }));
            
        if (detailUrls.length > 0) {
            console.log(`🔗 Queuing ${detailUrls.length} detail pages...`);
            await Apify.addRequests(detailUrls);
        }
        
    } catch (error) {
        console.error('❌ Error extracting fund listings:', error);
    }
}

/**
 * Handle pagination to get all results
 */
async function handlePagination(page, currentPage) {
    console.log(`📄 Handling pagination - page ${currentPage}...`);
    
    try {
        // Look for next page button/link
        const nextPageSelectors = [
            'a:contains("다음")',
            'a:contains("Next")', 
            '.pagination .next',
            '.paging .next',
            `a[href*="page=${currentPage + 1}"]`,
            '.page-link.next'
        ];
        
        let nextButton = null;
        for (const selector of nextPageSelectors) {
            nextButton = await page.$(selector);
            if (nextButton) break;
        }
        
        if (!nextButton) {
            // Try numeric pagination
            nextButton = await page.$(`a:contains("${currentPage + 1}")`);
        }
        
        if (nextButton) {
            const isEnabled = await page.evaluate(btn => {
                return !btn.disabled && !btn.classList.contains('disabled');
            }, nextButton);
            
            if (isEnabled) {
                await nextButton.click();
                await page.waitForTimeout(2000);
                return true;
            }
        }
        
        console.log('📄 No more pages available');
        return false;
        
    } catch (error) {
        console.error('❌ Pagination error:', error);
        return false;
    }
}

/**
 * Handle detailed fund disclosure pages
 */
async function handleFundDetailPage(page, config) {
    console.log('🔍 Processing fund detail page...');
    
    try {
        // Wait for detail content
        await page.waitForSelector('.detail-content, .fund-detail, table', { timeout: 15000 });
        
        // Extract detailed fund information
        const detailData = await page.evaluate(() => {
            const detail = {
                performanceMetrics: {},
                regulatoryInfo: {},
                investmentDetails: {},
                financialData: {}
            };
            
            // Extract from tables
            const tables = document.querySelectorAll('table');
            tables.forEach(table => {
                const rows = table.querySelectorAll('tr');
                rows.forEach(row => {
                    const cells = row.querySelectorAll('td, th');
                    if (cells.length >= 2) {
                        const key = cells[0].textContent.trim();
                        const value = cells[1].textContent.trim();
                        
                        // Categorize data based on Korean keywords
                        if (key.includes('수익률') || key.includes('성과') || key.includes('실적')) {
                            detail.performanceMetrics[key] = value;
                        } else if (key.includes('등록') || key.includes('인가') || key.includes('신고')) {
                            detail.regulatoryInfo[key] = value;
                        } else if (key.includes('투자') || key.includes('운용') || key.includes('포트폴리오')) {
                            detail.investmentDetails[key] = value;
                        } else if (key.includes('금액') || key.includes('자산') || key.includes('펀드규모')) {
                            detail.financialData[key] = value;
                        }
                    }
                });
            });
            
            return detail;
        });
        
        console.log('📊 Extracted detailed fund data');
        
        // Save detailed data
        await Apify.pushData({
            ...detailData,
            extractedAt: new Date().toISOString(),
            sourceUrl: page.url(),
            dataType: 'fund_detail'
        });
        
    } catch (error) {
        console.error('❌ Error extracting fund detail:', error);
    }
}

/**
 * Clean and normalize Korean text data
 */
function cleanKoreanText(text) {
    if (!text) return null;
    
    return text
        .trim()
        .replace(/\s+/g, ' ')
        .replace(/[^\w\s가-힣ㄱ-ㅎㅏ-ㅣ0-9.,%-]/g, '')
        .trim();
}

/**
 * Parse financial amounts from Korean text
 */
function parseKoreanAmount(text) {
    if (!text) return null;
    
    // Handle Korean financial notation (억원, 만원, etc.)
    const cleanText = text.replace(/[^\d억만원,.]/g, '');
    
    if (cleanText.includes('억')) {
        const amount = parseFloat(cleanText.replace(/[억원,]/g, ''));
        return amount * 100000000; // Convert 억 to actual number
    } else if (cleanText.includes('만')) {
        const amount = parseFloat(cleanText.replace(/[만원,]/g, ''));
        return amount * 10000; // Convert 만 to actual number
    } else {
        return parseFloat(cleanText.replace(/[원,]/g, '')) || null;
    }
} 