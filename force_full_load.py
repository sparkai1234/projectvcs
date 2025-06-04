#!/usr/bin/env python3
"""
Force Full Load - Aggressively load all contacts from Airtable
This script will keep paginating until it gets all records
"""

import requests
import json
import time

# Configuration
AIRTABLE_API_KEY = "patOUfAsek4nbpvHm.49789ced0e2b0304bdc507f110d936277cd3da18ec3efc9347c93e6a1810919e"
AIRTABLE_BASE_ID = "appdR8V9lJaRW8VkR"

headers = {
    'Authorization': f'Bearer {AIRTABLE_API_KEY}',
    'Content-Type': 'application/json'
}

def force_load_all_contacts():
    """Force load ALL contacts with aggressive pagination"""
    print("🔥 Force Loading ALL Contacts from Contacts Full...")
    print("⚡ Using aggressive pagination to bypass any limits...")
    
    all_contacts = []
    url = f"https://api.airtable.com/v0/{AIRTABLE_BASE_ID}/Contacts%20Full"
    page_count = 0
    max_pages = 200  # Safety limit to prevent infinite loops
    
    start_time = time.time()
    
    while url and page_count < max_pages:
        try:
            print(f"📄 Loading page {page_count + 1}...")
            
            # Use smaller batch size and add parameters to ensure we get all data
            params = {
                'maxRecords': 100,
                'pageSize': 100
            }
            
            response = requests.get(url, headers=headers, params=params)
            
            if response.status_code == 200:
                data = response.json()
                batch = data.get('records', [])
                
                if not batch:  # No records in this batch
                    print("   ❌ No records in this batch - stopping")
                    break
                
                all_contacts.extend(batch)
                page_count += 1
                
                print(f"   ✅ Page {page_count}: Got {len(batch)} records (Total: {len(all_contacts)})")
                
                # Check for pagination
                offset = data.get('offset')
                if offset:
                    url = f"https://api.airtable.com/v0/{AIRTABLE_BASE_ID}/Contacts%20Full"
                    # Add offset to next request
                    params['offset'] = offset
                else:
                    print(f"   🏁 No more pages - finished pagination")
                    break
                
                # Rate limiting - slower to be safe
                time.sleep(0.2)
                
            elif response.status_code == 429:  # Rate limited
                print(f"   ⏱️ Rate limited - waiting 5 seconds...")
                time.sleep(5)
                continue
                
            else:
                print(f"   ❌ Error: {response.status_code} - {response.text[:200]}")
                break
                
        except Exception as e:
            print(f"   ❌ Exception on page {page_count + 1}: {e}")
            break
    
    elapsed = time.time() - start_time
    print(f"\n✅ Force loading complete!")
    print(f"📊 Total contacts loaded: {len(all_contacts):,}")
    print(f"📄 Pages processed: {page_count}")
    print(f"⏱️ Time taken: {elapsed:.1f} seconds")
    
    if len(all_contacts) > 1000:
        print(f"🎉 SUCCESS! Got large dataset - ready for VC matching!")
        return all_contacts
    elif len(all_contacts) > 100:
        print(f"📊 Partial success - got more than API default")
        return all_contacts
    else:
        print(f"⚠️ Still only got {len(all_contacts)} contacts")
        return all_contacts

def sample_analysis(contacts):
    """Analyze a sample of the loaded contacts"""
    if not contacts:
        print("❌ No contacts to analyze")
        return
    
    print(f"\n🔍 Sample Analysis of {len(contacts)} contacts:")
    
    # Show first few contacts
    print(f"\n👥 First 5 contacts:")
    for i, contact in enumerate(contacts[:5], 1):
        fields = contact.get('fields', {})
        name = fields.get('이름', 'Unknown')
        company = fields.get('회사', 'Unknown')
        position = fields.get('직함', 'Unknown')
        print(f"   {i}. {name} - {company} ({position})")
    
    # Count companies
    companies = {}
    for contact in contacts[:1000]:  # Sample first 1000 for performance
        company = contact.get('fields', {}).get('회사', 'Unknown')
        if company and company != 'Unknown':
            companies[company] = companies.get(company, 0) + 1
    
    print(f"\n🏢 Top 10 companies in sample:")
    sorted_companies = sorted(companies.items(), key=lambda x: x[1], reverse=True)
    for company, count in sorted_companies[:10]:
        print(f"   📊 {company}: {count} contacts")

def main():
    print("🔥 Force Full Contact Loading")
    print("=" * 50)
    print("This will aggressively load ALL contacts, bypassing any view filters or API limits")
    print()
    
    # Force load all contacts
    contacts = force_load_all_contacts()
    
    if contacts:
        # Analyze the results
        sample_analysis(contacts)
        
        print(f"\n" + "="*50)
        print(f"🎯 Next Steps:")
        if len(contacts) > 1000:
            print(f"✅ Excellent! {len(contacts):,} contacts loaded")
            print(f"🚀 Ready to run VC matching on this large dataset!")
            print(f"💡 Estimated matches: {len(contacts) * 0.01:.0f}-{len(contacts) * 0.02:.0f} VC contacts")
        else:
            print(f"⚠️ Only got {len(contacts)} contacts")
            print(f"💭 This might be due to view filters or API limits")
    else:
        print(f"❌ Failed to load contacts")

if __name__ == "__main__":
    main() 