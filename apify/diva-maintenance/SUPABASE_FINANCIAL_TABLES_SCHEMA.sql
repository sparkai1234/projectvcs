-- =====================================================
-- 🏦 DIVA FINANCIAL STATEMENTS: SEPARATE TABLES SCHEMA
-- =====================================================
-- Fixing the critical financial data corruption issue
-- Multi-year support for historical and future data
-- Current data: Fiscal Year 2024

-- =====================================================
-- 1. DIVA BALANCE SHEETS TABLE (재무상태표)
-- =====================================================
CREATE TABLE IF NOT EXISTS diva_balance_sheets (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    
    -- Company Information
    company_name VARCHAR(255) NOT NULL,
    company_id VARCHAR(100),
    
    -- Financial Period & Standards (Multi-year support)
    data_year INTEGER NOT NULL DEFAULT 2024,
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
    
    -- Calculated Ratios (auto-calculated)
    debt_to_equity_ratio DECIMAL(10,4),      -- 부채비율
    asset_investment_ratio DECIMAL(10,4),    -- 투자자산비율
    
    -- Metadata
    source_url VARCHAR(500),
    extracted_at TIMESTAMP WITH TIME ZONE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    
    -- Multi-year constraints
    CONSTRAINT valid_data_year CHECK (data_year >= 2020 AND data_year <= 2030),
    CONSTRAINT unique_company_year_balance UNIQUE (company_name, data_year)
);

-- =====================================================
-- 2. DIVA INCOME STATEMENTS TABLE (손익계산서)
-- =====================================================
CREATE TABLE IF NOT EXISTS diva_income_statements (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    
    -- Company Information
    company_name VARCHAR(255) NOT NULL,
    company_id VARCHAR(100),
    
    -- Financial Period & Standards (Multi-year support)
    data_year INTEGER NOT NULL DEFAULT 2024,
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
    
    -- Calculated Ratios (auto-calculated)
    operating_margin DECIMAL(10,4),          -- 영업이익률
    net_profit_margin DECIMAL(10,4),         -- 순이익률
    expense_ratio DECIMAL(10,4),             -- 비용비율
    
    -- Metadata
    source_url VARCHAR(500),
    extracted_at TIMESTAMP WITH TIME ZONE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    
    -- Multi-year constraints
    CONSTRAINT valid_data_year_income CHECK (data_year >= 2020 AND data_year <= 2030),
    CONSTRAINT unique_company_year_income UNIQUE (company_name, data_year)
);

-- =====================================================
-- 3. INDEXES FOR PERFORMANCE (Multi-year optimized)
-- =====================================================

-- Balance Sheets Indexes
CREATE INDEX IF NOT EXISTS idx_balance_sheets_company_name ON diva_balance_sheets(company_name);
CREATE INDEX IF NOT EXISTS idx_balance_sheets_data_year ON diva_balance_sheets(data_year);
CREATE INDEX IF NOT EXISTS idx_balance_sheets_company_year ON diva_balance_sheets(company_name, data_year);
CREATE INDEX IF NOT EXISTS idx_balance_sheets_created_at ON diva_balance_sheets(created_at);
CREATE INDEX IF NOT EXISTS idx_balance_sheets_total_assets ON diva_balance_sheets(total_assets) WHERE total_assets IS NOT NULL;
CREATE INDEX IF NOT EXISTS idx_balance_sheets_year_assets ON diva_balance_sheets(data_year, total_assets) WHERE total_assets IS NOT NULL;

-- Income Statements Indexes
CREATE INDEX IF NOT EXISTS idx_income_statements_company_name ON diva_income_statements(company_name);
CREATE INDEX IF NOT EXISTS idx_income_statements_data_year ON diva_income_statements(data_year);
CREATE INDEX IF NOT EXISTS idx_income_statements_company_year ON diva_income_statements(company_name, data_year);
CREATE INDEX IF NOT EXISTS idx_income_statements_created_at ON diva_income_statements(created_at);
CREATE INDEX IF NOT EXISTS idx_income_statements_operating_revenue ON diva_income_statements(operating_revenue) WHERE operating_revenue IS NOT NULL;
CREATE INDEX IF NOT EXISTS idx_income_statements_year_revenue ON diva_income_statements(data_year, operating_revenue) WHERE operating_revenue IS NOT NULL;

-- =====================================================
-- 4. TRIGGERS FOR CALCULATED FIELDS & UPDATED_AT
-- =====================================================

-- Balance Sheets trigger with ratio calculations
CREATE OR REPLACE FUNCTION update_balance_sheets_calculated_fields()
RETURNS TRIGGER AS $$
BEGIN
    -- Update timestamp
    NEW.updated_at = NOW();
    
    -- Calculate debt-to-equity ratio
    IF NEW.total_equity IS NOT NULL AND NEW.total_equity > 0 AND NEW.total_liabilities IS NOT NULL THEN
        NEW.debt_to_equity_ratio = ROUND((NEW.total_liabilities::DECIMAL / NEW.total_equity) * 100, 4);
    END IF;
    
    -- Calculate asset investment ratio
    IF NEW.total_assets IS NOT NULL AND NEW.total_assets > 0 AND NEW.startup_investment_assets IS NOT NULL THEN
        NEW.asset_investment_ratio = ROUND((NEW.startup_investment_assets::DECIMAL / NEW.total_assets) * 100, 4);
    END IF;
    
    RETURN NEW;
END;
$$ language 'plpgsql';

CREATE TRIGGER update_balance_sheets_calculated_fields
    BEFORE INSERT OR UPDATE ON diva_balance_sheets
    FOR EACH ROW
    EXECUTE FUNCTION update_balance_sheets_calculated_fields();

-- Income Statements trigger with ratio calculations
CREATE OR REPLACE FUNCTION update_income_statements_calculated_fields()
RETURNS TRIGGER AS $$
BEGIN
    -- Update timestamp
    NEW.updated_at = NOW();
    
    -- Calculate operating margin
    IF NEW.operating_revenue IS NOT NULL AND NEW.operating_revenue > 0 AND NEW.operating_profit IS NOT NULL THEN
        NEW.operating_margin = ROUND((NEW.operating_profit::DECIMAL / NEW.operating_revenue) * 100, 4);
    END IF;
    
    -- Calculate net profit margin
    IF NEW.operating_revenue IS NOT NULL AND NEW.operating_revenue > 0 AND NEW.net_profit IS NOT NULL THEN
        NEW.net_profit_margin = ROUND((NEW.net_profit::DECIMAL / NEW.operating_revenue) * 100, 4);
    END IF;
    
    -- Calculate expense ratio
    IF NEW.operating_revenue IS NOT NULL AND NEW.operating_revenue > 0 AND NEW.operating_expenses IS NOT NULL THEN
        NEW.expense_ratio = ROUND((NEW.operating_expenses::DECIMAL / NEW.operating_revenue) * 100, 4);
    END IF;
    
    RETURN NEW;
END;
$$ language 'plpgsql';

CREATE TRIGGER update_income_statements_calculated_fields
    BEFORE INSERT OR UPDATE ON diva_income_statements
    FOR EACH ROW
    EXECUTE FUNCTION update_income_statements_calculated_fields();

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
    debt_to_equity_ratio,
    asset_investment_ratio,
    NULL::DECIMAL as operating_margin,
    NULL::DECIMAL as net_profit_margin,
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
    NULL::DECIMAL as debt_to_equity_ratio,
    NULL::DECIMAL as asset_investment_ratio,
    operating_margin,
    net_profit_margin,
    source_url,
    extracted_at,
    created_at,
    updated_at
FROM diva_income_statements;

-- Multi-year financial health analysis view
CREATE OR REPLACE VIEW diva_financial_health_analysis AS
SELECT 
    COALESCE(bs.company_name, is_.company_name) as company_name,
    COALESCE(bs.data_year, is_.data_year) as data_year,
    
    -- Balance Sheet Metrics
    bs.total_assets,
    bs.total_liabilities,
    bs.total_equity,
    bs.startup_investment_assets,
    bs.debt_to_equity_ratio,
    bs.asset_investment_ratio,
    
    -- Income Statement Metrics
    is_.operating_revenue,
    is_.operating_expenses,
    is_.operating_profit,
    is_.net_profit,
    is_.operating_margin,
    is_.net_profit_margin,
    is_.expense_ratio,
    
    -- Combined Analysis Ratios
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
    
    CASE 
        WHEN bs.total_assets > 0 AND is_.net_profit > 0 
        THEN ROUND((is_.net_profit::DECIMAL / bs.total_assets) * 100, 2)
        ELSE NULL 
    END as return_on_assets,
    
    -- Data Completeness
    CASE 
        WHEN bs.id IS NOT NULL AND is_.id IS NOT NULL THEN 'COMPLETE'
        WHEN bs.id IS NOT NULL THEN 'BALANCE_ONLY'
        WHEN is_.id IS NOT NULL THEN 'INCOME_ONLY'
        ELSE 'MISSING'
    END as data_completeness,
    
    -- Financial Health Score (0-100)
    CASE 
        WHEN bs.id IS NULL OR is_.id IS NULL THEN 0
        WHEN bs.total_equity <= 0 OR is_.operating_revenue <= 0 THEN 20
        WHEN is_.net_profit <= 0 THEN 40
        WHEN bs.debt_to_equity_ratio > 200 THEN 50
        WHEN is_.operating_margin < 5 THEN 60
        WHEN is_.operating_margin < 15 THEN 70
        WHEN is_.operating_margin < 25 THEN 80
        ELSE 90
    END as financial_health_score
    
FROM diva_balance_sheets bs
FULL OUTER JOIN diva_income_statements is_ 
    ON bs.company_name = is_.company_name 
    AND bs.data_year = is_.data_year;

-- Year-over-year growth analysis view
CREATE OR REPLACE VIEW diva_financial_growth_analysis AS
SELECT 
    current_year.company_name,
    current_year.data_year as current_year,
    previous_year.data_year as previous_year,
    
    -- Revenue Growth
    current_year.operating_revenue as current_revenue,
    previous_year.operating_revenue as previous_revenue,
    CASE 
        WHEN previous_year.operating_revenue > 0 AND current_year.operating_revenue IS NOT NULL 
        THEN ROUND(((current_year.operating_revenue - previous_year.operating_revenue)::DECIMAL / previous_year.operating_revenue) * 100, 2)
        ELSE NULL 
    END as revenue_growth_rate,
    
    -- Profit Growth
    current_year.net_profit as current_profit,
    previous_year.net_profit as previous_profit,
    CASE 
        WHEN previous_year.net_profit > 0 AND current_year.net_profit IS NOT NULL 
        THEN ROUND(((current_year.net_profit - previous_year.net_profit)::DECIMAL / previous_year.net_profit) * 100, 2)
        ELSE NULL 
    END as profit_growth_rate,
    
    -- Asset Growth
    current_year.total_assets as current_assets,
    previous_year.total_assets as previous_assets,
    CASE 
        WHEN previous_year.total_assets > 0 AND current_year.total_assets IS NOT NULL 
        THEN ROUND(((current_year.total_assets - previous_year.total_assets)::DECIMAL / previous_year.total_assets) * 100, 2)
        ELSE NULL 
    END as asset_growth_rate

FROM diva_financial_health_analysis current_year
LEFT JOIN diva_financial_health_analysis previous_year 
    ON current_year.company_name = previous_year.company_name 
    AND current_year.data_year = previous_year.data_year + 1
WHERE current_year.data_completeness = 'COMPLETE'
    AND previous_year.data_completeness = 'COMPLETE';

-- =====================================================
-- 6. MULTI-YEAR SUMMARY VIEWS
-- =====================================================

-- Annual data summary by year
CREATE OR REPLACE VIEW diva_annual_summary AS
SELECT 
    data_year,
    COUNT(DISTINCT bs.company_name) as companies_with_balance_sheets,
    COUNT(DISTINCT is_.company_name) as companies_with_income_statements,
    COUNT(DISTINCT COALESCE(bs.company_name, is_.company_name)) as total_companies,
    
    -- Balance Sheet Aggregates
    AVG(bs.total_assets) as avg_total_assets,
    SUM(bs.total_assets) as total_industry_assets,
    AVG(bs.debt_to_equity_ratio) as avg_debt_to_equity,
    
    -- Income Statement Aggregates  
    AVG(is_.operating_revenue) as avg_operating_revenue,
    SUM(is_.operating_revenue) as total_industry_revenue,
    AVG(is_.operating_margin) as avg_operating_margin,
    AVG(is_.net_profit_margin) as avg_net_profit_margin,
    
    -- Data Quality
    ROUND(
        (COUNT(CASE WHEN bs.id IS NOT NULL AND is_.id IS NOT NULL THEN 1 END)::DECIMAL / 
         COUNT(DISTINCT COALESCE(bs.company_name, is_.company_name))) * 100, 2
    ) as data_completeness_percentage

FROM diva_balance_sheets bs
FULL OUTER JOIN diva_income_statements is_ 
    ON bs.company_name = is_.company_name 
    AND bs.data_year = is_.data_year
GROUP BY data_year
ORDER BY data_year DESC;

-- =====================================================
-- 7. COMMENTS FOR DOCUMENTATION
-- =====================================================

COMMENT ON TABLE diva_balance_sheets IS 'Korean VC Balance Sheets (재무상태표) - Multi-year assets, liabilities, equity data';
COMMENT ON TABLE diva_income_statements IS 'Korean VC Income Statements (손익계산서) - Multi-year revenue, expenses, profit data';
COMMENT ON VIEW diva_financial_statements_combined IS 'Combined view of balance sheets and income statements for backward compatibility';
COMMENT ON VIEW diva_financial_health_analysis IS 'Comprehensive financial health analysis with calculated ratios and scores';
COMMENT ON VIEW diva_financial_growth_analysis IS 'Year-over-year growth analysis for revenue, profit, and assets';
COMMENT ON VIEW diva_annual_summary IS 'Annual industry summary statistics by year';

-- =====================================================
-- 8. ROW LEVEL SECURITY (RLS)
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

-- =====================================================
-- 9. INITIAL DATA VERIFICATION QUERIES
-- =====================================================

-- Run these after migration to verify data integrity:

-- Check record counts by year
-- SELECT data_year, COUNT(*) as balance_sheets FROM diva_balance_sheets GROUP BY data_year ORDER BY data_year;
-- SELECT data_year, COUNT(*) as income_statements FROM diva_income_statements GROUP BY data_year ORDER BY data_year;

-- Check data completeness
-- SELECT * FROM diva_annual_summary;

-- Sample financial health analysis
-- SELECT * FROM diva_financial_health_analysis WHERE data_year = 2024 LIMIT 10;

-- Test calculated ratios
-- SELECT company_name, total_assets, total_liabilities, debt_to_equity_ratio FROM diva_balance_sheets WHERE debt_to_equity_ratio IS NOT NULL LIMIT 5;
-- SELECT company_name, operating_revenue, operating_profit, operating_margin FROM diva_income_statements WHERE operating_margin IS NOT NULL LIMIT 5; 