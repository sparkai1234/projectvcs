#!/usr/bin/env python3
"""
Investigate Professional Personnel Data Structure
Analyzes the correct column mappings for professional personnel data
"""

import json
import os

def investigate_professional_personnel():
    """Investigate the correct structure for professional personnel data"""
    print("🔍 === INVESTIGATING PROFESSIONAL PERSONNEL DATA ===")
    
    # Load original dataset
    dataset_path = "../diva-scraper-standalone/dataset_final-diva-scraper_2025-06-10_00-27-35-666.json"
    
    try:
        with open(dataset_path, 'r', encoding='utf-8') as f:
            data = json.load(f)
        print(f"✅ Loaded {len(data):,} records from dataset")
    except Exception as e:
        print(f"❌ Error loading dataset: {e}")
        return False
    
    # Filter for professional personnel records
    professional_records = [record for record in data if record.get('dataType') == 'professional_personnel']
    print(f"📊 Found {len(professional_records)} professional personnel records")
    
    if professional_records:
        print(f"\n📋 FIRST 5 PROFESSIONAL PERSONNEL SAMPLES:")
        for i, record in enumerate(professional_records[:5]):
            print(f"\n   Sample {i+1}:")
            print(f"   - dataType: {record.get('dataType')}")
            print(f"   - column_0: {record.get('column_0')}")
            print(f"   - column_1: {record.get('column_1')}")
            print(f"   - column_2: {record.get('column_2')}")
            print(f"   - column_3: {record.get('column_3')}")
            print(f"   - column_4: {record.get('column_4')}")
            print(f"   - column_5: {record.get('column_5')}")
            if 'column_6' in record:
                print(f"   - column_6: {record.get('column_6')}")
            if 'column_7' in record:
                print(f"   - column_7: {record.get('column_7')}")
        
        # Look at the full structure of one record
        print(f"\n📋 COMPLETE STRUCTURE OF FIRST RECORD:")
        sample = professional_records[0]
        for key, value in sample.items():
            print(f"   {key}: {value}")
    
    return True

if __name__ == "__main__":
    success = investigate_professional_personnel()
    if success:
        print(f"\n🎉 Professional personnel investigation completed!")
    else:
        print(f"\n❌ Professional personnel investigation failed") 