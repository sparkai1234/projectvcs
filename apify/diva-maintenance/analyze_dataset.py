#!/usr/bin/env python3
"""
DIVA Dataset Analysis Script
Analyzes the structure of the DIVA scraper dataset JSON file
"""

import json
import os
from collections import Counter

def analyze_dataset():
    print("🔍 === DIVA Dataset Analysis ===")
    
    # File path
    dataset_path = "../diva-scraper-standalone/dataset_final-diva-scraper_2025-06-10_00-27-35-666.json"
    
    if not os.path.exists(dataset_path):
        print(f"❌ Dataset file not found: {dataset_path}")
        return
    
    print(f"📋 Analyzing file: {dataset_path}")
    
    try:
        with open(dataset_path, 'r', encoding='utf-8') as f:
            data = json.load(f)
        
        print(f"✅ Successfully loaded JSON data")
        print(f"📊 File size: {os.path.getsize(dataset_path):,} bytes")
        
        # Analyze top-level structure
        if isinstance(data, dict):
            print(f"\n🗂️ Top-level structure: Dictionary with {len(data)} keys")
            print("📋 Top-level keys:")
            for key in data.keys():
                value = data[key]
                if isinstance(value, list):
                    print(f"  - {key}: List with {len(value)} items")
                    if len(value) > 0:
                        print(f"    Sample item keys: {list(value[0].keys()) if isinstance(value[0], dict) else type(value[0])}")
                elif isinstance(value, dict):
                    print(f"  - {key}: Dictionary with {len(value)} keys")
                else:
                    print(f"  - {key}: {type(value)} - {str(value)[:100]}...")
                    
        elif isinstance(data, list):
            print(f"\n📋 Structure: List with {len(data)} items")
            if len(data) > 0:
                print(f"Sample item: {type(data[0])}")
                if isinstance(data[0], dict):
                    print(f"Sample keys: {list(data[0].keys())}")
        
        # Look for DIVA-specific data patterns
        print(f"\n🔍 Looking for DIVA data patterns...")
        
        def search_patterns(obj, path=""):
            patterns = []
            if isinstance(obj, dict):
                for key, value in obj.items():
                    current_path = f"{path}.{key}" if path else key
                    
                    # Look for DIVA table patterns
                    if any(pattern in key.lower() for pattern in ['investment', 'financial', 'association', 'personnel', 'violation', 'vc', 'diva']):
                        patterns.append(f"Found DIVA pattern: {current_path} ({type(value)})")
                        if isinstance(value, list) and len(value) > 0:
                            patterns.append(f"  - {len(value)} items, sample: {list(value[0].keys()) if isinstance(value[0], dict) else type(value[0])}")
                    
                    # Recurse into nested structures
                    if isinstance(value, (dict, list)) and len(str(value)) < 10000:  # Avoid huge objects
                        patterns.extend(search_patterns(value, current_path))
                        
            elif isinstance(obj, list) and len(obj) > 0:
                # Sample first few items
                for i, item in enumerate(obj[:3]):
                    patterns.extend(search_patterns(item, f"{path}[{i}]"))
                    
            return patterns
        
        patterns = search_patterns(data)
        for pattern in patterns[:20]:  # Show first 20 patterns
            print(f"  {pattern}")
        
        if len(patterns) > 20:
            print(f"  ... and {len(patterns) - 20} more patterns")
            
        print(f"\n✅ Analysis complete!")
        
    except json.JSONDecodeError as e:
        print(f"❌ JSON decode error: {e}")
    except Exception as e:
        print(f"❌ Error analyzing dataset: {e}")

if __name__ == "__main__":
    analyze_dataset() 