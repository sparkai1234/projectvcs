#!/usr/bin/env python3
"""
DIVA to Supabase Integration
Uploads DIVA personnel data to Supabase and links with existing VC/Fund tables
Converted from Airtable version to work with Supabase
"""

import json
import logging
import os
from datetime import datetime
from typing import List, Dict, Optional
import pandas as pd
from diva_html_scraper import DIVAPersonnelScraper

# Supabase imports
try:
    from supabase import create_client, Client
    SUPABASE_AVAILABLE = True
except ImportError:
    print("⚠️  supabase-py not installed. Run: pip install supabase")
    SUPABASE_AVAILABLE = False

# Configure logging
logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')
logger = logging.getLogger(__name__)

class DIVASupabaseIntegrator:
    def __init__(self, supabase_url: str, supabase_key: str):
        if not SUPABASE_AVAILABLE:
            raise ImportError("supabase package is required")
        
        self.supabase_url = supabase_url
        self.supabase_key = supabase_key
        self.supabase: Client = create_client(supabase_url, supabase_key)
        
        logger.info("✅ Supabase client initialized")
        
    def upload_diva_intelligence(self, personnel_data: List[Dict]):
        """
        Upload DIVA personnel data to diva_intelligence table
        """
        if not personnel_data:
            logger.warning("No personnel data to upload")
            return []
        
        logger.info(f"📊 Uploading {len(personnel_data)} DIVA intelligence records to Supabase")
        
        # Prepare records for Supabase (matching diva_intelligence schema)
        supabase_records = []
        
        for record in personnel_data:
            # Create intelligence_data JSON with all the personnel metrics
            intelligence_data = {
                "total_personnel": record.get('total_personnel', 0),
                "professional_staff": record.get('professional_staff', 0),
                "investment_review_staff": record.get('investment_review_staff', 0),
                "management_staff": record.get('management_staff', 0),
                "reference_year_month": record.get('reference_year_month', ''),
                "page_number": record.get('page_number', 0),
                "row_index": record.get('row_index', 0),
                "extracted_at": record.get('extracted_at', ''),
                "source_url": record.get('source_url', ''),
                
                # Calculate ratios
                "professional_percentage": round((record.get('professional_staff', 0) / max(record.get('total_personnel', 1), 1)) * 100, 1),
                "investment_review_percentage": round((record.get('investment_review_staff', 0) / max(record.get('total_personnel', 1), 1)) * 100, 1),
                "management_percentage": round((record.get('management_staff', 0) / max(record.get('total_personnel', 1), 1)) * 100, 1),
            }
            
            # Create analysis_results with insights
            analysis_results = {
                "company_size_category": self._categorize_company_size(record.get('total_personnel', 0)),
                "professional_focus": "High" if intelligence_data["professional_percentage"] > 50 else "Medium" if intelligence_data["professional_percentage"] > 25 else "Low",
                "investment_capacity": "High" if record.get('investment_review_staff', 0) > 5 else "Medium" if record.get('investment_review_staff', 0) > 2 else "Low",
                "management_involvement": "High" if intelligence_data["management_percentage"] > 40 else "Medium" if intelligence_data["management_percentage"] > 20 else "Low",
            }
            
            supabase_record = {
                "company_id": record.get('company_id'),
                "company_name": record.get('company_name'),
                "intelligence_data": intelligence_data,
                "analysis_results": analysis_results,
                "scrape_date": datetime.now().date().isoformat(),
                "data_quality_score": self._calculate_data_quality_score(record),
                "created_at": datetime.now().isoformat(),
                "updated_at": datetime.now().isoformat()
            }
            
            supabase_records.append(supabase_record)
        
        # Upload to Supabase (upsert to handle duplicates)
        try:
            result = self.supabase.table('diva_intelligence').upsert(
                supabase_records,
                on_conflict='company_id'
            ).execute()
            
            logger.info(f"✅ Successfully uploaded {len(result.data)} DIVA intelligence records")
            return result.data
            
        except Exception as e:
            logger.error(f"❌ Error uploading to Supabase: {e}")
            return []
    
    def _categorize_company_size(self, total_personnel: int) -> str:
        """Categorize company by size"""
        if total_personnel >= 20:
            return "Large"
        elif total_personnel >= 10:
            return "Medium"
        elif total_personnel >= 5:
            return "Small"
        else:
            return "Micro"
    
    def _calculate_data_quality_score(self, record: Dict) -> float:
        """Calculate data quality score based on completeness"""
        score = 0.0
        max_score = 7.0
        
        # Check for required fields
        if record.get('company_name'): score += 1.0
        if record.get('company_id'): score += 1.0
        if record.get('total_personnel', 0) > 0: score += 1.0
        if record.get('professional_staff', 0) > 0: score += 1.0
        if record.get('investment_review_staff', 0) > 0: score += 1.0
        if record.get('management_staff', 0) > 0: score += 1.0
        if record.get('reference_year_month'): score += 1.0
        
        return round((score / max_score) * 100, 1)
    
    def link_with_existing_vc_data(self):
        """
        Link DIVA intelligence data with existing VC companies
        """
        logger.info("🔗 Linking DIVA intelligence with existing VC companies")
        
        try:
            # Get all DIVA intelligence records
            diva_response = self.supabase.table('diva_intelligence').select('*').execute()
            diva_records = diva_response.data
            
            # Get all VC companies
            vc_response = self.supabase.table('vc_table').select('company_id, company_name').execute()
            vc_records = vc_response.data
            
            # Create mapping dict for faster lookup
            vc_mapping = {vc['company_id']: vc for vc in vc_records}
            
            linked_count = 0
            
            for diva_record in diva_records:
                company_id = diva_record.get('company_id')
                
                if company_id and company_id in vc_mapping:
                    # Found exact match - this company exists in both DIVA and VC data
                    logger.info(f"✅ Linked: {diva_record['company_name']} ({company_id})")
                    linked_count += 1
                else:
                    # Try fuzzy matching by company name
                    fuzzy_match = self._fuzzy_match_company(diva_record['company_name'], vc_records)
                    if fuzzy_match:
                        logger.info(f"🔍 Fuzzy linked: {diva_record['company_name']} → {fuzzy_match['company_name']}")
                        linked_count += 1
            
            logger.info(f"🎯 Successfully linked {linked_count}/{len(diva_records)} DIVA companies with VC data")
            return linked_count
            
        except Exception as e:
            logger.error(f"❌ Error linking DIVA data with VC companies: {e}")
            return 0
    
    def _fuzzy_match_company(self, target_company: str, vc_records: List[Dict]) -> Optional[Dict]:
        """
        Fuzzy match company names between DIVA and VC data
        """
        import difflib
        
        # Simple fuzzy matching using sequence matching
        best_match = None
        best_ratio = 0.8  # Minimum threshold
        
        for vc_record in vc_records:
            vc_name = vc_record.get('company_name', '')
            ratio = difflib.SequenceMatcher(None, target_company.lower(), vc_name.lower()).ratio()
            
            if ratio > best_ratio:
                best_ratio = ratio
                best_match = vc_record
        
        return best_match
    
    def upload_professional_network_data(self, personnel_data: List[Dict]):
        """
        Upload data to diva_professional_network table for networking analysis
        """
        logger.info(f"👥 Uploading professional network data for {len(personnel_data)} companies")
        
        network_records = []
        
        for record in personnel_data:
            # Create professional network data
            professional_data = {
                "total_professionals": record.get('professional_staff', 0),
                "investment_professionals": record.get('investment_review_staff', 0),
                "management_professionals": record.get('management_staff', 0),
                "company_size": record.get('total_personnel', 0),
                "professional_density": round((record.get('professional_staff', 0) / max(record.get('total_personnel', 1), 1)), 3),
                "reference_period": record.get('reference_year_month', ''),
            }
            
            # Network analysis insights
            network_analysis = {
                "networking_potential": "High" if record.get('professional_staff', 0) > 5 else "Medium" if record.get('professional_staff', 0) > 2 else "Low",
                "investment_team_size": self._categorize_team_size(record.get('investment_review_staff', 0)),
                "management_ratio": round((record.get('management_staff', 0) / max(record.get('total_personnel', 1), 1)) * 100, 1),
                "professional_specialization": self._analyze_professional_mix(record),
            }
            
            network_record = {
                "company_id": record.get('company_id'),
                "company_name": record.get('company_name'),
                "professional_data": professional_data,
                "network_analysis": network_analysis,
                "scrape_date": datetime.now().date().isoformat(),
                "created_at": datetime.now().isoformat(),
                "updated_at": datetime.now().isoformat()
            }
            
            network_records.append(network_record)
        
        try:
            result = self.supabase.table('diva_professional_network').upsert(
                network_records,
                on_conflict='company_id'
            ).execute()
            
            logger.info(f"✅ Successfully uploaded {len(result.data)} professional network records")
            return result.data
            
        except Exception as e:
            logger.error(f"❌ Error uploading professional network data: {e}")
            return []
    
    def _categorize_team_size(self, investment_staff: int) -> str:
        """Categorize investment team size"""
        if investment_staff >= 10:
            return "Large Team"
        elif investment_staff >= 5:
            return "Medium Team"
        elif investment_staff >= 2:
            return "Small Team"
        else:
            return "Solo/Minimal"
    
    def _analyze_professional_mix(self, record: Dict) -> str:
        """Analyze the professional staff composition"""
        total = record.get('total_personnel', 1)
        professional = record.get('professional_staff', 0)
        investment = record.get('investment_review_staff', 0)
        management = record.get('management_staff', 0)
        
        prof_ratio = professional / total
        inv_ratio = investment / total
        mgmt_ratio = management / total
        
        if prof_ratio > 0.6:
            return "Professional-Heavy"
        elif inv_ratio > 0.5:
            return "Investment-Focused"
        elif mgmt_ratio > 0.4:
            return "Management-Heavy"
        else:
            return "Balanced"
    
    def generate_summary_report(self):
        """
        Generate comprehensive summary report of DIVA data in Supabase
        """
        logger.info("📊 Generating DIVA summary report from Supabase data")
        
        try:
            # Get all DIVA intelligence data
            response = self.supabase.table('diva_intelligence').select('*').execute()
            records = response.data
            
            if not records:
                logger.warning("No DIVA data found in Supabase")
                return
            
            # Calculate statistics
            total_companies = len(records)
            total_personnel = sum(record['intelligence_data'].get('total_personnel', 0) for record in records)
            avg_company_size = round(total_personnel / total_companies, 1) if total_companies > 0 else 0
            
            # Find largest company
            largest_company = max(records, key=lambda x: x['intelligence_data'].get('total_personnel', 0))
            
            # Professional staff statistics
            total_professionals = sum(record['intelligence_data'].get('professional_staff', 0) for record in records)
            avg_professional_ratio = round(
                sum(record['intelligence_data'].get('professional_percentage', 0) for record in records) / total_companies, 1
            ) if total_companies > 0 else 0
            
            # Generate report
            report = f"""
📊 DIVA INTELLIGENCE SUMMARY REPORT (Supabase)
==============================================
📈 Overall Statistics:
   • Total Companies: {total_companies}
   • Total Personnel: {total_personnel:,}
   • Average Company Size: {avg_company_size}
   • Largest Company: {largest_company['company_name']} ({largest_company['intelligence_data'].get('total_personnel', 0)} staff)

👥 Professional Staff Analysis:
   • Total Professional Staff: {total_professionals:,}
   • Average Professional Ratio: {avg_professional_ratio}%
   • Companies with >50% Professionals: {sum(1 for r in records if r['intelligence_data'].get('professional_percentage', 0) > 50)}

📊 Company Size Distribution:
   • Large (20+ staff): {sum(1 for r in records if r['analysis_results'].get('company_size_category') == 'Large')}
   • Medium (10-19 staff): {sum(1 for r in records if r['analysis_results'].get('company_size_category') == 'Medium')}
   • Small (5-9 staff): {sum(1 for r in records if r['analysis_results'].get('company_size_category') == 'Small')}
   • Micro (<5 staff): {sum(1 for r in records if r['analysis_results'].get('company_size_category') == 'Micro')}

🎯 Investment Capacity:
   • High Capacity Companies: {sum(1 for r in records if r['analysis_results'].get('investment_capacity') == 'High')}
   • Medium Capacity Companies: {sum(1 for r in records if r['analysis_results'].get('investment_capacity') == 'Medium')}
   • Low Capacity Companies: {sum(1 for r in records if r['analysis_results'].get('investment_capacity') == 'Low')}

📅 Data Quality:
   • Average Data Quality Score: {round(sum(record.get('data_quality_score', 0) for record in records) / total_companies, 1)}%
   • Last Updated: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}
"""
            
            print(report)
            
            # Save report to file
            report_filename = f"diva_supabase_report_{datetime.now().strftime('%Y%m%d_%H%M%S')}.txt"
            with open(report_filename, 'w', encoding='utf-8') as f:
                f.write(report)
            
            logger.info(f"📋 Report saved to {report_filename}")
            return report
            
        except Exception as e:
            logger.error(f"❌ Error generating summary report: {e}")
            return None

def main():
    """
    Main function to run DIVA to Supabase integration
    """
    print("🚀 DIVA to Supabase Integration")
    print("================================")
    
    # Get environment variables
    supabase_url = os.getenv('SUPABASE_URL')
    supabase_key = os.getenv('SUPABASE_KEY')
    
    if not supabase_url or not supabase_key:
        print("❌ Missing Supabase credentials!")
        print("Please set SUPABASE_URL and SUPABASE_KEY environment variables")
        return
    
    try:
        # Initialize DIVA scraper
        print("📊 Initializing DIVA scraper...")
        scraper = DIVAPersonnelScraper()
        
        # Scrape data from DIVA portal
        print("🌐 Scraping DIVA portal for personnel data...")
        personnel_data = scraper.scrape_all_pages(
            year_month="2025-04",
            max_pages=None,  # Scrape all pages
            delay=2
        )
        
        if not personnel_data:
            print("❌ No data scraped from DIVA portal")
            return
        
        print(f"✅ Scraped {len(personnel_data)} company records")
        
        # Initialize Supabase integrator
        print("🗄️ Initializing Supabase integration...")
        integrator = DIVASupabaseIntegrator(supabase_url, supabase_key)
        
        # Upload to diva_intelligence table
        print("📤 Uploading to diva_intelligence table...")
        intelligence_result = integrator.upload_diva_intelligence(personnel_data)
        
        # Upload to diva_professional_network table
        print("👥 Uploading to diva_professional_network table...")
        network_result = integrator.upload_professional_network_data(personnel_data)
        
        # Link with existing VC data
        print("🔗 Linking with existing VC company data...")
        linked_count = integrator.link_with_existing_vc_data()
        
        # Generate summary report
        print("📊 Generating summary report...")
        report = integrator.generate_summary_report()
        
        print(f"""
✅ DIVA TO SUPABASE INTEGRATION COMPLETED!
==========================================
📊 Intelligence Records: {len(intelligence_result)}
👥 Professional Network Records: {len(network_result)}  
🔗 Linked with VC Companies: {linked_count}
📋 Summary Report: Generated
🎯 Ready for analysis and insights!
        """)
        
    except Exception as e:
        logger.error(f"❌ Integration failed: {e}")
        print(f"❌ Error: {e}")

if __name__ == "__main__":
    main() 