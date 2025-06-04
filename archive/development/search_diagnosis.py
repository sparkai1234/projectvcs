#!/usr/bin/env python3
"""
Search Diagnosis Tool
Identify exact issues with company search matching
"""

from supabase import create_client, Client
from api_config import get_supabase_config

def diagnose_search_issues():
    """Diagnose specific search issues"""
    print("🔍 Search Logic Diagnosis")
    print("=" * 50)
    
    # Initialize Supabase
    config = get_supabase_config(use_service_role=True)
    supabase: Client = create_client(config['url'], config['key'])
    
    # Test problematic queries
    test_cases = [
        "유엔벤처스",      # Should NOT match anything
        "스톤브릿지벤처스",   # Should match correctly  
        "스톤브릿지",       # Partial match test
        "카카오벤처스",      # Should match correctly
    ]
    
    print("1. Database Search Results:")
    for query in test_cases:
        print(f"\nQuery: '{query}'")
        
        # Exact match
        exact = supabase.table('vc_table').select('company_name, representative, website_url').eq('company_name', query).execute()
        print(f"  Exact matches: {len(exact.data)}")
        for company in exact.data:
            print(f"    - {company['company_name']}: Rep={company.get('representative', 'None')}")
        
        # Partial match
        partial = supabase.table('vc_table').select('company_name, representative, website_url').ilike('company_name', f'%{query}%').execute()
        print(f"  Partial matches: {len(partial.data)}")
        for company in partial.data[:3]:  # Show first 3
            print(f"    - {company['company_name']}: Rep={company.get('representative', 'None')}")
    
    # Test the actual comprehensive interface
    print("\n2. Testing Comprehensive OpenAI Interface:")
    
    try:
        from comprehensive_vc_openai_interface import ComprehensiveVCAnalyzer
        analyzer = ComprehensiveVCAnalyzer()
        
        for query in test_cases:
            print(f"\nInterface test: '{query}'")
            try:
                data = analyzer.get_comprehensive_company_data(query)
                
                if data.get("company_profile"):
                    company = data["company_profile"]
                    print(f"  ✅ Found: {company.get('company_name', 'Unknown')}")
                    print(f"     Rep: {company.get('representative', 'N/A')}")
                    print(f"     Web: {company.get('website_url', 'N/A')}")
                else:
                    search_result = data.get("query_info", {}).get("search_result", "No info")
                    print(f"  ❌ Not found: {search_result}")
            except Exception as e:
                print(f"  ❌ Error: {e}")
    
    except ImportError:
        print("  ❌ Cannot import ComprehensiveVCAnalyzer")
    
    print("\n3. Checking 스톤브릿지벤처스 Data Quality:")
    stonebridge = supabase.table('vc_table').select('*').ilike('company_name', '%스톤브릿지벤처스%').execute()
    
    if stonebridge.data:
        company = stonebridge.data[0]
        print(f"  Company: {company.get('company_name')}")
        print(f"  Representative: '{company.get('representative', '')}'")
        print(f"  Website: '{company.get('website_url', '')}'")
        print(f"  Operating Amount: {company.get('operating_amount')}")
        
        # Check data cleanliness
        rep = company.get('representative', '')
        web = company.get('website_url', '')
        print(f"  Rep clean: '{rep.strip()}' (length: {len(rep)})")
        print(f"  Web clean: '{web.strip()}' (length: {len(web)})")


if __name__ == "__main__":
    diagnose_search_issues() 