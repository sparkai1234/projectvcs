/**
 * 🎯 TARGETED DIVA INSPECTOR
 * Based on real HTML structure analysis from user's DevTools
 */

/**
 * 🔍 Inspect real DIVA portal structure and find 전체보기 mechanism
 */
async function inspectTargetedDIVAStructure(page) {
    console.log('🎯 === TARGETED DIVA STRUCTURE INSPECTION ===');
    console.log('📋 Based on real HTML analysis from DevTools');
    
    try {
        // Wait for the page to fully load
        await page.waitForSelector('body', { timeout: 30000 });
        await sleep(3000);
        
        // Get comprehensive analysis of the actual DIVA structure
        const divaAnalysis = await page.evaluate(() => {
            console.log('🔍 Analyzing real DIVA portal structure...');
            
            const analysis = {
                pageInfo: {
                    url: window.location.href,
                    title: document.title,
                    scrollHeight: document.documentElement.scrollHeight,
                    clientHeight: document.documentElement.clientHeight,
                    bodyTextLength: document.body.textContent.length,
                    hasLargeContent: document.documentElement.scrollHeight > 10000
                },
                
                // Check if 전체보기 is already active
                contentAnalysis: {
                    tableRows: document.querySelectorAll('table tr').length,
                    dataRows: document.querySelectorAll('table tbody tr').length,
                    visibleCompanies: [],
                    paginationExists: false,
                    currentPageInfo: ''
                },
                
                // Find all elements that might control pagination/view
                controlElements: {
                    buttons: [],
                    links: [],
                    selects: [],
                    inputs: [],
                    formsWithPageSize: []
                },
                
                // Look for specific DIVA patterns
                divaPatterns: {
                    hasPageSizeControl: false,
                    hasViewAllControl: false,
                    hasListControls: false,
                    formSubmissions: []
                }
            };
            
            // Step 1: Analyze current content state
            console.log('📊 Step 1: Analyzing current content state...');
            
            // Get visible company names from table
            const tableRows = document.querySelectorAll('table tbody tr');
            tableRows.forEach((row, index) => {
                const firstCell = row.querySelector('td:first-child');
                if (firstCell && firstCell.textContent.trim()) {
                    analysis.contentAnalysis.visibleCompanies.push({
                        index: index + 1,
                        name: firstCell.textContent.trim(),
                        cellCount: row.querySelectorAll('td').length
                    });
                }
            });
            
            // Check for pagination indicators
            const paginationElements = document.querySelectorAll('.pagination, .paging, .page-nav, .page-area, .page-wrap');
            analysis.contentAnalysis.paginationExists = paginationElements.length > 0;
            
            // Look for current page indicators
            const activePageElements = document.querySelectorAll('.active, .current, .selected, .on');
            activePageElements.forEach(el => {
                if (el.textContent.match(/\d+/)) {
                    analysis.contentAnalysis.currentPageInfo += el.textContent.trim() + ' ';
                }
            });
            
            // Step 2: Find control elements
            console.log('🔍 Step 2: Finding control elements...');
            
            // Buttons
            document.querySelectorAll('button').forEach(btn => {
                const text = btn.textContent?.trim() || '';
                const onclick = btn.onclick ? btn.onclick.toString() : '';
                
                analysis.controlElements.buttons.push({
                    text: text,
                    className: btn.className,
                    id: btn.id,
                    onclick: onclick.substring(0, 200),
                    isRelevant: text.includes('전체') || text.includes('모두') || text.includes('조회') || 
                               onclick.includes('page') || onclick.includes('list') || onclick.includes('all')
                });
            });
            
            // Links
            document.querySelectorAll('a').forEach(link => {
                const text = link.textContent?.trim() || '';
                const href = link.href || '';
                const onclick = link.onclick ? link.onclick.toString() : '';
                
                analysis.controlElements.links.push({
                    text: text,
                    href: href,
                    className: link.className,
                    id: link.id,
                    onclick: onclick.substring(0, 200),
                    isRelevant: text.includes('전체') || text.includes('모두') || text.includes('조회') ||
                               onclick.includes('page') || onclick.includes('list') || onclick.includes('all') ||
                               href.includes('page') || href.includes('list')
                });
            });
            
            // Select elements (common in Korean gov portals)
            document.querySelectorAll('select').forEach(select => {
                const options = Array.from(select.options).map(opt => ({
                    text: opt.textContent.trim(),
                    value: opt.value
                }));
                
                analysis.controlElements.selects.push({
                    name: select.name,
                    id: select.id,
                    className: select.className,
                    options: options,
                    onchange: select.onchange ? select.onchange.toString().substring(0, 200) : '',
                    hasRelevantOptions: options.some(opt => 
                        opt.text.includes('전체') || opt.text.includes('모두') || 
                        opt.value.includes('all') || opt.value.includes('999')
                    )
                });
            });
            
            // Input elements
            document.querySelectorAll('input').forEach(input => {
                analysis.controlElements.inputs.push({
                    type: input.type,
                    name: input.name,
                    id: input.id,
                    value: input.value,
                    className: input.className,
                    onclick: input.onclick ? input.onclick.toString().substring(0, 200) : '',
                    isRelevant: input.value.includes('전체') || input.value.includes('모두') ||
                               (input.onclick && (input.onclick.toString().includes('page') || input.onclick.toString().includes('list')))
                });
            });
            
            // Step 3: Look for DIVA-specific patterns
            console.log('🔍 Step 3: Looking for DIVA-specific patterns...');
            
            // Check for forms with pageSize or similar controls
            document.querySelectorAll('form').forEach(form => {
                const formData = new FormData(form);
                const formEntries = [];
                
                for (let [key, value] of formData.entries()) {
                    formEntries.push({ key, value });
                }
                
                const hasPageControl = Array.from(form.elements).some(el => 
                    el.name && (el.name.includes('page') || el.name.includes('size') || el.name.includes('list'))
                );
                
                if (hasPageControl || formEntries.length > 0) {
                    analysis.divaPatterns.formsWithPageSize.push({
                        action: form.action,
                        method: form.method,
                        elements: formEntries,
                        hasPageControl: hasPageControl
                    });
                }
            });
            
            // Check for specific Korean government portal patterns
            const bodyHTML = document.body.innerHTML;
            analysis.divaPatterns.hasPageSizeControl = bodyHTML.includes('pageSize') || bodyHTML.includes('listSize');
            analysis.divaPatterns.hasViewAllControl = bodyHTML.includes('viewAll') || bodyHTML.includes('allView');
            analysis.divaPatterns.hasListControls = bodyHTML.includes('listAll') || bodyHTML.includes('showAll');
            
            // Look for JavaScript function calls in onclick handlers
            document.querySelectorAll('[onclick]').forEach(el => {
                const onclick = el.onclick.toString();
                if (onclick.includes('submit') || onclick.includes('search') || onclick.includes('list')) {
                    analysis.divaPatterns.formSubmissions.push({
                        element: el.tagName,
                        text: el.textContent?.trim().substring(0, 50),
                        onclick: onclick.substring(0, 200)
                    });
                }
            });
            
            console.log('✅ DIVA structure analysis complete!');
            return analysis;
        });
        
        // Log comprehensive analysis
        console.log('📋 === TARGETED DIVA ANALYSIS RESULTS ===');
        
        console.log('\n📊 PAGE CONTENT ANALYSIS:');
        console.log(`- Scroll height: ${divaAnalysis.pageInfo.scrollHeight}`);
        console.log(`- Client height: ${divaAnalysis.pageInfo.clientHeight}`);
        console.log(`- Large content detected: ${divaAnalysis.pageInfo.hasLargeContent}`);
        console.log(`- Total table rows: ${divaAnalysis.contentAnalysis.tableRows}`);
        console.log(`- Data rows: ${divaAnalysis.contentAnalysis.dataRows}`);
        console.log(`- Visible companies: ${divaAnalysis.contentAnalysis.visibleCompanies.length}`);
        console.log(`- Pagination exists: ${divaAnalysis.contentAnalysis.paginationExists}`);
        
        if (divaAnalysis.contentAnalysis.visibleCompanies.length > 0) {
            console.log('\n🏢 VISIBLE COMPANIES (first 10):');
            divaAnalysis.contentAnalysis.visibleCompanies.slice(0, 10).forEach(company => {
                console.log(`  ${company.index}. ${company.name} (${company.cellCount} cells)`);
            });
        }
        
        console.log('\n🎯 RELEVANT CONTROL ELEMENTS:');
        
        // Show relevant buttons
        const relevantButtons = divaAnalysis.controlElements.buttons.filter(btn => btn.isRelevant);
        if (relevantButtons.length > 0) {
            console.log('  📱 RELEVANT BUTTONS:');
            relevantButtons.forEach(btn => {
                console.log(`    - "${btn.text}" (class: ${btn.className}, onclick: ${btn.onclick.substring(0, 100)}...)`);
            });
        }
        
        // Show relevant links
        const relevantLinks = divaAnalysis.controlElements.links.filter(link => link.isRelevant);
        if (relevantLinks.length > 0) {
            console.log('  🔗 RELEVANT LINKS:');
            relevantLinks.forEach(link => {
                console.log(`    - "${link.text}" (href: ${link.href}, onclick: ${link.onclick.substring(0, 100)}...)`);
            });
        }
        
        // Show relevant selects
        const relevantSelects = divaAnalysis.controlElements.selects.filter(sel => sel.hasRelevantOptions);
        if (relevantSelects.length > 0) {
            console.log('  📋 RELEVANT SELECT ELEMENTS:');
            relevantSelects.forEach(sel => {
                console.log(`    - Select: ${sel.name || sel.id} (class: ${sel.className})`);
                const relevantOptions = sel.options.filter(opt => 
                    opt.text.includes('전체') || opt.text.includes('모두') || opt.value.includes('all')
                );
                relevantOptions.forEach(opt => {
                    console.log(`      Option: "${opt.text}" (value: ${opt.value})`);
                });
            });
        }
        
        console.log('\n🔧 DIVA PATTERNS DETECTED:');
        console.log(`- Page size control: ${divaAnalysis.divaPatterns.hasPageSizeControl}`);
        console.log(`- View all control: ${divaAnalysis.divaPatterns.hasViewAllControl}`);
        console.log(`- List controls: ${divaAnalysis.divaPatterns.hasListControls}`);
        console.log(`- Form submissions: ${divaAnalysis.divaPatterns.formSubmissions.length}`);
        
        if (divaAnalysis.divaPatterns.formSubmissions.length > 0) {
            console.log('  📝 FORM SUBMISSIONS:');
            divaAnalysis.divaPatterns.formSubmissions.forEach(sub => {
                console.log(`    - ${sub.element}: "${sub.text}" (${sub.onclick.substring(0, 100)}...)`);
            });
        }
        
        // CRITICAL ASSESSMENT
        console.log('\n🎯 === CRITICAL ASSESSMENT ===');
        
        if (divaAnalysis.pageInfo.hasLargeContent && divaAnalysis.contentAnalysis.visibleCompanies.length > 20) {
            console.log('✅ LIKELY SCENARIO: 전체보기 is ALREADY ACTIVE!');
            console.log(`   - Large scroll height (${divaAnalysis.pageInfo.scrollHeight})`);
            console.log(`   - Many visible companies (${divaAnalysis.contentAnalysis.visibleCompanies.length})`);
            console.log('   - This suggests all records are already loaded');
            
            return { 
                analysis: divaAnalysis, 
                전체보기AlreadyActive: true,
                shouldTryActivating전체보기: false,
                recommendedAction: 'EXTRACT_ALL_VISIBLE_RECORDS'
            };
            
        } else if (relevantButtons.length > 0 || relevantLinks.length > 0 || relevantSelects.length > 0) {
            console.log('🔍 LIKELY SCENARIO: 전체보기 button/control EXISTS');
            console.log('   - Found relevant control elements');
            console.log('   - Should attempt to activate 전체보기');
            
            return { 
                analysis: divaAnalysis, 
                전체보기AlreadyActive: false,
                shouldTryActivating전체보기: true,
                recommendedAction: 'ACTIVATE_전체보기_THEN_EXTRACT'
            };
            
        } else {
            console.log('❓ UNCERTAIN SCENARIO: Need to investigate further');
            console.log('   - No obvious 전체보기 controls found');
            console.log('   - May need alternative approach');
            
            return { 
                analysis: divaAnalysis, 
                전체보기AlreadyActive: false,
                shouldTryActivating전체보기: true,
                recommendedAction: 'TRY_ALTERNATIVE_METHODS'
            };
        }
        
    } catch (error) {
        console.error('❌ Targeted DIVA inspection error:', error.message);
        return { 
            analysis: null, 
            전체보기AlreadyActive: false,
            shouldTryActivating전체보기: true,
            recommendedAction: 'FALLBACK_TO_PAGINATION'
        };
    }
}

/**
 * 🎯 Try to activate 전체보기 based on targeted analysis
 */
async function activateTargeted전체보기(page, analysisResult) {
    console.log('🎯 Attempting to activate 전체보기 based on targeted analysis...');
    
    if (analysisResult.전체보기AlreadyActive) {
        console.log('✅ 전체보기 appears to already be active - no action needed');
        return true;
    }
    
    const analysis = analysisResult.analysis;
    
    try {
        // Strategy 1: Try relevant buttons
        const relevantButtons = analysis.controlElements.buttons.filter(btn => btn.isRelevant);
        
        for (const btn of relevantButtons) {
            if (btn.text.includes('전체') || btn.text.includes('조회')) {
                try {
                    const success = await page.evaluate((buttonInfo) => {
                        const buttons = document.querySelectorAll('button');
                        for (const button of buttons) {
                            if (button.textContent?.trim() === buttonInfo.text && 
                                button.className === buttonInfo.className) {
                                console.log(`Clicking button: ${buttonInfo.text}`);
                                button.click();
                                return true;
                            }
                        }
                        return false;
                    }, btn);
                    
                    if (success) {
                        console.log(`✅ Successfully activated 전체보기 via button: "${btn.text}"`);
                        return true;
                    }
                } catch (err) {
                    console.log(`⚠️ Failed to click button: ${btn.text}`);
                }
            }
        }
        
        // Strategy 2: Try relevant selects
        const relevantSelects = analysis.controlElements.selects.filter(sel => sel.hasRelevantOptions);
        
        for (const sel of relevantSelects) {
            const relevantOptions = sel.options.filter(opt => 
                opt.text.includes('전체') || opt.value.includes('all') || opt.value.includes('999')
            );
            
            if (relevantOptions.length > 0) {
                try {
                    const success = await page.evaluate((selectInfo, optionValue) => {
                        const select = document.querySelector(`select[name="${selectInfo.name}"]`) ||
                                     document.querySelector(`select[id="${selectInfo.id}"]`) ||
                                     document.querySelector(`select.${selectInfo.className.split(' ')[0]}`);
                        
                        if (select) {
                            console.log(`Changing select to: ${optionValue}`);
                            select.value = optionValue;
                            
                            // Trigger change event
                            const event = new Event('change', { bubbles: true });
                            select.dispatchEvent(event);
                            
                            // If there's an onchange handler, let it execute
                            if (select.onchange) {
                                select.onchange();
                            }
                            
                            return true;
                        }
                        return false;
                    }, sel, relevantOptions[0].value);
                    
                    if (success) {
                        console.log(`✅ Successfully activated 전체보기 via select: "${sel.name}"`);
                        await sleep(3000); // Wait for page to update
                        return true;
                    }
                } catch (err) {
                    console.log(`⚠️ Failed to change select: ${sel.name}`);
                }
            }
        }
        
        // Strategy 3: Try form submissions
        for (const formSub of analysis.divaPatterns.formSubmissions) {
            if (formSub.onclick.includes('submit') || formSub.onclick.includes('search')) {
                try {
                    const success = await page.evaluate((formInfo) => {
                        const elements = document.querySelectorAll(`${formInfo.element}[onclick]`);
                        for (const element of elements) {
                            if (element.textContent?.includes(formInfo.text.substring(0, 20))) {
                                console.log(`Triggering form submission: ${formInfo.text}`);
                                element.click();
                                return true;
                            }
                        }
                        return false;
                    }, formSub);
                    
                    if (success) {
                        console.log(`✅ Successfully triggered form submission: "${formSub.text}"`);
                        await sleep(5000); // Wait for form submission
                        return true;
                    }
                } catch (err) {
                    console.log(`⚠️ Failed to trigger form: ${formSub.text}`);
                }
            }
        }
        
        console.log('❌ Could not activate 전체보기 with any targeted method');
        return false;
        
    } catch (error) {
        console.error('❌ Error activating targeted 전체보기:', error.message);
        return false;
    }
}

function sleep(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
}

module.exports = { 
    inspectTargetedDIVAStructure, 
    activateTargeted전체보기 
}; 