#!/usr/bin/env python3
"""
Recreate Contacts Matched Table
This script properly matches people from "Contacts Full" table to companies that operate funds.
Matching is done between:
- "회사" field from "Contacts Full" table 
- "Company Name" from VC Table
- "Company Name (Korean)" from Fund Table
"""

import requests
import json
import time
from datetime import datetime
from fuzzywuzzy import fuzz, process

# Configuration
AIRTABLE_API_KEY = "patOUfAsek4nbpvHm.49789ced0e2b0304bdc507f110d936277cd3da18ec3efc9347c93e6a1810919e"
AIRTABLE_BASE_ID = "appdR8V9lJaRW8VkR"
OLD_TABLE_NAME = "Contacts Matched"
NEW_TABLE_NAME = "Contacts Matched New"

# Headers for Airtable API
headers = {
    'Authorization': f'Bearer {AIRTABLE_API_KEY}',
    'Content-Type': 'application/json'
}

class ContactsMatcher:
    def __init__(self):
        self.vc_companies = {}      # {record_id: company_name}
        self.fund_companies = {}    # {record_id: company_name} 
        self.contacts_full = {}     # {record_id: {"회사": company, "이름": name, "직함": title, etc.}}
        self.matches = []
        
    def fetch_vc_companies(self):
        """Fetch VC companies from VC Table"""
        print("📊 Loading VC companies...")
        
        url = f"https://api.airtable.com/v0/{AIRTABLE_BASE_ID}/VC%20Table"
        all_records = {}
        offset = None
        
        while True:
            params = {"fields[]": "Company Name"}
            if offset:
                params["offset"] = offset
                
            response = requests.get(url, headers=headers, params=params)
            
            if response.status_code != 200:
                print(f"❌ Error fetching VC Table: {response.text}")
                break
                
            data = response.json()
            
            for record in data.get("records", []):
                company_name = record.get("fields", {}).get("Company Name")
                if company_name:
                    all_records[record["id"]] = company_name.strip()
            
            offset = data.get("offset")
            if not offset:
                break
                
            time.sleep(0.2)  # Rate limiting
        
        self.vc_companies = all_records
        print(f"   ✅ Loaded {len(all_records)} VC companies")
        
    def fetch_fund_companies(self):
        """Fetch Fund companies from Fund Table"""
        print("📊 Loading Fund companies...")
        
        url = f"https://api.airtable.com/v0/{AIRTABLE_BASE_ID}/Fund%20Table"
        all_records = {}
        offset = None
        
        while True:
            params = {"fields[]": "Company Name (Korean)"}
            if offset:
                params["offset"] = offset
                
            response = requests.get(url, headers=headers, params=params)
            
            if response.status_code != 200:
                print(f"❌ Error fetching Fund Table: {response.text}")
                break
                
            data = response.json()
            
            for record in data.get("records", []):
                company_name = record.get("fields", {}).get("Company Name (Korean)")
                if company_name:
                    all_records[record["id"]] = company_name.strip()
            
            offset = data.get("offset")
            if not offset:
                break
                
            time.sleep(0.2)  # Rate limiting
        
        self.fund_companies = all_records
        print(f"   ✅ Loaded {len(all_records)} Fund companies")
        
    def fetch_contacts_full(self):
        """Fetch all contacts from Contacts Full table"""
        print("📊 Loading full contacts data...")
        
        url = f"https://api.airtable.com/v0/{AIRTABLE_BASE_ID}/Contacts%20Full"
        all_records = {}
        offset = None
        
        while True:
            params = {}  # Get all fields
            if offset:
                params["offset"] = offset
                
            response = requests.get(url, headers=headers, params=params)
            
            if response.status_code != 200:
                print(f"❌ Error fetching Contacts Full: {response.text}")
                break
                
            data = response.json()
            
            for record in data.get("records", []):
                fields = record.get("fields", {})
                company_name = fields.get("회사")
                if company_name:  # Only include contacts with company info
                    all_records[record["id"]] = fields
            
            offset = data.get("offset")
            if not offset:
                break
                
            time.sleep(0.2)  # Rate limiting
        
        self.contacts_full = all_records
        print(f"   ✅ Loaded {len(all_records)} contacts with company info")
        
    def perform_fuzzy_matching(self, threshold=85):
        """Match contacts to VC/Fund companies using fuzzy matching"""
        print(f"🔗 Performing fuzzy matching (threshold: {threshold}%)...")
        
        # Combine all VC and Fund companies
        all_companies = {}
        
        # Add VC companies
        for record_id, company in self.vc_companies.items():
            if company not in all_companies:
                all_companies[company] = {"vc_records": [], "fund_records": []}
            all_companies[company]["vc_records"].append(record_id)
            
        # Add Fund companies  
        for record_id, company in self.fund_companies.items():
            if company not in all_companies:
                all_companies[company] = {"vc_records": [], "fund_records": []}
            all_companies[company]["fund_records"].append(record_id)
        
        print(f"   📊 Total unique companies to match against: {len(all_companies)}")
        
        matches = []
        match_count = 0
        
        # Match each contact against all companies
        for contact_record_id, contact_fields in self.contacts_full.items():
            contact_company = contact_fields.get("회사", "").strip()
            
            if not contact_company:
                continue
                
            # Find best matches using fuzzy matching
            best_matches = process.extract(contact_company, list(all_companies.keys()), limit=3)
            
            for matched_company, score in best_matches:
                if score >= threshold:
                    match_count += 1
                    print(f"   ✅ Match {match_count}: '{contact_company}' → '{matched_company}' ({score}%)")
                    
                    match_data = {
                        "contact_record_id": contact_record_id,
                        "contact_company": contact_company,
                        "matched_company": matched_company,
                        "match_score": score,
                        "vc_records": all_companies[matched_company]["vc_records"],
                        "fund_records": all_companies[matched_company]["fund_records"],
                        "contact_fields": contact_fields  # Store all contact info
                    }
                    matches.append(match_data)
                    break  # Take only the best match per contact
        
        self.matches = matches
        print(f"   🎯 Total matches found: {len(matches)}")
        
    def delete_old_table(self):
        """Delete the old Contacts Matched table if it exists"""
        print("🗑️  Checking for existing Contacts Matched table...")
        
        # First check if table exists
        url = f"https://api.airtable.com/v0/{AIRTABLE_BASE_ID}/{OLD_TABLE_NAME.replace(' ', '%20')}"
        response = requests.get(url, headers=headers, params={"maxRecords": 1})
        
        if response.status_code == 404:
            print("   ℹ️  No existing table found")
            return True
        elif response.status_code != 200:
            print(f"   ⚠️  Could not check table status: {response.status_code}")
            return False
            
        print("   ⚠️  Existing table found - you'll need to manually delete it in Airtable")
        print("   💡 Go to Airtable → Right-click table → Delete table")
        print("   🔄 Then run this script again")
        return False
        
    def create_new_table(self):
        """Create the new Contacts Matched table"""
        print("🏗️  Creating new Contacts Matched table...")
        
        schema = {
            "name": NEW_TABLE_NAME,
            "fields": [
                {
                    "name": "Contact Name",
                    "type": "singleLineText",
                    "description": "Person's name from contact record"
                },
                {
                    "name": "Contact Company (Original)",
                    "type": "singleLineText", 
                    "description": "Original company name from contact (회사 field)"
                },
                {
                    "name": "Matched Company",
                    "type": "singleLineText",
                    "description": "Matched VC/Fund company name"
                },
                {
                    "name": "Match Score",
                    "type": "number",
                    "description": "Fuzzy matching score percentage"
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
                    }
                },
                {
                    "name": "Contact Position",
                    "type": "singleLineText",
                    "description": "Person's job title/position"
                },
                {
                    "name": "Contact Phone",
                    "type": "phoneNumber",
                    "description": "Contact phone number"
                },
                {
                    "name": "Contact Email", 
                    "type": "email",
                    "description": "Contact email address"
                },
                {
                    "name": "VC Count",
                    "type": "number",
                    "description": "Number of VC records matched"
                },
                {
                    "name": "Fund Count", 
                    "type": "number",
                    "description": "Number of Fund records matched"
                },
                {
                    "name": "Contact Record ID",
                    "type": "singleLineText",
                    "description": "Original contact record ID"
                },
                {
                    "name": "Created Date",
                    "type": "dateTime",
                    "description": "When this match was created"
                }
            ]
        }
        
        url = f"https://api.airtable.com/v0/meta/bases/{AIRTABLE_BASE_ID}/tables"
        
        try:
            response = requests.post(url, headers=headers, json=schema)
            
            if response.status_code == 200:
                table_data = response.json()
                print(f"   ✅ Table created successfully!")
                print(f"   📋 Table ID: {table_data.get('id', 'N/A')}")
                return True
            else:
                print(f"   ❌ Failed to create table: {response.status_code}")
                print(f"   📄 Response: {response.text}")
                return False
                
        except Exception as e:
            print(f"   ❌ Error creating table: {e}")
            return False
            
    def get_match_quality(self, score):
        """Determine match quality category"""
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
            
    def upload_matches(self):
        """Upload all matches to the new table"""
        print("📤 Uploading matched contacts...")
        
        if not self.matches:
            print("   ⚠️  No matches to upload")
            return 0
            
        # Prepare records
        records_to_upload = []
        current_time = datetime.now().isoformat()
        
        for match in self.matches:
            contact_fields = match["contact_fields"]
            
            record = {
                "fields": {
                    "Contact Name": contact_fields.get("이름", ""),
                    "Contact Company (Original)": match["contact_company"],
                    "Matched Company": match["matched_company"],
                    "Match Score": match["match_score"],
                    "Match Quality": self.get_match_quality(match["match_score"]),
                    "Contact Position": contact_fields.get("직함", ""),
                    "Contact Phone": contact_fields.get("휴대폰", ""),
                    "Contact Email": contact_fields.get("전자 메일 주소", ""),
                    "VC Count": len(match["vc_records"]),
                    "Fund Count": len(match["fund_records"]),
                    "Contact Record ID": match["contact_record_id"],
                    "Created Date": current_time
                }
            }
            records_to_upload.append(record)
        
        # Upload in batches
        url = f"https://api.airtable.com/v0/{AIRTABLE_BASE_ID}/{NEW_TABLE_NAME.replace(' ', '%20')}"
        batch_size = 10
        total_batches = (len(records_to_upload) + batch_size - 1) // batch_size
        uploaded_count = 0
        
        print(f"   📊 Uploading {len(records_to_upload)} records in {total_batches} batches...")
        
        for i in range(0, len(records_to_upload), batch_size):
            batch = records_to_upload[i:i + batch_size]
            batch_num = (i // batch_size) + 1
            
            try:
                response = requests.post(url, headers=headers, json={"records": batch})
                
                if response.status_code == 200:
                    batch_uploaded = len(batch)
                    uploaded_count += batch_uploaded
                    print(f"   ✅ Batch {batch_num}/{total_batches}: {batch_uploaded} records uploaded")
                else:
                    print(f"   ❌ Batch {batch_num} failed: {response.status_code}")
                    print(f"      Response: {response.text[:200]}...")
                    
            except Exception as e:
                print(f"   ❌ Batch {batch_num} error: {e}")
                
            time.sleep(0.5)  # Rate limiting
        
        print(f"   🎉 Upload complete: {uploaded_count}/{len(records_to_upload)} records")
        return uploaded_count
        
    def run_full_recreation(self):
        """Run the complete table recreation process"""
        print("🚀 Starting Contacts Matched table recreation...")
        print("=" * 60)
        
        # Step 1: Load all data
        print("\n1️⃣  LOADING DATA")
        print("-" * 30)
        self.fetch_vc_companies()
        self.fetch_fund_companies() 
        self.fetch_contacts_full()
        
        if not self.contacts_full:
            print("❌ No contact data found - cannot proceed")
            return
            
        # Step 2: Perform matching
        print("\n2️⃣  FUZZY MATCHING")
        print("-" * 30)
        self.perform_fuzzy_matching(threshold=85)
        
        if not self.matches:
            print("❌ No matches found - cannot proceed")
            return
            
        # Step 3: Check/delete old table
        print("\n3️⃣  TABLE MANAGEMENT")
        print("-" * 30)
        if not self.delete_old_table():
            return
            
        # Step 4: Create new table
        print("\n4️⃣  CREATING NEW TABLE")
        print("-" * 30)
        if not self.create_new_table():
            print("❌ Could not create new table")
            print("💡 Try creating the table manually in Airtable, then run upload only")
            return
            
        # Step 5: Upload data
        print("\n5️⃣  UPLOADING DATA")
        print("-" * 30)
        uploaded_count = self.upload_matches()
        
        # Step 6: Summary
        print("\n🎉 RECREATION COMPLETE!")
        print("=" * 60)
        print(f"📊 Statistics:")
        print(f"   • VC Companies: {len(self.vc_companies)}")
        print(f"   • Fund Companies: {len(self.fund_companies)}")
        print(f"   • Total Contacts: {len(self.contacts_full)}")
        print(f"   • Successful Matches: {len(self.matches)}")
        print(f"   • Records Uploaded: {uploaded_count}")
        print(f"   • Match Rate: {len(self.matches)/len(self.contacts_full)*100:.1f}%")
        
        print(f"\n🔗 View your new table:")
        print(f"   https://airtable.com/{AIRTABLE_BASE_ID}")
        
        print(f"\n💡 Next steps:")
        print(f"   1. Review the matches in Airtable")
        print(f"   2. Rename '{NEW_TABLE_NAME}' to 'Contacts Matched'")
        print(f"   3. Update any scripts that reference the old table")

def main():
    print("🔄 Recreate Contacts Matched Table")
    print("=" * 50)
    print("This will recreate the Contacts Matched table by:")
    print("• Loading all contacts from 'Contacts Full'")
    print("• Matching '회사' field to VC and Fund company names")
    print("• Creating a new table with proper relationships")
    print()
    
    confirm = input("Continue? (y/N): ").strip().lower()
    if confirm != 'y':
        print("❌ Cancelled")
        return
        
    matcher = ContactsMatcher()
    matcher.run_full_recreation()

if __name__ == "__main__":
    main() 