-- ================================
-- DIVA Intelligence System Database Schema
-- Mirrors Airtable Base: appdR8V9lJaRW8VkR
-- ================================

-- Enable UUID extension for unique identifiers
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- ================================
-- 1. VC TABLE (from Apify scrapers)
-- ================================
CREATE TABLE vc_table (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    company_id VARCHAR(50) UNIQUE NOT NULL,     -- Primary identifier
    company_name VARCHAR(255) NOT NULL,         -- Korean company names
    company_name_en VARCHAR(255),               -- English names if available
    location VARCHAR(255),
    representative VARCHAR(255),
    established_date DATE,
    company_type VARCHAR(100),
    website_url VARCHAR(500),
    contact_info JSONB,                         -- Phone, email, address
    disclosure_data JSONB,                      -- Raw disclosure information
    apify_source VARCHAR(100),                  -- Source tracking
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

-- ================================
-- 2. FUND TABLE (from Apify scrapers)  
-- ================================
CREATE TABLE fund_table (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    company_id VARCHAR(50) NOT NULL,            -- Links to VC Table
    fund_name VARCHAR(255) NOT NULL,
    fund_name_en VARCHAR(255),
    fund_type VARCHAR(100),
    commitment_amount BIGINT,                   -- Amount in KRW
    fund_size BIGINT,
    establishment_date DATE,
    fund_status VARCHAR(50),
    representative VARCHAR(255),
    investment_focus TEXT[],                    -- Array of focus areas
    fund_details JSONB,                         -- Additional fund information
    apify_source VARCHAR(100),                  -- Source tracking
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW(),
    
    -- Foreign key relationship
    FOREIGN KEY (company_id) REFERENCES vc_table(company_id)
);

-- ================================
-- 3. DIVA INTELLIGENCE (custom scraper)
-- ================================
CREATE TABLE diva_intelligence (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    company_id VARCHAR(50),                     -- Links to VC Table
    company_name VARCHAR(255),
    intelligence_data JSONB,                    -- Raw DIVA scraped data
    analysis_results JSONB,                     -- Processed analysis
    scrape_date DATE,
    data_quality_score DECIMAL(5,2),
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW(),
    
    -- Foreign key relationship (optional, as some data might not link)
    FOREIGN KEY (company_id) REFERENCES vc_table(company_id) ON DELETE SET NULL
);

-- ================================
-- 4. DIVA PROFESSIONAL NETWORK (custom scraper)
-- ================================
CREATE TABLE diva_professional_network (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    company_id VARCHAR(50),                     -- Links to VC Table
    company_name VARCHAR(255),
    professional_data JSONB,                    -- Professional network data
    network_analysis JSONB,                     -- Network analysis results
    scrape_date DATE,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW(),
    
    FOREIGN KEY (company_id) REFERENCES vc_table(company_id) ON DELETE SET NULL
);

-- ================================
-- 5. DIVA FUND INTELLIGENCE (custom scraper)
-- ================================
CREATE TABLE diva_fund_intelligence (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    company_id VARCHAR(50),                     -- Links to VC Table
    fund_id VARCHAR(50),                        -- Could link to Fund Table
    company_name VARCHAR(255),
    fund_intelligence_data JSONB,               -- Fund intelligence data
    investment_analysis JSONB,                  -- Investment analysis
    performance_metrics JSONB,                  -- Performance data
    scrape_date DATE,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW(),
    
    FOREIGN KEY (company_id) REFERENCES vc_table(company_id) ON DELETE SET NULL
);

-- ================================
-- 6. CONTACTS FULL (all contacts)
-- ================================
CREATE TABLE contacts_full (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    이름 VARCHAR(255),                          -- Korean name field
    name_en VARCHAR(255),                       -- English name
    "회사" VARCHAR(255),                        -- Korean company field (for fuzzy matching)
    company_en VARCHAR(255),                    -- English company name
    직책 VARCHAR(255),                          -- Korean position field
    position_en VARCHAR(255),                   -- English position
    이메일 VARCHAR(255),                        -- Korean email field
    email VARCHAR(255),                         -- Standard email field
    전화번호 VARCHAR(50),                       -- Korean phone field
    phone VARCHAR(50),                          -- Standard phone field
    업계 VARCHAR(100),                          -- Industry (Korean)
    industry_en VARCHAR(100),                   -- Industry (English)
    is_vc_industry BOOLEAN DEFAULT FALSE,       -- Flag for VC industry
    fuzzy_match_score DECIMAL(5,2),            -- Fuzzy matching score to VC companies
    matched_company_id VARCHAR(50),             -- If matched to VC company
    contact_source VARCHAR(100),                -- Source of contact
    notes TEXT,                                 -- Additional notes
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW(),
    
    -- Optional foreign key for matched contacts
    FOREIGN KEY (matched_company_id) REFERENCES vc_table(company_id) ON DELETE SET NULL
);

-- ================================
-- 7. CONTACTS MATCHED (85% fuzzy matched VC contacts)
-- Updated for proper fuzzy matching workflow
-- ================================
CREATE TABLE contacts_matched (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    contact_id UUID,                            -- Links to Contacts Full (will be populated during fuzzy matching)
    company_id VARCHAR(50) NOT NULL,            -- Links to VC Table
    
    -- Contact information (duplicated for easy access)
    이름 VARCHAR(255),                          -- Korean name
    name_en VARCHAR(255),                       -- English name  
    회사 VARCHAR(255),                          -- Korean company (matched)
    company_en VARCHAR(255),                    -- English company name
    직책 VARCHAR(255),                          -- Korean position
    position_en VARCHAR(255),                   -- English position
    이메일 VARCHAR(255),                        -- Korean email
    email VARCHAR(255),                         -- English email
    전화번호 VARCHAR(50),                       -- Korean phone
    phone VARCHAR(50),                          -- English phone
    
    -- Fuzzy matching metadata
    fuzzy_match_score DECIMAL(5,2),            -- Matching confidence score (0-100)
    match_method VARCHAR(100),                  -- How the match was made
    match_algorithm VARCHAR(50),                -- Algorithm used (e.g., 'fuzzy_wuzzy', 'levenshtein')
    verified BOOLEAN DEFAULT FALSE,             -- Manual verification flag
    verification_date TIMESTAMP,               -- When verified
    verified_by VARCHAR(100),                   -- Who verified
    
    -- Additional matching context
    original_company_text VARCHAR(255),         -- Original company text from contact
    normalized_company_text VARCHAR(255),       -- Normalized for matching
    match_notes TEXT,                           -- Notes about the match
    
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW(),
    
    -- Foreign key relationships
    FOREIGN KEY (contact_id) REFERENCES contacts_full(id) ON DELETE SET NULL,
    FOREIGN KEY (company_id) REFERENCES vc_table(company_id)
);

-- ================================
-- INDEXES for Performance
-- ================================

-- VC Table indexes
CREATE INDEX idx_vc_table_company_id ON vc_table(company_id);
CREATE INDEX idx_vc_table_company_name ON vc_table(company_name);
CREATE INDEX idx_vc_table_company_name_gin ON vc_table USING gin(to_tsvector('english', company_name));

-- Fund Table indexes
CREATE INDEX idx_fund_table_company_id ON fund_table(company_id);
CREATE INDEX idx_fund_table_fund_name ON fund_table(fund_name);

-- DIVA tables indexes
CREATE INDEX idx_diva_intelligence_company_id ON diva_intelligence(company_id);
CREATE INDEX idx_diva_professional_company_id ON diva_professional_network(company_id);
CREATE INDEX idx_diva_fund_intelligence_company_id ON diva_fund_intelligence(company_id);

-- Contacts indexes
CREATE INDEX idx_contacts_full_company ON contacts_full("회사");
CREATE INDEX idx_contacts_full_name ON contacts_full(이름);
CREATE INDEX idx_contacts_full_matched_company ON contacts_full(matched_company_id);
CREATE INDEX idx_contacts_matched_company_id ON contacts_matched(company_id);
CREATE INDEX idx_contacts_matched_contact_id ON contacts_matched(contact_id);

-- Full-text search indexes for text search (using English config which supports Unicode)
CREATE INDEX idx_contacts_full_company_gin ON contacts_full USING gin(to_tsvector('english', "회사"));
CREATE INDEX idx_contacts_full_name_gin ON contacts_full USING gin(to_tsvector('english', 이름));

-- ================================
-- ROW LEVEL SECURITY (Optional)
-- ================================

-- Enable RLS on all tables for security
ALTER TABLE vc_table ENABLE ROW LEVEL SECURITY;
ALTER TABLE fund_table ENABLE ROW LEVEL SECURITY;
ALTER TABLE diva_intelligence ENABLE ROW LEVEL SECURITY;
ALTER TABLE diva_professional_network ENABLE ROW LEVEL SECURITY;
ALTER TABLE diva_fund_intelligence ENABLE ROW LEVEL SECURITY;
ALTER TABLE contacts_full ENABLE ROW LEVEL SECURITY;
ALTER TABLE contacts_matched ENABLE ROW LEVEL SECURITY;

-- Basic policy: Allow all operations for authenticated users
-- (You can customize this based on your needs)
CREATE POLICY "Allow all for authenticated users" ON vc_table FOR ALL USING (auth.role() = 'authenticated');
CREATE POLICY "Allow all for authenticated users" ON fund_table FOR ALL USING (auth.role() = 'authenticated');
CREATE POLICY "Allow all for authenticated users" ON diva_intelligence FOR ALL USING (auth.role() = 'authenticated');
CREATE POLICY "Allow all for authenticated users" ON diva_professional_network FOR ALL USING (auth.role() = 'authenticated');
CREATE POLICY "Allow all for authenticated users" ON diva_fund_intelligence FOR ALL USING (auth.role() = 'authenticated');
CREATE POLICY "Allow all for authenticated users" ON contacts_full FOR ALL USING (auth.role() = 'authenticated');
CREATE POLICY "Allow all for authenticated users" ON contacts_matched FOR ALL USING (auth.role() = 'authenticated');

-- ================================
-- VIEWS for Easy Querying
-- ================================

-- Combined Company View (for "Tell me about Company X" queries)
CREATE VIEW company_full_view AS
SELECT 
    vc.company_id,
    vc.company_name,
    vc.company_name_en,
    vc.location,
    vc.representative,
    vc.established_date,
    vc.company_type,
    vc.website_url,
    vc.contact_info,
    -- Fund information
    json_agg(DISTINCT jsonb_build_object(
        'fund_name', f.fund_name,
        'fund_type', f.fund_type,
        'commitment_amount', f.commitment_amount,
        'establishment_date', f.establishment_date,
        'fund_status', f.fund_status
    )) FILTER (WHERE f.id IS NOT NULL) as funds,
    -- DIVA Intelligence
    di.intelligence_data,
    di.analysis_results,
    -- Professional Network
    dpn.professional_data,
    dpn.network_analysis,
    -- Fund Intelligence
    dfi.fund_intelligence_data,
    dfi.investment_analysis,
    dfi.performance_metrics,
    -- Contact count
    COUNT(DISTINCT cm.id) as contact_count
FROM vc_table vc
LEFT JOIN fund_table f ON vc.company_id = f.company_id
LEFT JOIN diva_intelligence di ON vc.company_id = di.company_id
LEFT JOIN diva_professional_network dpn ON vc.company_id = dpn.company_id
LEFT JOIN diva_fund_intelligence dfi ON vc.company_id = dfi.company_id
LEFT JOIN contacts_matched cm ON vc.company_id = cm.company_id
GROUP BY vc.company_id, vc.company_name, vc.company_name_en, vc.location, 
         vc.representative, vc.established_date, vc.company_type, vc.website_url, 
         vc.contact_info, di.intelligence_data, di.analysis_results,
         dpn.professional_data, dpn.network_analysis, dfi.fund_intelligence_data,
         dfi.investment_analysis, dfi.performance_metrics;

-- Person Full View (for "Tell me about Person X" queries)
CREATE VIEW person_full_view AS
SELECT 
    cf.이름 as person_name,
    cf.name_en,
    cf."회사" as company_name_korean,
    cf.company_en,
    cf.직책 as position_korean,
    cf.position_en,
    cf.이메일 as email_korean,
    cf.email,
    cf.전화번호 as phone_korean,
    cf.phone,
    cf.업계 as industry_korean,
    cf.industry_en,
    -- Company information if matched
    vc.company_name as matched_vc_company,
    vc.location as company_location,
    vc.representative as company_representative,
    vc.website_url,
    -- Matching information
    cm.fuzzy_match_score,
    cm.match_method,
    cm.verified as match_verified
FROM contacts_full cf
LEFT JOIN contacts_matched cm ON cf.id = cm.contact_id
LEFT JOIN vc_table vc ON cm.company_id = vc.company_id;

-- Add comments for documentation
COMMENT ON TABLE vc_table IS 'VC companies data from Apify scrapers';
COMMENT ON TABLE fund_table IS 'Fund data linked to VC companies from Apify scrapers';
COMMENT ON TABLE diva_intelligence IS 'DIVA intelligence data from custom scrapers';
COMMENT ON TABLE diva_professional_network IS 'Professional network data from DIVA scrapers';
COMMENT ON TABLE diva_fund_intelligence IS 'Fund intelligence data from DIVA scrapers';
COMMENT ON TABLE contacts_full IS 'Complete contact database (VC and non-VC)';
COMMENT ON TABLE contacts_matched IS '85% fuzzy matched VC industry contacts';

COMMENT ON VIEW company_full_view IS 'Complete company information for OpenAI queries';
COMMENT ON VIEW person_full_view IS 'Complete person information for OpenAI queries'; 