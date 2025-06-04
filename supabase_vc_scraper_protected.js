/**
 * 🏢 SUPABASE VC SCRAPER WITH DATA PROTECTION
 * ============================================
 * 
 * Enhanced VC scraper that:
 * - Connects directly to Supabase
 * - Protects manually curated representative/contact data
 * - Separates auto-scraped vs manual fields
 * - Prevents overwriting protected data
 */

const Apify = require('apify');
const { createClient } = require('@supabase/supabase-js');

// Supabase configuration
const SUPABASE_URL = process.env.SUPABASE_URL;
const SUPABASE_KEY = process.env.SUPABASE_KEY;

// Initialize Supabase client
const supabase = createClient(SUPABASE_URL, SUPABASE_KEY);

// Protected fields that should NOT be overwritten by scraper
const PROTECTED_FIELDS = [
    'representative_manual',
    'representative_title',
    'representative_start_date', 
    'website_url_verified',
    'main_phone',
    'main_email',
    'hq_address',
    'data_protection_flag',
    'last_manual_update',
    'manual_update_source'
];

// Field mapping: scraper data -> Supabase fields
const FIELD_MAPPING = {
    // Auto-scraped fields (safe to update)
    'company_name': 'company_name',
    'company_id': 'company_id',
    'industry': 'industry',
    'location': 'location',
    'zip_code': 'zip_code',
    'company_type': 'company_type',
    'founded': 'founded',
    'operating_scale': 'operating_scale',
    'operating_amount': 'operating_amount',
    'business_category': 'business_category',
    'strategy_planner': 'strategy_planner',
    'status': 'status',
    
    // Auto-scraped contact fields (separate from manual)
    'website_auto': 'website_auto',
    'phone_auto': 'phone_auto',
    'email_auto': 'email_auto',
    'representative_auto': 'representative_auto',
    
    // Metadata
    'data_source': 'data_source',
    'apify_source': 'apify_source',
    'last_scraped': 'last_scraped'
};

class SupabaseVCScraper {
    constructor() {
        this.scrapedCount = 0;
        this.updatedCount = 0;
        this.protectedCount = 0;
        this.errorCount = 0;
    }

    async checkIfProtected(companyId) {
        /**
         * Check if a company record has manual protection enabled
         */
        try {
            const { data, error } = await supabase
                .from('vc_table')
                .select('data_protection_flag, last_manual_update')
                .eq('company_id', companyId)
                .single();

            if (error && error.code !== 'PGRST116') { // PGRST116 = no rows returned
                console.log(`⚠️ Error checking protection for ${companyId}:`, error.message);
                return false;
            }

            const isProtected = data?.data_protection_flag === 'MANUAL_CURATED';
            
            if (isProtected) {
                console.log(`🛡️ Company ${companyId} is protected (manual data exists)`);
                this.protectedCount++;
            }

            return isProtected;
        } catch (error) {
            console.log(`❌ Error in protection check for ${companyId}:`, error.message);
            return false;
        }
    }

    async getExistingRecord(companyId) {
        /**
         * Get existing record from Supabase
         */
        try {
            const { data, error } = await supabase
                .from('vc_table')
                .select('*')
                .eq('company_id', companyId)
                .single();

            if (error && error.code !== 'PGRST116') {
                console.log(`⚠️ Error fetching existing record for ${companyId}:`, error.message);
                return null;
            }

            return data || null;
        } catch (error) {
            console.log(`❌ Error getting existing record for ${companyId}:`, error.message);
            return null;
        }
    }

    async prepareUpdateData(scrapedData, existingRecord, isProtected) {
        /**
         * Prepare update data respecting protection rules
         */
        const updateData = {
            // Always safe to update these auto-scraped fields
            company_name: scrapedData.company_name,
            industry: scrapedData.industry,
            location: scrapedData.location,
            zip_code: scrapedData.zip_code,
            company_type: scrapedData.company_type,
            founded: scrapedData.founded,
            operating_scale: scrapedData.operating_scale,
            operating_amount: scrapedData.operating_amount,
            business_category: scrapedData.business_category,
            strategy_planner: scrapedData.strategy_planner,
            status: scrapedData.status || 'Active',
            
            // Auto-scraped contact data (separate from manual)
            website_auto: scrapedData.website,
            phone_auto: scrapedData.phone,
            email_auto: scrapedData.email,
            representative_auto: scrapedData.representative,
            
            // Metadata
            data_source: 'Korean VC Database (vcs.go.kr)',
            apify_source: 'Supabase VC Scraper v2.0',
            last_scraped: new Date().toISOString(),
            updated_at: new Date().toISOString()
        };

        // If record is protected, preserve all manual fields
        if (isProtected && existingRecord) {
            // Keep existing manual data untouched
            updateData.representative_manual = existingRecord.representative_manual;
            updateData.representative_title = existingRecord.representative_title;
            updateData.representative_start_date = existingRecord.representative_start_date;
            updateData.website_url_verified = existingRecord.website_url_verified;
            updateData.main_phone = existingRecord.main_phone;
            updateData.main_email = existingRecord.main_email;
            updateData.hq_address = existingRecord.hq_address;
            updateData.data_protection_flag = existingRecord.data_protection_flag;
            updateData.last_manual_update = existingRecord.last_manual_update;
            updateData.manual_update_source = existingRecord.manual_update_source;
            
            console.log(`🛡️ Preserving manual data for protected company: ${scrapedData.company_name}`);
        }

        // Remove null/undefined values
        Object.keys(updateData).forEach(key => {
            if (updateData[key] === null || updateData[key] === undefined || updateData[key] === '') {
                delete updateData[key];
            }
        });

        return updateData;
    }

    async upsertCompany(companyData) {
        /**
         * Insert or update company with protection logic
         */
        try {
            const companyId = companyData.company_id;
            
            if (!companyId) {
                console.log(`⚠️ Skipping company without ID: ${companyData.company_name}`);
                return false;
            }

            // Check if company is protected
            const isProtected = await this.checkIfProtected(companyId);
            
            // Get existing record
            const existingRecord = await this.getExistingRecord(companyId);
            
            // Prepare update data with protection logic
            const updateData = await this.prepareUpdateData(companyData, existingRecord, isProtected);
            
            // Perform upsert
            const { data, error } = await supabase
                .from('vc_table')
                .upsert(updateData, {
                    onConflict: 'company_id',
                    returning: 'minimal'
                });

            if (error) {
                console.log(`❌ Error upserting ${companyData.company_name}:`, error.message);
                this.errorCount++;
                return false;
            }

            console.log(`✅ ${existingRecord ? 'Updated' : 'Inserted'} company: ${companyData.company_name}${isProtected ? ' (protected)' : ''}`);
            this.updatedCount++;
            return true;

        } catch (error) {
            console.log(`❌ Error in upsertCompany for ${companyData.company_name}:`, error.message);
            this.errorCount++;
            return false;
        }
    }

    async scrapeVCCompany(page, companyElement) {
        /**
         * Scrape individual VC company data
         */
        try {
            const companyData = {};

            // Extract company basic info
            companyData.company_name = await page.evaluate(el => {
                const nameEl = el.querySelector('.company-name, .name, .title');
                return nameEl ? nameEl.textContent.trim() : '';
            }, companyElement);

            companyData.company_id = await page.evaluate(el => {
                const idEl = el.querySelector('.company-id, .id, [data-company-id]');
                return idEl ? idEl.textContent.trim() : '';
            }, companyElement);

            companyData.industry = await page.evaluate(el => {
                const industryEl = el.querySelector('.industry, .sector, .business-type');
                return industryEl ? industryEl.textContent.trim() : '';
            }, companyElement);

            companyData.location = await page.evaluate(el => {
                const locationEl = el.querySelector('.location, .address, .region');
                return locationEl ? locationEl.textContent.trim() : '';
            }, companyElement);

            // Extract contact information (will go to auto fields)
            companyData.website = await page.evaluate(el => {
                const websiteEl = el.querySelector('a[href*="http"], .website, .url');
                return websiteEl ? websiteEl.href || websiteEl.textContent.trim() : '';
            }, companyElement);

            companyData.phone = await page.evaluate(el => {
                const phoneEl = el.querySelector('.phone, .tel, .contact-phone');
                return phoneEl ? phoneEl.textContent.trim() : '';
            }, companyElement);

            companyData.email = await page.evaluate(el => {
                const emailEl = el.querySelector('.email, [href^="mailto:"]');
                return emailEl ? emailEl.textContent.trim() || emailEl.href.replace('mailto:', '') : '';
            }, companyElement);

            // Extract representative (will go to auto field)
            companyData.representative = await page.evaluate(el => {
                const repEl = el.querySelector('.representative, .ceo, .president, .대표');
                return repEl ? repEl.textContent.trim() : '';
            }, companyElement);

            // Extract additional fields
            companyData.company_type = await page.evaluate(el => {
                const typeEl = el.querySelector('.company-type, .type, .category');
                return typeEl ? typeEl.textContent.trim() : '기타운용사';
            }, companyElement);

            companyData.founded = await page.evaluate(el => {
                const foundedEl = el.querySelector('.founded, .established, .date');
                return foundedEl ? foundedEl.textContent.trim() : '';
            }, companyElement);

            companyData.operating_amount = await page.evaluate(el => {
                const amountEl = el.querySelector('.amount, .capital, .fund-size');
                if (!amountEl) return null;
                const amountText = amountEl.textContent.trim();
                const amount = parseFloat(amountText.replace(/[^\d.]/g, ''));
                return isNaN(amount) ? null : amount;
            }, companyElement);

            this.scrapedCount++;
            return companyData;

        } catch (error) {
            console.log('❌ Error scraping company:', error.message);
            this.errorCount++;
            return null;
        }
    }

    async run() {
        /**
         * Main scraper execution
         */
        console.log('🚀 Starting Supabase VC Scraper with Data Protection');
        console.log('=' * 60);

        const browser = await Apify.launchPlaywright({
            launchOptions: {
                headless: true,
            },
        });

        try {
            const page = await browser.newPage();
            
            // Navigate to VC database
            const targetUrl = 'https://vcs.go.kr/vc/portal/vcsub/vcinfoserv1.asp';
            console.log(`📡 Navigating to: ${targetUrl}`);
            
            await page.goto(targetUrl, { waitUntil: 'networkidle' });
            await page.waitForTimeout(3000);

            // Find all company elements
            const companyElements = await page.$$('.company-item, .vc-company, .company-row, tr[data-company-id]');
            console.log(`📊 Found ${companyElements.length} companies to process`);

            // Process each company
            for (let i = 0; i < companyElements.length; i++) {
                const element = companyElements[i];
                
                try {
                    console.log(`\n📋 Processing company ${i + 1}/${companyElements.length}`);
                    
                    const companyData = await this.scrapeVCCompany(page, element);
                    
                    if (companyData && companyData.company_name) {
                        await this.upsertCompany(companyData);
                    } else {
                        console.log(`⚠️ Skipped company ${i + 1} - insufficient data`);
                    }
                    
                    // Rate limiting
                    await page.waitForTimeout(1000);
                    
                } catch (error) {
                    console.log(`❌ Error processing company ${i + 1}:`, error.message);
                    this.errorCount++;
                }
            }

        } catch (error) {
            console.log('❌ Critical error in scraper:', error.message);
            throw error;
        } finally {
            await browser.close();
            
            // Final report
            console.log('\n📊 SCRAPING COMPLETE - FINAL REPORT');
            console.log('=' * 50);
            console.log(`✅ Companies Scraped: ${this.scrapedCount}`);
            console.log(`✅ Companies Updated: ${this.updatedCount}`);
            console.log(`🛡️ Protected Records Preserved: ${this.protectedCount}`);
            console.log(`❌ Errors: ${this.errorCount}`);
            console.log('\n🎯 Data Protection Status: ACTIVE');
            console.log('🛡️ Manual representative and contact data preserved');
        }
    }
}

// Main execution
Apify.main(async () => {
    const scraper = new SupabaseVCScraper();
    await scraper.run();
}); 