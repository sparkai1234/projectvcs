#!/usr/bin/env python3
"""
Test Comprehensive Fund & VC Data Access
Verify that the fund_table is properly integrated with VC company data
"""

from supabase import create_client, Client
from api_config import get_supabase_config
import json

def test_fund_vc_integration():
    """Test the integration between fund_table and vc_table"""
    print("🧪 Testing Comprehensive Fund & VC Data Integration")
    print("=" * 60)
    
    # Initialize Supabase connection
    config = get_supabase_config(use_service_role=True)
    supabase: Client = create_client(config['url'], config['key'])
    
    # 1. Test fund_table access
    print("📊 Testing fund_table access...")
    try:
        funds_response = supabase.table('fund_table').select("*").limit(5).execute()
        funds = funds_response.data
        print(f"✅ fund_table: {len(funds)} sample records retrieved")
        
        if funds:
            sample_fund = funds[0]
            print(f"📋 Sample Fund:")
            print(f"   Fund Name: {sample_fund.get('fund_name', 'N/A')}")
            print(f"   Company ID: {sample_fund.get('company_id', 'N/A')}")
            print(f"   Fund Size: {sample_fund.get('fund_size', 'N/A'):,} 원")
            print(f"   Company Name: {sample_fund.get('company_name', 'N/A')}")
            print(f"   Establishment Date: {sample_fund.get('establishment_date', 'N/A')}")
            print()
            
            # 2. Test VC company lookup for this fund
            company_id = sample_fund.get('company_id')
            if company_id:
                print(f"🔍 Looking up VC company for ID: {company_id}")
                vc_response = supabase.table('vc_table').select("*").eq('company_id', company_id).execute()
                vc_companies = vc_response.data
                
                if vc_companies:
                    vc_company = vc_companies[0]
                    print(f"✅ Found matching VC company:")
                    print(f"   Company Name: {vc_company.get('company_name', 'N/A')}")
                    print(f"   Operating Amount: {vc_company.get('operating_amount', 'N/A'):,} 백만원")
                    print(f"   Location: {vc_company.get('location', 'N/A')}")
                    print(f"   Established: {vc_company.get('established_date', 'N/A')}")
                else:
                    print(f"⚠️ No matching VC company found for ID: {company_id}")
            print()
            
    except Exception as e:
        print(f"❌ Error testing fund_table: {e}")
        return False
    
    # 3. Test comprehensive statistics
    print("📈 Testing Comprehensive Statistics...")
    try:
        # Get total fund count
        fund_count_response = supabase.table('fund_table').select("id", count="exact").limit(1).execute()
        total_funds = fund_count_response.count
        
        # Get total VC count
        vc_count_response = supabase.table('vc_table').select("id", count="exact").limit(1).execute()
        total_vcs = vc_count_response.count
        
        # Get contacts count
        contacts_count_response = supabase.table('contacts_matched').select("id", count="exact").limit(1).execute()
        total_contacts = contacts_count_response.count
        
        print(f"📊 Database Overview:")
        print(f"   Total VC Companies: {total_vcs:,}")
        print(f"   Total Funds: {total_funds:,}")
        print(f"   Total Matched Contacts: {total_contacts:,}")
        print()
        
        # 4. Test fund size analysis
        print("💰 Testing Fund Size Analysis...")
        funds_with_size = supabase.table('fund_table').select("fund_size, fund_name").not_("fund_size", "is", None).limit(1000).execute()
        
        if funds_with_size.data:
            fund_sizes = []
            for fund in funds_with_size.data:
                size = fund.get('fund_size')
                if size and isinstance(size, (int, float)) and size > 0:
                    fund_sizes.append(size)
            
            if fund_sizes:
                total_aum = sum(fund_sizes)
                avg_fund_size = total_aum / len(fund_sizes)
                max_fund = max(fund_sizes)
                min_fund = min(fund_sizes)
                
                print(f"💰 Fund Size Statistics:")
                print(f"   Funds with size data: {len(fund_sizes):,}")
                print(f"   Total AUM: {total_aum:,.0f} 원 ({total_aum/1e9:.1f}B 원)")
                print(f"   Average Fund Size: {avg_fund_size:,.0f} 원 ({avg_fund_size/1e8:.1f}억 원)")
                print(f"   Largest Fund: {max_fund:,.0f} 원 ({max_fund/1e8:.1f}억 원)")
                print(f"   Smallest Fund: {min_fund:,.0f} 원 ({min_fund/1e8:.1f}억 원)")
        
    except Exception as e:
        print(f"❌ Error in comprehensive statistics: {e}")
    
    # 5. Test company-fund relationship
    print("\n🔗 Testing Company-Fund Relationships...")
    try:
        # Find companies with multiple funds
        companies_with_funds = {}
        all_funds = supabase.table('fund_table').select("company_id, company_name, fund_name, fund_size").limit(3691).execute()
        
        for fund in all_funds.data:
            company_id = fund.get('company_id')
            company_name = fund.get('company_name', 'Unknown')
            
            if company_id:
                if company_id not in companies_with_funds:
                    companies_with_funds[company_id] = {
                        'company_name': company_name,
                        'funds': []
                    }
                companies_with_funds[company_id]['funds'].append(fund)
        
        # Show companies with most funds
        companies_by_fund_count = sorted(
            companies_with_funds.items(), 
            key=lambda x: len(x[1]['funds']), 
            reverse=True
        )
        
        print(f"🏆 Top 5 Companies by Fund Count:")
        for i, (company_id, data) in enumerate(companies_by_fund_count[:5]):
            fund_count = len(data['funds'])
            company_name = data['company_name']
            total_size = sum(f.get('fund_size', 0) for f in data['funds'] if f.get('fund_size'))
            
            print(f"   {i+1}. {company_name} ({company_id})")
            print(f"      Funds: {fund_count}")
            print(f"      Total Size: {total_size:,.0f} 원 ({total_size/1e8:.1f}억 원)")
        
    except Exception as e:
        print(f"❌ Error in company-fund relationships: {e}")
    
    print("\n✅ Comprehensive Fund & VC Integration Test Complete!")
    return True

if __name__ == "__main__":
    test_fund_vc_integration() 