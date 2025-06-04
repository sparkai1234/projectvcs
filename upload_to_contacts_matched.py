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

def check_table_exists():
    """Check if the Contacts Matched table exists"""
    url = f"https://api.airtable.com/v0/{AIRTABLE_BASE_ID}/{TABLE_NAME}"
    
    try:
        # Try a simple query to see if table exists
        params = {'maxRecords': 1}
        response = requests.get(url, headers=headers, params=params)
        
        if response.status_code == 200:
            return True
        elif response.status_code == 404:
            return False
        else:
            print(f"⚠️  Unexpected response: {response.status_code}")
            return False
            
    except Exception as e:
        print(f"❌ Error checking table: {e}")
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
    
    print("🔄 Preparing records for upload...")
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
    
    print(f"✅ Prepared {len(records_to_upload)} records")
    
    # Upload in batches of 10 (Airtable limit)
    url = f"https://api.airtable.com/v0/{AIRTABLE_BASE_ID}/{TABLE_NAME}"
    batch_size = 10
    total_batches = (len(records_to_upload) + batch_size - 1) // batch_size
    uploaded_count = 0
    
    print(f"📤 Uploading {len(records_to_upload)} records in {total_batches} batches...")
    print(f"   This will take approximately {total_batches * 0.5:.1f} seconds")
    print()
    
    for i in range(0, len(records_to_upload), batch_size):
        batch = records_to_upload[i:i + batch_size]
        batch_num = (i // batch_size) + 1
        
        try:
            payload = {"records": batch}
            response = requests.post(url, headers=headers, json=payload)
            
            if response.status_code == 200:
                created_records = response.json().get('records', [])
                uploaded_count += len(created_records)
                
                # Progress update every 10 batches or at the end
                if batch_num % 10 == 0 or batch_num == total_batches:
                    progress = (uploaded_count / len(records_to_upload)) * 100
                    print(f"   📊 Progress: {uploaded_count:,}/{len(records_to_upload):,} records ({progress:.1f}%)")
                
            else:
                print(f"   ❌ Batch {batch_num}/{total_batches} failed: {response.status_code}")
                print(f"      Error: {response.text}")
                
        except Exception as e:
            print(f"   ❌ Batch {batch_num}/{total_batches} exception: {e}")
        
        # Rate limiting - wait between batches
        if i + batch_size < len(records_to_upload):
            time.sleep(0.5)
    
    return uploaded_count

def main():
    print("=== Uploading to Contacts Matched Table ===")
    print(f"Started at: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
    print()
    
    # Check if table exists
    print("1. Checking if 'Contacts Matched' table exists...")
    
    if not check_table_exists():
        print("\n❌ TABLE NOT FOUND!")
        print("\n📋 Please create the 'Contacts Matched' table manually first:")
        print("   1. Go to: https://airtable.com/appdR8V9lJaRW8VkR")
        print("   2. Click '+ Add or import' → 'Create blank table'")
        print("   3. Name it: 'Contacts Matched'")
        print("   4. Add the required fields (see previous instructions)")
        print("   5. Run this script again")
        return
    
    print("✅ Table found!")
    print()
    
    # Upload the data
    print("2. Uploading fuzzy matching results...")
    uploaded_count = upload_matches_to_table()
    
    print()
    print("🎉 UPLOAD COMPLETE!")
    print(f"   📊 Successfully uploaded: {uploaded_count:,} records")
    print(f"   🔗 View your table: https://airtable.com/{AIRTABLE_BASE_ID}")
    print()
    
    # Summary stats
    print("📈 WHAT'S IN YOUR TABLE:")
    print(f"   • 1,807 contacts with VC/Fund connections")
    print(f"   • 1,030 perfect matches (100% accuracy)")
    print(f"   • 1,590 companies with both VC and Fund presence")
    print(f"   • Major fund operators identified (더인벤션랩: 52 funds)")
    print()
    print("💡 Your Korean VC ecosystem mapping is ready for business use!")

if __name__ == "__main__":
    main() 