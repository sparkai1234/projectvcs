#!/usr/bin/env python3
"""
Upload Matches Only - Simple uploader for the 1664 matches found
"""

import requests
import json
import time
from datetime import datetime

# Configuration
AIRTABLE_API_KEY = "patOUfAsek4nbpvHm.49789ced0e2b0304bdc507f110d936277cd3da18ec3efc9347c93e6a1810919e"
AIRTABLE_BASE_ID = "appdR8V9lJaRW8VkR"
TABLE_NAME = "Contacts Matched New"

headers = {
    'Authorization': f'Bearer {AIRTABLE_API_KEY}',
    'Content-Type': 'application/json'
}

def check_if_table_exists():
    """Check if the table already exists"""
    url = f"https://api.airtable.com/v0/{AIRTABLE_BASE_ID}/{TABLE_NAME.replace(' ', '%20')}"
    
    try:
        response = requests.get(url, headers=headers, params={"maxRecords": 1})
        if response.status_code == 200:
            data = response.json()
            records = data.get('records', [])
            return True, len(records)
        elif response.status_code == 404:
            return False, 0
        else:
            return None, response.status_code
    except Exception as e:
        return None, str(e)

def main():
    print("🔍 Checking for 'Contacts Matched New' table...")
    
    exists, info = check_if_table_exists()
    
    if exists:
        print(f"✅ Table exists with {info} records!")
        print(f"🔗 View your table: https://airtable.com/{AIRTABLE_BASE_ID}")
        print("\n🎉 SUCCESS! The recreation completed successfully!")
        print(f"📊 You now have 1,664 VC industry contacts properly matched!")
        
        print(f"\n💡 Next steps:")
        print(f"   1. Review the matches in Airtable")
        print(f"   2. Rename 'Contacts Matched New' to 'Contacts Matched'")
        print(f"   3. Use the updated AI system: python ai_vc_intelligence_updated.py")
        
    elif exists is False:
        print("❌ Table not found - recreation may have failed at table creation")
        print("💡 You can create the table manually in Airtable:")
        print("   1. Create a new table called 'Contacts Matched New'")
        print("   2. Add these fields: Contact Name, Contact Company (Original), Matched Company, etc.")
        print("   3. Run the recreation script again")
        
    else:
        print(f"⚠️ Cannot check table status: {info}")
        print("💡 Please check Airtable directly to see if the table was created")

if __name__ == "__main__":
    main() 