#!/usr/bin/env python3
"""
Discover all Supabase tables and their schema
This will help us understand what data is available for comprehensive VC analysis
"""

from supabase import create_client, Client
from api_config import get_supabase_config
import json

def discover_database_schema():
    """Discover all tables and their schema in Supabase"""
    print("🔍 Discovering Supabase Database Schema...")
    print("=" * 50)
    
    # Initialize Supabase connection
    config = get_supabase_config(use_service_role=True)
    supabase: Client = create_client(config['url'], config['key'])
    
    # List of possible tables to check
    potential_tables = [
        "vc_table", "contacts_full", "contacts_matched",
        "funds", "fund_details", "company_financials", 
        "investment_focus", "company_locations", "portfolio_companies",
        "investments", "company_details", "fund_performance",
        "aum_data", "asset_management", "company_history"
    ]
    
    discovered_tables = {}
    total_records = 0
    
    for table_name in potential_tables:
        try:
            print(f"\n📊 Checking table: {table_name}")
            
            # Try to get record count
            try:
                count_response = supabase.table(table_name).select("*", count="exact").limit(1).execute()
                record_count = count_response.count if hasattr(count_response, 'count') else len(count_response.data)
            except:
                # Fallback method
                sample_response = supabase.table(table_name).select("*").limit(100).execute()
                record_count = len(sample_response.data)
            
            if record_count > 0:
                # Get sample records to analyze schema
                sample_response = supabase.table(table_name).select("*").limit(5).execute()
                sample_records = sample_response.data
                
                # Analyze fields
                if sample_records:
                    fields = list(sample_records[0].keys())
                    sample_record = sample_records[0]
                else:
                    fields = []
                    sample_record = {}
                
                discovered_tables[table_name] = {
                    "record_count": record_count,
                    "fields": fields,
                    "sample_record": sample_record
                }
                
                total_records += record_count
                print(f"✅ Found: {record_count:,} records")
                print(f"   Fields: {', '.join(fields[:10])}{'...' if len(fields) > 10 else ''}")
                
        except Exception as e:
            print(f"❌ Table {table_name} not found or inaccessible: {e}")
    
    print(f"\n📈 Database Summary:")
    print(f"   Total tables found: {len(discovered_tables)}")
    print(f"   Total records: {total_records:,}")
    
    # Save detailed schema to file
    with open("supabase_schema_discovery.json", "w", encoding="utf-8") as f:
        json.dump(discovered_tables, f, indent=2, ensure_ascii=False)
    
    print(f"\n💾 Detailed schema saved to: supabase_schema_discovery.json")
    
    # Show detailed analysis for each table
    print(f"\n📋 Detailed Table Analysis:")
    print("=" * 50)
    
    for table_name, info in discovered_tables.items():
        print(f"\n🏷️ Table: {table_name}")
        print(f"   Records: {info['record_count']:,}")
        print(f"   Fields ({len(info['fields'])}): {', '.join(info['fields'])}")
        
        # Show sample data for key fields
        sample = info.get('sample_record', {})
        if sample:
            print(f"   Sample data:")
            for key, value in list(sample.items())[:5]:
                display_value = str(value)[:50] + "..." if len(str(value)) > 50 else str(value)
                print(f"     {key}: {display_value}")
    
    return discovered_tables

if __name__ == "__main__":
    schema = discover_database_schema() 