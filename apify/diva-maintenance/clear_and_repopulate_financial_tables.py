"""
Clear and Repopulate Financial Tables
Safely clears existing financial tables and repopulates with properly separated data
"""

import os
import json
from supabase import create_client, Client
from dotenv import load_dotenv

# Load environment variables
load_dotenv('../../.env')

# Initialize Supabase client
url = os.environ.get("SUPABASE_URL")
key = os.environ.get("SUPABASE_SERVICE_ROLE_KEY")

# Debug: Check if environment variables are loaded
print(f"SUPABASE_URL loaded: {'Yes' if url else 'No'}")
print(f"SUPABASE_SERVICE_ROLE_KEY loaded: {'Yes' if key else 'No'}")

if not url or not key:
    print("❌ Environment variables not found. Please check .env file.")
    print("Looking for .env file at: ../../.env")
    import os
    env_path = '../../.env'
    print(f"Environment file exists: {os.path.exists(env_path)}")
    exit(1)

supabase: Client = create_client(url, key)

def clear_financial_tables():
    """Clear both financial tables"""
    print("🗑️  Clearing financial tables...")
    
    try:
        # First check if tables have any records
        balance_check = supabase.table('diva_balance_sheets').select('id').limit(1).execute()
        income_check = supabase.table('diva_income_statements').select('id').limit(1).execute()
        
        balance_count = len(balance_check.data)
        income_count = len(income_check.data)
        
        print(f"   📊 Current records - Balance sheets: {balance_count}, Income statements: {income_count}")
        
        if balance_count > 0:
            # Clear balance sheets table
            balance_result = supabase.table('diva_balance_sheets').delete().gte('id', 0).execute()
            print(f"   ✅ Cleared diva_balance_sheets: {len(balance_result.data)} records deleted")
        else:
            print(f"   ✅ diva_balance_sheets already empty")
        
        if income_count > 0:
            # Clear income statements table
            income_result = supabase.table('diva_income_statements').delete().gte('id', 0).execute()
            print(f"   ✅ Cleared diva_income_statements: {len(income_result.data)} records deleted")
        else:
            print(f"   ✅ diva_income_statements already empty")
        
        return True
    except Exception as e:
        print(f"   ❌ Error clearing tables: {str(e)}")
        # Try alternative clearing method
        try:
            print("   🔄 Trying alternative clearing method...")
            # Get all records and delete them individually if needed
            balance_all = supabase.table('diva_balance_sheets').select('id').execute()
            income_all = supabase.table('diva_income_statements').select('id').execute()
            
            if balance_all.data:
                for record in balance_all.data:
                    supabase.table('diva_balance_sheets').delete().eq('id', record['id']).execute()
                print(f"   ✅ Cleared diva_balance_sheets: {len(balance_all.data)} records deleted")
            
            if income_all.data:
                for record in income_all.data:
                    supabase.table('diva_income_statements').delete().eq('id', record['id']).execute()
                print(f"   ✅ Cleared diva_income_statements: {len(income_all.data)} records deleted")
            
            return True
        except Exception as e2:
            print(f"   ❌ Alternative clearing also failed: {str(e2)}")
            return False

def load_original_dataset():
    """Load the original dataset from file"""
    print("📂 Loading original dataset...")
    
    dataset_files = [
        'diva_dataset.json',
        '../diva_dataset.json',
        '../../diva_dataset.json',
        'diva_financial_data.json'
    ]
    
    for file_path in dataset_files:
        if os.path.exists(file_path):
            try:
                with open(file_path, 'r', encoding='utf-8') as f:
                    data = json.load(f)
                print(f"   ✅ Loaded dataset from {file_path}: {len(data)} records")
                return data
            except Exception as e:
                print(f"   ⚠️  Error loading {file_path}: {str(e)}")
                continue
    
    print("   ❌ No dataset file found. Using validation data instead.")
    return None

def prepare_balance_sheet_records(dataset):
    """Prepare balance sheet records from dataset"""
    balance_sheets = []
    
    for record in dataset:
        if record.get('dataType') == 'financial_statements_balance':
            balance_sheet = {
                'company_name': record.get('회사명', ''),
                'data_year': 2024,
                'fiscal_year': 2024,
                'total_assets': int(record.get('자산총계', 0)),
                'startup_investment_assets': int(record.get('창업투자자산', 0)),
                'total_liabilities': int(record.get('부채총계', 0)),
                'paid_in_capital': int(record.get('납입자본금', 0)),
                'total_equity': int(record.get('자본총계', 0))
            }
            balance_sheets.append(balance_sheet)
    
    return balance_sheets

def prepare_income_statement_records(dataset):
    """Prepare income statement records from dataset"""
    income_statements = []
    
    for record in dataset:
        if record.get('dataType') == 'financial_statements_income':
            income_statement = {
                'company_name': record.get('회사명', ''),
                'data_year': 2024,
                'fiscal_year': 2024,
                'operating_revenue': int(record.get('영업수익', 0)),
                'operating_expenses': int(record.get('영업비용', 0)),
                'operating_profit': int(record.get('영업이익', 0)),
                'net_income_before_taxes': int(record.get('법인세차감전순이익', 0)),
                'net_profit': int(record.get('당기순이익', 0))
            }
            income_statements.append(income_statement)
    
    return income_statements

def use_validation_data():
    """Use validation data as fallback"""
    print("📋 Using validation dataset...")
    
    # Import from our validation file
    import sys
    sys.path.append('.')
    from complete_validation_dataset import all_balance_sheet_data, all_income_statement_data
    
    # Convert validation data to database format
    balance_sheets = []
    for record in all_balance_sheet_data:
        balance_sheet = {
            'company_name': record['company_name'],
            'data_year': record['data_year'],
            'fiscal_year': record['fiscal_year'],
            'total_assets': record['total_assets'],
            'startup_investment_assets': record['startup_investment_assets'],
            'total_liabilities': record['total_liabilities'],
            'paid_in_capital': record['paid_in_capital'],
            'total_equity': record['total_equity']
        }
        balance_sheets.append(balance_sheet)
    
    income_statements = []
    for record in all_income_statement_data:
        income_statement = {
            'company_name': record['company_name'],
            'data_year': record['data_year'],
            'fiscal_year': record['fiscal_year'],
            'operating_revenue': record['operating_revenue'],
            'operating_expenses': record['operating_expenses'],
            'operating_profit': record['operating_profit'],
            'net_income_before_taxes': record['net_income_before_taxes'],
            'net_profit': record['net_profit']
        }
        income_statements.append(income_statement)
    
    return balance_sheets, income_statements

def insert_balance_sheets(balance_sheets):
    """Insert balance sheet records"""
    print(f"💰 Inserting {len(balance_sheets)} balance sheet records...")
    
    try:
        # Insert in batches of 50
        batch_size = 50
        total_inserted = 0
        
        for i in range(0, len(balance_sheets), batch_size):
            batch = balance_sheets[i:i + batch_size]
            result = supabase.table('diva_balance_sheets').insert(batch).execute()
            total_inserted += len(result.data)
            print(f"   ✅ Inserted batch {i//batch_size + 1}: {len(result.data)} records")
        
        print(f"   🎉 Total balance sheets inserted: {total_inserted}")
        return total_inserted
    except Exception as e:
        print(f"   ❌ Error inserting balance sheets: {str(e)}")
        return 0

def insert_income_statements(income_statements):
    """Insert income statement records"""
    print(f"📊 Inserting {len(income_statements)} income statement records...")
    
    try:
        # Insert in batches of 50
        batch_size = 50
        total_inserted = 0
        
        for i in range(0, len(income_statements), batch_size):
            batch = income_statements[i:i + batch_size]
            result = supabase.table('diva_income_statements').insert(batch).execute()
            total_inserted += len(result.data)
            print(f"   ✅ Inserted batch {i//batch_size + 1}: {len(result.data)} records")
        
        print(f"   🎉 Total income statements inserted: {total_inserted}")
        return total_inserted
    except Exception as e:
        print(f"   ❌ Error inserting income statements: {str(e)}")
        return 0

def verify_data():
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
        
        # Show sample records
        if balance_count > 0:
            sample_balance = balance_result.data[0]
            print(f"   📋 Sample balance sheet: {sample_balance['company_name']} - Assets: {sample_balance['total_assets']:,}")
        
        if income_count > 0:
            sample_income = income_result.data[0]
            print(f"   📋 Sample income statement: {sample_income['company_name']} - Revenue: {sample_income['operating_revenue']:,}")
        
        return balance_count, income_count
    except Exception as e:
        print(f"   ❌ Error verifying data: {str(e)}")
        return 0, 0

def main():
    """Main execution function"""
    print("🚀 Starting Financial Tables Repopulation")
    print("=" * 60)
    
    # Step 1: Clear existing tables
    if not clear_financial_tables():
        print("❌ Failed to clear tables. Exiting.")
        return
    
    # Step 2: Load dataset
    dataset = load_original_dataset()
    
    if dataset:
        # Use original dataset
        balance_sheets = prepare_balance_sheet_records(dataset)
        income_statements = prepare_income_statement_records(dataset)
    else:
        # Use validation data
        balance_sheets, income_statements = use_validation_data()
    
    print(f"📊 Prepared data: {len(balance_sheets)} balance sheets, {len(income_statements)} income statements")
    
    # Step 3: Insert data
    balance_inserted = insert_balance_sheets(balance_sheets)
    income_inserted = insert_income_statements(income_statements)
    
    # Step 4: Verify results
    balance_verified, income_verified = verify_data()
    
    # Summary
    print("\n" + "=" * 60)
    print("📈 REPOPULATION SUMMARY")
    print("=" * 60)
    print(f"Balance Sheets: {balance_inserted} inserted, {balance_verified} verified")
    print(f"Income Statements: {income_inserted} inserted, {income_verified} verified")
    print(f"Total Records: {balance_inserted + income_inserted} inserted, {balance_verified + income_verified} verified")
    
    if balance_inserted == balance_verified and income_inserted == income_verified:
        print("✅ SUCCESS: All records inserted and verified correctly!")
    else:
        print("⚠️  WARNING: Verification counts don't match insertion counts.")
    
    print("🎉 Financial tables repopulation complete!")

if __name__ == "__main__":
    main()