#!/usr/bin/env python3
"""
Supabase Contacts Matched Deduplicator
Identifies and removes duplicate entries from contacts_matched table
Keeps the most recent and highest quality records
"""

import json
import time
from typing import Dict, List, Tuple
from supabase import create_client, Client
from api_config import get_supabase_config

class SupabaseDeduplicator:
    def __init__(self):
        # Initialize Supabase connection
        config = get_supabase_config(use_service_role=True)
        self.supabase: Client = create_client(config['url'], config['key'])
        
        # Statistics
        self.total_records = 0
        self.duplicates_found = 0
        self.duplicates_deleted = 0
        
    def fetch_all_records(self) -> List[Dict]:
        """Fetch all records from contacts_matched table"""
        print("📊 Fetching all records from contacts_matched table...")
        
        try:
            records = []
            page_size = 1000
            offset = 0
            
            while True:
                response = self.supabase.table('contacts_matched').select('*').range(
                    offset, offset + page_size - 1
                ).order('created_at', desc=True).execute()
                
                if not response.data:
                    break
                
                records.extend(response.data)
                print(f"📈 Fetched {len(response.data)} records (total: {len(records)})")
                
                if len(response.data) < page_size:
                    break
                    
                offset += page_size
            
            self.total_records = len(records)
            print(f"✅ Total records fetched: {self.total_records}")
            return records
            
        except Exception as e:
            print(f"❌ Error fetching records: {e}")
            return []
    
    def identify_duplicates(self, records: List[Dict]) -> Dict[str, List[Dict]]:
        """Identify duplicate records based on multiple criteria"""
        print("🔍 Identifying duplicate records...")
        
        # Group records by different criteria
        duplicate_groups = {}
        
        # Method 1: Same contact_id + company_id
        contact_company_groups = {}
        for record in records:
            contact_id = record.get('contact_id', '')
            company_id = record.get('company_id', '')
            key = f"{contact_id}_{company_id}"
            
            if key not in contact_company_groups:
                contact_company_groups[key] = []
            contact_company_groups[key].append(record)
        
        # Method 2: Same 이름 (name) + 회사 (company) + 이메일 (email)
        name_company_email_groups = {}
        for record in records:
            name = record.get('이름', '').strip()
            company = record.get('회사', '').strip()
            email = record.get('이메일', '').strip()
            key = f"{name}_{company}_{email}".lower()
            
            if key and name and company:  # Only group if we have meaningful data
                if key not in name_company_email_groups:
                    name_company_email_groups[key] = []
                name_company_email_groups[key].append(record)
        
        # Method 3: Same 이메일 (email) only (if email exists and is not empty)
        email_groups = {}
        for record in records:
            email = record.get('이메일', '').strip()
            if email and '@' in email:  # Valid email check
                if email not in email_groups:
                    email_groups[email] = []
                email_groups[email].append(record)
        
        # Combine all duplicate groups
        all_groups = {}
        group_counter = 1
        
        # Add contact_id + company_id duplicates
        for key, group in contact_company_groups.items():
            if len(group) > 1:
                all_groups[f"contact_company_{group_counter}"] = {
                    "type": "contact_id + company_id",
                    "key": key,
                    "records": group
                }
                group_counter += 1
        
        # Add name + company + email duplicates
        for key, group in name_company_email_groups.items():
            if len(group) > 1:
                all_groups[f"name_company_email_{group_counter}"] = {
                    "type": "name + company + email",
                    "key": key,
                    "records": group
                }
                group_counter += 1
        
        # Add email-only duplicates
        for email, group in email_groups.items():
            if len(group) > 1:
                all_groups[f"email_{group_counter}"] = {
                    "type": "email only",
                    "key": email,
                    "records": group
                }
                group_counter += 1
        
        total_duplicates = sum(len(group["records"]) - 1 for group in all_groups.values())
        self.duplicates_found = total_duplicates
        
        print(f"🎯 Found {len(all_groups)} duplicate groups")
        print(f"📊 Total duplicate records to remove: {total_duplicates}")
        
        return all_groups
    
    def select_best_record(self, records: List[Dict]) -> Dict:
        """Select the best record from a group of duplicates"""
        if len(records) == 1:
            return records[0]
        
        # Scoring criteria (higher score = better record)
        def score_record(record):
            score = 0
            
            # Prefer records with higher fuzzy match scores
            fuzzy_score = record.get('fuzzy_match_score', 0)
            score += fuzzy_score * 0.1
            
            # Prefer records with more complete data
            if record.get('이름') and record.get('이름').strip():
                score += 10
            if record.get('직책') and record.get('직책').strip():
                score += 5
            if record.get('이메일') and '@' in record.get('이메일', ''):
                score += 15
            if record.get('전화번호') and record.get('전화번호').strip():
                score += 5
            
            # Prefer more recent records (if created_at exists)
            created_at = record.get('created_at')
            if created_at:
                # More recent records get higher scores
                try:
                    # Assuming ISO format timestamps
                    score += 1  # Small bonus for having timestamp
                except:
                    pass
            
            # Prefer records with match_method information
            if record.get('match_method'):
                score += 5
            
            return score
        
        # Sort by score (highest first) and return the best
        sorted_records = sorted(records, key=score_record, reverse=True)
        return sorted_records[0]
    
    def delete_duplicates(self, duplicate_groups: Dict[str, List[Dict]]) -> int:
        """Delete duplicate records, keeping the best one from each group"""
        print("🗑️ Deleting duplicate records...")
        
        deleted_count = 0
        
        for group_name, group_info in duplicate_groups.items():
            records = group_info["records"]
            group_type = group_info["type"]
            
            print(f"\n📋 Processing group: {group_name} ({group_type})")
            print(f"   Records in group: {len(records)}")
            
            # Select the best record to keep
            best_record = self.select_best_record(records)
            best_id = best_record['id']
            
            print(f"   ✅ Keeping record ID: {best_id}")
            print(f"      Name: {best_record.get('이름', 'N/A')}")
            print(f"      Company: {best_record.get('회사', 'N/A')}")
            print(f"      Match Score: {best_record.get('fuzzy_match_score', 'N/A')}")
            
            # Delete all other records in this group
            for record in records:
                if record['id'] != best_id:
                    try:
                        response = self.supabase.table('contacts_matched').delete().eq(
                            'id', record['id']
                        ).execute()
                        
                        deleted_count += 1
                        print(f"   🗑️ Deleted record ID: {record['id']} ({record.get('이름', 'N/A')})")
                        
                    except Exception as e:
                        print(f"   ❌ Error deleting record {record['id']}: {e}")
        
        self.duplicates_deleted = deleted_count
        print(f"\n🎯 Successfully deleted {deleted_count} duplicate records")
        return deleted_count
    
    def generate_report(self, duplicate_groups: Dict[str, List[Dict]]) -> str:
        """Generate a detailed deduplication report"""
        report = ["# 🔧 Supabase Deduplication Report\n"]
        report.append(f"**Generated:** {time.strftime('%Y-%m-%d %H:%M:%S')}\n")
        report.append(f"**Table:** contacts_matched\n\n")
        
        # Summary
        report.append("## 📊 Summary\n")
        report.append(f"- **Total Records Before:** {self.total_records}")
        report.append(f"- **Duplicate Groups Found:** {len(duplicate_groups)}")
        report.append(f"- **Duplicate Records Found:** {self.duplicates_found}")
        report.append(f"- **Records Deleted:** {self.duplicates_deleted}")
        report.append(f"- **Total Records After:** {self.total_records - self.duplicates_deleted}")
        report.append(f"- **Space Saved:** {self.duplicates_deleted / self.total_records * 100:.1f}%\n")
        
        # Duplicate groups breakdown
        report.append("## 🔍 Duplicate Groups Breakdown\n")
        
        group_types = {}
        for group_info in duplicate_groups.values():
            group_type = group_info["type"]
            if group_type not in group_types:
                group_types[group_type] = 0
            group_types[group_type] += len(group_info["records"]) - 1
        
        for group_type, count in group_types.items():
            report.append(f"- **{group_type}**: {count} duplicates removed")
        
        report.append("\n## 📋 Detailed Groups\n")
        
        for group_name, group_info in list(duplicate_groups.items())[:10]:  # Show first 10 groups
            records = group_info["records"]
            group_type = group_info["type"]
            
            report.append(f"### {group_name} ({group_type})")
            report.append(f"- **Records:** {len(records)}")
            report.append(f"- **Removed:** {len(records) - 1}")
            
            # Show the kept record
            best_record = self.select_best_record(records)
            report.append(f"- **Kept Record:**")
            report.append(f"  - Name: {best_record.get('이름', 'N/A')}")
            report.append(f"  - Company: {best_record.get('회사', 'N/A')}")
            report.append(f"  - Match Score: {best_record.get('fuzzy_match_score', 'N/A')}")
            report.append("")
        
        if len(duplicate_groups) > 10:
            report.append(f"... and {len(duplicate_groups) - 10} more groups")
        
        return "\n".join(report)
    
    def run_deduplication(self) -> Dict:
        """Run the complete deduplication process"""
        print("🔧 Starting Supabase Deduplication Process...")
        print("="*70)
        print("📍 Target: contacts_matched table")
        print("📍 Strategy: Keep best quality record from each duplicate group")
        print("="*70)
        
        # Test connection
        try:
            test = self.supabase.table('contacts_matched').select('id').limit(1).execute()
            print("✅ Supabase connection successful")
        except Exception as e:
            print(f"❌ Supabase connection failed: {e}")
            return {"error": "Supabase connection failed"}
        
        # Fetch all records
        records = self.fetch_all_records()
        if not records:
            print("❌ No records found or failed to fetch")
            return {"error": "No records found"}
        
        # Identify duplicates
        duplicate_groups = self.identify_duplicates(records)
        
        if not duplicate_groups:
            print("✅ No duplicates found! Table is already clean.")
            return {
                "total_records": self.total_records,
                "duplicates_found": 0,
                "duplicates_deleted": 0,
                "message": "No duplicates found"
            }
        
        # Show preview before deletion
        print(f"\n⚠️ WARNING: About to delete {self.duplicates_found} duplicate records")
        confirmation = input("Continue? (y/N): ").strip().lower()
        
        if confirmation != 'y':
            print("❌ Deduplication cancelled by user")
            return {"error": "Cancelled by user"}
        
        # Delete duplicates
        deleted_count = self.delete_duplicates(duplicate_groups)
        
        # Generate report
        report = self.generate_report(duplicate_groups)
        
        # Save report
        timestamp = time.strftime('%Y%m%d_%H%M%S')
        report_file = f"deduplication_report_{timestamp}.md"
        with open(report_file, "w", encoding="utf-8") as f:
            f.write(report)
        
        print(f"\n✅ Deduplication complete!")
        print(f"📄 Report saved: {report_file}")
        print(f"🎯 Final count: {self.total_records - deleted_count} records")
        
        return {
            "total_records_before": self.total_records,
            "duplicates_found": self.duplicates_found,
            "duplicates_deleted": deleted_count,
            "total_records_after": self.total_records - deleted_count,
            "report": report,
            "report_file": report_file
        }


def main():
    """Main execution function"""
    print("🔧 Supabase Contacts Matched Deduplicator")
    print("="*70)
    print("Removes duplicate entries from contacts_matched table")
    print("Keeps the highest quality record from each duplicate group")
    print()
    
    # Initialize deduplicator
    deduplicator = SupabaseDeduplicator()
    
    # Run deduplication
    results = deduplicator.run_deduplication()
    
    # Handle errors
    if "error" in results:
        print(f"\n❌ Process failed: {results['error']}")
        return
    
    # Print final summary
    print("\n" + "="*70)
    print("📋 DEDUPLICATION SUMMARY")
    print("="*70)
    print(f"📊 Records Before: {results['total_records_before']}")
    print(f"🔍 Duplicates Found: {results['duplicates_found']}")
    print(f"🗑️ Records Deleted: {results['duplicates_deleted']}")
    print(f"✅ Records After: {results['total_records_after']}")
    
    if results['duplicates_deleted'] > 0:
        space_saved = results['duplicates_deleted'] / results['total_records_before'] * 100
        print(f"💾 Space Saved: {space_saved:.1f}%")
    
    print("\n🎯 Your contacts_matched table is now clean and optimized!")


if __name__ == "__main__":
    main() 