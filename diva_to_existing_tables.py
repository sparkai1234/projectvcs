#!/usr/bin/env python3
"""
🚀 DIVA to Existing Tables - Add DIVA Data to Current Structure
Uses your existing VC Table and Fund Table, adds DIVA source marker
"""

import os
import sys
import json
import pandas as pd
from datetime import datetime
from api_config import set_environment_variables
from pyairtable import Api

# Set up environment variables from config
set_environment_variables()

class DIVAToExistingTables:
    def __init__(self, api_key, base_id):
        self.api_key = api_key
        self.api = Api(api_key)
        self.base_id = base_id
        self.base = self.api.base(base_id)
        
    def get_existing_tables(self):
        """Get existing tables from the base"""
        try:
            schema = self.base.schema()
            existing_tables = {table.name: table.id for table in schema.tables}
            print(f"📋 Found {len(existing_tables)} existing tables:")
            for name in existing_tables.keys():
                print(f"   - {name}")
            return existing_tables
        except Exception as e:
            print(f"❌ Error getting existing tables: {e}")
            return {}
    
    def add_diva_data_to_vc_table(self, company_profiles):
        """Add DIVA data to existing VC Table"""
        print(f"\n📤 Adding DIVA data to existing VC Table...")
        
        try:
            # Convert company profiles to proper dictionary format
            profiles_dict = {}
            for company_id, profile in company_profiles.items():
                if hasattr(profile, '__dict__'):
                    profile_dict = profile.__dict__
                else:
                    profile_dict = profile
                profiles_dict[company_id] = profile_dict
            
            # Get the main VC Table
            vc_table = self.base.table('VC Table')
            
            # First, get existing records to check for duplicates
            existing_records = vc_table.all()
            existing_company_ids = set()
            for record in existing_records:
                company_id = record.get('fields', {}).get('Company ID')
                if company_id:
                    existing_company_ids.add(company_id)
            
            print(f"📊 Found {len(existing_company_ids)} existing companies in VC Table")
            
            # Prepare new DIVA records
            new_diva_records = []
            updated_records = []
            
            for company_id, profile in profiles_dict.items():
                # Safely get nested data
                personnel_data = profile.get('personnel_data', {}) or {}
                fund_data = profile.get('fund_data', []) or []
                disclosure_data = profile.get('disclosure_data', {}) or {}
                
                # Create record data
                record_data = {
                    'Company ID': company_id,
                    'Company Name': profile.get('company_name', ''),
                    'Industry': disclosure_data.get('industry', '') if disclosure_data else '',
                    'Location': disclosure_data.get('location', '') if disclosure_data else '',
                    'Founded': disclosure_data.get('founded_year', '') if disclosure_data else '',
                    'Company Type': disclosure_data.get('company_type', '') if disclosure_data else '',
                    'Operating Scale': personnel_data.get('total_personnel', 0) if personnel_data else 0,
                    'Operating Amount': disclosure_data.get('investment_scale', 0) if disclosure_data else 0
                }
                
                # Add DIVA source marker by updating company name
                if record_data['Company Name'] and not record_data['Company Name'].endswith(' [DIVA]'):
                    record_data['Company Name'] = record_data['Company Name'] + ' [DIVA]'
                
                if company_id in existing_company_ids:
                    # Company exists - we could update it (but let's avoid for now)
                    print(f"   ⚠️ Company {company_id} already exists, skipping update")
                else:
                    # New company from DIVA
                    new_diva_records.append(record_data)
            
            # Upload new DIVA records
            if new_diva_records:
                batch_size = 10
                uploaded_count = 0
                
                for i in range(0, len(new_diva_records), batch_size):
                    batch = new_diva_records[i:i+batch_size]
                    try:
                        vc_table.batch_create(batch)
                        uploaded_count += len(batch)
                        print(f"✅ Uploaded DIVA batch {i//batch_size + 1}: {len(batch)} companies")
                    except Exception as e:
                        print(f"❌ Error uploading DIVA batch: {e}")
                
                print(f"✅ Successfully added {uploaded_count} new DIVA companies to VC Table")
            else:
                print("ℹ️ No new DIVA companies to add (all already exist)")
            
            return True
            
        except Exception as e:
            print(f"❌ Error adding DIVA data to VC Table: {e}")
            import traceback
            traceback.print_exc()
            return False
    
    def add_diva_funds_to_fund_table(self, company_profiles):
        """Add DIVA fund data to existing Fund Table"""
        print(f"\n📤 Adding DIVA fund data to existing Fund Table...")
        
        try:
            # Convert company profiles to proper dictionary format
            profiles_dict = {}
            for company_id, profile in company_profiles.items():
                if hasattr(profile, '__dict__'):
                    profile_dict = profile.__dict__
                else:
                    profile_dict = profile
                profiles_dict[company_id] = profile_dict
            
            # Get the Fund Table
            fund_table = self.base.table('Fund Table')
            
            # Prepare DIVA fund records
            diva_fund_records = []
            
            for company_id, profile in profiles_dict.items():
                funds = profile.get('fund_data', []) or []
                
                for fund in funds:
                    if hasattr(fund, '__dict__'):
                        fund = fund.__dict__
                    
                    amount = fund.get('commitment_amount', 0)
                    
                    record_data = {
                        'Company ID': company_id,
                        'my Name': fund.get('fund_name', '') + ' [DIVA]',  # Mark as DIVA source
                        'Fund Table': fund.get('fund_type', ''),
                        'Operating Scale': self.categorize_operating_scale(amount),
                        'Operating Amount': amount
                    }
                    
                    diva_fund_records.append(record_data)
            
            # Upload DIVA fund records
            if diva_fund_records:
                batch_size = 10
                uploaded_count = 0
                
                for i in range(0, len(diva_fund_records), batch_size):
                    batch = diva_fund_records[i:i+batch_size]
                    try:
                        fund_table.batch_create(batch)
                        uploaded_count += len(batch)
                        print(f"✅ Uploaded DIVA fund batch {i//batch_size + 1}: {len(batch)} funds")
                    except Exception as e:
                        print(f"❌ Error uploading DIVA fund batch: {e}")
                
                print(f"✅ Successfully added {uploaded_count} DIVA funds to Fund Table")
            else:
                print("ℹ️ No DIVA fund data to add")
            
            return True
            
        except Exception as e:
            print(f"❌ Error adding DIVA fund data: {e}")
            import traceback
            traceback.print_exc()
            return False
    
    def create_diva_summary_report(self, company_profiles):
        """Create a summary report of DIVA data integration"""
        try:
            # Convert profiles
            profiles_dict = {}
            for company_id, profile in company_profiles.items():
                if hasattr(profile, '__dict__'):
                    profile_dict = profile.__dict__
                else:
                    profile_dict = profile
                profiles_dict[company_id] = profile_dict
            
            # Get existing Company IDs from VC Table
            vc_table = self.base.table('VC Table')
            existing_records = vc_table.all()
            apify_company_ids = set()
            
            for record in existing_records:
                company_id = record.get('fields', {}).get('Company ID')
                if company_id:
                    apify_company_ids.add(company_id)
            
            # Analysis
            diva_company_ids = set(profiles_dict.keys())
            overlap = diva_company_ids & apify_company_ids
            diva_only = diva_company_ids - apify_company_ids
            apify_only = apify_company_ids - diva_company_ids
            
            # Summary data
            summary = {
                'timestamp': datetime.now().isoformat(),
                'total_diva_companies': len(diva_company_ids),
                'total_apify_companies': len(apify_company_ids),
                'companies_with_both_sources': len(overlap),
                'diva_only_companies': len(diva_only),
                'apify_only_companies': len(apify_only),
                'overlap_percentage': (len(overlap) / len(diva_company_ids) * 100) if diva_company_ids else 0,
                'data_completeness': {
                    'companies_with_personnel': sum(1 for p in profiles_dict.values() if p.get('personnel_data')),
                    'companies_with_funds': sum(1 for p in profiles_dict.values() if p.get('fund_data')),
                    'companies_with_professionals': sum(1 for p in profiles_dict.values() if p.get('professional_data')),
                    'companies_with_disclosure': sum(1 for p in profiles_dict.values() if p.get('disclosure_data'))
                },
                'overlapping_companies': list(overlap),
                'diva_only_companies': list(diva_only)
            }
            
            # Save report
            timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
            report_file = f"diva_integration_report_{timestamp}.json"
            
            with open(report_file, 'w', encoding='utf-8') as f:
                json.dump(summary, f, ensure_ascii=False, indent=2)
            
            # Print summary
            print(f"\n📊 DIVA DATA INTEGRATION SUMMARY")
            print(f"   =================================")
            print(f"   📈 Total DIVA Companies: {summary['total_diva_companies']}")
            print(f"   🕷️ Total Apify Companies: {summary['total_apify_companies']}")
            print(f"   🔗 Companies in Both Sources: {summary['companies_with_both_sources']}")
            print(f"   📊 DIVA Only: {summary['diva_only_companies']}")
            print(f"   🕷️ Apify Only: {summary['apify_only_companies']}")
            print(f"   📈 Overlap Percentage: {summary['overlap_percentage']:.1f}%")
            print(f"   💾 Report saved to: {report_file}")
            
            return summary
            
        except Exception as e:
            print(f"❌ Error creating summary report: {e}")
            return None
    
    def categorize_operating_scale(self, amount):
        """Categorize operating scale based on amount"""
        if amount >= 1000000000:  # 10억+
            return 5
        elif amount >= 500000000:  # 5억+
            return 4
        elif amount >= 100000000:  # 1억+
            return 3
        elif amount >= 50000000:   # 5천만+
            return 2
        else:
            return 1

def main():
    """Main execution function"""
    print("🚀 DIVA TO EXISTING TABLES")
    print("   Add DIVA Data to Current Structure")
    print("   =" * 40)
    
    # Get configuration
    api_key = os.getenv('AIRTABLE_API_KEY')
    base_id = os.getenv('AIRTABLE_BASE_ID')
    
    if not api_key or not base_id:
        print("❌ Configuration Error!")
        print("   Please check your api_config.py file")
        return
    
    try:
        # Initialize system
        system = DIVAToExistingTables(api_key, base_id)
        
        # Get existing tables
        existing_tables = system.get_existing_tables()
        
        # Import and run scraper
        from comprehensive_diva_scraper import ComprehensiveDIVAScraper
        
        print("\n🕷️ Starting DIVA data scraping...")
        scraper = ComprehensiveDIVAScraper()
        
        # Scrape data (start with 2 pages for testing)
        company_profiles = scraper.scrape_all_data(
            year_month="2025-04",
            max_pages_per_section=2
        )
        
        if company_profiles:
            print(f"\n✅ Successfully scraped {len(company_profiles)} company profiles")
            
            # Add to existing VC Table
            vc_success = system.add_diva_data_to_vc_table(company_profiles)
            
            # Add to existing Fund Table
            fund_success = system.add_diva_funds_to_fund_table(company_profiles)
            
            # Create integration report
            summary = system.create_diva_summary_report(company_profiles)
            
            if vc_success or fund_success:
                print("\n🎉 DIVA INTEGRATION COMPLETE!")
                print("   📊 DIVA data added to existing tables")
                print("   🔗 Company IDs link Apify and DIVA data")
                print("   📋 [DIVA] markers identify DIVA sources")
                print("   📈 Integration report generated")
            
        else:
            print("⚠️  No data scraped from DIVA portal")
            
    except Exception as e:
        print(f"❌ Error in DIVA integration: {e}")
        import traceback
        traceback.print_exc()

if __name__ == "__main__":
    main() 