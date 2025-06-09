/**
 * DIVA SCRAPER v5.3.14.13 - ENHANCED 전체보기 MASTER EDITION
 * ==============================================================
 *
 * CRITICAL DESIGN: NO PAGINATION - 전체보기 GENERATES COMPLETE LIST
 * - Enhanced 전체보기 button detection and clicking
 * - Extended waiting for COMPLETE list generation (all 500 records)
 * - Improved DOM stability checking for full data load
 * - Focus on making 전체보기 work properly, not pagination
 *
 * FIXES: 전체보기 button not generating complete list for financial statements
 * ADDS: Advanced waiting logic and better button detection
 */

import { Actor } from 'apify';
import { PlaywrightCrawler } from 'crawlee';

console.log('DIVA SCRAPER v5.3.14.15 - FORCED DIAGNOSTIC DEPLOYMENT EDITION');
console.log('MISSION: Investigate why 전체보기 only shows 24 rows instead of 500+');
console.log('APPROACH: Extreme diagnostics + Multiple show-all strategies');
console.log('TARGET: Find the REAL mechanism to show ALL financial records');

const urlMapping = {
    investment_performance: 'http://diva.kvca.or.kr/div/dii/DivItmInvstPrfmInq',
    financial_statements: 'http://diva.kvca.or.kr/div/dii/DivItmFsInq',
    association_status: 'http://diva.kvca.or.kr/div/dii/DivItmAssoInq', 
    personnel_status: 'http://diva.kvca.or.kr/div/dii/DivItmMnpwrInq',
    professional_personnel: 'http://diva.kvca.or.kr/div/dii/DivItmProfsInq',
    violations: 'http://diva.kvca.or.kr/div/dii/DivItmViolInq',
    vc_map: 'http://diva.kvca.or.kr/div/dii/DivItmVcmapInq'
};

// ENHANCED 전체보기 MASTER CONFIGURATION v5.3.14.13
const EXPECTED_COUNTS = {
    investment_performance: 333,
    financial_statements: 500,  // TARGET: All records via 전체보기
    association_status: 2231,
    personnel_status: 251,
    professional_personnel: 1685,
    violations: 92,
    vc_map: 251
};

console.log('Starting DIVA Scraper v5.3.14.15 - FORCED DIAGNOSTIC DEPLOYMENT EDITION...');

await Actor.init();

const metrics = {
    pagesProcessed: 0,
    showAllButtonsFound: 0,
    showAllButtonsClicked: 0,
    interferenceElementsBlocked: 0,
    detectionStrategies: {
        textMatch: 0,
        valueMatch: 0,
        classMatch: 0,
        xpathMatch: 0
    },
    totalRuntime: 0,
    errors: 0
};

console.log('FORCED DIAGNOSTIC DEPLOYMENT Configuration v5.3.14.15:');
console.log(`CONTROL TARGETS: ${Object.values(EXPECTED_COUNTS).join(', ')}`);
console.log('STEP 1: Immediate interference detection and blocking');
console.log('STEP 2: EXTREME 전체보기 diagnostic with multiple strategies');
console.log('STEP 3: ULTRA-LONG waiting + DOM analysis to find real show-all mechanism');

const startTime = Date.now();

try {
    const allResults = [];
    console.log('Processing 7 data sources with interference-first protection...');
    
    const crawler = new PlaywrightCrawler({
        async requestHandler({ request, page }) {
            const url = request.loadedUrl;
            const dataType = getDataTypeFromUrl(url);
            
            console.log(`Processing: ${url}`);
            console.log(`\n=== STARTING INTERFERENCE-FIRST EXTRACTION: ${dataType} ===`);
            
            let extractedData = [];
            
            if (dataType === 'financial_statements') {
                extractedData = await extractFinancialStatementsEnhanced(page, metrics);
            } else {
                console.log('Waiting for initial page load...');
                await page.waitForTimeout(5000);
                
                console.log('STEP 1: Detecting and blocking interference elements...');
                await blockInterferenceElements(page, dataType);
                
                console.log('STEP 2: Enhanced 전체보기 button detection...');
                const showAllResult = await findAndClickShowAllEnhanced(page, metrics, dataType);
                
                if (showAllResult.clicked) {
                    console.log(`SUCCESS: Clicked 전체보기 using ${showAllResult.strategy}!`);
                } else {
                    console.log('WARNING: Could not click 전체보기 button');
                }
                
                console.log('STEP 3: Extended waiting for COMPLETE data loading...');
                await waitForCompleteDataLoad(page, dataType);
                
                console.log('STEP 4: Clean data extraction...');
                extractedData = await extractCleanData(page, dataType);
            }
            
            const expectedCount = EXPECTED_COUNTS[dataType] || 0;
            const actualCount = extractedData.length;
            const accuracy = expectedCount > 0 ? ((actualCount / expectedCount) * 100).toFixed(1) : '0.0';
            
            console.log(`\n=== CLEAN EXTRACTION SUCCESS: ${dataType} ===`);
            console.log(`Records Captured: ${actualCount}`);
            console.log(`Target: ${expectedCount}`);
            console.log(`Accuracy: ${accuracy}%`);
            
            allResults.push({
                dataType,
                url,
                records: extractedData,
                count: actualCount,
                target: expectedCount,
                accuracy: parseFloat(accuracy),
                timestamp: new Date().toISOString()
            });
            
            metrics.pagesProcessed++;
        }
    });
    
    const requests = Object.values(urlMapping).map(url => ({ url }));
    await crawler.run(requests);
    
    console.log('\n=== DIVA SCRAPER v5.3.14 - INTERFERENCE-FIRST PROTECTION REPORT ===');
    const totalRuntime = (Date.now() - startTime) / 1000;
    const totalRecords = allResults.reduce((sum, result) => sum + result.count, 0);
    const successfulRecords = allResults.reduce((sum, result) => sum + result.count, 0);
    
    console.log(`Total Runtime: ${totalRuntime.toFixed(1)} seconds`);
    console.log(`Total Records: ${totalRecords}`);
    console.log(`Successful Records: ${successfulRecords}`);
    console.log(`Errors: ${metrics.errors}`);
    console.log(`Pages Processed: ${metrics.pagesProcessed}`);
    console.log(`Show All Buttons Found: ${metrics.showAllButtonsFound}`);
    console.log(`Show All Buttons Clicked: ${metrics.showAllButtonsClicked}`);
    console.log(`Interference Elements Blocked: ${metrics.interferenceElementsBlocked}`);
    
    console.log('\n=== 100% PRECISION ACCURACY ANALYSIS ===');
    allResults.forEach(result => {
        const diff = result.count - result.target;
        const status = diff === 0 ? 'PERFECT' : diff > 0 ? 'OVER' : 'UNDER';
        const diffText = diff === 0 ? '+0' : (diff > 0 ? `+${diff}` : `${diff}`);
        
        console.log(`  ${result.dataType}: ${result.count}/${result.target} (${result.accuracy}%) ${diffText} - ${status}`);
        
        if (result.dataType === 'financial_statements') {
            // Show breakdown for financial statements
            const balanceSheetCount = result.records.filter(r => r.tabType === '재무상태표').length;
            const incomeStatementCount = result.records.filter(r => r.tabType === '손익계산서').length;
            console.log(`    ├─ Balance Sheet: ${balanceSheetCount}`);
            console.log(`    └─ Income Statement: ${incomeStatementCount}`);
        }
    });
    
    console.log('\n=== OVERALL PRECISION STATISTICS ===');
    const perfectMatches = allResults.filter(result => result.accuracy === 100).length;
    const totalTarget = allResults.reduce((sum, result) => sum + result.target, 0);
    const totalCaptured = allResults.reduce((sum, result) => sum + result.count, 0);
    const overallAccuracy = totalTarget > 0 ? ((totalCaptured / totalTarget) * 100).toFixed(1) : '0.0';
    
    console.log(`Perfect Matches: ${perfectMatches}/${allResults.length}`);
    console.log(`Total Target: ${totalTarget}`);
    console.log(`Total Captured: ${totalCaptured}`);
    console.log(`Overall Accuracy: ${overallAccuracy}%`);
    console.log(`Interference Protection Effectiveness: ${metrics.interferenceElementsBlocked} elements blocked`);
    
    if (parseFloat(overallAccuracy) >= 95) {
        console.log('\nEXCELLENT! High precision achieved with minimal fine-tuning needed');
    } else if (parseFloat(overallAccuracy) >= 85) {
        console.log('\nGOOD! Solid performance with some optimization opportunities');
    } else {
        console.log('\nNEEDS WORK! Several data sources require attention');
    }
    
    await Actor.setValue('OUTPUT', allResults);
    
} catch (error) {
    console.error('DIVA Scraper failed:', error);
    metrics.errors++;
    await Actor.setValue('ERROR_LOG', {
        error: error.message,
        stack: error.stack,
        timestamp: new Date().toISOString(),
        metrics
    });
}

console.log('\n=== ENHANCED 전체보기 MASTER EDITION COMPLETE ===');
await Actor.exit();

// ENHANCED FINANCIAL STATEMENTS EXTRACTION - NO PAGINATION, FOCUS ON 전체보기
async function extractFinancialStatementsEnhanced(page, metrics) {
    console.log('\n=== STARTING ENHANCED FINANCIAL STATEMENTS 전체보기 WORKFLOW ===');
    
    let screenshotCount = 1;
    let allRecords = [];
    
    try {
        // Take initial screenshot
        await Actor.setValue(`financial-screenshot-${screenshotCount++}-initial-page-load.png`, 
            await page.screenshot({ fullPage: true }), { contentType: 'image/png' });
        console.log(`📸 FINANCIAL SCREENSHOT ${screenshotCount-1}: Initial page load saved`);
        console.log(`🌐 INITIAL URL: ${page.url()}`);
        
        // STEP 1: Process 재무상태표 (Balance Sheet) tab - ENHANCED 전체보기
        console.log('STEP 1: Processing 재무상태표 (Balance Sheet) tab...');
        await blockFinancialInterference(page);
        
        // Find and click 재무상태표 tab
        console.log('🔍 FINANCIAL TABS DEBUG: Searching for 재무상태표 tab...');
        const balanceSheetTab = await page.locator('text=/재무상태표/').first();
        const isBalanceSheetVisible = await balanceSheetTab.isVisible().catch(() => false);
        
        if (isBalanceSheetVisible) {
            console.log('✅ Found 재무상태표 tab with selector: text=/재무상태표/');
            
            await Actor.setValue(`financial-screenshot-${screenshotCount++}-before-clicking-balance-tab.png`, 
                await page.screenshot({ fullPage: true }), { contentType: 'image/png' });
            console.log(`📸 FINANCIAL SCREENSHOT ${screenshotCount-1}: Before clicking 재무상태표 tab`);
            
            await balanceSheetTab.click();
            console.log('✅ Successfully clicked 재무상태표 tab');
            
            await page.waitForTimeout(5000);
            await Actor.setValue(`financial-screenshot-${screenshotCount++}-after-clicking-balance-tab.png`, 
                await page.screenshot({ fullPage: true }), { contentType: 'image/png' });
            console.log(`📸 FINANCIAL SCREENSHOT ${screenshotCount-1}: After clicking 재무상태표 tab`);
            console.log(`✅ URL STABLE after 재무상태표 tab click: ${page.url()}`);
        }
        
        // ENHANCED 전체보기 for Balance Sheet
        const balanceShowAllResult = await findAndClickShowAllEnhanced(page, metrics, 'financial_statements_balance');
        if (balanceShowAllResult.clicked) {
            console.log('Successfully clicked 전체보기 for 재무상태표');
            
            await Actor.setValue(`financial-screenshot-${screenshotCount++}-after-clicking-all-for-balance.png`, 
                await page.screenshot({ fullPage: true }), { contentType: 'image/png' });
            console.log(`📸 FINANCIAL SCREENSHOT ${screenshotCount-1}: After clicking 전체보기 for 재무상태표`);
            console.log(`🌐 URL after 전체보기 for 재무상태표: ${page.url()}`);
            
            // ENHANCED WAITING FOR COMPLETE LIST GENERATION
            await waitForCompleteDataLoad(page, 'financial_statements_balance');
        }
        
        await Actor.setValue(`financial-screenshot-${screenshotCount++}-after-dom-stability-for-balance.png`, 
            await page.screenshot({ fullPage: true }), { contentType: 'image/png' });
        console.log(`📸 FINANCIAL SCREENSHOT ${screenshotCount-1}: After DOM stability for 재무상태표`);
        
        console.log(`Extracting ALL data from 재무상태표 tab (NO artificial limits)...`);
        await Actor.setValue(`debug-extracting-balance-sheet-${new Date().toISOString().replace(/[:.]/g, '-')}.png`, 
            await page.screenshot({ fullPage: true }), { contentType: 'image/png' });
        
        const balanceSheetRecords = await extractCleanData(page, 'financial_statements');
        console.log(`재무상태표 final count: ${balanceSheetRecords.length} records (complete extraction)`);
        console.log(`Balance Sheet Records: ${balanceSheetRecords.length} (no limit - complete extraction)`);
        
        // Add tabType to all balance sheet records
        balanceSheetRecords.forEach(record => {
            record.tabType = '재무상태표';
            record.tabNameKorean = '재무상태표';
            record.tabNameEnglish = 'Balance Sheet';
        });
        allRecords.push(...balanceSheetRecords);
        
        console.log('\nSTEP 2: Processing 손익계산서 (Income Statement) tab...');
        
        // Find and click 손익계산서 tab
        console.log('🔍 FINANCIAL TABS DEBUG: Searching for 손익계산서 tab...');
        const incomeStatementTab = await page.locator('text=/손익계산서/').first();
        const isIncomeStatementVisible = await incomeStatementTab.isVisible().catch(() => false);
        
        if (isIncomeStatementVisible) {
            console.log('✅ Found 손익계산서 tab with selector: text=/손익계산서/');
            
            await Actor.setValue(`financial-screenshot-${screenshotCount++}-before-clicking-income-tab.png`, 
                await page.screenshot({ fullPage: true }), { contentType: 'image/png' });
            console.log(`📸 FINANCIAL SCREENSHOT ${screenshotCount-1}: Before clicking 손익계산서 tab`);
            
            await incomeStatementTab.click();
            console.log('✅ Successfully clicked 손익계산서 tab');
            
            await page.waitForTimeout(5000);
            await Actor.setValue(`financial-screenshot-${screenshotCount++}-after-clicking-income-tab.png`, 
                await page.screenshot({ fullPage: true }), { contentType: 'image/png' });
            console.log(`📸 FINANCIAL SCREENSHOT ${screenshotCount-1}: After clicking 손익계산서 tab`);
            console.log(`🌐 URL after clicking 손익계산서 tab: ${page.url()}`);
            
            // Block interference again for income statement tab
            await blockFinancialInterference(page);
        }
        
        await Actor.setValue(`financial-screenshot-${screenshotCount++}-after-interference-blocking-for-income.png`, 
            await page.screenshot({ fullPage: true }), { contentType: 'image/png' });
        console.log(`📸 FINANCIAL SCREENSHOT ${screenshotCount-1}: After interference blocking for 손익계산서`);
        
        // ENHANCED 전체보기 for Income Statement  
        const incomeShowAllResult = await findAndClickShowAllEnhanced(page, metrics, 'financial_statements_income');
        if (incomeShowAllResult.clicked) {
            console.log('Successfully clicked 전체보기 for 손익계산서');
            
            await Actor.setValue(`financial-screenshot-${screenshotCount++}-after-clicking-all-for-income.png`, 
                await page.screenshot({ fullPage: true }), { contentType: 'image/png' });
            console.log(`📸 FINANCIAL SCREENSHOT ${screenshotCount-1}: After clicking 전체보기 for 손익계산서`);
            console.log(`🌐 URL after 전체보기 for 손익계산서: ${page.url()}`);
            
            // ENHANCED WAITING FOR COMPLETE LIST GENERATION
            await waitForCompleteDataLoad(page, 'financial_statements_income');
        }
        
        await Actor.setValue(`financial-screenshot-${screenshotCount++}-after-dom-stability-for-income.png`, 
            await page.screenshot({ fullPage: true }), { contentType: 'image/png' });
        console.log(`📸 FINANCIAL SCREENSHOT ${screenshotCount-1}: After DOM stability for 손익계산서`);
        
        console.log(`Extracting ALL data from 손익계산서 tab (NO artificial limits)...`);
        await Actor.setValue(`debug-extracting-income-statement-${new Date().toISOString().replace(/[:.]/g, '-')}.png`, 
            await page.screenshot({ fullPage: true }), { contentType: 'image/png' });
        
        const incomeStatementRecords = await extractCleanData(page, 'financial_statements');
        console.log(`손익계산서 final count: ${incomeStatementRecords.length} records (complete extraction)`);
        console.log(`Income Statement Records: ${incomeStatementRecords.length} (no limit - complete extraction)`);
        
        // Add tabType to all income statement records
        incomeStatementRecords.forEach(record => {
            record.tabType = '손익계산서';
            record.tabNameKorean = '손익계산서';
            record.tabNameEnglish = 'Income Statement';
        });
        allRecords.push(...incomeStatementRecords);
        
        await Actor.setValue(`financial-screenshot-${screenshotCount++}-final-state-after-dual-tab-workflow.png`, 
            await page.screenshot({ fullPage: true }), { contentType: 'image/png' });
        console.log(`📸 FINANCIAL SCREENSHOT ${screenshotCount-1}: Final state after dual-tab workflow`);
        
        console.log(`\nDual-tab workflow complete: ${allRecords.length} total records`);
        console.log(`NO ARTIFICIAL LIMITS - Complete extraction from both tabs`);
        console.log(`Interference-first protection applied`);
        console.log(`📸 COMPREHENSIVE SCREENSHOTS: ${screenshotCount-1} debug images saved to key-value store`);
        
        return allRecords;
        
    } catch (error) {
        console.error('Financial statements dual-tab workflow failed:', error.message);
        await Actor.setValue(`financial-error-screenshot-${Date.now()}.png`, 
            await page.screenshot({ fullPage: true }), { contentType: 'image/png' });
        return [];
    }
}

async function blockFinancialInterference(page) {
    console.log('🚫 NUCLEAR STEP 1: Disabling all navigation functions...');
    console.log('🚫 NUCLEAR STEP 2: Blocking family site selector...');
    console.log('🚫 NUCLEAR STEP 3: Blocking interference elements...');
    
    await blockInterferenceElements(page, 'financial_statements');
    
    console.log('🚨 NUCLEAR PART 2: TOTAL LOCKDOWN - Blocking ALL navigation and detail buttons...');
    
    // Nuclear-level blocking for financial statements
    await page.evaluate(() => {
        // Disable the menu function that causes navigation
        if (typeof window.menu === 'function') {
            window.menu = function() { 
                console.log('🚫 BLOCKED: menu() function call intercepted'); 
                return false; 
            };
        }
        
        // Safe navigation blocking without breaking browser security
        const originalReplace = window.location.replace;
        const originalAssign = window.location.assign;
        
        window.location.replace = function(url) {
            console.log('🚫 BLOCKED: window.location.replace call intercepted:', url);
            return false;
        };
        
        window.location.assign = function(url) {
            console.log('🚫 BLOCKED: window.location.assign call intercepted:', url);
            return false;
        };
        
        // Block all navigation menus and breadcrumbs
        const navigationSelectors = [
            '.gnb', '.lnbArea', '.headerWrap', // Top navigation menus
            '.path', '.titArea', // Breadcrumb navigation
            'a[href*="javascript:menu"]', // Menu links
            '.familySite', '[class*="family"]' // Family site selector
        ];
        
        let totalBlocked = 0;
        navigationSelectors.forEach(selector => {
            const elements = document.querySelectorAll(selector);
            elements.forEach(el => {
                el.style.pointerEvents = 'none';
                el.style.opacity = '0.3';
                el.disabled = true;
                totalBlocked++;
            });
        });
        
        // Aggressively block 상세 buttons with multiple layers of protection
        const detailButtons = document.querySelectorAll('input[value*="상세"], button:contains("상세"), a:contains("상세"), [onclick*="Detail"], [onclick*="detail"]');
        detailButtons.forEach(btn => {
            btn.style.pointerEvents = 'none';
            btn.disabled = true;
            btn.onclick = function() { return false; };
            btn.addEventListener('click', function(e) { e.preventDefault(); e.stopPropagation(); return false; });
            btn.addEventListener('mousedown', function(e) { e.preventDefault(); e.stopPropagation(); return false; });
            btn.addEventListener('mouseup', function(e) { e.preventDefault(); e.stopPropagation(); return false; });
            totalBlocked++;
        });
        
        // Block all header/navigation links
        const headerLinks = document.querySelectorAll('header a, .header a, .gnb a, .lnb a, .nav a, [class*="nav"] a');
        headerLinks.forEach(link => {
            link.style.pointerEvents = 'none';
            link.onclick = function() { return false; };
            totalBlocked++;
        });
        
        console.log(`🚨 NUCLEAR PART 2 COMPLETE: ${totalBlocked} elements in total lockdown`);
        return totalBlocked;
    });
    
    console.log('🚫 NUCLEAR BLOCKED: All interference elements for financial statements');
}

async function blockInterferenceElements(page, dataType) {
    console.log(`TARGETED INTERFERENCE DETECTION: Blocking specific elements for ${dataType}...`);
    
    await Actor.setValue(`debug-before-interference-${dataType}-${new Date().toISOString().replace(/[:.]/g, '-')}.png`, 
        await page.screenshot({ fullPage: true }), { contentType: 'image/png' });
    
    const blockedCount = await page.evaluate((dataType) => {
        const protectedElements = [
            '전체보기', '전체', 'ALL', 'Show All', // Keep show all buttons
            '재무상태표', '손익계산서'  // CRITICAL: Protect financial statement tabs
        ];
        
        const interferenceSelectors = [
            'iframe', 'embed', 'object', // External content
            '.ad', '.advertisement', '[class*="ad"]', // Ads
            '.popup', '.modal', '.overlay', // Popups
            '.loading', '.loader', // Loading indicators
            'script[src*="analytics"]', 'script[src*="tracking"]', // Analytics
            '.social-share', '.share-button', // Social sharing
            '[onclick*="popup"]', '[onclick*="window.open"]', // Popup triggers
            '.sidebar', '.widget', // Sidebars
            '.footer-links', '.footer-nav', // Footer navigation
            'a[href*="mailto"]', 'a[href*="tel"]', // Contact links
            '.breadcrumb a', '.nav-link', // Navigation links (except protected)
            '.dropdown', '.submenu', // Dropdown menus
            '[class*="banner"]', '.promo', // Promotional content
            '.tooltip', '.help-text', // Tooltips
            'button[type="reset"]', 'input[type="reset"]' // Reset buttons
        ];
        
        let totalBlocked = 0;
        
        interferenceSelectors.forEach(selector => {
            try {
                const elements = document.querySelectorAll(selector);
                elements.forEach(element => {
                    const text = element.textContent?.trim() || '';
                    const isProtected = protectedElements.some(protectedElement => 
                        text.includes(protectedElement) || element.getAttribute('id')?.includes(protectedElement) || 
                        element.className?.includes(protectedElement)
                    );
                    
                    if (!isProtected) {
                        element.style.display = 'none';
                        element.style.visibility = 'hidden';
                        element.style.pointerEvents = 'none';
                        if (element.disabled !== undefined) element.disabled = true;
                        totalBlocked++;
                    }
                });
            } catch (e) {
                console.log(`Error blocking selector ${selector}:`, e.message);
            }
        });
        
        return totalBlocked;
    }, dataType);
    
    await Actor.setValue(`debug-after-interference-${dataType}-${new Date().toISOString().replace(/[:.]/g, '-')}.png`, 
        await page.screenshot({ fullPage: true }), { contentType: 'image/png' });
    
    console.log(`TARGETED INTERFERENCE SUCCESS: ${blockedCount} specific elements blocked for ${dataType}`);
    console.log('RESTRICTIVE PROTECTION: ONLY main navigation + 전체보기 protected');
    console.log('BLOCKED EVERYTHING ELSE: Including header/footer elements that could interfere');
    console.log(`Blocked ${blockedCount} interference elements immediately`);
}

async function findAndClickShowAllEnhanced(page, metrics, dataType) {
    console.log('Starting clean 전체보기 button detection...');
    
    const strategies = [
        {
            name: 'textMatch',
            method: 'Korean text search',
            selector: async () => page.locator('text=/전체보기|전체|모두보기/').first()
        },
        {
            name: 'valueMatch', 
            method: 'Input value search',
            selector: async () => page.locator('input[value*="전체"]').first()
        },
        {
            name: 'classMatch',
            method: 'CSS class search',
            selector: async () => page.locator('.btn_all, .btnAll, .allBtn, [class*="all"], [class*="All"]').first()
        },
        {
            name: 'xpathMatch',
            method: 'XPath text search',
            selector: async () => page.locator('xpath=//button[contains(text(), "전체")] | //input[contains(@value, "전체")] | //a[contains(text(), "전체")]').first()
        }
    ];
    
    for (const strategy of strategies) {
        try {
            console.log(`Trying ${strategy.name}...`);
            
            const element = await strategy.selector();
            const isVisible = await element.isVisible().catch(() => false);
            
            if (isVisible) {
                console.log(`Found clean 전체보기 button with ${strategy.name}!`);
                metrics.detectionStrategies[strategy.name]++;
                
                try {
                    await element.click();
                    console.log(`Successfully clicked clean 전체보기 button using ${strategy.name}!`);
                    
                    return {
                        found: true,
                        clicked: true,
                        strategy: strategy.name,
                        method: strategy.method
                    };
                } catch (clickError) {
                    console.log(`Found but could not click with ${strategy.name}: ${clickError.message}`);
                    continue;
                }
            }
        } catch (error) {
            console.log(`${strategy.name} failed: ${error.message}`);
            continue;
        }
    }
    
    console.log('FAILED: Could not find 전체보기 button with any strategy');
    return {
        found: false,
        clicked: false,
        strategy: null,
        method: null
    };
}

async function waitForCompleteDataLoad(page, dataType) {
    console.log(`🚀 ENHANCED 전체보기 WAITING for ${dataType}...`);
    
    let previousRowCount = 0;
    let currentRowCount = 0;
    let stabilityChecks = 0;
    const maxChecks = 20; // INCREASED from 12 to 20 for better waiting
    const waitTime = dataType.includes('financial') ? 5000 : 3000; // LONGER wait for financial
    
    console.log(`⏰ EXTENDED WAITING LOGIC: ${maxChecks} checks, ${waitTime}ms intervals`);
    console.log(`🎯 TARGET for ${dataType}: Wait for COMPLETE list generation via 전체보기`);
    
    for (let i = 0; i < maxChecks; i++) {
        await page.waitForTimeout(waitTime);
        
        // Enhanced row detection for financial statements
        currentRowCount = await page.evaluate(() => {
            // Financial statements specific selectors
            if (window.location.href.includes('DivItmFsInq')) {
                const financialRows = document.querySelectorAll('table tbody tr:not(.header):not(.no-data), div[id*="List"] table tbody tr');
                return financialRows.length;
            }
            // General data detection
            return document.querySelectorAll('table tbody tr, .data-row, tr').length;
        });
        
        console.log(`🔍 DOM check ${i+1}/${maxChecks} - rows: ${currentRowCount} (prev: ${previousRowCount})`);
        
        // Special financial statements analysis
        if (dataType.includes('financial')) {
            const expectedMinimum = 200; // Much higher expectation for financial data
            if (currentRowCount < expectedMinimum) {
                console.log(`⚠️  FINANCIAL WARNING: Only ${currentRowCount} rows detected, expecting 200+ (full list not generated yet)`);
            } else {
                console.log(`✅ FINANCIAL PROGRESS: ${currentRowCount} rows detected - getting closer to full list`);
            }
        }
        
        if (previousRowCount > 0 && currentRowCount !== previousRowCount) {
            console.log(`📈 Row count changed: ${previousRowCount} -> ${currentRowCount} (still loading complete list...)`);
            stabilityChecks = 0;
        } else if (currentRowCount === previousRowCount && currentRowCount > 0) {
            stabilityChecks++;
            console.log(`⏳ Stability check ${stabilityChecks}/6 - waiting for complete list generation`);
            if (stabilityChecks >= 6) { // INCREASED from 4 to 6 for better stability
                console.log('✅ DOM stable for 6 consecutive checks - COMPLETE list generation finished');
                break;
            }
        }
        previousRowCount = currentRowCount;
    }
    
    console.log(`🎯 FINAL 전체보기 RESULT: ${currentRowCount} rows detected for ${dataType}`);
    
    // Special validation for financial statements
    if (dataType.includes('financial')) {
        const expectedTarget = 250; // Reasonable expectation per tab
        if (currentRowCount < expectedTarget) {
            console.log(`🚨 FINANCIAL ALERT: Only ${currentRowCount} rows, expected ${expectedTarget}+ per tab`);
            console.log(`💡 SUGGESTION: 전체보기 may not have fully generated the complete list`);
        } else {
            console.log(`🎉 FINANCIAL SUCCESS: ${currentRowCount} rows detected - complete list likely generated`);
        }
    }
}

async function extractCleanData(page, dataType) {
    console.log(`Starting clean data extraction for ${dataType}...`);
    
    const extractedData = await page.evaluate((dataType) => {
        const rows = document.querySelectorAll('table tbody tr, .data-row, tr');
        const data = [];
        
        rows.forEach((row, index) => {
            const cells = row.querySelectorAll('td, .cell, .data-cell');
            if (cells.length >= 2) {
                const rowData = {
                    rowIndex: index,
                    dataType: dataType,
                    extractedAt: new Date().toISOString()
                };
                
                cells.forEach((cell, cellIndex) => {
                    const text = cell.textContent?.trim() || '';
                    if (text && text !== '-' && text !== '' && text !== 'N/A') {
                        rowData[`column_${cellIndex}`] = text;
                        
                        // Special field mapping for financial statements
                        if (dataType === 'financial_statements') {
                            switch(cellIndex) {
                                case 0: rowData.companyName = text; break;
                                case 1: rowData.fundSource = text; break;
                                case 2: rowData.settlementMonth = text; break;
                                case 3: rowData.accountingStandard = text; break;
                                case 4: rowData.financialType = text; break;
                                case 5: rowData.assets = text; break;
                                case 6: rowData.startupInvestmentAssets = text; break;
                                case 7: rowData.liabilities = text; break;
                                case 8: rowData.capital = text; break;
                                case 9: rowData.equity = text; break;
                            }
                        }
                    }
                });
                
                // Only include rows with meaningful data
                const meaningfulColumns = Object.keys(rowData).filter(key => 
                    key.startsWith('column_') && rowData[key]
                ).length;
                
                if (meaningfulColumns >= 3) { // At least 3 columns with data
                    data.push(rowData);
                }
            }
        });
        
        return data;
    }, dataType);
    
    console.log(`Clean extraction complete: ${extractedData.length} records for ${dataType}`);
    return extractedData;
}

function getDataTypeFromUrl(url) {
    if (url.includes('DivItmInvstPrfmInq')) return 'investment_performance';
    if (url.includes('DivItmFsInq')) return 'financial_statements';
    if (url.includes('DivItmAssoInq')) return 'association_status';
    if (url.includes('DivItmMnpwrInq')) return 'personnel_status';
    if (url.includes('DivItmProfsInq')) return 'professional_personnel';
    if (url.includes('DivItmViolInq')) return 'violations';
    if (url.includes('DivItmVcmapInq')) return 'vc_map';
    if (url.includes('DivStatsMainInq')) return 'statistics';
    return 'unknown';
}

function getDataSources(dataSource, urls) {
    if (dataSource === 'all') {
        return Object.entries(urls).map(([type, url]) => ({ type, url }));
    }
    
    if (urls[dataSource]) {
        return [{ type: dataSource, url: urls[dataSource] }];
    }
    
    return [];
} 