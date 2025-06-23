#!/usr/bin/env python3
"""
Re-import Income Statement Data
Re-imports only the income statement records that were incorrectly deleted during maintenance
"""

import json
import os
from supabase import create_client, Client
from datetime import datetime
import sys

def reimport_income_statements():
    """Re-import income statement data that was incorrectly deleted"""
    print("🔄 === RE-IMPORTING INCOME STATEMENT DATA ===")
    
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
    
    # Filter for income statement records only
    income_records = [record for record in data if record.get('dataType') == 'financial_statements_income']
    print(f"📊 Found {len(income_records)} income statement records to re-import")
    
    if not income_records:
        print("❌ No income statement records found in dataset")
        return False
    
    # Process and import income statement records
    processed_records = []
    
    for record in income_records:
        processed_record = {
            'company_name': record.get('column_0'),
            'financial_resources': record.get('column_1'),
            'settlement_month': record.get('column_2'),
            'accounting_standards': record.get('column_3'),
            'financial_classification': record.get('column_4'),
            'operating_revenue': clean_numeric_value(record.get('column_5')),
            'operating_expenses': clean_numeric_value(record.get('column_6')),
            'operating_profit': clean_numeric_value(record.get('column_7')),
            'net_income_before_taxes': clean_numeric_value(record.get('column_8')),
            'net_profit': clean_numeric_value(record.get('column_9')),
            'tab_type': 'income_statement',
            'source_url': record.get('dataSource', 'financial_statements_income'),
            'extracted_at': record.get('extractedAt'),
            'data_year': datetime.now().year
        }
        
        # Only add if company name exists
        if processed_record['company_name']:
            processed_records.append(processed_record)
    
    print(f"📋 Processed {len(processed_records)} income statement records")
    
    if not processed_records:
        print("❌ No valid income statement records to import")
        return False
    
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
        
        print(f"✅ Successfully re-imported {total_inserted}/{len(processed_records)} income statement records")
        
        # Verify the import
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
        print(f"❌ Error re-importing income statements: {str(e)}")
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
    success = reimport_income_statements()
    if success:
        print(f"\n🎉 Income statement re-import completed successfully!")
    else:
        print(f"\n❌ Income statement re-import failed")
        sys.exit(1) 