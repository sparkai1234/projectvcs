#!/usr/bin/env python3
"""
Fuzzy Company Matcher for Airtable
Links VC Table, Fund Table, and Contacts Table through company names using fuzzy matching
"""

import requests
import json
from fuzzywuzzy import fuzz, process
from typing import Dict, List, Tuple, Optional
import time

class AirtableFuzzyMatcher:
    def __init__(self, api_key: str, base_id: str):
        self.api_key = api_key
        self.base_id = base_id
        self.base_url = f"https://api.airtable.com/v0/{base_id}"
        self.headers = {
            "Authorization": f"Bearer {api_key}",
            "Content-Type": "application/json"
        }
        
        # Company data storage
        self.vc_companies = {}      # {record_id: company_name}
        self.fund_companies = {}    # {record_id: company_name}
        self.contact_companies = {} # {record_id: company_name}
        
        # Matching results
        self.matches = []
        
    def fetch_table_data(self, table_name: str, company_field: str) -> Dict[str, str]:
        """Fetch company names from specified table"""
        print(f"📊 Fetching data from {table_name}...")
        
        url = f"{self.base_url}/{table_name}"
        all_records = {}
        offset = None
        
        while True:
            params = {"fields[]": company_field}
            if offset:
                params["offset"] = offset
                
            response = requests.get(url, headers=self.headers, params=params)
            
            if response.status_code != 200:
                print(f"❌ Error fetching {table_name}: {response.text}")
                break
                
            data = response.json()
            
            for record in data.get("records", []):
                company_name = record.get("fields", {}).get(company_field)
                if company_name:
                    all_records[record["id"]] = company_name.strip()
            
            offset = data.get("offset")
            if not offset:
                break
                
            time.sleep(0.2)  # Rate limiting
        
        print(f"✅ Found {len(all_records)} companies in {table_name}")
        return all_records
    
    def fuzzy_match_companies(self, threshold: int = 80) -> List[Dict]:
        """Perform fuzzy matching between company names"""
        print(f"🔍 Starting fuzzy matching (threshold: {threshold}%)...")
        
        matches = []
        
        # Get all unique company names from VC and Fund tables
        all_vc_fund_companies = {}
        
        # Add VC companies
        for record_id, company in self.vc_companies.items():
            if company not in all_vc_fund_companies:
                all_vc_fund_companies[company] = {"vc_records": [], "fund_records": []}
            all_vc_fund_companies[company]["vc_records"].append(record_id)
        
        # Add Fund companies
        for record_id, company in self.fund_companies.items():
            if company not in all_vc_fund_companies:
                all_vc_fund_companies[company] = {"vc_records": [], "fund_records": []}
            all_vc_fund_companies[company]["fund_records"].append(record_id)
        
        # Fuzzy match Contact companies against VC/Fund companies
        for contact_record_id, contact_company in self.contact_companies.items():
            # Find best matches in VC/Fund companies
            best_matches = process.extract(contact_company, list(all_vc_fund_companies.keys()), limit=3)
            
            for match_company, score in best_matches:
                if score >= threshold:
                    print(f"✨ Match found: '{contact_company}' → '{match_company}' ({score}%)")
                    
                    matches.append({
                        "contact_company": contact_company,
                        "matched_company": match_company,
                        "score": score,
                        "contact_record_id": contact_record_id,
                        "vc_records": all_vc_fund_companies[match_company]["vc_records"],
                        "fund_records": all_vc_fund_companies[match_company]["fund_records"]
                    })
                    break  # Take only the best match
        
        print(f"🎯 Found {len(matches)} fuzzy matches")
        return matches
    
    def create_relationship_report(self, matches: List[Dict]) -> str:
        """Create a detailed relationship report"""
        report = ["# 🏢 Company Relationship Analysis Report\n"]
        report.append(f"Generated: {time.strftime('%Y-%m-%d %H:%M:%S')}\n")
        report.append(f"Total Matches Found: {len(matches)}\n")
        
        # Group by matched company
        company_groups = {}
        for match in matches:
            company = match["matched_company"]
            if company not in company_groups:
                company_groups[company] = {
                    "vc_count": len(match["vc_records"]),
                    "fund_count": len(match["fund_records"]),
                    "contact_matches": []
                }
            
            company_groups[company]["contact_matches"].append({
                "contact_company": match["contact_company"],
                "score": match["score"],
                "contact_record_id": match["contact_record_id"]
            })
        
        report.append("## 📊 Company Overview\n")
        for company, data in company_groups.items():
            report.append(f"### {company}")
            report.append(f"- **VC Records**: {data['vc_count']}")
            report.append(f"- **Fund Records**: {data['fund_count']}")
            report.append(f"- **Contact Matches**: {len(data['contact_matches'])}")
            
            for contact in data["contact_matches"]:
                report.append(f"  - {contact['contact_company']} ({contact['score']}% match)")
            report.append("")
        
        return "\n".join(report)
    
    def run_analysis_with_config(self, config: Dict) -> Dict:
        """Run analysis using configuration settings"""
        print("🚀 Starting Company Relationship Analysis...")
        
        # Load data using config
        self.vc_companies = self.fetch_table_data(config["VC_TABLE"], config["VC_COMPANY_FIELD"])
        self.fund_companies = self.fetch_table_data(config["FUND_TABLE"], config["FUND_COMPANY_FIELD"])
        self.contact_companies = self.fetch_table_data(config["CONTACTS_TABLE"], config["CONTACTS_COMPANY_FIELD"])
        
        print(f"📈 Data Summary:")
        print(f"   VC Companies: {len(self.vc_companies)}")
        print(f"   Fund Companies: {len(self.fund_companies)}")
        print(f"   Contact Companies: {len(self.contact_companies)}")
        
        # Perform fuzzy matching with config threshold
        matches = self.fuzzy_match_companies(config["FUZZY_THRESHOLD"])
        
        # Generate report
        report = self.create_relationship_report(matches)
        
        # Save report
        with open("company_relationship_report.md", "w", encoding="utf-8") as f:
            f.write(report)
        
        results = {
            "matches": matches,
            "report": report,
            "stats": {
                "total_vc_companies": len(self.vc_companies),
                "total_fund_companies": len(self.fund_companies),
                "total_contact_companies": len(self.contact_companies),
                "total_matches": len(matches),
                "match_rate": len(matches) / len(self.contact_companies) * 100 if self.contact_companies else 0
            }
        }
        
        print("✅ Analysis complete!")
        return results


def main():
    """Main execution function"""
    # Configuration - UPDATE THESE VALUES
    API_KEY = "patOUfAsek4nbpvHm.49789ced0e2b0304bdc507f110d936277cd3da18ec3efc9347c93e6a1810919e"  # Replace this
    BASE_ID = "appdR8V9lJaRW8VkR"
    THRESHOLD = 80  # Fuzzy matching threshold (80% similarity)
    
    # Table configuration
    config = {
        "API_KEY": API_KEY,
        "BASE_ID": BASE_ID,
        "VC_TABLE": "VC Table",
        "FUND_TABLE": "Fund Table", 
        "CONTACTS_TABLE": "Contacts Full",  # Updated table name
        "VC_COMPANY_FIELD": "Company Name",
        "FUND_COMPANY_FIELD": "Company Name (Korean)",  # Updated field name
        "CONTACTS_COMPANY_FIELD": "회사",
        "FUZZY_THRESHOLD": THRESHOLD,
    }
    
    print("🔗 Airtable Company Fuzzy Matcher")
    print("=" * 50)
    
    # Validate API key
    if "..." in config["API_KEY"]:
        print("❌ Please update your API key in this script")
        print("   Replace 'patOUfAsek4nbpvHm.49789...' with your full API key")
        return
    
    # Initialize matcher
    matcher = AirtableFuzzyMatcher(API_KEY, BASE_ID)
    
    # Run analysis
    results = matcher.run_analysis_with_config(config)
    
    # Save detailed results
    with open("company_relationships.json", "w", encoding="utf-8") as f:
        json.dump(results, f, indent=2, ensure_ascii=False)
    
    # Print summary
    print("\n📋 SUMMARY")
    print("=" * 30)
    print(f"VC Companies: {results['stats']['total_vc_companies']}")
    print(f"Fund Companies: {results['stats']['total_fund_companies']}")
    print(f"Contact Companies: {results['stats']['total_contact_companies']}")
    print(f"Successful Matches: {results['stats']['total_matches']}")
    print(f"Match Rate: {results['stats']['match_rate']:.1f}%")
    
    print(f"\n📄 Reports saved:")
    print(f"- company_relationship_report.md")
    print(f"- company_relationships.json")


if __name__ == "__main__":
    main() 