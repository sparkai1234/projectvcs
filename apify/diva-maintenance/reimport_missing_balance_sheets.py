#!/usr/bin/env python3
"""
Re-import Missing Balance Sheet Data
Re-imports any balance sheet records that may have been incorrectly deleted
"""

import json
import os
from supabase import create_client, Client
from datetime import datetime
import sys

def reimport_missing_balance_sheets():
    """Re-import missing balance sheet data"""
    print("🔄 === RE-IMPORTING MISSING BALANCE SHEET DATA ===")
    
    # Initialize Supabase client
    supabase_url = os.getenv('SUPABASE_URL')
    supabase_key = os.getenv('SUPABASE_SERVICE_ROLE_KEY') or os.getenv('SUPABASE_KEY')
    
    if not supabase_url or not supabase_key:
        print("❌ Error: SUPABASE_URL and SUPABASE_SERVICE_ROLE_KEY environment variables required")
        sys.exit(1)
    
    supabase: Client = create_client(supabase_url, supabase_key)
    print(f"✅ Connected to Supabase")
    
    # Load dataset
    dataset_path = "../diva-scraper-standalone/dataset_final-diva-scraper_2025-06-10_00-27-35-666.json"
    
    try:
        with open(dataset_path, 'r', encoding='utf-8') as f:
            data = json.load(f)
        print(f"✅ Loaded {len(data):,} records from dataset")
    except Exception as e:
        print(f"❌ Error loading dataset: {e}")
        return False
    
    # Filter for balance sheet records only
    balance_records = [record for record in data if record.get('dataType') == 'financial_statements_balance']
    print(f"📊 Found {len(balance_records)} balance sheet records in dataset")
    
    if not balance_records:
        print("❌ No balance sheet records found in dataset")
        return False
    
    # Get existing balance sheet companies to avoid duplicates
    try:
        response = supabase.table('diva_financial_statements').select('company_name').eq('tab_type', 'balance_sheet').execute()
        existing_companies = set([row['company_name'].lower().strip() for row in response.data if row['company_name']])
        print(f"📋 Found {len(existing_companies)} existing balance sheet companies")
    except Exception as e:
        print(f"❌ Error checking existing companies: {e}")
        existing_companies = set()
    
    # Process and import missing balance sheet records
    processed_records = []
    skipped_count = 0
    
    for record in balance_records:
        company_name = record.get('column_0')
        if not company_name:
            continue
            
        # Check if this company already has a balance sheet
        if company_name.lower().strip() in existing_companies:
            skipped_count += 1
            continue
        
        processed_record = {
            'company_name': company_name,
            'financial_resources': record.get('column_1'),
            'settlement_month': record.get('column_2'),
            'accounting_standards': record.get('column_3'),
            'financial_classification': record.get('column_4'),
            'assets': clean_numeric_value(record.get('column_5')),
            'liabilities': clean_numeric_value(record.get('column_6')),
            'equity': clean_numeric_value(record.get('column_7')),
            'total_capital': clean_numeric_value(record.get('column_8')),
            'tab_type': 'balance_sheet',
            'source_url': record.get('dataSource', 'financial_statements_balance'),
            'extracted_at': record.get('extractedAt'),
            'data_year': datetime.now().year
        }
        
        processed_records.append(processed_record)
    
    print(f"📋 Processed {len(processed_records)} missing balance sheet records")
    print(f"⏭️ Skipped {skipped_count} existing companies")
    
    if not processed_records:
        print("✅ No missing balance sheet records to import - all companies already have balance sheets")
        return True
    
    try:
        # Import in batches
        batch_size = 100
        total_inserted = 0
        
        for i in range(0, len(processed_records), batch_size):
            batch = processed_records[i:i + batch_size]
            
            response = supabase.table('diva_financial_statements').insert(batch).execute()
            
            if response.data:
                total_inserted += len(response.data)
                print(f"  ✅ Inserted batch {i//batch_size + 1}: {len(response.data)} records")
            else:
                print(f"  ⚠️ Batch {i//batch_size + 1} failed")
        
        print(f"✅ Successfully imported {total_inserted}/{len(processed_records)} missing balance sheet records")
        
        # Verify the final import
        response = supabase.table('diva_financial_statements').select('*', count='exact').eq('tab_type', 'income_statement').execute()
        income_count = response.count
        
        response = supabase.table('diva_financial_statements').select('*', count='exact').eq('tab_type', 'balance_sheet').execute()
        balance_count = response.count
        
        print(f"\n📊 FINAL COUNTS:")
        print(f"   - Income statements: {income_count}")
        print(f"   - Balance sheets: {balance_count}")
        print(f"   - Total: {income_count + balance_count}")
        
        return True
        
    except Exception as e:
        print(f"❌ Error importing missing balance sheets: {str(e)}")
        return False

def clean_numeric_value(value):
    """Clean numeric values (remove commas, convert to appropriate type)"""
    if not value or value == '':
        return None
    
    try:
        cleaned = str(value).replace(',', '').replace(' ', '')
        if cleaned.isdigit():
            return int(cleaned)
        elif '.' in cleaned:
            return float(cleaned)
        else:
            return None
    except:
        return None

if __name__ == "__main__":
    success = reimport_missing_balance_sheets()
    if success:
        print(f"\n🎉 Missing balance sheet import completed successfully!")
    else:
        print(f"\n❌ Missing balance sheet import failed")
        sys.exit(1) 