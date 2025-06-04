#!/usr/bin/env python3
"""
Python wrapper for running the Supabase Fund Scraper
Executes the Node.js scraper with proper configuration
"""

import subprocess
import sys
import os
import json
from datetime import datetime

def run_fund_scraper(max_pages=None, start_page=1, enable_detailed_scraping=True):
    """Run the Supabase fund scraper with specified parameters"""
    
    print("🏦 DIVA Fund Scraper for Supabase")
    print("=" * 60)
    print(f"📍 Enhanced with 대표펀드매니저 (Fund Manager) Data Extraction")
    print(f"📅 Started: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
    print()
    
    # Configuration
    config = {
        'maxPages': max_pages,
        'startPage': start_page,
        'enableDetailedScraping': enable_detailed_scraping,
        'batchSize': 20,
        'delayBetweenRequests': 100,
        'delayBetweenBatches': 300
    }
    
    print(f"⚙️ Configuration:")
    print(f"   • Max Pages: {max_pages or 'ALL'}")
    print(f"   • Start Page: {start_page}")
    print(f"   • Enhanced Scraping: {enable_detailed_scraping}")
    print(f"   • Target: Supabase fund_table")
    print()
    
    # Check if Node.js is available
    try:
        subprocess.run(['node', '--version'], check=True, capture_output=True)
    except (subprocess.CalledProcessError, FileNotFoundError):
        print("❌ Node.js is required but not found. Please install Node.js first.")
        return False
    
    # Check if the scraper file exists
    scraper_path = 'src/supabase/supabase_fund_scraper.js'
    if not os.path.exists(scraper_path):
        print(f"❌ Scraper file not found: {scraper_path}")
        return False
    
    try:
        print("🚀 Starting fund scraper...")
        
        # Set environment variables for configuration
        env = os.environ.copy()
        env['SCRAPER_CONFIG'] = json.dumps(config)
        
        # Run the Node.js scraper
        process = subprocess.run(
            ['node', scraper_path],
            env=env,
            capture_output=False,  # Show real-time output
            text=True
        )
        
        if process.returncode == 0:
            print("\n✅ Fund scraper completed successfully!")
            print("📊 Check Supabase fund_table for new records with enhanced manager data")
            return True
        else:
            print(f"\n❌ Fund scraper failed with exit code: {process.returncode}")
            return False
            
    except Exception as e:
        print(f"❌ Error running fund scraper: {e}")
        return False

def main():
    """Main execution function"""
    import argparse
    
    parser = argparse.ArgumentParser(description='Run Supabase Fund Scraper')
    parser.add_argument('--max-pages', type=int, help='Maximum pages to scrape (default: all)')
    parser.add_argument('--start-page', type=int, default=1, help='Starting page number')
    parser.add_argument('--no-detailed-scraping', action='store_true', help='Disable detailed fund manager scraping')
    
    args = parser.parse_args()
    
    # Run the scraper
    success = run_fund_scraper(
        max_pages=args.max_pages,
        start_page=args.start_page,
        enable_detailed_scraping=not args.no_detailed_scraping
    )
    
    if success:
        print("\n🎉 Fund data successfully scraped to Supabase!")
        print("💡 You can now use comprehensive_vc_openai_interface.py to query fund manager information")
    else:
        print("\n❌ Fund scraping failed. Check the error messages above.")
        sys.exit(1)

if __name__ == "__main__":
    main() 