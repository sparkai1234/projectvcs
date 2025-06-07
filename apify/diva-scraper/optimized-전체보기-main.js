/**
 * 🇰🇷 OPTIMIZED DIVA SCRAPER with "전체보기" (View All) Strategy
 * KEY INSIGHT: Use "전체보기" button to load ALL records at once instead of pagination
 */

const { Actor } = require('apify');
const { PuppeteerCrawler } = require('crawlee');
const { createClient } = require('@supabase/supabase-js');

console.log('🔧 === OPTIMIZED DIVA SCRAPER with 전체보기 STRATEGY ===');
console.log('🎯 KEY: Click "전체보기" to get ALL records, not just page 1');

Actor.main(async () => {
    console.log('🚀 Starting OPTIMIZED DIVA Scraper with 전체보기 strategy...');
    
    const input = await Actor.getInput();
    
    const config = {
        updateMode: input?.updateMode || 'incremental',
        maxPages: input?.maxPages || 999,
        dataSource: input?.dataSource || 'all',
        exportToSupabase: input?.exportToSupabase !== false,
        testMode: input?.testMode || false,
        unlimitedExtraction: input?.unlimitedExtraction !== false,
        
        // 전체보기 strategy settings
        use전체보기: true,
        waitAfter전체보기: 10000, // Wait 10s after clicking 전체보기
        maxRetries전체보기: 3,
        
        delay: input?.delay || 3000,
        navigationTimeout: 120000,
        requestTimeout: 300000,
        
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
    
    console.log('📋 OPTIMIZED Configuration with 전체보기 Strategy:');
    console.log(`🎯 Use 전체보기: ${config.use전체보기}`);
    console.log(`⏱️ Wait after 전체보기: ${config.waitAfter전체보기}ms`);
    console.log(`🔄 Max retries: ${config.maxRetries전체보기}`);
    
    // Initialize Supabase
    let supabaseClient = null;
    if (config.exportToSupabase) {
        supabaseClient = await initializeSupabaseClient(input);
    }
    
    const metrics = {
        startTime: Date.now(),
        totalRecords: 0,
        successfulRecords: 0,
        errors: 0,
        전체보기Used: 0,
        paginationFallbacks: 0
    };
    
    // Setup crawler
    const crawler = new PuppeteerCrawler({
        launchContext: {
            launchOptions: {
                headless: input.headless !== false,
                timeout: config.navigationTimeout,
                args: [
                    '--no-sandbox',
                    '--disable-setuid-sandbox',
                    '--disable-dev-shm-usage',
                    '--disable-web-security',
                    '--lang=ko-KR,ko,en-US,en',
                    '--accept-lang=ko-KR,ko,en-US,en'
                ]
            }
        },
        
        requestHandlerTimeoutSecs: config.requestTimeout / 1000,
        navigationTimeoutSecs: config.navigationTimeout / 1000,
        maxConcurrency: 1,
        
        requestHandler: async ({ page, request }) => {
            console.log(`🔍 Processing with 전체보기 strategy: ${request.url}`);
            
            try {
                await setupPageForKoreanPortal(page, config);
                
                const url = request.url;
                let pageResults = { records: 0, errors: 0, used전체보기: false };
                
                // Route to appropriate handler with 전체보기 strategy
                if (url.includes('DivItmInvstPrfmInq')) {
                    pageResults = await handleWith전체보기Strategy(page, config, supabaseClient, 'investment_performance');
                } else if (url.includes('DivItmFsInq')) {
                    pageResults = await handleWith전체보기Strategy(page, config, supabaseClient, 'financial_statements');
                } else if (url.includes('DivItmAssoInq')) {
                    pageResults = await handleWith전체보기Strategy(page, config, supabaseClient, 'association_status');
                } else if (url.includes('DivItmMnpwrInq')) {
                    pageResults = await handleWith전체보기Strategy(page, config, supabaseClient, 'personnel_status');
                } else if (url.includes('DivItmProfsInq')) {
                    pageResults = await handleWith전체보기Strategy(page, config, supabaseClient, 'professional_personnel');
                } else if (url.includes('DivItmViolInq')) {
                    pageResults = await handleWith전체보기Strategy(page, config, supabaseClient, 'violations');
                } else if (url.includes('DivItmVcmapInq')) {
                    pageResults = await handleWith전체보기Strategy(page, config, supabaseClient, 'vc_map');
                } else if (url.includes('DivStatsMainInq')) {
                    pageResults = await handleWith전체보기Strategy(page, config, supabaseClient, 'statistics');
                }
                
                // Update metrics
                metrics.totalRecords += pageResults.records;
                metrics.successfulRecords += pageResults.records - pageResults.errors;
                metrics.errors += pageResults.errors;
                if (pageResults.used전체보기) metrics.전체보기Used++;
                else metrics.paginationFallbacks++;
                
                console.log(`✅ Completed: ${pageResults.records} records, 전체보기: ${pageResults.used전체보기}`);
                
            } catch (error) {
                console.error(`❌ Error processing ${request.url}:`, error.message);
                metrics.errors++;
                throw error;
            }
        },
        
        failedRequestHandler: async ({ request }) => {
            console.error(`🚫 Request failed: ${request.url}`);
            metrics.errors++;
        }
    });
    
    // Get data sources (prefer ALL)
    const targetDataSource = config.dataSource === 'investment_performance' ? 'all' : config.dataSource;
    const dataSources = getDataSources(targetDataSource, config.urls);
    console.log(`📊 Processing ${dataSources.length} data sources with 전체보기 strategy:`, dataSources.map(ds => ds.name));
    
    const requests = dataSources.map(ds => ({
        url: ds.url,
        userData: { dataSource: ds.name, strategy: '전체보기' }
    }));
    
    await crawler.run(requests);
    
    // Final metrics
    const endTime = Date.now();
    const duration = Math.round((endTime - metrics.startTime) / 1000);
    
    console.log('🎉 === OPTIMIZED DIVA EXTRACTION with 전체보기 COMPLETED ===');
    console.log(`📊 Total records: ${metrics.totalRecords}`);
    console.log(`✅ Successful: ${metrics.successfulRecords}`);
    console.log(`❌ Errors: ${metrics.errors}`);
    console.log(`🎯 전체보기 used: ${metrics.전체보기Used}/${dataSources.length}`);
    console.log(`🔄 Pagination fallbacks: ${metrics.paginationFallbacks}`);
    console.log(`⏱️ Duration: ${duration} seconds`);
    console.log(`🚀 Strategy: 전체보기 OPTIMIZATION for Korean DIVA Portal`);
    
    await Actor.setValue('extraction_metrics', {
        totalRecords: metrics.totalRecords,
        successfulRecords: metrics.successfulRecords,
        errors: metrics.errors,
        전체보기Used: metrics.전체보기Used,
        paginationFallbacks: metrics.paginationFallbacks,
        duration,
        strategy: '전체보기_optimization',
        version: '3.0_전체보기',
        timestamp: new Date().toISOString()
    });
});

/**
 * 🎯 CORE FUNCTION: Handle data extraction with 전체보기 strategy
 */
async function handleWith전체보기Strategy(page, config, supabaseClient, dataType) {
    console.log(`🎯 Processing ${dataType} with 전체보기 strategy...`);
    
    try {
        // Step 1: Try to find and click 전체보기 button
        const 전체보기Success = await click전체보기Button(page, config);
        
        let records = [];
        
        if (전체보기Success) {
            console.log(`✅ 전체보기 clicked successfully for ${dataType} - loading ALL records...`);
            
            // Wait for all records to load after 전체보기
            await sleep(config.waitAfter전체보기);
            
            // Extract all records (should be complete dataset now)
            records = await extractAllRecordsAfter전체보기(page, dataType);
            console.log(`🎯 전체보기 extracted ${records.length} records for ${dataType}`);
            
        } else {
            console.log(`⚠️ 전체보기 not found for ${dataType} - falling back to first page extraction...`);
            
            // Fallback: extract just the visible records (page 1)
            records = await extractVisibleRecords(page, dataType);
            console.log(`📄 Fallback extracted ${records.length} records for ${dataType}`);
        }
        
        // Save records to Supabase
        let successCount = 0;
        if (supabaseClient && records.length > 0) {
            for (const record of records) {
                try {
                    const transformedRecord = transformRecordForSupabase(record, dataType);
                    const tableName = getSupabaseTableName(dataType);
                    
                    const { error } = await supabaseClient
                        .from(tableName)
                        .upsert(transformedRecord, { 
                            onConflict: 'company_name',
                            ignoreDuplicates: false 
                        });
                        
                    if (error) {
                        console.log(`⚠️ Supabase upsert warning for ${dataType}:`, error.message);
                    } else {
                        console.log(`✅ Saved ${dataType} record to ${tableName}`);
                        successCount++;
                    }
                    
                } catch (error) {
                    console.log(`❌ Record processing error for ${dataType}:`, error.message);
                }
            }
        }
        
        return { 
            records: records.length, 
            errors: records.length - successCount,
            used전체보기: 전체보기Success
        };
        
    } catch (error) {
        console.error(`❌ ${dataType} handler error:`, error.message);
        return { records: 0, errors: 1, used전체보기: false };
    }
}

/**
 * 🔍 Find and click the 전체보기 (View All) button
 */
async function click전체보기Button(page, config) {
    console.log('🔍 Looking for 전체보기 (View All) button...');
    
    try {
        // Multiple strategies to find 전체보기 button
        const 전체보기Selectors = [
            'button:contains("전체보기")',
            'a:contains("전체보기")',
            'input[value="전체보기"]',
            '.btn:contains("전체보기")',
            '[title="전체보기"]',
            'button[onclick*="전체"]',
            'a[href*="전체"]',
            // Additional Korean variations
            'button:contains("전체")',
            'a:contains("전체")',
            // Generic "view all" patterns
            'button:contains("View All")',
            'button:contains("모두보기")',
            'button:contains("전체목록")'
        ];
        
        for (let retry = 0; retry < config.maxRetries전체보기; retry++) {
            console.log(`🔍 전체보기 search attempt ${retry + 1}/${config.maxRetries전체보기}...`);
            
            for (const selector of 전체보기Selectors) {
                try {
                    // Try CSS selector approach
                    const elements = await page.$$(selector);
                    if (elements.length > 0) {
                        console.log(`🎯 Found 전체보기 button with selector: ${selector}`);
                        await elements[0].click();
                        console.log('✅ 전체보기 button clicked successfully!');
                        return true;
                    }
                } catch (err) {
                    // Continue to next selector
                }
            }
            
            // Try page.evaluate approach for text content search
            try {
                const found = await page.evaluate(() => {
                    const texts = ['전체보기', '전체', 'View All', '모두보기', '전체목록'];
                    
                    for (const text of texts) {
                        const elements = Array.from(document.querySelectorAll('button, a, input'));
                        const element = elements.find(el => 
                            el.textContent && el.textContent.includes(text) ||
                            el.value && el.value.includes(text) ||
                            el.title && el.title.includes(text)
                        );
                        
                        if (element) {
                            console.log(`Found 전체보기 element with text: ${text}`);
                            element.click();
                            return true;
                        }
                    }
                    
                    return false;
                });
                
                if (found) {
                    console.log('✅ 전체보기 clicked via page.evaluate!');
                    return true;
                }
            } catch (err) {
                console.log(`⚠️ Page evaluate attempt ${retry + 1} failed:`, err.message);
            }
            
            // Wait before retry
            await sleep(2000);
        }
        
        console.log('❌ Could not find 전체보기 button after all attempts');
        return false;
        
    } catch (error) {
        console.error('❌ Error finding 전체보기 button:', error.message);
        return false;
    }
}

/**
 * 📊 Extract all records after 전체보기 button clicked
 */
async function extractAllRecordsAfter전체보기(page, dataType) {
    console.log(`📊 Extracting ALL records after 전체보기 for ${dataType}...`);
    
    return await page.evaluate((dataType) => {
        const data = [];
        
        // Try multiple table selectors
        const tableSelectors = [
            'table.table tbody tr',
            'table tbody tr',
            'table tr',
            '.data-table tbody tr',
            '.list-table tbody tr',
            'tbody tr',
            'tr'
        ];
        
        let rows = [];
        for (const selector of tableSelectors) {
            rows = document.querySelectorAll(selector);
            if (rows.length > 0) {
                console.log(`Found ${rows.length} rows with selector: ${selector}`);
                break;
            }
        }
        
        console.log(`Processing ${rows.length} total rows after 전체보기...`);
        
        rows.forEach((row, index) => {
            const cells = row.querySelectorAll('td');
            
            // Skip header rows or empty rows
            if (cells.length < 2 || row.querySelector('th')) {
                return;
            }
            
            // Extract comprehensive record
            const record = {
                company_name: cells[0]?.textContent?.trim() || '',
                data_type: dataType,
                extraction_method: '전체보기',
                
                // All cell contents
                cell_data: Array.from(cells).map(cell => cell.textContent?.trim() || ''),
                
                // Primary fields
                primary_value: cells[1]?.textContent?.trim() || '',
                secondary_value: cells[2]?.textContent?.trim() || '',
                tertiary_value: cells[3]?.textContent?.trim() || '',
                
                // Extended fields for more data
                field_4: cells[4]?.textContent?.trim() || '',
                field_5: cells[5]?.textContent?.trim() || '',
                field_6: cells[6]?.textContent?.trim() || '',
                field_7: cells[7]?.textContent?.trim() || '',
                field_8: cells[8]?.textContent?.trim() || '',
                
                // Metadata
                extracted_at: new Date().toISOString(),
                source_url: window.location.href,
                row_index: index,
                total_cells: cells.length
            };
            
            // Include records with company names
            if (record.company_name && record.company_name.length > 0) {
                data.push(record);
            }
        });
        
        console.log(`Successfully extracted ${data.length} records using 전체보기 method`);
        return data;
    }, dataType);
}

/**
 * 📄 Fallback: Extract visible records (page 1 only)
 */
async function extractVisibleRecords(page, dataType) {
    console.log(`📄 Fallback: extracting visible records for ${dataType}...`);
    
    // Reuse the same logic as 전체보기 but mark as fallback
    const records = await extractAllRecordsAfter전체보기(page, dataType);
    
    // Update extraction method
    records.forEach(record => {
        record.extraction_method = 'fallback_page_1';
    });
    
    return records;
}

/**
 * 🔄 Transform record for Supabase storage
 */
function transformRecordForSupabase(rawData, dataType) {
    return {
        company_name: rawData.company_name?.trim() || 'Unknown Company',
        data_type: dataType,
        extraction_method: rawData.extraction_method || '전체보기',
        
        // Store all cell data as JSON
        cell_data: rawData.cell_data || [],
        
        // Primary fields
        primary_value: rawData.primary_value?.trim(),
        secondary_value: rawData.secondary_value?.trim(),
        tertiary_value: rawData.tertiary_value?.trim(),
        
        // Extended fields
        field_4: rawData.field_4?.trim(),
        field_5: rawData.field_5?.trim(),
        field_6: rawData.field_6?.trim(),
        field_7: rawData.field_7?.trim(),
        field_8: rawData.field_8?.trim(),
        
        // Enhanced metadata
        raw_data: rawData,
        apify_source: 'DIVA_SCRAPER_V3.0_전체보기_OPTIMIZATION',
        extracted_at: rawData.extracted_at,
        source_url: rawData.source_url,
        total_cells: rawData.total_cells,
        
        // Quality scoring
        data_quality_score: calculateDataQualityScore(rawData),
        created_at: new Date().toISOString()
    };
}

/**
 * 🗂️ Get appropriate Supabase table name
 */
function getSupabaseTableName(dataType) {
    const tableMap = {
        'investment_performance': 'diva_investment_performance_raw',
        'financial_statements': 'diva_financial_statements_raw',
        'association_status': 'diva_association_status_raw',
        'personnel_status': 'diva_personnel_status_raw',
        'professional_personnel': 'diva_professional_personnel_raw',
        'violations': 'diva_violations_raw',
        'vc_map': 'diva_vc_map_raw',
        'statistics': 'diva_statistics_raw'
    };
    
    return tableMap[dataType] || 'diva_general_raw';
}

/**
 * 📊 Calculate data quality score
 */
function calculateDataQualityScore(rawData) {
    let score = 0;
    
    // Basic fields scoring
    if (rawData.company_name && rawData.company_name.length > 0) score += 30;
    if (rawData.primary_value && rawData.primary_value.length > 0) score += 20;
    if (rawData.secondary_value && rawData.secondary_value.length > 0) score += 15;
    if (rawData.tertiary_value && rawData.tertiary_value.length > 0) score += 10;
    
    // Bonus for 전체보기 extraction
    if (rawData.extraction_method === '전체보기') score += 25;
    
    return Math.min(score, 100);
}

/**
 * ⚙️ Helper functions (unchanged)
 */
async function initializeSupabaseClient(input) {
    console.log('🔗 Initializing Supabase Connection...');
    
    const supabaseUrl = input?.supabaseUrl || process.env.SUPABASE_URL;
    const supabaseKey = input?.supabaseKey || process.env.SUPABASE_SERVICE_ROLE_KEY || process.env.SUPABASE_KEY;
    
    if (!supabaseUrl || !supabaseKey) {
        console.log('❌ Missing Supabase credentials');
        return null;
    }
    
    try {
        const supabase = createClient(supabaseUrl, supabaseKey);
        console.log('✅ Supabase client initialized');
        console.log('📋 Supabase URL:', supabaseUrl.substring(0, 30) + '...');
        console.log('🔑 Supabase Key:', '...' + supabaseKey.slice(-6));
        
        return supabase;
    } catch (error) {
        console.error('❌ Supabase initialization error:', error.message);
        return null;
    }
}

async function setupPageForKoreanPortal(page, config) {
    await page.setViewport({ width: 1920, height: 1080 });
    await page.setUserAgent('Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36');
    await page.setExtraHTTPHeaders({
        'Accept-Language': 'ko-KR,ko;q=0.9,en-US;q=0.8,en;q=0.7'
    });
}

function getDataSources(dataSource, urls) {
    const allSources = [
        { name: 'investment_performance', url: urls.investment_performance },
        { name: 'financial_statements', url: urls.financial_statements },
        { name: 'association_status', url: urls.association_status },
        { name: 'personnel_status', url: urls.personnel_status },
        { name: 'professional_personnel', url: urls.professional_personnel },
        { name: 'violations', url: urls.violations },
        { name: 'vc_map', url: urls.vc_map },
        { name: 'statistics', url: urls.statistics }
    ];
    
    if (dataSource === 'all') {
        return allSources;
    }
    
    return allSources.filter(source => dataSource.includes(source.name));
}

function sleep(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
}

module.exports = { click전체보기Button, extractAllRecordsAfter전체보기 }; 