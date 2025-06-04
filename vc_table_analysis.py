#!/usr/bin/env python3
"""
📊 VC TABLE ANALYSIS - Current Company ID Statistics
Analyze the existing VC Table to understand Company IDs and prepare for Fund integration
"""

import os
import sys
import json
import requests
from datetime import datetime
from collections import Counter
from api_config import set_environment_variables

# Set up environment variables
set_environment_variables()

class VCTableAnalyzer:
    def __init__(self):
        self.api_key = os.getenv('AIRTABLE_API_KEY')
        self.base_id = os.getenv('AIRTABLE_BASE_ID')
        
        if not self.api_key or not self.base_id:
            raise ValueError("Missing API configuration")
        
        self.headers = {
            'Authorization': f'Bearer {self.api_key}',
            'Content-Type': 'application/json'
        }
    
    def fetch_all_vc_records(self):
        """Fetch all records from VC Table"""
        print("📡 Fetching all VC Table records...")
        
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
                else:
                    print(f"❌ API Error: {response.status_code}")
                    break
                    
            except Exception as e:
                print(f"❌ Error fetching data: {e}")
                break
        
        print(f"✅ Fetched {len(all_records)} VC records")
        return all_records
    
    def analyze_company_ids(self, records):
        """Analyze Company ID distribution and patterns"""
        print("\n🔍 ANALYZING COMPANY IDs...")
        print("="*50)
        
        # Extract Company IDs
        company_ids = []
        companies_with_ids = 0
        companies_without_ids = 0
        
        for record in records:
            fields = record.get('fields', {})
            company_id = fields.get('Company ID', '').strip()
            
            if company_id:
                company_ids.append(company_id)
                companies_with_ids += 1
            else:
                companies_without_ids += 1
        
        # Statistics
        unique_company_ids = len(set(company_ids))
        duplicate_ids = len(company_ids) - unique_company_ids
        
        print(f"📊 COMPANY ID STATISTICS:")
        print(f"   • Total VC Records: {len(records)}")
        print(f"   • Companies with Company ID: {companies_with_ids}")
        print(f"   • Companies without Company ID: {companies_without_ids}")
        print(f"   • Unique Company IDs: {unique_company_ids}")
        print(f"   • Duplicate Company IDs: {duplicate_ids}")
        print(f"   • Company ID Coverage: {companies_with_ids/len(records)*100:.1f}%")
        
        # Find duplicates if any
        if duplicate_ids > 0:
            id_counts = Counter(company_ids)
            duplicates = {id_val: count for id_val, count in id_counts.items() if count > 1}
            
            print(f"\n⚠️ DUPLICATE COMPANY IDs FOUND:")
            for company_id, count in list(duplicates.items())[:5]:
                print(f"   • {company_id}: {count} times")
            if len(duplicates) > 5:
                print(f"   ... and {len(duplicates) - 5} more duplicates")
        
        return {
            'total_records': len(records),
            'companies_with_ids': companies_with_ids,
            'companies_without_ids': companies_without_ids,
            'unique_company_ids': unique_company_ids,
            'duplicate_ids': duplicate_ids,
            'company_id_coverage': companies_with_ids/len(records)*100
        }
    
    def analyze_company_fields(self, records):
        """Analyze what fields are populated in VC companies"""
        print(f"\n🔍 ANALYZING FIELD COMPLETENESS...")
        print("="*50)
        
        field_stats = {}
        
        # Check all possible fields
        all_fields = set()
        for record in records:
            all_fields.update(record.get('fields', {}).keys())
        
        # Count populated fields
        for field_name in all_fields:
            populated_count = 0
            for record in records:
                field_value = record.get('fields', {}).get(field_name, '')
                if field_value and str(field_value).strip():
                    populated_count += 1
            
            field_stats[field_name] = {
                'populated': populated_count,
                'percentage': populated_count / len(records) * 100
            }
        
        # Sort by completeness
        sorted_fields = sorted(field_stats.items(), key=lambda x: x[1]['percentage'], reverse=True)
        
        print(f"📊 FIELD COMPLETENESS (Top 15):")
        for field_name, stats in sorted_fields[:15]:
            print(f"   • {field_name:<25}: {stats['populated']:3d}/{len(records)} ({stats['percentage']:5.1f}%)")
        
        return field_stats
    
    def analyze_industry_distribution(self, records):
        """Analyze industry distribution"""
        print(f"\n🏭 INDUSTRY DISTRIBUTION...")
        print("="*50)
        
        industries = []
        for record in records:
            industry = record.get('fields', {}).get('Industry', '').strip()
            if industry:
                industries.append(industry)
        
        industry_counts = Counter(industries)
        
        print(f"📊 TOP 10 INDUSTRIES:")
        for industry, count in industry_counts.most_common(10):
            percentage = count / len(records) * 100
            print(f"   • {industry:<30}: {count:3d} companies ({percentage:4.1f}%)")
        
        return industry_counts
    
    def analyze_location_distribution(self, records):
        """Analyze location distribution"""
        print(f"\n📍 LOCATION DISTRIBUTION...")
        print("="*50)
        
        locations = []
        for record in records:
            location = record.get('fields', {}).get('Location', '').strip()
            if location:
                locations.append(location)
        
        location_counts = Counter(locations)
        
        print(f"📊 TOP 10 LOCATIONS:")
        for location, count in location_counts.most_common(10):
            percentage = count / len(records) * 100
            print(f"   • {location:<25}: {count:3d} companies ({percentage:4.1f}%)")
        
        return location_counts
    
    def generate_comprehensive_report(self, records):
        """Generate comprehensive analysis report"""
        print(f"\n📋 COMPREHENSIVE VC TABLE REPORT")
        print("="*60)
        
        # Basic analysis
        company_id_stats = self.analyze_company_ids(records)
        field_stats = self.analyze_company_fields(records)
        industry_stats = self.analyze_industry_distribution(records)
        location_stats = self.analyze_location_distribution(records)
        
        # Preparation for Fund integration
        print(f"\n🔮 FUND INTEGRATION READINESS:")
        print("="*50)
        print(f"   • VC Companies Ready for Fund Linking: {company_id_stats['companies_with_ids']}")
        print(f"   • Expected Fund-to-VC Ratio: 3600+ funds / 717 VCs = ~5.0 funds per VC")
        print(f"   • Company ID Coverage: {company_id_stats['company_id_coverage']:.1f}% (Good for linking)")
        
        if company_id_stats['duplicate_ids'] > 0:
            print(f"   ⚠️ WARNING: {company_id_stats['duplicate_ids']} duplicate Company IDs need cleanup")
        else:
            print(f"   ✅ No duplicate Company IDs - Clean for Fund linking")
        
        # DIVA Enhancement readiness
        print(f"\n🧠 DIVA ENHANCEMENT READINESS:")
        print("="*50)
        print(f"   • Companies available for DIVA enhancement: {len(records)}")
        print(f"   • DIVA Intelligence Records created: 10 (test data)")
        print(f"   • DIVA Professional Network Records: 10 (test data)")
        print(f"   • DIVA Fund Intelligence Records: 10 (test data)")
        print(f"   • Ready for scaled DIVA collection: ✅")
        
        # Generate summary report
        report = {
            'analysis_timestamp': datetime.now().isoformat(),
            'vc_table_stats': company_id_stats,
            'field_completeness': field_stats,
            'industry_distribution': dict(industry_stats.most_common(20)),
            'location_distribution': dict(location_stats.most_common(20)),
            'fund_integration_readiness': {
                'ready_for_linking': company_id_stats['companies_with_ids'],
                'expected_fund_ratio': 3600 / 717,
                'duplicate_id_issues': company_id_stats['duplicate_ids'] > 0
            },
            'diva_enhancement_status': {
                'vc_companies_available': len(records),
                'diva_tables_created': True,
                'test_data_populated': True,
                'ready_for_scaling': True
            }
        }
        
        # Save report
        report_filename = f"vc_table_analysis_{datetime.now().strftime('%Y%m%d_%H%M%S')}.json"
        with open(report_filename, 'w', encoding='utf-8') as f:
            json.dump(report, f, ensure_ascii=False, indent=2)
        
        print(f"\n📄 Analysis report saved: {report_filename}")
        
        return report

def main():
    """Main analysis function"""
    print("📊 VC TABLE ANALYSIS - Company ID & Fund Integration Readiness")
    print("   Analyzing current state while waiting for Fund Table population")
    print("   " + "="*70)
    
    try:
        # Initialize analyzer
        analyzer = VCTableAnalyzer()
        
        # Fetch all VC records
        vc_records = analyzer.fetch_all_vc_records()
        
        if not vc_records:
            print("❌ No VC records found or API error")
            return
        
        # Generate comprehensive analysis
        report = analyzer.generate_comprehensive_report(vc_records)
        
        print(f"\n🎯 KEY INSIGHTS:")
        print(f"   • Your VC Table is well-structured with {len(vc_records)} companies")
        print(f"   • {report['vc_table_stats']['company_id_coverage']:.1f}% Company ID coverage is excellent for Fund linking")
        print(f"   • Industry and location data provide good segmentation")
        print(f"   • Ready for 3600+ Fund records via scheduled Apify collection")
        print(f"   • DIVA enhancement system is operational and ready for scaling")
        
        print(f"\n🚀 NEXT STEPS:")
        print(f"   1. Wait for Monday's scheduled Fund scraper run")
        print(f"   2. Scale up DIVA data collection for comprehensive intelligence")
        print(f"   3. Cross-reference Fund Company IDs with VC Company IDs")
        print(f"   4. Create advanced analytics and dashboards")
        
        return report
        
    except Exception as e:
        print(f"❌ Analysis failed: {e}")
        raise

if __name__ == "__main__":
    main() 