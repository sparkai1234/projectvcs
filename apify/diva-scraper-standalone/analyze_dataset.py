#!/usr/bin/env python3
"""
DIVA Dataset Analysis Tool
Analyzes dataset for duplications, missing data, and data quality issues
"""

import json
import os
from collections import Counter, defaultdict

def analyze_dataset():
    dataset_path = 'dataset_projectvcs-4_2025-06-09_13-22-17-719.json'
    
    if not os.path.exists(dataset_path):
        print(f"❌ Dataset not found: {dataset_path}")
        return
    
    print("📊 DIVA DATASET ANALYSIS - DUPLICATIONS & MISSING DATA")
    print("=" * 60)
    
    try:
        with open(dataset_path, 'r', encoding='utf-8') as f:
            records = json.load(f)
        
        print(f"📈 Total Records: {len(records)}")
        
        # Count by data source
        source_counts = Counter()
        for record in records:
            data_source = record.get('dataSource', 'unknown')
            source_counts[data_source] += 1
        
        print("\n📊 RECORDS BY DATA SOURCE:")
        print("-" * 40)
        
        # Expected targets
        targets = {
            'investment_performance': 333,
            'financial_statements': 500,
            'association_status': 2231,
            'personnel_status': 251,
            'professional_personnel': 1685,
            'violations': 92,
            'vc_map': 251
        }
        
        total_expected = sum(targets.values())
        total_actual = len(records)
        
        for source, count in source_counts.items():
            target = targets.get(source, 'unknown')
            if target != 'unknown':
                percentage = (count / target) * 100
                status = "✅ PERFECT" if count == target else ("⚠️ OVER" if count > target else "❌ UNDER")
                print(f"{source:<25}: {count:>4}/{target:<4} ({percentage:>6.1f}%) {status}")
            else:
                print(f"{source:<25}: {count:>4} records (unknown target)")
        
        print(f"\nTOTAL: {total_actual}/{total_expected} ({(total_actual/total_expected)*100:.1f}%)")
        
        # DUPLICATION ANALYSIS
        print("\n🔍 DUPLICATION ANALYSIS:")
        print("-" * 40)
        
        duplicates_found = False
        
        for source in source_counts.keys():
            source_records = [r for r in records if r.get('dataSource') == source]
            duplicates = find_duplicates_by_source(source_records, source)
            if duplicates:
                duplicates_found = True
                print(f"\n❌ {source.upper()} DUPLICATES FOUND:")
                for dup in duplicates[:5]:  # Show first 5 duplicates
                    print(f"   • {dup}")
                if len(duplicates) > 5:
                    print(f"   ... and {len(duplicates) - 5} more duplicates")
        
        if not duplicates_found:
            print("✅ NO DUPLICATES FOUND - All records are unique")
        
        # MISSING DATA ANALYSIS
        print("\n📋 MISSING DATA ANALYSIS:")
        print("-" * 40)
        
        for source in source_counts.keys():
            source_records = [r for r in records if r.get('dataSource') == source]
            missing_analysis = analyze_missing_data(source_records, source)
            if missing_analysis:
                print(f"\n⚠️ {source.upper()} MISSING DATA:")
                for issue in missing_analysis:
                    print(f"   • {issue}")
        
        # DATA QUALITY SUMMARY
        print("\n📊 DATA QUALITY SUMMARY:")
        print("-" * 40)
        
        quality_score = calculate_quality_score(records, targets)
        print(f"Overall Quality Score: {quality_score:.1f}%")
        
        # RECOMMENDATIONS
        print("\n💡 RECOMMENDATIONS:")
        print("-" * 40)
        
        for source, count in source_counts.items():
            target = targets.get(source, None)
            if target and count != target:
                diff = count - target
                if diff > 0:
                    print(f"• {source}: Remove {diff} extra records (likely headers/footers)")
                else:
                    print(f"• {source}: Missing {abs(diff)} records - check extraction logic")
        
    except Exception as e:
        print(f"❌ Error analyzing dataset: {e}")

def find_duplicates_by_source(records, source):
    """Find duplicates based on data source type"""
    duplicates = []
    seen = set()
    
    for record in records:
        # Create unique key based on data source type
        if source == 'investment_performance':
            key = record.get('column_0', '').strip()  # Company name
        elif source == 'financial_statements':
            key = f"{record.get('column_0', '')}__{record.get('tabType', '')}"  # Company + tab type
        elif source == 'association_status':
            key = record.get('column_0', '').strip()  # Company name
        else:
            key = record.get('column_0', '').strip()  # Default to company name
        
        if key and key in seen:
            duplicates.append(f"Duplicate: {key}")
        elif key:
            seen.add(key)
    
    return duplicates

def analyze_missing_data(records, source):
    """Analyze missing or incomplete data"""
    issues = []
    
    empty_companies = 0
    incomplete_records = 0
    
    for record in records:
        company_name = record.get('column_0', '').strip()
        
        # Check for empty company names
        if not company_name:
            empty_companies += 1
        
        # Check for incomplete records (too few columns)
        column_count = len([k for k in record.keys() if k.startswith('column_')])
        if column_count < 3:
            incomplete_records += 1
    
    if empty_companies > 0:
        issues.append(f"{empty_companies} records with empty company names")
    
    if incomplete_records > 0:
        issues.append(f"{incomplete_records} records with insufficient data columns")
    
    # Source-specific checks
    if source == 'financial_statements':
        no_tab_type = len([r for r in records if not r.get('tabType')])
        if no_tab_type > 0:
            issues.append(f"{no_tab_type} financial records missing tab type identifier")
    
    return issues

def calculate_quality_score(records, targets):
    """Calculate overall data quality score"""
    source_counts = Counter()
    for record in records:
        data_source = record.get('dataSource', 'unknown')
        source_counts[data_source] += 1
    
    total_score = 0
    total_sources = 0
    
    for source, target in targets.items():
        if source in source_counts:
            actual = source_counts[source]
            score = min(100, (actual / target) * 100) if actual <= target else max(0, 100 - ((actual - target) / target * 50))
            total_score += score
            total_sources += 1
    
    return total_score / total_sources if total_sources > 0 else 0

if __name__ == "__main__":
    analyze_dataset() 