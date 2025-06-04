#!/usr/bin/env python3
"""
Check Raw DIVA Data Structure
Analyze what raw data we have vs processed data
"""

import json
import os
from supabase import create_client, Client

def analyze_raw_vs_processed_data():
    print("🔍 ANALYZING RAW vs PROCESSED DATA STRUCTURE")
    print("=" * 50)
    
    # Set up Supabase connection
    os.environ['SUPABASE_URL'] = 'https://udfgtccxbqmalgpqyxzz.supabase.co'
    os.environ['SUPABASE_KEY'] = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InVkZmd0Y2N4YnFtYWxncHF5eHp6Iiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc0ODk0NjY5NiwiZXhwIjoyMDY0NTIyNjk2fQ.JgyEKjOhuZpNCCOadsaK90Q8CcoPf_rgdtSXh-1BU18'
    
    supabase: Client = create_client(os.getenv('SUPABASE_URL'), os.getenv('SUPABASE_KEY'))
    
    print("\n📊 === CURRENT DATA STRUCTURE ===")
    
    # 1. Check VC Table (should be raw data)
    print("\n🏢 1. VC_TABLE (Raw Data) ✅")
    vc_data = supabase.table('vc_table').select('*').limit(1).execute()
    if vc_data.data:
        sample = vc_data.data[0]
        print(f"   📋 Raw fields: {list(sample.keys())}")
        print(f"   📄 Sample: {sample.get('company_name')} | {sample.get('location')} | {sample.get('representative')}")
    
    # 2. Check Fund Table (should be raw data)
    print("\n💰 2. FUND_TABLE (Raw Data) ✅")
    fund_data = supabase.table('fund_table').select('*').limit(1).execute()
    if fund_data.data:
        sample = fund_data.data[0]
        print(f"   📋 Raw fields: {list(sample.keys())}")
        print(f"   📄 Sample: {sample.get('fund_name')} | {sample.get('fund_type')} | {sample.get('commitment_amount')}")
    
    # 3. Check DIVA Intelligence (processed data)
    print("\n🧠 3. DIVA_INTELLIGENCE (Processed Data) ⚠️")
    diva_intel = supabase.table('diva_intelligence').select('*').limit(1).execute()
    if diva_intel.data:
        sample = diva_intel.data[0]
        intel_data = sample.get('intelligence_data', {})
        print(f"   📋 Processed fields: {list(sample.keys())}")
        print(f"   📊 Intelligence data keys: {list(intel_data.keys())}")
        print(f"   📄 Sample: {sample.get('company_name')}")
        print(f"   ⚠️  ISSUE: This is processed/aggregated data, not raw scraped data")
    
    # 4. Check DIVA Professional Network (processed data)
    print("\n👥 4. DIVA_PROFESSIONAL_NETWORK (Processed Data) ⚠️")
    diva_network = supabase.table('diva_professional_network').select('*').limit(1).execute()
    if diva_network.data:
        sample = diva_network.data[0]
        prof_data = sample.get('professional_data', {})
        print(f"   📋 Processed fields: {list(sample.keys())}")
        print(f"   📊 Professional data keys: {list(prof_data.keys())}")
        print(f"   📄 Sample: {sample.get('company_name')}")
        print(f"   ⚠️  ISSUE: This is processed/aggregated data, not raw scraped data")
    
    # 5. Check Contacts Full (should be raw data)
    print("\n📞 5. CONTACTS_FULL (Raw Data) ✅")
    contacts_data = supabase.table('contacts_full').select('*').limit(1).execute()
    if contacts_data.data:
        sample = contacts_data.data[0]
        print(f"   📋 Raw fields: {list(sample.keys())}")
        print(f"   📄 Sample: {sample.get('이름')} | {sample.get('회사')} | {sample.get('직책')}")
    
    # 6. Load original test data to see what raw data we should have
    print("\n📁 === ORIGINAL RAW DATA ANALYSIS ===")
    try:
        with open('test_diva_data.json', 'r', encoding='utf-8') as f:
            original_data = json.load(f)
        
        if original_data:
            sample_original = original_data[0]
            print(f"\n📋 Original raw DIVA data fields:")
            for key, value in sample_original.items():
                print(f"   • {key}: {type(value).__name__} - {str(value)[:50]}{'...' if len(str(value)) > 50 else ''}")
            
            print(f"\n🎯 === WHAT WE'RE MISSING ===")
            print(f"❌ Missing: DIVA_PERSONNEL_RAW table with individual scraped records")
            print(f"❌ Missing: DIVA_FUND_RAW table with individual fund records")  
            print(f"❌ Missing: DIVA_DISCLOSURE_RAW table with disclosure records")
            print(f"❌ Missing: DIVA_PROFESSIONAL_RAW table with individual professional records")
            
    except FileNotFoundError:
        print("⚠️  test_diva_data.json not found - will check existing structure only")
    
    print(f"\n💡 === RECOMMENDED RAW DATA TABLES ===")
    print(f"""
    We should create these raw data tables to match the pattern of vc_table/fund_table:
    
    📊 DIVA_PERSONNEL_RAW:
       • company_id, company_name, total_personnel, professional_staff
       • investment_review_staff, management_staff, reference_year_month
       • page_number, row_index, extracted_at, source_url
    
    💰 DIVA_FUND_RAW:
       • company_id, fund_name, fund_type, establishment_date
       • commitment_amount, fund_status, investment_focus
       • extracted_at, source_url
    
    📋 DIVA_DISCLOSURE_RAW:
       • company_id, disclosure_type, investment_scale, location
       • business_area, investment_target, extracted_at
    
    👥 DIVA_PROFESSIONAL_RAW:
       • company_id, person_name, position, department
       • experience_years, education, specialization
       • extracted_at, source_url
    
    Then keep the current DIVA_INTELLIGENCE and DIVA_PROFESSIONAL_NETWORK 
    as processed/analysis tables that reference the raw tables.
    """)

if __name__ == "__main__":
    analyze_raw_vs_processed_data() 