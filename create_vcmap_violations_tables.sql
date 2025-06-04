-- 🗺️ DIVA VC MAP & ⚖️ VIOLATIONS TABLES
-- ==============================================
-- Creates tables for VC competitive intelligence and risk assessment
-- 
-- VC MAP: Rankings, investment patterns, competitive positioning
-- VIOLATIONS: Regulatory compliance, risk factors, due diligence data
-- 
-- 🔗 INTEGRATES WITH: Existing vc_table (vcs.go.kr) company identification system

-- 🗺️ VC MAP DATA TABLE
CREATE TABLE IF NOT EXISTS diva_vcmap_raw (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    
    -- Company identification (aligned with existing vc_table)
    company_name VARCHAR(200) NOT NULL,     -- Links to vc_table.company_name
    company_id VARCHAR(100),                -- Links to vc_table company identifier  
    ranking INTEGER,
    
    -- Map configuration
    map_type VARCHAR(50) NOT NULL,          -- 인력현황, 투자금액, 업종별투자패턴 etc.
    sort_criteria VARCHAR(50) NOT NULL,     -- 인력총수, 전문인력수 etc.
    
    -- Personnel data
    total_personnel INTEGER,
    professional_personnel INTEGER,
    
    -- Investment data
    total_investment_amount BIGINT,         -- in Korean Won
    fund_count INTEGER,
    portfolio_companies_count INTEGER,
    investment_ratio DECIMAL(5,2),          -- percentage
    
    -- Dates
    establishment_date DATE,
    registration_date DATE,
    
    -- Geographic data
    headquarters_region VARCHAR(100),
    investment_regions JSONB,               -- ["서울", "경기", "부산"]
    
    -- Investment patterns
    industry_focus VARCHAR(100),            -- 주요 투자 업종
    investment_stage_focus VARCHAR(100),    -- 투자 단계 선호
    target_company_age VARCHAR(50),         -- 선호 피투자회사 업력
    
    -- Scraping metadata
    extracted_at TIMESTAMP NOT NULL,
    source_url TEXT,
    data_source VARCHAR(50) DEFAULT 'diva_vcmap',
    
    -- Tracking
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW(),
    
    -- Constraints (company_name as primary identifier, consistent with vc_table)
    UNIQUE(company_name, map_type, sort_criteria)
);

-- 🗺️ VC MAP INDEXES
CREATE INDEX IF NOT EXISTS idx_vcmap_company_name ON diva_vcmap_raw(company_name);
CREATE INDEX IF NOT EXISTS idx_vcmap_company_id ON diva_vcmap_raw(company_id);
CREATE INDEX IF NOT EXISTS idx_vcmap_ranking ON diva_vcmap_raw(ranking);
CREATE INDEX IF NOT EXISTS idx_vcmap_map_type ON diva_vcmap_raw(map_type);
CREATE INDEX IF NOT EXISTS idx_vcmap_personnel ON diva_vcmap_raw(total_personnel DESC);
CREATE INDEX IF NOT EXISTS idx_vcmap_investment ON diva_vcmap_raw(total_investment_amount DESC);
CREATE INDEX IF NOT EXISTS idx_vcmap_extracted ON diva_vcmap_raw(extracted_at);

-- 🗺️ VC MAP COMMENTS
COMMENT ON TABLE diva_vcmap_raw IS 'DIVA VC MAP data - competitive rankings and investment patterns';
COMMENT ON COLUMN diva_vcmap_raw.company_name IS 'Company name - links to vc_table.company_name';
COMMENT ON COLUMN diva_vcmap_raw.company_id IS 'Company ID - consistent with vc_table identification system';
COMMENT ON COLUMN diva_vcmap_raw.map_type IS 'Type of VC map view (personnel, investment, patterns)';
COMMENT ON COLUMN diva_vcmap_raw.ranking IS 'Company ranking in this map type/sort criteria';
COMMENT ON COLUMN diva_vcmap_raw.total_investment_amount IS 'Total investment amount in Korean Won';
COMMENT ON COLUMN diva_vcmap_raw.investment_ratio IS 'Investment concentration ratio (percentage)';

-- ⚖️ VIOLATIONS DATA TABLE
CREATE TABLE IF NOT EXISTS diva_violation_raw (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    
    -- Company identification (aligned with existing vc_table)
    company_name VARCHAR(200) NOT NULL,     -- Links to vc_table.company_name
    company_id VARCHAR(100),                -- Links to vc_table company identifier
    violation_number INTEGER,
    
    -- Violation details
    violation_date DATE,
    violation_type VARCHAR(100),            -- Normalized English type
    violation_category VARCHAR(100),        -- 점검구분 (inspection category)
    violation_details TEXT,                 -- Full Korean description
    violation_severity VARCHAR(20),         -- High, Medium, Low
    
    -- Legal/regulatory information
    relevant_law VARCHAR(200),              -- 관련 법률
    regulation_article VARCHAR(100),        -- 관련 조항
    
    -- Actions and penalties
    action_date DATE,
    action_scheduled_date DATE,
    action_type VARCHAR(100),               -- 조치구분 (action type)
    penalty_type VARCHAR(100),              -- Normalized penalty type
    penalty_amount BIGINT,                  -- Penalty amount if any
    penalty_currency CHAR(3) DEFAULT 'KRW',
    
    -- Resolution tracking
    correction_complete_date DATE,
    resolution_status VARCHAR(20),          -- Completed, In Progress, Overdue, Pending
    resolution_details TEXT,
    
    -- Impact assessment
    business_impact VARCHAR(20),            -- Severe, High, Medium, Low
    reputational_impact VARCHAR(20),        -- Severe, High, Medium, Low
    
    -- Search context
    search_inspection_type VARCHAR(50),     -- Filter used during scraping
    search_violation_type VARCHAR(100),     -- Filter used during scraping
    
    -- Scraping metadata
    extracted_at TIMESTAMP NOT NULL,
    source_url TEXT,
    data_source VARCHAR(50) DEFAULT 'diva_violations',
    
    -- Tracking
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW(),
    
    -- Constraints (company_name as primary identifier, consistent with vc_table)
    UNIQUE(company_name, violation_date, violation_type)
);

-- ⚖️ VIOLATIONS INDEXES
CREATE INDEX IF NOT EXISTS idx_violations_company_name ON diva_violation_raw(company_name);
CREATE INDEX IF NOT EXISTS idx_violations_company_id ON diva_violation_raw(company_id);
CREATE INDEX IF NOT EXISTS idx_violations_date ON diva_violation_raw(violation_date DESC);
CREATE INDEX IF NOT EXISTS idx_violations_type ON diva_violation_raw(violation_type);
CREATE INDEX IF NOT EXISTS idx_violations_severity ON diva_violation_raw(violation_severity);
CREATE INDEX IF NOT EXISTS idx_violations_status ON diva_violation_raw(resolution_status);
CREATE INDEX IF NOT EXISTS idx_violations_business_impact ON diva_violation_raw(business_impact);
CREATE INDEX IF NOT EXISTS idx_violations_extracted ON diva_violation_raw(extracted_at);
CREATE INDEX IF NOT EXISTS idx_violations_penalty_amount ON diva_violation_raw(penalty_amount DESC);

-- ⚖️ VIOLATIONS COMMENTS
COMMENT ON TABLE diva_violation_raw IS 'DIVA violations data - regulatory compliance and risk assessment';
COMMENT ON COLUMN diva_violation_raw.company_name IS 'Company name - links to vc_table.company_name';
COMMENT ON COLUMN diva_violation_raw.company_id IS 'Company ID - consistent with vc_table identification system';
COMMENT ON COLUMN diva_violation_raw.violation_type IS 'Normalized English violation type';
COMMENT ON COLUMN diva_violation_raw.violation_severity IS 'Risk assessment: High/Medium/Low';
COMMENT ON COLUMN diva_violation_raw.penalty_amount IS 'Financial penalty in Korean Won';
COMMENT ON COLUMN diva_violation_raw.business_impact IS 'Business impact assessment';
COMMENT ON COLUMN diva_violation_raw.reputational_impact IS 'Reputational damage assessment';

-- 🔗 FOREIGN KEY RELATIONSHIPS (to existing vc_table)
-- Link VC MAP data to main vc_table using company_name
ALTER TABLE diva_vcmap_raw 
ADD CONSTRAINT fk_vcmap_company 
FOREIGN KEY (company_name) 
REFERENCES vc_table(company_name)
ON DELETE CASCADE;

-- Link violations data to main vc_table using company_name
ALTER TABLE diva_violation_raw 
ADD CONSTRAINT fk_violations_company 
FOREIGN KEY (company_name) 
REFERENCES vc_table(company_name)
ON DELETE CASCADE;

-- 📊 CREATE SUMMARY VIEWS

-- VC Competitive Intelligence View (integrated with existing vc_table)
CREATE OR REPLACE VIEW vc_competitive_intelligence AS
SELECT 
    v.company_name,
    v.company_id,
    v.region,                               -- From original vc_table
    v.vc_type,                              -- From original vc_table
    v.ceo_name,                             -- From original vc_table
    
    -- Personnel metrics from VC MAP
    MAX(CASE WHEN vm.map_type = '인력현황' THEN vm.total_personnel END) as total_personnel,
    MAX(CASE WHEN vm.map_type = '인력현황' THEN vm.professional_personnel END) as professional_personnel,
    MAX(CASE WHEN vm.map_type = '인력현황' THEN vm.ranking END) as personnel_ranking,
    
    -- Investment metrics from VC MAP
    MAX(CASE WHEN vm.map_type = '투자금액' THEN vm.total_investment_amount END) as total_investment_amount,
    MAX(CASE WHEN vm.map_type = '투자금액' THEN vm.portfolio_companies_count END) as portfolio_count,
    MAX(CASE WHEN vm.map_type = '투자금액' THEN vm.ranking END) as investment_ranking,
    
    -- Industry focus from VC MAP
    MAX(CASE WHEN vm.map_type = '업종별투자패턴' THEN vm.industry_focus END) as primary_industry_focus,
    MAX(CASE WHEN vm.map_type = '업종별투자패턴' THEN vm.investment_ratio END) as industry_concentration,
    
    -- Risk metrics from violations
    COUNT(viol.id) as total_violations,
    COUNT(CASE WHEN viol.violation_severity = 'High' THEN 1 END) as high_severity_violations,
    COUNT(CASE WHEN viol.violation_date >= CURRENT_DATE - INTERVAL '2 years' THEN 1 END) as recent_violations,
    MAX(viol.violation_date) as latest_violation_date,
    
    -- Risk score (lower is better)
    CASE 
        WHEN COUNT(CASE WHEN viol.violation_severity = 'High' THEN 1 END) > 0 THEN 'High Risk'
        WHEN COUNT(CASE WHEN viol.violation_date >= CURRENT_DATE - INTERVAL '1 year' THEN 1 END) > 2 THEN 'Medium Risk'
        WHEN COUNT(viol.id) > 0 THEN 'Low Risk'
        ELSE 'No Violations'
    END as risk_assessment,
    
    -- Dates
    MAX(vm.extracted_at) as vcmap_last_updated,
    MAX(viol.extracted_at) as violations_last_updated,
    v.updated_at as vc_table_last_updated
    
FROM vc_table v
LEFT JOIN diva_vcmap_raw vm ON v.company_name = vm.company_name
LEFT JOIN diva_violation_raw viol ON v.company_name = viol.company_name
GROUP BY v.company_name, v.company_id, v.region, v.vc_type, v.ceo_name, v.updated_at;

-- Risk Dashboard View  
CREATE OR REPLACE VIEW vc_risk_dashboard AS
SELECT 
    viol.company_name,
    viol.company_id,
    v.region,                               -- From original vc_table
    v.vc_type,                              -- From original vc_table
    viol.violation_type,
    viol.violation_date,
    viol.violation_severity,
    viol.business_impact,
    viol.reputational_impact,
    viol.penalty_amount,
    viol.resolution_status,
    viol.action_type,
    
    -- Days since violation
    CURRENT_DATE - viol.violation_date as days_since_violation,
    
    -- Risk flags
    CASE WHEN viol.violation_severity = 'High' THEN true ELSE false END as high_risk_flag,
    CASE WHEN viol.penalty_amount > 10000000 THEN true ELSE false END as major_penalty_flag, -- 10M KRW
    CASE WHEN viol.resolution_status = 'Overdue' THEN true ELSE false END as overdue_flag,
    
    viol.extracted_at
FROM diva_violation_raw viol
LEFT JOIN vc_table v ON viol.company_name = v.company_name
WHERE viol.violation_date >= CURRENT_DATE - INTERVAL '3 years'  -- Last 3 years only
ORDER BY viol.violation_date DESC, viol.violation_severity DESC;

-- 🚀 GRANT PERMISSIONS
GRANT SELECT, INSERT, UPDATE, DELETE ON diva_vcmap_raw TO authenticated;
GRANT SELECT, INSERT, UPDATE, DELETE ON diva_violation_raw TO authenticated;
GRANT SELECT ON vc_competitive_intelligence TO authenticated;
GRANT SELECT ON vc_risk_dashboard TO authenticated;

-- ✅ TABLE CREATION COMPLETE
SELECT 'VC MAP and Violations tables created successfully with vc_table integration!' as status; 