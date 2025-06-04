-- ================================
-- SAFE DIVA Tables Creation Script
-- Only creates tables if they don't exist
-- ================================

-- Enable UUID extension for unique identifiers
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- ================================
-- 1. VC TABLE (if not exists)
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
-- 2. FUND TABLE (if not exists)
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
    updated_at TIMESTAMP DEFAULT NOW()
);

-- ================================
-- 3. DIVA INTELLIGENCE (if not exists)
-- ================================
CREATE TABLE IF NOT EXISTS diva_intelligence (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    company_id VARCHAR(50),
    company_name VARCHAR(255),
    intelligence_data JSONB,
    analysis_results JSONB,
    scrape_date DATE,
    data_quality_score DECIMAL(5,2),
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

-- ================================
-- 4. DIVA PROFESSIONAL NETWORK (if not exists)
-- ================================
CREATE TABLE IF NOT EXISTS diva_professional_network (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    company_id VARCHAR(50),
    company_name VARCHAR(255),
    professional_data JSONB,
    network_analysis JSONB,
    scrape_date DATE,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

-- ================================
-- 5. DIVA FUND INTELLIGENCE (if not exists)
-- ================================
CREATE TABLE IF NOT EXISTS diva_fund_intelligence (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    company_id VARCHAR(50),
    fund_id VARCHAR(50),
    company_name VARCHAR(255),
    fund_intelligence_data JSONB,
    investment_analysis JSONB,
    performance_metrics JSONB,
    scrape_date DATE,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

-- ================================
-- 6. CONTACTS FULL (if not exists)
-- ================================
CREATE TABLE IF NOT EXISTS contacts_full (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    이름 VARCHAR(255),
    name_en VARCHAR(255),
    "회사" VARCHAR(255),
    company_en VARCHAR(255),
    직책 VARCHAR(255),
    position_en VARCHAR(255),
    이메일 VARCHAR(255),
    email VARCHAR(255),
    전화번호 VARCHAR(50),
    phone VARCHAR(50),
    업계 VARCHAR(100),
    industry_en VARCHAR(100),
    is_vc_industry BOOLEAN DEFAULT FALSE,
    fuzzy_match_score DECIMAL(5,2),
    matched_company_id VARCHAR(50),
    contact_source VARCHAR(100),
    notes TEXT,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

-- ================================
-- 7. CONTACTS MATCHED (if not exists)
-- ================================
CREATE TABLE IF NOT EXISTS contacts_matched (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    contact_id UUID,
    company_id VARCHAR(50) NOT NULL,
    이름 VARCHAR(255),
    name_en VARCHAR(255),
    회사 VARCHAR(255),
    company_en VARCHAR(255),
    직책 VARCHAR(255),
    position_en VARCHAR(255),
    이메일 VARCHAR(255),
    email VARCHAR(255),
    전화번호 VARCHAR(50),
    phone VARCHAR(50),
    fuzzy_match_score DECIMAL(5,2),
    match_method VARCHAR(100),
    match_algorithm VARCHAR(50),
    verified BOOLEAN DEFAULT FALSE,
    verification_date TIMESTAMP,
    verified_by VARCHAR(100),
    original_company_text VARCHAR(255),
    normalized_company_text VARCHAR(255),
    match_notes TEXT,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

-- ================================
-- CREATE INDEXES (only if they don't exist)
-- ================================

-- Function to create index if not exists
CREATE OR REPLACE FUNCTION create_index_if_not_exists(index_name text, table_name text, index_definition text)
RETURNS void AS $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = index_name) THEN
        EXECUTE 'CREATE INDEX ' || index_name || ' ON ' || table_name || ' ' || index_definition;
    END IF;
END;
$$ LANGUAGE plpgsql;

-- Create indexes safely
SELECT create_index_if_not_exists('idx_vc_table_company_id', 'vc_table', '(company_id)');
SELECT create_index_if_not_exists('idx_vc_table_company_name', 'vc_table', '(company_name)');
SELECT create_index_if_not_exists('idx_fund_table_company_id', 'fund_table', '(company_id)');
SELECT create_index_if_not_exists('idx_diva_intelligence_company_id', 'diva_intelligence', '(company_id)');
SELECT create_index_if_not_exists('idx_diva_professional_company_id', 'diva_professional_network', '(company_id)');
SELECT create_index_if_not_exists('idx_diva_fund_intelligence_company_id', 'diva_fund_intelligence', '(company_id)');

-- ================================
-- ADD FOREIGN KEYS (only if they don't exist)
-- ================================

-- Function to add foreign key if not exists (FIXED VERSION)
CREATE OR REPLACE FUNCTION add_foreign_key_if_not_exists(
    p_table_name text, 
    p_constraint_name text, 
    p_foreign_key_definition text
)
RETURNS void AS $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM information_schema.table_constraints tc
        WHERE tc.constraint_name = p_constraint_name AND tc.table_name = p_table_name
    ) THEN
        EXECUTE 'ALTER TABLE ' || p_table_name || ' ADD CONSTRAINT ' || p_constraint_name || ' ' || p_foreign_key_definition;
    END IF;
END;
$$ LANGUAGE plpgsql;

-- Add foreign keys safely
SELECT add_foreign_key_if_not_exists(
    'fund_table', 
    'fk_fund_table_company_id', 
    'FOREIGN KEY (company_id) REFERENCES vc_table(company_id)'
);

SELECT add_foreign_key_if_not_exists(
    'diva_intelligence', 
    'fk_diva_intelligence_company_id', 
    'FOREIGN KEY (company_id) REFERENCES vc_table(company_id) ON DELETE SET NULL'
);

SELECT add_foreign_key_if_not_exists(
    'diva_professional_network', 
    'fk_diva_professional_company_id', 
    'FOREIGN KEY (company_id) REFERENCES vc_table(company_id) ON DELETE SET NULL'
);

SELECT add_foreign_key_if_not_exists(
    'diva_fund_intelligence', 
    'fk_diva_fund_intelligence_company_id', 
    'FOREIGN KEY (company_id) REFERENCES vc_table(company_id) ON DELETE SET NULL'
);

SELECT add_foreign_key_if_not_exists(
    'contacts_full', 
    'fk_contacts_full_matched_company', 
    'FOREIGN KEY (matched_company_id) REFERENCES vc_table(company_id) ON DELETE SET NULL'
);

SELECT add_foreign_key_if_not_exists(
    'contacts_matched', 
    'fk_contacts_matched_contact_id', 
    'FOREIGN KEY (contact_id) REFERENCES contacts_full(id) ON DELETE SET NULL'
);

SELECT add_foreign_key_if_not_exists(
    'contacts_matched', 
    'fk_contacts_matched_company_id', 
    'FOREIGN KEY (company_id) REFERENCES vc_table(company_id)'
);

-- ================================
-- DISABLE RLS FOR SERVICE ROLE (IMPORTANT!)
-- ================================

-- Disable RLS or create permissive policies
ALTER TABLE vc_table ENABLE ROW LEVEL SECURITY;
ALTER TABLE fund_table ENABLE ROW LEVEL SECURITY;
ALTER TABLE diva_intelligence ENABLE ROW LEVEL SECURITY;
ALTER TABLE diva_professional_network ENABLE ROW LEVEL SECURITY;
ALTER TABLE diva_fund_intelligence ENABLE ROW LEVEL SECURITY;
ALTER TABLE contacts_full ENABLE ROW LEVEL SECURITY;
ALTER TABLE contacts_matched ENABLE ROW LEVEL SECURITY;

-- Create policies that allow service role to do everything
DO $$
BEGIN
    -- Drop existing policies if they exist and recreate
    DROP POLICY IF EXISTS "service_role_all_access" ON vc_table;
    CREATE POLICY "service_role_all_access" ON vc_table FOR ALL 
    USING (current_setting('request.jwt.claims', true)::json->>'role' = 'service_role');

    DROP POLICY IF EXISTS "service_role_all_access" ON fund_table;
    CREATE POLICY "service_role_all_access" ON fund_table FOR ALL 
    USING (current_setting('request.jwt.claims', true)::json->>'role' = 'service_role');

    DROP POLICY IF EXISTS "service_role_all_access" ON diva_intelligence;
    CREATE POLICY "service_role_all_access" ON diva_intelligence FOR ALL 
    USING (current_setting('request.jwt.claims', true)::json->>'role' = 'service_role');

    DROP POLICY IF EXISTS "service_role_all_access" ON diva_professional_network;
    CREATE POLICY "service_role_all_access" ON diva_professional_network FOR ALL 
    USING (current_setting('request.jwt.claims', true)::json->>'role' = 'service_role');

    DROP POLICY IF EXISTS "service_role_all_access" ON diva_fund_intelligence;
    CREATE POLICY "service_role_all_access" ON diva_fund_intelligence FOR ALL 
    USING (current_setting('request.jwt.claims', true)::json->>'role' = 'service_role');

    DROP POLICY IF EXISTS "service_role_all_access" ON contacts_full;
    CREATE POLICY "service_role_all_access" ON contacts_full FOR ALL 
    USING (current_setting('request.jwt.claims', true)::json->>'role' = 'service_role');

    DROP POLICY IF EXISTS "service_role_all_access" ON contacts_matched;
    CREATE POLICY "service_role_all_access" ON contacts_matched FOR ALL 
    USING (current_setting('request.jwt.claims', true)::json->>'role' = 'service_role');
END $$;

-- Clean up helper functions
DROP FUNCTION IF EXISTS create_index_if_not_exists(text, text, text);
DROP FUNCTION IF EXISTS add_foreign_key_if_not_exists(text, text, text);

-- ================================
-- VERIFICATION QUERY
-- ================================
SELECT 
    schemaname,
    tablename,
    tableowner
FROM pg_tables 
WHERE schemaname = 'public' 
AND tablename IN ('vc_table', 'fund_table', 'diva_intelligence', 'diva_professional_network', 'diva_fund_intelligence', 'contacts_full', 'contacts_matched')
ORDER BY tablename; 