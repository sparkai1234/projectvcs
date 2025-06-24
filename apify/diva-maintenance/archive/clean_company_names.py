"""
Clean Company Names Script
Removes version numbers (_v###) from company names in DIVA validation dataset
"""

import os
import re
from supabase import create_client, Client

def get_supabase_client():
    """Initialize Supabase client using environment variables"""
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

def clean_company_name(company_name):
    """Remove version suffix (_v###) from company name"""
    # Remove pattern like _v123, _v45, etc.
    cleaned_name = re.sub(r'_v\d+$', '', company_name)
    return cleaned_name

def clean_balance_sheets(supabase):
    """Clean company names in diva_balance_sheets table"""
    print("🧹 Cleaning balance sheet company names...")
    
    try:
        # Get all balance sheet records
        result = supabase.table('diva_balance_sheets').select('id, company_name').execute()
        records = result.data
        
        print(f"   Found {len(records)} balance sheet records")
        
        updated_count = 0
        for record in records:
            original_name = record['company_name']
            cleaned_name = clean_company_name(original_name)
            
            if cleaned_name != original_name:
                # Update the record
                update_result = supabase.table('diva_balance_sheets').update({
                    'company_name': cleaned_name
                }).eq('id', record['id']).execute()
                
                updated_count += 1
                if updated_count <= 5:  # Show first 5 examples
                    print(f"   Updated: '{original_name}' → '{cleaned_name}'")
        
        print(f"   ✅ Updated {updated_count} balance sheet records")
        return updated_count
        
    except Exception as e:
        print(f"   ❌ Error cleaning balance sheets: {str(e)}")
        return 0

def clean_income_statements(supabase):
    """Clean company names in diva_income_statements table"""
    print("🧹 Cleaning income statement company names...")
    
    try:
        # Get all income statement records
        result = supabase.table('diva_income_statements').select('id, company_name').execute()
        records = result.data
        
        print(f"   Found {len(records)} income statement records")
        
        updated_count = 0
        for record in records:
            original_name = record['company_name']
            cleaned_name = clean_company_name(original_name)
            
            if cleaned_name != original_name:
                # Update the record
                update_result = supabase.table('diva_income_statements').update({
                    'company_name': cleaned_name
                }).eq('id', record['id']).execute()
                
                updated_count += 1
                if updated_count <= 5:  # Show first 5 examples
                    print(f"   Updated: '{original_name}' → '{cleaned_name}'")
        
        print(f"   ✅ Updated {updated_count} income statement records")
        return updated_count
        
    except Exception as e:
        print(f"   ❌ Error cleaning income statements: {str(e)}")
        return 0

def verify_cleanup(supabase):
    """Verify that company names have been cleaned"""
    print("🔍 Verifying cleanup...")
    
    try:
        # Check balance sheets
        balance_result = supabase.table('diva_balance_sheets').select('company_name').limit(10).execute()
        print("   Sample balance sheet company names:")
        for i, record in enumerate(balance_result.data[:5]):
            print(f"     {i+1}. {record['company_name']}")
        
        # Check income statements
        income_result = supabase.table('diva_income_statements').select('company_name').limit(10).execute()
        print("   Sample income statement company names:")
        for i, record in enumerate(income_result.data[:5]):
            print(f"     {i+1}. {record['company_name']}")
        
        # Check for any remaining version numbers
        balance_with_versions = supabase.table('diva_balance_sheets').select('company_name').like('company_name', '%_v%').execute()
        income_with_versions = supabase.table('diva_income_statements').select('company_name').like('company_name', '%_v%').execute()
        
        balance_version_count = len(balance_with_versions.data) if balance_with_versions.data else 0
        income_version_count = len(income_with_versions.data) if income_with_versions.data else 0
        
        if balance_version_count == 0 and income_version_count == 0:
            print("   ✅ All version numbers successfully removed!")
        else:
            print(f"   ⚠️  Still found {balance_version_count + income_version_count} records with version numbers")
        
        return balance_version_count + income_version_count == 0
        
    except Exception as e:
        print(f"   ❌ Error during verification: {str(e)}")
        return False

def main():
    """Main execution function"""
    print("🧹 Company Name Cleanup - Removing Version Numbers")
    print("=" * 50)
    
    try:
        # Initialize Supabase client
        print("🔗 Connecting to Supabase...")
        supabase = get_supabase_client()
        print("✅ Connected to Supabase")
        
        # Clean balance sheets
        balance_updated = clean_balance_sheets(supabase)
        
        # Clean income statements
        income_updated = clean_income_statements(supabase)
        
        # Verify cleanup
        print("\n" + "=" * 50)
        verification_success = verify_cleanup(supabase)
        
        # Summary
        print("\n" + "=" * 50)
        print("📊 Cleanup Summary:")
        print(f"   Balance Sheets Updated: {balance_updated}")
        print(f"   Income Statements Updated: {income_updated}")
        print(f"   Total Records Updated: {balance_updated + income_updated}")
        print(f"   Verification: {'✅ SUCCESS' if verification_success else '❌ ISSUES FOUND'}")
        
        if verification_success:
            print("\n🎉 Company name cleanup completed successfully!")
            print("✅ All version numbers (_v###) have been removed")
            print("✅ Company names are now clean and ready for use")
        else:
            print("\n⚠️  Cleanup completed with some issues")
            print("❌ Some version numbers may still remain")
        
    except Exception as e:
        print(f"\n❌ Cleanup failed: {str(e)}")
        return False
    
    return True

if __name__ == "__main__":
    main() 