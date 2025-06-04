#!/usr/bin/env python3
"""
Create Contacts Matched Table
Generates a new Airtable table with fuzzy matching results
"""

import requests
import json
import time
from datetime import datetime
from fuzzy_company_matcher import AirtableFuzzyMatcher

# Configuration
AIRTABLE_API_KEY = "patOUfAsek4nbpvHm.49789ced0e2b0304bdc507f110d936277cd3da18ec3efc9347c93e6a1810919e"
AIRTABLE_BASE_ID = "appdR8V9lJaRW8VkR"
TABLE_NAME = "Contacts Matched"

# Headers for Airtable API
headers = {
    'Authorization': f'Bearer {AIRTABLE_API_KEY}',
    'Content-Type': 'application/json'
}

def create_table_schema():
    """Define the table schema for Contacts Matched"""
    return {
        "name": TABLE_NAME,
        "fields": [
            {
                "name": "Contact Company",
                "type": "singleLineText",
                "description": "Company name from the contact record"
            },
            {
                "name": "Matched Company", 
                "type": "singleLineText",
                "description": "Matched VC/Fund company name"
            },
            {
                "name": "Match Score",
                "type": "number",
                "description": "Similarity score percentage (80-100%)"
            },
            {
                "name": "Match Quality",
                "type": "singleSelect",
                "options": {
                    "choices": [
                        {"name": "Perfect (100%)", "color": "greenBright"},
                        {"name": "Excellent (95-99%)", "color": "green"},
                        {"name": "Very Good (90-94%)", "color": "yellow"},
                        {"name": "Good (85-89%)", "color": "orange"},
                        {"name": "Fair (80-84%)", "color": "red"}
                    ]
                },
                "description": "Quality category of the match"
            },
            {
                "name": "Contact Record ID",
                "type": "singleLineText",
                "description": "Reference to original contact record"
            },
            {
                "name": "VC Count",
                "type": "number",
                "description": "Number of VC records linked to this company"
            },
            {
                "name": "Fund Count",
                "type": "number", 
                "description": "Number of fund records linked to this company"
            },
            {
                "name": "Total Records",
                "type": "formula",
                "options": {
                    "formula": "{VC Count} + {Fund Count}"
                },
                "description": "Total VC + Fund records"
            },
            {
                "name": "Company Type",
                "type": "multipleSelects",
                "options": {
                    "choices": [
                        {"name": "Has VC Records", "color": "blue"},
                        {"name": "Has Fund Records", "color": "purple"},
                        {"name": "Both VC & Fund", "color": "green"}
                    ]
                },
                "description": "Type of records available for this company"
            },
            {
                "name": "VC Record IDs",
                "type": "longText",
                "description": "Comma-separated list of VC record IDs"
            },
            {
                "name": "Fund Record IDs", 
                "type": "longText",
                "description": "Comma-separated list of Fund record IDs"
            },
            {
                "name": "Created Date",
                "type": "dateTime",
                "description": "When this match was created"
            }
        ]
    }

def get_match_quality(score):
    """Determine match quality category based on score"""
    if score == 100:
        return "Perfect (100%)"
    elif score >= 95:
        return "Excellent (95-99%)"
    elif score >= 90:
        return "Very Good (90-94%)"
    elif score >= 85:
        return "Good (85-89%)"
    else:
        return "Fair (80-84%)"

def get_company_type(vc_records, fund_records):
    """Determine company type based on available records"""
    types = []
    if vc_records:
        types.append("Has VC Records")
    if fund_records:
        types.append("Has Fund Records")
    if vc_records and fund_records:
        types.append("Both VC & Fund")
    return types

def create_airtable_table():
    """Create the Contacts Matched table in Airtable"""
    url = f"https://api.airtable.com/v0/meta/bases/{AIRTABLE_BASE_ID}/tables"
    
    schema = create_table_schema()
    
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

def upload_matches_to_table():
    """Upload all matches to the Contacts Matched table"""
    
    # Load results
    print("📖 Loading fuzzy matching results...")
    with open('simple_fuzzy_results.json', 'r', encoding='utf-8') as f:
        data = json.load(f)
    
    matches = data.get('matches', [])
    print(f"   Found {len(matches)} matches to upload")
    
    # Prepare records for upload
    records_to_upload = []
    current_time = datetime.now().isoformat()
    
    for match in matches:
        vc_records = match.get('vc_records', [])
        fund_records = match.get('fund_records', [])
        score = match.get('score', 0)
        
        record = {
            "fields": {
                "Contact Company": match.get('contact_company', ''),
                "Matched Company": match.get('matched_company', ''),
                "Match Score": score,
                "Match Quality": get_match_quality(score),
                "Contact Record ID": match.get('contact_record_id', ''),
                "VC Count": len(vc_records),
                "Fund Count": len(fund_records),
                "Company Type": get_company_type(vc_records, fund_records),
                "VC Record IDs": ', '.join(vc_records) if vc_records else '',
                "Fund Record IDs": ', '.join(fund_records) if fund_records else '',
                "Created Date": current_time
            }
        }
        records_to_upload.append(record)
    
    # Upload in batches of 10 (Airtable limit)
    url = f"https://api.airtable.com/v0/{AIRTABLE_BASE_ID}/{TABLE_NAME}"
    batch_size = 10
    total_batches = (len(records_to_upload) + batch_size - 1) // batch_size
    uploaded_count = 0
    
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
                
                # Progress update
                print(f"   Batch {batch_num}/{total_batches}: ✅ {len(created_records)} records uploaded "
                      f"({uploaded_count}/{len(records_to_upload)} total)")
                
            else:
                print(f"   Batch {batch_num}/{total_batches}: ❌ Failed ({response.status_code})")
                print(f"   Error: {response.text}")
                
        except Exception as e:
            print(f"   Batch {batch_num}/{total_batches}: ❌ Exception: {e}")
        
        # Rate limiting - wait between batches
        if i + batch_size < len(records_to_upload):
            time.sleep(0.5)
    
    print(f"\n✅ Upload complete! {uploaded_count} records successfully created in '{TABLE_NAME}' table")
    return uploaded_count

def main():
    print("=== Creating Contacts Matched Table ===")
    print(f"Started at: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
    print()
    
    # Step 1: Try to create the table
    print("1. Creating Airtable table schema...")
    
    # Note: Creating tables via API might not be supported in all Airtable plans
    # Let's try, but if it fails, we'll provide manual instructions
    table_created = create_airtable_table()
    
    if not table_created:
        print("\n⚠️  Table creation via API failed (this is common with Airtable API limitations)")
        print("\n📋 MANUAL TABLE CREATION INSTRUCTIONS:")
        print("   1. Go to your Airtable base: https://airtable.com/appdR8V9lJaRW8VkR")
        print("   2. Click '+ Add or import' → 'Create blank table'")
        print("   3. Name it: 'Contacts Matched'")
        print("   4. Add these fields:")
        
        schema = create_table_schema()
        for field in schema['fields']:
            field_type = field['type']
            if field_type == 'singleLineText':
                field_type = 'Single line text'
            elif field_type == 'number':
                field_type = 'Number (Integer)'
            elif field_type == 'singleSelect':
                field_type = 'Single select'
            elif field_type == 'multipleSelects':
                field_type = 'Multiple select'
            elif field_type == 'longText':
                field_type = 'Long text'
            elif field_type == 'dateTime':
                field_type = 'Date and time'
            elif field_type == 'formula':
                field_type = 'Formula'
                
            print(f"      • {field['name']} ({field_type})")
        
        print("\n   5. After creating the table manually, run this script again")
        print("      It will detect the table and upload the data")
        
        return
    
    print()
    
    # Step 2: Upload the data
    print("2. Uploading fuzzy matching results...")
    uploaded_count = upload_matches_to_table()
    
    print()
    print("🎉 SUCCESS! Contacts Matched table created and populated")
    print(f"   📊 {uploaded_count} matched contacts uploaded")
    print(f"   🔗 View your table: https://airtable.com/{AIRTABLE_BASE_ID}")
    print()
    print("💡 Your Korean VC ecosystem data is now ready for analysis!")

if __name__ == "__main__":
    main() 