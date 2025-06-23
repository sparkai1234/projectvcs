#!/usr/bin/env python3
"""
Investigate financial statements data issue
"""

import os
from supabase import create_client, Client
import sys

def investigate_financial_data():
    """Investigate what happened to financial statements data"""
    print("🔍 === INVESTIGATING FINANCIAL STATEMENTS DATA ===")
    
    # Initialize Supabase client
    supabase_url = os.getenv('SUPABASE_URL')
    supabase_key = os.getenv('SUPABASE_SERVICE_ROLE_KEY') or os.getenv('SUPABASE_KEY')
    
    supabase: Client = create_client(supabase_url, supabase_key)
    print(f"✅ Connected to Supabase")
    
    try:
        # Check all tab_type values
        print("\n📋 Checking tab_type distribution:")
        response = supabase.table('diva_financial_statements').select('tab_type').execute()
        
        tab_types = {}
        for record in response.data:
            tab_type = record.get('tab_type', 'NULL')
            tab_types[tab_type] = tab_types.get(tab_type, 0) + 1
        
        for tab_type, count in tab_types.items():
            print(f"   - {tab_type}: {count} records")
        
        # Check for any income statement records
        print("\n🔍 Checking for income statement records:")
        income_response = supabase.table('diva_financial_statements').select('*').eq('tab_type', 'income_statement').limit(5).execute()
        
        if income_response.data:
            print(f"   ✅ Found {len(income_response.data)} income statement records (showing first 5)")
            for record in income_response.data[:3]:
                print(f"      - {record.get('company_name', 'N/A')}: {record.get('tab_type', 'N/A')}")
        else:
            print("   ❌ No income statement records found")
        
        # Check for records with operating_revenue (income statement indicator)
        print("\n🔍 Checking for records with operating_revenue:")
        revenue_response = supabase.table('diva_financial_statements').select('company_name, operating_revenue, tab_type').not_.is_('operating_revenue', 'null').limit(10).execute()
        
        if revenue_response.data:
            print(f"   ✅ Found {len(revenue_response.data)} records with operating_revenue")
            for record in revenue_response.data[:5]:
                print(f"      - {record.get('company_name', 'N/A')}: revenue={record.get('operating_revenue', 'N/A')}, type={record.get('tab_type', 'N/A')}")
        else:
            print("   ❌ No records with operating_revenue found")
        
        # Check sample balance sheet record
        print("\n📋 Sample balance sheet record:")
        balance_response = supabase.table('diva_financial_statements').select('*').eq('tab_type', 'balance_sheet').limit(1).execute()
        
        if balance_response.data:
            record = balance_response.data[0]
            print(f"   Company: {record.get('company_name', 'N/A')}")
            print(f"   Assets: {record.get('assets', 'N/A')}")
            print(f"   Operating Revenue: {record.get('operating_revenue', 'N/A')}")
            print(f"   Tab Type: {record.get('tab_type', 'N/A')}")
        
        # Check if there are any NULL tab_type records
        print("\n🔍 Checking for NULL tab_type records:")
        null_response = supabase.table('diva_financial_statements').select('*', count='exact').is_('tab_type', 'null').execute()
        print(f"   Records with NULL tab_type: {null_response.count}")
        
        # Check for empty string tab_type
        empty_response = supabase.table('diva_financial_statements').select('*', count='exact').eq('tab_type', '').execute()
        print(f"   Records with empty tab_type: {empty_response.count}")
        
    except Exception as e:
        print(f"❌ Error investigating: {str(e)}")

if __name__ == "__main__":
    investigate_financial_data() 