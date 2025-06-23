#!/usr/bin/env python3
"""
Full Upload After Excel - Process All 17,000+ Contacts
Run this AFTER uploading the full Excel file to Airtable
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

def check_contacts_uploaded():
    """Check if full Excel has been uploaded"""
    print("🔍 Checking if full Excel file has been uploaded...")
    
    contacts = []
    url = f"https://api.airtable.com/v0/{AIRTABLE_BASE_ID}/Contacts%20Full"
    
    # Check first 5 pages to get a good estimate
    for page in range(5):  # Check first 5 pages
        try:
            response = requests.get(url, headers=headers, params={'maxRecords': 100})
            if response.status_code == 200:
                data = response.json()
                batch = data.get('records', [])
                contacts.extend(batch)
                
                offset = data.get('offset')
                if offset:
                    url = f"https://api.airtable.com/v0/{AIRTABLE_BASE_ID}/Contacts%20Full?offset={offset}"
                else:
                    break
            else:
                break
        except:
            break
    
    print(f"📊 Found {len(contacts)} contacts in first {page+1} pages")
    
    if len(contacts) > 400:  # 5 pages worth would be 500, so 400+ indicates large dataset
        print("✅ Excellent! Large dataset detected - ready for processing!")
        return True
    elif len(contacts) > 200:  # More than 2 pages worth
        print("✅ Good dataset size detected!")
        return True
    else:
        print("⚠️ Still looks like only partial data")
        print("💡 Please upload your full Excel file to Contacts Full table first")
        return False

def clear_existing_matches():
    """Clear existing matches to start fresh"""
    print("\n🗑️ Clearing existing matches for fresh start...")
    
    try:
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
                break
        
        print(f"📊 Found {len(all_records)} existing records to clear")
        
        # Delete in batches
        deleted = 0
        for i in range(0, len(all_records), 10):
            batch = all_records[i:i+10]
            record_ids = [r['id'] for r in batch]
            
            params = {'records[]': record_ids}
            response = requests.delete(f"https://api.airtable.com/v0/{AIRTABLE_BASE_ID}/Contacts%20Matched", 
                                     headers=headers, params=params)
            
            if response.status_code == 200:
                deleted += len(response.json().get('records', []))
                if i % 100 == 0:
                    print(f"   🗑️ Cleared {deleted} records so far...")
            
            time.sleep(0.1)
        
        print(f"✅ Cleared {deleted} existing records")
        return True
        
    except Exception as e:
        print(f"❌ Error clearing: {e}")
        return False

def load_all_contacts():
    """Load ALL contacts with progress tracking"""
    print("\n📊 Loading ALL contacts from Contacts Full...")
    
    contacts = []
    url = f"https://api.airtable.com/v0/{AIRTABLE_BASE_ID}/Contacts%20Full"
    page_count = 0
    
    start_time = time.time()
    
    while url:
        try:
            response = requests.get(url, headers=headers, params={'maxRecords': 100})
            if response.status_code == 200:
                data = response.json()
                batch_contacts = data.get('records', [])
                contacts.extend(batch_contacts)
                page_count += 1
                
                offset = data.get('offset')
                if offset:
                    url = f"https://api.airtable.com/v0/{AIRTABLE_BASE_ID}/Contacts%20Full?offset={offset}"
                    if page_count % 5 == 0:  # Show progress every 5 pages
                        print(f"   📈 Page {page_count}: {len(contacts)} contacts loaded...")
                else:
                    url = None
                
                time.sleep(0.1)
            else:
                print(f"❌ Error loading contacts: {response.status_code}")
                break
        except Exception as e:
            print(f"❌ Exception: {e}")
            break
    
    elapsed = time.time() - start_time
    print(f"✅ Loaded {len(contacts)} total contacts from {page_count} pages in {elapsed:.1f}s")
    return contacts

def load_all_companies():
    """Load all VC and Fund companies"""
    print("\n🏢 Loading all VC and Fund companies...")
    
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
    """Match all contacts with progress tracking"""
    print(f"\n🔍 Matching {len(contacts)} contacts with VC/Fund companies...")
    print("This will take several minutes for large datasets...")
    
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
    start_time = time.time()
    
    for i, contact_record in enumerate(contacts):
        if i % 1000 == 0 and i > 0:  # Progress every 1000 contacts for large dataset
            elapsed = time.time() - start_time
            rate = i / elapsed
            remaining = (len(contacts) - i) / rate
            print(f"   📊 Processed {i:,}/{len(contacts):,} contacts ({i/len(contacts)*100:.1f}%) - Found {len(matches)} matches - ETA: {remaining/60:.1f}min")
        
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
                
                if company_record in [r for name, r in vc_names]:
                    vc_count = 1
                    fund_count = 0
                else:
                    vc_count = 0  
                    fund_count = 1
        
        if best_match:
            match_record = {
                'Contact Name': contact_fields.get('이름', ''),
                'Contact Company (Original)': contact_company,
                'Matched Company': best_match,
                'Match Score': best_score,
                'Contact Position': contact_fields.get('직함', ''),
                'Contact Email': contact_fields.get('전자 메일 주소', ''),  # Updated field name
                'Contact Phone': contact_fields.get('근무처 전화', ''),
                'VC Count': vc_count,
                'Fund Count': fund_count,
                'Contact Record ID': contact_record['id']
            }
            matches.append(match_record)
    
    elapsed = time.time() - start_time
    print(f"   ✅ Matching complete! Found {len(matches)} high-quality matches in {elapsed/60:.1f}min")
    print(f"   📈 Match rate: {len(matches)/len(contacts)*100:.2f}%")
    return matches

def upload_all_matches(matches):
    """Upload all matches with progress tracking"""
    print(f"\n📤 Uploading {len(matches)} matches to Contacts Matched table...")
    
    url = f"https://api.airtable.com/v0/{AIRTABLE_BASE_ID}/Contacts%20Matched"
    batch_size = 10
    uploaded = 0
    start_time = time.time()
    
    for i in range(0, len(matches), batch_size):
        batch = matches[i:i+batch_size]
        
        records = [{"fields": match} for match in batch]
        payload = {"records": records}
        
        try:
            response = requests.post(url, headers=headers, json=payload)
            
            if response.status_code == 200:
                created = len(response.json().get('records', []))
                uploaded += created
                
                if i % 50 == 0:  # Progress every 5 batches
                    elapsed = time.time() - start_time
                    rate = uploaded / elapsed if elapsed > 0 else 0
                    remaining = (len(matches) - uploaded) / rate if rate > 0 else 0
                    print(f"   📤 Uploaded {uploaded}/{len(matches)} ({uploaded/len(matches)*100:.1f}%) - ETA: {remaining/60:.1f}min")
            else:
                print(f"   ❌ Error uploading batch: {response.status_code}")
                
            time.sleep(0.15)
            
        except Exception as e:
            print(f"   ❌ Exception: {e}")
    
    elapsed = time.time() - start_time
    print(f"   ✅ Upload complete! {uploaded} records in {elapsed/60:.1f}min")
    return uploaded

def main():
    print("🚀 Full Upload After Excel - Process All 17,000+ Contacts")
    print("=" * 60)
    
    # Step 1: Check if Excel was uploaded
    if not check_contacts_uploaded():
        return
    
    # Step 2: Clear existing matches
    if not clear_existing_matches():
        return
    
    # Step 3: Load all data
    contacts = load_all_contacts()
    vc_companies, fund_companies = load_all_companies()
    
    if not (contacts and (vc_companies or fund_companies)):
        print("❌ Failed to load required data")
        return
    
    print(f"\n🎯 Processing {len(contacts):,} contacts - this is a LARGE dataset!")
    print("⏱️ Estimated processing time: 15-30 minutes")
    print("☕ Perfect time for a coffee break!")
    
    # Step 4: Match all contacts
    matches = match_all_contacts(contacts, vc_companies, fund_companies)
    
    if not matches:
        print("❌ No matches found")
        return
    
    # Step 5: Upload all matches
    uploaded = upload_all_matches(matches)
    
    print(f"\n🎉 MASSIVE SUCCESS!")
    print(f"📊 Total contacts processed: {len(contacts):,}")
    print(f"🎯 Total matches found: {len(matches):,}")
    print(f"📤 Successfully uploaded: {uploaded:,}")
    print(f"📈 Final match rate: {len(matches)/len(contacts)*100:.2f}%")
    print(f"🔗 View your complete data: https://airtable.com/{AIRTABLE_BASE_ID}")
    print(f"👥 All contacts include names, positions, emails, and phone numbers!")

if __name__ == "__main__":
    main() 