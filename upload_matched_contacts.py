#!/usr/bin/env python3
"""
Upload Matched Contacts to Airtable
Process contacts, match with VC/Fund companies, and upload high-quality matches
"""

import requests
import json
import time
from datetime import datetime
from fuzzywuzzy import fuzz

# Configuration
AIRTABLE_API_KEY = "patOUfAsek4nbpvHm.49789ced0e2b0304bdc507f110d936277cd3da18ec3efc9347c93e6a1810919e"
AIRTABLE_BASE_ID = "appdR8V9lJaRW8VkR"

headers = {
    'Authorization': f'Bearer {AIRTABLE_API_KEY}',
    'Content-Type': 'application/json'
}

def load_vc_companies():
    """Load all VC companies"""
    print("📊 Loading VC companies...")
    companies = []
    url = f"https://api.airtable.com/v0/{AIRTABLE_BASE_ID}/VC%20Table"
    
    while url:
        try:
            response = requests.get(url, headers=headers)
            if response.status_code == 200:
                data = response.json()
                companies.extend(data.get('records', []))
                url = data.get('offset')
                if url:
                    url = f"https://api.airtable.com/v0/{AIRTABLE_BASE_ID}/VC%20Table?offset={url}"
                time.sleep(0.2)  # Rate limiting
            else:
                print(f"❌ Error loading VC companies: {response.status_code}")
                break
        except Exception as e:
            print(f"❌ Exception loading VC companies: {e}")
            break
    
    print(f"   ✅ Loaded {len(companies)} VC companies")
    return companies

def load_fund_companies():
    """Load all Fund companies"""
    print("📊 Loading Fund companies...")
    companies = []
    url = f"https://api.airtable.com/v0/{AIRTABLE_BASE_ID}/Fund%20Table"
    
    while url:
        try:
            response = requests.get(url, headers=headers)
            if response.status_code == 200:
                data = response.json()
                companies.extend(data.get('records', []))
                url = data.get('offset')
                if url:
                    url = f"https://api.airtable.com/v0/{AIRTABLE_BASE_ID}/Fund%20Table?offset={url}"
                time.sleep(0.2)  # Rate limiting
            else:
                print(f"❌ Error loading Fund companies: {response.status_code}")
                break
        except Exception as e:
            print(f"❌ Exception loading Fund companies: {e}")
            break
    
    print(f"   ✅ Loaded {len(companies)} Fund companies")
    return companies

def load_contacts():
    """Load contacts from Contacts Full table"""
    print("📊 Loading contacts...")
    contacts = []
    url = f"https://api.airtable.com/v0/{AIRTABLE_BASE_ID}/Contacts%20Full"
    
    while url:
        try:
            response = requests.get(url, headers=headers)
            if response.status_code == 200:
                data = response.json()
                contacts.extend(data.get('records', []))
                url = data.get('offset')
                if url:
                    url = f"https://api.airtable.com/v0/{AIRTABLE_BASE_ID}/Contacts%20Full?offset={url}"
                time.sleep(0.2)  # Rate limiting
                print(f"   📈 Loaded {len(contacts)} contacts so far...")
            else:
                print(f"❌ Error loading contacts: {response.status_code}")
                break
        except Exception as e:
            print(f"❌ Exception loading contacts: {e}")
            break
    
    print(f"   ✅ Loaded {len(contacts)} total contacts")
    return contacts

def match_contacts(contacts, vc_companies, fund_companies):
    """Match contacts with VC/Fund companies"""
    print("\n🔍 Matching contacts with VC/Fund companies...")
    
    # Create company name lists
    vc_names = []
    for record in vc_companies:
        name = record.get('fields', {}).get('Company Name', '')
        if name:
            vc_names.append((name, record))
    
    fund_names = []
    for record in fund_companies:
        name = record.get('fields', {}).get('Company Name (Korean)', '')
        if name:
            fund_names.append((name, record))
    
    all_companies = vc_names + fund_names
    print(f"   🏢 Total companies to match against: {len(all_companies)}")
    
    matches = []
    threshold = 85  # 85% matching threshold
    
    for i, contact_record in enumerate(contacts):
        if i % 100 == 0:
            print(f"   📊 Processing contact {i+1}/{len(contacts)}...")
        
        contact_fields = contact_record.get('fields', {})
        contact_company = contact_fields.get('회사', '').strip()
        
        if not contact_company:
            continue
        
        # Find best match
        best_match = None
        best_score = 0
        vc_count = 0
        fund_count = 0
        
        for company_name, company_record in all_companies:
            score = fuzz.ratio(contact_company, company_name)
            if score >= threshold and score > best_score:
                best_score = score
                best_match = company_name
                
                # Count if it's VC or Fund
                if company_record in [r for name, r in vc_names]:
                    vc_count = 1
                    fund_count = 0
                else:
                    vc_count = 0  
                    fund_count = 1
        
        if best_match:
            match_record = {
                'Contact Name': contact_fields.get('성명', ''),
                'Contact Company (Original)': contact_company,
                'Matched Company': best_match,
                'Match Score': best_score,
                'Contact Position': contact_fields.get('직책', ''),
                'Contact Email': contact_fields.get('이메일', ''),
                'Contact Phone': contact_fields.get('연락처', ''),
                'VC Count': vc_count,
                'Fund Count': fund_count,
                'Contact Record ID': contact_record['id']
            }
            matches.append(match_record)
    
    print(f"   ✅ Found {len(matches)} high-quality matches (85%+ threshold)")
    return matches

def upload_matches(matches):
    """Upload matches to Contacts Matched table"""
    print(f"\n📤 Uploading {len(matches)} matches to Contacts Matched table...")
    
    url = f"https://api.airtable.com/v0/{AIRTABLE_BASE_ID}/Contacts%20Matched"
    batch_size = 10  # Airtable max
    uploaded = 0
    
    for i in range(0, len(matches), batch_size):
        batch = matches[i:i+batch_size]
        
        # Format for Airtable
        records = []
        for match in batch:
            record = {"fields": match}
            records.append(record)
        
        payload = {"records": records}
        
        try:
            response = requests.post(url, headers=headers, json=payload)
            
            if response.status_code == 200:
                created = len(response.json().get('records', []))
                uploaded += created
                print(f"   ✅ Uploaded batch {i//batch_size + 1}: {created} records (Total: {uploaded})")
            else:
                print(f"   ❌ Error uploading batch {i//batch_size + 1}: {response.status_code}")
                print(f"   📄 Response: {response.text[:200]}")
                
            time.sleep(0.2)  # Rate limiting
            
        except Exception as e:
            print(f"   ❌ Exception uploading batch {i//batch_size + 1}: {e}")
    
    return uploaded

def main():
    print("🚀 Upload Matched Contacts to Airtable")
    print("=" * 50)
    
    # Load data
    vc_companies = load_vc_companies()
    fund_companies = load_fund_companies()
    contacts = load_contacts()
    
    if not (vc_companies and fund_companies and contacts):
        print("❌ Failed to load required data")
        return
    
    # Match contacts
    matches = match_contacts(contacts, vc_companies, fund_companies)
    
    if not matches:
        print("❌ No matches found")
        return
    
    # Upload matches
    uploaded = upload_matches(matches)
    
    print(f"\n🎉 SUCCESS!")
    print(f"📊 Total matches found: {len(matches)}")
    print(f"📤 Successfully uploaded: {uploaded}")
    print(f"🔗 View your data: https://airtable.com/{AIRTABLE_BASE_ID}")

if __name__ == "__main__":
    main() 