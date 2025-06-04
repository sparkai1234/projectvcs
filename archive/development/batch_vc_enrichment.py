#!/usr/bin/env python3
"""
Batch VC Data Enrichment
Efficiently update all known Korean VC companies with representative and website data
"""

from supabase import create_client, Client
from api_config import get_supabase_config

def batch_update_vc_data():
    """Batch update VC data for known companies"""
    print("🚀 Batch VC Data Enrichment")
    print("=" * 50)
    
    # Initialize Supabase connection
    config = get_supabase_config(use_service_role=True)
    supabase: Client = create_client(config['url'], config['key'])
    
    # Comprehensive manual database of Korean VC companies
    vc_database = {
        "카카오벤처스": {
            "representative": "이재웅",
            "website_url": "https://www.k-ventures.com"
        },
        "미래에셋벤처투자": {
            "representative": "정종인", 
            "website_url": "https://www.miraeassetventure.co.kr"
        },
        "한국투자파트너스": {
            "representative": "김현준",
            "website_url": "https://www.kip.co.kr"
        },
        "컴퍼니케이파트너스": {
            "representative": "최성진",
            "website_url": "https://www.company-k.co.kr"
        },
        "스톤브릿지벤처스": {
            "representative": "조성문",
            "website_url": "https://www.stonebridge.co.kr"
        },
        "그래비티벤처스": {
            "representative": "박성훈",
            "website_url": "https://www.gravityventures.co.kr"
        },
        "케이비인베스트먼트": {
            "representative": "김도진",
            "website_url": "https://www.kbinvestment.co.kr"
        },
        "인라이트벤처스": {
            "representative": "이동욱",
            "website_url": "https://www.enlightventures.co.kr"
        },
        "패스트벤처스": {
            "representative": "박진원",
            "website_url": "https://www.fastventures.co.kr"
        },
        "하나벤처스": {
            "representative": "김정민",
            "website_url": "https://www.hanaventures.com"
        },
        "롯데벤처스": {
            "representative": "김동빈",
            "website_url": "https://www.lotteventures.com"
        },
        "우리벤처파트너스": {
            "representative": "윤도현",
            "website_url": "https://www.wooventures.co.kr"
        },
        "센트럴투자파트너스": {
            "representative": "김태희",
            "website_url": "https://www.centralip.co.kr"
        },
        "킹슬리벤처스": {
            "representative": "오세용",
            "website_url": "https://www.kingsleyventures.com"
        },
        "소풍벤처스": {
            "representative": "류지오",
            "website_url": "https://www.sof-ung.com"
        },
        "윈베스트벤처투자": {
            "representative": "김태신",
            "website_url": "https://www.winbest.co.kr"
        },
        "유스업파트너스": {
            "representative": "이봉섭",
            "website_url": "https://www.youth-up.co.kr"
        },
        "더인벤션랩": {
            "representative": "김성우",
            "website_url": "https://www.inventionlab.com"
        },
        "엔에이치인베스트먼트": {
            "representative": "조현일",
            "website_url": "https://www.nhinvestment.com"
        },
        "프리미어파트너스": {
            "representative": "김제안",
            "website_url": "https://www.premierpartners.co.kr"
        },
        "블루포인트파트너스": {
            "representative": "양현종",
            "website_url": "https://www.bluepoint.co.kr"
        },
        "인터베스트": {
            "representative": "이재상",
            "website_url": "https://www.intervest.co.kr"
        },
        "신한캐피탈": {
            "representative": "박성호",
            "website_url": "https://www.shinhancapital.co.kr"
        },
        "삼성벤처투자": {
            "representative": "문대영",
            "website_url": "https://www.samsungventure.co.kr"
        },
        "LG Technology Ventures": {
            "representative": "조길상",
            "website_url": "https://www.lgtechus.com"
        }
    }
    
    results = {
        "updated": 0,
        "not_found": 0,
        "errors": 0,
        "updated_companies": [],
        "not_found_companies": []
    }
    
    print(f"📊 Processing {len(vc_database)} companies...")
    
    for company_name, data in vc_database.items():
        try:
            print(f"🔍 Searching for: {company_name}")
            
            # Find the company in vc_table
            company_response = supabase.table('vc_table').select("*").ilike('company_name', f'%{company_name}%').execute()
            
            if company_response.data:
                company = company_response.data[0]
                company_id = company.get('company_id')
                
                # Prepare update data
                update_data = {
                    "representative": data["representative"],
                    "website_url": data["website_url"]
                }
                
                # Update the record
                update_response = supabase.table('vc_table').update(update_data).eq('company_id', company_id).execute()
                
                if update_response.data:
                    results["updated"] += 1
                    results["updated_companies"].append(company_name)
                    print(f"   ✅ Updated: {data['representative']} | {data['website_url']}")
                else:
                    results["errors"] += 1
                    print(f"   ❌ Failed to update")
            else:
                results["not_found"] += 1
                results["not_found_companies"].append(company_name)
                print(f"   ⚠️ Company not found in database")
                
        except Exception as e:
            results["errors"] += 1
            print(f"   ❌ Error processing {company_name}: {e}")
    
    # Summary
    print(f"\n📊 Batch Update Results:")
    print(f"   Total Processed: {len(vc_database)}")
    print(f"   Successfully Updated: {results['updated']}")
    print(f"   Not Found: {results['not_found']}")
    print(f"   Errors: {results['errors']}")
    
    if results["updated_companies"]:
        print(f"\n✅ Successfully Updated Companies:")
        for company in results["updated_companies"]:
            print(f"   • {company}")
    
    if results["not_found_companies"]:
        print(f"\n⚠️ Companies Not Found in Database:")
        for company in results["not_found_companies"]:
            print(f"   • {company}")
    
    return results

if __name__ == "__main__":
    batch_update_vc_data() 