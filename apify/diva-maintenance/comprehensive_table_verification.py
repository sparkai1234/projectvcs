#!/usr/bin/env python3
"""
Comprehensive Table Verification
Checks all DIVA tables against the original dataset to verify data integrity
"""

import json
import os
from supabase import create_client, Client
import sys

def comprehensive_table_verification():
    """Verify all DIVA tables against the original dataset"""
    print("🔍 === COMPREHENSIVE TABLE VERIFICATION ===")
    
    # Initialize Supabase client
    supabase_url = os.getenv('SUPABASE_URL')
    supabase_key = os.getenv('SUPABASE_SERVICE_ROLE_KEY') or os.getenv('SUPABASE_KEY')
    
    if not supabase_url or not supabase_key:
        print("❌ Error: SUPABASE_URL and SUPABASE_SERVICE_ROLE_KEY environment variables required")
        sys.exit(1)
    
    supabase: Client = create_client(supabase_url, supabase_key)
    print(f"✅ Connected to Supabase")
    
    # Load original dataset
    dataset_path = "../diva-scraper-standalone/dataset_final-diva-scraper_2025-06-10_00-27-35-666.json"
    
    try:
        with open(dataset_path, 'r', encoding='utf-8') as f:
            data = json.load(f)
        print(f"✅ Loaded {len(data):,} records from dataset")
    except Exception as e:
        print(f"❌ Error loading dataset: {e}")
        return False
    
    # Expected counts from dataset
    expected_counts = {}
    for record in data:
        datatype = record.get('dataType')
        expected_counts[datatype] = expected_counts.get(datatype, 0) + 1
    
    print(f"\n📊 EXPECTED COUNTS FROM DATASET:")
    for datatype, count in sorted(expected_counts.items()):
        print(f"   - {datatype}: {count}")
    
    # Table mappings
    table_mappings = {
        'investment_performance': 'diva_investment_performance',
        'financial_statements_balance': 'diva_financial_statements',
        'financial_statements_income': 'diva_financial_statements', 
        'association_status': 'diva_association_status',
        'personnel_status': 'diva_personnel_status',
        'professional_personnel': 'diva_professional_personnel',
        'violations': 'diva_violations',
        'vc_map': 'diva_vc_map'
    }
    
    print(f"\n🔍 CHECKING EACH TABLE:")
    
    # Check each table
    for datatype, table_name in table_mappings.items():
        print(f"\n📋 Checking {table_name} ({datatype})...")
        
        try:
            # Get current count
            response = supabase.table(table_name).select('*', count='exact').execute()
            current_count = response.count
            expected_count = expected_counts.get(datatype, 0)
            
            print(f"   Expected: {expected_count}, Current: {current_count}")
            
            if current_count != expected_count:
                print(f"   ❌ COUNT MISMATCH!")
            else:
                print(f"   ✅ Count matches")
            
            # Check sample data structure
            if response.data and len(response.data) > 0:
                sample = response.data[0]
                print(f"   📋 Sample record structure:")
                for key, value in sample.items():
                    if key in ['id', 'created_at']:
                        continue
                    value_preview = str(value)[:50] if value else "NULL"
                    print(f"      {key}: {value_preview}")
                
                # Check for obvious data issues
                issues = []
                if 'company_name' in sample:
                    if not sample['company_name'] or str(sample['company_name']).replace('.', '').isdigit():
                        issues.append("company_name appears to be numeric/missing")
                
                if 'person_name' in sample:
                    if not sample['person_name'] or str(sample['person_name']).replace('.', '').isdigit():
                        issues.append("person_name appears to be numeric/missing")
                
                if issues:
                    print(f"   ⚠️ DATA ISSUES: {', '.join(issues)}")
                else:
                    print(f"   ✅ Data structure looks correct")
            
        except Exception as e:
            print(f"   ❌ Error checking {table_name}: {str(e)}")
    
    # Special check for financial statements (should have both balance and income)
    print(f"\n📊 SPECIAL CHECK: Financial Statements...")
    try:
        response = supabase.table('diva_financial_statements').select('tab_type', count='exact').execute()
        
        balance_count = len([r for r in response.data if r.get('tab_type') == 'balance_sheet'])
        income_count = len([r for r in response.data if r.get('tab_type') == 'income_statement'])
        
        expected_balance = expected_counts.get('financial_statements_balance', 0)
        expected_income = expected_counts.get('financial_statements_income', 0)
        
        print(f"   Balance sheets - Expected: {expected_balance}, Current: {balance_count}")
        print(f"   Income statements - Expected: {expected_income}, Current: {income_count}")
        
        if balance_count != expected_balance:
            print(f"   ❌ Balance sheet count mismatch!")
        if income_count != expected_income:
            print(f"   ❌ Income statement count mismatch!")
        
        if balance_count == expected_balance and income_count == expected_income:
            print(f"   ✅ Financial statements counts match")
            
    except Exception as e:
        print(f"   ❌ Error checking financial statements: {str(e)}")
    
    return True

if __name__ == "__main__":
    success = comprehensive_table_verification()
    if success:
        print(f"\n🎉 Comprehensive table verification completed!")
    else:
        print(f"\n❌ Comprehensive table verification failed") 