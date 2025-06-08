#!/usr/bin/env python3
"""
Dataset Validation Script for DIVA Scraper v5.3.8
Analyzes the exported dataset and validates against control data
"""

import json
import re
from collections import defaultdict

def analyze_dataset(file_path):
    print("🔍 ANALYZING DIVA SCRAPER v5.3.8 DATASET")
    print("=" * 50)
    
    # Control data for comparison
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
    total_records = 0
    sample_records = defaultdict(list)
    
    try:
        with open(file_path, 'r', encoding='utf-8') as f:
            content = f.read()
            
        # Parse JSON array
        if content.strip().startswith('['):
            records = json.loads(content)
        else:
            # Handle line-by-line JSON
            records = []
            for line in content.strip().split('\n'):
                if line.strip():
                    try:
                        records.append(json.loads(line))
                    except:
                        continue
        
        print(f"📊 TOTAL RECORDS LOADED: {len(records)}")
        print()
        
        # Analyze each record
        for record in records:
            if isinstance(record, dict) and 'dataSource' in record:
                data_source = record['dataSource']
                data_counts[data_source] += 1
                total_records += 1
                
                # Collect sample for quality check
                if len(sample_records[data_source]) < 3:
                    sample_records[data_source].append(record)
        
        # Print results
        print("🎯 VALIDATION RESULTS vs CONTROL DATA:")
        print("-" * 60)
        
        perfect_matches = 0
        over_captures = 0
        under_captures = 0
        
        for source in sorted(data_counts.keys()):
            captured = data_counts[source]
            control = control_data.get(source, 0)
            
            if control > 0:
                percentage = (captured / control) * 100
                diff = captured - control
                
                if captured == control:
                    status = "🎯 PERFECT"
                    perfect_matches += 1
                elif captured > control:
                    status = "📈 OVER"
                    over_captures += 1
                else:
                    status = "📉 UNDER"
                    under_captures += 1
                
                print(f"{source:25} | {captured:4d} / {control:4d} | {percentage:6.1f}% | {diff:+4d} | {status}")
            else:
                print(f"{source:25} | {captured:4d} / NONE | NEW SOURCE")
        
        print("-" * 60)
        print(f"📈 SUMMARY:")
        print(f"  Perfect Matches: {perfect_matches}/7")
        print(f"  Over-captures:   {over_captures}")
        print(f"  Under-captures:  {under_captures}")
        print(f"  Total Records:   {total_records}")
        
        # Data quality analysis
        print("\n🔍 DATA QUALITY SAMPLES:")
        print("-" * 40)
        
        for source, samples in sample_records.items():
            print(f"\n{source.upper()}:")
            for i, sample in enumerate(samples[:2]):
                columns = [k for k in sample.keys() if k.startswith('column_')]
                if columns:
                    print(f"  Sample {i+1}: {len(columns)} columns")
                    # Show first few column values
                    for col in columns[:3]:
                        value = str(sample.get(col, ''))[:50]
                        print(f"    {col}: {value}")
        
        # Calculate overall performance
        total_control = sum(control_data.values())
        total_captured = sum(data_counts[k] for k in control_data.keys())
        overall_percentage = (total_captured / total_control) * 100 if total_control > 0 else 0
        
        print(f"\n🎉 OVERALL PERFORMANCE:")
        print(f"  Total Expected: {total_control}")
        print(f"  Total Captured: {total_captured}")
        print(f"  Overall Rate:   {overall_percentage:.1f}%")
        
        if overall_percentage >= 99.5:
            print("  ✅ EXCELLENT: Near-perfect capture rate!")
        elif overall_percentage >= 95:
            print("  ✅ VERY GOOD: High capture rate achieved!")
        elif overall_percentage >= 90:
            print("  ⚠️ GOOD: Solid performance, minor tuning needed")
        else:
            print("  ❌ NEEDS IMPROVEMENT: Significant optimization required")
            
    except Exception as e:
        print(f"❌ ERROR: {e}")

if __name__ == "__main__":
    file_path = "apify/diva-scraper-standalone/dataset_projectvcs-4_2025-06-08_05-13-31-361.json"
    analyze_dataset(file_path) 