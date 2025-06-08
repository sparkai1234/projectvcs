import fs from 'fs';
import path from 'path';

// Control data baseline counts for matching analysis
const BASELINE_COUNTS = {
    '투자실적': 333,
    '재무상태표': 250,
    '손익계산서': 250,
    '조합현황': 2231,
    '인력현황': 251,
    '전문인력현황': 1685,
    '법규위반현황': 92,
    'VC MAP': 251
};

// Total baseline records: 5,103 rows
const TOTAL_BASELINE_RECORDS = Object.values(BASELINE_COUNTS).reduce((sum, count) => sum + count, 0);

async function runDuplicationAnalysis() {
    console.log('🔍 DIVA SCRAPER DUPLICATION ANALYSIS');
    console.log('====================================\n');
    
    const datasetDir = 'storage/datasets/__CRAWLEE_TEMPORARY_0__';
    
    // Read all JSON files
    const files = fs.readdirSync(datasetDir).filter(f => f.endsWith('.json'));
    console.log(`📁 Found ${files.length} data files\n`);
    
    if (files.length === 0) {
        console.log('❌ No data files found. Make sure the scraper has run and produced data.');
        return;
    }
    
    // Load all data
    const allData = [];
    for (const file of files) {
        try {
            const filePath = path.join(datasetDir, file);
            const content = JSON.parse(fs.readFileSync(filePath, 'utf8'));
            allData.push(content);
        } catch (error) {
            console.log(`⚠️ Error reading ${file}: ${error.message}`);
        }
    }
    
    console.log(`📊 Successfully loaded ${allData.length} records\n`);
    
    // Group data by menu
    const dataByMenu = {};
    allData.forEach(item => {
        const menu = item.menuName || 'unknown';
        if (!dataByMenu[menu]) {
            dataByMenu[menu] = [];
        }
        dataByMenu[menu].push(item);
    });
    
    console.log('📈 DATA DISTRIBUTION BY MENU:');
    console.log('===============================');
    for (const [menuName, records] of Object.entries(dataByMenu)) {
        const expected = BASELINE_COUNTS[menuName] || 'unknown';
        const actual = records.length;
        const percentage = expected !== 'unknown' ? ((actual / expected) * 100).toFixed(1) + '%' : 'N/A';
        const status = expected !== 'unknown' && actual > expected * 1.1 ? '⚠️ Over-extracted' : 
                     expected !== 'unknown' && actual < expected * 0.9 ? '⚠️ Under-extracted' : '✅ Normal';
        
        console.log(`${status} ${menuName}: ${actual}/${expected} (${percentage})`);
    }
    
    // Analyze 재무제표 specifically
    console.log('\n\n🏦 DETAILED 재무제표 DUPLICATION ANALYSIS:');
    console.log('==========================================');
    
    const 재무제표_data = [];
    for (const [menuName, records] of Object.entries(dataByMenu)) {
        if (menuName.includes('재무상태표') || menuName.includes('손익계산서')) {
            재무제표_data.push(...records.map(r => ({...r, sourceMenu: menuName})));
        }
    }
    
    if (재무제표_data.length > 0) {
        await analyze재무제표Duplicates(재무제표_data);
    } else {
        console.log('❌ No 재무제표 data found');
    }
    
    // Overall duplication analysis
    console.log('\n\n📊 OVERALL DUPLICATION ANALYSIS:');
    console.log('===============================');
    for (const [menuName, records] of Object.entries(dataByMenu)) {
        await analyzeMenuDuplicates(menuName, records);
    }
    
    // Cross-menu analysis
    await analyzeCrossMenuDuplicates(dataByMenu);
    
    // Generate matching percentage report
    generateMatchingReport(dataByMenu);
}

async function analyze재무제표Duplicates(records) {
    console.log(`\n🔍 Analyzing ${records.length} 재무제표 records...\n`);
    
    // Sample data structure
    if (records.length > 0) {
        console.log('📋 Sample record structure:');
        const sample = records[0];
        console.log('   Keys:', Object.keys(sample));
        console.log('   Row data sample:', sample.rowData ? sample.rowData.slice(0, 8) : 'No rowData');
        console.log('   Source menu:', sample.sourceMenu || 'unknown');
    }
    
    // 재무제표 duplication strategies
    const strategies = [
        {
            name: 'Full Row Content',
            key: (record) => record.rowData ? record.rowData.join('|') : 'empty'
        },
        {
            name: 'Company Name + Financial Values',
            key: (record) => {
                if (!record.rowData || record.rowData.length < 6) return null;
                return `${record.rowData[0]}|${record.rowData.slice(5).join('|')}`;
            }
        },
        {
            name: 'Company Name + Accounting Period',
            key: (record) => {
                if (!record.rowData || record.rowData.length < 3) return null;
                return `${record.rowData[0]}|${record.rowData[2]}`;
            }
        },
        {
            name: 'Company Name Only',
            key: (record) => record.rowData && record.rowData.length > 0 ? record.rowData[0] : null
        }
    ];
    
    for (const strategy of strategies) {
        console.log(`\n🔍 Strategy: ${strategy.name}`);
        
        const groups = {};
        let nullKeys = 0;
        
        records.forEach((record, index) => {
            const key = strategy.key(record);
            if (key === null) {
                nullKeys++;
                return;
            }
            
            if (!groups[key]) {
                groups[key] = [];
            }
            groups[key].push({ record, index });
        });
        
        const duplicateGroups = Object.entries(groups).filter(([key, group]) => group.length > 1);
        const totalDuplicates = duplicateGroups.reduce((sum, [key, group]) => sum + group.length, 0);
        
        console.log(`   📊 Total groups: ${Object.keys(groups).length}`);
        console.log(`   ⚠️ Null keys: ${nullKeys}`);
        console.log(`   🔄 Duplicate groups: ${duplicateGroups.length}`);
        console.log(`   📈 Total duplicate records: ${totalDuplicates}`);
        console.log(`   💯 Duplication rate: ${((totalDuplicates / records.length) * 100).toFixed(1)}%`);
        
        // Show top duplicates
        if (duplicateGroups.length > 0) {
            console.log(`\n   🎯 Top 5 duplicate groups:`);
            duplicateGroups
                .sort((a, b) => b[1].length - a[1].length)
                .slice(0, 5)
                .forEach(([key, group], i) => {
                    console.log(`      ${i+1}. "${key.substring(0, 60)}..." - ${group.length} duplicates`);
                    
                    // Show source menus for this duplicate group
                    const menus = group.map(item => item.record.sourceMenu).filter(Boolean);
                    const uniqueMenus = [...new Set(menus)];
                    if (uniqueMenus.length > 1) {
                        console.log(`         ⚠️ Cross-menu duplicates: ${uniqueMenus.join(', ')}`);
                    }
                    
                    // Show sample data
                    group.slice(0, 2).forEach((item, j) => {
                        const rowData = item.record.rowData || [];
                        console.log(`         Sample ${j+1}: [${rowData.slice(0, 6).join(', ')}${rowData.length > 6 ? ', ...' : ''}]`);
                    });
                });
        }
    }
}

async function analyzeMenuDuplicates(menuName, records) {
    console.log(`\n📊 ${menuName}: ${records.length} records`);
    
    if (records.length === 0) return;
    
    // Full row duplicates
    const rowHashes = {};
    let exactDuplicates = 0;
    
    records.forEach(record => {
        const rowKey = record.rowData ? record.rowData.join('|') : 'empty';
        if (rowHashes[rowKey]) {
            exactDuplicates++;
        } else {
            rowHashes[rowKey] = true;
        }
    });
    
    console.log(`   🔄 Exact duplicates: ${exactDuplicates}`);
    console.log(`   ✅ Unique records: ${Object.keys(rowHashes).length}`);
    
    // Company name analysis (if applicable)
    if (records[0]?.rowData && records[0].rowData.length > 0) {
        const companyGroups = {};
        
        records.forEach(record => {
            if (record.rowData && record.rowData.length > 0) {
                const company = record.rowData[0];
                if (!companyGroups[company]) {
                    companyGroups[company] = 0;
                }
                companyGroups[company]++;
            }
        });
        
        const duplicateCompanies = Object.entries(companyGroups)
            .filter(([company, count]) => count > 1)
            .sort((a, b) => b[1] - a[1]);
        
        console.log(`   🏢 Companies with multiple records: ${duplicateCompanies.length}`);
        if (duplicateCompanies.length > 0) {
            console.log(`   🎯 Top duplicate companies:`);
            duplicateCompanies.slice(0, 3).forEach(([company, count], i) => {
                console.log(`      ${i+1}. "${company}" - ${count} records`);
            });
        }
    }
}

async function analyzeCrossMenuDuplicates(dataByMenu) {
    console.log('\n\n🔗 CROSS-MENU DUPLICATE ANALYSIS:');
    console.log('================================');
    
    const allCompanies = {};
    
    for (const [menuName, records] of Object.entries(dataByMenu)) {
        records.forEach(record => {
            if (record.rowData && record.rowData.length > 0) {
                const company = record.rowData[0];
                if (!allCompanies[company]) {
                    allCompanies[company] = [];
                }
                allCompanies[company].push(menuName);
            }
        });
    }
    
    const crossMenuCompanies = Object.entries(allCompanies)
        .filter(([company, menus]) => new Set(menus).size > 1)
        .map(([company, menus]) => ({ company, menus: [...new Set(menus)] }))
        .sort((a, b) => b.menus.length - a.menus.length);
    
    console.log(`📊 Total unique companies: ${Object.keys(allCompanies).length}`);
    console.log(`🔗 Companies in multiple menus: ${crossMenuCompanies.length}`);
    
    if (crossMenuCompanies.length > 0) {
        console.log(`\n🎯 Top cross-menu companies:`);
        crossMenuCompanies.slice(0, 10).forEach(({ company, menus }, i) => {
            console.log(`   ${i+1}. "${company}" - appears in: ${menus.join(', ')}`);
        });
    }
}

function generateMatchingReport(dataByMenu) {
    console.log('\n\n📈 CONTROL DATA MATCHING REPORT:');
    console.log('===============================');
    
    let totalActual = 0;
    let totalExpected = 0;
    let perfectMatches = 0;
    let overExtractions = 0;
    let underExtractions = 0;
    
    const results = [];
    
    for (const [menuName, records] of Object.entries(dataByMenu)) {
        const actual = records.length;
        const expected = BASELINE_COUNTS[menuName];
        
        if (expected !== undefined) {
            totalActual += actual;
            totalExpected += expected;
            
            const matchPercentage = ((actual / expected) * 100).toFixed(1);
            const status = actual === expected ? 'Perfect' : 
                          actual > expected ? 'Over-extracted' : 'Under-extracted';
            
            if (actual === expected) perfectMatches++;
            else if (actual > expected) overExtractions++;
            else underExtractions++;
            
            results.push({
                menu: menuName,
                actual,
                expected,
                percentage: matchPercentage,
                status,
                difference: actual - expected
            });
        }
    }
    
    // Sort by difference (largest over-extraction first)
    results.sort((a, b) => Math.abs(b.difference) - Math.abs(a.difference));
    
    console.log('Menu-by-Menu Results:');
    results.forEach(({ menu, actual, expected, percentage, status, difference }) => {
        const icon = status === 'Perfect' ? '✅' : status === 'Over-extracted' ? '⚠️' : '❌';
        const diffText = difference > 0 ? `+${difference}` : difference.toString();
        console.log(`${icon} ${menu}: ${actual}/${expected} (${percentage}%) ${diffText}`);
    });
    
    // Overall statistics
    const overallPercentage = ((totalActual / totalExpected) * 100).toFixed(1);
    
    console.log('\nOVERALL SUMMARY:');
    console.log(`📊 Total Records: ${totalActual}/${totalExpected} (${overallPercentage}%)`);
    console.log(`✅ Perfect matches: ${perfectMatches}`);
    console.log(`⚠️ Over-extractions: ${overExtractions}`);
    console.log(`❌ Under-extractions: ${underExtractions}`);
    
    const dataQuality = totalActual >= totalExpected * 0.9 && totalActual <= totalExpected * 1.1 ? 
                       'EXCELLENT' : totalActual >= totalExpected * 0.7 ? 'GOOD' : 'NEEDS IMPROVEMENT';
    
    console.log(`🎯 Data Quality: ${dataQuality}`);
    
    // Duplication concerns
    const duplicateIssues = results.filter(r => r.percentage > 150);
    if (duplicateIssues.length > 0) {
        console.log('\n⚠️ POTENTIAL DUPLICATION ISSUES:');
        duplicateIssues.forEach(({ menu, percentage }) => {
            console.log(`   - ${menu}: ${percentage}% (possible over-extraction due to duplicates)`);
        });
    }
}

// Run the analysis
runDuplicationAnalysis().catch(console.error);