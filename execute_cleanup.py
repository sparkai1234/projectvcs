#!/usr/bin/env python3
"""
Execute Database Cleanup - Remove unwanted fields from both tables
"""

from supabase import create_client, Client
from api_config import get_supabase_config
import psycopg2

def execute_cleanup():
    print("🧹 EXECUTING DATABASE CLEANUP")
    print("=" * 60)
    
    try:
        config = get_supabase_config(use_service_role=True)
        supabase: Client = create_client(config['url'], config['key'])
        
        # First verify current counts
        fund_count = supabase.table('fund_table').select('id', count='exact').execute()
        vc_count = supabase.table('vc_table').select('id', count='exact').execute()
        
        print(f"📊 Current Records:")
        print(f"   💰 Fund Table: {fund_count.count:,} records")
        print(f"   🏢 VC Table: {vc_count.count:,} records")
        
        # Try to get current field structure
        print(f"\n🔍 Current field structure:")
        
        # Sample records to see current fields
        fund_sample = supabase.table('fund_table').select('*').limit(1).execute()
        vc_sample = supabase.table('vc_table').select('*').limit(1).execute()
        
        if fund_sample.data:
            fund_fields = list(fund_sample.data[0].keys())
            print(f"   💰 Fund fields ({len(fund_fields)}): {fund_fields}")
        
        if vc_sample.data:
            vc_fields = list(vc_sample.data[0].keys())
            print(f"   🏢 VC fields ({len(vc_fields)}): {vc_fields}")
        
        # VC Table cleanup
        print(f"\n🏢 CLEANING UP VC TABLE:")
        vc_fields_to_remove = [
            'data_type',
            'operating_scale', 
            'business_category',
            'strategy_planner',
            'data_source'
        ]
        
        vc_removed = []
        for field in vc_fields_to_remove:
            if field in vc_fields:
                vc_removed.append(field)
                print(f"   🗑️  Will remove: {field}")
            else:
                print(f"   ⚠️  Field not found: {field}")
        
        # Fund Table cleanup
        print(f"\n💰 CLEANING UP FUND TABLE:")
        fund_fields_to_remove = [
            'commitment_amount',
            'total_amount',
            'registration_date', 
            'investment_focus',
            'fund_type',
            'fund_details',
            'investment_field',
            'investment_character',
            'company_industry',
            'description',
            'sector',
            'data_source'
        ]
        
        fund_removed = []
        for field in fund_fields_to_remove:
            if field in fund_fields:
                fund_removed.append(field)
                print(f"   🗑️  Will remove: {field}")
            else:
                print(f"   ⚠️  Field not found: {field}")
        
        # Show what will remain
        print(f"\n✅ FIELDS THAT WILL REMAIN:")
        
        remaining_fund_fields = [f for f in fund_fields if f not in fund_removed]
        remaining_vc_fields = [f for f in vc_fields if f not in vc_removed]
        
        print(f"   💰 Fund ({len(remaining_fund_fields)}): {remaining_fund_fields}")
        print(f"   🏢 VC ({len(remaining_vc_fields)}): {remaining_vc_fields}")
        
        print(f"\n⚠️  Note: Manual SQL execution required in Supabase SQL Editor")
        print(f"   Use the cleanup_fund_table.sql and cleanup_vc_table.sql files")
        
    except Exception as e:
        print(f"❌ Error: {e}")

if __name__ == "__main__":
    execute_cleanup() 