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

    // Navigate to DIVA website
    const baseUrl = 'https://diva.kvca.or.kr';
    await page.goto(baseUrl, { 
        waitUntil: config.waitStrategy,
        timeout: 30000 
    });

    await Actor.setStatusMessage('🔍 Searching for violations data...');

    // Enhanced 전체보기 button detection - 5 strategies
    async function findViewAllButton() {
        const strategies = [
            // Strategy 1: Korean text content
            () => page.locator('button, a, input').filter({ hasText: '전체보기' }).first(),
            () => page.locator('button, a, input').filter({ hasText: '전체 보기' }).first(),
            () => page.locator('button, a, input').filter({ hasText: '모두보기' }).first(),
            
            // Strategy 2: Value attributes
            () => page.locator('input[value*="전체보기"], button[value*="전체보기"]').first(),
            () => page.locator('input[value*="전체"], button[value*="전체"]').first(),
            
            // Strategy 3: Class names and IDs
            () => page.locator('.btn-all, .view-all, #viewAll, #btnAll').first(),
            () => page.locator('[class*="전체"], [id*="전체"]').first(),
            
            // Strategy 4: XPath fallback
            () => page.locator('//button[contains(text(), "전체")] | //a[contains(text(), "전체")] | //input[contains(@value, "전체")]').first(),
            
            // Strategy 5: CSS selector comprehensive
            () => page.locator('button:has-text("전체"), a:has-text("전체"), input[value*="전체"]').first()
        ];

        for (let i = 0; i < strategies.length; i++) {
            try {
                const button = await strategies[i]();
                if (await button.isVisible({ timeout: 2000 })) {
                    console.log(`✅ Found 전체보기 button using strategy ${i + 1}`);
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

        // Extract data with multiple selectors
        const dataSelectors = [
            'table tr',
            '.data-row',
            '.violation-item',
            '[class*="위반"], [class*="violation"]',
            '.list-item',
            'tbody tr'
        ];

        let extractedData = [];
        
        for (const selector of dataSelectors) {
            try {
                const elements = await page.locator(selector).all();
                if (elements.length > 0) {
                    console.log(`✅ Found ${elements.length} elements with selector: ${selector}`);
                    
                    for (const element of elements) {
                        const text = await element.textContent();
                        if (text && text.trim().length > 10) {
                            const record = {
                                content: text.trim(),
                                selector: selector,
                                timestamp: new Date().toISOString(),
                                source: 'diva.kvca.or.kr'
                            };
                            extractedData.push(record);
                        }
                    }
                    break; // Use first successful selector
                }
            } catch (error) {
                console.log(`❌ Selector ${selector} failed:`, error.message);
            }
        }

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