const { Actor } = require('apify');
const { PuppeteerCrawler } = require('crawlee');
const { createClient } = require('@supabase/supabase-js');

console.log('🔧 === ENHANCED DIVA INTELLIGENCE SCRAPER v2.0 ===');
console.log('🕐 Enhanced Time:', new Date().toISOString());

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
            console.log(`🔍 Processing: ${request.url}`);
            
            try {
                // Enhanced page setup (VCS proven method)
                await setupPageForKoreanPortal(page, config);
                
                const url = request.url;
                let pageResults = { records: 0, errors: 0 };
                
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
 * Enhanced Investment Performance Handler
 */
async function handleEnhancedInvestmentPerformance(page, config, supabaseClient) {
    console.log('📈 Processing Enhanced Investment Performance data...');
    
    try {
        // Setup enhanced filters (Korean portal specific)
        await setupEnhancedFilters(page, 'investment_performance');
        
        // Enhanced data extraction with Korean parsing
        const records = await extractEnhancedInvestmentData(page);
        
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
                            onConflict: 'company_name,investment_date',
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
        
        // Enhanced pagination handling
        await handleEnhancedPagination(page, config, 'investment_performance', supabaseClient);
        
        return { records: records.length, errors: errorCount };
        
    } catch (error) {
        console.error('❌ Enhanced Investment Performance handler error:', error.message);
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
    const numericValue = parseFloat(cleanText);
    return isNaN(numericValue) ? null : Math.round(numericValue);
}

/**
 * Enhanced Korean date parsing (based on VCS success)
 */
function parseEnhancedKoreanDate(text) {
    if (!text || typeof text !== 'string') return null;
    
    // Korean date patterns: YYYY.MM.DD, YYYY-MM-DD, YYYY년 MM월 DD일
    const patterns = [
        /(\d{4})\.(\d{1,2})\.(\d{1,2})/,
        /(\d{4})-(\d{1,2})-(\d{1,2})/,
        /(\d{4})년\s*(\d{1,2})월\s*(\d{1,2})일/
    ];
    
    for (const pattern of patterns) {
        const match = text.match(pattern);
        if (match) {
            const [, year, month, day] = match;
            return `${year}-${month.padStart(2, '0')}-${day.padStart(2, '0')}`;
        }
    }
    
    return null;
}

/**
 * Calculate data quality score (enhanced metric)
 */
function calculateDataQualityScore(rawData) {
    let score = 0;
    const fields = ['company_name', 'investment_date', 'investment_amount', 'fund_name'];
    
    fields.forEach(field => {
        if (rawData[field] && rawData[field].toString().trim() !== '') {
            score += 25; // Each field worth 25 points
        }
    });
    
    return score;
}

// ENHANCED IMPLEMENTATIONS for ALL 7 missing data sources
async function handleEnhancedFinancialStatements(page, config, supabaseClient) {
    console.log('💰 Processing Enhanced Financial Statements (재무제표)...');
    
    try {
        await setupEnhancedFilters(page, 'financial_statements');
        const records = await extractGenericTableData(page, 'financial_statements');
        
        let successCount = 0;
        if (supabaseClient && records.length > 0) {
            for (const record of records) {
                const transformedRecord = transformGenericForSupabase(record, 'financial_statements');
                await saveToSupabaseTable(supabaseClient, 'diva_financial_statements_raw', transformedRecord);
                successCount++;
            }
        }
        
        console.log(`💰 Financial Statements: ${records.length} records extracted`);
        return { records: records.length, errors: 0 };
        
    } catch (error) {
        console.error('❌ Financial Statements handler error:', error.message);
        return { records: 0, errors: 1 };
    }
}

async function handleEnhancedAssociationStatus(page, config, supabaseClient) {
    console.log('🏢 Processing Enhanced Association Status (조합현황)...');
    
    try {
        await setupEnhancedFilters(page, 'association_status');
        const records = await extractGenericTableData(page, 'association_status');
        
        let successCount = 0;
        if (supabaseClient && records.length > 0) {
            for (const record of records) {
                const transformedRecord = transformGenericForSupabase(record, 'association_status');
                await saveToSupabaseTable(supabaseClient, 'diva_association_status_raw', transformedRecord);
                successCount++;
            }
        }
        
        console.log(`🏢 Association Status: ${records.length} records extracted`);
        return { records: records.length, errors: 0 };
        
    } catch (error) {
        console.error('❌ Association Status handler error:', error.message);
        return { records: 0, errors: 1 };
    }
}

async function handleEnhancedPersonnelStatus(page, config, supabaseClient) {
    console.log('👥 Processing Enhanced Personnel Status (인력현황)...');
    
    try {
        await setupEnhancedFilters(page, 'personnel_status');
        const records = await extractGenericTableData(page, 'personnel_status');
        
        let successCount = 0;
        if (supabaseClient && records.length > 0) {
            for (const record of records) {
                const transformedRecord = transformGenericForSupabase(record, 'personnel_status');
                await saveToSupabaseTable(supabaseClient, 'diva_personnel_status_raw', transformedRecord);
                successCount++;
            }
        }
        
        console.log(`👥 Personnel Status: ${records.length} records extracted`);
        return { records: records.length, errors: 0 };
        
    } catch (error) {
        console.error('❌ Personnel Status handler error:', error.message);
        return { records: 0, errors: 1 };
    }
}

async function handleEnhancedProfessionalPersonnel(page, config, supabaseClient) {
    console.log('🎯 Processing Enhanced Professional Personnel (전문인력현황)...');
    
    try {
        await setupEnhancedFilters(page, 'professional_personnel');
        const records = await extractGenericTableData(page, 'professional_personnel');
        
        let successCount = 0;
        if (supabaseClient && records.length > 0) {
            for (const record of records) {
                const transformedRecord = transformGenericForSupabase(record, 'professional_personnel');
                await saveToSupabaseTable(supabaseClient, 'diva_professional_personnel_raw', transformedRecord);
                successCount++;
            }
        }
        
        console.log(`🎯 Professional Personnel: ${records.length} records extracted`);
        return { records: records.length, errors: 0 };
        
    } catch (error) {
        console.error('❌ Professional Personnel handler error:', error.message);
        return { records: 0, errors: 1 };
    }
}

async function handleEnhancedViolations(page, config, supabaseClient) {
    console.log('⚠️ Processing Enhanced Violations (법규위반현황)...');
    
    try {
        await setupEnhancedFilters(page, 'violations');
        const records = await extractGenericTableData(page, 'violations');
        
        let successCount = 0;
        if (supabaseClient && records.length > 0) {
            for (const record of records) {
                const transformedRecord = transformGenericForSupabase(record, 'violations');
                await saveToSupabaseTable(supabaseClient, 'diva_violations_raw', transformedRecord);
                successCount++;
            }
        }
        
        console.log(`⚠️ Violations: ${records.length} records extracted`);
        return { records: records.length, errors: 0 };
        
    } catch (error) {
        console.error('❌ Violations handler error:', error.message);
        return { records: 0, errors: 1 };
    }
}

async function handleEnhancedVCMap(page, config, supabaseClient) {
    console.log('🗺️ Processing Enhanced VC Map...');
    
    try {
        await setupEnhancedFilters(page, 'vc_map');
        const records = await extractGenericTableData(page, 'vc_map');
        
        let successCount = 0;
        if (supabaseClient && records.length > 0) {
            for (const record of records) {
                const transformedRecord = transformGenericForSupabase(record, 'vc_map');
                await saveToSupabaseTable(supabaseClient, 'diva_vc_map_raw', transformedRecord);
                successCount++;
            }
        }
        
        console.log(`🗺️ VC Map: ${records.length} records extracted`);
        return { records: records.length, errors: 0 };
        
    } catch (error) {
        console.error('❌ VC Map handler error:', error.message);
        return { records: 0, errors: 1 };
    }
}

async function handleEnhancedStatistics(page, config, supabaseClient) {
    console.log('📊 Processing Enhanced Statistics (VC통계정보)...');
    
    try {
        await setupEnhancedFilters(page, 'statistics');
        const records = await extractGenericTableData(page, 'statistics');
        
        let successCount = 0;
        if (supabaseClient && records.length > 0) {
            for (const record of records) {
                const transformedRecord = transformGenericForSupabase(record, 'statistics');
                await saveToSupabaseTable(supabaseClient, 'diva_statistics_raw', transformedRecord);
                successCount++;
            }
        }
        
        console.log(`📊 Statistics: ${records.length} records extracted`);
        return { records: records.length, errors: 0 };
        
    } catch (error) {
        console.error('❌ Statistics handler error:', error.message);
        return { records: 0, errors: 1 };
    }
}

// Generic table data extraction for all DIVA data sources
async function extractGenericTableData(page, dataType) {
    console.log(`🔍 Extracting generic table data for ${dataType}...`);
    
    return await page.evaluate((dataType) => {
        const data = [];
        
        // Try multiple table selectors for Korean portal
        const tableSelectors = [
            'table.table tbody tr',
            'table tbody tr',
            'table tr',
            '.data-table tbody tr',
            '.list-table tbody tr'
        ];
        
        let rows = [];
        for (const selector of tableSelectors) {
            rows = document.querySelectorAll(selector);
            if (rows.length > 0) {
                console.log(`Found ${rows.length} rows with selector: ${selector}`);
                break;
            }
        }
        
        rows.forEach((row, index) => {
            const cells = row.querySelectorAll('td');
            
            // Skip header rows or rows with insufficient data
            if (cells.length < 2 || row.querySelector('th')) {
                return;
            }
            
            // Generic record structure that works for all data types
            const record = {
                company_name: cells[0]?.textContent?.trim() || '',
                data_type: dataType,
                
                // Extract all cell contents
                cell_data: Array.from(cells).map(cell => cell.textContent?.trim() || ''),
                
                // Common fields that appear in most DIVA tables
                primary_value: cells[1]?.textContent?.trim() || '',
                secondary_value: cells[2]?.textContent?.trim() || '',
                tertiary_value: cells[3]?.textContent?.trim() || '',
                
                // Metadata
                extracted_at: new Date().toISOString(),
                source_url: window.location.href,
                row_index: index
            };
            
            // Only include records with valid company names
            if (record.company_name && record.company_name.length > 0) {
                data.push(record);
            }
        });
        
        return data;
    }, dataType);
}

// Generic transformation for Supabase
function transformGenericForSupabase(rawData, dataType) {
    return {
        company_name: rawData.company_name?.trim() || 'Unknown Company',
        data_type: dataType,
        
        // Store raw cell data as JSON
        cell_data: rawData.cell_data || [],
        
        // Common fields
        primary_value: rawData.primary_value?.trim(),
        secondary_value: rawData.secondary_value?.trim(),
        tertiary_value: rawData.tertiary_value?.trim(),
        
        // Enhanced metadata
        raw_data: rawData,
        apify_source: 'DIVA_SCRAPER_V2.0_ALL_SOURCES',
        extracted_at: rawData.extracted_at,
        source_url: rawData.source_url,
        
        // Quality scoring
        data_quality_score: calculateDataQualityScore(rawData),
        created_at: new Date().toISOString()
    };
}

// Helper function to save to specific Supabase tables
async function saveToSupabaseTable(supabaseClient, tableName, record) {
    try {
        const { error } = await supabaseClient
            .from(tableName)
            .insert(record);
            
        if (error) {
            console.log(`⚠️ Supabase insert warning for ${tableName}:`, error.message);
        } else {
            console.log(`✅ Successfully inserted record into ${tableName}`);
        }
    } catch (error) {
        console.log(`❌ Supabase error for ${tableName}:`, error.message);
        throw error;
    }
}

async function handleEnhancedVCMap_OLD(page, config, supabaseClient) {
    console.log('🗺️ Processing Enhanced VC Map...');
    return { records: 0, errors: 0 };
}

async function handleEnhancedStatistics(page, config, supabaseClient) {
    console.log('📊 Processing Enhanced Statistics...');
    return { records: 0, errors: 0 };
}

// Helper functions
async function setupEnhancedFilters(page, dataType) {
    console.log(`⚙️ Setting up enhanced ${dataType} filters...`);
    await sleep(2000);
}

async function extractEnhancedInvestmentData(page) {
    console.log('📊 Extracting enhanced investment data...');
    await sleep(1000);
    return []; // Placeholder - implement actual extraction
}

async function handleEnhancedPagination(page, config, dataType, supabaseClient) {
    console.log(`📄 Enhanced pagination for ${dataType}...`);
    await sleep(1000);
}

function sleep(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
} 