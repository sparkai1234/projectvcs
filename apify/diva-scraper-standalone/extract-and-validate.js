/**
 * 📊 EXTRACT AND VALIDATE - 재무제표 Control Data Comparison
 * 
 * PURPOSE: Extract data using pagination and compare with control baseline
 * TARGET: 250 재무제표 records (from validate-control-data.js)
 * GOAL: Validate pagination approach accuracy vs control data
 */

import { chromium } from 'playwright';

// Control data baseline from validate-control-data.js
const CONTROL_BASELINE = {
    '재무제표': 250
};

const EXPECTED_SAMPLE_COMPANIES = [
    '경남벤처투자',
    '골든오크벤처스', 
    '디에스씨인베스트먼트',
    '그랜드벤처스',
    '미래에셋벤처투자'
];

console.log('📊 DIVA 재무제표 EXTRACTION & CONTROL DATA VALIDATION');
console.log(`🎯 Control Baseline Target: ${CONTROL_BASELINE['재무제표']} records`);
console.log('🔍 Testing pagination extraction accuracy...');

// Validation function from control data
function validate재무제표Row(cells) {
    if (!cells || cells.length < 11) return false;
    
    const companyName = cells[0]?.trim();
    if (!companyName || companyName.length < 3 || companyName.length > 50) return false;
    
    // Column 2 must be 재원 type (고유계정, etc.)
    if (!cells[1]?.trim() || !cells[1].includes('계정')) return false;
    
    // Column 3 must be 결산월 (typically "12")
    if (!cells[2]?.trim() || cells[2].trim() !== '12') return false;
    
    // Column 4 must be 회계기준 (일반 or K-IFRS)
    const accountStandard = cells[3]?.trim();
    if (!accountStandard || !['일반', 'K-IFRS'].includes(accountStandard)) return false;
    
    // Column 5 must be 자구주본 type (개별, 연결, 별도조건)
    const scopeType = cells[4]?.trim();
    if (!scopeType || !['개별', '연결', '별도조건'].includes(scopeType)) return false;
    
    // Must end with "상세" link (column 11)
    const lastCell = cells[cells.length - 1]?.trim();
    if (lastCell !== '상세') return false;
    
    // Financial data columns must have valid amounts
    let hasFinancialData = false;
    for (let i = 5; i < cells.length - 1; i++) {
        const cell = cells[i]?.trim();
        if (cell && (/^0$/.test(cell) || /^\d{1,3}(,\d{3})*$/.test(cell) || /^-?\d{1,3}(,\d{3})*$/.test(cell))) {
            hasFinancialData = true;
            break;
        }
    }
    if (!hasFinancialData) return false;
    
    // Skip header rows
    if (companyName.includes('회사명') || companyName.includes('재원') || companyName.includes('결산월') || 
        companyName.includes('회계기준') || companyName.includes('구분') || companyName.includes('총계')) return false;
    
    return true;
}

async function extractAndValidate() {
    const browser = await chromium.launch({ 
        headless: false,
        args: ['--disable-blink-features=AutomationControlled']
    });
    
    try {
        const page = await browser.newPage();
        page.setDefaultTimeout(15000);
        
        console.log('📄 Loading DIVA 재무제표 page...');
        await page.goto('http://diva.kvca.or.kr/div/dii/DivItmFsInq', { 
            waitUntil: 'domcontentloaded',
            timeout: 30000 
        });
        
        await page.waitForTimeout(5000);
        
        console.log('🔍 Starting data extraction...');
        
        // Get pagination info
        const paginationInfo = await page.evaluate(() => {
            const pageNumbers = document.querySelectorAll('a[href*="javascript"], a[onclick*="list"]');
            const pageButtons = Array.from(pageNumbers).filter(a => /^\d+$/.test(a.textContent.trim()));
            return {
                totalPages: pageButtons.length,
                availablePages: pageButtons.map(btn => btn.textContent.trim())
            };
        });
        
        console.log(`📃 Found ${paginationInfo.totalPages} pages to process`);
        
        // Extract data from all pages
        const allExtractedData = [];
        const maxPages = Math.min(20, paginationInfo.totalPages); // Process up to 20 pages
        
        for (let i = 1; i <= maxPages; i++) {
            try {
                console.log(`📄 Processing page ${i}/${maxPages}...`);
                
                // Click page number if not on page 1
                if (i > 1) {
                    const pageLink = await page.locator(`a:has-text("${i}")`).first();
                    if (await pageLink.count() > 0) {
                        await pageLink.click();
                        await page.waitForTimeout(3000);
                    } else {
                        console.log(`   ⚠️ Page ${i} link not found`);
                        break;
                    }
                }
                
                // Extract data from current page
                const pageData = await page.evaluate((pageNum) => {
                    const results = [];
                    const rows = document.querySelectorAll('table tbody tr');
                    
                    rows.forEach((row, index) => {
                        const cells = Array.from(row.querySelectorAll('td')).map(cell => cell.textContent?.trim() || '');
                        
                        if (cells.length >= 11) {
                            results.push({
                                pageNumber: pageNum,
                                rowIndex: index,
                                cells: cells,
                                company: cells[0],
                                source: cells[1],
                                month: cells[2],
                                standard: cells[3],
                                scope: cells[4],
                                assets: cells[5],
                                ventureAssets: cells[6],
                                liabilities: cells[7],
                                capital: cells[8],
                                equity: cells[9],
                                detail: cells[10]
                            });
                        }
                    });
                    
                    return results;
                }, i);
                
                // Validate each row using control data validation
                const validRows = pageData.filter(row => validate재무제표Row(row.cells));
                allExtractedData.push(...validRows);
                
                console.log(`   ✅ Page ${i}: ${pageData.length} raw rows, ${validRows.length} valid rows`);
                
                if (pageData.length === 0) {
                    console.log(`   🛑 No data on page ${i}, stopping pagination`);
                    break;
                }
                
            } catch (error) {
                console.log(`   ❌ Error on page ${i}: ${error.message}`);
                break;
            }
        }
        
        // Analysis and validation
        console.log('\n📊 EXTRACTION RESULTS:');
        console.log(`   • Total valid records extracted: ${allExtractedData.length}`);
        console.log(`   • Control baseline target: ${CONTROL_BASELINE['재무제표']}`);
        
        const accuracy = allExtractedData.length >= CONTROL_BASELINE['재무제표'] ? 100 : 
                        (allExtractedData.length / CONTROL_BASELINE['재무제표'] * 100).toFixed(1);
        
        console.log(`   • Accuracy vs control: ${accuracy}%`);
        
        // Check for expected sample companies
        const extractedCompanies = new Set(allExtractedData.map(row => row.company));
        const foundSampleCompanies = EXPECTED_SAMPLE_COMPANIES.filter(company => 
            Array.from(extractedCompanies).some(extracted => extracted.includes(company.split('벤처')[0]))
        );
        
        console.log('\n🏢 COMPANY VALIDATION:');
        console.log(`   • Unique companies found: ${extractedCompanies.size}`);
        console.log(`   • Expected sample companies found: ${foundSampleCompanies.length}/${EXPECTED_SAMPLE_COMPANIES.length}`);
        console.log(`   • Sample companies: ${foundSampleCompanies.join(', ')}`);
        
        // Data quality analysis
        const qualityMetrics = {
            withAssets: allExtractedData.filter(row => row.assets && row.assets !== '0').length,
            withCapital: allExtractedData.filter(row => row.capital && row.capital !== '0').length,
            withKIFRS: allExtractedData.filter(row => row.standard === 'K-IFRS').length,
            with일반: allExtractedData.filter(row => row.standard === '일반').length,
            individual: allExtractedData.filter(row => row.scope === '개별').length,
            consolidated: allExtractedData.filter(row => row.scope === '연결').length
        };
        
        console.log('\n📈 DATA QUALITY METRICS:');
        console.log(`   • Records with assets: ${qualityMetrics.withAssets}`);
        console.log(`   • Records with capital: ${qualityMetrics.withCapital}`);
        console.log(`   • K-IFRS records: ${qualityMetrics.withKIFRS}`);
        console.log(`   • 일반 records: ${qualityMetrics.with일반}`);
        console.log(`   • 개별 scope: ${qualityMetrics.individual}`);
        console.log(`   • 연결 scope: ${qualityMetrics.consolidated}`);
        
        // Sample data display
        if (allExtractedData.length > 0) {
            console.log('\n📋 SAMPLE EXTRACTED DATA (first 5 records):');
            allExtractedData.slice(0, 5).forEach((record, i) => {
                console.log(`   ${i+1}. ${record.company}`);
                console.log(`      Source: ${record.source}, Standard: ${record.standard}, Scope: ${record.scope}`);
                console.log(`      Assets: ${record.assets}, Capital: ${record.capital}`);
                console.log(`      Page: ${record.pageNumber}`);
            });
        }
        
        // Final assessment
        console.log('\n🎯 CONTROL DATA VALIDATION RESULTS:');
        
        if (accuracy >= 100) {
            console.log('🎉 EXCELLENT! Exceeds control baseline!');
            console.log(`   ✅ Found ${allExtractedData.length} vs target ${CONTROL_BASELINE['재무제표']}`);
            console.log('   ✅ Pagination approach is successful');
            console.log('   ✅ Ready for production deployment');
        } else if (accuracy >= 90) {
            console.log('✅ GOOD! Near control baseline');
            console.log(`   📊 Found ${allExtractedData.length} vs target ${CONTROL_BASELINE['재무제표']}`);
            console.log('   🔧 Minor optimization may improve results');
        } else if (accuracy >= 50) {
            console.log('⚠️ PARTIAL SUCCESS');
            console.log(`   📊 Found ${allExtractedData.length} vs target ${CONTROL_BASELINE['재무제표']}`);
            console.log('   🔧 Needs improvement - increase page range or optimize selectors');
        } else {
            console.log('❌ BELOW BASELINE');
            console.log(`   📊 Found ${allExtractedData.length} vs target ${CONTROL_BASELINE['재무제표']}`);
            console.log('   🔧 Significant improvement needed');
            console.log('   💡 Consider 250-limit backup strategy');
        }
        
        // Comparison with current scraper performance
        const currentAccuracy = 40; // Current scraper gets 40/500
        const improvementFactor = allExtractedData.length / currentAccuracy;
        
        console.log('\n📊 IMPROVEMENT vs CURRENT SCRAPER:');
        console.log(`   • Current scraper: 40/500 (8.0%)`);
        console.log(`   • Pagination approach: ${allExtractedData.length}/500 (${(allExtractedData.length/500*100).toFixed(1)}%)`);
        console.log(`   • Improvement factor: ${improvementFactor.toFixed(1)}x better`);
        
        if (improvementFactor >= 2) {
            console.log('   🚀 SIGNIFICANT IMPROVEMENT confirmed!');
        }
        
        console.log('\n🕐 Browser staying open for 20 seconds for inspection...');
        await page.waitForTimeout(20000);
        
    } catch (error) {
        console.error('❌ Extraction failed:', error);
    } finally {
        await browser.close();
        console.log('📊 Extract and Validate completed');
    }
}

// Run the extraction and validation
extractAndValidate().catch(console.error); 