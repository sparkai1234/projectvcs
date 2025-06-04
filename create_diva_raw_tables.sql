-- ================================
-- CREATE RAW DIVA DATA TABLES
-- ================================
-- These tables store the original scraped data from DIVA sources
-- Similar to how vc_table and fund_table store raw scraped data

-- ================================
-- 1. DIVA PERSONNEL RAW
-- ================================
-- Raw personnel data scraped from DIVA (individual records)
CREATE TABLE IF NOT EXISTS diva_personnel_raw (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    
    -- Company identification
    company_id VARCHAR(50) NOT NULL,           -- e.g., "OP20190375"
    company_name VARCHAR(255) NOT NULL,        -- e.g., "경남벤처투자"
    
    -- Personnel numbers (raw scraped data)
    total_personnel INTEGER DEFAULT 0,         -- 전체 인력
    professional_staff INTEGER DEFAULT 0,      -- 전문인력
    investment_review_staff INTEGER DEFAULT 0, -- 심사인력
    management_staff INTEGER DEFAULT 0,        -- 경영지원인력
    
    -- Scraping metadata
    reference_year_month VARCHAR(20),          -- e.g., "2025-04"
    page_number INTEGER,                       -- Page number from scraping
    row_index INTEGER,                         -- Row index on page
    extracted_at TIMESTAMP,                    -- When scraped
    source_url TEXT,                           -- Source URL
    
    -- Standard timestamps
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW(),
    
    -- Link to VC table
    FOREIGN KEY (company_id) REFERENCES vc_table(company_id) ON DELETE SET NULL
);

-- ================================
-- 2. DIVA FUND RAW
-- ================================
-- Raw fund data scraped from DIVA (individual fund records)
CREATE TABLE IF NOT EXISTS diva_fund_raw (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    
    -- Company identification
    company_id VARCHAR(50) NOT NULL,
    company_name VARCHAR(255),
    
    -- Fund information (raw scraped data)
    fund_name VARCHAR(255),                    -- 펀드명
    fund_type VARCHAR(100),                    -- 펀드유형
    establishment_date DATE,                   -- 설립일
    commitment_amount BIGINT,                  -- 약정금액
    fund_status VARCHAR(50),                   -- 펀드상태
    investment_focus TEXT,                     -- 투자분야
    
    -- Scraping metadata
    extracted_at TIMESTAMP,
    source_url TEXT,
    page_number INTEGER,
    
    -- Standard timestamps
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW(),
    
    -- Link to VC table
    FOREIGN KEY (company_id) REFERENCES vc_table(company_id) ON DELETE SET NULL
);

-- ================================
-- 3. DIVA DISCLOSURE RAW
-- ================================
-- Raw disclosure data scraped from DIVA
CREATE TABLE IF NOT EXISTS diva_disclosure_raw (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    
    -- Company identification
    company_id VARCHAR(50) NOT NULL,
    company_name VARCHAR(255),
    
    -- Disclosure information (raw scraped data)
    disclosure_type VARCHAR(100),              -- 공시유형
    investment_scale BIGINT,                   -- 투자규모
    location VARCHAR(255),                     -- 소재지
    business_area TEXT,                        -- 사업영역
    investment_target TEXT,                    -- 투자대상
    
    -- Scraping metadata
    extracted_at TIMESTAMP,
    source_url TEXT,
    
    -- Standard timestamps
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW(),
    
    -- Link to VC table
    FOREIGN KEY (company_id) REFERENCES vc_table(company_id) ON DELETE SET NULL
);

-- ================================
-- 4. DIVA PROFESSIONAL RAW
-- ================================
-- Raw professional staff data scraped from DIVA (individual person records)
CREATE TABLE IF NOT EXISTS diva_professional_raw (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    
    -- Company identification
    company_id VARCHAR(50) NOT NULL,
    company_name VARCHAR(255),
    
    -- Professional information (raw scraped data)
    person_name VARCHAR(255),                  -- 이름
    position VARCHAR(255),                     -- 직책
    department VARCHAR(255),                   -- 부서
    experience_years INTEGER,                  -- 경력년수
    education TEXT,                            -- 학력
    specialization TEXT,                       -- 전문분야
    
    -- Scraping metadata
    extracted_at TIMESTAMP,
    source_url TEXT,
    
    -- Standard timestamps
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW(),
    
    -- Link to VC table
    FOREIGN KEY (company_id) REFERENCES vc_table(company_id) ON DELETE SET NULL
);

-- ================================
-- CREATE INDEXES FOR PERFORMANCE
-- ================================

-- DIVA Personnel Raw indexes
CREATE INDEX IF NOT EXISTS idx_diva_personnel_raw_company_id ON diva_personnel_raw(company_id);
CREATE INDEX IF NOT EXISTS idx_diva_personnel_raw_company_name ON diva_personnel_raw(company_name);
CREATE INDEX IF NOT EXISTS idx_diva_personnel_raw_reference_period ON diva_personnel_raw(reference_year_month);

-- DIVA Fund Raw indexes
CREATE INDEX IF NOT EXISTS idx_diva_fund_raw_company_id ON diva_fund_raw(company_id);
CREATE INDEX IF NOT EXISTS idx_diva_fund_raw_fund_name ON diva_fund_raw(fund_name);

-- DIVA Disclosure Raw indexes
CREATE INDEX IF NOT EXISTS idx_diva_disclosure_raw_company_id ON diva_disclosure_raw(company_id);

-- DIVA Professional Raw indexes
CREATE INDEX IF NOT EXISTS idx_diva_professional_raw_company_id ON diva_professional_raw(company_id);
CREATE INDEX IF NOT EXISTS idx_diva_professional_raw_person_name ON diva_professional_raw(person_name);

-- ================================
-- ADD UNIQUE CONSTRAINTS
-- ================================

-- Prevent duplicate personnel records for same company/period
ALTER TABLE diva_personnel_raw 
ADD CONSTRAINT unique_diva_personnel_company_period 
UNIQUE (company_id, reference_year_month, page_number, row_index);

-- Prevent duplicate fund records
ALTER TABLE diva_fund_raw 
ADD CONSTRAINT unique_diva_fund_company_name 
UNIQUE (company_id, fund_name);

-- Prevent duplicate professional records
ALTER TABLE diva_professional_raw 
ADD CONSTRAINT unique_diva_professional_company_person 
UNIQUE (company_id, person_name, position);

-- ================================
-- ADD COMMENTS FOR DOCUMENTATION
-- ================================

COMMENT ON TABLE diva_personnel_raw IS 'Raw personnel data scraped from DIVA (individual records from personnel table)';
COMMENT ON TABLE diva_fund_raw IS 'Raw fund data scraped from DIVA (individual fund records)';
COMMENT ON TABLE diva_disclosure_raw IS 'Raw disclosure data scraped from DIVA (company disclosure records)';
COMMENT ON TABLE diva_professional_raw IS 'Raw professional staff data scraped from DIVA (individual person records)';

-- ================================
-- VERIFICATION QUERY
-- ================================

-- Show all tables
SELECT 
    schemaname,
    tablename,
    tableowner
FROM pg_tables 
WHERE schemaname = 'public'
AND tablename LIKE '%diva%'
ORDER BY tablename; 