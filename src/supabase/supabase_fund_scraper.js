// Korean Fund Scraper for Supabase - Enhanced with Fund Manager Data
// Scrapes fund data from Korean VC database and sends directly to Supabase
// Includes comprehensive 대표펀드매니저 (Fund Manager Representative) extraction

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
    batchSize: 20, // Supabase can handle larger batches than Airtable
    delayBetweenRequests: 100,
    delayBetweenBatches: 300,
    enableDetailedScraping: true // Enable detailed fund manager scraping
};

async function initializeSupabase() {
    return createClient(SUPABASE_CONFIG.url, SUPABASE_CONFIG.serviceRoleKey);
}

// Enhanced function to extract fund manager information
function extractFundManagerData(item) {
    // Primary sources for fund manager information
    const fundManager = 
        item.reprsntNm ||          // Representative name field
        item.fundMngrNm ||         // Fund manager name field  
        item.operInstReprsntNm ||  // Operating institution representative
        item.operReprsntNm ||      // Operator representative
        item.mngrNm ||             // Manager name
        item.ceoNm ||              // CEO name
        item.reprsnt ||            // Representative
        item.fundReprsnt ||        // Fund representative
        null;

    // Additional extraction from structured fields
    let additionalManagerInfo = {};
    
    // Check for manager info in various fields
    if (item.fundMngrInfo) {
        additionalManagerInfo.managerInfo = item.fundMngrInfo;
    }
    
    if (item.operInstInfo) {
        additionalManagerInfo.institutionInfo = item.operInstInfo;
    }
    
    return {
        primary: fundManager,
        additional: additionalManagerInfo,
        confidence: fundManager ? 'high' : 'low'
    };
}

// Enhanced transformation function for Supabase fund_table
function transformFundDataForSupabase(item) {
    const managerData = extractFundManagerData(item);
    
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

    // Parse amount (convert from 억원 to won for storage)
    const parseAmount = (amountStr) => {
        if (!amountStr) return null;
        const numStr = String(amountStr).replace(/[^0-9.]/g, '');
        const amount = parseFloat(numStr);
        return amount ? Math.round(amount * 1e8) : null; // Convert 억원 to 원
    };

    return {
        // EXACT MATCH TO EXISTING fund_table SCHEMA
        fund_id: item.fundId || item.id || null,
        fund_name: item.fundNm || item.operInstNm || '',
        company_id: item.operInstId || item.companyId || null,
        company_name: item.operInstNm || '',
        fund_size: parseAmount(item.formTotamt) || parseAmount(item.totAmt) || parseAmount(item.operAmt) || null,
        fund_status: item.status || 'Active',
        establishment_date: parseDate(item.regDd) || parseDate(item.estDt) || null,
        expiry_date: parseDate(item.expDd) || parseDate(item.expryDt) || null,
        investment_detail: item.invstFldTpNm || item.invstFldDtlTpNm || '',
        representative: managerData.primary || '', // 대표펀드매니저
        notes: `Fund Manager: ${managerData.primary || 'N/A'}\nSource: vcs.go.kr\nConfidence: ${managerData.confidence}`,
        apify_source: 'Supabase Fund Scraper v2.0 - Enhanced Manager Data',
        import_date: new Date().toISOString(),
        created_at: new Date().toISOString(),
        updated_at: new Date().toISOString()
    };
}

// Function to send data to Supabase with duplicate checking
async function sendToSupabase(supabase, records) {
    try {
        const transformedRecords = records.map(item => transformFundDataForSupabase(item));
        
        // Filter out records without essential data
        const validRecords = transformedRecords.filter(record => 
            record.fund_name && record.company_id && record.fund_id
        );
        
        if (validRecords.length === 0) {
            console.log('⚠️ No valid records to insert');
            return;
        }
        
        console.log(`📊 Processing ${validRecords.length} fund records for duplicate checking...`);
        
        // Check for existing records to prevent duplicates
        let insertCount = 0;
        let updateCount = 0;
        let skipCount = 0;
        
        for (const record of validRecords) {
            try {
                // Check if record already exists using fund_id as primary key
                const existingResponse = await supabase
                    .from('fund_table')
                    .select('id, fund_id, fund_name, representative, updated_at')
                    .eq('fund_id', record.fund_id)
                    .limit(1);
                
                if (existingResponse.data && existingResponse.data.length > 0) {
                    const existing = existingResponse.data[0];
                    
                    // Check if we have better data (especially representative info)
                    const shouldUpdate = 
                        !existing.representative || existing.representative.trim() === '' ||
                        (record.representative && record.representative.trim() !== '' && 
                         record.representative !== existing.representative);
                    
                    if (shouldUpdate) {
                        // Update existing record with enhanced data
                        const { error: updateError } = await supabase
                            .from('fund_table')
                            .update({
                                representative: record.representative,
                                fund_name: record.fund_name,
                                company_name: record.company_name,
                                fund_size: record.fund_size,
                                investment_detail: record.investment_detail,
                                notes: record.notes,
                                updated_at: new Date().toISOString()
                            })
                            .eq('id', existing.id);
                        
                        if (updateError) {
                            console.error(`❌ Failed to update fund ${record.fund_id}: ${updateError.message}`);
                        } else {
                            updateCount++;
                            if (record.representative && record.representative.trim() !== '') {
                                console.log(`🔄 Updated fund: ${record.fund_name} -> Rep: ${record.representative}`);
                            }
                        }
                    } else {
                        skipCount++;
                    }
                } else {
                    // Insert new record
                    const { error: insertError } = await supabase
                        .from('fund_table')
                        .insert([record]);
                    
                    if (insertError) {
                        console.error(`❌ Failed to insert fund ${record.fund_id}: ${insertError.message}`);
                    } else {
                        insertCount++;
                        if (record.representative && record.representative.trim() !== '') {
                            console.log(`✅ Inserted fund: ${record.fund_name} -> Rep: ${record.representative}`);
                        }
                    }
                }
                
                // Small delay to avoid overwhelming the database
                await new Promise(resolve => setTimeout(resolve, 10));
                
            } catch (recordError) {
                console.error(`❌ Error processing fund ${record.fund_id}: ${recordError.message}`);
            }
        }
        
        console.log(`✅ Fund processing complete:`);
        console.log(`   📝 Inserted: ${insertCount} new records`);
        console.log(`   🔄 Updated: ${updateCount} existing records`);
        console.log(`   ⏭️ Skipped: ${skipCount} unchanged records`);
        
        // Log fund manager data quality for processed records
        const processedWithManagers = validRecords.filter(r => r.representative && r.representative.trim() !== '');
        const managerPercentage = (processedWithManagers.length / validRecords.length * 100).toFixed(1);
        console.log(`📋 Fund Manager Data: ${processedWithManagers.length}/${validRecords.length} records (${managerPercentage}%) have manager info`);
        
        return { insertCount, updateCount, skipCount };
        
    } catch (error) {
        console.error(`❌ Failed to process fund data:`, error.message);
        throw error;
    }
}

// Enhanced detail scraping for fund manager information
async function scrapeFundDetails(item) {
    if (!SCRAPER_CONFIG.enableDetailedScraping || !item.fundId) {
        return item;
    }
    
    try {
        // Attempt to get detailed fund information
        const detailUrl = `https://www.vcs.go.kr/web/portal/investor/fundDetail?fundId=${item.fundId}`;
        
        const response = await fetch(detailUrl, {
            headers: {
                'Accept': 'application/json, text/javascript, */*; q=0.01',
                'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36',
                'X-Requested-With': 'XMLHttpRequest',
            }
        });
        
        if (response.ok) {
            const detailData = await response.json();
            
            // Extract additional manager information from details
            if (detailData.fundManager || detailData.reprsntNm || detailData.mngrInfo) {
                item._detailedManagerInfo = {
                    fundManager: detailData.fundManager,
                    representative: detailData.reprsntNm,
                    managerInfo: detailData.mngrInfo,
                    source: 'detailed_scraping'
                };
            }
        }
        
        // Small delay to be respectful
        await new Promise(resolve => setTimeout(resolve, 50));
        
    } catch (error) {
        console.log(`⚠️ Could not fetch details for fund ${item.fundId}: ${error.message}`);
    }
    
    return item;
}

// Main scraper function
async function scrapeFundsToSupabase() {
    console.log('🏦 Starting Korean Fund Scraper for Supabase...');
    console.log('🎯 Enhanced with Fund Manager Data Extraction');
    
    const supabase = await initializeSupabase();
    
    console.log(`📊 Configuration:
    • Target: Supabase fund_table
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
    let totalWithManagers = 0;

    // Base URL for fund data (tabMenu=2)
    const baseUrl = 'https://www.vcs.go.kr/web/portal/investor/search';
    const commonQueryParams = 'sortOrder=&sortDirection=&comIndCdArr=1&_comIndCdArr=on&comIndCdArr=2&_comIndCdArr=on&comIndCdArr=3&_comIndCdArr=on&comIndCdArr=4&_comIndCdArr=on&comIndCdArr=5&_comIndCdArr=on&comIndCdArr=6&_comIndCdArr=on&comIndCdArr=7&_comIndCdArr=on&comIndCdArr=8&_comIndCdArr=on&comIndCdArr=9&_comIndCdArr=on&_invstComLocCdArr=on&_invstComLocCdArr=on&_invstComLocCdArr=on&_localCdArr=on&_localCdArr=on&_localCdArr=on&_localCdArr=on&_localCdArr=on&_localCdArr=on&_localCdArr=on&_localCdArr=on&_localCdArr=on&_operScaleCdArr=on&_operScaleCdArr=on&_operScaleCdArr=on&_operScaleCdArr=on&_operScaleCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_comBzcarrCdArr=on&_comBzcarrCdArr=on&_comBzcarrCdArr=on&_comBzcarrCdArr=on&_comBzcarrCdArr=on&_comBzcarrCdArr=on&_invstorTpCdArr=on&_invstorTpCdArr=on&_invstorTpCdArr=on&_invstorTpCdArr=on&_invstorTpCdArr=on&_invstorTpCdArr=on&_invstorTpCdArr=on&_invstorTpCdArr=on&sc=operInstNm&sv=';

    while (hasMore) {
        const url = `${baseUrl}?tabMenu=2&cp=${page}&${commonQueryParams}`;
        
        console.log(`📄 Processing Fund page ${page}...`);
        
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
                console.log(`📊 Found ${total} total funds in database`);
                
                if (SCRAPER_CONFIG.maxPages) {
                    const maxItems = SCRAPER_CONFIG.maxPages * (items.length || 10);
                    console.log(`🎯 Will process maximum ${maxItems} items (${SCRAPER_CONFIG.maxPages} pages limit)`);
                }
            }

            if (items.length > 0) {
                // Add source page for tracking
                items.forEach(item => item._sourcePage = page);
                
                // Enhanced scraping for detailed manager information
                if (SCRAPER_CONFIG.enableDetailedScraping) {
                    console.log(`🔍 Enhanced scraping: Fetching detailed manager data...`);
                    for (let i = 0; i < Math.min(items.length, 5); i++) { // Limit detailed scraping to first 5 items per page
                        items[i] = await scrapeFundDetails(items[i]);
                    }
                }
                
                // Send to Supabase in batches
                for (let i = 0; i < items.length; i += SCRAPER_CONFIG.batchSize) {
                    const batch = items.slice(i, i + SCRAPER_CONFIG.batchSize);
                    const { insertCount, updateCount, skipCount } = await sendToSupabase(supabase, batch);
                    
                    // Count records with manager data
                    const batchWithManagers = batch.filter(item => extractFundManagerData(item).primary);
                    totalWithManagers += batchWithManagers.length;
                    
                    totalProcessed += batch.length;
                    totalInserted += insertCount;
                    totalUpdated += updateCount;
                    totalSkipped += skipCount;
                    
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
                console.log(`ℹ️ No fund items found on page ${page} - scraping complete`);
                hasMore = false;
            }

            // Delay between requests
            await new Promise(resolve => setTimeout(resolve, SCRAPER_CONFIG.delayBetweenRequests));

        } catch (error) {
            console.error(`❌ Error processing fund page ${page}:`, error.message);
            hasMore = false;
        }
    }

    // Final statistics
    const managerPercentage = totalProcessed > 0 ? (totalWithManagers / totalProcessed * 100).toFixed(1) : 0;
    
    console.log('\n🎉 Fund scraping completed!');
    console.log(`📊 Final Statistics:`);
    console.log(`   • Total Records Processed: ${totalProcessed}`);
    console.log(`   • Records Inserted: ${totalInserted} (new)`);
    console.log(`   • Records Updated: ${totalUpdated} (enhanced)`);
    console.log(`   • Records Skipped: ${totalSkipped} (unchanged)`);
    console.log(`   • Records with Fund Manager Data: ${totalWithManagers} (${managerPercentage}%)`);
    console.log(`   • Pages Scraped: ${page - 1}`);
    console.log(`   • Target Table: fund_table`);
    console.log('✅ All enhanced fund data has been saved to Supabase with proper duplicate handling!');
}

// Run the scraper
if (require.main === module) {
    scrapeFundsToSupabase().catch(console.error);
}

module.exports = { scrapeFundsToSupabase, transformFundDataForSupabase, extractFundManagerData }; 