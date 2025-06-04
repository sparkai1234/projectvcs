#!/usr/bin/env python3
"""
Verify 카카오벤처스 Data in VC Table
Check the exact data for 카카오벤처스 to confirm accuracy
"""

from supabase import create_client, Client
from api_config import get_supabase_config
import json

def verify_kakao_ventures_data():
    """Verify 카카오벤처스 data from vc_table"""
    print("🔍 Verifying 카카오벤처스 Data from VC Table")
    print("=" * 50)
    
    # Initialize Supabase connection
    config = get_supabase_config(use_service_role=True)
    supabase: Client = create_client(config['url'], config['key'])
    
    try:
        # Search for 카카오벤처스 with various possible name variations
        search_terms = ["카카오벤처스", "카카오", "Kakao Ventures", "kakao"]
        
        all_matches = []
        
        for term in search_terms:
            print(f"🔍 Searching for: {term}")
            
            # Search using ilike for case-insensitive partial match
            response = supabase.table('vc_table').select("*").ilike('company_name', f'%{term}%').execute()
            
            if response.data:
                for company in response.data:
                    if company not in all_matches:
                        all_matches.append(company)
                print(f"✅ Found {len(response.data)} matches for '{term}'")
            else:
                print(f"❌ No matches for '{term}'")
        
        if all_matches:
            print(f"\n📊 Total Unique Matches Found: {len(all_matches)}")
            print("=" * 50)
            
            for i, company in enumerate(all_matches, 1):
                print(f"\n🏢 Match #{i}: {company.get('company_name', 'N/A')}")
                print(f"   Company ID: {company.get('company_id', 'N/A')}")
                
                # Convert operating amount to 억원
                operating_amount = company.get('operating_amount', 0)
                if operating_amount:
                    # Fix: Display the database value directly as 억원 (as per user requirement)
                    print(f"   💰 운영자산: {operating_amount:.0f} 억원 (vcs.go.kr 기준)")
                else:
                    print(f"   💰 운영자산: N/A")
                
                print(f"   📍 위치: {company.get('location', 'N/A')}")
                print(f"   📅 설립일: {company.get('established_date', 'N/A')}")
                print(f"   🏭 업종: {company.get('industry', 'N/A')}")
                print(f"   📊 회사유형: {company.get('company_type', 'N/A')}")
                print(f"   📊 상태: {company.get('status', 'N/A')}")
                print(f"   🌐 웹사이트: {company.get('website_url', 'N/A')}")
                
                # Show contact info if available
                contact_info = company.get('contact_info', '')
                if contact_info:
                    print(f"   📞 연락처: {contact_info}")
                
                # Show disclosure data summary
                disclosure_data = company.get('disclosure_data', '')
                if disclosure_data:
                    print(f"   📋 상세정보 요약: {str(disclosure_data)[:100]}...")
            
            # Now check associated funds for the exact match
            exact_matches = [c for c in all_matches if '카카오벤처스' in c.get('company_name', '')]
            
            if exact_matches:
                kakao_company = exact_matches[0]
                company_id = kakao_company.get('company_id')
                
                print(f"\n💼 카카오벤처스 ({company_id}) 펀드 포트폴리오:")
                print("-" * 40)
                
                # Get associated funds
                funds_response = supabase.table('fund_table').select("*").eq('company_id', company_id).execute()
                funds = funds_response.data
                
                if funds:
                    total_fund_size = 0
                    print(f"   총 {len(funds)}개 펀드 운용중:")
                    
                    for fund in funds:
                        fund_name = fund.get('fund_name', 'N/A')
                        fund_size = fund.get('fund_size', 0)
                        establishment_date = fund.get('establishment_date', 'N/A')
                        
                        if fund_size:
                            fund_size_eok = float(fund_size) / 1e8  # Convert to 억원
                            total_fund_size += fund_size
                            print(f"   • {fund_name}: {fund_size_eok:.0f} 억원 ({establishment_date})")
                        else:
                            print(f"   • {fund_name}: N/A ({establishment_date})")
                    
                    if total_fund_size > 0:
                        total_size_eok = total_fund_size / 1e8
                        print(f"   📊 총 펀드 규모: {total_size_eok:.0f} 억원")
                else:
                    print("   ⚠️ 연결된 펀드 정보가 없습니다.")
        
        else:
            print("\n❌ 카카오벤처스 관련 데이터를 찾을 수 없습니다.")
            print("확인해볼 사항:")
            print("1. 회사명이 정확한지 확인")
            print("2. 다른 표기법으로 등록되었을 가능성")
            print("3. 데이터베이스에 누락되었을 가능성")
    
    except Exception as e:
        print(f"❌ 데이터 확인 중 오류: {e}")
        import traceback
        traceback.print_exc()

if __name__ == "__main__":
    verify_kakao_ventures_data() 