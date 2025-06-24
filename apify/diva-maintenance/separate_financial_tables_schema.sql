-- =====================================================
-- DIVA FINANCIAL STATEMENTS: SEPARATE TABLES SCHEMA
-- =====================================================
-- Fixing the critical financial data corruption issue
-- by creating properly structured separate tables

-- =====================================================
-- 1. DIVA BALANCE SHEETS TABLE (재무상태표)
-- =====================================================
CREATE TABLE IF NOT EXISTS diva_balance_sheets (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    
    -- Company Information
    company_name VARCHAR(255) NOT NULL,
    company_id VARCHAR(100),
    
    -- Financial Period & Standards
    data_year INTEGER DEFAULT EXTRACT(YEAR FROM CURRENT_DATE),
    financial_resources VARCHAR(100),        -- 재원 (고유계정/조합)
    settlement_month VARCHAR(50),            -- 결산월
    accounting_standards VARCHAR(100),       -- 회계기준 (일반/IFRS)
    financial_classification VARCHAR(100),   -- 재무구분 (개별/연결)
    
    -- BALANCE SHEET SPECIFIC FIELDS
    total_assets BIGINT,                     -- 자산 (column_5)
    startup_investment_assets BIGINT,        -- 창업투자자산 (column_6) 
    total_liabilities BIGINT,                -- 부채 (column_7)
    paid_in_capital BIGINT,                  -- 자본금/출자금 (column_8)
    total_equity BIGINT,                     -- 자본 (column_9)
    
    -- Calculated Ratios
    debt_to_equity_ratio DECIMAL(10,4),      -- 부채비율
    asset_investment_ratio DECIMAL(10,4),    -- 투자자산비율
    
    -- Metadata
    source_url VARCHAR(500),
    extracted_at TIMESTAMP WITH TIME ZONE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- =====================================================
-- 2. DIVA INCOME STATEMENTS TABLE (손익계산서)
-- =====================================================
CREATE TABLE IF NOT EXISTS diva_income_statements (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    
    -- Company Information
    company_name VARCHAR(255) NOT NULL,
    company_id VARCHAR(100),
    
    -- Financial Period & Standards  
    data_year INTEGER DEFAULT EXTRACT(YEAR FROM CURRENT_DATE),
    financial_resources VARCHAR(100),        -- 재원 (고유계정/조합)
    settlement_month VARCHAR(50),            -- 결산월
    accounting_standards VARCHAR(100),       -- 회계기준 (일반/IFRS)
    financial_classification VARCHAR(100),   -- 재무구분 (개별/연결)
    
    -- INCOME STATEMENT SPECIFIC FIELDS
    operating_revenue BIGINT,                -- 영업수익 (column_5)
    operating_expenses BIGINT,               -- 영업비용 (column_6)
    operating_profit BIGINT,                 -- 영업이익 (column_7)
    net_income_before_taxes BIGINT,          -- 법인세비용차감전이익 (column_8)
    net_profit BIGINT,                       -- 당기순이익 (column_9)
    
    -- Calculated Ratios
    operating_margin DECIMAL(10,4),          -- 영업이익률
    net_profit_margin DECIMAL(10,4),         -- 순이익률
    expense_ratio DECIMAL(10,4),             -- 비용비율
    
    -- Metadata
    source_url VARCHAR(500),
    extracted_at TIMESTAMP WITH TIME ZONE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- =====================================================
-- 3. INDEXES FOR PERFORMANCE
-- =====================================================

-- Balance Sheets Indexes
CREATE INDEX IF NOT EXISTS idx_balance_sheets_company_name ON diva_balance_sheets(company_name);
CREATE INDEX IF NOT EXISTS idx_balance_sheets_data_year ON diva_balance_sheets(data_year);
CREATE INDEX IF NOT EXISTS idx_balance_sheets_created_at ON diva_balance_sheets(created_at);
CREATE INDEX IF NOT EXISTS idx_balance_sheets_total_assets ON diva_balance_sheets(total_assets) WHERE total_assets IS NOT NULL;

-- Income Statements Indexes
CREATE INDEX IF NOT EXISTS idx_income_statements_company_name ON diva_income_statements(company_name);
CREATE INDEX IF NOT EXISTS idx_income_statements_data_year ON diva_income_statements(data_year);
CREATE INDEX IF NOT EXISTS idx_income_statements_created_at ON diva_income_statements(created_at);
CREATE INDEX IF NOT EXISTS idx_income_statements_operating_revenue ON diva_income_statements(operating_revenue) WHERE operating_revenue IS NOT NULL;

-- =====================================================
-- 4. TRIGGERS FOR UPDATED_AT
-- =====================================================

-- Balance Sheets trigger
CREATE OR REPLACE FUNCTION update_balance_sheets_updated_at()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ language 'plpgsql';

CREATE TRIGGER update_balance_sheets_updated_at
    BEFORE UPDATE ON diva_balance_sheets
    FOR EACH ROW
    EXECUTE FUNCTION update_balance_sheets_updated_at();

-- Income Statements trigger  
CREATE OR REPLACE FUNCTION update_income_statements_updated_at()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ language 'plpgsql';

CREATE TRIGGER update_income_statements_updated_at
    BEFORE UPDATE ON diva_income_statements
    FOR EACH ROW
    EXECUTE FUNCTION update_income_statements_updated_at();

-- =====================================================
-- 5. VIEWS FOR COMPATIBILITY & ANALYSIS
-- =====================================================

-- Combined financial view (for backward compatibility)
CREATE OR REPLACE VIEW diva_financial_statements_combined AS
SELECT 
    'balance_sheet' as statement_type,
    id,
    company_name,
    company_id,
    data_year,
    financial_resources,
    settlement_month,
    accounting_standards,
    financial_classification,
    total_assets as assets,
    startup_investment_assets,
    total_liabilities as liabilities,
    paid_in_capital,
    total_equity as equity,
    NULL::BIGINT as operating_revenue,
    NULL::BIGINT as operating_expenses,
    NULL::BIGINT as operating_profit,
    NULL::BIGINT as net_income_before_taxes,
    NULL::BIGINT as net_profit,
    source_url,
    extracted_at,
    created_at,
    updated_at
FROM diva_balance_sheets

UNION ALL

SELECT 
    'income_statement' as statement_type,
    id,
    company_name,
    company_id,
    data_year,
    financial_resources,
    settlement_month,
    accounting_standards,
    financial_classification,
    NULL::BIGINT as assets,
    NULL::BIGINT as startup_investment_assets,
    NULL::BIGINT as liabilities,
    NULL::BIGINT as paid_in_capital,
    NULL::BIGINT as equity,
    operating_revenue,
    operating_expenses,
    operating_profit,
    net_income_before_taxes,
    net_profit,
    source_url,
    extracted_at,
    created_at,
    updated_at
FROM diva_income_statements;

-- Financial health analysis view
CREATE OR REPLACE VIEW diva_financial_health_analysis AS
SELECT 
    COALESCE(bs.company_name, is_.company_name) as company_name,
    COALESCE(bs.data_year, is_.data_year) as data_year,
    
    -- Balance Sheet Metrics
    bs.total_assets,
    bs.total_liabilities,
    bs.total_equity,
    bs.debt_to_equity_ratio,
    
    -- Income Statement Metrics
    is_.operating_revenue,
    is_.operating_profit,
    is_.net_profit,
    is_.operating_margin,
    is_.net_profit_margin,
    
    -- Combined Analysis
    CASE 
        WHEN bs.total_assets > 0 AND is_.operating_revenue > 0 
        THEN ROUND((is_.operating_revenue::DECIMAL / bs.total_assets) * 100, 2)
        ELSE NULL 
    END as asset_turnover_ratio,
    
    CASE 
        WHEN bs.total_equity > 0 AND is_.net_profit > 0 
        THEN ROUND((is_.net_profit::DECIMAL / bs.total_equity) * 100, 2)
        ELSE NULL 
    END as return_on_equity,
    
    -- Data Completeness
    CASE 
        WHEN bs.id IS NOT NULL AND is_.id IS NOT NULL THEN 'COMPLETE'
        WHEN bs.id IS NOT NULL THEN 'BALANCE_ONLY'
        WHEN is_.id IS NOT NULL THEN 'INCOME_ONLY'
        ELSE 'MISSING'
    END as data_completeness
    
FROM diva_balance_sheets bs
FULL OUTER JOIN diva_income_statements is_ 
    ON bs.company_name = is_.company_name 
    AND bs.data_year = is_.data_year;

-- =====================================================
-- 6. COMMENTS FOR DOCUMENTATION
-- =====================================================

COMMENT ON TABLE diva_balance_sheets IS 'Korean VC Balance Sheets (재무상태표) - Assets, Liabilities, Equity data';
COMMENT ON TABLE diva_income_statements IS 'Korean VC Income Statements (손익계산서) - Revenue, Expenses, Profit data';
COMMENT ON VIEW diva_financial_statements_combined IS 'Combined view of balance sheets and income statements for backward compatibility';
COMMENT ON VIEW diva_financial_health_analysis IS 'Financial health analysis combining balance sheet and income statement data';

-- =====================================================
-- 7. ROW LEVEL SECURITY (Optional)
-- =====================================================

-- Enable RLS
ALTER TABLE diva_balance_sheets ENABLE ROW LEVEL SECURITY;
ALTER TABLE diva_income_statements ENABLE ROW LEVEL SECURITY;

-- Allow all operations for service role
CREATE POLICY "Allow all for service role" ON diva_balance_sheets FOR ALL TO service_role;
CREATE POLICY "Allow all for service role" ON diva_income_statements FOR ALL TO service_role;

-- Allow read access for authenticated users
CREATE POLICY "Allow read for authenticated users" ON diva_balance_sheets FOR SELECT TO authenticated;
CREATE POLICY "Allow read for authenticated users" ON diva_income_statements FOR SELECT TO authenticated; 