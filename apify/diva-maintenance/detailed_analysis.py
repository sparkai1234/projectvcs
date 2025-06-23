#!/usr/bin/env python3
"""
Detailed DIVA Dataset Analysis
Maps data types to table structures and analyzes column content
"""

import json
from collections import Counter, defaultdict

def detailed_analysis():
    print("🔍 === Detailed DIVA Dataset Analysis ===")
    
    dataset_path = "../diva-scraper-standalone/dataset_final-diva-scraper_2025-06-10_00-27-35-666.json"
    
    with open(dataset_path, 'r', encoding='utf-8') as f:
        data = json.load(f)
    
    print(f"📊 Total records: {len(data):,}")
    
    # Analyze data types
    data_types = Counter()
    data_by_type = defaultdict(list)
    
    for record in data:
        dtype = record.get('dataType', 'unknown')
        data_types[dtype] += 1
        data_by_type[dtype].append(record)
    
    print(f"\n📋 Data Types Found:")
    for dtype, count in data_types.most_common():
        print(f"  - {dtype}: {count:,} records")
    
    # Analyze column patterns for each data type
    print(f"\n🔍 Column Analysis by Data Type:")
    
    for dtype in sorted(data_types.keys()):
        print(f"\n📊 {dtype} ({data_types[dtype]} records):")
        
        # Sample first few records
        sample_records = data_by_type[dtype][:5]
        
        # Analyze column usage
        column_usage = defaultdict(set)
        for record in sample_records:
            for i in range(7):  # column_0 to column_6
                col_key = f'column_{i}'
                if col_key in record and record[col_key]:
                    # Store unique values (truncated for display)
                    val = str(record[col_key])[:50]
                    column_usage[col_key].add(val)
        
        # Show column patterns
        for col in sorted(column_usage.keys()):
            values = list(column_usage[col])[:3]  # Show first 3 unique values
            print(f"    {col}: {values}")
        
        # Show sample record
        if sample_records:
            print(f"    Sample record:")
            sample = sample_records[0]
            for key, value in sample.items():
                if key.startswith('column_') and value:
                    display_val = str(value)[:100] if value else "None"
                    print(f"      {key}: {display_val}")
            print(f"      extractedAt: {sample.get('extractedAt', 'N/A')}")
            print(f"      rowIndex: {sample.get('rowIndex', 'N/A')}")
    
    # Suggest table mappings
    print(f"\n🎯 Suggested Table Mappings:")
    
    table_mappings = {
        'investment_performance': ['투자성과', 'investment', 'performance'],
        'financial_statements': ['재무제표', 'financial', 'statements', '재무'],
        'association_status': ['협회현황', 'association', 'status'],
        'personnel_status': ['임직원현황', 'personnel', 'employee'],
        'professional_personnel': ['전문인력', 'professional', 'expert'],
        'violations': ['위반내역', 'violation', 'penalty'],
        'vc_map': ['vcmap', 'vc', 'venture']
    }
    
    for table_name, keywords in table_mappings.items():
        matching_types = []
        for dtype in data_types.keys():
            if any(keyword in dtype.lower() for keyword in keywords):
                matching_types.append(f"{dtype} ({data_types[dtype]} records)")
        
        if matching_types:
            print(f"  {table_name}:")
            for match in matching_types:
                print(f"    - {match}")
    
    print(f"\n✅ Detailed analysis complete!")

if __name__ == "__main__":
    detailed_analysis() 