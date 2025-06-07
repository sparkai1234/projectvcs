-- 🇰🇷 Korean Financial Intelligence Database Schema
-- Complete DIVA Financial Statements Structure
-- Supporting 재무상태표 (Balance Sheet) + 손익계산서 (Income Statement)

-- ================================================================
-- 재무상태표 (BALANCE SHEET) TABLE
-- ================================================================
CREATE TABLE IF NOT EXISTS diva_balance_sheet_raw (
    id BIGSERIAL PRIMARY KEY,
    
    -- Basic Company Information
    company_name TEXT NOT NULL,
    fiscal_year INTEGER NOT NULL,
    accounting_standard TEXT, -- K-IFRS, K-GAAP, etc.
    
    -- 자산 (ASSETS) - Korean Won amounts
    total_assets BIGINT, -- 총자산
    current_assets BIGINT, -- 유동자산
    non_current_assets BIGINT, -- 비유동자산
    
    -- 유동자산 세부항목 (Current Assets Details)
    cash_and_equivalents BIGINT, -- 현금및현금성자산
    short_term_investments BIGINT, -- 단기투자자산
    accounts_receivable BIGINT, -- 매출채권
    other_current_assets BIGINT, -- 기타유동자산
    
    -- 비유동자산 세부항목 (Non-Current Assets Details)
    venture_investment_assets BIGINT, -- 벤처투자자산 (핵심)
    startup_investment_assets BIGINT, -- 창업투자자산 (핵심)
    venture_investment_securities BIGINT, -- 벤처투자유가증권
    property_plant_equipment BIGINT, -- 유형자산
    intangible_assets BIGINT, -- 무형자산
    other_non_current_assets BIGINT, -- 기타비유동자산
    
    -- 부채 (LIABILITIES) - Korean Won amounts
    total_liabilities BIGINT, -- 총부채
    current_liabilities BIGINT, -- 유동부채
    non_current_liabilities BIGINT, -- 비유동부채
    
    -- 유동부채 세부항목 (Current Liabilities Details)
    accounts_payable BIGINT, -- 매입채무
    short_term_borrowings BIGINT, -- 단기차입금
    other_current_liabilities BIGINT, -- 기타유동부채
    
    -- 비유동부채 세부항목 (Non-Current Liabilities Details)
    long_term_borrowings BIGINT, -- 장기차입금
    bonds_payable BIGINT, -- 사채
    other_non_current_liabilities BIGINT, -- 기타비유동부채
    
    -- 자본 (EQUITY) - Korean Won amounts
    total_equity BIGINT, -- 총자본
    paid_in_capital BIGINT, -- 납입자본금
    capital_surplus BIGINT, -- 자본잉여금
    retained_earnings BIGINT, -- 이익잉여금
    other_comprehensive_income BIGINT, -- 기타포괄손익누계액
    treasury_stock BIGINT, -- 자기주식
    
    -- 벤처캐피탈 특화항목 (VC-Specific Items)
    fund_commitments BIGINT, -- 펀드약정액
    uncalled_commitments BIGINT, -- 미수입약정액
    carried_interest BIGINT, -- 성과보수
    management_fee_receivable BIGINT, -- 운용보수미수금
    
    -- 메타데이터 (Metadata)
    statement_type TEXT DEFAULT 'balance_sheet',
    statement_name TEXT DEFAULT '재무상태표',
    reporting_currency TEXT DEFAULT 'KRW',
    data_quality_score INTEGER DEFAULT 0,
    extracted_at TIMESTAMPTZ DEFAULT NOW(),
    source_url TEXT DEFAULT 'http://diva.kvca.or.kr/div/dii/DivItmFsInq',
    apify_source TEXT DEFAULT 'DIVA_SCRAPER_V2.0_ENHANCED_KOREAN_PROCESSING',
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW(),
    
    -- 제약조건 (Constraints)
    UNIQUE(company_name, fiscal_year, accounting_standard)
);

-- ================================================================
-- 손익계산서 (INCOME STATEMENT) TABLE  
-- ================================================================
CREATE TABLE IF NOT EXISTS diva_income_statement_raw (
    id BIGSERIAL PRIMARY KEY,
    
    -- Basic Company Information
    company_name TEXT NOT NULL,
    fiscal_year INTEGER NOT NULL,
    accounting_standard TEXT, -- K-IFRS, K-GAAP, etc.
    
    -- 수익 (REVENUE) - Korean Won amounts
    operating_revenue BIGINT, -- 영업수익 (총수익)
    investment_income BIGINT, -- 투자수익 (핵심)
    commission_income BIGINT, -- 수수료수익 (핵심)
    management_fee_income BIGINT, -- 운용보수수익 (핵심)
    performance_fee_income BIGINT, -- 성과보수수익 (핵심)
    interest_income BIGINT, -- 이자수익
    dividend_income BIGINT, -- 배당금수익
    other_operating_income BIGINT, -- 기타영업수익
    
    -- 벤처캐피탈 투자수익 세부항목 (VC Investment Income Details)
    realized_investment_gains BIGINT, -- 투자처분이익 (실현손익)
    unrealized_investment_gains BIGINT, -- 투자평가이익 (미실현손익)
    equity_method_income BIGINT, -- 지분법투자이익
    fair_value_gains BIGINT, -- 공정가치평가이익
    
    -- 비용 (EXPENSES) - Korean Won amounts  
    operating_expenses BIGINT, -- 영업비용 (총비용)
    personnel_expenses BIGINT, -- 인건비
    general_admin_expenses BIGINT, -- 일반관리비
    commission_expenses BIGINT, -- 수수료비용
    interest_expenses BIGINT, -- 이자비용
    depreciation_expenses BIGINT, -- 감가상각비
    other_operating_expenses BIGINT, -- 기타영업비용
    
    -- 벤처캐피탈 비용 세부항목 (VC-Specific Expenses)
    investment_management_fees BIGINT, -- 투자관리수수료
    fund_administration_fees BIGINT, -- 펀드관리비용
    due_diligence_expenses BIGINT, -- 실사비용
    legal_advisory_fees BIGINT, -- 법무자문비
    
    -- 손익 항목 (PROFIT/LOSS ITEMS) - Korean Won amounts
    gross_profit BIGINT, -- 총이익
    operating_profit BIGINT, -- 영업이익
    net_income_before_tax BIGINT, -- 세전순이익
    income_tax_expense BIGINT, -- 법인세비용
    net_income BIGINT, -- 당기순이익
    
    -- 기타 손익항목 (Other Income/Loss Items)
    extraordinary_gains BIGINT, -- 특별이익
    extraordinary_losses BIGINT, -- 특별손실
    foreign_exchange_gains BIGINT, -- 외환차익
    foreign_exchange_losses BIGINT, -- 외환차손
    
    -- 주당 정보 (Per Share Information)
    earnings_per_share DECIMAL(15,2), -- 주당순이익
    diluted_earnings_per_share DECIMAL(15,2), -- 희석주당순이익
    
    -- 메타데이터 (Metadata)
    statement_type TEXT DEFAULT 'income_statement',
    statement_name TEXT DEFAULT '손익계산서',
    reporting_currency TEXT DEFAULT 'KRW',
    data_quality_score INTEGER DEFAULT 0,
    extracted_at TIMESTAMPTZ DEFAULT NOW(),
    source_url TEXT DEFAULT 'http://diva.kvca.or.kr/div/dii/DivItmFsInq',
    apify_source TEXT DEFAULT 'DIVA_SCRAPER_V2.0_ENHANCED_KOREAN_PROCESSING',
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW(),
    
    -- 제약조건 (Constraints)
    UNIQUE(company_name, fiscal_year, accounting_standard)
);

-- ================================================================
-- 통합 재무제표 뷰 (COMBINED FINANCIAL STATEMENTS VIEW)
-- ================================================================
CREATE OR REPLACE VIEW diva_financial_statements_combined AS
SELECT 
    COALESCE(bs.company_name, is_table.company_name) as company_name,
    COALESCE(bs.fiscal_year, is_table.fiscal_year) as fiscal_year,
    COALESCE(bs.accounting_standard, is_table.accounting_standard) as accounting_standard,
    
    -- Balance Sheet Items
    bs.total_assets,
    bs.total_liabilities,
    bs.total_equity,
    bs.venture_investment_assets,
    bs.startup_investment_assets,
    bs.paid_in_capital,
    bs.retained_earnings,
    
    -- Income Statement Items
    is_table.operating_revenue,
    is_table.investment_income,
    is_table.commission_income,
    is_table.management_fee_income,
    is_table.operating_profit,
    is_table.net_income,
    is_table.realized_investment_gains,
    is_table.unrealized_investment_gains,
    
    -- Financial Ratios (Calculated)
    CASE 
        WHEN bs.total_assets > 0 THEN ROUND((is_table.net_income::DECIMAL / bs.total_assets) * 100, 2)
        ELSE NULL 
    END as roa_percent, -- 총자산수익률
    
    CASE 
        WHEN bs.total_equity > 0 THEN ROUND((is_table.net_income::DECIMAL / bs.total_equity) * 100, 2)
        ELSE NULL 
    END as roe_percent, -- 자기자본수익률
    
    CASE 
        WHEN bs.total_assets > 0 THEN ROUND((bs.total_liabilities::DECIMAL / bs.total_assets) * 100, 2)
        ELSE NULL 
    END as debt_ratio_percent, -- 부채비율
    
    -- Metadata
    GREATEST(bs.extracted_at, is_table.extracted_at) as last_updated,
    bs.created_at as balance_sheet_created,
    is_table.created_at as income_statement_created
    
FROM diva_balance_sheet_raw bs
FULL OUTER JOIN diva_income_statement_raw is_table 
    ON bs.company_name = is_table.company_name 
    AND bs.fiscal_year = is_table.fiscal_year
    AND bs.accounting_standard = is_table.accounting_standard;

-- ================================================================
-- 인덱스 (INDEXES) for Performance
-- ================================================================

-- Balance Sheet Indexes
CREATE INDEX IF NOT EXISTS idx_balance_sheet_company_year 
    ON diva_balance_sheet_raw(company_name, fiscal_year);
    
CREATE INDEX IF NOT EXISTS idx_balance_sheet_extracted_at 
    ON diva_balance_sheet_raw(extracted_at);
    
CREATE INDEX IF NOT EXISTS idx_balance_sheet_total_assets 
    ON diva_balance_sheet_raw(total_assets DESC) WHERE total_assets IS NOT NULL;

-- Income Statement Indexes  
CREATE INDEX IF NOT EXISTS idx_income_statement_company_year 
    ON diva_income_statement_raw(company_name, fiscal_year);
    
CREATE INDEX IF NOT EXISTS idx_income_statement_extracted_at 
    ON diva_income_statement_raw(extracted_at);
    
CREATE INDEX IF NOT EXISTS idx_income_statement_net_income 
    ON diva_income_statement_raw(net_income DESC) WHERE net_income IS NOT NULL;

-- ================================================================
-- RLS (Row Level Security) 정책
-- ================================================================

-- Enable RLS
ALTER TABLE diva_balance_sheet_raw ENABLE ROW LEVEL SECURITY;
ALTER TABLE diva_income_statement_raw ENABLE ROW LEVEL SECURITY;

-- Create policies for service role (for Apify scraper)
CREATE POLICY "Allow service role full access to balance sheet" 
    ON diva_balance_sheet_raw FOR ALL 
    TO service_role USING (true);

CREATE POLICY "Allow service role full access to income statement" 
    ON diva_income_statement_raw FOR ALL 
    TO service_role USING (true);

-- Create policies for authenticated users (read-only)
CREATE POLICY "Allow authenticated read access to balance sheet" 
    ON diva_balance_sheet_raw FOR SELECT 
    TO authenticated USING (true);

CREATE POLICY "Allow authenticated read access to income statement" 
    ON diva_income_statement_raw FOR SELECT 
    TO authenticated USING (true);

-- ================================================================
-- 테이블 코멘트 (Table Comments)
-- ================================================================

COMMENT ON TABLE diva_balance_sheet_raw IS 
'Korean Venture Capital Balance Sheets (재무상태표) from DIVA portal with K-IFRS compliance';

COMMENT ON TABLE diva_income_statement_raw IS 
'Korean Venture Capital Income Statements (손익계산서) from DIVA portal with VC-specific metrics';

COMMENT ON VIEW diva_financial_statements_combined IS 
'Combined view of Balance Sheet and Income Statement with calculated financial ratios';

-- ================================================================
-- 샘플 데이터 조회 쿼리 (Sample Queries)
-- ================================================================

-- Top Korean VCs by Total Assets
-- SELECT company_name, fiscal_year, total_assets, venture_investment_assets 
-- FROM diva_balance_sheet_raw 
-- WHERE total_assets IS NOT NULL 
-- ORDER BY total_assets DESC LIMIT 10;

-- Top Korean VCs by Investment Income
-- SELECT company_name, fiscal_year, investment_income, realized_investment_gains 
-- FROM diva_income_statement_raw 
-- WHERE investment_income IS NOT NULL 
-- ORDER BY investment_income DESC LIMIT 10;

-- Combined Financial Health Overview
-- SELECT company_name, fiscal_year, total_assets, net_income, roa_percent, roe_percent
-- FROM diva_financial_statements_combined 
-- WHERE total_assets > 0 AND net_income IS NOT NULL
-- ORDER BY total_assets DESC LIMIT 10; 