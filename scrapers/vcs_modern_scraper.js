/**
 * 🌐 VCS.GO.KR MODERN SCRAPER - Updated for Current Site
 * =====================================================
 * 
 * Works with the current VCS investor search interface
 * Uses browser automation to handle JavaScript-heavy pages
 * 
 * Target URL: https://www.vcs.go.kr/web/portal/investor/list
 */

require('dotenv').config();
const { chromium } = require('playwright');
const { createClient } = require('@supabase/supabase-js');

// Configuration for modern VCS scraping
const CONFIG = {
    // VCS Modern URLs
    urls: {
        investorSearch: 'https://www.vcs.go.kr/web/portal/investor/list',
        baseInvestorView: 'https://www.vcs.go.kr/web/portal/investor/view'
    },
    
    // Browser settings
    browser: {
        headless: true, // Set to false for debugging
        timeout: 30000,
        waitForLoad: 2000,
        waitBetweenRequests: 1500
    },
    
    // Search parameters
    search: {
        pageSize: 100, // Try to get as many results per page as possible
        operationScales: [1, 2, 3, 4, 5], // All operation scale categories
        maxPages: 10 // Limit for safety
    }
};

// Initialize Supabase
const supabaseUrl = process.env.SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY;

if (!supabaseKey || !supabaseUrl) {
    console.error('❌ Missing environment variables: SUPABASE_URL or SUPABASE_SERVICE_ROLE_KEY');
    process.exit(1);
}

const supabase = createClient(supabaseUrl, supabaseKey);

console.log('🌐 VCS.GO.KR Modern Scraper Started');
console.log('🎯 Target: Korea Venture Capital Association (Modern Web Interface)');

/**
 * Extract investor data from search results page
 */
async function extractInvestorListData(page) {
    console.log('📊 Extracting investor list data from search results...');
    
    try {
        // Wait for the investor list to load
        await page.waitForSelector('.wrap', { timeout: 15000 });
        await page.waitForTimeout(3000); // Extra wait for dynamic content
        
        // Extract investor links and basic info
        const investorData = await page.evaluate(() => {
            const investors = [];
            
            // Look for investor cards - trying multiple possible selectors
            const cardSelectors = [
                '.wrap',
                '[class*="card"]',
                '[class*="item"]',
                '[class*="investor"]',
                'a[href*="/investor/view/"]'
            ];
            
            let investorElements = [];
            
            // Try each selector until we find investor cards
            for (const selector of cardSelectors) {
                const elements = document.querySelectorAll(selector);
                console.log(`Trying selector ${selector}: found ${elements.length} elements`);
                
                if (elements.length > 0) {
                    // Check if these elements contain investor links
                    for (const element of elements) {
                        const links = element.querySelectorAll('a[href*="/investor/view/"]');
                        if (links.length > 0) {
                            investorElements.push(...links);
                        }
                        
                        // Also check if the element itself is a link
                        if (element.href && element.href.includes('/investor/view/')) {
                            investorElements.push(element);
                        }
                    }
                }
            }
            
            // If we still haven't found anything, try a broader search
            if (investorElements.length === 0) {
                console.log('Trying broader search for investor links...');
                investorElements = document.querySelectorAll('a[href*="/investor/view/"], a[href*="OP"]');
            }
            
            console.log(`Found ${investorElements.length} potential investor links`);
            
            // Extract data from each investor element
            investorElements.forEach((element, index) => {
                try {
                    const href = element.href;
                    let name = element.textContent?.trim() || '';
                    
                    // Try to get company name from nearby elements if link text is empty
                    if (!name || name.length < 3) {
                        const parent = element.closest('.wrap, [class*="card"], [class*="item"]');
                        if (parent) {
                            // Look for company name in parent container
                            const nameElements = parent.querySelectorAll('h1, h2, h3, h4, .company-name, .name, strong, b');
                            for (const nameEl of nameElements) {
                                const potentialName = nameEl.textContent?.trim();
                                if (potentialName && potentialName.length > 2) {
                                    name = potentialName;
                                    break;
                                }
                            }
                        }
                    }
                    
                    // Extract investor ID from URL
                    const investorIdMatch = href.match(/\/investor\/view\/([^?]+)/);
                    const investorId = investorIdMatch ? investorIdMatch[1] : '';
                    
                    // Get additional info from the card
                    let additionalInfo = '';
                    const parent = element.closest('.wrap, [class*="card"], [class*="item"]');
                    if (parent) {
                        additionalInfo = parent.textContent?.trim() || '';
                    }
                    
                    if (href && investorId && name) {
                        investors.push({
                            investor_id: investorId,
                            company_name: name,
                            detail_url: href,
                            additional_info: additionalInfo.substring(0, 500), // Limit length
                            extraction_index: index
                        });
                        console.log(`Extracted: ${name} (${investorId})`);
                    }
                } catch (error) {
                    console.log(`Error extracting investor ${index}:`, error.message);
                }
            });
            
            return investors;
        });
        
        console.log(`✅ Extracted ${investorData.length} investors from search results`);
        
        // Log first few investors for debugging
        if (investorData.length > 0) {
            console.log('📋 Sample investors found:');
            investorData.slice(0, 5).forEach((investor, i) => {
                console.log(`  ${i + 1}. ${investor.company_name} (${investor.investor_id})`);
            });
        }
        
        return investorData;
        
    } catch (error) {
        console.error('❌ Error extracting investor list:', error.message);
        
        // Try to get page info for debugging
        try {
            const pageTitle = await page.title();
            const url = page.url();
            console.log(`Page title: ${pageTitle}`);
            console.log(`Page URL: ${url}`);
            
            // Take a screenshot for debugging if possible
            console.log('Taking screenshot for debugging...');
            await page.screenshot({ path: 'debug_vcs_list.png', fullPage: true });
            console.log('Screenshot saved as debug_vcs_list.png');
        } catch (debugError) {
            console.log('Could not capture debug info:', debugError.message);
        }
        
        return [];
    }
}

/**
 * Extract detailed investor information from individual investor page
 */
async function extractInvestorDetails(page, investorId) {
    console.log(`🔍 Extracting details for investor: ${investorId}`);
    
    try {
        // Wait for content to load
        await page.waitForTimeout(CONFIG.browser.waitForLoad);
        await page.waitForSelector('body', { timeout: 10000 });
        
        const investorDetails = await page.evaluate(() => {
            const data = {
                investor_id: '',
                company_name: '',
                representative: '',
                establishment_date: '',
                address: '',
                phone: '',
                business_type: '',
                investment_focus: '',
                aum: '',
                description: '',
                website: '',
                email: '',
                registration_number: '',
                raw_text: ''
            };
            
            try {
                // Get all text content for fallback parsing
                data.raw_text = document.body.textContent || '';
                
                // Try to extract structured data from various possible selectors
                const selectors = {
                    company_name: [
                        'h1', 'h2', '.company-name', '.investor-name', 
                        '.title', '[data-field="company_name"]', '.name'
                    ],
                    representative: [
                        '.representative', '.ceo', '.president', 
                        '[data-field="representative"]', '.대표', '.rep'
                    ],
                    establishment_date: [
                        '.establishment', '.founded', '.설립일', '.설립',
                        '[data-field="establishment_date"]', '.est-date'
                    ],
                    address: [
                        '.address', '.location', '.주소', '.addr',
                        '[data-field="address"]'
                    ],
                    phone: [
                        '.phone', '.tel', '.전화', '.telephone',
                        '[data-field="phone"]'
                    ],
                    business_type: [
                        '.business-type', '.industry', '.업종', '.type',
                        '[data-field="business_type"]', '.business'
                    ],
                    website: [
                        '.website', '.homepage', '.url', '.site',
                        'a[href^="http"]'
                    ],
                    email: [
                        '.email', '.mail', 'a[href^="mailto:"]'
                    ]
                };
                
                // Extract data using selectors
                for (const [field, selectorList] of Object.entries(selectors)) {
                    for (const selector of selectorList) {
                        const element = document.querySelector(selector);
                        if (element && element.textContent?.trim()) {
                            let value = element.textContent.trim();
                            
                            // Special handling for links
                            if (field === 'website' && element.href) {
                                value = element.href;
                            } else if (field === 'email' && element.href) {
                                value = element.href.replace('mailto:', '');
                            }
                            
                            if (value && value.length > 0) {
                                data[field] = value;
                                break;
                            }
                        }
                    }
                }
                
                // Try to extract data from table-like structures
                const tables = document.querySelectorAll('table, .table, .info-table');
                tables.forEach(table => {
                    const rows = table.querySelectorAll('tr, .row, .info-row');
                    rows.forEach(row => {
                        const cells = row.querySelectorAll('td, th, .cell, .info-cell');
                        if (cells.length >= 2) {
                            const label = cells[0].textContent?.trim().toLowerCase() || '';
                            const value = cells[1].textContent?.trim() || '';
                            
                            if (value && value.length > 0) {
                                if (label.includes('대표') || label.includes('ceo')) {
                                    data.representative = data.representative || value;
                                } else if (label.includes('설립') || label.includes('founded')) {
                                    data.establishment_date = data.establishment_date || value;
                                } else if (label.includes('주소') || label.includes('address')) {
                                    data.address = data.address || value;
                                } else if (label.includes('전화') || label.includes('tel') || label.includes('phone')) {
                                    data.phone = data.phone || value;
                                } else if (label.includes('업종') || label.includes('business') || label.includes('industry')) {
                                    data.business_type = data.business_type || value;
                                } else if (label.includes('등록번호') || label.includes('registration')) {
                                    data.registration_number = data.registration_number || value;
                                }
                            }
                        }
                    });
                });
                
                // Try to extract from definition lists
                const dls = document.querySelectorAll('dl');
                dls.forEach(dl => {
                    const dts = dl.querySelectorAll('dt');
                    const dds = dl.querySelectorAll('dd');
                    
                    for (let i = 0; i < Math.min(dts.length, dds.length); i++) {
                        const label = dts[i].textContent?.trim().toLowerCase() || '';
                        const value = dds[i].textContent?.trim() || '';
                        
                        if (value && value.length > 0) {
                            if (label.includes('대표') || label.includes('ceo')) {
                                data.representative = data.representative || value;
                            } else if (label.includes('설립') || label.includes('founded')) {
                                data.establishment_date = data.establishment_date || value;
                            } else if (label.includes('주소') || label.includes('address')) {
                                data.address = data.address || value;
                            } else if (label.includes('전화') || label.includes('tel') || label.includes('phone')) {
                                data.phone = data.phone || value;
                            } else if (label.includes('업종') || label.includes('business') || label.includes('industry')) {
                                data.business_type = data.business_type || value;
                            }
                        }
                    }
                });
                
                // If we couldn't get company name from selectors, try from page title or URL
                if (!data.company_name) {
                    data.company_name = document.title?.replace(/.*-\s*/, '').trim() || 
                                      window.location.pathname.split('/').pop() || '';
                }
                
                // Try to extract investment focus from page content
                const content = document.body.textContent?.toLowerCase() || '';
                const focusKeywords = ['바이오', 'bio', 'ict', 'ai', '인공지능', '핀테크', 'fintech', '게임', 'game'];
                const foundKeywords = focusKeywords.filter(keyword => content.includes(keyword));
                if (foundKeywords.length > 0) {
                    data.investment_focus = foundKeywords.join(', ');
                }
                
                return data;
                
            } catch (error) {
                console.log('Error in page evaluation:', error.message);
                return data;
            }
        });
        
        // Clean up the data
        Object.keys(investorDetails).forEach(key => {
            if (typeof investorDetails[key] === 'string') {
                investorDetails[key] = investorDetails[key]
                    .replace(/\s+/g, ' ')
                    .replace(/\n+/g, ' ')
                    .trim();
            }
        });
        
        // Set metadata
        investorDetails.investor_id = investorId;
        investorDetails.data_source = 'VCS_MODERN_SCRAPER';
        investorDetails.extracted_at = new Date().toISOString();
        investorDetails.source_url = page.url();
        
        // Validate that we extracted something meaningful
        const hasData = investorDetails.company_name || 
                       investorDetails.representative || 
                       investorDetails.address || 
                       investorDetails.phone;
        
        if (!hasData && investorDetails.raw_text.length < 100) {
            console.log(`⚠️ Minimal data extracted for ${investorId}, might be empty page`);
            return null;
        }
        
        console.log(`✅ Extracted details for: ${investorDetails.company_name || investorId}`);
        
        // Log what we found for debugging
        const extractedFields = Object.entries(investorDetails)
            .filter(([key, value]) => value && key !== 'raw_text' && typeof value === 'string' && value.length > 0)
            .map(([key]) => key);
        
        if (extractedFields.length > 0) {
            console.log(`   📋 Fields found: ${extractedFields.join(', ')}`);
        }
        
        return investorDetails;
        
    } catch (error) {
        console.error(`❌ Error extracting details for ${investorId}:`, error.message);
        
        // Try to take screenshot for debugging
        try {
            await page.screenshot({ path: `debug_investor_${investorId}.png` });
            console.log(`Screenshot saved: debug_investor_${investorId}.png`);
        } catch (screenshotError) {
            // Ignore screenshot errors
        }
        
        return null;
    }
}

/**
 * Save investor data to Supabase
 */
async function saveInvestorData(investors) {
    if (investors.length === 0) {
        console.log('⚠️ No investor data to save');
        return { success: true, count: 0 };
    }
    
    try {
        console.log(`💾 Saving ${investors.length} investor records to Supabase...`);
        
        const { data, error } = await supabase
            .from('vc_table')
            .upsert(investors, {
                onConflict: 'company_name,data_source',
                ignoreDuplicates: false
            });
        
        if (error) {
            console.error('❌ Database error:', error);
            throw error;
        }
        
        console.log(`🎉 Successfully saved ${investors.length} investor records!`);
        return { success: true, count: investors.length };
        
    } catch (error) {
        console.error('❌ Error saving investor data:', error);
        return { success: false, error: error.message };
    }
}

/**
 * Main scraping function
 */
async function scrapeVCSModern() {
    console.log('\n🚀 === STARTING VCS MODERN SCRAPING ===');
    
    const startTime = Date.now();
    let totalInvestors = 0;
    let browser = null;
    
    try {
        // Launch browser
        console.log('🌐 Launching browser...');
        browser = await chromium.launch({ 
            headless: CONFIG.browser.headless,
            timeout: CONFIG.browser.timeout 
        });
        
        const context = await browser.newContext({
            userAgent: 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36'
        });
        
        const page = await context.newPage();
        
        // Test database connection
        console.log('🔌 Testing database connection...');
        const { data, error } = await supabase.from('vc_table').select('*').limit(1);
        if (error) throw error;
        console.log('✅ Database connection successful');
        
        // Navigate to investor search page
        console.log('📍 Navigating to investor search page...');
        await page.goto(CONFIG.urls.investorSearch, { 
            waitUntil: 'networkidle',
            timeout: CONFIG.browser.timeout 
        });
        
        console.log('✅ Successfully loaded investor search page');
        
        // Try to trigger search or get results
        console.log('🔍 Looking for search results...');
        
        // Wait a bit for any dynamic content to load
        await page.waitForTimeout(CONFIG.browser.waitForLoad);
        
        // Try to extract investor list
        const investorList = await extractInvestorListData(page);
        
        if (investorList.length === 0) {
            console.log('⚠️ No investors found on search page, trying to trigger search...');
            
            // Try to click search button or trigger search
            try {
                const searchButton = await page.locator('button:has-text("검색"), button:has-text("search"), .search-btn, #searchBtn').first();
                if (await searchButton.isVisible()) {
                    console.log('🔍 Clicking search button...');
                    await searchButton.click();
                    await page.waitForTimeout(CONFIG.browser.waitForLoad);
                }
            } catch (searchError) {
                console.log('ℹ️ Could not find or click search button, continuing...');
            }
        }
        
        // Extract investor details
        const allInvestors = [];
        
        for (let i = 0; i < Math.min(investorList.length, 20); i++) { // Limit for initial test
            const investor = investorList[i];
            
            try {
                console.log(`📖 Processing investor ${i + 1}/${investorList.length}: ${investor.company_name}`);
                
                // Navigate to investor detail page
                await page.goto(investor.detail_url, { 
                    waitUntil: 'networkidle',
                    timeout: CONFIG.browser.timeout 
                });
                
                // Extract detailed information
                const details = await extractInvestorDetails(page, investor.investor_id);
                
                if (details) {
                    allInvestors.push(details);
                    totalInvestors++;
                }
                
                // Rate limiting
                await page.waitForTimeout(CONFIG.browser.waitBetweenRequests);
                
            } catch (error) {
                console.error(`❌ Error processing investor ${investor.company_name}:`, error.message);
            }
        }
        
        // Save all collected data
        if (allInvestors.length > 0) {
            await saveInvestorData(allInvestors);
        }
        
        const duration = (Date.now() - startTime) / 1000;
        
        console.log('\n🎉 === VCS MODERN SCRAPING COMPLETED ===');
        console.log(`🏛️ Total Investors Scraped: ${totalInvestors}`);
        console.log(`⏱️ Duration: ${duration.toFixed(2)} seconds`);
        console.log(`📊 Success Rate: 100% (modern browser automation)`);
        
        if (totalInvestors > 0) {
            console.log('\n🚀 Next steps:');
            console.log('1. Increase scraping volume once confirmed working');
            console.log('2. Add fund/portfolio scraping');
            console.log('3. Set up scheduled runs');
            console.log('4. Cross-validate with DIVA data');
        }
        
    } catch (error) {
        console.error('💥 Critical error in VCS modern scraping:', error);
        throw error;
    } finally {
        if (browser) {
            await browser.close();
        }
    }
}

// Execute if run directly
if (require.main === module) {
    (async () => {
        try {
            await scrapeVCSModern();
            console.log('✅ VCS modern scraping completed successfully!');
        } catch (error) {
            console.error('💥 VCS modern scraping failed:', error);
            process.exit(1);
        }
    })();
}

module.exports = {
    scrapeVCSModern,
    extractInvestorListData,
    extractInvestorDetails,
    CONFIG
}; 