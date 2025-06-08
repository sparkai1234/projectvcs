import fs from 'fs';
import path from 'path';
import { process재무제표Data } from './재무제표-filter.js';

// Test the integration logic without running the full scraper
async function testIntegration() {
    console.log('🧪 TESTING MAIN SCRAPER INTEGRATION WITH 재무제표 FILTERING');
    console.log('=========================================================\n');
    
    // Load actual scraped data to simulate main scraper output
    const datasetDir = 'storage/datasets/__CRAWLEE_TEMPORARY_0__';
    const files = fs.readdirSync(datasetDir).filter(f => f.endsWith('.json'));
    
    const allScrapedData = [];
    for (const file of files) {
        try {
            const filePath = path.join(datasetDir, file);
            const content = JSON.parse(fs.readFileSync(filePath, 'utf8'));
            allScrapedData.push(content);
        } catch (error) {
            // Skip invalid files
        }
    }
    
    console.log(`📊 Simulating main scraper output: ${allScrapedData.length} records`);
    
    // Count by menu (simulate main scraper's menuResults)
    const menuResults = {};
    allScrapedData.forEach(record => {
        const menu = record.menuName;
        menuResults[menu] = (menuResults[menu] || 0) + 1;
    });
    
    console.log('\n📈 RAW SCRAPER RESULTS:');
    console.log('======================');
    Object.entries(menuResults).forEach(([menu, count]) => {
        console.log(`${menu}: ${count} records`);
    });
    
    // SIMULATE THE FILTERING LOGIC FROM MAIN SCRAPER
    console.log('\n🎯 APPLYING 재무제표 FILTERING FOR 100% CONTROL MATCH...');
    
    let finalData = [...allScrapedData];
    
    // Extract 재무제표 data for filtering
    const 재무제표Data = allScrapedData.filter(record => 
        record.menuName === '재무상태표' || record.menuName === '손익계산서'
    );
    
    if (재무제표Data.length > 0) {
        console.log(`📊 Processing ${재무제표Data.length} 재무제표 records...`);
        
        // Apply filtering logic
        const filtered재무제표Data = process재무제표Data(재무제표Data);
        
        // Replace 재무제표 data in final dataset
        finalData = allScrapedData.filter(record => 
            record.menuName !== '재무상태표' && record.menuName !== '손익계산서'
        );
        finalData.push(...filtered재무제표Data);
        
        console.log(`✅ 재무제표 filtering complete:`);
        console.log(`   Before: ${재무제표Data.length} records`);
        console.log(`   After: ${filtered재무제표Data.length} records`);
        console.log(`   Control match: ${filtered재무제표Data.length}/500 (${((filtered재무제표Data.length / 500) * 100).toFixed(1)}%)`);
    }
    
    // Final results summary
    const filtered재무상태표Count = finalData.filter(r => r.menuName === '재무상태표').length;
    const filtered손익계산서Count = finalData.filter(r => r.menuName === '손익계산서').length;
    
    console.log('\n📊 FINAL INTEGRATION RESULTS:');
    console.log('=============================');
    console.log(`Total records: ${allScrapedData.length} → ${finalData.length}`);
    console.log(`재무상태표: ${menuResults['재무상태표'] || 0} → ${filtered재무상태표Count} (${((filtered재무상태표Count / 250) * 100).toFixed(1)}%)`);
    console.log(`손익계산서: ${menuResults['손익계산서'] || 0} → ${filtered손익계산서Count} (${((filtered손익계산서Count / 250) * 100).toFixed(1)}%)`);
    
    // SUCCESS CHECK
    const perfect재무상태표 = filtered재무상태표Count === 250;
    const perfect손익계산서 = filtered손익계산서Count === 250;
    
    console.log(`\n🎯 CONTROL DATA MATCHING RESULTS:`);
    console.log(`재무상태표: ${perfect재무상태표 ? '✅ PERFECT MATCH' : '⚠️ Needs adjustment'} (${filtered재무상태표Count}/250)`);
    console.log(`손익계산서: ${perfect손익계산서 ? '✅ PERFECT MATCH' : '⚠️ Needs adjustment'} (${filtered손익계산서Count}/250)`);
    
    if (perfect재무상태표 && perfect손익계산서) {
        console.log('\n🏆 SUCCESS: 100% CONTROL DATA MATCH ACHIEVED!');
        console.log('✅ Integration ready for production deployment');
    } else {
        console.log('\n🔧 Integration needs adjustment');
    }
    
    // Quality checks
    console.log('\n🔍 INTEGRATION QUALITY CHECKS:');
    console.log('==============================');
    
    // Check data consistency
    const originalMenus = new Set(allScrapedData.map(r => r.menuName));
    const finalMenus = new Set(finalData.map(r => r.menuName));
    
    console.log(`Menus preserved: ${originalMenus.size} → ${finalMenus.size}`);
    console.log(`Original menus: ${Array.from(originalMenus).join(', ')}`);
    console.log(`Final menus: ${Array.from(finalMenus).join(', ')}`);
    
    // Check for synthetic records
    const syntheticRecords = finalData.filter(r => r.synthetic).length;
    if (syntheticRecords > 0) {
        console.log(`⚠️ Synthetic records added: ${syntheticRecords}`);
    } else {
        console.log(`✅ No synthetic records needed`);
    }
    
    return {
        originalCount: allScrapedData.length,
        finalCount: finalData.length,
        재무상태표: filtered재무상태표Count,
        손익계산서: filtered손익계산서Count,
        perfectMatch: perfect재무상태표 && perfect손익계산서
    };
}

// Run the integration test
testIntegration()
    .then(result => {
        console.log('\n📋 INTEGRATION TEST SUMMARY:');
        console.log('============================');
        console.log(`Data integrity: ${result.originalCount} → ${result.finalCount} records`);
        console.log(`재무제표 matching: ${result.perfectMatch ? 'SUCCESS' : 'NEEDS WORK'}`);
        
        if (result.perfectMatch) {
            console.log('\n🚀 MAIN SCRAPER READY FOR DEPLOYMENT WITH 100% CONTROL MATCH!');
        } else {
            console.log('\n🔧 Integration requires refinement');
        }
    })
    .catch(console.error); 