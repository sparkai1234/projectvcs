import { Actor } from 'apify';

// Duplication Checker for DIVA Scraped Data
// Focuses on identifying duplicate records, especially in 재무제표 sections

async function analyzeScrapedData() {
    console.log('🔍 Starting DIVA Data Duplication Analysis...');
    
    // Initialize Apify to access the scraped dataset
    await Actor.init();
    
    try {
        // Get the dataset from the last run
        const dataset = await Actor.openDataset();
        const { items } = await dataset.getData();
        
        console.log(`📊 Total scraped records: ${items.length}`);
        
        // Group data by menu
        const dataByMenu = {};
        items.forEach(item => {
            const menu = item.menuName || 'unknown';
            if (!dataByMenu[menu]) {
                dataByMenu[menu] = [];
            }
            dataByMenu[menu].push(item);
        });
        
        // Analyze each menu for duplicates
        for (const [menuName, records] of Object.entries(dataByMenu)) {
            console.log(`\n🎯 ANALYZING ${menuName.toUpperCase()}: ${records.length} records`);
            
            if (menuName.includes('재무제표') || menuName === '재무제표') {
                await analyze재무제표Duplicates(records, menuName);
            } else {
                await analyzeGeneralDuplicates(records, menuName);
            }
        }
        
        // Cross-menu duplicate analysis
        await analyzeCrossMenuDuplicates(dataByMenu);
        
    } catch (error) {
        console.error('❌ Error analyzing data:', error.message);
    }
    
    await Actor.exit();
}

async function analyze재무제표Duplicates(records, menuName) {
    console.log(`\n🏦 DETAILED 재무제표 ANALYSIS for ${menuName}`);
    
    // Sample data structure analysis
    if (records.length > 0) {
        console.log('\n📋 Sample record structure:');
        const sample = records[0];
        console.log('Keys:', Object.keys(sample));
        console.log('Row data sample:', sample.rowData ? sample.rowData.slice(0, 8) : 'No rowData');
    }
    
    // Duplicate detection strategies for 재무제표
    const duplicateStrategies = [
        {
            name: 'Company Name + Full Row',
            key: (record) => {
                if (!record.rowData || record.rowData.length < 5) return null;
                return `${record.rowData[0]}|${record.rowData.join('|')}`;
            }
        },
        {
            name: 'Company Name + Source + Month',
            key: (record) => {
                if (!record.rowData || record.rowData.length < 5) return null;
                return `${record.rowData[0]}|${record.rowData[1]}|${record.rowData[2]}`;
            }
        },
        {
            name: 'Company Name + Accounting Standard',
            key: (record) => {
                if (!record.rowData || record.rowData.length < 5) return null;
                return `${record.rowData[0]}|${record.rowData[3]}|${record.rowData[4]}`;
            }
        },
        {
            name: 'Company Name Only',
            key: (record) => {
                if (!record.rowData || record.rowData.length < 1) return null;
                return record.rowData[0];
            }
        }
    ];
    
    for (const strategy of duplicateStrategies) {
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
        
        console.log(`   📊 Total groups: ${Object.keys(groups).length}`);
        console.log(`   ⚠️ Null keys: ${nullKeys}`);
        console.log(`   🔄 Duplicate groups: ${duplicateGroups.length}`);
        console.log(`   📈 Duplicate records: ${duplicateGroups.reduce((sum, [key, group]) => sum + group.length, 0)}`);
        
        // Show top duplicates
        if (duplicateGroups.length > 0) {
            console.log(`\n   🎯 Top 5 duplicate groups:`);
            duplicateGroups
                .sort((a, b) => b[1].length - a[1].length)
                .slice(0, 5)
                .forEach(([key, group], i) => {
                    console.log(`      ${i+1}. "${key.substring(0, 50)}..." - ${group.length} duplicates`);
                    
                    // Show sample of duplicated records
                    if (group.length > 1) {
                        group.slice(0, 3).forEach((item, j) => {
                            const rowData = item.record.rowData || [];
                            console.log(`         Sample ${j+1}: [${rowData.slice(0, 6).join(', ')}]`);
                        });
                    }
                });
        }
    }
    
    // Analyze data quality issues
    console.log(`\n🔬 DATA QUALITY ANALYSIS:`);
    let emptyRows = 0;
    let shortRows = 0;
    let headerRows = 0;
    
    records.forEach(record => {
        if (!record.rowData || record.rowData.length === 0) {
            emptyRows++;
        } else if (record.rowData.length < 8) {
            shortRows++;
        } else if (record.rowData[0]?.includes('회사명') || record.rowData[0]?.includes('재원')) {
            headerRows++;
        }
    });
    
    console.log(`   📊 Empty rows: ${emptyRows}`);
    console.log(`   📏 Short rows (<8 columns): ${shortRows}`);
    console.log(`   📋 Header-like rows: ${headerRows}`);
    console.log(`   ✅ Clean rows: ${records.length - emptyRows - shortRows - headerRows}`);
}

async function analyzeGeneralDuplicates(records, menuName) {
    console.log(`\n📊 GENERAL DUPLICATE ANALYSIS for ${menuName}`);
    
    if (records.length === 0) {
        console.log('   ℹ️ No records to analyze');
        return;
    }
    
    // Sample structure
    const sample = records[0];
    console.log(`   📋 Sample keys: ${Object.keys(sample).join(', ')}`);
    
    // Simple duplicate detection based on full row content
    const rowHashes = {};
    let duplicates = 0;
    
    records.forEach((record, index) => {
        const rowKey = record.rowData ? record.rowData.join('|') : `empty-${index}`;
        
        if (rowHashes[rowKey]) {
            duplicates++;
        } else {
            rowHashes[rowKey] = true;
        }
    });
    
    console.log(`   🔄 Exact duplicates found: ${duplicates}`);
    console.log(`   ✅ Unique records: ${Object.keys(rowHashes).length}`);
    
    // Company name duplicate analysis (if applicable)
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
            duplicateCompanies.slice(0, 5).forEach(([company, count], i) => {
                console.log(`      ${i+1}. "${company}" - ${count} records`);
            });
        }
    }
}

async function analyzeCrossMenuDuplicates(dataByMenu) {
    console.log(`\n🔗 CROSS-MENU DUPLICATE ANALYSIS`);
    
    // Compare company names across different menus
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
    
    // Find companies that appear in multiple menus
    const crossMenuCompanies = Object.entries(allCompanies)
        .filter(([company, menus]) => new Set(menus).size > 1)
        .map(([company, menus]) => ({ company, menus: [...new Set(menus)] }))
        .sort((a, b) => b.menus.length - a.menus.length);
    
    console.log(`   📊 Total unique companies: ${Object.keys(allCompanies).length}`);
    console.log(`   🔗 Companies in multiple menus: ${crossMenuCompanies.length}`);
    
    if (crossMenuCompanies.length > 0) {
        console.log(`\n   🎯 Top cross-menu companies:`);
        crossMenuCompanies.slice(0, 10).forEach(({ company, menus }, i) => {
            console.log(`      ${i+1}. "${company}" - appears in: ${menus.join(', ')}`);
        });
    }
    
    // Menu size comparison
    console.log(`\n📊 MENU SIZE COMPARISON:`);
    const expectedSizes = {
        '투자실적': 333,
        '재무제표-재무상태표': 250,
        '재무제표-손익계산서': 250,
        '조합현황': 2231,
        '인력현황': 251,
        '전문인력현황': 1685,
        '법규위반현황': 92,
        'VC MAP': 251
    };
    
    for (const [menuName, records] of Object.entries(dataByMenu)) {
        const actual = records.length;
        const expected = expectedSizes[menuName] || 'unknown';
        const ratio = expected !== 'unknown' ? (actual / expected * 100).toFixed(1) + '%' : 'N/A';
        const status = expected !== 'unknown' && actual > expected * 1.1 ? '⚠️ Over-extracted' : 
                     expected !== 'unknown' && actual < expected * 0.9 ? '⚠️ Under-extracted' : '✅ Normal';
        
        console.log(`   ${status} ${menuName}: ${actual}/${expected} (${ratio})`);
    }
}

// Run the analysis
analyzeScrapedData(); 