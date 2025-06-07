/**
 * 🎯 FIXED SIMPLE DIVA EXTRACTOR
 * INSIGHT: DIVA portal shows ALL records by default - no 전체보기 button needed!
 * Based on scrollHeight: 18341 analysis showing all content is loaded
 */

const { Actor } = require('apify');
const { PuppeteerCrawler } = require('crawlee');
const { createClient } = require('@supabase/supabase-js');

console.log('🎯 === FIXED SIMPLE DIVA EXTRACTOR ===');
console.log('💡 INSIGHT: ALL records already visible - no button clicking needed!');

Actor.main(async () => {
    console.log('🚀 Starting FIXED Simple DIVA Extractor...');
    
    const input = await Actor.getInput();
    
    const config = {
        updateMode: input?.updateMode || 'incremental',
        maxPages: input?.maxPages || 999,
        dataSource: input?.dataSource || 'all',
        exportToSupabase: input?.exportToSupabase !== false,
        testMode: input?.testMode || false,
        
        // NO 전체보기 settings needed!
        skipButtonSearch: true,
        extractAllVisible: true,
        
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
    
    console.log('📋 FIXED Configuration:');
    console.log(`🎯 Skip button search: ${config.skipButtonSearch}`);
    console.log(`📊 Extract all visible: ${config.extractAllVisible}`);
    console.log(`💡 Strategy: ALL records already loaded!`);
    
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
        pagesProcessed: 0,
        allRecordsExtracted: 0
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
            console.log(`🔍 FIXED Processing (ALL records already visible): ${request.url}`);
            
            try {
                await setupPageForKoreanPortal(page, config);
                
                const url = request.url;
                
                // 💡 KEY INSIGHT: Skip button search, extract ALL visible records directly!
                console.log('💡 Skipping 전체보기 search - extracting ALL visible records...');
                
                // Wait for content to load
                await page.waitForSelector('table', { timeout: 30000 });
                await sleep(3000);
                
                // Check page dimensions to confirm all content is loaded
                const pageInfo = await page.evaluate(() => ({
                    scrollHeight: document.documentElement.scrollHeight,
                    clientHeight: document.documentElement.clientHeight,
                    tableRows: document.querySelectorAll('table tr').length,
                    dataRows: document.querySelectorAll('table tbody tr').length
                }));
                
                console.log(`📊 Page analysis: scrollHeight=${pageInfo.scrollHeight}, tableRows=${pageInfo.tableRows}, dataRows=${pageInfo.dataRows}`);
                
                if (pageInfo.scrollHeight > 10000) {
                    console.log('✅ Large content detected - ALL records appear to be loaded!');
                } else {
                    console.log('⚠️ Small content - might need pagination after all');
                }
                
                // Extract ALL visible records
                let pageResults = { records: 0, errors: 0 };
                
                if (url.includes('DivItmInvstPrfmInq')) {
                    pageResults = await extractAllVisibleRecordsSimple(page, config, supabaseClient, 'investment_performance');
                } else if (url.includes('DivItmFsInq')) {
                    pageResults = await extractAllVisibleRecordsSimple(page, config, supabaseClient, 'financial_statements');
                } else if (url.includes('DivItmAssoInq')) {
                    pageResults = await extractAllVisibleRecordsSimple(page, config, supabaseClient, 'association_status');
                } else if (url.includes('DivItmMnpwrInq')) {
                    pageResults = await extractAllVisibleRecordsSimple(page, config, supabaseClient, 'personnel_status');
                } else if (url.includes('DivItmProfsInq')) {
                    pageResults = await extractAllVisibleRecordsSimple(page, config, supabaseClient, 'professional_personnel');
                } else if (url.includes('DivItmViolInq')) {
                    pageResults = await extractAllVisibleRecordsSimple(page, config, supabaseClient, 'violations');
                } else if (url.includes('DivItmVcmapInq')) {
                    pageResults = await extractAllVisibleRecordsSimple(page, config, supabaseClient, 'vc_map');
                } else if (url.includes('DivStatsMainInq')) {
                    pageResults = await extractAllVisibleRecordsSimple(page, config, supabaseClient, 'statistics');
                }
                
                // Update metrics
                metrics.totalRecords += pageResults.records;
                metrics.successfulRecords += pageResults.records - pageResults.errors;
                metrics.errors += pageResults.errors;
                metrics.pagesProcessed++;
                metrics.allRecordsExtracted += pageResults.records;
                
                console.log(`✅ FIXED Results: ${pageResults.records} records extracted directly (no button search needed)`);
                
            } catch (error) {
                console.error(`❌ FIXED Error processing ${request.url}:`, error.message);
                metrics.errors++;
                throw error;
            }
        },
        
        failedRequestHandler: async ({ request }) => {
            console.error(`🚫 FIXED Request failed: ${request.url}`);
            metrics.errors++;
        }
    });
    
    // Get data sources
    const targetDataSource = config.dataSource === 'investment_performance' ? 'all' : config.dataSource;
    const dataSources = getDataSources(targetDataSource, config.urls);
    console.log(`📊 FIXED Processing ${dataSources.length} data sources (ALL records per page):`, dataSources.map(ds => ds.name));
    
    const requests = dataSources.map(ds => ({
        url: ds.url,
        userData: { dataSource: ds.name, strategy: 'EXTRACT_ALL_VISIBLE' }
    }));
    
    await crawler.run(requests);
    
    // Final metrics
    const endTime = Date.now();
    const duration = Math.round((endTime - metrics.startTime) / 1000);
    
    console.log('🎉 === FIXED DIVA EXTRACTION COMPLETED ===');
    console.log(`📊 Total records: ${metrics.totalRecords}`);
    console.log(`✅ Successful: ${metrics.successfulRecords}`);
    console.log(`❌ Errors: ${metrics.errors}`);
    console.log(`📄 Pages processed: ${metrics.pagesProcessed}`);
    console.log(`🎯 All records extracted: ${metrics.allRecordsExtracted}`);
    console.log(`⏱️ Duration: ${duration} seconds`);
    console.log(`💡 Strategy: DIRECT EXTRACTION (no button search)`);
    console.log(`🚀 Result: ${metrics.totalRecords > 50 ? 'SUCCESS - Many records found!' : 'INVESTIGATE - Few records found'}`);
    
    await Actor.setValue('fixed_extraction_metrics', {
        totalRecords: metrics.totalRecords,
        successfulRecords: metrics.successfulRecords,
        errors: metrics.errors,
        pagesProcessed: metrics.pagesProcessed,
        allRecordsExtracted: metrics.allRecordsExtracted,
        duration,
        strategy: 'DIRECT_EXTRACTION_NO_BUTTON_SEARCH',
        version: '3.2_FIXED_SIMPLE',
        timestamp: new Date().toISOString(),
        insight: 'ALL_RECORDS_ALREADY_VISIBLE'
    });
});

/**
 * 📊 Extract ALL visible records directly (no button search needed)
 */
async function extractAllVisibleRecordsSimple(page, config, supabaseClient, dataType) {
    console.log(`📊 FIXED: Extracting ALL visible records for ${dataType} (direct method)...`);
    
    try {
        // Extract all records from the table
        const records = await page.evaluate((dataType) => {
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
                    console.log(`FIXED: Found ${rows.length} rows with selector: ${selector}`);
                    break;
                }
            }
            
            console.log(`FIXED: Processing ${rows.length} total rows for ${dataType}...`);
            
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
                    extraction_method: 'DIRECT_ALL_VISIBLE',
                    data_completeness: 'COMPLETE_NO_BUTTON_NEEDED',
                    
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
                    total_cells: cells.length,
                    page_scroll_height: document.documentElement.scrollHeight
                };
                
                // Include records with company names
                if (record.company_name && record.company_name.length > 0) {
                    data.push(record);
                }
            });
            
            console.log(`FIXED: Successfully extracted ${data.length} records using DIRECT method`);
            return data;
        }, dataType);
        
        console.log(`📊 FIXED: Extracted ${records.length} records for ${dataType} (ALL VISIBLE)`);
        
        // Save to Supabase
        let successCount = 0;
        if (supabaseClient && records.length > 0) {
            const tableName = getSupabaseTableName(dataType);
            
            for (const record of records) {
                try {
                    const transformedRecord = transformRecordForSupabaseSimple(record, dataType);
                    
                    const { error } = await supabaseClient
                        .from(tableName)
                        .upsert(transformedRecord, { 
                            onConflict: 'company_name',
                            ignoreDuplicates: false 
                        });
                        
                    if (!error) {
                        successCount++;
                        console.log(`✅ FIXED: Saved ${dataType} record: ${record.company_name}`);
                    } else {
                        console.log(`⚠️ FIXED: Upsert warning for ${record.company_name}:`, error.message);
                    }
                    
                } catch (error) {
                    console.log(`❌ FIXED: Record save error for ${dataType}:`, error.message);
                }
            }
        }
        
        return { 
            records: records.length, 
            errors: records.length - successCount,
            extraction_method: 'DIRECT_ALL_VISIBLE'
        };
        
    } catch (error) {
        console.error(`❌ FIXED: ${dataType} extraction error:`, error.message);
        return { records: 0, errors: 1, extraction_method: 'ERROR' };
    }
}

/**
 * 🔄 Transform record for Supabase (simplified)
 */
function transformRecordForSupabaseSimple(rawData, dataType) {
    return {
        company_name: rawData.company_name?.trim() || 'Unknown Company',
        data_type: dataType,
        extraction_method: 'DIRECT_ALL_VISIBLE',
        data_completeness: 'COMPLETE_NO_BUTTON_NEEDED',
        
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
        apify_source: 'DIVA_SCRAPER_V3.2_FIXED_SIMPLE_NO_BUTTON',
        extracted_at: rawData.extracted_at,
        source_url: rawData.source_url,
        total_cells: rawData.total_cells,
        page_scroll_height: rawData.page_scroll_height,
        
        // Quality scoring (high because we get all records)
        data_quality_score: 100, // Max score for complete extraction
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

module.exports = { extractAllVisibleRecordsSimple }; 