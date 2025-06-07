/**
 * 🔍 HTML ANALYSIS BASED 전체보기 DETECTION
 * Based on actual DIVA portal HTML structure from screenshots
 */

/**
 * 🎯 CORRECTED 전체보기 detection based on real HTML analysis
 */
async function findAndClick전체보기WithHTMLAnalysis(page, config) {
    console.log('🔍 HTML ANALYSIS: Searching for 전체보기 with REAL DIVA structure...');
    
    try {
        // Wait for page to be fully loaded
        await page.waitForSelector('table', { timeout: 30000 });
        await sleep(3000);
        
        console.log('🔍 Step 1: Analyzing page content...');
        
        // First, let's inspect what's actually on the page
        const pageInfo = await page.evaluate(() => {
            return {
                title: document.title,
                url: window.location.href,
                hasTable: !!document.querySelector('table'),
                paginationArea: !!document.querySelector('.pagination, .paging, .page-nav, .page-area'),
                allButtons: Array.from(document.querySelectorAll('button')).map(btn => ({
                    text: btn.textContent?.trim(),
                    onclick: btn.onclick?.toString(),
                    className: btn.className,
                    id: btn.id
                })),
                allLinks: Array.from(document.querySelectorAll('a')).map(link => ({
                    text: link.textContent?.trim(),
                    href: link.href,
                    onclick: link.onclick?.toString(),
                    className: link.className,
                    id: link.id
                })),
                allInputs: Array.from(document.querySelectorAll('input')).map(input => ({
                    value: input.value,
                    type: input.type,
                    onclick: input.onclick?.toString(),
                    className: input.className,
                    id: input.id
                }))
            };
        });
        
        console.log('📊 Page Analysis Results:');
        console.log(`- Page title: ${pageInfo.title}`);
        console.log(`- Has table: ${pageInfo.hasTable}`);
        console.log(`- Pagination area: ${pageInfo.paginationArea}`);
        console.log(`- Buttons found: ${pageInfo.allButtons.length}`);
        console.log(`- Links found: ${pageInfo.allLinks.length}`);
        console.log(`- Inputs found: ${pageInfo.allInputs.length}`);
        
        // Log all clickable elements that might be 전체보기
        console.log('🔍 Potential 전체보기 elements:');
        
        pageInfo.allButtons.forEach((btn, i) => {
            if (btn.text && (btn.text.includes('전체') || btn.text.includes('모두') || btn.text.includes('all'))) {
                console.log(`  Button ${i}: "${btn.text}" (class: ${btn.className}, onclick: ${btn.onclick})`);
            }
        });
        
        pageInfo.allLinks.forEach((link, i) => {
            if (link.text && (link.text.includes('전체') || link.text.includes('모두') || link.text.includes('all'))) {
                console.log(`  Link ${i}: "${link.text}" (class: ${link.className}, onclick: ${link.onclick})`);
            }
        });
        
        pageInfo.allInputs.forEach((input, i) => {
            if (input.value && (input.value.includes('전체') || input.value.includes('모두') || input.value.includes('all'))) {
                console.log(`  Input ${i}: "${input.value}" (class: ${input.className}, onclick: ${input.onclick})`);
            }
        });
        
        // Strategy 1: Look for exact 전체보기 text
        console.log('🎯 Strategy 1: Looking for exact 전체보기 text...');
        
        const exactMatch = await page.evaluate(() => {
            const allElements = Array.from(document.querySelectorAll('*'));
            
            for (const element of allElements) {
                const text = element.textContent?.trim();
                if (text === '전체보기' || text === '전체' || text === '모두보기') {
                    // Check if it's clickable
                    const isClickable = element.tagName === 'BUTTON' || 
                                      element.tagName === 'A' || 
                                      element.tagName === 'INPUT' ||
                                      element.onclick ||
                                      element.style.cursor === 'pointer';
                    
                    if (isClickable) {
                        console.log(`Found exact match: ${text} (tag: ${element.tagName})`);
                        element.click();
                        return { success: true, method: 'exact_text', text: text, tag: element.tagName };
                    }
                }
            }
            return { success: false };
        });
        
        if (exactMatch.success) {
            console.log(`✅ 전체보기 clicked via exact match: ${exactMatch.method}`);
            return true;
        }
        
        // Strategy 2: Look in pagination area specifically
        console.log('🎯 Strategy 2: Looking in pagination area...');
        
        const paginationMatch = await page.evaluate(() => {
            // Common Korean pagination selectors
            const paginationSelectors = [
                '.pagination', '.paging', '.page-nav', '.page-area', '.page-wrap',
                '.btn-area', '.search-area', '.list-page', '.board-page'
            ];
            
            for (const selector of paginationSelectors) {
                const paginationArea = document.querySelector(selector);
                if (paginationArea) {
                    console.log(`Found pagination area: ${selector}`);
                    
                    // Look for 전체보기 within this area
                    const allElements = paginationArea.querySelectorAll('*');
                    
                    for (const element of allElements) {
                        const text = element.textContent?.trim();
                        if (text && (text.includes('전체') || text.includes('모두'))) {
                            console.log(`Found in pagination: ${text} (tag: ${element.tagName})`);
                            element.click();
                            return { success: true, method: 'pagination_area', text: text, selector: selector };
                        }
                    }
                }
            }
            
            return { success: false };
        });
        
        if (paginationMatch.success) {
            console.log(`✅ 전체보기 clicked via pagination area: ${paginationMatch.method}`);
            return true;
        }
        
        // Strategy 3: Look for Korean form elements (common in government portals)
        console.log('🎯 Strategy 3: Looking for Korean form elements...');
        
        const formMatch = await page.evaluate(() => {
            // Look for select options or hidden form elements
            const selects = document.querySelectorAll('select');
            
            for (const select of selects) {
                const options = select.querySelectorAll('option');
                for (const option of options) {
                    const text = option.textContent?.trim();
                    const value = option.value;
                    
                    if ((text && text.includes('전체')) || (value && value.includes('all'))) {
                        console.log(`Found select option: ${text} (value: ${value})`);
                        select.value = option.value;
                        
                        // Trigger change event
                        const event = new Event('change', { bubbles: true });
                        select.dispatchEvent(event);
                        
                        return { success: true, method: 'select_option', text: text, value: value };
                    }
                }
            }
            
            return { success: false };
        });
        
        if (formMatch.success) {
            console.log(`✅ 전체보기 triggered via form element: ${formMatch.method}`);
            return true;
        }
        
        // Strategy 4: Look for JavaScript function calls
        console.log('🎯 Strategy 4: Looking for JavaScript function calls...');
        
        const jsMatch = await page.evaluate(() => {
            // Look for common Korean pagination function names
            const functionNames = [
                'allView', 'viewAll', 'showAll', 'totalView', 'allList',
                'selectAll', 'listAll', 'pageAll', 'goAllList'
            ];
            
            for (const funcName of functionNames) {
                if (typeof window[funcName] === 'function') {
                    console.log(`Found JS function: ${funcName}`);
                    try {
                        window[funcName]();
                        return { success: true, method: 'js_function', function: funcName };
                    } catch (e) {
                        console.log(`Failed to call ${funcName}: ${e.message}`);
                    }
                }
            }
            
            return { success: false };
        });
        
        if (jsMatch.success) {
            console.log(`✅ 전체보기 triggered via JS function: ${jsMatch.method}`);
            return true;
        }
        
        // Strategy 5: Try common DIVA portal patterns
        console.log('🎯 Strategy 5: Trying DIVA-specific patterns...');
        
        const divaMatch = await page.evaluate(() => {
            // DIVA-specific selectors based on government portal patterns
            const divaSelectors = [
                'input[onclick*="pageSize"]',
                'select[onchange*="pageSize"]',
                'a[onclick*="pageSize"]',
                'button[onclick*="pageSize"]',
                'input[onclick*="list"]',
                'select[onchange*="list"]',
                'a[onclick*="list"]',
                'button[onclick*="list"]',
                // Check for elements with specific IDs/classes
                '#btnViewAll', '#allView', '.btn-all', '.all-view',
                '#selectAll', '#showAll', '.select-all', '.show-all'
            ];
            
            for (const selector of divaSelectors) {
                try {
                    const elements = document.querySelectorAll(selector);
                    if (elements.length > 0) {
                        console.log(`Found DIVA element: ${selector}`);
                        elements[0].click();
                        return { success: true, method: 'diva_specific', selector: selector };
                    }
                } catch (e) {
                    // Continue to next selector
                }
            }
            
            return { success: false };
        });
        
        if (divaMatch.success) {
            console.log(`✅ 전체보기 clicked via DIVA pattern: ${divaMatch.method}`);
            return true;
        }
        
        console.log('❌ All strategies failed - 전체보기 button not found');
        
        // Log final page state for debugging
        await page.evaluate(() => {
            console.log('=== FINAL DEBUG INFO ===');
            console.log('Page HTML length:', document.documentElement.outerHTML.length);
            console.log('Page text includes 전체:', document.body.textContent.includes('전체'));
            console.log('Page text includes 보기:', document.body.textContent.includes('보기'));
            
            // Log all text content that contains '전체'
            const walker = document.createTreeWalker(
                document.body,
                NodeFilter.SHOW_TEXT,
                null,
                false
            );
            
            let node;
            while (node = walker.nextNode()) {
                if (node.textContent.includes('전체')) {
                    console.log('Text with 전체:', node.textContent.trim(), 'Parent:', node.parentElement.tagName);
                }
            }
        });
        
        return false;
        
    } catch (error) {
        console.error('❌ HTML Analysis error:', error.message);
        return false;
    }
}

/**
 * 📊 Get comprehensive page analysis for debugging
 */
async function getPageAnalysisForDebugging(page) {
    return await page.evaluate(() => {
        return {
            url: window.location.href,
            title: document.title,
            bodyText: document.body.textContent.substring(0, 1000), // First 1000 chars
            hasTable: !!document.querySelector('table'),
            tableRows: document.querySelectorAll('table tr').length,
            formElements: {
                buttons: document.querySelectorAll('button').length,
                links: document.querySelectorAll('a').length,
                inputs: document.querySelectorAll('input').length,
                selects: document.querySelectorAll('select').length
            },
            potentialPagination: Array.from(document.querySelectorAll('.pagination, .paging, .page, .btn-area')).map(el => ({
                className: el.className,
                innerHTML: el.innerHTML.substring(0, 200)
            })),
            textWith전체: document.body.textContent.includes('전체'),
            textWith보기: document.body.textContent.includes('보기'),
            currentPageNumber: (() => {
                const activePages = document.querySelectorAll('.active, .current, .selected');
                return activePages.length > 0 ? activePages[0].textContent : 'unknown';
            })()
        };
    });
}

function sleep(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
}

module.exports = { 
    findAndClick전체보기WithHTMLAnalysis, 
    getPageAnalysisForDebugging 
}; 