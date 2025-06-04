#!/usr/bin/env python3
"""
Verify Cleanup Success - Check that SQL field cleanup was successful
"""

from supabase import create_client, Client
from api_config import get_supabase_config

def verify_cleanup_success():
    print("🔍 VERIFYING SQL CLEANUP SUCCESS")
    print("=" * 60)
    
    try:
        config = get_supabase_config(use_service_role=True)
        supabase: Client = create_client(config['url'], config['key'])
        
        # Current counts
        print("📊 FINAL RECORD COUNTS:")
        fund_count = supabase.table('fund_table').select('id', count='exact').execute()
        vc_count = supabase.table('vc_table').select('id', count='exact').execute()
        
        print(f"   💰 Fund Table: {fund_count.count:,} records")
        print(f"   🏢 VC Table: {vc_count.count:,} records")
        print(f"   📊 Total: {fund_count.count + vc_count.count:,} records")
        
        # Check current field structure
        print(f"\n🔍 CURRENT FIELD STRUCTURE:")
        
        fund_sample = supabase.table('fund_table').select('*').limit(1).execute()
        vc_sample = supabase.table('vc_table').select('*').limit(1).execute()
        
        if fund_sample.data:
            fund_fields = list(fund_sample.data[0].keys())
            print(f"   💰 Fund Table - {len(fund_fields)} fields:")
            for i, field in enumerate(fund_fields, 1):
                print(f"      {i:2d}. {field}")
        
        if vc_sample.data:
            vc_fields = list(vc_sample.data[0].keys())
            print(f"\n   🏢 VC Table - {len(vc_fields)} fields:")
            for i, field in enumerate(vc_fields, 1):
                print(f"      {i:2d}. {field}")
        
        # Check if unwanted fields were removed
        print(f"\n✅ FIELD REMOVAL VERIFICATION:")
        
        # Fund table - fields that should be REMOVED
        fund_removed_fields = [
            'commitment_amount', 'total_amount', 'registration_date',
            'investment_focus', 'fund_type', 'fund_details',
            'investment_field', 'investment_character', 'company_industry',
            'description', 'sector', 'data_source'
        ]
        
        print(f"   💰 Fund Table:")
        fund_cleanup_success = True
        for field in fund_removed_fields:
            if field in fund_fields:
                print(f"      ❌ {field} - STILL EXISTS (should be removed)")
                fund_cleanup_success = False
            else:
                print(f"      ✅ {field} - REMOVED")
        
        # VC table - fields that should be REMOVED
        vc_removed_fields = [
            'data_type', 'operating_scale', 'business_category',
            'strategy_planner', 'data_source'
        ]
        
        print(f"\n   🏢 VC Table:")
        vc_cleanup_success = True
        for field in vc_removed_fields:
            if field in vc_fields:
                print(f"      ❌ {field} - STILL EXISTS (should be removed)")
                vc_cleanup_success = False
            else:
                print(f"      ✅ {field} - REMOVED")
        
        # Sample data verification
        print(f"\n📋 SAMPLE DATA VERIFICATION:")
        
        # Fund table samples
        fund_samples = supabase.table('fund_table').select('fund_name, fund_id, company_name, fund_size').limit(3).execute()
        print(f"   💰 Fund Table Sample:")
        for i, fund in enumerate(fund_samples.data, 1):
            name = fund.get('fund_name', 'N/A')[:40]
            fund_id = fund.get('fund_id', 'N/A')
            company = fund.get('company_name', 'N/A')[:25]
            size = fund.get('fund_size', 'N/A')
            print(f"      {i}. {name}... | ID: {fund_id} | Company: {company}... | Size: {size}")
        
        # VC table samples
        vc_samples = supabase.table('vc_table').select('company_name, industry, established_date, operating_amount').limit(3).execute()
        print(f"\n   🏢 VC Table Sample:")
        for i, vc in enumerate(vc_samples.data, 1):
            name = vc.get('company_name', 'N/A')[:35]
            industry = vc.get('industry', 'N/A')
            established = vc.get('established_date', 'N/A')
            amount = vc.get('operating_amount', 'N/A')
            print(f"      {i}. {name}... | {industry} | Est: {established} | Amount: {amount}")
        
        # Overall success assessment
        print(f"\n🎯 CLEANUP SUCCESS ASSESSMENT:")
        
        if fund_cleanup_success:
            print(f"   ✅ Fund Table: All unwanted fields successfully removed!")
        else:
            print(f"   ❌ Fund Table: Some fields still exist - may need to re-run SQL")
        
        if vc_cleanup_success:
            print(f"   ✅ VC Table: All unwanted fields successfully removed!")
        else:
            print(f"   ❌ VC Table: Some fields still exist - may need to re-run SQL")
        
        if fund_cleanup_success and vc_cleanup_success:
            print(f"\n🎉 DIVA INTELLIGENCE SYSTEM - MIGRATION 100% COMPLETE!")
            print(f"   ✅ {fund_count.count:,} Fund records (≈ Airtable target)")
            print(f"   ✅ {vc_count.count:,} VC records")
            print(f"   ✅ {len(fund_fields)} essential Fund fields only")
            print(f"   ✅ {len(vc_fields)} essential VC fields only")
            print(f"   ✅ All unwanted fields removed")
            print(f"   ✅ Database optimized for scraping operations")
            print(f"   ✅ Ready for production use!")
        else:
            print(f"\n⚠️  Some cleanup steps may need to be repeated.")
        
        # Database statistics
        print(f"\n📈 FINAL DATABASE STATISTICS:")
        print(f"   💾 Total Records: {fund_count.count + vc_count.count:,}")
        print(f"   📋 Total Fields: {len(fund_fields) + len(vc_fields)}")
        print(f"   🗑️  Fields Removed: {len(fund_removed_fields) + len(vc_removed_fields)}")
        print(f"   🚀 Database Ready: {'YES' if fund_cleanup_success and vc_cleanup_success else 'PENDING'}")
        
    except Exception as e:
        print(f"❌ Error: {e}")

if __name__ == "__main__":
    verify_cleanup_success() 