#!/usr/bin/env python3
"""
Quick test script for DIVA scraper
Run this to test the scraper functionality
"""

import os
import sys
from datetime import datetime

def main():
    print("🚀 DIVA Personnel Data Scraper - Test Run")
    print("=" * 50)
    
    try:
        # Import the scraper
        from diva_html_scraper import DIVAPersonnelScraper
        
        # Create scraper instance
        scraper = DIVAPersonnelScraper()
        
        # Test with just first 2 pages
        print("📊 Testing scraper with first 2 pages...")
        data = scraper.scrape_all_pages(
            year_month="2025-04",
            max_pages=2,  # Just test first 2 pages
            delay=3  # Be respectful to the server
        )
        
        if not data:
            print("❌ No data extracted")
            return
        
        # Save test data
        json_file, csv_file = scraper.save_data("test_diva_data.json")
        
        # Show results
        stats = scraper.get_summary_stats()
        
        print("\n✅ TEST RESULTS:")
        print(f"📈 Companies extracted: {stats['total_companies']}")
        print(f"👥 Total personnel: {stats['total_personnel_sum']}")
        print(f"📊 Average company size: {stats['average_company_size']:.1f}")
        print(f"🏢 Largest company: {stats['largest_company']}")
        print(f"💾 Data saved to: {json_file}")
        
        # Show sample data
        print("\n📋 SAMPLE DATA:")
        for i, record in enumerate(data[:3]):  # Show first 3 records
            print(f"{i+1}. {record['company_name']} - {record['total_personnel']} staff")
        
        print("\n🎯 Next Steps:")
        print("1. Install Airtable dependencies: pip install pyairtable")
        print("2. Set your AIRTABLE_API_KEY environment variable") 
        print("3. Run: python diva_to_airtable.py")
        
    except ImportError as e:
        print(f"❌ Missing dependencies: {e}")
        print("📦 Please install requirements: pip install -r diva_requirements.txt")
    except Exception as e:
        print(f"❌ Error: {e}")
        import traceback
        traceback.print_exc()

if __name__ == "__main__":
    main() 