#!/usr/bin/env python3
"""
🚀 IMMEDIATE APIFY SCALING - Expand Your Korean VC Database Right Now
- Scale Korean VC Scraper from 50 to 200+ pages
- Scale Korean Fund Scraper from current limits to 150+ pages  
- Use proven Node.js scripts that are already working
- Immediate execution without complex Python dependencies
"""

import os
import sys
import json
import subprocess
import time
from datetime import datetime

def create_scaled_vc_scraper():
    """Create scaled VC scraper with dramatically increased pages"""
    
    script_content = '''// IMMEDIATE SCALED VC Scraper - Maximum Data Collection
const https = require('https');
const { URL } = require('url');

// Scaled configuration for comprehensive collection
const CONFIG = {
    dataType: 'VC',
    airtableApiKey: 'patOUfAsek4nbpvHm.49789ced0e2b0304bdc507f110d936277cd3da18ec3efc9347c93e6a1810919e',
    airtableBaseId: 'appdR8V9lJaRW8VkR',
    airtableTableName: 'VC Table',
    maxPages: 200,  // DRAMATICALLY INCREASED FROM 50
    startPage: 51,  // Start from where previous scraping left off
    enableDetailedLogging: true,
    batchSize: 10,  // Smaller batches for reliability
    delayBetweenRequests: 2000  // 2 second delay for stability
};

console.log(`🚀 SCALED VC SCRAPER - Target: ${CONFIG.maxPages} pages (Starting from page ${CONFIG.startPage})`);
console.log(`   Expected to collect 2000+ additional VC company records`);

// Base scraping configuration
const baseUrl = 'https://vcs.go.kr/vc/data/vcCmpnyListAjax.do';
const tabMenu = 'vc_data';
const commonQueryParams = 'tabMenu=' + tabMenu + '&searchKeywordType=all&searchKeyword=&region=&vcType=&investTrend=&investField=&orderBy=ESTBL_DE';

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
                'Referer': 'https://vcs.go.kr/vc/data/vcCmpnyList.do'
            }
        };

        const req = https.request(requestOptions, (res) => {
            let data = '';
            res.on('data', (chunk) => {
                data += chunk;
            });
            res.on('end', () => {
                try {
                    const jsonData = JSON.parse(data);
                    resolve({ statusCode: res.statusCode, body: jsonData });
                } catch (e) {
                    resolve({ statusCode: res.statusCode, body: data });
                }
            });
        });

        req.on('error', (err) => {
            reject(err);
        });
        
        req.setTimeout(30000, () => {
            req.destroy();
            reject(new Error('Request timeout'));
        });

        req.end();
    });
}

async function uploadToAirtable(records) {
    return new Promise((resolve, reject) => {
        const airtableData = JSON.stringify({
            records: records.map(record => ({
                fields: {
                    'Company ID': record.cmpnyId || '',
                    'Company Name': record.cmpnyNm || '',
                    'Registration Number': record.bizrno || '',
                    'Representative': record.rprsntrNm || '',
                    'Establishment Date': record.estblDe || '',
                    'Capital Amount': record.capitalAmount || '',
                    'Address': record.adres || '',
                    'Phone': record.telno || '',
                    'Email': record.email || '',
                    'Website': record.hmpgAdres || '',
                    'VC Type': record.vcSeNm || '',
                    'Region': record.ctpvNm || '',
                    'Investment Field': record.investField || '',
                    'Investment Trend': record.investTrend || '',
                    'Data Source': 'vcs.go.kr - Scaled Collection',
                    'Last Updated': new Date().toISOString()
                }
            }))
        });

        const requestOptions = {
            hostname: 'api.airtable.com',
            port: 443,
            path: `/v0/${CONFIG.airtableBaseId}/${encodeURIComponent(CONFIG.airtableTableName)}`,
            method: 'POST',
            headers: {
                'Authorization': `Bearer ${CONFIG.airtableApiKey}`,
                'Content-Type': 'application/json',
                'Content-Length': Buffer.byteLength(airtableData)
            }
        };

        const req = https.request(requestOptions, (res) => {
            let data = '';
            res.on('data', (chunk) => {
                data += chunk;
            });
            res.on('end', () => {
                if (res.statusCode === 200) {
                    resolve(JSON.parse(data));
                } else {
                    reject(new Error(`Airtable upload failed: ${res.statusCode} - ${data}`));
                }
            });
        });

        req.on('error', (err) => {
            reject(err);
        });

        req.write(airtableData);
        req.end();
    });
}

const runScaledVCScraper = async () => {
    console.log(`🎯 Starting SCALED VC data collection from page ${CONFIG.startPage}...`);
    
    let allRecords = [];
    let page = CONFIG.startPage;
    let hasMore = true;
    let totalProcessed = 0;
    let totalUploaded = 0;
    const startTime = Date.now();

    try {
        while (hasMore && page <= CONFIG.maxPages) {
            const url = `${baseUrl}?${commonQueryParams}&cp=${page}`;
            
            console.log(`📄 Fetching VC page ${page}/${CONFIG.maxPages}...`);
            
            const response = await makeRequest(url);
            const json = response.body;
            
            if (page === CONFIG.startPage) {
                console.log(`📊 Found ${json.total} total VC entries in database`);
            }
            
            const items = json.list || [];
            
            if (items.length > 0) {
                allRecords.push(...items);
                totalProcessed += items.length;
                console.log(`✅ Collected ${items.length} VC records from page ${page} (Total: ${totalProcessed})`);
                
                // Upload in batches for better performance and reliability
                if (allRecords.length >= CONFIG.batchSize) {
                    console.log(`📤 Uploading batch of ${allRecords.length} records...`);
                    try {
                        await uploadToAirtable(allRecords);
                        totalUploaded += allRecords.length;
                        console.log(`✅ Batch uploaded successfully (Total uploaded: ${totalUploaded})`);
                        allRecords = []; // Clear batch
                    } catch (uploadError) {
                        console.log(`❌ Batch upload failed: ${uploadError.message}`);
                        console.log(`   Retrying upload in 5 seconds...`);
                        await new Promise(resolve => setTimeout(resolve, 5000));
                        
                        // Retry upload
                        try {
                            await uploadToAirtable(allRecords);
                            totalUploaded += allRecords.length;
                            console.log(`✅ Retry upload successful (Total uploaded: ${totalUploaded})`);
                            allRecords = [];
                        } catch (retryError) {
                            console.log(`❌ Retry failed: ${retryError.message}`);
                            // Continue with next batch to avoid losing all progress
                            allRecords = [];
                        }
                    }
                }
                
                page++;
                
                // Rate limiting
                await new Promise(resolve => setTimeout(resolve, CONFIG.delayBetweenRequests));
            } else {
                hasMore = false;
                console.log(`🏁 No more data available after page ${page-1}`);
            }
        }

        // Upload remaining records
        if (allRecords.length > 0) {
            console.log(`📤 Uploading final batch of ${allRecords.length} records...`);
            try {
                await uploadToAirtable(allRecords);
                totalUploaded += allRecords.length;
                console.log(`✅ Final batch uploaded successfully`);
            } catch (uploadError) {
                console.log(`❌ Final batch upload failed: ${uploadError.message}`);
            }
        }

        const endTime = Date.now();
        const duration = (endTime - startTime) / 1000;

        console.log(`\\n🎉 SCALED VC COLLECTION COMPLETE!`);
        console.log(`   📊 Total Records Processed: ${totalProcessed}`);
        console.log(`   📤 Total Records Uploaded: ${totalUploaded}`);
        console.log(`   📄 Pages Scraped: ${page - CONFIG.startPage}`);
        console.log(`   ⏱️ Duration: ${duration.toFixed(1)} seconds`);
        console.log(`   🚀 Rate: ${(totalProcessed/duration).toFixed(1)} records/second`);
        console.log(`   📈 Success Rate: ${((totalUploaded/totalProcessed)*100).toFixed(1)}%`);

    } catch (error) {
        console.error(`❌ Scaled VC scraping failed: ${error.message}`);
        throw error;
    }
};

runScaledVCScraper().catch(console.error);
'''
    
    with open('immediate_vc_scraper_scaled.js', 'w', encoding='utf-8') as f:
        f.write(script_content)
    
    print("✅ Created scaled VC scraper script")

def create_scaled_fund_scraper():
    """Create scaled Fund scraper with dramatically increased pages"""
    
    script_content = '''// IMMEDIATE SCALED Fund Scraper - Maximum Data Collection
const https = require('https');
const { URL } = require('url');

// Scaled configuration for comprehensive collection
const CONFIG = {
    dataType: 'Fund',
    airtableApiKey: 'patOUfAsek4nbpvHm.49789ced0e2b0304bdc507f110d936277cd3da18ec3efc9347c93e6a1810919e',
    airtableBaseId: 'appdR8V9lJaRW8VkR',
    airtableTableName: 'Fund Table',
    maxPages: 150,  // DRAMATICALLY INCREASED
    startPage: 1,   // Start from beginning for funds
    enableDetailedLogging: true,
    batchSize: 10,  // Smaller batches for reliability
    delayBetweenRequests: 2000  // 2 second delay for stability
};

console.log(`🏦 SCALED FUND SCRAPER - Target: ${CONFIG.maxPages} pages`);
console.log(`   Expected to collect 1500+ Fund records`);

// Base scraping configuration  
const baseUrl = 'https://vcs.go.kr/vc/data/vcFndListAjax.do';
const tabMenu = 'vc_fund';
const commonQueryParams = 'tabMenu=' + tabMenu + '&searchKeywordType=all&searchKeyword=&region=&vcType=&fndType=&orderBy=FND_ESTBL_DE';

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
                'Referer': 'https://vcs.go.kr/vc/data/vcFndList.do'
            }
        };

        const req = https.request(requestOptions, (res) => {
            let data = '';
            res.on('data', (chunk) => {
                data += chunk;
            });
            res.on('end', () => {
                try {
                    const jsonData = JSON.parse(data);
                    resolve({ statusCode: res.statusCode, body: jsonData });
                } catch (e) {
                    resolve({ statusCode: res.statusCode, body: data });
                }
            });
        });

        req.on('error', (err) => {
            reject(err);
        });
        
        req.setTimeout(30000, () => {
            req.destroy();
            reject(new Error('Request timeout'));
        });

        req.end();
    });
}

async function uploadToAirtable(records) {
    return new Promise((resolve, reject) => {
        const airtableData = JSON.stringify({
            records: records.map(record => ({
                fields: {
                    'Fund ID': record.fndId || '',
                    'Fund Name': record.fndNm || '',
                    'VC Company Name': record.cmpnyNm || '',
                    'Fund Type': record.fndSeNm || '',
                    'Fund Size': record.fndScl || '',
                    'Establishment Date': record.fndEstblDe || '',
                    'Fund Period': record.fndPrd || '',
                    'Investment Field': record.investField || '',
                    'Fund Status': record.fndSttus || '',
                    'Region': record.ctpvNm || '',
                    'Representative': record.rprsntrNm || '',
                    'Contact Info': record.cntctInfo || '',
                    'Description': record.fndIntrcn || '',
                    'Data Source': 'vcs.go.kr - Scaled Collection',
                    'Last Updated': new Date().toISOString()
                }
            }))
        });

        const requestOptions = {
            hostname: 'api.airtable.com',
            port: 443,
            path: `/v0/${CONFIG.airtableBaseId}/${encodeURIComponent(CONFIG.airtableTableName)}`,
            method: 'POST',
            headers: {
                'Authorization': `Bearer ${CONFIG.airtableApiKey}`,
                'Content-Type': 'application/json',
                'Content-Length': Buffer.byteLength(airtableData)
            }
        };

        const req = https.request(requestOptions, (res) => {
            let data = '';
            res.on('data', (chunk) => {
                data += chunk;
            });
            res.on('end', () => {
                if (res.statusCode === 200) {
                    resolve(JSON.parse(data));
                } else {
                    reject(new Error(`Airtable upload failed: ${res.statusCode} - ${data}`));
                }
            });
        });

        req.on('error', (err) => {
            reject(err);
        });

        req.write(airtableData);
        req.end();
    });
}

const runScaledFundScraper = async () => {
    console.log(`🎯 Starting SCALED Fund data collection...`);
    
    let allRecords = [];
    let page = CONFIG.startPage;
    let hasMore = true;
    let totalProcessed = 0;
    let totalUploaded = 0;
    const startTime = Date.now();

    try {
        while (hasMore && page <= CONFIG.maxPages) {
            const url = `${baseUrl}?${commonQueryParams}&cp=${page}`;
            
            console.log(`📄 Fetching Fund page ${page}/${CONFIG.maxPages}...`);
            
            const response = await makeRequest(url);
            const json = response.body;
            
            if (page === 1) {
                console.log(`📊 Found ${json.total} total Fund entries in database`);
            }
            
            const items = json.list || [];
            
            if (items.length > 0) {
                allRecords.push(...items);
                totalProcessed += items.length;
                console.log(`✅ Collected ${items.length} Fund records from page ${page} (Total: ${totalProcessed})`);
                
                // Upload in batches for better performance
                if (allRecords.length >= CONFIG.batchSize) {
                    console.log(`📤 Uploading batch of ${allRecords.length} records...`);
                    try {
                        await uploadToAirtable(allRecords);
                        totalUploaded += allRecords.length;
                        console.log(`✅ Batch uploaded successfully (Total uploaded: ${totalUploaded})`);
                        allRecords = []; // Clear batch
                    } catch (uploadError) {
                        console.log(`❌ Batch upload failed: ${uploadError.message}`);
                        console.log(`   Retrying upload in 5 seconds...`);
                        await new Promise(resolve => setTimeout(resolve, 5000));
                        
                        // Retry upload
                        try {
                            await uploadToAirtable(allRecords);
                            totalUploaded += allRecords.length;
                            console.log(`✅ Retry upload successful (Total uploaded: ${totalUploaded})`);
                            allRecords = [];
                        } catch (retryError) {
                            console.log(`❌ Retry failed: ${retryError.message}`);
                            allRecords = [];
                        }
                    }
                }
                
                page++;
                
                // Rate limiting
                await new Promise(resolve => setTimeout(resolve, CONFIG.delayBetweenRequests));
            } else {
                hasMore = false;
                console.log(`🏁 No more data available after page ${page-1}`);
            }
        }

        // Upload remaining records
        if (allRecords.length > 0) {
            console.log(`📤 Uploading final batch of ${allRecords.length} records...`);
            try {
                await uploadToAirtable(allRecords);
                totalUploaded += allRecords.length;
                console.log(`✅ Final batch uploaded successfully`);
            } catch (uploadError) {
                console.log(`❌ Final batch upload failed: ${uploadError.message}`);
            }
        }

        const endTime = Date.now();
        const duration = (endTime - startTime) / 1000;

        console.log(`\\n🎉 SCALED FUND COLLECTION COMPLETE!`);
        console.log(`   📊 Total Records Processed: ${totalProcessed}`);
        console.log(`   📤 Total Records Uploaded: ${totalUploaded}`);
        console.log(`   📄 Pages Scraped: ${page - CONFIG.startPage}`);
        console.log(`   ⏱️ Duration: ${duration.toFixed(1)} seconds`);
        console.log(`   🚀 Rate: ${(totalProcessed/duration).toFixed(1)} records/second`);
        console.log(`   📈 Success Rate: ${((totalUploaded/totalProcessed)*100).toFixed(1)}%`);

    } catch (error) {
        console.error(`❌ Scaled Fund scraping failed: ${error.message}`);
        throw error;
    }
};

runScaledFundScraper().catch(console.error);
'''
    
    with open('immediate_fund_scraper_scaled.js', 'w', encoding='utf-8') as f:
        f.write(script_content)
    
    print("✅ Created scaled Fund scraper script")

def run_immediate_scaling():
    """Run immediate scaling of both VC and Fund scrapers"""
    print("🚀 IMMEDIATE APIFY SCALING")
    print("   Dramatically expanding your Korean VC database right now!")
    print("   " + "="*70)
    
    # Create the scaled scraper scripts
    print("\n🛠️ Creating scaled scraper scripts...")
    create_scaled_vc_scraper()
    create_scaled_fund_scraper()
    
    # Ask user which scrapers to run
    print("\n📊 SCALING OPTIONS:")
    print("   1. VC Scraper Only (200 pages, ~2000 additional companies)")
    print("   2. Fund Scraper Only (150 pages, ~1500 fund records)")
    print("   3. Both Scrapers (comprehensive expansion)")
    
    try:
        choice = input("\nSelect scaling option (1-3): ").strip()
    except:
        choice = "3"  # Default to both
    
    results = {}
    start_time = time.time()
    
    if choice in ["1", "3"]:
        print("\n🚀 Starting VC scraper scaling...")
        try:
            # Run VC scraper
            vc_result = subprocess.run(
                ['node', 'immediate_vc_scraper_scaled.js'],
                capture_output=True,
                text=True,
                timeout=3600  # 1 hour timeout
            )
            
            if vc_result.returncode == 0:
                print("✅ VC scraper completed successfully!")
                results['vc'] = {
                    'success': True,
                    'output': vc_result.stdout
                }
            else:
                print(f"❌ VC scraper failed: {vc_result.stderr}")
                results['vc'] = {
                    'success': False,
                    'error': vc_result.stderr
                }
                
        except subprocess.TimeoutExpired:
            print("⏱️ VC scraper timed out after 1 hour")
            results['vc'] = {
                'success': False,
                'error': 'Timeout after 1 hour'
            }
        except Exception as e:
            print(f"❌ VC scraper exception: {e}")
            results['vc'] = {
                'success': False,
                'error': str(e)
            }
    
    if choice in ["2", "3"]:
        print("\n🏦 Starting Fund scraper scaling...")
        try:
            # Run Fund scraper
            fund_result = subprocess.run(
                ['node', 'immediate_fund_scraper_scaled.js'],
                capture_output=True,
                text=True,
                timeout=3600  # 1 hour timeout
            )
            
            if fund_result.returncode == 0:
                print("✅ Fund scraper completed successfully!")
                results['fund'] = {
                    'success': True,
                    'output': fund_result.stdout
                }
            else:
                print(f"❌ Fund scraper failed: {fund_result.stderr}")
                results['fund'] = {
                    'success': False,
                    'error': fund_result.stderr
                }
                
        except subprocess.TimeoutExpired:
            print("⏱️ Fund scraper timed out after 1 hour")
            results['fund'] = {
                'success': False,
                'error': 'Timeout after 1 hour'
            }
        except Exception as e:
            print(f"❌ Fund scraper exception: {e}")
            results['fund'] = {
                'success': False,
                'error': str(e)
            }
    
    total_duration = time.time() - start_time
    
    # Generate final report
    successful_scrapers = sum(1 for r in results.values() if r['success'])
    total_scrapers = len(results)
    
    print(f"\n🎉 IMMEDIATE SCALING COMPLETE!")
    print(f"   ⏱️ Total Duration: {total_duration/60:.1f} minutes")
    print(f"   ✅ Success Rate: {successful_scrapers}/{total_scrapers} scrapers")
    
    # Save results
    scaling_report = {
        'scaling_type': 'immediate_apify',
        'execution_time': datetime.now().isoformat(),
        'total_duration': total_duration,
        'results': results,
        'success_rate': successful_scrapers / total_scrapers if total_scrapers > 0 else 0
    }
    
    report_filename = f"immediate_scaling_report_{datetime.now().strftime('%Y%m%d_%H%M%S')}.json"
    with open(report_filename, 'w', encoding='utf-8') as f:
        json.dump(scaling_report, f, ensure_ascii=False, indent=2)
    
    print(f"   📄 Report saved: {report_filename}")
    
    # Print next steps
    print(f"\n🎯 NEXT STEPS:")
    if successful_scrapers > 0:
        print("   ✅ Your Korean VC database has been dramatically expanded!")
        print("   • Check your Airtable tables for the new data")
        print("   • Consider setting up DIVA enhancement data collection")
        print("   • Create intelligence dashboards and analysis")
        print("   • Implement cross-referencing between data sources")
    else:
        print("   ❌ Scaling did not succeed. Check errors and retry.")
        print("   • Verify internet connection and API keys")
        print("   • Check Airtable API limits and permissions")
    
    return scaling_report

def main():
    """Main execution function"""
    print("🚀 IMMEDIATE APIFY SCALING")
    print("   Expand Your Korean VC Database RIGHT NOW")
    print("   " + "="*50)
    
    # Check if Node.js is available
    try:
        node_check = subprocess.run(['node', '--version'], capture_output=True, text=True)
        if node_check.returncode == 0:
            print(f"✅ Node.js detected: {node_check.stdout.strip()}")
        else:
            print("❌ Node.js not found. Please install Node.js to run this scaling.")
            return
    except:
        print("❌ Node.js not found. Please install Node.js to run this scaling.")
        return
    
    # Run immediate scaling
    result = run_immediate_scaling()
    
    print(f"\n🎉 IMMEDIATE SCALING SESSION COMPLETE!")
    print(f"   Your Korean VC intelligence system is ready for the next level!")

if __name__ == "__main__":
    main() 