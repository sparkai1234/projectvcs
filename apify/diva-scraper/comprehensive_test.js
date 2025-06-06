const { Actor } = require('apify');
const { PuppeteerCrawler } = require('crawlee');

/**
 * 🧪 Comprehensive DIVA Data Extraction Test
 * Tests all 8 data sources to ensure complete coverage
 */

async function comprehensiveTest() {
    console.log('🧪 Starting Comprehensive DIVA Test...');
    
    const testResults = {
        investment_performance: false,
        financial_statements: false,
        association_status: false,
        personnel_status: false,
        professional_personnel: false,
        violations: false,
        vc_map: false,
        statistics: false
    };
    
    // Test configuration
    const testConfig = {
        maxPages: 1,
        delay: 2000,
        headless: true, // Faster for comprehensive test
        exportToSupabase: false
    };
    
    console.log('📋 Testing all 8 DIVA data sources...');
    
    // Setup crawler
    const crawler = new PuppeteerCrawler({
        launchContext: {
            launchOptions: {
                headless: testConfig.headless,
                args: ['--no-sandbox', '--disable-setuid-sandbox', '--disable-dev-shm-usage']
            }
        },
        
        requestHandlerTimeoutSecs: 120,
        
        requestHandler: async ({ page, request }) => {
            console.log(`🔍 Testing: ${request.userData.dataSource}`);
            
            try {
                await page.waitForSelector('body', { timeout: 30000 });
                await sleep(testConfig.delay);
                
                const dataSource = request.userData.dataSource;
                let extractedCount = 0;
                
                // Test each data source
                switch (dataSource) {
                    case 'investment_performance':
                        extractedCount = await testInvestmentPerformance(page);
                        break;
                    case 'financial_statements':
                        extractedCount = await testFinancialStatements(page);
                        break;
                    case 'association_status':
                        extractedCount = await testAssociationStatus(page);
                        break;
                    case 'personnel_status':
                        extractedCount = await testPersonnelStatus(page);
                        break;
                    case 'professional_personnel':
                        extractedCount = await testProfessionalPersonnel(page);
                        break;
                    case 'violations':
                        extractedCount = await testViolations(page);
                        break;
                    case 'vc_map':
                        extractedCount = await testVCMap(page);
                        break;
                    case 'statistics':
                        extractedCount = await testStatistics(page);
                        break;
                }
                
                testResults[dataSource] = extractedCount > 0;
                console.log(`✅ ${dataSource}: ${extractedCount} records extracted - ${testResults[dataSource] ? 'PASS' : 'FAIL'}`);
                
            } catch (error) {
                console.error(`❌ Test failed for ${request.userData.dataSource}:`, error.message);
                testResults[request.userData.dataSource] = false;
            }
        }
    });
    
    // Test all data sources
    const testRequests = [
        { url: 'http://diva.kvca.or.kr/div/dii/DivItmInvstPrfmInq', userData: { dataSource: 'investment_performance' } },
        { url: 'http://diva.kvca.or.kr/div/dii/DivItmFsInq', userData: { dataSource: 'financial_statements' } },
        { url: 'http://diva.kvca.or.kr/div/dii/DivItmAssoInq', userData: { dataSource: 'association_status' } },
        { url: 'http://diva.kvca.or.kr/div/dii/DivItmMnpwrInq', userData: { dataSource: 'personnel_status' } },
        { url: 'http://diva.kvca.or.kr/div/dii/DivItmProfsInq', userData: { dataSource: 'professional_personnel' } },
        { url: 'http://diva.kvca.or.kr/div/dii/DivItmViolInq', userData: { dataSource: 'violations' } },
        { url: 'http://diva.kvca.or.kr/div/dii/DivItmVcmapInq', userData: { dataSource: 'vc_map' } },
        { url: 'http://diva.kvca.or.kr/div/cmn/DivStatsMainInq', userData: { dataSource: 'statistics' } }
    ];
    
    await crawler.run(testRequests);
    
    // Print results
    console.log('\n📊 COMPREHENSIVE TEST RESULTS:');
    console.log('=====================================');
    
    let passCount = 0;
    Object.entries(testResults).forEach(([source, passed]) => {
        const status = passed ? '✅ PASS' : '❌ FAIL';
        console.log(`${status} ${source.replace('_', ' ').toUpperCase()}`);
        if (passed) passCount++;
    });
    
    console.log('=====================================');
    console.log(`📈 Overall Score: ${passCount}/${Object.keys(testResults).length} data sources working`);
    console.log(`🎯 Success Rate: ${Math.round((passCount/Object.keys(testResults).length) * 100)}%`);
    
    if (passCount === Object.keys(testResults).length) {
        console.log('🎉 ALL TESTS PASSED! DIVA scraper is ready for production!');
    } else {
        console.log('⚠️ Some tests failed. Check the failed data sources above.');
    }
    
    return testResults;
}

// Individual test functions
async function testInvestmentPerformance(page) {
    const data = await page.evaluate(() => {
        const rows = document.querySelectorAll('table tbody tr, table tr');
        return Array.from(rows).filter(row => row.querySelectorAll('td').length >= 7).length;
    });
    return data;
}

async function testFinancialStatements(page) {
    const data = await page.evaluate(() => {
        const rows = document.querySelectorAll('table tbody tr, table tr');
        return Array.from(rows).filter(row => row.querySelectorAll('td').length >= 9).length;
    });
    return data;
}

async function testAssociationStatus(page) {
    const data = await page.evaluate(() => {
        const rows = document.querySelectorAll('table tbody tr, table tr');
        return Array.from(rows).filter(row => row.querySelectorAll('td').length >= 9).length;
    });
    return data;
}

async function testPersonnelStatus(page) {
    const data = await page.evaluate(() => {
        const rows = document.querySelectorAll('table tbody tr, table tr');
        return Array.from(rows).filter(row => row.querySelectorAll('td').length >= 4).length;
    });
    return data;
}

async function testProfessionalPersonnel(page) {
    const data = await page.evaluate(() => {
        const rows = document.querySelectorAll('table tbody tr, table tr');
        return Array.from(rows).filter(row => row.querySelectorAll('td').length >= 5).length;
    });
    return data;
}

async function testViolations(page) {
    const data = await page.evaluate(() => {
        const rows = document.querySelectorAll('table tbody tr, table tr');
        return Array.from(rows).filter(row => row.querySelectorAll('td').length >= 7).length;
    });
    return data;
}

async function testVCMap(page) {
    const data = await page.evaluate(() => {
        const rows = document.querySelectorAll('table tbody tr, table tr');
        return Array.from(rows).filter(row => row.querySelectorAll('td').length >= 4).length;
    });
    return data;
}

async function testStatistics(page) {
    const data = await page.evaluate(() => {
        const pdfLinks = document.querySelectorAll('a[href*=".pdf"], a[href*="download"]');
        const tableRows = document.querySelectorAll('table tbody tr, table tr');
        return Math.max(pdfLinks.length, tableRows.length);
    });
    return data;
}

function sleep(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
}

// Run the test
if (require.main === module) {
    comprehensiveTest().catch(console.error);
}

module.exports = { comprehensiveTest }; 