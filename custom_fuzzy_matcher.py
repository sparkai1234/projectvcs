#!/usr/bin/env python3
"""
Custom Fuzzy Matcher for Korean Company Names
Matches "회사" fields with VC table company_name fields (linked to company_id)
at 85% threshold and generates contacts_matched list
"""

import requests
import json
from fuzzywuzzy import fuzz, process
from typing import Dict, List, Tuple, Optional
import time
import csv
from api_config import get_config

class KoreanCompanyMatcher:
    def __init__(self, api_key: str, base_id: str):
        self.api_key = api_key
        self.base_id = base_id
        self.base_url = f"https://api.airtable.com/v0/{base_id}"
        self.headers = {
            "Authorization": f"Bearer {api_key}",
            "Content-Type": "application/json"
        }
        
        # Data storage
        self.vc_companies = {}      # {record_id: {"company_name": "name", "company_id": "id"}}
        self.contacts = {}          # {record_id: {"회사": "company", "name": "person_name", ...}}
        self.matches = []
        
    def fetch_vc_companies(self) -> Dict[str, Dict]:
        """Fetch VC companies with company_name and company_id fields"""
        print("📊 Fetching VC companies data...")
        
        url = f"{self.base_url}/VC Table"
        all_records = {}
        offset = None
        
        while True:
            params = {"fields[]": ["Company Name", "Company ID"]}
            if offset:
                params["offset"] = offset
                
            response = requests.get(url, headers=self.headers, params=params)
            
            if response.status_code != 200:
                print(f"❌ Error fetching VC Table: {response.text}")
                break
                
            data = response.json()
            
            for record in data.get("records", []):
                fields = record.get("fields", {})
                company_name = fields.get("Company Name")
                company_id = fields.get("Company ID")
                
                if company_name:  # Company ID can be optional
                    all_records[record["id"]] = {
                        "company_name": company_name.strip(),
                        "company_id": company_id if company_id else record["id"]
                    }
            
            offset = data.get("offset")
            if not offset:
                break
                
            time.sleep(0.2)  # Rate limiting
        
        print(f"✅ Found {len(all_records)} VC companies")
        return all_records
    
    def fetch_contacts(self) -> Dict[str, Dict]:
        """Fetch contacts with 회사 field and other contact info"""
        print("📊 Fetching contacts data...")
        
        url = f"{self.base_url}/Contacts Full"
        all_records = {}
        offset = None
        
        while True:
            # Fetch all fields - we'll filter later
            params = {}
            if offset:
                params["offset"] = offset
                
            response = requests.get(url, headers=self.headers, params=params)
            
            if response.status_code != 200:
                print(f"❌ Error fetching Contacts: {response.text}")
                break
                
            data = response.json()
            
            for record in data.get("records", []):
                fields = record.get("fields", {})
                company_field = fields.get("회사")  # Korean company field
                
                if company_field:
                    all_records[record["id"]] = {
                        "회사": company_field.strip(),
                        "name": fields.get("Name", "Unknown"),
                        "email": fields.get("Email", ""),
                        "phone": fields.get("Phone", ""),
                        "position": fields.get("Position", ""),
                        "record_id": record["id"]
                    }
            
            offset = data.get("offset")
            if not offset:
                break
                
            time.sleep(0.2)  # Rate limiting
        
        print(f"✅ Found {len(all_records)} contacts with company info")
        return all_records
    
    def fuzzy_match_companies(self, threshold: int = 85) -> List[Dict]:
        """Perform fuzzy matching at specified threshold"""
        print(f"🔍 Starting fuzzy matching (threshold: {threshold}%)...")
        
        matches = []
        vc_company_names = {record_id: data["company_name"] 
                           for record_id, data in self.vc_companies.items()}
        
        # Create reverse lookup for company names to record IDs
        name_to_vc_record = {}
        for record_id, data in self.vc_companies.items():
            company_name = data["company_name"]
            if company_name not in name_to_vc_record:
                name_to_vc_record[company_name] = []
            name_to_vc_record[company_name].append({
                "record_id": record_id,
                "company_id": data["company_id"]
            })
        
        # Match each contact's company against VC companies
        for contact_record_id, contact_data in self.contacts.items():
            contact_company = contact_data["회사"]
            
            # Find best match in VC companies
            best_matches = process.extract(contact_company, 
                                         list(vc_company_names.values()), 
                                         limit=1)
            
            if best_matches and best_matches[0][1] >= threshold:
                matched_company_name = best_matches[0][0]
                score = best_matches[0][1]
                
                # Get VC record info for this company
                vc_records = name_to_vc_record.get(matched_company_name, [])
                
                for vc_info in vc_records:
                    match = {
                        "contact_record_id": contact_record_id,
                        "contact_company": contact_company,
                        "contact_name": contact_data["name"],
                        "contact_email": contact_data["email"],
                        "contact_phone": contact_data["phone"],
                        "contact_position": contact_data["position"],
                        "matched_company_name": matched_company_name,
                        "vc_record_id": vc_info["record_id"],
                        "company_id": vc_info["company_id"],
                        "match_score": score
                    }
                    matches.append(match)
                    
                    print(f"✨ Match: '{contact_company}' → '{matched_company_name}' ({score}%) | {contact_data['name']}")
        
        print(f"🎯 Found {len(matches)} matches at {threshold}% threshold")
        return matches
    
    def generate_contacts_matched_list(self, matches: List[Dict]) -> List[Dict]:
        """Generate the final contacts_matched list"""
        contacts_matched = []
        
        for match in matches:
            contact_entry = {
                "contact_name": match["contact_name"],
                "contact_email": match["contact_email"],
                "contact_phone": match["contact_phone"],
                "contact_position": match["contact_position"],
                "original_company_name": match["contact_company"],
                "matched_company_name": match["matched_company_name"],
                "company_id": match["company_id"],
                "vc_record_id": match["vc_record_id"],
                "match_score": match["match_score"],
                "contact_record_id": match["contact_record_id"]
            }
            contacts_matched.append(contact_entry)
        
        return contacts_matched
    
    def save_results(self, contacts_matched: List[Dict], matches: List[Dict]):
        """Save results to files"""
        
        # Save contacts_matched as JSON
        with open("contacts_matched.json", "w", encoding="utf-8") as f:
            json.dump(contacts_matched, f, indent=2, ensure_ascii=False)
        
        # Save contacts_matched as CSV
        if contacts_matched:
            with open("contacts_matched.csv", "w", newline="", encoding="utf-8-sig") as f:
                writer = csv.DictWriter(f, fieldnames=contacts_matched[0].keys())
                writer.writeheader()
                writer.writerows(contacts_matched)
        
        # Save detailed matches as JSON
        with open("detailed_matches.json", "w", encoding="utf-8") as f:
            json.dump(matches, f, indent=2, ensure_ascii=False)
        
        print(f"💾 Results saved:")
        print(f"   📄 contacts_matched.json ({len(contacts_matched)} contacts)")
        print(f"   📄 contacts_matched.csv (Excel-compatible)")
        print(f"   📄 detailed_matches.json (full match data)")
    
    def create_summary_report(self, contacts_matched: List[Dict], matches: List[Dict]) -> str:
        """Create summary report"""
        report = ["# 🔗 Korean Company Matching Results\n"]
        report.append(f"**Generated:** {time.strftime('%Y-%m-%d %H:%M:%S')}\n")
        report.append(f"**Threshold:** 85%\n")
        report.append(f"**Total Matches:** {len(contacts_matched)}\n\n")
        
        # Statistics
        total_contacts = len(self.contacts)
        total_vc_companies = len(self.vc_companies)
        match_rate = (len(contacts_matched) / total_contacts * 100) if total_contacts > 0 else 0
        
        report.append("## 📊 Statistics\n")
        report.append(f"- **Total Contacts:** {total_contacts}")
        report.append(f"- **Total VC Companies:** {total_vc_companies}")
        report.append(f"- **Successful Matches:** {len(contacts_matched)}")
        report.append(f"- **Match Rate:** {match_rate:.1f}%\n")
        
        # Group by company
        company_groups = {}
        for contact in contacts_matched:
            company = contact["matched_company_name"]
            if company not in company_groups:
                company_groups[company] = []
            company_groups[company].append(contact)
        
        report.append("## 🏢 Matches by Company\n")
        for company, contacts in company_groups.items():
            report.append(f"### {company} ({len(contacts)} contacts)")
            for contact in contacts:
                score = contact["match_score"]
                name = contact["contact_name"]
                position = contact.get("contact_position", "")
                report.append(f"- **{name}** ({position}) - {score}% match")
            report.append("")
        
        return "\n".join(report)
    
    def run_matching(self) -> Dict:
        """Run the complete matching process"""
        print("🚀 Starting Korean Company Matching Process...")
        print("="*60)
        
        # Load data
        self.vc_companies = self.fetch_vc_companies()
        self.contacts = self.fetch_contacts()
        
        print(f"\n📈 Data loaded:")
        print(f"   VC Companies: {len(self.vc_companies)}")
        print(f"   Contacts: {len(self.contacts)}")
        
        # Perform matching at 85% threshold
        matches = self.fuzzy_match_companies(threshold=85)
        
        # Generate contacts_matched list
        contacts_matched = self.generate_contacts_matched_list(matches)
        
        # Create report
        report = self.create_summary_report(contacts_matched, matches)
        
        # Save all results
        self.save_results(contacts_matched, matches)
        
        # Save report
        with open("matching_report.md", "w", encoding="utf-8") as f:
            f.write(report)
        
        print(f"\n✅ Matching complete!")
        print(f"📄 Report saved: matching_report.md")
        
        return {
            "contacts_matched": contacts_matched,
            "matches": matches,
            "report": report,
            "stats": {
                "total_contacts": len(self.contacts),
                "total_vc_companies": len(self.vc_companies),
                "matched_contacts": len(contacts_matched),
                "match_rate": len(contacts_matched) / len(self.contacts) * 100 if self.contacts else 0
            }
        }


def main():
    """Main execution function"""
    print("🔗 Korean Company Fuzzy Matcher (85% threshold)")
    print("="*60)
    print("Matching '회사' fields with VC Table company_name fields")
    print()
    
    # Get configuration
    config = get_config()
    
    if not config['airtable_api_key'] or not config['airtable_base_id']:
        print("❌ Missing Airtable configuration!")
        print("Please check your api_config.py file")
        return
    
    # Initialize matcher
    matcher = KoreanCompanyMatcher(
        config['airtable_api_key'], 
        config['airtable_base_id']
    )
    
    # Run matching process
    results = matcher.run_matching()
    
    # Print final summary
    print("\n" + "="*60)
    print("📋 FINAL SUMMARY")
    print("="*60)
    stats = results['stats']
    print(f"📊 Total Contacts: {stats['total_contacts']}")
    print(f"🏢 Total VC Companies: {stats['total_vc_companies']}")
    print(f"🎯 Matched Contacts: {stats['matched_contacts']}")
    print(f"📈 Match Rate: {stats['match_rate']:.1f}%")
    print()
    print("📁 Output Files:")
    print("   • contacts_matched.json - Your requested contacts list")
    print("   • contacts_matched.csv - Excel-compatible version")
    print("   • matching_report.md - Detailed report")
    print("   • detailed_matches.json - Full match data")


if __name__ == "__main__":
    main() 