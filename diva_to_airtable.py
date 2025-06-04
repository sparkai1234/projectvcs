#!/usr/bin/env python3
"""
DIVA to Airtable Integration
Uploads DIVA personnel data to Airtable and links with existing VC/Fund tables
"""

import json
import logging
from datetime import datetime
from typing import List, Dict, Optional
import pandas as pd
from diva_html_scraper import DIVAPersonnelScraper
import os

# Airtable imports
try:
    from pyairtable import Api, Table
    AIRTABLE_AVAILABLE = True
except ImportError:
    print("⚠️  pyairtable not installed. Run: pip install pyairtable")
    AIRTABLE_AVAILABLE = False

# Configure logging
logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')
logger = logging.getLogger(__name__)

class DIVAAirtableIntegrator:
    def __init__(self, api_key: str, base_id: str):
        if not AIRTABLE_AVAILABLE:
            raise ImportError("pyairtable package is required")
        
        self.api_key = api_key
        self.base_id = base_id
        self.api = Api(api_key)
        self.base = self.api.base(base_id)
        
        # Table references
        self.personnel_table = None
        self.vc_table = None
        self.fund_table = None
        
    def setup_tables(self):
        """
        Set up or create necessary Airtable tables
        """
        try:
            # Try to access existing tables
            self.vc_table = self.base.table("VC Table")
            self.fund_table = self.base.table("Fund Table")
            
            # Try to access personnel table, create if doesn't exist
            try:
                self.personnel_table = self.base.table("Personnel Data")
                logger.info("Found existing Personnel Data table")
            except Exception:
                logger.info("Personnel Data table not found, will create it")
                
        except Exception as e:
            logger.error(f"Error setting up tables: {e}")
            raise
    
    def create_personnel_table_schema(self):
        """
        Define the schema for the Personnel Data table
        """
        return {
            "fields": [
                {
                    "name": "Company Name",
                    "type": "singleLineText"
                },
                {
                    "name": "Company ID",
                    "type": "singleLineText"
                },
                {
                    "name": "Total Personnel",
                    "type": "number",
                    "options": {"precision": 0}
                },
                {
                    "name": "Professional Staff",
                    "type": "number", 
                    "options": {"precision": 0}
                },
                {
                    "name": "Investment Review Staff",
                    "type": "number",
                    "options": {"precision": 0}
                },
                {
                    "name": "Management Staff", 
                    "type": "number",
                    "options": {"precision": 0}
                },
                {
                    "name": "Reference Year Month",
                    "type": "singleLineText"
                },
                {
                    "name": "Professional Percentage",
                    "type": "formula",
                    "options": {
                        "formula": "IF({Total Personnel} > 0, ROUND(({Professional Staff} / {Total Personnel}) * 100, 1), 0)"
                    }
                },
                {
                    "name": "Investment Review Percentage", 
                    "type": "formula",
                    "options": {
                        "formula": "IF({Total Personnel} > 0, ROUND(({Investment Review Staff} / {Total Personnel}) * 100, 1), 0)"
                    }
                },
                {
                    "name": "Management Percentage",
                    "type": "formula", 
                    "options": {
                        "formula": "IF({Total Personnel} > 0, ROUND(({Management Staff} / {Total Personnel}) * 100, 1), 0)"
                    }
                },
                {
                    "name": "Linked VC Companies",
                    "type": "multipleRecordLinks",
                    "options": {
                        "linkedTableId": "VC Table"
                    }
                },
                {
                    "name": "Data Source",
                    "type": "singleLineText"
                },
                {
                    "name": "Last Updated",
                    "type": "dateTime"
                },
                {
                    "name": "DIVA URL",
                    "type": "url"
                }
            ]
        }
    
    def upload_personnel_data(self, personnel_data: List[Dict]):
        """
        Upload personnel data to Airtable
        """
        if not personnel_data:
            logger.warning("No personnel data to upload")
            return []
        
        logger.info(f"Uploading {len(personnel_data)} personnel records to Airtable")
        
        # Prepare records for upload
        airtable_records = []
        
        for record in personnel_data:
            airtable_record = {
                "Company Name": record.get('company_name', ''),
                "Company ID": record.get('company_id', ''),
                "Total Personnel": record.get('total_personnel', 0),
                "Professional Staff": record.get('professional_staff', 0),
                "Investment Review Staff": record.get('investment_review_staff', 0),
                "Management Staff": record.get('management_staff', 0),
                "Reference Year Month": record.get('reference_year_month', ''),
                "Data Source": "DIVA Portal",
                "Last Updated": datetime.now().isoformat(),
                "DIVA URL": record.get('source_url', '')
            }
            airtable_records.append({"fields": airtable_record})
        
        # Upload in batches (Airtable limit is 10 records per batch)
        uploaded_records = []
        batch_size = 10
        
        for i in range(0, len(airtable_records), batch_size):
            batch = airtable_records[i:i + batch_size]
            try:
                if self.personnel_table:
                    response = self.personnel_table.batch_create(batch)
                    uploaded_records.extend(response)
                    logger.info(f"Uploaded batch {i//batch_size + 1}: {len(batch)} records")
                else:
                    logger.error("Personnel table not available")
                    
            except Exception as e:
                logger.error(f"Error uploading batch {i//batch_size + 1}: {e}")
                continue
        
        logger.info(f"Successfully uploaded {len(uploaded_records)} personnel records")
        return uploaded_records
    
    def link_with_existing_data(self):
        """
        Link personnel data with existing VC and Fund tables
        """
        logger.info("Linking personnel data with existing VC companies")
        
        try:
            # Get all personnel records
            personnel_records = self.personnel_table.all()
            
            # Get all VC companies
            vc_records = self.vc_table.all()
            
            # Create company name mapping
            vc_mapping = {}
            for vc_record in vc_records:
                company_name = vc_record['fields'].get('Company Name', '').strip()
                if company_name:
                    vc_mapping[company_name.lower()] = vc_record['id']
            
            # Link records
            linked_count = 0
            for personnel_record in personnel_records:
                personnel_company = personnel_record['fields'].get('Company Name', '').strip().lower()
                
                # Try exact match first
                if personnel_company in vc_mapping:
                    vc_id = vc_mapping[personnel_company]
                    
                    # Update personnel record with link
                    self.personnel_table.update(
                        personnel_record['id'],
                        {"Linked VC Companies": [vc_id]}
                    )
                    linked_count += 1
                    logger.debug(f"Linked {personnel_company} to VC record")
                else:
                    # Try fuzzy matching
                    match_id = self._fuzzy_match_company(personnel_company, vc_mapping)
                    if match_id:
                        self.personnel_table.update(
                            personnel_record['id'],
                            {"Linked VC Companies": [match_id]}
                        )
                        linked_count += 1
            
            logger.info(f"Successfully linked {linked_count} personnel records to VC companies")
            
        except Exception as e:
            logger.error(f"Error linking data: {e}")
    
    def _fuzzy_match_company(self, target_company: str, vc_mapping: Dict) -> Optional[str]:
        """
        Attempt fuzzy matching for company names
        """
        try:
            from difflib import SequenceMatcher
            
            best_match = None
            best_score = 0.8  # Minimum similarity threshold
            
            for vc_company, vc_id in vc_mapping.items():
                similarity = SequenceMatcher(None, target_company, vc_company).ratio()
                
                if similarity > best_score:
                    best_score = similarity
                    best_match = vc_id
            
            return best_match
            
        except Exception as e:
            logger.warning(f"Error in fuzzy matching: {e}")
            return None
    
    def generate_summary_report(self):
        """
        Generate a summary report of the uploaded data
        """
        try:
            personnel_records = self.personnel_table.all()
            
            if not personnel_records:
                return "No personnel data found"
            
            # Convert to DataFrame for analysis
            data = []
            for record in personnel_records:
                fields = record['fields']
                data.append({
                    'company_name': fields.get('Company Name', ''),
                    'total_personnel': fields.get('Total Personnel', 0),
                    'professional_staff': fields.get('Professional Staff', 0),
                    'investment_review': fields.get('Investment Review Staff', 0),
                    'management_staff': fields.get('Management Staff', 0),
                    'has_vc_link': bool(fields.get('Linked VC Companies'))
                })
            
            df = pd.DataFrame(data)
            
            report = f"""
📊 DIVA PERSONNEL DATA SUMMARY REPORT
=====================================
📅 Generated: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}

📈 Overall Statistics:
   • Total Companies: {len(df)}
   • Total Personnel: {df['total_personnel'].sum():,}
   • Average Company Size: {df['total_personnel'].mean():.1f}
   • Linked to VC Records: {df['has_vc_link'].sum()} ({df['has_vc_link'].mean()*100:.1f}%)

🏢 Top Companies by Size:
{df.nlargest(5, 'total_personnel')[['company_name', 'total_personnel']].to_string(index=False)}

👥 Professional Staff Analysis:
   • Total Professional Staff: {df['professional_staff'].sum():,}
   • Average Professional Ratio: {(df['professional_staff'].sum() / df['total_personnel'].sum() * 100):.1f}%

💼 Investment Review Staff:
   • Total Investment Review Staff: {df['investment_review'].sum():,}
   • Average Investment Review Ratio: {(df['investment_review'].sum() / df['total_personnel'].sum() * 100):.1f}%

🔧 Management Staff:
   • Total Management Staff: {df['management_staff'].sum():,}
   • Average Management Ratio: {(df['management_staff'].sum() / df['total_personnel'].sum() * 100):.1f}%
"""
            
            return report
            
        except Exception as e:
            logger.error(f"Error generating summary report: {e}")
            return f"Error generating report: {e}"

def main():
    """
    Main execution function
    """
    # Configuration - Update these with your actual values
    AIRTABLE_API_KEY = os.getenv('AIRTABLE_API_KEY', 'your_api_key_here')
    AIRTABLE_BASE_ID = os.getenv('AIRTABLE_BASE_ID', 'appdR8V9lJaRW8VkR')
    
    if AIRTABLE_API_KEY == 'your_api_key_here':
        logger.error("Please set your AIRTABLE_API_KEY environment variable")
        return
    
    try:
        logger.info("🚀 Starting DIVA to Airtable Integration")
        
        # Step 1: Scrape DIVA data
        scraper = DIVAPersonnelScraper()
        personnel_data = scraper.scrape_all_pages(
            year_month="2025-04",
            max_pages=10,  # Increase for full scrape
            delay=2
        )
        
        if not personnel_data:
            logger.error("No data scraped from DIVA")
            return
        
        # Step 2: Set up Airtable integration
        integrator = DIVAAirtableIntegrator(AIRTABLE_API_KEY, AIRTABLE_BASE_ID)
        integrator.setup_tables()
        
        # Step 3: Upload personnel data
        uploaded_records = integrator.upload_personnel_data(personnel_data)
        
        # Step 4: Link with existing VC data
        integrator.link_with_existing_data()
        
        # Step 5: Generate summary report
        report = integrator.generate_summary_report()
        print(report)
        
        # Save report to file
        with open(f"diva_integration_report_{datetime.now().strftime('%Y%m%d_%H%M%S')}.txt", 'w', encoding='utf-8') as f:
            f.write(report)
        
        logger.info("✅ DIVA to Airtable integration completed successfully!")
        
    except Exception as e:
        logger.error(f"Integration failed: {e}")
        raise

if __name__ == "__main__":
    main() 