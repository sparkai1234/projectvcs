-- Create Missing DIVA Tables for Supabase
-- Based on actual scraper data structure from Apify logs

-- 1. Investment Performance Table
CREATE TABLE IF NOT EXISTS diva_investment_performance_raw (
    id BIGSERIAL PRIMARY KEY,
    company_name TEXT,
    individual_avoidance_count INTEGER,
    individual_amount BIGINT,
    partnership_avoidance_count INTEGER,
    partnership_amount BIGINT,
    total_avoidance_count INTEGER,
    total_amount BIGINT,
    extracted_at TIMESTAMPTZ DEFAULT NOW(),
    source_url TEXT,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- 2. Financial Statements Table  
CREATE TABLE IF NOT EXISTS diva_financial_raw (
    id BIGSERIAL PRIMARY KEY,
    company_name TEXT,
    fiscal_year TEXT,
    accounting_standard TEXT,
    total_assets BIGINT,
    total_liabilities BIGINT,
    total_equity BIGINT,
    operating_revenue BIGINT,
    operating_profit BIGINT,
    net_income BIGINT,
    startup_investment_assets BIGINT,
    extracted_at TIMESTAMPTZ DEFAULT NOW(),
    source_url TEXT,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- 3. Association Status Table
CREATE TABLE IF NOT EXISTS diva_association_raw (
    id BIGSERIAL PRIMARY KEY,
    company_name TEXT,
    fund_name TEXT,
    fund_number TEXT,
    total_investment BIGINT,
    formation_investment_krw BIGINT,
    maturity_date DATE,
    investment_purpose TEXT,
    development_type TEXT,
    support_type TEXT,
    extracted_at TIMESTAMPTZ DEFAULT NOW(),
    source_url TEXT,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- 4. Personnel Status Table (already exists but ensure compatibility)
CREATE TABLE IF NOT EXISTS diva_personnel_raw (
    id BIGSERIAL PRIMARY KEY,
    company_name TEXT,
    total_staff INTEGER,
    professional_staff INTEGER,
    investment_review_staff INTEGER,
    management_support_staff INTEGER,
    extracted_at TIMESTAMPTZ DEFAULT NOW(),
    source_url TEXT,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- 5. Professional Personnel Table
CREATE TABLE IF NOT EXISTS diva_professional_raw (
    id BIGSERIAL PRIMARY KEY,
    company_name TEXT,
    name TEXT,
    work_experience TEXT,
    professional_experience TEXT,
    education_vca TEXT,
    extracted_at TIMESTAMPTZ DEFAULT NOW(),
    source_url TEXT,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- 6. Violations Table  
CREATE TABLE IF NOT EXISTS diva_violation_raw (
    id BIGSERIAL PRIMARY KEY,
    violation_number TEXT,
    company_name TEXT,
    action_date DATE,
    action_end_date DATE,
    classification_name TEXT,
    correction_type TEXT,
    violation_type TEXT,
    action_type TEXT,
    extracted_at TIMESTAMPTZ DEFAULT NOW(),
    source_url TEXT,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Enable RLS on all tables
ALTER TABLE diva_investment_performance_raw ENABLE ROW LEVEL SECURITY;
ALTER TABLE diva_financial_raw ENABLE ROW LEVEL SECURITY;
ALTER TABLE diva_association_raw ENABLE ROW LEVEL SECURITY;
ALTER TABLE diva_personnel_raw ENABLE ROW LEVEL SECURITY;
ALTER TABLE diva_professional_raw ENABLE ROW LEVEL SECURITY;
ALTER TABLE diva_violation_raw ENABLE ROW LEVEL SECURITY;

-- Add RLS policies for authenticated users
CREATE POLICY "Enable all operations for authenticated users" ON diva_investment_performance_raw FOR ALL TO authenticated USING (true) WITH CHECK (true);
CREATE POLICY "Enable all operations for authenticated users" ON diva_financial_raw FOR ALL TO authenticated USING (true) WITH CHECK (true);
CREATE POLICY "Enable all operations for authenticated users" ON diva_association_raw FOR ALL TO authenticated USING (true) WITH CHECK (true);
CREATE POLICY "Enable all operations for authenticated users" ON diva_personnel_raw FOR ALL TO authenticated USING (true) WITH CHECK (true);
CREATE POLICY "Enable all operations for authenticated users" ON diva_professional_raw FOR ALL TO authenticated USING (true) WITH CHECK (true);
CREATE POLICY "Enable all operations for authenticated users" ON diva_violation_raw FOR ALL TO authenticated USING (true) WITH CHECK (true);

-- Create indexes for performance
CREATE INDEX IF NOT EXISTS idx_diva_investment_company ON diva_investment_performance_raw(company_name);
CREATE INDEX IF NOT EXISTS idx_diva_financial_company ON diva_financial_raw(company_name);
CREATE INDEX IF NOT EXISTS idx_diva_association_company ON diva_association_raw(company_name);
CREATE INDEX IF NOT EXISTS idx_diva_personnel_company ON diva_personnel_raw(company_name);
CREATE INDEX IF NOT EXISTS idx_diva_professional_company ON diva_professional_raw(company_name);
CREATE INDEX IF NOT EXISTS idx_diva_violation_company ON diva_violation_raw(company_name);

-- Create extraction timestamp indexes
CREATE INDEX IF NOT EXISTS idx_diva_investment_extracted ON diva_investment_performance_raw(extracted_at);
CREATE INDEX IF NOT EXISTS idx_diva_financial_extracted ON diva_financial_raw(extracted_at);
CREATE INDEX IF NOT EXISTS idx_diva_association_extracted ON diva_association_raw(extracted_at);
CREATE INDEX IF NOT EXISTS idx_diva_personnel_extracted ON diva_personnel_raw(extracted_at);
CREATE INDEX IF NOT EXISTS idx_diva_professional_extracted ON diva_professional_raw(extracted_at);
CREATE INDEX IF NOT EXISTS idx_diva_violation_extracted ON diva_violation_raw(extracted_at); 