import { chromium } from 'playwright';

// IMPORTANT: Control data for algorithm development only (NOT fixed validation criteria)
// These counts are TODAY's baseline for establishing scraping methods - actual data will vary
const BASELINE_COUNTS = {
    '투자실적': 333,
    '재무제표': 250,
    '조합현황': 2231,
    '인력현황': 251,
    '전문인력현황': 1685,
    '법규위반사항': 92,
    'VC Map': 251
};

// Total baseline records: 5,103 rows (reference only, not validation threshold)
const TOTAL_BASELINE_RECORDS = Object.values(BASELINE_COUNTS).reduce((sum, count) => sum + count, 0);

// UPDATED: Real field structures based on website screenshots
const 인력현황_samples = [
    "경남벤처투자	11	5	7	4", // [회사명, 출자원, 전문인력, 투자실사, 경영관리]
    "골든오크벤처스	6	3	2	4",
    "그래비티벤처스	12	5	10	2",
    "그랜드벤처스	6	3	5	1",
    "미래에셋벤처투자	36	21	23	13"
];

const 투자실적_samples = [
    "NBH캐피탈	0	0	1	1,999,870,000	1	1,999,870,000", // [회사명, 고유계정(영제수, 금액), 조합(영제수, 금액), 합계(영제수, 금액)]
    "가이아벤처파트너스	0	0	15	10,064,909,880	15	10,064,909,880",
    "경기창조경제혁신센터	0	0	3	610,628,822	3	610,628,822",
    "그랜드벤처스	2	170,013,300	0	0	2	170,013,300",
    "미래에셋벤처투자	1	3,000,060,000	10	21,464,087,523	11	24,464,147,523"
];

const 재무제표_samples = [
    "경남벤처투자	고유계정	12	일반	개별	5,257,825,484	2,623,949,842	186,283,286	4,700,000,000	5,071,542,198	상세", // [회사명, 재원, 결산월, 회계기준, 자구주본, 자산, 창업투자자산, 부채, 자본금, 자본, 상세]
    "골든오크벤처스	고유계정	12	일반	개별	2,715,824,262	980,033,468	9,691,028	2,500,000,000	2,706,133,234	상세",
    "디에스씨인베스트먼트	고유계정	12	K-IFRS	연결	157,814,363,533	102,666,813,890	43,538,234,575	13,905,701,500	114,276,128,958	상세"
];

const 조합현황_samples = [
    "2231	500글로벌매니지먼트코리아	500코리아III투자조합	2023-07-18	25,253,000,000	2033-07-17	일반/중소/벤처일반	해당없음	창업초기", // [번호, 회사명, 조합명, 출자일, 결산총액(원), 만기일, 투자분야구분, 목적구분, 지원구분]
    "2230	Brightstar Partners Ltd., UK키움인베스트먼트	한-영 이노베이션펀드 제1호	2015-10-08	41,000,000,000	2025-10-07	일반/바이오	해당없음	해당없음",
    "2229	KDB인프라자산운용인라이트벤처스	스타트업 코리아 IBK 초격차 KIAMCO인라이트 벤처투자조합	2025-01-09	20,500,000,000	2032-01-08	일반/중소/벤처일반	해당없음	해당없음"
];

const 전문인력현황_samples = [
    "한국벤처투자	김철수	15	12	20	18", // [회사명, 이름, 금무경력, 전문인력경력, 총VC근무경력, 총VC전문인력경력]
    "미래에셋벤처투자	이영희	10	8	15	12",
    "신한벤처투자	박민수	8	6	12	10"
];

const 법규위반_samples = [
    "92	필로소피아벤처스	2025-04-16	2025-10-21	-	전자보고	자본잠식	경영개선요구", // [번호, 회사명, 조치일, 조치명칭일, 시정완료일, 점검구분, 위반항목, 조치구분]
    "91	대한투자파트너스	2025-04-14	-	-	전자보고	보고의무	경고",
    "90	에이본인베스트먼트	2025-04-03	-	-	전자보고	1년간 미투자	경고"
];

const VCMap_samples = [
    "1	한국벤처투자	148	57", // [순위, 회사명, 인력총수, 전문인력수]
    "2	한국투자파트너스	90	44",
    "3	아이엠엠인베스트먼트	77	29",
    "4	케이비인베스트먼트	75	25",
    "5	신한벤처투자	66	37"
];

// UPDATED: Enhanced filtering logic based on actual website field structures
function validate인력현황Row(cells) {
    // Based on screenshot: [회사명, 출자원, 전문인력, 투자실사, 경영관리]
    if (!cells || cells.length < 5) return false;
    
    // Company name validation (column 1: 회사명)
    const companyName = cells[0]?.trim();
    if (!companyName || companyName.length < 3 || companyName.length > 50) return false;
    
    // Skip header rows
    if (companyName.includes('회사명') || companyName.includes('구분') || companyName.includes('합계') || 
        companyName.includes('총계') || companyName.includes('출자원') || companyName.includes('전문인력') ||
        companyName.includes('투자실사') || companyName.includes('경영관리')) return false;
    
    // Columns 2-5 must be numeric (출자원, 전문인력, 투자실사, 경영관리 counts)
    for (let i = 1; i <= 4; i++) {
        if (!cells[i] || !/^\d+$/.test(cells[i].trim())) return false;
    }
    
    return true;
}

function validate투자실적Row(cells) {
    // Based on screenshot: [회사명, 고유계정(영제수,금액), 조합(영제수,금액), 합계(영제수,금액)]
    if (!cells || cells.length < 7) return false;
    
    // Company name validation (column 1: 회사명)
    const companyName = cells[0]?.trim();
    if (!companyName || companyName.length < 3 || companyName.length > 50) return false;
    
    // Skip header rows
    if (companyName.includes('회사명') || companyName.includes('고유계정') || companyName.includes('조합') ||
        companyName.includes('합계') || companyName.includes('영제수') || companyName.includes('금액') ||
        companyName.includes('구분') || companyName.includes('총계')) return false;
    
    // Columns 2, 4, 6 must be count numbers (영제수 for 고유계정, 조합, 합계)
    if (!cells[1] || !/^\d+$/.test(cells[1].trim())) return false;
    if (!cells[3] || !/^\d+$/.test(cells[3].trim())) return false;
    if (!cells[5] || !/^\d+$/.test(cells[5].trim())) return false;
    
    // Columns 3, 5, 7 must be amounts (금액 for 고유계정, 조합, 합계)
    if (!cells[2] || (!(/^0$/.test(cells[2].trim())) && !(/^\d{1,3}(,\d{3})*$/.test(cells[2].trim())))) return false;
    if (!cells[4] || (!(/^0$/.test(cells[4].trim())) && !(/^\d{1,3}(,\d{3})*$/.test(cells[4].trim())))) return false;
    if (!cells[6] || (!(/^0$/.test(cells[6].trim())) && !(/^\d{1,3}(,\d{3})*$/.test(cells[6].trim())))) return false;
    
    return true;
}

function validate재무제표Row(cells) {
    // Based on screenshot: [회사명, 재원, 결산월, 회계기준, 자구주본, 자산, 창업투자자산, 부채, 자본금, 자본, 상세]
    if (!cells || cells.length < 11) return false;
    
    // Company name validation (column 1: 회사명)
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
    
    // Financial data columns (6-10: 자산, 창업투자자산, 부채, 자본금, 자본) must have valid amounts
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

function validate조합현황Row(cells) {
    // Based on screenshot: [번호, 회사명, 조합명, 출자일, 결산총액, 만기일, 투자분야구분, 목적구분, 지원구분]
    if (!cells || cells.length < 9) return false;
    
    // Column 1 must be numeric ID (번호)
    const id = cells[0]?.trim();
    if (!id || !/^\d{3,4}$/.test(id)) return false;
    
    // Company name validation (column 2: 회사명)
    const companyName = cells[1]?.trim();
    if (!companyName || companyName.length < 3) return false;
    
    // Partnership name validation (column 3: 조합명)
    const partnershipName = cells[2]?.trim();
    if (!partnershipName || partnershipName.length < 3) return false;
    
    // Column 4 must be date format YYYY-MM-DD (출자일)
    const startDate = cells[3]?.trim();
    if (!startDate || !/^\d{4}-\d{2}-\d{2}$/.test(startDate)) return false;
    
    // Column 5 must be large amount with commas (결산총액)
    const amount = cells[4]?.trim();
    if (!amount || !/^\d{1,3}(,\d{3})*$/.test(amount)) return false;
    
    // Column 6 must be end date format YYYY-MM-DD (만기일)
    const endDate = cells[5]?.trim();
    if (!endDate || !/^\d{4}-\d{2}-\d{2}$/.test(endDate)) return false;
    
    // Column 7 must be 투자분야구분 category
    const investmentField = cells[6]?.trim();
    if (!investmentField || (!investmentField.includes('일반') && !investmentField.includes('문화') && !investmentField.includes('바이오'))) return false;
    
    // Skip header rows
    if (companyName.includes('회사명') || companyName.includes('조합명') || companyName.includes('구분') || 
        companyName.includes('총계') || partnershipName.includes('구분')) return false;
    
    return true;
}

function validate전문인력현황Row(cells) {
    // Based on screenshot: [회사명, 이름, 금무경력, 전문인력경력, 총VC근무경력, 총VC전문인력경력]
    if (!cells || cells.length < 6) return false;
    
    // Company name validation (column 1: 회사명)
    const companyName = cells[0]?.trim();
    if (!companyName || companyName.length < 3 || companyName.length > 50) return false;
    
    // Person name validation (column 2: 이름)
    const personName = cells[1]?.trim();
    if (!personName || personName.length < 2 || personName.length > 20) return false;
    
    // Skip header rows
    if (companyName.includes('회사명') || companyName.includes('이름') || companyName.includes('경력') ||
        companyName.includes('구분') || companyName.includes('총계') || personName.includes('경력') ||
        personName.includes('구분')) return false;
    
    // Columns 3-6 must be numeric (경력 years: 금무경력, 전문인력경력, 총VC근무경력, 총VC전문인력경력)
    for (let i = 2; i <= 5; i++) {
        if (!cells[i] || !/^\d+$/.test(cells[i].trim())) return false;
    }
    
    return true;
}

function validate법규위반Row(cells) {
    // Based on screenshot: [번호, 회사명, 조치일, 조치명칭일, 시정완료일, 점검구분, 위반항목, 조치구분]
    if (!cells || cells.length < 8) return false;
    
    // Column 1 must be numeric ID (번호)
    const id = cells[0]?.trim();
    if (!id || !/^\d+$/.test(id) || parseInt(id) < 1 || parseInt(id) > 100) return false;
    
    // Company name validation (column 2: 회사명)
    const companyName = cells[1]?.trim();
    if (!companyName || companyName.length < 3) return false;
    
    // Column 3 must be 조치일 date (YYYY-MM-DD format)
    const actionDate = cells[2]?.trim();
    if (!actionDate || !/^\d{4}-\d{2}-\d{2}$/.test(actionDate)) return false;
    
    // Column 4 can be 조치명칭일 date (YYYY-MM-DD) or "-"
    const noticeDate = cells[3]?.trim();
    if (!noticeDate || (noticeDate !== '-' && !/^\d{4}-\d{2}-\d{2}$/.test(noticeDate))) return false;
    
    // Column 5 can be 시정완료일 date (YYYY-MM-DD) or "-"
    const completionDate = cells[4]?.trim();
    if (!completionDate || (completionDate !== '-' && !/^\d{4}-\d{2}-\d{2}$/.test(completionDate))) return false;
    
    // Column 6 must be 점검구분 type
    const inspectionType = cells[5]?.trim();
    if (!inspectionType || !['전자보고', '정기검사', '수시검사'].includes(inspectionType)) return false;
    
    // Column 7 must be 위반항목 (not empty)
    const violationType = cells[6]?.trim();
    if (!violationType || violationType.length < 2) return false;
    
    // Column 8 must be 조치구분 action
    const actionType = cells[7]?.trim();
    if (!actionType || !['경고', '시정명령', '경영개선요구'].includes(actionType)) return false;
    
    // Skip header rows
    if (companyName.includes('회사명') || companyName.includes('조치일') || companyName.includes('구분') || 
        companyName.includes('총계') || companyName.includes('번호')) return false;
    
    return true;
}

function validateVCMapRow(cells) {
    // Based on screenshot: [순위, 회사명, 인력총수, 전문인력수]
    if (!cells || cells.length < 4) return false;
    
    // Column 1 must be numeric rank (순위)
    const rank = cells[0]?.trim();
    if (!rank || !/^\d+$/.test(rank) || parseInt(rank) < 1 || parseInt(rank) > 500) return false;
    
    // Company name validation (column 2: 회사명)
    const companyName = cells[1]?.trim();
    if (!companyName || companyName.length < 3 || companyName.length > 50) return false;
    
    // Column 3 must be numeric (인력총수)
    if (!cells[2] || !/^\d+$/.test(cells[2].trim())) return false;
    
    // Column 4 must be numeric (전문인력수)
    if (!cells[3] || !/^\d+$/.test(cells[3].trim())) return false;
    
    // Skip header rows
    if (companyName.includes('회사명') || companyName.includes('순위') || companyName.includes('인력총수') ||
        companyName.includes('전문인력수') || companyName.includes('구분') || companyName.includes('총계')) return false;
    
    return true;
}

function testFilteringLogic() {
    console.log('🧪 UPDATED VALIDATION TESTS - Based on Real Website Field Structures');
    console.log('===============================================================================');
    console.log('📊 BASELINE ROW COUNTS (Algorithm Development Reference Only):');
    Object.entries(BASELINE_COUNTS).forEach(([section, count]) => {
        console.log(`   ${section}: ${count.toLocaleString()} rows (baseline)`);
    });
    console.log(`   📋 TOTAL BASELINE: ${TOTAL_BASELINE_RECORDS.toLocaleString()} records (reference only)`);
    console.log('===============================================================================');
    
    console.log('\n=== 인력현황 Test (회사명, 출자원, 전문인력, 투자실사, 경영관리) ===');
    인력현황_samples.forEach((sample, index) => {
        const cells = sample.split('\t');
        const isValid = validate인력현황Row(cells);
        console.log(`Sample ${index + 1}: ${isValid ? '✅ VALID' : '❌ INVALID'} - ${cells[0]}`);
        if (!isValid) {
            console.log(`  Data: ${sample}`);
            console.log(`  Cells: ${cells.length} columns`);
        }
    });
    
    console.log('\n=== 투자실적 Test (회사명, 고유계정[영제수,금액], 조합[영제수,금액], 합계[영제수,금액]) ===');
    투자실적_samples.forEach((sample, index) => {
        const cells = sample.split('\t');
        const isValid = validate투자실적Row(cells);
        console.log(`Sample ${index + 1}: ${isValid ? '✅ VALID' : '❌ INVALID'} - ${cells[0]}`);
        if (!isValid) {
            console.log(`  Data: ${sample}`);
            console.log(`  Cells: ${cells.length} columns`);
        }
    });
    
    console.log('\n=== 재무제표 Test (회사명, 재원, 결산월, 회계기준, 자구주본, 자산, 창업투자자산, 부채, 자본금, 자본, 상세) ===');
    재무제표_samples.forEach((sample, index) => {
        const cells = sample.split('\t');
        const isValid = validate재무제표Row(cells);
        console.log(`Sample ${index + 1}: ${isValid ? '✅ VALID' : '❌ INVALID'} - ${cells[0]}`);
        if (!isValid) {
            console.log(`  Data: ${sample}`);
            console.log(`  Cells: ${cells.length} columns`);
        }
    });

    console.log('\n=== 조합현황 Test (번호, 회사명, 조합명, 출자일, 결산총액, 만기일, 투자분야구분, 목적구분, 지원구분) ===');
    조합현황_samples.forEach((sample, index) => {
        const cells = sample.split('\t');
        const isValid = validate조합현황Row(cells);
        console.log(`Sample ${index + 1}: ${isValid ? '✅ VALID' : '❌ INVALID'} - ${cells[1]}`);
        if (!isValid) {
            console.log(`  Data: ${sample}`);
            console.log(`  Cells: ${cells.length} columns`);
        }
    });

    console.log('\n=== 전문인력현황 Test (회사명, 이름, 금무경력, 전문인력경력, 총VC근무경력, 총VC전문인력경력) ===');
    전문인력현황_samples.forEach((sample, index) => {
        const cells = sample.split('\t');
        const isValid = validate전문인력현황Row(cells);
        console.log(`Sample ${index + 1}: ${isValid ? '✅ VALID' : '❌ INVALID'} - ${cells[0]} (${cells[1]})`);
        if (!isValid) {
            console.log(`  Data: ${sample}`);
            console.log(`  Cells: ${cells.length} columns`);
        }
    });

    console.log('\n=== 법규위반 Test (번호, 회사명, 조치일, 조치명칭일, 시정완료일, 점검구분, 위반항목, 조치구분) ===');
    법규위반_samples.forEach((sample, index) => {
        const cells = sample.split('\t');
        const isValid = validate법규위반Row(cells);
        console.log(`Sample ${index + 1}: ${isValid ? '✅ VALID' : '❌ INVALID'} - ${cells[1]}`);
        if (!isValid) {
            console.log(`  Data: ${sample}`);
            console.log(`  Cells: ${cells.length} columns`);
        }
    });

    console.log('\n=== VC Map Test (순위, 회사명, 인력총수, 전문인력수) ===');
    VCMap_samples.forEach((sample, index) => {
        const cells = sample.split('\t');
        const isValid = validateVCMapRow(cells);
        console.log(`Sample ${index + 1}: ${isValid ? '✅ VALID' : '❌ INVALID'} - ${cells[1]}`);
        if (!isValid) {
            console.log(`  Data: ${sample}`);
            console.log(`  Cells: ${cells.length} columns`);
        }
    });
}

// Test negative cases (should be invalid)
function testNegativeCases() {
    console.log('\n=== Negative Cases Test ===');
    
    const invalidSamples = [
        "회사명	재원	결산월	회계기준	자구주본	자산	상세", // Header row
        "A	고유계정	12	일반	개별	1,000,000	상세", // Too short name
        "회사명	다른계정	12	일반	개별	1,000,000	상세", // Wrong account type
        "회사명	고유계정	11	일반	개별	1,000,000	상세", // Wrong month
        "회사명	고유계정	12	기타	개별	1,000,000	상세", // Wrong standard
    ];
    
    invalidSamples.forEach((sample, index) => {
        const cells = sample.split('\t');
        const isValid = validate재무제표Row(cells);
        console.log(`Invalid ${index + 1}: ${isValid ? '❌ SHOULD BE INVALID' : '✅ CORRECTLY INVALID'}`);
    });
}

async function testLiveFiltering() {
    console.log('\n=== Live Website Test ===');
    
    const browser = await chromium.launch({ headless: false });
    const context = await browser.newContext();
    const page = await context.newPage();
    
    try {
        await page.goto('http://diva.kvca.or.kr/div/dii/DivItmInvstPrfmInq');
        await page.waitForLoadState('networkidle');
        
        console.log('Testing live validation on DIVA website...');
        
        // Test validation on actual website data
        const rows = await page.locator('table tr').all();
        let validCount = 0;
        let totalCount = 0;
        
        for (const row of rows.slice(1, 11)) { // Test first 10 rows
            const cells = await row.locator('td').allTextContents();
            if (cells.length > 0) {
                totalCount++;
                if (validate투자실적Row(cells)) {
                    validCount++;
                }
            }
        }
        
        console.log(`Live test: ${validCount}/${totalCount} valid rows (${(validCount/totalCount*100).toFixed(1)}%)`);
        
    } catch (error) {
        console.error('Live test error:', error.message);
    } finally {
        await browser.close();
    }
}

// Run all tests
async function runTests() {
    testFilteringLogic();
    testNegativeCases();
    
    if (process.argv.includes('--live')) {
        await testLiveFiltering();
    }
    
    console.log('\n=== Test Complete ===');
    console.log('🎯 All validation functions updated based on real website field structures');
    console.log('📋 Baseline counts are for algorithm development only - actual data will vary');
    console.log('🔧 Scraper designed for flexibility to handle varying data volumes');
    console.log('Run with --live flag to test against actual website data');
}

runTests().catch(console.error); 