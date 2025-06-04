#!/usr/bin/env python3
"""
Comprehensive VC & Fund OpenAI Interface for DIVA Intelligence System
Provides complete analysis across VC companies, funds, and contacts
Includes operating amounts, fund details, investment focus, and personnel analysis
"""

import json
import time
from typing import Dict, List, Optional, Any
from supabase import create_client, Client
from api_config import get_supabase_config, get_config
import openai
from fuzzywuzzy import fuzz, process

class ComprehensiveVCAnalyzer:
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
        
    def discover_all_tables(self) -> Dict:
        """Discover all available tables for comprehensive analysis"""
        if self.schema_cache:
            return self.schema_cache
            
        print("📊 Analyzing comprehensive database schema...")
        
        schema_info = {
            "tables": {},
            "total_records": 0,
            "last_updated": time.strftime('%Y-%m-%d %H:%M:%S')
        }
        
        # Define all potential tables for comprehensive VC analysis
        table_configs = {
            "vc_table": {
                "description": "VC companies with operating amounts, locations, and business details",
                "priority": 1
            },
            "fund_table": {
                "description": "Investment funds with sizes, establishment dates, and status",
                "priority": 1
            },
            "funds": {
                "description": "Alternative fund information table",
                "priority": 1
            },
            "contacts_full": {
                "description": "Complete contact database for personnel analysis",
                "priority": 2
            },
            "contacts_matched": {
                "description": "High-confidence VC company-contact matches",
                "priority": 2
            },
            "fund_details": {
                "description": "Detailed fund information and performance",
                "priority": 1
            },
            "company_funds": {
                "description": "Mapping between companies and their funds",
                "priority": 1
            }
        }
        
        for table_name, config in table_configs.items():
            try:
                # Get record count
                count_response = self.supabase.table(table_name).select("id", count="exact").limit(1).execute()
                record_count = count_response.count if hasattr(count_response, 'count') else len(count_response.data)
                
                if record_count > 0:
                    # Get sample records for field analysis
                    sample_response = self.supabase.table(table_name).select("*").limit(3).execute()
                    sample_records = sample_response.data
                    
                    # Analyze actual fields
                    actual_fields = list(sample_records[0].keys()) if sample_records else []
                    
                    schema_info["tables"][table_name] = {
                        "description": config["description"],
                        "priority": config["priority"],
                        "record_count": record_count,
                        "fields": actual_fields,
                        "sample_record": sample_records[0] if sample_records else {}
                    }
                    
                    schema_info["total_records"] += record_count
                    print(f"✅ {table_name}: {record_count:,} records (Priority {config['priority']})")
                
            except Exception as e:
                print(f"⚠️ {table_name}: Not accessible - {str(e)[:50]}...")
        
        self.schema_cache = schema_info
        return schema_info
    
    def get_comprehensive_company_data(self, company_name: str = None) -> Dict:
        """Get comprehensive data for a company including VC details, funds, and contacts"""
        data = {
            "company_profile": {},
            "fund_portfolio": [],
            "personnel": [],
            "business_metrics": {},
            "investment_focus": {},
            "query_info": {
                "company_filter": company_name,
                "timestamp": time.strftime('%Y-%m-%d %H:%M:%S')
            }
        }
        
        try:
            # 1. Get VC Company Profile
            if company_name:
                print(f"🔍 Searching for company: {company_name}")
                
                # Try exact match first
                vc_companies = self.query_table_data("vc_table", {"company_name": company_name}, 5)
                
                # If no exact match, use fuzzy matching with strict threshold
                if not vc_companies:
                    print(f"🔍 No exact match found, trying fuzzy search...")
                    all_vc = self.query_table_data("vc_table", limit=717)
                    
                    # Use fuzzy matching with minimum 90% similarity threshold (very strict)
                    company_names = [company.get('company_name', '') for company in all_vc]
                    
                    # Find best matches with very strict minimum threshold
                    best_matches = process.extract(company_name, company_names, limit=3, scorer=fuzz.ratio)
                    
                    # Only accept matches above 90% similarity (very strict) 
                    fuzzy_matches = []
                    for match_name, score in best_matches:
                        if score >= 90:  # Raised to 90% - very strict
                            # Additional validation: ensure reasonable semantic similarity
                            if len(company_name) >= 3 and len(match_name) >= 3:
                                # Check if the core part of the name is similar
                                core_query = company_name.replace('벤처스', '').replace('벤처투자', '').replace('투자', '')
                                core_match = match_name.replace('벤처스', '').replace('벤처투자', '').replace('투자', '')
                                
                                # If core names are too different, reject
                                if len(core_query) >= 2 and len(core_match) >= 2:
                                    core_similarity = fuzz.ratio(core_query, core_match)
                                    if core_similarity < 80:
                                        print(f"   ❌ Rejected match: '{match_name}' (similarity: {score}% but core mismatch: {core_similarity}%)")
                                        continue
                            
                            print(f"   📍 Fuzzy match: '{match_name}' (similarity: {score}%)")
                            for company in all_vc:
                                if company.get('company_name') == match_name:
                                    fuzzy_matches.append(company)
                                    break
                        else:
                            print(f"   ❌ Rejected match: '{match_name}' (similarity: {score}% - below 90% threshold)")
                    
                    vc_companies = fuzzy_matches[:5]
                    
                    if not vc_companies:
                        print(f"❌ No companies found matching '{company_name}' with minimum 90% similarity")
                        data["query_info"]["search_result"] = f"Company '{company_name}' not found in database"
                        return data
                
                if vc_companies:
                    # Fix: Ensure we're getting a single company profile, not a list
                    data["company_profile"] = vc_companies[0]
                    company_id = vc_companies[0].get('company_id')
                    print(f"✅ Found company: {vc_companies[0].get('company_name')} (ID: {company_id})")
                    
                    # 2. Get Fund Portfolio for this company
                    if company_id:
                        funds = self.get_company_funds(company_id)
                        data["fund_portfolio"] = funds
                        print(f"📊 Found {len(funds)} funds for this company")
                    
                    # 3. Get Personnel/Contacts
                    contacts = self.query_table_data("contacts_matched", {"company_id": company_id}, 100)
                    if not contacts:
                        contacts = self.query_table_data("contacts_matched", {"회사": company_name}, 100)
                    data["personnel"] = contacts
                    print(f"👥 Found {len(contacts)} personnel")
                    
                    # 4. Calculate Business Metrics
                    data["business_metrics"] = self.calculate_business_metrics(data["company_profile"], data["fund_portfolio"])
                    
                    # 5. Determine Investment Focus
                    data["investment_focus"] = self.analyze_investment_focus(data["company_profile"], data["fund_portfolio"])
            
            else:
                # Get general overview data - fix: get single sample company instead of list
                sample_companies = self.query_table_data("vc_table", limit=1)
                if sample_companies:
                    data["company_profile"] = sample_companies[0]
                    
                    # Get sample funds
                    company_id = sample_companies[0].get('company_id')
                    if company_id:
                        data["fund_portfolio"] = self.get_company_funds(company_id)
                
        except Exception as e:
            print(f"❌ Error gathering comprehensive data: {e}")
            import traceback
            traceback.print_exc()
        
        return data
    
    def get_company_funds(self, company_id: str) -> List[Dict]:
        """Get all funds associated with a company"""
        funds = []
        
        try:
            # Search fund_table for funds with matching company_id
            print(f"🔍 Searching funds for company_id: {company_id}")
            
            # Primary search by company_id
            company_funds = self.query_table_data("fund_table", {"company_id": company_id}, 100)
            funds.extend(company_funds)
            
            # If no funds found by company_id, try by fund_id pattern
            if not company_funds and company_id:
                # Some funds might use different ID patterns
                all_funds = self.query_table_data("fund_table", limit=1000)
                for fund in all_funds:
                    fund_company_id = fund.get('company_id', '')
                    if fund_company_id == company_id:
                        funds.append(fund)
            
            print(f"📊 Found {len(funds)} funds for company_id: {company_id}")
                        
        except Exception as e:
            print(f"❌ Error getting company funds: {e}")
        
        return funds
    
    def calculate_business_metrics(self, company_profile: Dict, fund_portfolio: List[Dict]) -> Dict:
        """Calculate comprehensive business metrics"""
        metrics = {
            "operating_amount": 0,
            "total_fund_size": 0,
            "fund_count": len(fund_portfolio),
            "business_age_years": 0,
            "aum_per_fund": 0,
            "market_position": "",
            "financial_scale": ""
        }
        
        try:
            # Operating Amount (AUM) - already in 억원 units
            operating_amount = company_profile.get('operating_amount', 0)
            if operating_amount:
                metrics["operating_amount"] = float(operating_amount)
                
                # Fix: Determine financial scale based on 억원 (not converting from 백만원)
                if metrics["operating_amount"] > 5000:  # 5000억원+
                    metrics["financial_scale"] = "Large (5000억원+)"
                elif metrics["operating_amount"] > 1000:  # 1000-5000억원
                    metrics["financial_scale"] = "Medium (1000-5000억원)"
                elif metrics["operating_amount"] > 100:  # 100-1000억원
                    metrics["financial_scale"] = "Small (100-1000억원)"
                else:  # 100억원 미만
                    metrics["financial_scale"] = "Micro (100억원 미만)"
            
            # Fund Portfolio Analysis
            if fund_portfolio:
                fund_sizes = []
                for fund in fund_portfolio:
                    size = fund.get('fund_size', 0)
                    if size and isinstance(size, (int, float)) and size > 0:
                        fund_sizes.append(float(size))
                
                if fund_sizes:
                    metrics["total_fund_size"] = sum(fund_sizes)
                    metrics["aum_per_fund"] = metrics["total_fund_size"] / len(fund_sizes)
            
            # Business Age
            established_date = company_profile.get('established_date')
            if established_date:
                from datetime import datetime
                try:
                    est_date = datetime.strptime(established_date, '%Y-%m-%d')
                    age_days = (datetime.now() - est_date).days
                    metrics["business_age_years"] = age_days / 365.25
                except:
                    pass
            
            # Market Position
            company_type = company_profile.get('company_type', '')
            if '벤처투자회사' in company_type:
                metrics["market_position"] = "Dedicated VC Firm"
            elif '기타운용사' in company_type:
                metrics["market_position"] = "General Asset Manager"
            else:
                metrics["market_position"] = company_type
                
        except Exception as e:
            print(f"⚠️ Error calculating metrics: {e}")
        
        return metrics
    
    def analyze_investment_focus(self, company_profile: Dict, fund_portfolio: List[Dict]) -> Dict:
        """Analyze investment focus and strategy"""
        focus = {
            "industry_focus": [],
            "stage_focus": [],
            "geographic_focus": "",
            "fund_strategy": [],
            "esg_focus": False
        }
        
        try:
            # Industry focus from company profile
            industry = company_profile.get('industry', '')
            if industry:
                focus["industry_focus"].append(industry)
            
            # Geographic focus
            location = company_profile.get('location', '')
            if location:
                focus["geographic_focus"] = location
            
            # Fund strategy analysis
            for fund in fund_portfolio:
                fund_name = fund.get('fund_name', '').lower()
                if fund_name:
                    # ESG focus detection
                    if 'esg' in fund_name:
                        focus["esg_focus"] = True
                    
                    # Stage focus detection
                    if '초기' in fund_name or 'seed' in fund_name:
                        focus["stage_focus"].append("Early Stage")
                    elif '성장' in fund_name or 'growth' in fund_name:
                        focus["stage_focus"].append("Growth Stage")
                    elif 'late' in fund_name or '후기' in fund_name:
                        focus["stage_focus"].append("Late Stage")
                    
                    # Strategy keywords
                    if '벤처' in fund_name:
                        focus["fund_strategy"].append("Venture Capital")
                    if '사모' in fund_name:
                        focus["fund_strategy"].append("Private Equity")
            
            # Remove duplicates
            focus["stage_focus"] = list(set(focus["stage_focus"]))
            focus["fund_strategy"] = list(set(focus["fund_strategy"]))
            
        except Exception as e:
            print(f"⚠️ Error analyzing investment focus: {e}")
        
        return focus
    
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
    
    def ask_comprehensive_question(self, question: str) -> str:
        """Ask comprehensive question with full VC & fund context"""
        print(f"🤖 Processing comprehensive VC question: {question}")
        
        # Get database schema
        schema = self.discover_all_tables()
        
        # Determine company from question
        company_name = self.extract_company_name_from_question(question)
        
        # Get comprehensive data
        comprehensive_data = self.get_comprehensive_company_data(company_name)
        
        # Prepare context for AI
        context = self.prepare_comprehensive_context(schema, comprehensive_data, question)
        
        # Create comprehensive AI prompt
        system_prompt = """당신은 한국 벤처캐피탈 데이터베이스 분석가입니다.
Supabase 데이터베이스의 실제 데이터만을 분석하여 정확한 사실 기반 리포트를 제공합니다.

🚨 **중요한 분석 원칙:**

1. **데이터 정확성 (Data Accuracy)**
   - 제공된 데이터베이스 값만 사용하세요
   - 추측, 가정, 외부 지식을 추가하지 마세요
   - 데이터가 없으면 "N/A" 또는 "데이터 없음"으로 표시하세요

2. **회사 검색 결과 처리 (Company Search Results)**
   - 만약 company_profile이 비어있거나 "not found" 메시지가 포함되어 있다면:
     * "❌ 해당 회사를 데이터베이스에서 찾을 수 없습니다"라고 명확히 응답하세요
     * 다른 회사 정보를 추측하거나 제공하지 마세요
     * 사용자에게 정확한 회사명을 확인하도록 안내하세요

3. **데이터 출처 명시 (Data Attribution)**
   - 운영자산 데이터는 반드시 "vcs.go.kr 포털 기준"임을 명시하세요
   - 모든 수치는 데이터베이스에서 직접 추출된 값임을 표시하세요

4. **인사 정보 주의 (Personnel Data Warning)**
   - Sparklabs Remember DB에 있는 실제 인사 정보만 사용하세요
   - 임의의 인명이나 직책을 만들어내지 마세요
   - contacts_matched 테이블의 실제 데이터만 참조하세요

5. **필수 포함 정보 (Required Information):**
   - 👤 대표: 회사 대표이사/대표 정보 (데이터베이스 값만)
   - 🌐 웹사이트: 회사 공식 웹사이트 URL (데이터베이스 값만)
   - 💰 재무 정보: 운영자산(vcs.go.kr 기준), 펀드 규모
   - 🏢 기업 정보: 설립일, 위치, 업종, 회사유형
   - 📊 펀드 포트폴리오: 펀드명, 규모, 설립일, 투자분야, 만료일
   - 👥 인력 구성: Sparklabs Remember DB 매칭된 연락처 데이터만

6. **분석 영역:**
   - 💰 재무 정보: 운영자산(vcs.go.kr 기준), 펀드 규모
   - 🏢 기업 정보: 설립일, 위치, 업종, 회사유형
   - 📊 펀드 포트폴리오: 펀드명, 규모, 설립일, 투자분야, 만료일
   - 👥 인력 구성: Sparklabs Remember DB 매칭된 연락처 데이터만

**⚠️ 금지사항:**
- 데이터베이스에 없는 정보 추가 금지
- 임의의 인명, 직책, 연락처 생성 금지
- 추측성 분석이나 외부 정보 사용 금지
- 데이터 출처 생략 금지
- 회사를 찾을 수 없을 때 다른 회사 정보 제공 금지

**💰 포맷팅 규칙:**
- 모든 금액은 "억원" 단위로 표시 (예: 4303억원)
- 운영자산은 반드시 "vcs.go.kr 포털 기준 XX억원"으로 표시

**📊 펀드 정보 포맷:**
- 펀드명, 규모(억원), 설립일, 투자분야, 만료일을 포함하세요
- 각 펀드의 투자분야와 만료일 정보를 활용한 분석을 제공하세요

**👤 대표 및 웹사이트 정보 필수 표시:**
- 모든 회사 분석에서 대표이사/대표 정보를 포함하세요
- 회사 웹사이트 URL을 포함하세요
- 데이터가 없는 경우 명확히 "데이터 없음" 표시

**🔍 회사 검색 실패 시:**
- 회사를 찾을 수 없으면 "❌ 해당 회사를 데이터베이스에서 찾을 수 없습니다"
- "정확한 회사명을 확인해 주시기 바랍니다"
- 다른 회사 정보나 추측 정보를 제공하지 마세요

**응답 형식:**
- 실제 데이터베이스 값만 사용한 정확한 분석
- 데이터 출처 명시 (특히 vcs.go.kr)
- 대표 및 웹사이트 정보 기본 포함
- 데이터가 없는 항목은 명확히 "데이터 없음" 표시"""

        user_prompt = f"""
질문: {question}

포괄적 데이터베이스 컨텍스트:
{context}

위 데이터를 바탕으로 완전한 VC 생태계 분석을 제공해주세요.
특히 운용자산, 펀드 포트폴리오, 투자 전략, 시장 포지션을 중심으로 분석해주세요.
"""

        try:
            response = self.openai_client.chat.completions.create(
                model="gpt-4",
                messages=[
                    {"role": "system", "content": system_prompt},
                    {"role": "user", "content": user_prompt}
                ],
                temperature=0.7,
                max_tokens=3000
            )
            
            return response.choices[0].message.content
            
        except Exception as e:
            return f"❌ AI 분석 중 오류가 발생했습니다: {e}"
    
    def prepare_comprehensive_context(self, schema: Dict, data: Dict, question: str) -> str:
        """Prepare comprehensive context for AI analysis"""
        context_parts = []
        
        # Add important data accuracy warning
        context_parts.append("🚨 **데이터 정확성 주의사항**")
        context_parts.append("- 이 데이터는 vcs.go.kr 포털에서 추출된 공식 데이터입니다")
        context_parts.append("- 제공된 데이터베이스 값만 사용하고 추측하지 마세요")
        context_parts.append("- 인사정보는 Sparklabs Remember DB 실제 매칭된 데이터만 사용하세요")
        context_parts.append("- 모든 금액 단위는 억원입니다")
        context_parts.append("")
        
        # 1. Company Profile (HIGHEST PRIORITY)
        if data.get("company_profile"):
            company = data["company_profile"]
            context_parts.append("=== 🎯 회사 프로필 (vcs.go.kr 공식 데이터) ===")
            context_parts.append(f"회사명: {company.get('company_name', 'N/A')}")
            context_parts.append(f"회사 ID: {company.get('company_id', 'N/A')}")
            
            # Add representative information
            representative = company.get('representative', '')
            if representative and representative.strip():
                context_parts.append(f"👤 대표: {representative}")
            else:
                context_parts.append(f"👤 대표: 데이터 없음")
            
            # Add website information  
            website_url = company.get('website_url', '')
            if website_url and website_url.strip():
                context_parts.append(f"🌐 웹사이트: {website_url}")
            else:
                context_parts.append(f"🌐 웹사이트: 데이터 없음")
            
            # Fix: operating_amount is already in 억원, don't divide by 100
            operating_amount = company.get('operating_amount', 0)
            if operating_amount:
                context_parts.append(f"💰 운영자산 (vcs.go.kr 포털 기준): {operating_amount:.0f} 억원")
            else:
                context_parts.append(f"💰 운영자산 (vcs.go.kr 포털 기준): 데이터 없음")
                
            context_parts.append(f"📍 위치: {company.get('location', '데이터 없음')}")
            context_parts.append(f"📅 설립일: {company.get('established_date', '데이터 없음')}")
            context_parts.append(f"🏢 사업기간: {company.get('founded', '데이터 없음')}")
            context_parts.append(f"🏭 업종: {company.get('industry', '데이터 없음')}")
            context_parts.append(f"📊 회사유형: {company.get('company_type', '데이터 없음')}")
            context_parts.append(f"📊 상태: {company.get('status', '데이터 없음')}")
            
            # Add disclosure data if available
            disclosure = company.get('disclosure_data', '')
            if disclosure:
                context_parts.append(f"📋 vcs.go.kr 상세정보: {str(disclosure)[:200]}...")
            context_parts.append("")
        
        # 2. Business Metrics
        if data.get("business_metrics"):
            metrics = data["business_metrics"]
            context_parts.append("=== 📊 사업 지표 (데이터베이스 계산값) ===")
            
            # Fix: operating_amount is already in 억원
            operating_amount = metrics.get('operating_amount', 0)
            if operating_amount:
                context_parts.append(f"💰 운영자산 (vcs.go.kr 기준): {operating_amount:.0f} 억원")
            else:
                context_parts.append(f"💰 운영자산: 데이터 없음")
                
            total_fund_size = metrics.get('total_fund_size', 0)
            if total_fund_size:
                total_fund_size_eok = float(total_fund_size) / 1e8  # Convert 원 to 억원
                context_parts.append(f"📊 펀드 총 규모 (계산값): {total_fund_size_eok:.0f} 억원")
            else:
                context_parts.append(f"📊 펀드 총 규모: 데이터 없음")
                
            context_parts.append(f"🏢 펀드 개수: {metrics.get('fund_count', 0)}개")
            context_parts.append(f"📅 사업 연수: {metrics.get('business_age_years', 0):.1f}년")
            context_parts.append(f"📈 재무 규모: {metrics.get('financial_scale', '분류 없음')}")
            context_parts.append(f"🎯 시장 포지션: {metrics.get('market_position', '분류 없음')}")
            context_parts.append("")
        
        # 3. Fund Portfolio
        if data.get("fund_portfolio"):
            funds = data["fund_portfolio"]
            context_parts.append(f"=== 💼 펀드 포트폴리오 (fund_table 실제 데이터) ===")
            context_parts.append(f"총 {len(funds)}개 펀드 (vcs.go.kr 등록 기준)")
            
            for fund in funds[:5]:  # Show top 5 funds
                context_parts.append(f"펀드명: {fund.get('fund_name', '펀드명 없음')}")
                
                # Fund size in 억원
                fund_size = fund.get('fund_size', 0)
                if fund_size:
                    fund_size_eok = float(fund_size) / 1e8  # Convert 원 to 억원
                    context_parts.append(f"  규모: {fund_size_eok:.0f} 억원")
                else:
                    context_parts.append(f"  규모: 데이터 없음")
                    
                # Establishment date
                establishment_date = fund.get('establishment_date', '데이터 없음')
                context_parts.append(f"  설립일: {establishment_date}")
                
                # 🔥 ENHANCED: Fund Manager (대표펀드매니저) Information - NOW PROPERLY DISPLAYED
                fund_manager = fund.get('representative', '')
                if fund_manager and fund_manager.strip():
                    context_parts.append(f"  👤 대표펀드매니저: {fund_manager}")
                else:
                    context_parts.append(f"  👤 대표펀드매니저: 데이터 없음")
                
                # Investment detail (new addition)
                investment_detail = fund.get('investment_detail', '')
                if investment_detail:
                    # Clean up investment detail if it's JSON-like
                    if investment_detail.startswith('[') and investment_detail.endswith(']'):
                        # Remove brackets and quotes for cleaner display
                        clean_detail = investment_detail.strip('[]').replace('"', '').replace("'", '')
                        context_parts.append(f"  투자분야: {clean_detail}")
                    else:
                        context_parts.append(f"  투자분야: {investment_detail}")
                else:
                    context_parts.append(f"  투자분야: 데이터 없음")
                
                # Expiry date (new addition)
                expiry_date = fund.get('expiry_date', '데이터 없음')
                context_parts.append(f"  만료일: {expiry_date}")
                
                context_parts.append("")  # Empty line between funds
                
            if len(funds) > 5:
                context_parts.append(f"... 외 {len(funds) - 5}개 펀드 추가")
        else:
            context_parts.append("=== 💼 펀드 포트폴리오 ===")
            context_parts.append("연결된 펀드 데이터 없음")
            context_parts.append("")
        
        # 4. Investment Focus
        if data.get("investment_focus"):
            focus = data["investment_focus"]
            context_parts.append("=== 🎯 투자 포커스 (펀드명 기반 분석) ===")
            if focus.get("industry_focus"):
                context_parts.append(f"업종 포커스: {', '.join(focus['industry_focus'])}")
            else:
                context_parts.append("업종 포커스: 데이터 없음")
                
            if focus.get("stage_focus"):
                context_parts.append(f"투자 단계: {', '.join(focus['stage_focus'])}")
            else:
                context_parts.append("투자 단계: 데이터 없음")
                
            context_parts.append(f"지역 포커스: {focus.get('geographic_focus', '데이터 없음')}")
            
            if focus.get("fund_strategy"):
                context_parts.append(f"펀드 전략: {', '.join(focus['fund_strategy'])}")
            else:
                context_parts.append("펀드 전략: 데이터 없음")
                
            context_parts.append(f"ESG 투자: {'Yes' if focus.get('esg_focus') else 'No'}")
            context_parts.append("")
        
        # 5. Personnel Information - Updated labeling
        if data.get("personnel"):
            personnel = data["personnel"]
            context_parts.append(f"=== 👥 Sparklabs Remember DB 연락처 정보 ===")
            context_parts.append(f"Sparklabs Remember DB company contact base에서 매칭된 {len(personnel)}명의 연락처")
            context_parts.append("⚠️ 주의: 이것은 우리가 파일에 보유한 사람들입니다")
            
            if personnel:
                # Group by position - only use actual data
                positions = {}
                for person in personnel:
                    position = person.get('직책', 'Unknown')
                    name = person.get('이름', 'N/A')
                    if position not in positions:
                        positions[position] = []
                    if name != 'N/A':
                        positions[position].append(name)
                
                if positions:
                    for position, names in positions.items():
                        if names:  # Only show positions with actual names
                            context_parts.append(f"{position}: {len(names)}명")
                else:
                    context_parts.append("구체적인 직책 정보 없음")
            else:
                context_parts.append("매칭된 인사 데이터 없음")
            context_parts.append("")
        else:
            context_parts.append("=== 👥 Sparklabs Remember DB 연락처 정보 ===")
            context_parts.append("Sparklabs Remember DB에서 매칭된 연락처 데이터 없음")
            context_parts.append("")
        
        # 6. Database Overview
        context_parts.append("=== 📈 데이터 출처 및 현황 ===")
        context_parts.append("데이터 소스: vcs.go.kr 포털 (한국벤처투자)")
        context_parts.append("연락처 소스: Sparklabs Remember DB")
        for table_name, table_info in schema["tables"].items():
            context_parts.append(f"{table_name}: {table_info.get('record_count', 0):,} records")
        
        return "\n".join(context_parts)
    
    def extract_company_name_from_question(self, question: str) -> Optional[str]:
        """Extract company name from question using pattern matching"""
        # Korean VC companies
        common_companies = [
            "미래에셋", "카카오벤처스", "한국벤처투자", "신한벤처투자", "스톤브릿지벤처스",
            "컴퍼니케이파트너스", "그래비티벤처스", "패스트벤처스", "하나벤처스", "롯데벤처스",
            "우리벤처파트너스", "센트럴투자파트너스", "킹슬리벤처스", "소풍벤처스", "인라이트벤처스",
            "메디톡스벤처투자", "알마덴디자인리서치", "사덕벤처스", "아이파트너즈"
        ]
        
        question_lower = question.lower()
        for company in common_companies:
            if company in question_lower:
                return company
        
        return None
    
    def interactive_comprehensive_chat(self):
        """Start comprehensive interactive chat session"""
        print("🚀 DIVA 종합 VC & 펀드 분석 인터페이스에 오신 것을 환영합니다!")
        print("=" * 70)
        
        # Show database overview
        schema = self.discover_all_tables()
        print(f"📊 포괄적 데이터베이스 개요:")
        total_records = 0
        for table_name, info in schema["tables"].items():
            records = info.get('record_count', 0)
            priority = info.get('priority', 3)
            print(f"   • {table_name}: {records:,} records (Priority {priority})")
            total_records += records
        print(f"   총 레코드: {total_records:,}")
        print()
        
        print("💡 종합 분석 예시 질문:")
        print("   • 미래에셋벤처투자의 운용자산과 펀드 포트폴리오는?")
        print("   • 카카오벤처스의 투자 전략과 시장 포지션 분석해줘")
        print("   • 운용자산 규모별 VC 회사 분포는?")
        print("   • ESG 펀드를 운용하는 VC는 어디야?")
        print("   • 서울 지역 VC 회사들의 평균 운용자산은?")
        print("   • 벤처투자회사와 기타운용사의 차이점 분석해줘")
        print()
        print("종료하려면 'quit' 또는 'exit'를 입력하세요.")
        print("=" * 70)
        
        while True:
            try:
                question = input("\n🗨️  종합 질문을 입력하세요: ").strip()
                
                if question.lower() in ['quit', 'exit', '종료', '나가기']:
                    print("👋 분석을 마치겠습니다. 감사합니다!")
                    break
                
                if not question:
                    continue
                
                print(f"\n🔄 종합 분석 중... (VC + 펀드 + 인력)")
                answer = self.ask_comprehensive_question(question)
                
                print(f"\n🤖 종합 분석 결과:")
                print("-" * 60)
                print(answer)
                print("-" * 60)
                
            except KeyboardInterrupt:
                print("\n👋 분석 세션이 종료되었습니다.")
                break
            except Exception as e:
                print(f"❌ 오류가 발생했습니다: {e}")


def main():
    """Main execution function"""
    print("🚀 DIVA 종합 VC & 펀드 분석 시스템")
    print("=" * 60)
    print("📍 VC Table + Fund Table + Contact 통합 분석")
    print("📍 운용자산, 펀드 포트폴리오, 투자 전략 종합 리포트")
    print()
    
    try:
        # Initialize comprehensive analyzer
        analyzer = ComprehensiveVCAnalyzer()
        
        # Start interactive comprehensive analysis
        analyzer.interactive_comprehensive_chat()
        
    except Exception as e:
        print(f"❌ 초기화 오류: {e}")
        print("API 설정을 확인해주세요 (api_config.py)")


if __name__ == "__main__":
    main() 