#!/usr/bin/env python3
"""
Simple Supabase Connection Test
Tests basic connectivity and API key validity
"""

import os
from supabase import create_client, Client

def test_supabase_connection():
    print("🔧 Simple Supabase Connection Test")
    print("==================================")
    
    # Set environment variables directly
    supabase_url = 'https://udfgtccxbqmalgpqyxzz.supabase.co'
    supabase_key = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InVkZmd0Y2N4YnFtYWxncHF5eHp6Iiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTczMzMzMTg3MywiZXhwIjoyMDQ4OTA3ODczfQ.a8S8X5cdZwfCqmLVrpJXmB6WnhPCqV8m39JoN_2GKzg'
    
    print(f"📍 URL: {supabase_url}")
    print(f"🔑 Key (first 50 chars): {supabase_key[:50]}...")
    
    try:
        # Initialize Supabase client
        supabase: Client = create_client(supabase_url, supabase_key)
        print("✅ Supabase client created successfully")
        
        # Test 1: Simple table count for each table
        print("\n🧪 Testing table access...")
        
        tables_to_test = [
            'vc_table',
            'fund_table', 
            'diva_intelligence',
            'diva_professional_network',
            'diva_fund_intelligence'
        ]
        
        for table_name in tables_to_test:
            try:
                # Try to get count from table
                result = supabase.table(table_name).select("*", count="exact").limit(0).execute()
                count = result.count if result.count is not None else 0
                print(f"✅ {table_name}: {count} records")
                
            except Exception as e:
                print(f"❌ {table_name}: {str(e)[:100]}...")
        
        # Test 2: Try a simple insert to diva_intelligence
        print("\n🧪 Testing insert operation...")
        
        test_record = {
            "company_id": "TEST_SIMPLE_001",
            "company_name": "Simple Test Company",
            "intelligence_data": {"test": "simple_data"},
            "analysis_results": {"test": "simple_analysis"},
            "scrape_date": "2025-06-04",
            "data_quality_score": 100.0
        }
        
        try:
            result = supabase.table('diva_intelligence').insert(test_record).execute()
            print(f"✅ Insert successful: {len(result.data)} record(s)")
            
            # Clean up
            supabase.table('diva_intelligence').delete().eq('company_id', 'TEST_SIMPLE_001').execute()
            print("🧹 Test record cleaned up")
            
        except Exception as e:
            print(f"❌ Insert failed: {str(e)[:200]}...")
        
        # Test 3: Check if service role key has correct permissions
        print("\n🔍 API Key Analysis:")
        
        # Decode JWT to check role
        try:
            import jwt
            import json
            
            # Decode without verification (just to see payload)
            decoded = jwt.decode(supabase_key, options={"verify_signature": False})
            print(f"🔍 Role: {decoded.get('role', 'unknown')}")
            print(f"🔍 Issuer: {decoded.get('iss', 'unknown')}")
            print(f"🔍 Reference: {decoded.get('ref', 'unknown')}")
            
        except ImportError:
            print("⚠️  jwt library not available for key analysis")
        except Exception as e:
            print(f"⚠️  Could not decode key: {str(e)[:100]}...")
        
        return True
        
    except Exception as e:
        print(f"❌ Connection failed: {e}")
        return False

if __name__ == "__main__":
    success = test_supabase_connection()
    if success:
        print("\n🎯 Basic connectivity test completed")
    else:
        print("\n❌ Connection test failed") 