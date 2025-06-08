/**
 * 🧪 DIVA DOM EXTRACTION TEST - 재무제표 Menu Only
 * 
 * PURPOSE: Test theory that all 500+ financial records are pre-loaded in DOM
 * DISCOVERY: document.querySelectorAll('tr').length returned 1104 rows
 * GOAL: Extract all pre-loaded financial data without pagination
 */

import { chromium } from 'playwright';

console.log('🧪 DIVA DOM EXTRACTION TEST - Starting...');
console.log('TARGET: Extract all pre-loaded 재무제표 records from DOM');
console.log('THEORY: All 500+ records already loaded, pagination is client-side JS');

async function testDOMExtraction() {
    const browser = await chromium.launch({ 
        headless: false,
        args: ['--disable-blink-features=AutomationControlled']
    });
    
    try {
        const page = await browser.newPage();
        
        // Block unnecessary resources for faster loading
        await page.route('**/*.{png,jpg,jpeg,gif,svg,css,woff,woff2}', route => route.abort());
        
        console.log('📄 Loading DIVA 재무제표 page...');
        await page.goto('http://diva.kvca.or.kr/div/dii/DivItmFsInq', { 
            waitUntil: 'domcontentloaded',
            timeout: 30000 
        });
        
        // Wait for initial data to load
        await page.waitForTimeout(5000);
        
        console.log('🔍 TESTING DOM EXTRACTION THEORY...');
        
        // Test 1: Count total table rows
        const totalRows = await page.evaluate(() => {
            return document.querySelectorAll('tr').length;
        });
        console.log(`📊 Total rows in DOM: ${totalRows}`);
        
        // Test 2: Count visible data rows
        const visibleRows = await page.evaluate(() => {
            const dataRows = document.querySelectorAll('table tbody tr');
            let visible = 0;
            dataRows.forEach(row => {
                if (row.style.display !== 'none' && 
                    row.offsetHeight > 0 && 
                    row.offsetWidth > 0) {
                    visible++;
                }
            });
            return visible;
        });
        console.log(`👁️ Visible data rows: ${visibleRows}`);
        
        // Test 3: Extract ALL table data (visible + hidden)
        const allFinancialData = await page.evaluate(() => {
            const results = [];
            const allRows = document.querySelectorAll('table tbody tr');
            
            allRows.forEach((row, index) => {
                const cells = row.querySelectorAll('td');
                if (cells.length >= 10) { // Financial rows have many columns
                    const rowData = {
                        index: index,
                        visible: row.style.display !== 'none' && row.offsetHeight > 0,
                        company: cells[0]?.textContent?.trim() || '',
                        year: cells[1]?.textContent?.trim() || '',
                        account_type: cells[2]?.textContent?.trim() || '',
                        standard: cells[3]?.textContent?.trim() || '',
                        scope: cells[4]?.textContent?.trim() || '',
                        assets: cells[5]?.textContent?.trim() || '',
                        venture_assets: cells[6]?.textContent?.trim() || '',
                        liabilities: cells[7]?.textContent?.trim() || '',
                        capital: cells[8]?.textContent?.trim() || '',
                        equity: cells[9]?.textContent?.trim() || ''
                    };
                    
                    // Only include rows with valid company names
                    if (rowData.company && 
                        rowData.company.length > 2 && 
                        !rowData.company.includes('회사명') &&
                        !rowData.company.includes('구분')) {
                        results.push(rowData);
                    }
                }
            });
            
            return results;
        });
        
        console.log(`🎯 RESULTS:`);
        console.log(`   • Total extracted records: ${allFinancialData.length}`);
        console.log(`   • Visible records: ${allFinancialData.filter(r => r.visible).length}`);
        console.log(`   • Hidden records: ${allFinancialData.filter(r => !r.visible).length}`);
        
        // Test 4: Sample data analysis
        if (allFinancialData.length > 0) {
            console.log(`📋 SAMPLE DATA (first 5 records):`);
            allFinancialData.slice(0, 5).forEach((record, i) => {
                console.log(`   ${i+1}. ${record.company} (${record.visible ? 'VISIBLE' : 'HIDDEN'})`);
                console.log(`      Assets: ${record.assets}, Capital: ${record.capital}`);
            });
        }
        
        // Test 5: Check if we found the target amount
        const targetRecords = 500;
        const actualRecords = allFinancialData.length;
        const accuracy = actualRecords >= targetRecords ? 100 : (actualRecords / targetRecords * 100).toFixed(1);
        
        console.log(`🎯 ACCURACY TEST:`);
        console.log(`   • Target: ${targetRecords} records`);
        console.log(`   • Found: ${actualRecords} records`);
        console.log(`   • Accuracy: ${accuracy}%`);
        
        if (accuracy >= 100) {
            console.log(`🎉 SUCCESS! DOM extraction theory CONFIRMED!`);
            console.log(`   ✅ All ${actualRecords} records are pre-loaded in DOM`);
            console.log(`   ✅ No pagination/API calls needed`);
            console.log(`   ✅ Ready for integration into main scraper`);
        } else {
            console.log(`⚠️  Theory partially confirmed`);
            console.log(`   • Found ${actualRecords} records vs ${targetRecords} target`);
            console.log(`   • May need additional extraction methods`);
        }
        
        // Save results for analysis
        await page.evaluate((data) => {
            window.testResults = {
                totalRows: data.totalRows,
                visibleRows: data.visibleRows,
                extractedRecords: data.extractedRecords,
                accuracy: data.accuracy,
                sampleData: data.sampleData
            };
        }, {
            totalRows,
            visibleRows, 
            extractedRecords: actualRecords,
            accuracy,
            sampleData: allFinancialData.slice(0, 10)
        });
        
        console.log(`💾 Test results saved to window.testResults`);
        console.log(`🔍 You can inspect the data in browser console`);
        
        // Keep browser open for manual inspection
        console.log(`🕐 Browser staying open for 60 seconds for manual inspection...`);
        console.log(`   • Check DevTools Console for window.testResults`);
        console.log(`   • Verify data quality manually`);
        await page.waitForTimeout(60000);
        
    } catch (error) {
        console.error('❌ Test failed:', error);
    } finally {
        await browser.close();
        console.log('🧪 DOM Extraction Test completed');
    }
}

// Run the test
testDOMExtraction().catch(console.error); 