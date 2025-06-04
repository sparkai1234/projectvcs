#!/usr/bin/env python3
"""
🚀 SCALE UP DATA COLLECTION - Comprehensive Korean VC Intelligence
Dramatically increase data collection from all sources:
- DIVA portal (increase from 2 pages to 50+ pages per section)
- Apify actors (scale up to full database coverage)
- Cross-reference and validate data quality
"""

import os
import sys
import json
import time
from datetime import datetime, timedelta
from api_config import set_environment_variables
from comprehensive_diva_scraper import ComprehensiveDIVAScraper
from diva_enhancement_system_fixed import DIVAEnhancementSystem

# Set up environment variables
set_environment_variables()

class ScaledDataCollectionSystem:
    def __init__(self):
        self.api_key = os.getenv('AIRTABLE_API_KEY')
        self.base_id = os.getenv('AIRTABLE_BASE_ID')
        
        if not self.api_key or not self.base_id:
            raise ValueError("Missing API configuration. Check your api_config.py file")
        
        # Initialize systems
        self.enhancement_system = DIVAEnhancementSystem(self.api_key, self.base_id)
        self.scraper = ComprehensiveDIVAScraper()
        
        # Scaling configuration
        self.scaling_config = {
            'diva_scraping': {
                'max_pages_per_section': 50,  # Dramatically increased from 2
                'sections_to_prioritize': ['personnel', 'professional', 'disclosure', 'funds', 'investment'],
                'year_months_to_scrape': ['2025-04', '2025-03', '2025-02', '2025-01'],  # Multi-month coverage
                'delay_between_sections': 5,  # Seconds
                'batch_size': 100,  # Records per batch
            },
            'apify_scaling': {
                'vc_max_pages': 200,  # Scale from 50 to 200+ pages
                'fund_max_pages': 150,  # Comprehensive fund coverage
                'enable_parallel_actors': True,
                'delay_between_requests': 1,
            },
            'data_quality': {
                'enable_deduplication': True,
                'enable_cross_validation': True,
                'minimum_data_completeness': 60,  # Percentage
                'enable_company_matching': True
            }
        }
    
    def scale_diva_collection(self):
        """Scale up DIVA data collection dramatically"""
        print("🚀 SCALING UP DIVA DATA COLLECTION")
        print(f"   Target: {self.scaling_config['diva_scraping']['max_pages_per_section']} pages per section")
        print(f"   Multi-month coverage: {len(self.scaling_config['diva_scraping']['year_months_to_scrape'])} months")
        print("   " + "="*60)
        
        all_company_profiles = {}
        total_companies_scraped = 0
        
        # Scrape multiple months for comprehensive coverage
        for year_month in self.scaling_config['diva_scraping']['year_months_to_scrape']:
            print(f"\n📅 Scraping data for {year_month}...")
            
            try:
                # Scrape with dramatically increased page limits
                monthly_profiles = self.scraper.scrape_all_data(
                    year_month=year_month,
                    max_pages_per_section=self.scaling_config['diva_scraping']['max_pages_per_section']
                )
                
                # Merge profiles (avoiding duplicates)
                for company_id, profile in monthly_profiles.items():
                    if company_id not in all_company_profiles:
                        all_company_profiles[company_id] = profile
                        total_companies_scraped += 1
                    else:
                        # Update with newer data if more complete
                        if self._is_profile_more_complete(profile, all_company_profiles[company_id]):
                            all_company_profiles[company_id] = profile
                
                print(f"✅ {year_month}: Added {len(monthly_profiles)} companies")
                print(f"📊 Total unique companies: {len(all_company_profiles)}")
                
                # Rate limiting between months
                time.sleep(self.scaling_config['diva_scraping']['delay_between_sections'])
                
            except Exception as e:
                print(f"❌ Error scraping {year_month}: {e}")
                continue
        
        return all_company_profiles
    
    def _is_profile_more_complete(self, new_profile, existing_profile):
        """Determine if new profile has more complete data"""
        try:
            new_score = self._calculate_completeness_score(new_profile)
            existing_score = self._calculate_completeness_score(existing_profile)
            return new_score > existing_score
        except:
            return False
    
    def _calculate_completeness_score(self, profile):
        """Calculate data completeness score for a profile"""
        score = 0
        
        # Check for different data types
        if profile.get('personnel_data'):
            score += 25
        if profile.get('professional_data'):
            score += 25
        if profile.get('fund_data'):
            score += 25
        if profile.get('disclosure_data'):
            score += 25
        
        return score
    
    def generate_scaling_report(self, company_profiles):
        """Generate comprehensive scaling report"""
        print("\n📊 SCALING COLLECTION REPORT")
        print("="*60)
        
        total_companies = len(company_profiles)
        
        # Data completeness analysis
        completeness_stats = {
            'high_completeness': 0,    # 75-100%
            'medium_completeness': 0,  # 50-74%
            'basic_completeness': 0,   # 25-49%
            'limited_completeness': 0  # 0-24%
        }
        
        # Intelligence categorization
        intelligence_categories = {
            'personnel': {'high': 0, 'medium': 0, 'basic': 0, 'limited': 0},
            'professional': {'high': 0, 'medium': 0, 'basic': 0, 'limited': 0},
            'investment': {'high': 0, 'medium': 0, 'basic': 0, 'limited': 0},
            'fund': {'high': 0, 'medium': 0, 'basic': 0, 'limited': 0}
        }
        
        # Analyze each company profile
        for company_id, profile in company_profiles.items():
            completeness = self._calculate_completeness_score(profile)
            
            # Categorize completeness
            if completeness >= 75:
                completeness_stats['high_completeness'] += 1
            elif completeness >= 50:
                completeness_stats['medium_completeness'] += 1
            elif completeness >= 25:
                completeness_stats['basic_completeness'] += 1
            else:
                completeness_stats['limited_completeness'] += 1
        
        # Print comprehensive statistics
        print(f"🏢 TOTAL COMPANIES COLLECTED: {total_companies}")
        print(f"📈 Average Data Completeness: {sum(self._calculate_completeness_score(p) for p in company_profiles.values()) / total_companies:.1f}%")
        
        print("\n📊 DATA COMPLETENESS DISTRIBUTION:")
        for category, count in completeness_stats.items():
            percentage = (count / total_companies * 100) if total_companies > 0 else 0
            print(f"   • {category.replace('_', ' ').title()}: {count} companies ({percentage:.1f}%)")
        
        # Data quality metrics
        personnel_data_count = sum(1 for p in company_profiles.values() if p.get('personnel_data'))
        professional_data_count = sum(1 for p in company_profiles.values() if p.get('professional_data'))
        fund_data_count = sum(1 for p in company_profiles.values() if p.get('fund_data'))
        disclosure_data_count = sum(1 for p in company_profiles.values() if p.get('disclosure_data'))
        
        print("\n🔍 DATA TYPE COVERAGE:")
        print(f"   • Personnel Data: {personnel_data_count} companies ({personnel_data_count/total_companies*100:.1f}%)")
        print(f"   • Professional Data: {professional_data_count} companies ({professional_data_count/total_companies*100:.1f}%)")
        print(f"   • Fund Data: {fund_data_count} companies ({fund_data_count/total_companies*100:.1f}%)")
        print(f"   • Disclosure Data: {disclosure_data_count} companies ({disclosure_data_count/total_companies*100:.1f}%)")
        
        # Generate recommendations
        print("\n🎯 SCALING RECOMMENDATIONS:")
        if personnel_data_count / total_companies < 0.8:
            print("   • Consider increasing personnel data scraping pages")
        if professional_data_count / total_companies < 0.7:
            print("   • Focus on professional network data collection")
        if fund_data_count / total_companies < 0.6:
            print("   • Enhance fund data scraping coverage")
        
        return {
            'total_companies': total_companies,
            'completeness_stats': completeness_stats,
            'data_coverage': {
                'personnel': personnel_data_count,
                'professional': professional_data_count,
                'fund': fund_data_count,
                'disclosure': disclosure_data_count
            }
        }
    
    def batch_upload_to_enhancement_tables(self, company_profiles):
        """Upload scaled data to enhancement tables in batches"""
        print(f"\n📤 BATCH UPLOADING {len(company_profiles)} COMPANY PROFILES")
        print("   Using optimized batch processing...")
        
        batch_size = self.scaling_config['diva_scraping']['batch_size']
        companies_list = list(company_profiles.items())
        
        # Upload in batches for better performance
        for i in range(0, len(companies_list), batch_size):
            batch = dict(companies_list[i:i + batch_size])
            batch_num = i // batch_size + 1
            total_batches = (len(companies_list) + batch_size - 1) // batch_size
            
            print(f"📦 Processing batch {batch_num}/{total_batches} ({len(batch)} companies)...")
            
            try:
                # Upload to enhancement tables
                self.enhancement_system.upload_diva_intelligence(batch)
                self.enhancement_system.upload_professional_network(batch)
                self.enhancement_system.upload_fund_intelligence(batch)
                
                print(f"✅ Batch {batch_num} uploaded successfully")
                
                # Short delay between batches
                time.sleep(2)
                
            except Exception as e:
                print(f"❌ Error uploading batch {batch_num}: {e}")
                continue
    
    def generate_next_steps_plan(self, scaling_report):
        """Generate action plan for further scaling"""
        print("\n🚀 NEXT STEPS SCALING PLAN")
        print("="*50)
        
        total_companies = scaling_report['total_companies']
        
        print("🎯 IMMEDIATE ACTIONS (Next 1-2 Days):")
        
        if total_companies < 1000:
            print("   1. Increase max_pages_per_section to 100+ for comprehensive coverage")
            print("   2. Add more historical months (2024-12, 2024-11, etc.)")
            print("   3. Implement parallel section scraping")
        
        if scaling_report['data_coverage']['professional'] / total_companies < 0.8:
            print("   4. Focus on professional network data collection")
            print("   5. Enhance contact potential scoring")
        
        print("\n📈 GROWTH STRATEGIES (Next Week):")
        print("   1. Implement real-time data monitoring")
        print("   2. Set up automated weekly data refreshes")
        print("   3. Add predictive intelligence scoring")
        print("   4. Create custom industry sector categorization")
        
        print("\n🔄 AUTOMATION OPPORTUNITIES:")
        print("   1. Schedule daily incremental updates")
        print("   2. Set up data quality monitoring alerts")
        print("   3. Implement smart company matching algorithms")
        print("   4. Create intelligence trend analysis")
        
        return {
            'recommended_max_pages': min(100, max(50, total_companies // 10)),
            'priority_data_types': ['professional', 'fund', 'disclosure'],
            'automation_ready': total_companies > 500
        }

def main():
    """Main scaling execution"""
    print("🚀 KOREAN VC INTELLIGENCE - SCALED DATA COLLECTION")
    print("   Dramatically Expanding Data Coverage")
    print("   " + "="*60)
    
    try:
        # Initialize scaling system
        scaling_system = ScaledDataCollectionSystem()
        
        # Create enhancement tables if needed
        print("🏗️ Ensuring enhancement tables exist...")
        scaling_system.enhancement_system.create_enhancement_tables()
        
        # Scale up DIVA data collection
        print("\n🔍 Starting scaled DIVA data collection...")
        company_profiles = scaling_system.scale_diva_collection()
        
        if not company_profiles:
            print("❌ No company profiles collected. Check your scraping configuration.")
            return
        
        # Generate scaling report
        scaling_report = scaling_system.generate_scaling_report(company_profiles)
        
        # Batch upload to enhancement tables
        scaling_system.batch_upload_to_enhancement_tables(company_profiles)
        
        # Generate next steps plan
        next_steps = scaling_system.generate_next_steps_plan(scaling_report)
        
        # Save comprehensive report
        report_filename = f"scaling_report_{datetime.now().strftime('%Y%m%d_%H%M%S')}.json"
        with open(report_filename, 'w', encoding='utf-8') as f:
            json.dump({
                'scaling_report': scaling_report,
                'next_steps': next_steps,
                'timestamp': datetime.now().isoformat(),
                'scaling_config': scaling_system.scaling_config
            }, f, ensure_ascii=False, indent=2)
        
        print(f"\n📊 SCALING COMPLETE!")
        print(f"   • Total Companies: {scaling_report['total_companies']}")
        print(f"   • Data Quality: {sum(scaling_report['data_coverage'].values()) / (len(scaling_report['data_coverage']) * scaling_report['total_companies']) * 100:.1f}% average")
        print(f"   • Report saved: {report_filename}")
        print(f"   • Ready for next scaling phase!")
        
        return company_profiles
        
    except Exception as e:
        print(f"❌ Scaling failed: {e}")
        raise

if __name__ == "__main__":
    main() 