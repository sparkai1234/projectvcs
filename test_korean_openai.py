#!/usr/bin/env python3
"""
한국어 OpenAI 통합 테스트
DIVA 시스템용 한국어 AI 분석 기능 테스트
"""

import json
import os
from datetime import datetime
from api_config import get_config, set_environment_variables
from openai_diva_integration import OpenAIDIVAAnalyzer

def test_korean_language():
    """한국어 기본 AI 기능 테스트"""
    print("🇰🇷 한국어 OpenAI 통합 테스트")
    print("=" * 50)
    
    # 환경 변수 설정
    set_environment_variables()
    config = get_config()
    
    try:
        print("📊 한국어 DIVA AI 분석기 초기화 중...")
        # 한국어를 기본 언어로 설정
        analyzer = OpenAIDIVAAnalyzer(
            api_key=config['openai_api_key'], 
            default_language='korean'
        )
        print("✅ 한국어 DIVA AI 분석기 초기화 완료")
        
        # 샘플 한국 VC 회사 데이터
        print("\n🏢 샘플 한국 VC 회사 분석 테스트...")
        sample_company_data = {
            'company_name': '코리아벤처파트너스',
            'company_id': 'KVP001',
            'fund_size': '1,000억원',
            'personnel_count': 25,
            'investment_focus': 'ICT, 바이오테크, 핀테크',
            'established': '2018년',
            'location': '서울시 강남구',
            'major_investments': ['쿠팡', '야놀자', '당근마켓'],
            'fund_performance': '연평균 수익률 15%',
            'specialization': 'Series A, B 투자 전문'
        }
        
        # 종합 분석 테스트 (한국어)
        analysis_result = analyzer.analyze_company_profile(
            company_id='KVP001',
            company_data=sample_company_data,
            analysis_type='comprehensive'
        )
        
        print("✅ 한국어 종합 분석 완료:")
        print(f"📋 분석 결과 미리보기:\n{analysis_result[:400]}...\n")
        
        return True, analysis_result
        
    except Exception as e:
        print(f"❌ 한국어 테스트 실패: {e}")
        return False, None

def test_language_switching():
    """언어 전환 기능 테스트"""
    print("\n🔄 언어 전환 기능 테스트")
    print("=" * 50)
    
    config = get_config()
    
    try:
        # 한국어로 시작
        analyzer = OpenAIDIVAAnalyzer(
            api_key=config['openai_api_key'], 
            default_language='korean'
        )
        
        sample_data = {
            'company_name': '테스트VC',
            'fund_size': '500억원',
            'personnel_count': 15
        }
        
        print("🇰🇷 한국어 모드 테스트...")
        korean_result = analyzer.analyze_company_profile(
            company_id='TEST001',
            company_data=sample_data,
            analysis_type='personnel_focus'
        )
        print(f"✅ 한국어 결과: {korean_result[:200]}...")
        
        # 영어로 전환
        print("\n🇺🇸 영어 모드로 전환...")
        analyzer.set_language('english')
        
        english_result = analyzer.analyze_company_profile(
            company_id='TEST001',
            company_data=sample_data,
            analysis_type='personnel_focus'
        )
        print(f"✅ 영어 결과: {english_result[:200]}...")
        
        return True
        
    except Exception as e:
        print(f"❌ 언어 전환 테스트 실패: {e}")
        return False

def test_market_analysis_korean():
    """한국어 시장 분석 테스트"""
    print("\n📊 한국어 시장 분석 테스트")
    print("=" * 50)
    
    config = get_config()
    
    try:
        analyzer = OpenAIDIVAAnalyzer(
            api_key=config['openai_api_key'], 
            default_language='korean'
        )
        
        # 가상의 한국 VC 생태계 데이터
        mock_market_data = {
            'company_1': {
                'company_name': '한국투자파트너스',
                'fund_size': '2,000억원',
                'personnel_count': 35,
                'focus_sectors': ['AI', '바이오', '핀테크']
            },
            'company_2': {
                'company_name': '서울벤처캐피탈',
                'fund_size': '1,500억원', 
                'personnel_count': 28,
                'focus_sectors': ['게임', 'e커머스', '모빌리티']
            },
            'company_3': {
                'company_name': '코리아그로스파트너스',
                'fund_size': '800억원',
                'personnel_count': 18,
                'focus_sectors': ['SaaS', '엔터테인먼트', '헬스케어']
            }
        }
        
        print("🎯 한국 VC 시장 트렌드 분석 중...")
        market_analysis = analyzer.analyze_sector_trends(
            company_profiles=mock_market_data
        )
        
        print("✅ 한국어 시장 분석 완료:")
        print(f"📈 시장 분석 결과:\n{market_analysis[:500]}...")
        
        return True
        
    except Exception as e:
        print(f"❌ 시장 분석 테스트 실패: {e}")
        return False

def main():
    """전체 한국어 OpenAI 통합 테스트 실행"""
    print("🚀 DIVA 한국어 OpenAI 통합 테스트 스위트")
    print("🕐 " + datetime.now().strftime("%Y년 %m월 %d일 %H:%M:%S"))
    print("=" * 60)
    
    passed_tests = 0
    total_tests = 3
    
    # 테스트 1: 한국어 기본 기능
    korean_success, korean_result = test_korean_language()
    if korean_success:
        passed_tests += 1
    
    # 테스트 2: 언어 전환
    if test_language_switching():
        passed_tests += 1
    
    # 테스트 3: 한국어 시장 분석
    if test_market_analysis_korean():
        passed_tests += 1
    
    # 결과 요약
    print("\n" + "=" * 60)
    print("📊 테스트 결과 요약")
    print(f"✅ 통과한 테스트: {passed_tests}/{total_tests}")
    print(f"📈 성공률: {(passed_tests/total_tests)*100:.1f}%")
    
    if passed_tests == total_tests:
        print("🎉 모든 테스트 통과!")
        print("💡 한국어 OpenAI 통합이 사용 준비 완료되었습니다")
        print("\n🔧 사용 가능한 기능:")
        print("• 한국어 기본 분석 (기본 설정)")
        print("• 영어 분석 (언어 전환 가능)")
        print("• 4,448+ VC/펀드 데이터 한국어 분석")
        print("• 한국 VC 시장 인텔리전스 리포트")
        print("• 전문가 네트워킹 분석")
        print("• 회사별 상세 비교 분석")
    else:
        print("⚠️  일부 테스트가 실패했습니다 - 위의 오류 메시지를 확인하세요")
        
    print("\n🎯 DIVA AI 시스템이 한국어 고급 분석 준비 완료!")
    
    # 한국어 분석 결과 저장
    if korean_success and korean_result:
        timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
        filename = f"korean_analysis_test_{timestamp}.txt"
        with open(filename, 'w', encoding='utf-8') as f:
            f.write("=" * 60 + "\n")
            f.write("DIVA 한국어 AI 분석 테스트 결과\n")
            f.write("=" * 60 + "\n\n")
            f.write(korean_result)
        print(f"💾 한국어 분석 결과가 저장되었습니다: {filename}")

if __name__ == "__main__":
    main() 