#!/usr/bin/env python3
"""
Debug script to check Supabase contacts_full table
Compare with Airtable data expectations
"""

from supabase import create_client, Client
from api_config import get_supabase_config
import json

def debug_supabase_contacts():
    print("🔍 Debugging Supabase contacts_full table...")
    
    # Initialize Supabase connection
    config = get_supabase_config(use_service_role=True)
    supabase: Client = create_client(config['url'], config['key'])
    
    # Check table structure
    print("\n📋 Checking table structure...")
    try:
        # Get first few records to see structure
        sample = supabase.table('contacts_full').select('*').limit(5).execute()
        
        if sample.data:
            print(f"✅ Sample record structure:")
            for key in sample.data[0].keys():
                print(f"   - {key}")
        else:
            print("❌ No data in contacts_full table")
            return
            
    except Exception as e:
        print(f"❌ Error accessing contacts_full: {e}")
        return
    
    # Check total count
    print("\n📊 Checking total contact counts...")
    try:
        # Total records
        total_response = supabase.table('contacts_full').select('id', count='exact').execute()
        total_count = total_response.count if hasattr(total_response, 'count') else len(total_response.data)
        print(f"📈 Total records in contacts_full: {total_count}")
        
        # Records with 회사 field
        company_response = supabase.table('contacts_full').select('id', count='exact').not_.is_('회사', 'null').execute()
        company_count = company_response.count if hasattr(company_response, 'count') else len(company_response.data)
        print(f"📈 Records with '회사' field: {company_count}")
        
        # Records with non-empty 회사 field
        nonempty_response = supabase.table('contacts_full').select('id', count='exact').neq('회사', '').execute()
        nonempty_count = nonempty_response.count if hasattr(nonempty_response, 'count') else len(nonempty_response.data)
        print(f"📈 Records with non-empty '회사': {nonempty_count}")
        
    except Exception as e:
        print(f"❌ Error counting records: {e}")
    
    # Check for different Korean column names
    print("\n🔤 Checking for alternative Korean column names...")
    try:
        # Try different possible Korean company field names
        alt_names = ['회사', '회사명', 'company', 'Company', '소속', '기업명', '직장']
        
        for col_name in alt_names:
            try:
                test_response = supabase.table('contacts_full').select(f'"{col_name}"').limit(1).execute()
                print(f"✅ Column '{col_name}' exists")
            except:
                print(f"❌ Column '{col_name}' does not exist")
                
    except Exception as e:
        print(f"❌ Error checking column names: {e}")
    
    # Sample data with company info
    print("\n📋 Sample contacts with company info:")
    try:
        sample_with_company = supabase.table('contacts_full').select('이름, "회사", 직책').not_.is_('회사', 'null').limit(10).execute()
        
        for i, record in enumerate(sample_with_company.data[:10], 1):
            name = record.get('이름', 'Unknown')
            company = record.get('회사', 'N/A')
            position = record.get('직책', 'N/A')
            print(f"{i:2d}. {name} | {company} | {position}")
            
    except Exception as e:
        print(f"❌ Error getting sample data: {e}")

if __name__ == "__main__":
    debug_supabase_contacts() 