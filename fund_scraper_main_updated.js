/**
 * 🏦 SUPABASE FUND SCRAPER - UPDATED VERSION
 * ==========================================
 * 
 * Enhanced Fund scraper that:
 * - Connects directly to Supabase
 * - ALWAYS UPDATES representative data (no protection)
 * - Enhanced 대표펀드매니저 extraction from Korean VC site
 * - Simplified field structure for fund_table
 */

const { Actor, PlaywrightCrawler } = require('apify');
const { createClient } = require('@supabase/supabase-js');

// Debug environment and SDK versions
console.log('🔧 ENVIRONMENT DEBUG:');
console.log('Node.js version:', process.version);
try {
    console.log('Apify SDK version:', require('apify/package.json').version);
} catch (e) {
    console.log('Apify SDK version: Unable to read');
}
try {
    console.log('Supabase version:', require('@supabase/supabase-js/package.json').version);
} catch (e) {
    console.log('Supabase version: Unable to read');
}

// Debug Actor methods availability
console.log('🔍 ACTOR METHODS DEBUG:');
console.log('Actor.main exists:', typeof Actor.main === 'function');
console.log('PlaywrightCrawler exists:', typeof PlaywrightCrawler === 'function');
console.log('Available Actor methods:', Object.getOwnPropertyNames(Actor).filter(name => typeof Actor[name] === 'function'));

console.log('SUPABASE_URL:', process.env.SUPABASE_URL);
console.log('SUPABASE_KEY exists:', !!process.env.SUPABASE_KEY);
console.log('SUPABASE_KEY length:', process.env.SUPABASE_KEY ? process.env.SUPABASE_KEY.length : 'undefined');

// Supabase configuration
const SUPABASE_URL = process.env.SUPABASE_URL;
const SUPABASE_KEY = process.env.SUPABASE_KEY;

if (!SUPABASE_URL || !SUPABASE_KEY) {
    throw new Error('❌ Missing required environment variables: SUPABASE_URL and SUPABASE_KEY');
}

console.log('🚀 Creating Supabase client...');
const supabase = createClient(SUPABASE_URL, SUPABASE_KEY);
console.log('✅ Supabase client created successfully');

class SupabaseFundScraper {
    constructor() {
        this.scrapedCount = 0;
        this.updatedCount = 0;
        this.insertedCount = 0;
        this.errorCount = 0;
        this.fundManagerExtractionCount = 0;
        this.fundManagerMissingCount = 0;
    }

    extractFundManager(fundData) {
        /**
         * Enhanced 대표펀드매니저 extraction from multiple Korean sources
         */
        console.log('🔍 Searching for 대표펀드매니저 in fund data...');
        
        const sources = [
            { field: 'reprsntNm', value: fundData.reprsntNm },                    // 대표자명
            { field: 'fundMngrNm', value: fundData.fundMngrNm },                  // 펀드매니저명  
            { field: 'operInstReprsntNm', value: fundData.operInstReprsntNm },    // 운용기관대표자명
            { field: 'managerName', value: fundData.managerName },                // 매니저명
            { field: 'representative', value: fundData.representative },          // 대표자
            { field: 'ceo', value: fundData.ceo },                               // CEO
            { field: 'president', value: fundData.president },                   // 사장
            { field: 'director', value: fundData.director },                     // 이사
            { field: 'contact_person', value: fundData.contact_person }          // 담당자
        ];

        for (const source of sources) {
            if (source.value && typeof source.value === 'string') {
                const cleanName = source.value.trim();
                
                // Korean name validation: 2-15 characters, no numbers/special chars
                if (cleanName.length >= 2 && cleanName.length <= 15) {
                    // Check if it looks like a Korean name
                    const hasKorean = /[가-힣]/.test(cleanName);
                    const noSpecialChars = !/[0-9@#$%^&*()_+=\[\]{}|\\:";'<>?,./]/.test(cleanName);
                    
                    if (hasKorean && noSpecialChars) {
                        this.fundManagerExtractionCount++;
                        console.log(`✅ Found 대표펀드매니저: "${cleanName}" from ${source.field}`);
                        return cleanName;
                    }
                }
            }
        }

        this.fundManagerMissingCount++;
        console.log('❌ No valid 대표펀드매니저 found in this record');
        return null;
    }

    async getExistingFundRecord(fundId) {
        /**
         * Get existing fund record from Supabase
         */
        try {
            const { data, error } = await supabase
                .from('fund_table')
                .select('*')
                .eq('fund_id', fundId)
                .single();

            if (error && error.code !== 'PGRST116') {
                console.log(`⚠️ Error fetching existing fund record for ${fundId}:`, error.message);
                return null;
            }

            return data || null;
        } catch (error) {
            console.log(`❌ Error getting existing fund record for ${fundId}:`, error.message);
            return null;
        }
    }

    prepareFundUpdateData(scrapedData) {
        /**
         * Prepare fund update data - NO PROTECTION LOGIC
         * Always update with fresh scraped data including representatives
         */
        const extractedFundManager = this.extractFundManager(scrapedData);

        const updateData = {
            // Basic fund information
            fund_name: scrapedData.fund_name,
            fund_id: scrapedData.fund_id,
            company_name: scrapedData.company_name,
            company_id: scrapedData.company_id,
            
            // ALWAYS UPDATE REPRESENTATIVE DATA (no protection)
            fund_manager: extractedFundManager,  // Single field for 대표펀드매니저
            
            // Fund amounts (preserve Korean format)
            total_amount: scrapedData.total_amount,
            operating_amount: scrapedData.operating_amount,
            commitment_amount: scrapedData.commitment_amount,
            
            // Investment information
            investment_field: scrapedData.investment_field,
            investment_detail: scrapedData.investment_detail,
            investment_character: scrapedData.investment_character,
            
            // Company and fund details
            company_industry: scrapedData.company_industry,
            fund_type: scrapedData.fund_type || 'Fund Company',
            fund_status: scrapedData.fund_status || 'Active',
            
            // Dates
            registration_date: scrapedData.registration_date,
            expiry_date: scrapedData.expiry_date,
            founded_date: scrapedData.founded_date,
            
            // Contact information (always update)
            website: scrapedData.website,
            phone: scrapedData.phone,
            email: scrapedData.email,
            
            // Metadata
            data_source: 'Korean VC Database (vcs.go.kr)',
            apify_source: 'Supabase Fund Scraper v2.1 - Updated',
            last_scraped: new Date().toISOString(),
            updated_at: new Date().toISOString()
        };

        // Remove null/undefined values
        Object.keys(updateData).forEach(key => {
            if (updateData[key] === null || updateData[key] === undefined || updateData[key] === '') {
                delete updateData[key];
            }
        });

        return updateData;
    }

    async upsertFund(fundData) {
        /**
         * Insert or update fund - NO PROTECTION LOGIC
         */
        try {
            const fundId = fundData.fund_id;
            
            if (!fundId) {
                console.log(`⚠️ Skipping fund without ID: ${fundData.fund_name}`);
                return false;
            }

            // Get existing record (for logging purposes only)
            const existingRecord = await this.getExistingFundRecord(fundId);
            
            // Prepare update data (always overwrite)
            const updateData = this.prepareFundUpdateData(fundData);
            
            // Perform upsert - always update
            const { data, error } = await supabase
                .from('fund_table')
                .upsert(updateData, {
                    onConflict: 'fund_id',
                    returning: 'minimal'
                });

            if (error) {
                console.log(`❌ Error upserting fund ${fundData.fund_name}:`, error.message);
                this.errorCount++;
                return false;
            }

            const fundManagerInfo = updateData.fund_manager ? ` (대표펀드매니저: ${updateData.fund_manager})` : ' (대표펀드매니저: 없음)';
            const actionType = existingRecord ? 'Updated' : 'Inserted';
            
            console.log(`✅ ${actionType} fund: ${fundData.fund_name}${fundManagerInfo}`);
            
            if (existingRecord) {
                this.updatedCount++;
            } else {
                this.insertedCount++;
            }
            
            return true;

        } catch (error) {
            console.log(`❌ Error in upsertFund for ${fundData.fund_name}:`, error.message);
            this.errorCount++;
            return false;
        }
    }

    async scrapeFundData(page, fundElement) {
        /**
         * Scrape individual fund data with enhanced Korean field extraction
         */
        try {
            const fundData = {};

            // Extract basic fund information
            fundData.fund_name = await page.evaluate(el => {
                const selectors = ['.fund-name', '.name', '.title', '.fundNm', '.펀드명', '.상품명'];
                for (const selector of selectors) {
                    const element = el.querySelector(selector);
                    if (element && element.textContent.trim()) {
                        return element.textContent.trim();
                    }
                }
                return '';
            }, fundElement);

            fundData.fund_id = await page.evaluate(el => {
                const selectors = ['.fund-id', '.id', '[data-fund-id]', '.fundId', '.상품코드', '.펀드코드'];
                for (const selector of selectors) {
                    const element = el.querySelector(selector);
                    if (element && element.textContent.trim()) {
                        return element.textContent.trim();
                    }
                }
                return '';
            }, fundElement);

            fundData.company_name = await page.evaluate(el => {
                const selectors = ['.company-name', '.company', '.companyNm', '.운용사명', '.회사명'];
                for (const selector of selectors) {
                    const element = el.querySelector(selector);
                    if (element && element.textContent.trim()) {
                        return element.textContent.trim();
                    }
                }
                return '';
            }, fundElement);

            // Extract fund manager from multiple Korean field names
            fundData.reprsntNm = await page.evaluate(el => {
                const selectors = ['.reprsntNm', '.representative-name', '.대표자명', '.대표이사'];
                for (const selector of selectors) {
                    const element = el.querySelector(selector);
                    if (element && element.textContent.trim()) {
                        return element.textContent.trim();
                    }
                }
                return '';
            }, fundElement);

            fundData.fundMngrNm = await page.evaluate(el => {
                const selectors = ['.fundMngrNm', '.fund-manager-name', '.펀드매니저', '.운용매니저'];
                for (const selector of selectors) {
                    const element = el.querySelector(selector);
                    if (element && element.textContent.trim()) {
                        return element.textContent.trim();
                    }
                }
                return '';
            }, fundElement);

            fundData.operInstReprsntNm = await page.evaluate(el => {
                const selectors = ['.operInstReprsntNm', '.operating-representative', '.운용기관대표', '.기관대표'];
                for (const selector of selectors) {
                    const element = el.querySelector(selector);
                    if (element && element.textContent.trim()) {
                        return element.textContent.trim();
                    }
                }
                return '';
            }, fundElement);

            // Additional representative fields
            fundData.representative = await page.evaluate(el => {
                const selectors = ['.representative', '.ceo', '.president', '.대표', '.CEO'];
                for (const selector of selectors) {
                    const element = el.querySelector(selector);
                    if (element && element.textContent.trim()) {
                        return element.textContent.trim();
                    }
                }
                return '';
            }, fundElement);

            // Extract fund amounts (preserve Korean 억원 format)
            fundData.operating_amount = await page.evaluate(el => {
                const selectors = ['.operating-amount', '.amount', '.operatingAmount', '.운용금액', '.설정액'];
                for (const selector of selectors) {
                    const element = el.querySelector(selector);
                    if (element) {
                        const text = element.textContent.trim();
                        // Keep original format if in 억원
                        if (text.includes('억')) {
                            return text;
                        }
                        const amount = parseFloat(text.replace(/[^\d.]/g, ''));
                        return isNaN(amount) ? null : amount;
                    }
                }
                return null;
            }, fundElement);

            fundData.total_amount = await page.evaluate(el => {
                const selectors = ['.total-amount', '.totalAmount', '.총금액', '.전체금액'];
                for (const selector of selectors) {
                    const element = el.querySelector(selector);
                    if (element) {
                        const text = element.textContent.trim();
                        if (text.includes('억')) {
                            return text;
                        }
                        const amount = parseFloat(text.replace(/[^\d.]/g, ''));
                        return isNaN(amount) ? null : amount;
                    }
                }
                return null;
            }, fundElement);

            // Extract investment information
            fundData.investment_field = await page.evaluate(el => {
                const selectors = ['.investment-field', '.investmentField', '.투자분야', '.투자영역'];
                for (const selector of selectors) {
                    const element = el.querySelector(selector);
                    if (element && element.textContent.trim()) {
                        return element.textContent.trim();
                    }
                }
                return '';
            }, fundElement);

            // Extract contact information
            fundData.website = await page.evaluate(el => {
                const selectors = ['a[href*="http"]', '.website', '.url', '.홈페이지'];
                for (const selector of selectors) {
                    const element = el.querySelector(selector);
                    if (element) {
                        return element.href || element.textContent.trim();
                    }
                }
                return '';
            }, fundElement);

            fundData.phone = await page.evaluate(el => {
                const selectors = ['.phone', '.tel', '.contact-phone', '.전화번호', '.연락처'];
                for (const selector of selectors) {
                    const element = el.querySelector(selector);
                    if (element && element.textContent.trim()) {
                        return element.textContent.trim();
                    }
                }
                return '';
            }, fundElement);

            this.scrapedCount++;
            return fundData;

        } catch (error) {
            console.log('❌ Error scraping fund:', error.message);
            this.errorCount++;
            return null;
        }
    }

    async run() {
        /**
         * Main fund scraper execution using PlaywrightCrawler (Apify SDK v3+)
         */
        console.log('🚀 Starting Supabase Fund Scraper - Enhanced Representative Extraction');
        console.log('🎯 Target: Extract 대표펀드매니저 data from Korean VC database');
        console.log('=' * 80);

        const targetUrl = 'https://vcs.go.kr/fund/portal/fundsub/fundinfoserv1.asp';
        console.log(`📡 Target URL: ${targetUrl}`);

        const crawler = new PlaywrightCrawler({
            requestHandler: async ({ page, request }) => {
                console.log(`📄 Processing: ${request.url}`);
                
                try {
                    // Wait for page to load
                    await page.waitForTimeout(3000);

                    // Find all fund elements
                    const fundElements = await page.$$('.fund-item, .fund-row, .fund-record, tr[data-fund-id], .table-row, tbody tr');
                    console.log(`📊 Found ${fundElements.length} fund elements to process`);

                    if (fundElements.length === 0) {
                        console.log('⚠️ No fund elements found - checking page structure...');
                        const pageContent = await page.content();
                        console.log('Page title:', await page.title());
                        console.log('Page contains 펀드:', pageContent.includes('펀드'));
                        console.log('Page contains 대표:', pageContent.includes('대표'));
                        return;
                    }

                    // Process each fund
                    for (let i = 0; i < fundElements.length; i++) {
                        const element = fundElements[i];
                        
                        try {
                            console.log(`\n📋 Processing fund ${i + 1}/${fundElements.length}`);
                            
                            const fundData = await this.scrapeFundData(page, element);
                            
                            if (fundData && fundData.fund_name) {
                                await this.upsertFund(fundData);
                            } else {
                                console.log(`⚠️ Skipped fund ${i + 1} - insufficient data`);
                            }
                            
                            // Rate limiting
                            await page.waitForTimeout(1000);
                            
                        } catch (error) {
                            console.log(`❌ Error processing fund ${i + 1}:`, error.message);
                            this.errorCount++;
                        }

                        // Break if too many errors
                        if (this.errorCount > 10) {
                            console.log('⚠️ Too many errors, stopping scraper');
                            break;
                        }
                    }

                } catch (error) {
                    console.log('❌ Error in request handler:', error.message);
                    throw error;
                }
            },
            
            // Crawler configuration
            headless: true,
            browserPoolOptions: {
                useFingerprints: false,
            },
            maxConcurrency: 1,
            maxRequestRetries: 3,
            requestHandlerTimeoutSecs: 300,
        });

        try {
            // Add the target URL to crawler
            await crawler.addRequests([targetUrl]);
            
            // Run the crawler
            console.log('🏃‍♂️ Starting PlaywrightCrawler...');
            await crawler.run();
            
        } catch (error) {
            console.log('❌ Critical error in PlaywrightCrawler:', error.message);
            throw error;
        } finally {
            // Final comprehensive report
            console.log('\n📊 FUND SCRAPING COMPLETE - FINAL REPORT');
            console.log('=' * 60);
            console.log(`✅ Funds Scraped: ${this.scrapedCount}`);
            console.log(`✅ Funds Updated: ${this.updatedCount}`);
            console.log(`✅ Funds Inserted: ${this.insertedCount}`);
            console.log(`👥 대표펀드매니저 Extracted: ${this.fundManagerExtractionCount}`);
            console.log(`❌ 대표펀드매니저 Missing: ${this.fundManagerMissingCount}`);
            console.log(`❌ Errors: ${this.errorCount}`);
            
            const totalProcessed = this.updatedCount + this.insertedCount;
            const extractionRate = totalProcessed > 0 ? ((this.fundManagerExtractionCount / totalProcessed) * 100).toFixed(1) : 0;
            
            console.log(`\n📈 EXTRACTION STATISTICS:`);
            console.log(`🎯 Representative Extraction Rate: ${extractionRate}%`);
            console.log(`🔄 Data Update Strategy: ALWAYS UPDATE (No Protection)`);
            console.log(`📊 Target Achievement: ${extractionRate >= 70 ? '✅ SUCCESS' : '⚠️ NEEDS IMPROVEMENT'}`);
        }
    }
}

// Main execution - Apify SDK v3+ Actor pattern
Actor.main(async () => {
    try {
        console.log('🏦 Initializing Enhanced Fund Scraper...');
        const scraper = new SupabaseFundScraper();
        await scraper.run();
        console.log('🎉 Fund scraper completed successfully!');
    } catch (error) {
        console.error('💥 Critical error in fund scraper:', error);
        throw error;
    }
}); 