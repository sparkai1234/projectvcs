// Korean VC Scraper for Supabase - Enhanced Data Extraction
// Scrapes VC company data from Korean VC database and sends directly to Supabase
// Includes comprehensive operating amount and representative extraction

const fetch = require('node-fetch');
const { createClient } = require('@supabase/supabase-js');

// Configuration
const SUPABASE_CONFIG = {
    url: 'https://udfgtccxbqmalgpqyxzz.supabase.co',
    // Service role key for write operations - updated to match api_config.py
    serviceRoleKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InVkZmd0Y2N4YnFtYWxncHF5eHp6Iiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc0ODk0NjY5NiwiZXhwIjoyMDY0NTIyNjk2fQ.JgyEKjOhuZpNCCOadsaK90Q8CcoPf_rgdtSXh-1BU18'
};

const SCRAPER_CONFIG = {
    maxPages: null, // null means scrape all pages
    startPage: 1,
    batchSize: 25, // Supabase can handle larger batches than Airtable
    delayBetweenRequests: 100,
    delayBetweenBatches: 300,
    enableDetailedScraping: true // Enable detailed company info scraping
};

async function initializeSupabase() {
    return createClient(SUPABASE_CONFIG.url, SUPABASE_CONFIG.serviceRoleKey);
}

// Enhanced function to extract representative information
function extractRepresentativeData(item) {
    // Primary sources for representative information
    const representative = 
        item.reprsntNm ||          // Representative name field
        item.operInstReprsntNm ||  // Operating institution representative
        item.ceoNm ||              // CEO name
        item.reprsnt ||            // Representative
        item.mngrNm ||             // Manager name
        item.presidentNm ||        // President name
        item.directorNm ||         // Director name
        null;

    // Additional extraction from structured fields
    let additionalRepInfo = {};
    
    // Check for representative info in various fields
    if (item.reprsntInfo) {
        additionalRepInfo.representativeInfo = item.reprsntInfo;
    }
    
    if (item.operInstInfo) {
        additionalRepInfo.institutionInfo = item.operInstInfo;
    }
    
    return {
        primary: representative,
        additional: additionalRepInfo,
        confidence: representative ? 'high' : 'low'
    };
}

// Enhanced transformation function for Supabase vc_table
function transformVCDataForSupabase(item) {
    const representativeData = extractRepresentativeData(item);
    
    // Parse dates properly
    const parseDate = (dateStr) => {
        if (!dateStr) return null;
        // Handle Korean date formats: YYYY-MM-DD, YYYY.MM.DD, YYYYMMDD
        const cleaned = dateStr.replace(/[.-]/g, '');
        if (cleaned.length === 8) {
            return `${cleaned.substr(0,4)}-${cleaned.substr(4,2)}-${cleaned.substr(6,2)}`;
        }
        return dateStr; // Return as-is if already in correct format
    };

    // Parse operating amount (already in 억원, keep as is)
    const parseOperatingAmount = (amountStr) => {
        if (!amountStr && amountStr !== 0) return null;
        const numStr = String(amountStr).replace(/[^0-9.]/g, '');
        const amount = parseFloat(numStr);
        return amount || 0; // Keep in 억원 as that's how it's stored in vcs.go.kr
    };

    // Extract location information
    const parseLocation = (locationStr) => {
        if (!locationStr) return null;
        // Clean up location strings
        return locationStr.trim();
    };

    return {
        // EXACT MATCH TO EXISTING vc_table SCHEMA
        company_id: item.operInstId || item.id || null,
        company_name: item.operInstNm || '',
        company_type: item.operInstTpNm || item.companyType || 'VC Company',
        operating_amount: parseOperatingAmount(item.operAmt) || parseOperatingAmount(item.operatingAmount) || null,
        representative: representativeData.primary || '', // 대표
        location: parseLocation(item.operInstLoc) || parseLocation(item.address) || parseLocation(item.location) || null,
        established_date: parseDate(item.estbDd) || parseDate(item.estDt) || parseDate(item.foundedDt) || null,
        founded: item.estbDd || item.foundedDt || null,
        industry: item.bizCatNm || item.industry || item.businessCategory || null,
        website_url: item.hmpgUrl || item.websiteUrl || item.homepageUrl || null,
        status: item.operStatCd || item.status || 'Active',
        contact_info: {
            phone: item.telNo || item.phoneNumber || null,
            fax: item.faxNo || item.faxNumber || null,
            email: item.email || null,
            address: item.operInstLoc || item.address || null,
            postal_code: item.postalCode || item.zipCode || null
        },
        disclosure_data: {
            original_data: {
                operInstId: item.operInstId,
                operInstNm: item.operInstNm,
                operInstTpNm: item.operInstTpNm,
                operAmt: item.operAmt,
                bizCatNm: item.bizCatNm,
                operInstLoc: item.operInstLoc,
                estbDd: item.estbDd
            },
            representative_data: representativeData,
            scrape_metadata: {
                scraped_at: new Date().toISOString(),
                source_page: item._sourcePage || 1,
                data_quality: representativeData.confidence
            }
        },
        zip_code: item.postalCode || item.zipCode || null,
        apify_source: 'Supabase VC Scraper v2.0 - Enhanced Representative Data',
        import_date: new Date().toISOString(),
        created_at: new Date().toISOString(),
        updated_at: new Date().toISOString()
    };
}

// Function to send data to Supabase with duplicate checking
async function sendToSupabase(supabase, records) {
    try {
        const transformedRecords = records.map(item => transformVCDataForSupabase(item));
        
        // Filter out records without essential data
        const validRecords = transformedRecords.filter(record => 
            record.company_name && record.company_id
        );
        
        if (validRecords.length === 0) {
            console.log('⚠️ No valid records to insert');
            return;
        }
        
        console.log(`📊 Processing ${validRecords.length} VC company records for duplicate checking...`);
        
        // Check for existing records to prevent duplicates
        let insertCount = 0;
        let updateCount = 0;
        let skipCount = 0;
        
        for (const record of validRecords) {
            try {
                // Check if record already exists using company_id as primary key
                const existingResponse = await supabase
                    .from('vc_table')
                    .select('id, company_id, company_name, representative, operating_amount, updated_at')
                    .eq('company_id', record.company_id)
                    .limit(1);
                
                if (existingResponse.data && existingResponse.data.length > 0) {
                    const existing = existingResponse.data[0];
                    
                    // Check if we have better data (especially representative or operating_amount info)
                    const shouldUpdate = 
                        !existing.representative || existing.representative.trim() === '' ||
                        !existing.operating_amount || existing.operating_amount === 0 ||
                        (record.representative && record.representative.trim() !== '' && 
                         record.representative !== existing.representative) ||
                        (record.operating_amount && record.operating_amount > 0 &&
                         record.operating_amount !== existing.operating_amount);
                    
                    if (shouldUpdate) {
                        // Update existing record with enhanced data
                        const { error: updateError } = await supabase
                            .from('vc_table')
                            .update({
                                representative: record.representative,
                                company_name: record.company_name,
                                operating_amount: record.operating_amount,
                                company_type: record.company_type,
                                location: record.location,
                                industry: record.industry,
                                website_url: record.website_url,
                                contact_info: record.contact_info,
                                disclosure_data: record.disclosure_data,
                                updated_at: new Date().toISOString()
                            })
                            .eq('id', existing.id);
                        
                        if (updateError) {
                            console.error(`❌ Failed to update VC ${record.company_id}: ${updateError.message}`);
                        } else {
                            updateCount++;
                            console.log(`🔄 Updated VC: ${record.company_name} -> Rep: ${record.representative || 'N/A'}, Amount: ${record.operating_amount || 0}억원`);
                        }
                    } else {
                        skipCount++;
                    }
                } else {
                    // Insert new record
                    const { error: insertError } = await supabase
                        .from('vc_table')
                        .insert([record]);
                    
                    if (insertError) {
                        console.error(`❌ Failed to insert VC ${record.company_id}: ${insertError.message}`);
                    } else {
                        insertCount++;
                        console.log(`✅ Inserted VC: ${record.company_name} -> Rep: ${record.representative || 'N/A'}, Amount: ${record.operating_amount || 0}억원`);
                    }
                }
                
                // Small delay to avoid overwhelming the database
                await new Promise(resolve => setTimeout(resolve, 10));
                
            } catch (recordError) {
                console.error(`❌ Error processing VC ${record.company_id}: ${recordError.message}`);
            }
        }
        
        console.log(`✅ VC processing complete:`);
        console.log(`   📝 Inserted: ${insertCount} new records`);
        console.log(`   🔄 Updated: ${updateCount} existing records`);
        console.log(`   ⏭️ Skipped: ${skipCount} unchanged records`);
        
        // Log data quality for processed records
        const processedWithRepresentatives = validRecords.filter(r => r.representative && r.representative.trim() !== '');
        const representativePercentage = (processedWithRepresentatives.length / validRecords.length * 100).toFixed(1);
        console.log(`👤 Representative Data: ${processedWithRepresentatives.length}/${validRecords.length} records (${representativePercentage}%) have representative info`);
        
        const processedWithOperatingAmounts = validRecords.filter(r => r.operating_amount && r.operating_amount > 0);
        const amountPercentage = (processedWithOperatingAmounts.length / validRecords.length * 100).toFixed(1);
        console.log(`💰 Operating Amount Data: ${processedWithOperatingAmounts.length}/${validRecords.length} records (${amountPercentage}%) have operating amounts`);
        
        return { insertCount, updateCount, skipCount };
        
    } catch (error) {
        console.error(`❌ Failed to process VC data:`, error.message);
        throw error;
    }
}

// Enhanced detail scraping for additional company information
async function scrapeVCDetails(item) {
    if (!SCRAPER_CONFIG.enableDetailedScraping || !item.operInstId) {
        return item;
    }
    
    try {
        // Attempt to get detailed company information
        const detailUrl = `https://www.vcs.go.kr/web/portal/investor/detail?operInstId=${item.operInstId}`;
        
        const response = await fetch(detailUrl, {
            headers: {
                'Accept': 'application/json, text/javascript, */*; q=0.01',
                'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36',
                'X-Requested-With': 'XMLHttpRequest',
            }
        });
        
        if (response.ok) {
            const detailData = await response.json();
            
            // Extract additional representative and company information from details
            if (detailData.representative || detailData.reprsntNm || detailData.companyInfo) {
                item._detailedCompanyInfo = {
                    representative: detailData.representative || detailData.reprsntNm,
                    companyInfo: detailData.companyInfo,
                    contactInfo: detailData.contactInfo,
                    source: 'detailed_scraping'
                };
            }
        }
        
        // Small delay to be respectful
        await new Promise(resolve => setTimeout(resolve, 50));
        
    } catch (error) {
        console.log(`⚠️ Could not fetch details for company ${item.operInstId}: ${error.message}`);
    }
    
    return item;
}

// Main scraper function
async function scrapeVCsToSupabase() {
    console.log('🏢 Starting Korean VC Scraper for Supabase...');
    console.log('🎯 Enhanced with Representative and Operating Amount Data Extraction');
    
    const supabase = await initializeSupabase();
    
    console.log(`📊 Configuration:
    • Target: Supabase vc_table
    • Max Pages: ${SCRAPER_CONFIG.maxPages || 'ALL'}
    • Start Page: ${SCRAPER_CONFIG.startPage}
    • Batch Size: ${SCRAPER_CONFIG.batchSize}
    • Request Delay: ${SCRAPER_CONFIG.delayBetweenRequests}ms
    • Batch Delay: ${SCRAPER_CONFIG.delayBetweenBatches}ms
    • Enhanced Scraping: ${SCRAPER_CONFIG.enableDetailedScraping ? 'Enabled' : 'Disabled'}`);

    let page = SCRAPER_CONFIG.startPage;
    let hasMore = true;
    let totalProcessed = 0;
    let totalInserted = 0;
    let totalUpdated = 0;
    let totalSkipped = 0;
    let totalWithRepresentatives = 0;
    let totalWithOperatingAmounts = 0;

    // Base URL for VC data (tabMenu=1)
    const baseUrl = 'https://www.vcs.go.kr/web/portal/investor/search';
    const commonQueryParams = 'sortOrder=&sortDirection=&comIndCdArr=1&_comIndCdArr=on&comIndCdArr=2&_comIndCdArr=on&comIndCdArr=3&_comIndCdArr=on&comIndCdArr=4&_comIndCdArr=on&comIndCdArr=5&_comIndCdArr=on&comIndCdArr=6&_comIndCdArr=on&comIndCdArr=7&_comIndCdArr=on&comIndCdArr=8&_comIndCdArr=on&comIndCdArr=9&_comIndCdArr=on&_invstComLocCdArr=on&_invstComLocCdArr=on&_invstComLocCdArr=on&_localCdArr=on&_localCdArr=on&_localCdArr=on&_localCdArr=on&_localCdArr=on&_localCdArr=on&_localCdArr=on&_localCdArr=on&_localCdArr=on&_localCdArr=on&_localCdArr=on&_localCdArr=on&_localCdArr=on&_operScaleCdArr=on&_operScaleCdArr=on&_operScaleCdArr=on&_operScaleCdArr=on&_operScaleCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_comBzcarrCdArr=on&_comBzcarrCdArr=on&_comBzcarrCdArr=on&_comBzcarrCdArr=on&_comBzcarrCdArr=on&_comBzcarrCdArr=on&_invstorTpCdArr=on&_invstorTpCdArr=on&_invstorTpCdArr=on&_invstorTpCdArr=on&_invstorTpCdArr=on&_invstorTpCdArr=on&_invstorTpCdArr=on&sc=operInstNm&sv=';

    while (hasMore) {
        const url = `${baseUrl}?tabMenu=1&cp=${page}&${commonQueryParams}`;
        
        console.log(`📄 Processing VC page ${page}...`);
        
        try {
            const response = await fetch(url, {
                headers: {
                    'Accept': 'application/json, text/javascript, */*; q=0.01',
                    'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36',
                    'X-Requested-With': 'XMLHttpRequest',
                }
            });

            if (!response.ok) {
                throw new Error(`HTTP ${response.status}`);
            }

            const json = await response.json();
            const items = json.list || [];
            const total = json.total || 0;

            if (page === SCRAPER_CONFIG.startPage) {
                console.log(`📊 Found ${total} total VC companies in database`);
                
                if (SCRAPER_CONFIG.maxPages) {
                    const maxItems = SCRAPER_CONFIG.maxPages * (items.length || 10);
                    console.log(`🎯 Will process maximum ${maxItems} items (${SCRAPER_CONFIG.maxPages} pages limit)`);
                }
            }

            if (items.length > 0) {
                // Add source page for tracking
                items.forEach(item => item._sourcePage = page);
                
                // Enhanced scraping for detailed company information
                if (SCRAPER_CONFIG.enableDetailedScraping) {
                    console.log(`🔍 Enhanced scraping: Fetching detailed company data...`);
                    for (let i = 0; i < Math.min(items.length, 3); i++) { // Limit detailed scraping to first 3 items per page
                        items[i] = await scrapeVCDetails(items[i]);
                    }
                }
                
                // Send to Supabase in batches
                for (let i = 0; i < items.length; i += SCRAPER_CONFIG.batchSize) {
                    const batch = items.slice(i, i + SCRAPER_CONFIG.batchSize);
                    const { insertCount, updateCount, skipCount } = await sendToSupabase(supabase, batch);
                    
                    totalInserted += insertCount;
                    totalUpdated += updateCount;
                    totalSkipped += skipCount;
                    
                    // Count records with representative and operating amount data
                    const batchWithRepresentatives = batch.filter(item => extractRepresentativeData(item).primary);
                    const batchWithOperatingAmounts = batch.filter(item => item.operAmt && parseFloat(item.operAmt) > 0);
                    
                    totalWithRepresentatives += batchWithRepresentatives.length;
                    totalWithOperatingAmounts += batchWithOperatingAmounts.length;
                    totalProcessed += batch.length;
                    
                    // Delay between batches
                    if (i + SCRAPER_CONFIG.batchSize < items.length) {
                        await new Promise(resolve => setTimeout(resolve, SCRAPER_CONFIG.delayBetweenBatches));
                    }
                }
                
                console.log(`✅ Processed page ${page}: ${items.length} items`);
                
                // Check if we've reached maxPages limit
                if (SCRAPER_CONFIG.maxPages && page >= SCRAPER_CONFIG.maxPages) {
                    console.log(`🎯 Reached maximum pages limit (${SCRAPER_CONFIG.maxPages})`);
                    hasMore = false;
                } else {
                    page++;
                }
            } else {
                console.log(`ℹ️ No VC items found on page ${page} - scraping complete`);
                hasMore = false;
            }

            // Delay between requests
            await new Promise(resolve => setTimeout(resolve, SCRAPER_CONFIG.delayBetweenRequests));

        } catch (error) {
            console.error(`❌ Error processing VC page ${page}:`, error.message);
            hasMore = false;
        }
    }

    // Final statistics
    const representativePercentage = totalProcessed > 0 ? (totalWithRepresentatives / totalProcessed * 100).toFixed(1) : 0;
    const operatingAmountPercentage = totalProcessed > 0 ? (totalWithOperatingAmounts / totalProcessed * 100).toFixed(1) : 0;
    
    console.log('\n🎉 VC company scraping completed!');
    console.log(`📊 Final Statistics:`);
    console.log(`   • Total Records Processed: ${totalProcessed}`);
    console.log(`   • Records Inserted: ${totalInserted} (new)`);
    console.log(`   • Records Updated: ${totalUpdated} (enhanced)`);
    console.log(`   • Records Skipped: ${totalSkipped} (unchanged)`);
    console.log(`   • Records with Representative Data: ${totalWithRepresentatives} (${representativePercentage}%)`);
    console.log(`   • Records with Operating Amount Data: ${totalWithOperatingAmounts} (${operatingAmountPercentage}%)`);
    console.log(`   • Pages Scraped: ${page - 1}`);
    console.log(`   • Target Table: vc_table`);
    console.log('✅ All enhanced VC company data has been saved to Supabase with proper duplicate handling!');
}

// Run the scraper
if (require.main === module) {
    scrapeVCsToSupabase().catch(console.error);
}

module.exports = { scrapeVCsToSupabase, transformVCDataForSupabase, extractRepresentativeData }; 