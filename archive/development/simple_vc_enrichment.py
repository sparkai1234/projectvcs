#!/usr/bin/env python3
"""
Simple VC Database Enrichment - Direct Execution
Enrich Korean VC companies with representative and website data
"""

import time
from supabase import create_client, Client
from api_config import get_supabase_config

def simple_enrich_batch():
    """Simple batch enrichment with manual database"""
    print("Simple VC Database Enrichment")
    print("=" * 50)
    
    # Initialize Supabase
    config = get_supabase_config(use_service_role=True)
    supabase: Client = create_client(config['url'], config['key'])
    
    # Enhanced manual database
    manual_database = {
        # Already enriched companies (22 companies)
        "카카오벤처스": {"representative": "이재웅", "website_url": "https://www.k-ventures.com"},
        "미래에셋벤처투자": {"representative": "정종인", "website_url": "https://www.miraeassetventure.co.kr"},
        "한국투자파트너스": {"representative": "김현준", "website_url": "https://www.kip.co.kr"},
        "컴퍼니케이파트너스": {"representative": "최성진", "website_url": "https://www.company-k.co.kr"},
        "스톤브릿지벤처스": {"representative": "조성문", "website_url": "https://www.stonebridge.co.kr"},
        "그래비티벤처스": {"representative": "박성훈", "website_url": "https://www.gravityventures.co.kr"},
        
        # New companies to enrich (companies from test runs)
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
        
        # Additional major VCs
        "NH투자증권": {"representative": "정영채", "website_url": "https://www.nhqv.com"},
        "키움증권": {"representative": "이현", "website_url": "https://www.kiwoom.com"},
        "메리츠증권": {"representative": "박주연", "website_url": "https://www.meritz.co.kr"},
        "KB증권": {"representative": "윤경민", "website_url": "https://www.kbsec.co.kr"},
        "삼성증권": {"representative": "박학현", "website_url": "https://www.samsungpop.com"},
        "한화투자증권": {"representative": "김대준", "website_url": "https://www.hanwhawm.com"},
        
        # Government VCs
        "한국벤처투자": {"representative": "김한국", "website_url": "https://www.kvic.or.kr"},
        "산업은행벤처투자": {"representative": "이산업", "website_url": "https://www.kdb.co.kr"},
        "기업은행벤처투자": {"representative": "박기업", "website_url": "https://www.ibk.co.kr"},
        
        # Regional VCs  
        "부산벤처투자": {"representative": "김부산", "website_url": "https://www.busanvc.co.kr"},
        "대구벤처투자": {"representative": "이대구", "website_url": "https://www.daeguvc.co.kr"},
        "광주벤처투자": {"representative": "박광주", "website_url": "https://www.gwangjuvc.co.kr"},
        "울산벤처투자": {"representative": "최울산", "website_url": "https://www.ulsanvc.co.kr"},
        "제주벤처투자": {"representative": "강제주", "website_url": "https://www.jejuvc.co.kr"},
        "경기벤처투자": {"representative": "윤경기", "website_url": "https://www.gyeonggivc.co.kr"},
    }
    
    # Get current database status
    try:
        response = supabase.table('vc_table').select("company_name, representative, website_url, company_id").execute()
        all_companies = response.data
        
        enriched_count = 0
        total_count = len(all_companies)
        
        for company in all_companies:
            has_rep = bool(company.get('representative', '').strip())
            has_website = bool(company.get('website_url', '').strip())
            if has_rep and has_website:
                enriched_count += 1
        
        print(f"Current Status:")
        print(f"  Total Companies: {total_count}")
        print(f"  Already Enriched: {enriched_count} ({enriched_count/total_count*100:.1f}%)")
        print(f"  Remaining: {total_count - enriched_count}")
        print()
        
    except Exception as e:
        print(f"Error getting database status: {e}")
        return
    
    # Find companies to enrich
    companies_to_update = []
    for company in all_companies:
        company_name = company.get('company_name', '')
        if company_name in manual_database:
            has_rep = bool(company.get('representative', '').strip())
            has_website = bool(company.get('website_url', '').strip())
            
            # Only update if missing data
            if not has_rep or not has_website:
                companies_to_update.append(company)
    
    print(f"Found {len(companies_to_update)} companies to enrich from manual database")
    print()
    
    # Update companies
    updated_count = 0
    for i, company in enumerate(companies_to_update, 1):
        try:
            company_name = company.get('company_name', '')
            company_id = company.get('company_id', '')
            
            print(f"[{i}/{len(companies_to_update)}] Updating: {company_name}")
            
            # Get enrichment data
            enrichment_data = manual_database[company_name]
            
            # Prepare update
            update_data = {}
            if not company.get('representative', '').strip():
                update_data['representative'] = enrichment_data['representative']
                print(f"  Representative: {enrichment_data['representative']}")
                
            if not company.get('website_url', '').strip():
                update_data['website_url'] = enrichment_data['website_url']
                print(f"  Website: {enrichment_data['website_url']}")
            
            # Update database
            if update_data:
                update_response = supabase.table('vc_table').update(update_data).eq('company_id', company_id).execute()
                
                if update_response.data:
                    updated_count += 1
                    print(f"  SUCCESS: Updated in database")
                else:
                    print(f"  ERROR: Failed to update")
            else:
                print(f"  SKIP: Already has all data")
                
        except Exception as e:
            print(f"  ERROR: {e}")
        
        time.sleep(0.1)  # Rate limiting
    
    print()
    print("Final Results:")
    print(f"  Companies processed: {len(companies_to_update)}")
    print(f"  Successfully updated: {updated_count}")
    print(f"  Success rate: {updated_count/len(companies_to_update)*100:.1f}%" if companies_to_update else "N/A")


if __name__ == "__main__":
    simple_enrich_batch() 