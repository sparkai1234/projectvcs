#!/usr/bin/env python3
"""
Data Quality Verification for VC Database
Check for search accuracy and data correctness issues
"""

from supabase import create_client, Client
from api_config import get_supabase_config

def verify_data_quality():
    """Verify data quality issues in the VC database"""
    print("Data Quality Verification")
    print("=" * 50)
    
    # Initialize Supabase
    config = get_supabase_config(use_service_role=True)
    supabase: Client = create_client(config['url'], config['key'])
    
    # 1. Check if 유엔벤처스 exists in database
    print("1. Searching for '유엔벤처스' in database...")
    response = supabase.table('vc_table').select('company_name, representative, website_url, company_id').ilike('company_name', '%유엔%').execute()
    
    if response.data:
        print(f"Found {len(response.data)} companies with '유엔' in name:")
        for company in response.data:
            print(f"  - {company['company_name']}: Rep={company.get('representative', 'None')} | Web={company.get('website_url', 'None')}")
    else:
        print("❌ NO companies found with '유엔' in name - confirms user's SQL query result")
    print()
    
    # 2. Check actual Stonebridge Ventures data
    print("2. Checking actual Stonebridge Ventures data in database...")
    response = supabase.table('vc_table').select('company_name, representative, website_url, company_id, operating_amount, location, established_date').ilike('company_name', '%스톤브릿지%').execute()
    
    if response.data:
        for company in response.data:
            print(f"Company: {company['company_name']}")
            print(f"  Real Rep: {company.get('representative', 'None')}")
            print(f"  Real Website: {company.get('website_url', 'None')}")
            print(f"  Operating Amount: {company.get('operating_amount', 'None')}")
            print(f"  Location: {company.get('location', 'None')}")
            print(f"  Established: {company.get('established_date', 'None')}")
            print()
    else:
        print("❌ No Stonebridge companies found")
    
    # 3. Check our manual database vs real data
    print("3. Comparing our manual database with real database...")
    manual_stonebridge = {
        "representative": "조성문",
        "website_url": "https://www.stonebridge.co.kr"
    }
    
    if response.data:
        real_data = response.data[0]
        print("Manual Database says:")
        print(f"  Representative: {manual_stonebridge['representative']}")
        print(f"  Website: {manual_stonebridge['website_url']}")
        print()
        print("Real Database says:")
        print(f"  Representative: {real_data.get('representative', 'None')}")
        print(f"  Website: {real_data.get('website_url', 'None')}")
        print()
        
        # Check for discrepancies
        rep_match = manual_stonebridge['representative'] == real_data.get('representative', '')
        web_match = manual_stonebridge['website_url'] == real_data.get('website_url', '')
        
        if not rep_match:
            print("🚨 REPRESENTATIVE MISMATCH!")
        if not web_match:
            print("🚨 WEBSITE MISMATCH!")
            
        if rep_match and web_match:
            print("✅ Data matches")
    
    print()
    
    # 4. Test company name matching logic
    print("4. Testing company name matching logic...")
    test_queries = ["유엔벤처스", "유엔", "UN벤처스", "스톤브릿지"]
    
    for query in test_queries:
        print(f"Searching for: '{query}'")
        response = supabase.table('vc_table').select('company_name').ilike('company_name', f'%{query}%').execute()
        print(f"  Results: {len(response.data)} companies")
        if response.data:
            for company in response.data[:3]:  # Show first 3
                print(f"    - {company['company_name']}")
        print()
    
    # 5. Check current enrichment status
    print("5. Current enrichment status...")
    response = supabase.table('vc_table').select('representative, website_url').execute()
    total = len(response.data)
    enriched = sum(1 for c in response.data if c.get('representative') and c.get('website_url'))
    
    print(f"Total companies: {total}")
    print(f"Enriched companies: {enriched} ({enriched/total*100:.1f}%)")
    print(f"Remaining to enrich: {total - enriched}")


if __name__ == "__main__":
    verify_data_quality() 