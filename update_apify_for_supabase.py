#!/usr/bin/env python3
"""
🔧 Update Apify Scrapers to Use Supabase
This replaces Airtable API calls with Supabase calls in your scrapers
"""

from supabase import create_client, Client
from api_config import get_supabase_config
import json
import uuid

class SupabaseApifyAdapter:
    """Adapter to make Supabase work like Airtable for your existing scrapers"""
    
    def __init__(self):
        config = get_supabase_config(use_service_role=True)
        self.supabase: Client = create_client(config['url'], config['key'])
    
    def add_vc_company(self, company_data):
        """Add a VC company to Supabase (replaces Airtable API)"""
        try:
            # Ensure company_id is provided (required field)
            if 'company_id' not in company_data:
                company_data['company_id'] = str(uuid.uuid4())
                
            result = self.supabase.table('vc_table').insert(company_data).execute()
            print(f"✅ Added VC: {company_data.get('company_name', 'Unknown')}")
            return result.data[0] if result.data else None
        except Exception as e:
            print(f"❌ Error adding VC: {e}")
            return None
    
    def add_fund(self, fund_data):
        """Add a fund to Supabase"""
        try:
            result = self.supabase.table('fund_table').insert(fund_data).execute()
            print(f"✅ Added Fund: {fund_data.get('fund_name', 'Unknown')}")
            return result.data[0] if result.data else None
        except Exception as e:
            print(f"❌ Error adding fund: {e}")
            return None
    
    def add_contact(self, contact_data):
        """Add a contact to Supabase"""
        try:
            result = self.supabase.table('contacts_full').insert(contact_data).execute()
            print(f"✅ Added Contact: {contact_data.get('name', 'Unknown')}")
            return result.data[0] if result.data else None
        except Exception as e:
            print(f"❌ Error adding contact: {e}")
            return None
    
    def update_diva_intelligence(self, diva_data):
        """Add/update DIVA intelligence data"""
        try:
            result = self.supabase.table('diva_intelligence').insert(diva_data).execute()
            print(f"✅ Added DIVA data for: {diva_data.get('company_name', 'Unknown')}")
            return result.data[0] if result.data else None
        except Exception as e:
            print(f"❌ Error adding DIVA data: {e}")
            return None

# Example usage for your Apify scrapers
def example_scraper_update():
    """Example of how to update your existing Apify scrapers"""
    
    adapter = SupabaseApifyAdapter()
    
    # Example: Add a new VC company (using correct column names with required fields)
    vc_data = {
        'company_id': str(uuid.uuid4()),  # Required field
        'company_name': '테스트 VC 회사',
        'company_name_en': 'Test VC Company',
        'company_type': 'VC',
        'website_url': 'https://test-vc.com',
        'established_date': '2024-01-01',
        'representative': '김대표',
        'contact_info': 'contact@test-vc.com',
        'apify_source': 'migration_test'
    }
    
    result = adapter.add_vc_company(vc_data)
    if result:
        print(f"🎯 Successfully added VC with ID: {result.get('id')}")
        print(f"   Company ID: {result.get('company_id')}")
        print(f"   Company Name: {result.get('company_name')}")

# Instructions for updating your Apify scrapers
def print_update_instructions():
    """Print instructions for updating Apify scrapers"""
    print("""
🔧 HOW TO UPDATE YOUR APIFY SCRAPERS:

📋 CORRECT FIELD MAPPING (based on your actual Supabase schema):

✅ VC_TABLE fields (⚠️ company_id is REQUIRED):
   - company_id (REQUIRED - use UUID)
   - company_name (Korean name)
   - company_name_en (English name)  
   - company_type
   - website_url
   - established_date
   - representative
   - contact_info
   - apify_source

✅ DIVA_INTELLIGENCE fields:
   - company_name
   - company_id  
   - intelligence_data
   - analysis_results
   - data_quality_score
   - scrape_date

1. 📝 In your Apify scraper code, replace:
   
   OLD (Airtable):
   ```javascript
   await axios.post('https://api.airtable.com/v0/BASE_ID/VC%20Table', {
       records: [{ 
           fields: {
               'Company Name': companyName,
               'Website': website,
               'Description': description
           }
       }]
   }, { headers: { Authorization: 'Bearer API_KEY' }});
   ```
   
   NEW (Supabase):
   ```javascript
   const { v4: uuidv4 } = require('uuid');
   
   await axios.post('https://udfgtccxbqmalgpqyxzz.supabase.co/rest/v1/vc_table', {
       company_id: uuidv4(),        // REQUIRED!
       company_name: companyName,
       website_url: website,
       company_type: 'VC',
       apify_source: 'your_scraper_name'
   }, { 
       headers: { 
           'apikey': 'YOUR_SUPABASE_SERVICE_KEY',
           'Authorization': 'Bearer YOUR_SUPABASE_SERVICE_KEY',
           'Content-Type': 'application/json'
       }
   });
   ```

2. 🗺️ Table Mapping:
   - 'VC Table' → 'vc_table'
   - 'Fund Table' → 'fund_table'  
   - 'DIVA Intelligence' → 'diva_intelligence'
   - 'Contacts Full' → 'contacts_full'

3. 🔑 Use your Supabase service key (not anon key) for write operations

4. 🎯 Benefits:
   - ✅ No more API pagination limits (get all 717 VCs!)
   - ✅ Faster performance  
   - ✅ Lower costs ($25 vs $50+)
   - ✅ Unlimited records
   - ✅ Real-time updates
   
💡 Need help updating a specific scraper? Share the code and I'll help convert it!
""")

if __name__ == "__main__":
    print_update_instructions()
    print("\n" + "="*50)
    print("🧪 Testing Supabase adapter with correct field names...")
    example_scraper_update() 