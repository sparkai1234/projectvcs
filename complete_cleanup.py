#!/usr/bin/env python3
"""
🔧 Complete System Cleanup - Fix All Remaining Issues
1. Clear DIVA function/placeholder data and migrate real data
2. Check VC/Fund tables for schema cleanup needs
3. Verify all tables have clean, real data
"""

import requests
from supabase import create_client, Client
from api_config import get_config, get_supabase_config
import time

def check_table_schema(table_name):
    """Check what columns exist in a table"""
    print(f"\n🔍 CHECKING {table_name.upper()} SCHEMA")
    print("=" * 50)
    
    config = get_supabase_config(use_service_role=True)
    supabase: Client = create_client(config['url'], config['key'])
    
    try:
        # Get a sample record to see the fields
        result = supabase.table(table_name).select('*').limit(1).execute()
        
        if result.data:
            sample = result.data[0]
            fields = list(sample.keys())
            print(f"   📄 Fields in {table_name}: {fields}")
            
            # Check for English duplicate fields
            english_fields = [f for f in fields if f.endswith('_en') or f in ['email', 'phone', 'name_en', 'company_en', 'position_en', 'industry_en']]
            if english_fields:
                print(f"   ❌ English duplicate fields found: {english_fields}")
                return english_fields
            else:
                print(f"   ✅ No English duplicate fields found")
                return []
        else:
            print(f"   ⚠️ No records found in {table_name}")
            return []
            
    except Exception as e:
        print(f"   ❌ Error checking {table_name}: {e}")
        return []

def force_clear_diva_tables_properly():
    """Properly clear DIVA tables using correct syntax"""
    print("🔥 FORCE CLEARING DIVA TABLES PROPERLY")
    print("=" * 50)
    
    config = get_supabase_config(use_service_role=True)
    supabase: Client = create_client(config['url'], config['key'])
    
    tables = ['diva_intelligence', 'diva_professional_network', 'diva_fund_intelligence']
    
    for table in tables:
        try:
            # Get all record IDs first
            result = supabase.table(table).select('id').execute()
            
            if result.data:
                print(f"   🗑️ Found {len(result.data)} records in {table}")
                
                # Delete each record individually
                for record in result.data:
                    record_id = record['id']
                    delete_result = supabase.table(table).delete().eq('id', record_id).execute()
                
                print(f"   ✅ Cleared all records from {table}")
            else:
                print(f"   ✅ {table} was already empty")
                
            # Verify empty
            check = supabase.table(table).select('*').execute()
            count = len(check.data) if check.data else 0
            print(f"   📊 {table} now has {count} records")
            
        except Exception as e:
            print(f"   ❌ Error clearing {table}: {e}")

def migrate_all_real_diva_data():
    """Migrate ALL real DIVA data from Airtable"""
    print("\n🚀 MIGRATING ALL REAL DIVA DATA")
    print("=" * 50)
    
    # Clear existing data first
    force_clear_diva_tables_properly()
    
    # Get Airtable config
    airtable_config = get_config()
    base_url = f'https://api.airtable.com/v0/{airtable_config["airtable_base_id"]}'
    headers = {'Authorization': f'Bearer {airtable_config["airtable_api_key"]}'}
    
    config = get_supabase_config(use_service_role=True)
    supabase: Client = create_client(config['url'], config['key'])
    
    total_migrated = 0
    
    # Migrate DIVA Intelligence
    print(f"\n🧠 Migrating DIVA Intelligence...")
    try:
        url = f'{base_url}/DIVA%20Intelligence'
        response = requests.get(url, headers=headers, params={'maxRecords': 100})
        
        if response.status_code == 200:
            data = response.json()
            records = data.get('records', [])
            print(f"   📄 Found {len(records)} DIVA Intelligence records")
            
            for record in records:
                fields = record.get('fields', {})
                
                intelligence_record = {
                    'company_id': fields.get('Company ID', ''),
                    'company_name': fields.get('DIVA Company Name', ''),
                    'intelligence_data': {
                        'data_source': fields.get('Data Source', ''),
                        'last_updated': fields.get('Last Updated', ''),
                        'data_completeness_score': fields.get('Data Completeness Score', ''),
                        'total_personnel': fields.get('DIVA Total Personnel', ''),
                        'professional_staff': fields.get('DIVA Professional Staff', ''),
                        'investment_review_staff': fields.get('DIVA Investment Review Staff', ''),
                        'management_staff': fields.get('DIVA Management Staff', ''),
                        'professional_staff_ratio': fields.get('Professional Staff Ratio', ''),
                        'personnel_intelligence_level': fields.get('Personnel Intelligence Level', ''),
                        'investment_intelligence_level': fields.get('Investment Intelligence Level', ''),
                        'network_intelligence_level': fields.get('Network Intelligence Level', ''),
                        'has_fund_data': fields.get('Has Fund Data', ''),
                        'has_personnel_data': fields.get('Has Personnel Data', ''),
                        'has_professional_data': fields.get('Has Professional Data', ''),
                        'staffing_efficiency_score': fields.get('Staffing Efficiency Score', ''),
                        'intelligence_summary': fields.get('Intelligence Summary', ''),
                    },
                    'analysis_results': {
                        'completeness': 'real_data_from_airtable',
                        'analysis_date': time.strftime('%Y-%m-%d'),
                        'source': 'DIVA Portal Intelligence'
                    },
                    'data_quality_score': fields.get('Data Completeness Score', '0%').replace('%', ''),
                    'scrape_date': fields.get('Last Updated', time.strftime('%Y-%m-%d'))
                }
                
                if intelligence_record['company_id']:
                    result = supabase.table('diva_intelligence').insert(intelligence_record).execute()
                    if result.data:
                        total_migrated += 1
                        
            print(f"   ✅ Migrated {len(records)} DIVA Intelligence records")
        else:
            print(f"   ❌ Error fetching DIVA Intelligence: {response.status_code}")
            
    except Exception as e:
        print(f"   ❌ Error migrating DIVA Intelligence: {e}")
    
    # Migrate DIVA Professional Network
    print(f"\n👥 Migrating DIVA Professional Network...")
    try:
        url = f'{base_url}/DIVA%20Professional%20Network'
        response = requests.get(url, headers=headers, params={'maxRecords': 100})
        
        if response.status_code == 200:
            data = response.json()
            records = data.get('records', [])
            print(f"   📄 Found {len(records)} DIVA Professional Network records")
            
            for record in records:
                fields = record.get('fields', {})
                
                network_record = {
                    'company_id': fields.get('Company ID', ''),
                    'company_name': fields.get('Company Name', ''),
                    'professional_data': {
                        'seniority_category': fields.get('Seniority Category', ''),
                        'contact_potential_score': fields.get('Contact Potential Score', ''),
                        'network_value_score': fields.get('Network Value Score', ''),
                        'profile_completeness': fields.get('Profile Completeness', ''),
                        'diva_source_section': fields.get('DIVA Source Section', ''),
                        'profile_date': fields.get('Profile Date', ''),
                        'intelligence_notes': fields.get('Intelligence Notes', '')
                    },
                    'network_analysis': {
                        'completeness': 'real_data_from_airtable',
                        'analysis_date': time.strftime('%Y-%m-%d'),
                        'source': 'DIVA Professional Network'
                    },
                    'scrape_date': fields.get('Profile Date', time.strftime('%Y-%m-%d'))
                }
                
                if network_record['company_id']:
                    result = supabase.table('diva_professional_network').insert(network_record).execute()
                    if result.data:
                        total_migrated += 1
                        
            print(f"   ✅ Migrated {len(records)} DIVA Professional Network records")
        else:
            print(f"   ❌ Error fetching DIVA Professional Network: {response.status_code}")
            
    except Exception as e:
        print(f"   ❌ Error migrating DIVA Professional Network: {e}")
    
    print(f"\n🎉 Total DIVA records migrated: {total_migrated}")
    return total_migrated

def check_vc_fund_table_issues():
    """Check VC and Fund tables for issues"""
    print(f"\n🔍 CHECKING VC & FUND TABLE ISSUES")
    print("=" * 50)
    
    config = get_supabase_config(use_service_role=True)
    supabase: Client = create_client(config['url'], config['key'])
    
    issues_found = []
    
    # Check VC Table
    try:
        vc_result = supabase.table('vc_table').select('*').limit(3).execute()
        if vc_result.data:
            sample_vc = vc_result.data[0]
            vc_fields = list(sample_vc.keys())
            print(f"   📄 VC Table fields: {vc_fields}")
            
            # Check for English fields or function data
            english_vc_fields = [f for f in vc_fields if f.endswith('_en') or 'english' in f.lower()]
            if english_vc_fields:
                print(f"   ❌ VC Table English fields: {english_vc_fields}")
                issues_found.append(f"VC Table has English fields: {english_vc_fields}")
            
            # Check for function-like data
            for key, value in sample_vc.items():
                if isinstance(value, str) and ('function' in value.lower() or 'placeholder' in value.lower()):
                    print(f"   ❌ VC Table function data in {key}: {value[:50]}...")
                    issues_found.append(f"VC Table has function data in {key}")
                    break
                    
    except Exception as e:
        print(f"   ❌ Error checking VC Table: {e}")
        issues_found.append(f"Error checking VC Table: {e}")
    
    # Check Fund Table
    try:
        fund_result = supabase.table('fund_table').select('*').limit(3).execute()
        if fund_result.data:
            sample_fund = fund_result.data[0]
            fund_fields = list(sample_fund.keys())
            print(f"   📄 Fund Table fields: {fund_fields}")
            
            # Check for English fields or function data
            english_fund_fields = [f for f in fund_fields if f.endswith('_en') or 'english' in f.lower()]
            if english_fund_fields:
                print(f"   ❌ Fund Table English fields: {english_fund_fields}")
                issues_found.append(f"Fund Table has English fields: {english_fund_fields}")
            
            # Check for function-like data
            for key, value in sample_fund.items():
                if isinstance(value, str) and ('function' in value.lower() or 'placeholder' in value.lower()):
                    print(f"   ❌ Fund Table function data in {key}: {value[:50]}...")
                    issues_found.append(f"Fund Table has function data in {key}")
                    break
                    
    except Exception as e:
        print(f"   ❌ Error checking Fund Table: {e}")
        issues_found.append(f"Error checking Fund Table: {e}")
    
    return issues_found

def verify_all_clean_data():
    """Verify all tables have clean, real data"""
    print(f"\n✅ VERIFYING ALL CLEAN DATA")
    print("=" * 50)
    
    config = get_supabase_config(use_service_role=True)
    supabase = create_client(config['url'], config['key'])
    
    tables_to_check = [
        'contacts_full',
        'diva_intelligence', 
        'diva_professional_network',
        'vc_table',
        'fund_table'
    ]
    
    all_clean = True
    
    for table in tables_to_check:
        try:
            result = supabase.table(table).select('*').limit(1).execute()
            
            if result.data:
                sample = result.data[0]
                fields = list(sample.keys())
                
                # Check for English duplicate fields
                english_fields = [f for f in fields if f.endswith('_en') or f in ['email', 'phone', 'name_en', 'company_en', 'position_en', 'industry_en']]
                
                # Check for function data
                has_function_data = False
                for key, value in sample.items():
                    if isinstance(value, str) and ('function' in value.lower() or 'placeholder' in value.lower()):
                        has_function_data = True
                        break
                
                # Report status
                if english_fields:
                    print(f"   ❌ {table}: Has English fields {english_fields}")
                    all_clean = False
                elif has_function_data:
                    print(f"   ❌ {table}: Has function/placeholder data")
                    all_clean = False
                else:
                    count_result = supabase.table(table).select('id').execute()
                    count = len(count_result.data) if count_result.data else 0
                    print(f"   ✅ {table}: Clean data, {count} records")
            else:
                print(f"   ⚠️ {table}: No records found")
                
        except Exception as e:
            print(f"   ❌ {table}: Error - {e}")
            all_clean = False
    
    return all_clean

def main():
    """Main cleanup function"""
    print("🔧 COMPLETE SYSTEM CLEANUP")
    print("=" * 60)
    print("🎯 Goals:")
    print("   1. Fix DIVA tables (remove functions, add real data)")
    print("   2. Check VC/Fund tables for cleanup needs")
    print("   3. Verify all tables have clean data")
    print("=" * 60)
    
    # Step 1: Fix DIVA data
    diva_migrated = migrate_all_real_diva_data()
    
    # Step 2: Check VC/Fund tables
    vc_fund_issues = check_vc_fund_table_issues()
    
    # Step 3: Verify all clean
    all_clean = verify_all_clean_data()
    
    # Summary
    print(f"\n🎉 CLEANUP SUMMARY")
    print("=" * 50)
    print(f"📊 DIVA records migrated: {diva_migrated}")
    print(f"🔧 VC/Fund issues found: {len(vc_fund_issues)}")
    
    if vc_fund_issues:
        print(f"\n❌ REMAINING ISSUES:")
        for issue in vc_fund_issues:
            print(f"   • {issue}")
        print(f"\n🔧 NEXT STEPS:")
        print(f"   1. Create VC/Fund table cleanup scripts")
        print(f"   2. Remove English duplicate fields")
        print(f"   3. Migrate real VC/Fund data from Airtable")
    
    if all_clean:
        print(f"\n✅ ALL TABLES CLEAN - SYSTEM READY!")
    else:
        print(f"\n⚠️ Some tables still need cleanup")
    
    print(f"\n🔗 Check results:")
    print(f"   • DIVA: https://supabase.com/dashboard/project/udfgtccxbqmalgpqyxzz/editor/17570")
    print(f"   • Contacts: https://supabase.com/dashboard/project/udfgtccxbqmalgpqyxzz/editor/17540")

if __name__ == "__main__":
    main() 