-- 🏦💰 FUND OF FUNDS DATABASE TABLES
-- ===================================
--
-- Creates tables for Korea's major Fund of Funds data:
-- 1. KDB (Korea Development Bank) - Government FoF
-- 2. K-Growth - Private FoF (USD 2.1bn+ AUM)
-- 3. Integrated views for analysis
--
-- ULTIMATE VALUE: Complete ecosystem mapping of institutional VC backing

-- 🏦 KDB Fund of Funds Raw Data Table
CREATE TABLE IF NOT EXISTS kdb_fund_of_funds_raw (
    id BIGSERIAL PRIMARY KEY,
    
    -- Core Fund Information
    fund_name TEXT NOT NULL,
    fund_type TEXT,
    investment_amount BIGINT, -- Amount in KRW
    investment_amount_text TEXT,
    investment_date DATE,
    status TEXT DEFAULT 'Active',
    
    -- KDB Specific Fields
    government_backing BOOLEAN DEFAULT true,
    backing_institution TEXT DEFAULT 'Korea Development Bank (KDB)',
    backing_type TEXT, -- 'Direct Investment', 'Guarantee/Support', 'Major Investment'
    risk_level TEXT, -- 'Low-Medium Risk', 'Medium Risk', 'Medium-High Risk', 'High Risk'
    
    -- Investment Classification
    currency TEXT DEFAULT 'KRW',
    investment_stage TEXT, -- 'Early Stage', 'Growth Stage', 'Late Stage', 'Mixed Stage'
    sector_focus TEXT, -- 'Biotechnology', 'IT', 'Manufacturing', etc.
    
    -- Performance and Compliance
    performance_metrics JSONB,
    compliance_status TEXT,
    reporting_frequency TEXT DEFAULT 'Quarterly',
    
    -- Fund Details
    target_companies TEXT,
    geographic_focus TEXT,
    
    -- Search and Context
    search_criteria TEXT,
    announcement_details TEXT,
    description TEXT,
    
    -- Metadata
    data_source TEXT NOT NULL,
    source_url TEXT,
    data_type TEXT NOT NULL,
    extracted_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    
    -- Constraints
    UNIQUE(fund_name, investment_date, data_source)
);

-- Create indexes for KDB fund data
CREATE INDEX IF NOT EXISTS idx_kdb_fof_fund_name ON kdb_fund_of_funds_raw(fund_name);
CREATE INDEX IF NOT EXISTS idx_kdb_fof_investment_amount ON kdb_fund_of_funds_raw(investment_amount DESC);
CREATE INDEX IF NOT EXISTS idx_kdb_fof_investment_date ON kdb_fund_of_funds_raw(investment_date DESC);
CREATE INDEX IF NOT EXISTS idx_kdb_fof_backing_type ON kdb_fund_of_funds_raw(backing_type);
CREATE INDEX IF NOT EXISTS idx_kdb_fof_risk_level ON kdb_fund_of_funds_raw(risk_level);
CREATE INDEX IF NOT EXISTS idx_kdb_fof_sector_focus ON kdb_fund_of_funds_raw(sector_focus);
CREATE INDEX IF NOT EXISTS idx_kdb_fof_data_source ON kdb_fund_of_funds_raw(data_source);

-- 🌱 K-Growth Fund of Funds Raw Data Table
CREATE TABLE IF NOT EXISTS kgrowth_fund_of_funds_raw (
    id BIGSERIAL PRIMARY KEY,
    
    -- Core Fund Information
    fund_name TEXT NOT NULL,
    fund_type TEXT,
    investment_amount BIGINT, -- Amount in KRW (converted from USD if needed)
    investment_amount_text TEXT,
    investment_date DATE,
    investment_stage TEXT, -- 'Seed', 'Early', 'Growth', 'Expansion', 'Mature', 'Mixed'
    
    -- K-Growth Specific Fields
    fund_of_funds TEXT DEFAULT 'K-Growth',
    fof_type TEXT DEFAULT 'Private Fund of Funds',
    aum_category TEXT, -- 'Large (>1000억)', 'Medium-Large (500-1000억)', etc.
    glf_related BOOLEAN DEFAULT false, -- Growth Ladder Fund related
    
    -- Investment Classification
    target_companies TEXT, -- 'SMEs', 'Startups', 'Venture Companies', etc.
    geographic_focus TEXT, -- 'Korea-focused', 'Global', 'Asia', etc.
    sector_focus TEXT, -- 'Biotech', 'IT/ICT', 'Fintech', 'Sector Agnostic', etc.
    
    -- Performance and Risk Assessment
    performance_tier TEXT, -- 'Tier 1 (Large Fund)', 'Tier 2 (Medium-Large Fund)', etc.
    risk_profile TEXT, -- 'High Risk', 'Medium-High Risk', 'Medium Risk', 'Low-Medium Risk'
    
    -- Fund Details
    status TEXT DEFAULT 'Active',
    currency TEXT DEFAULT 'KRW',
    announcement_details TEXT,
    description TEXT,
    
    -- Search Context
    search_type INTEGER, -- str_type parameter from K-Growth site
    search_tab INTEGER, -- tab parameter from K-Growth site
    
    -- Metadata
    data_source TEXT NOT NULL,
    source_url TEXT,
    data_type TEXT NOT NULL, -- 'kgrowth_fund_investment', 'kgrowth_fund_announcement', 'kgrowth_fund_list'
    extracted_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    
    -- Constraints
    UNIQUE(fund_name, investment_date, data_source)
);

-- Create indexes for K-Growth fund data
CREATE INDEX IF NOT EXISTS idx_kgrowth_fof_fund_name ON kgrowth_fund_of_funds_raw(fund_name);
CREATE INDEX IF NOT EXISTS idx_kgrowth_fof_investment_amount ON kgrowth_fund_of_funds_raw(investment_amount DESC);
CREATE INDEX IF NOT EXISTS idx_kgrowth_fof_investment_date ON kgrowth_fund_of_funds_raw(investment_date DESC);
CREATE INDEX IF NOT EXISTS idx_kgrowth_fof_investment_stage ON kgrowth_fund_of_funds_raw(investment_stage);
CREATE INDEX IF NOT EXISTS idx_kgrowth_fof_aum_category ON kgrowth_fund_of_funds_raw(aum_category);
CREATE INDEX IF NOT EXISTS idx_kgrowth_fof_glf_related ON kgrowth_fund_of_funds_raw(glf_related);
CREATE INDEX IF NOT EXISTS idx_kgrowth_fof_performance_tier ON kgrowth_fund_of_funds_raw(performance_tier);
CREATE INDEX IF NOT EXISTS idx_kgrowth_fof_risk_profile ON kgrowth_fund_of_funds_raw(risk_profile);
CREATE INDEX IF NOT EXISTS idx_kgrowth_fof_sector_focus ON kgrowth_fund_of_funds_raw(sector_focus);
CREATE INDEX IF NOT EXISTS idx_kgrowth_fof_data_source ON kgrowth_fund_of_funds_raw(data_source);

-- 💎 INTEGRATED FUND OF FUNDS INTELLIGENCE VIEW
-- ==============================================
-- Combines government (KDB) and private (K-Growth) Fund of Funds data
-- for comprehensive institutional backing analysis

CREATE OR REPLACE VIEW fund_of_funds_intelligence AS
SELECT 
    -- Unified identifiers
    'KDB_' || k.id AS unified_id,
    'Government FoF' AS fof_category,
    k.fund_name,
    k.fund_type,
    
    -- Investment details
    k.investment_amount,
    k.investment_amount_text,
    k.investment_date,
    k.investment_stage,
    
    -- Institutional backing
    k.backing_institution AS institution,
    k.backing_type AS institution_type,
    k.government_backing,
    
    -- Risk and performance
    k.risk_level AS risk_assessment,
    k.performance_metrics,
    
    -- Classification
    k.sector_focus,
    k.geographic_focus,
    k.target_companies,
    
    -- Status and compliance
    k.status,
    k.compliance_status,
    k.reporting_frequency,
    
    -- Metadata
    k.data_source,
    k.data_type,
    k.extracted_at
    
FROM kdb_fund_of_funds_raw k
WHERE k.fund_name IS NOT NULL AND LENGTH(k.fund_name) > 3

UNION ALL

SELECT 
    -- Unified identifiers
    'KGROWTH_' || g.id AS unified_id,
    'Private FoF' AS fof_category,
    g.fund_name,
    g.fund_type,
    
    -- Investment details
    g.investment_amount,
    g.investment_amount_text,
    g.investment_date,
    g.investment_stage,
    
    -- Institutional backing
    g.fund_of_funds AS institution,
    g.fof_type AS institution_type,
    false AS government_backing, -- K-Growth is private
    
    -- Risk and performance
    g.risk_profile AS risk_assessment,
    NULL AS performance_metrics, -- Different structure for K-Growth
    
    -- Classification
    g.sector_focus,
    g.geographic_focus,
    g.target_companies,
    
    -- Status and compliance
    g.status,
    NULL AS compliance_status, -- Different reporting for private FoF
    NULL AS reporting_frequency,
    
    -- Metadata
    g.data_source,
    g.data_type,
    g.extracted_at
    
FROM kgrowth_fund_of_funds_raw g
WHERE g.fund_name IS NOT NULL AND LENGTH(g.fund_name) > 3;

-- 📊 FUND OF FUNDS ANALYTICS VIEW
-- ===============================
-- Provides analytical insights into Fund of Funds ecosystem

CREATE OR REPLACE VIEW fund_of_funds_analytics AS
SELECT 
    fof_category,
    institution,
    institution_type,
    
    -- Volume metrics
    COUNT(*) AS total_funds,
    COUNT(DISTINCT fund_name) AS unique_funds,
    SUM(CASE WHEN investment_amount IS NOT NULL THEN 1 ELSE 0 END) AS funds_with_amounts,
    
    -- Investment amounts (in billions KRW)
    SUM(investment_amount) / 1000000000 AS total_investment_billions_krw,
    AVG(investment_amount) / 1000000000 AS avg_investment_billions_krw,
    MIN(investment_amount) / 1000000000 AS min_investment_billions_krw,
    MAX(investment_amount) / 1000000000 AS max_investment_billions_krw,
    
    -- Stage distribution
    COUNT(CASE WHEN investment_stage LIKE '%Early%' THEN 1 END) AS early_stage_funds,
    COUNT(CASE WHEN investment_stage LIKE '%Growth%' THEN 1 END) AS growth_stage_funds,
    COUNT(CASE WHEN investment_stage LIKE '%Late%' OR investment_stage LIKE '%Mature%' THEN 1 END) AS late_stage_funds,
    
    -- Risk distribution
    COUNT(CASE WHEN risk_assessment LIKE '%High%' THEN 1 END) AS high_risk_funds,
    COUNT(CASE WHEN risk_assessment LIKE '%Medium%' THEN 1 END) AS medium_risk_funds,
    COUNT(CASE WHEN risk_assessment LIKE '%Low%' THEN 1 END) AS low_risk_funds,
    
    -- Sector distribution
    COUNT(CASE WHEN sector_focus LIKE '%IT%' OR sector_focus LIKE '%ICT%' THEN 1 END) AS tech_focused_funds,
    COUNT(CASE WHEN sector_focus LIKE '%Bio%' THEN 1 END) AS biotech_focused_funds,
    COUNT(CASE WHEN sector_focus LIKE '%Fintech%' THEN 1 END) AS fintech_focused_funds,
    COUNT(CASE WHEN sector_focus LIKE '%General%' OR sector_focus LIKE '%Agnostic%' THEN 1 END) AS sector_agnostic_funds,
    
    -- Time metrics
    MIN(investment_date) AS earliest_investment,
    MAX(investment_date) AS latest_investment,
    MAX(extracted_at) AS last_updated
    
FROM fund_of_funds_intelligence
GROUP BY fof_category, institution, institution_type
ORDER BY total_investment_billions_krw DESC NULLS LAST;

-- Add comments for documentation
COMMENT ON TABLE kdb_fund_of_funds_raw IS 'Raw data from Korea Development Bank Fund of Funds investments and government backing decisions';
COMMENT ON TABLE kgrowth_fund_of_funds_raw IS 'Raw data from K-Growth private Fund of Funds investments and portfolio decisions (USD 2.1bn+ AUM)';
COMMENT ON VIEW fund_of_funds_intelligence IS 'Unified view combining government (KDB) and private (K-Growth) Fund of Funds data for institutional backing analysis';
COMMENT ON VIEW fund_of_funds_analytics IS 'Analytical insights into Fund of Funds ecosystem including volume, risk, and sector distributions';

-- Success message
SELECT 'Fund of Funds tables and views created successfully! Ready for KDB and K-Growth data collection.' AS status; 