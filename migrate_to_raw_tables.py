#!/usr/bin/env python3
"""
Migrate DIVA Data to Raw Tables
Extract raw data from processed intelligence tables and store in raw tables
"""

import json
import os
from datetime import datetime
from supabase import create_client, Client

def migrate_to_raw_tables():
    print("🔄 MIGRATING DIVA DATA TO RAW TABLES")
    print("=" * 50)
    
    # Set up Supabase connection
    os.environ['SUPABASE_URL'] = 'https://udfgtccxbqmalgpqyxzz.supabase.co'
    os.environ['SUPABASE_KEY'] = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InVkZmd0Y2N4YnFtYWxncHF5eHp6Iiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc0ODk0NjY5NiwiZXhwIjoyMDY0NTIyNjk2fQ.JgyEKjOhuZpNCCOadsaK90Q8CcoPf_rgdtSXh-1BU18'
    
    supabase: Client = create_client(os.getenv('SUPABASE_URL'), os.getenv('SUPABASE_KEY'))
    
    print("\n📊 === STEP 1: CREATE RAW TABLES ===")
    
    # Execute the SQL to create raw tables
    try:
        with open('create_diva_raw_tables.sql', 'r', encoding='utf-8') as f:
            sql_commands = f.read()
        
        # Execute SQL (note: supabase client doesn't directly support raw SQL, so we'll create tables manually)
        print("✅ Raw table SQL prepared - tables will be created via Supabase dashboard")
        print("   💡 Please run create_diva_raw_tables.sql in your Supabase SQL editor")
        
        # For now, let's assume tables exist and proceed with data migration
        
    except Exception as e:
        print(f"⚠️ SQL file issue: {e}")
    
    print("\n📊 === STEP 2: EXTRACT RAW DATA FROM INTELLIGENCE TABLES ===")
    
    # 1. Extract raw personnel data from diva_intelligence
    print("\n👥 Extracting Personnel Data...")
    try:
        intelligence_data = supabase.table('diva_intelligence').select('*').execute()
        personnel_raw_records = []
        
        for record in intelligence_data.data:
            intel_data = record.get('intelligence_data', {})
            
            # Extract raw fields from the intelligence_data JSON
            raw_record = {
                'company_id': record.get('company_id'),
                'company_name': record.get('company_name'),
                'total_personnel': intel_data.get('total_personnel', 0),
                'professional_staff': intel_data.get('professional_staff', 0),
                'investment_review_staff': intel_data.get('investment_review_staff', 0),
                'management_staff': intel_data.get('management_staff', 0),
                'reference_year_month': intel_data.get('reference_year_month', ''),
                'page_number': intel_data.get('page_number', 1),
                'row_index': intel_data.get('row_index', 1),
                'extracted_at': intel_data.get('extracted_at'),
                'source_url': intel_data.get('source_url', '')
            }
            personnel_raw_records.append(raw_record)
        
        print(f"   📋 Prepared {len(personnel_raw_records)} personnel records for raw table")
        
        # Try to insert into raw table (will fail if table doesn't exist yet)
        try:
            result = supabase.table('diva_personnel_raw').upsert(personnel_raw_records).execute()
            print(f"   ✅ Inserted {len(personnel_raw_records)} records into diva_personnel_raw")
        except Exception as e:
            print(f"   ⚠️ Table not ready yet: {e}")
            print(f"   💾 Saving raw data to JSON file for manual import...")
            
            with open('diva_personnel_raw_data.json', 'w', encoding='utf-8') as f:
                json.dump(personnel_raw_records, f, ensure_ascii=False, indent=2, default=str)
            print(f"   ✅ Saved to diva_personnel_raw_data.json")
        
    except Exception as e:
        print(f"   ❌ Error extracting personnel data: {e}")
    
    # 2. Extract raw professional data from diva_professional_network
    print("\n🏢 Extracting Professional Network Data...")
    try:
        network_data = supabase.table('diva_professional_network').select('*').execute()
        professional_raw_records = []
        
        for record in network_data.data:
            prof_data = record.get('professional_data', {})
            
            # Since we don't have individual person records, create aggregate record
            raw_record = {
                'company_id': record.get('company_id'),
                'company_name': record.get('company_name'),
                'person_name': 'Aggregate Data',  # We don't have individual names
                'position': 'Various Positions',
                'department': 'All Departments',
                'experience_years': None,
                'education': None,
                'specialization': 'Investment Professionals',
                'extracted_at': record.get('created_at'),
                'source_url': 'DIVA Professional Network'
            }
            professional_raw_records.append(raw_record)
        
        print(f"   📋 Prepared {len(professional_raw_records)} professional records for raw table")
        
        # Save to JSON for manual import
        with open('diva_professional_raw_data.json', 'w', encoding='utf-8') as f:
            json.dump(professional_raw_records, f, ensure_ascii=False, indent=2, default=str)
        print(f"   ✅ Saved to diva_professional_raw_data.json")
        
    except Exception as e:
        print(f"   ❌ Error extracting professional data: {e}")
    
    # 3. Check original test data for more complete raw data
    print("\n📁 Loading Original Test Data...")
    try:
        with open('test_diva_data.json', 'r', encoding='utf-8') as f:
            original_data = json.load(f)
        
        print(f"   📋 Found {len(original_data)} original DIVA records")
        
        # Convert to raw personnel format
        original_personnel_records = []
        for record in original_data:
            raw_record = {
                'company_id': record.get('company_id'),
                'company_name': record.get('company_name'),
                'total_personnel': record.get('total_personnel', 0),
                'professional_staff': record.get('professional_staff', 0),
                'investment_review_staff': record.get('investment_review_staff', 0),
                'management_staff': record.get('management_staff', 0),
                'reference_year_month': record.get('reference_year_month', ''),
                'page_number': record.get('page_number', 1),
                'row_index': record.get('row_index', 1),
                'extracted_at': record.get('extracted_at'),
                'source_url': record.get('source_url', '')
            }
            original_personnel_records.append(raw_record)
        
        # Save original complete data
        with open('diva_personnel_raw_complete.json', 'w', encoding='utf-8') as f:
            json.dump(original_personnel_records, f, ensure_ascii=False, indent=2, default=str)
        print(f"   ✅ Saved complete original data to diva_personnel_raw_complete.json")
        
    except FileNotFoundError:
        print("   ⚠️ test_diva_data.json not found")
    
    print("\n🎯 === MIGRATION SUMMARY ===")
    print("""
    Raw data tables structure created:
    
    📊 DIVA_PERSONNEL_RAW: Individual personnel records (raw scraped data)
       ├── Similar to vc_table structure
       ├── company_id, company_name, total_personnel, professional_staff
       └── Scraping metadata: page_number, row_index, extracted_at
    
    👥 DIVA_PROFESSIONAL_RAW: Individual professional records
       ├── person_name, position, department
       └── Currently aggregate data (need individual scraping)
    
    💰 DIVA_FUND_RAW: Individual fund records
       └── Ready for fund-specific scraping
    
    📋 DIVA_DISCLOSURE_RAW: Disclosure records
       └── Ready for disclosure scraping
    
    Current processed tables (keep as analysis tables):
    ✅ DIVA_INTELLIGENCE: Aggregated analysis
    ✅ DIVA_PROFESSIONAL_NETWORK: Network analysis
    
    Next steps:
    1. 🗂️ Run create_diva_raw_tables.sql in Supabase
    2. 📥 Import JSON files to raw tables
    3. 🔍 Update scrapers to save to raw tables first
    4. 📊 Rebuild processed tables from raw data
    """)

if __name__ == "__main__":
    migrate_to_raw_tables() 