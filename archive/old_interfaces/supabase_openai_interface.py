#!/usr/bin/env python3
"""
Comprehensive OpenAI-Supabase Interface for DIVA Intelligence System
Provides AI-powered analysis across all Supabase tables
Supports Korean and English queries with intelligent data retrieval
"""

import json
import time
from typing import Dict, List, Optional, Any
from supabase import create_client, Client
from api_config import get_supabase_config, get_config
import openai

class SupabaseOpenAIInterface:
    def __init__(self):
        # Initialize Supabase connection
        supabase_config = get_supabase_config(use_service_role=True)
        self.supabase: Client = create_client(supabase_config['url'], supabase_config['key'])
        
        # Initialize OpenAI
        config = get_config()
        self.openai_client = openai.OpenAI(api_key=config['openai_api_key'])
        
        # Cache for database schema and data
        self.schema_cache = {}
        self.data_cache = {}
        
    def get_database_schema(self) -> Dict:
        """Get comprehensive database schema information"""
        if self.schema_cache:
            return self.schema_cache
            
        print("📊 Analyzing database schema...")
        
        schema_info = {
            "tables": {},
            "total_records": 0,
            "last_updated": time.strftime('%Y-%m-%d %H:%M:%S')
        }
        
        # Define expected tables and their purposes
        table_configs = {
            "vc_table": {
                "description": "VC companies and investment firms",
                "key_fields": ["id", "company_id", "company_name", "company_type", "description"]
            },
            "contacts_full": {
                "description": "Complete contact database",
                "key_fields": ["id", "이름", "회사", "직책", "이메일", "전화번호"]
            },
            "contacts_matched": {
                "description": "Contacts matched to VC companies (high-confidence matches)",
                "key_fields": ["id", "contact_id", "company_id", "이름", "회사", "직책", "이메일", "전화번호", "fuzzy_match_score"]
            }
        }
        
        for table_name, config in table_configs.items():
            try:
                # Get record count
                count_response = self.supabase.table(table_name).select("id", count="exact").execute()
                record_count = count_response.count if hasattr(count_response, 'count') else len(count_response.data)
                
                # Get sample records for field analysis
                sample_response = self.supabase.table(table_name).select("*").limit(5).execute()
                sample_records = sample_response.data
                
                # Analyze actual fields
                actual_fields = list(sample_records[0].keys()) if sample_records else []
                
                schema_info["tables"][table_name] = {
                    "description": config["description"],
                    "record_count": record_count,
                    "fields": actual_fields,
                    "key_fields": config["key_fields"],
                    "sample_record": sample_records[0] if sample_records else {}
                }
                
                schema_info["total_records"] += record_count
                print(f"✅ {table_name}: {record_count:,} records")
                
            except Exception as e:
                print(f"⚠️ Error accessing {table_name}: {e}")
                schema_info["tables"][table_name] = {
                    "description": config["description"],
                    "record_count": 0,
                    "error": str(e)
                }
        
        self.schema_cache = schema_info
        return schema_info
    
    def query_table_data(self, table_name: str, filters: Dict = None, limit: int = 100) -> List[Dict]:
        """Query specific table with optional filters"""
        try:
            query = self.supabase.table(table_name).select("*")
            
            # Apply filters if provided
            if filters:
                for field, value in filters.items():
                    if isinstance(value, str):
                        query = query.ilike(field, f"%{value}%")
                    else:
                        query = query.eq(field, value)
            
            # Apply limit
            response = query.limit(limit).execute()
            return response.data
            
        except Exception as e:
            print(f"❌ Error querying {table_name}: {e}")
            return []
    
    def get_company_analysis_data(self, company_name: str = None) -> Dict:
        """Get comprehensive data for company analysis including full VC company details"""
        data = {
            "vc_companies": [],
            "company_details": {},
            "matched_contacts": [],
            "all_contacts": [],
            "query_info": {
                "company_filter": company_name,
                "timestamp": time.strftime('%Y-%m-%d %H:%M:%S')
            }
        }
        
        try:
            # Get VC companies with more flexible matching
            if company_name:
                # Try exact match first
                vc_companies = self.query_table_data("vc_table", {"company_name": company_name}, 10)
                
                # If no exact match, try partial matching
                if not vc_companies:
                    print(f"🔍 No exact match found, trying partial match for: {company_name}")
                    # Get all VC companies and filter manually for partial matches
                    all_vc = self.query_table_data("vc_table", limit=717)
                    vc_companies = [
                        company for company in all_vc 
                        if company_name in company.get('company_name', '') or 
                           company.get('company_name', '').replace('벤처투자', '').replace('벤처스', '') in company_name
                    ][:10]
                    
                # Store detailed company info for the first match
                if vc_companies:
                    data["company_details"] = vc_companies[0]
                    print(f"✅ Found VC company details for: {vc_companies[0].get('company_name')}")
            else:
                vc_companies = self.query_table_data("vc_table", limit=100)
            
            data["vc_companies"] = vc_companies
            
            # Get matched contacts for the specific company
            if company_name and vc_companies:
                company_id = vc_companies[0].get('company_id')
                if company_id:
                    matched_contacts = self.query_table_data("contacts_matched", {"company_id": company_id}, 100)
                else:
                    matched_contacts = self.query_table_data("contacts_matched", {"회사": company_name}, 100)
            else:
                matched_contacts = self.query_table_data("contacts_matched", limit=50)
            data["matched_contacts"] = matched_contacts
            
            # Get sample of all contacts for context
            if company_name:
                all_contacts = self.query_table_data("contacts_full", {"회사": company_name}, 50)
            else:
                all_contacts = self.query_table_data("contacts_full", limit=30)
            data["all_contacts"] = all_contacts
            
        except Exception as e:
            print(f"❌ Error gathering analysis data: {e}")
        
        return data
    
    def ask_ai_question(self, question: str, context_type: str = "general") -> str:
        """Ask AI question with appropriate context from Supabase data"""
        print(f"🤖 Processing question: {question}")
        print(f"📊 Context type: {context_type}")
        
        # Get database schema for context
        schema = self.get_database_schema()
        
        # Determine what data to fetch based on question
        company_name = self.extract_company_name_from_question(question)
        analysis_data = self.get_company_analysis_data(company_name)
        
        # Prepare context for AI
        context = self.prepare_ai_context(schema, analysis_data, question)
        
        # Create AI prompt
        system_prompt = """당신은 한국 벤처캐피탈 생태계 전문 분석가입니다. 
Supabase 데이터베이스의 포괄적인 VC 및 연락처 데이터를 분석하여 통찰력 있는 답변을 제공합니다.

데이터베이스 구조:
1. vc_table: VC 회사 및 투자기관의 상세 정보 (운용자산, 위치, 대표자, 설립일, 업종 등)
2. contacts_full: 전체 연락처 데이터베이스  
3. contacts_matched: VC 회사와 매칭된 고신뢰도 연락처

분석 시 다음 영역을 포괄적으로 다루세요:

🏢 **기업 기본 정보**: 회사명, 설립일, 대표자, 위치, 업종, 상태
💰 **재무 정보**: 운용자산(operating_amount/AUM), 자산 규모 분석
📍 **지리적 정보**: 소재지, 지역별 분포, 접근성
👥 **인력 정보**: 직책별 인원, 핵심 인사, 조직 구조
🎯 **투자 전략**: 회사 유형, 업종 포커스, 투자 특성
📊 **시장 포지션**: 업계 내 위치, 경쟁사 대비 규모

질문에 대해 정확하고 실용적인 분석을 한국어로 제공하되, 구체적인 데이터와 통계를 포함하세요.
특히 운용자산(AUM), 설립 기간, 지리적 위치, 인력 구성 등 핵심 지표를 강조하세요."""

        user_prompt = f"""
질문: {question}

데이터베이스 컨텍스트:
{context}

위 데이터를 바탕으로 질문에 대한 상세하고 통찰력 있는 답변을 제공해주세요.
"""

        try:
            response = self.openai_client.chat.completions.create(
                model="gpt-4",
                messages=[
                    {"role": "system", "content": system_prompt},
                    {"role": "user", "content": user_prompt}
                ],
                temperature=0.7,
                max_tokens=2000
            )
            
            return response.choices[0].message.content
            
        except Exception as e:
            return f"❌ AI 분석 중 오류가 발생했습니다: {e}"
    
    def extract_company_name_from_question(self, question: str) -> Optional[str]:
        """Extract company name from question using simple pattern matching"""
        # Common Korean VC companies
        common_companies = [
            "미래에셋", "카카오벤처스", "한국벤처투자", "신한벤처투자", "스톤브릿지벤처스",
            "컴퍼니케이파트너스", "그래비티벤처스", "패스트벤처스", "하나벤처스", "롯데벤처스",
            "우리벤처파트너스", "센트럴투자파트너스", "킹슬리벤처스", "소풍벤처스"
        ]
        
        question_lower = question.lower()
        for company in common_companies:
            if company in question_lower:
                return company
        
        return None
    
    def prepare_ai_context(self, schema: Dict, data: Dict, question: str) -> str:
        """Prepare formatted context for AI analysis with comprehensive VC company data"""
        context_parts = []
        
        # Add specific company details if available (MOST IMPORTANT)
        if data.get("company_details"):
            company = data["company_details"]
            context_parts.append("=== 🎯 요청된 회사 상세 정보 ===")
            context_parts.append(f"회사명: {company.get('company_name', 'N/A')}")
            context_parts.append(f"회사 ID: {company.get('company_id', 'N/A')}")
            context_parts.append(f"회사 유형: {company.get('company_type', 'N/A')}")
            context_parts.append(f"💰 운용자산 (AUM): {company.get('operating_amount', 'N/A')}")
            context_parts.append(f"📍 위치: {company.get('location', 'N/A')}")
            context_parts.append(f"📮 우편번호: {company.get('zip_code', 'N/A')}")
            context_parts.append(f"👤 대표자: {company.get('representative', 'N/A')}")
            context_parts.append(f"📅 설립일: {company.get('established_date', 'N/A')}")
            context_parts.append(f"🏢 창립연도: {company.get('founded', 'N/A')}")
            context_parts.append(f"🌐 웹사이트: {company.get('website_url', 'N/A')}")
            context_parts.append(f"🏭 업종: {company.get('industry', 'N/A')}")
            context_parts.append(f"📊 상태: {company.get('status', 'N/A')}")
            context_parts.append(f"📞 연락처: {company.get('contact_info', 'N/A')}")
            context_parts.append(f"📋 공시 데이터: {company.get('disclosure_data', 'N/A')}")
            context_parts.append("")
        
        # Add schema overview
        context_parts.append("=== 📊 데이터베이스 개요 ===")
        for table_name, table_info in schema["tables"].items():
            context_parts.append(f"테이블: {table_name}")
            context_parts.append(f"설명: {table_info['description']}")
            context_parts.append(f"레코드 수: {table_info.get('record_count', 0):,}")
            if table_name == "vc_table":
                context_parts.append("주요 필드: company_name, operating_amount(운용자산), location, representative, established_date, company_type, industry, status")
            context_parts.append("")
        
        # Add VC companies sample (if multiple companies or no specific company)
        if data["vc_companies"] and len(data["vc_companies"]) > 1:
            context_parts.append("=== 🏢 관련 VC 회사들 ===")
            for company in data["vc_companies"][:5]:
                context_parts.append(f"회사명: {company.get('company_name', 'N/A')}")
                context_parts.append(f"운용자산: {company.get('operating_amount', 'N/A')}")
                context_parts.append(f"위치: {company.get('location', 'N/A')}")
                context_parts.append(f"회사 유형: {company.get('company_type', 'N/A')}")
                context_parts.append(f"업종: {company.get('industry', 'N/A')}")
                context_parts.append("")
        
        # Add matched personnel information
        if data["matched_contacts"]:
            context_parts.append("=== 👥 매칭된 인력 정보 ===")
            context_parts.append(f"총 매칭된 직원 수: {len(data['matched_contacts'])}명")
            
            # Group by position for better analysis
            positions = {}
            for contact in data["matched_contacts"]:
                position = contact.get('직책', 'Unknown')
                if position not in positions:
                    positions[position] = []
                positions[position].append(contact.get('이름', 'N/A'))
            
            for position, names in positions.items():
                context_parts.append(f"{position}: {len(names)}명 ({', '.join(names[:3])}{'...' if len(names) > 3 else ''})")
            
            context_parts.append("")
            context_parts.append("상세 연락처 샘플:")
            for contact in data["matched_contacts"][:10]:
                context_parts.append(f"  • {contact.get('이름', 'N/A')} ({contact.get('직책', 'N/A')}) - 매칭점수: {contact.get('fuzzy_match_score', 'N/A')}")
            context_parts.append("")
        
        # Add summary statistics
        context_parts.append("=== 📈 요약 통계 ===")
        context_parts.append(f"검색된 VC 회사 수: {len(data['vc_companies'])}")
        context_parts.append(f"매칭된 직원 수: {len(data['matched_contacts'])}")
        context_parts.append(f"전체 연락처 샘플: {len(data['all_contacts'])}")
        if data.get("company_details"):
            context_parts.append(f"요청 회사 상세 정보: 포함됨")
        
        return "\n".join(context_parts)
    
    def get_company_contacts(self, company_name: str) -> Dict:
        """Get all contacts for a specific company"""
        print(f"🔍 Searching contacts for: {company_name}")
        
        result = {
            "company_name": company_name,
            "matched_contacts": [],
            "all_contacts": [],
            "stats": {}
        }
        
        # Get matched contacts (high confidence)
        matched = self.query_table_data("contacts_matched", {"회사": company_name}, 100)
        result["matched_contacts"] = matched
        
        # Get all contacts from full database
        all_contacts = self.query_table_data("contacts_full", {"회사": company_name}, 100)
        result["all_contacts"] = all_contacts
        
        # Calculate statistics
        result["stats"] = {
            "total_matched": len(matched),
            "total_all_contacts": len(all_contacts),
            "match_coverage": len(matched) / len(all_contacts) * 100 if all_contacts else 0
        }
        
        return result
    
    def interactive_chat(self):
        """Start interactive chat session"""
        print("🤖 DIVA OpenAI-Supabase 인터페이스에 오신 것을 환영합니다!")
        print("=" * 60)
        
        # Show database overview
        schema = self.get_database_schema()
        print(f"📊 데이터베이스 개요:")
        for table_name, info in schema["tables"].items():
            print(f"   • {table_name}: {info.get('record_count', 0):,} records")
        print(f"   총 레코드: {schema['total_records']:,}")
        print()
        
        print("💡 예시 질문:")
        print("   • 미래에셋벤처투자에 몇 명이 일하나요?")
        print("   • 카카오벤처스의 연락처를 알려주세요")
        print("   • 가장 많은 직원을 보유한 VC는 어디인가요?")
        print("   • 창조경제혁신센터는 몇 개나 있나요?")
        print("   • 대학 기술지주회사 연락처들을 분석해주세요")
        print()
        print("종료하려면 'quit' 또는 'exit'를 입력하세요.")
        print("=" * 60)
        
        while True:
            try:
                question = input("\n🗨️  질문을 입력하세요: ").strip()
                
                if question.lower() in ['quit', 'exit', '종료', '나가기']:
                    print("👋 감사합니다!")
                    break
                
                if not question:
                    continue
                
                print("\n🔄 분석 중...")
                answer = self.ask_ai_question(question)
                
                print(f"\n🤖 답변:")
                print("-" * 40)
                print(answer)
                print("-" * 40)
                
            except KeyboardInterrupt:
                print("\n👋 세션이 종료되었습니다.")
                break
            except Exception as e:
                print(f"❌ 오류가 발생했습니다: {e}")


def main():
    """Main execution function"""
    print("🚀 DIVA Supabase-OpenAI 통합 인터페이스")
    print("=" * 50)
    print("📍 전체 Supabase 테이블에 대한 AI 분석")
    print("📍 한국어 지원 지능형 쿼리 시스템")
    print()
    
    try:
        # Initialize interface
        interface = SupabaseOpenAIInterface()
        
        # Start interactive chat
        interface.interactive_chat()
        
    except Exception as e:
        print(f"❌ 초기화 오류: {e}")
        print("API 설정을 확인해주세요 (api_config.py)")


if __name__ == "__main__":
    main() 