#!/usr/bin/env python3
import json

def check_dual_tab_implementation():
    print("🔍 CHECKING DUAL-TAB WORKFLOW IMPLEMENTATION")
    print("=" * 50)
    
    try:
        with open('apify/diva-scraper-standalone/dataset_projectvcs-4_2025-06-08_06-57-58-462.json', 'r', encoding='utf-8') as f:
            data = json.load(f)
        
        print(f"📊 Total records loaded: {len(data)}")
        
        # Check financial statements records
        fs_records = [r for r in data if r.get('dataSource') == 'financial_statements']
        print(f"📈 Financial statements records: {len(fs_records)}")
        
        # Check for tabType field (indicates dual-tab workflow)
        has_tab_type = [r for r in fs_records if 'tabType' in r]
        print(f"🏷️ Records with tabType field: {len(has_tab_type)}")
        
        if has_tab_type:
            balance_sheet = [r for r in has_tab_type if r.get('tabType') == '재무상태표']
            income_statement = [r for r in has_tab_type if r.get('tabType') == '손익계산서']
            
            print(f"📊 Balance Sheet (재무상태표): {len(balance_sheet)}")
            print(f"📊 Income Statement (손익계산서): {len(income_statement)}")
            print(f"✅ DUAL-TAB WORKFLOW: IMPLEMENTED")
            
            if len(has_tab_type) == len(fs_records):
                print("✅ All financial records have tabType - workflow working correctly")
            else:
                print(f"⚠️ Mixed records: {len(fs_records) - len(has_tab_type)} without tabType")
        else:
            print("❌ NO tabType field found - DUAL-TAB WORKFLOW NOT IMPLEMENTED")
            print("💡 The scraper is still using single-page extraction")
        
        # Check version tags
        versions = set(r.get('version', 'unknown') for r in fs_records[:10])
        print(f"🏷️ Version tags found: {versions}")
        
        # Sample record analysis
        if fs_records:
            sample = fs_records[0]
            print(f"\n📋 SAMPLE FINANCIAL RECORD:")
            print(f"   dataSource: {sample.get('dataSource')}")
            print(f"   tabType: {sample.get('tabType', 'NOT FOUND')}")
            print(f"   version: {sample.get('version', 'NOT FOUND')}")
            print(f"   extractedAt: {sample.get('extractedAt', 'NOT FOUND')}")
            
            # Show column count
            columns = [k for k in sample.keys() if k.startswith('column_')]
            print(f"   columns: {len(columns)}")
            
    except Exception as e:
        print(f"❌ ERROR: {e}")

if __name__ == "__main__":
    check_dual_tab_implementation() 