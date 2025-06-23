import os
from supabase import create_client

def analyze_additional_tables():
    print("🧹 Additional Tables Cleanup Analysis")
    print("=" * 60)
    print("🎯 Analyzing: KVIC, KDB, KGrowth, PDF tables")
    print()
    
    # Initialize Supabase client
    url = os.getenv('SUPABASE_URL')
    key = os.getenv('SUPABASE_SERVICE_ROLE_KEY') or os.getenv('SUPABASE_KEY')
    
    if not url or not key:
        print("❌ Missing Supabase credentials")
        return
    
    supabase = create_client(url, key)
    
    # Tables to analyze based on your schema
    target_tables = [
        # KVIC tables
        'kvic_fund_raw',
        'kvic_investment_raw',
        'kvic_portfolio_raw',
        
        # KDB tables
        'kdb_fund_of_funds_raw',
        
        # KGrowth tables
        'kgrowth_fund_of_funds_raw',
        
        # PDF/AI analysis tables
        'pdf_analysis_results',
        'ai_trend_insights',
        'investment_intelligence_insights',
        'trend_reports'
    ]
    
    print("🔍 ANALYZING TARGET TABLES:")
    print("-" * 50)
    
    empty_tables = []
    non_empty_tables = []
    missing_tables = []
    total_records = 0
    
    for table in target_tables:
        try:
            response = supabase.table(table).select("*", count="exact").execute()
            count = response.count if hasattr(response, 'count') else len(response.data)
            
            if count == 0:
                print(f"⚪ {table}: {count} records - SAFE TO DELETE")
                empty_tables.append(table)
            else:
                print(f"⚠️ {table}: {count:,} records - HAS DATA")
                non_empty_tables.append((table, count))
                total_records += count
                
        except Exception as e:
            if "does not exist" in str(e).lower() or "relation" in str(e).lower():
                print(f"❓ {table}: Table does not exist")
                missing_tables.append(table)
            else:
                print(f"❌ {table}: Error - {str(e)[:50]}")
    
    print(f"\n📊 ANALYSIS SUMMARY:")
    print("=" * 40)
    print(f"⚪ Empty tables (safe to delete): {len(empty_tables)}")
    print(f"⚠️ Tables with data: {len(non_empty_tables)}")
    print(f"❓ Non-existent tables: {len(missing_tables)}")
    print(f"📈 Total records in non-empty tables: {total_records:,}")
    
    if empty_tables:
        print(f"\n🗑️ EMPTY TABLES - SAFE TO DELETE:")
        print("-" * 40)
        for table in empty_tables:
            print(f"  • {table}")
    
    if non_empty_tables:
        print(f"\n⚠️ TABLES WITH DATA - REVIEW BEFORE DELETING:")
        print("-" * 50)
        for table, count in non_empty_tables:
            print(f"  • {table}: {count:,} records")
        
        print(f"\n💡 RECOMMENDATION:")
        print("Review these tables to see if the data is needed.")
        print("If not needed, you can delete them, but they contain actual data.")
    
    if missing_tables:
        print(f"\n❓ NON-EXISTENT TABLES:")
        print("-" * 30)
        for table in missing_tables:
            print(f"  • {table}")
        print("These tables don't exist in your database.")
    
    # Generate cleanup SQL for empty tables
    if empty_tables:
        print(f"\n🛠️ SQL CLEANUP COMMANDS FOR EMPTY TABLES:")
        print("=" * 50)
        print("Copy and paste in Supabase SQL Editor:")
        print()
        
        for table in empty_tables:
            print(f"DROP TABLE IF EXISTS public.{table} CASCADE;")
        
        print(f"\n-- Verification query:")
        table_list = "', '".join(empty_tables)
        print(f"SELECT tablename FROM pg_tables WHERE schemaname = 'public' AND tablename IN ('{table_list}');")
    
    # Generate cleanup SQL for ALL tables (with warning)
    all_existing_tables = empty_tables + [table for table, _ in non_empty_tables]
    if all_existing_tables:
        print(f"\n⚠️ SQL TO DELETE ALL ANALYZED TABLES (INCLUDING DATA):")
        print("=" * 60)
        print("⚠️ WARNING: This will delete tables with data! Use with caution!")
        print()
        
        for table in all_existing_tables:
            print(f"DROP TABLE IF EXISTS public.{table} CASCADE;")

if __name__ == "__main__":
    analyze_additional_tables() 