-- 🏛️ KVIC DATABASE TABLES - OFFICIAL GOVERNMENT VC DATA
-- ========================================================
--
-- Creates tables for Korea Venture Investment Corporation (KVIC) data:
-- 1. Investment Statistics - Official government investment tracking
-- 2. Fund Performance - Authorized fund metrics and returns
-- 3. Portfolio Companies - Government-backed startup success tracking
-- 4. Integrated views for cross-analysis
--
-- ULTIMATE VALUE: Official government VC ecosystem data - most authoritative source

-- 📊 KVIC Investment Statistics Raw Data Table
CREATE TABLE IF NOT EXISTS kvic_investment_raw (
    id BIGSERIAL PRIMARY KEY,
    
    -- Core Investment Information
    investment_id TEXT,
    company_name TEXT,
    fund_name TEXT,
    investment_amount BIGINT, -- Amount in KRW
    investment_amount_text TEXT,
    investment_date DATE,
    investment_stage TEXT, -- 'Seed', 'Early', 'Growth', 'Expansion', 'Later', 'Bridge', 'IPO Preparation'
    
    -- Company Details
    company_sector TEXT,
    company_type TEXT,
    company_location TEXT,
    company_employees INTEGER,
    
    -- Fund Details
    fund_type TEXT,
    fund_manager TEXT,
    fund_size BIGINT, -- Amount in KRW
    
    -- Investment Context
    round_type TEXT,
    lead_investor TEXT,
    co_investors TEXT,
    
    -- Performance Indicators
    valuation BIGINT, -- Amount in KRW
    roi_expectation TEXT,
    exit_strategy TEXT,
    
    -- Government Classification
    government_program TEXT,
    support_type TEXT,
    regulatory_status TEXT,
    
    -- Metadata
    data_source TEXT NOT NULL DEFAULT 'KVIC_API',
    endpoint TEXT,
    extracted_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    data_type TEXT NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    
    -- Constraints
    UNIQUE(investment_id, company_name, fund_name, investment_date)
);

-- 🏦 KVIC Fund Performance Raw Data Table
CREATE TABLE IF NOT EXISTS kvic_fund_raw (
    id BIGSERIAL PRIMARY KEY,
    
    -- Core Fund Information
    fund_id TEXT,
    fund_name TEXT NOT NULL,
    fund_type TEXT,
    fund_size BIGINT, -- Amount in KRW
    fund_size_text TEXT,
    
    -- Management Details
    management_company TEXT,
    fund_manager TEXT,
    establishment_date DATE,
    maturity_date DATE,
    
    -- Investment Strategy
    investment_stage TEXT,
    target_sector TEXT,
    geographic_focus TEXT,
    investment_strategy TEXT,
    
    -- Performance Metrics
    total_committed BIGINT, -- Amount in KRW
    total_called BIGINT, -- Amount in KRW
    total_invested BIGINT, -- Amount in KRW
    portfolio_companies INTEGER,
    
    -- Returns and Performance
    irr DECIMAL(5,2), -- Internal Rate of Return as percentage
    multiple DECIMAL(5,2), -- Return multiple
    realized_value BIGINT, -- Amount in KRW
    unrealized_value BIGINT, -- Amount in KRW
    
    -- Fund Status
    fund_status TEXT,
    investment_period TEXT,
    harvest_period TEXT,
    
    -- Government Relation
    government_fund BOOLEAN DEFAULT false,
    mother_fund TEXT, -- Korea Fund of Funds relation
    support_program TEXT,
    
    -- Metadata
    data_source TEXT NOT NULL DEFAULT 'KVIC_API',
    endpoint TEXT,
    extracted_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    data_type TEXT NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    
    -- Constraints
    UNIQUE(fund_id, fund_name, establishment_date)
);

-- 🚀 KVIC Portfolio Companies Raw Data Table
CREATE TABLE IF NOT EXISTS kvic_portfolio_raw (
    id BIGSERIAL PRIMARY KEY,
    
    -- Company Identification
    company_id TEXT,
    company_name TEXT NOT NULL,
    business_number TEXT,
    
    -- Business Details
    industry TEXT,
    business_model TEXT,
    main_product TEXT,
    target_market TEXT,
    
    -- Company Metrics
    establishment_date DATE,
    employees INTEGER,
    annual_revenue BIGINT, -- Amount in KRW
    total_funding BIGINT, -- Amount in KRW
    
    -- Investment Timeline
    first_investment_date DATE,
    latest_investment_date DATE,
    investment_rounds INTEGER,
    current_stage TEXT,
    
    -- Performance Indicators
    revenue_growth DECIMAL(5,2), -- Growth rate as percentage
    employee_growth DECIMAL(5,2), -- Growth rate as percentage
    market_share DECIMAL(5,2), -- Market share as percentage
    
    -- Exit Information
    exit_status TEXT,
    exit_date DATE,
    exit_method TEXT, -- 'IPO', 'M&A', 'Trade Sale', etc.
    exit_value BIGINT, -- Amount in KRW
    
    -- Location and Contact
    headquarters TEXT,
    website TEXT,
    ceo_name TEXT,
    
    -- Metadata
    data_source TEXT NOT NULL DEFAULT 'KVIC_API',
    endpoint TEXT,
    extracted_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    data_type TEXT NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    
    -- Constraints
    UNIQUE(company_id, company_name, business_number)
);

-- Create comprehensive indexes for KVIC data
-- Investment data indexes
CREATE INDEX IF NOT EXISTS idx_kvic_inv_company_name ON kvic_investment_raw(company_name);
CREATE INDEX IF NOT EXISTS idx_kvic_inv_fund_name ON kvic_investment_raw(fund_name);
CREATE INDEX IF NOT EXISTS idx_kvic_inv_amount ON kvic_investment_raw(investment_amount DESC);
CREATE INDEX IF NOT EXISTS idx_kvic_inv_date ON kvic_investment_raw(investment_date DESC);
CREATE INDEX IF NOT EXISTS idx_kvic_inv_stage ON kvic_investment_raw(investment_stage);
CREATE INDEX IF NOT EXISTS idx_kvic_inv_sector ON kvic_investment_raw(company_sector);
CREATE INDEX IF NOT EXISTS idx_kvic_inv_location ON kvic_investment_raw(company_location);
CREATE INDEX IF NOT EXISTS idx_kvic_inv_gov_program ON kvic_investment_raw(government_program);

-- Fund data indexes
CREATE INDEX IF NOT EXISTS idx_kvic_fund_name ON kvic_fund_raw(fund_name);
CREATE INDEX IF NOT EXISTS idx_kvic_fund_size ON kvic_fund_raw(fund_size DESC);
CREATE INDEX IF NOT EXISTS idx_kvic_fund_type ON kvic_fund_raw(fund_type);
CREATE INDEX IF NOT EXISTS idx_kvic_fund_manager ON kvic_fund_raw(management_company);
CREATE INDEX IF NOT EXISTS idx_kvic_fund_stage ON kvic_fund_raw(investment_stage);
CREATE INDEX IF NOT EXISTS idx_kvic_fund_sector ON kvic_fund_raw(target_sector);
CREATE INDEX IF NOT EXISTS idx_kvic_fund_irr ON kvic_fund_raw(irr DESC);
CREATE INDEX IF NOT EXISTS idx_kvic_fund_multiple ON kvic_fund_raw(multiple DESC);
CREATE INDEX IF NOT EXISTS idx_kvic_fund_gov ON kvic_fund_raw(government_fund);

-- Portfolio company indexes
CREATE INDEX IF NOT EXISTS idx_kvic_port_company_name ON kvic_portfolio_raw(company_name);
CREATE INDEX IF NOT EXISTS idx_kvic_port_industry ON kvic_portfolio_raw(industry);
CREATE INDEX IF NOT EXISTS idx_kvic_port_revenue ON kvic_portfolio_raw(annual_revenue DESC);
CREATE INDEX IF NOT EXISTS idx_kvic_port_funding ON kvic_portfolio_raw(total_funding DESC);
CREATE INDEX IF NOT EXISTS idx_kvic_port_employees ON kvic_portfolio_raw(employees DESC);
CREATE INDEX IF NOT EXISTS idx_kvic_port_growth ON kvic_portfolio_raw(revenue_growth DESC);
CREATE INDEX IF NOT EXISTS idx_kvic_port_stage ON kvic_portfolio_raw(current_stage);
CREATE INDEX IF NOT EXISTS idx_kvic_port_exit ON kvic_portfolio_raw(exit_status);

-- 💎 INTEGRATED KVIC INTELLIGENCE VIEW
-- ====================================
-- Combines all KVIC data sources for comprehensive government VC analysis

CREATE OR REPLACE VIEW kvic_intelligence AS
SELECT 
    -- Investment data
    i.investment_id,
    i.company_name,
    i.fund_name,
    i.investment_amount,
    i.investment_date,
    i.investment_stage,
    i.company_sector,
    i.company_location,
    i.government_program,
    i.support_type,
    
    -- Fund performance data
    f.fund_size,
    f.management_company,
    f.irr,
    f.multiple,
    f.government_fund,
    f.mother_fund,
    
    -- Portfolio company data
    p.annual_revenue,
    p.total_funding,
    p.employees,
    p.revenue_growth,
    p.exit_status,
    p.exit_value,
    
    -- Calculated metrics
    CASE 
        WHEN i.investment_amount IS NOT NULL AND f.fund_size IS NOT NULL 
        THEN (i.investment_amount::DECIMAL / f.fund_size::DECIMAL) * 100 
        ELSE NULL 
    END AS investment_percentage,
    
    CASE 
        WHEN p.exit_value IS NOT NULL AND i.investment_amount IS NOT NULL 
        THEN (p.exit_value::DECIMAL / i.investment_amount::DECIMAL) 
        ELSE NULL 
    END AS investment_return_multiple,
    
    -- Success indicators
    CASE 
        WHEN p.exit_status LIKE '%IPO%' THEN 'IPO Success'
        WHEN p.exit_status LIKE '%M&A%' THEN 'M&A Success'
        WHEN p.revenue_growth > 20 THEN 'High Growth'
        WHEN p.revenue_growth > 10 THEN 'Moderate Growth'
        ELSE 'Early Stage'
    END AS success_indicator,
    
    -- Metadata
    GREATEST(i.extracted_at, f.extracted_at, p.extracted_at) AS last_updated
    
FROM kvic_investment_raw i
LEFT JOIN kvic_fund_raw f ON i.fund_name = f.fund_name
LEFT JOIN kvic_portfolio_raw p ON i.company_name = p.company_name
WHERE i.company_name IS NOT NULL;

-- 📈 KVIC ANALYTICS DASHBOARD VIEW
-- ================================
-- Provides key metrics for government VC ecosystem analysis

CREATE OR REPLACE VIEW kvic_analytics AS
SELECT 
    -- Volume metrics
    COUNT(DISTINCT company_name) AS total_companies,
    COUNT(DISTINCT fund_name) AS total_funds,
    COUNT(*) AS total_investments,
    
    -- Investment amounts (in billions KRW)
    SUM(investment_amount) / 1000000000 AS total_investment_billions_krw,
    AVG(investment_amount) / 1000000000 AS avg_investment_billions_krw,
    
    -- Stage distribution
    COUNT(CASE WHEN investment_stage = 'Seed' THEN 1 END) AS seed_investments,
    COUNT(CASE WHEN investment_stage = 'Early' THEN 1 END) AS early_investments,
    COUNT(CASE WHEN investment_stage = 'Growth' THEN 1 END) AS growth_investments,
    COUNT(CASE WHEN investment_stage = 'Later' THEN 1 END) AS later_investments,
    
    -- Sector distribution
    COUNT(CASE WHEN company_sector LIKE '%IT%' OR company_sector LIKE '%ICT%' THEN 1 END) AS tech_companies,
    COUNT(CASE WHEN company_sector LIKE '%Bio%' OR company_sector LIKE '%바이오%' THEN 1 END) AS biotech_companies,
    COUNT(CASE WHEN company_sector LIKE '%제조%' OR company_sector LIKE '%Manufacturing%' THEN 1 END) AS manufacturing_companies,
    
    -- Government program distribution
    COUNT(CASE WHEN government_program IS NOT NULL THEN 1 END) AS government_backed_investments,
    
    -- Performance metrics
    AVG(CASE WHEN irr IS NOT NULL THEN irr END) AS avg_fund_irr,
    AVG(CASE WHEN multiple IS NOT NULL THEN multiple END) AS avg_fund_multiple,
    
    -- Success metrics
    COUNT(CASE WHEN exit_status LIKE '%IPO%' THEN 1 END) AS ipo_exits,
    COUNT(CASE WHEN exit_status LIKE '%M&A%' THEN 1 END) AS ma_exits,
    SUM(CASE WHEN exit_value IS NOT NULL THEN exit_value ELSE 0 END) / 1000000000 AS total_exit_value_billions_krw,
    
    -- Time metrics
    MIN(investment_date) AS earliest_investment,
    MAX(investment_date) AS latest_investment,
    MAX(last_updated) AS data_updated
    
FROM kvic_intelligence;

-- 🎯 GOVERNMENT INVESTMENT IMPACT VIEW
-- ====================================
-- Analyzes the impact of government VC programs

CREATE OR REPLACE VIEW government_investment_impact AS
WITH program_stats AS (
    SELECT 
        government_program,
        support_type,
        COUNT(DISTINCT company_name) AS companies_supported,
        SUM(investment_amount) / 1000000000 AS total_investment_billions_krw,
        AVG(revenue_growth) AS avg_revenue_growth,
        COUNT(CASE WHEN exit_status IS NOT NULL THEN 1 END) AS successful_exits,
        AVG(CASE WHEN exit_value IS NOT NULL AND investment_amount IS NOT NULL 
            THEN exit_value::DECIMAL / investment_amount::DECIMAL 
            END) AS avg_return_multiple
    FROM kvic_intelligence
    WHERE government_program IS NOT NULL
    GROUP BY government_program, support_type
)
SELECT 
    government_program,
    support_type,
    companies_supported,
    total_investment_billions_krw,
    avg_revenue_growth,
    successful_exits,
    ROUND(avg_return_multiple, 2) AS avg_return_multiple,
    
    -- Success rate
    ROUND(
        (successful_exits::DECIMAL / companies_supported::DECIMAL) * 100, 
        2
    ) AS success_rate_percent,
    
    -- ROI calculation
    CASE 
        WHEN avg_return_multiple > 3 THEN 'High ROI'
        WHEN avg_return_multiple > 1.5 THEN 'Moderate ROI'
        WHEN avg_return_multiple > 1 THEN 'Positive ROI'
        ELSE 'Developing'
    END AS roi_category
    
FROM program_stats
ORDER BY total_investment_billions_krw DESC;

-- 🔮 INVESTMENT OPPORTUNITY MATRIX VIEW
-- ====================================
-- Identifies high-potential investment patterns from government data

CREATE OR REPLACE VIEW investment_opportunity_matrix AS
WITH sector_performance AS (
    SELECT 
        company_sector,
        investment_stage,
        COUNT(*) AS investment_count,
        AVG(revenue_growth) AS avg_growth,
        COUNT(CASE WHEN exit_status IS NOT NULL THEN 1 END) AS exit_count,
        AVG(CASE WHEN exit_value IS NOT NULL AND investment_amount IS NOT NULL 
            THEN exit_value::DECIMAL / investment_amount::DECIMAL 
            END) AS avg_return_multiple
    FROM kvic_intelligence
    WHERE company_sector IS NOT NULL 
    AND investment_stage IS NOT NULL
    GROUP BY company_sector, investment_stage
    HAVING COUNT(*) >= 3 -- Minimum sample size
)
SELECT 
    company_sector,
    investment_stage,
    investment_count,
    ROUND(avg_growth, 2) AS avg_growth_rate,
    exit_count,
    ROUND(avg_return_multiple, 2) AS avg_return_multiple,
    
    -- Opportunity score (weighted combination of metrics)
    ROUND(
        (COALESCE(avg_growth, 0) * 0.3) + 
        (COALESCE(avg_return_multiple, 0) * 10 * 0.4) + 
        ((exit_count::DECIMAL / investment_count::DECIMAL) * 100 * 0.3),
        2
    ) AS opportunity_score,
    
    -- Risk-return classification
    CASE 
        WHEN avg_return_multiple > 2 AND avg_growth > 15 THEN 'High Return, High Growth'
        WHEN avg_return_multiple > 1.5 AND avg_growth > 10 THEN 'Moderate Return, Good Growth'
        WHEN avg_return_multiple > 1 THEN 'Stable Return'
        ELSE 'Emerging Opportunity'
    END AS opportunity_category
    
FROM sector_performance
ORDER BY opportunity_score DESC;

-- Add table comments for documentation
COMMENT ON TABLE kvic_investment_raw IS 'Official government investment statistics from Korea Venture Investment Corporation';
COMMENT ON TABLE kvic_fund_raw IS 'Authorized VC fund performance data and metrics from KVIC';
COMMENT ON TABLE kvic_portfolio_raw IS 'Government-backed portfolio company tracking and success metrics';
COMMENT ON VIEW kvic_intelligence IS 'Integrated view of all KVIC data sources for comprehensive government VC analysis';
COMMENT ON VIEW kvic_analytics IS 'Key performance indicators and metrics for the government VC ecosystem';
COMMENT ON VIEW government_investment_impact IS 'Analysis of government VC program effectiveness and ROI';
COMMENT ON VIEW investment_opportunity_matrix IS 'Data-driven investment opportunity identification from government patterns';

-- Success message
SELECT 'KVIC tables and views created successfully! Ready for official government VC data collection.' AS status; 