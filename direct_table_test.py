#!/usr/bin/env python3
import requests

headers = {
    'Authorization': 'Bearer patOUfAsek4nbpvHm.49789ced0e2b0304bdc507f110d936277cd3da18ec3efc9347c93e6a1810919e'
}

# Direct table ID access
url = 'https://api.airtable.com/v0/apptH56xIB43Cf2r8/tblR93ZxB51PAoJCk'
response = requests.get(url, headers=headers, params={'maxRecords': 200})

if response.status_code == 200:
    data = response.json()
    records = data.get('records', [])
    offset = data.get('offset')
    
    print(f"✅ Direct table access:")
    print(f"  📊 Records: {len(records)}")
    print(f"  🔄 Offset: {'Yes' if offset else 'No'}")
    if offset:
        print(f"  🔄 Offset value: {offset[:50]}...")
else:
    print(f"❌ Error: {response.status_code}")
    print(f"Response: {response.text[:200]}") 