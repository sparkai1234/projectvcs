#!/usr/bin/env python3
"""
Simple Korean VC Company Query System
Quick testing version without AI dependencies
"""

import requests
import json
from fuzzywuzzy import fuzz

# Configuration
AIRTABLE_API_KEY = "patOUfAsek4nbpvHm.49789ced0e2b0304bdc507f110d936277cd3da18ec3efc9347c93e6a1810919e"
AIRTABLE_BASE_ID = "appdR8V9lJaRW8VkR"

headers = {
    'Authorization': f'Bearer {AIRTABLE_API_KEY}',
    'Content-Type': 'application/json'
}

def query_company(company_name):
    """Query company information"""
    print(f"\n🔍 Searching for: '{company_name}'")
    print("=" * 60)
    
    # 1. Search VC Table
    print("📊 Searching VC companies...")
    try:
        url = f"https://api.airtable.com/v0/{AIRTABLE_BASE_ID}/VC%20Table"
        response = requests.get(url, headers=headers)
        
        if response.status_code == 200:
            vc_data = response.json().get('records', [])
            print(f"   Found {len(vc_data)} VC companies in database")
            
            # Find best match
            best_vc = None
            best_score = 0
            
            for record in vc_data:
                vc_name = record.get('fields', {}).get('Company Name', '')
                if vc_name:
                    score = fuzz.ratio(company_name, vc_name)
                    if score > best_score:
                        best_score = score
                        best_vc = record
            
            if best_vc and best_score >= 60:
                print(f"   ✅ Best match: {best_vc['fields'].get('Company Name')} ({best_score}%)")
            else:
                print(f"   ❌ No good VC match found")
                best_vc = None
        else:
            print(f"   ❌ Failed to load VC data: {response.status_code}")
            vc_data = []
            best_vc = None
    except Exception as e:
        print(f"   ❌ Error: {e}")
        vc_data = []
        best_vc = None
    
    # 2. Search Fund Table
    print("\n🏦 Searching funds...")
    try:
        url = f"https://api.airtable.com/v0/{AIRTABLE_BASE_ID}/Fund%20Table"
        response = requests.get(url, headers=headers)
        
        if response.status_code == 200:
            fund_data = response.json().get('records', [])
            print(f"   Found {len(fund_data)} funds in database")
            
            # Find matching funds
            matching_funds = []
            for record in fund_data:
                fund_company = record.get('fields', {}).get('Company Name (Korean)', '')
                if fund_company:
                    score = fuzz.ratio(company_name, fund_company)
                    if score >= 80:  # High threshold for funds
                        matching_funds.append(record)
            
            print(f"   ✅ Found {len(matching_funds)} matching funds")
        else:
            print(f"   ❌ Failed to load fund data: {response.status_code}")
            matching_funds = []
    except Exception as e:
        print(f"   ❌ Error: {e}")
        matching_funds = []
    
    # 3. Search Contacts
    print("\n👥 Searching contacts...")
    try:
        url = f"https://api.airtable.com/v0/{AIRTABLE_BASE_ID}/Contacts%20Matched"
        response = requests.get(url, headers=headers)
        
        if response.status_code == 200:
            contact_data = response.json().get('records', [])
            print(f"   Found {len(contact_data)} matched contacts in database")
            
            # Find matching contacts
            matching_contacts = []
            for record in contact_data:
                matched_company = record.get('fields', {}).get('Matched Company', '')
                if matched_company:
                    score = fuzz.ratio(company_name, matched_company)
                    if score >= 80:  # High threshold for contacts
                        matching_contacts.append(record)
            
            print(f"   ✅ Found {len(matching_contacts)} matching contacts")
        else:
            print(f"   ❌ Failed to load contact data: {response.status_code}")
            matching_contacts = []
    except Exception as e:
        print(f"   ❌ Error: {e}")
        matching_contacts = []
    
    # Display Results
    print("\n" + "=" * 60)
    print("📋 RESULTS")
    print("=" * 60)
    
    if not best_vc and not matching_funds and not matching_contacts:
        print("❌ No data found for this company.")
        print("💡 Try variations like '미래에셋벤처투자', '카카오벤처스', etc.")
        return
    
    # 1. Basic Company Info
    if best_vc:
        print("\n🏢 COMPANY INFORMATION")
        print("-" * 40)
        fields = best_vc['fields']
        print(f"Company Name: {fields.get('Company Name', 'N/A')}")
        if fields.get('Company ID'):
            print(f"Company ID: {fields['Company ID']}")
        if fields.get('Industry'):
            print(f"Industry: {fields['Industry']}")
        if fields.get('Location'):
            print(f"Location: {fields['Location']}")
        if fields.get('Founded'):
            print(f"Founded: {fields['Founded']}")
        if fields.get('Company Type'):
            print(f"Type: {fields['Company Type']}")
        if fields.get('Operating Scale'):
            print(f"Operating Scale: {fields['Operating Scale']}")
    
    # 2. Funds
    if matching_funds:
        print("\n🏦 FUNDS OPERATED")
        print("-" * 40)
        print(f"Found {len(matching_funds)} funds:")
        
        for i, fund in enumerate(matching_funds[:10], 1):  # Show first 10
            fields = fund['fields']
            fund_name = fields.get('Name (Fund Name)', 'Unknown Fund')
            print(f"\n{i:2d}. {fund_name}")
            if fields.get('Operating Amount'):
                print(f"    💰 Amount: {fields['Operating Amount']}")
            if fields.get('Industry'):
                print(f"    🏭 Industry: {fields['Industry']}")
            if fields.get('Founded'):
                print(f"    📅 Founded: {fields['Founded']}")
        
        if len(matching_funds) > 10:
            print(f"\n... and {len(matching_funds) - 10} more funds")
    
    # 3. Contacts
    if matching_contacts:
        print("\n👥 PEOPLE AT THIS COMPANY")
        print("-" * 40)
        print(f"Found {len(matching_contacts)} contacts:")
        
        # Get detailed contact info for first 5
        for i, contact in enumerate(matching_contacts[:5], 1):
            fields = contact['fields']
            contact_company = fields.get('Contact Company', 'Unknown')
            match_score = fields.get('Match Score', 0)
            contact_record_id = fields.get('Contact Record ID', '')
            
            print(f"\n{i:2d}. Contact from '{contact_company}' (Match: {match_score}%)")
            
            # Try to get detailed contact info
            if contact_record_id:
                try:
                    contact_url = f"https://api.airtable.com/v0/{AIRTABLE_BASE_ID}/Contacts%20Full/{contact_record_id}"
                    contact_response = requests.get(contact_url, headers=headers)
                    
                    if contact_response.status_code == 200:
                        contact_details = contact_response.json().get('fields', {})
                        if contact_details.get('이름'):
                            print(f"    👤 Name: {contact_details['이름']}")
                        if contact_details.get('직함'):
                            print(f"    💼 Position: {contact_details['직함']}")
                        if contact_details.get('휴대폰'):
                            print(f"    📱 Phone: {contact_details['휴대폰']}")
                        if contact_details.get('전자 메일 주소'):
                            print(f"    📧 Email: {contact_details['전자 메일 주소']}")
                except:
                    print(f"    ⚠️ Could not load detailed contact info")
        
        if len(matching_contacts) > 5:
            print(f"\n... and {len(matching_contacts) - 5} more contacts")
    
    print("\n" + "=" * 60)
    print("🎉 Query complete!")

def main():
    """Simple interactive interface"""
    print("🚀 Korean VC Company Query System")
    print("=" * 50)
    print("Simple version for quick testing")
    print()
    print("💡 Try these companies:")
    print("   • 미래에셋벤처투자")
    print("   • 카카오벤처스")
    print("   • 젠엑시스")
    print("   • 더웰스인베스트먼트")
    
    while True:
        print("\n" + "="*50)
        company_name = input("\n🔍 Enter company name (or 'quit'): ").strip()
        
        if company_name.lower() in ['quit', 'exit', 'q']:
            print("👋 Goodbye!")
            break
        
        if not company_name:
            continue
        
        query_company(company_name)

if __name__ == "__main__":
    main() 