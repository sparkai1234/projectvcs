/**
 * 🏦 Enhanced Korean Financial Statements Extractor
 * Handles both 재무상태표 (Balance Sheet) and 손익계산서 (Income Statement)
 * Following Korean Financial Reporting Standards (K-IFRS)
 */

/**
 * Enhanced Financial Statements Handler for DIVA Portal
 * Extracts both Balance Sheet and Income Statement data
 */
async function handleEnhancedFinancialStatements(page, config, supabase) {
    console.log('🏦 Processing Enhanced Korean Financial Statements...');
    console.log('📊 Target: 재무상태표 (Balance Sheet) + 손익계산서 (Income Statement)');
    
    try {
        // Setup initial filters
        await setupAllFilters(page);
        await sleep(3000);
        
        let allFinancialData = [];
        
        // 1. Extract 재무상태표 (Balance Sheet) Data
        console.log('📋 Phase 1: Extracting 재무상태표 (Balance Sheet) data...');
        const balanceSheetData = await extractBalanceSheetData(page);
        allFinancialData = allFinancialData.concat(balanceSheetData);
        
        // 2. Click to 손익계산서 (Income Statement) Tab
        console.log('🔄 Phase 2: Switching to 손익계산서 (Income Statement) tab...');
        const incomeStatementClicked = await clickIncomeStatementTab(page);
        
        if (incomeStatementClicked) {
            await sleep(4000); // Wait for tab to load
            
            // Extract Income Statement Data
            console.log('📊 Phase 3: Extracting 손익계산서 (Income Statement) data...');
            const incomeStatementData = await extractIncomeStatementData(page);
            allFinancialData = allFinancialData.concat(incomeStatementData);
        } else {
            console.log('⚠️ Could not switch to Income Statement tab - may need manual inspection');
        }
        
        // 3. Process and Save All Data
        console.log(`💾 Processing ${allFinancialData.length} total financial records...`);
        
        for (const record of allFinancialData) {
            // Save to Apify dataset
            await Actor.pushData({
                ...record,
                dataType: 'enhanced_financial_statements'
            });
            
            // Save to Supabase with proper table routing
            if (supabase) {
                if (record.statement_type === 'balance_sheet') {
                    await saveToSupabase(supabase, 'diva_balance_sheet_raw', record);
                } else if (record.statement_type === 'income_statement') {
                    await saveToSupabase(supabase, 'diva_income_statement_raw', record);
                } else {
                    await saveToSupabase(supabase, 'diva_financial_statements_raw', record);
                }
            }
        }
        
        // 4. Handle Pagination
        if (page.url().includes('page=1') || !page.url().includes('page=')) {
            console.log('📄 Processing additional pages...');
            await handleFinancialStatementsPagination(page, config, supabase);
        }
        
        console.log(`✅ Enhanced Financial Statements extraction complete: ${allFinancialData.length} records`);
        
    } catch (error) {
        console.error('❌ Enhanced Financial Statements extraction error:', error.message);
    }
}

/**
 * Extract 재무상태표 (Balance Sheet) Data
 */
async function extractBalanceSheetData(page) {
    console.log('📋 Extracting Balance Sheet (재무상태표) data...');
    
    return await page.evaluate(() => {
        const data = [];
        const rows = document.querySelectorAll('table tbody tr, table tr');
        
        rows.forEach((row, index) => {
            const cells = row.querySelectorAll('td');
            if (cells.length >= 8) { // Minimum expected columns for balance sheet
                
                const record = {
                    // Basic Info
                    company_name: cells[0]?.textContent?.trim() || '',
                    fiscal_year: cells[1]?.textContent?.trim() || '',
                    accounting_standard: cells[2]?.textContent?.trim() || '', // K-IFRS, K-GAAP, etc.
                    
                    // 재무상태표 (Balance Sheet) Items
                    total_assets: cells[3]?.textContent?.trim() || '0', // 총자산
                    current_assets: cells[4]?.textContent?.trim() || '0', // 유동자산
                    non_current_assets: cells[5]?.textContent?.trim() || '0', // 비유동자산
                    
                    total_liabilities: cells[6]?.textContent?.trim() || '0', // 총부채
                    current_liabilities: cells[7]?.textContent?.trim() || '0', // 유동부채
                    non_current_liabilities: cells[8]?.textContent?.trim() || '0', // 비유동부채
                    
                    total_equity: cells[9]?.textContent?.trim() || '0', // 총자본
                    paid_in_capital: cells[10]?.textContent?.trim() || '0', // 납입자본금
                    retained_earnings: cells[11]?.textContent?.trim() || '0', // 이익잉여금
                    
                    // Venture Capital Specific Items
                    startup_investment_assets: cells[12]?.textContent?.trim() || '0', // 창업투자자산
                    venture_investment_securities: cells[13]?.textContent?.trim() || '0', // 벤처투자유가증권
                    
                    // Metadata
                    statement_type: 'balance_sheet',
                    statement_name: '재무상태표',
                    extracted_at: new Date().toISOString(),
                    row_index: index
                };
                
                // Only add if company name exists
                if (record.company_name && record.company_name !== '') {
                    data.push(record);
                }
            }
        });
        
        return data;
    });
}

/**
 * Click Income Statement Tab (손익계산서)
 */
async function clickIncomeStatementTab(page) {
    console.log('🔄 Attempting to click Income Statement (손익계산서) tab...');
    
    try {
        // Try multiple selectors for Income Statement tab
        const tabSelectors = [
            'a[href*="손익계산서"]',
            'a[title*="손익계산서"]',
            'button:contains("손익계산서")',
            'tab:contains("손익계산서")',
            '.tab:contains("손익계산서")',
            'li:contains("손익계산서")',
            'a:contains("손익계산서")'
        ];
        
        for (const selector of tabSelectors) {
            try {
                const element = await page.$(selector);
                if (element) {
                    console.log(`✅ Found Income Statement tab with selector: ${selector}`);
                    await element.click();
                    return true;
                }
            } catch (selectorError) {
                // Continue to next selector
            }
        }
        
        // Alternative approach: Look for tabs by index or position
        console.log('🔄 Trying alternative tab selection methods...');
        
        // Try clicking second tab (common pattern)
        const tabs = await page.$$('a[role="tab"], .tab, li.tab');
        if (tabs.length > 1) {
            console.log(`📑 Found ${tabs.length} tabs, clicking second tab...`);
            await tabs[1].click();
            return true;
        }
        
        return false;
        
    } catch (error) {
        console.log('⚠️ Could not click Income Statement tab:', error.message);
        return false;
    }
}

/**
 * Extract 손익계산서 (Income Statement) Data  
 */
async function extractIncomeStatementData(page) {
    console.log('📊 Extracting Income Statement (손익계산서) data...');
    
    return await page.evaluate(() => {
        const data = [];
        const rows = document.querySelectorAll('table tbody tr, table tr');
        
        rows.forEach((row, index) => {
            const cells = row.querySelectorAll('td');
            if (cells.length >= 6) { // Minimum expected columns for income statement
                
                const record = {
                    // Basic Info
                    company_name: cells[0]?.textContent?.trim() || '',
                    fiscal_year: cells[1]?.textContent?.trim() || '',
                    accounting_standard: cells[2]?.textContent?.trim() || '',
                    
                    // 손익계산서 (Income Statement) Items
                    operating_revenue: cells[3]?.textContent?.trim() || '0', // 영업수익
                    investment_income: cells[4]?.textContent?.trim() || '0', // 투자수익
                    commission_income: cells[5]?.textContent?.trim() || '0', // 수수료수익
                    other_income: cells[6]?.textContent?.trim() || '0', // 기타수익
                    
                    operating_expenses: cells[7]?.textContent?.trim() || '0', // 영업비용
                    personnel_expenses: cells[8]?.textContent?.trim() || '0', // 인건비
                    general_admin_expenses: cells[9]?.textContent?.trim() || '0', // 일반관리비
                    other_expenses: cells[10]?.textContent?.trim() || '0', // 기타비용
                    
                    operating_profit: cells[11]?.textContent?.trim() || '0', // 영업이익
                    net_income_before_tax: cells[12]?.textContent?.trim() || '0', // 세전순이익
                    income_tax_expense: cells[13]?.textContent?.trim() || '0', // 법인세비용
                    net_income: cells[14]?.textContent?.trim() || '0', // 당기순이익
                    
                    // Venture Capital Specific Items
                    realized_investment_gains: cells[15]?.textContent?.trim() || '0', // 투자처분이익
                    unrealized_investment_gains: cells[16]?.textContent?.trim() || '0', // 투자평가이익
                    investment_management_fees: cells[17]?.textContent?.trim() || '0', // 투자관리수수료
                    
                    // Metadata
                    statement_type: 'income_statement',
                    statement_name: '손익계산서',
                    extracted_at: new Date().toISOString(),
                    row_index: index
                };
                
                // Only add if company name exists
                if (record.company_name && record.company_name !== '') {
                    data.push(record);
                }
            }
        });
        
        return data;
    });
}

/**
 * Handle Financial Statements Pagination
 */
async function handleFinancialStatementsPagination(page, config, supabase) {
    console.log('📄 Processing financial statements pagination...');
    
    let currentPage = 1;
    const maxPages = Math.min(config.maxPages, 10); // Conservative limit for financial data
    
    while (currentPage < maxPages) {
        try {
            // Look for next page button
            const nextButton = await page.$('a:contains("다음"), a:contains("next"), .next, .pagination-next');
            
            if (!nextButton) {
                console.log('📄 No more pages available');
                break;
            }
            
            await nextButton.click();
            await sleep(5000); // Wait for page load
            
            currentPage++;
            console.log(`📄 Processing financial statements page ${currentPage}...`);
            
            // Extract data from current page (both balance sheet and income statement if available)
            const pageData = await extractBalanceSheetData(page);
            
            // Try to get income statement data as well
            const incomeClicked = await clickIncomeStatementTab(page);
            if (incomeClicked) {
                await sleep(3000);
                const incomeData = await extractIncomeStatementData(page);
                pageData.concat(incomeData);
            }
            
            // Save page data
            for (const record of pageData) {
                await Actor.pushData({
                    ...record,
                    dataType: 'enhanced_financial_statements'
                });
                
                if (supabase) {
                    const tableName = record.statement_type === 'balance_sheet' 
                        ? 'diva_balance_sheet_raw' 
                        : 'diva_income_statement_raw';
                    await saveToSupabase(supabase, tableName, record);
                }
            }
            
        } catch (paginationError) {
            console.log(`⚠️ Pagination error on page ${currentPage}:`, paginationError.message);
            break;
        }
    }
}

/**
 * Transform Korean Financial Data for Supabase
 */
function transformKoreanFinancialData(rawData) {
    return {
        // Basic Info
        company_name: rawData.company_name?.trim() || 'Unknown Company',
        fiscal_year: parseInt(rawData.fiscal_year) || new Date().getFullYear(),
        accounting_standard: rawData.accounting_standard?.trim() || 'K-IFRS',
        
        // Transform Korean amounts (handle 억, 만, 천 units)
        total_assets: parseKoreanFinancialAmount(rawData.total_assets),
        current_assets: parseKoreanFinancialAmount(rawData.current_assets),
        non_current_assets: parseKoreanFinancialAmount(rawData.non_current_assets),
        
        total_liabilities: parseKoreanFinancialAmount(rawData.total_liabilities),
        current_liabilities: parseKoreanFinancialAmount(rawData.current_liabilities),
        non_current_liabilities: parseKoreanFinancialAmount(rawData.non_current_liabilities),
        
        total_equity: parseKoreanFinancialAmount(rawData.total_equity),
        paid_in_capital: parseKoreanFinancialAmount(rawData.paid_in_capital),
        retained_earnings: parseKoreanFinancialAmount(rawData.retained_earnings),
        
        // Income Statement Items
        operating_revenue: parseKoreanFinancialAmount(rawData.operating_revenue),
        operating_expenses: parseKoreanFinancialAmount(rawData.operating_expenses),
        operating_profit: parseKoreanFinancialAmount(rawData.operating_profit),
        net_income: parseKoreanFinancialAmount(rawData.net_income),
        
        // Venture Capital Specific
        startup_investment_assets: parseKoreanFinancialAmount(rawData.startup_investment_assets),
        realized_investment_gains: parseKoreanFinancialAmount(rawData.realized_investment_gains),
        unrealized_investment_gains: parseKoreanFinancialAmount(rawData.unrealized_investment_gains),
        
        // Metadata
        statement_type: rawData.statement_type,
        statement_name: rawData.statement_name,
        extracted_at: rawData.extracted_at,
        source_url: 'http://diva.kvca.or.kr/div/dii/DivItmFsInq',
        
        // Data Quality Score
        data_quality_score: calculateFinancialDataQuality(rawData)
    };
}

/**
 * Parse Korean Financial Amounts (enhanced for financial statements)
 */
function parseKoreanFinancialAmount(text) {
    if (!text || typeof text !== 'string') return null;
    
    // Remove Korean currency indicators and formatting
    let cleanText = text.replace(/[원,\s\(\)]/g, '').trim();
    
    // Handle negative numbers (parentheses or minus sign)
    let isNegative = false;
    if (cleanText.includes('-') || text.includes('(')) {
        isNegative = true;
        cleanText = cleanText.replace(/[-\(\)]/g, '');
    }
    
    let amount = 0;
    
    // Handle Korean financial units
    if (cleanText.includes('억')) {
        const value = parseFloat(cleanText.replace('억', ''));
        amount = value * 100000000; // 1억 = 100,000,000
    } else if (cleanText.includes('만')) {
        const value = parseFloat(cleanText.replace('만', ''));
        amount = value * 10000; // 1만 = 10,000
    } else if (cleanText.includes('천')) {
        const value = parseFloat(cleanText.replace('천', ''));
        amount = value * 1000; // 1천 = 1,000
    } else {
        amount = parseFloat(cleanText) || 0;
    }
    
    return isNegative ? -Math.round(amount) : Math.round(amount);
}

/**
 * Calculate Financial Data Quality Score
 */
function calculateFinancialDataQuality(rawData) {
    let score = 0;
    const criticalFields = [
        'company_name', 'fiscal_year', 'total_assets', 
        'total_liabilities', 'total_equity', 'operating_revenue', 'net_income'
    ];
    
    criticalFields.forEach(field => {
        if (rawData[field] && rawData[field].toString().trim() !== '' && rawData[field] !== '0') {
            score += Math.floor(100 / criticalFields.length);
        }
    });
    
    return Math.min(score, 100);
}

module.exports = {
    handleEnhancedFinancialStatements,
    extractBalanceSheetData,
    extractIncomeStatementData,
    transformKoreanFinancialData,
    parseKoreanFinancialAmount
}; 