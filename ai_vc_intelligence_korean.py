#!/usr/bin/env python3
"""
AI-Powered Korean VC Company Intelligence (한국어 기본)
Korean-first AI system for VC intelligence with English option
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
OPENAI_API_KEY = "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"

# Initialize OpenAI client
client = OpenAI(api_key=OPENAI_API_KEY)

# Headers for Airtable API
headers = {
    'Authorization': f'Bearer {AIRTABLE_API_KEY}',
    'Content-Type': 'application/json'
}

class KoreanVCIntelligence:
    def __init__(self):
        self.data_loaded = False
        self.companies_summary = ""
        self.language = "korean"  # Default to Korean
        print("🤖 한국 VC 지능형 시스템을 초기화 중입니다...")
        
    def set_language(self, language):
        """언어 설정 (korean/english)"""
        if language.lower() in ['korean', 'ko', '한국어']:
            self.language = "korean"
            print("🇰🇷 언어가 한국어로 설정되었습니다")
        elif language.lower() in ['english', 'en', '영어']:
            self.language = "english"
            print("🇺🇸 Language set to English")
        else:
            print("⚠️ 지원되지 않는 언어입니다. korean 또는 english를 선택해주세요")
            
    def fetch_sample_data(self):
        """샘플 데이터 로드"""
        if self.language == "korean":
            print("📊 샘플 데이터를 로드하는 중...")
        else:
            print("📊 Loading sample data...")
        
        # Load VC companies
        try:
            url = f"https://api.airtable.com/v0/{AIRTABLE_BASE_ID}/VC%20Table"
            params = {'maxRecords': 20}
            response = requests.get(url, headers=headers, params=params)
            
            if response.status_code == 200:
                vc_data = response.json().get('records', [])
                if self.language == "korean":
                    print(f"   ✅ {len(vc_data)}개의 VC 회사 로드 완료")
                else:
                    print(f"   ✅ Loaded {len(vc_data)} VC companies")
            else:
                vc_data = []
                print(f"   ❌ VC 데이터 로드 실패: {response.status_code}")
        except Exception as e:
            vc_data = []
            print(f"   ❌ VC 데이터 로드 오류: {e}")
        
        # Load funds
        try:
            url = f"https://api.airtable.com/v0/{AIRTABLE_BASE_ID}/Fund%20Table"
            params = {'maxRecords': 50}
            response = requests.get(url, headers=headers, params=params)
            
            if response.status_code == 200:
                fund_data = response.json().get('records', [])
                if self.language == "korean":
                    print(f"   ✅ {len(fund_data)}개의 펀드 로드 완료")
                else:
                    print(f"   ✅ Loaded {len(fund_data)} funds")
            else:
                fund_data = []
                print(f"   ❌ 펀드 데이터 로드 실패: {response.status_code}")
        except Exception as e:
            fund_data = []
            print(f"   ❌ 펀드 데이터 로드 오류: {e}")
        
        # Load matched contacts
        try:
            url = f"https://api.airtable.com/v0/{AIRTABLE_BASE_ID}/Contacts%20Matched"
            params = {'maxRecords': 50}
            response = requests.get(url, headers=headers, params=params)
            
            if response.status_code == 200:
                contact_data = response.json().get('records', [])
                if self.language == "korean":
                    print(f"   ✅ {len(contact_data)}명의 매칭된 연락처 로드 완료")
                else:
                    print(f"   ✅ Loaded {len(contact_data)} matched contacts")
            else:
                contact_data = []
                print(f"   ❌ 연락처 데이터 로드 실패: {response.status_code}")
        except Exception as e:
            contact_data = []
            print(f"   ❌ 연락처 데이터 로드 오류: {e}")
        
        # Store data
        self.vc_companies = vc_data
        self.funds = fund_data
        self.contacts = contact_data
        self.data_loaded = True
        
        # Create company summary
        self.create_companies_summary()
        
        if self.language == "korean":
            print("✅ 샘플 데이터 로드가 성공적으로 완료되었습니다!")
        else:
            print("✅ Sample data loaded successfully!")
    
    def create_companies_summary(self):
        """AI 컨텍스트를 위한 회사 요약 생성"""
        company_names = []
        
        for record in self.vc_companies:
            name = record.get('fields', {}).get('Company Name', '')
            if name:
                company_names.append(name)
        
        for record in self.funds:
            name = record.get('fields', {}).get('Company Name (Korean)', '')
            if name and name not in company_names:
                company_names.append(name)
        
        self.companies_summary = f"한국 VC 회사들: {', '.join(company_names[:20])}"
        if len(company_names) > 20:
            self.companies_summary += f" 외 {len(company_names) - 20}개 회사"
    
    def ai_parse_query(self, user_query):
        """AI를 사용한 쿼리 파싱"""
        try:
            prompt = f"""
당신은 한국 VC 회사 지능형 시스템의 AI 어시스턴트입니다.
사용자가 한국 VC 회사에 대한 정보를 검색하고자 합니다.

사용 가능한 회사들: {self.companies_summary}

사용자 쿼리: "{user_query}"

사용자가 질문하는 회사 이름을 추출하세요. 쿼리와 가장 잘 매치되는 회사 이름만 반환하세요.
회사에 대해 질문하는 경우, 한국어 회사 이름을 반환하세요.
명확한 회사가 언급되지 않은 경우, "UNCLEAR"를 반환하세요.

예시:
- "미래에셋벤처투자" → "미래에셋벤처투자"
- "Tell me about Mirae Asset Venture" → "미래에셋벤처투자"
- "Kakao Ventures" → "카카오벤처스"
- "젠엑시스는 어떤 펀드를 운영하나요?" → "젠엑시스"

회사 이름:"""

            response = client.chat.completions.create(
                model="gpt-3.5-turbo",
                messages=[{"role": "user", "content": prompt}],
                max_tokens=50,
                temperature=0
            )
            
            company_name = response.choices[0].message.content.strip()
            return company_name if company_name != "UNCLEAR" else None
            
        except Exception as e:
            print(f"⚠️ AI 파싱 실패: {e}")
            return user_query
    
    def find_company_data(self, company_name):
        """퍼지 매칭을 사용한 회사 데이터 검색"""
        best_vc_match = None
        best_vc_score = 0
        
        # VC 회사 검색
        for record in self.vc_companies:
            name = record.get('fields', {}).get('Company Name', '')
            if name:
                score = fuzz.ratio(company_name, name)
                if score > best_vc_score:
                    best_vc_score = score
                    best_vc_match = record
        
        # 관련 펀드 검색
        company_funds = []
        for record in self.funds:
            fund_company = record.get('fields', {}).get('Company Name (Korean)', '')
            if fund_company:
                score = fuzz.ratio(company_name, fund_company)
                if score >= 80:
                    company_funds.append(record)
        
        # 관련 연락처 검색
        company_contacts = []
        for record in self.contacts:
            matched_company = record.get('fields', {}).get('Matched Company', '')
            if matched_company:
                score = fuzz.ratio(company_name, matched_company)
                if score >= 80:
                    company_contacts.append(record)
        
        if best_vc_score >= 60 or company_funds or company_contacts:
            return {
                'vc_info': best_vc_match if best_vc_score >= 60 else None,
                'funds': company_funds,
                'contacts': company_contacts,
                'match_score': best_vc_score
            }
        
        return None
    
    def generate_ai_insights(self, company_data, company_name):
        """회사에 대한 AI 기반 인사이트 생성"""
        try:
            # 회사 정보 준비
            info_text = f"회사: {company_name}\n\n"
            
            if company_data['vc_info']:
                vc = company_data['vc_info']['fields']
                info_text += f"VC 정보:\n"
                if vc.get('Industry'):
                    info_text += f"- 업종: {vc['Industry']}\n"
                if vc.get('Location'):
                    info_text += f"- 위치: {vc['Location']}\n"
                if vc.get('Founded'):
                    info_text += f"- 설립: {vc['Founded']}\n"
                if vc.get('Company Type'):
                    info_text += f"- 회사 유형: {vc['Company Type']}\n"
            
            if company_data['funds']:
                info_text += f"\n펀드 ({len(company_data['funds'])}개):\n"
                for fund in company_data['funds'][:5]:
                    fund_name = fund['fields'].get('Name (Fund Name)', '')
                    if fund_name:
                        info_text += f"- {fund_name}\n"
            
            if company_data['contacts']:
                info_text += f"\n연락처: {len(company_data['contacts'])}명 발견\n"
                for contact in company_data['contacts'][:3]:
                    contact_fields = contact['fields']
                    name = contact_fields.get('Contact Name', '')
                    position = contact_fields.get('Contact Position', '')
                    if name:
                        info_text += f"- {name}"
                        if position:
                            info_text += f" ({position})"
                        info_text += "\n"
            
            if self.language == "korean":
                prompt = f"""
당신은 한국 VC 업계 전문가입니다. 이 회사에 대한 인사이트를 제공해주세요:

{info_text}

다음 내용을 포함하여 간략한 분석을 한국어로 제공해주세요:
1. 회사 개요 및 한국 VC 생태계에서의 위치
2. 투자 포커스 및 전략 (펀드명/업종 기반)
3. 주요 강점 또는 특징
4. 비즈니스 개발 기회

간결하고 전문적으로 작성하며, 불렛 포인트를 사용해주세요.
"""
            else:
                prompt = f"""
As a Korean VC industry expert, provide insights about this company:

{info_text}

Provide a brief analysis in English covering:
1. Company overview and position in Korean VC ecosystem
2. Investment focus and strategy (based on fund names/industry)
3. Key strengths or notable aspects
4. Business development opportunities

Keep it concise, professional, and use bullet points for clarity.
"""

            response = client.chat.completions.create(
                model="gpt-3.5-turbo",
                messages=[{"role": "user", "content": prompt}],
                max_tokens=400,
                temperature=0.7
            )
            
            return response.choices[0].message.content.strip()
            
        except Exception as e:
            if self.language == "korean":
                return f"⚠️ AI 인사이트를 사용할 수 없습니다: {e}"
            else:
                return f"⚠️ AI insights unavailable: {e}"
    
    def query_company(self, user_query):
        """AI 향상된 메인 쿼리 함수"""
        if not self.data_loaded:
            if self.language == "korean":
                print("❌ 데이터가 로드되지 않았습니다. fetch_sample_data()를 먼저 실행하세요.")
            else:
                print("❌ Data not loaded. Run fetch_sample_data() first.")
            return
        
        if self.language == "korean":
            print(f"\n🔍 쿼리 처리 중: '{user_query}'")
        else:
            print(f"\n🔍 Processing query: '{user_query}'")
        print("=" * 60)
        
        # AI로 쿼리 파싱
        company_name = self.ai_parse_query(user_query)
        
        if not company_name:
            if self.language == "korean":
                print("❌ 쿼리에서 회사를 식별할 수 없습니다.")
                print("💡 '미래에셋벤처투자'나 '카카오벤처스' 같은 구체적인 회사에 대해 질문해보세요")
            else:
                print("❌ Could not identify a company from your query.")
                print("💡 Try asking about specific companies like '미래에셋벤처투자' or 'Kakao Ventures'")
            return
        
        if self.language == "korean":
            print(f"🎯 AI가 식별한 회사: {company_name}")
        else:
            print(f"🎯 AI identified company: {company_name}")
        
        # 회사 데이터 검색
        company_data = self.find_company_data(company_name)
        
        if not company_data:
            if self.language == "korean":
                print(f"❌ '{company_name}'에 대한 데이터를 찾을 수 없습니다")
            else:
                print(f"❌ No data found for '{company_name}'")
            return
        
        if self.language == "korean":
            print(f"✅ 회사 데이터를 찾았습니다!")
        else:
            print(f"✅ Found company data!")
        print()
        
        # 기본 정보 표시
        if self.language == "korean":
            print("🏢 회사 개요")
            print("-" * 40)
        else:
            print("🏢 COMPANY OVERVIEW")
            print("-" * 40)
        
        if company_data['vc_info']:
            vc = company_data['vc_info']['fields']
            if self.language == "korean":
                print(f"회사명: {vc.get('Company Name', 'N/A')}")
                if vc.get('Industry'):
                    print(f"업종: {vc['Industry']}")
                if vc.get('Location'):
                    print(f"위치: {vc['Location']}")
                if vc.get('Founded'):
                    print(f"설립: {vc['Founded']}")
                if vc.get('Company Type'):
                    print(f"회사 유형: {vc['Company Type']}")
            else:
                print(f"Company Name: {vc.get('Company Name', 'N/A')}")
                if vc.get('Industry'):
                    print(f"Industry: {vc['Industry']}")
                if vc.get('Location'):
                    print(f"Location: {vc['Location']}")
                if vc.get('Founded'):
                    print(f"Founded: {vc['Founded']}")
                if vc.get('Company Type'):
                    print(f"Type: {vc['Company Type']}")
        
        print()
        
        # 펀드 표시
        if self.language == "korean":
            print("🏦 운영 펀드")
            print("-" * 40)
        else:
            print("🏦 FUNDS OPERATED")
            print("-" * 40)
        
        if company_data['funds']:
            if self.language == "korean":
                print(f"{len(company_data['funds'])}개의 펀드를 찾았습니다:")
            else:
                print(f"Found {len(company_data['funds'])} funds:")
            for i, fund in enumerate(company_data['funds'][:10], 1):
                fund_fields = fund['fields']
                fund_name = fund_fields.get('Name (Fund Name)', '알 수 없는 펀드' if self.language == "korean" else 'Unknown Fund')
                print(f"\n{i:2d}. {fund_name}")
                if fund_fields.get('Operating Amount'):
                    amount_label = "운용 금액" if self.language == "korean" else "Amount"
                    print(f"    💰 {amount_label}: {fund_fields['Operating Amount']}")
                if fund_fields.get('Industry'):
                    industry_label = "업종" if self.language == "korean" else "Industry"
                    print(f"    🏭 {industry_label}: {fund_fields['Industry']}")
        else:
            no_funds_msg = "펀드를 찾을 수 없습니다." if self.language == "korean" else "No funds found."
            print(no_funds_msg)
        
        print()
        
        # 연락처 표시
        if self.language == "korean":
            print("👥 회사 직원")
            print("-" * 40)
        else:
            print("👥 PEOPLE AT THIS COMPANY")
            print("-" * 40)
        
        if company_data['contacts']:
            if self.language == "korean":
                print(f"{len(company_data['contacts'])}명을 찾았습니다:")
            else:
                print(f"Found {len(company_data['contacts'])} people:")
            for i, contact in enumerate(company_data['contacts'][:5], 1):
                contact_fields = contact['fields']
                contact_name = contact_fields.get('Contact Name', '알 수 없음' if self.language == "korean" else 'Unknown')
                contact_position = contact_fields.get('Contact Position', '')
                contact_email = contact_fields.get('Contact Email', '')
                contact_phone = contact_fields.get('Contact Phone', '')
                match_score = contact_fields.get('Match Score', 0)
                original_company = contact_fields.get('Contact Company (Original)', '')
                
                print(f"\n{i:2d}. {contact_name}")
                if contact_position:
                    position_label = "직책" if self.language == "korean" else "Position"
                    print(f"    💼 {position_label}: {contact_position}")
                if contact_email:
                    print(f"    📧 이메일: {contact_email}")
                if contact_phone:
                    phone_label = "연락처" if self.language == "korean" else "Phone"
                    print(f"    📱 {phone_label}: {contact_phone}")
                company_label = "원 회사명" if self.language == "korean" else "Original Company"
                match_label = "매치" if self.language == "korean" else "Match"
                print(f"    🏢 {company_label}: '{original_company}' ({match_label}: {match_score}%)")
        else:
            no_contacts_msg = "연락처를 찾을 수 없습니다." if self.language == "korean" else "No contacts found."
            print(no_contacts_msg)
        
        print()
        
        # AI 인사이트 생성
        if self.language == "korean":
            print("🤖 AI 인사이트")
            print("-" * 40)
        else:
            print("🤖 AI INSIGHTS")
            print("-" * 40)
        
        insights = self.generate_ai_insights(company_data, company_name)
        print(insights)
        
        print()
        print("=" * 60)
        if self.language == "korean":
            print("🎉 인텔리전스 리포트 완료!")
        else:
            print("🎉 Intelligence report complete!")

def test_openai_connection():
    """OpenAI API 연결 테스트"""
    try:
        response = client.chat.completions.create(
            model="gpt-3.5-turbo",
            messages=[{"role": "user", "content": "Hello, respond with 'OpenAI connected successfully!'"}],
            max_tokens=20
        )
        print("✅ OpenAI API 연결 성공!")
        return True
    except Exception as e:
        print(f"❌ OpenAI API 연결 실패: {e}")
        print("💡 스크립트에서 API 키를 확인해주세요")
        return False

def main():
    """대화형 AI 기반 인터페이스"""
    print("🤖 한국 VC 지능형 시스템 (Korean-First)")
    print("=" * 60)
    
    # OpenAI 연결 테스트
    if not test_openai_connection():
        print("\n⚠️ AI 기능 없이 계속합니다...")
        print("AI 인사이트를 활성화하려면 OpenAI API 키를 추가해주세요")
    
    print()
    
    # 시스템 초기화
    intel = KoreanVCIntelligence()
    intel.fetch_sample_data()
    
    print("\n💡 예시 쿼리:")
    print("   • 미래에셋벤처투자")
    print("   • 카카오벤처스에서 일하는 사람은 누구인가요?") 
    print("   • 젠엑시스는 어떤 펀드를 운영하나요?")
    print("   • 한국투자파트너스에 대해 알려주세요")
    
    print("\n🌐 언어 변경: 'lang english' 또는 'lang korean'")
    
    while True:
        print("\n" + "="*50)
        query = input("\n🎤 한국 VC 회사에 대해 질문해주세요 (종료: 'quit'): ").strip()
        
        if query.lower() in ['quit', 'exit', 'q', '종료']:
            print("👋 안녕히 가세요!")
            break
        
        if not query:
            continue
        
        # 언어 변경 명령어 처리
        if query.lower().startswith('lang '):
            lang = query[5:].strip()
            intel.set_language(lang)
            continue
        
        intel.query_company(query)

if __name__ == "__main__":
    main() 