#!/usr/bin/env python3
"""
Precision Analysis Script - Identify exact discrepancies vs control data
We need EXACTLY 100% accuracy, not "complete capture"
"""

import json
from collections import defaultdict

def analyze_precision_issues():
    print("🎯 PRECISION ANALYSIS - EXACT CONTROL DATA MATCHING")
    print("=" * 60)
    
    # Load the dataset
    with open('apify/diva-scraper-standalone/dataset_projectvcs-4_2025-06-08_06-57-58-462.json', 'r', encoding='utf-8') as f:
        records = json.loads(f.read())
    
    counts = defaultdict(int)
    financial_tab_counts = defaultdict(int)
    
    for record in records:
        if 'dataSource' in record:
            source = record['dataSource']
            counts[source] += 1
            
            # Track financial statements tabs
            if source == 'financial_statements':
                tab_type = record.get('tabType', 'unknown')
                financial_tab_counts[tab_type] += 1
    
    # EXACT control data targets
    control_data = {
        'investment_performance': 333,
        'financial_statements': 500,  # EXACT target, not 2000
        'association_status': 2231,   # EXACT target, not 2222
        'personnel_status': 251,
        'professional_personnel': 1685,
        'violations': 92,
        'vc_map': 251
    }
    
    print("PRECISION ANALYSIS RESULTS:")
    print("-" * 60)
    print(f"{'Data Source':<25} | {'Actual':<6} | {'Target':<6} | {'Diff':<8} | {'Status'}")
    print("-" * 60)
    
    perfect_count = 0
    issues = []
    
    for source in sorted(counts.keys()):
        actual = counts[source]
        target = control_data[source]
        diff = actual - target
        
        if diff == 0:
            status = "✅ PERFECT"
            perfect_count += 1
        elif diff > 0:
            status = f"❌ OVER +{diff}"
            issues.append(f"{source}: +{diff} records")
        else:
            status = f"❌ UNDER {diff}"
            issues.append(f"{source}: {diff} records")
        
        print(f"{source:<25} | {actual:<6} | {target:<6} | {diff:+8} | {status}")
    
    print("-" * 60)
    print(f"PERFECT ACCURACY: {perfect_count}/7 sources")
    
    # Financial statements detailed analysis
    if 'financial_statements' in counts:
        print(f"\n📊 FINANCIAL STATEMENTS ISSUE ANALYSIS:")
        print(f"  Current Total: {counts['financial_statements']}")
        print(f"  Target Total: {control_data['financial_statements']}")
        print(f"  Overshoot: +{counts['financial_statements'] - control_data['financial_statements']}")
        print(f"  Tab Breakdown:")
        for tab, count in financial_tab_counts.items():
            print(f"    {tab}: {count} records")
        print(f"\n  🔧 SOLUTION NEEDED: Limit financial statements to 500 total")
        print(f"     Option 1: 250 from each tab (재무상태표 + 손익계산서)")
        print(f"     Option 2: Take first 500 records only")
    
    # Association status analysis
    if 'association_status' in counts:
        actual_assoc = counts['association_status']
        target_assoc = control_data['association_status']
        if actual_assoc != target_assoc:
            print(f"\n📊 ASSOCIATION STATUS ISSUE ANALYSIS:")
            print(f"  Current: {actual_assoc}")
            print(f"  Target: {target_assoc}")
            print(f"  Missing: {target_assoc - actual_assoc} records")
            print(f"  🔧 SOLUTION NEEDED: Find missing {target_assoc - actual_assoc} association records")
    
    print(f"\n🚨 CRITICAL ISSUES TO FIX:")
    for issue in issues:
        print(f"  • {issue}")
    
    print(f"\n⚠️ PRODUCTION DEPLOYMENT STATUS:")
    if perfect_count == 7:
        print("  ✅ READY FOR PRODUCTION")
    else:
        print(f"  ❌ NOT READY - {7 - perfect_count} sources need fixing")
        print("  🎯 Must achieve 100% accuracy on ALL sources before deployment")

if __name__ == "__main__":
    analyze_precision_issues() 