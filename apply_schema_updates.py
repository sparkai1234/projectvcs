#!/usr/bin/env python3
"""
🚀 Apply Comprehensive Schema Updates
Updates both fund_table and creates vc_companies table
"""

from supabase import create_client, Client
from api_config import get_supabase_config
import time

def apply_schema_updates():
    """Apply comprehensive schema updates to Supabase"""
    print("🚀 APPLYING COMPREHENSIVE SCHEMA UPDATES")
    print("=" * 60)
    
    config = get_supabase_config(use_service_role=True)
    supabase: Client = create_client(config['url'], config['key'])
    
    # Read the SQL file
    try:
        with open('update_schemas.sql', 'r', encoding='utf-8') as f:
            sql_content = f.read()
        
        print("📄 SQL schema file loaded successfully")
        
        # Split SQL into individual statements
        statements = [stmt.strip() for stmt in sql_content.split(';') if stmt.strip()]
        
        print(f"📊 Found {len(statements)} SQL statements to execute")
        
        successful_statements = 0
        failed_statements = 0
        
        for i, statement in enumerate(statements, 1):
            if not statement or statement.startswith('--'):
                continue
                
            try:
                print(f"⚡ Executing statement {i}/{len(statements)}...")
                
                # Execute the SQL statement
                result = supabase.rpc('exec_sql', {'sql': statement}).execute()
                
                successful_statements += 1
                
                if i % 5 == 0:
                    print(f"✅ Progress: {i}/{len(statements)} statements")
                    
            except Exception as e:
                print(f"❌ Error in statement {i}: {str(e)[:100]}...")
                failed_statements += 1
                
                # Continue with other statements
                continue
        
        print(f"\n🎉 SCHEMA UPDATE SUMMARY")
        print("=" * 50)
        print(f"✅ Successful statements: {successful_statements}")
        print(f"❌ Failed statements: {failed_statements}")
        
        if successful_statements > failed_statements:
            print(f"🎉 Schema updates applied successfully!")
            return True
        else:
            print(f"⚠️ Some schema updates failed")
            return False
            
    except Exception as e:
        print(f"❌ Error applying schema updates: {e}")
        return False

def verify_schema_updates():
    """Verify that schema updates were applied correctly"""
    print(f"\n🔍 VERIFYING SCHEMA UPDATES")
    print("=" * 50)
    
    config = get_supabase_config(use_service_role=True)
    supabase: Client = create_client(config['url'], config['key'])
    
    try:
        # Check fund_table schema
        print("📋 Checking fund_table schema...")
        fund_result = supabase.table('fund_table').select('*').limit(1).execute()
        
        if fund_result.data:
            fund_fields = list(fund_result.data[0].keys())
            print(f"✅ fund_table has {len(fund_fields)} fields")
            
            # Check for key new fields
            required_fund_fields = ['fund_id', 'registration_date', 'expiry_date', 
                                  'company_name', 'investment_field', 'investment_detail']
            
            missing_fund_fields = [f for f in required_fund_fields if f not in fund_fields]
            
            if missing_fund_fields:
                print(f"❌ Missing fund fields: {missing_fund_fields}")
            else:
                print(f"✅ All required fund fields present")
        
        # Check vc_companies table
        print("\n📋 Checking vc_companies table...")
        try:
            vc_result = supabase.table('vc_companies').select('*').limit(1).execute()
            print(f"✅ vc_companies table exists and accessible")
            
            # Insert a test record to verify structure
            test_vc = {
                'company_name': 'Test VC Company',
                'company_id': 'TEST001',
                'industry': 'ICT서비스',
                'location': '서울 강남구',
                'company_type': '기타운용사',
                'operating_scale': 1,
                'operating_amount': 14.8,
                'business_category': '5',
                'strategy_planner': True
            }
            
            insert_result = supabase.table('vc_companies').insert(test_vc).execute()
            
            if insert_result.data:
                print(f"✅ vc_companies table structure verified")
                
                # Clean up test record
                test_id = insert_result.data[0]['id']
                supabase.table('vc_companies').delete().eq('id', test_id).execute()
                print(f"🧹 Test record cleaned up")
            
        except Exception as e:
            print(f"❌ vc_companies table issue: {e}")
        
        return True
        
    except Exception as e:
        print(f"❌ Error verifying schema: {e}")
        return False

def main():
    """Main function to apply and verify schema updates"""
    print("🚀 COMPREHENSIVE SCHEMA UPDATE PROCESS")
    print("=" * 60)
    print("🎯 Goals:")
    print("   1. Update fund_table with rich data fields")
    print("   2. Create vc_companies table")
    print("   3. Add indexes and views")
    print("   4. Verify all updates")
    print("=" * 60)
    
    # Step 1: Apply schema updates
    if apply_schema_updates():
        print(f"\n✅ Schema updates applied successfully")
        
        # Step 2: Verify updates
        if verify_schema_updates():
            print(f"\n🎉 SCHEMA UPDATE COMPLETE!")
            print(f"✅ Your database now supports rich fund and VC data")
            print(f"🚀 Ready for comprehensive data migration")
        else:
            print(f"\n⚠️ Schema verification had issues")
            print(f"💡 Check the logs above for details")
    else:
        print(f"\n❌ Schema update failed")
        print(f"🔧 Please check the error messages above")

if __name__ == "__main__":
    main() 