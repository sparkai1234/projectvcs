#!/usr/bin/env python3
"""
Investigate Data Structure
Analyzes the actual data structure and column mappings in the original dataset
"""

import json
import os

def investigate_data_structure():
    """Investigate the actual data structure of the original dataset"""
    print("🔍 === INVESTIGATING DATA STRUCTURE ===")
    
    # Load original dataset
    dataset_path = "../diva-scraper-standalone/dataset_final-diva-scraper_2025-06-10_00-27-35-666.json"
    
    try:
        with open(dataset_path, 'r', encoding='utf-8') as f:
            data = json.load(f)
        print(f"✅ Loaded {len(data):,} records from dataset")
    except Exception as e:
        print(f"❌ Error loading dataset: {e}")
        return False
    
    # Look at financial statement records specifically
    balance_records = [record for record in data if record.get('dataType') == 'financial_statements_balance']
    income_records = [record for record in data if record.get('dataType') == 'financial_statements_income']
    
    print(f"\n📊 Found {len(balance_records)} balance sheet records")
    print(f"📊 Found {len(income_records)} income statement records")
    
    if balance_records:
        print(f"\n📋 SAMPLE BALANCE SHEET RECORD:")
        sample = balance_records[0]
        for key, value in sample.items():
            print(f"   {key}: {value}")
    
    if income_records:
        print(f"\n📋 SAMPLE INCOME STATEMENT RECORD:")
        sample = income_records[0]
        for key, value in sample.items():
            print(f"   {key}: {value}")
    
    # Check a few more samples to understand the pattern
    print(f"\n📋 FIRST 3 BALANCE SHEET SAMPLES:")
    for i, record in enumerate(balance_records[:3]):
        print(f"\n   Sample {i+1}:")
        print(f"   - dataType: {record.get('dataType')}")
        print(f"   - column_0: {record.get('column_0')}")
        print(f"   - column_1: {record.get('column_1')}")
        print(f"   - column_2: {record.get('column_2')}")
        print(f"   - column_3: {record.get('column_3')}")
        print(f"   - column_4: {record.get('column_4')}")
        print(f"   - column_5: {record.get('column_5')}")
        print(f"   - column_6: {record.get('column_6')}")
        print(f"   - column_7: {record.get('column_7')}")
        print(f"   - column_8: {record.get('column_8')}")
        if 'column_9' in record:
            print(f"   - column_9: {record.get('column_9')}")
    
    print(f"\n📋 FIRST 3 INCOME STATEMENT SAMPLES:")
    for i, record in enumerate(income_records[:3]):
        print(f"\n   Sample {i+1}:")
        print(f"   - dataType: {record.get('dataType')}")
        print(f"   - column_0: {record.get('column_0')}")
        print(f"   - column_1: {record.get('column_1')}")
        print(f"   - column_2: {record.get('column_2')}")
        print(f"   - column_3: {record.get('column_3')}")
        print(f"   - column_4: {record.get('column_4')}")
        print(f"   - column_5: {record.get('column_5')}")
        print(f"   - column_6: {record.get('column_6')}")
        print(f"   - column_7: {record.get('column_7')}")
        print(f"   - column_8: {record.get('column_8')}")
        if 'column_9' in record:
            print(f"   - column_9: {record.get('column_9')}")
    
    return True

if __name__ == "__main__":
    success = investigate_data_structure()
    if success:
        print(f"\n🎉 Data structure investigation completed!")
    else:
        print(f"\n❌ Data structure investigation failed") 