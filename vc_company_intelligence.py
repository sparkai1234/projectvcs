#!/usr/bin/env python3
"""
Korean VC Company Intelligence Interface
Provides comprehensive company profiles including basic info, funds, and contacts
"""

import requests
import json
import re
from fuzzywuzzy import fuzz

# Configuration
AIRTABLE_API_KEY = "patOUfAsek4nbpvHm.49789ced0e2b0304bdc507f110d936277cd3da18ec3efc9347c93e6a1810919e"
AIRTABLE_BASE_ID = "appdR8V9lJaRW8VkR"

# Headers for Airtable API
headers = {
    'Authorization': f'Bearer {AIRTABLE_API_KEY}',
    'Content-Type': 'application/json'
}

class VCCompanyIntelligence:
    def __init__(self):
        self.vc_companies = []
        self.funds = []
        self.contacts = []
        print("🔄 Initializing Korean VC Intelligence System...")
        self.load_data()
        print("✅ System ready!")
    
    def fetch_all_records(self, table_name, fields=None):
        """Fetch all records from a table"""
        url = f"https://api.airtable.com/v0/{AIRTABLE_BASE_ID}/{table_name}"
        
        params = {}
        if fields:
            for field in fields:
                params[f'fields[]'] = field
        
        all_records = []
        offset = None
        
        while True:
            if offset:
                params['offset'] = offset
            
            try:
                response = requests.get(url, headers=headers, params=params)
                response.raise_for_status()
                data = response.json()
                
                all_records.extend(data.get('records', []))
                
                offset = data.get('offset')
                if not offset:
                    break
                    
            except Exception as e:
                print(f"Error fetching {table_name}: {e}")
                break
        
        return all_records
    
    def load_data(self):
        """Load all necessary data"""
        print("📊 Loading VC companies...")
        vc_records = self.fetch_all_records("VC Table")
        self.vc_companies = [
            {
                'id': record['id'],
                'name': record.get('fields', {}).get('Company Name', ''),
                'company_id': record.get('fields', {}).get('Company ID', ''),
                'industry': record.get('fields', {}).get('Industry', ''),
                'location': record.get('fields', {}).get('Location', ''),
                'founded': record.get('fields', {}).get('Founded', ''),
                'company_type': record.get('fields', {}).get('Company Type', ''),
                'operating_scale': record.get('fields', {}).get('Operating Scale', ''),
                'detailed_notes': record.get('fields', {}).get('Detailed Notes', ''),
                'fields': record.get('fields', {})
            }
            for record in vc_records if record.get('fields', {}).get('Company Name')
        ]
        print(f"   Loaded {len(self.vc_companies)} VC companies")
        
        print("🏦 Loading funds...")
        fund_records = self.fetch_all_records("Fund Table")
        self.funds = [
            {
                'id': record['id'],
                'name': record.get('fields', {}).get('Name (Fund Name)', ''),
                'company_name': record.get('fields', {}).get('Company Name (Korean)', ''),
                'company_id': record.get('fields', {}).get('Company ID', ''),
                'industry': record.get('fields', {}).get('Industry', ''),
                'founded': record.get('fields', {}).get('Founded', ''),
                'operating_amount': record.get('fields', {}).get('Operating Amount', ''),
                'detailed_notes': record.get('fields', {}).get('Detailed Notes', ''),
                'fields': record.get('fields', {})
            }
            for record in fund_records if record.get('fields', {}).get('Name (Fund Name)')
        ]
        print(f"   Loaded {len(self.funds)} funds")
        
        print("👥 Loading matched contacts...")
        contact_records = self.fetch_all_records("Contacts Matched")
        self.contacts = [
            {
                'id': record['id'],
                'contact_company': record.get('fields', {}).get('Contact Company', ''),
                'matched_company': record.get('fields', {}).get('Matched Company', ''),
                'match_score': record.get('fields', {}).get('Match Score', 0),
                'contact_record_id': record.get('fields', {}).get('Contact Record ID', ''),
                'vc_count': record.get('fields', {}).get('VC Count', 0),
                'fund_count': record.get('fields', {}).get('Fund Count', 0),
                'fields': record.get('fields', {})
            }
            for record in contact_records if record.get('fields', {}).get('Contact Company')
        ]
        print(f"   Loaded {len(self.contacts)} contact matches")
    
    def find_company(self, query):
        """Find company using fuzzy matching"""
        best_match = None
        best_score = 0
        
        # Clean query
        query_clean = query.strip()
        
        # Search in VC companies
        for company in self.vc_companies:
            score = fuzz.ratio(query_clean, company['name'])
            if score > best_score:
                best_score = score
                best_match = ('vc', company)
        
        # Search in fund company names
        for fund in self.funds:
            if fund['company_name']:
                score = fuzz.ratio(query_clean, fund['company_name'])
                if score > best_score:
                    best_score = score
                    best_match = ('fund_company', fund)
        
        return best_match if best_score >= 60 else None
    
    def get_company_funds(self, company_name):
        """Get all funds operated by a company"""
        funds = []
        
        for fund in self.funds:
            if fund['company_name']:
                score = fuzz.ratio(company_name, fund['company_name'])
                if score >= 80:  # High threshold for fund matching
                    funds.append(fund)
        
        return funds
    
    def get_company_contacts(self, company_name):
        """Get all contacts working at a company"""
        contacts = []
        
        for contact in self.contacts:
            if contact['matched_company']:
                score = fuzz.ratio(company_name, contact['matched_company'])
                if score >= 80:  # High threshold for contact matching
                    contacts.append(contact)
        
        return contacts
    
    def get_contact_details(self, contact_record_id):
        """Get detailed contact information"""
        try:
            url = f"https://api.airtable.com/v0/{AIRTABLE_BASE_ID}/Contacts%20Full/{contact_record_id}"
            response = requests.get(url, headers=headers)
            
            if response.status_code == 200:
                return response.json().get('fields', {})
            else:
                return {}
        except:
            return {}
    
    def query_company(self, company_query):
        """Main query function for company intelligence"""
        print(f"\n🔍 Searching for: '{company_query}'")
        print("=" * 60)
        
        # Find the company
        match_result = self.find_company(company_query)
        
        if not match_result:
            print("❌ No company found matching your query.")
            print("💡 Try variations like '미래에셋벤처투자', '카카오벤처스', etc.")
            return
        
        match_type, company_data = match_result
        
        if match_type == 'vc':
            company_name = company_data['name']
            print(f"✅ Found VC Company: {company_name}")
        else:
            company_name = company_data['company_name']
            print(f"✅ Found Company (via Fund): {company_name}")
        
        print()
        
        # 1. Basic Company Information
        print("🏢 BASIC COMPANY INFORMATION")
        print("-" * 40)
        
        if match_type == 'vc':
            info = company_data
            print(f"Company Name: {info['name']}")
            if info['company_id']:
                print(f"Company ID: {info['company_id']}")
            if info['industry']:
                print(f"Industry: {info['industry']}")
            if info['location']:
                print(f"Location: {info['location']}")
            if info['founded']:
                print(f"Founded: {info['founded']}")
            if info['company_type']:
                print(f"Company Type: {info['company_type']}")
            if info['operating_scale']:
                print(f"Operating Scale: {info['operating_scale']}")
        else:
            # Get info from fund data
            info = company_data
            print(f"Company Name: {info['company_name']}")
            if info['company_id']:
                print(f"Company ID: {info['company_id']}")
            if info['industry']:
                print(f"Industry: {info['industry']}")
            if info['founded']:
                print(f"Founded: {info['founded']}")
        
        print()
        
        # 2. Funds Operated
        print("🏦 FUNDS OPERATED")
        print("-" * 40)
        
        funds = self.get_company_funds(company_name)
        
        if funds:
            print(f"Found {len(funds)} funds:")
            for i, fund in enumerate(funds, 1):
                print(f"\n{i:2d}. {fund['name']}")
                if fund['operating_amount']:
                    print(f"    💰 Amount: {fund['operating_amount']}")
                if fund['industry']:
                    print(f"    🏭 Industry: {fund['industry']}")
                if fund['founded']:
                    print(f"    📅 Founded: {fund['founded']}")
                if fund['detailed_notes']:
                    # Show first 100 chars of notes
                    notes = fund['detailed_notes'][:100]
                    if len(fund['detailed_notes']) > 100:
                        notes += "..."
                    print(f"    📝 Notes: {notes}")
        else:
            print("No funds found for this company.")
        
        print()
        
        # 3. People/Contacts
        print("👥 PEOPLE WORKING AT THIS COMPANY")
        print("-" * 40)
        
        contacts = self.get_company_contacts(company_name)
        
        if contacts:
            print(f"Found {len(contacts)} contacts:")
            
            # Get detailed contact info for first 10
            for i, contact in enumerate(contacts[:10], 1):
                contact_details = self.get_contact_details(contact['contact_record_id'])
                
                print(f"\n{i:2d}. Contact from '{contact['contact_company']}'")
                print(f"    🎯 Match Score: {contact['match_score']}%")
                
                if contact_details:
                    if contact_details.get('이름'):
                        print(f"    👤 Name: {contact_details['이름']}")
                    if contact_details.get('직함'):
                        print(f"    💼 Position: {contact_details['직함']}")
                    if contact_details.get('휴대폰'):
                        print(f"    📱 Phone: {contact_details['휴대폰']}")
                    if contact_details.get('전자 메일 주소'):
                        print(f"    📧 Email: {contact_details['전자 메일 주소']}")
            
            if len(contacts) > 10:
                print(f"\n... and {len(contacts) - 10} more contacts")
        else:
            print("No contacts found for this company.")
        
        print()
        print("=" * 60)
        print("🎉 Company intelligence report complete!")

def main():
    """Interactive interface"""
    print("🚀 Korean VC Company Intelligence System")
    print("=" * 50)
    
    # Initialize the system
    intel = VCCompanyIntelligence()
    
    print("\n💡 Usage Examples:")
    print("   • 미래에셋벤처투자")
    print("   • 카카오벤처스") 
    print("   • 젠엑시스")
    print("   • 더웰스인베스트먼트")
    
    while True:
        print("\n" + "="*50)
        query = input("\n🔍 Enter company name (or 'quit' to exit): ").strip()
        
        if query.lower() in ['quit', 'exit', 'q']:
            print("👋 Goodbye!")
            break
        
        if not query:
            continue
        
        intel.query_company(query)

if __name__ == "__main__":
    main() 