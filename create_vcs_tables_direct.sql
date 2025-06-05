-- ================================
-- VCS Scraper Database Tables
-- Run this directly in Supabase SQL Editor
-- ================================

-- Enable UUID extension
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- ================================
-- 1. VC TABLE (from VCS scraper)
-- ================================
CREATE TABLE IF NOT EXISTS vc_table (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    company_id VARCHAR(50) UNIQUE NOT NULL,
    company_name VARCHAR(255) NOT NULL,
    company_name_en VARCHAR(255),
    location VARCHAR(255),
    representative VARCHAR(255),
    established_date DATE,
    company_type VARCHAR(100),
    website_url VARCHAR(500),
    contact_info JSONB,
    disclosure_data JSONB,
    apify_source VARCHAR(100),
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

-- ================================
-- 2. FUND TABLE (from VCS scraper)
-- ================================
CREATE TABLE IF NOT EXISTS fund_table (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    company_id VARCHAR(50) NOT NULL,
    fund_name VARCHAR(255) NOT NULL,
    fund_name_en VARCHAR(255),
    fund_type VARCHAR(100),
    commitment_amount BIGINT,
    fund_size BIGINT,
    establishment_date DATE,
    fund_status VARCHAR(50),
    representative VARCHAR(255),
    investment_focus TEXT[],
    fund_details JSONB,
    apify_source VARCHAR(100),
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW(),
    
    -- Foreign key relationship
    FOREIGN KEY (company_id) REFERENCES vc_table(company_id)
);

-- ================================
-- INDEXES for Performance
-- ================================
CREATE INDEX IF NOT EXISTS idx_vc_table_company_id ON vc_table(company_id);
CREATE INDEX IF NOT EXISTS idx_vc_table_company_name ON vc_table(company_name);
CREATE INDEX IF NOT EXISTS idx_fund_table_company_id ON fund_table(company_id);
CREATE INDEX IF NOT EXISTS idx_fund_table_fund_name ON fund_table(fund_name);

-- ================================
-- ROW LEVEL SECURITY POLICIES
-- ================================
ALTER TABLE vc_table ENABLE ROW LEVEL SECURITY;
ALTER TABLE fund_table ENABLE ROW LEVEL SECURITY;

-- Allow service_role to access everything
CREATE POLICY "Allow service_role access" ON vc_table FOR ALL USING (auth.jwt() ->> 'role' = 'service_role');
CREATE POLICY "Allow service_role access" ON fund_table FOR ALL USING (auth.jwt() ->> 'role' = 'service_role');

-- ================================
-- VERIFICATION
-- ================================
-- Check if tables were created successfully
SELECT 
    schemaname,
    tablename,
    tableowner
FROM pg_tables 
WHERE schemaname = 'public' 
AND tablename IN ('vc_table', 'fund_table')
ORDER BY tablename; 