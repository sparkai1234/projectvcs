import fs from 'fs';
import path from 'path';

async function analyze재무제표Structure() {
    console.log('🔍 ANALYZING 재무제표 DATA STRUCTURE FOR FILTERING LOGIC');
    console.log('====================================================\n');
    
    const datasetDir = 'storage/datasets/__CRAWLEE_TEMPORARY_0__';
    const files = fs.readdirSync(datasetDir).filter(f => f.endsWith('.json'));
    
    const 재무상태표_data = [];
    const 손익계산서_data = [];
    
    // Load all 재무제표 data
    for (const file of files) {
        try {
            const filePath = path.join(datasetDir, file);
            const content = JSON.parse(fs.readFileSync(filePath, 'utf8'));
            
            if (content.menuName === '재무상태표') {
                재무상태표_data.push(content);
            } else if (content.menuName === '손익계산서') {
                손익계산서_data.push(content);
            }
        } catch (error) {
            // Skip invalid files
        }
    }
    
    console.log(`📊 Data Loaded:`);
    console.log(`   재무상태표: ${재무상태표_data.length} records`);
    console.log(`   손익계산서: ${손익계산서_data.length} records`);
    console.log(`   Target: 250 records each\n`);
    
    // Analyze 재무상태표 structure
    console.log('🏦 재무상태표 ANALYSIS:');
    console.log('========================');
    analyze재무상태표Pattern(재무상태표_data);
    
    // Analyze 손익계산서 structure  
    console.log('\n💰 손익계산서 ANALYSIS:');
    console.log('========================');
    analyze손익계산서Pattern(손익계산서_data);
    
    // Design filtering strategy
    console.log('\n🎯 FILTERING STRATEGY DESIGN:');
    console.log('=============================');
    designFilteringStrategy(재무상태표_data, 손익계산서_data);
}

function analyze재무상태표Pattern(data) {
    // Group by company
    const companyGroups = {};
    data.forEach(record => {
        if (record.rowData && record.rowData.length > 0) {
            const company = record.rowData[0];
            if (!companyGroups[company]) {
                companyGroups[company] = [];
            }
            companyGroups[company].push(record);
        }
    });
    
    const duplicateCompanies = Object.entries(companyGroups)
        .filter(([company, records]) => records.length > 1)
        .sort((a, b) => b[1].length - a[1].length);
    
    console.log(`   📊 Total companies: ${Object.keys(companyGroups).length}`);
    console.log(`   🔄 Companies with multiple records: ${duplicateCompanies.length}`);
    console.log(`   📈 Over-extraction factor: ${(data.length / Object.keys(companyGroups).length).toFixed(2)}x`);
    
    // Analyze patterns in duplicate companies
    if (duplicateCompanies.length > 0) {
        console.log(`\n   🎯 Top companies with multiple records:`);
        duplicateCompanies.slice(0, 5).forEach(([company, records], i) => {
            console.log(`      ${i+1}. ${company}: ${records.length} records`);
            
            // Analyze what makes them different
            const variations = analyzeRecordVariations(records);
            console.log(`         Variations: ${variations.join(', ')}`);
        });
        
        // Find common patterns
        const allRecords = duplicateCompanies.flatMap(([_, records]) => records);
        const patterns = findCommonPatterns(allRecords);
        console.log(`\n   📋 Common variation patterns:`);
        patterns.forEach((pattern, i) => {
            console.log(`      ${i+1}. ${pattern.type}: ${pattern.count} occurrences`);
        });
    }
}

function analyze손익계산서Pattern(data) {
    // Group by company
    const companyGroups = {};
    data.forEach(record => {
        if (record.rowData && record.rowData.length > 0) {
            const company = record.rowData[0];
            if (!companyGroups[company]) {
                companyGroups[company] = [];
            }
            companyGroups[company].push(record);
        }
    });
    
    const duplicateCompanies = Object.entries(companyGroups)
        .filter(([company, records]) => records.length > 1)
        .sort((a, b) => b[1].length - a[1].length);
    
    console.log(`   📊 Total companies: ${Object.keys(companyGroups).length}`);
    console.log(`   🔄 Companies with multiple records: ${duplicateCompanies.length}`);
    console.log(`   📈 Over-extraction factor: ${(data.length / Object.keys(companyGroups).length).toFixed(2)}x`);
    
    if (duplicateCompanies.length > 0) {
        console.log(`\n   🎯 Sample duplicate patterns:`);
        duplicateCompanies.slice(0, 3).forEach(([company, records], i) => {
            console.log(`      ${i+1}. ${company}: ${records.length} records`);
            const variations = analyzeRecordVariations(records);
            console.log(`         Variations: ${variations.join(', ')}`);
        });
    }
}

function analyzeRecordVariations(records) {
    const variations = [];
    
    // Check for different accounting standards (column 3: 회계기준)
    const accountingStandards = [...new Set(records.map(r => r.rowData[3]).filter(Boolean))];
    if (accountingStandards.length > 1) {
        variations.push(`회계기준: ${accountingStandards.join('/')}`);
    }
    
    // Check for different scope types (column 4: 자구주본)
    const scopeTypes = [...new Set(records.map(r => r.rowData[4]).filter(Boolean))];
    if (scopeTypes.length > 1) {
        variations.push(`범위: ${scopeTypes.join('/')}`);
    }
    
    // Check for different source types (column 1: 재원)
    const sourceTypes = [...new Set(records.map(r => r.rowData[1]).filter(Boolean))];
    if (sourceTypes.length > 1) {
        variations.push(`재원: ${sourceTypes.join('/')}`);
    }
    
    // Check for different periods (column 2: 결산월)
    const periods = [...new Set(records.map(r => r.rowData[2]).filter(Boolean))];
    if (periods.length > 1) {
        variations.push(`결산월: ${periods.join('/')}`);
    }
    
    return variations.length > 0 ? variations : ['동일 기준 다중 레코드'];
}

function findCommonPatterns(records) {
    const patterns = {};
    
    records.forEach(record => {
        if (record.rowData && record.rowData.length >= 5) {
            const accountingStd = record.rowData[3] || 'unknown';
            const scopeType = record.rowData[4] || 'unknown';
            const pattern = `${accountingStd}-${scopeType}`;
            
            if (!patterns[pattern]) {
                patterns[pattern] = { type: pattern, count: 0 };
            }
            patterns[pattern].count++;
        }
    });
    
    return Object.values(patterns).sort((a, b) => b.count - a.count);
}

function designFilteringStrategy(재무상태표_data, 손익계산서_data) {
    console.log('🎯 FILTERING STRATEGY:');
    console.log('=====================');
    
    // Priority rules for filtering
    const priorityRules = {
        회계기준: ['K-IFRS', '일반'], // Prefer K-IFRS over 일반
        범위: ['연결', '개별'], // Prefer 연결 over 개별  
        재원: ['고유계정'], // Only 고유계정
        결산월: ['12'] // Only December fiscal year
    };
    
    console.log('📋 Filtering Priority Rules:');
    console.log(`   1. 회계기준: ${priorityRules.회계기준.join(' > ')}`);
    console.log(`   2. 범위: ${priorityRules.범위.join(' > ')}`);
    console.log(`   3. 재원: ${priorityRules.재원.join(' only')}`);
    console.log(`   4. 결산월: ${priorityRules.결산월.join(' only')}`);
    
    // Test filtering on 재무상태표
    console.log('\n🧪 TESTING FILTER ON 재무상태표:');
    const filtered재무상태표 = applyFilteringLogic(재무상태표_data, priorityRules);
    console.log(`   Before: ${재무상태표_data.length} records`);
    console.log(`   After: ${filtered재무상태표.length} records`);
    console.log(`   Target: 250 records`);
    console.log(`   Match: ${((filtered재무상태표.length / 250) * 100).toFixed(1)}%`);
    
    // Test filtering on 손익계산서
    console.log('\n🧪 TESTING FILTER ON 손익계산서:');
    const filtered손익계산서 = applyFilteringLogic(손익계산서_data, priorityRules);
    console.log(`   Before: ${손익계산서_data.length} records`);
    console.log(`   After: ${filtered손익계산서.length} records`);
    console.log(`   Target: 250 records`);
    console.log(`   Match: ${((filtered손익계산서.length / 250) * 100).toFixed(1)}%`);
    
    // If still over, suggest additional filtering
    if (filtered재무상태표.length > 250 || filtered손익계산서.length > 250) {
        console.log('\n⚠️ ADDITIONAL FILTERING NEEDED:');
        suggestAdditionalFiltering(filtered재무상태표, filtered손익계산서);
    } else {
        console.log('\n✅ FILTERING LOGIC SUCCESSFUL!');
    }
}

function applyFilteringLogic(data, priorityRules) {
    // Group by company first
    const companyGroups = {};
    data.forEach(record => {
        if (record.rowData && record.rowData.length >= 5) {
            const company = record.rowData[0];
            if (!companyGroups[company]) {
                companyGroups[company] = [];
            }
            companyGroups[company].push(record);
        }
    });
    
    // Select best record per company
    const filteredRecords = [];
    for (const [company, records] of Object.entries(companyGroups)) {
        const bestRecord = selectBestRecord(records, priorityRules);
        if (bestRecord) {
            filteredRecords.push(bestRecord);
        }
    }
    
    return filteredRecords;
}

function selectBestRecord(records, priorityRules) {
    if (records.length === 1) return records[0];
    
    // Apply priority filtering
    let candidates = records.filter(r => 
        r.rowData[1] === '고유계정' && // Only 고유계정
        r.rowData[2] === '12' // Only December
    );
    
    if (candidates.length === 0) candidates = records; // Fallback
    
    // Prefer K-IFRS over 일반
    const kIfrsRecords = candidates.filter(r => r.rowData[3] === 'K-IFRS');
    if (kIfrsRecords.length > 0) candidates = kIfrsRecords;
    
    // Prefer 연결 over 개별
    const consolidatedRecords = candidates.filter(r => r.rowData[4] === '연결');
    if (consolidatedRecords.length > 0) candidates = consolidatedRecords;
    
    // Return first remaining candidate
    return candidates[0];
}

function suggestAdditionalFiltering(재무상태표, 손익계산서) {
    if (재무상태표.length > 250) {
        const excess = 재무상태표.length - 250;
        console.log(`   재무상태표: Need to remove ${excess} more records`);
        console.log(`   Suggestion: Random sampling or company size filtering`);
    }
    
    if (손익계산서.length > 250) {
        const excess = 손익계산서.length - 250;
        console.log(`   손익계산서: Need to remove ${excess} more records`);
        console.log(`   Suggestion: Random sampling or company size filtering`);
    }
}

// Run the analysis
analyze재무제표Structure().catch(console.error); 