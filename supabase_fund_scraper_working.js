/**
 * 🏦 WORKING SUPABASE FUND SCRAPER
 * =================================
 * 
 * Based on your working main.js API approach
 * Uses correct Supabase schema fields from create_supabase_schema.sql
 * Ready for Apify deployment
 */

const Apify = require('apify');
const { createClient } = require('@supabase/supabase-js');
const https = require('https');
const { URL } = require('url');

// Initialize Apify
(async () => {
    await Apify.init();

    // Get input parameters
    const input = await Apify.getInput();
    console.log('🚀 Fund Scraper Input:', input);

    // Supabase configuration from environment or input
    const SUPABASE_URL = input?.supabaseUrl || process.env.SUPABASE_URL;
    const SUPABASE_KEY = input?.supabaseKey || process.env.SUPABASE_KEY;

    if (!SUPABASE_URL || !SUPABASE_KEY) {
        console.error('❌ Missing Supabase credentials');
        await Apify.exit();
        return;
    }

    // Initialize Supabase client
    const supabase = createClient(SUPABASE_URL, SUPABASE_KEY);
    console.log('✅ Supabase client initialized');

    // Configuration
    const CONFIG = {
        maxPages: input?.maxPages || 10,
        startPage: 1,
        delayBetweenRequests: 2000
    };

    // Korean Fund Database API (working approach from main.js)
    const baseUrl = 'https://www.vcs.go.kr/vc/data/vcFndListAjax.do';
    const tabMenu = 'vc_fund';
    const commonQueryParams = 'tabMenu=' + tabMenu + '&searchKeywordType=all&searchKeyword=&region=&vcType=&fndType=&orderBy=FND_ESTBL_DE';

    // Stats tracking
    let stats = {
        scrapedCount: 0,
        insertedCount: 0,
        updatedCount: 0,
        errorCount: 0,
        fundManagerExtractionCount: 0
    };

    async function makeRequest(url) {
        return new Promise((resolve, reject) => {
            const parsedUrl = new URL(url);
            const requestOptions = {
                hostname: parsedUrl.hostname,
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
                        if (data.trim().startsWith('{') || data.trim().startsWith('[')) {
                            const jsonData = JSON.parse(data);
                            resolve({ statusCode: res.statusCode, body: jsonData, success: true });
                        } else {
                            console.log(`❌ Non-JSON response for ${url}`);
                            resolve({ statusCode: res.statusCode, body: data, success: false, error: 'NOT_JSON' });
                        }
                    } catch (e) {
                        console.log(`❌ JSON parse failed: ${e.message}`);
                        resolve({ statusCode: res.statusCode, body: data, success: false, error: 'JSON_PARSE_ERROR' });
                    }
                });
            });

            req.on('error', (err) => {
                console.log(`❌ Request failed: ${err.message}`);
                reject(err);
            });

            req.setTimeout(30000, () => {
                req.destroy();
                reject(new Error('Request timeout after 30 seconds'));
            });

            req.end();
        });
    }

    function extractFundManager(fundData) {
        /**
         * Enhanced 대표펀드매니저 extraction from multiple sources
         */
        const sources = [
            fundData.reprsntNm,           // Primary representative name
            fundData.fundMngrNm,          // Fund manager name
            fundData.operInstReprsntNm,   // Operating institution representative
            fundData.managerName,         // Manager name (generic)
            fundData.representative,      // Representative (generic)
            fundData.contact_person       // Contact person
        ];

        for (const source of sources) {
            if (source && typeof source === 'string' && source.trim().length > 1) {
                const cleanName = source.trim();
                // Basic validation - Korean names typically 2-4 characters
                if (cleanName.length >= 2 && cleanName.length <= 10) {
                    stats.fundManagerExtractionCount++;
                    console.log(`✅ Extracted 대표펀드매니저: ${cleanName}`);
                    return cleanName;
                }
            }
        }

        return null;
    }

    function extractFundData(item) {
        /**
         * Extract and map Fund data to match Supabase schema
         * Based on actual create_supabase_schema.sql structure
         */
        const extractedFundManager = extractFundManager(item);
        
        return {
            // Primary identifiers (use fund-specific ID if available)
            company_id: item.operInstId || item.companyId || `fund_company_${Date.now()}_${Math.random().toString(36).substr(2, 9)}`,
            fund_name: item.fndNm || item.fundName || item.name || 'Unknown Fund',
            
            // Fund details
            fund_type: item.fndTpNm || item.fundType || item.type,
            commitment_amount: item.commitAmt ? parseInt(item.commitAmt) : null,
            fund_size: item.totalAmt ? parseInt(item.totalAmt) : null,
            establishment_date: item.fndEstblDe ? item.fndEstblDe : null,
            fund_status: item.fndStatusNm || item.status || 'Active',
            
            // Representative/Manager (skip the 대표펀드매니저 for now as requested)
            representative: extractedFundManager,
            
            // Investment focus
            investment_focus: [
                item.invstFieldNm,        // Investment field
                item.invstDetailNm,       // Investment detail
                item.invstCharcNm         // Investment character
            ].filter(field => field && field.trim().length > 0),
            
            // Additional fund information
            fund_details: {
                operating_company: item.operInstNm || item.operatingCompany,
                investment_field: item.invstFieldNm || item.investmentField,
                investment_detail: item.invstDetailNm || item.investmentDetail,
                investment_character: item.invstCharcNm || item.investmentCharacter,
                commitment_amount_raw: item.commitAmt,
                total_amount_raw: item.totalAmt,
                expiry_date: item.fndExpryDe || item.expiryDate,
                registration_date: item.registDe || item.registrationDate,
                raw_data: item // Store original data
            },
            
            // Metadata
            apify_source: 'Supabase Fund Scraper v2.0 Working',
            created_at: new Date().toISOString(),
            updated_at: new Date().toISOString()
        };
    }

    async function upsertFund(fundData) {
        /**
         * Insert or update fund in Supabase
         */
        try {
            // Create a unique identifier for the fund
            const fundId = `${fundData.company_id}_${fundData.fund_name.replace(/[^a-zA-Z0-9]/g, '_')}`;
            
            const { data, error } = await supabase
                .from('fund_table')
                .upsert({
                    ...fundData,
                    id: fundId // Ensure we have a unique ID
                }, {
                    onConflict: 'company_id,fund_name',
                    ignoreDuplicates: false
                })
                .select();

            if (error) {
                console.log(`❌ Supabase error for ${fundData.fund_name}:`, error.message);
                stats.errorCount++;
                return false;
            }

            if (data && data.length > 0) {
                console.log(`✅ Successfully upserted fund: ${fundData.fund_name}`);
                stats.insertedCount++;
                return true;
            }

        } catch (error) {
            console.log(`💥 Critical error upserting ${fundData.fund_name}:`, error.message);
            stats.errorCount++;
            return false;
        }
    }

    async function scrapeFundData() {
        console.log(`\n🎯 === STARTING FUND DATA SCRAPING ===`);
        console.log(`📊 Target: ${CONFIG.maxPages} pages`);

        let totalRecords = 0;
        const startTime = Date.now();

        try {
            for (let page = CONFIG.startPage; page <= CONFIG.maxPages; page++) {
                const url = `${baseUrl}?${commonQueryParams}&cp=${page}`;
                
                console.log(`\n📄 === SCRAPING PAGE ${page}/${CONFIG.maxPages} ===`);
                
                const response = await makeRequest(url);
                
                if (!response.success) {
                    console.log(`❌ Page ${page} failed: ${response.error}`);
                    break;
                }
                
                const json = response.body;
                const items = json.list || json.data || json.items || [];
                
                console.log(`📋 Page ${page}: Found ${items.length} funds`);
                
                if (items.length === 0) {
                    console.log(`🏁 No more data after page ${page}`);
                    break;
                }

                // Process each fund
                for (const item of items) {
                    stats.scrapedCount++;
                    
                    try {
                        const fundData = extractFundData(item);
                        await upsertFund(fundData);
                        
                        // Save to Apify dataset as well
                        await Apify.pushData(fundData);
                        
                    } catch (error) {
                        console.log(`❌ Error processing fund:`, error.message);
                        stats.errorCount++;
                    }
                }
                
                totalRecords += items.length;
                
                // Rate limiting
                console.log(`⏱️ Waiting ${CONFIG.delayBetweenRequests}ms before next page...`);
                await new Promise(resolve => setTimeout(resolve, CONFIG.delayBetweenRequests));
            }
            
            const duration = (Date.now() - startTime) / 1000;
            
            console.log(`\n🎉 === SCRAPING COMPLETED ===`);
            console.log(`📊 Total Records Scraped: ${stats.scrapedCount}`);
            console.log(`✅ Successfully Inserted/Updated: ${stats.insertedCount}`);
            console.log(`👤 Fund Managers Extracted: ${stats.fundManagerExtractionCount}`);
            console.log(`❌ Errors: ${stats.errorCount}`);
            console.log(`⏱️ Duration: ${duration.toFixed(2)} seconds`);
            console.log(`🌐 Source: www.vcs.go.kr`);
            console.log(`📋 Supabase Table: fund_table`);
            
            // Final stats to Apify
            await Apify.setValue('scraping_stats', {
                ...stats,
                duration: duration,
                pagesScraped: Math.min(page, CONFIG.maxPages),
                source: 'www.vcs.go.kr',
                table: 'fund_table',
                timestamp: new Date().toISOString()
            });

            return stats;
            
        } catch (error) {
            console.log(`💥 Critical scraping error: ${error.message}`);
            throw error;
        }
    }

    // Execute scraping
    try {
        console.log('🚀 Starting Korean Fund Data Scraping...');
        const results = await scrapeFundData();
        console.log('✅ Fund scraping completed successfully!');
        console.log('📊 Final Stats:', results);
    } catch (error) {
        console.error('💥 Scraping failed:', error);
        process.exit(1);
    }

    await Apify.exit();
})(); 