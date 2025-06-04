# 🇰🇷 DIVA 한국어 AI 분석 시스템 사용 가이드

## 📋 개요
DIVA 시스템은 이제 **한국어를 기본 언어**로 하는 AI 분석 기능을 제공합니다. 영어로도 전환 가능합니다.

## 🚀 기본 사용법

### 1. 한국어 분석기 초기화
```python
from openai_diva_integration import OpenAIDIVAAnalyzer
from api_config import get_config

config = get_config()

# 한국어 기본 설정 (기본값)
analyzer = OpenAIDIVAAnalyzer(
    api_key=config['openai_api_key'], 
    default_language='korean'  # 기본값
)

# 영어 설정
analyzer_en = OpenAIDIVAAnalyzer(
    api_key=config['openai_api_key'], 
    default_language='english'
)
```

### 2. 언어 전환
```python
# 한국어로 전환
analyzer.set_language('korean')

# 영어로 전환  
analyzer.set_language('english')
```

## 📊 주요 분석 기능

### 1. 회사 종합 분석 (한국어)
```python
company_data = {
    'company_name': '코리아벤처파트너스',
    'fund_size': '1,000억원',
    'personnel_count': 25,
    'investment_focus': 'ICT, 바이오테크, 핀테크',
    'established': '2018년'
}

# 종합 분석 (한국어)
result = analyzer.analyze_company_profile(
    company_id='KVP001',
    company_data=company_data,
    analysis_type='comprehensive'
)
print(result)  # 한국어로 결과 출력
```

**출력 예시:**
```
회사 개요 및 시장 내 위치:
코리아벤처파트너스는 1,000억원 규모의 중견 벤처캐피탈로서...

인력 및 팀 분석:
25명의 전문 인력을 보유하고 있어 펀드 규모 대비 효율적인...

투자 성과 분석:
ICT, 바이오테크, 핀테크 분야의 전문성을 바탕으로...
```

### 2. 인력 분석 (한국어)
```python
# 인력 중심 분석
personnel_analysis = analyzer.analyze_company_profile(
    company_id='KVP001',
    company_data=company_data,
    analysis_type='personnel_focus'
)
```

### 3. 투자 성과 분석 (한국어)
```python
# 투자 성과 중심 분석
investment_analysis = analyzer.analyze_company_profile(
    company_id='KVP001',
    company_data=company_data,
    analysis_type='investment_focus'
)
```

### 4. 시장 트렌드 분석 (한국어)
```python
# 여러 회사 데이터로 시장 분석
market_data = {
    'company_1': {...},
    'company_2': {...},
    'company_3': {...}
}

market_trends = analyzer.analyze_sector_trends(
    company_profiles=market_data
)
print(market_trends)  # 한국 VC 시장 트렌드 분석 (한국어)
```

## 🔄 영어 분석

### 영어로 전환 후 분석
```python
# 영어 모드로 전환
analyzer.set_language('english')

# 동일한 데이터, 영어 분석
english_result = analyzer.analyze_company_profile(
    company_id='KVP001',
    company_data=company_data,
    analysis_type='comprehensive'
)
print(english_result)  # 영어로 결과 출력
```

## 🎯 실제 데이터 분석

### 4,448+ VC/펀드 데이터 분석
```python
# 실제 DIVA 데이터 로드
diva_data = analyzer.load_diva_data('diva_integration_report_20250603_181600.json')

# 전체 시장 분석 (한국어)
full_market_analysis = analyzer.analyze_sector_trends(diva_data)

# 상위 20개 회사 비교 분석
top_companies = ['company_1', 'company_2', ..., 'company_20']
comparison = analyzer.compare_companies(top_companies, diva_data)
```

## 📈 전문 기능

### 1. 전문가 매칭 (한국어)
```python
target_criteria = {
    'experience_level': '5년 이상',
    'specialization': '핀테크, AI', 
    'role': '투자심사역',
    'location': '서울'
}

matches = analyzer.find_professional_matches(
    target_criteria=target_criteria,
    company_profiles=diva_data
)
print(matches)  # 한국어 네트워킹 추천
```

### 2. 맞춤형 분석 (한국어)
```python
custom_query = "한국 핀테크 투자 트렌드와 주요 플레이어 분석"
custom_analysis = analyzer.generate_custom_analysis(
    query=custom_query,
    company_profiles=diva_data,
    scope='full'
)
```

## 💾 결과 저장

### 한국어 분석 결과 저장
```python
# 분석 결과 자동 저장
analyzer.save_analysis_report(
    analysis_result=result,
    filename='korean_vc_analysis_20250603.txt'
)
```

## ⚙️ 시스템 설정

### 기본 언어 설정
- **기본값**: 한국어 (`korean`)
- **옵션**: 영어 (`english`)
- **전환**: 언제든지 `set_language()` 메서드로 변경 가능

### 지원 분석 유형
1. **comprehensive** - 종합 분석
2. **personnel_focus** - 인력 중심 분석  
3. **investment_focus** - 투자 성과 중심 분석

### AI 모델
- **기본 모델**: GPT-4 Turbo
- **토큰 한도**: 2,000-3,000 토큰
- **언어 최적화**: 한국어/영어 각각 최적화된 프롬프트

## 🔧 테스트 실행

### 전체 한국어 기능 테스트
```bash
python test_korean_openai.py
```

### 기본 OpenAI 연결 테스트
```bash
python test_openai_integration.py
```

## 📊 시스템 현황
- ✅ **OpenAI API**: 작동 중
- ✅ **한국어 분석**: 완전 지원
- ✅ **영어 분석**: 완전 지원
- ✅ **언어 전환**: 실시간 가능
- ✅ **4,448+ 데이터**: 분석 준비 완료

## 🎉 준비 완료!
DIVA AI 시스템이 한국어 우선으로 고급 VC 분석을 제공할 준비가 되었습니다!

---
*Created: 2025-06-03 | Language: Korean (Default) + English* 