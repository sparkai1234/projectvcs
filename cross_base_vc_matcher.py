#!/usr/bin/env python3
"""
Cross-Base VC Matcher - Load data from two different Airtable bases
Original Base: VC Table + Fund Table  
New Base: Contacts Full → Contacts Matched
"""

import requests
import json
import time
from fuzzywuzzy import fuzz

# Configuration
AIRTABLE_API_KEY = "patOUfAsek4nbpvHm.49789ced0e2b0304bdc507f110d936277cd3da18ec3efc9347c93e6a1810919e"

# Base IDs
ORIGINAL_BASE_ID = "appdR8V9lJaRW8VkR"  # Has VC Table + Fund Table
NEW_BASE_ID = "apptH56xIB43Cf2r8"       # Has Contacts Full

headers = {
    'Authorization': f'Bearer {AIRTABLE_API_KEY}',
    'Content-Type': 'application/json'
}

def load_from_original_base():
    """Load VC and Fund companies from original base"""
    print("🏢 Loading VC and Fund companies from original base...")
    
    vc_companies = []
    fund_companies = []
    
    # Load VC Table from original base
    print("  📊 Loading VC Table...")
    url = f"https://api.airtable.com/v0/{ORIGINAL_BASE_ID}/VC%20Table"
    while url:
        response = requests.get(url, headers=headers, params={'maxRecords': 100})
        if response.status_code == 200:
            data = response.json()
            batch = data.get('records', [])
            vc_companies.extend(batch)
            
            offset = data.get('offset')
            if offset:
                url = f"https://api.airtable.com/v0/{ORIGINAL_BASE_ID}/VC%20Table?offset={offset}"
            else:
                break
        else:
            print(f"    ❌ VC Table error: {response.status_code}")
            break
        time.sleep(0.1)
    
    # Load Fund Table from original base
    print("  💰 Loading Fund Table...")
    url = f"https://api.airtable.com/v0/{ORIGINAL_BASE_ID}/Fund%20Table"
    while url:
        response = requests.get(url, headers=headers, params={'maxRecords': 100})
        if response.status_code == 200:
            data = response.json()
            batch = data.get('records', [])
            fund_companies.extend(batch)
            
            offset = data.get('offset')
            if offset:
                url = f"https://api.airtable.com/v0/{ORIGINAL_BASE_ID}/Fund%20Table?offset={offset}"
            else:
                break
        else:
            print(f"    ❌ Fund Table error: {response.status_code}")
            break
        time.sleep(0.1)
    
    print(f"  ✅ Loaded {len(vc_companies)} VC companies")
    print(f"  ✅ Loaded {len(fund_companies)} Fund companies")
    
    return vc_companies, fund_companies

def load_contacts_from_new_base():
    """Load all contacts from new base using multiple methods"""
    print(f"\n👥 Loading contacts from new base ({NEW_BASE_ID})...")
    
    methods = [
        ("Standard Pagination", lambda: load_contacts_standard()),
        ("View-based Access", lambda: load_contacts_view_based()),
        ("Field-specific Access", lambda: load_contacts_field_specific())
    ]
    
    for method_name, method_func in methods:
        print(f"  📋 Trying: {method_name}")
        try:
            contacts = method_func()
            print(f"    📊 Got {len(contacts)} contacts")
            if len(contacts) > 100:
                print(f"  ✅ SUCCESS with {method_name}!")
                return contacts
            elif len(contacts) == 100:
                print(f"  ⚠️ Got exactly 100 - might be API limit")
        except Exception as e:
            print(f"    ❌ {method_name} failed: {e}")
    
    # Return best available result
    return load_contacts_standard()

def load_contacts_standard():
    """Standard contact loading from new base"""
    contacts = []
    url = f"https://api.airtable.com/v0/{NEW_BASE_ID}/Contacts%20Full"
    
    while url:
        response = requests.get(url, headers=headers, params={'maxRecords': 100})
        if response.status_code == 200:
            data = response.json()
            batch = data.get('records', [])
            contacts.extend(batch)
            
            offset = data.get('offset')
            if offset:
                url = f"https://api.airtable.com/v0/{NEW_BASE_ID}/Contacts%20Full?offset={offset}"
            else:
                break
        else:
            break
        time.sleep(0.1)
    
    return contacts

def load_contacts_view_based():
    """Try different view parameters"""
    contacts = []
    base_url = f"https://api.airtable.com/v0/{NEW_BASE_ID}/Contacts%20Full"
    
    # Try with specific fields to see if that helps
    params = {
        'maxRecords': 100,
        'fields[]': ['이름', '회사', '직함', '전자 메일 주소', '근무처 전화']
    }
    
    response = requests.get(base_url, headers=headers, params=params)
    if response.status_code == 200:
        data = response.json()
        contacts = data.get('records', [])
    
    return contacts

def load_contacts_field_specific():
    """Try loading with minimal field selection"""
    contacts = []
    base_url = f"https://api.airtable.com/v0/{NEW_BASE_ID}/Contacts%20Full"
    
    params = {
        'maxRecords': 200,  # Try higher limit
        'fields[]': ['이름', '회사']  # Minimal fields
    }
    
    response = requests.get(base_url, headers=headers, params=params)
    if response.status_code == 200:
        data = response.json()
        contacts = data.get('records', [])
    
    return contacts

def test_new_base_access():
    """Quick test of new base API access"""
    print(f"🔍 Testing new base API access...")
    
    url = f"https://api.airtable.com/v0/{NEW_BASE_ID}/Contacts%20Full"
    response = requests.get(url, headers=headers, params={'maxRecords': 5})
    
    if response.status_code == 200:
        data = response.json()
        records = data.get('records', [])
        print(f"  ✅ API access working - got {len(records)} test records")
        
        if records:
            sample = records[0].get('fields', {})
            print(f"  📋 Sample fields:")
            for field, value in list(sample.items())[:3]:
                print(f"    📄 {field}: {str(value)[:30]}...")
        
        return True
    else:
        print(f"  ❌ API access failed: {response.status_code}")
        return False

def perform_cross_base_matching(contacts, vc_companies, fund_companies):
    """Perform matching between new base contacts and original base VC/Fund companies"""
    print(f"\n🔍 Performing Cross-Base VC Matching...")
    print(f"  📊 {len(contacts)} contacts vs {len(vc_companies) + len(fund_companies)} VC/Fund companies")
    
    # Create unified company list
    all_companies = []
    
    for record in vc_companies:
        company_name = record.get('fields', {}).get('Company Name', '')
        if company_name:
            all_companies.append((company_name, 'VC', record))
    
    for record in fund_companies:
        company_name = record.get('fields', {}).get('Company Name', '')
        if company_name:
            all_companies.append((company_name, 'Fund', record))
    
    print(f"  🏢 Total companies to match against: {len(all_companies)}")
    
    matches = []
    threshold = 85
    
    for i, contact in enumerate(contacts):
        contact_fields = contact.get('fields', {})
        contact_company = contact_fields.get('회사', '').strip()
        
        if not contact_company:
            continue
        
        # Find best match
        best_match = None
        best_score = 0
        best_type = ""
        
        for company_name, company_type, company_record in all_companies:
            score = fuzz.ratio(contact_company, company_name)
            if score >= threshold and score > best_score:
                best_score = score
                best_match = company_name
                best_type = company_type
        
        if best_match:
            match_record = {
                'Contact Name': contact_fields.get('이름', ''),
                'Contact Company (Original)': contact_company,
                'Matched Company': best_match,
                'Match Score': best_score,
                'Contact Position': contact_fields.get('직함', ''),
                'Contact Email': contact_fields.get('전자 메일 주소', ''),
                'Contact Phone': contact_fields.get('근무처 전화', ''),
                'VC Count': 1 if best_type == 'VC' else 0,
                'Fund Count': 1 if best_type == 'Fund' else 0,
                'Contact Record ID': contact['id']
            }
            matches.append(match_record)
            
            if len(matches) <= 5:
                name = contact_fields.get('이름', 'Unknown')
                print(f"    ✅ MATCH #{len(matches)}: {name} @ {contact_company} → {best_match} ({best_score}%)")
    
    print(f"  🎯 Found {len(matches)} VC industry matches")
    return matches

def upload_to_new_base(matches):
    """Upload matched contacts to Contacts Matched table in new base"""
    if not matches:
        print("❌ No matches to upload")
        return 0
    
    print(f"\n📤 Uploading {len(matches)} matches to new base Contacts Matched table...")
    
    upload_url = f"https://api.airtable.com/v0/{NEW_BASE_ID}/Contacts%20Matched"
    uploaded = 0
    batch_size = 10
    
    for i in range(0, len(matches), batch_size):
        batch = matches[i:i+batch_size]
        records = [{"fields": match} for match in batch]
        payload = {"records": records}
        
        try:
            response = requests.post(upload_url, headers=headers, json=payload)
            if response.status_code == 200:
                created = len(response.json().get('records', []))
                uploaded += created
                
                if i % 50 == 0:
                    print(f"    📤 Uploaded {uploaded}/{len(matches)} matches")
            else:
                print(f"    ❌ Error uploading batch: {response.status_code}")
            
            time.sleep(0.2)
        except Exception as e:
            print(f"    ❌ Exception uploading batch: {e}")
    
    print(f"  ✅ Upload complete: {uploaded} matches uploaded to new base")
    return uploaded

def main():
    print("🚀 Cross-Base VC Matcher")
    print("=" * 60)
    print(f"📊 Original Base: {ORIGINAL_BASE_ID} (VC + Fund Tables)")
    print(f"📊 New Base: {NEW_BASE_ID} (Contacts)")
    print()
    
    # Step 1: Test new base access
    if not test_new_base_access():
        print("❌ Cannot access new base")
        return
    
    # Step 2: Load VC/Fund data from original base
    vc_companies, fund_companies = load_from_original_base()
    if not (vc_companies or fund_companies):
        print("❌ Failed to load VC/Fund data from original base")
        return
    
    # Step 3: Load contacts from new base
    contacts = load_contacts_from_new_base()
    if not contacts:
        print("❌ Failed to load contacts from new base")
        return
    
    print(f"\n📊 DATA LOADED SUCCESSFULLY:")
    print(f"  🏢 VC Companies: {len(vc_companies):,}")
    print(f"  💰 Fund Companies: {len(fund_companies):,}")
    print(f"  👥 Contacts: {len(contacts):,}")
    
    # Step 4: Perform cross-base matching
    matches = perform_cross_base_matching(contacts, vc_companies, fund_companies)
    
    # Step 5: Upload to new base
    if matches:
        uploaded = upload_to_new_base(matches)
        
        print(f"\n🎉 CROSS-BASE MATCHING SUCCESS!")
        print(f"  📊 Contacts processed: {len(contacts):,}")
        print(f"  🎯 VC matches found: {len(matches):,}")
        print(f"  📤 Successfully uploaded: {uploaded:,}")
        print(f"  📈 Match rate: {len(matches)/len(contacts)*100:.2f}%")
    else:
        print("\n❌ No VC matches found")

if __name__ == "__main__":
    main() 