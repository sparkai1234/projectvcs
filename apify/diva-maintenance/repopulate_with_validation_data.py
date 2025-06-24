"""
Repopulate Financial Tables with Validation Data
Uses the complete validation dataset to populate diva_balance_sheets and diva_income_statements
"""

import os
from supabase import create_client, Client
from complete_validation_dataset import all_balance_sheet_data, all_income_statement_data

# Supabase configuration
def get_supabase_client():
    """Initialize Supabase client"""
    SUPABASE_URL = os.getenv('SUPABASE_URL')
    SUPABASE_KEY = os.getenv('SUPABASE_ANON_KEY')
    
    if not SUPABASE_URL or not SUPABASE_KEY:
        print("❌ Missing Supabase credentials. Please check your environment variables.")
        return None
    
    return create_client(SUPABASE_URL, SUPABASE_KEY)

def clear_tables(supabase):
    """Clear existing data from both tables"""
    print("🗑️  Clearing existing data...")
    
    try:
        # Clear balance sheets
        balance_result = supabase.table('diva_balance_sheets').delete().neq('id', '00000000-0000-0000-0000-000000000000').execute()
        print(f"   ✅ Cleared diva_balance_sheets")
        
        # Clear income statements  
        income_result = supabase.table('diva_income_statements').delete().neq('id', '00000000-0000-0000-0000-000000000000').execute()
        print(f"   ✅ Cleared diva_income_statements")
        
        return True
    except Exception as e:
        print(f"   ❌ Error clearing tables: {str(e)}")
        return False

def insert_balance_sheets(supabase):
    """Insert balance sheet records with correct column names"""
    print(f"💰 Inserting {len(all_balance_sheet_data)} balance sheet records...")
    
    # Prepare records with correct column mapping
    records = []
    for record in all_balance_sheet_data:
        db_record = {
            'company_name': record['company_name'],
            'data_year': record['data_year'],  # Use data_year instead of fiscal_year
            'total_assets': record['total_assets'],
            'startup_investment_assets': record['startup_investment_assets'],
            'total_liabilities': record['total_liabilities'],
            'paid_in_capital': record['paid_in_capital'],
            'total_equity': record['total_equity']
        }
        records.append(db_record)
    
    try:
        # Insert all records
        result = supabase.table('diva_balance_sheets').insert(records).execute()
        print(f"   ✅ Successfully inserted {len(result.data)} balance sheet records")
        return len(result.data)
    except Exception as e:
        print(f"   ❌ Error inserting balance sheets: {str(e)}")
        return 0

def insert_income_statements(supabase):
    """Insert income statement records with correct column names"""
    print(f"📊 Inserting {len(all_income_statement_data)} income statement records...")
    
    # Prepare records with correct column mapping
    records = []
    for record in all_income_statement_data:
        db_record = {
            'company_name': record['company_name'],
            'data_year': record['data_year'],  # Use data_year instead of fiscal_year
            'operating_revenue': record['operating_revenue'],
            'operating_expenses': record['operating_expenses'],
            'operating_profit': record['operating_profit'],
            'net_income_before_taxes': record['net_income_before_taxes'],
            'net_profit': record['net_profit']
        }
        records.append(db_record)
    
    try:
        # Insert all records
        result = supabase.table('diva_income_statements').insert(records).execute()
        print(f"   ✅ Successfully inserted {len(result.data)} income statement records")
        return len(result.data)
    except Exception as e:
        print(f"   ❌ Error inserting income statements: {str(e)}")
        return 0

def verify_data(supabase):
    """Verify the inserted data"""
    print("🔍 Verifying inserted data...")
    
    try:
        # Check balance sheets
        balance_result = supabase.table('diva_balance_sheets').select('*').execute()
        balance_count = len(balance_result.data)
        print(f"   ✅ Balance sheets in database: {balance_count}")
        
        # Check income statements
        income_result = supabase.table('diva_income_statements').select('*').execute()
        income_count = len(income_result.data)
        print(f"   ✅ Income statements in database: {income_count}")
        
        # Show sample records if available
        if balance_count > 0:
            sample = balance_result.data[0]
            print(f"   📋 Sample balance sheet: {sample['company_name']} ({sample['data_year']}) - Assets: {sample['total_assets']:,}")
        
        if income_count > 0:
            sample = income_result.data[0]
            print(f"   📋 Sample income statement: {sample['company_name']} ({sample['data_year']}) - Revenue: {sample['operating_revenue']:,}")
        
        return balance_count, income_count
    except Exception as e:
        print(f"   ❌ Error verifying data: {str(e)}")
        return 0, 0

def main():
    """Main execution function"""
    print("🚀 DIVA Financial Tables Repopulation with Validation Data")
    print("=" * 70)
    
    # Initialize Supabase client
    supabase = get_supabase_client()
    if not supabase:
        return
    
    print(f"📊 Validation dataset summary:")
    print(f"   - Balance sheet records: {len(all_balance_sheet_data)}")
    print(f"   - Income statement records: {len(all_income_statement_data)}")
    print(f"   - Total records: {len(all_balance_sheet_data) + len(all_income_statement_data)}")
    print()
    
    # Step 1: Clear existing data
    if not clear_tables(supabase):
        print("❌ Failed to clear tables. Exiting.")
        return
    
    # Step 2: Insert new data
    balance_inserted = insert_balance_sheets(supabase)
    income_inserted = insert_income_statements(supabase)
    
    # Step 3: Verify results
    balance_verified, income_verified = verify_data(supabase)
    
    # Summary
    print("\n" + "=" * 70)
    print("📈 REPOPULATION SUMMARY")
    print("=" * 70)
    print(f"Balance Sheets: {balance_inserted} inserted, {balance_verified} verified")
    print(f"Income Statements: {income_inserted} inserted, {income_verified} verified")
    print(f"Total Records: {balance_inserted + income_inserted} inserted, {balance_verified + income_verified} verified")
    
    if balance_inserted == balance_verified and income_inserted == income_verified and balance_inserted > 0:
        print("✅ SUCCESS: All validation records inserted and verified correctly!")
        
        # Show some statistics
        print(f"\n📊 Dataset Statistics:")
        if balance_verified > 0:
            assets = [r['total_assets'] for r in all_balance_sheet_data]
            print(f"   Assets range: {min(assets):,} - {max(assets):,} KRW")
        if income_verified > 0:
            revenues = [r['operating_revenue'] for r in all_income_statement_data]
            print(f"   Revenue range: {min(revenues):,} - {max(revenues):,} KRW")
    else:
        print("⚠️  WARNING: Some records may not have been inserted correctly.")
    
    print("🎉 Financial tables repopulation complete!")

if __name__ == "__main__":
    main() 