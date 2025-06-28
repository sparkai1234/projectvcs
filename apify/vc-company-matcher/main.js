/**
 * 🔍 VC Company URL & Representative Matcher - v1.0.0
 * ====================================================
 * 
 * Automated system to match Korean VC company names with:
 * - Company website URLs
 * - 대표이사/CEO (Representatives)
 * 
 * Data Sources:
 * 1. 혁신의 숲 (Innovation Forest) - Primary source
 * 2. Company Team/인사말 pages - For representative info
 * 3. News searches - For press releases with CEO names
 * 
 * Target: Update Supabase vc_table with representative and website_url fields
 */

const { Actor } = require('apify');
const { createClient } = require('@supabase/supabase-js');
const puppeteer = require('puppeteer');

// Default company list for testing
const DEFAULT_VC_COMPANIES = [
    '강원대학교기술지주회사',
    '카카오벤처스', 
    '네이버투자',
    '한국투자파트너스',
    '알토스벤처스',
    '데일리 파트너스',
    '에이티넘인베스트먼트',
    '위벤처스',
    '에이치지이니셔티브'
];

/**
 * 🔍 Search for company information in 혁신의 숲 (Innovation Forest)
 * Primary source for company URL, basic 대표이사 info (potentially outdated)
 */
async function searchInnovationForest(page, companyName) {
    try {
        console.log(`🌲 Searching 혁신의 숲 (innoforest.co.kr) for: ${companyName}`);
        
        // Navigate to Innovation Forest main site
        await page.goto('https://www.innoforest.co.kr/', {
            waitUntil: 'networkidle0',
            timeout: 30000
        });
        
        // Look for search functionality on innoforest
        const searchInput = await page.$('input[type="search"], input[name="search"], input[placeholder*="검색"], .search-input');
        
        if (searchInput) {
            await searchInput.fill(companyName);
            await page.keyboard.press('Enter');
            await page.waitForTimeout(3000);
        } else {
            // Try alternative search approach or navigate to company directory
            console.log(`🔍 Looking for company directory on InnoForest...`);
            
            // Look for company listings or directory links
            const directoryLinks = await page.$$eval('a', links => 
                links.filter(link => 
                    link.textContent?.includes('기업') || 
                    link.textContent?.includes('투자사') ||
                    link.textContent?.includes('VC') ||
                    link.href?.includes('company') ||
                    link.href?.includes('investor')
                ).map(link => ({ text: link.textContent?.trim(), href: link.href }))
            );
            
            if (directoryLinks.length > 0) {
                console.log(`📂 Found directory links:`, directoryLinks.slice(0, 3));
                await page.goto(directoryLinks[0].href, { waitUntil: 'networkidle0', timeout: 20000 });
            }
        }
        
        // Extract company information from current page
        const companyInfo = await page.evaluate((searchCompanyName) => {
            const results = [];
            
            // Look for company cards, listings, or profile sections
            const selectors = [
                '.company-card', '.company-item', '.investor-card', '.vc-item',
                '.company-profile', '.business-card', '[data-company]',
                '.company-list-item', '.search-result'
            ];
            
            let foundElements = [];
            for (const selector of selectors) {
                const elements = document.querySelectorAll(selector);
                if (elements.length > 0) {
                    foundElements = Array.from(elements);
                    break;
                }
            }
            
            // If no specific elements found, search in text content
            if (foundElements.length === 0) {
                const allElements = document.querySelectorAll('div, section, article');
                foundElements = Array.from(allElements).filter(el => 
                    el.textContent?.includes(searchCompanyName)
                );
            }
            
            foundElements.forEach(element => {
                const text = element.textContent || '';
                const links = element.querySelectorAll('a[href]');
                
                // Extract company name
                const namePattern = new RegExp(searchCompanyName, 'i');
                if (namePattern.test(text)) {
                    
                    // Extract website URL
                    let websiteUrl = null;
                    links.forEach(link => {
                        const href = link.href;
                        if (href && !href.includes('innoforest.co.kr') && 
                            (href.startsWith('http') || href.startsWith('www'))) {
                            websiteUrl = href;
                        }
                    });
                    
                    // Extract 대표이사 information
                    let representative = null;
                    const repPatterns = [
                        /대표이사[:\s]*([가-힣]{2,4})/g,
                        /대표[:\s]*([가-힣]{2,4})/g,
                        /CEO[:\s]*([가-힣]{2,4})/g,
                        /창립자[:\s]*([가-힣]{2,4})/g
                    ];
                    
                    const representatives = [];
                    repPatterns.forEach(pattern => {
                        let match;
                        while ((match = pattern.exec(text)) !== null) {
                            representatives.push(match[0]);
                        }
                    });
                    
                    representative = [...new Set(representatives)].slice(0, 2).join(', ') || null;
                    
                    results.push({
                        name: searchCompanyName,
                        websiteUrl,
                        representative,
                        fullText: text.slice(0, 200),
                        source: 'InnoForest'
                    });
                }
            });
            
            return results;
        }, companyName);
        
        console.log(`🎯 InnoForest results for ${companyName}:`, companyInfo.length);
        return companyInfo.length > 0 ? companyInfo[0] : null;
        
    } catch (error) {
        console.log(`❌ Error searching InnoForest for ${companyName}:`, error.message);
        return null;
    }
}

/**
 * 🏢 Extract company website URL and representative from company page
 */
async function extractCompanyInfo(page, companyUrl, companyName) {
    try {
        console.log(`🔍 Extracting info from: ${companyUrl}`);
        
        await page.goto(companyUrl, {
            waitUntil: 'networkidle0',
            timeout: 30000
        });
        
        // Extract company website URL
        const websiteUrl = await page.evaluate(() => {
            // Look for website links
            const selectors = [
                'a[href*="http"]:not([href*="k-startup.go.kr"])',
                'a[href*="www."]',
                '.website-link a',
                '.company-url a',
                '.homepage a'
            ];
            
            for (const selector of selectors) {
                const element = document.querySelector(selector);
                if (element && element.href) {
                    const url = element.href;
                    // Filter out common non-company URLs
                    if (!url.includes('facebook.com') && 
                        !url.includes('instagram.com') && 
                        !url.includes('linkedin.com') &&
                        !url.includes('youtube.com') &&
                        !url.includes('twitter.com') &&
                        !url.includes('k-startup.go.kr')) {
                        return url;
                    }
                }
            }
            return null;
        });
        
        // Extract representative/CEO information
        const representative = await page.evaluate(() => {
            const patterns = [
                '대표이사',
                '대표',
                '창립자',
                'CEO',
                '회장',
                '사장'
            ];
            
            const text = document.body.textContent || '';
            const representatives = [];
            
            // Look for Korean representative patterns
            patterns.forEach(pattern => {
                const regex = new RegExp(`${pattern}[\\s:]*([가-힣]{2,4})`, 'g');
                let match;
                while ((match = regex.exec(text)) !== null) {
                    const name = match[1].trim();
                    if (name && name.length >= 2 && name.length <= 4) {
                        representatives.push(`${pattern} ${name}`);
                    }
                }
            });
            
            // Remove duplicates and return first two
            const uniqueReps = [...new Set(representatives)];
            return uniqueReps.slice(0, 2).join(', ') || null;
        });
        
        console.log(`✅ Extracted for ${companyName}:`, { websiteUrl, representative });
        
        return {
            websiteUrl,
            representative,
            source: 'Innovation Forest'
        };
        
    } catch (error) {
        console.log(`❌ Error extracting info for ${companyName}:`, error.message);
        return { websiteUrl: null, representative: null, source: 'Innovation Forest' };
    }
}

/**
 * 🏢 Extract additional info from company's own website
 */
async function extractFromCompanyWebsite(page, websiteUrl, companyName) {
    try {
        if (!websiteUrl) return { representative: null };
        
        console.log(`🌐 Checking company website: ${websiteUrl}`);
        
        await page.goto(websiteUrl, {
            waitUntil: 'networkidle0',
            timeout: 30000
        });
        
        // Try to find Team or 인사말 page
        const teamPageUrl = await page.evaluate(() => {
            const links = Array.from(document.querySelectorAll('a'));
            const teamLink = links.find(link => {
                const text = link.textContent?.toLowerCase() || '';
                return text.includes('team') || 
                       text.includes('about') || 
                       text.includes('인사말') || 
                       text.includes('경영진') ||
                       text.includes('대표이사') ||
                       text.includes('회사소개');
            });
            return teamLink ? teamLink.href : null;
        });
        
        // If team page found, navigate to it
        if (teamPageUrl) {
            console.log(`👥 Found team page: ${teamPageUrl}`);
            await page.goto(teamPageUrl, { waitUntil: 'networkidle0', timeout: 20000 });
        }
        
        // Extract representative information
        const representative = await page.evaluate(() => {
            const patterns = [
                '대표이사',
                '대표',
                'CEO',
                '창립자',
                '회장',
                '사장'
            ];
            
            const text = document.body.textContent || '';
            const representatives = [];
            
            patterns.forEach(pattern => {
                const regex = new RegExp(`${pattern}[\\s:]*([가-힣]{2,4})`, 'g');
                let match;
                while ((match = regex.exec(text)) !== null) {
                    const name = match[1].trim();
                    if (name && name.length >= 2 && name.length <= 4) {
                        representatives.push(`${pattern} ${name}`);
                    }
                }
            });
            
            const uniqueReps = [...new Set(representatives)];
            return uniqueReps.slice(0, 2).join(', ') || null;
        });
        
        console.log(`🎯 Website representative for ${companyName}:`, representative);
        return { representative };
        
    } catch (error) {
        console.log(`❌ Error checking company website for ${companyName}:`, error.message);
        return { representative: null };
    }
}

/**
 * 📰 Search news for company representative information
 * HIGHEST PRIORITY source - most current and accurate 대표이사 info
 */
async function searchNewsForRepresentative(page, companyName) {
    try {
        console.log(`📰 Searching news (최우선) for ${companyName} 대표이사...`);
        
        // Multiple search queries for better coverage
        const searchQueries = [
            `"${companyName}" 대표이사`,
            `"${companyName}" "대표이사"`,
            `${companyName} CEO`,
            `${companyName} 대표`,
            `${companyName} 임명`,
            `${companyName} 신규 대표이사`
        ];
        
        let allRepresentatives = [];
        
        // Try multiple search queries
        for (const [index, searchQuery] of searchQueries.entries()) {
            try {
                console.log(`📰 News search ${index + 1}/${searchQueries.length}: "${searchQuery}"`);
                
                await page.goto(`https://search.naver.com/search.naver?where=news&query=${encodeURIComponent(searchQuery)}&sort=1`, {
                    waitUntil: 'networkidle0',
                    timeout: 20000
                });
                
                // Extract representative from news results
                const representatives = await page.evaluate((companyName) => {
                    const results = [];
                    const newsItems = document.querySelectorAll('.news_area, .news_tit, .news_contents, .api_txt_lines, .dsc_txt_lines');
                    
                    newsItems.forEach(item => {
                        const text = item.textContent || '';
                        
                        // Only process if text contains company name
                        if (text.includes(companyName)) {
                            
                            // Enhanced patterns for finding 대표이사
                            const patterns = [
                                // Pattern 1: "회사명 대표이사 이름"
                                new RegExp(`${companyName}[\\s]*대표이사[\\s]*([가-힣]{2,4})`, 'g'),
                                // Pattern 2: "대표이사 이름은"
                                new RegExp(`대표이사[\\s]*([가-힣]{2,4})[는은이]`, 'g'),
                                // Pattern 3: "이름 대표이사"
                                new RegExp(`([가-힣]{2,4})[\\s]*대표이사`, 'g'),
                                // Pattern 4: "CEO 이름"
                                new RegExp(`CEO[\\s]*([가-힣]{2,4})`, 'g'),
                                // Pattern 5: "대표 이름"
                                new RegExp(`대표[\\s]*([가-힣]{2,4})`, 'g'),
                                // Pattern 6: "이름 대표" 
                                new RegExp(`([가-힣]{2,4})[\\s]*대표`, 'g')
                            ];
                            
                            patterns.forEach((pattern, patternIndex) => {
                                let match;
                                while ((match = pattern.exec(text)) !== null) {
                                    const name = match[1]?.trim();
                                    if (name && name.length >= 2 && name.length <= 4) {
                                        // Determine title based on pattern
                                        let title = '대표이사';
                                        if (patternIndex === 3) title = 'CEO';
                                        else if (patternIndex >= 4) title = '대표';
                                        
                                        const fullTitle = `${title} ${name}`;
                                        results.push({
                                            representative: fullTitle,
                                            context: text.slice(Math.max(0, match.index - 50), match.index + 100),
                                            pattern: patternIndex
                                        });
                                    }
                                }
                            });
                        }
                    });
                    
                    return results;
                }, companyName);
                
                allRepresentatives.push(...representatives);
                
                // If we found good results, we can break early
                if (representatives.length > 0) {
                    console.log(`✅ Found ${representatives.length} representative mentions`);
                    break;
                }
                
                // Small delay between searches
                await page.waitForTimeout(1000);
                
            } catch (searchError) {
                console.log(`⚠️ Search query ${index + 1} failed:`, searchError.message);
                continue;
            }
        }
        
        if (allRepresentatives.length > 0) {
            // Prioritize results and deduplicate
            const uniqueReps = [];
            const seenNames = new Set();
            
            // Sort by pattern priority (more specific patterns first)
            allRepresentatives.sort((a, b) => a.pattern - b.pattern);
            
            for (const rep of allRepresentatives) {
                const nameOnly = rep.representative.replace(/^(대표이사|CEO|대표)\s*/, '');
                if (!seenNames.has(nameOnly)) {
                    uniqueReps.push(rep.representative);
                    seenNames.add(nameOnly);
                }
                
                // Limit to 2 representatives maximum
                if (uniqueReps.length >= 2) break;
            }
            
            const finalRepresentative = uniqueReps.join(', ');
            console.log(`🎯 NEWS 대표이사 (최우선): ${finalRepresentative}`);
            return { representative: finalRepresentative };
        }
        
        console.log(`⚠️ No news results found for ${companyName}`);
        return { representative: null };
        
    } catch (error) {
        console.log(`❌ Error searching news for ${companyName}:`, error.message);
        return { representative: null };
    }
}

/**
 * 🎯 Process single company using three-fold priority approach:
 * 1. InnoForest (기본 정보 + company URL)
 * 2. News Articles (최우선 for 대표이사 - most current)
 * 3. Company Website (보조 확인 for 대표이사)
 */
async function processCompany(page, companyName) {
    console.log(`\n🔍 Processing: ${companyName}`);
    console.log(`📋 Three-fold process: InnoForest → News (우선) → Company Website`);
    
    const result = {
        company_name: companyName,
        website_url: null,
        representative: null,
        representative_sources: [],
        sources: [],
        processing_date: new Date().toISOString()
    };
    
    try {
        // ============================================
        // STEP 1: InnoForest - Get basic info + URL
        // ============================================
        console.log(`🌲 Step 1: Searching InnoForest for basic info...`);
        const innovationResult = await searchInnovationForest(page, companyName);
        if (innovationResult) {
            result.sources.push('InnoForest');
            
            // Get company URL (primary goal from InnoForest)
            if (innovationResult.websiteUrl) {
                result.website_url = innovationResult.websiteUrl;
                console.log(`🔗 Found company URL: ${result.website_url}`);
            }
            
            // Get initial 대표이사 info (potentially outdated)
            if (innovationResult.representative) {
                result.representative = innovationResult.representative;
                result.representative_sources.push('InnoForest (potential outdated)');
                console.log(`👤 InnoForest 대표이사: ${result.representative}`);
            }
        }
        
        // ============================================
        // STEP 2: News Search - HIGHEST PRIORITY for 대표이사
        // ============================================
        console.log(`📰 Step 2: Searching News (최우선) for current 대표이사...`);
        const newsInfo = await searchNewsForRepresentative(page, companyName);
        if (newsInfo.representative) {
            // NEWS HAS PRIORITY - Override any previous representative info
            result.representative = newsInfo.representative;
            result.representative_sources = ['News (최우선)', ...result.representative_sources];
            result.sources.push('News (Priority)');
            console.log(`👤 NEWS 대표이사 (우선): ${result.representative}`);
        }
        
        // ============================================
        // STEP 3: Company Website - Secondary verification
        // ============================================
        if (result.website_url) {
            console.log(`🌐 Step 3: Checking Company Website for verification...`);
            const websiteInfo = await extractFromCompanyWebsite(page, result.website_url, companyName);
            if (websiteInfo.representative) {
                result.sources.push('Company Website');
                
                // If no news info was found, use website info
                if (!newsInfo.representative) {
                    result.representative = websiteInfo.representative;
                    result.representative_sources.push('Company Website');
                    console.log(`👤 Website 대표이사: ${result.representative}`);
                } else {
                    // News has priority, but log website info for comparison
                    console.log(`🔍 Website 대표이사 (참고): ${websiteInfo.representative}`);
                    console.log(`✅ Using News info as priority over website`);
                }
            }
        }
        
        // Final summary
        const finalSummary = {
            url: result.website_url ? '✅' : '❌',
            representative: result.representative ? '✅' : '❌',
            priority_source: result.representative_sources[0] || 'None',
            total_sources: result.sources.length
        };
        
        console.log(`✅ Processed ${companyName}:`, finalSummary);
        
        return result;
        
    } catch (error) {
        console.log(`❌ Error processing ${companyName}:`, error.message);
        result.error = error.message;
        return result;
    }
}

/**
 * 💾 Update Supabase vc_table with collected information
 */
async function updateSupabaseRecord(supabase, companyData) {
    // Skip Supabase update if running in test mode
    if (!supabase) {
        console.log(`🧪 TEST MODE: Would update Supabase for ${companyData.company_name} (skipping)`);
        return true;
    }
    
    try {
        // Find existing record by company name
        const { data: existingRecords } = await supabase
            .from('vc_table')
            .select('company_id, company_name')
            .ilike('company_name', `%${companyData.company_name}%`)
            .limit(1);
        
        if (existingRecords && existingRecords.length > 0) {
            const companyId = existingRecords[0].company_id;
            
            // Update existing record
            const updateData = {};
            if (companyData.website_url) updateData.website_url = companyData.website_url;
            if (companyData.representative) updateData.representative = companyData.representative;
            updateData.updated_at = new Date().toISOString();
            
            const { error } = await supabase
                .from('vc_table')
                .update(updateData)
                .eq('company_id', companyId);
            
            if (error) {
                console.log(`❌ Supabase update error for ${companyData.company_name}:`, error.message);
                return false;
            }
            
            console.log(`✅ Updated Supabase record for ${companyData.company_name}`);
            return true;
        } else {
            console.log(`⚠️ No existing record found for ${companyData.company_name}`);
            return false;
        }
        
    } catch (error) {
        console.log(`❌ Supabase error for ${companyData.company_name}:`, error.message);
        return false;
    }
}

/**
 * 🚀 Main Actor function
 */
Actor.main(async () => {
    console.log('🔍 Starting VC Company URL & Representative Matcher');
    console.log('='.repeat(60));
    
    const startTime = Date.now();
    
    // Get input
    const input = await Actor.getInput();
    const {
        companies = null,
        vcCompanies = null,
        supabaseUrl = process.env.SUPABASE_URL,
        supabaseKey = process.env.SUPABASE_KEY,
        maxConcurrency = 1,
        delayBetweenRequests = 3000,
        maxCompanies = null
    } = input || {};
    
    // Handle both 'companies' and 'vcCompanies' input formats, fallback to default
    let companiesList = companies || vcCompanies || DEFAULT_VC_COMPANIES;
    
    console.log(`📊 Input received:`, {
        companiesCount: companiesList.length,
        maxConcurrency,
        delayBetweenRequests,
        maxCompanies
    });
    
    // Initialize Supabase client (optional for testing)
    let supabase = null;
    if (supabaseUrl && supabaseKey) {
        supabase = createClient(supabaseUrl, supabaseKey);
        console.log('✅ Supabase client initialized');
    } else {
        console.log('⚠️ Supabase credentials not provided - running in TEST MODE (data will only be saved to Apify dataset)');
    }
    
    // Prepare companies list
    const companiesToProcess = maxCompanies ? 
        companiesList.slice(0, maxCompanies) : 
        companiesList;
    
    console.log(`🎯 Processing ${companiesToProcess.length} companies`);
    
    // Statistics tracking
    const stats = {
        processed: 0,
        foundUrls: 0,
        foundRepresentatives: 0,
        updatedRecords: 0,
        errors: 0
    };
    
    // Launch browser using Puppeteer
    console.log('🚀 Launching browser...');
    const browser = await puppeteer.launch({
        headless: true,
        args: ['--no-sandbox', '--disable-setuid-sandbox']
    });
    
    try {
        const page = await browser.newPage();
        
        // Process each company sequentially for better stability
        for (let i = 0; i < companiesToProcess.length; i++) {
            const companyName = companiesToProcess[i];
            
            try {
                console.log(`\n📋 Processing ${i + 1}/${companiesToProcess.length}: ${companyName}`);
                
                // Process company
                const result = await processCompany(page, companyName);
                
                // Update statistics
                stats.processed++;
                if (result.website_url) stats.foundUrls++;
                if (result.representative) stats.foundRepresentatives++;
                if (result.error) stats.errors++;
                
                // Update Supabase
                if (result.website_url || result.representative) {
                    const updated = await updateSupabaseRecord(supabase, result);
                    if (updated) stats.updatedRecords++;
                }
                
                // Save to dataset
                await Actor.pushData(result);
                
                console.log(`📊 Progress: ${stats.processed}/${companiesToProcess.length}`);
                
                // Rate limiting between companies
                if (i < companiesToProcess.length - 1) {
                    console.log(`⏱️ Waiting ${delayBetweenRequests}ms...`);
                    await new Promise(resolve => setTimeout(resolve, delayBetweenRequests));
                }
                
            } catch (error) {
                console.log(`❌ Failed to process ${companyName}:`, error.message);
                stats.errors++;
                
                // Continue with next company
                continue;
            }
        }
        
    } finally {
        await browser.close();
        console.log('🔒 Browser closed');
    }
    
    // Final statistics
    console.log('\n🎉 === PROCESSING COMPLETED ===');
    console.log(`📊 Total Processed: ${stats.processed}`);
    console.log(`🔗 Found URLs: ${stats.foundUrls}`);
    console.log(`👤 Found Representatives: ${stats.foundRepresentatives}`);
    console.log(`💾 Updated Records: ${stats.updatedRecords}`);
    console.log(`❌ Errors: ${stats.errors}`);
    console.log(`📈 Success Rate: ${((stats.foundUrls + stats.foundRepresentatives) / (stats.processed * 2) * 100).toFixed(1)}%`);
    
    // Save final statistics
    await Actor.setValue('final_stats', {
        ...stats,
        timestamp: new Date().toISOString(),
        processingDuration: Date.now() - startTime
    });

    console.log('✅ VC Company Matcher completed successfully!');
});

module.exports = { Actor }; 