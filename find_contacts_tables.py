#!/usr/bin/env python3
"""
🔍 Find ALL Contact Tables in Supabase Database
Check multiple possible table names and IDs
"""

from api_config import get_supabase_config
from supabase import create_client, Client
import requests

def check_all_possible_contact_tables():
    """Check all possible contact table variations"""
    print("🔍 SEARCHING ALL POSSIBLE CONTACT TABLES")
    print("=" * 60)
    
    config = get_supabase_config(use_service_role=True)
    supabase: Client = create_client(config['url'], config['key'])
    
    # List of possible table names based on different patterns
    possible_tables = [
        'contacts_full',
        'contacts',
        'contact_full', 
        'contact',
        'contacts_matched',
        'contacts_korea',
        'contacts_korean',
        'airtable_contacts',
        'business_contacts',
        'korean_contacts',
        'diva_contacts',
        'vc_contacts',
        'professional_contacts',
        'full_contacts',
        'contact_database',
        'contact_data',
        'migration_contacts',
        'imported_contacts',
        'all_contacts'
    ]
    
    found_tables = []
    
    for table_name in possible_tables:
        try:
            print(f"🔍 Checking table: '{table_name}'...", end=" ")
            result = supabase.table(table_name).select('*').limit(1).execute()
            
            if result.data is not None:
                # Get total count
                count_result = supabase.table(table_name).select('id').execute()
                total_count = len(count_result.data) if count_result.data else 0
                
                if total_count > 0:
                    print(f"✅ FOUND! {total_count:,} records")
                    
                    # Show sample data
                    sample = result.data[0] if result.data else {}
                    found_tables.append({
                        'name': table_name,
                        'count': total_count,
                        'sample': sample
                    })
                    
                    # Show sample fields
                    if sample:
                        print(f"   📄 Sample fields: {list(sample.keys())[:10]}...")
                        if sample.get('이름'):
                            print(f"   📋 Korean data: 이름='{sample.get('이름', 'N/A')}', 회사='{sample.get('회사', 'N/A')}'")
                else:
                    print("📭 Empty")
            else:
                print("❌ Not found")
                
        except Exception as e:
            if "does not exist" in str(e).lower():
                print("❌ Not found")
            else:
                print(f"❌ Error: {str(e)[:30]}...")
    
    return found_tables

def check_table_by_url_patterns():
    """Check tables that might correspond to Supabase dashboard URLs"""
    print(f"\n🔍 CHECKING TABLES BY DASHBOARD URL PATTERNS")
    print("=" * 60)
    
    config = get_supabase_config(use_service_role=True)
    supabase: Client = create_client(config['url'], config['key'])
    
    # Based on URLs: 17570, 17555, 17600
    # These might be internal Supabase table IDs, not directly accessible
    
    # Try to access all tables via PostgREST schema introspection
    try:
        print("📋 Attempting to list all tables via PostgREST...")
        
        # Use direct PostgREST endpoint
        headers = {
            'apikey': config['key'],
            'Authorization': f'Bearer {config["key"]}',
            'Content-Type': 'application/json'
        }
        
        # This endpoint might show available tables
        url = f"{config['url']}/rest/v1/"
        response = requests.get(url, headers=headers)
        
        if response.status_code == 200:
            print("✅ PostgREST accessible")
            # Try to determine what tables are available
            
            # Check if there are any tables with 17K+ records
            all_tables = ['contacts_full', 'contacts', 'contact', 'vc_table', 'fund_table']
            for table in all_tables:
                try:
                    result = supabase.table(table).select('id').execute()
                    if result.data:
                        count = len(result.data)
                        if count > 10000:  # Look for large tables
                            print(f"🎯 LARGE TABLE FOUND: '{table}' with {count:,} records!")
                except:
                    pass
        else:
            print(f"❌ PostgREST error: {response.status_code}")
            
    except Exception as e:
        print(f"❌ Schema introspection failed: {e}")

def check_with_different_schemas():
    """Check if contacts are in different schemas"""
    print(f"\n🔍 CHECKING DIFFERENT SCHEMAS")
    print("=" * 60)
    
    config = get_supabase_config(use_service_role=True)
    supabase: Client = create_client(config['url'], config['key'])
    
    # Try accessing with explicit schema
    try:
        # Some possible schema patterns
        schemas = ['public', 'auth', 'storage', 'realtime']
        
        for schema in schemas:
            print(f"🔍 Checking schema '{schema}'...")
            # Note: Supabase Python client typically uses 'public' schema
            # Direct schema access might not be possible via the client
            
    except Exception as e:
        print(f"❌ Schema check failed: {e}")

def search_for_korean_data():
    """Search for any table containing Korean contact data"""
    print(f"\n🔍 SEARCHING FOR KOREAN DATA PATTERNS")
    print("=" * 60)
    
    config = get_supabase_config(use_service_role=True)
    supabase: Client = create_client(config['url'], config['key'])
    
    # Check all known tables for Korean data patterns
    all_possible_tables = [
        'contacts_full', 'contacts', 'contact', 'vc_table', 'fund_table',
        'diva_intelligence', 'diva_professional_network', 'diva_fund_intelligence'
    ]
    
    korean_data_found = []
    
    for table_name in all_possible_tables:
        try:
            print(f"🔍 Scanning '{table_name}' for Korean data...", end=" ")
            result = supabase.table(table_name).select('*').limit(5).execute()
            
            if result.data:
                korean_records = []
                for record in result.data:
                    # Look for Korean text patterns
                    for key, value in record.items():
                        if isinstance(value, str) and any(ord(char) >= 0x1100 and ord(char) <= 0x11FF or 
                                                         ord(char) >= 0x3130 and ord(char) <= 0x318F or
                                                         ord(char) >= 0xAC00 and ord(char) <= 0xD7AF for char in value):
                            korean_records.append(record)
                            break
                
                if korean_records:
                    total_result = supabase.table(table_name).select('id').execute()
                    total_count = len(total_result.data) if total_result.data else 0
                    
                    print(f"✅ KOREAN DATA! {len(korean_records)}/5 samples, {total_count:,} total")
                    korean_data_found.append({
                        'table': table_name,
                        'korean_samples': len(korean_records),
                        'total_count': total_count,
                        'sample': korean_records[0]
                    })
                    
                    # Show sample Korean data
                    sample = korean_records[0]
                    for key, value in sample.items():
                        if isinstance(value, str) and len(value) > 0:
                            print(f"   📋 {key}: '{value[:30]}'")
                            if len([k for k, v in sample.items() if k in ['이름', '회사', '전화번호', '이메일']]) > 0:
                                break
                else:
                    print("❌ No Korean data")
            else:
                print("❌ Empty or not accessible")
                
        except Exception as e:
            print(f"❌ Error: {str(e)[:30]}...")
    
    return korean_data_found

def main():
    """Main search function"""
    print("🔍 COMPREHENSIVE CONTACT TABLE SEARCH")
    print("=" * 70)
    
    # Search all possible table names
    found_tables = check_all_possible_contact_tables()
    
    # Check URL patterns
    check_table_by_url_patterns()
    
    # Check different schemas
    check_with_different_schemas()
    
    # Search for Korean data
    korean_tables = search_for_korean_data()
    
    # Summary
    print(f"\n📋 SEARCH SUMMARY")
    print("=" * 50)
    
    if found_tables:
        print(f"✅ FOUND {len(found_tables)} contact table(s):")
        for table in found_tables:
            print(f"   📊 {table['name']}: {table['count']:,} records")
    else:
        print("❌ No contact tables found with standard names")
    
    if korean_tables:
        print(f"\n🇰🇷 KOREAN DATA FOUND IN {len(korean_tables)} table(s):")
        for table in korean_tables:
            print(f"   📊 {table['table']}: {table['total_count']:,} records with Korean data")
            
        # Check if any table has ~17K records
        large_korean_tables = [t for t in korean_tables if t['total_count'] > 15000]
        if large_korean_tables:
            print(f"\n🎯 LIKELY MIGRATION TARGET:")
            for table in large_korean_tables:
                print(f"   ✅ {table['table']}: {table['total_count']:,} records (matches migration count!)")
    else:
        print("❌ No Korean contact data found in any table")
    
    if not found_tables and not korean_tables:
        print(f"\n❓ POSSIBLE ISSUES:")
        print(f"   1. Data went to unexpected table name")
        print(f"   2. Migration had silent failures")
        print(f"   3. Data is in different schema")
        print(f"   4. RLS blocking all access")

if __name__ == "__main__":
    main() 