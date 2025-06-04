/**
 * 🏦 SUPABASE FUND SCRAPER WITH DATA PROTECTION
 * =============================================
 * 
 * Enhanced Fund scraper that:
 * - Connects directly to Supabase
 * - Protects manually curated 대표펀드매니저 data
 * - Separates auto-scraped vs manual fields
 * - Prevents overwriting protected fund manager data
 */

const Apify = require('apify');
const { createClient } = require('@supabase/supabase-js');

// Supabase configuration
const SUPABASE_URL = process.env.SUPABASE_URL;
const SUPABASE_KEY = process.env.SUPABASE_KEY;

// Initialize Supabase client
const supabase = createClient(SUPABASE_URL, SUPABASE_KEY);

// Protected fields that should NOT be overwritten by scraper
const PROTECTED_FUND_FIELDS = [
    'fund_manager_manual',           // 대표펀드매니저 (Manual)
    'fund_manager_title',            // Fund Manager Title
    'fund_manager_start_date',       // When they started
    'fund_website_verified',         // Manually verified fund website
    'fund_contact_phone',            // Fund contact phone
    'fund_contact_email',            // Fund contact email
    'fund_data_protection_flag',     // Protection flag
    'fund_last_manual_update',       // Last manual update timestamp
    'fund_manual_update_source'      // Source of manual update
];

// Field mapping for fund data
const FUND_FIELD_MAPPING = {
    // Auto-scraped fund fields (safe to update)
    'fund_name': 'fund_name',
    'fund_id': 'fund_id',
    'company_name': 'company_name',
    'company_id': 'company_id',
    'total_amount': 'total_amount',
    'operating_amount': 'operating_amount',
    'commitment_amount': 'commitment_amount',
    'investment_field': 'investment_field',
    'investment_detail': 'investment_detail',
    'investment_character': 'investment_character',
    'company_industry': 'company_industry',
    'registration_date': 'registration_date',
    'expiry_date': 'expiry_date',
    'founded_date': 'founded_date',
    'fund_type': 'fund_type',
    'fund_status': 'fund_status',
    
    // Auto-scraped fund manager data (separate from manual)
    'fund_manager_auto': 'fund_manager_auto',           // 대표펀드매니저 (Auto)
    'fund_website_auto': 'fund_website_auto',           // Fund website (Auto)
    'fund_phone_auto': 'fund_phone_auto',               // Fund phone (Auto)
    'fund_email_auto': 'fund_email_auto',               // Fund email (Auto)
    
    // Metadata
    'data_source': 'data_source',
    'apify_source': 'apify_source',
    'last_scraped': 'last_scraped'
};

class SupabaseFundScraper {
    constructor() {
        this.scrapedCount = 0;
        this.updatedCount = 0;
        this.protectedFundCount = 0;
        this.errorCount = 0;
        this.fundManagerExtractionCount = 0;
    }

    async checkIfFundProtected(fundId) {
        /**
         * Check if a fund record has manual protection enabled
         */
        try {
            const { data, error } = await supabase
                .from('fund_table')
                .select('fund_data_protection_flag, fund_last_manual_update')
                .eq('fund_id', fundId)
                .single();

            if (error && error.code !== 'PGRST116') {
                console.log(`⚠️ Error checking fund protection for ${fundId}:`, error.message);
                return false;
            }

            const isProtected = data?.fund_data_protection_flag === 'MANUAL_CURATED';
            
            if (isProtected) {
                console.log(`🛡️ Fund ${fundId} is protected (manual fund manager data exists)`);
                this.protectedFundCount++;
            }

            return isProtected;
        } catch (error) {
            console.log(`❌ Error in fund protection check for ${fundId}:`, error.message);
            return false;
        }
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

    extractFundManager(fundData) {
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
                    this.fundManagerExtractionCount++;
                    console.log(`✅ Extracted 대표펀드매니저: ${cleanName} from ${this.getSourceName(source, sources)}`);
                    return cleanName;
                }
            }
        }

        return null;
    }

    getSourceName(value, sources) {
        /**
         * Helper to identify the source of extracted fund manager
         */
        const sourceNames = ['reprsntNm', 'fundMngrNm', 'operInstReprsntNm', 'managerName', 'representative', 'contact_person'];
        const index = sources.indexOf(value);
        return index >= 0 ? sourceNames[index] : 'unknown';
    }

    async prepareFundUpdateData(scrapedData, existingRecord, isProtected) {
        /**
         * Prepare fund update data respecting protection rules
         */
        // Extract fund manager from multiple sources
        const extractedFundManager = this.extractFundManager(scrapedData);

        const updateData = {
            // Always safe to update these auto-scraped fields
            fund_name: scrapedData.fund_name,
            company_name: scrapedData.company_name,
            company_id: scrapedData.company_id,
            total_amount: scrapedData.total_amount,
            operating_amount: scrapedData.operating_amount,
            commitment_amount: scrapedData.commitment_amount,
            investment_field: scrapedData.investment_field,
            investment_detail: scrapedData.investment_detail,
            investment_character: scrapedData.investment_character,
            company_industry: scrapedData.company_industry,
            registration_date: scrapedData.registration_date,
            expiry_date: scrapedData.expiry_date,
            founded_date: scrapedData.founded_date,
            fund_type: scrapedData.fund_type,
            fund_status: scrapedData.fund_status || 'Active',
            
            // Auto-scraped fund manager data (separate from manual)
            fund_manager_auto: extractedFundManager,
            fund_website_auto: scrapedData.website,
            fund_phone_auto: scrapedData.phone,
            fund_email_auto: scrapedData.email,
            
            // Metadata
            data_source: 'Korean VC Database (vcs.go.kr)',
            apify_source: 'Supabase Fund Scraper v2.0',
            last_scraped: new Date().toISOString(),
            updated_at: new Date().toISOString()
        };

        // If record is protected, preserve all manual fund manager fields
        if (isProtected && existingRecord) {
            // Keep existing manual fund manager data untouched
            updateData.fund_manager_manual = existingRecord.fund_manager_manual;
            updateData.fund_manager_title = existingRecord.fund_manager_title;
            updateData.fund_manager_start_date = existingRecord.fund_manager_start_date;
            updateData.fund_website_verified = existingRecord.fund_website_verified;
            updateData.fund_contact_phone = existingRecord.fund_contact_phone;
            updateData.fund_contact_email = existingRecord.fund_contact_email;
            updateData.fund_data_protection_flag = existingRecord.fund_data_protection_flag;
            updateData.fund_last_manual_update = existingRecord.fund_last_manual_update;
            updateData.fund_manual_update_source = existingRecord.fund_manual_update_source;
            
            console.log(`🛡️ Preserving manual fund manager data for: ${scrapedData.fund_name}`);
        }

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
         * Insert or update fund with protection logic
         */
        try {
            const fundId = fundData.fund_id;
            
            if (!fundId) {
                console.log(`⚠️ Skipping fund without ID: ${fundData.fund_name}`);
                return false;
            }

            // Check if fund is protected
            const isProtected = await this.checkIfFundProtected(fundId);
            
            // Get existing record
            const existingRecord = await this.getExistingFundRecord(fundId);
            
            // Prepare update data with protection logic
            const updateData = await this.prepareFundUpdateData(fundData, existingRecord, isProtected);
            
            // Perform upsert
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

            const fundManagerInfo = updateData.fund_manager_auto ? ` (대표펀드매니저: ${updateData.fund_manager_auto})` : '';
            console.log(`✅ ${existingRecord ? 'Updated' : 'Inserted'} fund: ${fundData.fund_name}${fundManagerInfo}${isProtected ? ' (protected)' : ''}`);
            this.updatedCount++;
            return true;

        } catch (error) {
            console.log(`❌ Error in upsertFund for ${fundData.fund_name}:`, error.message);
            this.errorCount++;
            return false;
        }
    }

    async scrapeFundData(page, fundElement) {
        /**
         * Scrape individual fund data with enhanced 대표펀드매니저 extraction
         */
        try {
            const fundData = {};

            // Extract basic fund information
            fundData.fund_name = await page.evaluate(el => {
                const nameEl = el.querySelector('.fund-name, .name, .title, .fundNm');
                return nameEl ? nameEl.textContent.trim() : '';
            }, fundElement);

            fundData.fund_id = await page.evaluate(el => {
                const idEl = el.querySelector('.fund-id, .id, [data-fund-id], .fundId');
                return idEl ? idEl.textContent.trim() : '';
            }, fundElement);

            fundData.company_name = await page.evaluate(el => {
                const companyEl = el.querySelector('.company-name, .company, .companyNm');
                return companyEl ? companyEl.textContent.trim() : '';
            }, fundElement);

            fundData.company_id = await page.evaluate(el => {
                const companyIdEl = el.querySelector('.company-id, .companyId');
                return companyIdEl ? companyIdEl.textContent.trim() : '';
            }, fundElement);

            // Extract fund manager from multiple possible sources
            fundData.reprsntNm = await page.evaluate(el => {
                const repEl = el.querySelector('.reprsntNm, .representative-name');
                return repEl ? repEl.textContent.trim() : '';
            }, fundElement);

            fundData.fundMngrNm = await page.evaluate(el => {
                const managerEl = el.querySelector('.fundMngrNm, .fund-manager-name');
                return managerEl ? managerEl.textContent.trim() : '';
            }, fundElement);

            fundData.operInstReprsntNm = await page.evaluate(el => {
                const operEl = el.querySelector('.operInstReprsntNm, .operating-representative');
                return operEl ? operEl.textContent.trim() : '';
            }, fundElement);

            // Extract fund amounts (preserve 억원 units)
            fundData.operating_amount = await page.evaluate(el => {
                const amountEl = el.querySelector('.operating-amount, .amount, .operatingAmount');
                if (!amountEl) return null;
                const amountText = amountEl.textContent.trim();
                // Keep original format if in 억원
                if (amountText.includes('억')) {
                    return amountText;
                }
                const amount = parseFloat(amountText.replace(/[^\d.]/g, ''));
                return isNaN(amount) ? null : amount;
            }, fundElement);

            fundData.total_amount = await page.evaluate(el => {
                const totalEl = el.querySelector('.total-amount, .totalAmount');
                if (!totalEl) return null;
                const totalText = totalEl.textContent.trim();
                if (totalText.includes('억')) {
                    return totalText;
                }
                const amount = parseFloat(totalText.replace(/[^\d.]/g, ''));
                return isNaN(amount) ? null : amount;
            }, fundElement);

            // Extract investment information
            fundData.investment_field = await page.evaluate(el => {
                const fieldEl = el.querySelector('.investment-field, .investmentField');
                return fieldEl ? fieldEl.textContent.trim() : '';
            }, fundElement);

            fundData.investment_detail = await page.evaluate(el => {
                const detailEl = el.querySelector('.investment-detail, .investmentDetail');
                return detailEl ? detailEl.textContent.trim() : '';
            }, fundElement);

            // Extract dates
            fundData.registration_date = await page.evaluate(el => {
                const regEl = el.querySelector('.registration-date, .registrationDate');
                return regEl ? regEl.textContent.trim() : '';
            }, fundElement);

            fundData.expiry_date = await page.evaluate(el => {
                const expEl = el.querySelector('.expiry-date, .expiryDate');
                return expEl ? expEl.textContent.trim() : '';
            }, fundElement);

            // Extract fund type and status
            fundData.fund_type = await page.evaluate(el => {
                const typeEl = el.querySelector('.fund-type, .fundType');
                return typeEl ? typeEl.textContent.trim() : 'Fund Company';
            }, fundElement);

            fundData.fund_status = await page.evaluate(el => {
                const statusEl = el.querySelector('.fund-status, .status');
                return statusEl ? statusEl.textContent.trim() : 'Active';
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
         * Main fund scraper execution
         */
        console.log('🚀 Starting Supabase Fund Scraper with 대표펀드매니저 Protection');
        console.log('=' * 70);

        const browser = await Apify.launchPlaywright({
            launchOptions: {
                headless: true,
            },
        });

        try {
            const page = await browser.newPage();
            
            // Navigate to fund database
            const targetUrl = 'https://vcs.go.kr/fund/portal/fundsub/fundinfoserv1.asp';
            console.log(`📡 Navigating to: ${targetUrl}`);
            
            await page.goto(targetUrl, { waitUntil: 'networkidle' });
            await page.waitForTimeout(3000);

            // Find all fund elements
            const fundElements = await page.$$('.fund-item, .fund-row, .fund-record, tr[data-fund-id]');
            console.log(`📊 Found ${fundElements.length} funds to process`);

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
            }

        } catch (error) {
            console.log('❌ Critical error in fund scraper:', error.message);
            throw error;
        } finally {
            await browser.close();
            
            // Final report
            console.log('\n📊 FUND SCRAPING COMPLETE - FINAL REPORT');
            console.log('=' * 60);
            console.log(`✅ Funds Scraped: ${this.scrapedCount}`);
            console.log(`✅ Funds Updated: ${this.updatedCount}`);
            console.log(`👥 대표펀드매니저 Extracted: ${this.fundManagerExtractionCount}`);
            console.log(`🛡️ Protected Fund Records Preserved: ${this.protectedFundCount}`);
            console.log(`❌ Errors: ${this.errorCount}`);
            console.log('\n🎯 Fund Manager Data Protection Status: ACTIVE');
            console.log('🛡️ Manual 대표펀드매니저 and contact data preserved');
        }
    }
}

// Main execution
Apify.main(async () => {
    const scraper = new SupabaseFundScraper();
    await scraper.run();
}); 