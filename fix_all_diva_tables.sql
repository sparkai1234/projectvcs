-- Fix All DIVA Tables Schema
-- Based on actual scraper data structure

-- 1. Investment Performance Table
CREATE TABLE IF NOT EXISTS diva_investment_performance_raw (
    id BIGSERIAL PRIMARY KEY,
    company_name TEXT,
    unique_number_avoidance_count INTEGER,
    unique_number_amount_krw BIGINT,
    fund_avoidance_count INTEGER,
    fund_amount_krw BIGINT,
    total_avoidance_count INTEGER,
    total_amount_krw BIGINT,
    extracted_at TIMESTAMPTZ DEFAULT NOW(),
    source_url TEXT,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- 2. Financial Statements Table  
CREATE TABLE IF NOT EXISTS diva_financial_raw (
    id BIGSERIAL PRIMARY KEY,
    company_name TEXT,
    capital BIGINT,
    disclosure_type TEXT,
    accounting_standards TEXT,
    data_type TEXT,
    assets BIGINT,
    net_income BIGINT,
    liabilities BIGINT,
    total_capital BIGINT,
    equity BIGINT,
    extracted_at TIMESTAMPTZ DEFAULT NOW(),
    source_url TEXT,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- 3. Association Status Table
CREATE TABLE IF NOT EXISTS diva_association_raw (
    id BIGSERIAL PRIMARY KEY,
    number TEXT,
    company_name TEXT,
    fund_name TEXT,
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

-- 4. Professional Personnel Table
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

-- 5. Personnel Status Table
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

-- 6. Violations Table  
CREATE TABLE IF NOT EXISTS diva_violation_raw (
    id BIGSERIAL PRIMARY KEY,
    number TEXT,
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
ALTER TABLE diva_professional_raw ENABLE ROW LEVEL SECURITY;
ALTER TABLE diva_personnel_raw ENABLE ROW LEVEL SECURITY;
ALTER TABLE diva_violation_raw ENABLE ROW LEVEL SECURITY;

-- Add RLS policies for authenticated users
CREATE POLICY "Enable all operations for authenticated users" ON diva_investment_performance_raw FOR ALL TO authenticated USING (true) WITH CHECK (true);
CREATE POLICY "Enable all operations for authenticated users" ON diva_financial_raw FOR ALL TO authenticated USING (true) WITH CHECK (true);
CREATE POLICY "Enable all operations for authenticated users" ON diva_association_raw FOR ALL TO authenticated USING (true) WITH CHECK (true);
CREATE POLICY "Enable all operations for authenticated users" ON diva_professional_raw FOR ALL TO authenticated USING (true) WITH CHECK (true);
CREATE POLICY "Enable all operations for authenticated users" ON diva_personnel_raw FOR ALL TO authenticated USING (true) WITH CHECK (true);
CREATE POLICY "Enable all operations for authenticated users" ON diva_violation_raw FOR ALL TO authenticated USING (true) WITH CHECK (true); 