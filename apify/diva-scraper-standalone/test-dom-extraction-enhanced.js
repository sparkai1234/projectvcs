/**
 * 🧪 ENHANCED DIVA DOM EXTRACTION TEST - Multi-Year Investigation
 * 
 * PURPOSE: Test theory that 1104 rows = 250 companies × 4 years of data
 * FOCUS: Investigate year dropdown and pre-loaded multi-year data
 * GOAL: Extract data from ALL years (2021, 2022, 2023, 2024)
 */

import { chromium } from 'playwright';

console.log('🧪 ENHANCED DIVA MULTI-YEAR DOM EXTRACTION TEST');
console.log('THEORY: 1104 rows = 250 companies × 4 years of financial data');
console.log('GOAL: Extract data from all available years');

async function testMultiYearDOMExtraction() {
    const browser = await chromium.launch({ 
        headless: false,
        args: ['--disable-blink-features=AutomationControlled']
    });
    
    try {
        const page = await browser.newPage();
        
        console.log('📄 Loading DIVA 재무제표 page...');
        await page.goto('http://diva.kvca.or.kr/div/dii/DivItmFsInq', { 
            waitUntil: 'domcontentloaded',
            timeout: 30000 
        });
        
        await page.waitForTimeout(5000);
        
        console.log('🔍 MULTI-YEAR DATA INVESTIGATION...');
        
        // Test 1: Check year dropdown options
        const yearOptions = await page.evaluate(() => {
            const yearDropdown = document.querySelector('select[name="년도"], select.year, #year, select option');
            if (yearDropdown && yearDropdown.parentElement) {
                const options = yearDropdown.parentElement.querySelectorAll('option');
                return Array.from(options).map(opt => ({
                    value: opt.value,
                    text: opt.textContent.trim()
                }));
            }
            
            // Alternative: Look for year-related dropdowns
            const allSelects = document.querySelectorAll('select');
            for (let select of allSelects) {
                const options = Array.from(select.querySelectorAll('option'));
                if (options.some(opt => /20\d{2}/.test(opt.textContent))) {
                    return options.map(opt => ({
                        value: opt.value,
                        text: opt.textContent.trim(),
                        selected: opt.selected
                    }));
                }
            }
            return [];
        });
        
        console.log('📅 Available years:', yearOptions);
        
        // Test 2: Count ALL DOM elements to find the 1104 source
        const domAnalysis = await page.evaluate(() => {
            return {
                totalElements: document.querySelectorAll('*').length,
                totalRows: document.querySelectorAll('tr').length,
                tableRows: document.querySelectorAll('table tr').length,
                tbodyRows: document.querySelectorAll('tbody tr').length,
                hiddenInputs: document.querySelectorAll('input[type="hidden"]').length,
                allInputs: document.querySelectorAll('input').length,
                divElements: document.querySelectorAll('div').length
            };
        });
        
        console.log('📊 DOM Analysis:', domAnalysis);
        
        // Test 3: Look for hidden form data (XLMT fields from earlier discovery)
        const hiddenFormData = await page.evaluate(() => {
            const hiddenInputs = document.querySelectorAll('input[type="hidden"]');
            const xlmtFields = [];
            const financialFields = [];
            
            hiddenInputs.forEach(input => {
                const name = input.name;
                const value = input.value;
                
                if (name && name.includes('XLMT')) {
                    xlmtFields.push({ name, value: value.substring(0, 50) + '...' });
                }
                
                if (name && (name.includes('company') || name.includes('financial') || name.includes('재무'))) {
                    financialFields.push({ name, value: value.substring(0, 50) + '...' });
                }
            });
            
            return {
                totalHidden: hiddenInputs.length,
                xlmtFields: xlmtFields.slice(0, 10), // First 10 XLMT fields
                financialFields: financialFields.slice(0, 10), // First 10 financial fields
                allFieldNames: Array.from(hiddenInputs).slice(0, 20).map(input => input.name)
            };
        });
        
        console.log('🔒 Hidden Form Data Analysis:');
        console.log(`   • Total hidden inputs: ${hiddenFormData.totalHidden}`);
        console.log(`   • XLMT fields found: ${hiddenFormData.xlmtFields.length}`);
        console.log(`   • Financial fields: ${hiddenFormData.financialFields.length}`);
        if (hiddenFormData.xlmtFields.length > 0) {
            console.log('   • Sample XLMT fields:', hiddenFormData.xlmtFields.slice(0, 3));
        }
        
        // Test 4: Try changing year and see if data changes
        const allYearsData = {};
        
        for (const yearOption of yearOptions.filter(opt => /20\d{2}/.test(opt.text))) {
            try {
                console.log(`📊 Testing year: ${yearOption.text}`);
                
                // Try to select the year
                await page.evaluate((year) => {
                    const selects = document.querySelectorAll('select');
                    for (let select of selects) {
                        const options = Array.from(select.querySelectorAll('option'));
                        const targetOption = options.find(opt => opt.textContent.trim() === year);
                        if (targetOption) {
                            select.value = targetOption.value;
                            select.dispatchEvent(new Event('change', { bubbles: true }));
                            return true;
                        }
                    }
                    return false;
                }, yearOption.text);
                
                // Wait for data to load
                await page.waitForTimeout(3000);
                
                // Click search/update button if exists
                await page.evaluate(() => {
                    const searchBtn = document.querySelector('button[onclick*="search"], input[value="검색"], .search-btn, #search');
                    if (searchBtn) {
                        searchBtn.click();
                    }
                });
                
                await page.waitForTimeout(3000);
                
                // Extract data for this year
                const yearData = await page.evaluate(() => {
                    const results = [];
                    const allRows = document.querySelectorAll('table tbody tr');
                    
                    allRows.forEach((row, index) => {
                        const cells = row.querySelectorAll('td');
                        if (cells.length >= 10) {
                            const rowData = {
                                company: cells[0]?.textContent?.trim() || '',
                                year: cells[1]?.textContent?.trim() || '',
                                assets: cells[5]?.textContent?.trim() || '',
                                visible: row.style.display !== 'none' && row.offsetHeight > 0
                            };
                            
                            if (rowData.company && rowData.company.length > 2 && 
                                !rowData.company.includes('회사명')) {
                                results.push(rowData);
                            }
                        }
                    });
                    
                    return results;
                });
                
                allYearsData[yearOption.text] = yearData;
                console.log(`   • Found ${yearData.length} records for ${yearOption.text}`);
                
            } catch (error) {
                console.log(`   ⚠️ Error testing year ${yearOption.text}:`, error.message);
            }
        }
        
        // Test 5: Final analysis
        const totalRecords = Object.values(allYearsData).reduce((sum, data) => sum + data.length, 0);
        const uniqueCompanies = new Set();
        
        Object.values(allYearsData).forEach(yearData => {
            yearData.forEach(record => uniqueCompanies.add(record.company));
        });
        
        console.log('🎯 MULTI-YEAR ANALYSIS RESULTS:');
        console.log(`   • Years tested: ${Object.keys(allYearsData).length}`);
        console.log(`   • Total records across all years: ${totalRecords}`);
        console.log(`   • Unique companies: ${uniqueCompanies.size}`);
        console.log(`   • Average records per year: ${totalRecords / Math.max(Object.keys(allYearsData).length, 1)}`);
        
        // Detailed breakdown
        Object.entries(allYearsData).forEach(([year, data]) => {
            console.log(`   • ${year}: ${data.length} records`);
        });
        
        // Test if we found the 250×4 pattern
        if (uniqueCompanies.size >= 200 && totalRecords >= 800) {
            console.log('🎉 MULTI-YEAR THEORY CONFIRMED!');
            console.log(`   ✅ Found ${uniqueCompanies.size} companies across multiple years`);
            console.log(`   ✅ Total ${totalRecords} records suggests complete dataset`);
            console.log(`   ✅ Pattern matches 250×4 years theory`);
        } else {
            console.log('📊 Results summary:');
            console.log(`   • Companies found: ${uniqueCompanies.size}`);
            console.log(`   • Total records: ${totalRecords}`);
            console.log(`   • May need different extraction approach`);
        }
        
        // Keep browser open for inspection
        console.log('🕐 Browser staying open for 30 seconds for inspection...');
        await page.waitForTimeout(30000);
        
    } catch (error) {
        console.error('❌ Enhanced test failed:', error);
    } finally {
        await browser.close();
        console.log('🧪 Enhanced Multi-Year DOM Extraction Test completed');
    }
}

// Run the enhanced test
testMultiYearDOMExtraction().catch(console.error); 