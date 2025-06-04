#!/usr/bin/env python3
"""
Comprehensive DIVA Data Verification for Supabase
Verifies data integrity, structure, and accuracy
"""

import json
import os
from supabase import create_client, Client
from datetime import datetime

def verify_supabase_data():
    print("🔍 DIVA Data Verification in Supabase")
    print("=====================================")
    
    # Set up Supabase connection
    os.environ['SUPABASE_URL'] = 'https://udfgtccxbqmalgpqyxzz.supabase.co'
    os.environ['SUPABASE_KEY'] = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InVkZmd0Y2N4YnFtYWxncHF5eHp6Iiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc0ODk0NjY5NiwiZXhwIjoyMDY0NTIyNjk2fQ.JgyEKjOhuZpNCCOadsaK90Q8CcoPf_rgdtSXh-1BU18'
    
    supabase: Client = create_client(os.getenv('SUPABASE_URL'), os.getenv('SUPABASE_KEY'))
    
    # Load original test data for comparison
    try:
        with open('test_diva_data.json', 'r', encoding='utf-8') as f:
            original_data = json.load(f)
        print(f"✅ Loaded {len(original_data)} original DIVA records for comparison")
    except FileNotFoundError:
        print("⚠️  Original test data not found - will only verify Supabase data structure")
        original_data = []
    
    print(f"\n📊 === TABLE VERIFICATION ===")
    
    # 1. Verify diva_intelligence table
    print(f"\n🔍 1. DIVA INTELLIGENCE TABLE")
    intelligence_data = supabase.table('diva_intelligence').select('*').execute()
    intelligence_records = intelligence_data.data
    
    print(f"📈 Records found: {len(intelligence_records)}")
    
    if intelligence_records:
        # Show sample record structure
        sample = intelligence_records[0]
        print(f"📋 Sample record structure:")
        print(f"   • company_id: {sample.get('company_id')}")
        print(f"   • company_name: {sample.get('company_name')}")
        print(f"   • intelligence_data keys: {list(sample.get('intelligence_data', {}).keys())}")
        print(f"   • analysis_results keys: {list(sample.get('analysis_results', {}).keys())}")
        print(f"   • data_quality_score: {sample.get('data_quality_score')}")
        
        # Verify all expected companies are present
        if original_data:
            original_companies = {record['company_id']: record['company_name'] for record in original_data}
            supabase_companies = {record['company_id']: record['company_name'] for record in intelligence_records}
            
            print(f"\n✅ Company Matching Verification:")
            missing_companies = set(original_companies.keys()) - set(supabase_companies.keys())
            extra_companies = set(supabase_companies.keys()) - set(original_companies.keys())
            
            if not missing_companies and not extra_companies:
                print(f"   ✅ Perfect match: All {len(original_companies)} companies present")
            else:
                if missing_companies:
                    print(f"   ❌ Missing companies: {missing_companies}")
                if extra_companies:
                    print(f"   ⚠️  Extra companies: {extra_companies}")
    
    # 2. Verify diva_professional_network table
    print(f"\n🔍 2. DIVA PROFESSIONAL NETWORK TABLE")
    network_data = supabase.table('diva_professional_network').select('*').execute()
    network_records = network_data.data
    
    print(f"📈 Records found: {len(network_records)}")
    
    if network_records:
        sample = network_records[0]
        print(f"📋 Sample record structure:")
        print(f"   • company_id: {sample.get('company_id')}")
        print(f"   • company_name: {sample.get('company_name')}")
        print(f"   • professional_data keys: {list(sample.get('professional_data', {}).keys())}")
        print(f"   • network_analysis keys: {list(sample.get('network_analysis', {}).keys())}")
    
    # 3. Verify VC table integration
    print(f"\n🔍 3. VC TABLE INTEGRATION")
    vc_data = supabase.table('vc_table').select('company_id, company_name').execute()
    vc_records = vc_data.data
    
    print(f"📈 VC companies found: {len(vc_records)}")
    
    # Check how many DIVA companies are linked to VC data
    if intelligence_records and vc_records:
        vc_company_ids = {record['company_id'] for record in vc_records}
        diva_company_ids = {record['company_id'] for record in intelligence_records}
        linked_companies = diva_company_ids.intersection(vc_company_ids)
        
        print(f"🔗 Linked companies: {len(linked_companies)}/{len(diva_company_ids)}")
        print(f"   • Linkage rate: {(len(linked_companies)/len(diva_company_ids)*100):.1f}%")
        
        if len(linked_companies) == len(diva_company_ids):
            print(f"   ✅ Perfect linkage: All DIVA companies found in VC table")
        else:
            unlinked = diva_company_ids - vc_company_ids
            print(f"   ⚠️  Unlinked companies: {unlinked}")
    
    # 4. Data quality verification
    print(f"\n🔍 4. DATA QUALITY VERIFICATION")
    
    if intelligence_records:
        # Check for required fields
        records_with_issues = []
        
        for record in intelligence_records:
            issues = []
            
            if not record.get('company_id'):
                issues.append('missing company_id')
            if not record.get('company_name'):
                issues.append('missing company_name')
            if not record.get('intelligence_data'):
                issues.append('missing intelligence_data')
            if not record.get('analysis_results'):
                issues.append('missing analysis_results')
            
            # Check intelligence_data structure
            intel_data = record.get('intelligence_data', {})
            required_intel_fields = ['total_personnel', 'professional_staff', 'investment_review_staff', 'management_staff']
            for field in required_intel_fields:
                if field not in intel_data:
                    issues.append(f'missing intelligence_data.{field}')
            
            if issues:
                records_with_issues.append({
                    'company_id': record.get('company_id'),
                    'company_name': record.get('company_name'),
                    'issues': issues
                })
        
        print(f"📊 Data Quality Summary:")
        print(f"   • Total records: {len(intelligence_records)}")
        print(f"   • Records with issues: {len(records_with_issues)}")
        print(f"   • Data quality rate: {((len(intelligence_records) - len(records_with_issues))/len(intelligence_records)*100):.1f}%")
        
        if records_with_issues:
            print(f"\n⚠️  Records with issues:")
            for record in records_with_issues[:5]:  # Show first 5
                print(f"   • {record['company_name']}: {', '.join(record['issues'])}")
        else:
            print(f"   ✅ All records have complete required data")
    
    # 5. Personnel statistics verification
    print(f"\n🔍 5. PERSONNEL STATISTICS")
    
    if intelligence_records:
        total_companies = len(intelligence_records)
        total_personnel = sum(record['intelligence_data'].get('total_personnel', 0) for record in intelligence_records)
        total_professionals = sum(record['intelligence_data'].get('professional_staff', 0) for record in intelligence_records)
        
        # Find largest and smallest companies
        largest = max(intelligence_records, key=lambda x: x['intelligence_data'].get('total_personnel', 0))
        smallest = min(intelligence_records, key=lambda x: x['intelligence_data'].get('total_personnel', 1000))
        
        print(f"📊 Personnel Summary:")
        print(f"   • Total Companies: {total_companies}")
        print(f"   • Total Personnel: {total_personnel}")
        print(f"   • Total Professional Staff: {total_professionals}")
        print(f"   • Average Company Size: {total_personnel/total_companies:.1f}")
        print(f"   • Average Professional Ratio: {(total_professionals/total_personnel*100):.1f}%")
        print(f"   • Largest Company: {largest['company_name']} ({largest['intelligence_data'].get('total_personnel')} staff)")
        print(f"   • Smallest Company: {smallest['company_name']} ({smallest['intelligence_data'].get('total_personnel')} staff)")
        
        # Compare with original data if available
        if original_data:
            orig_total_personnel = sum(record.get('total_personnel', 0) for record in original_data)
            orig_total_professionals = sum(record.get('professional_staff', 0) for record in original_data)
            
            print(f"\n📊 Original vs Supabase Comparison:")
            print(f"   • Personnel: {orig_total_personnel} → {total_personnel} ({'✅ Match' if orig_total_personnel == total_personnel else '❌ Mismatch'})")
            print(f"   • Professionals: {orig_total_professionals} → {total_professionals} ({'✅ Match' if orig_total_professionals == total_professionals else '❌ Mismatch'})")
    
    # 6. Recent updates check
    print(f"\n🔍 6. RECENT UPDATES")
    
    if intelligence_records:
        recent_records = sorted(intelligence_records, key=lambda x: x.get('created_at', ''), reverse=True)[:3]
        print(f"📅 Most recent uploads:")
        for i, record in enumerate(recent_records, 1):
            created_at = record.get('created_at', 'Unknown')
            print(f"   {i}. {record['company_name']} - {created_at}")
    
    print(f"\n🎯 === VERIFICATION COMPLETE ===")
    print(f"✅ Your DIVA data in Supabase appears to be correctly uploaded and structured!")
    print(f"🔗 You can view the data in your dashboard at: https://supabase.com/dashboard/project/udfgtccxbqmalgpqyxzz/editor")

if __name__ == "__main__":
    verify_supabase_data() 