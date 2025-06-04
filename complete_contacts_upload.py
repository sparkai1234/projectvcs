#!/usr/bin/env python3
"""
Complete Contacts Upload with Fixed Field Mapping
Upload all VC industry contacts with proper contact information
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

def clear_existing_data():
    """Clear existing incomplete data from Contacts Matched table"""
    print("🗑️ Clearing existing incomplete data...")
    
    try:
        # Get all existing records
        all_records = []
        url = f"https://api.airtable.com/v0/{AIRTABLE_BASE_ID}/Contacts%20Matched"
        
        while url:
            response = requests.get(url, headers=headers, params={'maxRecords': 100})
            if response.status_code == 200:
                data = response.json()
                records = data.get('records', [])
                all_records.extend(records)
                
                offset = data.get('offset')
                if offset:
                    url = f"https://api.airtable.com/v0/{AIRTABLE_BASE_ID}/Contacts%20Matched?offset={offset}"
                else:
                    url = None
            else:
                print(f"❌ Error loading records: {response.status_code}")
                break
        
        print(f"📊 Found {len(all_records)} existing records to delete")
        
        # Delete in batches of 10
        deleted = 0
        for i in range(0, len(all_records), 10):
            batch = all_records[i:i+10]
            record_ids = [record['id'] for record in batch]
            
            delete_url = f"https://api.airtable.com/v0/{AIRTABLE_BASE_ID}/Contacts%20Matched"
            
            # Build delete URL with multiple record IDs
            params = {'records[]': record_ids}
            response = requests.delete(delete_url, headers=headers, params=params)
            
            if response.status_code == 200:
                deleted_count = len(response.json().get('records', []))
                deleted += deleted_count
                if i % 50 == 0:  # Show progress less frequently
                    print(f"   ✅ Deleted batch {i//10 + 1}: {deleted_count} records (Total: {deleted})")
            else:
                print(f"   ❌ Error deleting batch: {response.status_code}")
            
            time.sleep(0.1)  # Faster rate limiting
        
        print(f"🗑️ Successfully cleared {deleted} existing records")
        return True
        
    except Exception as e:
        print(f"❌ Error clearing data: {e}")
        return False

def load_all_contacts():
    """Load ALL contacts from Contacts Full table"""
    print("📊 Loading ALL contacts from Contacts Full...")
    
    contacts = []
    url = f"https://api.airtable.com/v0/{AIRTABLE_BASE_ID}/Contacts%20Full"
    page_count = 0
    
    while url:
        try:
            # Use smaller batch size for better pagination
            response = requests.get(url, headers=headers, params={'maxRecords': 100})
            if response.status_code == 200:
                data = response.json()
                batch_contacts = data.get('records', [])
                contacts.extend(batch_contacts)
                page_count += 1
                
                # Check for pagination
                offset = data.get('offset')
                if offset:
                    url = f"https://api.airtable.com/v0/{AIRTABLE_BASE_ID}/Contacts%20Full?offset={offset}"
                    print(f"   📈 Page {page_count}: Loaded {len(contacts)} contacts so far...")
                else:
                    url = None  # No more pages
                    print(f"   ✅ Final page {page_count}: Loaded {len(contacts)} total contacts")
                
                time.sleep(0.1)  # Rate limiting
            else:
                print(f"❌ Error loading contacts: {response.status_code}")
                break
        except Exception as e:
            print(f"❌ Exception loading contacts: {e}")
            break
    
    print(f"✅ Total contacts loaded: {len(contacts)} from {page_count} pages")
    return contacts

def load_all_companies():
    """Load all VC and Fund companies"""
    print("🏢 Loading all VC and Fund companies...")
    
    # Load VC companies
    vc_companies = []
    url = f"https://api.airtable.com/v0/{AIRTABLE_BASE_ID}/VC%20Table"
    
    while url:
        try:
            response = requests.get(url, headers=headers, params={'maxRecords': 100})
            if response.status_code == 200:
                data = response.json()
                batch = data.get('records', [])
                vc_companies.extend(batch)
                
                offset = data.get('offset')
                if offset:
                    url = f"https://api.airtable.com/v0/{AIRTABLE_BASE_ID}/VC%20Table?offset={offset}"
                else:
                    url = None
                time.sleep(0.1)
            else:
                break
        except Exception as e:
            break
    
    # Load Fund companies
    fund_companies = []
    url = f"https://api.airtable.com/v0/{AIRTABLE_BASE_ID}/Fund%20Table"
    
    while url:
        try:
            response = requests.get(url, headers=headers, params={'maxRecords': 100})
            if response.status_code == 200:
                data = response.json()
                batch = data.get('records', [])
                fund_companies.extend(batch)
                
                offset = data.get('offset')
                if offset:
                    url = f"https://api.airtable.com/v0/{AIRTABLE_BASE_ID}/Fund%20Table?offset={offset}"
                else:
                    url = None
                time.sleep(0.1)
            else:
                break
        except Exception as e:
            break
    
    print(f"   ✅ Loaded {len(vc_companies)} VC companies")
    print(f"   ✅ Loaded {len(fund_companies)} Fund companies")
    
    return vc_companies, fund_companies

def match_all_contacts(contacts, vc_companies, fund_companies):
    """Match all contacts with VC/Fund companies using proper field mapping"""
    print(f"\n🔍 Matching {len(contacts)} contacts with VC/Fund companies...")
    
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
        if i % 500 == 0 and i > 0:
            print(f"   📊 Processing contact {i+1}/{len(contacts)}... (Found {len(matches)} matches so far)")
        
        contact_fields = contact_record.get('fields', {})
        
        # Get company name (using correct field name from our analysis)
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
            # Create match record with FIXED field mapping
            match_record = {
                'Contact Name': contact_fields.get('이름', ''),  # FIXED: Use '이름' not '성명'
                'Contact Company (Original)': contact_company,
                'Matched Company': best_match,
                'Match Score': best_score,
                'Contact Position': contact_fields.get('직함', ''),  # FIXED: Use '직함' 
                'Contact Email': contact_fields.get('이메일', ''),
                'Contact Phone': contact_fields.get('근무처 전화', ''),  # FIXED: Use correct phone field
                'VC Count': vc_count,
                'Fund Count': fund_count,
                'Contact Record ID': contact_record['id']
            }
            matches.append(match_record)
    
    print(f"   ✅ Found {len(matches)} high-quality matches (85%+ threshold)")
    return matches

def upload_all_matches(matches):
    """Upload all matches to Contacts Matched table"""
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
                if i % 100 == 0:  # Show progress every 10 batches
                    print(f"   ✅ Uploaded batch {i//batch_size + 1}: {created} records (Total: {uploaded})")
            else:
                print(f"   ❌ Error uploading batch {i//batch_size + 1}: {response.status_code}")
                print(f"   📄 Response: {response.text[:200]}")
                
            time.sleep(0.15)  # Rate limiting
            
        except Exception as e:
            print(f"   ❌ Exception uploading batch {i//batch_size + 1}: {e}")
    
    return uploaded

def main():
    print("🚀 Complete Contacts Upload with Fixed Field Mapping")
    print("=" * 60)
    print("This will:")
    print("1. Clear existing incomplete data")
    print("2. Load ALL contacts and companies (with proper pagination)")
    print("3. Match contacts with proper field mapping")
    print("4. Upload complete dataset with contact names and details")
    print()
    
    # Step 1: Clear existing data
    if not clear_existing_data():
        print("❌ Failed to clear existing data")
        return
    
    # Step 2: Load all data
    print("\n" + "="*50)
    contacts = load_all_contacts()
    vc_companies, fund_companies = load_all_companies()
    
    if not (contacts and (vc_companies or fund_companies)):
        print("❌ Failed to load required data")
        return
    
    # Step 3: Match contacts
    print("\n" + "="*50)
    matches = match_all_contacts(contacts, vc_companies, fund_companies)
    
    if not matches:
        print("❌ No matches found")
        return
    
    # Step 4: Upload matches
    print("\n" + "="*50)
    uploaded = upload_all_matches(matches)
    
    print(f"\n🎉 COMPLETE SUCCESS!")
    print(f"📊 Total contacts processed: {len(contacts)}")
    print(f"🎯 Total matches found: {len(matches)}")
    print(f"📤 Successfully uploaded: {uploaded}")
    print(f"🔗 View your complete data: https://airtable.com/{AIRTABLE_BASE_ID}")
    print(f"👥 Now includes contact names, positions, emails, and phone numbers!")

if __name__ == "__main__":
    main() 