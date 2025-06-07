/**
 * 🔍 REAL HTML INSPECTOR for DIVA Portal
 * This will run in the browser and find the actual 전체보기 button
 */

async function inspectDIVAPortalHTML(page) {
    console.log('🔍 === REAL HTML INSPECTOR FOR DIVA PORTAL ===');
    
    try {
        // Wait for page to load completely
        await page.waitForSelector('table', { timeout: 30000 });
        await sleep(5000);
        
        console.log('📊 Analyzing REAL DIVA portal HTML structure...');
        
        // Get comprehensive HTML analysis
        const htmlAnalysis = await page.evaluate(() => {
            console.log('🔍 Starting browser-based HTML analysis...');
            
            const analysis = {
                pageInfo: {
                    url: window.location.href,
                    title: document.title,
                    bodyHTML: document.body.innerHTML.length,
                    hasTable: !!document.querySelector('table')
                },
                
                // Find ALL elements containing '전체' text
                elementsWith전체: [],
                
                // Find ALL clickable elements
                clickableElements: [],
                
                // Find pagination-related elements
                paginationElements: [],
                
                // Find form elements
                formElements: [],
                
                // Raw HTML fragments that might contain 전체보기
                htmlFragments: []
            };
            
            // Strategy 1: Find all elements with '전체' text
            console.log('🔍 Step 1: Finding elements with 전체 text...');
            
            const walker = document.createTreeWalker(
                document.body,
                NodeFilter.SHOW_TEXT,
                null,
                false
            );
            
            let node;
            while (node = walker.nextNode()) {
                if (node.textContent.includes('전체') || node.textContent.includes('보기')) {
                    const parent = node.parentElement;
                    analysis.elementsWith전체.push({
                        text: node.textContent.trim(),
                        parentTag: parent.tagName,
                        parentClass: parent.className,
                        parentId: parent.id,
                        parentOnClick: parent.onclick ? parent.onclick.toString() : null,
                        isClickable: parent.tagName === 'BUTTON' || parent.tagName === 'A' || parent.tagName === 'INPUT' || !!parent.onclick,
                        outerHTML: parent.outerHTML.substring(0, 200)
                    });
                }
            }
            
            // Strategy 2: Find all clickable elements
            console.log('🔍 Step 2: Finding all clickable elements...');
            
            const clickableSelectors = ['button', 'a', 'input[type="button"]', 'input[type="submit"]', '[onclick]'];
            
            clickableSelectors.forEach(selector => {
                const elements = document.querySelectorAll(selector);
                elements.forEach(el => {
                    analysis.clickableElements.push({
                        tag: el.tagName,
                        text: el.textContent?.trim() || el.value || '',
                        className: el.className,
                        id: el.id,
                        onclick: el.onclick ? el.onclick.toString() : null,
                        href: el.href || null,
                        type: el.type || null,
                        outerHTML: el.outerHTML.substring(0, 200)
                    });
                });
            });
            
            // Strategy 3: Find pagination-related elements
            console.log('🔍 Step 3: Finding pagination elements...');
            
            const paginationSelectors = [
                '.pagination', '.paging', '.page', '.page-nav', '.page-area', 
                '.btn-area', '.search-area', '.list-nav', '.board-nav'
            ];
            
            paginationSelectors.forEach(selector => {
                const elements = document.querySelectorAll(selector);
                elements.forEach(el => {
                    analysis.paginationElements.push({
                        selector: selector,
                        className: el.className,
                        id: el.id,
                        innerHTML: el.innerHTML.substring(0, 500),
                        hasButtons: el.querySelectorAll('button').length,
                        hasLinks: el.querySelectorAll('a').length,
                        hasInputs: el.querySelectorAll('input').length
                    });
                });
            });
            
            // Strategy 4: Find form elements
            console.log('🔍 Step 4: Finding form elements...');
            
            const selects = document.querySelectorAll('select');
            selects.forEach(select => {
                const options = Array.from(select.options).map(opt => ({
                    text: opt.text,
                    value: opt.value
                }));
                
                analysis.formElements.push({
                    type: 'select',
                    name: select.name,
                    id: select.id,
                    className: select.className,
                    options: options,
                    onchange: select.onchange ? select.onchange.toString() : null
                });
            });
            
            // Strategy 5: Look for specific HTML patterns
            console.log('🔍 Step 5: Looking for HTML patterns...');
            
            const htmlContent = document.body.innerHTML;
            
            // Look for common Korean pagination patterns
            const patterns = [
                'pageSize', 'listSize', 'viewAll', 'allView', 'showAll',
                '전체보기', '전체', '모두보기', '전체목록', '전체조회'
            ];
            
            patterns.forEach(pattern => {
                if (htmlContent.includes(pattern)) {
                    // Find the surrounding HTML
                    const index = htmlContent.indexOf(pattern);
                    const start = Math.max(0, index - 100);
                    const end = Math.min(htmlContent.length, index + 100);
                    
                    analysis.htmlFragments.push({
                        pattern: pattern,
                        found: true,
                        context: htmlContent.substring(start, end)
                    });
                }
            });
            
            console.log('📊 HTML Analysis complete!');
            console.log(`- Elements with 전체: ${analysis.elementsWith전체.length}`);
            console.log(`- Clickable elements: ${analysis.clickableElements.length}`);
            console.log(`- Pagination elements: ${analysis.paginationElements.length}`);
            console.log(`- Form elements: ${analysis.formElements.length}`);
            console.log(`- HTML fragments: ${analysis.htmlFragments.length}`);
            
            return analysis;
        });
        
        // Log comprehensive analysis
        console.log('📋 === DIVA PORTAL HTML ANALYSIS RESULTS ===');
        console.log(`📄 Page: ${htmlAnalysis.pageInfo.title}`);
        console.log(`🔗 URL: ${htmlAnalysis.pageInfo.url}`);
        console.log(`📊 Body HTML size: ${htmlAnalysis.pageInfo.bodyHTML} chars`);
        console.log(`📋 Has table: ${htmlAnalysis.pageInfo.hasTable}`);
        
        console.log('\n🎯 ELEMENTS WITH 전체 TEXT:');
        htmlAnalysis.elementsWith전체.forEach((el, i) => {
            console.log(`  ${i + 1}. "${el.text}" (${el.parentTag}.${el.parentClass}) - Clickable: ${el.isClickable}`);
            if (el.parentOnClick) {
                console.log(`     onClick: ${el.parentOnClick.substring(0, 100)}...`);
            }
        });
        
        console.log('\n🖱️ POTENTIALLY RELEVANT CLICKABLE ELEMENTS:');
        const relevantClickable = htmlAnalysis.clickableElements.filter(el => 
            el.text.includes('전체') || 
            el.text.includes('모두') || 
            el.text.includes('보기') ||
            (el.onclick && (el.onclick.includes('all') || el.onclick.includes('page') || el.onclick.includes('list')))
        );
        
        relevantClickable.forEach((el, i) => {
            console.log(`  ${i + 1}. ${el.tag}: "${el.text}" (class: ${el.className})`);
            if (el.onclick) {
                console.log(`     onClick: ${el.onclick.substring(0, 100)}...`);
            }
        });
        
        console.log('\n📄 PAGINATION ELEMENTS:');
        htmlAnalysis.paginationElements.forEach((el, i) => {
            console.log(`  ${i + 1}. ${el.selector} (class: ${el.className})`);
            console.log(`     Buttons: ${el.hasButtons}, Links: ${el.hasLinks}, Inputs: ${el.hasInputs}`);
        });
        
        console.log('\n📝 FORM ELEMENTS:');
        htmlAnalysis.formElements.forEach((el, i) => {
            console.log(`  ${i + 1}. ${el.type} (id: ${el.id}, class: ${el.className})`);
            if (el.options && el.options.length > 0) {
                const relevantOptions = el.options.filter(opt => 
                    opt.text.includes('전체') || opt.value.includes('all')
                );
                if (relevantOptions.length > 0) {
                    console.log(`     Relevant options: ${relevantOptions.map(opt => `"${opt.text}" (${opt.value})`).join(', ')}`);
                }
            }
        });
        
        console.log('\n🔍 HTML FRAGMENTS WITH PATTERNS:');
        htmlAnalysis.htmlFragments.forEach((frag, i) => {
            console.log(`  ${i + 1}. Pattern "${frag.pattern}" found:`);
            console.log(`     Context: ${frag.context.replace(/\s+/g, ' ')}`);
        });
        
        // Now try to find and click the actual 전체보기 button
        console.log('\n🎯 ATTEMPTING TO FIND AND CLICK 전체보기...');
        
        // Use the analysis to create targeted selectors
        const found전체보기 = await attemptToClick전체보기(page, htmlAnalysis);
        
        return {
            analysis: htmlAnalysis,
            found전체보기: found전체보기
        };
        
    } catch (error) {
        console.error('❌ HTML Inspector error:', error.message);
        return { analysis: null, found전체보기: false };
    }
}

/**
 * 🎯 Attempt to click 전체보기 based on analysis
 */
async function attemptToClick전체보기(page, analysis) {
    console.log('🎯 Attempting to click 전체보기 based on HTML analysis...');
    
    try {
        // Strategy 1: Try elements with 전체 text that are clickable
        const clickable전체Elements = analysis.elementsWith전체.filter(el => el.isClickable);
        
        if (clickable전체Elements.length > 0) {
            console.log(`🎯 Found ${clickable전체Elements.length} clickable elements with 전체 text`);
            
            for (const el of clickable전체Elements) {
                try {
                    const success = await page.evaluate((elementInfo) => {
                        // Find element by matching characteristics
                        const elements = document.querySelectorAll(elementInfo.parentTag);
                        
                        for (const element of elements) {
                            if (element.textContent?.includes('전체') && 
                                element.className === elementInfo.parentClass) {
                                console.log(`Clicking element: ${elementInfo.text}`);
                                element.click();
                                return true;
                            }
                        }
                        return false;
                    }, el);
                    
                    if (success) {
                        console.log(`✅ Successfully clicked 전체보기: "${el.text}"`);
                        return true;
                    }
                    
                } catch (err) {
                    console.log(`⚠️ Failed to click element: ${el.text}`);
                }
            }
        }
        
        // Strategy 2: Try relevant clickable elements
        const relevantClickable = analysis.clickableElements.filter(el => 
            (el.text.includes('전체') || el.text.includes('모두')) ||
            (el.onclick && (el.onclick.includes('all') || el.onclick.includes('pageSize')))
        );
        
        for (const el of relevantClickable) {
            try {
                const success = await page.evaluate((elementInfo) => {
                    let element = null;
                    
                    // Try to find by ID
                    if (elementInfo.id) {
                        element = document.getElementById(elementInfo.id);
                    }
                    
                    // Try to find by class
                    if (!element && elementInfo.className) {
                        const elements = document.querySelectorAll(`.${elementInfo.className.split(' ')[0]}`);
                        element = Array.from(elements).find(el => el.textContent?.includes('전체'));
                    }
                    
                    // Try to find by text content
                    if (!element) {
                        const elements = document.querySelectorAll(elementInfo.tag);
                        element = Array.from(elements).find(el => 
                            el.textContent?.trim() === elementInfo.text
                        );
                    }
                    
                    if (element) {
                        console.log(`Clicking element: ${elementInfo.text} (${elementInfo.tag})`);
                        element.click();
                        return true;
                    }
                    
                    return false;
                }, el);
                
                if (success) {
                    console.log(`✅ Successfully clicked element: "${el.text}"`);
                    return true;
                }
                
            } catch (err) {
                console.log(`⚠️ Failed to click element: ${el.text}`);
            }
        }
        
        console.log('❌ Could not find or click 전체보기 button');
        return false;
        
    } catch (error) {
        console.error('❌ Error attempting to click 전체보기:', error.message);
        return false;
    }
}

function sleep(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
}

module.exports = { inspectDIVAPortalHTML, attemptToClick전체보기 }; 