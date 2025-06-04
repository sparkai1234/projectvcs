#!/usr/bin/env python3
"""
Supabase-Based Korean Company Fuzzy Matcher
Reads from Supabase tables (vc_table and contacts_full)
Saves results directly to contacts_matched table
85% threshold matching with detailed analytics
"""

import json
import time
import csv
from typing import Dict, List, Tuple, Optional
from fuzzywuzzy import fuzz, process
from supabase import create_client, Client
from api_config import get_supabase_config

class SupabaseFuzzyMatcher:
    def __init__(self):
        # Initialize Supabase connection
        config = get_supabase_config(use_service_role=True)
        self.supabase: Client = create_client(config['url'], config['key'])
        
        # Data storage
        self.vc_companies = {}      # {company_id: {"company_name": "name", "id": "uuid"}}
        self.contacts = {}          # {id: {"회사": "company", "이름": "name", ...}}
        self.matches = []
        
    def fetch_vc_companies(self) -> Dict[str, Dict]:
        """Fetch VC companies from Supabase vc_table"""
        print("📊 Fetching VC companies from Supabase...")
        
        try:
            response = self.supabase.table('vc_table').select(
                'id, company_id, company_name'
            ).execute()
            
            vc_companies = {}
            
            for record in response.data:
                company_id = record.get('company_id')
                company_name = record.get('company_name')
                
                if company_name and company_id:
                    vc_companies[company_id] = {
                        "company_name": company_name.strip(),
                        "id": record.get('id'),
                        "company_id": company_id
                    }
            
            print(f"✅ Found {len(vc_companies)} VC companies")
            return vc_companies
            
        except Exception as e:
            print(f"❌ Error fetching VC companies: {e}")
            return {}
    
    def fetch_contacts(self) -> Dict[str, Dict]:
        """Fetch contacts from Supabase contacts_full table with proper pagination"""
        print("📊 Fetching contacts from Supabase...")
        
        try:
            contacts = {}
            page_size = 1000  # Supabase default limit
            offset = 0
            total_fetched = 0
            
            while True:
                # Fetch a page of records
                response = self.supabase.table('contacts_full').select(
                    'id, 이름, "회사", 직책, 이메일, 전화번호'
                ).range(offset, offset + page_size - 1).execute()
                
                if not response.data:
                    break
                
                # Process this page
                page_contacts = 0
                for record in response.data:
                    company_field = record.get("회사")  # Korean company field
                    
                    if company_field and company_field.strip():  # Check for non-empty company
                        contacts[record["id"]] = {
                            "회사": company_field.strip(),
                            "이름": record.get("이름", "Unknown"),
                            "직책": record.get("직책", ""),
                            "이메일": record.get("이메일", ""),
                            "전화번호": record.get("전화번호", ""),
                            "record_id": record["id"]
                        }
                        page_contacts += 1
                
                total_fetched += len(response.data)
                print(f"📈 Page {offset//page_size + 1}: {len(response.data)} records, {page_contacts} with company info")
                
                # Check if we got fewer records than requested (last page)
                if len(response.data) < page_size:
                    break
                    
                offset += page_size
            
            print(f"✅ Total fetched: {total_fetched} records")
            print(f"✅ Found {len(contacts)} contacts with company info")
            return contacts
            
        except Exception as e:
            print(f"❌ Error fetching contacts: {e}")
            print(f"❌ Failed at offset: {offset}")
            return {}
    
    def fuzzy_match_companies(self, threshold: int = 85) -> List[Dict]:
        """Perform fuzzy matching at specified threshold"""
        print(f"🔍 Starting fuzzy matching (threshold: {threshold}%)...")
        
        matches = []
        vc_company_names = {company_id: data["company_name"] 
                           for company_id, data in self.vc_companies.items()}
        
        # Create reverse lookup for company names to company IDs
        name_to_vc_info = {}
        for company_id, data in self.vc_companies.items():
            company_name = data["company_name"]
            if company_name not in name_to_vc_info:
                name_to_vc_info[company_name] = []
            name_to_vc_info[company_name].append({
                "company_id": company_id,
                "id": data["id"]
            })
        
        # Match each contact's company against VC companies
        processed = 0
        for contact_id, contact_data in self.contacts.items():
            contact_company = contact_data["회사"]
            
            # Find best match in VC companies
            best_matches = process.extract(contact_company, 
                                         list(vc_company_names.values()), 
                                         limit=1)
            
            if best_matches and best_matches[0][1] >= threshold:
                matched_company_name = best_matches[0][0]
                score = best_matches[0][1]
                
                # Get VC info for this company
                vc_infos = name_to_vc_info.get(matched_company_name, [])
                
                for vc_info in vc_infos:
                    match = {
                        "contact_id": contact_id,
                        "contact_company": contact_company,
                        "contact_name": contact_data["이름"],
                        "contact_position": contact_data["직책"],
                        "contact_email": contact_data["이메일"],
                        "contact_phone": contact_data["전화번호"],
                        "matched_company_name": matched_company_name,
                        "company_id": vc_info["company_id"],
                        "vc_table_id": vc_info["id"],
                        "match_score": score
                    }
                    matches.append(match)
                    
                    print(f"✨ Match: '{contact_company}' → '{matched_company_name}' ({score}%) | {contact_data['이름']}")
            
            processed += 1
            if processed % 1000 == 0:
                print(f"📈 Processed {processed}/{len(self.contacts)} contacts...")
        
        print(f"🎯 Found {len(matches)} matches at {threshold}% threshold")
        return matches
    
    def save_to_supabase(self, matches: List[Dict]) -> int:
        """Save matches directly to Supabase contacts_matched table"""
        print("💾 Saving matches to Supabase contacts_matched table...")
        
        successful_saves = 0
        batch_size = 100
        
        for i in range(0, len(matches), batch_size):
            batch = matches[i:i + batch_size]
            batch_records = []
            
            for match in batch:
                record = {
                    "contact_id": match["contact_id"],
                    "company_id": match["company_id"],
                    "이름": match["contact_name"],
                    "회사": match["matched_company_name"],
                    "직책": match["contact_position"],
                    "이메일": match["contact_email"],
                    "전화번호": match["contact_phone"],
                    "fuzzy_match_score": match["match_score"],
                    "match_method": "fuzzy_wuzzy_85_threshold",
                    "match_algorithm": "fuzzywuzzy",
                    "original_company_text": match["contact_company"],
                    "normalized_company_text": match["contact_company"].strip().lower(),
                    "match_notes": f"Automated fuzzy match with {match['match_score']}% confidence"
                }
                batch_records.append(record)
            
            try:
                response = self.supabase.table('contacts_matched').insert(batch_records).execute()
                successful_saves += len(batch_records)
                print(f"✅ Saved batch {i//batch_size + 1}: {len(batch_records)} records")
                
            except Exception as e:
                print(f"❌ Error saving batch {i//batch_size + 1}: {e}")
                continue
        
        print(f"🎯 Successfully saved {successful_saves}/{len(matches)} matches to Supabase")
        return successful_saves
    
    def save_local_backup(self, matches: List[Dict]):
        """Save local backup files"""
        timestamp = time.strftime('%Y%m%d_%H%M%S')
        
        # Prepare contacts_matched format
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
                "match_score": match["match_score"],
                "contact_id": match["contact_id"]
            }
            contacts_matched.append(contact_entry)
        
        # Save files with timestamp
        json_file = f"supabase_contacts_matched_{timestamp}.json"
        csv_file = f"supabase_contacts_matched_{timestamp}.csv"
        
        # Save JSON
        with open(json_file, "w", encoding="utf-8") as f:
            json.dump(contacts_matched, f, indent=2, ensure_ascii=False)
        
        # Save CSV
        if contacts_matched:
            with open(csv_file, "w", newline="", encoding="utf-8-sig") as f:
                writer = csv.DictWriter(f, fieldnames=contacts_matched[0].keys())
                writer.writeheader()
                writer.writerows(contacts_matched)
        
        print(f"💾 Local backup saved:")
        print(f"   📄 {json_file}")
        print(f"   📄 {csv_file}")
    
    def create_summary_report(self, matches: List[Dict], saved_count: int) -> str:
        """Create comprehensive summary report"""
        report = ["# 🔗 Supabase Korean Company Matching Results\n"]
        report.append(f"**Generated:** {time.strftime('%Y-%m-%d %H:%M:%S')}\n")
        report.append(f"**Data Source:** Supabase Tables\n")
        report.append(f"**Threshold:** 85%\n")
        report.append(f"**Total Matches:** {len(matches)}\n")
        report.append(f"**Saved to Supabase:** {saved_count}\n\n")
        
        # Statistics
        total_contacts = len(self.contacts)
        total_vc_companies = len(self.vc_companies)
        match_rate = (len(matches) / total_contacts * 100) if total_contacts > 0 else 0
        
        report.append("## 📊 Statistics\n")
        report.append(f"- **Total Contacts (Supabase):** {total_contacts}")
        report.append(f"- **Total VC Companies (Supabase):** {total_vc_companies}")
        report.append(f"- **Successful Matches:** {len(matches)}")
        report.append(f"- **Match Rate:** {match_rate:.1f}%")
        report.append(f"- **Saved to contacts_matched:** {saved_count}")
        report.append(f"- **Save Success Rate:** {(saved_count/len(matches)*100):.1f}%\n")
        
        # Group by company
        company_groups = {}
        for match in matches:
            company = match["matched_company_name"]
            if company not in company_groups:
                company_groups[company] = []
            company_groups[company].append(match)
        
        report.append("## 🏢 Top Matched Companies\n")
        sorted_companies = sorted(company_groups.items(), key=lambda x: len(x[1]), reverse=True)
        
        for company, matches_list in sorted_companies[:20]:  # Top 20 companies
            report.append(f"### {company} ({len(matches_list)} contacts)")
            for match in matches_list[:5]:  # Show first 5 contacts per company
                score = match["match_score"]
                name = match["contact_name"]
                position = match.get("contact_position", "")
                report.append(f"- **{name}** ({position}) - {score}% match")
            if len(matches_list) > 5:
                report.append(f"- ... and {len(matches_list) - 5} more contacts")
            report.append("")
        
        return "\n".join(report)
    
    def run_matching(self) -> Dict:
        """Run the complete Supabase-based matching process"""
        print("🚀 Starting Supabase Korean Company Matching Process...")
        print("="*70)
        print("📍 Data Source: Supabase Tables")
        print("📍 Target: contacts_matched table")
        print("="*70)
        
        # Test Supabase connection
        try:
            test = self.supabase.table('vc_table').select('id').limit(1).execute()
            print("✅ Supabase connection successful")
        except Exception as e:
            print(f"❌ Supabase connection failed: {e}")
            return {"error": "Supabase connection failed"}
        
        # Load data
        self.vc_companies = self.fetch_vc_companies()
        self.contacts = self.fetch_contacts()
        
        if not self.vc_companies or not self.contacts:
            print("❌ Failed to load data from Supabase")
            return {"error": "Data loading failed"}
        
        print(f"\n📈 Data loaded:")
        print(f"   VC Companies: {len(self.vc_companies)}")
        print(f"   Contacts: {len(self.contacts)}")
        
        # Perform matching at 85% threshold
        matches = self.fuzzy_match_companies(threshold=85)
        
        if not matches:
            print("ℹ️ No matches found at 85% threshold")
            return {"matches": [], "saved_count": 0}
        
        # Save to Supabase
        saved_count = self.save_to_supabase(matches)
        
        # Save local backup
        self.save_local_backup(matches)
        
        # Create report
        report = self.create_summary_report(matches, saved_count)
        
        # Save report
        timestamp = time.strftime('%Y%m%d_%H%M%S')
        report_file = f"supabase_matching_report_{timestamp}.md"
        with open(report_file, "w", encoding="utf-8") as f:
            f.write(report)
        
        print(f"\n✅ Supabase matching complete!")
        print(f"📄 Report saved: {report_file}")
        
        return {
            "matches": matches,
            "saved_count": saved_count,
            "report": report,
            "stats": {
                "total_contacts": len(self.contacts),
                "total_vc_companies": len(self.vc_companies),
                "matched_contacts": len(matches),
                "saved_contacts": saved_count,
                "match_rate": len(matches) / len(self.contacts) * 100 if self.contacts else 0,
                "save_rate": saved_count / len(matches) * 100 if matches else 0
            }
        }


def main():
    """Main execution function"""
    print("🔗 Supabase Korean Company Fuzzy Matcher (85% threshold)")
    print("="*70)
    print("Reading from: Supabase vc_table & contacts_full")
    print("Saving to: Supabase contacts_matched table")
    print()
    
    # Initialize matcher
    matcher = SupabaseFuzzyMatcher()
    
    # Run matching process
    results = matcher.run_matching()
    
    # Handle errors
    if "error" in results:
        print(f"\n❌ Process failed: {results['error']}")
        return
    
    # Print final summary
    print("\n" + "="*70)
    print("📋 FINAL SUMMARY")
    print("="*70)
    stats = results['stats']
    print(f"📊 Total Contacts (Supabase): {stats['total_contacts']}")
    print(f"🏢 Total VC Companies (Supabase): {stats['total_vc_companies']}")
    print(f"🎯 Matched Contacts: {stats['matched_contacts']}")
    print(f"💾 Saved to Supabase: {stats['saved_contacts']}")
    print(f"📈 Match Rate: {stats['match_rate']:.1f}%")
    print(f"💽 Save Success Rate: {stats['save_rate']:.1f}%")
    print()
    print("📁 Output:")
    print("   • contacts_matched table in Supabase (live data)")
    print("   • Local backup files with timestamp")
    print("   • Detailed matching report")


if __name__ == "__main__":
    main() 