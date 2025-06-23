#!/usr/bin/env python3
"""
DIVA Scraper v5.3.14.4 Dataset Validation
Analyzes the latest dataset to validate the financial statements fix
"""

import json
import os
from collections import defaultdict, Counter

def analyze_dataset():
    dataset_path = 'apify/diva-scraper-standalone/dataset_projectvcs-4_2025-06-08_14-09-36-351.json'
    
    if not os.path.exists(dataset_path):
        print(f"❌ Dataset not found: {dataset_path}")
        return
    
    print("📊 DIVA SCRAPER v5.3.14.4 DATASET VALIDATION")
    print("=" * 60)
    
    try:
        with open(dataset_path, 'r', encoding='utf-8') as f:
            content = f.read().strip()
            
        # Handle both array format and JSONL format
        if content.startswith('['):
            records = json.loads(content)
        else:
            # JSONL format
            lines = content.strip().split('\n')
            records = [json.loads(line) for line in lines if line.strip()]
        
        print(f"📈 Total Records: {len(records)}")
        
        # Count by data source
        source_counts = Counter()
        financial_tabs = defaultdict(int)
        
        for record in records:
            data_source = record.get('dataSource', 'unknown')
            source_counts[data_source] += 1
            
            # Special handling for financial statements
            if data_source == 'financial_statements':
                tab_type = record.get('tabType', 'unknown')
                financial_tabs[tab_type] += 1
        
        print("\n📊 RECORDS BY DATA SOURCE:")
        print("-" * 40)
        
        # Expected targets
        targets = {
            'investment_performance': 333,
            'financial_statements': 500,  # This was failing before
            'association_status': 2231,
            'personnel_status': 251,
            'professional_personnel': 1685,
            'violations': 92,
            'vc_map': 251
        }
        
        total_target = sum(targets.values())
        total_captured = sum(source_counts.values())
        
        for source in targets:
            captured = source_counts[source]
            target = targets[source]
            accuracy = (captured / target * 100) if target > 0 else 0
            status = "✅ PERFECT" if captured == target else f"❌ NEEDS FIX ({captured-target:+d})"
            
            print(f"{source}: {captured}/{target} ({accuracy:.1f}%) {status}")
            
            # Financial statements breakdown
            if source == 'financial_statements' and captured > 0:
                balance_sheet = financial_tabs.get('재무상태표', 0)
                income_statement = financial_tabs.get('손익계산서', 0)
                print(f"  ├─ Balance Sheet (재무상태표): {balance_sheet}")
                print(f"  └─ Income Statement (손익계산서): {income_statement}")
        
        print(f"\n📈 OVERALL STATISTICS:")
        print(f"Total Target: {total_target:,}")
        print(f"Total Captured: {total_captured:,}")
        print(f"Overall Accuracy: {(total_captured/total_target*100):.1f}%")
        
        # Check for the specific financial statements fix
        financial_count = source_counts['financial_statements']
        print(f"\n🏦 FINANCIAL STATEMENTS FIX VALIDATION:")
        if financial_count == 0:
            print("❌ STILL BROKEN: Financial statements extraction is still failing (0 records)")
            print("   The artificial limit removal didn't fix the underlying issue")
        elif financial_count > 0:
            print(f"✅ PARTIALLY FIXED: Financial statements now extracting {financial_count} records")
            if financial_count >= 500:
                print("✅ SUCCESS: Financial statements extraction is working properly")
            else:
                print(f"⚠️  UNDER TARGET: {financial_count} vs 500 target (may need investigation)")
        
        # Sample record analysis
        if records:
            print(f"\n📝 SAMPLE RECORD ANALYSIS:")
            print("-" * 40)
            sample = records[0]
            print(f"Version: {sample.get('version', 'unknown')}")
            print(f"Data Source: {sample.get('dataSource', 'unknown')}")
            print(f"Extracted At: {sample.get('extractedAt', 'unknown')}")
            if 'tabType' in sample:
                print(f"Tab Type: {sample.get('tabType')}")
            
            # Count columns in sample
            columns = [k for k in sample.keys() if k.startswith('column_')]
            print(f"Data Columns: {len(columns)}")
        
    except Exception as e:
        print(f"❌ Error analyzing dataset: {e}")

def find_screenshots():
    print(f"\n📸 SCREENSHOT LOCATIONS:")
    print("-" * 40)
    
    # Look for screenshot files in the project
    screenshot_patterns = [
        'debug-before-interference-*.png',
        'debug-after-interference-*.png', 
        'debug-extracting-*.png',
        'debug-*.png'
    ]
    
    print("Screenshots are automatically generated during scraping:")
    print("1. Before/after interference blocking screenshots")
    print("2. Data extraction screenshots for each tab")
    print("3. Debug screenshots for troubleshooting")
    print()
    print("📂 To access screenshots:")
    print("   - Check Apify actor run logs and artifacts")
    print("   - Look in the actor's key-value store")
    print("   - Screenshots are uploaded during the run")
    print()
    print("🔗 Access via Apify Console:")
    print("   1. Go to https://console.apify.com/")
    print("   2. Navigate to your actor runs")
    print("   3. Click on the latest run")
    print("   4. Check 'Dataset' and 'Key-value store' tabs")
    print("   5. Screenshots will be in the key-value store")

if __name__ == "__main__":
    analyze_dataset()
    find_screenshots() 