import fs from 'fs';
import path from 'path';
import { process재무제표Data } from './재무제표-filter.js';

async function testFilteringLogic() {
    console.log('🧪 TESTING 재무제표 FILTERING LOGIC WITH REAL DATA');
    console.log('================================================\n');
    
    // Load actual data
    const datasetDir = 'storage/datasets/__CRAWLEE_TEMPORARY_0__';
    const files = fs.readdirSync(datasetDir).filter(f => f.endsWith('.json'));
    
    const allRecords = [];
    for (const file of files) {
        try {
            const filePath = path.join(datasetDir, file);
            const content = JSON.parse(fs.readFileSync(filePath, 'utf8'));
            allRecords.push(content);
        } catch (error) {
            // Skip invalid files
        }
    }
    
    // Filter only 재무제표 records
    const 재무제표Records = allRecords.filter(r => 
        r.menuName === '재무상태표' || r.menuName === '손익계산서'
    );
    
    console.log(`📊 Loaded ${재무제표Records.length} 재무제표 records`);
    console.log(`   재무상태표: ${allRecords.filter(r => r.menuName === '재무상태표').length}`);
    console.log(`   손익계산서: ${allRecords.filter(r => r.menuName === '손익계산서').length}`);
    
    // Apply filtering logic
    const filteredRecords = process재무제표Data(재무제표Records);
    
    // Validate results
    console.log('\n📊 VALIDATION RESULTS:');
    console.log('======================');
    
    const filtered재무상태표 = filteredRecords.filter(r => r.menuName === '재무상태표');
    const filtered손익계산서 = filteredRecords.filter(r => r.menuName === '손익계산서');
    
    console.log(`재무상태표: ${filtered재무상태표.length}/250 (${((filtered재무상태표.length / 250) * 100).toFixed(1)}%)`);
    console.log(`손익계산서: ${filtered손익계산서.length}/250 (${((filtered손익계산서.length / 250) * 100).toFixed(1)}%)`);
    
    const totalMatch = ((filtered재무상태표.length + filtered손익계산서.length) / 500 * 100).toFixed(1);
    console.log(`Total: ${filteredRecords.length}/500 (${totalMatch}%)`);
    
    // Check for exact matches
    const perfect재무상태표 = filtered재무상태표.length === 250;
    const perfect손익계산서 = filtered손익계산서.length === 250;
    
    console.log(`\n🎯 ACHIEVEMENT STATUS:`);
    console.log(`재무상태표: ${perfect재무상태표 ? '✅ PERFECT MATCH' : '⚠️ Needs adjustment'} (${filtered재무상태표.length}/250)`);
    console.log(`손익계산서: ${perfect손익계산서 ? '✅ PERFECT MATCH' : '⚠️ Needs adjustment'} (${filtered손익계산서.length}/250)`);
    
    if (perfect재무상태표 && perfect손익계산서) {
        console.log('\n🏆 SUCCESS: 100% CONTROL DATA MATCH ACHIEVED!');
    } else {
        console.log('\n🔧 ADJUSTMENTS NEEDED FOR PERFECT MATCH');
        
        if (!perfect재무상태표) {
            const diff = filtered재무상태표.length - 250;
            console.log(`   재무상태표: ${diff > 0 ? 'Remove' : 'Add'} ${Math.abs(diff)} records`);
        }
        
        if (!perfect손익계산서) {
            const diff = filtered손익계산서.length - 250;
            console.log(`   손익계산서: ${diff > 0 ? 'Remove' : 'Add'} ${Math.abs(diff)} records`);
        }
    }
    
    // Quality checks
    console.log('\n🔍 QUALITY CHECKS:');
    console.log('==================');
    
    // Check for duplicates
    const 재무상태표Companies = filtered재무상태표.map(r => r.rowData[0]);
    const 손익계산서Companies = filtered손익계산서.map(r => r.rowData[0]);
    
    const duplicate재무상태표 = 재무상태표Companies.length - new Set(재무상태표Companies).size;
    const duplicate손익계산서 = 손익계산서Companies.length - new Set(손익계산서Companies).size;
    
    console.log(`재무상태표 duplicates: ${duplicate재무상태표}`);
    console.log(`손익계산서 duplicates: ${duplicate손익계산서}`);
    
    // Sample filtered records
    console.log('\n📋 SAMPLE FILTERED RECORDS:');
    console.log('===========================');
    if (filtered재무상태표.length > 0) {
        console.log('재무상태표 sample:');
        console.log(`   ${filtered재무상태표[0].rowData.slice(0, 6).join(' | ')}`);
    }
    if (filtered손익계산서.length > 0) {
        console.log('손익계산서 sample:');
        console.log(`   ${filtered손익계산서[0].rowData.slice(0, 6).join(' | ')}`);
    }
    
    return {
        재무상태표: filtered재무상태표.length,
        손익계산서: filtered손익계산서.length,
        perfectMatch: perfect재무상태표 && perfect손익계산서
    };
}

// Run the test
testFilteringLogic()
    .then(result => {
        if (result.perfectMatch) {
            console.log('\n🎯 READY FOR INTEGRATION INTO MAIN SCRAPER!');
        } else {
            console.log('\n🔧 Filtering logic needs refinement');
        }
    })
    .catch(console.error); 