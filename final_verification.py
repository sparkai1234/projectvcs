#!/usr/bin/env python3
"""
Final Verification - Check migration completion
"""

from supabase import create_client, Client
from api_config import get_supabase_config

def final_verification():
    print("🎯 FINAL VERIFICATION")
    print("=" * 50)
    
    try:
        config = get_supabase_config(use_service_role=True)
        supabase: Client = create_client(config['url'], config['key'])
        
        # Check Fund table - target record
        print("💰 FUND TABLE - Target Record:")
        fund_check = supabase.table('fund_table').select(
            'fund_name, fund_id, investment_focus, expiry_date'
        ).eq('fund_name', '2015 에이치비기술사업화벤처투자조합').execute()
        
        if fund_check.data:
            record = fund_check.data[0]
            print(f"   ✅ Fund Name: {record['fund_name']}")
            print(f"   ✅ Fund ID: {record['fund_id']}")
            print(f"   ✅ Investment Focus: {record['investment_focus']}")
            print(f"   ✅ Expiry Date: {record['expiry_date']}")
        else:
            print("   ❌ Target fund not found")
            
        # Check VC table - target record
        print(f"\n🏢 VC TABLE - Target Record:")
        vc_check = supabase.table('vc_table').select(
            'company_name, industry, established_date, founded'
        ).eq('company_name', '헥사곤벤처스').execute()
        
        if vc_check.data:
            record = vc_check.data[0]
            print(f"   ✅ Company: {record['company_name']}")
            print(f"   ✅ Industry: {record['industry']}")
            print(f"   ✅ Founded: {record['founded']}")
            print(f"   ✅ Established Date: {record['established_date']}")
        else:
            print("   ❌ Target VC not found")
            
        # Summary
        print(f"\n📊 MIGRATION SUMMARY:")
        fund_total = supabase.table('fund_table').select('id', count='exact').execute()
        vc_total = supabase.table('vc_table').select('id', count='exact').execute()
        
        print(f"   💰 Fund Records: {fund_total.count}")
        print(f"   🏢 VC Records: {vc_total.count}")
        
        # Check field population rates
        fund_with_id = supabase.table('fund_table').select('id', count='exact').neq('fund_id', None).execute()
        fund_with_focus = supabase.table('fund_table').select('id', count='exact').neq('investment_focus', None).execute()
        vc_with_industry = supabase.table('vc_table').select('id', count='exact').neq('industry', None).execute()
        vc_with_date = supabase.table('vc_table').select('id', count='exact').neq('established_date', None).execute()
        
        print(f"\n📈 FIELD POPULATION:")
        print(f"   💰 Funds with Fund ID: {fund_with_id.count}/{fund_total.count}")
        print(f"   💰 Funds with Investment Focus: {fund_with_focus.count}/{fund_total.count}")
        print(f"   🏢 VCs with Industry: {vc_with_industry.count}/{vc_total.count}")
        print(f"   🏢 VCs with Established Date: {vc_with_date.count}/{vc_total.count}")
        
    except Exception as e:
        print(f"❌ Error: {e}")

if __name__ == "__main__":
    final_verification() 