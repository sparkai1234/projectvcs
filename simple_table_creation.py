#!/usr/bin/env python3
"""
Simple Table Creation - Basic fields only
"""

import requests
import json

# Configuration
AIRTABLE_API_KEY = "patOUfAsek4nbpvHm.49789ced0e2b0304bdc507f110d936277cd3da18ec3efc9347c93e6a1810919e"
AIRTABLE_BASE_ID = "appdR8V9lJaRW8VkR"
TABLE_NAME = "Contacts Matched"

headers = {
    'Authorization': f'Bearer {AIRTABLE_API_KEY}',
    'Content-Type': 'application/json'
}

def create_simple_table():
    """Create a simple table with basic fields"""
    print("🏗️ Creating simple Contacts Matched table...")
    
    schema = {
        "name": TABLE_NAME,
        "fields": [
            {
                "name": "Contact Name",
                "type": "singleLineText"
            },
            {
                "name": "Contact Company (Original)",
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
                "name": "Contact Position",
                "type": "singleLineText"
            },
            {
                "name": "Contact Email", 
                "type": "singleLineText"
            },
            {
                "name": "Contact Phone",
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
                "name": "Contact Record ID",
                "type": "singleLineText"
            }
        ]
    }
    
    url = f"https://api.airtable.com/v0/meta/bases/{AIRTABLE_BASE_ID}/tables"
    
    try:
        print(f"   📡 Making API request...")
        response = requests.post(url, headers=headers, json=schema)
        
        print(f"   📊 Response status: {response.status_code}")
        
        if response.status_code == 200:
            table_data = response.json()
            print(f"   ✅ Table created successfully!")
            print(f"   📋 Table ID: {table_data.get('id', 'N/A')}")
            return True
        else:
            print(f"   ❌ Failed: {response.text}")
            return False
            
    except Exception as e:
        print(f"   ❌ Error: {e}")
        return False

def main():
    print("🚀 Simple Table Creation")
    print("=" * 40)
    
    if create_simple_table():
        print("\n🎉 SUCCESS! Table created!")
        print(f"🔗 View: https://airtable.com/{AIRTABLE_BASE_ID}")
        print("\n💡 Now we can upload the 1,664 matches!")
    else:
        print("\n❌ Failed to create table")

if __name__ == "__main__":
    main() 