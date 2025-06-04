#!/usr/bin/env python3
"""
Final Corrected Cross-Base VC Matcher
Uses direct table ID access and proper pagination to access all contacts
"""

import requests
import json
import time
from fuzzywuzzy import fuzz

# Configuration
AIRTABLE_API_KEY = "patOUfAsek4nbpvHm.49789ced0e2b0304bdc507f110d936277cd3da18ec3efc9347c93e6a1810919e"
ORIGINAL_BASE_ID = "appdR8V9lJaRW8VkR"  # VC/Fund tables
NEW_BASE_ID = "apptH56xIB43Cf2r8"       # Contacts
CONTACTS_TABLE_ID = "tblR93ZxB51PAoJCk"  # Direct table ID

headers = {
    'Authorization': f'Bearer {AIRTABLE_API_KEY}',
    'Content-Type': 'application/json'
}

def load_all_contacts_corrected():
    """Load ALL contacts using direct table ID and corrected pagination"""
    print("🔄 Loading ALL contacts using CORRECTED method...")
    
    all_contacts = []
    base_url = f"https://api.airtable.com/v0/{NEW_BASE_ID}/{CONTACTS_TABLE_ID}"
    page = 1
    offset = None
    
    while True:
        print(f"📄 Loading page {page}...")
        
        # Build URL with offset if available
        if offset:
            url = f"{base_url}?maxRecords=100&offset={offset}"
        else:
            url = f"{base_url}?maxRecords=100"
        
        response = requests.get(url, headers=headers)
        
        if response.status_code == 200:
            data = response.json()
            records = data.get('records', [])
            offset = data.get('offset')
            
            print(f"  ✅ Got {len(records)} records")
            print(f"  🔄 Offset: {'Present' if offset else 'None'}")
            
            all_contacts.extend(records)
            
            if not offset:
                print(f"  🏁 Reached end of data")
                break
                
            page += 1
            
        else:
            print(f"  ❌ Error: {response.status_code}")
            break
        
        time.sleep(0.1)  # Rate limiting
        
        # Safety limit
        if page > 200:
            print(f"  ⚠️ Reached safety limit of 200 pages")
            break
    
    print(f"\n✅ CORRECTED PAGINATION COMPLETE:")
    print(f"  📄 Total pages loaded: {page}")
    print(f"  📊 Total contacts loaded: {len(all_contacts):,}")
    
    return all_contacts

def load_vc_fund_companies():
    """Load VC and Fund companies from original base"""
    print("\n🏢 Loading VC and Fund companies from original base...")
    
    vc_companies = []
    fund_companies = []
    
    # Load VC Table
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
            break
        time.sleep(0.1)
    
    # Load Fund Table
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
            break
        time.sleep(0.1)
    
    print(f"  ✅ Loaded {len(vc_companies)} VC companies")
    print(f"  ✅ Loaded {len(fund_companies)} Fund companies")
    
    return vc_companies, fund_companies

def perform_vc_matching(contacts, vc_companies, fund_companies):
    """Perform comprehensive VC matching"""
    print(f"\n🔍 Performing Comprehensive VC Matching...")
    print(f"  📊 {len(contacts):,} contacts vs {len(vc_companies) + len(fund_companies):,} companies")
    
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
    
    print(f"  🏢 Total companies to match against: {len(all_companies):,}")
    
    matches = []
    threshold = 85
    start_time = time.time()
    
    for i, contact in enumerate(contacts):
        if i % 500 == 0 and i > 0:
            elapsed = time.time() - start_time
            rate = i / elapsed
            remaining = (len(contacts) - i) / rate
            print(f"  📊 Processed {i:,}/{len(contacts):,} - Found {len(matches)} matches - ETA: {remaining/60:.1f}min")
        
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
            
            # Show first few matches
            if len(matches) <= 10:
                name = contact_fields.get('이름', 'Unknown')
                print(f"    ✅ MATCH #{len(matches)}: {name} @ {contact_company} → {best_match} ({best_score}%)")
    
    elapsed = time.time() - start_time
    print(f"\n✅ Matching Complete!")
    print(f"  ⏱️ Time taken: {elapsed/60:.1f} minutes")
    print(f"  🎯 Found {len(matches):,} VC industry matches")
    print(f"  📈 Match rate: {len(matches)/len(contacts)*100:.2f}%")
    
    return matches

def create_contacts_matched_table():
    """Create Contacts Matched table in new base"""
    print(f"\n📋 Creating Contacts Matched table...")
    
    table_url = f"https://api.airtable.com/v0/meta/bases/{NEW_BASE_ID}/tables"
    
    table_data = {
        "tables": [{
            "name": "Contacts Matched",
            "fields": [
                {"name": "Contact Name", "type": "singleLineText"},
                {"name": "Contact Company (Original)", "type": "singleLineText"},
                {"name": "Matched Company", "type": "singleLineText"},
                {"name": "Match Score", "type": "number", "options": {"precision": 0}},
                {"name": "Contact Position", "type": "singleLineText"},
                {"name": "Contact Email", "type": "email"},
                {"name": "Contact Phone", "type": "phoneNumber"},
                {"name": "VC Count", "type": "number", "options": {"precision": 0}},
                {"name": "Fund Count", "type": "number", "options": {"precision": 0}},
                {"name": "Contact Record ID", "type": "singleLineText"}
            ]
        }]
    }
    
    response = requests.post(table_url, headers=headers, json=table_data)
    
    if response.status_code == 200:
        print(f"  ✅ Contacts Matched table created successfully")
        return True
    else:
        print(f"  ⚠️ Table might already exist or creation failed: {response.status_code}")
        return False

def upload_matches(matches):
    """Upload matches to Contacts Matched table"""
    if not matches:
        print("❌ No matches to upload")
        return 0
    
    print(f"\n📤 Uploading {len(matches):,} matches...")
    
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
                
                if i % 100 == 0:
                    print(f"    📤 Uploaded {uploaded:,}/{len(matches):,} matches")
            else:
                print(f"    ❌ Error uploading batch: {response.status_code}")
            
            time.sleep(0.2)
        except Exception as e:
            print(f"    ❌ Exception: {e}")
    
    print(f"  ✅ Upload complete: {uploaded:,} matches uploaded")
    return uploaded

def main():
    print("🚀 FINAL CORRECTED CROSS-BASE VC MATCHER")
    print("=" * 70)
    print("🎯 Using direct table ID access and corrected pagination")
    print()
    
    # Step 1: Load ALL contacts with corrected method
    contacts = load_all_contacts_corrected()
    
    if len(contacts) < 1000:
        print(f"❌ Still only got {len(contacts)} contacts. Cannot proceed.")
        return
    
    print(f"🎉 SUCCESS! Loaded {len(contacts):,} contacts")
    
    # Step 2: Load VC/Fund companies
    vc_companies, fund_companies = load_vc_fund_companies()
    
    # Step 3: Create Contacts Matched table
    create_contacts_matched_table()
    
    # Step 4: Perform comprehensive matching
    matches = perform_vc_matching(contacts, vc_companies, fund_companies)
    
    # Step 5: Upload results
    if matches:
        uploaded = upload_matches(matches)
        
        print(f"\n🎉 FINAL SUCCESS!")
        print(f"  📊 Total contacts processed: {len(contacts):,}")
        print(f"  🏢 VC/Fund companies: {len(vc_companies) + len(fund_companies):,}")
        print(f"  🎯 VC matches found: {len(matches):,}")
        print(f"  📤 Successfully uploaded: {uploaded:,}")
        print(f"  📈 Final match rate: {len(matches)/len(contacts)*100:.2f}%")
    else:
        print("\n❌ No matches found")

if __name__ == "__main__":
    main() 