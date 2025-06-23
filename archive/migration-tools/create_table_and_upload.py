#!/usr/bin/env python3
"""
Create Contacts Matched Table and Upload Data
Uses the full API permissions to create table and upload the 1664 matches found
"""

import requests
import json
import time
from datetime import datetime

# Configuration
AIRTABLE_API_KEY = "patOUfAsek4nbpvHm.49789ced0e2b0304bdc507f110d936277cd3da18ec3efc9347c93e6a1810919e"
AIRTABLE_BASE_ID = "appdR8V9lJaRW8VkR"
TABLE_NAME = "Contacts Matched"

headers = {
    'Authorization': f'Bearer {AIRTABLE_API_KEY}',
    'Content-Type': 'application/json'
}

def create_contacts_matched_table():
    """Create the Contacts Matched table with proper schema"""
    print("🏗️ Creating Contacts Matched table...")
    
    schema = {
        "name": TABLE_NAME,
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
                "options": {
                    "precision": 0
                },
                "description": "Fuzzy matching score percentage"
            },
            {
                "name": "Match Quality",
                "type": "singleSelect",
                "options": {
                    "choices": [
                        {"name": "Perfect (100%)", "color": "green"},
                        {"name": "Excellent (95-99%)", "color": "green"}, 
                        {"name": "Very Good (90-94%)", "color": "yellow"},
                        {"name": "Good (85-89%)", "color": "orange"},
                        {"name": "Fair (80-84%)", "color": "red"}
                    ]
                },
                "description": "Quality category of the match"
            },
            {
                "name": "Contact Position",
                "type": "singleLineText",
                "description": "Person's job title/position"
            },
            {
                "name": "Contact Email", 
                "type": "email",
                "description": "Contact email address"
            },
            {
                "name": "Contact Phone",
                "type": "phoneNumber",
                "description": "Contact phone number"
            },
            {
                "name": "VC Count",
                "type": "number",
                "options": {
                    "precision": 0
                },
                "description": "Number of VC records matched"
            },
            {
                "name": "Fund Count", 
                "type": "number",
                "options": {
                    "precision": 0
                },
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
                "options": {
                    "dateFormat": {
                        "name": "iso"
                    },
                    "timeFormat": {
                        "name": "24hour"
                    },
                    "timeZone": "utc"
                },
                "description": "When this match was created"
            }
        ]
    }
    
    url = f"https://api.airtable.com/v0/meta/bases/{AIRTABLE_BASE_ID}/tables"
    
    try:
        print(f"   📡 Making API request to create table...")
        response = requests.post(url, headers=headers, json=schema)
        
        print(f"   📊 Response status: {response.status_code}")
        
        if response.status_code == 200:
            table_data = response.json()
            print(f"   ✅ Table created successfully!")
            print(f"   📋 Table ID: {table_data.get('id', 'N/A')}")
            print(f"   📋 Table Name: {table_data.get('name', 'N/A')}")
            return True
        else:
            print(f"   ❌ Failed to create table")
            print(f"   📄 Response: {response.text}")
            return False
            
    except Exception as e:
        print(f"   ❌ Error creating table: {e}")
        return False

def check_table_exists():
    """Check if table already exists"""
    print("🔍 Checking if Contacts Matched table exists...")
    
    try:
        url = f"https://api.airtable.com/v0/{AIRTABLE_BASE_ID}/{TABLE_NAME.replace(' ', '%20')}"
        response = requests.get(url, headers=headers, params={"maxRecords": 1})
        
        if response.status_code == 200:
            print("   ✅ Table already exists!")
            return True
        elif response.status_code == 404:
            print("   ❌ Table does not exist")
            return False
        else:
            print(f"   ❓ Unexpected status: {response.status_code}")
            return False
            
    except Exception as e:
        print(f"   ❌ Error checking table: {e}")
        return False

def main():
    print("🚀 Creating Contacts Matched Table with Full API Permissions")
    print("=" * 60)
    print(f"API Key: {AIRTABLE_API_KEY}")
    print(f"Base ID: {AIRTABLE_BASE_ID}")
    print()
    
    # Step 1: Check if table exists
    if check_table_exists():
        print("✅ Table already exists - ready for data upload!")
        return True
    
    # Step 2: Create table
    print("\n🏗️ Creating new table...")
    if create_contacts_matched_table():
        print("\n🎉 SUCCESS! Contacts Matched table created!")
        print(f"🔗 View your table: https://airtable.com/{AIRTABLE_BASE_ID}")
        return True
    else:
        print("\n❌ Failed to create table")
        return False

if __name__ == "__main__":
    success = main()
    
    if success:
        print(f"\n💡 Next step: Run the recreation script again to upload the 1,664 matches!")
        print(f"   Or create a separate upload script for the matched data.")
    else:
        print(f"\n💡 Please check your API permissions or try creating the table manually.") 