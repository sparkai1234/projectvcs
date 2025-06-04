#!/usr/bin/env python3
"""
Populate Raw DIVA Tables with Extracted Data
Uses direct Supabase REST API to create tables and insert data
"""

import json
import os
import requests
from datetime import datetime

def create_raw_tables_via_api():
    """Create raw tables using Supabase RPC/SQL execution"""
    print("🔧 CREATING RAW TABLES VIA SUPABASE API")
    print("=" * 50)
    
    # Supabase connection details
    SUPABASE_URL = 'https://udfgtccxbqmalgpqyxzz.supabase.co'
    SUPABASE_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InVkZmd0Y2N4YnFtYWxncHF5eHp6Iiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc0ODk0NjY5NiwiZXhwIjoyMDY0NTIyNjk2fQ.JgyEKjOhuZpNCCOadsaK90Q8CcoPf_rgdtSXh-1BU18'
    
    headers = {
        'apikey': SUPABASE_KEY,
        'Authorization': f'Bearer {SUPABASE_KEY}',
        'Content-Type': 'application/json',
        'Prefer': 'return=minimal'
    }
    
    # SQL to create diva_personnel_raw table
    create_personnel_raw_sql = """
    CREATE TABLE IF NOT EXISTS diva_personnel_raw (
        id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
        company_id VARCHAR(50) NOT NULL,
        company_name VARCHAR(255) NOT NULL,
        total_personnel INTEGER DEFAULT 0,
        professional_staff INTEGER DEFAULT 0,
        investment_review_staff INTEGER DEFAULT 0,
        management_staff INTEGER DEFAULT 0,
        reference_year_month VARCHAR(20),
        page_number INTEGER,
        row_index INTEGER,
        extracted_at TIMESTAMP,
        source_url TEXT,
        created_at TIMESTAMP DEFAULT NOW(),
        updated_at TIMESTAMP DEFAULT NOW()
    );
    
    CREATE INDEX IF NOT EXISTS idx_diva_personnel_raw_company_id ON diva_personnel_raw(company_id);
    CREATE INDEX IF NOT EXISTS idx_diva_personnel_raw_company_name ON diva_personnel_raw(company_name);
    
    ALTER TABLE diva_personnel_raw 
    ADD CONSTRAINT IF NOT EXISTS unique_diva_personnel_company_period 
    UNIQUE (company_id, reference_year_month, page_number, row_index);
    """
    
    # Try to execute SQL via RPC
    try:
        print("📝 Creating diva_personnel_raw table...")
        rpc_url = f"{SUPABASE_URL}/rest/v1/rpc/exec_sql"
        rpc_data = {"sql": create_personnel_raw_sql}
        
        # Note: Supabase doesn't have exec_sql RPC by default
        # We'll need to create the table manually or use a different approach
        print("⚠️  Direct SQL execution not available via API")
        print("💡 Please run create_diva_raw_tables.sql manually in Supabase SQL editor")
        
    except Exception as e:
        print(f"❌ Error creating table: {e}")

def populate_raw_personnel_data():
    """Populate diva_personnel_raw table with extracted data"""
    print("\n📊 POPULATING RAW PERSONNEL DATA")
    print("=" * 50)
    
    from supabase import create_client, Client
    
    # Set up Supabase connection
    os.environ['SUPABASE_URL'] = 'https://udfgtccxbqmalgpqyxzz.supabase.co'
    os.environ['SUPABASE_KEY'] = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InVkZmd0Y2N4YnFtYWxncHF5eHp6Iiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc0ODk0NjY5NiwiZXhwIjoyMDY0NTIyNjk2fQ.JgyEKjOhuZpNCCOadsaK90Q8CcoPf_rgdtSXh-1BU18'
    
    supabase: Client = create_client(os.getenv('SUPABASE_URL'), os.getenv('SUPABASE_KEY'))
    
    # Load the complete raw data
    try:
        with open('diva_personnel_raw_complete.json', 'r', encoding='utf-8') as f:
            raw_data = json.load(f)
        
        print(f"📋 Loaded {len(raw_data)} raw personnel records")
        
        # Try to insert into diva_personnel_raw table
        try:
            print("📥 Inserting into diva_personnel_raw table...")
            result = supabase.table('diva_personnel_raw').upsert(raw_data).execute()
            print(f"✅ Successfully inserted {len(raw_data)} records into diva_personnel_raw")
            
            # Verify the data
            verification = supabase.table('diva_personnel_raw').select('*').execute()
            print(f"🔍 Verification: {len(verification.data)} records in diva_personnel_raw table")
            
            # Show sample
            if verification.data:
                sample = verification.data[0]
                print(f"📄 Sample record: {sample['company_name']} - {sample['total_personnel']} personnel")
            
        except Exception as e:
            print(f"❌ Error inserting data: {e}")
            print("💡 Table may not exist yet. Please create tables first using SQL editor.")
            
            # Alternative: Create CSV for manual import
            import csv
            print("📄 Creating CSV file for manual import...")
            
            csv_filename = 'diva_personnel_raw.csv'
            with open(csv_filename, 'w', newline='', encoding='utf-8') as csvfile:
                if raw_data:
                    fieldnames = raw_data[0].keys()
                    writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
                    writer.writeheader()
                    writer.writerows(raw_data)
                    print(f"✅ Created {csv_filename} for manual import")
        
    except FileNotFoundError:
        print("❌ diva_personnel_raw_complete.json not found")

def show_table_structure():
    """Show the recommended table structure"""
    print("\n🗂️  RECOMMENDED TABLE STRUCTURE")
    print("=" * 50)
    
    structure = """
    📊 Current Data Architecture:
    
    RAW DATA TABLES (Store original scraped data):
    ├── 🏢 vc_table          ✅ (Raw VC data from vcs.go.kr)
    ├── 💰 fund_table        ✅ (Raw fund data from vcs.go.kr)  
    ├── 📞 contacts_full     ✅ (Raw contact data)
    ├── 👥 diva_personnel_raw    ⚠️  (Needs creation - Raw DIVA personnel)
    ├── 💼 diva_fund_raw         ⚠️  (Needs creation - Raw DIVA funds)
    ├── 📋 diva_disclosure_raw   ⚠️  (Needs creation - Raw DIVA disclosures)
    └── 🎓 diva_professional_raw ⚠️  (Needs creation - Raw DIVA professionals)
    
    PROCESSED/ANALYSIS TABLES (Derived from raw data):
    ├── 🧠 diva_intelligence         ✅ (Aggregated intelligence)
    ├── 🔗 diva_professional_network ✅ (Network analysis)
    ├── 💡 diva_fund_intelligence    ✅ (Fund analysis)
    └── 🤝 contacts_matched          ✅ (Fuzzy matched contacts)
    
    📋 Raw DIVA Personnel Table Fields:
    • company_id (VARCHAR) - Links to vc_table
    • company_name (VARCHAR) - Company name
    • total_personnel (INTEGER) - Total staff count
    • professional_staff (INTEGER) - Professional staff count
    • investment_review_staff (INTEGER) - Investment review staff
    • management_staff (INTEGER) - Management staff
    • reference_year_month (VARCHAR) - Period (e.g., "2025-04")
    • page_number (INTEGER) - Source page number
    • row_index (INTEGER) - Row position on page
    • extracted_at (TIMESTAMP) - When scraped
    • source_url (TEXT) - Source URL
    • created_at/updated_at (TIMESTAMP) - Record timestamps
    
    🎯 Benefits:
    • Raw data preserved for reanalysis
    • Flexible querying and aggregation
    • Audit trail of original data
    • Consistent with vc_table/fund_table pattern
    """
    
    print(structure)

def main():
    print("🚀 SETTING UP RAW DIVA DATA TABLES")
    print("=" * 60)
    
    # Step 1: Show structure
    show_table_structure()
    
    # Step 2: Try to create tables (will show instructions if fails)
    create_raw_tables_via_api()
    
    # Step 3: Try to populate data (will create CSV if table doesn't exist)
    populate_raw_personnel_data()
    
    print("\n✅ === SETUP COMPLETE ===")
    print("""
    Next steps:
    1. 🗂️  Go to Supabase SQL Editor: https://supabase.com/dashboard/project/udfgtccxbqmalgpqyxzz/sql
    2. 📝 Run create_diva_raw_tables.sql to create the raw tables
    3. 📥 Import diva_personnel_raw.csv to diva_personnel_raw table
    4. 🔍 Verify data is correctly imported
    5. 🔄 Update scrapers to save to raw tables first, then build processed tables
    
    Your database will then have the same pattern:
    • vc_table (raw) → analysis tables
    • fund_table (raw) → analysis tables  
    • diva_personnel_raw (raw) → diva_intelligence (processed)
    """)

if __name__ == "__main__":
    main() 