#!/usr/bin/env python3
"""
🚀 Fixed Complete Migration - Parse structured data from Notes field
Based on actual Airtable field structure discovery
"""

import requests
from supabase import create_client, Client
from api_config import get_config, get_supabase_config
import time
import json
from datetime import datetime, timedelta
import re

class FixedCompleteMigration:
    def __init__(self):
        # Airtable Configuration
        self.airtable_config = get_config()
        self.base_url = f'https://api.airtable.com/v0/{self.airtable_config["airtable_base_id"]}'
        self.headers = {'Authorization': f'Bearer {self.airtable_config["airtable_api_key"]}'}
        
        # Supabase Configuration
        config = get_supabase_config(use_service_role=True)
        self.supabase: Client = create_client(config['url'], config['key'])
        
        # Statistics
        self.stats = {
            'fund_migrated': 0,
            'fund_errors': 0,
            'vc_migrated': 0,
            'vc_errors': 0
        }

    def parse_notes_data(self, notes_text, data_type):
        """Parse structured data from Notes field"""
        if not notes_text:
            return {}
        
        parsed_data = {}
        current_section = None
        
        for line in notes_text.split('\n'):
            line = line.strip()
            if not line:
                continue
            
            # Check for section headers
            if line.startswith('=== ') and line.endswith(' ==='):
                current_section = line.replace('===', '').strip()
                continue
            
            # Parse key-value pairs
            if ':' in line:
                key, value = line.split(':', 1)
                key = key.strip()
                value = value.strip()
                parsed_data[key] = value
        
        return parsed_data

    def parse_korean_amount(self, amount_str):
        """Parse Korean amount format (e.g., '400.0억원' -> 40000000000)"""
        if not amount_str or not isinstance(amount_str, str):
            return None
        
        try:
            # Extract number
            number_match = re.search(r'[\d,]+\.?\d*', amount_str.replace(' ', ''))
            if number_match:
                number_str = number_match.group().replace(',', '')
                number = float(number_str)
                
                # Convert based on unit
                if '억' in amount_str:
                    return int(number * 100000000)  # 억 = 100 million
                elif '만' in amount_str:
                    return int(number * 10000)      # 만 = 10 thousand
                else:
                    return int(number)
        except:
            pass
        
        return None

    def parse_korean_date(self, date_str):
        """Parse Korean date format"""
        if not date_str or not isinstance(date_str, str):
            return None
        
        try:
            for fmt in ['%Y-%m-%d', '%Y.%m.%d', '%Y/%m/%d']:
                try:
                    return datetime.strptime(date_str, fmt).date().isoformat()
                except ValueError:
                    continue
        except:
            pass
        
        return None

    def map_fund_record(self, airtable_record):
        """Map Airtable fund record with Notes parsing"""
        fields = airtable_record.get('fields', {})
        
        # Parse structured data from Notes
        notes_data = self.parse_notes_data(fields.get('Notes', ''), 'Fund')
        
        # Extract data from both direct fields and parsed notes
        fund_id = notes_data.get('Fund ID') or fields.get('Fund ID', '')
        fund_name = notes_data.get('Fund Name') or fields.get('Name', '')
        company_id = notes_data.get('Company ID') or fields.get('Company ID', '')
        company_name = notes_data.get('Company Name') or fields.get('Company Name (Korean)', '')
        
        # Parse dates from notes
        registration_date = self.parse_korean_date(notes_data.get('Registration Date'))
        expiry_date = self.parse_korean_date(notes_data.get('Expiry Date'))
        
        # Parse amount
        total_amount_str = notes_data.get('Total Amount') or f"{fields.get('Operating Amount', 0)}억원"
        total_amount = self.parse_korean_amount(total_amount_str)
        
        # Extract Investment Field and Detail for proper mapping
        investment_field = notes_data.get('Investment Field', '')  # 일반
        investment_detail = notes_data.get('Investment Detail', '')  # 중소/벤처일반
        
        return {
            # Basic Fund Information
            'fund_name': fund_name,
            'fund_id': fund_id,
            'company_id': company_id,
            'company_name': company_name,
            
            # Financial Information
            'total_amount': total_amount,
            'commitment_amount': total_amount,
            'fund_size': total_amount,
            
            # Investment Details - Fixed field mapping for ARRAY types
            'investment_field': [investment_field] if investment_field else [],  # Array type
            'investment_focus': [investment_field] if investment_field else [],  # Array type (same as investment_field)
            'investment_detail': [investment_detail] if investment_detail else [],  # Array type
            'investment_character': notes_data.get('Investment Character', ''),  # String type
            'company_industry': notes_data.get('Company Industry', ''),  # String type
            
            # Dates
            'registration_date': registration_date,
            'expiry_date': expiry_date,
            'establishment_date': self.parse_korean_date(fields.get('Founded')),
            
            # Status and Classification
            'fund_type': notes_data.get('Data Type', 'Fund'),
            'fund_status': fields.get('Status', 'Active'),
            
            # Additional Information
            'notes': fields.get('Notes', ''),
            'description': investment_detail,  # String type
            'sector': [investment_field] if investment_field else [],  # Array type
            'representative': '',
            
            # Metadata
            'data_source': notes_data.get('Source', 'Korean VC Database (vcs.go.kr)'),
            'import_date': datetime.now().isoformat(),
            'apify_source': 'Airtable Migration - Complete Dataset',
            
            # Store original data for reference - Fixed fund_details
            'fund_details': json.dumps({
                'airtable_id': airtable_record.get('id'),
                'original_fields': fields,
                'parsed_notes': notes_data,
                'investment_field': investment_field,
                'investment_detail': investment_detail,
                'migration_timestamp': datetime.now().isoformat()
            }, ensure_ascii=False, default=str)
        }

    def map_vc_record(self, airtable_record):
        """Map Airtable VC record with Notes parsing"""
        fields = airtable_record.get('fields', {})
        
        # Parse structured data from Notes
        notes_data = self.parse_notes_data(fields.get('Notes', ''), 'VC Company')
        
        # Extract data from both direct fields and parsed notes - Fixed mapping
        company_id = notes_data.get('Company ID') or fields.get('Company ID', '')
        company_name = notes_data.get('Company Name') or fields.get('Company Name', '') or fields.get('Company Name (Korean)', '')
        
        # Fixed industry mapping - check both Notes and direct fields
        industry = notes_data.get('Industry') or fields.get('Industry', '')
        
        location = notes_data.get('Location') or fields.get('Location', '')
        zip_code = notes_data.get('Zip Code') or fields.get('Zip Code', '')
        company_type = notes_data.get('Company Type') or fields.get('Company Type', '')
        
        # Fixed founded/established_date mapping
        founded_str = notes_data.get('Founded') or fields.get('Founded', '')
        established_date = self.parse_korean_date(founded_str)
        
        # If founded_str is a duration (e.g., "8년 9개월"), calculate establishment date
        if not established_date and founded_str and ('년' in founded_str or '개월' in founded_str):
            # Duration format detected - calculate establishment date
            try:
                # Extract years and months from duration string
                years_match = re.search(r'(\d+)년', founded_str)
                months_match = re.search(r'(\d+)개월', founded_str)
                
                years = int(years_match.group(1)) if years_match else 0
                months = int(months_match.group(1)) if months_match else 0
                
                # Calculate establishment date (current date - duration)
                current_date = datetime.now()
                total_months = years * 12 + months
                
                # Approximate calculation (assuming 30.44 days per month)
                establishment_date_calc = current_date - timedelta(days=total_months * 30.44)
                established_date = establishment_date_calc.date().isoformat()
                
            except Exception:
                # If calculation fails, leave as None
                established_date = None
        
        # Parse business information
        operating_scale = fields.get('Operating Scale')
        if operating_scale is not None:
            try:
                operating_scale = int(operating_scale)
            except:
                operating_scale = None
        
        # Fixed operating amount parsing
        operating_amount_str = notes_data.get('Operating Amount')
        if not operating_amount_str and fields.get('Operating Amount'):
            operating_amount_str = f"{fields.get('Operating Amount')}억원"
        operating_amount = self.parse_korean_amount(operating_amount_str) if operating_amount_str else None
        
        business_category = fields.get('Business Category')
        if business_category is not None:
            try:
                business_category = str(business_category)
            except:
                business_category = None
        
        # Parse strategy planner
        strategy_planner = fields.get('Strategy Planner')
        if isinstance(strategy_planner, str):
            strategy_planner = strategy_planner.lower() in ['yes', 'true', '1', 'y', '예']
        elif strategy_planner is None:
            strategy_planner_notes = notes_data.get('Strategy Planner', '')
            strategy_planner = strategy_planner_notes.lower() in ['yes', 'true', '1', 'y', '예'] if strategy_planner_notes else None
        
        return {
            'company_id': company_id,
            'company_name': company_name,
            'industry': industry,  # Fixed - should now capture 바이오/의료
            'location': location,
            'zip_code': zip_code,
            'representative': '',
            'established_date': established_date,  # Fixed - should now capture dates properly
            'company_type': company_type,
            'website_url': '',
            'contact_info': '',
            'disclosure_data': json.dumps(fields, ensure_ascii=False, default=str) if fields else None,
            'operating_scale': operating_scale,
            'operating_amount': operating_amount,
            'business_category': business_category,
            'strategy_planner': strategy_planner,
            'founded': founded_str,  # Keep original string format
            'data_type': notes_data.get('Data Type', 'VC Company'),
            'status': 'Active',
            'data_source': notes_data.get('Source', 'Korean VC Database (vcs.go.kr)'),
            'import_date': datetime.now().isoformat()
        }

    def fetch_airtable_data(self, table_name):
        """Fetch all records from specified Airtable table"""
        print(f"🔍 Fetching data from {table_name}...")
        
        url = f'{self.base_url}/{table_name.replace(" ", "%20")}'
        all_records = []
        offset = None
        page = 1
        
        while True:
            params = {'pageSize': 100}
            if offset:
                params['offset'] = offset
            
            response = requests.get(url, headers=self.headers, params=params)
            
            if response.status_code == 200:
                data = response.json()
                records = data.get('records', [])
                
                if not records:
                    break
                
                all_records.extend(records)
                print(f"   📊 Page {page}: {len(records)} records (Total: {len(all_records)})")
                
                offset = data.get('offset')
                if not offset:
                    break
                
                page += 1
                time.sleep(0.1)
            else:
                print(f"❌ Error {response.status_code}: {response.text}")
                break
        
        print(f"✅ Fetched {len(all_records)} records from {table_name}")
        return all_records

    def migrate_funds(self):
        """Migrate fund data with proper field mapping"""
        print("\n💰 MIGRATING FUND DATA")
        print("=" * 60)
        
        # Fetch fund records
        fund_records = self.fetch_airtable_data('Fund Table')
        
        if not fund_records:
            print("❌ No fund records found")
            return
        
        for i, record in enumerate(fund_records, 1):
            try:
                # Map the record
                mapped_record = self.map_fund_record(record)
                
                if not mapped_record['fund_name'] or not mapped_record['company_id']:
                    print(f"⚠️  {i:4d}. Skipping - missing essential data")
                    continue
                
                # Check if exists and update or insert
                existing = self.supabase.table('fund_table').select('id').eq('fund_name', mapped_record['fund_name']).execute()
                
                if existing.data:
                    result = self.supabase.table('fund_table').update(mapped_record).eq('fund_name', mapped_record['fund_name']).execute()
                    print(f"🔄 {i:4d}. Updated: {mapped_record['fund_name'][:50]}...")
                else:
                    result = self.supabase.table('fund_table').insert(mapped_record).execute()
                    print(f"✅ {i:4d}. {mapped_record['fund_name'][:50]}...")
                
                self.stats['fund_migrated'] += 1
                
                if i % 50 == 0:
                    print(f"\n📊 Fund Progress: {i}/{len(fund_records)} ({i/len(fund_records)*100:.1f}%)")
                    print(f"   ✅ Migrated: {self.stats['fund_migrated']}")
                    print(f"   ❌ Errors: {self.stats['fund_errors']}\n")
                
            except Exception as e:
                self.stats['fund_errors'] += 1
                print(f"❌ {i:4d}. Error: {str(e)[:50]}...")

    def migrate_vcs(self):
        """Migrate VC data with proper field mapping"""
        print("\n🏢 MIGRATING VC DATA")
        print("=" * 60)
        
        # Fetch VC records
        vc_records = self.fetch_airtable_data('VC Table')
        
        if not vc_records:
            print("❌ No VC records found")
            return
        
        for i, record in enumerate(vc_records, 1):
            try:
                # Map the record
                mapped_record = self.map_vc_record(record)
                
                if not mapped_record['company_name']:
                    print(f"⚠️  {i:4d}. Skipping - no company name")
                    continue
                
                # Check if exists and update or insert
                existing = self.supabase.table('vc_table').select('id').eq('company_name', mapped_record['company_name']).execute()
                
                if existing.data:
                    result = self.supabase.table('vc_table').update(mapped_record).eq('company_name', mapped_record['company_name']).execute()
                    print(f"🔄 {i:4d}. Updated: {mapped_record['company_name'][:50]}...")
                else:
                    result = self.supabase.table('vc_table').insert(mapped_record).execute()
                    print(f"✅ {i:4d}. {mapped_record['company_name'][:50]}...")
                
                self.stats['vc_migrated'] += 1
                
                if i % 50 == 0:
                    print(f"\n📊 VC Progress: {i}/{len(vc_records)} ({i/len(vc_records)*100:.1f}%)")
                    print(f"   ✅ Migrated: {self.stats['vc_migrated']}")
                    print(f"   ❌ Errors: {self.stats['vc_errors']}\n")
                
            except Exception as e:
                self.stats['vc_errors'] += 1
                print(f"❌ {i:4d}. Error: {str(e)[:50]}...")

    def run_complete_migration(self):
        """Run complete migration for both Fund and VC tables"""
        print("🚀 FIXED COMPLETE MIGRATION")
        print("=" * 60)
        print("🎯 Parsing structured data from Notes field")
        print("✅ Proper field mapping based on actual Airtable structure")
        print("=" * 60)
        
        # Migrate funds
        self.migrate_funds()
        
        # Migrate VCs
        self.migrate_vcs()
        
        # Final summary
        print("\n" + "=" * 60)
        print("🎉 COMPLETE MIGRATION FINISHED!")
        print("=" * 60)
        print(f"💰 FUND RESULTS:")
        print(f"   ✅ Migrated: {self.stats['fund_migrated']}")
        print(f"   ❌ Errors: {self.stats['fund_errors']}")
        print(f"🏢 VC RESULTS:")
        print(f"   ✅ Migrated: {self.stats['vc_migrated']}")
        print(f"   ❌ Errors: {self.stats['vc_errors']}")
        print(f"\n🎯 TOTAL SUCCESS: {self.stats['fund_migrated'] + self.stats['vc_migrated']} records")

def main():
    migrator = FixedCompleteMigration()
    migrator.run_complete_migration()

if __name__ == "__main__":
    main() 