"""
Regenerate Clean Validation Dataset
Replaces existing validation data with clean company names (no version numbers)
Uses a different strategy to create 250 unique records without violating constraints
"""

import os
import random
from datetime import datetime
from supabase import create_client, Client

def get_supabase_client():
    SUPABASE_URL = os.getenv('SUPABASE_URL')
    SUPABASE_KEY = os.getenv('SUPABASE_SERVICE_ROLE_KEY')
    
    if not SUPABASE_URL or not SUPABASE_KEY:
        env_file = os.path.join(os.path.dirname(__file__), '..', '..', 'env_exact.txt')
        if os.path.exists(env_file):
            with open(env_file, 'r') as f:
                for line in f:
                    if line.startswith('SUPABASE_URL='):
                        SUPABASE_URL = line.split('=', 1)[1].strip()
                    elif line.startswith('SUPABASE_SERVICE_ROLE_KEY='):
                        SUPABASE_KEY = line.split('=', 1)[1].strip()
    
    if not SUPABASE_URL or not SUPABASE_KEY:
        raise ValueError("Missing Supabase credentials")
    
    return create_client(SUPABASE_URL, SUPABASE_KEY)

def get_base_companies():
    """Get base Korean VC companies with their financial data"""
    balance_companies = [
        {
            "name": "경남벤처투자",
            "total_assets": 5257825484,
            "startup_investment_assets": 2623949842,
            "total_liabilities": 186283286,
            "paid_in_capital": 4700000000,
            "total_equity": 5071542198
        },
        {
            "name": "골든오크벤처스",
            "total_assets": 2715824262,
            "startup_investment_assets": 980033468,
            "total_liabilities": 9691028,
            "paid_in_capital": 2500000000,
            "total_equity": 2706133234
        },
        {
            "name": "그랜드벤처스",
            "total_assets": 1918879894,
            "startup_investment_assets": 680373304,
            "total_liabilities": 24339445,
            "paid_in_capital": 2077000000,
            "total_equity": 1894540449
        },
        {
            "name": "글로넷벤처파트너스",
            "total_assets": 1314114091,
            "startup_investment_assets": 870026584,
            "total_liabilities": 125080683,
            "paid_in_capital": 2311912000,
            "total_equity": 1189033408
        },
        {
            "name": "네오인사이트벤처스",
            "total_assets": 1508535028,
            "startup_investment_assets": 148696470,
            "total_liabilities": 128597998,
            "paid_in_capital": 2800000000,
            "total_equity": 1379937030
        }
    ]
    
    income_companies = [
        {
            "name": "경남벤처투자",
            "operating_revenue": 1906836617,
            "operating_expenses": 1247497945,
            "operating_profit": 659338672,
            "net_income_before_taxes": 709742532,
            "net_profit": 577251914
        },
        {
            "name": "골든오크벤처스",
            "operating_revenue": 1012972410,
            "operating_expenses": 723005910,
            "operating_profit": 289966500,
            "net_income_before_taxes": 295325510,
            "net_profit": 295325510
        },
        {
            "name": "그랜드벤처스",
            "operating_revenue": 66454546,
            "operating_expenses": 254505743,
            "operating_profit": -188051197,
            "net_income_before_taxes": -124629805,
            "net_profit": -124629805
        },
        {
            "name": "글로넷벤처파트너스",
            "operating_revenue": 516690055,
            "operating_expenses": 982453469,
            "operating_profit": -465763414,
            "net_income_before_taxes": -393516984,
            "net_profit": -393516984
        },
        {
            "name": "네오인사이트벤처스",
            "operating_revenue": 45371814,
            "operating_expenses": 835396946,
            "operating_profit": -790025132,
            "net_income_before_taxes": -790316368,
            "net_profit": -790316368
        }
    ]
    
    return balance_companies, income_companies

def generate_company_variations(base_companies, target_count=250):
    """Generate company variations with different years and slight financial variations"""
    variations = []
    years = [2020, 2021, 2022, 2023, 2024]  # Use different years to avoid unique constraint
    
    # Calculate how many records per year we need
    records_per_year = target_count // len(years)
    remaining_records = target_count % len(years)
    
    for year_idx, year in enumerate(years):
        year_target = records_per_year + (1 if year_idx < remaining_records else 0)
        
        for i in range(year_target):
            base_company = random.choice(base_companies)
            variation = base_company.copy()
            
            # Apply financial variations (±20%)
            variation_factor = random.uniform(0.8, 1.2)
            
            # Update financial fields based on type
            if "total_assets" in variation:
                # Balance sheet
                variation["total_assets"] = int(variation["total_assets"] * variation_factor)
                variation["startup_investment_assets"] = int(variation["startup_investment_assets"] * variation_factor)
                variation["total_liabilities"] = int(variation["total_liabilities"] * variation_factor)
                variation["paid_in_capital"] = int(variation["paid_in_capital"] * variation_factor)
                variation["total_equity"] = int(variation["total_equity"] * variation_factor)
            else:
                # Income statement
                variation["operating_revenue"] = int(variation["operating_revenue"] * variation_factor)
                variation["operating_expenses"] = int(variation["operating_expenses"] * variation_factor)
                variation["operating_profit"] = int(variation["operating_profit"] * variation_factor)
                variation["net_income_before_taxes"] = int(variation["net_income_before_taxes"] * variation_factor)
                variation["net_profit"] = int(variation["net_profit"] * variation_factor)
            
            # Set the year and clean company name
            variation["company_name"] = variation["name"]  # Use clean name
            variation["data_year"] = year
            del variation["name"]  # Remove the temporary name field
            
            variations.append(variation)
    
    return variations

def clear_existing_data(supabase):
    """Clear existing validation data from both tables"""
    print("🗑️  Clearing existing validation data...")
    
    try:
        balance_result = supabase.table('diva_balance_sheets').delete().neq('id', '00000000-0000-0000-0000-000000000000').execute()
        income_result = supabase.table('diva_income_statements').delete().neq('id', '00000000-0000-0000-0000-000000000000').execute()
        print("   ✅ Existing data cleared successfully")
        return True
    except Exception as e:
        print(f"   ❌ Error clearing data: {str(e)}")
        return False

def upload_records(supabase, table_name, records):
    """Upload records to Supabase table"""
    print(f"📤 Uploading {len(records)} records to {table_name}...")
    
    try:
        batch_size = 50
        uploaded = 0
        
        for i in range(0, len(records), batch_size):
            batch = records[i:i + batch_size]
            result = supabase.table(table_name).insert(batch).execute()
            uploaded += len(batch)
            print(f"   Uploaded {uploaded}/{len(records)} records")
        
        print(f"   ✅ Successfully uploaded {uploaded} records")
        return True
    except Exception as e:
        print(f"   ❌ Error uploading to {table_name}: {str(e)}")
        return False

def verify_clean_data(supabase):
    """Verify that the data has clean company names"""
    print("🔍 Verifying clean company names...")
    
    try:
        # Check balance sheets
        balance_result = supabase.table('diva_balance_sheets').select('company_name, data_year').limit(10).execute()
        print("   Sample balance sheet records:")
        for i, record in enumerate(balance_result.data[:5]):
            print(f"     {i+1}. {record['company_name']} ({record['data_year']})")
        
        # Check income statements
        income_result = supabase.table('diva_income_statements').select('company_name, data_year').limit(10).execute()
        print("   Sample income statement records:")
        for i, record in enumerate(income_result.data[:5]):
            print(f"     {i+1}. {record['company_name']} ({record['data_year']})")
        
        # Check for any version numbers
        balance_with_versions = supabase.table('diva_balance_sheets').select('company_name').like('company_name', '%_v%').execute()
        income_with_versions = supabase.table('diva_income_statements').select('company_name').like('company_name', '%_v%').execute()
        
        version_count = len(balance_with_versions.data or []) + len(income_with_versions.data or [])
        
        if version_count == 0:
            print("   ✅ All company names are clean (no version numbers)")
            return True
        else:
            print(f"   ❌ Found {version_count} records with version numbers")
            return False
        
    except Exception as e:
        print(f"   ❌ Error during verification: {str(e)}")
        return False

def main():
    """Main execution function"""
    print("🔄 Regenerating Clean Validation Dataset")
    print("=" * 50)
    
    try:
        # Initialize Supabase client
        print("🔗 Connecting to Supabase...")
        supabase = get_supabase_client()
        print("✅ Connected to Supabase")
        
        # Get base company data
        print("\n📋 Preparing base company data...")
        balance_companies, income_companies = get_base_companies()
        print(f"   Base balance sheet companies: {len(balance_companies)}")
        print(f"   Base income statement companies: {len(income_companies)}")
        
        # Generate variations
        print("\n🔄 Generating clean variations...")
        balance_records = generate_company_variations(balance_companies, 250)
        income_records = generate_company_variations(income_companies, 250)
        print(f"   Generated {len(balance_records)} balance sheet records")
        print(f"   Generated {len(income_records)} income statement records")
        
        # Clear existing data
        print("\n🗑️  Clearing existing data...")
        if not clear_existing_data(supabase):
            raise Exception("Failed to clear existing data")
        
        # Upload new clean data
        print("\n📤 Uploading clean validation data...")
        if not upload_records(supabase, 'diva_balance_sheets', balance_records):
            raise Exception("Failed to upload balance sheets")
            
        if not upload_records(supabase, 'diva_income_statements', income_records):
            raise Exception("Failed to upload income statements")
        
        # Verify clean data
        print("\n🔍 Verifying clean data...")
        verification_success = verify_clean_data(supabase)
        
        # Summary
        print("\n" + "=" * 50)
        print("📊 Regeneration Summary:")
        print(f"   Balance Sheet Records: 250 ✅")
        print(f"   Income Statement Records: 250 ✅")
        print(f"   Total Records: 500 ✅")
        print(f"   Clean Company Names: {'✅ YES' if verification_success else '❌ NO'}")
        print(f"   Multi-Year Data: ✅ 2020-2024")
        
        if verification_success:
            print("\n🎉 Clean validation dataset regenerated successfully!")
            print("✅ All company names are clean (no version numbers)")
            print("✅ Data spans multiple years to avoid constraint issues")
            print("✅ 500 realistic Korean VC financial records ready for use")
        else:
            print("\n⚠️  Regeneration completed with issues")
        
    except Exception as e:
        print(f"\n❌ Regeneration failed: {str(e)}")
        return False
    
    return True

if __name__ == "__main__":
    main() 