#!/usr/bin/env python3
"""
Compare Previous Datasets Analysis
Check if previous datasets show the same company overlap pattern in financial statements
"""

import json
import os
from collections import defaultdict

def analyze_dataset(file_path, dataset_name):
    print(f"\n📊 ANALYZING: {dataset_name}")
    print("=" * 50)
    
    try:
        with open(file_path, 'r', encoding='utf-8') as f:
            records = json.loads(f.read())
        
        # Get financial records
        financial_records = [r for r in records if r.get('dataSource') == 'financial_statements']
        
        if not financial_records:
            print("  No financial statements found")
            return None
        
        # Separate by tab type
        balance_sheet = [r for r in financial_records if r.get('tabType') == '재무상태표']
        income_statement = [r for r in financial_records if r.get('tabType') == '손익계산서']
        unknown_tab = [r for r in financial_records if r.get('tabType') not in ['재무상태표', '손익계산서']]
        
        print(f"  Total Financial Records: {len(financial_records)}")
        print(f"  Balance Sheet (재무상태표): {len(balance_sheet)}")
        print(f"  Income Statement (손익계산서): {len(income_statement)}")
        print(f"  Unknown tab type: {len(unknown_tab)}")
        
        if len(balance_sheet) == 0 or len(income_statement) == 0:
            print("  ⚠️ Missing one or both tab types")
            return None
        
        # Get company sets from each tab
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
        
        # Calculate overlap
        common_companies = balance_companies.intersection(income_companies)
        overlap_percentage = 0
        if len(balance_companies) > 0 and len(income_companies) > 0:
            overlap_percentage = len(common_companies) / min(len(balance_companies), len(income_companies)) * 100
        
        print(f"  Balance Sheet companies: {len(balance_companies)}")
        print(f"  Income Statement companies: {len(income_companies)}")
        print(f"  Common companies: {len(common_companies)}")
        print(f"  Company overlap: {overlap_percentage:.1f}%")
        
        # Check for internal duplicates in Income Statement
        income_signatures = []
        for record in income_statement:
            columns = [k for k in record.keys() if k.startswith('column_')]
            signature = '|'.join([str(record.get(col, '')) for col in sorted(columns)])
            income_signatures.append(signature)
        
        unique_income_sigs = len(set(income_signatures))
        internal_duplicates = len(income_signatures) - unique_income_sigs
        
        print(f"  Income Statement unique records: {unique_income_sigs}")
        print(f"  Income Statement internal duplicates: {internal_duplicates}")
        
        # Sample companies for verification
        if len(common_companies) > 0:
            sample_companies = list(common_companies)[:3]
            print(f"  Sample common companies: {sample_companies}")
        
        return {
            'total_financial': len(financial_records),
            'balance_count': len(balance_sheet),
            'income_count': len(income_statement),
            'balance_companies': len(balance_companies),
            'income_companies': len(income_companies),
            'common_companies': len(common_companies),
            'overlap_percentage': overlap_percentage,
            'income_internal_duplicates': internal_duplicates
        }
        
    except Exception as e:
        print(f"  ❌ Error analyzing {dataset_name}: {e}")
        return None

def find_and_analyze_datasets():
    print("🔍 COMPARING PREVIOUS DATASETS - Financial Statements Company Overlap")
    print("=" * 70)
    
    # Look for dataset files
    dataset_files = []
    
    # Check apify directory for datasets
    apify_path = "apify/diva-scraper-standalone"
    if os.path.exists(apify_path):
        for file in os.listdir(apify_path):
            if file.startswith("dataset_") and file.endswith(".json"):
                dataset_files.append(os.path.join(apify_path, file))
    
    if not dataset_files:
        print("No previous datasets found")
        return
    
    print(f"Found {len(dataset_files)} datasets to analyze:")
    for file in dataset_files:
        print(f"  - {os.path.basename(file)}")
    
    results = []
    
    for file_path in dataset_files:
        dataset_name = os.path.basename(file_path)
        result = analyze_dataset(file_path, dataset_name)
        if result:
            results.append({
                'name': dataset_name,
                'data': result
            })
    
    # Summary comparison
    if results:
        print(f"\n📈 SUMMARY COMPARISON:")
        print("=" * 50)
        print(f"{'Dataset':<35} | {'Overlap%':<8} | {'Balance':<7} | {'Income':<7} | {'IncomeDups':<10}")
        print("-" * 75)
        
        for result in results:
            name = result['name'][:34]
            data = result['data']
            print(f"{name:<35} | {data['overlap_percentage']:>6.1f}% | {data['balance_count']:>7} | {data['income_count']:>7} | {data['income_internal_duplicates']:>10}")
        
        # Analysis
        high_overlap_count = sum(1 for r in results if r['data']['overlap_percentage'] >= 90)
        internal_dup_count = sum(1 for r in results if r['data']['income_internal_duplicates'] > 0)
        
        print(f"\n🎯 PATTERN ANALYSIS:")
        print(f"  Datasets with ≥90% company overlap: {high_overlap_count}/{len(results)}")
        print(f"  Datasets with income internal duplicates: {internal_dup_count}/{len(results)}")
        
        if high_overlap_count == len(results):
            print(f"  ✅ CONFIRMED: 100% company overlap is EXPECTED pattern across all datasets")
        
        if internal_dup_count == len(results):
            print(f"  ⚠️ PATTERN: All datasets show income statement internal duplicates")
            print(f"     This suggests consistent extraction issue across versions")

if __name__ == "__main__":
    find_and_analyze_datasets() 