import fs from 'fs';

// Simple Duplicate Analysis based on the main.js extraction logic
console.log('🔍 DIVA Scraper Logic Analysis for Potential Duplicates');

// Read the main.js file to understand the extraction logic
const mainJsContent = fs.readFileSync('./main.js', 'utf8');

console.log('\n📊 ANALYZING EXTRACTION LOGIC FOR DUPLICATE SOURCES:');

// Check for potential duplication in 재무제표 sections
console.log('\n🏦 재무제표 EXTRACTION ANALYSIS:');

// Look for the 재무제표 extraction logic
const 재무제표Lines = mainJsContent.split('\n').filter(line => 
    line.includes('재무제표') || line.includes('재무상태표') || line.includes('손익계산서')
);

console.log('📋 재무제표 Related Lines:');
재무제표Lines.forEach((line, i) => {
    if (line.trim()) {
        console.log(`   ${i+1}. ${line.trim()}`);
    }
});

// Analyze extractAllTableData function
console.log('\n🔍 extractAllTableData FUNCTION ANALYSIS:');
const extractFunctionMatch = mainJsContent.match(/async function extractAllTableData[\s\S]*?(?=\n    \/\/|async function|\nconst|\n})/);

if (extractFunctionMatch) {
    console.log('✅ Found extractAllTableData function');
    
    // Check for potential duplicate sources
    const functionCode = extractFunctionMatch[0];
    
    console.log('\n⚠️ POTENTIAL DUPLICATE SOURCES:');
    
    // Check if it processes multiple tables
    if (functionCode.includes('tables.forEach')) {
        console.log('   🔄 Multiple tables are being processed - potential for duplicates');
    }
    
    // Check if it skips headers properly
    if (functionCode.includes('rowIndex === 0')) {
        console.log('   ✅ Header row skipping detected');
    } else {
        console.log('   ⚠️ No header row skipping - may include headers as data');
    }
    
    // Check for table selector logic
    const tableSelectors = functionCode.match(/querySelectorAll\('([^']+)'\)/g);
    if (tableSelectors) {
        console.log('\n   📊 Table selectors used:');
        tableSelectors.forEach(selector => {
            console.log(`      - ${selector}`);
        });
    }
} else {
    console.log('❌ extractAllTableData function not found');
}

// Analyze validation logic for 재무제표
console.log('\n🔬 재무제표 VALIDATION LOGIC ANALYSIS:');
const 재무제표ValidationMatch = mainJsContent.match(/case '재무제표':[\s\S]*?break;/);

if (재무제표ValidationMatch) {
    console.log('✅ Found 재무제표 validation logic');
    
    const validationCode = 재무제표ValidationMatch[0];
    
    // Check validation strictness
    if (validationCode.includes('cells.length >= 10')) {
        console.log('   📏 Minimum column requirement: 10 columns');
    }
    
    if (validationCode.includes('companyName.length >= 2')) {
        console.log('   📝 Company name min length: 2 characters');
    }
    
    // Check for account type validation
    if (validationCode.includes('계정')) {
        console.log('   🏦 Account type validation present');
    }
    
    // Check for financial data validation
    if (validationCode.includes('hasFinancialData')) {
        console.log('   💰 Financial data validation present');
    }
    
    // Identify potential over-extraction causes
    console.log('\n   ⚠️ POTENTIAL OVER-EXTRACTION CAUSES:');
    
    if (validationCode.includes('validFinancialFields >= (cells.length - 6) * 0.7')) {
        console.log('   - 70% threshold may be too lenient');
    }
    
    if (validationCode.includes('month && (month === \'12\' || month === \'12월\' || /^12/.test(month))')) {
        console.log('   - Month validation accepts variations (12, 12월, starts with 12)');
    }
    
    if (validationCode.includes('accountStandard.includes(')) {
        console.log('   - Accounting standard uses partial matching');
    }
}

// Check how 재무제표 tabs are handled
console.log('\n📑 재무제표 TAB HANDLING ANALYSIS:');

// Look for tab switching logic
if (mainJsContent.includes('손익계산서Tab')) {
    console.log('✅ Tab switching logic found');
    
    // Check if both tabs extract from same tables
    const balanceSheetExtraction = mainJsContent.includes('extractAllTableData(\'재무제표\')');
    const incomeStatementExtraction = mainJsContent.includes('extractAllTableData(\'재무제표\')');
    
    if (balanceSheetExtraction && incomeStatementExtraction) {
        console.log('⚠️ MAJOR ISSUE: Both tabs use extractAllTableData(\'재무제표\')');
        console.log('   This means both tabs extract the same data type!');
        console.log('   📊 재무상태표: extractAllTableData(\'재무제표\')');
        console.log('   📊 손익계산서: extractAllTableData(\'재무제표\')');
        console.log('   🔄 This could cause similar records in both sections');
    }
} else {
    console.log('❌ No tab switching logic found');
}

// Provide recommendations
console.log('\n💡 RECOMMENDATIONS FOR DUPLICATE PREVENTION:');

console.log('1. 재무제표 Tab Differentiation:');
console.log('   - Use extractAllTableData(\'재무상태표\') for balance sheet');
console.log('   - Use extractAllTableData(\'손익계산서\') for income statement');
console.log('   - Add tab-specific validation logic');

console.log('\n2. Validation Strictness:');
console.log('   - Reduce 70% financial field threshold to 80-90%');
console.log('   - Add more specific field validation');
console.log('   - Implement row uniqueness checks');

console.log('\n3. Table Extraction Logic:');
console.log('   - Add duplicate row detection within extraction');
console.log('   - Implement row hashing to prevent identical records');
console.log('   - Add tab-specific CSS selectors');

console.log('\n📈 EXPECTED IMPROVEMENTS:');
console.log('   - 재무상태표: Should stabilize around 250 records');
console.log('   - 손익계산서: Should stabilize around 250 records');
console.log('   - Total improvement: Reduce over-extraction from 194% to ~100%'); 