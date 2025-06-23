#!/usr/bin/env python3
"""
Check Financial Statements Schema
Checks the actual column structure of the diva_financial_statements table
"""

import os
from supabase import create_client, Client
import sys

def check_financial_schema():
    """Check the actual schema of the financial statements table"""
    print("🔍 === CHECKING FINANCIAL STATEMENTS SCHEMA ===")
    
    # Initialize Supabase client
    supabase_url = os.getenv('SUPABASE_URL')
    supabase_key = os.getenv('SUPABASE_SERVICE_ROLE_KEY') or os.getenv('SUPABASE_KEY')
    
    if not supabase_url or not supabase_key:
        print("❌ Error: SUPABASE_URL and SUPABASE_SERVICE_ROLE_KEY environment variables required")
        sys.exit(1)
    
    supabase: Client = create_client(supabase_url, supabase_key)
    print(f"✅ Connected to Supabase")
    
    try:
        # Try to insert a test record to see what columns are expected
        test_record = {
            'company_name': 'TEST_COMPANY',
            'tab_type': 'balance_sheet'
        }
        
        response = supabase.table('diva_financial_statements').insert([test_record]).execute()
        
        if response.data:
            print("✅ Basic insert successful")
            
            # Get the inserted record to see the schema
            response = supabase.table('diva_financial_statements').select('*').eq('company_name', 'TEST_COMPANY').execute()
            
            if response.data:
                record = response.data[0]
                print(f"\n📋 AVAILABLE COLUMNS:")
                for column, value in record.items():
                    print(f"   - {column}: {type(value).__name__}")
                
                # Clean up test record
                supabase.table('diva_financial_statements').delete().eq('company_name', 'TEST_COMPANY').execute()
                print(f"\n✅ Test record cleaned up")
            
        return True
        
    except Exception as e:
        print(f"❌ Error checking schema: {str(e)}")
        
        # Try to get column info from error message
        if 'column' in str(e).lower():
            print(f"💡 Schema error suggests missing columns")
        
        return False

if __name__ == "__main__":
    success = check_financial_schema()
    if success:
        print(f"\n🎉 Schema check completed!")
    else:
        print(f"\n❌ Schema check failed") 