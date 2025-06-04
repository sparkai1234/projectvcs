/**
 * 🏢 WORKING SUPABASE VC SCRAPER
 * ===============================
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
    console.log('🚀 VC Scraper Input:', input);

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

    // Korean VC Database API (working approach from main.js)
    const baseUrl = 'https://www.vcs.go.kr/vc/data/vcFndListAjax.do';
    const tabMenu = 'vc_fund';
    const commonQueryParams = 'tabMenu=' + tabMenu + '&searchKeywordType=all&searchKeyword=&region=&vcType=&fndType=&orderBy=FND_ESTBL_DE';

    // Stats tracking
    let stats = {
        scrapedCount: 0,
        insertedCount: 0,
        updatedCount: 0,
        errorCount: 0
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

    function extractCompanyData(item) {
        /**
         * Extract and map VC company data to match Supabase schema
         * Based on actual create_supabase_schema.sql structure
         */
        return {
            // Primary identifiers
            company_id: item.operInstId || item.id || item.companyId || `vc_${Date.now()}_${Math.random().toString(36).substr(2, 9)}`,
            company_name: item.operInstNm || item.companyName || item.name || 'Unknown Company',
            
            // Basic company info
            location: item.sigunguNm || item.location || item.address,
            representative: item.reprsntNm || item.representative || item.ceo,
            established_date: item.foundYy ? `${item.foundYy}-01-01` : null,
            company_type: item.operInstTpNm || item.companyType || item.type,
            
            // Contact information
            website_url: item.homepageUrl || item.website || item.url,
            contact_info: {
                address: item.headofcAddr || item.address,
                zip_code: item.headofcZipcd || item.zipCode,
                phone: item.telno || item.phone,
                fax: item.faxno || item.fax,
                email: item.email
            },
            
            // Additional business data
            disclosure_data: {
                industry: item.comIndNm || item.industry,
                business_category: item.comBzcarrCd || item.businessCategory,
                operating_scale: item.operScaleCd || item.operatingScale,
                operating_amount: item.operBoundAmt || item.operatingAmount,
                strategy_planner: item.strtplanerYn || item.strategyPlanner,
                pf_angel: item.pfAnglYn || item.pfAngel,
                raw_data: item // Store original data
            },
            
            // Metadata
            apify_source: 'Supabase VC Scraper v2.0 Working',
            created_at: new Date().toISOString(),
            updated_at: new Date().toISOString()
        };
    }

    async function upsertCompany(companyData) {
        /**
         * Insert or update company in Supabase
         */
        try {
            const { data, error } = await supabase
                .from('vc_table')
                .upsert(companyData, {
                    onConflict: 'company_id',
                    ignoreDuplicates: false
                })
                .select();

            if (error) {
                console.log(`❌ Supabase error for ${companyData.company_name}:`, error.message);
                stats.errorCount++;
                return false;
            }

            if (data && data.length > 0) {
                console.log(`✅ Successfully upserted: ${companyData.company_name}`);
                stats.insertedCount++;
                return true;
            }

        } catch (error) {
            console.log(`💥 Critical error upserting ${companyData.company_name}:`, error.message);
            stats.errorCount++;
            return false;
        }
    }

    async function scrapeVCData() {
        console.log(`\n🎯 === STARTING VC DATA SCRAPING ===`);
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
                
                console.log(`📋 Page ${page}: Found ${items.length} VC companies`);
                
                if (items.length === 0) {
                    console.log(`🏁 No more data after page ${page}`);
                    break;
                }

                // Process each company
                for (const item of items) {
                    stats.scrapedCount++;
                    
                    try {
                        const companyData = extractCompanyData(item);
                        await upsertCompany(companyData);
                        
                        // Save to Apify dataset as well
                        await Apify.pushData(companyData);
                        
                    } catch (error) {
                        console.log(`❌ Error processing company:`, error.message);
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
            console.log(`❌ Errors: ${stats.errorCount}`);
            console.log(`⏱️ Duration: ${duration.toFixed(2)} seconds`);
            console.log(`🌐 Source: www.vcs.go.kr`);
            console.log(`📋 Supabase Table: vc_table`);
            
            // Final stats to Apify
            await Apify.setValue('scraping_stats', {
                ...stats,
                duration: duration,
                pagesScraped: Math.min(page, CONFIG.maxPages),
                source: 'www.vcs.go.kr',
                table: 'vc_table',
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
        console.log('🚀 Starting Korean VC Data Scraping...');
        const results = await scrapeVCData();
        console.log('✅ VC scraping completed successfully!');
        console.log('📊 Final Stats:', results);
    } catch (error) {
        console.error('💥 Scraping failed:', error);
        process.exit(1);
    }

    await Apify.exit();
})(); 