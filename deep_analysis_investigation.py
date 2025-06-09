#!/usr/bin/env python3
"""
Deep Investigation Script for DIVA Scraper Issues
1. Find missing 9 association records - what specific data is missing?
2. Check financial data for duplication patterns across tabs
"""

import json
from collections import defaultdict, Counter

def investigate_association_missing_data():
    print("🔍 ASSOCIATION STATUS INVESTIGATION - Finding Missing 9 Records")
    print("=" * 60)
    
    # Load the dataset
    with open('apify/diva-scraper-standalone/dataset_projectvcs-4_2025-06-08_11-21-35-139.json', 'r', encoding='utf-8') as f:
        records = json.loads(f.read())
    
    association_records = [r for r in records if r.get('dataSource') == 'association_status']
    
    print(f"📊 Association Records Found: {len(association_records)}")
    print(f"📊 Target Records: 2231")
    print(f"📊 Missing: {2231 - len(association_records)} records")
    
    # Analyze first column (usually ID/index) to find gaps
    first_column_values = []
    for record in association_records:
        first_col = record.get('column_0', '')
        if first_col and first_col.isdigit():
            first_column_values.append(int(first_col))
    
    if first_column_values:
        first_column_values.sort()
        print(f"\n📈 ID/Index Analysis:")
        print(f"  Lowest ID: {min(first_column_values)}")
        print(f"  Highest ID: {max(first_column_values)}")
        print(f"  Total IDs found: {len(first_column_values)}")
        
        # Look for gaps in sequence
        if len(first_column_values) > 1:
            gaps = []
            for i in range(min(first_column_values), max(first_column_values) + 1):
                if i not in first_column_values:
                    gaps.append(i)
            
            if gaps:
                print(f"  Missing IDs: {gaps[:20]}{'...' if len(gaps) > 20 else ''}")
                print(f"  Total gaps: {len(gaps)}")
            else:
                print("  No gaps in ID sequence")
    
    # Analyze record structure patterns
    print(f"\n📋 Record Structure Analysis:")
    structure_patterns = defaultdict(int)
    sample_records = []
    
    for i, record in enumerate(association_records[:10]):
        columns = [k for k in record.keys() if k.startswith('column_')]
        structure_patterns[len(columns)] += 1
        
        if i < 3:
            sample_records.append(record)
    
    print(f"  Column count patterns:")
    for col_count, freq in sorted(structure_patterns.items()):
        print(f"    {col_count} columns: {freq} records")
    
    print(f"\n💡 Sample Records (first 3):")
    for i, record in enumerate(sample_records):
        print(f"  Record {i+1}:")
        columns = [k for k in record.keys() if k.startswith('column_')]
        for col in columns[:5]:  # Show first 5 columns
            value = str(record.get(col, ''))[:50]
            print(f"    {col}: {value}")
        print()
    
    # Check for empty or invalid records
    empty_records = 0
    invalid_records = 0
    
    for record in association_records:
        columns = [k for k in record.keys() if k.startswith('column_')]
        if not columns:
            empty_records += 1
            continue
            
        has_data = False
        for col in columns:
            value = record.get(col, '').strip()
            if value and value != '-' and value != '　':
                has_data = True
                break
        
        if not has_data:
            invalid_records += 1
    
    print(f"📊 Data Quality Analysis:")
    print(f"  Valid records: {len(association_records) - empty_records - invalid_records}")
    print(f"  Empty records: {empty_records}")
    print(f"  Invalid records: {invalid_records}")
    
    return association_records

def investigate_financial_duplication():
    print("\n🔍 FINANCIAL STATEMENTS DUPLICATION INVESTIGATION")
    print("=" * 60)
    
    # Load the dataset
    with open('apify/diva-scraper-standalone/dataset_projectvcs-4_2025-06-08_11-21-35-139.json', 'r', encoding='utf-8') as f:
        records = json.loads(f.read())
    
    financial_records = [r for r in records if r.get('dataSource') == 'financial_statements']
    
    print(f"📊 Total Financial Records: {len(financial_records)}")
    
    # Separate by tab type
    balance_sheet = [r for r in financial_records if r.get('tabType') == '재무상태표']
    income_statement = [r for r in financial_records if r.get('tabType') == '손익계산서']
    unknown_tab = [r for r in financial_records if r.get('tabType') not in ['재무상태표', '손익계산서']]
    
    print(f"📊 Balance Sheet (재무상태표): {len(balance_sheet)} records")
    print(f"📊 Income Statement (손익계산서): {len(income_statement)} records")
    print(f"📊 Unknown tab type: {len(unknown_tab)} records")
    
    # Check for exact duplicates within each tab
    def check_duplicates(records, tab_name):
        print(f"\n🔍 Checking duplicates in {tab_name}:")
        
        # Create signature for each record (all column values combined)
        signatures = []
        duplicate_groups = defaultdict(list)
        
        for i, record in enumerate(records):
            columns = [k for k in record.keys() if k.startswith('column_')]
            signature = '|'.join([str(record.get(col, '')) for col in sorted(columns)])
            signatures.append(signature)
            duplicate_groups[signature].append(i)
        
        # Find duplicates
        duplicates = {sig: indices for sig, indices in duplicate_groups.items() if len(indices) > 1}
        
        print(f"  Total records: {len(records)}")
        print(f"  Unique signatures: {len(set(signatures))}")
        print(f"  Duplicate groups: {len(duplicates)}")
        
        if duplicates:
            total_duplicate_records = sum(len(indices) - 1 for indices in duplicates.values())
            print(f"  Total duplicate records: {total_duplicate_records}")
            
            # Show examples
            print(f"  Sample duplicate groups:")
            for i, (sig, indices) in enumerate(list(duplicates.items())[:3]):
                print(f"    Group {i+1}: {len(indices)} identical records (indices: {indices})")
                # Show sample record
                sample_record = records[indices[0]]
                columns = [k for k in sample_record.keys() if k.startswith('column_')]
                for col in columns[:3]:
                    value = str(sample_record.get(col, ''))[:30]
                    print(f"      {col}: {value}")
                print()
        else:
            print(f"  ✅ No exact duplicates found!")
        
        return duplicates
    
    # Check duplicates in each tab
    balance_duplicates = check_duplicates(balance_sheet, "Balance Sheet")
    income_duplicates = check_duplicates(income_statement, "Income Statement")
    
    # Check for cross-tab duplicates
    print(f"\n🔍 Checking cross-tab duplicates (Balance Sheet vs Income Statement):")
    
    balance_signatures = set()
    income_signatures = set()
    
    for record in balance_sheet:
        columns = [k for k in record.keys() if k.startswith('column_')]
        signature = '|'.join([str(record.get(col, '')) for col in sorted(columns)])
        balance_signatures.add(signature)
    
    for record in income_statement:
        columns = [k for k in record.keys() if k.startswith('column_')]
        signature = '|'.join([str(record.get(col, '')) for col in sorted(columns)])
        income_signatures.add(signature)
    
    cross_duplicates = balance_signatures.intersection(income_signatures)
    print(f"  Cross-tab duplicates: {len(cross_duplicates)} records")
    
    if cross_duplicates:
        print(f"  ⚠️ Found {len(cross_duplicates)} records that appear in both tabs!")
        
        # Show examples of cross-tab duplicates
        print(f"  Sample cross-tab duplicate:")
        for record in balance_sheet:
            columns = [k for k in record.keys() if k.startswith('column_')]
            signature = '|'.join([str(record.get(col, '')) for col in sorted(columns)])
            if signature in cross_duplicates:
                for col in columns[:3]:
                    value = str(record.get(col, ''))[:30]
                    print(f"    {col}: {value}")
                break
    else:
        print(f"  ✅ No cross-tab duplicates found!")
    
    # Pattern analysis
    print(f"\n📊 Pattern Analysis:")
    
    # Company name analysis (usually first column)
    balance_companies = set()
    income_companies = set()
    
    for record in balance_sheet:
        company = record.get('column_0', '').strip()
        if company:
            balance_companies.add(company)
    
    for record in income_statement:
        company = record.get('column_0', '').strip()
        if company:
            income_companies.add(company)
    
    print(f"  Balance Sheet companies: {len(balance_companies)}")
    print(f"  Income Statement companies: {len(income_companies)}")
    print(f"  Common companies: {len(balance_companies.intersection(income_companies))}")
    
    if len(balance_companies.intersection(income_companies)) > 0:
        print(f"  Company overlap: {len(balance_companies.intersection(income_companies))/min(len(balance_companies), len(income_companies))*100:.1f}%")
    
    return financial_records

if __name__ == "__main__":
    print("🚨 DEEP INVESTIGATION - DIVA SCRAPER PRECISION ISSUES")
    print("=" * 70)
    
    # 1. Investigate missing association data
    association_data = investigate_association_missing_data()
    
    # 2. Investigate financial data duplication
    financial_data = investigate_financial_duplication()
    
    print(f"\n🎯 INVESTIGATION COMPLETE")
    print("=" * 70) 