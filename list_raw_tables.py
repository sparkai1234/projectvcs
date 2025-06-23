import os
from supabase import create_client

def list_raw_tables_for_cleanup():
    print("🧹 DIVA Raw Tables Analysis & Cleanup Guide")
    print("=" * 60)
    
    # Initialize Supabase client
    url = os.getenv('SUPABASE_URL')
    key = os.getenv('SUPABASE_SERVICE_ROLE_KEY') or os.getenv('SUPABASE_KEY')
    
    if not url or not key:
        print("❌ Missing Supabase credentials")
        return
    
    supabase = create_client(url, key)
    
    # Raw tables to analyze
    raw_tables = [
        'diva_financial_raw',
        'diva_investment_performance_raw', 
        'diva_association_raw',
        'diva_personnel_raw',
        'diva_professional_raw',
        'diva_disclosure_raw',
        'diva_fund_raw',
        'diva_vcmap_raw',
        'diva_violation_raw'
    ]
    
    print("🔍 ANALYZING RAW TABLES:")
    print("-" * 40)
    
    empty_tables = []
    non_empty_tables = []
    
    for table in raw_tables:
        try:
            response = supabase.table(table).select("*", count="exact").execute()
            count = response.count if hasattr(response, 'count') else len(response.data)
            
            if count == 0:
                print(f"⚪ {table}: {count} records - SAFE TO DELETE")
                empty_tables.append(table)
            else:
                print(f"⚠️ {table}: {count} records - KEEP (has data)")
                non_empty_tables.append(table)
                
        except Exception as e:
            print(f"❌ {table}: Error - {str(e)[:50]}")
    
    print(f"\n📊 SUMMARY:")
    print("=" * 30)
    print(f"🗑️ Empty tables (safe to delete): {len(empty_tables)}")
    print(f"💾 Tables with data (keep): {len(non_empty_tables)}")
    
    if empty_tables:
        print(f"\n🛠️ MANUAL CLEANUP INSTRUCTIONS:")
        print("=" * 40)
        print("Copy and paste these SQL commands in Supabase SQL Editor:")
        print()
        
        for table in empty_tables:
            print(f"DROP TABLE IF EXISTS public.{table} CASCADE;")
        
        print(f"\n-- Verification query (should return 0 rows):")
        print("SELECT tablename FROM pg_tables WHERE schemaname = 'public' AND tablename LIKE 'diva_%_raw';")
        
        print(f"\n💡 ALTERNATIVE: Use Supabase Dashboard")
        print("1. Go to Supabase Dashboard → Table Editor")
        print("2. Find each table listed above")
        print("3. Click the table → Settings → Delete table")
        
    else:
        print("\n✅ No empty raw tables found - nothing to clean up!")

if __name__ == "__main__":
    list_raw_tables_for_cleanup() 