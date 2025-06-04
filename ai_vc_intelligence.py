#!/usr/bin/env python3
"""
AI-Powered Korean VC Company Intelligence
Combines Airtable data with OpenAI for natural language queries and insights
"""

import requests
import json
from openai import OpenAI
from datetime import datetime
from fuzzywuzzy import fuzz

# Configuration
AIRTABLE_API_KEY = "patOUfAsek4nbpvHm.49789ced0e2b0304bdc507f110d936277cd3da18ec3efc9347c93e6a1810919e"
AIRTABLE_BASE_ID = "appdR8V9lJaRW8VkR"

# Set your OpenAI API key here
OPENAI_API_KEY = "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"  # Your actual OpenAI key

# Initialize OpenAI client
client = OpenAI(api_key=OPENAI_API_KEY)

# Headers for Airtable API
headers = {
    'Authorization': f'Bearer {AIRTABLE_API_KEY}',
    'Content-Type': 'application/json'
}

class AIVCIntelligence:
    def __init__(self):
        self.data_loaded = False
        self.companies_summary = ""
        print("🤖 Initializing AI-Powered Korean VC Intelligence...")
        
    def fetch_sample_data(self):
        """Fetch sample data for faster testing"""
        print("📊 Loading sample data...")
        
        # Load a few VC companies
        try:
            url = f"https://api.airtable.com/v0/{AIRTABLE_BASE_ID}/VC%20Table"
            params = {'maxRecords': 20}  # Just get 20 for quick testing
            response = requests.get(url, headers=headers, params=params)
            
            if response.status_code == 200:
                vc_data = response.json().get('records', [])
                print(f"   ✅ Loaded {len(vc_data)} VC companies")
            else:
                vc_data = []
                print(f"   ❌ Failed to load VC data: {response.status_code}")
        except Exception as e:
            vc_data = []
            print(f"   ❌ Error loading VC data: {e}")
        
        # Load sample funds
        try:
            url = f"https://api.airtable.com/v0/{AIRTABLE_BASE_ID}/Fund%20Table"
            params = {'maxRecords': 50}  # Get 50 funds for testing
            response = requests.get(url, headers=headers, params=params)
            
            if response.status_code == 200:
                fund_data = response.json().get('records', [])
                print(f"   ✅ Loaded {len(fund_data)} funds")
            else:
                fund_data = []
                print(f"   ❌ Failed to load fund data: {response.status_code}")
        except Exception as e:
            fund_data = []
            print(f"   ❌ Error loading fund data: {e}")
        
        # Load sample contacts
        try:
            url = f"https://api.airtable.com/v0/{AIRTABLE_BASE_ID}/Contacts%20Matched"
            params = {'maxRecords': 30}  # Get 30 matched contacts for testing
            response = requests.get(url, headers=headers, params=params)
            
            if response.status_code == 200:
                contact_data = response.json().get('records', [])
                print(f"   ✅ Loaded {len(contact_data)} matched contacts")
            else:
                contact_data = []
                print(f"   ❌ Failed to load contact data: {response.status_code}")
        except Exception as e:
            contact_data = []
            print(f"   ❌ Error loading contact data: {e}")
        
        # Store data
        self.vc_companies = vc_data
        self.funds = fund_data
        self.contacts = contact_data
        self.data_loaded = True
        
        # Create a summary for AI context
        self.create_companies_summary()
        
        print("✅ Sample data loaded successfully!")
    
    def create_companies_summary(self):
        """Create a summary of available companies for AI context"""
        company_names = []
        
        # Get VC company names
        for record in self.vc_companies:
            name = record.get('fields', {}).get('Company Name', '')
            if name:
                company_names.append(name)
        
        # Get fund company names
        for record in self.funds:
            name = record.get('fields', {}).get('Company Name (Korean)', '')
            if name and name not in company_names:
                company_names.append(name)
        
        self.companies_summary = f"Available Korean VC companies: {', '.join(company_names[:20])}"
        if len(company_names) > 20:
            self.companies_summary += f" and {len(company_names) - 20} more companies"
    
    def ai_parse_query(self, user_query):
        """Use OpenAI to parse and understand user queries"""
        try:
            prompt = f"""
You are an AI assistant for a Korean VC company intelligence system. 
The user wants to search for information about Korean VC companies.

Available companies include: {self.companies_summary}

User query: "{user_query}"

Extract the company name the user is asking about. Return ONLY the company name that best matches their query.
If they're asking about a company, return the Korean company name.
If no clear company is mentioned, return "UNCLEAR".

Examples:
- "미래에셋벤처투자" → "미래에셋벤처투자"
- "Tell me about Mirae Asset Venture" → "미래에셋벤처투자"
- "Kakao Ventures" → "카카오벤처스"
- "What funds does GenXis operate?" → "젠엑시스"

Company name:"""

            response = client.chat.completions.create(
                model="gpt-3.5-turbo",
                messages=[{"role": "user", "content": prompt}],
                max_tokens=50,
                temperature=0
            )
            
            company_name = response.choices[0].message.content.strip()
            return company_name if company_name != "UNCLEAR" else None
            
        except Exception as e:
            print(f"⚠️ AI parsing failed: {e}")
            return user_query  # Fallback to original query
    
    def find_company_data(self, company_name):
        """Find company data using fuzzy matching"""
        best_vc_match = None
        best_vc_score = 0
        
        # Search VC companies
        for record in self.vc_companies:
            name = record.get('fields', {}).get('Company Name', '')
            if name:
                score = fuzz.ratio(company_name, name)
                if score > best_vc_score:
                    best_vc_score = score
                    best_vc_match = record
        
        # Find related funds
        company_funds = []
        for record in self.funds:
            fund_company = record.get('fields', {}).get('Company Name (Korean)', '')
            if fund_company:
                score = fuzz.ratio(company_name, fund_company)
                if score >= 80:  # High threshold for fund matching
                    company_funds.append(record)
        
        # Find related contacts
        company_contacts = []
        for record in self.contacts:
            matched_company = record.get('fields', {}).get('Matched Company', '')
            if matched_company:
                score = fuzz.ratio(company_name, matched_company)
                if score >= 80:  # High threshold for contact matching
                    company_contacts.append(record)
        
        if best_vc_score >= 60 or company_funds or company_contacts:
            return {
                'vc_info': best_vc_match if best_vc_score >= 60 else None,
                'funds': company_funds,
                'contacts': company_contacts,
                'match_score': best_vc_score
            }
        
        return None
    
    def generate_ai_insights(self, company_data, company_name):
        """Generate AI-powered insights about the company"""
        try:
            # Prepare company information for AI
            info_text = f"Company: {company_name}\n\n"
            
            if company_data['vc_info']:
                vc = company_data['vc_info']['fields']
                info_text += f"VC Information:\n"
                if vc.get('Industry'):
                    info_text += f"- Industry: {vc['Industry']}\n"
                if vc.get('Location'):
                    info_text += f"- Location: {vc['Location']}\n"
                if vc.get('Founded'):
                    info_text += f"- Founded: {vc['Founded']}\n"
                if vc.get('Company Type'):
                    info_text += f"- Type: {vc['Company Type']}\n"
            
            if company_data['funds']:
                info_text += f"\nFunds ({len(company_data['funds'])}):\n"
                for fund in company_data['funds'][:5]:  # Show first 5 funds
                    fund_name = fund['fields'].get('Name (Fund Name)', '')
                    if fund_name:
                        info_text += f"- {fund_name}\n"
            
            if company_data['contacts']:
                info_text += f"\nContacts: {len(company_data['contacts'])} people found\n"
            
            prompt = f"""
As a Korean VC industry expert, provide insights about this company:

{info_text}

Provide a brief analysis covering:
1. Company overview and position in Korean VC ecosystem
2. Investment focus and strategy (based on fund names/industry)
3. Key strengths or notable aspects
4. Business development opportunities

Keep it concise, professional, and in English. Use bullet points for clarity.
"""

            response = client.chat.completions.create(
                model="gpt-3.5-turbo",
                messages=[{"role": "user", "content": prompt}],
                max_tokens=400,
                temperature=0.7
            )
            
            return response.choices[0].message.content.strip()
            
        except Exception as e:
            return f"⚠️ AI insights unavailable: {e}"
    
    def query_company(self, user_query):
        """Main query function with AI enhancement"""
        if not self.data_loaded:
            print("❌ Data not loaded. Run fetch_sample_data() first.")
            return
        
        print(f"\n🔍 Processing query: '{user_query}'")
        print("=" * 60)
        
        # Use AI to parse the query
        company_name = self.ai_parse_query(user_query)
        
        if not company_name:
            print("❌ Could not identify a company from your query.")
            print("💡 Try asking about specific companies like '미래에셋벤처투자' or 'Kakao Ventures'")
            return
        
        print(f"🎯 AI identified company: {company_name}")
        
        # Find company data
        company_data = self.find_company_data(company_name)
        
        if not company_data:
            print(f"❌ No data found for '{company_name}'")
            return
        
        print(f"✅ Found company data!")
        print()
        
        # Display basic information
        print("🏢 COMPANY OVERVIEW")
        print("-" * 40)
        
        if company_data['vc_info']:
            vc = company_data['vc_info']['fields']
            print(f"Company Name: {vc.get('Company Name', 'N/A')}")
            if vc.get('Industry'):
                print(f"Industry: {vc['Industry']}")
            if vc.get('Location'):
                print(f"Location: {vc['Location']}")
            if vc.get('Founded'):
                print(f"Founded: {vc['Founded']}")
            if vc.get('Company Type'):
                print(f"Type: {vc['Company Type']}")
        
        print()
        
        # Display funds
        print("🏦 FUNDS OPERATED")
        print("-" * 40)
        
        if company_data['funds']:
            print(f"Found {len(company_data['funds'])} funds:")
            for i, fund in enumerate(company_data['funds'][:10], 1):  # Show first 10
                fund_fields = fund['fields']
                fund_name = fund_fields.get('Name (Fund Name)', 'Unknown Fund')
                print(f"\n{i:2d}. {fund_name}")
                if fund_fields.get('Operating Amount'):
                    print(f"    💰 Amount: {fund_fields['Operating Amount']}")
                if fund_fields.get('Industry'):
                    print(f"    🏭 Industry: {fund_fields['Industry']}")
        else:
            print("No funds found.")
        
        print()
        
        # Display contacts
        print("👥 CONTACTS")
        print("-" * 40)
        
        if company_data['contacts']:
            print(f"Found {len(company_data['contacts'])} contacts:")
            for i, contact in enumerate(company_data['contacts'][:5], 1):  # Show first 5
                contact_fields = contact['fields']
                contact_company = contact_fields.get('Contact Company', 'Unknown')
                match_score = contact_fields.get('Match Score', 0)
                print(f"{i:2d}. Contact from '{contact_company}' (Match: {match_score}%)")
        else:
            print("No contacts found.")
        
        print()
        
        # Generate AI insights
        print("🤖 AI INSIGHTS")
        print("-" * 40)
        
        insights = self.generate_ai_insights(company_data, company_name)
        print(insights)
        
        print()
        print("=" * 60)
        print("🎉 Intelligence report complete!")

def test_openai_connection():
    """Test if OpenAI API is working"""
    try:
        response = client.chat.completions.create(
            model="gpt-3.5-turbo",
            messages=[{"role": "user", "content": "Hello, respond with 'OpenAI connected successfully!'"}],
            max_tokens=20
        )
        print("✅ OpenAI API connected successfully!")
        return True
    except Exception as e:
        print(f"❌ OpenAI API connection failed: {e}")
        print("💡 Please check your API key in the script")
        return False

def main():
    """Interactive AI-powered interface"""
    print("🤖 AI-Powered Korean VC Intelligence System")
    print("=" * 60)
    
    # Test OpenAI connection
    if not test_openai_connection():
        print("\n⚠️ Continuing without AI features...")
        print("Please add your OpenAI API key to enable AI insights")
    
    print()
    
    # Initialize system
    intel = AIVCIntelligence()
    intel.fetch_sample_data()
    
    print("\n💡 Example queries:")
    print("   • 미래에셋벤처투자")
    print("   • Tell me about Kakao Ventures") 
    print("   • What funds does 젠엑시스 operate?")
    print("   • Show me info on Mirae Asset")
    
    while True:
        print("\n" + "="*50)
        query = input("\n🎤 Ask me about any Korean VC company (or 'quit'): ").strip()
        
        if query.lower() in ['quit', 'exit', 'q']:
            print("👋 Goodbye!")
            break
        
        if not query:
            continue
        
        intel.query_company(query)

if __name__ == "__main__":
    main() 