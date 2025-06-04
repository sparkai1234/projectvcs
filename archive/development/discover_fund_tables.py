#!/usr/bin/env python3
"""
Discover fund-related tables and their schema
This will help us understand what fund data is available for comprehensive VC analysis
"""

from supabase import create_client, Client
from api_config import get_supabase_config
import json

def discover_fund_tables():
    """Discover all fund-related tables and their schema"""
    print("🔍 Discovering Fund-Related Tables in Supabase...")
    print("=" * 60)
    
    # Initialize Supabase connection
    config = get_supabase_config(use_service_role=True)
    supabase: Client = create_client(config['url'], config['key'])
    
    # List of potential fund-related tables to check
    potential_fund_tables = [
        "fund_table", "funds", "fund_details", "fund_info",
        "investment_funds", "vc_funds", "fund_performance",
        "fund_portfolio", "fund_history", "fund_financials",
        "fund_managers", "fund_strategies", "fund_types",
        "fund_investors", "fund_companies", "company_funds"
    ]
    
    discovered_tables = {}
    total_records = 0
    
    print("Checking potential fund-related tables...")
    
    for table_name in potential_fund_tables:
        try:
            print(f"\n📊 Checking: {table_name}")
            
            # Try to get record count
            try:
                count_response = supabase.table(table_name).select("*", count="exact").limit(1).execute()
                record_count = count_response.count if hasattr(count_response, 'count') else len(count_response.data)
            except:
                # Fallback method
                sample_response = supabase.table(table_name).select("*").limit(10).execute()
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
                print(f"   Fields: {', '.join(fields[:8])}{'...' if len(fields) > 8 else ''}")
                
        except Exception as e:
            print(f"❌ Not found: {e}")
    
    # Also check if there are any tables we might have missed
    print(f"\n🔍 Checking for other tables that might contain fund data...")
    
    # Check vc_table for fund-related fields
    try:
        vc_sample = supabase.table('vc_table').select("*").limit(1).execute()
        if vc_sample.data:
            vc_fields = list(vc_sample.data[0].keys())
            fund_related_fields = [field for field in vc_fields if 'fund' in field.lower() or 'aum' in field.lower() or 'asset' in field.lower()]
            if fund_related_fields:
                print(f"✅ vc_table has fund-related fields: {', '.join(fund_related_fields)}")
    except Exception as e:
        print(f"❌ Error checking vc_table: {e}")
    
    print(f"\n📈 Summary:")
    print(f"   Total fund-related tables found: {len(discovered_tables)}")
    print(f"   Total fund records: {total_records:,}")
    
    if discovered_tables:
        # Save detailed schema to file
        with open("fund_tables_schema.json", "w", encoding="utf-8") as f:
            json.dump(discovered_tables, f, indent=2, ensure_ascii=False)
        
        print(f"💾 Fund schema saved to: fund_tables_schema.json")
        
        # Show detailed analysis for each table
        print(f"\n📋 Detailed Fund Table Analysis:")
        print("=" * 60)
        
        for table_name, info in discovered_tables.items():
            print(f"\n🏷️ Table: {table_name}")
            print(f"   Records: {info['record_count']:,}")
            print(f"   Fields ({len(info['fields'])}): {', '.join(info['fields'])}")
            
            # Show sample data for key fields
            sample = info.get('sample_record', {})
            if sample:
                print(f"   Sample data:")
                for key, value in list(sample.items())[:6]:
                    display_value = str(value)[:50] + "..." if len(str(value)) > 50 else str(value)
                    print(f"     {key}: {display_value}")
    else:
        print("\n⚠️ No dedicated fund tables found.")
        print("Fund data might be integrated within vc_table or other tables.")
        
        # Let's check what fund-related data exists in vc_table
        print(f"\n🔍 Analyzing vc_table for fund data...")
        try:
            # Get sample of vc_table with all fields
            vc_response = supabase.table('vc_table').select("*").limit(3).execute()
            if vc_response.data:
                print(f"vc_table sample record:")
                sample_vc = vc_response.data[0]
                for key, value in sample_vc.items():
                    if value is not None:
                        display_value = str(value)[:50] + "..." if len(str(value)) > 50 else str(value)
                        print(f"   {key}: {display_value}")
        except Exception as e:
            print(f"❌ Error analyzing vc_table: {e}")
    
    return discovered_tables

if __name__ == "__main__":
    fund_tables = discover_fund_tables() 