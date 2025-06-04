#!/usr/bin/env python3
import requests
import json
import time
from datetime import datetime

# Configuration
AIRTABLE_API_KEY = "patOUfAsek4nbpvHm.49789ced0e2b0304bdc507f110d936277cd3da18ec3efc9347c93e6a1810919e"
AIRTABLE_BASE_ID = "appdR8V9lJaRW8VkR"
TABLE_NAME = "Contacts Matched"

# Headers for Airtable API
headers = {
    'Authorization': f'Bearer {AIRTABLE_API_KEY}',
    'Content-Type': 'application/json'
}

def create_simplified_table():
    """Create table with basic fields first"""
    schema = {
        "name": TABLE_NAME,
        "fields": [
            {
                "name": "Contact Company",
                "type": "singleLineText"
            },
            {
                "name": "Matched Company",
                "type": "singleLineText"
            },
            {
                "name": "Match Score",
                "type": "number",
                "options": {
                    "precision": 0
                }
            },
            {
                "name": "Contact Record ID",
                "type": "singleLineText"
            },
            {
                "name": "VC Count",
                "type": "number",
                "options": {
                    "precision": 0
                }
            },
            {
                "name": "Fund Count",
                "type": "number",
                "options": {
                    "precision": 0
                }
            },
            {
                "name": "VC Record IDs",
                "type": "multilineText"
            },
            {
                "name": "Fund Record IDs",
                "type": "multilineText"
            }
        ]
    }
    
    url = f"https://api.airtable.com/v0/meta/bases/{AIRTABLE_BASE_ID}/tables"
    
    try:
        response = requests.post(url, headers=headers, json=schema)
        
        if response.status_code == 200:
            table_data = response.json()
            print(f"✅ Table '{TABLE_NAME}' created successfully!")
            print(f"   Table ID: {table_data.get('id', 'N/A')}")
            return True
        else:
            print(f"❌ Failed to create table: {response.status_code}")
            print(f"   Response: {response.text}")
            return False
            
    except Exception as e:
        print(f"❌ Error creating table: {e}")
        return False

def get_match_quality(score):
    """Determine match quality category based on score"""
    if score == 100:
        return "Perfect"
    elif score >= 95:
        return "Excellent"
    elif score >= 90:
        return "Very Good"
    elif score >= 85:
        return "Good"
    else:
        return "Fair"

def upload_matches():
    """Upload matches to the table"""
    print("📖 Loading fuzzy matching results...")
    with open('simple_fuzzy_results.json', 'r', encoding='utf-8') as f:
        data = json.load(f)
    
    matches = data.get('matches', [])
    print(f"   Found {len(matches)} matches to upload")
    
    # Prepare records
    records_to_upload = []
    
    for match in matches:
        vc_records = match.get('vc_records', [])
        fund_records = match.get('fund_records', [])
        
        record = {
            "fields": {
                "Contact Company": match.get('contact_company', ''),
                "Matched Company": match.get('matched_company', ''),
                "Match Score": match.get('score', 0),
                "Contact Record ID": match.get('contact_record_id', ''),
                "VC Count": len(vc_records),
                "Fund Count": len(fund_records),
                "VC Record IDs": ', '.join(vc_records) if vc_records else '',
                "Fund Record IDs": ', '.join(fund_records) if fund_records else ''
            }
        }
        records_to_upload.append(record)
    
    # Upload in batches
    url = f"https://api.airtable.com/v0/{AIRTABLE_BASE_ID}/{TABLE_NAME}"
    batch_size = 10
    uploaded_count = 0
    total_batches = (len(records_to_upload) + batch_size - 1) // batch_size
    
    print(f"📤 Uploading {len(records_to_upload)} records in {total_batches} batches...")
    
    for i in range(0, len(records_to_upload), batch_size):
        batch = records_to_upload[i:i + batch_size]
        batch_num = (i // batch_size) + 1
        
        try:
            payload = {"records": batch}
            response = requests.post(url, headers=headers, json=payload)
            
            if response.status_code == 200:
                created_records = response.json().get('records', [])
                uploaded_count += len(created_records)
                
                if batch_num % 10 == 0 or batch_num == total_batches:
                    progress = (uploaded_count / len(records_to_upload)) * 100
                    print(f"   📊 Progress: {uploaded_count:,}/{len(records_to_upload):,} records ({progress:.1f}%)")
                
            else:
                print(f"   ❌ Batch {batch_num} failed: {response.status_code}")
                print(f"      Error: {response.text}")
                
        except Exception as e:
            print(f"   ❌ Batch {batch_num} exception: {e}")
        
        # Rate limiting
        if i + batch_size < len(records_to_upload):
            time.sleep(0.5)
    
    return uploaded_count

def main():
    print("=== Creating Contacts Matched Table (Simplified) ===")
    print(f"Started at: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
    print()
    
    # Step 1: Create table
    print("1. Creating Contacts Matched table...")
    if not create_simplified_table():
        print("❌ Failed to create table")
        return
    
    print()
    
    # Step 2: Upload data
    print("2. Uploading matching results...")
    uploaded_count = upload_matches()
    
    print()
    print("🎉 SUCCESS!")
    print(f"   📊 Created table with {uploaded_count:,} matched contacts")
    print(f"   🔗 View: https://airtable.com/{AIRTABLE_BASE_ID}")
    print()
    print("💡 Note: You can manually add select fields and formulas in Airtable UI")

if __name__ == "__main__":
    main() 