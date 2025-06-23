#!/usr/bin/env python3
"""
Check actual record counts in DIVA tables
"""

import os
from supabase import create_client, Client
import sys

def check_record_counts():
    """Check actual record counts in all DIVA tables"""
    print("📊 === DIVA Table Record Counts ===")
    
    # Initialize Supabase client
    supabase_url = os.getenv('SUPABASE_URL')
    supabase_key = os.getenv('SUPABASE_SERVICE_ROLE_KEY') or os.getenv('SUPABASE_KEY')
    
    if not supabase_url or not supabase_key:
        print("❌ Error: SUPABASE_URL and SUPABASE_SERVICE_ROLE_KEY environment variables required")
        sys.exit(1)
    
    supabase: Client = create_client(supabase_url, supabase_key)
    print(f"✅ Connected to Supabase")
    
    # List of DIVA tables
    tables = [
        'diva_investment_performance',
        'diva_financial_statements',
        'diva_association_status',
        'diva_personnel_status',
        'diva_professional_personnel',
        'diva_violations',
        'diva_vc_map',
        'diva_professional_network'
    ]
    
    total_records = 0
    
    for table_name in tables:
        try:
            # Get count using count parameter
            response = supabase.table(table_name).select('*', count='exact').execute()
            count = response.count
            
            print(f"📋 {table_name}: {count:,} records")
            total_records += count
            
            # For financial statements, also check by tab_type
            if table_name == 'diva_financial_statements' and count > 0:
                balance_response = supabase.table(table_name).select('*', count='exact').eq('tab_type', 'balance_sheet').execute()
                income_response = supabase.table(table_name).select('*', count='exact').eq('tab_type', 'income_statement').execute()
                
                balance_count = balance_response.count or 0
                income_count = income_response.count or 0
                
                print(f"   - Balance sheets: {balance_count:,}")
                print(f"   - Income statements: {income_count:,}")
                print(f"   - Total: {balance_count + income_count:,}")
                
        except Exception as e:
            print(f"❌ Error checking {table_name}: {str(e)}")
    
    print(f"\n📊 TOTAL RECORDS: {total_records:,}")
    print(f"✅ Record count check complete!")

if __name__ == "__main__":
    check_record_counts() 