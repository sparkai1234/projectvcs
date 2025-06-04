#!/usr/bin/env python3
"""
OpenAI Integration for DIVA Intelligence System
Provides AI-powered analysis, summaries, and insights from DIVA data
"""

import json
import logging
from datetime import datetime
from typing import List, Dict, Optional, Any
import os
import time
from dataclasses import dataclass

# OpenAI imports
try:
    import openai
    OPENAI_AVAILABLE = True
except ImportError:
    print("⚠️  openai not installed. Run: pip install openai")
    OPENAI_AVAILABLE = False

# Configure logging
logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')
logger = logging.getLogger(__name__)

@dataclass
class AnalysisRequest:
    """Structure for AI analysis requests"""
    query: str
    data_scope: str  # 'company', 'sector', 'full'
    analysis_type: str  # 'summary', 'comparison', 'insight', 'professional_match'
    company_ids: List[str] = None
    response_format: str = 'detailed'  # 'brief', 'detailed', 'report'

class OpenAIDIVAAnalyzer:
    def __init__(self, api_key: str, model: str = "gpt-4-turbo-preview", default_language: str = "korean"):
        if not OPENAI_AVAILABLE:
            raise ImportError("openai package is required")
        
        self.client = openai.OpenAI(api_key=api_key)
        self.model = model
        self.default_language = default_language
        
        # Language-specific system prompts
        self.system_prompts = {
            'korean': {
                'company_summary': """당신은 한국 벤처캐피탈 업계 전문가로서 DIVA 포털의 종합적인 회사 데이터를 분석합니다. 
                회사 프로필, 인력, 펀드 성과, 시장 위치에 대한 통찰력 있는 분석을 제공합니다. 
                모든 분석은 한국어로 작성하되, 요청 시 영어 요약도 포함합니다.""",
                
                'professional_analysis': """당신은 한국 VC의 전문 인력 데이터 분석 전문가입니다. 
                경험 수준, 전문화 비율, 팀 구성 인사이트에 중점을 둡니다. 
                잠재적인 네트워킹 및 협업 기회 식별을 도와줍니다. 모든 분석은 한국어로 제공합니다.""",
                
                'fund_analysis': """당신은 한국 VC 생태계 전문 펀드 분석 전문가입니다. 
                펀드 규모, 성과 지표, 투자 패턴을 분석합니다. 
                투자 결정을 위한 전략적 인사이트를 한국어로 제공합니다.""",
                
                'market_insights': """당신은 한국 VC 시장 분석가로서 생태계에 대한 깊은 지식을 보유하고 있습니다. 
                시장 트렌드, 경쟁적 위치, 전략적 기회를 분석합니다. 
                실행 가능한 비즈니스 인텔리전스를 한국어로 제공합니다.""",
                
                'contact_matching': """당신은 전문적 네트워킹 및 연락처 매칭 전문가입니다. 
                전문가 직원 데이터를 분석하여 잠재적 비즈니스 연결, 파트너십 기회, 네트워킹 타겟을 식별합니다. 
                모든 추천사항은 한국어로 제공합니다."""
            },
            'english': {
                'company_summary': """You are a Korean VC industry expert analyzing comprehensive company data from DIVA portal. 
                Provide insightful analysis of company profiles, focusing on personnel, fund performance, and market position. 
                All analysis should be in English unless specifically requested otherwise.""",
                
                'professional_analysis': """You are an expert in analyzing professional staff data for Korean VCs. 
                Focus on experience levels, specialization ratios, and team composition insights. 
                Help identify potential networking and collaboration opportunities in English.""",
                
                'fund_analysis': """You are a fund analysis expert specializing in Korean VC ecosystem. 
                Analyze fund sizes, performance metrics, and investment patterns. 
                Provide strategic insights for investment decisions in English.""",
                
                'market_insights': """You are a Korean VC market analyst with deep knowledge of the ecosystem. 
                Analyze market trends, competitive positioning, and strategic opportunities. 
                Provide actionable business intelligence in English.""",
                
                'contact_matching': """You are an expert in professional networking and contact matching. 
                Analyze professional staff data to identify potential business connections, 
                partnership opportunities, and networking targets in English."""
            }
        }
        
    def set_language(self, language: str):
        """Set the analysis language (korean or english)"""
        if language.lower() in ['korean', 'english']:
            self.default_language = language.lower()
        else:
            print(f"⚠️  지원되지 않는 언어: {language}. 'korean' 또는 'english'를 사용하세요.")
            print(f"⚠️  Unsupported language: {language}. Use 'korean' or 'english'.")
    
    def get_language_prompt(self) -> str:
        """Get language-specific instruction"""
        if self.default_language == 'korean':
            return "모든 분석과 응답은 한국어로 작성해주세요. 전문용어는 한국어와 영어를 병기할 수 있습니다."
        else:
            return "Provide all analysis and responses in English. Korean terms can be included in parentheses for clarity."
    
    def load_diva_data(self, data_file: str) -> Dict:
        """Load DIVA data from JSON file"""
        try:
            with open(data_file, 'r', encoding='utf-8') as f:
                data = json.load(f)
            logger.info(f"Loaded DIVA data from {data_file}")
            return data
        except Exception as e:
            logger.error(f"Error loading DIVA data: {e}")
            return {}
    
    def analyze_company_profile(self, company_id: str, company_data: Dict, analysis_type: str = 'comprehensive') -> str:
        """Analyze a single company's complete profile"""
        
        # Prepare company data summary
        company_summary = self._prepare_company_summary(company_data)
        
        # Language instruction
        language_instruction = self.get_language_prompt()
        
        # Create analysis prompt
        if analysis_type == 'comprehensive':
            if self.default_language == 'korean':
                prompt = f"""
                다음 한국 VC 회사의 종합적인 프로필을 분석하고 포괄적인 인사이트를 제공해주세요:

                회사명: {company_data.get('company_name', '알 수 없음')}
                회사 ID: {company_id}

                {company_summary}

                다음 항목들을 분석해주세요:
                1. 회사 개요 및 시장 내 위치
                2. 인력 및 팀 분석
                3. 펀드 포트폴리오 평가
                4. 투자 성과 분석
                5. 전문 인력 인사이트
                6. 강점 및 기회
                7. 전략적 권장사항
                8. 네트워킹 잠재력

                전문적인 분석 보고서 형식으로 작성해주세요.
                {language_instruction}
                """
            else:
                prompt = f"""
                Analyze this Korean VC company's complete profile and provide comprehensive insights:

                Company: {company_data.get('company_name', 'Unknown')}
                Company ID: {company_id}

                {company_summary}

                Please provide:
                1. Company Overview & Positioning
                2. Personnel & Team Analysis
                3. Fund Portfolio Assessment
                4. Investment Performance Analysis
                5. Professional Staff Insights
                6. Strengths & Opportunities
                7. Strategic Recommendations
                8. Networking Potential

                Format as a professional analysis report.
                {language_instruction}
                """
        elif analysis_type == 'personnel_focus':
            if self.default_language == 'korean':
                prompt = f"""
                이 VC 회사의 인력 및 전문 직원 분석에 집중해주세요:

                회사명: {company_data.get('company_name', '알 수 없음')}
                
                {self._extract_personnel_data(company_data)}

                다음을 분석해주세요:
                1. 팀 구성 및 규모
                2. 전문성 수준
                3. 투자 심사 역량
                4. 경영 구조
                5. 경험 및 전문화 패턴
                6. 잠재적 네트워킹 연락처
                7. 펀드 규모 대비 인력 효율성

                비즈니스 개발을 위한 실행 가능한 인사이트를 제공해주세요.
                {language_instruction}
                """
            else:
                prompt = f"""
                Focus on personnel and professional staff analysis for this VC company:

                Company: {company_data.get('company_name', 'Unknown')}
                
                {self._extract_personnel_data(company_data)}

                Analyze:
                1. Team composition and size
                2. Professional expertise levels
                3. Investment review capabilities
                4. Management structure
                5. Experience and specialization patterns
                6. Potential networking contacts
                7. Staffing efficiency vs. fund size

                Provide actionable insights for business development.
                {language_instruction}
                """
        elif analysis_type == 'investment_focus':
            if self.default_language == 'korean':
                prompt = f"""
                다음 회사의 투자 성과 및 펀드 지표를 분석해주세요:

                회사명: {company_data.get('company_name', '알 수 없음')}
                
                {self._extract_financial_data(company_data)}

                다음에 집중해주세요:
                1. 펀드 규모 및 성과
                2. 투자 패턴
                3. 포트폴리오 관리
                4. 시장 위치
                5. 경쟁사 분석
                6. ROI 및 성과 지표
                7. 투자 전략 인사이트

                전략적 투자 인텔리전스를 제공해주세요.
                {language_instruction}
                """
            else:
                prompt = f"""
                Analyze investment performance and fund metrics for:

                Company: {company_data.get('company_name', 'Unknown')}
                
                {self._extract_financial_data(company_data)}

                Focus on:
                1. Fund size and performance
                2. Investment patterns
                3. Portfolio management
                4. Market position
                5. Competitive analysis
                6. ROI and performance metrics
                7. Investment strategy insights

                Provide strategic investment intelligence.
                {language_instruction}
                """
        
        try:
            response = self.client.chat.completions.create(
                model=self.model,
                messages=[
                    {"role": "system", "content": self.system_prompts[self.default_language]['company_summary']},
                    {"role": "user", "content": prompt}
                ],
                temperature=0.7,
                max_tokens=2000
            )
            
            return response.choices[0].message.content
            
        except Exception as e:
            logger.error(f"Error analyzing company {company_id}: {e}")
            if self.default_language == 'korean':
                return f"회사 분석 중 오류 발생: {e}"
            else:
                return f"Error analyzing company: {e}"
    
    def analyze_sector_trends(self, company_profiles: Dict, sector_filter: str = None) -> str:
        """Analyze sector trends and market insights"""
        
        # Prepare aggregate data
        sector_data = self._prepare_sector_data(company_profiles, sector_filter)
        
        prompt = f"""
        Analyze the Korean VC ecosystem trends based on this comprehensive data:

        {sector_data}

        Provide insights on:
        1. Market Overview & Trends
        2. Fund Size Distribution
        3. Personnel Patterns Across Industry
        4. Investment Performance Trends
        5. Geographic Distribution
        6. Professional Experience Levels
        7. Competitive Landscape
        8. Emerging Opportunities
        9. Strategic Recommendations for Investors
        10. Key Players and Market Leaders

        Format as a comprehensive market intelligence report.
        """
        
        try:
            response = self.client.chat.completions.create(
                model=self.model,
                messages=[
                    {"role": "system", "content": self.system_prompts[self.default_language]['market_insights']},
                    {"role": "user", "content": prompt}
                ],
                temperature=0.7,
                max_tokens=3000
            )
            
            return response.choices[0].message.content
            
        except Exception as e:
            logger.error(f"Error analyzing sector trends: {e}")
            return f"Error analyzing sector: {e}"
    
    def find_professional_matches(self, target_criteria: Dict, company_profiles: Dict) -> str:
        """Find professional staff matches based on criteria"""
        
        # Extract professional staff data
        professional_data = self._extract_all_professional_data(company_profiles)
        
        criteria_text = json.dumps(target_criteria, ensure_ascii=False, indent=2)
        
        prompt = f"""
        Find and analyze professional staff matches based on these criteria:

        Target Criteria:
        {criteria_text}

        Available Professional Staff Data:
        {professional_data}

        Please:
        1. Identify top 10 matches based on criteria
        2. Rank by relevance and experience
        3. Provide contact recommendations
        4. Suggest networking strategies
        5. Highlight key qualifications
        6. Recommend introduction approaches
        7. Identify mutual connection opportunities

        Format as a professional networking report with actionable next steps.
        """
        
        try:
            response = self.client.chat.completions.create(
                model=self.model,
                messages=[
                    {"role": "system", "content": self.system_prompts[self.default_language]['contact_matching']},
                    {"role": "user", "content": prompt}
                ],
                temperature=0.7,
                max_tokens=2500
            )
            
            return response.choices[0].message.content
            
        except Exception as e:
            logger.error(f"Error finding professional matches: {e}")
            return f"Error finding matches: {e}"
    
    def compare_companies(self, company_ids: List[str], company_profiles: Dict) -> str:
        """Compare multiple companies"""
        
        comparison_data = []
        for company_id in company_ids:
            if company_id in company_profiles:
                profile = company_profiles[company_id]
                comparison_data.append({
                    'company_id': company_id,
                    'company_name': profile.get('company_name', 'Unknown'),
                    'summary': self._prepare_company_summary(profile)
                })
        
        comparison_text = json.dumps(comparison_data, ensure_ascii=False, indent=2)
        
        prompt = f"""
        Compare these Korean VC companies across all dimensions:

        {comparison_text}

        Provide detailed comparison on:
        1. Company Size & Scale
        2. Personnel & Team Strengths
        3. Fund Portfolio Comparison
        4. Investment Performance
        5. Professional Expertise
        6. Market Position
        7. Competitive Advantages
        8. Strategic Positioning
        9. Partnership Potential
        10. Investment Attractiveness

        Rank companies and provide strategic recommendations.
        """
        
        try:
            response = self.client.chat.completions.create(
                model=self.model,
                messages=[
                    {"role": "system", "content": self.system_prompts[self.default_language]['company_summary']},
                    {"role": "user", "content": prompt}
                ],
                temperature=0.7,
                max_tokens=3000
            )
            
            return response.choices[0].message.content
            
        except Exception as e:
            logger.error(f"Error comparing companies: {e}")
            return f"Error comparing companies: {e}"
    
    def generate_custom_analysis(self, query: str, company_profiles: Dict, scope: str = 'full') -> str:
        """Generate custom analysis based on user query"""
        
        # Prepare relevant data based on scope
        if scope == 'full':
            data_summary = self._prepare_full_dataset_summary(company_profiles)
        else:
            data_summary = self._prepare_focused_data(company_profiles, scope)
        
        prompt = f"""
        Based on the comprehensive DIVA Korean VC database, please answer this query:

        Query: {query}

        Available Data:
        {data_summary}

        Please provide a detailed, insightful response with:
        1. Direct answer to the query
        2. Supporting data and evidence
        3. Additional insights and context
        4. Strategic implications
        5. Actionable recommendations
        6. Related opportunities or considerations

        Be specific and use the actual data from the database.
        """
        
        try:
            response = self.client.chat.completions.create(
                model=self.model,
                messages=[
                    {"role": "system", "content": self.system_prompts[self.default_language]['market_insights']},
                    {"role": "user", "content": prompt}
                ],
                temperature=0.7,
                max_tokens=2500
            )
            
            return response.choices[0].message.content
            
        except Exception as e:
            logger.error(f"Error generating custom analysis: {e}")
            return f"Error generating analysis: {e}"
    
    def _prepare_company_summary(self, company_data: Dict) -> str:
        """Prepare formatted company summary"""
        summary_parts = []
        
        # Basic info
        summary_parts.append(f"Company: {company_data.get('company_name', 'Unknown')}")
        
        # Personnel data
        if company_data.get('personnel_data'):
            personnel = company_data['personnel_data']
            summary_parts.append(f"""
Personnel Data:
- Total Staff: {personnel.get('total_personnel', 0)}
- Professional Staff: {personnel.get('professional_staff', 0)}
- Investment Review Staff: {personnel.get('investment_review_staff', 0)}
- Management Staff: {personnel.get('management_staff', 0)}
""")
        
        # Fund data
        if company_data.get('fund_data'):
            fund_count = len(company_data['fund_data'])
            total_commitment = sum(fund.get('commitment_amount', 0) for fund in company_data['fund_data'])
            summary_parts.append(f"""
Fund Portfolio:
- Number of Funds: {fund_count}
- Total Commitment: {total_commitment/100000000:.1f} 억원
- Fund Details: {json.dumps([fund.get('fund_name', 'Unknown') for fund in company_data['fund_data'][:3]], ensure_ascii=False)}
""")
        
        # Disclosure data
        if company_data.get('disclosure_data'):
            disclosure = company_data['disclosure_data']
            summary_parts.append(f"""
Disclosure Information:
- Investment Scale: {disclosure.get('investment_scale', 0)/100000000:.1f} 억원
- Fund Count: {disclosure.get('fund_count', 0)}
- Location: {disclosure.get('location', 'Unknown')}
- Representative: {disclosure.get('representative', 'Unknown')}
""")
        
        # Professional staff details
        if company_data.get('professional_data'):
            prof_count = len(company_data['professional_data'])
            avg_experience = sum(p.get('work_experience', 0) for p in company_data['professional_data']) / prof_count if prof_count > 0 else 0
            summary_parts.append(f"""
Professional Staff Analysis:
- Number of Professional Staff: {prof_count}
- Average Work Experience: {avg_experience:.1f} years
- Position Types: {list(set(p.get('position_type', 'Unknown') for p in company_data['professional_data']))}
""")
        
        # Investment performance
        if company_data.get('statistical_data'):
            stats = company_data['statistical_data']
            summary_parts.append(f"""
Investment Performance:
- Investment Count: {stats.get('investment_count', 0)}
- Investment Amount: {stats.get('investment_amount', 0)/100000000:.1f} 억원
- Recovery Amount: {stats.get('recovery_amount', 0)/100000000:.1f} 억원
- Net Performance: {stats.get('net_performance', 0)/100000000:.1f} 억원
""")
        
        return "\n".join(summary_parts)
    
    def _extract_personnel_data(self, company_data: Dict) -> str:
        """Extract personnel-focused data"""
        personnel_parts = []
        
        if company_data.get('personnel_data'):
            personnel = company_data['personnel_data']
            total = personnel.get('total_personnel', 0)
            
            personnel_parts.append(f"""
Personnel Overview:
- Total Personnel: {total}
- Professional Staff: {personnel.get('professional_staff', 0)} ({personnel.get('professional_staff', 0)/total*100 if total > 0 else 0:.1f}%)
- Investment Review: {personnel.get('investment_review_staff', 0)} ({personnel.get('investment_review_staff', 0)/total*100 if total > 0 else 0:.1f}%)
- Management: {personnel.get('management_staff', 0)} ({personnel.get('management_staff', 0)/total*100 if total > 0 else 0:.1f}%)
""")
        
        if company_data.get('professional_data'):
            personnel_parts.append("Professional Staff Details:")
            for i, prof in enumerate(company_data['professional_data'][:5]):  # Show first 5
                personnel_parts.append(f"""
Staff {i+1}:
- Position: {prof.get('position_type', 'Unknown')}
- Work Experience: {prof.get('work_experience', 0)} years
- Specialized Experience: {prof.get('specialized_experience', 0)} years
- Performance Score: {prof.get('performance_score', 0)}
""")
        
        return "\n".join(personnel_parts)
    
    def _extract_financial_data(self, company_data: Dict) -> str:
        """Extract financial-focused data"""
        financial_parts = []
        
        if company_data.get('fund_data'):
            total_funds = len(company_data['fund_data'])
            total_commitment = sum(fund.get('commitment_amount', 0) for fund in company_data['fund_data'])
            
            financial_parts.append(f"""
Fund Portfolio Summary:
- Total Funds: {total_funds}
- Total Commitment: {total_commitment/100000000:.1f} 억원
- Average Fund Size: {total_commitment/total_funds/100000000:.1f} 억원
""")
            
            financial_parts.append("Individual Funds:")
            for fund in company_data['fund_data'][:5]:  # Show first 5
                financial_parts.append(f"""
- {fund.get('fund_name', 'Unknown')}: {fund.get('commitment_amount', 0)/100000000:.1f} 억원 ({fund.get('fund_type', 'Unknown')})
""")
        
        if company_data.get('statistical_data'):
            stats = company_data['statistical_data']
            investment_amount = stats.get('investment_amount', 0)
            recovery_amount = stats.get('recovery_amount', 0)
            roi = (recovery_amount / investment_amount * 100) if investment_amount > 0 else 0
            
            financial_parts.append(f"""
Investment Performance:
- Investment Count: {stats.get('investment_count', 0)}
- Total Invested: {investment_amount/100000000:.1f} 억원
- Total Recovered: {recovery_amount/100000000:.1f} 억원
- ROI: {roi:.1f}%
- Net Performance: {stats.get('net_performance', 0)/100000000:.1f} 억원
""")
        
        return "\n".join(financial_parts)
    
    def _prepare_sector_data(self, company_profiles: Dict, sector_filter: str = None) -> str:
        """Prepare aggregated sector data"""
        total_companies = len(company_profiles)
        
        # Aggregate statistics
        total_personnel = 0
        total_funds = 0
        total_investment_scale = 0
        total_professional_staff = 0
        
        companies_by_size = {'small': 0, 'medium': 0, 'large': 0}
        
        for profile in company_profiles.values():
            if profile.get('personnel_data'):
                personnel_count = profile['personnel_data'].get('total_personnel', 0)
                total_personnel += personnel_count
                
                # Categorize by size
                if personnel_count <= 10:
                    companies_by_size['small'] += 1
                elif personnel_count <= 30:
                    companies_by_size['medium'] += 1
                else:
                    companies_by_size['large'] += 1
            
            if profile.get('fund_data'):
                total_funds += len(profile['fund_data'])
            
            if profile.get('disclosure_data'):
                total_investment_scale += profile['disclosure_data'].get('investment_scale', 0)
            
            if profile.get('professional_data'):
                total_professional_staff += len(profile['professional_data'])
        
        sector_summary = f"""
Korean VC Ecosystem Overview:
- Total Companies: {total_companies:,}
- Total Personnel: {total_personnel:,}
- Total Funds: {total_funds:,}
- Total Investment Scale: {total_investment_scale/100000000:,.0f} 억원
- Total Professional Staff Records: {total_professional_staff:,}

Company Size Distribution:
- Small (≤10 people): {companies_by_size['small']} ({companies_by_size['small']/total_companies*100:.1f}%)
- Medium (11-30 people): {companies_by_size['medium']} ({companies_by_size['medium']/total_companies*100:.1f}%)
- Large (30+ people): {companies_by_size['large']} ({companies_by_size['large']/total_companies*100:.1f}%)

Average Metrics:
- Average Company Size: {total_personnel/total_companies:.1f} people
- Average Funds per Company: {total_funds/total_companies:.1f}
- Average Investment Scale: {total_investment_scale/total_companies/100000000:.1f} 억원
"""
        
        return sector_summary
    
    def _extract_all_professional_data(self, company_profiles: Dict) -> str:
        """Extract all professional staff data for matching"""
        professional_summary = []
        
        professional_summary.append("Professional Staff Database Summary:")
        
        for company_id, profile in company_profiles.items():
            if profile.get('professional_data'):
                professional_summary.append(f"\n{profile.get('company_name', 'Unknown')} ({company_id}):")
                
                for staff in profile['professional_data'][:3]:  # Limit for token management
                    professional_summary.append(f"""
- Position: {staff.get('position_type', 'Unknown')}
- Experience: {staff.get('work_experience', 0)} years total, {staff.get('specialized_experience', 0)} years specialized
- Performance Score: {staff.get('performance_score', 0)}
""")
        
        return "\n".join(professional_summary)
    
    def _prepare_full_dataset_summary(self, company_profiles: Dict) -> str:
        """Prepare comprehensive dataset summary"""
        return f"""
Complete DIVA Dataset Summary:
{self._prepare_sector_data(company_profiles)}

Sample Company Profiles (Top 5 by size):
{self._get_top_companies_summary(company_profiles, 5)}
"""
    
    def _prepare_focused_data(self, company_profiles: Dict, scope: str) -> str:
        """Prepare focused data based on scope"""
        if scope == 'personnel':
            return self._extract_all_professional_data(company_profiles)
        elif scope == 'funds':
            return self._extract_all_fund_data(company_profiles)
        else:
            return self._prepare_sector_data(company_profiles)
    
    def _extract_all_fund_data(self, company_profiles: Dict) -> str:
        """Extract all fund data"""
        fund_summary = []
        
        for company_id, profile in company_profiles.items():
            if profile.get('fund_data'):
                fund_summary.append(f"\n{profile.get('company_name', 'Unknown')} Funds:")
                for fund in profile['fund_data'][:3]:  # Limit for tokens
                    fund_summary.append(f"""
- {fund.get('fund_name', 'Unknown')}: {fund.get('commitment_amount', 0)/100000000:.1f} 억원
  Type: {fund.get('fund_type', 'Unknown')}
  Representative: {fund.get('representative', 'Unknown')}
""")
        
        return "\n".join(fund_summary)
    
    def _get_top_companies_summary(self, company_profiles: Dict, count: int) -> str:
        """Get summary of top companies by personnel size"""
        # Sort by personnel size
        sorted_companies = sorted(
            company_profiles.items(),
            key=lambda x: x[1].get('personnel_data', {}).get('total_personnel', 0),
            reverse=True
        )
        
        top_companies = []
        for company_id, profile in sorted_companies[:count]:
            summary = f"""
{profile.get('company_name', 'Unknown')} ({company_id}):
- Personnel: {profile.get('personnel_data', {}).get('total_personnel', 0)}
- Funds: {len(profile.get('fund_data', []))}
- Investment Scale: {profile.get('disclosure_data', {}).get('investment_scale', 0)/100000000:.1f} 억원
"""
            top_companies.append(summary)
        
        return "\n".join(top_companies)
    
    def save_analysis_report(self, analysis_result: str, filename: str = None):
        """Save analysis report to file"""
        if not filename:
            timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
            filename = f"diva_ai_analysis_{timestamp}.txt"
        
        with open(filename, 'w', encoding='utf-8') as f:
            f.write(f"DIVA AI Analysis Report\n")
            f.write(f"Generated: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}\n")
            f.write("=" * 50 + "\n\n")
            f.write(analysis_result)
        
        logger.info(f"Analysis report saved to {filename}")
        return filename

def main():
    """Demo function showing OpenAI integration capabilities"""
    # Configuration
    OPENAI_API_KEY = os.getenv('OPENAI_API_KEY', 'your_openai_api_key_here')
    
    if OPENAI_API_KEY == 'your_openai_api_key_here':
        logger.error("Please set your OPENAI_API_KEY environment variable")
        return
    
    try:
        logger.info("🤖 Starting OpenAI DIVA Integration Demo")
        
        # Initialize analyzer
        analyzer = OpenAIDIVAAnalyzer(OPENAI_API_KEY)
        
        # Load sample data (you would load your actual DIVA data here)
        sample_data = {
            "OP20190375": {
                "company_name": "경남벤처투자",
                "personnel_data": {
                    "total_personnel": 11,
                    "professional_staff": 6,
                    "investment_review_staff": 6,
                    "management_staff": 5
                },
                "fund_data": [
                    {
                        "fund_name": "경남창업벤처펀드",
                        "commitment_amount": 50000000000,
                        "fund_type": "창업투자"
                    }
                ],
                "disclosure_data": {
                    "investment_scale": 150000000000,
                    "fund_count": 3,
                    "location": "경남 창원시"
                }
            }
        }
        
        # Demo analyses
        print("🏢 Company Analysis:")
        company_analysis = analyzer.analyze_company_profile(
            "OP20190375", 
            sample_data["OP20190375"], 
            "comprehensive"
        )
        print(company_analysis[:500] + "...")
        
        print("\n📊 Sector Trends:")
        sector_analysis = analyzer.analyze_sector_trends(sample_data)
        print(sector_analysis[:500] + "...")
        
        print("\n🤔 Custom Query:")
        custom_analysis = analyzer.generate_custom_analysis(
            "What are the key characteristics of successful VC teams in Korea?",
            sample_data
        )
        print(custom_analysis[:500] + "...")
        
        # Save reports
        analyzer.save_analysis_report(company_analysis, "demo_company_analysis.txt")
        
        logger.info("✅ OpenAI integration demo completed!")
        
    except Exception as e:
        logger.error(f"Demo failed: {e}")
        raise

if __name__ == "__main__":
    main() 