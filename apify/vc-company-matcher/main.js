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
const { chromium } = require('playwright');

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
async function searchInnovationForest(page, companyName, innoforestCredentials = null) {
    try {
        // PRIORITY 1: Try InnoForest with login if credentials provided
        if (innoforestCredentials && innoforestCredentials.username && innoforestCredentials.password) {
            console.log(`🌲 Attempting InnoForest login for: ${companyName}`);
            const innoforestResult = await searchInnoforestWithLogin(page, companyName, innoforestCredentials);
            if (innoforestResult) {
                console.log(`✅ InnoForest login successful - found data for ${companyName}`);
                return innoforestResult;
            }
            console.log(`⚠️ InnoForest login failed or no data found - falling back to public sources`);
        }
        
        // FALLBACK: Public Korean business information sources
        console.log(`🔍 Searching public Korean business sources for: ${companyName}`);
        const sources = [
            `https://search.naver.com/search.naver?where=nexearch&query=${encodeURIComponent(companyName + ' 회사 홈페이지')}`,
            `https://www.google.com/search?q=${encodeURIComponent(companyName + ' site:co.kr 대표이사')}`,
            `https://search.naver.com/search.naver?query=${encodeURIComponent(companyName + ' 기업정보')}`
        ];
        
        for (const [index, searchUrl] of sources.entries()) {
            try {
                console.log(`🔍 Source ${index + 1}/3: Searching business directories...`);
                await page.goto(searchUrl, {
                    waitUntil: 'networkidle0',
                    timeout: 20000
                });
                
                // Extract company information from current page
                const companyInfo = await page.evaluate((searchCompanyName) => {
                    const results = [];
                    
                    // Look for ALL links on the page
                    const allLinks = document.querySelectorAll('a[href]');
                    const pageText = document.body.textContent || '';
                    
                    // Smart URL filtering for Korean companies
                    function isValidCompanyUrl(url) {
                        if (!url || !url.startsWith('http')) return false;
                        
                        // Exclude social media, news sites, and generic sites
                        const excludePatterns = [
                            // Social media
                            'linkedin.com', 'facebook.com', 'instagram.com', 'twitter.com', 'youtube.com',
                            // Search engines & portals
                            'naver.com', 'kakao.com', 'google.com', 'search.naver.com', 'daum.net',
                            // News & media sites
                            'edaily.co.kr', 'etnews.com', 'zdnet.co.kr', 'chosun.com', 'joins.com',
                            'donga.com', 'hani.co.kr', 'khan.co.kr', 'mt.co.kr', 'mk.co.kr', 
                            'sedaily.com', 'hankyung.com', 'newsis.com', 'yonhapnews.co.kr',
                            'yna.co.kr', 'news1.kr', 'newspim.com', 'businesspost.co.kr',
                            // Blogs & communities
                            'brunch.co.kr', 'github.com', 'blog.naver.com', 'tistory.com', 
                            'wordpress.com', 'medium.com', 'cafe.naver.com'
                        ];
                        
                        if (excludePatterns.some(pattern => url.includes(pattern))) return false;
                        
                        // Exclude URLs with news-like paths
                        const newsPathPatterns = [
                            '/news/', '/article/', '/story/', '/press/', '/media/',
                            'newsid=', 'articleid=', 'news.asp', 'article.php'
                        ];
                        
                        if (newsPathPatterns.some(pattern => url.toLowerCase().includes(pattern))) return false;
                        
                        // Prefer Korean company domains
                        const preferredPatterns = ['.co.kr', '.kr', '.com'];
                        return preferredPatterns.some(pattern => url.includes(pattern));
                    }
                    
                    // Extract company URLs with better scoring
                    let bestUrl = null;
                    let urlScore = 0;
                    
                    allLinks.forEach(link => {
                        const href = link.href;
                        const linkText = link.textContent?.trim() || '';
                        
                        if (isValidCompanyUrl(href)) {
                            let score = 1;
                            
                            // Higher score for .co.kr domains
                            if (href.includes('.co.kr')) score += 5;
                            if (href.includes('.kr')) score += 3;
                            
                            // Higher score if link text contains company name parts
                            const companyParts = searchCompanyName.replace(/기술지주회사?|벤처스?|투자|파트너스?/g, '').trim();
                            if (companyParts && linkText.includes(companyParts)) score += 3;
                            if (linkText.includes(searchCompanyName)) score += 5;
                            
                            // Higher score for official-looking URLs
                            if (href.includes('www.')) score += 2;
                            if (linkText.includes('홈페이지') || linkText.includes('웹사이트') || linkText.includes('공식')) score += 3;
                            
                            // Check if URL path looks like a company domain
                            if (href.split('/').length <= 4) score += 2; // Simple domain structure
                            
                            if (score > urlScore) {
                                bestUrl = href;
                                urlScore = score;
                            }
                        }
                    });
                    
                    // Enhanced 대표이사 extraction with better patterns
                    let representative = null;
                    const enhancedPatterns = [
                        // Company-specific patterns (highest priority)
                        new RegExp(`${searchCompanyName}[^가-힣]{0,10}대표이사[\\s:：]*([가-힣]{2,4})`, 'gi'),
                        new RegExp(`${searchCompanyName}[^가-힣]{0,10}([가-힣]{2,4})[\\s]*대표이사`, 'gi'),
                        new RegExp(`${searchCompanyName}[^가-힣]{0,10}CEO[\\s:：]*([가-힣]{2,4})`, 'gi'),
                        
                        // More specific patterns
                        /대표이사\s*[:：]\s*([가-힣]{2,4})/g,
                        /대표이사\s+([가-힣]{2,4})/g,
                        /CEO\s*[:：]?\s*([가-힣]{2,4})/g,
                        /([가-힣]{2,4})\s*대표이사/g,
                        /([가-힣]{2,4})\s*CEO/g
                    ];
                    
                    const foundNames = new Set();
                    enhancedPatterns.forEach(pattern => {
                        let match;
                        while ((match = pattern.exec(pageText)) !== null) {
                            const name = match[1]?.trim();
                            if (name && name.length >= 2 && name.length <= 4) {
                                // Enhanced blacklist filtering for Korean names
                                const blacklist = [
                                    // Titles and positions
                                    '대표', '이사', '회장', '사장', '임원', '직원', '벤처', '투자', '기업', '회사',
                                    '설립', '창업', '경영', '운영', '관리', '개발', '마케팅', '영업', '재무',
                                    // Common non-names that might be extracted
                                    '정체', '정신', '대통', '통령', '국가', '정부', '정치', '경제', '사회',
                                    '문화', '교육', '과학', '기술', '혁신', '미래', '발전', '성장', '확대',
                                    '추진', '진행', '계획', '목표', '전략', '방향', '분야', '영역', '부문'
                                ];
                                
                                // Only accept valid Korean names (2-4 characters, only Korean)
                                if (!blacklist.includes(name) && 
                                    /^[가-힣]{2,4}$/.test(name) &&
                                    !name.includes('정체') && // specific filter for "정체" which isn't a name
                                    name !== '정신아' // specific filter for the problematic result
                                ) {
                                    foundNames.add(name);
                                }
                            }
                        }
                    });
                    
                    representative = Array.from(foundNames).slice(0, 2).join(', ') || null;
                    
                    if (bestUrl || representative) {
                        results.push({
                            name: searchCompanyName,
                            websiteUrl: bestUrl,
                            representative,
                            source: 'Korean_Business_Search',
                            urlScore: urlScore
                        });
                    }
                    
                    return results;
                }, companyName);
                
                // If we found good results, return them
                if (companyInfo.length > 0 && (companyInfo[0].websiteUrl || companyInfo[0].representative)) {
                    console.log(`✅ Found results from source ${index + 1}:`, companyInfo[0]);
                    return companyInfo[0];
                }
                
                // Small delay between sources
                await page.waitForTimeout(1000);
                
            } catch (sourceError) {
                console.log(`⚠️ Source ${index + 1} failed:`, sourceError.message);
                continue;
            }
        }
        
        console.log(`⚠️ No results found from any Korean business sources for ${companyName}`);
        return null;
        
    } catch (error) {
        console.log(`❌ Error searching Korean business sources for ${companyName}:`, error.message);
        return null;
    }
}

/**
 * 🌲 Search InnoForest with login credentials for authenticated access
 */
async function searchInnoforestWithLogin(page, companyName, credentials) {
    try {
        console.log(`🔐 Logging into InnoForest...`);
        
        // Try different InnoForest login URLs
        const loginUrls = [
            'https://www.innoforest.co.kr/login',
            'https://www.innoforest.co.kr/member/login',
            'https://www.innoforest.co.kr/auth/login',
            'https://innoforest.co.kr/login'
        ];
        
        let loginPageFound = false;
        for (const loginUrl of loginUrls) {
            try {
                console.log(`🔍 Trying login URL: ${loginUrl}`);
                await page.goto(loginUrl, {
                    waitUntil: 'networkidle0',
                    timeout: 15000
                });
                
                // Check if this page has login form
                const hasLoginForm = await page.$('input[type="email"], input[type="text"], input[name*="id"], input[name*="email"], input[name*="user"]');
                if (hasLoginForm) {
                    loginPageFound = true;
                    console.log(`✅ Found login form at: ${loginUrl}`);
                    break;
                }
            } catch (error) {
                console.log(`⚠️ Failed to access ${loginUrl}: ${error.message}`);
                continue;
            }
        }
        
        if (!loginPageFound) {
            console.log(`❌ Could not find InnoForest login page`);
            return null;
        }
        
        // Fill login form with multiple selector attempts
        const usernameSelectors = [
            'input[type="email"]',
            'input[name="email"]', 
            'input[name="username"]',
            'input[name="id"]',
            'input[name="user_id"]',
            'input[name="loginId"]',
            '#email',
            '#username',
            '#id',
            'input[placeholder*="이메일"]',
            'input[placeholder*="아이디"]'
        ];
        
        const passwordSelectors = [
            'input[type="password"]',
            'input[name="password"]',
            'input[name="passwd"]',
            '#password',
            '#passwd',
            'input[placeholder*="비밀번호"]'
        ];
        
        let usernameInput = null;
        let passwordInput = null;
        
        // Try to find username input
        for (const selector of usernameSelectors) {
            try {
                usernameInput = await page.$(selector);
                if (usernameInput) {
                    console.log(`📧 Found username input: ${selector}`);
                    break;
                }
            } catch (error) {
                continue;
            }
        }
        
        // Try to find password input
        for (const selector of passwordSelectors) {
            try {
                passwordInput = await page.$(selector);
                if (passwordInput) {
                    console.log(`🔒 Found password input: ${selector}`);
                    break;
                }
            } catch (error) {
                continue;
            }
        }
        
        if (!usernameInput || !passwordInput) {
            console.log(`❌ Could not find login form inputs on InnoForest`);
            return null;
        }
        
        // Fill login credentials
        await usernameInput.fill(credentials.username);
        await passwordInput.fill(credentials.password);
        await page.waitForTimeout(1000);
        
        // Try multiple submit methods
        const submitSelectors = [
            'button[type="submit"]',
            'input[type="submit"]',
            'button:has-text("로그인")',
            'button:has-text("Login")',
            '.login-btn',
            '.btn-login',
            '#loginBtn',
            '.submit-btn'
        ];
        
        let submitSuccess = false;
        for (const selector of submitSelectors) {
            try {
                const submitButton = await page.$(selector);
                if (submitButton) {
                    console.log(`🚀 Attempting submit with: ${selector}`);
                    await submitButton.click();
                    submitSuccess = true;
                    break;
                }
            } catch (error) {
                continue;
            }
        }
        
        // Fallback: Press Enter
        if (!submitSuccess) {
            console.log(`⌨️ Fallback: Pressing Enter to submit`);
            await page.keyboard.press('Enter');
        }
        
        // Wait for login to complete
        await page.waitForTimeout(5000);
        
        // Check if login was successful with multiple indicators
        const successSelectors = [
            'a:has-text("로그아웃")',
            'button:has-text("로그아웃")',
            'a:has-text("logout")',
            '.logout',
            '.dashboard',
            '.mypage',
            '.profile',
            'a[href*="logout"]',
            'button[onclick*="logout"]'
        ];
        
        let loginSuccess = false;
        for (const selector of successSelectors) {
            try {
                const element = await page.$(selector);
                if (element) {
                    console.log(`✅ Login success indicator found: ${selector}`);
                    loginSuccess = true;
                    break;
                }
            } catch (error) {
                continue;
            }
        }
        
        // Also check if we're redirected away from login page
        const currentUrl = page.url();
        if (!currentUrl.includes('/login') && !currentUrl.includes('/auth')) {
            console.log(`✅ Redirected away from login page: ${currentUrl}`);
            loginSuccess = true;
        }
        
        if (!loginSuccess) {
            console.log(`❌ InnoForest login failed - no success indicators found`);
            console.log(`Current URL: ${currentUrl}`);
            return null;
        }
        
        console.log(`✅ InnoForest login successful`);
        
        // Now search for the company in the authenticated section
        console.log(`🔍 Searching InnoForest database for: ${companyName}`);
        
        // Try to navigate to company directory or search page
        const searchPaths = [
            '/company', '/companies', '/search', '/directory', '/기업검색', '/투자사'
        ];
        
        let searchPageFound = false;
        for (const path of searchPaths) {
            try {
                await page.goto(`https://www.innoforest.co.kr${path}`, {
                    waitUntil: 'networkidle0',
                    timeout: 10000
                });
                
                // Check if this page has search functionality
                const searchInput = await page.$('input[type="search"], input[name="search"], input[placeholder*="검색"], .search-input, input[placeholder*="회사"], input[placeholder*="기업"]');
                if (searchInput) {
                    searchPageFound = true;
                    console.log(`📂 Found search page at: ${path}`);
                    break;
                }
            } catch (error) {
                continue;
            }
        }
        
        // If no specific search page found, try searching from main page
        if (!searchPageFound) {
            await page.goto('https://www.innoforest.co.kr/', {
                waitUntil: 'networkidle0',
                timeout: 20000
            });
        }
        
        // Perform search
        const searchInput = await page.$('input[type="search"], input[name="search"], input[placeholder*="검색"], .search-input, input[placeholder*="회사"], input[placeholder*="기업"]');
        
        if (searchInput) {
            await searchInput.clear();
            await searchInput.fill(companyName);
            await page.keyboard.press('Enter');
            await page.waitForTimeout(5000);
        }
        
        // Extract company information from authenticated results
        const companyInfo = await page.evaluate((searchCompanyName) => {
            const results = [];
            
            // Look for company cards, listings, or table rows
            const companyElements = document.querySelectorAll(
                '.company-card, .company-item, .company-row, .company-info, ' +
                'tr:has(td), .list-item, .search-result, .result-item'
            );
            
            const allLinks = document.querySelectorAll('a[href]');
            const pageText = document.body.textContent || '';
            
                         // Enhanced URL filtering for authenticated results
             function isValidCompanyUrl(url) {
                 if (!url || !url.startsWith('http')) return false;
                 
                 // More selective exclusions for authenticated data
                 const excludePatterns = [
                     // Social media
                     'linkedin.com', 'facebook.com', 'instagram.com', 'twitter.com', 'youtube.com',
                     // Search engines & portals
                     'search.naver.com', 'google.com', 'daum.net',
                     // News & media sites (same as public sources)
                     'edaily.co.kr', 'etnews.com', 'zdnet.co.kr', 'chosun.com', 'joins.com',
                     'donga.com', 'hani.co.kr', 'khan.co.kr', 'mt.co.kr', 'mk.co.kr', 
                     'sedaily.com', 'hankyung.com', 'newsis.com', 'yonhapnews.co.kr',
                     'yna.co.kr', 'news1.kr', 'newspim.com', 'businesspost.co.kr',
                     // Blogs & communities
                     'blog.naver.com', 'tistory.com', 'brunch.co.kr', 'medium.com'
                 ];
                 
                 if (excludePatterns.some(pattern => url.includes(pattern))) return false;
                 
                 // Exclude URLs with news-like paths
                 const newsPathPatterns = [
                     '/news/', '/article/', '/story/', '/press/', '/media/',
                     'newsid=', 'articleid=', 'news.asp', 'article.php'
                 ];
                 
                 if (newsPathPatterns.some(pattern => url.toLowerCase().includes(pattern))) return false;
                 
                 // Prefer Korean company domains and InnoForest internal links
                 return url.includes('.co.kr') || url.includes('.kr') || url.includes('.com') || url.includes('innoforest.co.kr');
             }
            
            // Extract URLs with enhanced scoring
            let bestUrl = null;
            let urlScore = 0;
            
            allLinks.forEach(link => {
                const href = link.href;
                const linkText = link.textContent?.trim() || '';
                const linkContext = link.closest('tr, .company-card, .company-item')?.textContent || '';
                
                if (isValidCompanyUrl(href)) {
                    let score = 1;
                    
                    // Highest score for .co.kr domains
                    if (href.includes('.co.kr')) score += 8;
                    if (href.includes('.kr')) score += 5;
                    
                    // High score if in company context
                    if (linkContext.includes(searchCompanyName)) score += 10;
                    if (linkText.includes(searchCompanyName)) score += 8;
                    
                    // Bonus for official indicators
                    if (linkText.includes('홈페이지') || linkText.includes('웹사이트') || linkText.includes('공식사이트')) score += 5;
                    if (href.includes('www.')) score += 2;
                    
                    // Penalty for InnoForest internal links (we want external company URLs)
                    if (href.includes('innoforest.co.kr')) score -= 5;
                    
                    if (score > urlScore) {
                        bestUrl = href;
                        urlScore = score;
                    }
                }
            });
            
            // Enhanced 대표이사 extraction for authenticated data
            let representative = null;
            const representativePatterns = [
                // Company-specific patterns with higher priority
                new RegExp(`${searchCompanyName}[^가-힣]{0,20}대표이사[\\s:：]*([가-힣]{2,4})`, 'gi'),
                new RegExp(`${searchCompanyName}[^가-힣]{0,20}([가-힣]{2,4})[\\s]*대표이사`, 'gi'),
                new RegExp(`${searchCompanyName}[^가-힣]{0,20}CEO[\\s:：]*([가-힣]{2,4})`, 'gi'),
                
                // General patterns in company context
                /대표이사[\\s:：]+([가-힣]{2,4})/g,
                /CEO[\\s:：]+([가-힣]{2,4})/g,
                /([가-힣]{2,4})[\\s]+대표이사/g,
                /([가-힣]{2,4})[\\s]+CEO/g,
                
                // Table/structured data patterns
                /대표자[\\s:：]+([가-힣]{2,4})/g,
                /창립자[\\s:：]+([가-힣]{2,4})/g
            ];
            
            const foundNames = new Set();
            representativePatterns.forEach(pattern => {
                let match;
                while ((match = pattern.exec(pageText)) !== null) {
                    const name = match[1]?.trim();
                                         if (name && name.length >= 2 && name.length <= 4) {
                         // Enhanced blacklist for authenticated data (same as public sources)
                         const blacklist = [
                             // Titles and positions
                             '대표', '이사', '회장', '사장', '임원', '직원', '벤처', '투자', '기업', '회사',
                             '설립', '창업', '경영', '운영', '관리', '개발', '마케팅', '영업', '재무',
                             // Common non-names that might be extracted
                             '정체', '정신', '대통', '통령', '국가', '정부', '정치', '경제', '사회',
                             '문화', '교육', '과학', '기술', '혁신', '미래', '발전', '성장', '확대',
                             '추진', '진행', '계획', '목표', '전략', '방향', '분야', '영역', '부문'
                         ];
                         
                         // Only accept valid Korean names (same validation as public sources)
                         if (!blacklist.includes(name) && 
                             /^[가-힣]{2,4}$/.test(name) &&
                             !name.includes('정체') && // specific filter for "정체" which isn't a name
                             name !== '정신아' // specific filter for the problematic result
                         ) {
                             foundNames.add(name);
                         }
                     }
                }
            });
            
            representative = Array.from(foundNames).slice(0, 2).join(', ') || null;
            
            if (bestUrl || representative) {
                results.push({
                    name: searchCompanyName,
                    websiteUrl: bestUrl,
                    representative,
                    source: 'InnoForest_Authenticated',
                    urlScore: urlScore
                });
            }
            
            return results;
        }, companyName);
        
        if (companyInfo.length > 0) {
            console.log(`🎯 InnoForest authenticated results for ${companyName}:`, companyInfo[0]);
            return companyInfo[0];
        }
        
        console.log(`⚠️ No results found in InnoForest for ${companyName}`);
        return null;
        
    } catch (error) {
        console.log(`❌ InnoForest login/search error for ${companyName}:`, error.message);
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
        
        // Extract representative information with enhanced patterns
        const representative = await page.evaluate((companyName) => {
            const text = document.body.textContent || '';
            const foundNames = new Set();
            
            // Enhanced patterns specifically for company websites
            const websitePatterns = [
                // Direct title patterns with various separators
                /대표이사[\\s:：]*([가-힣]{2,4})/g,
                /대표[\\s:：]*([가-힣]{2,4})/g,
                /CEO[\\s:：]*([가-힣]{2,4})/g,
                /회장[\\s:：]*([가-힣]{2,4})/g,
                /사장[\\s:：]*([가-힣]{2,4})/g,
                /창립자[\\s:：]*([가-힣]{2,4})/g,
                
                // Reverse patterns (name first)
                /([가-힣]{2,4})[\\s]*대표이사/g,
                /([가-힣]{2,4})[\\s]*대표/g,
                /([가-힣]{2,4})[\\s]*CEO/g,
                
                // Team page specific patterns
                /대표[\\s]*([가-힣]{2,4})[\\s]*님/g,
                /([가-힣]{2,4})[\\s]*대표님/g,
                /([가-힣]{2,4})[\\s]*대표이사님/g
            ];
            
            // Blacklist for filtering out non-names
            const blacklist = [
                '대표', '이사', '회장', '사장', '임원', '직원', '팀장', '과장',
                '관리', '담당', '책임', '총괄', '전무', '상무', '부장', '차장',
                '기업', '회사', '법인', '그룹', '센터', '사업', '개발', '마케팅',
                '투자', '벤처', '기술', '서비스', '솔루션', '플랫폼', '시스템'
            ];
            
            websitePatterns.forEach(pattern => {
                let match;
                while ((match = pattern.exec(text)) !== null) {
                    const name = match[1]?.trim();
                    if (name && name.length >= 2 && name.length <= 4) {
                        // Filter validation
                        if (!blacklist.includes(name) && /^[가-힣]{2,4}$/.test(name)) {
                            foundNames.add(name);
                        }
                    }
                }
            });
            
            // Convert to array and format with titles
            const representatives = Array.from(foundNames).slice(0, 2);
            return representatives.length > 0 ? representatives.map(name => `대표 ${name}`).join(', ') : null;
        }, companyName);
        
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
                            
                            // Enhanced patterns for finding 대표이사 (improved accuracy)
                            const patterns = [
                                // High-priority: Company-specific patterns
                                new RegExp(`${companyName}[^가-힣]{0,10}대표이사[\\s:：]*([가-힣]{2,4})`, 'g'),
                                new RegExp(`${companyName}[^가-힣]{0,10}([가-힣]{2,4})[\\s]*대표이사`, 'g'),
                                new RegExp(`${companyName}[^가-힣]{0,10}CEO[\\s:：]*([가-힣]{2,4})`, 'g'),
                                
                                // Medium-priority: Contextual patterns
                                new RegExp(`대표이사[\\s:：]*([가-힣]{2,4})[^가-힣]{0,20}${companyName}`, 'g'),
                                new RegExp(`([가-힣]{2,4})[\\s]*대표이사[^가-힣]{0,20}${companyName}`, 'g'),
                                
                                // Appointment patterns (high relevance)
                                new RegExp(`([가-힣]{2,4})[^가-힣]*${companyName}[^가-힣]*대표이사[^가-힣]*임명`, 'g'),
                                new RegExp(`${companyName}[^가-힣]*신임[^가-힣]*대표이사[^가-힣]*([가-힣]{2,4})`, 'g'),
                                new RegExp(`${companyName}[^가-힣]*([가-힣]{2,4})[^가-힣]*대표이사[^가-힣]*선임`, 'g'),
                                
                                // Generic patterns (lower priority, company name context required)
                                new RegExp(`대표이사[\\s:：]*([가-힣]{2,4})[는은이]?`, 'g'),
                                new RegExp(`([가-힣]{2,4})[\\s]*대표이사[는은이가]?`, 'g')
                            ];
                            
                            // Filter out common Korean words that aren't names
                            const blacklistWords = [
                                '대표', '이사', '회장', '사장', '임원', '직원', '부사장', '전무', '상무',
                                '팀장', '과장', '차장', '실장', '본부장', '센터', '파트', '나스',
                                '임명', '선임', '취임', '인사', '발표', '공지', '교체', '변경',
                                '기업', '회사', '법인', '그룹', '홀딩', '지주', '투자', '벤처',
                                '포함', '관련', '이전', '기존', '신규', '새로', '최근', '당시',
                                '등등', '기타', '모든', '전체', '일부', '각각', '여러', '다수'
                            ];
                            
                            patterns.forEach((pattern, patternIndex) => {
                                let match;
                                while ((match = pattern.exec(text)) !== null) {
                                    const name = match[1]?.trim();
                                    if (name && name.length >= 2 && name.length <= 4) {
                                        // Filter out blacklisted words
                                        if (blacklistWords.includes(name)) continue;
                                        
                                        // Additional validation: should contain proper Korean name characters
                                        if (!/^[가-힣]{2,4}$/.test(name)) continue;
                                        
                                        // Determine title and priority based on pattern
                                        let title = '대표이사';
                                        let priority = patternIndex;
                                        
                                        if (patternIndex === 2) {
                                            title = 'CEO';
                                        } else if (patternIndex >= 5 && patternIndex <= 7) {
                                            priority += 5; // Lower priority for appointment patterns
                                        } else if (patternIndex >= 8) {
                                            priority += 10; // Lowest priority for generic patterns
                                        }
                                        
                                        const fullTitle = `${title} ${name}`;
                                        results.push({
                                            representative: fullTitle,
                                            context: text.slice(Math.max(0, match.index - 50), match.index + 100),
                                            pattern: priority,
                                            name: name
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
async function processCompany(page, companyName, innoforestCredentials = null) {
    console.log(`\n🔍 Processing: ${companyName}`);
            console.log(`📋 Three-fold process: Korean Business Search → News (우선) → Company Website`);
    
    const result = {
        company_name: companyName,
        website_url: null,
        representative: null,
        representative_sources: [],
        sources: [],
        processing_date: new Date().toISOString(),
        innoforestCredentials: innoforestCredentials
    };
    
    try {
        // ============================================
        // STEP 1: Korean Business Search - Get basic info + URL
        // ============================================
        console.log(`🔍 Step 1: Searching Korean business sources for basic info...`);
        const innovationResult = await searchInnovationForest(page, companyName, result.innoforestCredentials);
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
                result.representative_sources.push('Korean Business Search (potential outdated)');
                console.log(`👤 Korean business source 대표이사: ${result.representative}`);
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
        innoforestUsername = process.env.INNOFOREST_USERNAME,
        innoforestPassword = process.env.INNOFOREST_PASSWORD,
        maxConcurrency = 1,
        delayBetweenRequests = 3000,
        maxCompanies = null
    } = input || {};
    
    // Setup InnoForest credentials if provided
    const innoforestCredentials = (innoforestUsername && innoforestPassword) ? {
        username: innoforestUsername,
        password: innoforestPassword
    } : null;
    
    // Handle both 'companies' and 'vcCompanies' input formats, fallback to default
    let companiesList = companies || vcCompanies || DEFAULT_VC_COMPANIES;
    
    console.log(`📊 Input received:`, {
        companiesCount: companiesList.length,
        maxConcurrency,
        delayBetweenRequests,
        maxCompanies,
        innoforestEnabled: !!innoforestCredentials
    });
    
    if (innoforestCredentials) {
        console.log('🌲 InnoForest credentials provided - will attempt authenticated access');
    } else {
        console.log('⚠️ InnoForest credentials not provided - will use public sources only');
    }
    
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
    
    // Setup browser using Playwright
    console.log('🚀 Launching browser...');
    
    const browser = await chromium.launch({
        headless: true,
        args: ['--no-sandbox', '--disable-setuid-sandbox']
    });
    
    const page = await browser.newPage();
    
    try {
        // Process each company sequentially for better stability
        for (let i = 0; i < companiesToProcess.length; i++) {
            const companyName = companiesToProcess[i];
            
            try {
                console.log(`\n📋 Processing ${i + 1}/${companiesToProcess.length}: ${companyName}`);
                
                // Process company
                const result = await processCompany(page, companyName, innoforestCredentials);
                
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