/**
 * ⚖️ DIVA VIOLATIONS SCRAPER
 * =========================
 * 
 * Scrapes compliance violations data from http://diva.kvca.or.kr/div/dii/DivItmViolInq
 * - Regulatory violations and penalties
 * - Compliance track records
 * - Risk assessment data
 * - Timeline and resolution status
 * 
 * CRITICAL DATA: Risk assessment, due diligence, regulatory compliance
 */

require('dotenv').config();
const https = require('https');
const http = require('http');
const { createClient } = require('@supabase/supabase-js');

// Configuration
const CONFIG = {
    baseUrl: 'http://diva.kvca.or.kr/div/dii/DivItmViolInq',
    timeout: 30000,
    userAgent: 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
    delayBetweenRequests: 2500,
    maxPages: 50,
    // Different inspection types
    inspectionTypes: [
        '전체',         // All
        '전자보고',     // Electronic reporting
        '정기검사',     // Regular inspection
        '수시검사',     // Ad-hoc inspection
        '기타'          // Others
    ],
    // Different violation types
    violationTypes: [
        '전체',                    // All
        '등록요건',                // Registration requirements
        '납입자본금',              // Paid-in capital
        '임원',                    // Executives
        '전문인력',                // Professional personnel
        '사무실',                  // Office
        '자본잠식',                // Capital impairment
        '투자의무',                // Investment obligations
        '1년간 미투자',            // No investment for 1 year
        '해외투자',                // Overseas investment
        '보고의무',                // Reporting obligations
        '허위보고',                // False reporting
        '선관주의 의무위반',       // Breach of fiduciary duty
        '경영개선요구 미이행'      // Non-compliance with management improvement
    ]
};

// Initialize Supabase client
const supabaseUrl = process.env.SUPABASE_URL || 'https://udfgtccxbqmalgpqyxzz.supabase.co';
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY;

if (!supabaseKey) {
    console.error('❌ SUPABASE_SERVICE_ROLE_KEY environment variable is required');
    process.exit(1);
}

const supabase = createClient(supabaseUrl, supabaseKey);

console.log('⚖️ DIVA Violations Scraper Started');
console.log(`📊 Inspection Types: ${CONFIG.inspectionTypes.join(', ')}`);
console.log(`🚨 Violation Types: ${CONFIG.violationTypes.slice(0, 5).join(', ')}... (${CONFIG.violationTypes.length} total)`);

/**
 * Make HTTP request to get page content
 */
async function makeRequest(url, options = {}) {
    return new Promise((resolve, reject) => {
        const requestOptions = {
            headers: {
                'User-Agent': CONFIG.userAgent,
                'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,*/*;q=0.8',
                'Accept-Language': 'ko-KR,ko;q=0.9,en;q=0.8',
                'Connection': 'keep-alive',
                'Referer': CONFIG.baseUrl,
                ...options.headers
            },
            timeout: CONFIG.timeout
        };

        console.log(`📡 Requesting violations data: ${url.substring(0, 100)}...`);

        const req = http.request(url, requestOptions, (res) => {
            let data = '';
            
            res.on('data', (chunk) => {
                data += chunk;
            });
            
            res.on('end', () => {
                console.log(`✅ Violations response: ${res.statusCode} (${data.length} chars)`);
                resolve({
                    statusCode: res.statusCode,
                    headers: res.headers,
                    body: data
                });
            });
        });

        req.on('error', (err) => {
            console.error(`❌ Violations request failed: ${err.message}`);
            reject(err);
        });

        req.on('timeout', () => {
            req.destroy();
            reject(new Error('Violations request timeout'));
        });

        req.end();
    });
}

/**
 * Parse violations data from HTML response
 */
function parseViolationsData(html, inspectionType, violationType) {
    const violationRecords = [];
    
    try {
        console.log(`🔍 Parsing violations data for ${inspectionType} - ${violationType}`);
        
        // Look for violations data table
        const tableRegex = /<table[^>]*>(.*?)<\/table>/gis;
        const tables = html.match(tableRegex) || [];
        
        console.log(`Found ${tables.length} tables in violations response`);
        
        for (const table of tables) {
            // Look for data rows (skip header rows)
            const rowRegex = /<tr[^>]*>(.*?)<\/tr>/gis;
            const rows = table.match(rowRegex) || [];
            
            for (const row of rows) {
                // Extract cell data
                const cellRegex = /<td[^>]*>(.*?)<\/td>/gis;
                const cells = [];
                let match;
                
                while ((match = cellRegex.exec(row)) !== null) {
                    // Clean up cell content
                    const cellContent = match[1]
                        .replace(/<[^>]*>/g, '')  // Remove HTML tags
                        .replace(/&nbsp;/g, ' ')  // Replace &nbsp;
                        .replace(/&amp;/g, '&')  // Replace &amp;
                        .replace(/&gt;/g, '>')   // Replace &gt;
                        .replace(/&lt;/g, '<')   // Replace &lt;
                        .trim();
                    cells.push(cellContent);
                }
                
                // Process cells for violations data
                // Expected format: [번호, 회사명, 조치일, 조치예정일, 시정완료일, 점검구분, 위반형태, 조치구분]
                if (cells.length >= 7 && cells[0] && 
                    !cells[0].includes('번호') && !cells[0].includes('회사명') && 
                    cells[0] !== '' && !isNaN(parseInt(cells[0]))) {
                    
                    const record = parseViolationRow(cells, inspectionType, violationType);
                    if (record) {
                        violationRecords.push(record);
                    }
                }
            }
        }
        
        console.log(`✅ Parsed ${violationRecords.length} violation records`);
        return violationRecords;
        
    } catch (error) {
        console.error(`❌ Error parsing violations data: ${error.message}`);
        return [];
    }
}

/**
 * Parse individual violation row
 */
function parseViolationRow(cells, inspectionType, violationType) {
    try {
        // Expected format: [번호, 회사명, 조치일, 조치예정일, 시정완료일, 점검구분, 위반형태, 조치구분]
        const violationNumber = parseInt(cells[0]) || null;
        const companyName = cells[1];
        const actionDate = cells[2];
        const actionScheduledDate = cells[3];
        const correctionCompleteDate = cells[4];
        const inspectionCategory = cells[5];
        const violationTypeDetail = cells[6];
        const actionType = cells[7];
        
        const companyId = generateCompanyId(companyName);
        
        const record = {
            company_name: companyName,              // Primary identifier - links to vc_table.company_name
            company_id: companyId,                  // Secondary identifier - for compatibility
            violation_number: violationNumber,
            
            // Violation details
            violation_date: parseDate(actionDate),
            violation_type: normalizeViolationType(violationTypeDetail),
            violation_category: inspectionCategory,
            violation_details: violationTypeDetail,
            violation_severity: assessViolationSeverity(violationTypeDetail, actionType),
            
            // Legal/regulatory info
            relevant_law: extractRelevantLaw(violationTypeDetail),
            regulation_article: null, // Would need additional parsing
            
            // Actions and penalties
            action_date: parseDate(actionDate),
            action_scheduled_date: parseDate(actionScheduledDate),
            action_type: actionType,
            penalty_type: normalizePenaltyType(actionType),
            penalty_amount: extractPenaltyAmount(violationTypeDetail),
            penalty_currency: 'KRW',
            
            // Resolution
            correction_complete_date: parseDate(correctionCompleteDate),
            resolution_status: determineResolutionStatus(correctionCompleteDate, actionScheduledDate),
            resolution_details: actionType,
            
            // Impact assessment
            business_impact: assessBusinessImpact(violationTypeDetail, actionType),
            reputational_impact: assessReputationalImpact(violationTypeDetail, actionType),
            
            // Filter context
            search_inspection_type: inspectionType,
            search_violation_type: violationType,
            
            // Scraping metadata
            extracted_at: new Date().toISOString(),
            source_url: CONFIG.baseUrl,
            data_source: 'diva_violations'
        };
        
        return record;
        
    } catch (error) {
        console.error(`❌ Error parsing violation row: ${error.message}`);
        console.error(`Row data: ${JSON.stringify(cells)}`);
        return null;
    }
}

/**
 * Parse date strings
 */
function parseDate(dateStr) {
    if (!dateStr || dateStr === '-' || dateStr === '' || dateStr === '\\-') {
        return null;
    }
    
    try {
        // Handle Korean date format (YYYY-MM-DD)
        let cleanDate = dateStr.replace(/[^\d-]/g, '');
        
        // Convert various formats to ISO
        if (cleanDate.length === 8) {
            // YYYYMMDD format
            cleanDate = `${cleanDate.substring(0, 4)}-${cleanDate.substring(4, 6)}-${cleanDate.substring(6, 8)}`;
        }
        
        const date = new Date(cleanDate);
        return isNaN(date.getTime()) ? null : date.toISOString().split('T')[0];
        
    } catch (error) {
        return null;
    }
}

/**
 * Normalize violation type
 */
function normalizeViolationType(violationType) {
    if (!violationType) return null;
    
    const typeMap = {
        '자본잠식': 'Capital Impairment',
        '보고의무': 'Reporting Obligation',
        '1년간 미투자': 'No Investment for 1 Year',
        '경영개선요구 미이행': 'Non-compliance with Management Improvement',
        '허위보고': 'False Reporting',
        '투자의무': 'Investment Obligation',
        '등록요건': 'Registration Requirement',
        '납입자본금': 'Paid-in Capital',
        '임원': 'Executive Issue',
        '전문인력': 'Professional Personnel',
        '사무실': 'Office Requirement',
        '해외투자': 'Overseas Investment',
        '선관주의': 'Fiduciary Duty'
    };
    
    // Find matching type
    for (const [korean, english] of Object.entries(typeMap)) {
        if (violationType.includes(korean)) {
            return english;
        }
    }
    
    return violationType; // Return original if no match
}

/**
 * Normalize penalty type
 */
function normalizePenaltyType(actionType) {
    if (!actionType) return null;
    
    const penaltyMap = {
        '경고': 'Warning',
        '시정명령': 'Corrective Order',
        '경영개선요구': 'Management Improvement Requirement',
        '과태료': 'Administrative Fine',
        '과징금': 'Penalty',
        '영업정지': 'Business Suspension',
        '등록취소': 'Registration Cancellation'
    };
    
    return penaltyMap[actionType] || actionType;
}

/**
 * Assess violation severity
 */
function assessViolationSeverity(violationType, actionType) {
    if (!violationType || !actionType) return 'Unknown';
    
    // High severity indicators
    if (actionType.includes('영업정지') || actionType.includes('등록취소') ||
        violationType.includes('자본잠식') || violationType.includes('허위보고')) {
        return 'High';
    }
    
    // Medium severity indicators
    if (actionType.includes('시정명령') || actionType.includes('과징금') ||
        violationType.includes('1년간 미투자') || violationType.includes('경영개선요구')) {
        return 'Medium';
    }
    
    // Low severity (warnings, minor issues)
    if (actionType.includes('경고')) {
        return 'Low';
    }
    
    return 'Medium'; // Default
}

/**
 * Extract relevant law from violation type
 */
function extractRelevantLaw(violationType) {
    if (!violationType) return null;
    
    // Most DIVA violations are under the Venture Investment Promotion Act
    if (violationType.includes('투자') || violationType.includes('자본') || 
        violationType.includes('보고') || violationType.includes('등록')) {
        return '벤처투자 촉진에 관한 법률'; // Venture Investment Promotion Act
    }
    
    return '벤처투자 촉진에 관한 법률'; // Default
}

/**
 * Extract penalty amount (if mentioned)
 */
function extractPenaltyAmount(violationDetails) {
    if (!violationDetails) return null;
    
    // Look for amount mentions (억, 만, 천)
    const amountRegex = /(\d+(?:,\d+)*)\s*(억|만|천)/;
    const match = violationDetails.match(amountRegex);
    
    if (match) {
        const amount = parseFloat(match[1].replace(/,/g, ''));
        const unit = match[2];
        
        if (unit === '억') return amount * 100000000;
        if (unit === '만') return amount * 10000;
        if (unit === '천') return amount * 1000;
    }
    
    return null;
}

/**
 * Determine resolution status
 */
function determineResolutionStatus(correctionDate, scheduledDate) {
    if (correctionDate && correctionDate !== '-') {
        return 'Completed';
    }
    
    if (scheduledDate && scheduledDate !== '-') {
        const scheduled = new Date(scheduledDate);
        const now = new Date();
        
        if (scheduled > now) {
            return 'In Progress';
        } else {
            return 'Overdue';
        }
    }
    
    return 'Pending';
}

/**
 * Assess business impact
 */
function assessBusinessImpact(violationType, actionType) {
    if (actionType.includes('영업정지') || actionType.includes('등록취소')) {
        return 'Severe';
    }
    
    if (violationType.includes('자본잠식') || violationType.includes('1년간 미투자')) {
        return 'High';
    }
    
    if (actionType.includes('시정명령') || violationType.includes('경영개선')) {
        return 'Medium';
    }
    
    return 'Low';
}

/**
 * Assess reputational impact
 */
function assessReputationalImpact(violationType, actionType) {
    if (violationType.includes('허위보고') || actionType.includes('등록취소')) {
        return 'Severe';
    }
    
    if (violationType.includes('자본잠식') || actionType.includes('영업정지')) {
        return 'High';
    }
    
    if (actionType.includes('시정명령') || violationType.includes('의무')) {
        return 'Medium';
    }
    
    return 'Low';
}

/**
 * Generate company ID from company name
 */
function generateCompanyId(companyName) {
    if (!companyName) return null;
    
    return companyName
        .replace(/[^\w가-힣]/g, '')  // Keep only alphanumeric and Korean chars
        .substring(0, 50);
}

/**
 * Save violation records to Supabase
 */
async function saveViolationRecords(records) {
    if (records.length === 0) {
        console.log('⚠️ No violation records to save');
        return { success: true, count: 0 };
    }
    
    try {
        console.log(`💾 Saving ${records.length} violation records to Supabase...`);
        
        // Insert records in batches
        const batchSize = 25;
        let totalInserted = 0;
        
        for (let i = 0; i < records.length; i += batchSize) {
            const batch = records.slice(i, i + batchSize);
            
            const { data, error } = await supabase
                .from('diva_violation_raw')
                .upsert(batch, {
                    onConflict: 'company_name,violation_date,violation_type',
                    ignoreDuplicates: false
                });
            
            if (error) {
                console.error(`❌ Database error for violation batch ${i / batchSize + 1}:`, error);
                throw error;
            }
            
            totalInserted += batch.length;
            console.log(`✅ Violation batch ${i / batchSize + 1}: ${batch.length} records saved`);
            
            // Brief delay between batches
            await new Promise(resolve => setTimeout(resolve, 300));
        }
        
        console.log(`🎉 Successfully saved ${totalInserted} violation records!`);
        return { success: true, count: totalInserted };
        
    } catch (error) {
        console.error('❌ Error saving violation data to database:', error);
        return { success: false, error: error.message };
    }
}

/**
 * Scrape violations data for specific parameters
 */
async function scrapeViolationsData(inspectionType = '전체', violationType = '전체', page = 1) {
    console.log(`\n⚖️ === SCRAPING VIOLATIONS: ${inspectionType} - ${violationType} - PAGE ${page} ===`);
    
    try {
        // Construct URL with parameters
        let url = `${CONFIG.baseUrl}?점검구분=${encodeURIComponent(inspectionType)}&위반형태=${encodeURIComponent(violationType)}`;
        
        if (page > 1) {
            url += `&page=${page}`;
        }
        
        const response = await makeRequest(url);
        
        if (response.statusCode !== 200) {
            console.error(`❌ HTTP ${response.statusCode} for violations ${inspectionType} - ${violationType}`);
            return [];
        }
        
        const records = parseViolationsData(response.body, inspectionType, violationType);
        
        if (records.length > 0) {
            const saveResult = await saveViolationRecords(records);
            if (saveResult.success) {
                console.log(`✅ Violations ${inspectionType} - ${violationType}: ${saveResult.count} records saved`);
            }
        }
        
        return records;
        
    } catch (error) {
        console.error(`❌ Error scraping violations ${inspectionType} - ${violationType}:`, error.message);
        return [];
    }
}

/**
 * Main scraping function
 */
async function scrapeAllViolationsData() {
    console.log('\n🚀 === STARTING DIVA VIOLATIONS SCRAPING ===');
    
    const startTime = Date.now();
    let totalRecords = 0;
    let totalErrors = 0;
    
    try {
        // Test database connection with a simple insert test instead of count
        console.log('🔌 Testing Supabase connection...');
        
        try {
            // Try a simple test insert and delete
            const testRecord = {
                company_name: 'CONNECTION_TEST_' + Date.now(),
                company_id: 'TEST',
                violation_date: '2024-01-01',
                violation_type: 'connection_test',
                extracted_at: new Date().toISOString()
            };
            
            const { error: insertError } = await supabase
                .from('diva_violation_raw')
                .insert([testRecord]);
            
            if (insertError) {
                console.error('❌ Supabase connection failed:', insertError);
                return;
            }
            
            // Clean up test record
            await supabase
                .from('diva_violation_raw')
                .delete()
                .eq('company_name', testRecord.company_name);
            
            console.log('✅ Connected to Supabase. Ready to scrape violations data!');
            
        } catch (connError) {
            console.error('❌ Supabase connection failed:', connError);
            return;
        }
        
        // Start with comprehensive scraping (all types)
        try {
            const records = await scrapeViolationsData('전체', '전체');
            totalRecords += records.length;
            
            // Rate limiting
            console.log(`⏱️ Waiting ${CONFIG.delayBetweenRequests}ms...`);
            await new Promise(resolve => setTimeout(resolve, CONFIG.delayBetweenRequests));
            
        } catch (error) {
            console.error(`❌ Failed to scrape all violations:`, error.message);
            totalErrors++;
        }
        
        // Then scrape specific violation types for detailed data
        const highValueTypes = ['자본잠식', '1년간 미투자', '보고의무', '경영개선요구 미이행'];
        
        for (const violationType of highValueTypes) {
            try {
                const records = await scrapeViolationsData('전체', violationType);
                totalRecords += records.length;
                
                // Rate limiting
                console.log(`⏱️ Waiting ${CONFIG.delayBetweenRequests}ms...`);
                await new Promise(resolve => setTimeout(resolve, CONFIG.delayBetweenRequests));
                
            } catch (error) {
                console.error(`❌ Failed to scrape violations for ${violationType}:`, error.message);
                totalErrors++;
            }
        }
        
        const duration = (Date.now() - startTime) / 1000;
        
        console.log('\n🎉 === VIOLATIONS SCRAPING COMPLETED ===');
        console.log(`⚖️ Total Violation Records: ${totalRecords}`);
        console.log(`❌ Total Errors: ${totalErrors}`);
        console.log(`⏱️ Duration: ${duration.toFixed(2)} seconds`);
        
        if (totalRecords > 0) {
            console.log('🚀 Next steps:');
            console.log('1. Create risk assessment scoring');
            console.log('2. Build compliance dashboard');
            console.log('3. Generate violation trend analysis');
            console.log('4. Create due diligence reports');
        }
        
    } catch (error) {
        console.error('💥 Critical error in violations scraping:', error);
        throw error;
    }
}

// Execute if run directly
if (require.main === module) {
    (async () => {
        try {
            await scrapeAllViolationsData();
            console.log('✅ Violations scraping completed successfully!');
        } catch (error) {
            console.error('💥 Violations scraping failed:', error);
            process.exit(1);
        }
    })();
}

module.exports = {
    scrapeAllViolationsData,
    scrapeViolationsData,
    parseViolationsData,
    saveViolationRecords,
    CONFIG
}; 