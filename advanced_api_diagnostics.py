#!/usr/bin/env python3
"""
Advanced API Diagnostics - Identify and resolve API access limitations
"""

import requests
import json
import time

# Configuration
AIRTABLE_API_KEY = "patOUfAsek4nbpvHm.49789ced0e2b0304bdc507f110d936277cd3da18ec3efc9347c93e6a1810919e"
NEW_BASE_ID = "apptH56xIB43Cf2r8"
CONTACTS_TABLE_ID = "tblR93ZxB51PAoJCk"

headers = {
    'Authorization': f'Bearer {AIRTABLE_API_KEY}',
    'Content-Type': 'application/json'
}

def test_different_sorting():
    """Test if different sorting reveals more records"""
    print("🔍 TESTING DIFFERENT SORTING METHODS")
    print("=" * 50)
    
    sort_methods = [
        ("Default", {}),
        ("Sort by 이름 ASC", {"sort[0][field]": "이름", "sort[0][direction]": "asc"}),
        ("Sort by 이름 DESC", {"sort[0][field]": "이름", "sort[0][direction]": "desc"}),
        ("Sort by 회사 ASC", {"sort[0][field]": "회사", "sort[0][direction]": "asc"}),
        ("Sort by 회사 DESC", {"sort[0][field]": "회사", "sort[0][direction]": "desc"}),
    ]
    
    base_url = f"https://api.airtable.com/v0/{NEW_BASE_ID}/{CONTACTS_TABLE_ID}"
    
    for method_name, params in sort_methods:
        print(f"\n📊 Testing: {method_name}")
        params['maxRecords'] = 100
        
        response = requests.get(base_url, headers=headers, params=params)
        
        if response.status_code == 200:
            data = response.json()
            records = data.get('records', [])
            offset = data.get('offset')
            
            print(f"  ✅ Records: {len(records)}")
            print(f"  🔄 Offset: {'Yes' if offset else 'No'}")
            
            # Test if we can get different records with this sorting
            if records:
                sample_names = [r.get('fields', {}).get('이름', 'N/A') for r in records[:3]]
                print(f"  📋 Sample names: {', '.join(sample_names)}")
        else:
            print(f"  ❌ Error: {response.status_code}")
        
        time.sleep(0.2)

def test_field_filtering():
    """Test if requesting specific fields helps"""
    print(f"\n🔍 TESTING FIELD FILTERING")
    print("=" * 50)
    
    field_sets = [
        ("All fields", []),
        ("Name only", ["이름"]),
        ("Name + Company", ["이름", "회사"]),
        ("Name + Company + Position", ["이름", "회사", "직함"]),
        ("Company only", ["회사"]),
    ]
    
    base_url = f"https://api.airtable.com/v0/{NEW_BASE_ID}/{CONTACTS_TABLE_ID}"
    
    for set_name, fields in field_sets:
        print(f"\n📊 Testing: {set_name}")
        
        params = {'maxRecords': 100}
        if fields:
            for i, field in enumerate(fields):
                params[f'fields[{i}]'] = field
        
        response = requests.get(base_url, headers=headers, params=params)
        
        if response.status_code == 200:
            data = response.json()
            records = data.get('records', [])
            offset = data.get('offset')
            
            print(f"  ✅ Records: {len(records)}")
            print(f"  🔄 Offset: {'Yes' if offset else 'No'}")
            
            if offset:
                print(f"  🎉 FOUND OFFSET WITH {set_name}!")
                return fields  # Return successful field set
        else:
            print(f"  ❌ Error: {response.status_code}")
        
        time.sleep(0.2)
    
    return None

def test_view_specific_access():
    """Test accessing different views if they exist"""
    print(f"\n🔍 TESTING VIEW-SPECIFIC ACCESS")
    print("=" * 50)
    
    # Get table metadata to find available views
    metadata_url = f"https://api.airtable.com/v0/meta/bases/{NEW_BASE_ID}/tables"
    response = requests.get(metadata_url, headers=headers)
    
    if response.status_code == 200:
        data = response.json()
        tables = data.get('tables', [])
        
        contacts_table = None
        for table in tables:
            if table.get('id') == CONTACTS_TABLE_ID:
                contacts_table = table
                break
        
        if contacts_table:
            views = contacts_table.get('views', [])
            print(f"📋 Found {len(views)} views:")
            
            for view in views:
                view_name = view.get('name', 'Unknown')
                view_id = view.get('id', 'Unknown')
                print(f"  📄 {view_name} (ID: {view_id})")
                
                # Test this view
                view_url = f"https://api.airtable.com/v0/{NEW_BASE_ID}/{CONTACTS_TABLE_ID}"
                params = {'maxRecords': 100, 'view': view_name}
                
                view_response = requests.get(view_url, headers=headers, params=params)
                
                if view_response.status_code == 200:
                    view_data = view_response.json()
                    view_records = view_data.get('records', [])
                    view_offset = view_data.get('offset')
                    
                    print(f"    ✅ Records: {len(view_records)}")
                    print(f"    🔄 Offset: {'Yes' if view_offset else 'No'}")
                    
                    if view_offset:
                        print(f"    🎉 FOUND OFFSET IN VIEW: {view_name}!")
                        return view_name
                else:
                    print(f"    ❌ Error: {view_response.status_code}")
                
                time.sleep(0.2)
    else:
        print(f"❌ Cannot get metadata: {response.status_code}")
    
    return None

def test_advanced_pagination():
    """Test advanced pagination with successful method"""
    print(f"\n🔍 TESTING ADVANCED PAGINATION")
    print("=" * 50)
    
    # First, find a method that gives us offset
    successful_fields = test_field_filtering()
    successful_view = test_view_specific_access()
    
    # Try the most promising approach
    base_url = f"https://api.airtable.com/v0/{NEW_BASE_ID}/{CONTACTS_TABLE_ID}"
    
    params = {'maxRecords': 100}
    
    if successful_view:
        params['view'] = successful_view
        print(f"🎯 Using successful view: {successful_view}")
    elif successful_fields:
        for i, field in enumerate(successful_fields):
            params[f'fields[{i}]'] = field
        print(f"🎯 Using successful fields: {successful_fields}")
    
    # Try to load multiple pages
    all_records = []
    page = 1
    offset = None
    
    while page <= 20:  # Test up to 20 pages
        print(f"\n📄 Page {page}:")
        
        if offset:
            params['offset'] = offset
        
        response = requests.get(base_url, headers=headers, params=params)
        
        if response.status_code == 200:
            data = response.json()
            records = data.get('records', [])
            offset = data.get('offset')
            
            print(f"  ✅ Got {len(records)} records")
            print(f"  🔄 Offset: {'Present' if offset else 'None'}")
            
            all_records.extend(records)
            
            if not offset:
                print(f"  🏁 No more pages")
                break
                
            page += 1
        else:
            print(f"  ❌ Error: {response.status_code}")
            break
        
        time.sleep(0.2)
    
    print(f"\n📊 ADVANCED PAGINATION RESULTS:")
    print(f"  📄 Total pages: {page}")
    print(f"  📊 Total records: {len(all_records):,}")
    
    return all_records

def test_record_filtering():
    """Test if there are hidden filters limiting records"""
    print(f"\n🔍 TESTING RECORD FILTERING")
    print("=" * 50)
    
    base_url = f"https://api.airtable.com/v0/{NEW_BASE_ID}/{CONTACTS_TABLE_ID}"
    
    # Test with different filter formulas
    filter_tests = [
        ("No filter", ""),
        ("NOT empty name", "NOT({이름} = '')"),
        ("NOT empty company", "NOT({회사} = '')"),
        ("All records formula", "1=1"),  # Should match all
    ]
    
    for test_name, formula in filter_tests:
        print(f"\n📊 Testing: {test_name}")
        
        params = {'maxRecords': 100}
        if formula:
            params['filterByFormula'] = formula
        
        response = requests.get(base_url, headers=headers, params=params)
        
        if response.status_code == 200:
            data = response.json()
            records = data.get('records', [])
            offset = data.get('offset')
            
            print(f"  ✅ Records: {len(records)}")
            print(f"  🔄 Offset: {'Yes' if offset else 'No'}")
            
            if offset:
                print(f"  🎉 FOUND OFFSET WITH: {test_name}!")
        else:
            print(f"  ❌ Error: {response.status_code}")
            if response.status_code == 422:
                print(f"    Formula error - invalid syntax")
        
        time.sleep(0.2)

def main():
    print("🚀 ADVANCED API DIAGNOSTICS")
    print("=" * 70)
    print("🎯 Goal: Identify why API only returns 100/17,158 records")
    print()
    
    # Test 1: Different sorting methods
    test_different_sorting()
    
    # Test 2: Record filtering
    test_record_filtering()
    
    # Test 3: Advanced pagination with successful method
    all_records = test_advanced_pagination()
    
    print(f"\n" + "="*70)
    print(f"🎯 FINAL RESULTS:")
    
    if len(all_records) > 100:
        print(f"  🎉 SUCCESS! Found method to access {len(all_records):,} records!")
        print(f"  📈 This is {len(all_records)/17158*100:.1f}% of expected 17,158")
        
        if len(all_records) >= 17000:
            print(f"  ✅ COMPLETE SUCCESS - Got all records!")
        else:
            print(f"  ⚠️ PARTIAL SUCCESS - More investigation needed")
    else:
        print(f"  ❌ Still limited to {len(all_records)} records")
        print(f"  💡 May need to contact Airtable support or try different API approach")

if __name__ == "__main__":
    main() 