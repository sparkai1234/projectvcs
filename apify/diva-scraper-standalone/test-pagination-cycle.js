/**
 * 🔄 DIVA PAGINATION CYCLE TEST - 재무제표 Stable Extraction
 * 
 * PURPOSE: Test if pagination cycling can capture data reliably
 * THEORY: 재무제표 uses server-side loading due to complex filters
 * GOAL: Validate pagination as stable method for complete data extraction
 */

import { chromium } from 'playwright';

console.log('🔄 DIVA PAGINATION CYCLE TEST - Starting...');
console.log('THEORY: 재무제표 uses pagination due to complex filter system');
console.log('GOAL: Test pagination stability and data completeness');

async function testPaginationCycle() {
    const browser = await chromium.launch({ 
        headless: false,
        args: ['--disable-blink-features=AutomationControlled']
    });
    
    try {
        const page = await browser.newPage();
        
        // Set longer timeouts for stability
        page.setDefaultTimeout(15000);
        
        console.log('📄 Loading DIVA 재무제표 page...');
        await page.goto('http://diva.kvca.or.kr/div/dii/DivItmFsInq', { 
            waitUntil: 'domcontentloaded',
            timeout: 30000 
        });
        
        // Wait for initial data load
        await page.waitForTimeout(5000);
        
        console.log('🔍 ANALYZING PAGINATION SYSTEM...');
        
        // Test 1: Analyze current filter state
        const filterAnalysis = await page.evaluate(() => {
            const dropdowns = document.querySelectorAll('select');
            const currentFilters = {};
            
            dropdowns.forEach((select, i) => {
                const selectedOption = select.options[select.selectedIndex];
                currentFilters[`dropdown_${i}`] = {
                    name: select.name || select.id || `select_${i}`,
                    selectedValue: selectedOption?.value || '',
                    selectedText: selectedOption?.textContent?.trim() || '',
                    totalOptions: select.options.length
                };
            });
            
            return {
                totalDropdowns: dropdowns.length,
                currentFilters,
                hasSearchButton: !!document.querySelector('input[value="검색"], button[onclick*="search"], .search-btn'),
                hasYearFilter: Array.from(dropdowns).some(select => 
                    Array.from(select.options).some(opt => /20\d{2}/.test(opt.textContent))
                )
            };
        });
        
        console.log('📋 Filter Analysis:', filterAnalysis);
        
        // Test 2: Detect pagination controls
        const paginationInfo = await page.evaluate(() => {
            const pageNumbers = document.querySelectorAll('a[href*="javascript"], a[onclick*="list"]');
            const pageButtons = Array.from(pageNumbers).filter(a => /^\d+$/.test(a.textContent.trim()));
            
            const nextBtn = document.querySelector('a[onclick*="next"], .next, a[title*="다음"]');
            const prevBtn = document.querySelector('a[onclick*="prev"], .prev, a[title*="이전"]');
            const firstBtn = document.querySelector('a[onclick*="first"], .first, a[title*="처음"]');
            const lastBtn = document.querySelector('a[onclick*="last"], .last, a[title*="마지막"]');
            
            return {
                totalPageButtons: pageButtons.length,
                availablePages: pageButtons.map(btn => btn.textContent.trim()),
                hasNextButton: !!nextBtn,
                hasPrevButton: !!prevBtn,
                hasFirstButton: !!firstBtn,
                hasLastButton: !!lastBtn,
                currentPageIndicator: document.querySelector('.current, .active, [style*="font-weight"]')?.textContent?.trim()
            };
        });
        
        console.log('📃 Pagination Analysis:', paginationInfo);
        
        // Test 3: Cycle through pages and extract data
        const allPageData = [];
        const maxPages = Math.min(10, paginationInfo.availablePages.length); // Test up to 10 pages
        
        console.log(`🔄 Testing pagination cycle (${maxPages} pages)...`);
        
        for (let i = 1; i <= maxPages; i++) {
            try {
                console.log(`📄 Processing page ${i}...`);
                
                // If not on page 1, click the page number
                if (i > 1) {
                    const pageLink = await page.locator(`a:has-text("${i}")`).first();
                    if (await pageLink.count() > 0) {
                        await pageLink.click();
                        await page.waitForTimeout(3000); // Wait for data to load
                    } else {
                        console.log(`   ⚠️ Page ${i} link not found, stopping...`);
                        break;
                    }
                }
                
                // Extract data from current page
                const pageData = await page.evaluate((pageNum) => {
                    const results = [];
                    const rows = document.querySelectorAll('table tbody tr');
                    
                    rows.forEach((row, index) => {
                        const cells = row.querySelectorAll('td');
                        if (cells.length >= 10) { // Financial data rows have many columns
                            const rowData = {
                                pageNumber: pageNum,
                                rowIndex: index,
                                company: cells[0]?.textContent?.trim() || '',
                                source: cells[1]?.textContent?.trim() || '',
                                month: cells[2]?.textContent?.trim() || '',
                                standard: cells[3]?.textContent?.trim() || '',
                                scope: cells[4]?.textContent?.trim() || '',
                                assets: cells[5]?.textContent?.trim() || '',
                                ventureAssets: cells[6]?.textContent?.trim() || '',
                                liabilities: cells[7]?.textContent?.trim() || '',
                                capital: cells[8]?.textContent?.trim() || '',
                                equity: cells[9]?.textContent?.trim() || '',
                                extractTime: new Date().toISOString()
                            };
                            
                            // Only include valid data rows
                            if (rowData.company && 
                                rowData.company.length > 2 && 
                                !rowData.company.includes('회사명') &&
                                !rowData.company.includes('구분')) {
                                results.push(rowData);
                            }
                        }
                    });
                    
                    return results;
                }, i);
                
                allPageData.push(...pageData);
                console.log(`   ✅ Page ${i}: ${pageData.length} records extracted`);
                
                // Check for data consistency
                if (pageData.length === 0 && i > 1) {
                    console.log(`   ⚠️ No data found on page ${i}, pagination might have ended`);
                    break;
                }
                
            } catch (error) {
                console.log(`   ❌ Error on page ${i}:`, error.message);
                break;
            }
        }
        
        // Test 4: Analyze extraction results
        const uniqueCompanies = new Set(allPageData.map(row => row.company));
        const companiesPerPage = {};
        
        allPageData.forEach(row => {
            const page = row.pageNumber;
            if (!companiesPerPage[page]) companiesPerPage[page] = new Set();
            companiesPerPage[page].add(row.company);
        });
        
        console.log('🎯 PAGINATION CYCLE RESULTS:');
        console.log(`   • Total records extracted: ${allPageData.length}`);
        console.log(`   • Unique companies: ${uniqueCompanies.size}`);
        console.log(`   • Pages processed: ${Math.max(...allPageData.map(row => row.pageNumber), 0)}`);
        console.log(`   • Average records per page: ${(allPageData.length / maxPages).toFixed(1)}`);
        
        // Page-by-page breakdown
        Object.entries(companiesPerPage).forEach(([pageNum, companies]) => {
            console.log(`   • Page ${pageNum}: ${companies.size} unique companies`);
        });
        
        // Test 5: Data quality analysis
        const dataQuality = {
            recordsWithAssets: allPageData.filter(row => row.assets && row.assets !== '0').length,
            recordsWithCapital: allPageData.filter(row => row.capital && row.capital !== '0').length,
            recordsWithValidFinancials: allPageData.filter(row => 
                (row.assets && row.assets !== '0') || 
                (row.capital && row.capital !== '0') ||
                (row.equity && row.equity !== '0')
            ).length
        };
        
        console.log('📊 Data Quality Analysis:');
        console.log(`   • Records with assets: ${dataQuality.recordsWithAssets}`);
        console.log(`   • Records with capital: ${dataQuality.recordsWithCapital}`);
        console.log(`   • Records with valid financials: ${dataQuality.recordsWithValidFinancials}`);
        
        // Test 6: Stability assessment
        const targetRecords = 500;
        const extractionAccuracy = allPageData.length >= targetRecords ? 100 : 
                                 (allPageData.length / targetRecords * 100).toFixed(1);
        
        console.log('🎯 PAGINATION STABILITY ASSESSMENT:');
        console.log(`   • Target records: ${targetRecords}`);
        console.log(`   • Extracted records: ${allPageData.length}`);
        console.log(`   • Extraction accuracy: ${extractionAccuracy}%`);
        
        if (extractionAccuracy >= 90) {
            console.log('🎉 PAGINATION APPROACH SUCCESSFUL!');
            console.log('   ✅ Stable data extraction confirmed');
            console.log('   ✅ Reliable method for 재무제표 page');
            console.log('   ✅ Ready for integration into main scraper');
        } else if (extractionAccuracy >= 50) {
            console.log('⚠️ PAGINATION PARTIALLY SUCCESSFUL');
            console.log('   • Good foundation, needs optimization');
            console.log('   • Consider increasing page range or improving selectors');
        } else {
            console.log('❌ PAGINATION NEEDS IMPROVEMENT');
            console.log('   • Low extraction rate, investigate pagination logic');
            console.log('   • May need different page detection strategy');
        }
        
        // Save sample data for analysis
        if (allPageData.length > 0) {
            console.log('📋 SAMPLE EXTRACTED DATA (first 3 records):');
            allPageData.slice(0, 3).forEach((record, i) => {
                console.log(`   ${i+1}. ${record.company} (Page ${record.pageNumber})`);
                console.log(`      Assets: ${record.assets}, Capital: ${record.capital}`);
            });
        }
        
        console.log('🕐 Browser staying open for 30 seconds for inspection...');
        await page.waitForTimeout(30000);
        
    } catch (error) {
        console.error('❌ Pagination cycle test failed:', error);
    } finally {
        await browser.close();
        console.log('🔄 Pagination Cycle Test completed');
    }
}

// Run the pagination test
testPaginationCycle().catch(console.error); 