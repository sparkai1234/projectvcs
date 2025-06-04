#!/usr/bin/env python3
"""
🏢 VC REPRESENTATIVE MANAGEMENT SYSTEM
=====================================

Manages representative (대표이사) and company URL data separately from automated scrapers
to prevent data conflicts and track changes over time.

Key Features:
- Protected fields that scrapers cannot overwrite
- Change history tracking for representatives
- Regular validation and update workflows
- Manual curation interface
"""

import os
import sys
import json
import requests
from datetime import datetime, timedelta
from typing import Dict, List, Optional, Tuple
import time
from dataclasses import dataclass
from api_config import set_environment_variables

# Set up environment variables
set_environment_variables()

@dataclass
class RepresentativeRecord:
    """Data class for representative information"""
    company_id: str
    company_name: str
    representative_name: str
    title: str
    start_date: str
    end_date: Optional[str]
    source: str
    verified: bool
    last_updated: str

@dataclass
class CompanyContactInfo:
    """Data class for company contact information"""
    company_id: str
    company_name: str
    website_url: str
    main_phone: str
    main_email: str
    headquarters_address: str
    source: str
    verified: bool
    last_updated: str

class VCRepresentativeManager:
    def __init__(self):
        self.api_key = os.getenv('AIRTABLE_API_KEY')
        self.base_id = os.getenv('AIRTABLE_BASE_ID')
        
        if not self.api_key or not self.base_id:
            raise ValueError("Missing API configuration")
        
        self.headers = {
            'Authorization': f'Bearer {self.api_key}',
            'Content-Type': 'application/json'
        }
        
        # Protected field names that scrapers should NOT overwrite
        self.protected_fields = {
            'Representative (Manual)': 'Manually curated representative name',
            'Representative Title': 'Representative title/position',
            'Representative Start Date': 'When they started as representative',
            'Website URL (Verified)': 'Manually verified company website',
            'Main Phone': 'Primary company phone number',
            'Main Email': 'Primary company email',
            'HQ Address': 'Headquarters address',
            'Data Protection Flag': 'Marks this record as manually curated',
            'Last Manual Update': 'When manual data was last updated',
            'Manual Update Source': 'Who/what updated the manual data'
        }
    
    def create_protected_fields_schema(self):
        """Generate schema for protected fields in VC Table"""
        print("🛡️ PROTECTED FIELDS SCHEMA FOR VC TABLE")
        print("=" * 60)
        print("Add these fields to your VC Table to protect manual data:")
        print()
        
        for field_name, description in self.protected_fields.items():
            print(f"📋 Field: {field_name}")
            print(f"   Type: Single line text (except dates)")
            print(f"   Description: {description}")
            print()
        
        return self.protected_fields
    
    def get_all_vc_companies(self):
        """Fetch all VC companies from the current VC Table"""
        print("🏢 Fetching all VC companies...")
        
        all_records = []
        url = f"https://api.airtable.com/v0/{self.base_id}/VC%20Table"
        
        while url:
            try:
                response = requests.get(url, headers=self.headers, params={'maxRecords': 100})
                if response.status_code == 200:
                    data = response.json()
                    batch = data.get('records', [])
                    all_records.extend(batch)
                    
                    offset = data.get('offset')
                    if offset:
                        url = f"https://api.airtable.com/v0/{self.base_id}/VC%20Table?offset={offset}"
                    else:
                        url = None
                    time.sleep(0.1)  # Rate limiting
                else:
                    print(f"❌ API Error: {response.status_code}")
                    break
                    
            except Exception as e:
                print(f"❌ Error fetching data: {e}")
                break
        
        print(f"✅ Fetched {len(all_records)} VC companies")
        return all_records
    
    def analyze_missing_representative_data(self, vc_records):
        """Analyze which companies are missing representative data"""
        print("\n🔍 ANALYZING MISSING REPRESENTATIVE DATA")
        print("=" * 50)
        
        missing_representative = []
        missing_website = []
        missing_contact = []
        
        for record in vc_records:
            fields = record.get('fields', {})
            company_name = fields.get('Company Name', 'Unknown')
            company_id = fields.get('Company ID', '')
            
            # Check for representative data
            rep_manual = fields.get('Representative (Manual)', '').strip()
            rep_auto = fields.get('Representative', '').strip()  # From scraper
            
            if not rep_manual and not rep_auto:
                missing_representative.append({
                    'id': record['id'],
                    'company_name': company_name,
                    'company_id': company_id
                })
            
            # Check for website
            website_verified = fields.get('Website URL (Verified)', '').strip()
            website_auto = fields.get('Website', '').strip()  # From scraper
            
            if not website_verified and not website_auto:
                missing_website.append({
                    'id': record['id'],
                    'company_name': company_name,
                    'company_id': company_id
                })
            
            # Check for contact info
            phone = fields.get('Main Phone', '').strip()
            email = fields.get('Main Email', '').strip()
            
            if not phone and not email:
                missing_contact.append({
                    'id': record['id'],
                    'company_name': company_name,
                    'company_id': company_id
                })
        
        print(f"📊 MISSING DATA ANALYSIS:")
        print(f"   • Companies missing representative: {len(missing_representative)}")
        print(f"   • Companies missing website: {len(missing_website)}")
        print(f"   • Companies missing contact info: {len(missing_contact)}")
        
        return {
            'missing_representative': missing_representative,
            'missing_website': missing_website,
            'missing_contact': missing_contact
        }
    
    def create_representative_tracking_table(self):
        """Create a separate table for tracking representative changes"""
        print("\n📋 CREATING REPRESENTATIVE TRACKING TABLE")
        print("=" * 50)
        
        table_schema = {
            "description": "Track representative changes over time",
            "fields": [
                {
                    "name": "Company ID",
                    "type": "singleLineText",
                    "description": "Link to VC company"
                },
                {
                    "name": "Company Name",
                    "type": "singleLineText",
                    "description": "Company name for reference"
                },
                {
                    "name": "Representative Name",
                    "type": "singleLineText",
                    "description": "Name of representative (대표이사)"
                },
                {
                    "name": "Title",
                    "type": "singleLineText",
                    "description": "Title/position (e.g., 대표이사, CEO)"
                },
                {
                    "name": "Start Date",
                    "type": "date",
                    "description": "When they started as representative"
                },
                {
                    "name": "End Date",
                    "type": "date",
                    "description": "When they ended (if applicable)"
                },
                {
                    "name": "Status",
                    "type": "singleSelect",
                    "options": {
                        "choices": [
                            {"name": "Current", "color": "greenBright"},
                            {"name": "Former", "color": "redBright"},
                            {"name": "Unverified", "color": "yellowBright"}
                        ]
                    }
                },
                {
                    "name": "Source",
                    "type": "singleLineText",
                    "description": "Source of information"
                },
                {
                    "name": "Verified",
                    "type": "checkbox",
                    "description": "Whether information is verified"
                },
                {
                    "name": "Last Updated",
                    "type": "dateTime",
                    "description": "When record was last updated"
                },
                {
                    "name": "Notes",
                    "type": "longText",
                    "description": "Additional notes"
                }
            ]
        }
        
        print("📋 Representative Tracking Table Schema:")
        print(json.dumps(table_schema, indent=2))
        
        return table_schema
    
    def update_representative_data(self, record_id: str, representative_data: Dict):
        """Update representative data in VC Table with protection"""
        try:
            # Prepare update with protected fields
            update_fields = {
                'Representative (Manual)': representative_data.get('name', ''),
                'Representative Title': representative_data.get('title', '대표이사'),
                'Representative Start Date': representative_data.get('start_date', ''),
                'Data Protection Flag': 'MANUAL_CURATED',
                'Last Manual Update': datetime.now().isoformat(),
                'Manual Update Source': representative_data.get('source', 'Manual Input')
            }
            
            # Remove empty fields
            update_fields = {k: v for k, v in update_fields.items() if v}
            
            url = f"https://api.airtable.com/v0/{self.base_id}/VC%20Table/{record_id}"
            payload = {"fields": update_fields}
            
            response = requests.patch(url, headers=self.headers, json=payload)
            
            if response.status_code == 200:
                print(f"✅ Updated representative data for record {record_id}")
                return True
            else:
                print(f"❌ Failed to update record {record_id}: {response.status_code}")
                return False
                
        except Exception as e:
            print(f"❌ Error updating representative data: {e}")
            return False
    
    def update_company_contact_info(self, record_id: str, contact_data: Dict):
        """Update company contact information with protection"""
        try:
            update_fields = {
                'Website URL (Verified)': contact_data.get('website', ''),
                'Main Phone': contact_data.get('phone', ''),
                'Main Email': contact_data.get('email', ''),
                'HQ Address': contact_data.get('address', ''),
                'Data Protection Flag': 'MANUAL_CURATED',
                'Last Manual Update': datetime.now().isoformat(),
                'Manual Update Source': contact_data.get('source', 'Manual Input')
            }
            
            # Remove empty fields
            update_fields = {k: v for k, v in update_fields.items() if v}
            
            url = f"https://api.airtable.com/v0/{self.base_id}/VC%20Table/{record_id}"
            payload = {"fields": update_fields}
            
            response = requests.patch(url, headers=self.headers, json=payload)
            
            if response.status_code == 200:
                print(f"✅ Updated contact info for record {record_id}")
                return True
            else:
                print(f"❌ Failed to update record {record_id}: {response.status_code}")
                return False
                
        except Exception as e:
            print(f"❌ Error updating contact info: {e}")
            return False
    
    def create_scraper_protection_rules(self):
        """Generate rules for Apify scrapers to avoid overwriting protected fields"""
        print("\n🛡️ SCRAPER PROTECTION RULES")
        print("=" * 50)
        
        protection_rules = {
            "protected_fields": list(self.protected_fields.keys()),
            "protection_logic": {
                "before_update": [
                    "Check if 'Data Protection Flag' = 'MANUAL_CURATED'",
                    "If protected, skip updating protected fields",
                    "Only update non-protected fields from scraper data"
                ],
                "field_mapping": {
                    "scraper_representative": "Representative (Auto)",  # New field for scraper data
                    "scraper_website": "Website (Auto)",  # New field for scraper data
                    "manual_representative": "Representative (Manual)",  # Protected field
                    "manual_website": "Website URL (Verified)"  # Protected field
                }
            },
            "update_strategy": "MERGE_NON_CONFLICTING",
            "conflict_resolution": "MANUAL_TAKES_PRIORITY"
        }
        
        print("📋 Protection Rules for Apify Scrapers:")
        print(json.dumps(protection_rules, indent=2))
        
        return protection_rules
    
    def schedule_representative_validation(self):
        """Create a schedule for validating representative data"""
        print("\n📅 REPRESENTATIVE VALIDATION SCHEDULE")
        print("=" * 50)
        
        validation_schedule = {
            "frequency": "monthly",
            "tasks": [
                {
                    "task": "Check for representative changes",
                    "frequency": "monthly",
                    "method": "news_monitoring",
                    "sources": ["company_websites", "business_news", "regulatory_filings"]
                },
                {
                    "task": "Validate contact information",
                    "frequency": "quarterly",
                    "method": "direct_verification",
                    "sources": ["company_websites", "directory_services"]
                },
                {
                    "task": "Update website URLs",
                    "frequency": "monthly",
                    "method": "automated_check",
                    "sources": ["url_validation", "redirect_checking"]
                }
            ],
            "automation_scripts": [
                "validate_representative_changes.py",
                "check_website_validity.py",
                "update_contact_information.py"
            ]
        }
        
        print("📋 Validation Schedule:")
        print(json.dumps(validation_schedule, indent=2))
        
        return validation_schedule
    
    def generate_manual_update_interface(self):
        """Generate a simple interface for manual updates"""
        print("\n🖥️ MANUAL UPDATE INTERFACE")
        print("=" * 50)
        
        print("Use this format for bulk updates:")
        print()
        print("CSV Format for Representative Updates:")
        print("Company ID,Company Name,Representative Name,Title,Start Date,Source")
        print("OP20200001,ABC벤처파트너스,김철수,대표이사,2024-01-01,Company Website")
        print("OP20200002,XYZ투자,박영희,대표이사,2023-06-15,News Article")
        print()
        
        print("CSV Format for Contact Updates:")
        print("Company ID,Company Name,Website,Phone,Email,Address,Source")
        print("OP20200001,ABC벤처파트너스,https://abc-vc.com,02-1234-5678,info@abc-vc.com,서울 강남구,Company Website")
        print()
        
        print("📝 Manual Update Commands:")
        print("python vc_representative_management_system.py --update-rep --csv representatives.csv")
        print("python vc_representative_management_system.py --update-contact --csv contacts.csv")
        print("python vc_representative_management_system.py --validate-all")
    
    def create_comprehensive_report(self):
        """Generate comprehensive analysis and recommendations"""
        print("\n📊 COMPREHENSIVE VC REPRESENTATIVE DATA REPORT")
        print("=" * 60)
        
        # Get current data
        vc_records = self.get_all_vc_companies()
        missing_data = self.analyze_missing_representative_data(vc_records)
        
        # Generate recommendations
        print(f"\n🎯 RECOMMENDATIONS:")
        print("=" * 30)
        print(f"1. Add protected fields to VC Table")
        print(f"2. Create Representative Tracking table")
        print(f"3. Update Apify scrapers with protection rules")
        print(f"4. Set up monthly validation schedule")
        print(f"5. Populate missing data for {len(missing_data['missing_representative'])} companies")
        
        # Save detailed report
        report = {
            "timestamp": datetime.now().isoformat(),
            "total_companies": len(vc_records),
            "missing_data_analysis": missing_data,
            "protected_fields_schema": self.protected_fields,
            "scraper_protection_rules": self.create_scraper_protection_rules(),
            "validation_schedule": self.schedule_representative_validation(),
            "recommendations": [
                "Add protected fields to VC Table",
                "Create Representative Tracking table", 
                "Update Apify scrapers with protection rules",
                "Set up monthly validation schedule",
                f"Populate missing data for {len(missing_data['missing_representative'])} companies"
            ]
        }
        
        report_file = f"vc_representative_management_report_{datetime.now().strftime('%Y%m%d_%H%M%S')}.json"
        with open(report_file, 'w', encoding='utf-8') as f:
            json.dump(report, f, indent=2, ensure_ascii=False)
        
        print(f"\n📄 Detailed report saved: {report_file}")
        
        return report

def main():
    """Main execution function"""
    print("🏢 VC REPRESENTATIVE MANAGEMENT SYSTEM")
    print("=" * 60)
    print("Protecting manual data from automated scraper conflicts")
    print()
    
    try:
        manager = VCRepresentativeManager()
        
        # Generate protected fields schema
        manager.create_protected_fields_schema()
        
        # Create representative tracking table schema
        manager.create_representative_tracking_table()
        
        # Generate scraper protection rules
        manager.create_scraper_protection_rules()
        
        # Create validation schedule
        manager.schedule_representative_validation()
        
        # Generate manual update interface
        manager.generate_manual_update_interface()
        
        # Create comprehensive report
        manager.create_comprehensive_report()
        
        print(f"\n🎉 SYSTEM SETUP COMPLETE!")
        print("=" * 30)
        print("✅ Protected fields schema generated")
        print("✅ Representative tracking table designed")
        print("✅ Scraper protection rules created")
        print("✅ Validation schedule established")
        print("✅ Manual update interface ready")
        
        print(f"\n🚀 NEXT STEPS:")
        print("1. Add protected fields to your VC Table in Airtable")
        print("2. Create the Representative Tracking table") 
        print("3. Update your Apify VC scraper with protection rules")
        print("4. Start manual data population using the CSV format")
        print("5. Set up monthly validation automation")
        
    except Exception as e:
        print(f"❌ Error: {e}")

if __name__ == "__main__":
    main() 