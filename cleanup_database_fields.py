#!/usr/bin/env python3
"""
Cleanup Database Fields - Remove unwanted fields and verify record counts
"""

from supabase import create_client, Client
from api_config import get_supabase_config

def cleanup_database_fields():
    print("🧹 CLEANING UP DATABASE FIELDS")
    print("=" * 60)
    
    try:
        config = get_supabase_config(use_service_role=True)
        supabase: Client = create_client(config['url'], config['key'])
        
        # First, verify record counts
        print("📊 VERIFYING RECORD COUNTS:")
        
        fund_count = supabase.table('fund_table').select('id', count='exact').execute()
        vc_count = supabase.table('vc_table').select('id', count='exact').execute()
        
        print(f"   💰 Fund Table: {fund_count.count} records")
        print(f"   🏢 VC Table: {vc_count.count} records")
        
        # VC Table - Remove unwanted fields
        print(f"\n🏢 REMOVING VC TABLE FIELDS:")
        vc_fields_to_remove = [
            'data_type',
            'operating_scale', 
            'business_category',
            'strategy_planner',
            'data_source'
        ]
        
        for field in vc_fields_to_remove:
            try:
                # Use raw SQL to drop column
                result = supabase.rpc('exec_sql', {
                    'sql': f'ALTER TABLE vc_table DROP COLUMN IF EXISTS {field};'
                }).execute()
                print(f"   ✅ Removed: {field}")
            except Exception as e:
                print(f"   ⚠️  {field}: {str(e)}")
        
        # Fund Table - Remove unwanted fields  
        print(f"\n💰 REMOVING FUND TABLE FIELDS:")
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
        
        for field in fund_fields_to_remove:
            try:
                # Use raw SQL to drop column
                result = supabase.rpc('exec_sql', {
                    'sql': f'ALTER TABLE fund_table DROP COLUMN IF EXISTS {field};'
                }).execute()
                print(f"   ✅ Removed: {field}")
            except Exception as e:
                print(f"   ⚠️  {field}: {str(e)}")
        
        # Verify final state
        print(f"\n🔍 FINAL VERIFICATION:")
        
        # Sample records to show remaining fields
        fund_sample = supabase.table('fund_table').select('*').limit(1).execute()
        vc_sample = supabase.table('vc_table').select('*').limit(1).execute()
        
        if fund_sample.data:
            print(f"   💰 Fund Table remaining fields: {list(fund_sample.data[0].keys())}")
        
        if vc_sample.data:
            print(f"   🏢 VC Table remaining fields: {list(vc_sample.data[0].keys())}")
        
        print(f"\n🎉 CLEANUP COMPLETE!")
        print(f"   💰 Fund records preserved: {fund_count.count}")
        print(f"   🏢 VC records preserved: {vc_count.count}")
        
    except Exception as e:
        print(f"❌ Error: {e}")

if __name__ == "__main__":
    cleanup_database_fields() 