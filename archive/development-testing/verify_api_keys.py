#!/usr/bin/env python3
"""
Verify Supabase API Keys
Paste your fresh API keys here to test them
"""

from supabase import create_client, Client

def verify_keys():
    print("🔑 Supabase API Key Verification")
    print("================================")
    
    # PASTE YOUR FRESH API KEYS HERE:
    supabase_url = 'https://udfgtccxbqmalgpqyxzz.supabase.co'
    
    # Get these from: https://udfgtccxbqmalgpqyxzz.supabase.co/project/udfgtccxbqmalgpqyxzz/settings/api
    anon_key = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InVkZmd0Y2N4YnFtYWxncHF5eHp6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDg5NDY2OTYsImV4cCI6MjA2NDUyMjY5Nn0.ecx422hs05qMSVITNnbAiLMuPvx1k59FUIjqqpsV8iI"
    service_role_key = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InVkZmd0Y2N4YnFtYWxncHF5eHp6Iiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc0ODk0NjY5NiwiZXhwIjoyMDY0NTIyNjk2fQ.JgyEKjOhuZpNCCOadsaK90Q8CcoPf_rgdtSXh-1BU18"
    
    print(f"📍 Project URL: {supabase_url}")
    
    # Test both keys
    keys_to_test = [
        ("Anon Public Key", anon_key),
        ("Service Role Key", service_role_key)
    ]
    
    for key_name, api_key in keys_to_test:
        print(f"\n🧪 Testing {key_name}...")
        
        if api_key == "PASTE_YOUR_ANON_KEY_HERE" or api_key == "PASTE_YOUR_SERVICE_ROLE_KEY_HERE":
            print(f"⚠️  Please update the {key_name.lower()} in this script")
            continue
            
        try:
            # Test connection
            supabase: Client = create_client(supabase_url, api_key)
            
            # Try to access diva_intelligence table
            result = supabase.table('diva_intelligence').select("count", count="exact").limit(0).execute()
            count = result.count if result.count is not None else 0
            
            print(f"✅ {key_name}: VALID - Can access diva_intelligence table ({count} records)")
            
            # If this is service role, try an insert
            if "service" in key_name.lower():
                test_record = {
                    "company_id": "TEST_KEY_VERIFY",
                    "company_name": "Key Verification Test",
                    "intelligence_data": {"test": "verification"},
                    "analysis_results": {"status": "key_test"},
                    "scrape_date": "2025-06-04",
                    "data_quality_score": 100.0
                }
                
                insert_result = supabase.table('diva_intelligence').insert(test_record).execute()
                print(f"✅ {key_name}: INSERT works - {len(insert_result.data)} record(s)")
                
                # Clean up
                supabase.table('diva_intelligence').delete().eq('company_id', 'TEST_KEY_VERIFY').execute()
                print(f"🧹 Test record cleaned up")
            
        except Exception as e:
            print(f"❌ {key_name}: INVALID - {str(e)[:150]}...")
    
    print(f"\n💡 Instructions:")
    print(f"1. Go to: https://udfgtccxbqmalgpqyxzz.supabase.co/project/udfgtccxbqmalgpqyxzz/settings/api")
    print(f"2. Copy the 'anon public' and 'service_role' keys")
    print(f"3. Paste them in this script and run again")

if __name__ == "__main__":
    verify_keys() 