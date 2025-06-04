#!/usr/bin/env python3
import requests

headers = {
    'Authorization': 'Bearer patOUfAsek4nbpvHm.49789ced0e2b0304bdc507f110d936277cd3da18ec3efc9347c93e6a1810919e'
}

NEW_BASE_ID = "apptH56xIB43Cf2r8"

print("🔍 Getting current table metadata...")

# Get base metadata
metadata_url = f"https://api.airtable.com/v0/meta/bases/{NEW_BASE_ID}/tables"
response = requests.get(metadata_url, headers=headers)

if response.status_code == 200:
    data = response.json()
    tables = data.get('tables', [])
    
    print(f"✅ Found {len(tables)} tables in base:")
    
    for table in tables:
        table_name = table.get('name', 'Unknown')
        table_id = table.get('id', 'Unknown')
        
        print(f"\n📋 Table: {table_name}")
        print(f"   ID: {table_id}")
        
        if 'Contacts' in table_name:
            print(f"   🎯 CONTACTS TABLE FOUND!")
            
            # Test API access with this table ID
            test_url = f"https://api.airtable.com/v0/{NEW_BASE_ID}/{table_id}?maxRecords=5"
            test_response = requests.get(test_url, headers=headers)
            
            if test_response.status_code == 200:
                test_data = test_response.json()
                records = test_data.get('records', [])
                offset = test_data.get('offset')
                
                print(f"   ✅ API Access: SUCCESS")
                print(f"   📊 Records: {len(records)}")
                print(f"   🔄 Offset: {'Yes' if offset else 'No'}")
                
                if records:
                    sample = records[0].get('fields', {})
                    print(f"   📄 Sample fields: {list(sample.keys())[:3]}")
            else:
                print(f"   ❌ API Access: FAILED ({test_response.status_code})")
else:
    print(f"❌ Cannot get metadata: {response.status_code}")
    print(f"Response: {response.text[:200]}...") 