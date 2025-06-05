/**
 * 🔍 VCS HTML DATA INVESTIGATOR
 * ============================
 * 
 * Since the site uses server-side rendering, let's investigate:
 * 1. Where the 717 investor records are in the HTML
 * 2. How pagination works (form submissions)
 * 3. How search filters work
 * 4. If there are embedded JSON data structures
 */

require('dotenv').config();
const { chromium } = require('playwright');
const fs = require('fs');

console.log('🔍 VCS HTML Data Investigator Started');
console.log('🎯 Goal: Find how VCS embeds the 717 investor records in HTML');

/**
 * Analyze the HTML structure to find embedded data
 */
async function investigateVCSHTML() {
    console.log('\n🚀 === STARTING VCS HTML INVESTIGATION ===');
    
    let browser = null;
    const findings = {
        embeddedData: [],
        formSubmissions: [],
        hiddenFields: [],
        javascriptData: [],
        pagination: null
    };
    
    try {
        browser = await chromium.launch({ 
            headless: false, // Keep visible for inspection
            timeout: 30000 
        });
        
        const context = await browser.newContext({
            userAgent: 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36'
        });
        
        const page = await context.newPage();
        
        console.log('📍 Loading VCS investor list page...');
        await page.goto('https://www.vcs.go.kr/web/portal/investor/list', { 
            waitUntil: 'networkidle',
            timeout: 30000 
        });
        
        await page.waitForTimeout(3000);
        
        console.log('\n🔍 === ANALYZING HTML STRUCTURE ===');
        
        // 1. Look for embedded JSON data in script tags
        console.log('1️⃣ Searching for embedded JSON data...');
        const scriptData = await page.evaluate(() => {
            const scripts = Array.from(document.querySelectorAll('script'));
            const jsonData = [];
            
            scripts.forEach((script, index) => {
                const content = script.textContent || script.innerHTML || '';
                
                // Look for JSON-like structures
                if (content.includes('{') && content.includes('}')) {
                    // Look for specific field names from old system
                    const oldFields = ['operInstNm', 'operInstId', 'comIndNm', 'sigunguNm'];
                    const foundFields = oldFields.filter(field => content.includes(field));
                    
                    if (foundFields.length > 0 || content.length > 1000) {
                        jsonData.push({
                            index: index,
                            size: content.length,
                            foundFields: foundFields,
                            preview: content.substring(0, 300).replace(/\s+/g, ' ')
                        });
                    }
                }
            });
            
            return jsonData;
        });
        
        if (scriptData.length > 0) {
            console.log(`✅ Found ${scriptData.length} interesting script blocks:`);
            scriptData.forEach((script, i) => {
                console.log(`   ${i + 1}. Size: ${script.size} chars, Fields: [${script.foundFields.join(', ')}]`);
                console.log(`      Preview: ${script.preview}...`);
            });
            findings.javascriptData = scriptData;
        } else {
            console.log('❌ No embedded JSON data found in script tags');
        }
        
        // 2. Look for the actual investor cards/items in HTML
        console.log('\n2️⃣ Analyzing investor card structure...');
        const cardStructure = await page.evaluate(() => {
            // Try multiple selectors to find investor cards
            const possibleSelectors = [
                '.wrap',
                '.card',
                '.item',
                '.investor',
                '.company',
                '[class*="wrap"]',
                '[class*="card"]',
                '[class*="item"]'
            ];
            
            const results = [];
            
            possibleSelectors.forEach(selector => {
                const elements = document.querySelectorAll(selector);
                if (elements.length > 0) {
                    // Check if these look like investor cards
                    const sample = elements[0];
                    const text = sample.textContent?.trim() || '';
                    const html = sample.outerHTML;
                    
                    results.push({
                        selector: selector,
                        count: elements.length,
                        sampleText: text.substring(0, 200),
                        sampleHTML: html.substring(0, 300),
                        hasLinks: sample.querySelectorAll('a').length > 0
                    });
                }
            });
            
            return results;
        });
        
        console.log(`✅ Found ${cardStructure.length} potential card structures:`);
        cardStructure.forEach((card, i) => {
            console.log(`   ${i + 1}. ${card.selector}: ${card.count} elements`);
            console.log(`      Sample text: ${card.sampleText}...`);
            console.log(`      Has links: ${card.hasLinks}`);
        });
        
        // 3. Look for forms and hidden fields
        console.log('\n3️⃣ Analyzing forms and hidden fields...');
        const formData = await page.evaluate(() => {
            const forms = Array.from(document.querySelectorAll('form'));
            const formInfo = [];
            
            forms.forEach((form, index) => {
                const action = form.action || '';
                const method = form.method || 'GET';
                const inputs = Array.from(form.querySelectorAll('input'));
                const hiddenInputs = inputs.filter(input => input.type === 'hidden');
                
                const hiddenData = hiddenInputs.map(input => ({
                    name: input.name,
                    value: input.value
                }));
                
                formInfo.push({
                    index: index,
                    action: action,
                    method: method.toUpperCase(),
                    totalInputs: inputs.length,
                    hiddenInputs: hiddenData
                });
            });
            
            return formInfo;
        });
        
        console.log(`✅ Found ${formData.length} forms:`);
        formData.forEach((form, i) => {
            console.log(`   ${i + 1}. ${form.method} ${form.action}`);
            console.log(`      Inputs: ${form.totalInputs}, Hidden: ${form.hiddenInputs.length}`);
            if (form.hiddenInputs.length > 0) {
                form.hiddenInputs.forEach(hidden => {
                    console.log(`         ${hidden.name} = "${hidden.value}"`);
                });
            }
        });
        findings.formSubmissions = formData;
        
        // 4. Look for pagination mechanism
        console.log('\n4️⃣ Analyzing pagination...');
        const paginationInfo = await page.evaluate(() => {
            const paginationElements = [
                ...document.querySelectorAll('.pagination, .paging, .page'),
                ...document.querySelectorAll('a[href*="page"]'),
                ...document.querySelectorAll('button[onclick*="page"]'),
                ...document.querySelectorAll('[class*="page"]')
            ];
            
            const info = [];
            
            paginationElements.forEach(element => {
                const text = element.textContent?.trim() || '';
                const href = element.href || '';
                const onclick = element.onclick?.toString() || '';
                
                if (text.length > 0 || href.length > 0 || onclick.length > 0) {
                    info.push({
                        tag: element.tagName,
                        text: text,
                        href: href,
                        onclick: onclick.substring(0, 100),
                        className: element.className
                    });
                }
            });
            
            return info;
        });
        
        console.log(`✅ Found ${paginationInfo.length} pagination elements:`);
        paginationInfo.forEach((page, i) => {
            console.log(`   ${i + 1}. ${page.tag}: "${page.text}"`);
            if (page.href) console.log(`      href: ${page.href}`);
            if (page.onclick) console.log(`      onclick: ${page.onclick}...`);
        });
        findings.pagination = paginationInfo;
        
        // 5. Try to find the total count (717 investors)
        console.log('\n5️⃣ Looking for total count indicator...');
        const totalCount = await page.evaluate(() => {
            const text = document.body.textContent || '';
            
            // Look for "717" or patterns like "전체 717건"
            const patterns = [
                /전체\s*(\d+)건/g,
                /총\s*(\d+)건/g,
                /(\d+)건/g,
                /717/g
            ];
            
            const matches = [];
            patterns.forEach(pattern => {
                let match;
                while ((match = pattern.exec(text)) !== null) {
                    matches.push({
                        pattern: pattern.toString(),
                        match: match[0],
                        number: match[1] || match[0]
                    });
                }
            });
            
            return matches;
        });
        
        console.log(`✅ Found ${totalCount.length} count indicators:`);
        totalCount.forEach((count, i) => {
            console.log(`   ${i + 1}. "${count.match}" (number: ${count.number})`);
        });
        
        // 6. Save page HTML for detailed analysis
        console.log('\n6️⃣ Saving page HTML for analysis...');
        const htmlContent = await page.content();
        fs.writeFileSync('vcs_investor_list_page.html', htmlContent);
        console.log('✅ Page HTML saved to: vcs_investor_list_page.html');
        
        // Save findings
        fs.writeFileSync('vcs_html_investigation_results.json', JSON.stringify(findings, null, 2));
        console.log('✅ Investigation results saved to: vcs_html_investigation_results.json');
        
        console.log('\n🎯 === SUMMARY ===');
        console.log(`📊 Script blocks with potential data: ${findings.javascriptData.length}`);
        console.log(`🎴 Potential card structures: ${cardStructure.length}`);
        console.log(`📝 Forms found: ${findings.formSubmissions.length}`);
        console.log(`📄 Pagination elements: ${findings.pagination?.length || 0}`);
        console.log(`🔢 Count indicators: ${totalCount.length}`);
        
        // Keep browser open for manual inspection
        console.log('\n⏰ Keeping browser open for 15 seconds for manual inspection...');
        await new Promise(resolve => setTimeout(resolve, 15000));
        
    } catch (error) {
        console.error('💥 Investigation failed:', error);
    } finally {
        if (browser) {
            await browser.close();
        }
    }
}

// Execute investigation
if (require.main === module) {
    (async () => {
        try {
            await investigateVCSHTML();
            console.log('✅ VCS HTML investigation completed successfully!');
        } catch (error) {
            console.error('💥 Investigation failed:', error);
            process.exit(1);
        }
    })();
}

module.exports = {
    investigateVCSHTML
}; 