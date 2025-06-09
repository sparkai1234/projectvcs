-- =================================================================
-- DIVA SCRAPER v5.3.30 - REAL DIVA FIELD SUPABASE SCHEMA
-- =================================================================
-- 
-- SQL schema for Supabase tables matching ACTUAL DIVA website fields
-- Based on real Korean headers from DIVA website: 회사명, 순위, 총인원, etc.
-- Run these CREATE TABLE statements in Supabase SQL Editor
--
-- =================================================================

-- 1. INVESTMENT PERFORMANCE TABLE (투자성과)
-- Real fields: 회사명, 고유재정 업체수/금액, 조합 업체수/금액, 합계 업체수/금액
DROP TABLE IF EXISTS diva_investment_performance CASCADE;
CREATE TABLE diva_investment_performance (
    id BIGSERIAL PRIMARY KEY,
    company_name TEXT NOT NULL,                    -- 회사명
    govt_finance_companies INTEGER,                -- 고유재정 업체수
    govt_finance_amount BIGINT,                    -- 고유재정 금액(원)
    fund_companies INTEGER,                        -- 조합 업체수  
    fund_amount BIGINT,                           -- 조합 금액(원)
    total_companies INTEGER,                       -- 합계 업체수
    total_amount BIGINT,                          -- 합계 금액(원)
    source_url TEXT,
    extracted_at TIMESTAMPTZ DEFAULT NOW(),
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- 2. VIOLATIONS TABLE (위반사항)
-- Real fields: 번호, 회사명, 조치일, 조치예정일, 시정완료일, 점검구분, 위반유형, 조치구분
DROP TABLE IF EXISTS diva_violations CASCADE;
CREATE TABLE diva_violations (
    id BIGSERIAL PRIMARY KEY,
    violation_number INTEGER,                      -- 번호
    company_name TEXT NOT NULL,                    -- 회사명
    action_date DATE,                             -- 조치일
    expected_action_date DATE,                    -- 조치예정일
    correction_completion_date DATE,              -- 시정완료일
    inspection_category TEXT,                     -- 점검구분
    violation_type TEXT,                          -- 위반유형
    action_category TEXT,                         -- 조치구분
    source_url TEXT,
    extracted_at TIMESTAMPTZ DEFAULT NOW(),
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- 3. VC MAP TABLE (벤처캐피탈 현황)
-- Real fields: 순위, 회사명, 인원총수, 전문인력수
DROP TABLE IF EXISTS diva_vc_map CASCADE;
CREATE TABLE diva_vc_map (
    id BIGSERIAL PRIMARY KEY,
    ranking INTEGER,                              -- 순위
    company_name TEXT NOT NULL,                   -- 회사명
    total_employees INTEGER,                      -- 인원총수
    professional_employees INTEGER,               -- 전문인력수
    source_url TEXT,
    extracted_at TIMESTAMPTZ DEFAULT NOW(),
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- 4. FINANCIAL STATEMENTS TABLE (재무현황) 
-- Real fields: 회사명, 재원, 결산월, 회계기준, 재무구분, + tab-specific fields
DROP TABLE IF EXISTS diva_financial_statements CASCADE;
CREATE TABLE diva_financial_statements (
    id BIGSERIAL PRIMARY KEY,
    company_name TEXT NOT NULL,                   -- 회사명
    financial_resources TEXT,                     -- 재원
    settlement_month TEXT,                        -- 결산월
    accounting_standards TEXT,                    -- 회계기준
    financial_classification TEXT,                -- 재무구분
    
    -- Financial Status Tab (재무상태표) fields
    assets BIGINT,                               -- 자산
    startup_investment_assets BIGINT,            -- 창업투자자산
    liabilities BIGINT,                          -- 부채
    paid_in_capital BIGINT,                      -- 자본금
    capital BIGINT,                              -- 자본
    
    -- Income Statement Tab (손익계산서) fields  
    operating_revenue BIGINT,                    -- 영업수익
    operating_expenses BIGINT,                   -- 영업비용
    operating_profit BIGINT,                     -- 영업이익
    net_income_before_taxes BIGINT,              -- 법인세비용차감전이익
    net_profit BIGINT,                           -- 당기순이익
    
    details TEXT,                                -- 상세
    tab_type TEXT,                               -- 'balance_sheet' or 'income_statement'
    source_url TEXT,
    extracted_at TIMESTAMPTZ DEFAULT NOW(),
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- 5. ASSOCIATION STATUS TABLE (조합현황)
-- Real fields: 번호, 회사명, 조합명, 등록일, 결성총액(원), 만기일, 투자분야, 목적구분, 지원구분
DROP TABLE IF EXISTS diva_association_status CASCADE;
CREATE TABLE diva_association_status (
    id BIGSERIAL PRIMARY KEY,
    fund_number INTEGER,                          -- 번호
    company_name TEXT NOT NULL,                   -- 회사명
    fund_name TEXT,                              -- 조합명
    registration_date DATE,                       -- 등록일
    total_amount_krw BIGINT,                     -- 결성총액(원)
    expiry_date DATE,                            -- 만기일
    investment_fields TEXT,                       -- 투자분야
    purpose_classification TEXT,                  -- 목적구분
    support_category TEXT,                        -- 지원구분
    source_url TEXT,
    extracted_at TIMESTAMPTZ DEFAULT NOW(),
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- 6. PERSONNEL STATUS TABLE (인력현황)
-- Real fields: 회사명, 총인원, 전문인력, 투자심사, 경영관리
DROP TABLE IF EXISTS diva_personnel_status CASCADE;
CREATE TABLE diva_personnel_status (
    id BIGSERIAL PRIMARY KEY,
    company_name TEXT NOT NULL,                   -- 회사명
    total_employees INTEGER,                      -- 총인원
    professionals INTEGER,                        -- 전문인력
    investment_officers INTEGER,                  -- 투자심사
    business_support INTEGER,                     -- 경영관리
    source_url TEXT,
    extracted_at TIMESTAMPTZ DEFAULT NOW(),
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- 7. PROFESSIONAL PERSONNEL TABLE (전문인력)
-- Real fields: 회사명, 성명, 경력, 전문경력, 벤처투자경력, 벤처투자전문경력
DROP TABLE IF EXISTS diva_professional_personnel CASCADE;
CREATE TABLE diva_professional_personnel (
    id BIGSERIAL PRIMARY KEY,
    company_name TEXT NOT NULL,                   -- 회사명
    person_name TEXT,                            -- 성명
    work_experience TEXT,                        -- 경력
    professional_experience TEXT,                -- 전문경력
    vc_work_experience TEXT,                     -- 벤처투자경력
    vc_professional_experience TEXT,             -- 벤처투자전문경력
    source_url TEXT,
    extracted_at TIMESTAMPTZ DEFAULT NOW(),
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- =================================================================
-- INDEXES FOR PERFORMANCE
-- =================================================================

-- Primary indexes on company names for fast lookups
CREATE INDEX idx_investment_performance_company ON diva_investment_performance(company_name);
CREATE INDEX idx_violations_company ON diva_violations(company_name);
CREATE INDEX idx_vc_map_company ON diva_vc_map(company_name);
CREATE INDEX idx_financial_statements_company ON diva_financial_statements(company_name);
CREATE INDEX idx_association_status_company ON diva_association_status(company_name);
CREATE INDEX idx_personnel_status_company ON diva_personnel_status(company_name);
CREATE INDEX idx_professional_personnel_company ON diva_professional_personnel(company_name);

-- Ranking and date indexes
CREATE INDEX idx_vc_map_ranking ON diva_vc_map(ranking);
CREATE INDEX idx_violations_action_date ON diva_violations(action_date);
CREATE INDEX idx_association_registration_date ON diva_association_status(registration_date);
CREATE INDEX idx_all_extracted_at ON diva_investment_performance(extracted_at);

-- =================================================================
-- ROW LEVEL SECURITY (OPTIONAL)
-- =================================================================

-- Enable RLS if needed
-- ALTER TABLE diva_investment_performance ENABLE ROW LEVEL SECURITY;
-- ALTER TABLE diva_violations ENABLE ROW LEVEL SECURITY;
-- ALTER TABLE diva_vc_map ENABLE ROW LEVEL SECURITY;
-- ALTER TABLE diva_financial_statements ENABLE ROW LEVEL SECURITY;
-- ALTER TABLE diva_association_status ENABLE ROW LEVEL SECURITY;
-- ALTER TABLE diva_personnel_status ENABLE ROW LEVEL SECURITY;
-- ALTER TABLE diva_professional_personnel ENABLE ROW LEVEL SECURITY;

-- =================================================================
-- SUCCESS! 
-- These tables now match the REAL DIVA website field structures
-- Run in Supabase SQL Editor to create all 7 tables
-- ================================================================= 