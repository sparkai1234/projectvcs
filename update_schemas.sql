-- 🚀 COMPREHENSIVE SCHEMA UPDATES FOR DIVA INTELLIGENCE SYSTEM
-- Based on user's detailed fund and VC company data structure

-- ============================================================
-- 1. UPDATE FUND_TABLE SCHEMA
-- ============================================================

-- Add missing fund information fields
ALTER TABLE fund_table 
ADD COLUMN IF NOT EXISTS fund_id TEXT,
ADD COLUMN IF NOT EXISTS registration_date DATE,
ADD COLUMN IF NOT EXISTS expiry_date DATE,
ADD COLUMN IF NOT EXISTS company_name TEXT,
ADD COLUMN IF NOT EXISTS total_amount BIGINT,
ADD COLUMN IF NOT EXISTS operating_amount BIGINT,
ADD COLUMN IF NOT EXISTS investment_field TEXT,
ADD COLUMN IF NOT EXISTS investment_detail TEXT,
ADD COLUMN IF NOT EXISTS investment_character TEXT,
ADD COLUMN IF NOT EXISTS company_industry TEXT,
ADD COLUMN IF NOT EXISTS founded_date DATE,
ADD COLUMN IF NOT EXISTS notes TEXT,
ADD COLUMN IF NOT EXISTS description TEXT,
ADD COLUMN IF NOT EXISTS sector TEXT,
ADD COLUMN IF NOT EXISTS stage TEXT,
ADD COLUMN IF NOT EXISTS import_date TIMESTAMP WITH TIME ZONE,
ADD COLUMN IF NOT EXISTS data_source TEXT;

-- Add indexes for better performance
CREATE INDEX IF NOT EXISTS idx_fund_table_fund_id ON fund_table(fund_id);
CREATE INDEX IF NOT EXISTS idx_fund_table_company_name ON fund_table(company_name);
CREATE INDEX IF NOT EXISTS idx_fund_table_investment_field ON fund_table(investment_field);
CREATE INDEX IF NOT EXISTS idx_fund_table_registration_date ON fund_table(registration_date);

-- ============================================================
-- 2. CREATE VC_COMPANIES TABLE
-- ============================================================

CREATE TABLE IF NOT EXISTS vc_companies (
    id SERIAL PRIMARY KEY,
    
    -- Company Basic Information
    company_name TEXT NOT NULL,
    company_id TEXT UNIQUE,
    industry TEXT,
    
    -- Location & Details
    location TEXT,
    address TEXT,
    zip_code TEXT,
    company_type TEXT,
    founded TEXT,
    founded_date DATE,
    
    -- Business Information
    operating_scale INTEGER,
    operating_amount DECIMAL(15,2),
    business_category TEXT,
    strategy_planner BOOLEAN DEFAULT FALSE,
    
    -- Additional Details
    description TEXT,
    website TEXT,
    phone TEXT,
    email TEXT,
    representative TEXT,
    employee_count INTEGER,
    
    -- Investment Focus
    investment_focus TEXT,
    investment_stage TEXT,
    investment_sectors TEXT[],
    
    -- Financial Information
    aum BIGINT, -- Assets Under Management
    fund_count INTEGER,
    total_investments INTEGER,
    
    -- Status and Metadata
    status TEXT DEFAULT 'Active',
    data_type TEXT DEFAULT 'VC Company',
    import_date TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    data_source TEXT DEFAULT 'Korean VC Database (vcs.go.kr)',
    notes TEXT,
    
    -- Timestamps
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Add indexes for VC Companies
CREATE INDEX IF NOT EXISTS idx_vc_companies_company_id ON vc_companies(company_id);
CREATE INDEX IF NOT EXISTS idx_vc_companies_company_name ON vc_companies(company_name);
CREATE INDEX IF NOT EXISTS idx_vc_companies_industry ON vc_companies(industry);
CREATE INDEX IF NOT EXISTS idx_vc_companies_location ON vc_companies(location);
CREATE INDEX IF NOT EXISTS idx_vc_companies_company_type ON vc_companies(company_type);

-- ============================================================
-- 3. UPDATE EXISTING TABLES FOR CONSISTENCY
-- ============================================================

-- Update fund_table to match new structure
UPDATE fund_table 
SET data_source = 'Korean VC Database (vcs.go.kr)'
WHERE data_source IS NULL;

UPDATE fund_table 
SET import_date = NOW()
WHERE import_date IS NULL;

-- ============================================================
-- 4. CREATE VIEWS FOR EASY QUERYING
-- ============================================================

-- Comprehensive Fund View
CREATE OR REPLACE VIEW fund_comprehensive_view AS
SELECT 
    f.id,
    f.fund_name,
    f.fund_id,
    f.company_name,
    f.company_id,
    f.total_amount,
    f.operating_amount,
    f.commitment_amount,
    f.investment_field,
    f.investment_detail,
    f.investment_character,
    f.company_industry,
    f.registration_date,
    f.expiry_date,
    f.founded_date,
    f.fund_type,
    f.fund_status,
    f.notes,
    f.data_source,
    f.import_date,
    f.created_at,
    f.updated_at,
    -- Link to VC company if exists
    vc.company_name as vc_company_name,
    vc.industry as vc_industry,
    vc.location as vc_location
FROM fund_table f
LEFT JOIN vc_companies vc ON f.company_id = vc.company_id;

-- VC Company Summary View
CREATE OR REPLACE VIEW vc_companies_summary AS
SELECT 
    vc.id,
    vc.company_name,
    vc.company_id,
    vc.industry,
    vc.location,
    vc.company_type,
    vc.operating_amount,
    vc.fund_count,
    vc.total_investments,
    vc.status,
    -- Count related funds
    COUNT(f.id) as managed_funds_count,
    SUM(f.total_amount) as total_fund_amount
FROM vc_companies vc
LEFT JOIN fund_table f ON vc.company_id = f.company_id
GROUP BY vc.id, vc.company_name, vc.company_id, vc.industry, 
         vc.location, vc.company_type, vc.operating_amount, 
         vc.fund_count, vc.total_investments, vc.status;

-- ============================================================
-- 5. ADD COMMENTS FOR DOCUMENTATION
-- ============================================================

COMMENT ON TABLE fund_table IS 'Comprehensive fund information with Korean VC data structure';
COMMENT ON TABLE vc_companies IS 'Korean VC companies with detailed business information';

COMMENT ON COLUMN fund_table.fund_id IS 'Official fund ID (e.g., AS20160204)';
COMMENT ON COLUMN fund_table.registration_date IS 'Fund registration date';
COMMENT ON COLUMN fund_table.expiry_date IS 'Fund expiry date';
COMMENT ON COLUMN fund_table.investment_character IS 'Investment character code (e.g., 02)';
COMMENT ON COLUMN fund_table.company_industry IS 'Company industry code';

COMMENT ON COLUMN vc_companies.company_id IS 'Official company ID (e.g., OP20100002)';
COMMENT ON COLUMN vc_companies.operating_scale IS 'Operating scale indicator';
COMMENT ON COLUMN vc_companies.business_category IS 'Business category code';
COMMENT ON COLUMN vc_companies.strategy_planner IS 'Has strategy planning capability';

-- ============================================================
-- 6. GRANT PERMISSIONS
-- ============================================================

-- Grant permissions for service role
GRANT ALL ON fund_table TO service_role;
GRANT ALL ON vc_companies TO service_role;
GRANT SELECT ON fund_comprehensive_view TO service_role;
GRANT SELECT ON vc_companies_summary TO service_role;

-- Grant permissions for authenticated users
GRANT SELECT ON fund_table TO authenticated;
GRANT SELECT ON vc_companies TO authenticated;
GRANT SELECT ON fund_comprehensive_view TO authenticated;
GRANT SELECT ON vc_companies_summary TO authenticated;

-- ============================================================
-- SCHEMA UPDATE COMPLETE
-- ============================================================ 