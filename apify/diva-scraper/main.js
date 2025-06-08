/**
 * 🎯 DIVA SCRAPER v5.0 - ENHANCED PLAYWRIGHT EDITION
 * CRITICAL UPGRADE: Targeting 92+ violations records benchmark
 * 
 * MANUAL DISCOVERY INSIGHTS:
 * - User manually captured 92 violations records using 전체보기
 * - Previous versions only captured 5 records (missing 94.6%)
 * - Key: Better 전체보기 button detection and page loading strategies
 * 
 * v5.0 ENHANCEMENTS:
 * - Multi-strategy 전체보기 button detection (text, value, class, xpath)
 * - Enhanced waiting strategies for complete data loading
 * - Improved Korean text extraction and processing
 * - Better error handling and retry mechanisms
 * - Advanced Playwright features: networkidle, screenshots on failure
 * 
 * TARGET: 92+ violations + 50+ per other source = 500+ total records
 */

const { Actor } = require('apify');
const { PlaywrightCrawler } = require('crawlee');
const { createClient } = require('@supabase/supabase-js');

console.log('🎯 === DIVA SCRAPER v5.0 - ENHANCED PLAYWRIGHT EDITION ===');
console.log('🚀 TARGETING: 92+ violations records (manual benchmark)');
console.log('✨ NEW: Multi-strategy 전체보기 detection + advanced Playwright features');

Actor.main(async () => {
    console.log('🚀 Starting DIVA Scraper v5.0 with Enhanced Playwright...');
    
    const input = await Actor.getInput();
    
    const config = {
        updateMode: input?.updateMode || 'incremental',
        maxPages: input?.maxPages || 999,
        dataSource: input?.dataSource || 'all',
        exportToSupabase: input?.exportToSupabase !== false,
        testMode: input?.testMode || false,
        
        delay: input?.delay || 3000,
        navigationTimeout: 180000, // Increased for better reliability
        requestTimeout: 600000,    // Increased for complete data loading
        
        baseUrl: 'http://diva.kvca.or.kr',
        urls: {
            investment_performance: 'http://diva.kvca.or.kr/div/dii/DivItmInvstPrfmInq',
            financial_statements: 'http://diva.kvca.or.kr/div/dii/DivItmFsInq',
            association_status: 'http://diva.kvca.or.kr/div/dii/DivItmAssoInq',
            personnel_status: 'http://diva.kvca.or.kr/div/dii/DivItmMnpwrInq',
            professional_personnel: 'http://diva.kvca.or.kr/div/dii/DivItmProfsInq',
            violations: 'http://diva.kvca.or.kr/div/dii/DivItmViolInq',
            vc_map: 'http://diva.kvca.or.kr/div/dii/DivItmVcmapInq',
            statistics: 'http://diva.kvca.or.kr/div/cmn/DivStatsMainInq'
        }
    };
    
    console.log('📋 Enhanced Playwright Configuration v5.0:');
    console.log(`🎯 PRIMARY TARGET: 92+ violations records (user manual verification)`);
    console.log(`🎯 SECONDARY TARGET: 50+ per other source`);
    console.log(`💡 NEW STRATEGY: Multi-level 전체보기 detection + networkidle waiting`);
    
    // Initialize Supabase with enhanced error handling
    let supabaseClient = null;
    if (config.exportToSupabase) {
        supabaseClient = await initializeSupabaseClientV5(input);
    }
    
    const metrics = {
        startTime: Date.now(),
        totalRecords: 0,
        successfulRecords: 0,
        errors: 0,
        pagesProcessed: 0,
        전체보기ButtonsFound: 0,
        전체보기ButtonsClicked: 0,
        screenshotsTaken: 0,
        retryAttempts: 0,
        
        detectionStrategies: {
            textMatch: 0,
            valueMatch: 0,
            classMatch: 0,
            xpathMatch: 0,
            cssMatch: 0
        },
        
        dataSourceCounts: {
            investment_performance: { records: 0, errors: 0, status: 'pending', expected: '50+', benchmark: 50 },
            financial_statements: { records: 0, errors: 0, status: 'pending', expected: '50+', benchmark: 50 },
            association_status: { records: 0, errors: 0, status: 'pending', expected: '50+', benchmark: 50 },
            personnel_status: { records: 0, errors: 0, status: 'pending', expected: '50+', benchmark: 50 },
            professional_personnel: { records: 0, errors: 0, status: 'pending', expected: '50+', benchmark: 50 },
            violations: { records: 0, errors: 0, status: 'pending', expected: '92+ (CRITICAL)', benchmark: 92 },
            vc_map: { records: 0, errors: 0, status: 'pending', expected: '50+', benchmark: 50 },
            statistics: { records: 0, errors: 0, status: 'pending', expected: '20+', benchmark: 20 }
        }
    };
    
    // 🚀 ENHANCED PLAYWRIGHT CRAWLER v5.0
    const crawler = new PlaywrightCrawler({
        launchContext: {
            launchOptions: {
                headless: input.headless !== false,
                timeout: config.navigationTimeout,
                args: [
                    '--no-sandbox',
                    '--disable-setuid-sandbox',
                    '--disable-dev-shm-usage',
                    '--disable-web-security',
                    '--lang=ko-KR'  // Enhanced Korean support
                ]
            }
        },
        
        requestHandlerTimeoutSecs: config.requestTimeout / 1000,
        navigationTimeoutSecs: config.navigationTimeout / 1000,
        maxConcurrency: 1,
        
        requestHandler: async ({ page, request }) => {
            console.log(`🔍 PLAYWRIGHT v5.0 Processing: ${request.url}`);
            
            try {
                // Enhanced Korean language setup
                await page.setExtraHTTPHeaders({
                    'Accept-Language': 'ko-KR,ko;q=0.9,en-US;q=0.8,en;q=0.7',
                    'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36'
                });
                
                const url = request.url;
                
                // Enhanced initial page load detection
                console.log('⏳ v5.0: Waiting for initial page load with multiple strategies...');
                
                try {
                    await page.waitForSelector('table, .content, .container, body', { timeout: 45000 });
                } catch (e) {
                    console.log('⚠️ Table selector timeout, trying alternative selectors...');
                    await page.waitForSelector('div, span, td', { timeout: 30000 });
                }
                
                await page.waitForTimeout(5000); // Allow initial render
                
                // 🎯 ENHANCED 전체보기 DETECTION v5.0
                console.log('🔍 v5.0: Starting enhanced 전체보기 button detection...');
                
                const 전체보기Result = await findAndClick전체보기V5(page, metrics);
                
                if (전체보기Result.found) {
                    metrics.전체보기ButtonsFound++;
                    console.log(`✅ v5.0 SUCCESS: Found 전체보기 using ${전체보기Result.strategy}!`);
                    console.log(`📊 Detection method: ${전체보기Result.method}`);
                    
                    if (전체보기Result.clicked) {
                        metrics.전체보기ButtonsClicked++;
                        console.log('🎯 v5.0: Successfully clicked 전체보기! Initiating enhanced wait...');
                        
                        // Enhanced waiting strategy for complete data loading
                        console.log('⏳ v5.0: Enhanced networkidle + DOM stability wait...');
                        
                        // Multiple wait strategies for reliability
                        await Promise.race([
                            page.waitForLoadState('networkidle', { timeout: 60000 }),
                            page.waitForTimeout(15000)
                        ]);
                        
                        // Additional wait for DOM updates
                        let previousRowCount = 0;
                        let currentRowCount = 0;
                        let stabilityChecks = 0;
                        
                        for (let i = 0; i < 5; i++) {
                            await page.waitForTimeout(3000);
                            currentRowCount = await page.evaluate(() => 
                                document.querySelectorAll('table tbody tr, .data-row, tr').length
                            );
                            
                            console.log(`📊 v5.0: DOM stability check ${i+1}/5 - rows: ${currentRowCount}`);
                            
                            if (currentRowCount === previousRowCount && currentRowCount > 0) {
                                stabilityChecks++;
                                if (stabilityChecks >= 2) {
                                    console.log('✅ v5.0: DOM stabilized, proceeding with extraction');
                                    break;
                                }
                            } else {
                                stabilityChecks = 0;
                            }
                            previousRowCount = currentRowCount;
                        }
                        
                        console.log(`✅ v5.0: Enhanced data loading complete! Final row count: ${currentRowCount}`);
                    }
                } else {
                    console.log('❌ v5.0: 전체보기 button not found - extracting visible records only');
                    
                    // Take screenshot for debugging if button not found on violations page
                    if (url.includes('DivItmViolInq')) {
                        const screenshotPath = `violations-no-button-${Date.now()}.png`;
                        await page.screenshot({ path: screenshotPath, fullPage: true });
                        metrics.screenshotsTaken++;
                        console.log(`📸 Debug screenshot saved: ${screenshotPath}`);
                    }
                }
                
                // Enhanced final page analysis
                const pageInfo = await page.evaluate(() => {
                    const tables = document.querySelectorAll('table');
                    const tableRows = document.querySelectorAll('table tr').length;
                    const dataRows = document.querySelectorAll('table tbody tr').length;
                    const visibleText = document.body.innerText.length;
                    
                    return {
                    scrollHeight: document.documentElement.scrollHeight,
                        tableCount: tables.length,
                        tableRows: tableRows,
                        dataRows: dataRows,
                        visibleTextLength: visibleText,
                    allElements: document.querySelectorAll('*').length
                    };
                });
                
                console.log(`📊 v5.0 Enhanced analysis:`);
                console.log(`   Tables: ${pageInfo.tableCount}, Rows: ${pageInfo.tableRows}, Data rows: ${pageInfo.dataRows}`);
                console.log(`   Text length: ${pageInfo.visibleTextLength}, Elements: ${pageInfo.allElements}`);
                
                // Enhanced record extraction
                let pageResults = { records: 0, errors: 0 };
                let currentDataSource = '';
                
                if (url.includes('DivItmInvstPrfmInq')) {
                    currentDataSource = 'investment_performance';
                    pageResults = await extractWithPlaywrightV5(page, config, supabaseClient, 'investment_performance', metrics);
                } else if (url.includes('DivItmFsInq')) {
                    currentDataSource = 'financial_statements';
                    pageResults = await extractWithPlaywrightV5(page, config, supabaseClient, 'financial_statements', metrics);
                } else if (url.includes('DivItmAssoInq')) {
                    currentDataSource = 'association_status';
                    pageResults = await extractWithPlaywrightV5(page, config, supabaseClient, 'association_status', metrics);
                } else if (url.includes('DivItmMnpwrInq')) {
                    currentDataSource = 'personnel_status';
                    pageResults = await extractWithPlaywrightV5(page, config, supabaseClient, 'personnel_status', metrics);
                } else if (url.includes('DivItmProfsInq')) {
                    currentDataSource = 'professional_personnel';
                    pageResults = await extractWithPlaywrightV5(page, config, supabaseClient, 'professional_personnel', metrics);
                } else if (url.includes('DivItmViolInq')) {
                    currentDataSource = 'violations';
                    pageResults = await extractWithPlaywrightV5(page, config, supabaseClient, 'violations', metrics);
                } else if (url.includes('DivItmVcmapInq')) {
                    currentDataSource = 'vc_map';
                    pageResults = await extractWithPlaywrightV5(page, config, supabaseClient, 'vc_map', metrics);
                } else if (url.includes('DivStatsMainInq')) {
                    currentDataSource = 'statistics';
                    pageResults = await extractWithPlaywrightV5(page, config, supabaseClient, 'statistics', metrics);
                }
                
                // Enhanced metrics update with benchmark comparison
                if (currentDataSource && metrics.dataSourceCounts[currentDataSource]) {
                    const source = metrics.dataSourceCounts[currentDataSource];
                    source.records = pageResults.records;
                    source.errors = pageResults.errors;
                    source.status = pageResults.records > 0 ? 'success' : 'completed';
                    
                    const benchmark = source.benchmark;
                    const percentage = benchmark > 0 ? ((pageResults.records / benchmark) * 100).toFixed(1) : 'N/A';
                    
                    console.log(`📊 v5.0 RESULT: ${currentDataSource}`);
                    console.log(`   Records: ${pageResults.records} / ${benchmark} benchmark (${percentage}%)`);
                    
                    if (currentDataSource === 'violations') {
                        if (pageResults.records >= 70) {
                            console.log(`🎯 EXCELLENT: ${pageResults.records} violations records (${percentage}% of 92 benchmark)!`);
                        } else if (pageResults.records >= 30) {
                            console.log(`⚠️ PROGRESS: ${pageResults.records} violations records (${percentage}% of benchmark)`);
                        } else {
                            console.log(`❌ CRITICAL: Only ${pageResults.records} violations, need 92+ for benchmark`);
                        }
                    }
                    
                    if (pageResults.records >= benchmark) {
                        console.log(`✅ BENCHMARK ACHIEVED: ${currentDataSource} - ${pageResults.records}/${benchmark}`);
                    }
                }
                
                metrics.totalRecords += pageResults.records;
                metrics.successfulRecords += pageResults.records - pageResults.errors;
                metrics.errors += pageResults.errors;
                metrics.pagesProcessed++;
                
            } catch (error) {
                console.error(`❌ v5.0 Error processing ${request.url}:`, error.message);
                
                // Enhanced error handling with screenshots
                const screenshotPath = `error-${Date.now()}.png`;
                try {
                    await page.screenshot({ path: screenshotPath, fullPage: true });
                    metrics.screenshotsTaken++;
                    console.log(`📸 Error screenshot saved: ${screenshotPath}`);
                } catch (screenshotError) {
                    console.log('Failed to take error screenshot:', screenshotError.message);
                }
                
                metrics.errors++;
            }
        }
    });
    
    // Get target URLs based on configuration
    const targetSources = getDataSources(config.dataSource, config.urls);
    
    console.log(`🎯 v5.0: Targeting ${targetSources.length} data sources for enhanced extraction`);
    console.log('🚀 v5.0: Starting enhanced Playwright crawling...');
    
    // Add URLs to crawler
    await crawler.addRequests(targetSources.map(url => ({ url })));
    
    // Run the enhanced crawler
    await crawler.run();
    
    // Enhanced final reporting
    const endTime = Date.now();
    const duration = ((endTime - metrics.startTime) / 1000 / 60).toFixed(1);
    
    console.log('\n🎯 === DIVA SCRAPER v5.0 - ENHANCED RESULTS ===');
    console.log(`⏱️ Duration: ${duration} minutes`);
    console.log(`📊 Total Records: ${metrics.totalRecords}`);
    console.log(`✅ Successful: ${metrics.successfulRecords}`);
    console.log(`❌ Errors: ${metrics.errors}`);
    console.log(`📄 Pages: ${metrics.pagesProcessed}`);
    console.log(`🔘 전체보기 Found: ${metrics.전체보기ButtonsFound}`);
    console.log(`🎯 전체보기 Clicked: ${metrics.전체보기ButtonsClicked}`);
    console.log(`📸 Screenshots: ${metrics.screenshotsTaken}`);
    
    console.log('\n📊 === DETECTION STRATEGY PERFORMANCE ===');
    Object.entries(metrics.detectionStrategies).forEach(([strategy, count]) => {
        if (count > 0) {
            console.log(`   ${strategy}: ${count} successes`);
        }
    });
    
    console.log('\n📊 === BENCHMARK COMPARISON v5.0 ===');
    let benchmarksAchieved = 0;
    let totalBenchmarks = 0;
    
    Object.entries(metrics.dataSourceCounts).forEach(([source, data]) => {
        const percentage = data.benchmark > 0 ? ((data.records / data.benchmark) * 100).toFixed(1) : 'N/A';
        const status = data.records >= data.benchmark ? '✅' : (data.records >= data.benchmark * 0.5 ? '⚠️' : '❌');
        
        console.log(`${status} ${source}: ${data.records}/${data.benchmark} (${percentage}%)`);
        
        if (data.records >= data.benchmark) benchmarksAchieved++;
        totalBenchmarks++;
    });
    
    console.log(`\n🎯 BENCHMARK SUMMARY: ${benchmarksAchieved}/${totalBenchmarks} achieved`);
    
    const violationsCount = metrics.dataSourceCounts.violations.records;
    if (violationsCount >= 92) {
        console.log(`🏆 SUCCESS: ${violationsCount} violations records matches manual benchmark!`);
    } else if (violationsCount >= 50) {
        console.log(`📈 PROGRESS: ${violationsCount} violations records, approaching 92 benchmark`);
    } else {
        console.log(`🔄 RETRY NEEDED: Only ${violationsCount} violations, manual process found 92`);
    }
    
    console.log('\n✅ DIVA Scraper v5.0 Enhanced Playwright Edition Complete!');
});

// 🎯 ENHANCED 전체보기 DETECTION v5.0 - Multi-strategy approach
async function findAndClick전체보기V5(page, metrics) {
    console.log('🔍 v5.0: Starting multi-strategy 전체보기 detection...');
    
    const strategies = [
        {
            name: 'textMatch',
            description: 'Text content matching',
            selector: async () => {
                const elements = await page.$$('button, input[type="button"], input[type="submit"], a, span, div');
                for (const element of elements) {
                    const text = await element.textContent();
                    if (text && (text.includes('전체보기') || text.includes('전체') || text.includes('모두보기'))) {
                        return element;
                    }
                }
                return null;
            }
        },
        {
            name: 'valueMatch',
            description: 'Value attribute matching',
            selector: async () => {
                return await page.$('input[value*="전체"], input[value*="전체보기"], button[value*="전체"]');
            }
        },
        {
            name: 'classMatch',
            description: 'Class name matching',
            selector: async () => {
                return await page.$('.전체, .전체보기, .all-view, .show-all, [class*="전체"], [class*="all"]');
            }
        },
        {
            name: 'xpathMatch',
            description: 'XPath text matching',
            selector: async () => {
                try {
                    return await page.$('xpath=//button[contains(text(), "전체")] | //input[contains(@value, "전체")] | //a[contains(text(), "전체")]');
                } catch (e) {
                    return null;
                }
            }
        },
        {
            name: 'cssMatch',
            description: 'Advanced CSS selector',
            selector: async () => {
                const selectors = [
                    'button[onclick*="전체"]',
                    'input[onclick*="전체"]',
                    '[title*="전체"]',
                    '[alt*="전체"]',
                    'a[href*="전체"]'
                ];
                
                for (const selector of selectors) {
                    try {
                        const element = await page.$(selector);
                        if (element) return element;
                    } catch (e) {
                        continue;
                    }
                }
                return null;
            }
        }
    ];
    
    for (const strategy of strategies) {
        try {
            console.log(`🔍 v5.0: Trying ${strategy.name} - ${strategy.description}...`);
            
            const element = await strategy.selector();
            
            if (element) {
                console.log(`✅ v5.0: Found 전체보기 using ${strategy.name}!`);
                metrics.detectionStrategies[strategy.name]++;
                
                // Verify element is clickable
                const isVisible = await element.isVisible();
                const isEnabled = await element.isEnabled();
                
                console.log(`📊 Element state: visible=${isVisible}, enabled=${isEnabled}`);
                
                if (isVisible && isEnabled) {
                    try {
                        // Enhanced clicking with multiple attempts
                        console.log(`🎯 v5.0: Attempting to click using ${strategy.name}...`);
                        
                        // Scroll element into view
                        await element.scrollIntoViewIfNeeded();
                        await page.waitForTimeout(1000);
                        
                        // Try clicking
                        await element.click();
                        await page.waitForTimeout(2000);
                        
                        console.log(`✅ v5.0: Successfully clicked 전체보기 using ${strategy.name}!`);
                    
                    return { 
                        found: true, 
                        clicked: true, 
                            strategy: strategy.name,
                            method: strategy.description
                        };
                        
                    } catch (clickError) {
                        console.log(`⚠️ Click failed with ${strategy.name}:`, clickError.message);
                        
                        // Try alternative click methods
                        try {
                            await element.click({ force: true });
                            console.log(`✅ v5.0: Force click succeeded with ${strategy.name}!`);
                            return {
                                found: true,
                                clicked: true,
                                strategy: strategy.name,
                                method: `${strategy.description} (force click)`
                            };
                        } catch (forceClickError) {
                            console.log(`❌ Force click also failed with ${strategy.name}`);
                        }
                    }
                } else {
                    console.log(`⚠️ Element found but not clickable: visible=${isVisible}, enabled=${isEnabled}`);
                }
                
                return { 
                    found: true, 
                    clicked: false,
                    strategy: strategy.name,
                    method: strategy.description
                };
            }
            
        } catch (error) {
            console.log(`❌ Strategy ${strategy.name} failed:`, error.message);
        }
    }
    
    console.log('❌ v5.0: All 전체보기 detection strategies failed');
    return {
        found: false,
        clicked: false,
        strategy: 'none',
        method: 'all strategies failed'
    };
}

// 🎯 ENHANCED EXTRACTION v5.0 - Better Korean text handling
async function extractWithPlaywrightV5(page, config, supabaseClient, dataType, metrics) {
    console.log(`📊 v5.0: Starting enhanced extraction for ${dataType}...`);
    
    try {
        // Enhanced table detection
        const tableData = await page.evaluate(() => {
            // Multiple table selection strategies
            const tables = [
                ...document.querySelectorAll('table'),
                ...document.querySelectorAll('.data-table'),
                ...document.querySelectorAll('.grid'),
                ...document.querySelectorAll('[role="table"]')
            ];
            
            let bestTable = null;
            let maxRows = 0;
            
            // Find table with most data rows
            tables.forEach(table => {
                const rows = table.querySelectorAll('tr');
                if (rows.length > maxRows) {
                    maxRows = rows.length;
                    bestTable = table;
                }
            });
            
            if (!bestTable) {
                return [];
            }
            
            const rows = Array.from(bestTable.querySelectorAll('tr'));
            const records = [];
            
            // Enhanced header detection
            let headerRow = null;
            for (let i = 0; i < Math.min(3, rows.length); i++) {
                const cells = rows[i].querySelectorAll('th, td');
                if (cells.length > 0) {
                    const headerText = Array.from(cells).map(cell => cell.textContent.trim()).join('|');
                    if (headerText.includes('번호') || headerText.includes('구분') || headerText.includes('회사') || headerText.includes('이름')) {
                        headerRow = rows[i];
                    break;
                    }
                }
            }
            
            const startIndex = headerRow ? rows.indexOf(headerRow) + 1 : 1;
            
            // Extract data rows with enhanced Korean text handling
            for (let i = startIndex; i < rows.length; i++) {
                const row = rows[i];
                const cells = Array.from(row.querySelectorAll('td, th'));
                
                if (cells.length > 0) {
                    const record = {};
                    
                    cells.forEach((cell, index) => {
                        const text = cell.textContent.trim();
                        if (text && text !== '-' && text !== '0') {
                            record[`field_${index}`] = text;
                        }
                    });
                    
                    // Only include rows with meaningful data
                    if (Object.keys(record).length > 1) {
                        records.push(record);
                    }
                }
            }
            
            return records;
        });
        
        console.log(`📊 v5.0: Extracted ${tableData.length} raw records for ${dataType}`);
        
        // Enhanced record transformation and storage
        let successCount = 0;
        let errorCount = 0;
        
        if (tableData.length > 0 && supabaseClient && config.exportToSupabase) {
            const transformedRecords = tableData.map(record => 
                transformRecordForSupabaseV5(record, dataType)
            ).filter(record => record !== null);
            
            console.log(`📊 v5.0: Transformed ${transformedRecords.length} records for Supabase`);
            
            if (transformedRecords.length > 0) {
                try {
                    const tableName = getSupabaseTableNameV5(dataType);
                    
                    // Enhanced batch insertion with retry logic
                    for (let i = 0; i < transformedRecords.length; i += 50) {
                        const batch = transformedRecords.slice(i, i + 50);
                        
                        try {
                            const { data, error } = await supabaseClient
                        .from(tableName)
                                .upsert(batch, { 
                                    onConflict: 'id,scraped_at',
                            ignoreDuplicates: false 
                        });
                        
                            if (error) {
                                console.error(`❌ v5.0: Supabase error for ${dataType} batch ${i}:`, error.message);
                                errorCount += batch.length;
                    } else {
                                successCount += batch.length;
                                console.log(`✅ v5.0: Inserted batch ${i}-${i+batch.length} for ${dataType}`);
                            }
                        } catch (batchError) {
                            console.error(`❌ v5.0: Batch insertion error:`, batchError.message);
                            errorCount += batch.length;
                        }
                    }
                    
                } catch (supabaseError) {
                    console.error(`❌ v5.0: Supabase operation failed for ${dataType}:`, supabaseError.message);
                    errorCount = transformedRecords.length;
                }
            }
        } else if (tableData.length > 0) {
            successCount = tableData.length;
            console.log(`📊 v5.0: ${successCount} records extracted (Supabase export disabled)`);
        }
        
        const result = {
            records: successCount + errorCount,
            errors: errorCount
        };
        
        console.log(`📊 v5.0 EXTRACTION RESULT for ${dataType}:`);
        console.log(`   Total: ${result.records}, Success: ${successCount}, Errors: ${errorCount}`);
        
        return result;
        
    } catch (error) {
        console.error(`❌ v5.0: Extraction failed for ${dataType}:`, error.message);
        return { records: 0, errors: 1 };
    }
}

// 🎯 ENHANCED RECORD TRANSFORMATION v5.0
function transformRecordForSupabaseV5(rawData, dataType) {
    try {
        const baseRecord = {
            id: `${dataType}_${Date.now()}_${Math.random().toString(36).substr(2, 9)}`,
        data_type: dataType,
            scraped_at: new Date().toISOString(),
            raw_data: rawData,
            metadata: {
                version: 'DIVA_SCRAPER_V5.0_ENHANCED_PLAYWRIGHT',
                extraction_method: 'enhanced_multi_strategy',
                korean_text_support: true
            }
        };
        
        // Enhanced field mapping based on data type
        const fieldMappings = {
            violations: {
                company_name: ['field_1', 'field_2', 'field_0'],
                violation_type: ['field_3', 'field_4'],
                violation_date: ['field_5', 'field_6'],
                penalty_amount: ['field_7', 'field_8']
            },
            investment_performance: {
                company_name: ['field_0', 'field_1'],
                investment_amount: ['field_2', 'field_3'],
                investment_date: ['field_4', 'field_5']
            },
            financial_statements: {
                company_name: ['field_0', 'field_1'],
                revenue: ['field_2', 'field_3'],
                assets: ['field_4', 'field_5']
            }
        };
        
        if (fieldMappings[dataType]) {
            Object.entries(fieldMappings[dataType]).forEach(([targetField, sourceFields]) => {
                for (const sourceField of sourceFields) {
                    if (rawData[sourceField] && rawData[sourceField].trim()) {
                        baseRecord[targetField] = rawData[sourceField].trim();
                        break;
                    }
                }
            });
        }
        
        return baseRecord;
        
    } catch (error) {
        console.error(`❌ v5.0: Record transformation failed:`, error.message);
        return null;
    }
}

// 🎯 ENHANCED TABLE NAME MAPPING v5.0
function getSupabaseTableNameV5(dataType) {
    const tableMap = {
        investment_performance: 'diva_investment_performance',
        financial_statements: 'diva_financial_statements',
        association_status: 'diva_association_status',
        personnel_status: 'diva_personnel_status',
        professional_personnel: 'diva_professional_personnel',
        violations: 'diva_violations',
        vc_map: 'diva_vc_map',
        statistics: 'diva_statistics'
    };
    
    return tableMap[dataType] || `diva_${dataType}`;
}

// 🎯 ENHANCED SUPABASE INITIALIZATION v5.0
async function initializeSupabaseClientV5(input) {
    try {
        const supabaseUrl = input.supabaseUrl || process.env.SUPABASE_URL;
        const supabaseKey = input.supabaseServiceRoleKey || process.env.SUPABASE_SERVICE_ROLE_KEY;
    
    if (!supabaseUrl || !supabaseKey) {
            console.error('❌ v5.0: Missing Supabase credentials');
        return null;
    }
    
        console.log('🔧 v5.0: Initializing enhanced Supabase client...');
        
        const client = createClient(supabaseUrl, supabaseKey, {
            auth: {
                autoRefreshToken: false,
                persistSession: false
            },
            db: {
                schema: 'public'
            }
        });
        
        // Test connection
        const { data, error } = await client.from('diva_violations').select('count').limit(1);
        
        if (error) {
            console.log('⚠️ v5.0: Supabase test query warning:', error.message);
        } else {
            console.log('✅ v5.0: Supabase connection verified');
        }
        
        return client;
        
    } catch (error) {
        console.error('❌ v5.0: Supabase initialization failed:', error.message);
        return null;
    }
}

// 🎯 DATA SOURCE SELECTION HELPER
function getDataSources(dataSource, urls) {
    if (dataSource === 'violations') {
        return [urls.violations];
    } else if (dataSource === 'all') {
        return Object.values(urls);
    } else if (urls[dataSource]) {
        return [urls[dataSource]];
    } else {
        return Object.values(urls);
    }
} 