#!/usr/bin/env python3
"""
Process Available Contacts - Work with what we can access
Process the contacts we can currently access through the API
"""

import requests
import json
import time
from fuzzywuzzy import fuzz

# Configuration
AIRTABLE_API_KEY = "patOUfAsek4nbpvHm.49789ced0e2b0304bdc507f110d936277cd3da18ec3efc9347c93e6a1810919e"
AIRTABLE_BASE_ID = "appdR8V9lJaRW8VkR"

headers = {
    'Authorization': f'Bearer {AIRTABLE_API_KEY}',
    'Content-Type': 'application/json'
}

def load_available_contacts():
    """Load whatever contacts we can access"""
    print("📊 Loading available contacts...")
    
    url = f"https://api.airtable.com/v0/{AIRTABLE_BASE_ID}/Contacts%20Full"
    
    try:
        response = requests.get(url, headers=headers, params={'maxRecords': 100})
        if response.status_code == 200:
            data = response.json()
            contacts = data.get('records', [])
            print(f"✅ Loaded {len(contacts)} contacts")
            return contacts
        else:
            print(f"❌ Error loading contacts: {response.status_code}")
            return []
    except Exception as e:
        print(f"❌ Exception: {e}")
        return []

def load_vc_companies():
    """Load VC companies for matching"""
    print("🏢 Loading VC companies...")
    
    vc_companies = []
    fund_companies = []
    
    # Load VC Table
    url = f"https://api.airtable.com/v0/{AIRTABLE_BASE_ID}/VC%20Table"
    try:
        response = requests.get(url, headers=headers, params={'maxRecords': 100})
        if response.status_code == 200:
            vc_companies = response.json().get('records', [])
            print(f"   ✅ Loaded {len(vc_companies)} VC companies")
    except Exception as e:
        print(f"   ❌ Error loading VC companies: {e}")
    
    # Load Fund Table
    url = f"https://api.airtable.com/v0/{AIRTABLE_BASE_ID}/Fund%20Table"
    try:
        response = requests.get(url, headers=headers, params={'maxRecords': 100})
        if response.status_code == 200:
            fund_companies = response.json().get('records', [])
            print(f"   ✅ Loaded {len(fund_companies)} Fund companies")
    except Exception as e:
        print(f"   ❌ Error loading Fund companies: {e}")
    
    return vc_companies, fund_companies

def match_contacts_with_companies(contacts, vc_companies, fund_companies):
    """Match contacts with VC/Fund companies"""
    print(f"\n🔍 Matching {len(contacts)} contacts with VC companies...")
    
    # Create company lists
    vc_names = []
    for record in vc_companies:
        name = record.get('fields', {}).get('Company Name', '')
        if name:
            vc_names.append((name, 'VC'))
    
    fund_names = []
    for record in fund_companies:
        name = record.get('fields', {}).get('Company Name (Korean)', '')
        if name:
            fund_names.append((name, 'Fund'))
    
    all_companies = vc_names + fund_names
    print(f"   🏢 Matching against {len(all_companies)} companies")
    
    matches = []
    threshold = 85  # 85% matching threshold
    
    for contact in contacts:
        contact_fields = contact.get('fields', {})
        contact_company = contact_fields.get('회사', '').strip()
        
        if not contact_company:
            continue
        
        # Find best match
        best_match = None
        best_score = 0
        company_type = ""
        
        for company_name, comp_type in all_companies:
            score = fuzz.ratio(contact_company, company_name)
            if score >= threshold and score > best_score:
                best_score = score
                best_match = company_name
                company_type = comp_type
        
        if best_match:
            match_record = {
                'Contact Name': contact_fields.get('이름', ''),
                'Contact Company (Original)': contact_company,
                'Matched Company': best_match,
                'Match Score': best_score,
                'Contact Position': contact_fields.get('직함', ''),
                'Contact Email': contact_fields.get('전자 메일 주소', ''),
                'Contact Phone': contact_fields.get('근무처 전화', ''),
                'VC Count': 1 if company_type == 'VC' else 0,
                'Fund Count': 1 if company_type == 'Fund' else 0,
                'Contact Record ID': contact['id']
            }
            matches.append(match_record)
            
            print(f"   ✅ MATCH: {contact_fields.get('이름', 'Unknown')} @ {contact_company} → {best_match} ({best_score}%)")
    
    print(f"\n📊 Found {len(matches)} VC industry matches from {len(contacts)} contacts")
    return matches

def upload_matches(matches):
    """Upload matches to Airtable"""
    if not matches:
        print("❌ No matches to upload")
        return 0
    
    print(f"\n📤 Uploading {len(matches)} matches...")
    
    # Clear existing matches first
    print("🗑️ Clearing existing matches...")
    try:
        url = f"https://api.airtable.com/v0/{AIRTABLE_BASE_ID}/Contacts%20Matched"
        response = requests.get(url, headers=headers, params={'maxRecords': 100})
        if response.status_code == 200:
            existing = response.json().get('records', [])
            if existing:
                for record in existing:
                    delete_url = f"https://api.airtable.com/v0/{AIRTABLE_BASE_ID}/Contacts%20Matched/{record['id']}"
                    requests.delete(delete_url, headers=headers)
                    time.sleep(0.1)
                print(f"   🗑️ Cleared {len(existing)} existing records")
    except:
        pass
    
    # Upload new matches
    url = f"https://api.airtable.com/v0/{AIRTABLE_BASE_ID}/Contacts%20Matched"
    uploaded = 0
    
    for i in range(0, len(matches), 10):
        batch = matches[i:i+10]
        records = [{"fields": match} for match in batch]
        payload = {"records": records}
        
        try:
            response = requests.post(url, headers=headers, json=payload)
            if response.status_code == 200:
                created = len(response.json().get('records', []))
                uploaded += created
                print(f"   ✅ Uploaded batch: {created} records (Total: {uploaded})")
            else:
                print(f"   ❌ Error uploading: {response.status_code}")
            
            time.sleep(0.2)
        except Exception as e:
            print(f"   ❌ Exception: {e}")
    
    return uploaded

def main():
    print("🚀 Process Available Contacts - VC Matching")
    print("=" * 50)
    print("Working with currently accessible contacts through API")
    print()
    
    # Load data
    contacts = load_available_contacts()
    if not contacts:
        print("❌ No contacts available")
        return
    
    vc_companies, fund_companies = load_vc_companies()
    if not (vc_companies or fund_companies):
        print("❌ No VC/Fund companies available")
        return
    
    # Match contacts
    matches = match_contacts_with_companies(contacts, vc_companies, fund_companies)
    
    if matches:
        # Upload matches
        uploaded = upload_matches(matches)
        
        print(f"\n🎉 SUCCESS!")
        print(f"📊 Processed: {len(contacts)} contacts")
        print(f"🎯 Found: {len(matches)} VC industry matches")
        print(f"📤 Uploaded: {uploaded} records")
        print(f"📈 Match rate: {len(matches)/len(contacts)*100:.1f}%")
        print(f"🔗 View results: https://airtable.com/{AIRTABLE_BASE_ID}")
        print(f"\n💡 Note: This is working with {len(contacts)} contacts.")
        print(f"   To process all 17,000+ contacts, check Airtable view filters.")
    else:
        print(f"❌ No VC matches found in available {len(contacts)} contacts")

if __name__ == "__main__":
    main() 