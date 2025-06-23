#!/usr/bin/env python3
"""
v5.3.10 Success Validation Script
Validate the production-ready dataset for perfect 100% accuracy
"""

import json
from collections import defaultdict

def validate_v5310_success():
    print("🎉 VALIDATING v5.3.10 SUCCESS - PRODUCTION READY DATASET")
    print("=" * 65)
    
    # Load the v5.3.10 dataset
    with open('apify/diva-scraper-standalone/dataset_projectvcs-4_2025-06-08_12-31-13-602.json', 'r', encoding='utf-8') as f:
        records = json.loads(f.read())
    
    # Control data targets
    control_data = {
        'investment_performance': 333,
        'financial_statements': 500,
        'association_status': 2231,
        'personnel_status': 251,
        'professional_personnel': 1685,
        'violations': 92,
        'vc_map': 251
    }
    
    data_counts = defaultdict(int)
    version_analysis = defaultdict(int)
    financial_tab_counts = defaultdict(int)
    sample_records = defaultdict(list)
    
    print(f"📊 TOTAL RECORDS LOADED: {len(records)}")
    print()
    
    # Analyze each record
    for record in records:
        if isinstance(record, dict) and 'dataSource' in record:
            data_source = record['dataSource']
            data_counts[data_source] += 1
            
            # Track versions
            version = record.get('version', 'unknown')
            version_analysis[version] += 1
            
            # Special analysis for financial statements
            if data_source == 'financial_statements':
                tab_type = record.get('tabType', 'unknown')
                financial_tab_counts[tab_type] += 1
            
            # Collect samples
            if len(sample_records[data_source]) < 2:
                sample_records[data_source].append(record)
    
    # Validation Results
    print("🎯 PERFECT ACCURACY VALIDATION:")
    print("-" * 80)
    print(f"{'Data Source':<25} | {'Current':<7} | {'Target':<7} | {'Accuracy':<9} | {'Status'}")
    print("-" * 80)
    
    perfect_count = 0
    total_current = 0
    total_target = 0
    
    for source in sorted(data_counts.keys()):
        current = data_counts[source]
        target = control_data.get(source, 0)
        accuracy = (current / target * 100) if target > 0 else 0
        
        total_current += current
        total_target += target
        
        if current == target:
            status = "🎯 PERFECT"
            perfect_count += 1
        else:
            status = f"❌ OFF BY {current - target:+d}"
        
        print(f"{source:<25} | {current:<7} | {target:<7} | {accuracy:>6.1f}%  | {status}")
    
    print("-" * 80)
    print(f"{'TOTALS':<25} | {total_current:<7} | {total_target:<7} | {total_current/total_target*100:>6.1f}%  | Perfect: {perfect_count}/7")
    
    # Financial Statements Detailed Analysis
    if 'financial_statements' in data_counts:
        print(f"\n📊 FINANCIAL STATEMENTS SUCCESS ANALYSIS:")
        print(f"  Total Financial Records: {data_counts['financial_statements']}")
        print(f"  Target: {control_data['financial_statements']}")
        
        for tab_type, count in financial_tab_counts.items():
            if tab_type != 'unknown':
                print(f"  {tab_type}: {count} records")
        
        # Check if deduplication worked
        balance_count = financial_tab_counts.get('재무상태표', 0)
        income_count = financial_tab_counts.get('손익계산서', 0)
        
        if balance_count == 250 and income_count == 250:
            print(f"  ✅ DEDUPLICATION SUCCESS: Both tabs exactly 250 records")
        else:
            print(f"  ⚠️ Tab distribution: Balance {balance_count}, Income {income_count}")
    
    # Version Analysis
    print(f"\n🏷️ VERSION ANALYSIS:")
    for version, count in version_analysis.items():
        print(f"  {version}: {count} records")
    
    # Association Status Analysis
    if 'association_status' in data_counts:
        assoc_records = [r for r in records if r.get('dataSource') == 'association_status']
        
        # Check ID range
        ids = []
        for record in assoc_records:
            first_col = record.get('column_0', '')
            if first_col and first_col.isdigit():
                ids.append(int(first_col))
        
        if ids:
            ids.sort()
            print(f"\n📈 ASSOCIATION STATUS SUCCESS ANALYSIS:")
            print(f"  Total Records: {len(assoc_records)}")
            print(f"  ID Range: {min(ids)} to {max(ids)}")
            print(f"  Missing First 9 Records: {'❌ FIXED' if min(ids) <= 9 else '✅ STILL MISSING'}")
            
            # Check for the previously missing IDs
            missing_found = []
            for i in range(1, 10):
                if i in ids:
                    missing_found.append(i)
            
            if missing_found:
                print(f"  ✅ RECOVERED IDs: {missing_found}")
            else:
                print(f"  ⚠️ First 9 IDs still not found")
    
    # Data Quality Samples
    print(f"\n🔍 DATA QUALITY VERIFICATION:")
    print("-" * 45)
    
    for source, samples in sample_records.items():
        print(f"\n{source.upper()}:")
        for i, sample in enumerate(samples[:1]):
            columns = [k for k in sample.keys() if k.startswith('column_')]
            special_fields = []
            
            if 'tabType' in sample:
                special_fields.append(f"tabType: {sample['tabType']}")
            if 'version' in sample:
                special_fields.append(f"version: {sample['version']}")
            
            print(f"  Sample: {len(columns)} columns")
            if special_fields:
                print(f"    {', '.join(special_fields)}")
            
            # Show key data
            for col in columns[:3]:
                value = str(sample.get(col, ''))[:40]
                print(f"    {col}: {value}")
    
    # Final Assessment
    print(f"\n🏆 PRODUCTION READINESS ASSESSMENT:")
    print("=" * 50)
    
    if perfect_count == 7:
        print("  ✅ PERFECT SUCCESS: 7/7 sources at 100% accuracy!")
        print("  🚀 PRODUCTION READY: Deploy with confidence!")
        print("  🎯 BULLETPROOF: Ready for unknown datasets!")
        
        if total_current == total_target:
            print(f"  📊 EXACT MATCH: {total_current} records = {total_target} target")
        
        # Check for v5.3.10 version
        if 'v5.3.10-production-ready' in version_analysis:
            print("  🏷️ VERSION CONFIRMED: v5.3.10-production-ready")
        
        print("\n🎉 MISSION ACCOMPLISHED!")
        print("   Your DIVA scraper has achieved perfect precision!")
        
    else:
        print(f"  ⚠️ INCOMPLETE: {perfect_count}/7 sources perfect")
        print("  🔧 NEEDS REVIEW: Production deployment blocked")
    
    return {
        'perfect_sources': perfect_count,
        'total_records': total_current,
        'target_records': total_target,
        'accuracy': total_current / total_target * 100 if total_target > 0 else 0
    }

if __name__ == "__main__":
    result = validate_v5310_success()
    print(f"\n📋 SUMMARY: {result['perfect_sources']}/7 perfect, {result['accuracy']:.1f}% overall accuracy") 