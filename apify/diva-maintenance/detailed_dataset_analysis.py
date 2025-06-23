#!/usr/bin/env python3
"""
Detailed Dataset Analysis
Analyzes the exact counts and duplicates in the original dataset
"""

import json
import os
from collections import Counter

def detailed_dataset_analysis():
    """Perform detailed analysis of the original dataset"""
    print("🔍 === DETAILED DATASET ANALYSIS ===")
    
    # Load original dataset
    dataset_path = "../diva-scraper-standalone/dataset_final-diva-scraper_2025-06-10_00-27-35-666.json"
    
    try:
        with open(dataset_path, 'r', encoding='utf-8') as f:
            data = json.load(f)
        print(f"✅ Loaded {len(data):,} records from dataset")
    except Exception as e:
        print(f"❌ Error loading dataset: {e}")
        return False
    
    # Count by dataType
    datatype_counts = Counter()
    balance_companies = []
    income_companies = []
    
    for record in data:
        datatype = record.get('dataType')
        datatype_counts[datatype] += 1
        
        company_name = record.get('column_0')
        
        if datatype == 'financial_statements_balance' and company_name:
            balance_companies.append(company_name)
        elif datatype == 'financial_statements_income' and company_name:
            income_companies.append(company_name)
    
    print(f"\n📊 DATATYPE COUNTS:")
    for datatype, count in sorted(datatype_counts.items()):
        print(f"   - {datatype}: {count}")
    
    print(f"\n📊 FINANCIAL STATEMENTS DETAILED:")
    print(f"   - Balance sheet records: {datatype_counts.get('financial_statements_balance', 0)}")
    print(f"   - Income statement records: {datatype_counts.get('financial_statements_income', 0)}")
    print(f"   - Total financial records: {datatype_counts.get('financial_statements_balance', 0) + datatype_counts.get('financial_statements_income', 0)}")
    
    # Check for duplicates within each type
    balance_company_counts = Counter(balance_companies)
    income_company_counts = Counter(income_companies)
    
    balance_duplicates = {company: count for company, count in balance_company_counts.items() if count > 1}
    income_duplicates = {company: count for company, count in income_company_counts.items() if count > 1}
    
    print(f"\n🔍 DUPLICATE ANALYSIS:")
    print(f"   - Unique balance sheet companies: {len(balance_company_counts)}")
    print(f"   - Unique income statement companies: {len(income_company_counts)}")
    print(f"   - Balance sheet duplicates: {len(balance_duplicates)}")
    print(f"   - Income statement duplicates: {len(income_duplicates)}")
    
    if balance_duplicates:
        print(f"\n📋 Balance Sheet Duplicates:")
        for company, count in list(balance_duplicates.items())[:10]:
            print(f"   - {company}: {count} records")
    
    if income_duplicates:
        print(f"\n📋 Income Statement Duplicates:")
        for company, count in list(income_duplicates.items())[:10]:
            print(f"   - {company}: {count} records")
    
    # Check for companies that appear in both
    balance_set = set(balance_companies)
    income_set = set(income_companies)
    
    both_sets = balance_set & income_set
    balance_only = balance_set - income_set
    income_only = income_set - balance_set
    
    print(f"\n🔍 COMPANY OVERLAP:")
    print(f"   - Companies in both types: {len(both_sets)}")
    print(f"   - Balance sheet only: {len(balance_only)}")
    print(f"   - Income statement only: {len(income_only)}")
    
    if balance_only:
        print(f"\n📋 Balance Sheet Only Companies (first 10):")
        for i, company in enumerate(list(balance_only)[:10]):
            print(f"   {i+1}. {company}")
    
    if income_only:
        print(f"\n📋 Income Statement Only Companies (first 10):")
        for i, company in enumerate(list(income_only)[:10]):
            print(f"   {i+1}. {company}")
    
    return True

if __name__ == "__main__":
    success = detailed_dataset_analysis()
    if success:
        print(f"\n🎉 Detailed dataset analysis completed!")
    else:
        print(f"\n❌ Detailed dataset analysis failed") 