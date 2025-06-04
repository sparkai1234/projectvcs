/**
 * 📊 DIVA MARKET REPORTS DOWNLOADER
 * ==================================
 * 
 * Downloads all Venture Capital Market Brief PDFs from DIVA
 * - Monthly market analysis reports
 * - Industry statistics and trends
 * - Performance data and insights
 * - Prepares for AI-powered trend analysis
 * 
 * ULTRA HIGH-VALUE: Official market intelligence, trend analysis, competitive insights
 */

require('dotenv').config();
const https = require('https');
const http = require('http');
const fs = require('fs');
const path = require('path');
const { createClient } = require('@supabase/supabase-js');

// Configuration
const CONFIG = {
    baseUrl: 'http://diva.kvca.or.kr/div/dii/DivItmVCStatInfoInq',
    downloadDir: './market_reports',
    maxConcurrentDownloads: 3,
    timeout: 60000,
    userAgent: 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
    retryAttempts: 3,
    delayBetweenRequests: 1000
};

// Initialize Supabase client
const supabaseUrl = process.env.SUPABASE_URL || 'https://udfgtccxbqmalgpqyxzz.supabase.co';
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY;

if (!supabaseKey) {
    console.error('❌ SUPABASE_SERVICE_ROLE_KEY environment variable is required');
    process.exit(1);
}

const supabase = createClient(supabaseUrl, supabaseKey);

console.log('📊 DIVA Market Reports Downloader Started');
console.log(`📁 Download Directory: ${CONFIG.downloadDir}`);

// Ensure download directory exists
if (!fs.existsSync(CONFIG.downloadDir)) {
    fs.mkdirSync(CONFIG.downloadDir, { recursive: true });
    console.log(`✅ Created download directory: ${CONFIG.downloadDir}`);
}

/**
 * Make HTTP request to get page content
 */
async function getPageContent(url) {
    return new Promise((resolve, reject) => {
        const requestOptions = {
            headers: {
                'User-Agent': CONFIG.userAgent,
                'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,*/*;q=0.8',
                'Accept-Language': 'ko-KR,ko;q=0.9,en;q=0.8',
                'Connection': 'keep-alive'
            },
            timeout: CONFIG.timeout
        };

        console.log(`📡 Fetching DIVA statistics page...`);

        const req = http.request(url, requestOptions, (res) => {
            let data = '';
            
            res.on('data', (chunk) => {
                data += chunk;
            });
            
            res.on('end', () => {
                console.log(`✅ Page content received: ${res.statusCode} (${data.length} chars)`);
                resolve({
                    statusCode: res.statusCode,
                    body: data
                });
            });
        });

        req.on('error', (err) => {
            console.error(`❌ Page request failed: ${err.message}`);
            reject(err);
        });

        req.on('timeout', () => {
            req.destroy();
            reject(new Error('Page request timeout'));
        });

        req.end();
    });
}

/**
 * Parse PDF download links from page HTML
 */
function parseDownloadLinks(html) {
    const reports = [];
    
    try {
        console.log('🔍 Parsing PDF download links...');
        
        // Look for table rows with report information
        const tableRowRegex = /<tr[^>]*>(.*?)<\/tr>/gis;
        const rows = html.match(tableRowRegex) || [];
        
        console.log(`Found ${rows.length} table rows`);
        
        for (const row of rows) {
            // Extract cell content
            const cellRegex = /<td[^>]*>(.*?)<\/td>/gis;
            const cells = [];
            let match;
            
            while ((match = cellRegex.exec(row)) !== null) {
                const cellContent = match[1]
                    .replace(/<[^>]*>/g, '')  // Remove HTML tags
                    .replace(/&nbsp;/g, ' ')  // Replace &nbsp;
                    .trim();
                cells.push(cellContent);
            }
            
            // Look for Venture Capital Market Brief reports
            if (cells.length >= 4 && cells[1] && cells[1].includes('Venture Capital Market Brief')) {
                // Extract download link from the row HTML
                const linkRegex = /href="([^"]*\.pdf[^"]*)"/i;
                const linkMatch = row.match(linkRegex);
                
                if (linkMatch) {
                    const report = {
                        number: cells[0],
                        title: cells[1],
                        filename: extractFilename(cells[1]),
                        downloadUrl: linkMatch[1],
                        publishDate: cells[3],
                        viewCount: cells[4] || '0'
                    };
                    
                    reports.push(report);
                    console.log(`📄 Found report: ${report.title} (${report.publishDate})`);
                }
            }
        }
        
        console.log(`✅ Parsed ${reports.length} PDF reports`);
        return reports.sort((a, b) => new Date(b.publishDate) - new Date(a.publishDate)); // Sort by date, newest first
        
    } catch (error) {
        console.error(`❌ Error parsing download links: ${error.message}`);
        return [];
    }
}

/**
 * Extract clean filename from report title
 */
function extractFilename(title) {
    // Clean up title to create valid filename
    const cleanTitle = title
        .replace(/[^\w\s가-힣]/g, '')  // Remove special chars except Korean
        .replace(/\s+/g, '_')          // Replace spaces with underscores
        .substring(0, 100);            // Limit length
    
    return `${cleanTitle}.pdf`;
}

/**
 * Download a single PDF file
 */
async function downloadPdf(report, attempt = 1) {
    return new Promise((resolve, reject) => {
        const downloadUrl = report.downloadUrl.startsWith('http') 
            ? report.downloadUrl 
            : `http://diva.kvca.or.kr${report.downloadUrl}`;
        
        const filename = path.join(CONFIG.downloadDir, report.filename);
        
        // Check if file already exists
        if (fs.existsSync(filename)) {
            console.log(`⏭️ File already exists: ${report.filename}`);
            resolve({ success: true, filename, skipped: true });
            return;
        }
        
        console.log(`📥 Downloading (Attempt ${attempt}): ${report.title}`);
        console.log(`🔗 URL: ${downloadUrl}`);
        
        const file = fs.createWriteStream(filename);
        const requestLib = downloadUrl.startsWith('https') ? https : http;
        
        const requestOptions = {
            headers: {
                'User-Agent': CONFIG.userAgent,
                'Accept': 'application/pdf,*/*',
                'Referer': CONFIG.baseUrl
            },
            timeout: CONFIG.timeout
        };
        
        const req = requestLib.get(downloadUrl, requestOptions, (res) => {
            console.log(`📊 Download response: ${res.statusCode} for ${report.filename}`);
            
            if (res.statusCode !== 200) {
                file.close();
                fs.unlinkSync(filename);
                reject(new Error(`HTTP ${res.statusCode} for ${downloadUrl}`));
                return;
            }
            
            res.pipe(file);
            
            file.on('finish', () => {
                file.close();
                const stats = fs.statSync(filename);
                console.log(`✅ Downloaded: ${report.filename} (${(stats.size / 1024 / 1024).toFixed(2)} MB)`);
                resolve({ 
                    success: true, 
                    filename, 
                    size: stats.size,
                    report: report
                });
            });
            
            file.on('error', (err) => {
                file.close();
                fs.unlinkSync(filename);
                reject(err);
            });
        });
        
        req.on('error', (err) => {
            file.close();
            if (fs.existsSync(filename)) {
                fs.unlinkSync(filename);
            }
            reject(err);
        });
        
        req.on('timeout', () => {
            req.destroy();
            file.close();
            if (fs.existsSync(filename)) {
                fs.unlinkSync(filename);
            }
            reject(new Error(`Download timeout for ${report.filename}`));
        });
    });
}

/**
 * Download PDF with retry logic
 */
async function downloadWithRetry(report) {
    for (let attempt = 1; attempt <= CONFIG.retryAttempts; attempt++) {
        try {
            const result = await downloadPdf(report, attempt);
            return result;
        } catch (error) {
            console.error(`❌ Download attempt ${attempt} failed for ${report.filename}: ${error.message}`);
            
            if (attempt === CONFIG.retryAttempts) {
                return { 
                    success: false, 
                    error: error.message,
                    report: report
                };
            }
            
            // Wait before retry
            await new Promise(resolve => setTimeout(resolve, CONFIG.delayBetweenRequests * attempt));
        }
    }
}

/**
 * Save download metadata to Supabase
 */
async function saveDownloadMetadata(downloads) {
    try {
        console.log('💾 Saving download metadata to Supabase...');
        
        const records = downloads
            .filter(d => d.success)
            .map(d => ({
                title: d.report.title,
                filename: d.filename,
                publish_date: d.report.publishDate,
                file_size: d.size || 0,
                view_count: parseInt(d.report.viewCount) || 0,
                download_url: d.report.downloadUrl,
                extracted_at: new Date().toISOString(),
                analysis_status: 'pending'
            }));
        
        if (records.length === 0) {
            console.log('⚠️ No successful downloads to save');
            return;
        }
        
        const { data, error } = await supabase
            .from('diva_market_reports')
            .upsert(records, {
                onConflict: 'filename',
                ignoreDuplicates: false
            });
        
        if (error) {
            console.error('❌ Error saving metadata:', error);
            return;
        }
        
        console.log(`✅ Saved metadata for ${records.length} reports`);
        
    } catch (error) {
        console.error('❌ Error in saveDownloadMetadata:', error);
    }
}

/**
 * Create Supabase table for market reports if not exists
 */
async function createMarketReportsTable() {
    const createTableSQL = `
        CREATE TABLE IF NOT EXISTS diva_market_reports (
            id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
            title VARCHAR(500) NOT NULL,
            filename VARCHAR(255) UNIQUE NOT NULL,
            publish_date VARCHAR(50),
            file_size BIGINT,
            view_count INTEGER,
            download_url TEXT,
            extracted_at TIMESTAMP,
            analysis_status VARCHAR(50) DEFAULT 'pending',
            ai_summary TEXT,
            key_insights JSONB,
            trend_analysis JSONB,
            created_at TIMESTAMP DEFAULT NOW(),
            updated_at TIMESTAMP DEFAULT NOW()
        );
        
        CREATE INDEX IF NOT EXISTS idx_diva_market_reports_date ON diva_market_reports(publish_date);
        CREATE INDEX IF NOT EXISTS idx_diva_market_reports_status ON diva_market_reports(analysis_status);
        
        COMMENT ON TABLE diva_market_reports IS 'DIVA monthly market reports with AI analysis';
    `;
    
    try {
        const { error } = await supabase.rpc('exec_sql', { sql: createTableSQL });
        if (error) {
            console.log('ℹ️ Table may already exist or using simpler approach');
        } else {
            console.log('✅ Market reports table ready');
        }
    } catch (error) {
        console.log('ℹ️ Using simplified table approach');
    }
}

/**
 * Main download function
 */
async function downloadAllMarketReports() {
    console.log('\n🚀 === STARTING DIVA MARKET REPORTS DOWNLOAD ===');
    
    const startTime = Date.now();
    let totalDownloads = 0;
    let totalSkipped = 0;
    let totalErrors = 0;
    
    try {
        // Create table if needed
        await createMarketReportsTable();
        
        // Get page content
        const pageResponse = await getPageContent(CONFIG.baseUrl);
        
        if (pageResponse.statusCode !== 200) {
            throw new Error(`Failed to fetch page: HTTP ${pageResponse.statusCode}`);
        }
        
        // Parse download links
        const reports = parseDownloadLinks(pageResponse.body);
        
        if (reports.length === 0) {
            console.log('⚠️ No PDF reports found on the page');
            return;
        }
        
        console.log(`\n📊 Found ${reports.length} market reports to download`);
        
        // Download all reports
        const downloads = [];
        
        for (let i = 0; i < reports.length; i++) {
            const report = reports[i];
            console.log(`\n📥 === DOWNLOADING ${i + 1}/${reports.length} ===`);
            
            try {
                const result = await downloadWithRetry(report);
                downloads.push(result);
                
                if (result.success) {
                    if (result.skipped) {
                        totalSkipped++;
                    } else {
                        totalDownloads++;
                    }
                } else {
                    totalErrors++;
                }
                
                // Rate limiting
                if (i < reports.length - 1) {
                    console.log(`⏱️ Waiting ${CONFIG.delayBetweenRequests}ms...`);
                    await new Promise(resolve => setTimeout(resolve, CONFIG.delayBetweenRequests));
                }
                
            } catch (error) {
                console.error(`❌ Failed to download ${report.filename}: ${error.message}`);
                totalErrors++;
                downloads.push({ 
                    success: false, 
                    error: error.message, 
                    report: report 
                });
            }
        }
        
        // Save metadata
        await saveDownloadMetadata(downloads);
        
        const duration = (Date.now() - startTime) / 1000;
        
        console.log('\n🎉 === MARKET REPORTS DOWNLOAD COMPLETED ===');
        console.log(`📥 Total Downloaded: ${totalDownloads}`);
        console.log(`⏭️ Total Skipped: ${totalSkipped}`);
        console.log(`❌ Total Errors: ${totalErrors}`);
        console.log(`📁 Download Directory: ${CONFIG.downloadDir}`);
        console.log(`⏱️ Duration: ${duration.toFixed(2)} seconds`);
        
        if (totalDownloads > 0) {
            console.log('\n🚀 Next Steps:');
            console.log('1. Extract text from PDFs using pdf-parse');
            console.log('2. Send to OpenAI for trend analysis');
            console.log('3. Store AI insights in Supabase');
            console.log('4. Create market intelligence dashboard');
            
            console.log('\n📊 Files ready for AI analysis:');
            downloads
                .filter(d => d.success && !d.skipped)
                .forEach(d => console.log(`   📄 ${d.filename}`));
        }
        
        return downloads;
        
    } catch (error) {
        console.error('💥 Critical error in market reports download:', error);
        throw error;
    }
}

// Execute if run directly
if (require.main === module) {
    (async () => {
        try {
            await downloadAllMarketReports();
            console.log('✅ Market reports download completed successfully!');
        } catch (error) {
            console.error('💥 Market reports download failed:', error);
            process.exit(1);
        }
    })();
}

module.exports = {
    downloadAllMarketReports,
    parseDownloadLinks,
    downloadWithRetry,
    CONFIG
}; 