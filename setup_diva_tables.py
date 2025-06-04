#!/usr/bin/env python3
"""
Setup DIVA tables in Supabase
Creates the necessary tables for DIVA intelligence system
"""

import os
from supabase import create_client, Client

def setup_diva_tables():
    print("🏗️ Setting up DIVA tables in Supabase...")
    
    # Set environment variables directly
    os.environ['SUPABASE_URL'] = 'https://udfgtccxbqmalgpqyxzz.supabase.co'
    os.environ['SUPABASE_KEY'] = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InVkZmd0Y2N4YnFtYWxncHF5eHp6Iiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTczMzMzMTg3MywiZXhwIjoyMDQ4OTA3ODczfQ.a8S8X5cdZwfCqmLVrpJXmB6WnhPCqV8m39JoN_2GKzg'
    
    supabase_url = os.getenv('SUPABASE_URL')
    supabase_key = os.getenv('SUPABASE_KEY')
    
    try:
        # Initialize Supabase client
        supabase: Client = create_client(supabase_url, supabase_key)
        print("✅ Supabase client initialized")
        
        # Check existing tables
        print("🔍 Checking existing tables...")
        
        # Try to query each table to see if it exists
        tables_to_check = [
            'vc_table',
            'fund_table', 
            'diva_intelligence',
            'diva_professional_network',
            'diva_fund_intelligence'
        ]
        
        existing_tables = []
        missing_tables = []
        
        for table_name in tables_to_check:
            try:
                result = supabase.table(table_name).select("count", count="exact").limit(0).execute()
                existing_tables.append(table_name)
                print(f"✅ Table '{table_name}' exists")
            except Exception as e:
                missing_tables.append(table_name)
                print(f"❌ Table '{table_name}' missing: {str(e)[:100]}...")
        
        print(f"\n📊 Summary:")
        print(f"✅ Existing tables: {len(existing_tables)}")
        print(f"❌ Missing tables: {len(missing_tables)}")
        
        if missing_tables:
            print(f"\n⚠️  Missing tables: {', '.join(missing_tables)}")
            print("💡 You need to run the SQL schema creation script in Supabase dashboard")
            print("📋 File: create_supabase_schema.sql")
        else:
            print("\n🎉 All required tables exist!")
            
        # Try a simple insert test to one of the existing tables
        if 'diva_intelligence' in existing_tables:
            print("\n🧪 Testing insert permissions...")
            test_record = {
                "company_id": "TEST_001",
                "company_name": "Test Company",
                "intelligence_data": {"test": "data"},
                "analysis_results": {"test": "analysis"},
                "scrape_date": "2025-06-04",
                "data_quality_score": 100.0
            }
            
            try:
                result = supabase.table('diva_intelligence').insert(test_record).execute()
                print("✅ Insert permissions working!")
                
                # Clean up test record
                supabase.table('diva_intelligence').delete().eq('company_id', 'TEST_001').execute()
                print("🧹 Test record cleaned up")
                
            except Exception as e:
                print(f"❌ Insert test failed: {e}")
        
        return len(missing_tables) == 0
        
    except Exception as e:
        print(f"❌ Setup failed: {e}")
        return False

if __name__ == "__main__":
    success = setup_diva_tables()
    if success:
        print("\n🎯 DIVA tables setup completed successfully!")
    else:
        print("\n⚠️  DIVA tables setup needs attention.") 