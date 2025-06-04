#!/usr/bin/env python3
"""
Final Working Pagination - Use the discovered offset correctly
"""
import requests
import time

headers = {
    'Authorization': 'Bearer patOUfAsek4nbpvHm.49789ced0e2b0304bdc507f110d936277cd3da18ec3efc9347c93e6a1810919e'
}

NEW_BASE_ID = "apptH56xIB43Cf2r8"
NEW_TABLE_ID = "tbl6FcXjgBqyHciOD"

def get_first_offset():
    """Get the first offset by requesting more than 100 records"""
    print("🔍 Getting first offset...")
    
    base_url = f"https://api.airtable.com/v0/{NEW_BASE_ID}/{NEW_TABLE_ID}"
    
    # Request 200 records to trigger offset
    response = requests.get(base_url, headers=headers, params={'maxRecords': 200})
    
    if response.status_code == 200:
        data = response.json()
        records = data.get('records', [])
        offset = data.get('offset')
        
        print(f"  ✅ Got {len(records)} records")
        print(f"  🔄 Offset: {'Present' if offset else 'None'}")
        
        if offset:
            print(f"  🎯 First offset found: {offset[:50]}...")
            return records, offset
    
    return [], None

def load_all_contacts_working():
    """Load all contacts using the working offset method"""
    print(f"\n🔄 Loading ALL contacts using WORKING method...")
    
    all_contacts = []
    
    # Step 1: Get first batch and offset
    first_batch, first_offset = get_first_offset()
    
    if not first_batch:
        print("❌ Could not get first batch")
        return []
    
    all_contacts.extend(first_batch)
    print(f"📊 Loaded first batch: {len(first_batch)} records")
    
    if not first_offset:
        print("⚠️ No offset found - may only have 100 records total")
        return all_contacts
    
    # Step 2: Continue pagination with offset
    base_url = f"https://api.airtable.com/v0/{NEW_BASE_ID}/{NEW_TABLE_ID}"
    current_offset = first_offset
    page = 2
    
    while current_offset and page <= 200:  # Safety limit
        print(f"\n📄 Loading page {page}...")
        
        # Use the offset to get next page
        params = {
            'maxRecords': 100,
            'offset': current_offset
        }
        
        response = requests.get(base_url, headers=headers, params=params)
        
        if response.status_code == 200:
            data = response.json()
            records = data.get('records', [])
            current_offset = data.get('offset')
            
            print(f"  ✅ Got {len(records)} records")
            print(f"  🔄 Offset: {'Present' if current_offset else 'None'}")
            
            if records:
                all_contacts.extend(records)
            
            if not current_offset:
                print(f"  🏁 Reached end of data")
                break
                
            page += 1
        else:
            print(f"  ❌ Error: {response.status_code}")
            break
        
        time.sleep(0.1)  # Rate limiting
    
    print(f"\n✅ WORKING PAGINATION COMPLETE:")
    print(f"  📄 Total pages loaded: {page}")
    print(f"  📊 Total contacts loaded: {len(all_contacts):,}")
    print(f"  🎯 Expected: 17,007")
    
    return all_contacts

def test_sample_data(contacts):
    """Test the loaded contact data"""
    print(f"\n📋 SAMPLE DATA ANALYSIS:")
    
    if not contacts:
        print("❌ No contacts to analyze")
        return
    
    # Show first few contacts
    print(f"📊 First 5 contacts:")
    for i, contact in enumerate(contacts[:5], 1):
        fields = contact.get('fields', {})
        name = fields.get('이름', 'No Name')
        company = fields.get('회사', 'No Company')
        print(f"  {i}. {name} @ {company}")
    
    # Count unique companies
    companies = set()
    for contact in contacts:
        company = contact.get('fields', {}).get('회사', '')
        if company:
            companies.add(company)
    
    print(f"\n🏢 Unique companies found: {len(companies):,}")
    
    # Show some company examples
    if len(companies) > 10:
        sample_companies = list(companies)[:10]
        print(f"📄 Sample companies: {', '.join(sample_companies)}")
    
    # Success metrics
    success_rate = len(contacts) / 17007 * 100
    print(f"\n📈 Success rate: {success_rate:.1f}% of expected 17,007 records")
    
    if success_rate >= 95:
        print("🎉 EXCELLENT - Got nearly all records!")
    elif success_rate >= 80:
        print("✅ GOOD - Got most records!")
    elif success_rate >= 50:
        print("⚠️ PARTIAL - Got some records!")
    else:
        print("❌ LIMITED - Need further investigation!")

def main():
    print("🚀 FINAL WORKING PAGINATION TEST")
    print("=" * 60)
    print("🎯 Goal: Load all 17,007 contacts using correct offset handling")
    print()
    
    # Load all contacts
    contacts = load_all_contacts_working()
    
    # Analyze the results
    test_sample_data(contacts)
    
    print(f"\n" + "="*60)
    
    if len(contacts) >= 17000:
        print("🎉 SUCCESS! Ready to proceed with VC matching!")
        return contacts
    elif len(contacts) > 1000:
        print("⚠️ PARTIAL SUCCESS - Can proceed with limited dataset")
        return contacts
    else:
        print("❌ FAILED - Need alternative approach")
        return []

if __name__ == "__main__":
    result = main() 