#!/usr/bin/env python3
"""
Test script to verify VC_Table data access
This will show what data is actually available for companies like Mirae Asset
"""

from supabase import create_client, Client
from api_config import get_supabase_config
import json

def test_vc_table_access():
    """Test access to VC_Table data"""
    print("🔍 Testing VC_Table Data Access")
    print("=" * 50)
    
    # Initialize Supabase connection
    config = get_supabase_config(use_service_role=True)
    supabase: Client = create_client(config['url'], config['key'])
    
    # Test 1: Search for Mirae Asset specifically
    print("\n📊 Test 1: Searching for 미래에셋 companies...")
    
    try:
        # Search for companies containing "미래에셋"
        response = supabase.table('vc_table').select("*").ilike('company_name', '%미래에셋%').execute()
        companies = response.data
        
        print(f"Found {len(companies)} companies with '미래에셋' in name:")
        
        for company in companies:
            print(f"\n🏢 Company: {company.get('company_name')}")
            print(f"   Company ID: {company.get('company_id')}")
            print(f"   💰 Operating Amount: {company.get('operating_amount')}")
            print(f"   📍 Location: {company.get('location')}")
            print(f"   👤 Representative: {company.get('representative')}")
            print(f"   📅 Established: {company.get('established_date')}")
            print(f"   🏢 Founded: {company.get('founded')}")
            print(f"   🏭 Industry: {company.get('industry')}")
            print(f"   📊 Company Type: {company.get('company_type')}")
            print(f"   📊 Status: {company.get('status')}")
            print(f"   🌐 Website: {company.get('website_url')}")
            print(f"   📞 Contact: {company.get('contact_info')}")
            print(f"   📋 Disclosure: {company.get('disclosure_data')}")
            
    except Exception as e:
        print(f"❌ Error searching for 미래에셋: {e}")
    
    # Test 2: Get sample of VC companies with operating amounts
    print(f"\n📊 Test 2: Sample VC companies with operating amounts...")
    
    try:
        response = supabase.table('vc_table').select("*").not_.is_('operating_amount', 'null').limit(10).execute()
        companies_with_aum = response.data
        
        print(f"Found {len(companies_with_aum)} companies with operating amounts:")
        
        for company in companies_with_aum[:5]:
            print(f"\n🏢 {company.get('company_name')}")
            print(f"   💰 AUM: {company.get('operating_amount')}")
            print(f"   📍 Location: {company.get('location')}")
            print(f"   📊 Type: {company.get('company_type')}")
            
    except Exception as e:
        print(f"❌ Error getting companies with AUM: {e}")
    
    # Test 3: Get statistics about the VC_Table
    print(f"\n📊 Test 3: VC_Table Statistics...")
    
    try:
        # Total companies
        total_response = supabase.table('vc_table').select("id", count="exact").execute()
        total_count = total_response.count if hasattr(total_response, 'count') else len(total_response.data)
        
        # Companies with operating amounts
        aum_response = supabase.table('vc_table').select("operating_amount", count="exact").not_.is_('operating_amount', 'null').execute()
        aum_count = aum_response.count if hasattr(aum_response, 'count') else len(aum_response.data)
        
        # Companies with locations
        location_response = supabase.table('vc_table').select("location", count="exact").not_.is_('location', 'null').execute()
        location_count = location_response.count if hasattr(location_response, 'count') else len(location_response.data)
        
        print(f"📈 Total VC Companies: {total_count}")
        print(f"💰 Companies with Operating Amounts: {aum_count} ({aum_count/total_count*100:.1f}%)")
        print(f"📍 Companies with Locations: {location_count} ({location_count/total_count*100:.1f}%)")
        
    except Exception as e:
        print(f"❌ Error getting statistics: {e}")
    
    # Test 4: Show available company types
    print(f"\n📊 Test 4: Company Types Available...")
    
    try:
        response = supabase.table('vc_table').select("company_type").not_.is_('company_type', 'null').execute()
        types = [company.get('company_type') for company in response.data if company.get('company_type')]
        unique_types = list(set(types))
        
        print(f"Available company types ({len(unique_types)}):")
        for company_type in unique_types[:10]:
            type_count = types.count(company_type)
            print(f"   • {company_type}: {type_count} companies")
            
    except Exception as e:
        print(f"❌ Error getting company types: {e}")

if __name__ == "__main__":
    test_vc_table_access() 