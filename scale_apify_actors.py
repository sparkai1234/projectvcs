#!/usr/bin/env python3
"""
🚀 SCALE APIFY ACTORS - Comprehensive Korean VC Data Collection
Dramatically scale up Apify actor data collection:
- Korean VC Scraper: Scale to 200+ pages (from current 50)
- Korean Fund Scraper: Scale to 150+ pages
- Run actors in parallel for maximum efficiency
- Monitor and report collection progress
"""

import os
import sys
import json
import time
import asyncio
import requests
from datetime import datetime
from concurrent.futures import ThreadPoolExecutor, as_completed
from api_config import set_environment_variables

# Set up environment variables
set_environment_variables()

class ApifyScalingSystem:
    def __init__(self):
        self.airtable_api_key = os.getenv('AIRTABLE_API_KEY')
        self.airtable_base_id = os.getenv('AIRTABLE_BASE_ID')
        
        if not self.airtable_api_key or not self.airtable_base_id:
            raise ValueError("Missing API configuration. Check your api_config.py file")
        
        # Scaling configuration for maximum data collection
        self.scaling_config = {
            'korean_vc_scraper': {
                'actor_id': 'korean-vc-scraper',
                'max_pages': 200,  # Dramatically increased from 50
                'start_page': 1,
                'table_name': 'VC Table',
                'priority': 1,  # High priority
                'expected_records': 4000  # Estimated based on scaling
            },
            'korean_fund_scraper': {
                'actor_id': 'korean-fund-scraper', 
                'max_pages': 150,  # Dramatically increased
                'start_page': 1,
                'table_name': 'Fund Table',
                'priority': 2,
                'expected_records': 3000  # Estimated
            },
            'execution_settings': {
                'run_in_parallel': True,
                'max_concurrent_actors': 2,
                'timeout_minutes': 120,  # 2 hours for comprehensive collection
                'retry_attempts': 3,
                'delay_between_retries': 300  # 5 minutes
            }
        }
    
    def create_scaled_actor_input(self, actor_config):
        """Create input configuration for scaled actor runs"""
        return {
            "airtableApiKey": self.airtable_api_key,
            "airtableBaseId": self.airtable_base_id,
            "airtableTableName": actor_config['table_name'],
            "maxPages": actor_config['max_pages'],
            "startPage": actor_config['start_page'],
            "enableDetailedLogging": True,
            "batchSize": 100,  # Optimize for performance
            "delayBetweenRequests": 1000,  # 1 second for rate limiting
            "enableRetries": True,
            "maxRetries": 3
        }
    
    def run_scaled_local_scraper(self, scraper_type, config):
        """Run local JavaScript scraper with scaled parameters"""
        print(f"🚀 Running scaled {scraper_type} scraper...")
        print(f"   Target: {config['max_pages']} pages")
        print(f"   Expected records: ~{config['expected_records']}")
        
        # Create scaled input
        scaled_input = self.create_scaled_actor_input(config)
        
        # Determine which local scraper to run
        if scraper_type == 'vc':
            script_name = 'test_vc_scraper_scaled.js'
            self._create_scaled_vc_script(scaled_input)
        elif scraper_type == 'fund':
            script_name = 'test_fund_scraper_scaled.js'  
            self._create_scaled_fund_script(scaled_input)
        else:
            print(f"❌ Unknown scraper type: {scraper_type}")
            return None
        
        # Run the scaled scraper
        try:
            print(f"📊 Starting {scraper_type} data collection...")
            start_time = time.time()
            
            # Execute the Node.js script
            import subprocess
            result = subprocess.run(
                ['node', script_name],
                capture_output=True,
                text=True,
                timeout=7200  # 2 hour timeout
            )
            
            end_time = time.time()
            duration = end_time - start_time
            
            if result.returncode == 0:
                print(f"✅ {scraper_type} scraper completed successfully")
                print(f"   Duration: {duration:.1f} seconds")
                
                # Parse output for statistics
                stats = self._parse_scraper_output(result.stdout)
                return {
                    'success': True,
                    'duration': duration,
                    'stats': stats,
                    'scraper_type': scraper_type
                }
            else:
                print(f"❌ {scraper_type} scraper failed")
                print(f"   Error: {result.stderr}")
                return {
                    'success': False,
                    'error': result.stderr,
                    'scraper_type': scraper_type
                }
                
        except subprocess.TimeoutExpired:
            print(f"⏱️ {scraper_type} scraper timed out after 2 hours")
            return {
                'success': False,
                'error': 'Timeout after 2 hours',
                'scraper_type': scraper_type
            }
        except Exception as e:
            print(f"❌ Error running {scraper_type} scraper: {e}")
            return {
                'success': False,
                'error': str(e),
                'scraper_type': scraper_type
            }
    
    def _create_scaled_vc_script(self, scaled_input):
        """Create scaled VC scraper script"""
        script_content = f'''// SCALED VC Scraper - Comprehensive Data Collection
const https = require('https');
const {{ URL }} = require('url');

// Scaled configuration for comprehensive collection
const CONFIG = {{
    dataType: 'VC',
    airtableApiKey: '{scaled_input["airtableApiKey"]}',
    airtableBaseId: '{scaled_input["airtableBaseId"]}',
    airtableTableName: '{scaled_input["airtableTableName"]}',
    maxPages: {scaled_input["maxPages"]},
    startPage: {scaled_input["startPage"]},
    enableDetailedLogging: true,
    batchSize: {scaled_input["batchSize"]},
    delayBetweenRequests: {scaled_input["delayBetweenRequests"]}
}};

console.log(`🚀 SCALED VC SCRAPER - Target: ${{CONFIG.maxPages}} pages`);
console.log(`   Expected to collect 3000+ VC company records`);

// Base scraping configuration
const baseUrl = 'https://vcs.go.kr/vc/data/vcCmpnyListAjax.do';
const tabMenu = 'vc_data';
const commonQueryParams = 'tabMenu=' + tabMenu + '&searchKeywordType=all&searchKeyword=&region=&vcType=&investTrend=&investField=&orderBy=ESTBL_DE';

async function makeRequest(url) {{
    return new Promise((resolve, reject) => {{
        const parsedUrl = new URL(url);
        const requestOptions = {{
            hostname: parsedUrl.hostname,
            port: parsedUrl.port,
            path: parsedUrl.pathname + parsedUrl.search,
            method: 'GET',
            headers: {{
                'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36',
                'Accept': 'application/json, text/plain, */*',
                'Accept-Language': 'ko-KR,ko;q=0.9,en;q=0.8',
                'Referer': 'https://vcs.go.kr/vc/data/vcCmpnyList.do'
            }}
        }};

        const req = https.request(requestOptions, (res) => {{
            let data = '';
            res.on('data', (chunk) => {{
                data += chunk;
            }});
            res.on('end', () => {{
                try {{
                    const jsonData = JSON.parse(data);
                    resolve({{ statusCode: res.statusCode, body: jsonData }});
                }} catch (e) {{
                    resolve({{ statusCode: res.statusCode, body: data }});
                }}
            }});
        }});

        req.on('error', (err) => {{
            reject(err);
        }});
        
        req.setTimeout(30000, () => {{
            req.destroy();
            reject(new Error('Request timeout'));
        }});

        req.end();
    }});
}}

async function uploadToAirtable(records) {{
    return new Promise((resolve, reject) => {{
        const airtableData = JSON.stringify({{
            records: records.map(record => ({{
                fields: {{
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
                }}
            }})))
        }});

        const requestOptions = {{
            hostname: 'api.airtable.com',
            port: 443,
            path: `/v0/${{CONFIG.airtableBaseId}}/${{encodeURIComponent(CONFIG.airtableTableName)}}`,
            method: 'POST',
            headers: {{
                'Authorization': `Bearer ${{CONFIG.airtableApiKey}}`,
                'Content-Type': 'application/json',
                'Content-Length': Buffer.byteLength(airtableData)
            }}
        }};

        const req = https.request(requestOptions, (res) => {{
            let data = '';
            res.on('data', (chunk) => {{
                data += chunk;
            }});
            res.on('end', () => {{
                if (res.statusCode === 200) {{
                    resolve(JSON.parse(data));
                }} else {{
                    reject(new Error(`Airtable upload failed: ${{res.statusCode}} - ${{data}}`));
                }}
            }});
        }});

        req.on('error', (err) => {{
            reject(err);
        }});

        req.write(airtableData);
        req.end();
    }});
}}

const runScaledVCScraper = async () => {{
    console.log(`🎯 Starting SCALED VC data collection...`);
    
    let allRecords = [];
    let page = CONFIG.startPage;
    let hasMore = true;
    let totalProcessed = 0;
    const startTime = Date.now();

    try {{
        while (hasMore && page <= CONFIG.maxPages) {{
            const url = `${{baseUrl}}?${{commonQueryParams}}&cp=${{page}}`;
            
            console.log(`📄 Fetching VC page ${{page}}/${{CONFIG.maxPages}}...`);
            
            const response = await makeRequest(url);
            const json = response.body;
            
            if (page === 1) {{
                console.log(`📊 Found ${{json.total}} total VC entries in database`);
            }}
            
            const items = json.list || [];
            
            if (items.length > 0) {{
                allRecords.push(...items);
                totalProcessed += items.length;
                console.log(`✅ Collected ${{items.length}} VC records from page ${{page}} (Total: ${{totalProcessed}})`);
                
                // Upload in batches for better performance
                if (allRecords.length >= CONFIG.batchSize) {{
                    console.log(`📤 Uploading batch of ${{allRecords.length}} records...`);
                    try {{
                        await uploadToAirtable(allRecords);
                        console.log(`✅ Batch uploaded successfully`);
                        allRecords = []; // Clear batch
                    }} catch (uploadError) {{
                        console.log(`❌ Batch upload failed: ${{uploadError.message}}`);
                    }}
                }}
                
                page++;
                
                // Rate limiting
                await new Promise(resolve => setTimeout(resolve, CONFIG.delayBetweenRequests));
            }} else {{
                hasMore = false;
                console.log(`🏁 No more data available after page ${{page-1}}`);
            }}
        }}

        // Upload remaining records
        if (allRecords.length > 0) {{
            console.log(`📤 Uploading final batch of ${{allRecords.length}} records...`);
            try {{
                await uploadToAirtable(allRecords);
                console.log(`✅ Final batch uploaded successfully`);
            }} catch (uploadError) {{
                console.log(`❌ Final batch upload failed: ${{uploadError.message}}`);
            }}
        }}

        const endTime = Date.now();
        const duration = (endTime - startTime) / 1000;

        console.log(`\\n🎉 SCALED VC COLLECTION COMPLETE!`);
        console.log(`   📊 Total Records: ${{totalProcessed}}`);
        console.log(`   📄 Pages Scraped: ${{page-1}}`);
        console.log(`   ⏱️ Duration: ${{duration.toFixed(1)}} seconds`);
        console.log(`   🚀 Rate: ${{(totalProcessed/duration).toFixed(1)}} records/second`);

    }} catch (error) {{
        console.error(`❌ Scaled VC scraping failed: ${{error.message}}`);
        throw error;
    }}
}};

runScaledVCScraper().catch(console.error);
'''
        
        with open('test_vc_scraper_scaled.js', 'w', encoding='utf-8') as f:
            f.write(script_content)
    
    def _create_scaled_fund_script(self, scaled_input):
        """Create scaled Fund scraper script"""
        script_content = f'''// SCALED Fund Scraper - Comprehensive Data Collection
const https = require('https');
const {{ URL }} = require('url');

// Scaled configuration for comprehensive collection
const CONFIG = {{
    dataType: 'Fund',
    airtableApiKey: '{scaled_input["airtableApiKey"]}',
    airtableBaseId: '{scaled_input["airtableBaseId"]}',
    airtableTableName: '{scaled_input["airtableTableName"]}',
    maxPages: {scaled_input["maxPages"]},
    startPage: {scaled_input["startPage"]},
    enableDetailedLogging: true,
    batchSize: {scaled_input["batchSize"]},
    delayBetweenRequests: {scaled_input["delayBetweenRequests"]}
}};

console.log(`🏦 SCALED FUND SCRAPER - Target: ${{CONFIG.maxPages}} pages`);
console.log(`   Expected to collect 2500+ Fund records`);

// Base scraping configuration  
const baseUrl = 'https://vcs.go.kr/vc/data/vcFndListAjax.do';
const tabMenu = 'vc_fund';
const commonQueryParams = 'tabMenu=' + tabMenu + '&searchKeywordType=all&searchKeyword=&region=&vcType=&fndType=&orderBy=FND_ESTBL_DE';

async function makeRequest(url) {{
    return new Promise((resolve, reject) => {{
        const parsedUrl = new URL(url);
        const requestOptions = {{
            hostname: parsedUrl.hostname,
            port: parsedUrl.port,
            path: parsedUrl.pathname + parsedUrl.search,
            method: 'GET',
            headers: {{
                'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36',
                'Accept': 'application/json, text/plain, */*',
                'Accept-Language': 'ko-KR,ko;q=0.9,en;q=0.8',
                'Referer': 'https://vcs.go.kr/vc/data/vcFndList.do'
            }}
        }};

        const req = https.request(requestOptions, (res) => {{
            let data = '';
            res.on('data', (chunk) => {{
                data += chunk;
            }});
            res.on('end', () => {{
                try {{
                    const jsonData = JSON.parse(data);
                    resolve({{ statusCode: res.statusCode, body: jsonData }});
                }} catch (e) {{
                    resolve({{ statusCode: res.statusCode, body: data }});
                }}
            }});
        }});

        req.on('error', (err) => {{
            reject(err);
        }});
        
        req.setTimeout(30000, () => {{
            req.destroy();
            reject(new Error('Request timeout'));
        }});

        req.end();
    }});
}}

async function uploadToAirtable(records) {{
    return new Promise((resolve, reject) => {{
        const airtableData = JSON.stringify({{
            records: records.map(record => ({{
                fields: {{
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
                }}
            }})))
        }});

        const requestOptions = {{
            hostname: 'api.airtable.com',
            port: 443,
            path: `/v0/${{CONFIG.airtableBaseId}}/${{encodeURIComponent(CONFIG.airtableTableName)}}`,
            method: 'POST',
            headers: {{
                'Authorization': `Bearer ${{CONFIG.airtableApiKey}}`,
                'Content-Type': 'application/json',
                'Content-Length': Buffer.byteLength(airtableData)
            }}
        }};

        const req = https.request(requestOptions, (res) => {{
            let data = '';
            res.on('data', (chunk) => {{
                data += chunk;
            }});
            res.on('end', () => {{
                if (res.statusCode === 200) {{
                    resolve(JSON.parse(data));
                }} else {{
                    reject(new Error(`Airtable upload failed: ${{res.statusCode}} - ${{data}}`));
                }}
            }});
        }});

        req.on('error', (err) => {{
            reject(err);
        }});

        req.write(airtableData);
        req.end();
    }});
}}

const runScaledFundScraper = async () => {{
    console.log(`🎯 Starting SCALED Fund data collection...`);
    
    let allRecords = [];
    let page = CONFIG.startPage;
    let hasMore = true;
    let totalProcessed = 0;
    const startTime = Date.now();

    try {{
        while (hasMore && page <= CONFIG.maxPages) {{
            const url = `${{baseUrl}}?${{commonQueryParams}}&cp=${{page}}`;
            
            console.log(`📄 Fetching Fund page ${{page}}/${{CONFIG.maxPages}}...`);
            
            const response = await makeRequest(url);
            const json = response.body;
            
            if (page === 1) {{
                console.log(`📊 Found ${{json.total}} total Fund entries in database`);
            }}
            
            const items = json.list || [];
            
            if (items.length > 0) {{
                allRecords.push(...items);
                totalProcessed += items.length;
                console.log(`✅ Collected ${{items.length}} Fund records from page ${{page}} (Total: ${{totalProcessed}})`);
                
                // Upload in batches for better performance
                if (allRecords.length >= CONFIG.batchSize) {{
                    console.log(`📤 Uploading batch of ${{allRecords.length}} records...`);
                    try {{
                        await uploadToAirtable(allRecords);
                        console.log(`✅ Batch uploaded successfully`);
                        allRecords = []; // Clear batch
                    }} catch (uploadError) {{
                        console.log(`❌ Batch upload failed: ${{uploadError.message}}`);
                    }}
                }}
                
                page++;
                
                // Rate limiting
                await new Promise(resolve => setTimeout(resolve, CONFIG.delayBetweenRequests));
            }} else {{
                hasMore = false;
                console.log(`🏁 No more data available after page ${{page-1}}`);
            }}
        }}

        // Upload remaining records
        if (allRecords.length > 0) {{
            console.log(`📤 Uploading final batch of ${{allRecords.length}} records...`);
            try {{
                await uploadToAirtable(allRecords);
                console.log(`✅ Final batch uploaded successfully`);
            }} catch (uploadError) {{
                console.log(`❌ Final batch upload failed: ${{uploadError.message}}`);
            }}
        }}

        const endTime = Date.now();
        const duration = (endTime - startTime) / 1000;

        console.log(`\\n🎉 SCALED FUND COLLECTION COMPLETE!`);
        console.log(`   📊 Total Records: ${{totalProcessed}}`);
        console.log(`   📄 Pages Scraped: ${{page-1}}`);
        console.log(`   ⏱️ Duration: ${{duration.toFixed(1)}} seconds`);
        console.log(`   🚀 Rate: ${{(totalProcessed/duration).toFixed(1)}} records/second`);

    }} catch (error) {{
        console.error(`❌ Scaled Fund scraping failed: ${{error.message}}`);
        throw error;
    }}
}};

runScaledFundScraper().catch(console.error);
'''
        
        with open('test_fund_scraper_scaled.js', 'w', encoding='utf-8') as f:
            f.write(script_content)
    
    def _parse_scraper_output(self, output):
        """Parse scraper output to extract statistics"""
        stats = {
            'total_records': 0,
            'pages_scraped': 0,
            'duration': 0,
            'rate': 0
        }
        
        try:
            lines = output.split('\n')
            for line in lines:
                if 'Total Records:' in line:
                    stats['total_records'] = int(line.split(':')[1].strip())
                elif 'Pages Scraped:' in line:
                    stats['pages_scraped'] = int(line.split(':')[1].strip())
                elif 'Duration:' in line:
                    stats['duration'] = float(line.split(':')[1].strip().split()[0])
                elif 'Rate:' in line:
                    stats['rate'] = float(line.split(':')[1].strip().split()[0])
        except:
            pass
        
        return stats
    
    def run_parallel_scaling(self):
        """Run multiple scrapers in parallel for maximum data collection"""
        print("🚀 PARALLEL APIFY SCALING")
        print("   Running VC and Fund scrapers simultaneously")
        print("   " + "="*60)
        
        scrapers_to_run = [
            ('vc', self.scaling_config['korean_vc_scraper']),
            ('fund', self.scaling_config['korean_fund_scraper'])
        ]
        
        results = []
        
        # Run scrapers in parallel using ThreadPoolExecutor
        with ThreadPoolExecutor(max_workers=self.scaling_config['execution_settings']['max_concurrent_actors']) as executor:
            # Submit all scraper tasks
            future_to_scraper = {
                executor.submit(self.run_scaled_local_scraper, scraper_type, config): scraper_type
                for scraper_type, config in scrapers_to_run
            }
            
            # Collect results as they complete
            for future in as_completed(future_to_scraper):
                scraper_type = future_to_scraper[future]
                try:
                    result = future.result()
                    results.append(result)
                    
                    if result['success']:
                        print(f"✅ {scraper_type.upper()} scraper completed successfully")
                        print(f"   Records: {result['stats']['total_records']}")
                        print(f"   Duration: {result['stats']['duration']:.1f}s")
                    else:
                        print(f"❌ {scraper_type.upper()} scraper failed: {result['error']}")
                        
                except Exception as e:
                    print(f"❌ {scraper_type.upper()} scraper exception: {e}")
                    results.append({
                        'success': False,
                        'error': str(e),
                        'scraper_type': scraper_type
                    })
        
        return results
    
    def generate_scaling_summary(self, results):
        """Generate comprehensive scaling summary"""
        print("\n📊 APIFY SCALING SUMMARY")
        print("="*50)
        
        total_records = 0
        successful_scrapers = 0
        total_duration = 0
        
        for result in results:
            if result['success']:
                successful_scrapers += 1
                total_records += result['stats']['total_records']
                total_duration = max(total_duration, result['stats']['duration'])
            
            print(f"🔍 {result['scraper_type'].upper()} Scraper:")
            if result['success']:
                stats = result['stats']
                print(f"   ✅ Success: {stats['total_records']} records in {stats['duration']:.1f}s")
                print(f"   📄 Pages: {stats['pages_scraped']}")
                print(f"   🚀 Rate: {stats['rate']:.1f} records/second")
            else:
                print(f"   ❌ Failed: {result['error']}")
        
        print(f"\n🎯 OVERALL RESULTS:")
        print(f"   📊 Total Records Collected: {total_records}")
        print(f"   ✅ Successful Scrapers: {successful_scrapers}/{len(results)}")
        print(f"   ⏱️ Total Duration: {total_duration:.1f} seconds")
        
        if total_records > 0:
            print(f"   🚀 Overall Rate: {total_records/total_duration:.1f} records/second")
        
        # Generate recommendations
        print(f"\n🎯 NEXT SCALING RECOMMENDATIONS:")
        if total_records < 5000:
            print("   • Consider increasing page limits further (300+ pages)")
            print("   • Add historical data collection (previous months)")
        if successful_scrapers < len(results):
            print("   • Review and fix failed scrapers")
            print("   • Implement retry mechanisms")
        
        print("   • Set up automated daily incremental updates")
        print("   • Implement data deduplication across sources")
        
        return {
            'total_records': total_records,
            'successful_scrapers': successful_scrapers,
            'total_scrapers': len(results),
            'duration': total_duration,
            'success_rate': successful_scrapers / len(results) if results else 0
        }

def main():
    """Main execution function"""
    print("🚀 APIFY SCALING SYSTEM - COMPREHENSIVE DATA COLLECTION")
    print("   Dramatically Expanding Korean VC Database Coverage")
    print("   " + "="*70)
    
    try:
        # Initialize scaling system
        scaling_system = ApifyScalingSystem()
        
        # Run parallel scaling
        print("\n🔥 Starting parallel scraper execution...")
        results = scaling_system.run_parallel_scaling()
        
        # Generate comprehensive summary
        summary = scaling_system.generate_scaling_summary(results)
        
        # Save scaling report
        report_filename = f"apify_scaling_report_{datetime.now().strftime('%Y%m%d_%H%M%S')}.json"
        with open(report_filename, 'w', encoding='utf-8') as f:
            json.dump({
                'summary': summary,
                'detailed_results': results,
                'scaling_config': scaling_system.scaling_config,
                'timestamp': datetime.now().isoformat()
            }, f, ensure_ascii=False, indent=2)
        
        print(f"\n🎉 APIFY SCALING COMPLETE!")
        print(f"   📊 Total Records: {summary['total_records']}")
        print(f"   ✅ Success Rate: {summary['success_rate']*100:.1f}%")
        print(f"   📄 Report: {report_filename}")
        
        return results
        
    except Exception as e:
        print(f"❌ Apify scaling failed: {e}")
        raise

if __name__ == "__main__":
    main() 