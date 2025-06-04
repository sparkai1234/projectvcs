// WORKING Korean Fund Scraper - Adapted from Successful Airtable Version to Supabase
const https = require('https');
const { URL } = require('url');
const { createClient } = require('@supabase/supabase-js');

// Configuration - Using working approach from Airtable version
const CONFIG = {
    dataType: 'Fund',
    maxPages: 150,
    startPage: 1,
    enableDetailedLogging: true,
    batchSize: 10,
    delayBetweenRequests: 2000  // 2 second delay for stability
};

// Supabase configuration
const SUPABASE_URL = process.env.SUPABASE_URL;
const SUPABASE_KEY = process.env.SUPABASE_KEY;

if (!SUPABASE_URL || !SUPABASE_KEY) {
    throw new Error('❌ Missing required environment variables: SUPABASE_URL and SUPABASE_KEY');
}

const supabase = createClient(SUPABASE_URL, SUPABASE_KEY);

console.log(`🏦 WORKING FUND SCRAPER - Target: ${CONFIG.maxPages} pages`);
console.log(`   Expected to collect 1500+ Fund records`);
console.log(`✅ Supabase client created successfully`);

// WORKING URL: Use www.vcs.go.kr (this was the fix that made it work!)
const baseUrl = 'https://www.vcs.go.kr/vc/data/vcFndListAjax.do';
const tabMenu = 'vc_fund';
const commonQueryParams = 'tabMenu=' + tabMenu + '&searchKeywordType=all&searchKeyword=&region=&vcType=&fndType=&orderBy=FND_ESTBL_DE';

async function makeRequest(url) {
    return new Promise((resolve, reject) => {
        const parsedUrl = new URL(url);
        const requestOptions = {
            hostname: parsedUrl.hostname, // www.vcs.go.kr - this works!
            port: parsedUrl.port,
            path: parsedUrl.pathname + parsedUrl.search,
            method: 'GET',
            headers: {
                'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36',
                'Accept': 'application/json, text/plain, */*',
                'Accept-Language': 'ko-KR,ko;q=0.9,en;q=0.8',
                'Referer': 'https://www.vcs.go.kr/vc/data/vcFndList.do'
            }
        };

        const req = https.request(requestOptions, (res) => {
            let data = '';
            res.on('data', (chunk) => {
                data += chunk;
            });
            res.on('end', () => {
                try {
                    const jsonData = JSON.parse(data);
                    resolve({ statusCode: res.statusCode, body: jsonData });
                } catch (e) {
                    resolve({ statusCode: res.statusCode, body: data });
                }
            });
        });

        req.on('error', (err) => {
            reject(err);
        });
        
        req.setTimeout(30000, () => {
            req.destroy();
            reject(new Error('Request timeout'));
        });

        req.end();
    });
}

// Enhanced 대표펀드매니저 extraction function
function extractFundManager(record) {
    const sources = [
        record.rprsntrNm,     // 대표자명 (main field)
        record.cntctInfo,     // 연락처 정보에서 이름 추출
        record.fndMngrNm,     // 펀드매니저명
        record.cmpnyRprsntr,  // 회사 대표
        record.operInstRprsntr // 운용기관 대표
    ];

    for (const source of sources) {
        if (source && typeof source === 'string') {
            const cleanName = source.trim();
            
            // Korean name validation: 2-15 characters, contains Korean, no special chars
            if (cleanName.length >= 2 && cleanName.length <= 15) {
                const hasKorean = /[가-힣]/.test(cleanName);
                const noSpecialChars = !/[0-9@#$%^&*()_+=\[\]{}|\\:";'<>?,./]/.test(cleanName);
                
                if (hasKorean && noSpecialChars) {
                    console.log(`✅ Found 대표펀드매니저: "${cleanName}"`);
                    return cleanName;
                }
            }
        }
    }
    
    return null;
}

async function uploadToSupabase(records) {
    try {
        const supabaseRecords = records.map(record => {
            const fundManager = extractFundManager(record);
            
            return {
                fund_id: record.fndId || '',
                fund_name: record.fndNm || '',
                company_name: record.cmpnyNm || '',
                fund_type: record.fndSeNm || '',
                fund_size: record.fndScl || '',
                establishment_date: record.fndEstblDe || '',
                fund_period: record.fndPrd || '',
                investment_field: record.investField || '',
                fund_status: record.fndSttus || '',
                region: record.ctpvNm || '',
                fund_manager: fundManager, // Enhanced extraction
                representative: record.rprsntrNm || '',
                contact_info: record.cntctInfo || '',
                description: record.fndIntrcn || '',
                data_source: 'www.vcs.go.kr - Working Simple Scraper',
                apify_source: 'Simple Node.js Fund Scraper v1.0',
                last_scraped: new Date().toISOString(),
                updated_at: new Date().toISOString()
            };
        });

        const { data, error } = await supabase
            .from('fund_table')
            .upsert(supabaseRecords, {
                onConflict: 'fund_id',
                returning: 'minimal'
            });

        if (error) {
            throw new Error(`Supabase upload failed: ${error.message}`);
        }

        return { success: true, count: supabaseRecords.length };
    } catch (error) {
        throw error;
    }
}

const runSimpleFundScraper = async () => {
    console.log(`🎯 Starting SIMPLE Fund data collection with proven working approach...`);
    
    let allRecords = [];
    let page = CONFIG.startPage;
    let hasMore = true;
    let totalProcessed = 0;
    let totalUploaded = 0;
    let fundManagerExtracted = 0;
    const startTime = Date.now();

    try {
        while (hasMore && page <= CONFIG.maxPages) {
            const url = `${baseUrl}?${commonQueryParams}&cp=${page}`;
            
            console.log(`📄 Fetching Fund page ${page}/${CONFIG.maxPages} from www.vcs.go.kr...`);
            
            const response = await makeRequest(url);
            const json = response.body;
            
            if (page === 1) {
                console.log(`📊 Found ${json.total} total Fund entries in database`);
            }
            
            const items = json.list || [];
            
            if (items.length > 0) {
                // Count 대표펀드매니저 extractions
                const managersFound = items.filter(item => extractFundManager(item)).length;
                fundManagerExtracted += managersFound;
                
                allRecords.push(...items);
                totalProcessed += items.length;
                console.log(`✅ Collected ${items.length} Fund records from page ${page} (Total: ${totalProcessed})`);
                console.log(`👥 Found ${managersFound} 대표펀드매니저 on this page (Total: ${fundManagerExtracted})`);
                
                // Upload in batches for better performance
                if (allRecords.length >= CONFIG.batchSize) {
                    console.log(`📤 Uploading batch of ${allRecords.length} records to Supabase...`);
                    try {
                        await uploadToSupabase(allRecords);
                        totalUploaded += allRecords.length;
                        console.log(`✅ Batch uploaded successfully (Total uploaded: ${totalUploaded})`);
                        allRecords = []; // Clear batch
                    } catch (uploadError) {
                        console.log(`❌ Batch upload failed: ${uploadError.message}`);
                        console.log(`   Retrying upload in 5 seconds...`);
                        await new Promise(resolve => setTimeout(resolve, 5000));
                        
                        // Retry upload
                        try {
                            await uploadToSupabase(allRecords);
                            totalUploaded += allRecords.length;
                            console.log(`✅ Retry upload successful (Total uploaded: ${totalUploaded})`);
                            allRecords = [];
                        } catch (retryError) {
                            console.log(`❌ Retry failed: ${retryError.message}`);
                            allRecords = [];
                        }
                    }
                }
                
                page++;
                
                // Rate limiting (this was key to success!)
                await new Promise(resolve => setTimeout(resolve, CONFIG.delayBetweenRequests));
            } else {
                hasMore = false;
                console.log(`🏁 No more data available after page ${page-1}`);
            }
        }

        // Upload remaining records
        if (allRecords.length > 0) {
            console.log(`📤 Uploading final batch of ${allRecords.length} records...`);
            try {
                await uploadToSupabase(allRecords);
                totalUploaded += allRecords.length;
                console.log(`✅ Final batch uploaded successfully`);
            } catch (uploadError) {
                console.log(`❌ Final upload failed: ${uploadError.message}`);
            }
        }

        const endTime = Date.now();
        const duration = (endTime - startTime) / 1000;
        const extractionRate = totalProcessed > 0 ? ((fundManagerExtracted / totalProcessed) * 100).toFixed(1) : 0;

        console.log(`\n🎉 FUND SCRAPING COMPLETED SUCCESSFULLY!`);
        console.log(`=' * 50`);
        console.log(`📊 Total Records Processed: ${totalProcessed}`);
        console.log(`✅ Total Records Uploaded: ${totalUploaded}`);
        console.log(`👥 대표펀드매니저 Extracted: ${fundManagerExtracted}`);
        console.log(`🎯 Representative Extraction Rate: ${extractionRate}%`);
        console.log(`⏱️  Total Duration: ${duration.toFixed(2)} seconds`);
        console.log(`🔄 Data Update Strategy: ALWAYS UPDATE (No Protection)`);
        console.log(`📊 Target Achievement: ${extractionRate >= 70 ? '✅ SUCCESS' : '⚠️ NEEDS IMPROVEMENT'}`);
        console.log(`🌐 Data Source: www.vcs.go.kr (Working URL)`);

    } catch (error) {
        console.log(`💥 Critical error: ${error.message}`);
        throw error;
    }
};

// Simple execution - no complex Apify patterns needed
(async () => {
    try {
        console.log('🏦 Initializing Simple Fund Scraper...');
        await runSimpleFundScraper();
        console.log('🎉 Simple fund scraper completed successfully!');
    } catch (error) {
        console.error('💥 Critical error in simple fund scraper:', error);
        process.exit(1);
    }
})(); 