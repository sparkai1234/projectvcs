#!/usr/bin/env python3
"""
Fixed Pagination Test - Properly handle Airtable API pagination
"""

import requests
import time

# Configuration
AIRTABLE_API_KEY = "patOUfAsek4nbpvHm.49789ced0e2b0304bdc507f110d936277cd3da18ec3efc9347c93e6a1810919e"
NEW_BASE_ID = "apptH56xIB43Cf2r8"

headers = {
    'Authorization': f'Bearer {AIRTABLE_API_KEY}',
    'Content-Type': 'application/json'
}

def load_all_contacts_fixed():
    """Load all contacts with FIXED pagination logic"""
    print("🔄 Loading ALL contacts with FIXED pagination...")
    
    all_contacts = []
    url = f"https://api.airtable.com/v0/{NEW_BASE_ID}/Contacts%20Full"
    page = 1
    
    while url:
        print(f"📄 Loading page {page}...")
        
        # CRITICAL FIX: Always specify maxRecords parameter
        response = requests.get(url, headers=headers, params={'maxRecords': 100})
        
        if response.status_code == 200:
            data = response.json()
            records = data.get('records', [])
            offset = data.get('offset')
            
            print(f"  ✅ Got {len(records)} records")
            print(f"  🔄 Offset: {'Present' if offset else 'None'}")
            
            all_contacts.extend(records)
            
            if offset:
                # CRITICAL FIX: Build next URL with offset AND maxRecords
                url = f"https://api.airtable.com/v0/{NEW_BASE_ID}/Contacts%20Full?offset={offset}&maxRecords=100"
                page += 1
            else:
                print(f"  🏁 Reached end of data")
                break
        else:
            print(f"  ❌ Error: {response.status_code}")
            break
        
        time.sleep(0.1)  # Rate limiting
        
        # Safety limit for testing
        if page > 200:  # Should be enough for 17k records
            print(f"  ⚠️ Reached safety limit of 200 pages")
            break
    
    print(f"\n✅ FIXED PAGINATION COMPLETE:")
    print(f"  📄 Total pages loaded: {page}")
    print(f"  📊 Total contacts loaded: {len(all_contacts):,}")
    print(f"  🎯 Expected: 17,158")
    
    return all_contacts

def test_sample_contacts(contacts):
    """Test a few sample contacts from the loaded data"""
    print(f"\n📋 SAMPLE CONTACTS FROM LOADED DATA:")
    
    for i, contact in enumerate(contacts[:5], 1):
        fields = contact.get('fields', {})
        name = fields.get('이름', 'No Name')
        company = fields.get('회사', 'No Company')
        position = fields.get('직함', 'No Position')
        
        print(f"  {i}. {name} @ {company} ({position})")
    
    # Check if we have variety in company names
    companies = set()
    for contact in contacts[:100]:  # Check first 100
        company = contact.get('fields', {}).get('회사', '')
        if company:
            companies.add(company)
    
    print(f"\n🏢 Unique companies in first 100 contacts: {len(companies)}")
    if len(companies) > 10:
        sample_companies = list(companies)[:10]
        print(f"  Sample companies: {', '.join(sample_companies)}")

def main():
    print("🚀 FIXED PAGINATION TEST")
    print("=" * 50)
    print("🎯 Goal: Load all 17,158 contacts using FIXED pagination logic")
    print()
    
    # Load all contacts with fixed pagination
    contacts = load_all_contacts_fixed()
    
    if len(contacts) > 1000:
        print(f"\n🎉 SUCCESS! Loaded {len(contacts):,} contacts")
        
        # Test sample data
        test_sample_contacts(contacts)
        
        # Check if this matches expected count
        if len(contacts) >= 17000:
            print(f"\n✅ FULL SUCCESS: Got expected ~17k contacts!")
        else:
            print(f"\n⚠️ PARTIAL SUCCESS: Got {len(contacts):,} contacts (expected 17,158)")
    else:
        print(f"\n❌ Still limited to {len(contacts)} contacts")
        print("Further investigation needed")

if __name__ == "__main__":
    main() 