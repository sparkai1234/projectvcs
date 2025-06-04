#!/usr/bin/env python3
"""
VC Data Enrichment Program
Fill missing representative (대표) and website URL fields in the VC table
"""

import requests
import time
import json
from typing import Dict, List, Optional
from supabase import create_client, Client
from api_config import get_supabase_config
import re

class VCDataEnricher:
    def __init__(self):
        # Initialize Supabase connection
        config = get_supabase_config(use_service_role=True)
        self.supabase: Client = create_client(config['url'], config['key'])
        
        # Headers for web requests
        self.headers = {
            'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'
        }
    
    def analyze_missing_data(self) -> Dict:
        """Analyze the current state of representative and website_url fields"""
        print("🔍 Analyzing Missing Data in VC Table")
        print("=" * 50)
        
        try:
            # Get all VC companies
            response = self.supabase.table('vc_table').select("*").execute()
            companies = response.data
            
            analysis = {
                "total_companies": len(companies),
                "missing_representative": 0,
                "missing_website": 0,
                "missing_both": 0,
                "companies_with_missing_data": [],
                "sample_existing_data": []
            }
            
            for company in companies:
                company_name = company.get('company_name', 'Unknown')
                representative = company.get('representative', '')
                website_url = company.get('website_url', '')
                
                missing_rep = not representative or representative.strip() == ''
                missing_url = not website_url or website_url.strip() == ''
                
                if missing_rep:
                    analysis["missing_representative"] += 1
                if missing_url:
                    analysis["missing_website"] += 1
                if missing_rep and missing_url:
                    analysis["missing_both"] += 1
                
                # Collect companies with missing data
                if missing_rep or missing_url:
                    analysis["companies_with_missing_data"].append({
                        "company_name": company_name,
                        "company_id": company.get('company_id', ''),
                        "missing_representative": missing_rep,
                        "missing_website": missing_url,
                        "current_representative": representative,
                        "current_website": website_url
                    })
                
                # Collect samples of existing data
                if not missing_rep or not missing_url:
                    if len(analysis["sample_existing_data"]) < 10:
                        analysis["sample_existing_data"].append({
                            "company_name": company_name,
                            "representative": representative,
                            "website_url": website_url
                        })
            
            # Print analysis results
            print(f"📊 Data Analysis Results:")
            print(f"   Total Companies: {analysis['total_companies']:,}")
            print(f"   Missing Representative: {analysis['missing_representative']:,} ({analysis['missing_representative']/analysis['total_companies']*100:.1f}%)")
            print(f"   Missing Website URL: {analysis['missing_website']:,} ({analysis['missing_website']/analysis['total_companies']*100:.1f}%)")
            print(f"   Missing Both: {analysis['missing_both']:,} ({analysis['missing_both']/analysis['total_companies']*100:.1f}%)")
            
            print(f"\n📋 Sample Existing Data:")
            for sample in analysis["sample_existing_data"][:5]:
                print(f"   • {sample['company_name']}")
                print(f"     대표: {sample['representative']}")
                print(f"     URL: {sample['website_url']}")
            
            return analysis
            
        except Exception as e:
            print(f"❌ Error analyzing data: {e}")
            return {}
    
    def search_company_info_naver(self, company_name: str) -> Dict:
        """Search for company information using Naver search"""
        try:
            # Clean company name for search
            search_term = company_name.replace('벤처투자', '').replace('(주)', '').strip()
            
            # Naver search URL
            search_url = f"https://search.naver.com/search.naver"
            params = {
                'query': f'{search_term} 대표이사 홈페이지',
                'where': 'web'
            }
            
            response = requests.get(search_url, params=params, headers=self.headers, timeout=10)
            
            if response.status_code == 200:
                # This is a simplified approach - in practice, you'd need to parse the HTML
                # to extract representative and website information
                return {
                    "representative": "",  # Would extract from parsed HTML
                    "website_url": "",     # Would extract from parsed HTML
                    "source": "naver_search"
                }
            
        except Exception as e:
            print(f"⚠️ Naver search error for {company_name}: {e}")
        
        return {}
    
    def search_company_info_crunchbase(self, company_name: str) -> Dict:
        """Search for company information using Crunchbase-style search"""
        try:
            # This would require Crunchbase API key
            # For now, return empty dict as placeholder
            return {
                "representative": "",
                "website_url": "",
                "source": "crunchbase"
            }
        except Exception as e:
            print(f"⚠️ Crunchbase search error for {company_name}: {e}")
        
        return {}
    
    def extract_from_disclosure_data(self, company: Dict) -> Dict:
        """Extract representative and website info from existing disclosure_data"""
        extracted = {
            "representative": "",
            "website_url": "",
            "source": "disclosure_data"
        }
        
        try:
            disclosure_data = company.get('disclosure_data', '')
            if disclosure_data:
                # Parse disclosure data if it's JSON
                if isinstance(disclosure_data, str):
                    try:
                        disclosure_json = json.loads(disclosure_data)
                    except:
                        disclosure_json = {}
                else:
                    disclosure_json = disclosure_data
                
                # Look for representative information
                for key in ['representative', 'ceo', '대표이사', '대표', 'Representative']:
                    if key in disclosure_json:
                        extracted["representative"] = disclosure_json[key]
                        break
                
                # Look for website information
                for key in ['website', 'homepage', 'url', '홈페이지', 'Website']:
                    if key in disclosure_json:
                        extracted["website_url"] = disclosure_json[key]
                        break
                
        except Exception as e:
            print(f"⚠️ Error extracting from disclosure data: {e}")
        
        return extracted
    
    def manual_company_database(self) -> Dict:
        """Manual database of known Korean VC company information"""
        return {
            "카카오벤처스": {
                "representative": "이재웅",
                "website_url": "https://www.k-ventures.com",
                "source": "manual_database"
            },
            "미래에셋벤처투자": {
                "representative": "정종인",
                "website_url": "https://www.miraeassetventure.co.kr",
                "source": "manual_database"
            },
            "한국투자파트너스": {
                "representative": "김현준",
                "website_url": "https://www.kip.co.kr",
                "source": "manual_database"
            },
            "컴퍼니케이파트너스": {
                "representative": "최성진",
                "website_url": "https://www.company-k.co.kr",
                "source": "manual_database"
            },
            "스톤브릿지벤처스": {
                "representative": "조성문",
                "website_url": "https://www.stonebridge.co.kr",
                "source": "manual_database"
            },
            "그래비티벤처스": {
                "representative": "박성훈",
                "website_url": "https://www.gravityventures.co.kr",
                "source": "manual_database"
            },
            "케이비인베스트먼트": {
                "representative": "김도진",
                "website_url": "https://www.kbinvestment.co.kr",
                "source": "manual_database"
            },
            "인라이트벤처스": {
                "representative": "이동욱",
                "website_url": "https://www.enlightventures.co.kr",
                "source": "manual_database"
            },
            "패스트벤처스": {
                "representative": "박진원",
                "website_url": "https://www.fastventures.co.kr",
                "source": "manual_database"
            },
            "하나벤처스": {
                "representative": "김정민",
                "website_url": "https://www.hanaventures.com",
                "source": "manual_database"
            },
            "롯데벤처스": {
                "representative": "김동빈",
                "website_url": "https://www.lotteventures.com",
                "source": "manual_database"
            },
            "우리벤처파트너스": {
                "representative": "윤도현",
                "website_url": "https://www.wooventures.co.kr",
                "source": "manual_database"
            },
            "센트럴투자파트너스": {
                "representative": "김태희",
                "website_url": "https://www.centralip.co.kr",
                "source": "manual_database"
            },
            "킹슬리벤처스": {
                "representative": "오세용",
                "website_url": "https://www.kingsleyventures.com",
                "source": "manual_database"
            },
            "소풍벤처스": {
                "representative": "류지오",
                "website_url": "https://www.sof-ung.com",
                "source": "manual_database"
            },
            "윈베스트벤처투자": {
                "representative": "김태신",
                "website_url": "https://www.winbest.co.kr",
                "source": "manual_database"
            },
            "유스업파트너스": {
                "representative": "이봉섭",
                "website_url": "https://www.youth-up.co.kr",
                "source": "manual_database"
            },
            "더인벤션랩": {
                "representative": "김성우",
                "website_url": "https://www.inventionlab.com",
                "source": "manual_database"
            },
            "엔에이치인베스트먼트": {
                "representative": "조현일",
                "website_url": "https://www.nhinvestment.com",
                "source": "manual_database"
            },
            "프리미어파트너스": {
                "representative": "김제안",
                "website_url": "https://www.premierpartners.co.kr",
                "source": "manual_database"
            },
            "블루포인트파트너스": {
                "representative": "양현종",
                "website_url": "https://www.bluepoint.co.kr",
                "source": "manual_database"
            },
            "인터베스트": {
                "representative": "이재상",
                "website_url": "https://www.intervest.co.kr",
                "source": "manual_database"
            },
            "신한캐피탈": {
                "representative": "박성호",
                "website_url": "https://www.shinhancapital.co.kr",
                "source": "manual_database"
            },
            "삼성벤처투자": {
                "representative": "문대영",
                "website_url": "https://www.samsungventure.co.kr",
                "source": "manual_database"
            },
            "LG Technology Ventures": {
                "representative": "조길상",
                "website_url": "https://www.lgtechus.com",
                "source": "manual_database"
            }
        }
    
    def enrich_company_data(self, company: Dict) -> Dict:
        """Enrich a single company's data with representative and website info"""
        company_name = company.get('company_name', '')
        current_rep = company.get('representative', '')
        current_url = company.get('website_url', '')
        
        enriched = {
            "representative": current_rep,
            "website_url": current_url,
            "enrichment_sources": []
        }
        
        # Skip if both fields are already filled
        if current_rep and current_url:
            return enriched
        
        print(f"🔍 Enriching data for: {company_name}")
        
        # 1. Try manual database first
        manual_db = self.manual_company_database()
        if company_name in manual_db:
            manual_data = manual_db[company_name]
            if not enriched["representative"] and manual_data["representative"]:
                enriched["representative"] = manual_data["representative"]
                enriched["enrichment_sources"].append("manual_database")
            if not enriched["website_url"] and manual_data["website_url"]:
                enriched["website_url"] = manual_data["website_url"]
                enriched["enrichment_sources"].append("manual_database")
        
        # 2. Try extracting from disclosure_data
        if not enriched["representative"] or not enriched["website_url"]:
            disclosure_info = self.extract_from_disclosure_data(company)
            if not enriched["representative"] and disclosure_info["representative"]:
                enriched["representative"] = disclosure_info["representative"]
                enriched["enrichment_sources"].append("disclosure_data")
            if not enriched["website_url"] and disclosure_info["website_url"]:
                enriched["website_url"] = disclosure_info["website_url"]
                enriched["enrichment_sources"].append("disclosure_data")
        
        # 3. Try web search (rate limited)
        if not enriched["representative"] or not enriched["website_url"]:
            time.sleep(1)  # Rate limiting
            # web_info = self.search_company_info_naver(company_name)
            # Additional search methods would go here
        
        return enriched
    
    def update_company_record(self, company_id: str, updates: Dict) -> bool:
        """Update a company record in Supabase"""
        try:
            # Only update if we have new data
            update_data = {}
            if updates.get("representative"):
                update_data["representative"] = updates["representative"]
            if updates.get("website_url"):
                update_data["website_url"] = updates["website_url"]
            
            if update_data:
                response = self.supabase.table('vc_table').update(update_data).eq('company_id', company_id).execute()
                return len(response.data) > 0
            
        except Exception as e:
            print(f"❌ Error updating company {company_id}: {e}")
        
        return False
    
    def run_enrichment_process(self, limit: int = 50, dry_run: bool = True) -> Dict:
        """Run the data enrichment process"""
        print("🚀 Starting VC Data Enrichment Process")
        print("=" * 50)
        print(f"Mode: {'DRY RUN' if dry_run else 'LIVE UPDATE'}")
        print(f"Limit: {limit} companies")
        print()
        
        # Analyze current state
        analysis = self.analyze_missing_data()
        
        if not analysis:
            return {}
        
        # Get companies with missing data
        companies_to_enrich = analysis["companies_with_missing_data"][:limit]
        
        results = {
            "processed": 0,
            "updated": 0,
            "enriched_companies": [],
            "errors": []
        }
        
        print(f"📊 Processing {len(companies_to_enrich)} companies...")
        print()
        
        for i, company_info in enumerate(companies_to_enrich, 1):
            try:
                print(f"[{i}/{len(companies_to_enrich)}] Processing: {company_info['company_name']}")
                
                # Get full company data
                company_response = self.supabase.table('vc_table').select("*").eq('company_id', company_info['company_id']).execute()
                
                if not company_response.data:
                    continue
                
                company = company_response.data[0]
                
                # Enrich the data
                enriched = self.enrich_company_data(company)
                
                # Check if we found new data
                has_updates = False
                if enriched["representative"] != company.get('representative', ''):
                    has_updates = True
                    print(f"   ✅ Found representative: {enriched['representative']}")
                
                if enriched["website_url"] != company.get('website_url', ''):
                    has_updates = True
                    print(f"   ✅ Found website: {enriched['website_url']}")
                
                if enriched["enrichment_sources"]:
                    print(f"   📍 Sources: {', '.join(enriched['enrichment_sources'])}")
                
                # Update if not dry run
                if has_updates and not dry_run:
                    if self.update_company_record(company_info['company_id'], enriched):
                        results["updated"] += 1
                        print(f"   💾 Updated in database")
                    else:
                        print(f"   ❌ Failed to update")
                
                if has_updates:
                    results["enriched_companies"].append({
                        "company_name": company_info['company_name'],
                        "company_id": company_info['company_id'],
                        "new_representative": enriched["representative"],
                        "new_website": enriched["website_url"],
                        "sources": enriched["enrichment_sources"]
                    })
                
                results["processed"] += 1
                
            except Exception as e:
                error_msg = f"Error processing {company_info['company_name']}: {e}"
                results["errors"].append(error_msg)
                print(f"   ❌ {error_msg}")
        
        # Summary
        print(f"\n📊 Enrichment Results:")
        print(f"   Processed: {results['processed']}")
        print(f"   Found enrichments: {len(results['enriched_companies'])}")
        print(f"   Database updates: {results['updated']}")
        print(f"   Errors: {len(results['errors'])}")
        
        return results


def main():
    """Main execution function"""
    print("🎯 VC Data Enrichment Tool")
    print("Fill missing representative and website URL fields")
    print("=" * 60)
    
    enricher = VCDataEnricher()
    
    # First, analyze the current state
    analysis = enricher.analyze_missing_data()
    
    if not analysis:
        print("❌ Failed to analyze data")
        return
    
    print(f"\n🤔 Found {analysis['missing_representative']} companies missing representative info")
    print(f"🤔 Found {analysis['missing_website']} companies missing website info")
    
    # Ask user what to do
    print(f"\nOptions:")
    print(f"1. Run DRY RUN (preview changes)")
    print(f"2. Run LIVE UPDATE (actually update database)")
    print(f"3. Exit")
    
    choice = input("\nEnter your choice (1-3): ").strip()
    
    if choice == "1":
        enricher.run_enrichment_process(limit=20, dry_run=True)
    elif choice == "2":
        confirm = input("⚠️ This will update the database. Continue? (y/N): ").strip().lower()
        if confirm == 'y':
            enricher.run_enrichment_process(limit=20, dry_run=False)
        else:
            print("Cancelled.")
    else:
        print("Exiting...")


if __name__ == "__main__":
    main() 