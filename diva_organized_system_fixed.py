#!/usr/bin/env python3
"""
🚀 DIVA Organized System - Fixed Version
Links DIVA scraper data with existing Apify data through Company IDs
"""

import os
import sys
import json
import pandas as pd
from datetime import datetime
from api_config import set_environment_variables
from pyairtable import Api, Table

# Set up environment variables from config
set_environment_variables()

class DIVAOrganizedSystem:
    def __init__(self, api_key, base_id):
        self.api_key = api_key  # Fix: Store api_key
        self.api = Api(api_key)
        self.base_id = base_id
        self.base = self.api.base(base_id)
        
        # Simplified table configurations with valid Airtable options
        self.table_configs = {
            'DIVA_Companies': {
                'name': 'DIVA Companies',
                'description': 'Companies data from DIVA portal scraping',
                'fields': [
                    {'name': 'Company ID', 'type': 'singleLineText'},
                    {'name': 'Company Name', 'type': 'singleLineText'},
                    {'name': 'Source', 'type': 'singleSelect', 'options': {'choices': [
                        {'name': 'DIVA Portal', 'color': 'green'},
                        {'name': 'Manual Entry', 'color': 'blue'}
                    ]}},
                    {'name': 'Data Completeness', 'type': 'number'},
                    {'name': 'Last Updated', 'type': 'dateTime'},
                    {'name': 'Personnel Count', 'type': 'number'},
                    {'name': 'Professional Staff', 'type': 'number'},
                    {'name': 'Fund Count', 'type': 'number'},
                    {'name': 'Investment Scale', 'type': 'number'},
                    {'name': 'Location', 'type': 'singleLineText'},
                    {'name': 'Status', 'type': 'singleSelect', 'options': {'choices': [
                        {'name': 'Active', 'color': 'green'},
                        {'name': 'Inactive', 'color': 'red'},
                        {'name': 'Unknown', 'color': 'gray'}
                    ]}}
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
                    {'name': 'Staffing Efficiency Score', 'type': 'number'},
                    {'name': 'Data Source', 'type': 'singleSelect', 'options': {'choices': [
                        {'name': 'DIVA 인력현황', 'color': 'blue'}
                    ]}},
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
                    {'name': 'Experience Level', 'type': 'singleSelect', 'options': {'choices': [
                        {'name': 'Senior', 'color': 'green'},
                        {'name': 'Mid-level', 'color': 'yellow'},
                        {'name': 'Junior', 'color': 'blue'},
                        {'name': 'Unknown', 'color': 'gray'}
                    ]}},
                    {'name': 'Performance Score', 'type': 'number'},
                    {'name': 'Contact Potential', 'type': 'number'},
                    {'name': 'Data Source', 'type': 'singleSelect', 'options': {'choices': [
                        {'name': 'DIVA 전문인력현황', 'color': 'purple'}
                    ]}},
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
                    {'name': 'Fund Type', 'type': 'singleSelect', 'options': {'choices': [
                        {'name': '창업투자', 'color': 'green'},
                        {'name': '벤처투자', 'color': 'blue'},
                        {'name': '성장투자', 'color': 'purple'},
                        {'name': '기타', 'color': 'gray'}
                    ]}},
                    {'name': 'Commitment Amount', 'type': 'number'},
                    {'name': 'Fund Size Category', 'type': 'singleSelect', 'options': {'choices': [
                        {'name': 'Mega (1000억+)', 'color': 'red'},
                        {'name': 'Large (500-1000억)', 'color': 'orange'},
                        {'name': 'Mid (100-500억)', 'color': 'yellow'},
                        {'name': 'Small (<100억)', 'color': 'blue'}
                    ]}},
                    {'name': 'Representative', 'type': 'singleLineText'},
                    {'name': 'Fund Status', 'type': 'singleSelect', 'options': {'choices': [
                        {'name': 'Active', 'color': 'green'},
                        {'name': 'Closed', 'color': 'red'},
                        {'name': 'Unknown', 'color': 'gray'}
                    ]}},
                    {'name': 'Data Source', 'type': 'singleSelect', 'options': {'choices': [
                        {'name': 'DIVA 조합현황', 'color': 'orange'}
                    ]}},
                    {'name': 'Fund Date', 'type': 'dateTime'}
                ]
            },
            'Company_ID_Master': {
                'name': 'Company ID Master',
                'description': 'Master list linking DIVA and Apify data through Company IDs',
                'fields': [
                    {'name': 'Company ID', 'type': 'singleLineText'},
                    {'name': 'Company Name (Primary)', 'type': 'singleLineText'},
                    {'name': 'Has DIVA Data', 'type': 'checkbox'},
                    {'name': 'Has Apify Data', 'type': 'checkbox'},
                    {'name': 'Data Completeness', 'type': 'number'},
                    {'name': 'Last Updated', 'type': 'dateTime'},
                    {'name': 'DIVA Source', 'type': 'checkbox'},
                    {'name': 'Apify Source', 'type': 'checkbox'}
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
            # Upload to DIVA Companies table
            diva_companies_table = Table(self.api_key, self.base_id, 'DIVA Companies')
            
            companies_data = []
            for company_id, profile in company_profiles.items():
                record = {
                    'Company ID': company_id,
                    'Company Name': profile.get('company_name', ''),
                    'Source': 'DIVA Portal',
                    'Personnel Count': profile.get('personnel_data', {}).get('total_personnel', 0),
                    'Professional Staff': profile.get('personnel_data', {}).get('professional_staff', 0),
                    'Fund Count': len(profile.get('fund_data', [])),
                    'Investment Scale': profile.get('disclosure_data', {}).get('investment_scale', 0),
                    'Location': profile.get('disclosure_data', {}).get('location', ''),
                    'Status': 'Active',
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
            
            # Upload personnel data
            self.upload_personnel_data(company_profiles)
            
            # Upload professional staff data
            self.upload_professional_data(company_profiles)
            
            # Upload fund data
            self.upload_fund_data(company_profiles)
            
            return True
            
        except Exception as e:
            print(f"❌ Error uploading DIVA data: {e}")
            return False
    
    def upload_personnel_data(self, company_profiles):
        """Upload personnel data to DIVA Personnel table"""
        try:
            personnel_table = Table(self.api_key, self.base_id, 'DIVA Personnel Data')
            personnel_data = []
            
            for company_id, profile in company_profiles.items():
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
                        'Staffing Efficiency Score': self.calculate_efficiency_score(personnel),
                        'Data Source': 'DIVA 인력현황',
                        'Scraped Date': datetime.now().isoformat()
                    }
                    personnel_data.append(record)
            
            if personnel_data:
                personnel_table.batch_create(personnel_data)
                print(f"✅ Uploaded {len(personnel_data)} personnel records")
            
        except Exception as e:
            print(f"❌ Error uploading personnel data: {e}")
    
    def upload_professional_data(self, company_profiles):
        """Upload professional staff data"""
        try:
            professional_table = Table(self.api_key, self.base_id, 'DIVA Professional Staff')
            professional_data = []
            
            for company_id, profile in company_profiles.items():
                professionals = profile.get('professional_data', [])
                for prof in professionals:
                    record = {
                        'Company ID': company_id,
                        'Company Name': profile.get('company_name', ''),
                        'Staff Name': prof.get('name', ''),
                        'Position': prof.get('position', ''),
                        'Experience Level': self.categorize_experience(prof.get('experience', '')),
                        'Performance Score': prof.get('performance_score', 0),
                        'Contact Potential': prof.get('contact_potential', 3),
                        'Data Source': 'DIVA 전문인력현황',
                        'Profile Date': datetime.now().isoformat()
                    }
                    professional_data.append(record)
            
            if professional_data:
                professional_table.batch_create(professional_data)
                print(f"✅ Uploaded {len(professional_data)} professional staff records")
            
        except Exception as e:
            print(f"❌ Error uploading professional data: {e}")
    
    def upload_fund_data(self, company_profiles):
        """Upload fund data"""
        try:
            fund_table = Table(self.api_key, self.base_id, 'DIVA Fund Data')
            fund_data = []
            
            for company_id, profile in company_profiles.items():
                funds = profile.get('fund_data', [])
                for fund in funds:
                    amount = fund.get('commitment_amount', 0)
                    record = {
                        'Company ID': company_id,
                        'Company Name': profile.get('company_name', ''),
                        'Fund Name': fund.get('fund_name', ''),
                        'Fund Type': fund.get('fund_type', '기타'),
                        'Commitment Amount': amount,
                        'Fund Size Category': self.categorize_fund_size(amount),
                        'Representative': fund.get('representative', ''),
                        'Fund Status': 'Active',
                        'Data Source': 'DIVA 조합현황',
                        'Fund Date': datetime.now().isoformat()
                    }
                    fund_data.append(record)
            
            if fund_data:
                fund_table.batch_create(fund_data)
                print(f"✅ Uploaded {len(fund_data)} fund records")
            
        except Exception as e:
            print(f"❌ Error uploading fund data: {e}")
    
    def create_company_id_master(self, company_profiles):
        """Create master linking table"""
        try:
            master_table = Table(self.api_key, self.base_id, 'Company ID Master')
            
            # Get existing Company IDs from Apify data
            existing_tables = self.get_existing_tables()
            apify_company_ids = set()
            
            # Try to get Company IDs from existing VC Table
            for table_name, table_id in existing_tables.items():
                if 'VC Table' in table_name and 'OLD' not in table_name:
                    try:
                        vc_table = Table(self.api_key, self.base_id, table_name)
                        records = vc_table.all()
                        for record in records:
                            company_id = record.get('fields', {}).get('Company ID')
                            if company_id:
                                apify_company_ids.add(company_id)
                        break  # Only process the first valid VC Table
                    except:
                        pass
            
            print(f"📊 Found {len(apify_company_ids)} Company IDs in Apify data")
            
            # Create master records
            master_data = []
            all_company_ids = set(company_profiles.keys()) | apify_company_ids
            
            for company_id in all_company_ids:
                has_diva = company_id in company_profiles
                has_apify = company_id in apify_company_ids
                
                # Get company name from either source
                company_name = ''
                if has_diva:
                    company_name = company_profiles[company_id].get('company_name', '')
                
                record = {
                    'Company ID': company_id,
                    'Company Name (Primary)': company_name,
                    'Has DIVA Data': has_diva,
                    'Has Apify Data': has_apify,
                    'Data Completeness': 100 if (has_diva and has_apify) else 50,
                    'Last Updated': datetime.now().isoformat(),
                    'DIVA Source': has_diva,
                    'Apify Source': has_apify
                }
                
                master_data.append(record)
            
            # Upload master data
            master_table.batch_create(master_data)
            print(f"✅ Created {len(master_data)} master linking records")
            print(f"   🔗 Companies with both DIVA + Apify data: {sum(1 for r in master_data if r['Has DIVA Data'] and r['Has Apify Data'])}")
            print(f"   📊 DIVA only: {sum(1 for r in master_data if r['Has DIVA Data'] and not r['Has Apify Data'])}")
            print(f"   🕷️ Apify only: {sum(1 for r in master_data if not r['Has DIVA Data'] and r['Has Apify Data'])}")
            
        except Exception as e:
            print(f"❌ Error creating master table: {e}")
    
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
    
    def calculate_efficiency_score(self, personnel):
        """Calculate staffing efficiency score"""
        total = personnel.get('total_personnel', 0)
        professional = personnel.get('professional_staff', 0)
        
        if total == 0:
            return 0
        
        ratio = professional / total
        return min(ratio * 100, 100)
    
    def categorize_experience(self, experience):
        """Categorize experience level"""
        if not experience:
            return 'Unknown'
        
        exp_lower = experience.lower()
        if any(word in exp_lower for word in ['senior', '시니어', '임원', '대표']):
            return 'Senior'
        elif any(word in exp_lower for word in ['manager', '매니저', '팀장']):
            return 'Mid-level'
        else:
            return 'Junior'
    
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
    print("🚀 DIVA ORGANIZED SYSTEM - FIXED VERSION")
    print("   Separate Tables with Company ID Linking")
    print("   =" * 50)
    
    # Get configuration
    api_key = os.getenv('AIRTABLE_API_KEY')
    base_id = os.getenv('AIRTABLE_BASE_ID')
    
    if not api_key or not base_id:
        print("❌ Configuration Error!")
        print("   Please check your api_config.py file")
        return
    
    try:
        # Initialize system
        system = DIVAOrganizedSystem(api_key, base_id)
        
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
            system.upload_diva_data(company_profiles)
            
            # Create master linking table
            system.create_company_id_master(company_profiles)
            
            print("\n🎉 DIVA ORGANIZED SYSTEM DEPLOYMENT COMPLETE!")
            print("   📊 DIVA data in separate tables")
            print("   🔗 Linked to Apify data through Company IDs")
            print("   📋 Master table for unified analysis")
            
            # Generate report
            timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
            report = {
                "timestamp": timestamp,
                "companies_scraped": len(company_profiles),
                "tables_created": len(created_tables),
                "status": "SUCCESS",
                "tables": list(created_tables.keys())
            }
            
            with open(f"diva_organized_report_{timestamp}.json", 'w', encoding='utf-8') as f:
                json.dump(report, f, ensure_ascii=False, indent=2)
            
            print(f"💾 Report saved to: diva_organized_report_{timestamp}.json")
            
        else:
            print("⚠️  No data scraped from DIVA portal")
            
    except Exception as e:
        print(f"❌ Error in organized system: {e}")
        import traceback
        traceback.print_exc()

if __name__ == "__main__":
    main() 