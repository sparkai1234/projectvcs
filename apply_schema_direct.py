#!/usr/bin/env python3
"""
🚀 Apply Schema Updates Directly
Uses individual SQL operations to update schemas
"""

import psycopg2
from api_config import get_supabase_config
import time

def get_postgres_connection():
    """Get direct PostgreSQL connection to Supabase"""
    config = get_supabase_config(use_service_role=True)
    
    # Extract connection details from Supabase URL
    # Format: postgresql://postgres:[password]@[host]:[port]/postgres
    url = config['url'].replace('https://', '').replace('http://', '')
    
    # For Supabase, we need to use the direct PostgreSQL connection
    # This requires the database password from environment or config
    
    # Try to construct connection string
    try:
        # You'll need to provide your actual database connection details
        # This is a placeholder - you should get these from your Supabase dashboard
        conn_params = {
            'host': url.split('.')[0] + '.supabase.co',
            'port': 5432,
            'database': 'postgres',
            'user': 'postgres',
            'password': 'your_db_password_here'  # Replace with actual password
        }
        
        print("⚠️ Direct PostgreSQL connection requires database password")
        print("🔧 Using alternative approach with Supabase client...")
        return None
        
    except Exception as e:
        print(f"❌ Cannot establish direct connection: {e}")
        return None

def apply_fund_table_updates():
    """Apply fund_table schema updates using Supabase client"""
    print("🔧 UPDATING FUND_TABLE SCHEMA")
    print("=" * 50)
    
    from supabase import create_client
    config = get_supabase_config(use_service_role=True)
    supabase = create_client(config['url'], config['key'])
    
    # Since we can't execute DDL directly, let's check what we can do
    # and provide manual SQL commands
    
    print("📋 Required fund_table schema updates:")
    
    fund_updates = [
        "ALTER TABLE fund_table ADD COLUMN IF NOT EXISTS fund_id TEXT;",
        "ALTER TABLE fund_table ADD COLUMN IF NOT EXISTS registration_date DATE;",
        "ALTER TABLE fund_table ADD COLUMN IF NOT EXISTS expiry_date DATE;",
        "ALTER TABLE fund_table ADD COLUMN IF NOT EXISTS company_name TEXT;",
        "ALTER TABLE fund_table ADD COLUMN IF NOT EXISTS total_amount BIGINT;",
        "ALTER TABLE fund_table ADD COLUMN IF NOT EXISTS operating_amount BIGINT;",
        "ALTER TABLE fund_table ADD COLUMN IF NOT EXISTS investment_field TEXT;",
        "ALTER TABLE fund_table ADD COLUMN IF NOT EXISTS investment_detail TEXT;",
        "ALTER TABLE fund_table ADD COLUMN IF NOT EXISTS investment_character TEXT;",
        "ALTER TABLE fund_table ADD COLUMN IF NOT EXISTS company_industry TEXT;",
        "ALTER TABLE fund_table ADD COLUMN IF NOT EXISTS founded_date DATE;",
        "ALTER TABLE fund_table ADD COLUMN IF NOT EXISTS notes TEXT;",
        "ALTER TABLE fund_table ADD COLUMN IF NOT EXISTS description TEXT;",
        "ALTER TABLE fund_table ADD COLUMN IF NOT EXISTS sector TEXT;",
        "ALTER TABLE fund_table ADD COLUMN IF NOT EXISTS stage TEXT;",
        "ALTER TABLE fund_table ADD COLUMN IF NOT EXISTS import_date TIMESTAMP WITH TIME ZONE;",
        "ALTER TABLE fund_table ADD COLUMN IF NOT EXISTS data_source TEXT;"
    ]
    
    for i, sql in enumerate(fund_updates, 1):
        print(f"   {i:2d}. {sql}")
    
    return fund_updates

def create_vc_companies_table():
    """Provide SQL to create vc_companies table"""
    print(f"\n🏢 CREATING VC_COMPANIES TABLE")
    print("=" * 50)
    
    vc_table_sql = """
CREATE TABLE IF NOT EXISTS vc_companies (
    id SERIAL PRIMARY KEY,
    company_name TEXT NOT NULL,
    company_id TEXT UNIQUE,
    industry TEXT,
    location TEXT,
    address TEXT,
    zip_code TEXT,
    company_type TEXT,
    founded TEXT,
    founded_date DATE,
    operating_scale INTEGER,
    operating_amount DECIMAL(15,2),
    business_category TEXT,
    strategy_planner BOOLEAN DEFAULT FALSE,
    description TEXT,
    website TEXT,
    phone TEXT,
    email TEXT,
    representative TEXT,
    employee_count INTEGER,
    investment_focus TEXT,
    investment_stage TEXT,
    investment_sectors TEXT[],
    aum BIGINT,
    fund_count INTEGER,
    total_investments INTEGER,
    status TEXT DEFAULT 'Active',
    data_type TEXT DEFAULT 'VC Company',
    import_date TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    data_source TEXT DEFAULT 'Korean VC Database (vcs.go.kr)',
    notes TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);"""
    
    print("📋 VC Companies table creation SQL:")
    print(vc_table_sql)
    
    return vc_table_sql

def provide_manual_instructions():
    """Provide manual instructions for schema updates"""
    print(f"\n📋 MANUAL SCHEMA UPDATE INSTRUCTIONS")
    print("=" * 60)
    print("🎯 Since direct SQL execution isn't available, please:")
    print("   1. Go to your Supabase Dashboard")
    print("   2. Navigate to SQL Editor")
    print("   3. Execute the SQL commands shown above")
    print("   4. Run the migration scripts after schema updates")
    
    print(f"\n🔧 ALTERNATIVE: Update fund_table with new migration script")
    print("   💡 We can modify the migration to handle missing fields gracefully")
    
    return True

def create_flexible_migration():
    """Create a migration script that works with current schema"""
    print(f"\n🚀 CREATING FLEXIBLE MIGRATION APPROACH")
    print("=" * 50)
    
    print("💡 Strategy: Create migration that adapts to current schema")
    print("   ✅ Use existing fields where available")
    print("   ✅ Map data to closest matching fields")
    print("   ✅ Store rich data in JSON fields if needed")
    
    return True

def main():
    """Main function"""
    print("🚀 SCHEMA UPDATE ANALYSIS")
    print("=" * 60)
    print("🎯 Goal: Prepare database for rich fund and VC data")
    print("=" * 60)
    
    # Analyze current situation
    fund_updates = apply_fund_table_updates()
    vc_sql = create_vc_companies_table()
    
    # Provide instructions
    provide_manual_instructions()
    
    # Create flexible approach
    create_flexible_migration()
    
    print(f"\n🎉 NEXT STEPS")
    print("=" * 50)
    print("1. 🔧 Apply schema updates manually in Supabase Dashboard")
    print("2. 🚀 Run comprehensive fund migration")
    print("3. 🏢 Create and populate VC companies table")
    print("4. ✅ Verify all data migration")
    
    print(f"\n💡 OR: Use flexible migration approach with current schema")

if __name__ == "__main__":
    main() 