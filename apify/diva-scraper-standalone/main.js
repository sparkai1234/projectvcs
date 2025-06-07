import { Actor } from 'apify';
import { chromium } from 'playwright';

/**
 * 🇰🇷 Korean DIVA Financial Data Scraper - Standalone Edition
 * 
 * Enhanced Playwright scraper targeting 92+ violations benchmark
 * Solving the 94.6% data completeness crisis with multi-strategy detection
 */

await Actor.init();

try {
    const input = await Actor.getInput() || {};
    console.log('🚀 Starting DIVA Scraper - Standalone Edition');
    console.log('📥 Input configuration:', JSON.stringify(input, null, 2));

    // Configuration with defaults
    const config = {
        updateMode: input.updateMode || 'incremental',
        dataSource: input.dataSource || 'all',
        maxPages: input.maxPages || 50,
        targetRecords: input.targetRecords || 92,
        enableScreenshots: input.enableScreenshots !== false,
        waitStrategy: input.waitStrategy || 'networkidle',
        retryAttempts: input.retryAttempts || 3,
        debugMode: input.debugMode || false,
        ...input
    };

    await Actor.setStatusMessage('🌐 Launching browser with Korean locale support...');

    // Launch browser with Korean optimization and SSL handling
    const browser = await chromium.launch({
        headless: true,
        args: [
            '--no-sandbox',
            '--disable-setuid-sandbox',
            '--disable-dev-shm-usage',
            '--disable-accelerated-2d-canvas',
            '--no-first-run',
            '--no-zygote',
            '--disable-gpu',
            '--lang=ko-KR',
            '--ignore-certificate-errors',
            '--ignore-ssl-errors',
            '--ignore-certificate-errors-spki-list',
            '--allow-running-insecure-content',
            '--disable-web-security'
        ]
    });

    const context = await browser.newContext({
        locale: 'ko-KR',
        timezoneId: 'Asia/Seoul',
        viewport: { width: 1920, height: 1080 },
        userAgent: 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
        ignoreHTTPSErrors: true
    });

    const page = await context.newPage();
    
    // Results tracking
    let totalRecords = 0;
    let violationsFound = 0;
    let processedPages = 0;
    const results = [];

    await Actor.setStatusMessage('🎯 Navigating to DIVA portal...');

    // Navigate to DIVA website - corrected URL
    const baseUrl = 'http://ediva.kvca.or.kr';
    console.log(`🌐 Navigating to correct DIVA URL: ${baseUrl}`);
    await page.goto(baseUrl, { 
        waitUntil: config.waitStrategy,
        timeout: 30000 
    });

    await Actor.setStatusMessage('🔍 Searching for violations data...');

    // Enhanced navigation and button detection - 10 strategies
    async function findViewAllButton() {
        // First, try to navigate to specific sections that might contain violations data
        const navigationTargets = [
            'a[href*="violation"]',
            'a[href*="위반"]', 
            'a[href*="제재"]',
            'a[href*="처분"]',
            'a[href*="공시"]',
            'a[href*="announcement"]',
            'a[href*="notice"]',
            '[class*="menu"] a',
            'nav a',
            '.menu a'
        ];

        for (const navSelector of navigationTargets) {
            try {
                const navLinks = await page.locator(navSelector).all();
                console.log(`🔍 Found ${navLinks.length} navigation links for ${navSelector}`);
                for (const link of navLinks) {
                    const text = await link.textContent();
                    console.log(`📍 Nav link: ${text?.trim()}`);
                }
            } catch (error) {
                console.log(`❌ Navigation check failed for ${navSelector}:`, error.message);
            }
        }

        const strategies = [
            // Strategy 1: Korean text content variations
            () => page.locator('button, a, input').filter({ hasText: '전체보기' }).first(),
            () => page.locator('button, a, input').filter({ hasText: '전체 보기' }).first(),
            () => page.locator('button, a, input').filter({ hasText: '모두보기' }).first(),
            () => page.locator('button, a, input').filter({ hasText: '전체목록' }).first(),
            () => page.locator('button, a, input').filter({ hasText: '더보기' }).first(),
            () => page.locator('button, a, input').filter({ hasText: 'view all' }).first(),
            () => page.locator('button, a, input').filter({ hasText: 'show all' }).first(),
            
            // Strategy 2: Value attributes
            () => page.locator('input[value*="전체"], button[value*="전체"]').first(),
            () => page.locator('input[value*="모두"], button[value*="모두"]').first(),
            () => page.locator('input[value*="더"], button[value*="더"]').first(),
            
            // Strategy 3: Class names and IDs
            () => page.locator('.btn-all, .view-all, #viewAll, #btnAll, .show-all').first(),
            () => page.locator('[class*="전체"], [id*="전체"]').first(),
            () => page.locator('[class*="more"], [id*="more"]').first(),
            () => page.locator('[class*="list"], [id*="list"]').first(),
            
            // Strategy 4: Common pagination/view controls
            () => page.locator('.pagination a[href*="all"]').first(),
            () => page.locator('select option[value*="all"]').first(),
            () => page.locator('.page-size select').first(),
            
            // Strategy 5: XPath comprehensive
            () => page.locator('//button[contains(text(), "전체")] | //a[contains(text(), "전체")] | //input[contains(@value, "전체")]').first(),
            () => page.locator('//button[contains(text(), "더")] | //a[contains(text(), "더")] | //input[contains(@value, "더")]').first(),
            
            // Strategy 6: CSS selector comprehensive  
            () => page.locator('button:has-text("전체"), a:has-text("전체"), input[value*="전체"]').first(),
            () => page.locator('*[onclick*="all"], *[onclick*="전체"]').first()
        ];

        for (let i = 0; i < strategies.length; i++) {
            try {
                const button = await strategies[i]();
                if (await button.isVisible({ timeout: 1500 })) {
                    const buttonText = await button.textContent();
                    console.log(`✅ Found button using strategy ${i + 1}: "${buttonText?.trim()}"`);
                    return button;
                }
            } catch (error) {
                console.log(`❌ Strategy ${i + 1} failed:`, error.message);
            }
        }
        return null;
    }

    // Enhanced waiting with stability check
    async function waitForStableContent() {
        let previousContent = '';
        let stableCount = 0;
        
        for (let i = 0; i < 5; i++) {
            await page.waitForTimeout(1000);
            const currentContent = await page.textContent('body');
            
            if (currentContent === previousContent) {
                stableCount++;
                if (stableCount >= 2) {
                    console.log('✅ Content stabilized');
                    return;
                }
            } else {
                stableCount = 0;
            }
            previousContent = currentContent;
        }
        console.log('⚠️ Content may still be loading');
    }

    // Main scraping logic
    try {
        // Look for violations section
        await page.waitForSelector('body', { timeout: 10000 });
        
        // Try to find and click 전체보기 button
        const viewAllButton = await findViewAllButton();
        if (viewAllButton) {
            await Actor.setStatusMessage('🎯 Clicking 전체보기 button for full data access...');
            await viewAllButton.click();
            await waitForStableContent();
        } else {
            console.log('⚠️ 전체보기 button not found, proceeding with default view');
        }

        await Actor.setStatusMessage('📊 Extracting violations data...');

        // Enhanced debugging - capture page content for analysis
        const pageTitle = await page.title();
        const pageUrl = await page.url();
        console.log(`📄 Current page: ${pageTitle} at ${pageUrl}`);
        
        // Take screenshot for debugging
        await Actor.setValue('DEBUG_SCREENSHOT', await page.screenshot({ fullPage: true }), { contentType: 'image/png' });
        
        // Advanced data extraction with comprehensive selectors
        const dataSelectors = [
            // Tables and rows
            'table tr',
            'tbody tr', 
            'table tbody tr',
            'tr',
            
            // List items and containers
            '.data-row',
            '.list-item',
            '.item',
            '.row',
            'li',
            'ul li',
            
            // Korean-specific selectors
            '[class*="위반"]',
            '[class*="violation"]', 
            '[class*="제재"]',
            '[class*="처분"]',
            '[class*="조치"]',
            
            // Content containers
            '.content',
            '.main-content',
            '.board',
            '.board-content',
            '.notice',
            '.announcement',
            
            // Generic containers
            'div[class*="list"]',
            'div[class*="data"]',
            'div[class*="result"]',
            'article',
            'section',
            
            // Fallback - all text content
            'div',
            'p',
            'span'
        ];

        let extractedData = [];
        let selectorStats = {};
        
        for (const selector of dataSelectors) {
            try {
                const elements = await page.locator(selector).all();
                selectorStats[selector] = elements.length;
                
                if (elements.length > 0) {
                    console.log(`✅ Found ${elements.length} elements with selector: ${selector}`);
                    
                    for (let i = 0; i < Math.min(elements.length, 200); i++) { // Limit to avoid timeout
                        const element = elements[i];
                        try {
                            const text = await element.textContent();
                            if (text && text.trim().length > 5) {
                                const record = {
                                    content: text.trim(),
                                    selector: selector,
                                    timestamp: new Date().toISOString(),
                                    source: 'diva.kvca.or.kr',
                                    elementIndex: i
                                };
                                extractedData.push(record);
                            }
                        } catch (err) {
                            console.log(`⚠️ Error extracting text from element ${i}:`, err.message);
                        }
                    }
                    
                    if (extractedData.length > 0) {
                        console.log(`✅ Successfully extracted ${extractedData.length} records with ${selector}`);
                        break; // Use first successful selector that yields data
                    }
                }
            } catch (error) {
                console.log(`❌ Selector ${selector} failed:`, error.message);
                selectorStats[selector] = 0;
            }
        }
        
        // Store debugging information
        await Actor.setValue('SELECTOR_STATS', selectorStats);
        console.log('📊 Selector Statistics:', JSON.stringify(selectorStats, null, 2));

        // Process and filter violations
        const violations = extractedData.filter(record => {
            const content = record.content.toLowerCase();
            return content.includes('위반') || 
                   content.includes('violation') || 
                   content.includes('제재') ||
                   content.includes('처분');
        });

        violationsFound = violations.length;
        totalRecords = extractedData.length;

        await Actor.setStatusMessage(`📈 Processing complete: ${violationsFound} violations found from ${totalRecords} total records`);

        // Store results
        for (const violation of violations) {
            await Actor.pushData({
                id: `violation_${Date.now()}_${Math.random().toString(36).substr(2, 9)}`,
                type: 'violation',
                content: violation.content,
                source: violation.source,
                extractedAt: violation.timestamp,
                processingMode: config.updateMode,
                metadata: {
                    selector: violation.selector,
                    scraper: 'diva-standalone-v1.0',
                    targetAchieved: violationsFound >= config.targetRecords
                }
            });
        }

        // Store performance metrics
        await Actor.setValue('PERFORMANCE_METRICS', {
            totalRecords,
            violationsFound,
            targetRecords: config.targetRecords,
            targetAchieved: violationsFound >= config.targetRecords,
            dataCompleteness: totalRecords > 0 ? (violationsFound / config.targetRecords) * 100 : 0,
            improvement: violationsFound >= 5 ? `${(violationsFound / 5).toFixed(1)}x` : 'baseline',
            timestamp: new Date().toISOString(),
            version: 'standalone-v1.0'
        });

        results.push(...violations);

    } catch (error) {
        console.error('❌ Scraping error:', error);
        await Actor.setStatusMessage(`⚠️ Error occurred: ${error.message}`);
        
        if (config.enableScreenshots) {
            await page.screenshot({ path: 'error-screenshot.png', fullPage: true });
            await Actor.setValue('ERROR_SCREENSHOT', await page.screenshot({ fullPage: true }), { contentType: 'image/png' });
        }
    }

    await browser.close();

    // Final results
    const finalMessage = `✅ DIVA Scraper Complete: ${violationsFound} violations found (Target: ${config.targetRecords})`;
    await Actor.setStatusMessage(finalMessage);

    console.log('\n🎯 SCRAPING SUMMARY:');
    console.log(`📊 Total Records: ${totalRecords}`);
    console.log(`⚖️ Violations Found: ${violationsFound}`);
    console.log(`🎯 Target Records: ${config.targetRecords}`);
    console.log(`✅ Target Achieved: ${violationsFound >= config.targetRecords ? 'YES' : 'NO'}`);
    console.log(`📈 Improvement: ${violationsFound >= 5 ? `${(violationsFound / 5).toFixed(1)}x over previous` : 'baseline'}`);

    if (violationsFound >= config.targetRecords) {
        console.log('🎉 SUCCESS: Target benchmark achieved!');
    } else {
        console.log('⚠️ WARNING: Below target benchmark - may need adjustment');
    }

} catch (error) {
    console.error('💥 Fatal error:', error);
    await Actor.setStatusMessage(`💥 Fatal error: ${error.message}`);
    await Actor.fail(`Scraper failed: ${error.message}`);
}

await Actor.exit(); 