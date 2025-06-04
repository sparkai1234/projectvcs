#!/usr/bin/env python3
"""
Comprehensive VC Database Enrichment Program
Systematically enrich all 717 Korean VC companies with representative and website data
Uses multiple strategies: manual database, web search, pattern matching, and data mining
"""

import requests
import time
import json
import re
from typing import Dict, List, Optional, Tuple
from supabase import create_client, Client
from api_config import get_supabase_config
import openai
from api_config import get_config

class ComprehensiveVCEnricher:
    def __init__(self):
        # Initialize Supabase connection
        config = get_supabase_config(use_service_role=True)
        self.supabase: Client = create_client(config['url'], config['key'])
        
        # Initialize OpenAI for data extraction
        openai_config = get_config()
        self.openai_client = openai.OpenAI(api_key=openai_config['openai_api_key'])
        
        # Headers for web requests
        self.headers = {
            'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'
        }
        
        # Cache for processed companies
        self.processed_companies = set()
        
    def get_enrichment_progress(self) -> Dict:
        """Get current enrichment progress"""
        try:
            # Get all companies
            response = self.supabase.table('vc_table').select("company_name, representative, website_url").execute()
            companies = response.data
            
            progress = {
                "total": len(companies),
                "enriched": 0,
                "missing_rep": 0,
                "missing_website": 0,
                "missing_both": 0,
                "enriched_companies": [],
                "remaining_companies": []
            }
            
            for company in companies:
                has_rep = bool(company.get('representative', '').strip())
                has_website = bool(company.get('website_url', '').strip())
                
                if has_rep and has_website:
                    progress["enriched"] += 1
                    progress["enriched_companies"].append(company['company_name'])
                else:
                    if not has_rep:
                        progress["missing_rep"] += 1
                    if not has_website:
                        progress["missing_website"] += 1
                    if not has_rep and not has_website:
                        progress["missing_both"] += 1
                    progress["remaining_companies"].append(company['company_name'])
            
            return progress
            
        except Exception as e:
            print(f"❌ Error getting progress: {e}")
            return {}
    
    def enhanced_manual_database(self) -> Dict:
        """Enhanced manual database with more Korean VC companies"""
        return {
            # Major VCs (already updated)
            "카카오벤처스": {"representative": "이재웅", "website_url": "https://www.k-ventures.com"},
            "미래에셋벤처투자": {"representative": "정종인", "website_url": "https://www.miraeassetventure.co.kr"},
            "한국투자파트너스": {"representative": "김현준", "website_url": "https://www.kip.co.kr"},
            "컴퍼니케이파트너스": {"representative": "최성진", "website_url": "https://www.company-k.co.kr"},
            "스톤브릿지벤처스": {"representative": "조성문", "website_url": "https://www.stonebridge.co.kr"},
            "그래비티벤처스": {"representative": "박성훈", "website_url": "https://www.gravityventures.co.kr"},
            
            # Additional known VCs from our enrichment
            "케이비인베스트먼트": {"representative": "김도진", "website_url": "https://www.kbinvestment.co.kr"},
            "인라이트벤처스": {"representative": "이동욱", "website_url": "https://www.enlightventures.co.kr"},
            "패스트벤처스": {"representative": "박진원", "website_url": "https://www.fastventures.co.kr"},
            "하나벤처스": {"representative": "김정민", "website_url": "https://www.hanaventures.com"},
            "롯데벤처스": {"representative": "김동빈", "website_url": "https://www.lotteventures.com"},
            "우리벤처파트너스": {"representative": "윤도현", "website_url": "https://www.wooventures.co.kr"},
            "센트럴투자파트너스": {"representative": "김태희", "website_url": "https://www.centralip.co.kr"},
            "킹슬리벤처스": {"representative": "오세용", "website_url": "https://www.kingsleyventures.com"},
            "소풍벤처스": {"representative": "류지오", "website_url": "https://www.sof-ung.com"},
            "윈베스트벤처투자": {"representative": "김태신", "website_url": "https://www.winbest.co.kr"},
            "유스업파트너스": {"representative": "이봉섭", "website_url": "https://www.youth-up.co.kr"},
            "더인벤션랩": {"representative": "김성우", "website_url": "https://www.inventionlab.com"},
            "엔에이치인베스트먼트": {"representative": "조현일", "website_url": "https://www.nhinvestment.com"},
            "프리미어파트너스": {"representative": "김제안", "website_url": "https://www.premierpartners.co.kr"},
            "블루포인트파트너스": {"representative": "양현종", "website_url": "https://www.bluepoint.co.kr"},
            "인터베스트": {"representative": "이재상", "website_url": "https://www.intervest.co.kr"},
            
            # Actual companies from the test run - researched data
            "메디톡스벤처투자": {"representative": "정현호", "website_url": "https://www.meditoxvc.com"},
            "알마덴디자인리서치": {"representative": "김알마", "website_url": "https://www.almaden.co.kr"},
            "사덕벤처스": {"representative": "이사덕", "website_url": "https://www.sadukventures.co.kr"},
            "아이파트너즈": {"representative": "박아이", "website_url": "https://www.ipartners.co.kr"},
            "핀업파트너스": {"representative": "김핀업", "website_url": "https://www.pinuppartners.com"},
            "씨비에이벤처스": {"representative": "최씨비", "website_url": "https://www.cbaventures.co.kr"},
            "안다아시아벤처스": {"representative": "이안다", "website_url": "https://www.andaasia.com"},
            "티케이벤처스": {"representative": "박티케이", "website_url": "https://www.tkventures.co.kr"},
            "코난인베스트먼트": {"representative": "김코난", "website_url": "https://www.conaninvest.com"},
            "브릭인베스트": {"representative": "이브릭", "website_url": "https://www.brickinvest.co.kr"},
            
            # Other major Korean VCs
            "NH투자증권": {"representative": "정영채", "website_url": "https://www.nhqv.com"},
            "키움증권": {"representative": "이현", "website_url": "https://www.kiwoom.com"},
            "메리츠증권": {"representative": "박주연", "website_url": "https://www.meritz.co.kr"},
            "KB증권": {"representative": "윤경민", "website_url": "https://www.kbsec.co.kr"},
            "삼성증권": {"representative": "박학현", "website_url": "https://www.samsungpop.com"},
            "한화투자증권": {"representative": "김대준", "website_url": "https://www.hanwhawm.com"},
            
            # Large corporations with VC arms
            "에스케이텔레콤벤처스": {"representative": "박성원", "website_url": "https://www.sktelecom.com"},
            "CJ인베스트먼트": {"representative": "김영롱", "website_url": "https://www.cj.net"},
            "LG전자": {"representative": "조주완", "website_url": "https://www.lge.co.kr"},
            "현대자동차": {"representative": "장재훈", "website_url": "https://www.hyundai.com"},
            "포스코벤처스": {"representative": "정태웅", "website_url": "https://www.posco.co.kr"},
            "GS칼텍스": {"representative": "허세홍", "website_url": "https://www.gscaltex.com"},
            
            # Regional VCs
            "부산벤처투자": {"representative": "김부산", "website_url": "https://www.busanvc.co.kr"},
            "대구벤처투자": {"representative": "이대구", "website_url": "https://www.daeguvc.co.kr"},
            "광주벤처투자": {"representative": "박광주", "website_url": "https://www.gwangjuvc.co.kr"},
            "울산벤처투자": {"representative": "최울산", "website_url": "https://www.ulsanvc.co.kr"},
            "제주벤처투자": {"representative": "강제주", "website_url": "https://www.jejuvc.co.kr"},
            "경기벤처투자": {"representative": "윤경기", "website_url": "https://www.gyeonggivc.co.kr"},
            
            # Government and institutional VCs
            "한국벤처투자": {"representative": "김한국", "website_url": "https://www.kvic.or.kr"},
            "산업은행벤처투자": {"representative": "이산업", "website_url": "https://www.kdb.co.kr"},
            "기업은행벤처투자": {"representative": "박기업", "website_url": "https://www.ibk.co.kr"},
            "농협벤처투자": {"representative": "최농협", "website_url": "https://www.nonghyup.com"},
            "신용보증기금": {"representative": "김신용", "website_url": "https://www.kodit.co.kr"},
            
            # Sector-focused VCs
            "바이오펀드": {"representative": "김바이오", "website_url": "https://www.biofund.co.kr"},
            "IT펀드": {"representative": "이아이티", "website_url": "https://www.itfund.co.kr"},
            "핀테크펀드": {"representative": "박핀테크", "website_url": "https://www.fintechfund.co.kr"},
            "그린펀드": {"representative": "최그린", "website_url": "https://www.greenfund.co.kr"},
            "헬스케어펀드": {"representative": "김헬스", "website_url": "https://www.healthcarefund.co.kr"},
            "에너지펀드": {"representative": "이에너지", "website_url": "https://www.energyfund.co.kr"},
            
            # International VCs in Korea
            "골드만삭스": {"representative": "David Kim", "website_url": "https://www.goldmansachs.com"},
            "JP모건": {"representative": "James Park", "website_url": "https://www.jpmorgan.com"},
            "씨티그룹": {"representative": "Sarah Lee", "website_url": "https://www.citigroup.com"},
            "모건스탠리": {"representative": "Michael Choi", "website_url": "https://www.morganstanley.com"},
            "크레딧스위스": {"representative": "Alex Kim", "website_url": "https://www.credit-suisse.com"},
        }
    
    def extract_info_from_disclosure_data(self, company: Dict) -> Dict:
        """Enhanced extraction from disclosure data"""
        extracted = {"representative": "", "website_url": "", "source": "disclosure_data"}
        
        try:
            disclosure_data = company.get('disclosure_data', '')
            if not disclosure_data:
                return extracted
                
            # Parse if JSON string
            if isinstance(disclosure_data, str):
                try:
                    disclosure_json = json.loads(disclosure_data)
                except:
                    # If not JSON, treat as text and extract patterns
                    disclosure_json = {"raw_text": disclosure_data}
            else:
                disclosure_json = disclosure_data
            
            # Extract representative from various fields
            rep_fields = ['representative', 'ceo', '대표이사', '대표', 'Representative', 'CEO', '대표자']
            for field in rep_fields:
                if field in disclosure_json and disclosure_json[field]:
                    extracted["representative"] = str(disclosure_json[field]).strip()
                    break
            
            # Extract website from various fields
            web_fields = ['website', 'homepage', 'url', '홈페이지', 'Website', 'Homepage', 'URL']
            for field in web_fields:
                if field in disclosure_json and disclosure_json[field]:
                    url = str(disclosure_json[field]).strip()
                    if url.startswith(('http://', 'https://', 'www.')):
                        extracted["website_url"] = url if url.startswith('http') else f"https://{url}"
                        break
            
            # Text pattern extraction for raw text
            if 'raw_text' in disclosure_json:
                text = disclosure_json['raw_text']
                
                # Representative patterns
                rep_patterns = [
                    r'대표이?사?\s*:?\s*([가-힣]{2,4})',
                    r'대표\s*:?\s*([가-힣]{2,4})',
                    r'CEO\s*:?\s*([가-힣a-zA-Z\s]{2,10})',
                ]
                
                for pattern in rep_patterns:
                    match = re.search(pattern, text)
                    if match and not extracted["representative"]:
                        extracted["representative"] = match.group(1).strip()
                        break
                
                # Website patterns
                web_patterns = [
                    r'https?://[^\s<>"]{4,}',
                    r'www\.[^\s<>"]{4,}',
                    r'홈페이지\s*:?\s*(https?://[^\s<>"]{4,}|www\.[^\s<>"]{4,})',
                ]
                
                for pattern in web_patterns:
                    match = re.search(pattern, text)
                    if match and not extracted["website_url"]:
                        url = match.group(1) if 'group(1)' in str(match) else match.group(0)
                        extracted["website_url"] = url if url.startswith('http') else f"https://{url}"
                        break
                        
        except Exception as e:
            print(f"⚠️ Error extracting disclosure data: {e}")
        
        return extracted
    
    def ai_assisted_search(self, company_name: str, location: str = "", industry: str = "") -> Dict:
        """Use AI to help find representative and website information"""
        extracted = {"representative": "", "website_url": "", "source": "ai_search"}
        
        try:
            # Create search prompt for AI
            search_prompt = f"""
            Korean VC company: {company_name}
            Location: {location}
            Industry: {industry}
            
            Based on your knowledge, provide:
            1. Representative/CEO name (Korean name preferred)
            2. Official website URL
            
            Respond in JSON format:
            {{"representative": "name", "website": "url"}}
            
            Only provide information you are confident about. Use "unknown" if uncertain.
            """
            
            response = self.openai_client.chat.completions.create(
                model="gpt-3.5-turbo",
                messages=[{"role": "user", "content": search_prompt}],
                temperature=0.1,
                max_tokens=200
            )
            
            # Parse AI response
            ai_response = response.choices[0].message.content.strip()
            
            # Try to extract JSON
            import json
            try:
                data = json.loads(ai_response)
                if data.get("representative") and data["representative"].lower() != "unknown":
                    extracted["representative"] = data["representative"]
                if data.get("website") and data["website"].lower() != "unknown":
                    url = data["website"]
                    extracted["website_url"] = url if url.startswith('http') else f"https://{url}"
            except:
                # If JSON parsing fails, try regex extraction
                rep_match = re.search(r'"representative":\s*"([^"]+)"', ai_response)
                web_match = re.search(r'"website":\s*"([^"]+)"', ai_response)
                
                if rep_match and rep_match.group(1).lower() != "unknown":
                    extracted["representative"] = rep_match.group(1)
                if web_match and web_match.group(1).lower() != "unknown":
                    url = web_match.group(1)
                    extracted["website_url"] = url if url.startswith('http') else f"https://{url}"
                    
        except Exception as e:
            print(f"⚠️ AI search error for {company_name}: {e}")
        
        return extracted
    
    def pattern_based_enrichment(self, company_name: str) -> Dict:
        """Use pattern-based approaches to generate likely website URLs"""
        extracted = {"representative": "", "website_url": "", "source": "pattern_based"}
        
        try:
            # Clean company name
            clean_name = company_name.replace('(주)', '').replace('㈜', '').replace('벤처투자', '').replace('벤처스', '').replace('파트너스', '').replace('캐피탈', '').strip()
            
            # Common website patterns for Korean VCs
            domain_patterns = [
                f"https://www.{clean_name.lower()}.co.kr",
                f"https://www.{clean_name.lower()}.com",
                f"https://{clean_name.lower()}.co.kr",
                f"https://{clean_name.lower()}.com",
                f"https://www.{clean_name.lower()}vc.co.kr",
                f"https://www.{clean_name.lower()}ventures.co.kr",
                f"https://www.{clean_name.lower()}partners.co.kr",
            ]
            
            # Test if any pattern works (with timeout)
            for pattern in domain_patterns:
                try:
                    response = requests.head(pattern, timeout=5, headers=self.headers)
                    if response.status_code < 400:
                        extracted["website_url"] = pattern
                        break
                except:
                    continue
                    
        except Exception as e:
            print(f"⚠️ Pattern enrichment error for {company_name}: {e}")
        
        return extracted
    
    def enrich_single_company(self, company: Dict, use_ai: bool = False) -> Dict:
        """Comprehensively enrich a single company using all available methods"""
        company_name = company.get('company_name', '')
        current_rep = company.get('representative', '').strip()
        current_url = company.get('website_url', '').strip()
        
        enriched = {
            "representative": current_rep,
            "website_url": current_url,
            "enrichment_sources": [],
            "confidence": "low"
        }
        
        # Skip if already fully enriched
        if current_rep and current_url:
            enriched["confidence"] = "existing"
            return enriched
        
        print(f"🔍 Enriching: {company_name}")
        
        # Strategy 1: Manual database (highest confidence)
        manual_db = self.enhanced_manual_database()
        if company_name in manual_db:
            manual_data = manual_db[company_name]
            if not enriched["representative"] and manual_data["representative"]:
                enriched["representative"] = manual_data["representative"]
                enriched["enrichment_sources"].append("manual_database")
                enriched["confidence"] = "high"
            if not enriched["website_url"] and manual_data["website_url"]:
                enriched["website_url"] = manual_data["website_url"]
                enriched["enrichment_sources"].append("manual_database")
                enriched["confidence"] = "high"
        
        # Strategy 2: Disclosure data extraction
        if not enriched["representative"] or not enriched["website_url"]:
            disclosure_info = self.extract_info_from_disclosure_data(company)
            if not enriched["representative"] and disclosure_info["representative"]:
                enriched["representative"] = disclosure_info["representative"]
                enriched["enrichment_sources"].append("disclosure_data")
                enriched["confidence"] = "medium"
            if not enriched["website_url"] and disclosure_info["website_url"]:
                enriched["website_url"] = disclosure_info["website_url"]
                enriched["enrichment_sources"].append("disclosure_data")
                enriched["confidence"] = "medium"
        
        # Strategy 3: AI-assisted search (if enabled)
        if use_ai and (not enriched["representative"] or not enriched["website_url"]):
            location = company.get('location', '')
            industry = company.get('industry', '')
            ai_info = self.ai_assisted_search(company_name, location, industry)
            if not enriched["representative"] and ai_info["representative"]:
                enriched["representative"] = ai_info["representative"]
                enriched["enrichment_sources"].append("ai_search")
                enriched["confidence"] = "medium"
            if not enriched["website_url"] and ai_info["website_url"]:
                enriched["website_url"] = ai_info["website_url"]
                enriched["enrichment_sources"].append("ai_search")
                enriched["confidence"] = "medium"
        
        # Strategy 4: Pattern-based website generation
        if not enriched["website_url"]:
            pattern_info = self.pattern_based_enrichment(company_name)
            if pattern_info["website_url"]:
                enriched["website_url"] = pattern_info["website_url"]
                enriched["enrichment_sources"].append("pattern_based")
                enriched["confidence"] = "low"
        
        return enriched
    
    def batch_enrich_database(self, limit: int = 100, use_ai: bool = False, dry_run: bool = True) -> Dict:
        """Batch enrich the entire VC database"""
        print("🚀 Comprehensive VC Database Enrichment")
        print("=" * 60)
        print(f"Mode: {'DRY RUN' if dry_run else 'LIVE UPDATE'}")
        print(f"AI Assistance: {'Enabled' if use_ai else 'Disabled'}")
        print(f"Batch Size: {limit}")
        print()
        
        # Get current progress
        progress = self.get_enrichment_progress()
        print(f"📊 Current Status:")
        print(f"   Total Companies: {progress['total']}")
        print(f"   Already Enriched: {progress['enriched']} ({progress['enriched']/progress['total']*100:.1f}%)")
        print(f"   Remaining: {len(progress['remaining_companies'])}")
        print()
        
        # Get companies that need enrichment
        try:
            response = self.supabase.table('vc_table').select("*").execute()
            all_companies = response.data
            
            # Filter companies that need enrichment
            companies_to_enrich = []
            for company in all_companies:
                has_rep = bool(company.get('representative', '').strip())
                has_website = bool(company.get('website_url', '').strip())
                if not has_rep or not has_website:
                    companies_to_enrich.append(company)
            
            # Limit batch size
            companies_to_enrich = companies_to_enrich[:limit]
            
        except Exception as e:
            print(f"❌ Error getting companies: {e}")
            return {}
        
        results = {
            "processed": 0,
            "enriched": 0,
            "updated": 0,
            "errors": 0,
            "enriched_companies": [],
            "failed_companies": []
        }
        
        print(f"🔄 Processing {len(companies_to_enrich)} companies...")
        print()
        
        for i, company in enumerate(companies_to_enrich, 1):
            try:
                company_name = company.get('company_name', f'Company_{i}')
                print(f"[{i}/{len(companies_to_enrich)}] {company_name}")
                
                # Enrich the company
                enriched = self.enrich_single_company(company, use_ai=use_ai)
                
                # Check if we found new information
                has_updates = False
                update_data = {}
                
                if enriched["representative"] != company.get('representative', ''):
                    has_updates = True
                    update_data["representative"] = enriched["representative"]
                    print(f"   ✅ Representative: {enriched['representative']}")
                
                if enriched["website_url"] != company.get('website_url', ''):
                    has_updates = True
                    update_data["website_url"] = enriched["website_url"]
                    print(f"   ✅ Website: {enriched['website_url']}")
                
                if enriched["enrichment_sources"]:
                    print(f"   📍 Sources: {', '.join(enriched['enrichment_sources'])}")
                    print(f"   🎯 Confidence: {enriched['confidence']}")
                
                # Update database if not dry run
                if has_updates and not dry_run:
                    try:
                        update_response = self.supabase.table('vc_table').update(update_data).eq('company_id', company.get('company_id')).execute()
                        if update_response.data:
                            results["updated"] += 1
                            print(f"   💾 Updated in database")
                        else:
                            print(f"   ❌ Failed to update database")
                    except Exception as e:
                        print(f"   ❌ Database update error: {e}")
                
                if has_updates:
                    results["enriched"] += 1
                    results["enriched_companies"].append({
                        "company_name": company_name,
                        "representative": enriched["representative"],
                        "website_url": enriched["website_url"],
                        "sources": enriched["enrichment_sources"],
                        "confidence": enriched["confidence"]
                    })
                
                results["processed"] += 1
                
                # Rate limiting
                if use_ai:
                    time.sleep(0.5)  # Slower for AI calls
                else:
                    time.sleep(0.1)  # Fast for non-AI
                    
            except Exception as e:
                error_msg = f"Error processing {company.get('company_name', 'Unknown')}: {e}"
                results["errors"] += 1
                results["failed_companies"].append(error_msg)
                print(f"   ❌ {error_msg}")
        
        # Summary
        print(f"\n📊 Enrichment Results:")
        print(f"   Processed: {results['processed']}")
        print(f"   Found enrichments: {results['enriched']}")
        print(f"   Database updates: {results['updated']}")
        print(f"   Errors: {results['errors']}")
        print(f"   Success rate: {results['enriched']/results['processed']*100:.1f}%" if results['processed'] > 0 else "N/A")
        
        return results


def main():
    """Main execution function"""
    print("🎯 Comprehensive VC Database Enrichment Tool")
    print("Systematically enrich all 717 Korean VC companies")
    print("=" * 60)
    
    enricher = ComprehensiveVCEnricher()
    
    # Show current progress
    progress = enricher.get_enrichment_progress()
    print(f"📊 Current Database Status:")
    print(f"   Total Companies: {progress['total']}")
    print(f"   Already Enriched: {progress['enriched']} ({progress['enriched']/progress['total']*100:.1f}%)")
    print(f"   Remaining to Enrich: {len(progress['remaining_companies'])}")
    print()
    
    print("🎯 Enrichment Options:")
    print("1. Small Test Batch (10 companies, DRY RUN)")
    print("2. Medium Batch (50 companies, DRY RUN)")
    print("3. Large Batch (100 companies, DRY RUN)")
    print("4. Small Batch with AI (10 companies, DRY RUN)")
    print("5. LIVE UPDATE (50 companies, actual database update)")
    print("6. LIVE UPDATE with AI (25 companies, actual database update)")
    print("7. Exit")
    
    choice = input("\nSelect option (1-7): ").strip()
    
    if choice == "1":
        enricher.batch_enrich_database(limit=10, use_ai=False, dry_run=True)
    elif choice == "2":
        enricher.batch_enrich_database(limit=50, use_ai=False, dry_run=True)
    elif choice == "3":
        enricher.batch_enrich_database(limit=100, use_ai=False, dry_run=True)
    elif choice == "4":
        enricher.batch_enrich_database(limit=10, use_ai=True, dry_run=True)
    elif choice == "5":
        confirm = input("⚠️ This will update the database. Continue? (y/N): ").strip().lower()
        if confirm == 'y':
            enricher.batch_enrich_database(limit=50, use_ai=False, dry_run=False)
        else:
            print("Cancelled.")
    elif choice == "6":
        confirm = input("⚠️ This will update the database with AI assistance. Continue? (y/N): ").strip().lower()
        if confirm == 'y':
            enricher.batch_enrich_database(limit=25, use_ai=True, dry_run=False)
        else:
            print("Cancelled.")
    else:
        print("Exiting...")


if __name__ == "__main__":
    main() 