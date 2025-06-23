#!/usr/bin/env python3
"""
Re-import ALL Financial Statement Records
Re-imports all 500 financial statement records including legitimate duplicates
"""

import json
import os
from supabase import create_client, Client
from datetime import datetime
import sys

def reimport_all_financial_records():
    """Re-import all financial statement records including duplicates"""
    print("🔄 === RE-IMPORTING ALL FINANCIAL STATEMENT RECORDS ===")
    
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
    
    # First, clear existing financial statements
    print("🗑️ Clearing existing financial statements...")
    try:
        response = supabase.table('diva_financial_statements').delete().neq('id', 0).execute()
        print(f"✅ Cleared existing financial statements")
    except Exception as e:
        print(f"❌ Error clearing table: {e}")
        return False
    
    # Filter for ALL financial statement records (balance + income)
    balance_records = [record for record in data if record.get('dataType') == 'financial_statements_balance']
    income_records = [record for record in data if record.get('dataType') == 'financial_statements_income']
    
    print(f"📊 Found {len(balance_records)} balance sheet records")
    print(f"📊 Found {len(income_records)} income statement records")
    print(f"📊 Total: {len(balance_records) + len(income_records)} financial records")
    
    # Process balance sheet records
    balance_processed = []
    for record in balance_records:
        processed_record = {
            'company_name': record.get('column_0'),
            'financial_resources': record.get('column_1'),
            'settlement_month': record.get('column_2'),
            'accounting_standards': record.get('column_3'),
            'financial_classification': record.get('column_4'),
            'assets': clean_numeric_value(record.get('column_5')),
            'liabilities': clean_numeric_value(record.get('column_6')),
            'capital': clean_numeric_value(record.get('column_7')),
            'paid_in_capital': clean_numeric_value(record.get('column_8')),
            'tab_type': 'balance_sheet',
            'source_url': record.get('dataSource', 'financial_statements_balance'),
            'extracted_at': record.get('extractedAt'),
            'data_year': datetime.now().year
        }
        
        if processed_record['company_name']:
            balance_processed.append(processed_record)
    
    # Process income statement records
    income_processed = []
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
        
        if processed_record['company_name']:
            income_processed.append(processed_record)
    
    all_records = balance_processed + income_processed
    print(f"📋 Processed {len(all_records)} total financial records (including duplicates)")
    
    try:
        # Import in batches
        batch_size = 100
        total_inserted = 0
        
        for i in range(0, len(all_records), batch_size):
            batch = all_records[i:i + batch_size]
            
            response = supabase.table('diva_financial_statements').insert(batch).execute()
            
            if response.data:
                total_inserted += len(response.data)
                print(f"  ✅ Inserted batch {i//batch_size + 1}: {len(response.data)} records")
            else:
                print(f"  ⚠️ Batch {i//batch_size + 1} failed")
        
        print(f"✅ Successfully imported {total_inserted}/{len(all_records)} financial statement records")
        
        # Verify the import
        response = supabase.table('diva_financial_statements').select('*', count='exact').eq('tab_type', 'income_statement').execute()
        income_count = response.count
        
        response = supabase.table('diva_financial_statements').select('*', count='exact').eq('tab_type', 'balance_sheet').execute()
        balance_count = response.count
        
        print(f"\n📊 FINAL COUNTS:")
        print(f"   - Income statements: {income_count}")
        print(f"   - Balance sheets: {balance_count}")
        print(f"   - Total: {income_count + balance_count}")
        
        if (income_count + balance_count) == 500:
            print(f"🎉 SUCCESS: All 500 financial statement records imported!")
        else:
            print(f"⚠️ Expected 500, got {income_count + balance_count}")
        
        return True
        
    except Exception as e:
        print(f"❌ Error importing financial statements: {str(e)}")
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
    success = reimport_all_financial_records()
    if success:
        print(f"\n🎉 Complete financial statement re-import completed successfully!")
    else:
        print(f"\n❌ Complete financial statement re-import failed")
        sys.exit(1) 