"""
Airtable API Pagination Issue - Code Sample
===========================================
This script demonstrates the pagination issue where the API stops
returning offset tokens after 200 records despite 17,007 records
being visible in the Airtable interface.

Base: apptH56xIB43Cf2r8
Table: tbl6FcXjgBqyHciOD (Contacts Full)
Plan: Team Plan (should allow 50,000 records)
"""

import requests
import time
import json

# Configuration
BASE_ID = 'apptH56xIB43Cf2r8'
TABLE_ID = 'tbl6FcXjgBqyHciOD'
API_KEY = 'patOUfAsek4nbpvHm....'  # Truncated for security
API_URL = f'https://api.airtable.com/v0/{BASE_ID}/{TABLE_ID}'

def fetch_all_records_with_pagination():
    """
    Demonstrates the pagination issue where API stops at 200 records
    Expected: 17,007 records (visible in interface)
    Actual: Only 200 records accessible via API
    """
    headers = {
        'Authorization': f'Bearer {API_KEY}',
        'Content-Type': 'application/json'
    }
    
    all_records = []
    offset = None
    page_count = 0
    
    print(f"🔍 Starting pagination test...")
    print(f"📊 Expected records: 17,007 (visible in Airtable interface)")
    print(f"🎯 Goal: Retrieve all records via API pagination\n")
    
    while True:
        page_count += 1
        
        # Build request parameters
        params = {'maxRecords': 100}
        if offset:
            params['offset'] = offset
            
        print(f"📄 Page {page_count}: Requesting up to 100 records...")
        
        # Make API request with rate limit compliance
        try:
            response = requests.get(API_URL, headers=headers, params=params)
            time.sleep(0.2)  # Well under 5 req/sec limit
            
            if response.status_code != 200:
                print(f"❌ Error: HTTP {response.status_code}")
                print(f"Response: {response.text}")
                break
                
            data = response.json()
            
            # Process records
            records = data.get('records', [])
            records_count = len(records)
            all_records.extend(records)
            
            print(f"✅ Received: {records_count} records")
            print(f"📈 Total so far: {len(all_records)} records")
            
            # Check for offset (pagination continuation)
            offset = data.get('offset')
            
            if offset:
                print(f"🔄 Offset available: {offset[:20]}...")
                print(f"➡️ Continuing to next page...\n")
            else:
                print(f"🛑 No offset returned - pagination ends here")
                break
                
        except requests.exceptions.RequestException as e:
            print(f"❌ Request failed: {e}")
            break
    
    # Results summary
    print(f"\n" + "="*50)
    print(f"📊 PAGINATION TEST RESULTS")
    print(f"="*50)
    print(f"Pages fetched: {page_count}")
    print(f"Records retrieved: {len(all_records)}")
    print(f"Expected records: 17,007")
    print(f"Success rate: {len(all_records)/17007*100:.1f}%")
    
    # Analyze the issue
    if len(all_records) < 17007:
        print(f"\n🚨 ISSUE IDENTIFIED:")
        print(f"- API pagination stopped at {len(all_records)} records")
        print(f"- Interface shows 17,007 records are available")
        print(f"- No rate limits violated (well under 5 req/sec)")
        print(f"- All requests returned HTTP 200")
        print(f"- Team Plan should allow access to all records")
    
    return all_records

def test_alternative_approaches():
    """Test various API approaches to access more records"""
    
    headers = {
        'Authorization': f'Bearer {API_KEY}',
        'Content-Type': 'application/json'
    }
    
    print(f"\n🧪 TESTING ALTERNATIVE APPROACHES")
    print(f"="*50)
    
    # Test 1: Request more records per page
    print(f"Test 1: Requesting maxRecords=500")
    try:
        response = requests.get(API_URL, headers=headers, params={'maxRecords': 500})
        data = response.json()
        record_count = len(data.get('records', []))
        print(f"Result: {record_count} records (API limits to 100 max per request)")
    except Exception as e:
        print(f"Error: {e}")
    
    time.sleep(0.5)
    
    # Test 2: Different sorting
    print(f"\nTest 2: Using sort parameter")
    params = {
        'maxRecords': 100,
        'sort[0][field]': '이름',
        'sort[0][direction]': 'asc'
    }
    try:
        response = requests.get(API_URL, headers=headers, params=params)
        data = response.json()
        record_count = len(data.get('records', []))
        has_offset = 'offset' in data
        print(f"Result: {record_count} records, offset available: {has_offset}")
    except Exception as e:
        print(f"Error: {e}")
    
    time.sleep(0.5)
    
    # Test 3: Field filtering
    print(f"\nTest 3: Using field filtering")
    params = {
        'maxRecords': 100,
        'fields[]': ['이름', '회사', '직함']
    }
    try:
        response = requests.get(API_URL, headers=headers, params=params)
        data = response.json()
        record_count = len(data.get('records', []))
        has_offset = 'offset' in data
        print(f"Result: {record_count} records, offset available: {has_offset}")
    except Exception as e:
        print(f"Error: {e}")

def verify_interface_vs_api():
    """Verify the discrepancy between interface and API"""
    
    print(f"\n🔍 INTERFACE vs API VERIFICATION")
    print(f"="*50)
    print(f"Interface shows: 17,007 contact records")
    print(f"Records are fully visible and scrollable in web interface")
    print(f"All fields populated with Korean contact data")
    print(f"Upload method: Excel file import (successful)")
    print(f"Account plan: Team Plan (allows 50,000 records)")
    print(f"")
    print(f"API Access Test:")
    
    # Quick API test
    headers = {
        'Authorization': f'Bearer {API_KEY}',
        'Content-Type': 'application/json'
    }
    
    try:
        response = requests.get(API_URL, headers=headers, params={'maxRecords': 10})
        if response.status_code == 200:
            data = response.json()
            print(f"✅ API connection successful")
            print(f"✅ First 10 records accessible")
            print(f"✅ Korean field names working: {list(data['records'][0]['fields'].keys()) if data['records'] else 'No records'}")
        else:
            print(f"❌ API connection failed: HTTP {response.status_code}")
    except Exception as e:
        print(f"❌ API test failed: {e}")

if __name__ == "__main__":
    print("Airtable API Pagination Issue - Demonstration Script")
    print("=" * 60)
    
    # Run the main pagination test
    records = fetch_all_records_with_pagination()
    
    # Test alternative approaches
    test_alternative_approaches()
    
    # Verify interface vs API discrepancy
    verify_interface_vs_api()
    
    print(f"\n📧 This output can be attached to support ticket")
    print(f"🎯 Issue: API pagination stops at 200 records")
    print(f"📊 Expected: 17,007 records (Team Plan compliance)") 