const { Actor } = require('apify');
const { PuppeteerCrawler } = require('crawlee');
const { createClient } = require('@supabase/supabase-js');

/**
 * 🇰🇷 Comprehensive DIVA Intelligence Scraper
 * Scrapes all DIVA data sources for complete Korean VC intelligence
 * 
 * Data Sources:
 * - 투자실적 (Investment Performance)
 * - 재무제표 (Financial Statements)
 * - 조합현황 (Fund Status)
 * - 인력현황 (Personnel Status)
 * - 전문인력현황 (Professional Personnel)
 * - 법규위반현황 (Regulatory Violations)
 * - VC MAP
 * - 통계정보 (Statistics PDFs)
 */

Actor.main(async () => {
    console.log('🚀 Starting Comprehensive DIVA Intelligence Scraper...');
    
    const input = await Actor.getInput();
    
    // Configuration
    const config = {
        maxPages: input.maxPages || 50,
        delay: input.delay || 2000,
        baseUrl: 'http://diva.kvca.or.kr',
        dataSource: input.dataSource || 'all',
        includeStatisticsPDFs: input.includeStatisticsPDFs !== false,
        
        // Supabase configuration
        supabaseUrl: process.env.SUPABASE_URL || input.supabaseUrl,
        supabaseKey: process.env.SUPABASE_KEY || input.supabaseKey,
        exportToSupabase: input.exportToSupabase !== false,
        
        // Data source URLs
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
    
    console.log('📋 Scraper Configuration:', {
        dataSource: config.dataSource,
        maxPages: config.maxPages,
        exportToSupabase: config.exportToSupabase,
        includeStatisticsPDFs: config.includeStatisticsPDFs
    });
    
    // Initialize Supabase client
    let supabase = null;
    if (config.exportToSupabase && config.supabaseUrl && config.supabaseKey) {
        supabase = createClient(config.supabaseUrl, config.supabaseKey);
        console.log('✅ Supabase client initialized');
    } else {
        console.log('⚠️ Supabase export disabled - missing credentials');
    }
    
    // Setup crawler
    const crawler = new PuppeteerCrawler({
        launchContext: {
            launchOptions: {
                headless: input.headless !== false,
                args: [
                    '--no-sandbox',
                    '--disable-setuid-sandbox',
                    '--disable-dev-shm-usage',
                    '--lang=ko-KR,ko,en-US,en',
                    '--accept-lang=ko-KR,ko,en-US,en'
                ]
            }
        },
        
        requestHandlerTimeoutSecs: 300,
        
        handlePageFunction: async ({ page, request }) => {
            console.log(`🔍 Processing: ${request.url}`);
            
            try {
                await page.waitForSelector('body', { timeout: 30000 });
                await page.waitForTimeout(config.delay);
                
                const url = request.url;
                const userData = request.userData;
                
                // Route to appropriate handler based on URL
                if (url.includes('DivItmInvstPrfmInq')) {
                    await handleInvestmentPerformance(page, config, supabase);
                } else if (url.includes('DivItmFsInq')) {
                    await handleFinancialStatements(page, config, supabase);
                } else if (url.includes('DivItmAssoInq')) {
                    await handleAssociationStatus(page, config, supabase);
                } else if (url.includes('DivItmMnpwrInq')) {
                    await handlePersonnelStatus(page, config, supabase);
                } else if (url.includes('DivItmProfsInq')) {
                    await handleProfessionalPersonnel(page, config, supabase);
                } else if (url.includes('DivItmViolInq')) {
                    await handleViolations(page, config, supabase);
                } else if (url.includes('DivItmVcmapInq')) {
                    await handleVCMap(page, config, supabase);
                } else if (url.includes('DivStatsMainInq')) {
                    await handleStatisticsPDFs(page, config, supabase);
                } else {
                    console.log(`⚠️ Unknown page type: ${url}`);
                }
                
            } catch (error) {
                console.error(`❌ Error processing ${request.url}:`, error.message);
                throw error;
            }
        },
        
        handleFailedRequestFunction: async ({ request }) => {
            console.error(`🚫 Request failed: ${request.url}`);
        }
    });
    
    // Determine which data sources to scrape
    const dataSources = getDataSourcesToScrape(config.dataSource, config.urls);
    console.log(`📊 Scraping ${dataSources.length} data sources:`, dataSources.map(ds => ds.name));
    
    // Queue initial requests
    const requests = dataSources.map(ds => ({
        url: ds.url,
        userData: { dataSource: ds.name, pageType: 'main' }
    }));
    
    await crawler.run(requests);
    
    console.log('✅ Comprehensive DIVA Intelligence Scraper completed!');
});

/**
 * Get data sources based on configuration
 */
function getDataSourcesToScrape(dataSource, urls) {
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
    } else if (Array.isArray(dataSource)) {
        return allSources.filter(source => dataSource.includes(source.name));
    } else {
        return allSources.filter(source => source.name === dataSource);
    }
}

/**
 * Handle Investment Performance (투자실적)
 */
async function handleInvestmentPerformance(page, config, supabase) {
    console.log('📈 Processing Investment Performance data...');
    
    try {
        // Wait for search form and set "전체보기" filters
        await setupAllFilters(page);
        
        // Extract investment performance data
        const performanceData = await page.evaluate(() => {
            const data = [];
            const rows = document.querySelectorAll('table tbody tr');
            
            rows.forEach((row, index) => {
                const cells = row.querySelectorAll('td');
                if (cells.length >= 8) {
                    data.push({
                        companyName: cells[0]?.textContent?.trim(),
                        portfolioCompany: cells[1]?.textContent?.trim(),
                        investmentAmount: cells[2]?.textContent?.trim(),
                        investmentDate: cells[3]?.textContent?.trim(),
                        currentStatus: cells[4]?.textContent?.trim(),
                        exitAmount: cells[5]?.textContent?.trim(),
                        exitDate: cells[6]?.textContent?.trim(),
                        investmentReturn: cells[7]?.textContent?.trim(),
                        rowIndex: index
                    });
                }
            });
            
            return data;
        });
        
        console.log(`📊 Extracted ${performanceData.length} investment performance records`);
        
        // Process and save data
        for (const record of performanceData) {
            const processedRecord = {
                company_name: record.companyName,
                portfolio_company: record.portfolioCompany,
                investment_amount: parseKoreanAmount(record.investmentAmount),
                investment_date: parseKoreanDate(record.investmentDate),
                current_status: record.currentStatus,
                exit_amount: parseKoreanAmount(record.exitAmount),
                exit_date: parseKoreanDate(record.exitDate),
                investment_return_amount: parseKoreanAmount(record.investmentReturn),
                extracted_at: new Date().toISOString(),
                source_url: page.url()
            };
            
            // Save to Apify dataset
            await Actor.pushData({
                ...processedRecord,
                dataType: 'investment_performance'
            });
            
            // Save to Supabase
            if (supabase) {
                await saveToSupabase(supabase, 'diva_investment_performance_raw', processedRecord);
            }
        }
        
        // Handle pagination for first page only to prevent recursion
        if (page.url().includes('page=1') || !page.url().includes('page=')) {
            await handlePaginationWrapper(page, config, 'investment_performance', supabase);
        }
        
    } catch (error) {
        console.error('❌ Error in investment performance handling:', error);
    }
}

/**
 * Handle Financial Statements (재무제표)
 */
async function handleFinancialStatements(page, config, supabase) {
    console.log('💰 Processing Financial Statements data...');
    
    try {
        await setupAllFilters(page);
        
        const financialData = await page.evaluate(() => {
            const data = [];
            const rows = document.querySelectorAll('table tbody tr');
            
            rows.forEach((row, index) => {
                const cells = row.querySelectorAll('td');
                if (cells.length >= 10) {
                    data.push({
                        companyName: cells[0]?.textContent?.trim(),
                        fiscalYear: cells[1]?.textContent?.trim(),
                        accountingStandard: cells[2]?.textContent?.trim(),
                        totalAssets: cells[3]?.textContent?.trim(),
                        totalLiabilities: cells[4]?.textContent?.trim(),
                        totalEquity: cells[5]?.textContent?.trim(),
                        operatingRevenue: cells[6]?.textContent?.trim(),
                        operatingProfit: cells[7]?.textContent?.trim(),
                        netIncome: cells[8]?.textContent?.trim(),
                        startupInvestmentAssets: cells[9]?.textContent?.trim(),
                        rowIndex: index
                    });
                }
            });
            
            return data;
        });
        
        console.log(`💰 Extracted ${financialData.length} financial records`);
        
        for (const record of financialData) {
            const processedRecord = {
                company_name: record.companyName,
                fiscal_year: parseInt(record.fiscalYear),
                accounting_standard: record.accountingStandard,
                total_assets: parseKoreanAmount(record.totalAssets),
                total_liabilities: parseKoreanAmount(record.totalLiabilities),
                total_equity: parseKoreanAmount(record.totalEquity),
                operating_revenue: parseKoreanAmount(record.operatingRevenue),
                operating_profit: parseKoreanAmount(record.operatingProfit),
                net_income: parseKoreanAmount(record.netIncome),
                startup_investment_assets: parseKoreanAmount(record.startupInvestmentAssets),
                extracted_at: new Date().toISOString(),
                source_url: page.url()
            };
            
            await Actor.pushData({
                ...processedRecord,
                dataType: 'financial_statements'
            });
            
            if (supabase) {
                await saveToSupabase(supabase, 'diva_financial_raw', processedRecord);
            }
        }
        
        if (page.url().includes('page=1') || !page.url().includes('page=')) {
            await handlePaginationWrapper(page, config, 'financial_statements', supabase);
        }
        
    } catch (error) {
        console.error('❌ Error in financial statements handling:', error);
    }
}

/**
 * Handle Personnel Status (인력현황)
 */
async function handlePersonnelStatus(page, config, supabase) {
    console.log('👥 Processing Personnel Status data...');
    
    try {
        await setupAllFilters(page);
        
        const personnelData = await page.evaluate(() => {
            const data = [];
            const rows = document.querySelectorAll('table tbody tr');
            
            rows.forEach((row, index) => {
                const cells = row.querySelectorAll('td');
                if (cells.length >= 6) {
                    data.push({
                        companyName: cells[0]?.textContent?.trim(),
                        totalPersonnel: cells[1]?.textContent?.trim(),
                        professionalStaff: cells[2]?.textContent?.trim(),
                        investmentReviewStaff: cells[3]?.textContent?.trim(),
                        managementStaff: cells[4]?.textContent?.trim(),
                        referenceMonth: cells[5]?.textContent?.trim(),
                        rowIndex: index
                    });
                }
            });
            
            return data;
        });
        
        console.log(`👥 Extracted ${personnelData.length} personnel records`);
        
        for (const record of personnelData) {
            const processedRecord = {
                company_name: record.companyName,
                total_personnel: parseInt(record.totalPersonnel) || 0,
                professional_staff: parseInt(record.professionalStaff) || 0,
                investment_review_staff: parseInt(record.investmentReviewStaff) || 0,
                management_staff: parseInt(record.managementStaff) || 0,
                reference_year_month: record.referenceMonth,
                extracted_at: new Date().toISOString(),
                source_url: page.url()
            };
            
            await Actor.pushData({
                ...processedRecord,
                dataType: 'personnel_status'
            });
            
            if (supabase) {
                await saveToSupabase(supabase, 'diva_personnel_raw', processedRecord);
            }
        }
        
        if (page.url().includes('page=1') || !page.url().includes('page=')) {
            await handlePaginationWrapper(page, config, 'personnel_status', supabase);
        }
        
    } catch (error) {
        console.error('❌ Error in personnel status handling:', error);
    }
}

/**
 * Handle Professional Personnel (전문인력현황)
 */
async function handleProfessionalPersonnel(page, config, supabase) {
    console.log('🎓 Processing Professional Personnel data...');
    
    try {
        await setupAllFilters(page);
        
        const professionalData = await page.evaluate(() => {
            const data = [];
            const rows = document.querySelectorAll('table tbody tr');
            
            rows.forEach((row, index) => {
                const cells = row.querySelectorAll('td');
                if (cells.length >= 5) {
                    data.push({
                        companyName: cells[0]?.textContent?.trim(),
                        professionalName: cells[1]?.textContent?.trim(),
                        position: cells[2]?.textContent?.trim(),
                        experience: cells[3]?.textContent?.trim(),
                        specialization: cells[4]?.textContent?.trim(),
                        rowIndex: index
                    });
                }
            });
            
            return data;
        });
        
        console.log(`🎓 Extracted ${professionalData.length} professional personnel records`);
        
        for (const record of professionalData) {
            const processedRecord = {
                company_name: record.companyName,
                professional_name: record.professionalName,
                position: record.position,
                experience: record.experience,
                specialization: record.specialization,
                extracted_at: new Date().toISOString(),
                source_url: page.url()
            };
            
            await Actor.pushData({
                ...processedRecord,
                dataType: 'professional_personnel'
            });
            
            if (supabase) {
                await saveToSupabase(supabase, 'diva_professional_raw', processedRecord);
            }
        }
        
        if (page.url().includes('page=1') || !page.url().includes('page=')) {
            await handlePaginationWrapper(page, config, 'professional_personnel', supabase);
        }
        
    } catch (error) {
        console.error('❌ Error in professional personnel handling:', error);
    }
}

/**
 * Handle Association Status (조합현황)
 */
async function handleAssociationStatus(page, config, supabase) {
    console.log('🏛️ Processing Association Status data...');
    
    try {
        await setupAllFilters(page);
        
        const associationData = await page.evaluate(() => {
            const data = [];
            const rows = document.querySelectorAll('table tbody tr');
            
            rows.forEach((row, index) => {
                const cells = row.querySelectorAll('td');
                if (cells.length >= 8) {
                    data.push({
                        companyName: cells[0]?.textContent?.trim(),
                        fundName: cells[1]?.textContent?.trim(),
                        totalCommitment: cells[2]?.textContent?.trim(),
                        calledAmount: cells[3]?.textContent?.trim(),
                        establishmentDate: cells[4]?.textContent?.trim(),
                        fundDuration: cells[5]?.textContent?.trim(),
                        fundStatus: cells[6]?.textContent?.trim(),
                        investmentFocus: cells[7]?.textContent?.trim(),
                        rowIndex: index
                    });
                }
            });
            
            return data;
        });
        
        console.log(`🏛️ Extracted ${associationData.length} association records`);
        
        for (const record of associationData) {
            const processedRecord = {
                company_name: record.companyName,
                fund_name: record.fundName,
                total_commitment: parseKoreanAmount(record.totalCommitment),
                called_amount: parseKoreanAmount(record.calledAmount),
                establishment_date: parseKoreanDate(record.establishmentDate),
                fund_duration_years: parseInt(record.fundDuration) || null,
                fund_status: record.fundStatus,
                investment_focus: record.investmentFocus,
                extracted_at: new Date().toISOString(),
                source_url: page.url()
            };
            
            await Actor.pushData({
                ...processedRecord,
                dataType: 'association_status'
            });
            
            if (supabase) {
                await saveToSupabase(supabase, 'diva_association_raw', processedRecord);
            }
        }
        
        if (page.url().includes('page=1') || !page.url().includes('page=')) {
            await handlePaginationWrapper(page, config, 'association_status', supabase);
        }
        
    } catch (error) {
        console.error('❌ Error in association status handling:', error);
    }
}

/**
 * Handle Violations (법규위반현황)
 */
async function handleViolations(page, config, supabase) {
    console.log('⚖️ Processing Violations data...');
    
    try {
        await setupAllFilters(page);
        
        const violationData = await page.evaluate(() => {
            const data = [];
            const rows = document.querySelectorAll('table tbody tr');
            
            rows.forEach((row, index) => {
                const cells = row.querySelectorAll('td');
                if (cells.length >= 7) {
                    data.push({
                        companyName: cells[0]?.textContent?.trim(),
                        violationDate: cells[1]?.textContent?.trim(),
                        violationType: cells[2]?.textContent?.trim(),
                        violationDetails: cells[3]?.textContent?.trim(),
                        penaltyType: cells[4]?.textContent?.trim(),
                        penaltyAmount: cells[5]?.textContent?.trim(),
                        resolutionStatus: cells[6]?.textContent?.trim(),
                        rowIndex: index
                    });
                }
            });
            
            return data;
        });
        
        console.log(`⚖️ Extracted ${violationData.length} violation records`);
        
        for (const record of violationData) {
            const processedRecord = {
                company_name: record.companyName,
                violation_date: parseKoreanDate(record.violationDate),
                violation_type: record.violationType,
                violation_details: record.violationDetails,
                penalty_type: record.penaltyType,
                penalty_amount: parseKoreanAmount(record.penaltyAmount),
                resolution_status: record.resolutionStatus,
                extracted_at: new Date().toISOString(),
                source_url: page.url()
            };
            
            await Actor.pushData({
                ...processedRecord,
                dataType: 'violations'
            });
            
            if (supabase) {
                await saveToSupabase(supabase, 'diva_violation_raw', processedRecord);
            }
        }
        
        if (page.url().includes('page=1') || !page.url().includes('page=')) {
            await handlePaginationWrapper(page, config, 'violations', supabase);
        }
        
    } catch (error) {
        console.error('❌ Error in violations handling:', error);
    }
}

/**
 * Handle VC MAP
 */
async function handleVCMap(page, config, supabase) {
    console.log('🗺️ Processing VC MAP data...');
    
    try {
        await setupAllFilters(page);
        
        const vcMapData = await page.evaluate(() => {
            const data = [];
            const rows = document.querySelectorAll('table tbody tr');
            
            rows.forEach((row, index) => {
                const cells = row.querySelectorAll('td');
                if (cells.length >= 5) {
                    data.push({
                        companyName: cells[0]?.textContent?.trim(),
                        mapType: cells[1]?.textContent?.trim(),
                        dataValue: cells[2]?.textContent?.trim(),
                        referenceDate: cells[3]?.textContent?.trim(),
                        notes: cells[4]?.textContent?.trim(),
                        rowIndex: index
                    });
                }
            });
            
            return data;
        });
        
        console.log(`🗺️ Extracted ${vcMapData.length} VC MAP records`);
        
        for (const record of vcMapData) {
            const processedRecord = {
                company_name: record.companyName,
                map_type: record.mapType,
                data_value: record.dataValue,
                reference_date: parseKoreanDate(record.referenceDate),
                notes: record.notes,
                extracted_at: new Date().toISOString(),
                source_url: page.url()
            };
            
            await Actor.pushData({
                ...processedRecord,
                dataType: 'vc_map'
            });
            
            if (supabase) {
                // Use existing vc_map table
                await saveToSupabase(supabase, 'vc_map', processedRecord);
            }
        }
        
        if (page.url().includes('page=1') || !page.url().includes('page=')) {
            await handlePaginationWrapper(page, config, 'vc_map', supabase);
        }
        
    } catch (error) {
        console.error('❌ Error in VC MAP handling:', error);
    }
}

/**
 * Handle Statistics PDFs (통계정보)
 */
async function handleStatisticsPDFs(page, config, supabase) {
    console.log('📊 Processing Statistics PDFs...');
    
    try {
        // Look for PDF download links
        const pdfLinks = await page.evaluate(() => {
            const links = [];
            const pdfElements = document.querySelectorAll('a[href*=".pdf"], a[href*="download"]');
            
            pdfElements.forEach((link, index) => {
                const href = link.href;
                const title = link.textContent.trim() || link.title || `PDF ${index + 1}`;
                
                if (href && href.includes('.pdf')) {
                    links.push({
                        title: title,
                        url: href,
                        downloadDate: new Date().toISOString()
                    });
                }
            });
            
            return links;
        });
        
        console.log(`📊 Found ${pdfLinks.length} PDF documents`);
        
        // Save PDF metadata
        for (const pdf of pdfLinks) {
            await Actor.pushData({
                ...pdf,
                dataType: 'statistics_pdf'
            });
            
            // Optionally download PDFs to Apify key-value store
            if (config.includeStatisticsPDFs) {
                try {
                    const response = await page.goto(pdf.url);
                    const buffer = await response.buffer();
                    const filename = `statistics_${Date.now()}_${pdf.title.replace(/[^a-zA-Z0-9]/g, '_')}.pdf`;
                    
                    await Actor.setValue(filename, buffer, { contentType: 'application/pdf' });
                    console.log(`📁 Saved PDF: ${filename}`);
                } catch (pdfError) {
                    console.error(`❌ Error downloading PDF ${pdf.title}:`, pdfError.message);
                }
            }
        }
        
    } catch (error) {
        console.error('❌ Error in statistics PDFs handling:', error);
    }
}

/**
 * Set up "전체보기" (View All) filters
 */
async function setupAllFilters(page) {
    console.log('⚙️ Setting up 전체보기 filters...');
    
    try {
        // Wait for form elements
        await page.waitForSelector('form, .search-form', { timeout: 10000 });
        
        // Select "전체" options in dropdowns
        const selectElements = await page.$$('select');
        for (const select of selectElements) {
            try {
                await select.select(''); // Empty value often means "전체"
                await page.waitForTimeout(200);
            } catch (e) {
                // Try selecting first option which is often "전체"
                try {
                    await select.select('0');
                    await page.waitForTimeout(200);
                } catch (e2) {
                    // Continue if selection fails
                }
            }
        }
        
        // Set date range to cover maximum period (last 5 years)
        const dateInputs = await page.$$('input[type="date"], .date-picker input');
        if (dateInputs.length >= 2) {
            const endDate = new Date();
            const startDate = new Date();
            startDate.setFullYear(endDate.getFullYear() - 5);
            
            await dateInputs[0].type(startDate.toISOString().split('T')[0]);
            await dateInputs[1].type(endDate.toISOString().split('T')[0]);
        }
        
        // Click search button
        const searchButton = await page.$('button[type="submit"], .search-btn, input[type="submit"]');
        if (searchButton) {
            await searchButton.click();
            await page.waitForTimeout(3000);
        }
        
    } catch (error) {
        console.log('⚠️ Filter setup failed (continuing anyway):', error.message);
    }
}

/**
 * Wrapper for pagination to prevent infinite recursion
 */
async function handlePaginationWrapper(page, config, dataType, supabase) {
    console.log(`📄 Starting pagination for ${dataType}...`);
    
    try {
        let currentPage = 1;
        const maxPages = config.maxPages;
        
        while (currentPage < maxPages) {
            // Look for next page button
            const nextButton = await page.$('a:contains("다음"), .next, .page-link:contains("다음")');
            
            if (!nextButton) break;
            
            const isEnabled = await page.evaluate(btn => {
                return !btn.disabled && !btn.classList.contains('disabled');
            }, nextButton);
            
            if (!isEnabled) break;
            
            await nextButton.click();
            await page.waitForTimeout(config.delay);
            currentPage++;
            
            console.log(`📄 Processing page ${currentPage} for ${dataType}...`);
            
            // Extract data for the specific page type without triggering pagination again
            await extractDataForPage(page, dataType, supabase);
        }
        
        console.log(`📄 Completed pagination for ${dataType} - processed ${currentPage} pages`);
        
    } catch (error) {
        console.error(`❌ Pagination error for ${dataType}:`, error);
    }
}

/**
 * Extract data for a specific page without triggering pagination
 */
async function extractDataForPage(page, dataType, supabase) {
    try {
        if (dataType === 'investment_performance') {
            // Extract investment performance data without pagination
            const performanceData = await page.evaluate(() => {
                const data = [];
                const rows = document.querySelectorAll('table tbody tr');
                
                rows.forEach((row, index) => {
                    const cells = row.querySelectorAll('td');
                    if (cells.length >= 8) {
                        data.push({
                            companyName: cells[0]?.textContent?.trim(),
                            portfolioCompany: cells[1]?.textContent?.trim(),
                            investmentAmount: cells[2]?.textContent?.trim(),
                            investmentDate: cells[3]?.textContent?.trim(),
                            currentStatus: cells[4]?.textContent?.trim(),
                            exitAmount: cells[5]?.textContent?.trim(),
                            exitDate: cells[6]?.textContent?.trim(),
                            investmentReturn: cells[7]?.textContent?.trim(),
                            rowIndex: index
                        });
                    }
                });
                
                return data;
            });
            
            for (const record of performanceData) {
                const processedRecord = {
                    company_name: record.companyName,
                    portfolio_company: record.portfolioCompany,
                    investment_amount: parseKoreanAmount(record.investmentAmount),
                    investment_date: parseKoreanDate(record.investmentDate),
                    current_status: record.currentStatus,
                    exit_amount: parseKoreanAmount(record.exitAmount),
                    exit_date: parseKoreanDate(record.exitDate),
                    investment_return_amount: parseKoreanAmount(record.investmentReturn),
                    extracted_at: new Date().toISOString(),
                    source_url: page.url()
                };
                
                await Actor.pushData({
                    ...processedRecord,
                    dataType: 'investment_performance'
                });
                
                if (supabase) {
                    await saveToSupabase(supabase, 'diva_investment_performance_raw', processedRecord);
                }
            }
        }
        // Add similar blocks for other data types as needed
        
    } catch (error) {
        console.error(`❌ Error extracting data for ${dataType}:`, error);
    }
}

/**
 * Save data to Supabase
 */
async function saveToSupabase(supabase, tableName, data) {
    try {
        const { error } = await supabase
            .from(tableName)
            .insert(data);
            
        if (error) {
            console.error(`❌ Supabase insert error for ${tableName}:`, error);
        }
    } catch (error) {
        console.error(`❌ Supabase save error:`, error);
    }
}

/**
 * Parse Korean financial amounts
 */
function parseKoreanAmount(text) {
    if (!text || text === '-') return null;
    
    const cleanText = text.replace(/[^\d억만원,.-]/g, '');
    
    if (cleanText.includes('억')) {
        const amount = parseFloat(cleanText.replace(/[억원,]/g, ''));
        return amount * 100000000;
    } else if (cleanText.includes('만')) {
        const amount = parseFloat(cleanText.replace(/[만원,]/g, ''));
        return amount * 10000;
    } else {
        return parseFloat(cleanText.replace(/[원,]/g, '')) || null;
    }
}

/**
 * Parse Korean dates
 */
function parseKoreanDate(text) {
    if (!text || text === '-') return null;
    
    // Handle various Korean date formats
    const cleanText = text.replace(/[^\d.-]/g, '');
    
    if (cleanText.match(/^\d{4}-\d{2}-\d{2}$/)) {
        return cleanText;
    } else if (cleanText.match(/^\d{4}\d{2}\d{2}$/)) {
        return `${cleanText.substring(0,4)}-${cleanText.substring(4,6)}-${cleanText.substring(6,8)}`;
    }
    
    return null;
} 