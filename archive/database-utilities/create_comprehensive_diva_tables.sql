-- ================================
-- COMPREHENSIVE DIVA RAW DATA TABLES
-- ================================
-- Expanding raw data architecture for complete DIVA coverage

-- ================================
-- 5. DIVA FINANCIAL RAW (재무제표)
-- ================================
-- Raw financial data from http://diva.kvca.or.kr/div/dii/DivItmFsInq
CREATE TABLE IF NOT EXISTS diva_financial_raw (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    
    -- Company identification
    company_id VARCHAR(50) NOT NULL,
    company_name VARCHAR(255) NOT NULL,
    
    -- Financial period info
    fiscal_year INTEGER,                      -- 결산연도
    fiscal_month INTEGER,                     -- 결산월
    accounting_standard VARCHAR(50),          -- 회계기준 (일반/IFRS)
    financial_type VARCHAR(50),               -- 재무구분 (개별/연결)
    source_type VARCHAR(50),                  -- 재원구분 (고유계정/조합)
    
    -- Balance Sheet Data (재무상태표)
    total_assets BIGINT,                      -- 자산
    startup_investment_assets BIGINT,         -- 창업투자자산
    total_liabilities BIGINT,                 -- 부채
    capital_stock BIGINT,                     -- 자본금/출자금
    total_equity BIGINT,                      -- 자본
    
    -- Income Statement Data (손익계산서)
    operating_revenue BIGINT,                 -- 영업수익
    operating_expenses BIGINT,                -- 영업비용
    operating_profit BIGINT,                  -- 영업이익
    profit_before_tax BIGINT,                 -- 법인세비용차감전순이익
    net_income BIGINT,                        -- 당기순이익
    
    -- Financial ratios (calculated)
    debt_to_equity_ratio DECIMAL(10,4),       -- 부채비율
    asset_utilization_ratio DECIMAL(10,4),    -- 자산활용률
    investment_asset_ratio DECIMAL(10,4),     -- 투자자산비율
    
    -- Scraping metadata
    extracted_at TIMESTAMP,
    source_url TEXT,
    data_quality_score DECIMAL(5,2),
    
    -- Standard timestamps
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW(),
    
    -- Link to VC table
    FOREIGN KEY (company_id) REFERENCES vc_table(company_id) ON DELETE SET NULL
);

-- ================================
-- 6. DIVA INVESTMENT PERFORMANCE RAW (투자실적)
-- ================================
-- Raw investment performance data from http://diva.kvca.or.kr/div/dii/DivItmInvstPrfmInq
CREATE TABLE IF NOT EXISTS diva_investment_performance_raw (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    
    -- Company identification
    company_id VARCHAR(50) NOT NULL,
    company_name VARCHAR(255) NOT NULL,
    
    -- Investment details
    investment_year INTEGER,                  -- 투자연도
    investment_quarter INTEGER,               -- 투자분기
    portfolio_company VARCHAR(255),           -- 피투자회사
    portfolio_company_id VARCHAR(100),        -- 피투자회사 ID
    
    -- Investment amounts
    investment_amount BIGINT,                 -- 투자금액
    investment_currency VARCHAR(10) DEFAULT 'KRW', -- 통화
    cumulative_investment BIGINT,             -- 누적투자금액
    
    -- Investment classification
    investment_stage VARCHAR(100),            -- 투자단계 (시드/시리즈A/B/C 등)
    investment_type VARCHAR(100),             -- 투자유형 (신규/후속 등)
    industry_sector VARCHAR(100),             -- 업종
    business_model VARCHAR(255),              -- 사업모델
    
    -- Investment status
    current_status VARCHAR(100),              -- 투자상태 (보유/회수/손실처리 등)
    valuation_amount BIGINT,                  -- 기업가치
    ownership_percentage DECIMAL(7,4),        -- 지분율
    
    -- Exit information
    exit_date DATE,                          -- 회수일자
    exit_amount BIGINT,                      -- 회수금액
    exit_method VARCHAR(100),                -- 회수방법 (IPO/M&A/바이백 등)
    exit_multiple DECIMAL(10,2),             -- 회수배수
    irr_percentage DECIMAL(7,4),             -- IRR
    
    -- Performance metrics
    holding_period_months INTEGER,            -- 보유기간(개월)
    investment_return_amount BIGINT,          -- 투자수익금액
    investment_return_rate DECIMAL(10,4),     -- 투자수익률
    
    -- Scraping metadata
    extracted_at TIMESTAMP,
    source_url TEXT,
    page_number INTEGER,
    
    -- Standard timestamps
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW(),
    
    -- Link to VC table
    FOREIGN KEY (company_id) REFERENCES vc_table(company_id) ON DELETE SET NULL
);

-- ================================
-- 7. DIVA VIOLATION RAW (법규위반현황)
-- ================================
-- Raw violation/compliance data from http://diva.kvca.or.kr/div/dii/DivItmViolInq
CREATE TABLE IF NOT EXISTS diva_violation_raw (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    
    -- Company identification
    company_id VARCHAR(50) NOT NULL,
    company_name VARCHAR(255) NOT NULL,
    
    -- Violation details
    violation_date DATE,                      -- 위반일자
    violation_type VARCHAR(255),              -- 위반유형
    violation_category VARCHAR(100),          -- 위반분류
    violation_details TEXT,                   -- 위반내용
    violation_severity VARCHAR(50),           -- 위반정도 (경미/보통/중대)
    
    -- Legal/regulatory info
    relevant_law VARCHAR(255),                -- 관련법규
    regulation_article VARCHAR(100),          -- 해당조항
    
    -- Penalties
    penalty_type VARCHAR(100),                -- 제재유형 (과태료/과징금/영업정지 등)
    penalty_amount BIGINT,                    -- 제재금액
    penalty_currency VARCHAR(10) DEFAULT 'KRW',
    
    -- Resolution
    resolution_date DATE,                     -- 처리일자
    resolution_status VARCHAR(100),           -- 처리상태 (완료/진행중/항소중 등)
    resolution_details TEXT,                  -- 처리내용
    
    -- Impact assessment
    business_impact VARCHAR(100),             -- 사업영향도
    reputational_impact VARCHAR(100),         -- 평판영향도
    
    -- Scraping metadata
    extracted_at TIMESTAMP,
    source_url TEXT,
    
    -- Standard timestamps
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW(),
    
    -- Link to VC table
    FOREIGN KEY (company_id) REFERENCES vc_table(company_id) ON DELETE SET NULL
);

-- ================================
-- 8. DIVA ASSOCIATION RAW (조합현황)
-- ================================
-- Raw association/fund data from http://diva.kvca.or.kr/div/dii/DivItmAssoInq
CREATE TABLE IF NOT EXISTS diva_association_raw (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    
    -- Company identification
    company_id VARCHAR(50) NOT NULL,
    company_name VARCHAR(255) NOT NULL,
    
    -- Fund/Association details
    fund_name VARCHAR(255),                   -- 조합명
    fund_id VARCHAR(100),                     -- 조합 ID
    fund_type VARCHAR(100),                   -- 조합유형
    
    -- Fund structure
    total_commitment BIGINT,                  -- 총 약정금액
    commitment_currency VARCHAR(10) DEFAULT 'KRW',
    called_amount BIGINT,                     -- 납입금액
    remaining_commitment BIGINT,              -- 잔여약정
    
    -- Timeline
    establishment_date DATE,                  -- 설립일
    commitment_period_end DATE,               -- 약정기간종료일
    fund_duration_years INTEGER,              -- 존속기간
    liquidation_date DATE,                    -- 청산예정일
    
    -- Status
    fund_status VARCHAR(100),                 -- 조합상태 (모집중/운용중/청산중/청산완료)
    investment_focus TEXT,                    -- 투자분야
    target_stage VARCHAR(100),                -- 투자단계
    geographic_focus VARCHAR(100),            -- 투자지역
    
    -- Performance (if available)
    total_invested_amount BIGINT,             -- 총 투자금액
    portfolio_companies_count INTEGER,        -- 포트폴리오 회사수
    avg_investment_amount BIGINT,             -- 평균 투자금액
    
    -- GP information
    gp_company_name VARCHAR(255),             -- GP회사명
    gp_management_fee_rate DECIMAL(5,4),      -- 운용보수율
    gp_carried_interest_rate DECIMAL(5,4),    -- 성과보수율
    
    -- Scraping metadata
    extracted_at TIMESTAMP,
    source_url TEXT,
    
    -- Standard timestamps
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW(),
    
    -- Link to VC table
    FOREIGN KEY (company_id) REFERENCES vc_table(company_id) ON DELETE SET NULL
);

-- ================================
-- CREATE INDEXES FOR PERFORMANCE
-- ================================

-- Financial Raw indexes
CREATE INDEX IF NOT EXISTS idx_diva_financial_raw_company_id ON diva_financial_raw(company_id);
CREATE INDEX IF NOT EXISTS idx_diva_financial_raw_fiscal_year ON diva_financial_raw(fiscal_year);
CREATE INDEX IF NOT EXISTS idx_diva_financial_raw_assets ON diva_financial_raw(total_assets);

-- Investment Performance indexes
CREATE INDEX IF NOT EXISTS idx_diva_investment_performance_company_id ON diva_investment_performance_raw(company_id);
CREATE INDEX IF NOT EXISTS idx_diva_investment_performance_year ON diva_investment_performance_raw(investment_year);
CREATE INDEX IF NOT EXISTS idx_diva_investment_performance_portfolio ON diva_investment_performance_raw(portfolio_company);
CREATE INDEX IF NOT EXISTS idx_diva_investment_performance_status ON diva_investment_performance_raw(current_status);

-- Violation Raw indexes
CREATE INDEX IF NOT EXISTS idx_diva_violation_raw_company_id ON diva_violation_raw(company_id);
CREATE INDEX IF NOT EXISTS idx_diva_violation_raw_date ON diva_violation_raw(violation_date);
CREATE INDEX IF NOT EXISTS idx_diva_violation_raw_type ON diva_violation_raw(violation_type);

-- Association Raw indexes
CREATE INDEX IF NOT EXISTS idx_diva_association_raw_company_id ON diva_association_raw(company_id);
CREATE INDEX IF NOT EXISTS idx_diva_association_raw_fund_name ON diva_association_raw(fund_name);
CREATE INDEX IF NOT EXISTS idx_diva_association_raw_status ON diva_association_raw(fund_status);

-- ================================
-- ADD UNIQUE CONSTRAINTS
-- ================================

-- Prevent duplicate financial records
ALTER TABLE diva_financial_raw 
ADD CONSTRAINT unique_diva_financial_company_year 
UNIQUE (company_id, fiscal_year, fiscal_month, source_type);

-- Prevent duplicate investment records
ALTER TABLE diva_investment_performance_raw 
ADD CONSTRAINT unique_diva_investment_company_portfolio_year 
UNIQUE (company_id, portfolio_company, investment_year);

-- Prevent duplicate violation records
ALTER TABLE diva_violation_raw 
ADD CONSTRAINT unique_diva_violation_company_date_type 
UNIQUE (company_id, violation_date, violation_type);

-- Prevent duplicate association records
ALTER TABLE diva_association_raw 
ADD CONSTRAINT unique_diva_association_company_fund 
UNIQUE (company_id, fund_name);

-- ================================
-- ADD COMMENTS FOR DOCUMENTATION
-- ================================

COMMENT ON TABLE diva_financial_raw IS 'Raw financial data from DIVA (balance sheet, income statement)';
COMMENT ON TABLE diva_investment_performance_raw IS 'Raw investment performance data from DIVA (portfolio investments, returns)';
COMMENT ON TABLE diva_violation_raw IS 'Raw violation/compliance data from DIVA (regulatory issues, penalties)';
COMMENT ON TABLE diva_association_raw IS 'Raw association/fund data from DIVA (fund structure, performance)'; 