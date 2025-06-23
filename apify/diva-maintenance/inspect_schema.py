#!/usr/bin/env python3
"""
DIVA Table Schema Inspector
Checks the actual column structure of DIVA tables in Supabase
"""

import os
from supabase import create_client, Client
import sys

def inspect_table_schema():
    """Inspect the schema of all DIVA tables"""
    print("🔍 === DIVA Table Schema Inspector ===")
    
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
    
    for table_name in tables:
        print(f"\n📊 {table_name}:")
        try:
            # Try to select one record to see the columns
            response = supabase.table(table_name).select('*').limit(1).execute()
            
            if response.data:
                print(f"  ✅ Table exists with {len(response.data)} sample records")
                if len(response.data) > 0:
                    sample_record = response.data[0]
                    print(f"  📋 Columns found ({len(sample_record)} total):")
                    for col_name, value in sample_record.items():
                        value_type = type(value).__name__
                        sample_val = str(value)[:50] if value else "None"
                        print(f"    - {col_name}: {value_type} (sample: {sample_val})")
                else:
                    print(f"  📋 Table exists but is empty")
            else:
                print(f"  📋 Table exists but is empty")
                
        except Exception as e:
            error_msg = str(e)
            if 'does not exist' in error_msg or 'relation' in error_msg:
                print(f"  ❌ Table does not exist")
            else:
                print(f"  ⚠️ Error accessing table: {error_msg}")
    
    print(f"\n✅ Schema inspection complete!")

if __name__ == "__main__":
    inspect_table_schema() 