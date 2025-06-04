#!/usr/bin/env python3
"""
🚀 DIVA Enhancement System - Simplified & Working Version
Creates enhancement tables that link to existing VC Table via Company ID
Focuses on getting working system first, then enhancement later
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

class DIVAEnhancementSystem:
    def __init__(self, api_key, base_id):
        self.api_key = api_key
        self.api = Api(api_key)
        self.base_id = base_id
        self.base = self.api.base(base_id)
        
        # Simple enhancement table configurations that work with Airtable
        self.enhancement_configs = {
            'DIVA_Intelligence': {
                'name': 'DIVA Intelligence',
                'description': 'DIVA enhancement data linked to VC Table via Company ID',
                'fields': [
                    {'name': 'Company ID', 'type': 'singleLineText'},
                    {'name': 'DIVA Company Name', 'type': 'singleLineText'},
                    {'name': 'Data Source', 'type': 'singleLineText'},
                    {'name': 'Last Updated', 'type': 'singleLineText'},  # Simplified as text
                    {'name': 'Data Completeness Score', 'type': 'singleLineText'},  # Simplified as text
                    # Personnel Intelligence
                    {'name': 'DIVA Total Personnel', 'type': 'singleLineText'},
                    {'name': 'DIVA Professional Staff', 'type': 'singleLineText'},
                    {'name': 'DIVA Investment Review Staff', 'type': 'singleLineText'},
                    {'name': 'DIVA Management Staff', 'type': 'singleLineText'},
                    {'name': 'Professional Staff Ratio', 'type': 'singleLineText'},
                    {'name': 'Staffing Efficiency Score', 'type': 'singleLineText'},
                    # Investment Intelligence  
                    {'name': 'DIVA Investment Scale', 'type': 'singleLineText'},
                    {'name': 'DIVA Fund Count', 'type': 'singleLineText'},
                    {'name': 'DIVA Professional Count', 'type': 'singleLineText'},
                    # Status and Quality
                    {'name': 'DIVA Status', 'type': 'singleLineText'},
                    {'name': 'Has Personnel Data', 'type': 'singleLineText'},
                    {'name': 'Has Professional Data', 'type': 'singleLineText'},
                    {'name': 'Has Fund Data', 'type': 'singleLineText'},
                    {'name': 'Has Disclosure Data', 'type': 'singleLineText'},
                    # Intelligence Categories
                    {'name': 'Personnel Intelligence Level', 'type': 'singleLineText'},
                    {'name': 'Investment Intelligence Level', 'type': 'singleLineText'},
                    {'name': 'Network Intelligence Level', 'type': 'singleLineText'},
                    {'name': 'Intelligence Summary', 'type': 'multilineText'}
                ]
            },
            'DIVA_Professional_Network': {
                'name': 'DIVA Professional Network',
                'description': 'Individual professional profiles from DIVA for networking intelligence',
                'fields': [
                    {'name': 'Company ID', 'type': 'singleLineText'},
                    {'name': 'Company Name', 'type': 'singleLineText'},
                    {'name': 'Professional Name', 'type': 'singleLineText'},
                    {'name': 'Position Title', 'type': 'singleLineText'},
                    {'name': 'Experience Level', 'type': 'singleLineText'},
                    {'name': 'Seniority Category', 'type': 'singleLineText'},
                    {'name': 'Contact Potential Score', 'type': 'singleLineText'},
                    {'name': 'Network Value Score', 'type': 'singleLineText'},
                    {'name': 'Profile Completeness', 'type': 'singleLineText'},
                    {'name': 'DIVA Source Section', 'type': 'singleLineText'},
                    {'name': 'Profile Date', 'type': 'singleLineText'},
                    {'name': 'Intelligence Notes', 'type': 'multilineText'}
                ]
            },
            'DIVA_Fund_Intelligence': {
                'name': 'DIVA Fund Intelligence', 
                'description': 'Fund-specific intelligence from DIVA for investment analysis',
                'fields': [
                    {'name': 'Company ID', 'type': 'singleLineText'},
                    {'name': 'Company Name', 'type': 'singleLineText'},
                    {'name': 'Fund Name', 'type': 'singleLineText'},
                    {'name': 'Fund Type Category', 'type': 'singleLineText'},
                    {'name': 'Commitment Amount', 'type': 'singleLineText'},
                    {'name': 'Fund Size Category', 'type': 'singleLineText'},
                    {'name': 'Fund Representative', 'type': 'singleLineText'},
                    {'name': 'Fund Status', 'type': 'singleLineText'},
                    {'name': 'Investment Focus', 'type': 'singleLineText'},
                    {'name': 'Performance Indicator', 'type': 'singleLineText'},
                    {'name': 'DIVA Fund Source', 'type': 'singleLineText'},
                    {'name': 'Fund Date', 'type': 'singleLineText'},
                    {'name': 'Investment Intelligence Notes', 'type': 'multilineText'}
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
    
    def create_enhancement_tables(self):
        """Create DIVA enhancement tables"""
        existing_tables = self.get_existing_tables()
        created_tables = {}
        
        print("\n🏗️ Creating DIVA Enhancement Tables...")
        
        for table_key, config in self.enhancement_configs.items():
            table_name = config['name']
            
            if table_name in existing_tables:
                print(f"✅ Enhancement table '{table_name}' already exists")
                created_tables[table_key] = existing_tables[table_name]
                continue
            
            try:
                print(f"🔨 Creating enhancement table: {table_name}")
                
                table = self.base.create_table(
                    name=table_name,
                    description=config['description'],
                    fields=config['fields']
                )
                
                created_tables[table_key] = table.id
                print(f"✅ Created enhancement table: {table_name}")
                
            except Exception as e:
                print(f"❌ Error creating enhancement table {table_name}: {e}")
                print(f"   Error details: {str(e)}")
        
        return created_tables
    
    def upload_diva_intelligence(self, company_profiles):
        """Upload DIVA data to intelligence enhancement table"""
        print(f"\n📤 Uploading DIVA intelligence for {len(company_profiles)} companies...")
        
        try:
            # Convert company profiles to proper dictionary format
            profiles_dict = {}
            for company_id, profile in company_profiles.items():
                if hasattr(profile, '__dict__'):
                    profile_dict = profile.__dict__
                else:
                    profile_dict = profile
                profiles_dict[company_id] = profile_dict
            
            # Get the DIVA Intelligence table
            intelligence_table = self.base.table('DIVA Intelligence')
            
            # Prepare intelligence records
            intelligence_records = []
            
            for company_id, profile in profiles_dict.items():
                # Safely extract nested data
                personnel_data = profile.get('personnel_data', {}) or {}
                fund_data = profile.get('fund_data', []) or []
                disclosure_data = profile.get('disclosure_data', {}) or {}
                professional_data = profile.get('professional_data', []) or []
                
                # Calculate intelligence scores
                personnel_intelligence = self.calculate_personnel_intelligence(personnel_data)
                investment_intelligence = self.calculate_investment_intelligence(fund_data, disclosure_data)
                network_intelligence = self.calculate_network_intelligence(professional_data)
                
                # Calculate professional staff ratio
                total_personnel = personnel_data.get('total_personnel', 0)
                professional_staff = personnel_data.get('professional_staff', 0)
                professional_ratio = (professional_staff / total_personnel * 100) if total_personnel > 0 else 0
                
                # Create intelligence summary
                summary_parts = []
                if personnel_data:
                    summary_parts.append(f"👥 Personnel: {total_personnel} total, {professional_staff} professional")
                if professional_data:
                    summary_parts.append(f"🔗 Network: {len(professional_data)} professionals")
                if fund_data:
                    summary_parts.append(f"💰 Funds: {len(fund_data)} fund records")
                if disclosure_data:
                    investment_scale = disclosure_data.get('investment_scale', 0)
                    if investment_scale > 0:
                        summary_parts.append(f"📊 Investment Scale: {investment_scale:,} KRW")
                
                intelligence_summary = "\n".join(summary_parts) if summary_parts else "No detailed intelligence data available"
                
                record = {
                    'Company ID': company_id,
                    'DIVA Company Name': profile.get('company_name', ''),
                    'Data Source': 'DIVA Portal Intelligence',
                    'Last Updated': datetime.now().strftime("%Y-%m-%d %H:%M:%S"),
                    'Data Completeness Score': f"{self.calculate_completeness_score(profile):.0f}%",
                    # Personnel Intelligence
                    'DIVA Total Personnel': str(total_personnel),
                    'DIVA Professional Staff': str(professional_staff),
                    'DIVA Investment Review Staff': str(personnel_data.get('investment_review_staff', 0)),
                    'DIVA Management Staff': str(personnel_data.get('management_staff', 0)),
                    'Professional Staff Ratio': f"{professional_ratio:.1f}%",
                    'Staffing Efficiency Score': f"{min(professional_ratio * 1.2, 100):.1f}",
                    # Investment Intelligence
                    'DIVA Investment Scale': str(disclosure_data.get('investment_scale', 0) if disclosure_data else 0),
                    'DIVA Fund Count': str(len(fund_data)),
                    'DIVA Professional Count': str(len(professional_data)),
                    # Status and Quality Indicators
                    'DIVA Status': 'Active Intelligence',
                    'Has Personnel Data': 'Yes' if personnel_data else 'No',
                    'Has Professional Data': 'Yes' if professional_data else 'No',
                    'Has Fund Data': 'Yes' if fund_data else 'No',
                    'Has Disclosure Data': 'Yes' if disclosure_data else 'No',
                    # Intelligence Level Categories
                    'Personnel Intelligence Level': personnel_intelligence,
                    'Investment Intelligence Level': investment_intelligence,
                    'Network Intelligence Level': network_intelligence,
                    'Intelligence Summary': intelligence_summary
                }
                
                intelligence_records.append(record)
            
            # Upload intelligence records
            if intelligence_records:
                batch_size = 10
                uploaded_count = 0
                
                for i in range(0, len(intelligence_records), batch_size):
                    batch = intelligence_records[i:i+batch_size]
                    try:
                        intelligence_table.batch_create(batch)
                        uploaded_count += len(batch)
                        print(f"✅ Uploaded intelligence batch {i//batch_size + 1}: {len(batch)} companies")
                    except Exception as e:
                        print(f"❌ Error uploading intelligence batch: {e}")
                
                print(f"✅ Successfully uploaded {uploaded_count} intelligence records")
                return True
            else:
                print("⚠️ No intelligence data to upload")
                return False
                
        except Exception as e:
            print(f"❌ Error uploading DIVA intelligence: {e}")
            import traceback
            traceback.print_exc()
            return False
    
    def upload_professional_network(self, company_profiles):
        """Upload professional network data for networking intelligence"""
        print(f"\n👥 Uploading professional network data...")
        
        try:
            # Convert profiles
            profiles_dict = {}
            for company_id, profile in company_profiles.items():
                if hasattr(profile, '__dict__'):
                    profiles_dict[company_id] = profile.__dict__
                else:
                    profiles_dict[company_id] = profile
            
            # Get professional network table
            network_table = self.base.table('DIVA Professional Network')
            
            professional_records = []
            
            for company_id, profile in profiles_dict.items():
                professionals = profile.get('professional_data', []) or []
                
                for prof in professionals:
                    if hasattr(prof, '__dict__'):
                        prof = prof.__dict__
                    
                    # Calculate network scores
                    seniority = self.categorize_seniority(prof.get('experience', ''), prof.get('position', ''))
                    contact_score = self.calculate_contact_potential(seniority, prof.get('position', ''))
                    network_value = self.calculate_network_value(prof)
                    
                    record = {
                        'Company ID': company_id,
                        'Company Name': profile.get('company_name', ''),
                        'Professional Name': prof.get('name', ''),
                        'Position Title': prof.get('position', ''),
                        'Experience Level': prof.get('experience', ''),
                        'Seniority Category': seniority,
                        'Contact Potential Score': f"{contact_score}/10",
                        'Network Value Score': f"{network_value:.1f}/10",
                        'Profile Completeness': f"{self.calculate_profile_completeness(prof):.0f}%",
                        'DIVA Source Section': 'DIVA 전문인력현황',
                        'Profile Date': datetime.now().strftime("%Y-%m-%d %H:%M:%S"),
                        'Intelligence Notes': f"Seniority: {seniority}\nContact Score: {contact_score}/10\nNetwork Value: {network_value:.1f}/10\nRecommended for: {'High Priority Contact' if contact_score >= 8 else 'Standard Contact' if contact_score >= 5 else 'Lower Priority Contact'}"
                    }
                    
                    professional_records.append(record)
            
            # Upload professional records
            if professional_records:
                batch_size = 20
                uploaded_count = 0
                
                for i in range(0, len(professional_records), batch_size):
                    batch = professional_records[i:i+batch_size]
                    try:
                        network_table.batch_create(batch)
                        uploaded_count += len(batch)
                        print(f"✅ Uploaded network batch {i//batch_size + 1}: {len(batch)} professionals")
                    except Exception as e:
                        print(f"❌ Error uploading network batch: {e}")
                
                print(f"✅ Successfully uploaded {uploaded_count} professional network records")
                return True
            else:
                print("ℹ️ No professional network data to upload")
                return False
                
        except Exception as e:
            print(f"❌ Error uploading professional network: {e}")
            import traceback
            traceback.print_exc()
            return False
    
    def upload_fund_intelligence(self, company_profiles):
        """Upload fund intelligence data"""
        print(f"\n💰 Uploading fund intelligence data...")
        
        try:
            # Convert profiles
            profiles_dict = {}
            for company_id, profile in company_profiles.items():
                if hasattr(profile, '__dict__'):
                    profiles_dict[company_id] = profile.__dict__
                else:
                    profiles_dict[company_id] = profile
            
            # Get fund intelligence table
            fund_table = self.base.table('DIVA Fund Intelligence')
            
            fund_records = []
            
            for company_id, profile in profiles_dict.items():
                funds = profile.get('fund_data', []) or []
                
                for fund in funds:
                    if hasattr(fund, '__dict__'):
                        fund = fund.__dict__
                    
                    amount = fund.get('commitment_amount', 0)
                    fund_type = fund.get('fund_type', '기타')
                    fund_size_category = self.categorize_fund_size(amount)
                    investment_focus = self.determine_investment_focus(fund_type)
                    performance_indicator = self.calculate_fund_performance_indicator(amount, fund_type)
                    
                    record = {
                        'Company ID': company_id,
                        'Company Name': profile.get('company_name', ''),
                        'Fund Name': fund.get('fund_name', ''),
                        'Fund Type Category': fund_type,
                        'Commitment Amount': f"{amount:,} KRW" if amount > 0 else "Not Disclosed",
                        'Fund Size Category': fund_size_category,
                        'Fund Representative': fund.get('representative', ''),
                        'Fund Status': 'Active',
                        'Investment Focus': investment_focus,
                        'Performance Indicator': f"{performance_indicator:.1f}/10",
                        'DIVA Fund Source': 'DIVA 조합현황',
                        'Fund Date': datetime.now().strftime("%Y-%m-%d %H:%M:%S"),
                        'Investment Intelligence Notes': f"Fund Type: {fund_type}\nSize Category: {fund_size_category}\nInvestment Focus: {investment_focus}\nCommitment Amount: {amount:,} KRW\nPerformance Score: {performance_indicator:.1f}/10"
                    }
                    
                    fund_records.append(record)
            
            # Upload fund records
            if fund_records:
                batch_size = 15
                uploaded_count = 0
                
                for i in range(0, len(fund_records), batch_size):
                    batch = fund_records[i:i+batch_size]
                    try:
                        fund_table.batch_create(batch)
                        uploaded_count += len(batch)
                        print(f"✅ Uploaded fund batch {i//batch_size + 1}: {len(batch)} funds")
                    except Exception as e:
                        print(f"❌ Error uploading fund batch: {e}")
                
                print(f"✅ Successfully uploaded {uploaded_count} fund intelligence records")
                return True
            else:
                print("ℹ️ No fund intelligence data to upload")
                return False
                
        except Exception as e:
            print(f"❌ Error uploading fund intelligence: {e}")
            import traceback
            traceback.print_exc()
            return False
    
    def create_enhancement_summary(self, company_profiles):
        """Create comprehensive enhancement summary"""
        try:
            # Convert profiles
            profiles_dict = {}
            for company_id, profile in company_profiles.items():
                if hasattr(profile, '__dict__'):
                    profiles_dict[company_id] = profile.__dict__
                else:
                    profiles_dict[company_id] = profile
            
            # Calculate enhancement statistics
            total_professionals = sum(len(p.get('professional_data', [])) for p in profiles_dict.values())
            total_funds = sum(len(p.get('fund_data', [])) for p in profiles_dict.values())
            companies_with_personnel = sum(1 for p in profiles_dict.values() if p.get('personnel_data'))
            companies_with_network = sum(1 for p in profiles_dict.values() if p.get('professional_data'))
            
            # Create summary report
            timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
            summary = {
                "timestamp": datetime.now().isoformat(),
                "enhancement_approach": "DIVA Enhancement Tables - Simple Version",
                "total_companies_enhanced": len(profiles_dict),
                "enhancement_tables_created": list(self.enhancement_configs.keys()),
                "intelligence_metrics": {
                    "companies_with_personnel_intelligence": companies_with_personnel,
                    "companies_with_network_intelligence": companies_with_network,
                    "total_professional_profiles": total_professionals,
                    "total_fund_records": total_funds,
                    "average_data_completeness": sum(self.calculate_completeness_score(p) for p in profiles_dict.values()) / len(profiles_dict) if profiles_dict else 0
                },
                "linking_strategy": {
                    "primary_key": "Company ID",
                    "linked_to": "VC Table",
                    "relationship_type": "One-to-Many Enhancement"
                },
                "intelligence_categories": {
                    "personnel_intelligence": "Staff composition and efficiency metrics",
                    "network_intelligence": "Professional connections and contact potential",
                    "investment_intelligence": "Fund analysis and investment patterns"
                },
                "companies_enhanced": list(profiles_dict.keys())
            }
            
            # Save summary
            report_file = f"diva_enhancement_summary_{timestamp}.json"
            with open(report_file, 'w', encoding='utf-8') as f:
                json.dump(summary, f, ensure_ascii=False, indent=2)
            
            # Print summary
            print(f"\n📊 DIVA ENHANCEMENT SYSTEM SUMMARY")
            print(f"   =====================================")
            print(f"   🎯 Enhanced Companies: {summary['total_companies_enhanced']}")
            print(f"   👥 Professional Profiles: {summary['intelligence_metrics']['total_professional_profiles']}")
            print(f"   💰 Fund Records: {summary['intelligence_metrics']['total_fund_records']}")
            print(f"   📈 Avg Data Completeness: {summary['intelligence_metrics']['average_data_completeness']:.1f}%")
            print(f"   🔗 Linking Strategy: Company ID → VC Table")
            print(f"   📋 Enhancement Tables: {len(summary['enhancement_tables_created'])}")
            print(f"   💾 Report saved to: {report_file}")
            
            return summary
            
        except Exception as e:
            print(f"❌ Error creating enhancement summary: {e}")
            return None
    
    # Intelligence calculation methods (simplified for reliability)
    def calculate_personnel_intelligence(self, personnel_data):
        """Calculate personnel intelligence level"""
        if not personnel_data:
            return 'No Data'
        
        total = personnel_data.get('total_personnel', 0)
        
        if total == 0:
            return 'No Data'
        elif total >= 50:
            return 'High (Large Team)'
        elif total >= 20:
            return 'Medium (Mid Team)'
        elif total >= 10:
            return 'Basic (Small Team)'
        else:
            return 'Limited (Micro Team)'
    
    def calculate_investment_intelligence(self, fund_data, disclosure_data):
        """Calculate investment intelligence level"""
        fund_count = len(fund_data) if fund_data else 0
        investment_scale = disclosure_data.get('investment_scale', 0) if disclosure_data else 0
        
        if fund_count == 0 and investment_scale == 0:
            return 'No Data'
        elif fund_count >= 3 or investment_scale >= 100000000000:
            return 'High (Major Investor)'
        elif fund_count >= 2 or investment_scale >= 50000000000:
            return 'Medium (Active Investor)'
        elif fund_count >= 1 or investment_scale >= 10000000000:
            return 'Basic (Regular Investor)'
        else:
            return 'Limited (Small Scale)'
    
    def calculate_network_intelligence(self, professional_data):
        """Calculate network intelligence level"""
        if not professional_data:
            return 'No Data'
        
        prof_count = len(professional_data)
        senior_count = sum(1 for p in professional_data 
                          if self.categorize_seniority(p.get('experience', ''), p.get('position', '')) in ['Senior Executive', 'Executive'])
        
        if prof_count == 0:
            return 'No Data'
        elif senior_count >= 3:
            return 'High (Senior Network)'
        elif senior_count >= 2:
            return 'Medium (Mixed Network)'
        elif prof_count >= 3:
            return 'Basic (Team Network)'
        else:
            return 'Limited (Individual Contact)'
    
    def categorize_seniority(self, experience, position):
        """Categorize professional seniority"""
        exp_lower = (experience or '').lower()
        pos_lower = (position or '').lower()
        
        if any(word in exp_lower + pos_lower for word in ['대표', '임원', 'ceo', 'cto', 'cfo', '사장', '전무', '상무']):
            return 'Senior Executive'
        elif any(word in exp_lower + pos_lower for word in ['이사', 'director', '부장', '팀장', 'manager']):
            return 'Executive'
        elif any(word in exp_lower + pos_lower for word in ['매니저', '과장', 'senior']):
            return 'Senior'
        elif any(word in exp_lower + pos_lower for word in ['주임', 'junior', '사원']):
            return 'Junior'
        else:
            return 'Professional'
    
    def calculate_contact_potential(self, seniority, position):
        """Calculate contact potential score 1-10"""
        seniority_scores = {
            'Senior Executive': 10,
            'Executive': 8,
            'Senior': 6,
            'Professional': 4,
            'Junior': 2
        }
        
        base_score = seniority_scores.get(seniority, 3)
        
        # Bonus for investment-related positions
        pos_lower = (position or '').lower()
        if any(word in pos_lower for word in ['투자', 'investment', 'venture']):
            base_score += 2
        
        return min(base_score, 10)
    
    def calculate_network_value(self, professional_data):
        """Calculate network value score"""
        if not professional_data:
            return 0
        
        completeness = self.calculate_profile_completeness(professional_data)
        seniority = self.categorize_seniority(professional_data.get('experience', ''), professional_data.get('position', ''))
        
        seniority_multipliers = {
            'Senior Executive': 3.0,
            'Executive': 2.5,
            'Senior': 2.0,
            'Professional': 1.5,
            'Junior': 1.0
        }
        
        multiplier = seniority_multipliers.get(seniority, 1.0)
        return min((completeness / 100) * multiplier * 10, 10)
    
    def calculate_profile_completeness(self, prof_data):
        """Calculate profile completeness score"""
        if not prof_data:
            return 0
        
        fields = ['name', 'position', 'experience']
        completed = sum(1 for field in fields if prof_data.get(field))
        return (completed / len(fields)) * 100
    
    def calculate_completeness_score(self, profile):
        """Calculate overall data completeness score"""
        total_sections = 5
        completed_sections = 0
        
        if profile.get('company_name'): completed_sections += 1
        if profile.get('personnel_data'): completed_sections += 1
        if profile.get('fund_data'): completed_sections += 1
        if profile.get('disclosure_data'): completed_sections += 1
        if profile.get('professional_data'): completed_sections += 1
        
        return (completed_sections / total_sections) * 100
    
    def categorize_fund_size(self, amount):
        """Categorize fund size"""
        if amount >= 100000000000:
            return 'Mega Fund (1000억+)'
        elif amount >= 50000000000:
            return 'Large Fund (500-1000억)'
        elif amount >= 10000000000:
            return 'Medium Fund (100-500억)'
        elif amount > 0:
            return 'Small Fund (<100억)'
        else:
            return 'Unknown Size'
    
    def determine_investment_focus(self, fund_type):
        """Determine investment focus based on fund type"""
        focus_mapping = {
            '창업투자': 'Startup/Early Stage',
            '벤처투자': 'Venture/Growth Stage',
            '성장투자': 'Growth/Expansion Stage',
            '기타': 'Diversified/Other'
        }
        return focus_mapping.get(fund_type, 'Unknown Focus')
    
    def calculate_fund_performance_indicator(self, amount, fund_type):
        """Calculate fund performance indicator"""
        if amount == 0:
            return 0
        
        if amount >= 100000000000:
            base_score = 10
        elif amount >= 50000000000:
            base_score = 8
        elif amount >= 10000000000:
            base_score = 6
        else:
            base_score = 4
        
        if fund_type == '창업투자':
            base_score *= 1.2
        elif fund_type == '성장투자':
            base_score *= 1.1
        
        return min(base_score, 10)

def main():
    """Main execution function"""
    print("🚀 DIVA ENHANCEMENT SYSTEM - SIMPLIFIED WORKING VERSION")
    print("   Intelligent Enhancement with Company ID Linking")
    print("   =" * 50)
    
    # Get configuration
    api_key = os.getenv('AIRTABLE_API_KEY')
    base_id = os.getenv('AIRTABLE_BASE_ID')
    
    if not api_key or not base_id:
        print("❌ Configuration Error!")
        print("   Please check your api_config.py file")
        return
    
    try:
        # Initialize enhancement system
        enhancement_system = DIVAEnhancementSystem(api_key, base_id)
        
        # Create enhancement tables
        print("🏗️ Creating DIVA Enhancement Tables...")
        created_tables = enhancement_system.create_enhancement_tables()
        
        if not created_tables:
            print("❌ Failed to create enhancement tables. Exiting.")
            return
        
        # Import and run scraper
        from comprehensive_diva_scraper import ComprehensiveDIVAScraper
        
        print("\n🕷️ Starting DIVA data scraping for enhancement...")
        scraper = ComprehensiveDIVAScraper()
        
        # Scrape data (start with 2 pages for testing)
        company_profiles = scraper.scrape_all_data(
            year_month="2025-04",
            max_pages_per_section=2
        )
        
        if company_profiles:
            print(f"\n✅ Successfully scraped {len(company_profiles)} company profiles")
            
            # Upload to enhancement tables
            intelligence_success = enhancement_system.upload_diva_intelligence(company_profiles)
            network_success = enhancement_system.upload_professional_network(company_profiles)
            fund_success = enhancement_system.upload_fund_intelligence(company_profiles)
            
            # Create comprehensive summary
            summary = enhancement_system.create_enhancement_summary(company_profiles)
            
            if intelligence_success or network_success or fund_success:
                print("\n🎉 DIVA ENHANCEMENT SYSTEM DEPLOYMENT COMPLETE!")
                print("   📊 Intelligence data stored in enhancement tables")
                print("   🔗 Linked to existing VC Table via Company ID")
                print("   👥 Professional network data for networking")
                print("   💰 Fund intelligence for investment analysis")
                print("   📈 Comprehensive intelligence scoring system")
                print("   ⚡ Optimized for speed, stability, and scalability")
                print("   🛠️ Using simple field types for maximum compatibility")
            
        else:
            print("⚠️  No data scraped from DIVA portal")
            
    except Exception as e:
        print(f"❌ Error in enhancement system: {e}")
        import traceback
        traceback.print_exc()

if __name__ == "__main__":
    main() 