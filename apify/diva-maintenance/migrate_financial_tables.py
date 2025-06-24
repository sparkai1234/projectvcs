#!/usr/bin/env python3
"""
DIVA Financial Tables Migration Script
Fixes the critical financial statements corruption by:
1. Creating separate balance_sheets and income_statements tables
2. Migrating data from the corrupted diva_financial_statements table
3. Properly mapping fields based on the original dataset
"""

import os
import json
import sys
from supabase import create_client, Client
from datetime import datetime

def migrate_financial_tables():
    """Migrate corrupted financial data to separate tables"""
    print("🔄 === DIVA FINANCIAL TABLES MIGRATION ===")
    print("🎯 Objective: Fix corrupted financial statements data")
    
    # Initialize Supabase client
    supabase_url = os.getenv('SUPABASE_URL')
    supabase_key = os.getenv('SUPABASE_SERVICE_ROLE_KEY') or os.getenv('SUPABASE_KEY')
    
    if not supabase_url or not supabase_key:
        print("❌ Error: SUPABASE_URL and SUPABASE_SERVICE_ROLE_KEY environment variables required")
        sys.exit(1)
    
    supabase: Client = create_client(supabase_url, supabase_key)
    print(f"✅ Connected to Supabase")
    
    # Step 1: Load original dataset to get proper income statement data
    print("\n📂 Step 1: Loading original dataset...")
    dataset_path = "../diva-scraper-standalone/dataset_final-diva-scraper_2025-06-10_00-27-35-666.json"
    
    try:
        with open(dataset_path, 'r', encoding='utf-8') as f:
            data = json.load(f)
        print(f"✅ Loaded {len(data):,} records from original dataset")
    except Exception as e:
        print(f"❌ Error loading dataset: {e}")
        return False
    
    # Step 2: Create new tables (execute schema)
    print("\n🏗️ Step 2: Creating new financial tables...")
    
    # Read and execute schema
    try:
        with open('separate_financial_tables_schema.sql', 'r', encoding='utf-8') as f:
            schema_sql = f.read()
        
        # Note: Supabase Python client doesn't support raw SQL execution
        # User will need to run the schema manually in Supabase SQL editor
        print("⚠️ Please execute the schema in separate_financial_tables_schema.sql manually in Supabase")
        print("   Go to: Supabase Dashboard > SQL Editor > Run the schema file")
        
        # For now, assume tables exist and continue with data migration
        
    except Exception as e:
        print(f"⚠️ Schema file not found, assuming tables already exist: {e}")
    
    # Step 3: Extract and separate the data
    print("\n📊 Step 3: Processing original dataset...")
    
    # Filter records by type
    balance_records = [record for record in data if record.get('dataType') == 'financial_statements_balance']
    income_records = [record for record in data if record.get('dataType') == 'financial_statements_income']
    
    print(f"   📋 Balance Sheet records: {len(balance_records)}")
    print(f"   📋 Income Statement records: {len(income_records)}")
    
    # Step 4: Process Balance Sheet records
    print("\n💰 Step 4: Processing Balance Sheet data...")
    balance_processed = []
    balance_companies_seen = set()
    
    for record in balance_records:
        company_name = record.get('column_0')
        
        # Skip if no company name
        if not company_name or not company_name.strip():
            continue
            
        # Skip if already processed this company (deduplication)
        if company_name in balance_companies_seen:
            print(f"   ⚠️ Skipping duplicate balance sheet for: {company_name}")
            continue
            
        balance_companies_seen.add(company_name)
        
        processed_record = {
            'company_name': company_name,
            'financial_resources': record.get('column_1'),
            'settlement_month': record.get('column_2'),
            'accounting_standards': record.get('column_3'),
            'financial_classification': record.get('column_4'),
            'total_assets': clean_numeric_value(record.get('column_5')),
            'startup_investment_assets': clean_numeric_value(record.get('column_6')),
            'total_liabilities': clean_numeric_value(record.get('column_7')),
            'paid_in_capital': clean_numeric_value(record.get('column_8')),
            'total_equity': clean_numeric_value(record.get('column_9')),
            'source_url': record.get('dataSource', 'financial_statements_balance'),
            'extracted_at': record.get('extractedAt'),
            'data_year': 2024
        }
        
        balance_processed.append(processed_record)
    
    print(f"   ✅ Processed {len(balance_processed)} unique balance sheet records")
    
    # Step 5: Process Income Statement records  
    print("\n📈 Step 5: Processing Income Statement data...")
    income_processed = []
    income_companies_seen = set()
    
    for record in income_records:
        company_name = record.get('column_0')
        
        # Skip if no company name
        if not company_name or not company_name.strip():
            continue
            
        # Skip if already processed this company (deduplication)
        if company_name in income_companies_seen:
            print(f"   ⚠️ Skipping duplicate income statement for: {company_name}")
            continue
            
        income_companies_seen.add(company_name)
        
        processed_record = {
            'company_name': company_name,
            'financial_resources': record.get('column_1'),
            'settlement_month': record.get('column_2'),
            'accounting_standards': record.get('column_3'),
            'financial_classification': record.get('column_4'),
            'operating_revenue': clean_numeric_value(record.get('column_5')),
            'operating_expenses': clean_numeric_value(record.get('column_6')),
            'operating_profit': clean_numeric_value(record.get('column_7')),
            'net_income_before_taxes': clean_numeric_value(record.get('column_8')),
            'net_profit': clean_numeric_value(record.get('column_9')),
            'source_url': record.get('dataSource', 'financial_statements_income'),
            'extracted_at': record.get('extractedAt'),
            'data_year': 2024
        }
        
        income_processed.append(processed_record)
    
    print(f"   ✅ Processed {len(income_processed)} unique income statement records")
    
    # Step 6: Insert Balance Sheet data
    print("\n💾 Step 6: Inserting Balance Sheet data...")
    try:
        balance_inserted = 0
        batch_size = 100
        
        for i in range(0, len(balance_processed), batch_size):
            batch = balance_processed[i:i + batch_size]
            
            response = supabase.table('diva_balance_sheets').insert(batch).execute()
            
            if response.data:
                balance_inserted += len(response.data)
                print(f"   ✅ Inserted balance batch {i//batch_size + 1}: {len(response.data)} records")
            else:
                print(f"   ⚠️ Balance batch {i//batch_size + 1} failed")
        
        print(f"✅ Successfully inserted {balance_inserted}/{len(balance_processed)} balance sheet records")
        
    except Exception as e:
        print(f"❌ Error inserting balance sheets: {str(e)}")
        print("⚠️ Make sure the diva_balance_sheets table exists (run the schema first)")
    
    # Step 7: Insert Income Statement data
    print("\n💾 Step 7: Inserting Income Statement data...")
    try:
        income_inserted = 0
        batch_size = 100
        
        for i in range(0, len(income_processed), batch_size):
            batch = income_processed[i:i + batch_size]
            
            response = supabase.table('diva_income_statements').insert(batch).execute()
            
            if response.data:
                income_inserted += len(response.data)
                print(f"   ✅ Inserted income batch {i//batch_size + 1}: {len(response.data)} records")
            else:
                print(f"   ⚠️ Income batch {i//batch_size + 1} failed")
        
        print(f"✅ Successfully inserted {income_inserted}/{len(income_processed)} income statement records")
        
    except Exception as e:
        print(f"❌ Error inserting income statements: {str(e)}")
        print("⚠️ Make sure the diva_income_statements table exists (run the schema first)")
    
    # Step 8: Verification
    print("\n🔍 Step 8: Verification...")
    try:
        balance_count = supabase.table('diva_balance_sheets').select('*', count='exact').execute().count
        income_count = supabase.table('diva_income_statements').select('*', count='exact').execute().count
        
        print(f"📊 Final Counts:")
        print(f"   - Balance Sheets: {balance_count}")
        print(f"   - Income Statements: {income_count}")
        print(f"   - Total: {balance_count + income_count}")
        
        # Test a few sample records
        print("\n🔍 Sample Balance Sheet record:")
        balance_sample = supabase.table('diva_balance_sheets').select('company_name, total_assets, total_liabilities, total_equity').limit(1).execute()
        if balance_sample.data:
            sample = balance_sample.data[0]
            print(f"   Company: {sample['company_name']}")
            print(f"   Assets: {sample['total_assets']:,}" if sample['total_assets'] else "   Assets: None")
            print(f"   Liabilities: {sample['total_liabilities']:,}" if sample['total_liabilities'] else "   Liabilities: None")
            print(f"   Equity: {sample['total_equity']:,}" if sample['total_equity'] else "   Equity: None")
        
        print("\n🔍 Sample Income Statement record:")
        income_sample = supabase.table('diva_income_statements').select('company_name, operating_revenue, operating_profit, net_profit').limit(1).execute()
        if income_sample.data:
            sample = income_sample.data[0]
            print(f"   Company: {sample['company_name']}")
            print(f"   Revenue: {sample['operating_revenue']:,}" if sample['operating_revenue'] else "   Revenue: None")
            print(f"   Operating Profit: {sample['operating_profit']:,}" if sample['operating_profit'] else "   Operating Profit: None")
            print(f"   Net Profit: {sample['net_profit']:,}" if sample['net_profit'] else "   Net Profit: None")
        
        if balance_count > 0 and income_count > 0:
            print("\n🎉 SUCCESS: Financial tables migration completed!")
            print("✅ Data is now properly separated and structured")
            print("📊 Balance sheets contain asset/liability data")
            print("📈 Income statements contain revenue/profit data")
            return True
        else:
            print("\n❌ Migration incomplete - some tables are empty")
            return False
            
    except Exception as e:
        print(f"❌ Verification failed: {str(e)}")
        return False

def clean_numeric_value(value):
    """Clean and convert numeric values"""
    if not value:
        return None
    
    try:
        # Remove commas and convert to int
        if isinstance(value, str):
            cleaned = value.replace(',', '').replace(' ', '')
            if cleaned == '' or cleaned == '-' or cleaned == 'N/A':
                return None
            return int(float(cleaned))
        elif isinstance(value, (int, float)):
            return int(value)
        else:
            return None
    except (ValueError, TypeError):
        return None

if __name__ == "__main__":
    success = migrate_financial_tables()
    if not success:
        sys.exit(1) 