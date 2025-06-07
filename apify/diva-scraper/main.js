const { Actor } = require('apify');
const { PuppeteerCrawler } = require('crawlee');
const { createClient } = require('@supabase/supabase-js');

console.log('🔧 === ENHANCED DIVA INTELLIGENCE SCRAPER v2.1.2 ===');
console.log('🕐 Enhanced Time:', new Date().toISOString());
console.log('🔧 DOCKER FIX + 전체보기 DETECTION: 2025-06-07-04:55 - PUPPETEER DEPENDENCY FIXED');

/**
 * 🇰🇷 Enhanced DIVA Intelligence Scraper v2.0
 * Based on successful VCS v2.2.7 architecture
 * 
 * ENHANCEMENTS:
 * - Smart conflict resolution for duplicates
 * - Improved Korean financial data handling  
 * - Production-grade error handling
 * - Enhanced Supabase operations
 * - Better performance & reliability
 */

Actor.main(async () => {
    console.log('🚀 Starting Enhanced DIVA Intelligence Scraper v2.0...');
    console.log('🎯 Target: Korean DIVA Financial Intelligence Portal');
    
    const input = await Actor.getInput();
    
    // Enhanced Configuration (based on VCS success)
    const config = {
        updateMode: input?.updateMode || 'incremental',
        maxPages: input?.maxPages || 999, // Unlimited like VCS
        dataSource: input?.dataSource || 'all',
        exportToSupabase: input?.exportToSupabase !== false,
        testMode: input?.testMode || false,
        unlimitedExtraction: input?.unlimitedExtraction !== false,
        includeStatisticsPDFs: input?.includeStatisticsPDFs !== false,
        
        // Enhanced delays for Korean portal stability
        delay: input?.delay || 3000,
        navigationTimeout: 120000, // 2 minutes like VCS
        requestTimeout: 300000, // 5 minutes like VCS
        
        baseUrl: 'http://diva.kvca.or.kr',
        
        // DIVA Data Source URLs
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
    
    console.log('📋 Enhanced Configuration:', {
        updateMode: config.updateMode,
        maxPages: config.maxPages,
        dataSource: config.dataSource,
        exportToSupabase: config.exportToSupabase,
        unlimitedExtraction: config.unlimitedExtraction
    });
    
    // Initialize Enhanced Supabase Client (VCS proven method)
    let supabaseClient = null;
    if (config.exportToSupabase) {
        supabaseClient = await initializeSupabaseClient(input);
        if (!supabaseClient) {
            console.log('❌ Supabase initialization failed - continuing without export');
        }
    }
    
    // Enhanced metrics tracking (like VCS)
    const metrics = {
        startTime: Date.now(),
        totalRecords: 0,
        successfulRecords: 0,
        errors: 0,
        duplicatesResolved: 0,
        dataSourceResults: {}
    };
    
    // Setup Enhanced Crawler (based on VCS architecture)
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
        maxConcurrency: 1, // One at a time for stability
        
        requestHandler: async ({ page, request }) => {
            console.log(`🔍 Processing with FIXED SIMPLE strategy (no button search): ${request.url}`);
            
            try {
                // Enhanced page setup (VCS proven method)
                await setupPageForKoreanPortal(page, config);
                
                // 💡 SMART STRATEGY: Try 전체보기 button first, then pagination if needed
                console.log('💡 SMART: Trying 전체보기 button first, then pagination if needed...');
                
                // Try to find and click 전체보기 (View All) button first
                const viewAllSuccess = await try전체보기Button(page, config);
                
                // Wait for content to load
                await page.waitForSelector('table', { timeout: 30000 });
                await sleep(3000);
                
                // Check if all content is already loaded (large scroll height = all records)
                const pageInfo = await page.evaluate(() => ({
                    scrollHeight: document.documentElement.scrollHeight,
                    tableRows: document.querySelectorAll('table tr').length,
                    dataRows: document.querySelectorAll('table tbody tr').length
                }));
                
                console.log(`💡 Page analysis: scrollHeight=${pageInfo.scrollHeight}, dataRows=${pageInfo.dataRows}`);
                console.log(`💡 ${pageInfo.scrollHeight > 10000 ? 'LARGE CONTENT - All records likely visible!' : 'Small content - might need pagination'}`);
                
                const url = request.url;
                let pageResults = { records: 0, errors: 0, used전체보기: false, extraction_method: 'DIRECT_ALL_VISIBLE' };
                
                // Route to appropriate enhanced handler
                if (url.includes('DivItmInvstPrfmInq')) {
                    pageResults = await handleEnhancedInvestmentPerformance(page, config, supabaseClient);
                } else if (url.includes('DivItmFsInq')) {
                    pageResults = await handleEnhancedFinancialStatements(page, config, supabaseClient);
                } else if (url.includes('DivItmAssoInq')) {
                    pageResults = await handleEnhancedAssociationStatus(page, config, supabaseClient);
                } else if (url.includes('DivItmMnpwrInq')) {
                    pageResults = await handleEnhancedPersonnelStatus(page, config, supabaseClient);
                } else if (url.includes('DivItmProfsInq')) {
                    pageResults = await handleEnhancedProfessionalPersonnel(page, config, supabaseClient);
                } else if (url.includes('DivItmViolInq')) {
                    pageResults = await handleEnhancedViolations(page, config, supabaseClient);
                } else if (url.includes('DivItmVcmapInq')) {
                    pageResults = await handleEnhancedVCMap(page, config, supabaseClient);
                } else if (url.includes('DivStatsMainInq')) {
                    pageResults = await handleEnhancedStatistics(page, config, supabaseClient);
                }
                
                // Update metrics
                metrics.totalRecords += pageResults.records;
                metrics.successfulRecords += pageResults.records - pageResults.errors;
                metrics.errors += pageResults.errors;
                
                console.log(`✅ Page completed: ${pageResults.records} records, ${pageResults.errors} errors`);
                
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
    
    // Get data sources to scrape - DEFAULT TO ALL SOURCES
    const targetDataSource = config.dataSource === 'investment_performance' ? 'all' : config.dataSource;
    const dataSources = getEnhancedDataSources(targetDataSource, config.urls);
    console.log(`📊 Scraping ${dataSources.length} enhanced data sources:`, dataSources.map(ds => ds.name));
    
    // Queue requests
    const requests = dataSources.map(ds => ({
        url: ds.url,
        userData: { dataSource: ds.name, pageType: 'main' }
    }));
    
    // Run enhanced crawler
    await crawler.run(requests);
    
    // Enhanced completion reporting (like VCS)
    const endTime = Date.now();
    const duration = Math.round((endTime - metrics.startTime) / 1000);
    
    console.log('🎉 === ENHANCED DIVA INTELLIGENCE EXTRACTION COMPLETED ===');
    console.log(`📊 Total records extracted: ${metrics.totalRecords}`);
    console.log(`✅ Successful records: ${metrics.successfulRecords}`);
    console.log(`❌ Errors encountered: ${metrics.errors}`);
    console.log(`⏱️ Duration: ${duration} seconds`);
    console.log(`📅 Update mode: ${config.updateMode}`);
    console.log(`🏷️ Data source: ${config.dataSource}`);
    console.log(`📍 Platform: Apify Cloud`);
    console.log(`🔧 Optimization: v2.0 with ENHANCED KOREAN FINANCIAL DATA PROCESSING`);
    console.log(`🎯 DIVA Endpoint: http://diva.kvca.or.kr`);
    
    // Export final metrics
    await Actor.setValue('extraction_metrics', {
        totalRecords: metrics.totalRecords,
        successfulRecords: metrics.successfulRecords,
        errors: metrics.errors,
        duration,
        dataSourceResults: metrics.dataSourceResults,
        version: '2.0',
        timestamp: new Date().toISOString()
    });
});

/**
 * Initialize Enhanced Supabase Client (based on VCS success)
 */
async function initializeSupabaseClient(input) {
    console.log('🔗 Initializing Enhanced Supabase Connection...');
    
    const supabaseUrl = input?.supabaseUrl || process.env.SUPABASE_URL;
    const supabaseKey = input?.supabaseKey || process.env.SUPABASE_SERVICE_ROLE_KEY || process.env.SUPABASE_KEY;
    
    if (!supabaseUrl || !supabaseKey) {
        console.log('❌ Missing Supabase credentials');
        return null;
    }
    
    try {
        const supabase = createClient(supabaseUrl, supabaseKey);
        console.log('✅ Supabase client initialized');
        console.log(`📋 Supabase URL: ${supabaseUrl}`);
        console.log(`🔑 Supabase Key: ...${supabaseKey.slice(-8)}`);
        
        // Test connection with DIVA table
        const { data, error } = await supabase
            .from('diva_investment_performance_raw')
            .select('count')
            .limit(1);
            
        if (error) {
            console.log('⚠️ Supabase connection test warning:', error.message);
        } else {
            console.log('✅ Supabase connection test passed');
        }
        
        return supabase;
        
    } catch (error) {
        console.error('❌ Failed to initialize Supabase:', error.message);
        return null;
    }
}

/**
 * Enhanced page setup for Korean portal (VCS proven method)
 */
async function setupPageForKoreanPortal(page, config) {
    // Set generous timeouts
    page.setDefaultTimeout(config.navigationTimeout);
    page.setDefaultNavigationTimeout(config.navigationTimeout);
    
    // Wait for page load
    await page.waitForSelector('body', { timeout: 60000 });
    
    // Korean portal stability delay
    await sleep(config.delay);
}

/**
 * Get enhanced data sources (based on VCS architecture)
 */
function getEnhancedDataSources(dataSource, urls) {
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

/**
 * FIXED Investment Performance Handler - Direct Extraction (No Button Search)
 */
async function handleEnhancedInvestmentPerformance(page, config, supabaseClient) {
    console.log('📈 SMART: Processing Investment Performance with intelligent extraction...');
    
    try {
        // Check initial page content size
        const initialPageInfo = await page.evaluate(() => ({
            scrollHeight: document.documentElement.scrollHeight,
            dataRows: document.querySelectorAll('table tbody tr').length
        }));
        
        console.log(`📊 Initial page: scrollHeight=${initialPageInfo.scrollHeight}, dataRows=${initialPageInfo.dataRows}`);
        
        // If page is too small, try 전체보기 or pagination
        if (initialPageInfo.scrollHeight < 3000 || initialPageInfo.dataRows < 20) {
            console.log('💡 SMART: Small page detected, trying to get more records...');
            
            // Try 전체보기 button first
            const viewAllSuccess = await try전체보기Button(page, config);
            
            if (viewAllSuccess) {
                console.log('✅ SMART: 전체보기 successful, checking new page size...');
                await sleep(3000);
                
                const newPageInfo = await page.evaluate(() => ({
                    scrollHeight: document.documentElement.scrollHeight,
                    dataRows: document.querySelectorAll('table tbody tr').length
                }));
                
                console.log(`📊 After 전체보기: scrollHeight=${newPageInfo.scrollHeight}, dataRows=${newPageInfo.dataRows}`);
            }
        }
        
        console.log('💡 SMART: Extracting records from current page...');
        
        // Extract ALL records from the table directly
        const records = await page.evaluate(() => {
            const data = [];
            
            // Try multiple table selectors
            const tableSelectors = [
                'table.table tbody tr',
                'table tbody tr', 
                'table tr',
                '.data-table tbody tr',
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
            
            console.log(`FIXED: Processing ${rows.length} total rows for investment_performance...`);
            
            rows.forEach((row, index) => {
                const cells = row.querySelectorAll('td');
                
                // Skip header rows or empty rows
                if (cells.length < 2 || row.querySelector('th')) {
                    return;
                }
                
                // Extract comprehensive record
                const record = {
                    company_name: cells[0]?.textContent?.trim() || '',
                    data_type: 'investment_performance',
                    extraction_method: 'FIXED_DIRECT_ALL_VISIBLE',
                    
                    // All cell contents for analysis
                    cell_data: Array.from(cells).map(cell => cell.textContent?.trim() || ''),
                    
                    // Primary investment fields (flexible mapping)
                    investment_amount: cells[1]?.textContent?.trim() || '',
                    fund_name: cells[2]?.textContent?.trim() || '',
                    investment_date: cells[3]?.textContent?.trim() || '',
                    investment_type: cells[4]?.textContent?.trim() || '',
                    
                    // Additional fields
                    field_5: cells[5]?.textContent?.trim() || '',
                    field_6: cells[6]?.textContent?.trim() || '',
                    field_7: cells[7]?.textContent?.trim() || '',
                    
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
            
            console.log(`FIXED: Successfully extracted ${data.length} investment records directly`);
            return data;
        });
        
        console.log(`📊 SMART: Extracted ${records.length} investment performance records (INTELLIGENT EXTRACTION)`);
        
        // Smart conflict resolution for Supabase
        let successCount = 0;
        let errorCount = 0;
        
        if (supabaseClient) {
            for (const record of records) {
                try {
                    const transformedRecord = transformInvestmentPerformanceForSupabase(record);
                    const { error } = await supabaseClient
                        .from('diva_investment_performance_raw')
                        .upsert(transformedRecord, { 
                            onConflict: 'company_name',
                            ignoreDuplicates: false 
                        });
                        
                    if (error) {
                        console.log(`⚠️ Supabase upsert warning:`, error.message);
                        errorCount++;
                    } else {
                        console.log(`✅ Successfully upserted investment performance record`);
                        successCount++;
                    }
                    
                } catch (error) {
                    console.log(`❌ Record processing error:`, error.message);
                    errorCount++;
                }
            }
        }
        
        // Final results
        const finalPageInfo = await page.evaluate(() => ({
            scrollHeight: document.documentElement.scrollHeight,
            dataRows: document.querySelectorAll('table tbody tr').length
        }));
        
        console.log(`📊 SMART RESULTS: ${records.length} records extracted from page with ${finalPageInfo.dataRows} visible rows`);
        console.log(`💡 SMART: ${records.length > 20 ? 'SUCCESS - Got substantial data!' : 'LIMITED - May need pagination fallback'}`);
        
        return { 
            records: records.length, 
            errors: errorCount,
            extraction_method: 'SMART_INTELLIGENT_EXTRACTION',
            view_all_attempted: true
        };
        
    } catch (error) {
        console.error('❌ SMART Investment Performance handler error:', error.message);
        return { records: 0, errors: 1 };
    }
}

/**
 * Transform Investment Performance data for Supabase (enhanced)
 */
function transformInvestmentPerformanceForSupabase(rawData) {
    return {
        // Core identification
        company_name: rawData.company_name?.trim() || 'Unknown Company',
        investment_date: parseEnhancedKoreanDate(rawData.investment_date),
        
        // Financial data (enhanced Korean parsing)
        investment_amount: parseEnhancedKoreanAmount(rawData.investment_amount),
        fund_name: rawData.fund_name?.trim() || 'Unknown Fund',
        investment_type: rawData.investment_type?.trim() || 'Unknown Type',
        
        // Portfolio company info
        portfolio_company: rawData.portfolio_company?.trim(),
        business_sector: rawData.business_sector?.trim(),
        investment_stage: rawData.investment_stage?.trim(),
        
        // Enhanced metadata
        raw_data: rawData,
        apify_source: 'DIVA_SCRAPER_V2.0_ENHANCED_KOREAN_PROCESSING',
        created_at: new Date().toISOString(),
        
        // Quality indicators
        data_quality_score: calculateDataQualityScore(rawData)
    };
}

/**
 * Enhanced Korean amount parsing (based on VCS success)
 */
function parseEnhancedKoreanAmount(text) {
    if (!text || typeof text !== 'string') return null;
    
    // Remove Korean currency indicators and whitespace
    let cleanText = text.replace(/[원,\s]/g, '').trim();
    
    // Handle Korean number units (억, 만, 천)
    if (cleanText.includes('억')) {
        const amount = parseFloat(cleanText.replace('억', ''));
        return Math.round(amount * 100000000); // Convert 억 to actual amount
    }
    
    if (cleanText.includes('만')) {
        const amount = parseFloat(cleanText.replace('만', ''));
        return Math.round(amount * 10000); // Convert 만 to actual amount
    }
    
    if (cleanText.includes('천')) {
        const amount = parseFloat(cleanText.replace('천', ''));
        return Math.round(amount * 1000); // Convert 천 to actual amount
    }
    
    // Handle regular numbers
    const number = parseFloat(cleanText.replace(/[^\d.]/g, ''));
    return isNaN(number) ? null : Math.round(number);
}

/**
 * Enhanced Korean date parsing
 */
function parseEnhancedKoreanDate(text) {
    if (!text || typeof text !== 'string') return null;
    
    // Common Korean date formats
    const dateFormats = [
        /(\d{4})[.-](\d{1,2})[.-](\d{1,2})/, // YYYY-MM-DD or YYYY.MM.DD
        /(\d{4})년\s*(\d{1,2})월\s*(\d{1,2})일/, // YYYY년 MM월 DD일
        /(\d{1,2})[.-](\d{1,2})[.-](\d{4})/ // MM-DD-YYYY or MM.DD.YYYY
    ];
    
    for (const format of dateFormats) {
        const match = text.match(format);
        if (match) {
            const [, year, month, day] = match;
            return `${year}-${month.padStart(2, '0')}-${day.padStart(2, '0')}`;
        }
    }
    
    return null;
}

/**
 * Calculate data quality score for records
 */
function calculateDataQualityScore(rawData) {
    let score = 0;
    const maxScore = 10;
    
    // Check for essential fields
    if (rawData.company_name && rawData.company_name.trim().length > 0) score += 3;
    if (rawData.investment_amount && rawData.investment_amount.length > 0) score += 2;
    if (rawData.investment_date && rawData.investment_date.length > 0) score += 2;
    if (rawData.fund_name && rawData.fund_name.length > 0) score += 1;
    if (rawData.investment_type && rawData.investment_type.length > 0) score += 1;
    if (rawData.cell_data && rawData.cell_data.length > 3) score += 1;
    
    return Math.round((score / maxScore) * 100);
}

// Placeholder handlers for other data sources
async function handleEnhancedFinancialStatements(page, config, supabaseClient) {
    console.log('📊 Processing Financial Statements (enhanced)...');
    const data = await extractGenericTableData(page, 'financial_statements');
    return await saveEnhancedDataToSupabase(data, 'diva_financial_statements_raw', supabaseClient);
}

async function handleEnhancedAssociationStatus(page, config, supabaseClient) {
    console.log('🏢 Processing Association Status (enhanced)...');
    const data = await extractGenericTableData(page, 'association_status');
    return await saveEnhancedDataToSupabase(data, 'diva_association_status_raw', supabaseClient);
}

async function handleEnhancedPersonnelStatus(page, config, supabaseClient) {
    console.log('👥 Processing Personnel Status (enhanced)...');
    const data = await extractGenericTableData(page, 'personnel_status');
    return await saveEnhancedDataToSupabase(data, 'diva_personnel_status_raw', supabaseClient);
}

async function handleEnhancedProfessionalPersonnel(page, config, supabaseClient) {
    console.log('👨‍💼 Processing Professional Personnel (enhanced)...');
    const data = await extractGenericTableData(page, 'professional_personnel');
    return await saveEnhancedDataToSupabase(data, 'diva_professional_personnel_raw', supabaseClient);
}

async function handleEnhancedViolations(page, config, supabaseClient) {
    console.log('⚖️ Processing Violations (enhanced)...');
    const data = await extractGenericTableData(page, 'violations');
    return await saveEnhancedDataToSupabase(data, 'diva_violations_raw', supabaseClient);
}

async function handleEnhancedVCMap(page, config, supabaseClient) {
    console.log('🗺️ Processing VC Map (enhanced)...');
    const data = await extractGenericTableData(page, 'vc_map');
    return await saveEnhancedDataToSupabase(data, 'diva_vc_map_raw', supabaseClient);
}

async function handleEnhancedStatistics(page, config, supabaseClient) {
    console.log('📈 Processing Statistics (enhanced)...');
    const data = await extractGenericTableData(page, 'statistics');
    return await saveEnhancedDataToSupabase(data, 'diva_statistics_raw', supabaseClient);
}

/**
 * Enhanced generic table extraction
 */
async function extractGenericTableData(page, dataType) {
    return await page.evaluate((dataType) => {
        const data = [];
        
        // Try multiple table selectors
        const tableSelectors = [
            'table tbody tr',
            'table tr',
            '.data-table tbody tr',
            'tbody tr',
            'tr'
        ];
        
        let rows = [];
        for (const selector of tableSelectors) {
            rows = document.querySelectorAll(selector);
            if (rows.length > 0) break;
        }
        
        rows.forEach((row, index) => {
            const cells = row.querySelectorAll('td');
            
            // Skip header rows or empty rows
            if (cells.length < 2 || row.querySelector('th')) return;
            
            const record = {
                data_type: dataType,
                extraction_method: 'ENHANCED_GENERIC_EXTRACTION',
                
                // Extract all cell data
                cell_data: Array.from(cells).map(cell => cell.textContent?.trim() || ''),
                
                // Try to identify main field (usually first column)
                primary_field: cells[0]?.textContent?.trim() || '',
                
                // Additional fields
                field_1: cells[1]?.textContent?.trim() || '',
                field_2: cells[2]?.textContent?.trim() || '',
                field_3: cells[3]?.textContent?.trim() || '',
                field_4: cells[4]?.textContent?.trim() || '',
                
                // Metadata
                extracted_at: new Date().toISOString(),
                source_url: window.location.href,
                row_index: index,
                total_cells: cells.length
            };
            
            // Include records with primary field
            if (record.primary_field && record.primary_field.length > 0) {
                data.push(record);
            }
        });
        
        return data;
    }, dataType);
}

/**
 * Enhanced Supabase save function
 */
async function saveEnhancedDataToSupabase(data, tableName, supabaseClient) {
    let successCount = 0;
    let errorCount = 0;
    
    if (supabaseClient && data.length > 0) {
        for (const record of data) {
            try {
                const transformedRecord = transformGenericForSupabase(record, tableName);
                const { error } = await supabaseClient
                    .from(tableName)
                    .upsert(transformedRecord, { 
                        onConflict: 'primary_field',
                        ignoreDuplicates: false 
                    });
                    
                if (error) {
                    console.log(`⚠️ Supabase upsert warning for ${tableName}:`, error.message);
                    errorCount++;
                } else {
                    console.log(`✅ Successfully upserted ${tableName} record`);
                    successCount++;
                }
                
            } catch (error) {
                console.log(`❌ Record processing error for ${tableName}:`, error.message);
                errorCount++;
            }
        }
    }
    
    console.log(`📊 ${tableName}: ${data.length} records extracted, ${successCount} saved`);
    
    return { 
        records: data.length, 
        errors: errorCount,
        extraction_method: 'ENHANCED_GENERIC'
    };
}

/**
 * Transform generic data for Supabase
 */
function transformGenericForSupabase(rawData, tableName) {
    return {
        // Core identification
        primary_field: rawData.primary_field?.trim() || 'Unknown',
        data_type: rawData.data_type,
        
        // Field data
        field_1: rawData.field_1?.trim(),
        field_2: rawData.field_2?.trim(),
        field_3: rawData.field_3?.trim(),
        field_4: rawData.field_4?.trim(),
        
        // Enhanced metadata
        raw_data: rawData,
        apify_source: 'DIVA_SCRAPER_V2.0_ENHANCED_PROCESSING',
        created_at: new Date().toISOString(),
        
        // Quality indicators
        data_quality_score: calculateDataQualityScore(rawData)
    };
}

/**
 * Save to Supabase table with enhanced error handling
 */
async function saveToSupabaseTable(supabaseClient, tableName, record) {
    try {
        const { data, error } = await supabaseClient
            .from(tableName)
            .upsert(record, { 
                onConflict: 'primary_field',
                ignoreDuplicates: false 
            });
            
        if (error) {
            console.log(`⚠️ Supabase error for ${tableName}:`, error.message);
            return { success: false, error: error.message };
        }
        
        console.log(`✅ Successfully inserted record into ${tableName}`);
        return { success: true, data };
        
    } catch (error) {
        console.error(`❌ Save error for ${tableName}:`, error.message);
        return { success: false, error: error.message };
    }
}

function sleep(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
}

/**
 * Smart 전체보기 (View All) button detection and clicking
 * TARGETED FIX for DIVA portal structure
 */
async function try전체보기Button(page, config) {
    console.log('🔍 TARGETED: Looking for 전체보기 button in DIVA portal...');
    
    try {
        // Wait for page to load completely
        await page.waitForSelector('table', { timeout: 30000 });
        await sleep(3000);
        
        // Strategy 1: Look in pagination areas specifically 
        console.log('🎯 Strategy 1: Searching in pagination areas...');
        const paginationSuccess = await page.evaluate(() => {
            // DIVA-specific pagination selectors
            const paginationSelectors = [
                '.pagination', '.paging', '.page-nav', '.page-area', '.page-wrap',
                '.btn-area', '.search-area', '.list-page', '.board-page',
                // Generic containers that might hold pagination
                'div', 'td', 'span'
            ];
            
            for (const selector of paginationSelectors) {
                const areas = document.querySelectorAll(selector);
                for (const area of areas) {
                    // Check if this area contains pagination-like content
                    const areaText = area.textContent || '';
                    if (areaText.includes('페이지') || areaText.includes('이전') || areaText.includes('다음')) {
                        console.log(`Found pagination area with selector: ${selector}`);
                        
                        // Look for 전체보기 in this area
                        const allElements = area.querySelectorAll('*');
                        for (const element of allElements) {
                            const text = element.textContent?.trim();
                            if (text === '전체보기' || text === '전체') {
                                console.log(`Found 전체보기 button: "${text}"`);
                                element.click();
                                return { success: true, method: 'pagination_area', text: text };
                            }
                        }
                    }
                }
            }
            return { success: false };
        });
        
        if (paginationSuccess.success) {
            console.log(`✅ 전체보기 clicked via pagination area!`);
            await sleep(5000); // Wait for content to load
            return true;
        }
        
        // Strategy 2: Direct text search across all clickable elements
        console.log('🎯 Strategy 2: Direct text search...');
        const textSearchSuccess = await page.evaluate(() => {
            const allElements = document.querySelectorAll('*');
            
            for (const element of allElements) {
                const text = element.textContent?.trim();
                
                // Exact match for 전체보기
                if (text === '전체보기') {
                    // Check if element is clickable (has onclick, is button/link, etc.)
                    const isClickable = element.tagName === 'BUTTON' || 
                                      element.tagName === 'A' || 
                                      element.tagName === 'INPUT' ||
                                      element.onclick ||
                                      element.style.cursor === 'pointer' ||
                                      window.getComputedStyle(element).cursor === 'pointer';
                    
                    if (isClickable) {
                        console.log(`Found clickable 전체보기: ${element.tagName}`);
                        element.click();
                        return { success: true, method: 'direct_text_search', element: element.tagName };
                    } else {
                        // Try parent elements
                        let parent = element.parentElement;
                        while (parent && parent !== document.body) {
                            if (parent.tagName === 'BUTTON' || parent.tagName === 'A' || parent.onclick) {
                                console.log(`Found 전체보기 in parent: ${parent.tagName}`);
                                parent.click();
                                return { success: true, method: 'parent_click', element: parent.tagName };
                            }
                            parent = parent.parentElement;
                        }
                    }
                }
            }
            return { success: false };
        });
        
        if (textSearchSuccess.success) {
            console.log(`✅ 전체보기 clicked via text search!`);
            await sleep(5000);
            return true;
        }
        
        // Strategy 3: Look for elements with 전체보기 as part of their content
        console.log('🎯 Strategy 3: Partial text matching...');
        const partialTextSuccess = await page.evaluate(() => {
            const searchTerms = ['전체보기', '전체', '모두보기', 'View All'];
            
            for (const term of searchTerms) {
                const elements = Array.from(document.querySelectorAll('button, a, input, span, div, td'));
                
                for (const element of elements) {
                    const text = element.textContent?.trim() || element.value || element.title || '';
                    
                    if (text.includes(term)) {
                        console.log(`Found element with "${term}": "${text}" (${element.tagName})`);
                        element.click();
                        return { success: true, method: 'partial_text', term: term, text: text };
                    }
                }
            }
            return { success: false };
        });
        
        if (partialTextSuccess.success) {
            console.log(`✅ 전체보기 clicked via partial text matching!`);
            await sleep(5000);
            return true;
        }
        
        // Strategy 4: Check for JavaScript function calls
        console.log('🎯 Strategy 4: JavaScript function calls...');
        const jsSuccess = await page.evaluate(() => {
            // Common function names for showing all records
            const functionNames = [
                'showAll', 'viewAll', 'allView', 'totalView', 'selectAll',
                'listAll', 'pageAll', 'goAllList', 'list', 'search'
            ];
            
            for (const funcName of functionNames) {
                if (typeof window[funcName] === 'function') {
                    console.log(`Found function: ${funcName}`);
                    try {
                        // Try calling with different parameters
                        if (funcName === 'list' && typeof window.list === 'function') {
                            window.list(1, 'Y'); // Common Korean portal pattern
                            return { success: true, method: 'js_function', function: funcName };
                        } else {
                            window[funcName]();
                            return { success: true, method: 'js_function', function: funcName };
                        }
                    } catch (e) {
                        console.log(`Failed to call ${funcName}: ${e.message}`);
                    }
                }
            }
            return { success: false };
        });
        
        if (jsSuccess.success) {
            console.log(`✅ 전체보기 triggered via JS function!`);
            await sleep(5000);
            return true;
        }
        
        // Strategy 5: Check for form elements (selects, inputs)
        console.log('🎯 Strategy 5: Form element checks...');
        const formSuccess = await page.evaluate(() => {
            // Look for select options with "all" or "전체"
            const selects = document.querySelectorAll('select');
            for (const select of selects) {
                const options = Array.from(select.options);
                const allOption = options.find(opt => 
                    opt.text.includes('전체') || 
                    opt.value.includes('all') || 
                    opt.value === '0' || 
                    opt.value === '999' ||
                    opt.value === 'Y'
                );
                
                if (allOption) {
                    console.log(`Found "all" option: ${allOption.text} (${allOption.value})`);
                    select.value = allOption.value;
                    
                    // Trigger change event
                    const event = new Event('change', { bubbles: true });
                    select.dispatchEvent(event);
                    
                    return { success: true, method: 'select_option', option: allOption.text };
                }
            }
            
            // Look for hidden inputs that might control page size
            const inputs = document.querySelectorAll('input[type="hidden"]');
            for (const input of inputs) {
                if (input.name && (input.name.includes('pageSize') || input.name.includes('TOTAL'))) {
                    console.log(`Found relevant hidden input: ${input.name} = ${input.value}`);
                    // Try setting it to show all
                    input.value = 'Y';
                    return { success: true, method: 'hidden_input', name: input.name };
                }
            }
            
            return { success: false };
        });
        
        if (formSuccess.success) {
            console.log(`✅ 전체보기 triggered via form element!`);
            await sleep(5000);
            return true;
        }
        
        console.log('⚠️ All 전체보기 strategies failed - will proceed with direct extraction');
        return false;
        
    } catch (error) {
        console.log('⚠️ Error in 전체보기 detection:', error.message);
        return false;
    }
}

/**
 * Smart pagination for DIVA portal
 */
async function smartPagination(page, config, dataSource, handler) {
    console.log(`📄 SMART: Starting pagination for ${dataSource}...`);
    
    const allRecords = [];
    let currentPage = 1;
    const maxPages = config.maxPages || 20;
    
    try {
        while (currentPage <= maxPages) {
            console.log(`📄 Processing page ${currentPage} for ${dataSource}...`);
            
            // Extract records from current page
            const pageRecords = await handler(page);
            if (pageRecords.length === 0) {
                console.log(`📄 No records found on page ${currentPage}, stopping pagination`);
                break;
            }
            
            allRecords.push(...pageRecords);
            console.log(`📄 Page ${currentPage}: ${pageRecords.length} records (total: ${allRecords.length})`);
            
            // Look for next page button
            const nextButton = await page.evaluate(() => {
                // Try multiple next button selectors
                const selectors = [
                    'a[href*="page"]:contains("다음")',
                    'a[href*="page"]:contains("Next")', 
                    '.pagination a:contains("다음")',
                    '.pagination a:contains(">")',
                    'button:contains("다음")',
                    'input[value*="다음"]'
                ];
                
                for (const selector of selectors) {
                    const elements = document.querySelectorAll('a, button, input');
                    for (const el of elements) {
                        const text = el.textContent || el.value || '';
                        const href = el.href || '';
                        if ((text.includes('다음') || text.includes('Next') || text === '>') && 
                            !el.disabled && !el.classList.contains('disabled') &&
                            (href.includes('page') || el.onclick)) {
                            return el;
                        }
                    }
                }
                return null;
            });
            
            if (!nextButton) {
                console.log(`📄 No next button found on page ${currentPage}, stopping pagination`);
                break;
            }
            
            // Click next button
            await nextButton.click();
            await sleep(3000); // Wait for page load
            currentPage++;
            
            // Safety check: if page doesn't change, break
            const newPageInfo = await page.evaluate(() => ({
                url: window.location.href,
                scrollHeight: document.documentElement.scrollHeight
            }));
            
            // If we've been on the same page for too long, break
            if (currentPage > 10 && allRecords.length < currentPage * 2) {
                console.log(`📄 Pagination seems stuck, breaking after ${currentPage} pages`);
                break;
            }
        }
        
        console.log(`📄 Pagination completed: ${allRecords.length} total records from ${currentPage-1} pages`);
        return allRecords;
        
    } catch (error) {
        console.error(`❌ Pagination error for ${dataSource}:`, error.message);
        return allRecords; // Return what we have so far
    }
}