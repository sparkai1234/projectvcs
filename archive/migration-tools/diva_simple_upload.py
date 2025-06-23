#!/usr/bin/env python3
"""
🚀 DIVA Simple Upload - Basic Tables with Company ID Linking
Simple version to get DIVA data uploaded quickly
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

class DIVASimpleUpload:
    def __init__(self, api_key, base_id):
        self.api_key = api_key
        self.api = Api(api_key)
        self.base_id = base_id
        self.base = self.api.base(base_id)
        
        # Simple table configurations
        self.table_configs = {
            'DIVA_Companies': {
                'name': 'DIVA Companies',
                'description': 'Companies data from DIVA portal scraping',
                'fields': [
                    {'name': 'Company ID', 'type': 'singleLineText'},
                    {'name': 'Company Name', 'type': 'singleLineText'},
                    {'name': 'Source', 'type': 'singleLineText'},
                    {'name': 'Personnel Count', 'type': 'number'},
                    {'name': 'Professional Staff', 'type': 'number'},
                    {'name': 'Fund Count', 'type': 'number'},
                    {'name': 'Investment Scale', 'type': 'number'},
                    {'name': 'Location', 'type': 'singleLineText'},
                    {'name': 'Last Updated', 'type': 'dateTime'},
                    {'name': 'Data Completeness', 'type': 'number'}
                ]
            },
            'DIVA_Personnel': {
                'name': 'DIVA Personnel Data',
                'description': 'Personnel information from DIVA 인력현황',
                'fields': [
                    {'name': 'Company ID', 'type': 'singleLineText'},
                    {'name': 'Company Name', 'type': 'singleLineText'},
                    {'name': 'Total Personnel', 'type': 'number'},
                    {'name': 'Professional Staff', 'type': 'number'},
                    {'name': 'Investment Review Staff', 'type': 'number'},
                    {'name': 'Management Staff', 'type': 'number'},
                    {'name': 'Professional Ratio', 'type': 'number'},
                    {'name': 'Data Source', 'type': 'singleLineText'},
                    {'name': 'Scraped Date', 'type': 'dateTime'}
                ]
            },
            'DIVA_Professional_Staff': {
                'name': 'DIVA Professional Staff',
                'description': 'Individual professional profiles from DIVA 전문인력현황',
                'fields': [
                    {'name': 'Company ID', 'type': 'singleLineText'},
                    {'name': 'Company Name', 'type': 'singleLineText'},
                    {'name': 'Staff Name', 'type': 'singleLineText'},
                    {'name': 'Position', 'type': 'singleLineText'},
                    {'name': 'Experience Level', 'type': 'singleLineText'},
                    {'name': 'Data Source', 'type': 'singleLineText'},
                    {'name': 'Profile Date', 'type': 'dateTime'}
                ]
            },
            'DIVA_Funds': {
                'name': 'DIVA Fund Data',
                'description': 'Fund information from DIVA 조합현황',
                'fields': [
                    {'name': 'Company ID', 'type': 'singleLineText'},
                    {'name': 'Company Name', 'type': 'singleLineText'},
                    {'name': 'Fund Name', 'type': 'singleLineText'},
                    {'name': 'Fund Type', 'type': 'singleLineText'},
                    {'name': 'Commitment Amount', 'type': 'number'},
                    {'name': 'Fund Size Category', 'type': 'singleLineText'},
                    {'name': 'Representative', 'type': 'singleLineText'},
                    {'name': 'Data Source', 'type': 'singleLineText'},
                    {'name': 'Fund Date', 'type': 'dateTime'}
                ]
            },
            'Company_ID_Master': {
                'name': 'Company ID Master',
                'description': 'Master list linking DIVA and Apify data through Company IDs',
                'fields': [
                    {'name': 'Company ID', 'type': 'singleLineText'},
                    {'name': 'Company Name', 'type': 'singleLineText'},
                    {'name': 'Has DIVA Data', 'type': 'singleLineText'},
                    {'name': 'Has Apify Data', 'type': 'singleLineText'},
                    {'name': 'Data Sources', 'type': 'singleLineText'},
                    {'name': 'Last Updated', 'type': 'dateTime'}
                ]
            }
        }
    
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
    
    def create_diva_tables(self):
        """Create DIVA-specific tables"""
        existing_tables = self.get_existing_tables()
        created_tables = {}
        
        print("\n🏗️ Creating DIVA tables...")
        
        for table_key, config in self.table_configs.items():
            table_name = config['name']
            
            if table_name in existing_tables:
                print(f"✅ Table '{table_name}' already exists")
                created_tables[table_key] = existing_tables[table_name]
                continue
            
            try:
                print(f"🔨 Creating table: {table_name}")
                
                table = self.base.create_table(
                    name=table_name,
                    description=config['description'],
                    fields=config['fields']
                )
                
                created_tables[table_key] = table.id
                print(f"✅ Created table: {table_name}")
                
            except Exception as e:
                print(f"❌ Error creating table {table_name}: {e}")
        
        return created_tables
    
    def upload_diva_data(self, company_profiles):
        """Upload DIVA scraped data to organized tables"""
        print(f"\n📤 Uploading {len(company_profiles)} company profiles to DIVA tables...")
        
        try:
            # Convert company profiles to proper dictionary format
            profiles_dict = {}
            for company_id, profile in company_profiles.items():
                if hasattr(profile, '__dict__'):
                    # Convert object to dictionary
                    profile_dict = profile.__dict__
                else:
                    profile_dict = profile
                profiles_dict[company_id] = profile_dict
            
            # Upload to DIVA Companies table
            diva_companies_table = self.base.table('DIVA Companies')
            
            companies_data = []
            for company_id, profile in profiles_dict.items():
                # Safely get nested data
                personnel_data = profile.get('personnel_data', {}) or {}
                fund_data = profile.get('fund_data', []) or []
                disclosure_data = profile.get('disclosure_data', {}) or {}
                
                record = {
                    'Company ID': company_id,
                    'Company Name': profile.get('company_name', ''),
                    'Source': 'DIVA Portal',
                    'Personnel Count': personnel_data.get('total_personnel', 0) if personnel_data else 0,
                    'Professional Staff': personnel_data.get('professional_staff', 0) if personnel_data else 0,
                    'Fund Count': len(fund_data) if fund_data else 0,
                    'Investment Scale': disclosure_data.get('investment_scale', 0) if disclosure_data else 0,
                    'Location': disclosure_data.get('location', '') if disclosure_data else '',
                    'Last Updated': datetime.now().isoformat(),
                    'Data Completeness': self.calculate_completeness(profile)
                }
                companies_data.append(record)
            
            # Upload in batches
            batch_size = 10
            uploaded_count = 0
            
            for i in range(0, len(companies_data), batch_size):
                batch = companies_data[i:i+batch_size]
                try:
                    diva_companies_table.batch_create(batch)
                    uploaded_count += len(batch)
                    print(f"✅ Uploaded batch {i//batch_size + 1}: {len(batch)} companies")
                except Exception as e:
                    print(f"❌ Error uploading batch: {e}")
            
            print(f"✅ Successfully uploaded {uploaded_count} companies to DIVA Companies table")
            
            # Upload other data types
            self.upload_personnel_data(profiles_dict)
            self.upload_professional_data(profiles_dict)
            self.upload_fund_data(profiles_dict)
            
            return True
            
        except Exception as e:
            print(f"❌ Error uploading DIVA data: {e}")
            import traceback
            traceback.print_exc()
            return False
    
    def upload_personnel_data(self, profiles_dict):
        """Upload personnel data"""
        try:
            personnel_table = self.base.table('DIVA Personnel Data')
            personnel_data = []
            
            for company_id, profile in profiles_dict.items():
                personnel = profile.get('personnel_data', {})
                if personnel:
                    total = personnel.get('total_personnel', 0)
                    professional = personnel.get('professional_staff', 0)
                    
                    record = {
                        'Company ID': company_id,
                        'Company Name': profile.get('company_name', ''),
                        'Total Personnel': total,
                        'Professional Staff': professional,
                        'Investment Review Staff': personnel.get('investment_review_staff', 0),
                        'Management Staff': personnel.get('management_staff', 0),
                        'Professional Ratio': (professional / total * 100) if total > 0 else 0,
                        'Data Source': 'DIVA 인력현황',
                        'Scraped Date': datetime.now().isoformat()
                    }
                    personnel_data.append(record)
            
            if personnel_data:
                personnel_table.batch_create(personnel_data)
                print(f"✅ Uploaded {len(personnel_data)} personnel records")
            
        except Exception as e:
            print(f"❌ Error uploading personnel data: {e}")
    
    def upload_professional_data(self, profiles_dict):
        """Upload professional staff data"""
        try:
            professional_table = self.base.table('DIVA Professional Staff')
            professional_data = []
            
            for company_id, profile in profiles_dict.items():
                professionals = profile.get('professional_data', []) or []
                for prof in professionals:
                    if hasattr(prof, '__dict__'):
                        prof = prof.__dict__
                    
                    record = {
                        'Company ID': company_id,
                        'Company Name': profile.get('company_name', ''),
                        'Staff Name': prof.get('name', ''),
                        'Position': prof.get('position', ''),
                        'Experience Level': prof.get('experience', ''),
                        'Data Source': 'DIVA 전문인력현황',
                        'Profile Date': datetime.now().isoformat()
                    }
                    professional_data.append(record)
            
            if professional_data:
                professional_table.batch_create(professional_data)
                print(f"✅ Uploaded {len(professional_data)} professional staff records")
            
        except Exception as e:
            print(f"❌ Error uploading professional data: {e}")
    
    def upload_fund_data(self, profiles_dict):
        """Upload fund data"""
        try:
            fund_table = self.base.table('DIVA Fund Data')
            fund_data = []
            
            for company_id, profile in profiles_dict.items():
                funds = profile.get('fund_data', []) or []
                for fund in funds:
                    if hasattr(fund, '__dict__'):
                        fund = fund.__dict__
                    
                    amount = fund.get('commitment_amount', 0)
                    record = {
                        'Company ID': company_id,
                        'Company Name': profile.get('company_name', ''),
                        'Fund Name': fund.get('fund_name', ''),
                        'Fund Type': fund.get('fund_type', ''),
                        'Commitment Amount': amount,
                        'Fund Size Category': self.categorize_fund_size(amount),
                        'Representative': fund.get('representative', ''),
                        'Data Source': 'DIVA 조합현황',
                        'Fund Date': datetime.now().isoformat()
                    }
                    fund_data.append(record)
            
            if fund_data:
                fund_table.batch_create(fund_data)
                print(f"✅ Uploaded {len(fund_data)} fund records")
            
        except Exception as e:
            print(f"❌ Error uploading fund data: {e}")
    
    def create_company_id_master(self, profiles_dict):
        """Create master linking table"""
        try:
            master_table = self.base.table('Company ID Master')
            
            # Get existing Company IDs from Apify data
            existing_tables = self.get_existing_tables()
            apify_company_ids = set()
            
            # Try to get Company IDs from existing VC Table
            for table_name, table_id in existing_tables.items():
                if 'VC Table' in table_name and 'OLD' not in table_name:
                    try:
                        vc_table = self.base.table(table_name)
                        records = vc_table.all()
                        for record in records:
                            company_id = record.get('fields', {}).get('Company ID')
                            if company_id:
                                apify_company_ids.add(company_id)
                        break  # Only process the first valid VC Table
                    except Exception as e:
                        print(f"   ⚠️ Error reading {table_name}: {e}")
                        pass
            
            print(f"📊 Found {len(apify_company_ids)} Company IDs in Apify data")
            
            # Create master records
            master_data = []
            all_company_ids = set(profiles_dict.keys()) | apify_company_ids
            
            for company_id in all_company_ids:
                has_diva = company_id in profiles_dict
                has_apify = company_id in apify_company_ids
                
                # Get company name from either source
                company_name = ''
                if has_diva:
                    company_name = profiles_dict[company_id].get('company_name', '')
                
                sources = []
                if has_diva:
                    sources.append('DIVA Portal')
                if has_apify:
                    sources.append('Apify Scraper')
                
                record = {
                    'Company ID': company_id,
                    'Company Name': company_name,
                    'Has DIVA Data': 'Yes' if has_diva else 'No',
                    'Has Apify Data': 'Yes' if has_apify else 'No',
                    'Data Sources': ', '.join(sources),
                    'Last Updated': datetime.now().isoformat()
                }
                
                master_data.append(record)
            
            # Upload master data in batches
            batch_size = 50
            for i in range(0, len(master_data), batch_size):
                batch = master_data[i:i+batch_size]
                try:
                    master_table.batch_create(batch)
                    print(f"✅ Created master batch {i//batch_size + 1}: {len(batch)} records")
                except Exception as e:
                    print(f"❌ Error creating master batch: {e}")
            
            # Summary statistics
            both_data = sum(1 for r in master_data if r['Has DIVA Data'] == 'Yes' and r['Has Apify Data'] == 'Yes')
            diva_only = sum(1 for r in master_data if r['Has DIVA Data'] == 'Yes' and r['Has Apify Data'] == 'No')
            apify_only = sum(1 for r in master_data if r['Has DIVA Data'] == 'No' and r['Has Apify Data'] == 'Yes')
            
            print(f"✅ Created {len(master_data)} master linking records")
            print(f"   🔗 Companies with both DIVA + Apify data: {both_data}")
            print(f"   📊 DIVA only: {diva_only}")
            print(f"   🕷️ Apify only: {apify_only}")
            
        except Exception as e:
            print(f"❌ Error creating master table: {e}")
            import traceback
            traceback.print_exc()
    
    def calculate_completeness(self, profile):
        """Calculate data completeness score"""
        total_fields = 5
        completed_fields = 0
        
        if profile.get('company_name'): completed_fields += 1
        if profile.get('personnel_data'): completed_fields += 1
        if profile.get('fund_data'): completed_fields += 1
        if profile.get('disclosure_data'): completed_fields += 1
        if profile.get('professional_data'): completed_fields += 1
        
        return (completed_fields / total_fields) * 100
    
    def categorize_fund_size(self, amount):
        """Categorize fund size"""
        if amount >= 100000000000:  # 1000억+
            return 'Mega (1000억+)'
        elif amount >= 50000000000:  # 500억+
            return 'Large (500-1000억)'
        elif amount >= 10000000000:  # 100억+
            return 'Mid (100-500억)'
        else:
            return 'Small (<100억)'

def main():
    """Main execution function"""
    print("🚀 DIVA SIMPLE UPLOAD")
    print("   Quick Upload with Company ID Linking")
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
        system = DIVASimpleUpload(api_key, base_id)
        
        # Create DIVA tables
        created_tables = system.create_diva_tables()
        
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
            
            # Upload to organized tables
            success = system.upload_diva_data(company_profiles)
            
            if success:
                # Create master linking table
                profiles_dict = {}
                for company_id, profile in company_profiles.items():
                    if hasattr(profile, '__dict__'):
                        profiles_dict[company_id] = profile.__dict__
                    else:
                        profiles_dict[company_id] = profile
                
                system.create_company_id_master(profiles_dict)
                
                print("\n🎉 DIVA SIMPLE UPLOAD COMPLETE!")
                print("   📊 DIVA data in separate tables")
                print("   🔗 Linked to Apify data through Company IDs")
                print("   📋 Master table for unified analysis")
            
        else:
            print("⚠️  No data scraped from DIVA portal")
            
    except Exception as e:
        print(f"❌ Error in simple upload: {e}")
        import traceback
        traceback.print_exc()

if __name__ == "__main__":
    main() 