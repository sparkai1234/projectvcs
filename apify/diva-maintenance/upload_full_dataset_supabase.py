"""
Direct Supabase Upload - Complete Financial Dataset
Upload the full 250+ records directly to Supabase using user's credentials
"""

import os
from supabase import create_client, Client
from complete_validation_dataset import all_balance_sheet_data, all_income_statement_data

def get_supabase_client():
    """Initialize Supabase client with user credentials"""
    print("🔑 Please provide your Supabase credentials:")
    
    # Get credentials from user input
    supabase_url = input("Enter your Supabase URL: ").strip()
    supabase_key = input("Enter your Supabase Anon Key: ").strip()
    
    if not supabase_url or not supabase_key:
        print("❌ Missing credentials!")
        return None
    
    try:
        client = create_client(supabase_url, supabase_key)
        print("✅ Supabase client initialized successfully!")
        return client
    except Exception as e:
        print(f"❌ Failed to initialize Supabase client: {e}")
        return None

def clear_existing_data(supabase):
    """Clear existing financial data"""
    print("\n🧹 Clearing existing data...")
    
    try:
        # Clear balance sheets
        balance_result = supabase.table('diva_balance_sheets').delete().eq('data_year', 2024).execute()
        print(f"   Cleared balance sheets: {len(balance_result.data) if balance_result.data else 'all'}")
        
        # Clear income statements  
        income_result = supabase.table('diva_income_statements').delete().eq('data_year', 2024).execute()
        print(f"   Cleared income statements: {len(income_result.data) if income_result.data else 'all'}")
        
        return True
    except Exception as e:
        print(f"❌ Error clearing data: {e}")
        return False

def upload_balance_sheets(supabase):
    """Upload balance sheet records"""
    print(f"\n📊 Uploading {len(all_balance_sheet_data)} balance sheet records...")
    
    # Convert to database format
    records = []
    for item in all_balance_sheet_data:
        record = {
            'company_name': item['company_name'],
            'data_year': item['data_year'],
            'total_assets': item['total_assets'],
            'startup_investment_assets': item['startup_investment_assets'],
            'total_liabilities': item['total_liabilities'],
            'paid_in_capital': item['paid_in_capital'],
            'total_equity': item['total_equity']
        }
        records.append(record)
    
    try:
        # Upload in batches of 100
        batch_size = 100
        total_uploaded = 0
        
        for i in range(0, len(records), batch_size):
            batch = records[i:i + batch_size]
            result = supabase.table('diva_balance_sheets').insert(batch).execute()
            
            if result.data:
                total_uploaded += len(result.data)
                print(f"   ✅ Uploaded batch {i//batch_size + 1}: {len(result.data)} records")
            else:
                print(f"   ⚠️ Batch {i//batch_size + 1} may have issues")
        
        print(f"📈 Total balance sheets uploaded: {total_uploaded}")
        return total_uploaded
        
    except Exception as e:
        print(f"❌ Error uploading balance sheets: {e}")
        return 0

def upload_income_statements(supabase):
    """Upload income statement records"""
    print(f"\n📊 Uploading {len(all_income_statement_data)} income statement records...")
    
    # Convert to database format
    records = []
    for item in all_income_statement_data:
        record = {
            'company_name': item['company_name'],
            'data_year': item['data_year'],
            'operating_revenue': item['operating_revenue'],
            'operating_expenses': item['operating_expenses'],
            'operating_profit': item['operating_profit'],
            'net_income_before_taxes': item['net_income_before_taxes'],
            'net_profit': item['net_profit']
        }
        records.append(record)
    
    try:
        # Upload in batches of 100
        batch_size = 100
        total_uploaded = 0
        
        for i in range(0, len(records), batch_size):
            batch = records[i:i + batch_size]
            result = supabase.table('diva_income_statements').insert(batch).execute()
            
            if result.data:
                total_uploaded += len(result.data)
                print(f"   ✅ Uploaded batch {i//batch_size + 1}: {len(result.data)} records")
            else:
                print(f"   ⚠️ Batch {i//batch_size + 1} may have issues")
        
        print(f"📈 Total income statements uploaded: {total_uploaded}")
        return total_uploaded
        
    except Exception as e:
        print(f"❌ Error uploading income statements: {e}")
        return 0

def verify_upload(supabase):
    """Verify the uploaded data"""
    print("\n🔍 Verifying uploaded data...")
    
    try:
        # Count balance sheets
        balance_count = supabase.table('diva_balance_sheets').select('id', count='exact').eq('data_year', 2024).execute()
        balance_total = balance_count.count if hasattr(balance_count, 'count') else len(balance_count.data)
        
        # Count income statements
        income_count = supabase.table('diva_income_statements').select('id', count='exact').eq('data_year', 2024).execute()
        income_total = income_count.count if hasattr(income_count, 'count') else len(income_count.data)
        
        print(f"   📊 Balance sheets in database: {balance_total}")
        print(f"   📊 Income statements in database: {income_total}")
        print(f"   📊 Total records: {balance_total + income_total}")
        
        return balance_total, income_total
        
    except Exception as e:
        print(f"❌ Error verifying data: {e}")
        return 0, 0

def main():
    """Main execution function"""
    print("🚀 DIRECT SUPABASE UPLOAD - COMPLETE FINANCIAL DATASET")
    print("=" * 70)
    print(f"📋 Dataset Summary:")
    print(f"   - Balance sheet records: {len(all_balance_sheet_data)}")
    print(f"   - Income statement records: {len(all_income_statement_data)}")
    print(f"   - Total records: {len(all_balance_sheet_data) + len(all_income_statement_data)}")
    print()
    
    # Initialize Supabase client
    supabase = get_supabase_client()
    if not supabase:
        return
    
    # Clear existing data
    if not clear_existing_data(supabase):
        print("❌ Failed to clear existing data. Aborting.")
        return
    
    # Upload new data
    balance_uploaded = upload_balance_sheets(supabase)
    income_uploaded = upload_income_statements(supabase)
    
    # Verify upload
    balance_verified, income_verified = verify_upload(supabase)
    
    # Final summary
    print("\n" + "=" * 70)
    print("🎉 UPLOAD COMPLETE!")
    print("=" * 70)
    print(f"📊 Balance Sheets: {balance_uploaded} uploaded, {balance_verified} verified")
    print(f"📊 Income Statements: {income_uploaded} uploaded, {income_verified} verified")
    print(f"📊 Total: {balance_uploaded + income_uploaded} uploaded, {balance_verified + income_verified} verified")
    
    if balance_uploaded == balance_verified and income_uploaded == income_verified and balance_uploaded > 0:
        print("\n✅ SUCCESS: All records uploaded and verified successfully!")
        
        # Show top companies by assets
        try:
            top_companies = supabase.table('diva_balance_sheets').select('company_name, total_assets').eq('data_year', 2024).order('total_assets', desc=True).limit(5).execute()
            if top_companies.data:
                print(f"\n🏆 Top 5 Companies by Assets:")
                for i, company in enumerate(top_companies.data, 1):
                    assets = company['total_assets']
                    print(f"   {i}. {company['company_name']}: {assets:,} KRW")
        except:
            pass
    else:
        print("\n⚠️ WARNING: Upload verification failed. Some records may be missing.")

if __name__ == "__main__":
    main() 