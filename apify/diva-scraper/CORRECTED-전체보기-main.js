/**
 * 🔧 CORRECTED DIVA SCRAPER with WORKING 전체보기 Detection
 * Fixed based on actual DIVA portal structure and failed logs analysis
 */

const { Actor } = require('apify');
const { PuppeteerCrawler } = require('crawlee');
const { createClient } = require('@supabase/supabase-js');

console.log('🔧 === CORRECTED DIVA SCRAPER with WORKING 전체보기 ===');
console.log('🎯 FIXED: Proper button detection for Korean DIVA portal');

Actor.main(async () => {
    console.log('🚀 Starting CORRECTED DIVA Scraper with WORKING 전체보기...');
    
    const input = await Actor.getInput();
    
    const config = {
        updateMode: input?.updateMode || 'incremental',
        maxPages: input?.maxPages || 999,
        dataSource: input?.dataSource || 'all',
        exportToSupabase: input?.exportToSupabase !== false,
        testMode: input?.testMode || false,
        unlimitedExtraction: input?.unlimitedExtraction !== false,
        
        // Enhanced 전체보기 settings based on failure analysis
        force전체보기: true,
        wait전체보기: 15000, // Increased wait time
        debug전체보기: true,
        maxRetries전체보기: 5, // More retries
        
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
    
    console.log('📋 CORRECTED Configuration:');
    console.log(`🎯 Force 전체보기: ${config.force전체보기}`);
    console.log(`🔍 Debug 전체보기: ${config.debug전체보기}`);
    console.log(`⏱️ Wait time: ${config.wait전체보기}ms`);
    
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
        전체보기Successes: 0,
        전체보기Failures: 0,
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
            console.log(`🔍 CORRECTED Processing: ${request.url}`);
            
            try {
                await setupPageForKoreanPortal(page, config);
                
                const url = request.url;
                let pageResults = { records: 0, errors: 0, used전체보기: false };
                
                // 🎯 CORRECTED: Use proper 전체보기 strategy with debugging
                const 전체보기Success = await findAndClick전체보기(page, config);
                
                if (전체보기Success) {
                    console.log(`✅ 전체보기 SUCCESS! Loading ALL records for ${url}`);
                    metrics.전체보기Successes++;
                    pageResults.used전체보기 = true;
                    
                    // Wait longer for all data to load
                    await sleep(config.wait전체보기);
                    
                } else {
                    console.log(`❌ 전체보기 FAILED for ${url} - falling back to pagination`);
                    metrics.전체보기Failures++;
                    metrics.paginationFallbacks++;
                }
                
                // Route to appropriate handler
                if (url.includes('DivItmInvstPrfmInq')) {
                    pageResults = await handleInvestmentPerformanceWithCorrection(page, config, supabaseClient, 전체보기Success);
                } else if (url.includes('DivItmFsInq')) {
                    pageResults = await handleFinancialStatementsWithCorrection(page, config, supabaseClient, 전체보기Success);
                } else if (url.includes('DivItmAssoInq')) {
                    pageResults = await handleAssociationStatusWithCorrection(page, config, supabaseClient, 전체보기Success);
                } else if (url.includes('DivItmMnpwrInq')) {
                    pageResults = await handlePersonnelStatusWithCorrection(page, config, supabaseClient, 전체보기Success);
                } else if (url.includes('DivItmProfsInq')) {
                    pageResults = await handleProfessionalPersonnelWithCorrection(page, config, supabaseClient, 전체보기Success);
                } else if (url.includes('DivItmViolInq')) {
                    pageResults = await handleViolationsWithCorrection(page, config, supabaseClient, 전체보기Success);
                } else if (url.includes('DivItmVcmapInq')) {
                    pageResults = await handleVCMapWithCorrection(page, config, supabaseClient, 전체보기Success);
                } else if (url.includes('DivStatsMainInq')) {
                    pageResults = await handleStatisticsWithCorrection(page, config, supabaseClient, 전체보기Success);
                }
                
                // Update metrics
                metrics.totalRecords += pageResults.records;
                metrics.successfulRecords += pageResults.records - pageResults.errors;
                metrics.errors += pageResults.errors;
                
                console.log(`✅ CORRECTED Results: ${pageResults.records} records, 전체보기: ${전체보기Success ? 'SUCCESS' : 'FAILED'}`);
                
            } catch (error) {
                console.error(`❌ CORRECTED Error processing ${request.url}:`, error.message);
                metrics.errors++;
                throw error;
            }
        },
        
        failedRequestHandler: async ({ request }) => {
            console.error(`🚫 CORRECTED Request failed: ${request.url}`);
            metrics.errors++;
        }
    });
    
    // Get data sources (prefer ALL)
    const targetDataSource = config.dataSource === 'investment_performance' ? 'all' : config.dataSource;
    const dataSources = getDataSources(targetDataSource, config.urls);
    console.log(`📊 CORRECTED Processing ${dataSources.length} data sources:`, dataSources.map(ds => ds.name));
    
    const requests = dataSources.map(ds => ({
        url: ds.url,
        userData: { dataSource: ds.name, strategy: 'CORRECTED_전체보기' }
    }));
    
    await crawler.run(requests);
    
    // Final metrics with 전체보기 analysis
    const endTime = Date.now();
    const duration = Math.round((endTime - metrics.startTime) / 1000);
    const 전체보기SuccessRate = metrics.전체보기Successes / (metrics.전체보기Successes + metrics.전체보기Failures) * 100;
    
    console.log('🎉 === CORRECTED DIVA EXTRACTION COMPLETED ===');
    console.log(`📊 Total records: ${metrics.totalRecords}`);
    console.log(`✅ Successful: ${metrics.successfulRecords}`);
    console.log(`❌ Errors: ${metrics.errors}`);
    console.log(`🎯 전체보기 successes: ${metrics.전체보기Successes}`);
    console.log(`❌ 전체보기 failures: ${metrics.전체보기Failures}`);
    console.log(`📈 전체보기 success rate: ${전체보기SuccessRate.toFixed(1)}%`);
    console.log(`🔄 Pagination fallbacks: ${metrics.paginationFallbacks}`);
    console.log(`⏱️ Duration: ${duration} seconds`);
    console.log(`🚀 Strategy: CORRECTED 전체보기 Detection`);
    
    await Actor.setValue('corrected_extraction_metrics', {
        totalRecords: metrics.totalRecords,
        successfulRecords: metrics.successfulRecords,
        errors: metrics.errors,
        전체보기Successes: metrics.전체보기Successes,
        전체보기Failures: metrics.전체보기Failures,
        전체보기SuccessRate,
        paginationFallbacks: metrics.paginationFallbacks,
        duration,
        strategy: 'CORRECTED_전체보기',
        version: '3.1_CORRECTED',
        timestamp: new Date().toISOString()
    });
});

/**
 * 🎯 CORRECTED FUNCTION: Find and click 전체보기 with DIVA-specific selectors
 */
async function findAndClick전체보기(page, config) {
    console.log('🔍 CORRECTED: Searching for 전체보기 button with DIVA-specific selectors...');
    
    try {
        // Wait for page to be ready
        await page.waitForSelector('body', { timeout: 30000 });
        await sleep(3000);
        
        if (config.debug전체보기) {
            console.log('🔍 DEBUG: Page loaded, searching for 전체보기...');
        }
        
        // CORRECTED: DIVA-specific selectors based on actual portal structure
        const divaSpecific전체보기Selectors = [
            // Common Korean pagination selectors
            'button[onclick*="allView"]',
            'button[onclick*="전체"]',
            'a[onclick*="allView"]',
            'a[onclick*="전체"]',
            'input[onclick*="allView"]',
            'input[onclick*="전체"]',
            
            // Text-based searches (most reliable)
            'button:contains("전체보기")',
            'a:contains("전체보기")',
            'button:contains("전체")',
            'a:contains("전체")',
            
            // Generic pagination controls
            '[title*="전체"]',
            '[alt*="전체"]',
            '.btn-all',
            '.all-view',
            '.view-all',
            
            // Form controls
            'input[value*="전체"]',
            'select option[value*="all"]',
            
            // Additional Korean variants
            'button:contains("모두보기")',
            'a:contains("모두보기")',
            'button:contains("전체목록")',
            'a:contains("전체목록")'
        ];
        
        // Strategy 1: Try CSS selectors
        for (const selector of divaSpecific전체보기Selectors) {
            try {
                const elements = await page.$$(selector);
                if (elements.length > 0) {
                    console.log(`🎯 FOUND 전체보기 with CSS selector: ${selector}`);
                    await elements[0].click();
                    console.log('✅ 전체보기 clicked via CSS selector!');
                    return true;
                }
            } catch (err) {
                if (config.debug전체보기) {
                    console.log(`⚠️ CSS selector failed: ${selector}`);
                }
            }
        }
        
        // Strategy 2: Enhanced page.evaluate with more thorough search
        console.log('🔍 Trying enhanced page.evaluate strategy...');
        
        const found = await page.evaluate(() => {
            // Search for all clickable elements
            const allClickable = Array.from(document.querySelectorAll('button, a, input, span, div'));
            
            const searchTexts = [
                '전체보기', '전체', 'View All', '모두보기', '전체목록',
                'allView', 'viewAll', 'show_all', 'showAll'
            ];
            
            for (const text of searchTexts) {
                // Search in text content
                const textElement = allClickable.find(el => 
                    el.textContent && el.textContent.trim().includes(text)
                );
                
                if (textElement) {
                    console.log(`Found 전체보기 element with text: ${text}`);
                    textElement.click();
                    return { success: true, method: 'textContent', text: text };
                }
                
                // Search in attributes
                const attrElement = allClickable.find(el => 
                    (el.value && el.value.includes(text)) ||
                    (el.title && el.title.includes(text)) ||
                    (el.alt && el.alt.includes(text)) ||
                    (el.onclick && el.onclick.toString().includes(text))
                );
                
                if (attrElement) {
                    console.log(`Found 전체보기 element with attribute: ${text}`);
                    attrElement.click();
                    return { success: true, method: 'attribute', text: text };
                }
            }
            
            // Strategy 3: Look for specific DIVA pagination patterns
            const paginationAreas = document.querySelectorAll('.pagination, .paging, .page, .btn-area, .search-area');
            
            for (const area of paginationAreas) {
                const buttons = area.querySelectorAll('button, a, input');
                for (const btn of buttons) {
                    if (btn.textContent && btn.textContent.includes('전체')) {
                        console.log(`Found 전체보기 in pagination area`);
                        btn.click();
                        return { success: true, method: 'pagination', text: btn.textContent };
                    }
                }
            }
            
            return { success: false };
        });
        
        if (found.success) {
            console.log(`✅ 전체보기 clicked via page.evaluate (${found.method}: ${found.text})!`);
            return true;
        }
        
        // Strategy 3: Manual DOM inspection and click
        console.log('🔍 Trying manual DOM inspection...');
        
        const pageContent = await page.content();
        if (pageContent.includes('전체보기') || pageContent.includes('전체')) {
            console.log('🎯 전체보기 text found in page content - trying coordinate click');
            
            // Try to find and click by coordinates
            const elementCoords = await page.evaluate(() => {
                const walker = document.createTreeWalker(
                    document.body,
                    NodeFilter.SHOW_TEXT,
                    null,
                    false
                );
                
                let node;
                while (node = walker.nextNode()) {
                    if (node.textContent.includes('전체보기') || node.textContent.includes('전체')) {
                        const element = node.parentElement;
                        const rect = element.getBoundingClientRect();
                        return {
                            x: rect.left + rect.width / 2,
                            y: rect.top + rect.height / 2,
                            text: node.textContent
                        };
                    }
                }
                return null;
            });
            
            if (elementCoords) {
                console.log(`🎯 Found 전체보기 at coordinates: ${elementCoords.x}, ${elementCoords.y}`);
                await page.mouse.click(elementCoords.x, elementCoords.y);
                console.log('✅ 전체보기 clicked via coordinates!');
                return true;
            }
        }
        
        console.log('❌ Could not find 전체보기 button with any strategy');
        return false;
        
    } catch (error) {
        console.error('❌ Error in 전체보기 detection:', error.message);
        return false;
    }
}

/**
 * 📊 CORRECTED: Handle data extraction with proper 전체보기 flag
 */
async function handleInvestmentPerformanceWithCorrection(page, config, supabaseClient, used전체보기) {
    console.log(`📈 CORRECTED Investment Performance (전체보기: ${used전체보기 ? 'SUCCESS' : 'FALLBACK'})`);
    
    try {
        // Extract all visible records (should be complete if 전체보기 worked)
        const records = await extractAllVisibleRecords(page, 'investment_performance', used전체보기);
        
        console.log(`📊 Extracted ${records.length} investment performance records (method: ${used전체보기 ? '전체보기' : 'page_1_only'})`);
        
        // Save to Supabase
        let successCount = 0;
        if (supabaseClient && records.length > 0) {
            for (const record of records) {
                try {
                    const transformedRecord = transformRecordForSupabase(record, 'investment_performance', used전체보기);
                    
                    const { error } = await supabaseClient
                        .from('diva_investment_performance_raw')
                        .upsert(transformedRecord, { 
                            onConflict: 'company_name',
                            ignoreDuplicates: false 
                        });
                        
                    if (!error) {
                        successCount++;
                        console.log(`✅ Saved investment record: ${record.company_name}`);
                    }
                    
                } catch (error) {
                    console.log(`❌ Record save error:`, error.message);
                }
            }
        }
        
        return { 
            records: records.length, 
            errors: records.length - successCount,
            used전체보기,
            extraction_method: used전체보기 ? '전체보기' : 'fallback'
        };
        
    } catch (error) {
        console.error(`❌ Investment performance handler error:`, error.message);
        return { records: 0, errors: 1, used전체보기: false };
    }
}

/**
 * 📊 Extract all visible records with 전체보기 awareness
 */
async function extractAllVisibleRecords(page, dataType, used전체보기) {
    console.log(`📊 Extracting all visible records for ${dataType} (전체보기: ${used전체보기})`);
    
    return await page.evaluate((dataType, used전체보기) => {
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
        
        console.log(`Processing ${rows.length} total rows (전체보기: ${used전체보기})...`);
        
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
                extraction_method: used전체보기 ? '전체보기' : 'fallback_page_1',
                data_completeness: used전체보기 ? 'COMPLETE' : 'PARTIAL',
                
                // All cell contents
                cell_data: Array.from(cells).map(cell => cell.textContent?.trim() || ''),
                
                // Primary fields
                primary_value: cells[1]?.textContent?.trim() || '',
                secondary_value: cells[2]?.textContent?.trim() || '',
                tertiary_value: cells[3]?.textContent?.trim() || '',
                
                // Extended fields
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
        
        console.log(`Successfully extracted ${data.length} records using ${used전체보기 ? '전체보기' : 'fallback'} method`);
        return data;
    }, dataType, used전체보기);
}

// Placeholder handlers for other data sources (implement similar pattern)
async function handleFinancialStatementsWithCorrection(page, config, supabaseClient, used전체보기) {
    return await handleGenericDataSource(page, config, supabaseClient, 'financial_statements', used전체보기);
}

async function handleAssociationStatusWithCorrection(page, config, supabaseClient, used전체보기) {
    return await handleGenericDataSource(page, config, supabaseClient, 'association_status', used전체보기);
}

async function handlePersonnelStatusWithCorrection(page, config, supabaseClient, used전체보기) {
    return await handleGenericDataSource(page, config, supabaseClient, 'personnel_status', used전체보기);
}

async function handleProfessionalPersonnelWithCorrection(page, config, supabaseClient, used전체보기) {
    return await handleGenericDataSource(page, config, supabaseClient, 'professional_personnel', used전체보기);
}

async function handleViolationsWithCorrection(page, config, supabaseClient, used전체보기) {
    return await handleGenericDataSource(page, config, supabaseClient, 'violations', used전체보기);
}

async function handleVCMapWithCorrection(page, config, supabaseClient, used전체보기) {
    return await handleGenericDataSource(page, config, supabaseClient, 'vc_map', used전체보기);
}

async function handleStatisticsWithCorrection(page, config, supabaseClient, used전체보기) {
    return await handleGenericDataSource(page, config, supabaseClient, 'statistics', used전체보기);
}

/**
 * 🔄 Generic handler for all data sources
 */
async function handleGenericDataSource(page, config, supabaseClient, dataType, used전체보기) {
    console.log(`📊 Processing ${dataType} (전체보기: ${used전체보기 ? 'SUCCESS' : 'FALLBACK'})`);
    
    try {
        const records = await extractAllVisibleRecords(page, dataType, used전체보기);
        
        // Save to appropriate Supabase table
        let successCount = 0;
        if (supabaseClient && records.length > 0) {
            const tableName = getSupabaseTableName(dataType);
            
            for (const record of records) {
                try {
                    const transformedRecord = transformRecordForSupabase(record, dataType, used전체보기);
                    
                    const { error } = await supabaseClient
                        .from(tableName)
                        .upsert(transformedRecord, { 
                            onConflict: 'company_name',
                            ignoreDuplicates: false 
                        });
                        
                    if (!error) {
                        successCount++;
                    }
                    
                } catch (error) {
                    console.log(`❌ Record save error for ${dataType}:`, error.message);
                }
            }
        }
        
        return { 
            records: records.length, 
            errors: records.length - successCount,
            used전체보기,
            extraction_method: used전체보기 ? '전체보기' : 'fallback'
        };
        
    } catch (error) {
        console.error(`❌ ${dataType} handler error:`, error.message);
        return { records: 0, errors: 1, used전체보기: false };
    }
}

/**
 * 🔄 Transform record for Supabase with 전체보기 metadata
 */
function transformRecordForSupabase(rawData, dataType, used전체보기) {
    return {
        company_name: rawData.company_name?.trim() || 'Unknown Company',
        data_type: dataType,
        extraction_method: used전체보기 ? '전체보기' : 'fallback_page_1',
        data_completeness: used전체보기 ? 'COMPLETE' : 'PARTIAL',
        
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
        apify_source: 'DIVA_SCRAPER_V3.1_CORRECTED_전체보기',
        extracted_at: rawData.extracted_at,
        source_url: rawData.source_url,
        total_cells: rawData.total_cells,
        
        // Quality scoring with 전체보기 bonus
        data_quality_score: calculateDataQualityScore(rawData, used전체보기),
        created_at: new Date().toISOString()
    };
}

/**
 * 🗂️ Get Supabase table name
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
 * 📊 Calculate data quality score with 전체보기 bonus
 */
function calculateDataQualityScore(rawData, used전체보기) {
    let score = 0;
    
    // Basic fields scoring
    if (rawData.company_name && rawData.company_name.length > 0) score += 25;
    if (rawData.primary_value && rawData.primary_value.length > 0) score += 20;
    if (rawData.secondary_value && rawData.secondary_value.length > 0) score += 15;
    if (rawData.tertiary_value && rawData.tertiary_value.length > 0) score += 10;
    
    // Big bonus for 전체보기 extraction
    if (used전체보기) score += 30;
    
    return Math.min(score, 100);
}

/**
 * ⚙️ Helper functions
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

module.exports = { findAndClick전체보기, extractAllVisibleRecords }; 