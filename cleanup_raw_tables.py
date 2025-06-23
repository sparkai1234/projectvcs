import os
from supabase import create_client

def cleanup_raw_tables():
    print("🧹 DIVA Raw Tables Cleanup")
    print("=" * 50)
    print("🎯 Purpose: Remove unused raw tables that are not used by the scraper")
    print("✅ Safe: Only affects empty tables with 0 records")
    print()
    
    # Initialize Supabase client
    url = os.getenv('SUPABASE_URL')
    key = os.getenv('SUPABASE_SERVICE_ROLE_KEY') or os.getenv('SUPABASE_KEY')
    
    if not url or not key:
        print("❌ Missing Supabase credentials")
        return
    
    supabase = create_client(url, key)
    
    # Raw tables to drop (all confirmed empty)
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
    
    print("🔍 STEP 1: Verifying tables are empty before deletion...")
    print("-" * 50)
    
    all_empty = True
    for table in raw_tables:
        try:
            response = supabase.table(table).select("*", count="exact").execute()
            count = response.count if hasattr(response, 'count') else len(response.data)
            
            if count > 0:
                print(f"⚠️ {table}: {count} records - SKIPPING (not empty)")
                all_empty = False
            else:
                print(f"✅ {table}: 0 records - safe to delete")
        except Exception as e:
            print(f"❌ {table}: Error checking - {str(e)[:50]}")
            all_empty = False
    
    if not all_empty:
        print("\n❌ SAFETY CHECK FAILED: Some tables are not empty or inaccessible")
        print("🛡️ Cleanup aborted to prevent data loss")
        return
    
    print(f"\n🎯 STEP 2: Dropping {len(raw_tables)} empty raw tables...")
    print("-" * 50)
    
    dropped_count = 0
    
    for table in raw_tables:
        try:
            # Use RPC to execute DROP TABLE command
            result = supabase.rpc('exec_sql', {
                'sql': f'DROP TABLE IF EXISTS public.{table} CASCADE'
            }).execute()
            
            print(f"🗑️ Dropped: {table}")
            dropped_count += 1
            
        except Exception as e:
            print(f"❌ Failed to drop {table}: {str(e)[:100]}")
    
    print(f"\n📊 CLEANUP SUMMARY:")
    print("=" * 30)
    print(f"✅ Tables dropped: {dropped_count}/{len(raw_tables)}")
    print(f"🎯 Database simplified: Raw tables removed")
    print(f"💡 Processed tables preserved: All data intact")
    
    if dropped_count == len(raw_tables):
        print("\n🎉 SUCCESS: All unused raw tables cleaned up!")
        print("📈 Database is now cleaner and less confusing")
    else:
        print(f"\n⚠️ PARTIAL: {len(raw_tables) - dropped_count} tables could not be dropped")

if __name__ == "__main__":
    print("⚠️ WARNING: This will permanently delete unused raw tables")
    print("🔒 Safety: Only empty tables (0 records) will be affected")
    
    confirm = input("\nProceed with cleanup? (yes/no): ").lower().strip()
    
    if confirm == 'yes':
        cleanup_raw_tables()
    else:
        print("❌ Cleanup cancelled by user") 