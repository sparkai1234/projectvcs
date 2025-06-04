#!/usr/bin/env python3
"""
AI-Powered Korean VC Intelligence - Efficient People & Company Search
한국 벤처캐피털 AI 정보 시스템 - 효율적인 인물 및 회사 검색
"""

import requests
import json
from openai import OpenAI
from datetime import datetime
from fuzzywuzzy import fuzz

# Configuration
AIRTABLE_API_KEY = "patOUfAsek4nbpvHm.49789ced0e2b0304bdc507f110d936277cd3da18ec3efc9347c93e6a1810919e"
AIRTABLE_BASE_ID = "appdR8V9lJaRW8VkR"

# Set your OpenAI API key here
OPENAI_API_KEY = "sk-proj-PGLd7dw4w7smO4fuqvlj_vW8xZZayRXiVduIwvoyd6B5SmM5hmzopgeslJ0brOQ82yZY3lqqrnT3BlbkFJqJTWbwhYTuqMwl7z6BI2QQueyVFFFZyobig0UxutJqwz5BQBcF-0jzB4A6DOMH0lYNBKKveUbgA"

# Initialize OpenAI client
client = OpenAI(api_key=OPENAI_API_KEY)

# Headers for Airtable API
headers = {
    'Authorization': f'Bearer {AIRTABLE_API_KEY}',
    'Content-Type': 'application/json'
}

class AIVCIntelligenceEfficient:
    def __init__(self):
        self.data_loaded = False
        self.companies_summary = ""
        self.people_summary = ""
        print("🤖 한국 벤처캐피털 AI 정보 시스템을 초기화중... (효율적인 검색)")
        
    def fetch_full_data(self):
        """포괄적인 데이터 로딩 - VC 관련 인물만 필터링"""
        print("📊 종합 데이터 로딩중...")
        
        # Load VC companies first
        try:
            url = f"https://api.airtable.com/v0/{AIRTABLE_BASE_ID}/VC%20Table"
            params = {'maxRecords': 200}
            response = requests.get(url, headers=headers, params=params)
            
            if response.status_code == 200:
                vc_data = response.json().get('records', [])
                print(f"   ✅ {len(vc_data)}개 VC 회사 로딩 완료")
            else:
                vc_data = []
                print(f"   ❌ VC 데이터 로딩 실패: {response.status_code}")
        except Exception as e:
            vc_data = []
            print(f"   ❌ VC 데이터 로딩 오류: {e}")
        
        # Load funds
        try:
            url = f"https://api.airtable.com/v0/{AIRTABLE_BASE_ID}/Fund%20Table"
            params = {'maxRecords': 500}
            response = requests.get(url, headers=headers, params=params)
            
            if response.status_code == 200:
                fund_data = response.json().get('records', [])
                print(f"   ✅ {len(fund_data)}개 펀드 로딩 완료")
            else:
                fund_data = []
                print(f"   ❌ 펀드 데이터 로딩 실패: {response.status_code}")
        except Exception as e:
            fund_data = []
            print(f"   ❌ 펀드 데이터 로딩 오류: {e}")
        
        # Load contacts matching info for efficiency
        try:
            url = f"https://api.airtable.com/v0/{AIRTABLE_BASE_ID}/Contacts%20Matched"
            params = {'maxRecords': 500}
            response = requests.get(url, headers=headers, params=params)
            
            if response.status_code == 200:
                matched_data = response.json().get('records', [])
                print(f"   ✅ {len(matched_data)}개 매칭 정보 로딩 완료")
            else:
                matched_data = []
                print(f"   ❌ 매칭 정보 데이터 로딩 실패: {response.status_code}")
        except Exception as e:
            matched_data = []
            print(f"   ❌ 매칭 정보 데이터 로딩 오류: {e}")
        
        # Get VC-relevant contact IDs
        vc_relevant_contact_ids = set()
        for match_record in matched_data:
            contact_id = match_record.get('fields', {}).get('Contact Record ID')
            if contact_id:
                vc_relevant_contact_ids.add(contact_id)
        
        # Load only VC-relevant people from Contacts Full
        try:
            url = f"https://api.airtable.com/v0/{AIRTABLE_BASE_ID}/Contacts%20Full"
            params = {'maxRecords': 500}
            response = requests.get(url, headers=headers, params=params)
            
            if response.status_code == 200:
                all_contacts = response.json().get('records', [])
                # Filter to only VC-relevant contacts
                vc_contacts = [contact for contact in all_contacts 
                             if contact.get('id') in vc_relevant_contact_ids]
                print(f"   ✅ {len(vc_contacts)}개 VC 관련 연락처 필터링 완료 (전체 {len(all_contacts)}개에서)")
            else:
                vc_contacts = []
                print(f"   ❌ 연락처 데이터 로딩 실패: {response.status_code}")
        except Exception as e:
            vc_contacts = []
            print(f"   ❌ 연락처 데이터 로딩 오류: {e}")
        
        # Store data
        self.vc_companies = vc_data
        self.funds = fund_data
        self.contacts = vc_contacts  # Only VC-relevant people
        self.matched_contacts = matched_data
        self.data_loaded = True
        
        # Create summaries for AI context
        self.create_summaries()
        
        print("✅ 종합 데이터 로딩 성공!")
        print(f"📊 요약: {len(vc_data)}개 VC, {len(fund_data)}개 펀드, {len(vc_contacts)}개 VC 관련 연락처")
    
    def create_summaries(self):
        """AI 컨텍스트용 회사 및 인물 요약 생성"""
        # Company names
        company_names = []
        for record in self.vc_companies:
            name = record.get('fields', {}).get('Company Name', '')
            if name:
                company_names.append(name)
        
        # People names (now VC-relevant only)
        people_names = []
        for record in self.contacts[:30]:  # Sample first 30 VC-relevant people
            name = record.get('fields', {}).get('이름', '') or record.get('fields', {}).get('Name', '')
            if name:
                people_names.append(name)
        
        self.companies_summary = f"사용 가능한 한국 VC 회사들: {', '.join(company_names[:20])}"
        self.people_summary = f"사용 가능한 VC 관련 인물들: {', '.join(people_names[:20])}"
    
    def ai_parse_query(self, user_query):
        """OpenAI를 사용한 쿼리 파싱 - 회사 vs 인물 구분"""
        try:
            prompt = f"""
당신은 한국 벤처캐피털 정보 시스템의 AI 어시스턴트입니다.
사용자 질문을 분석하여 회사를 찾는지, 사람을 찾는지 구분하고 해당 이름을 추출하세요.

{self.companies_summary}
{self.people_summary}

사용자 질문: "{user_query}"

응답 형식: "TYPE:NAME" (TYPE은 COMPANY 또는 PERSON)

예시:
- "빅뱅벤처스에 대해 알려주세요" → "COMPANY:빅뱅벤처스"
- "황병선에 대해 알려주세요" → "PERSON:황병선"
- "미래에셋벤처투자 펀드는?" → "COMPANY:미래에셋벤처투자"
- "강승순이 누구인가요?" → "PERSON:강승순"

응답:"""

            response = client.chat.completions.create(
                model="gpt-3.5-turbo",
                messages=[{"role": "user", "content": prompt}],
                max_tokens=50,
                temperature=0
            )
            
            result = response.choices[0].message.content.strip()
            
            if ":" in result:
                query_type, query_name = result.split(":", 1)
                return query_type.strip().upper(), query_name.strip()
            else:
                return None, None
            
        except Exception as e:
            print(f"⚠️ AI 파싱 실패: {e}")
            print("💡 간단한 키워드 매칭으로 전환합니다...")
            return self.simple_parse_query(user_query)
    
    def simple_parse_query(self, user_query):
        """OpenAI 실패시 간단한 키워드 기반 파싱"""
        query_lower = user_query.lower()
        
        # Company keywords
        company_keywords = ['벤처스', '투자', '펀드', '캐피털', 'venture', 'capital', 'fund', 'vc']
        
        # Person keywords  
        person_keywords = ['에 대해', '누구', '누군가', '사람', '인물', '연락처', '이메일', '전화']
        
        # Check if query matches any people in database first
        for record in self.contacts[:50]:
            fields = record.get('fields', {})
            name = fields.get('이름', '') or fields.get('Name', '')
            if name and name in user_query:
                return "PERSON", name
        
        # Check if query matches any companies
        for record in self.vc_companies[:30]:
            fields = record.get('fields', {})
            company_name = fields.get('Company Name', '')
            if company_name and company_name in user_query:
                return "COMPANY", company_name
        
        # Fallback: check keywords
        has_company_keywords = any(keyword in query_lower for keyword in company_keywords)
        has_person_keywords = any(keyword in query_lower for keyword in person_keywords)
        
        if has_company_keywords and not has_person_keywords:
            return "COMPANY", user_query.strip()
        elif has_person_keywords and not has_company_keywords:
            return "PERSON", user_query.strip()
        else:
            # Default to person if single name
            if len(user_query.split()) <= 2 and not any(char in user_query for char in ['/', '&', 'Inc', 'Corp']):
                return "PERSON", user_query.strip()
            else:
                return "COMPANY", user_query.strip()
    
    def find_person_data(self, person_name):
        """인물 데이터 검색 - VC 관련 인물만"""
        best_person_match = None
        best_person_score = 0
        
        # Search in VC-relevant contacts only
        for record in self.contacts:
            fields = record.get('fields', {})
            name = fields.get('이름', '') or fields.get('Name', '')
            
            if name:
                score = fuzz.ratio(person_name, name)
                partial_score = fuzz.partial_ratio(person_name, name)
                final_score = max(score, partial_score)
                
                if final_score > best_person_score:
                    best_person_score = final_score
                    best_person_match = record
        
        if best_person_score >= 80:  # 80% threshold for people
            return {
                'person_info': best_person_match,
                'match_score': best_person_score
            }
        
        return None
    
    def find_company_data(self, company_name):
        """회사 데이터 검색 (기존 로직)"""
        best_vc_match = None
        best_vc_score = 0
        
        # Search VC companies
        for record in self.vc_companies:
            name = record.get('fields', {}).get('Company Name', '')
            if name:
                score = fuzz.ratio(company_name, name)
                partial_score = fuzz.partial_ratio(company_name, name)
                final_score = max(score, partial_score)
                
                if final_score > best_vc_score:
                    best_vc_score = final_score
                    best_vc_match = record
        
        # Find related funds
        company_funds = []
        if best_vc_match and best_vc_score >= 90:
            vc_company_name = best_vc_match.get('fields', {}).get('Company Name', '')
            
            for record in self.funds:
                fund_company = record.get('fields', {}).get('Company Name (Korean)', '')
                if fund_company and vc_company_name:
                    score = fuzz.ratio(vc_company_name, fund_company)
                    partial_score = fuzz.partial_ratio(vc_company_name, fund_company)
                    final_score = max(score, partial_score)
                    
                    if final_score >= 95:
                        company_funds.append(record)
        
        # Find related contacts
        company_contacts = []
        if best_vc_match and best_vc_score >= 90:
            vc_company_name = best_vc_match.get('fields', {}).get('Company Name', '')
            
            for record in self.matched_contacts:
                matched_company = record.get('fields', {}).get('Matched Company', '')
                if matched_company and vc_company_name:
                    score = fuzz.ratio(vc_company_name, matched_company)
                    partial_score = fuzz.partial_ratio(vc_company_name, matched_company)
                    final_score = max(score, partial_score)
                    
                    if final_score >= 95:
                        company_contacts.append(record)
        
        if best_vc_score >= 90:
            return {
                'vc_info': best_vc_match,
                'funds': company_funds,
                'contacts': company_contacts,
                'match_score': best_vc_score
            }
        
        return None
    
    def display_person_info(self, person_data, person_name):
        """인물 정보 표시 - 향상된 버전"""
        print(f"✅ VC 관련 인물 정보 발견! (매칭 점수: {person_data['match_score']}%)")
        print()
        
        # Display person information
        print("👤 인물 정보")
        print("-" * 40)
        
        person = person_data['person_info']['fields']
        name = person.get('이름', '') or person.get('Name', '')
        print(f"이름: {name}")
        
        if person.get('회사'):
            print(f"🏢 회사: {person['회사']}")
        if person.get('직책') or person.get('직함') or person.get('Position'):
            position = person.get('직책', '') or person.get('직함', '') or person.get('Position', '')
            print(f"💼 직책: {position}")
        if person.get('휴대폰') or person.get('전화번호') or person.get('Phone'):
            phone = person.get('휴대폰', '') or person.get('전화번호', '') or person.get('Phone', '')
            print(f"📞 휴대폰: {phone}")
        if person.get('근무처 전화'):
            print(f"📞 근무처: {person['근무처 전화']}")
        if person.get('전자 메일 주소') or person.get('이메일') or person.get('Email'):
            email = person.get('전자 메일 주소', '') or person.get('이메일', '') or person.get('Email', '')
            print(f"📧 이메일: {email}")
        if person.get('근무지 주소 번지'):
            print(f"🏢 주소: {person['근무지 주소 번지']}")
        if person.get('LinkedIn'):
            print(f"🔗 LinkedIn: {person['LinkedIn']}")
        
        print()
        
        # Try to find related company information
        company_name = person.get('회사', '')
        if company_name:
            print("🏢 소속 회사 정보")
            print("-" * 40)
            
            # Search for VC company information
            related_vc = None
            best_score = 0
            
            for vc_record in self.vc_companies:
                vc_name = vc_record.get('fields', {}).get('Company Name', '')
                if vc_name:
                    score = fuzz.partial_ratio(company_name, vc_name)
                    if score > best_score:
                        best_score = score
                        related_vc = vc_record
            
            if related_vc and best_score >= 70:
                vc_fields = related_vc['fields']
                print(f"VC 회사명: {vc_fields.get('Company Name', '정보 없음')}")
                
                operating_amount = vc_fields.get('Operating Amount')
                if operating_amount is not None:
                    print(f"💰 운영규모: {operating_amount}억원")
                
                if vc_fields.get('Industry'):
                    print(f"업종: {vc_fields['Industry']}")
                if vc_fields.get('Location'):
                    print(f"위치: {vc_fields['Location']}")
                if vc_fields.get('Founded'):
                    print(f"설립: {vc_fields['Founded']}")
            else:
                print(f"'{company_name}' 회사 정보를 찾을 수 없습니다. (매칭도: {best_score}%)")
        
        print()
        print("=" * 60)
        print("🎉 VC 관련 인물 정보 분석 완료!")
    
    def display_company_info(self, company_data, company_name):
        """회사 정보 표시 (기존 로직)"""
        print(f"✅ 회사 데이터 발견! (매칭 점수: {company_data['match_score']}%)")
        print()
        
        # Display basic information
        print("🏢 회사 개요")
        print("-" * 40)
        
        if company_data['vc_info']:
            vc = company_data['vc_info']['fields']
            print(f"회사명: {vc.get('Company Name', '정보 없음')}")
            
            operating_amount = vc.get('Operating Amount')
            if operating_amount is not None:
                print(f"💰 운영규모: {operating_amount}억원")
            
            if vc.get('Industry'):
                print(f"업종: {vc['Industry']}")
            if vc.get('Location'):
                print(f"위치: {vc['Location']}")
            if vc.get('Founded'):
                print(f"설립: {vc['Founded']}")
            if vc.get('Company Type'):
                print(f"유형: {vc['Company Type']}")
        
        print()
        
        # Display funds
        print("🏦 운영 펀드")
        print("-" * 40)
        
        if company_data['funds']:
            print(f"{len(company_data['funds'])}개 펀드 발견:")
            for i, fund in enumerate(company_data['funds'][:10], 1):
                fund_fields = fund['fields']
                fund_name = (fund_fields.get('Name') or 
                           fund_fields.get('Name (Fund Name)') or 
                           fund_fields.get('Fund Name') or 
                           '펀드명 미상')
                print(f"\n{i:2d}. {fund_name}")
                if fund_fields.get('Operating Amount'):
                    print(f"    💰 운용액: {fund_fields['Operating Amount']}")
                if fund_fields.get('Industry'):
                    print(f"    🏭 업종: {fund_fields['Industry']}")
        else:
            print("펀드를 찾을 수 없습니다.")
        
        print()
        
        # Display contacts
        print("👥 관련 인물")
        print("-" * 40)
        
        if company_data['contacts']:
            print(f"{len(company_data['contacts'])}명의 관련 인물 발견:")
            for i, contact in enumerate(company_data['contacts'][:5], 1):
                contact_fields = contact['fields']
                contact_company = contact_fields.get('Contact Company', '회사명 미상')
                match_score = contact_fields.get('Match Score', 0)
                print(f"{i:2d}. '{contact_company}' 소속 (매칭도: {match_score}%)")
        else:
            print("관련 인물을 찾을 수 없습니다.")
        
        print()
        print("=" * 60)
        print("🎉 정보 분석 완료!")
    
    def query(self, user_query):
        """통합 쿼리 함수 - 회사 또는 인물 검색"""
        if not self.data_loaded:
            print("❌ 데이터가 로딩되지 않았습니다. fetch_full_data()를 먼저 실행하세요.")
            return
        
        print(f"\n🔍 쿼리 처리중: '{user_query}'")
        print("=" * 60)
        
        # Use AI to parse the query and determine type
        query_type, query_name = self.ai_parse_query(user_query)
        
        if not query_name:
            print("❌ 질문에서 회사나 인물을 식별할 수 없습니다.")
            print("💡 구체적인 회사명이나 인물명으로 질문해보세요.")
            print("   예: '황병선에 대해 알려주세요' 또는 '빅뱅벤처스 정보'")
            return
        
        print(f"🎯 AI가 식별: {query_type} - '{query_name}'")
        
        if query_type == "PERSON":
            # Search for person
            person_data = self.find_person_data(query_name)
            
            if person_data:
                self.display_person_info(person_data, query_name)
            else:
                print(f"❌ '{query_name}' VC 관련 인물 정보를 찾을 수 없습니다.")
                print("💡 사용 가능한 VC 관련 인물들:")
                for record in self.contacts[:10]:
                    name = record.get('fields', {}).get('이름', '') or record.get('fields', {}).get('Name', '')
                    company = record.get('fields', {}).get('회사', '')
                    if name:
                        print(f"   • {name} ({company})")
        
        elif query_type == "COMPANY":
            # Search for company
            company_data = self.find_company_data(query_name)
            
            if company_data:
                self.display_company_info(company_data, query_name)
            else:
                print(f"❌ '{query_name}' 회사 정보를 찾을 수 없습니다.")
                print("💡 사용 가능한 회사들:")
                for record in self.vc_companies[:10]:
                    name = record.get('fields', {}).get('Company Name', '')
                    if name:
                        print(f"   • {name}")

def main():
    """한국어 우선 대화형 AI 인터페이스 - 효율적인 VC 인물 + 회사 검색"""
    print("🤖 한국 벤처캐피털 AI 정보 시스템 (효율적인 검색)")
    print("=" * 60)
    
    # Initialize system
    intel = AIVCIntelligenceEfficient()
    intel.fetch_full_data()
    
    print("\n💡 예시 질문 (VC 관련 인물만 검색):")
    print("   👤 인물: 손미경, 김정섭, 황영준 등 VC 관련 인물들")
    print("   🏢 회사: 빅뱅벤처스, 미래에셋벤처투자") 
    print("   💬 자연어: '손미경이 누구인가요?', '빅뱅벤처스 정보'")
    
    while True:
        print("\n" + "="*50)
        query = input("\n🎤 VC 관련 인물이나 회사에 대해 궁금한 것을 물어보세요 ('종료'): ").strip()
        
        if query.lower() in ['quit', 'exit', 'q', '종료', '나가기']:
            print("👋 안녕히 가세요!")
            break
        
        if not query:
            continue
        
        intel.query(query)

if __name__ == "__main__":
    main() 