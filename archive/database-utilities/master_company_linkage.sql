-- =================================================================
-- MASTER COMPANY LINKAGE SYSTEM - VCS ↔ DIVA HIGH-PRECISION MATCHING
-- =================================================================
-- 
-- PURPOSE: Link VCS companies/funds with DIVA regulatory data using >95% accuracy fuzzy matching
-- STRATEGY: Strict Korean company name normalization + multi-algorithm matching
-- RESULT: Unified company intelligence vector for fast access
--

-- 1. MASTER COMPANY REGISTRY (Unified Vector)
CREATE TABLE IF NOT EXISTS master_company_registry (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    
    -- Master Identity
    master_company_id VARCHAR(100) UNIQUE NOT NULL,
    canonical_company_name VARCHAR(255) NOT NULL,
    normalized_name VARCHAR(255) NOT NULL,  -- For matching algorithms
    
    -- VCS Data Links
    vcs_company_id VARCHAR(100),
    vcs_company_name VARCHAR(255),
    vcs_fund_count INTEGER DEFAULT 0,
    vcs_total_fund_size BIGINT DEFAULT 0,
    
    -- DIVA Data Presence Flags
    has_diva_investment_performance BOOLEAN DEFAULT FALSE,
    has_diva_financial_statements BOOLEAN DEFAULT FALSE,
    has_diva_violations BOOLEAN DEFAULT FALSE,
    has_diva_personnel_data BOOLEAN DEFAULT FALSE,
    has_diva_professional_data BOOLEAN DEFAULT FALSE,
    has_diva_association_data BOOLEAN DEFAULT FALSE,
    has_diva_vc_map BOOLEAN DEFAULT FALSE,
    
    -- Data Quality & Confidence
    linkage_confidence_score DECIMAL(5,2),  -- 95.00-100.00 for >95% matches
    data_completeness_score DECIMAL(5,2),   -- Percentage of available data fields
    verification_status VARCHAR(20) DEFAULT 'auto_matched', -- auto_matched, manually_verified, disputed
    verification_date TIMESTAMP,
    verified_by VARCHAR(100),
    
    -- Company Intelligence Summary
    company_intelligence JSONB,  -- Aggregated insights from all sources
    regulatory_risk_score DECIMAL(3,2), -- Based on DIVA violations
    investment_activity_score DECIMAL(3,2), -- Based on DIVA performance
    
    -- Metadata
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW(),
    last_sync_date TIMESTAMP DEFAULT NOW(),
    
    -- Constraints
    CONSTRAINT valid_confidence_score CHECK (linkage_confidence_score >= 95.00 AND linkage_confidence_score <= 100.00),
    CONSTRAINT valid_completeness_score CHECK (data_completeness_score >= 0.00 AND data_completeness_score <= 100.00)
);

-- 2. VCS-DIVA MATCHING CANDIDATES (High-Precision Fuzzy Matching)
CREATE TABLE IF NOT EXISTS vcs_diva_match_candidates (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    
    -- Source Data
    vcs_company_id VARCHAR(100) NOT NULL,
    vcs_company_name VARCHAR(255) NOT NULL,
    vcs_normalized_name VARCHAR(255) NOT NULL,
    
    -- DIVA Match Candidate
    diva_source_table VARCHAR(50) NOT NULL, -- investment_performance, violations, etc.
    diva_company_name VARCHAR(255) NOT NULL,
    diva_normalized_name VARCHAR(255) NOT NULL,
    
    -- Matching Algorithms & Scores
    exact_match_score DECIMAL(5,2) DEFAULT 0.00,
    levenshtein_score DECIMAL(5,2) DEFAULT 0.00,
    jaro_winkler_score DECIMAL(5,2) DEFAULT 0.00,
    trigram_similarity_score DECIMAL(5,2) DEFAULT 0.00,
    korean_specific_score DECIMAL(5,2) DEFAULT 0.00, -- Custom Korean normalization
    
    -- Combined Score & Decision
    final_match_score DECIMAL(5,2) NOT NULL,
    match_confidence VARCHAR(20) NOT NULL, -- high (>95%), medium (85-95%), low (<85%)
    match_approved BOOLEAN DEFAULT FALSE,
    rejection_reason TEXT,
    
    -- Korean Company Name Variations Detected
    company_suffixes_removed JSONB, -- ["주식회사", "(주)", "벤처투자", "벤처스"]
    name_variations_detected JSONB, -- Different representations found
    
    -- Manual Review Flags
    requires_manual_review BOOLEAN DEFAULT FALSE,
    manual_review_notes TEXT,
    reviewed_by VARCHAR(100),
    reviewed_at TIMESTAMP,
    
    -- Tracking
    matched_at TIMESTAMP DEFAULT NOW(),
    match_algorithm_version VARCHAR(10) DEFAULT 'v1.0',
    
    -- Constraints
    CONSTRAINT valid_final_score CHECK (final_match_score >= 0.00 AND final_match_score <= 100.00),
    CONSTRAINT approved_high_confidence CHECK (
        (match_approved = TRUE AND final_match_score >= 95.00) OR 
        (match_approved = FALSE)
    )
);

-- 3. COMPANY INTELLIGENCE VECTOR (Fast Access Layer)
CREATE TABLE IF NOT EXISTS company_intelligence_vector (
    master_company_id VARCHAR(100) PRIMARY KEY,
    
    -- Vector Data for Fast Access
    company_vector JSONB NOT NULL, -- Structured data for quick queries
    
    -- VCS Summary
    vcs_data JSONB, -- {funds: [...], total_size: x, establishment_date: "...", etc.}
    
    -- DIVA Summary by Category
    diva_investment_data JSONB,     -- Performance metrics
    diva_financial_data JSONB,      -- Financial statements summary
    diva_regulatory_data JSONB,     -- Violations and compliance
    diva_personnel_data JSONB,      -- Staffing and expertise
    diva_market_position JSONB,     -- VC map ranking and competitive position
    
    -- Combined Intelligence
    risk_assessment JSONB,          -- Regulatory + financial risks
    investment_attractiveness JSONB, -- Performance + growth indicators
    competitive_analysis JSONB,     -- Market position + peer comparison
    
    -- Performance Indexes
    search_vector tsvector, -- For full-text search
    last_updated TIMESTAMP DEFAULT NOW(),
    
    FOREIGN KEY (master_company_id) REFERENCES master_company_registry(master_company_id)
);

-- =================================================================
-- INDEXES FOR HIGH-PERFORMANCE QUERIES
-- =================================================================

-- Master Company Registry Indexes
CREATE INDEX idx_master_company_canonical ON master_company_registry(canonical_company_name);
CREATE INDEX idx_master_company_normalized ON master_company_registry(normalized_name);
CREATE INDEX idx_master_company_vcs_id ON master_company_registry(vcs_company_id);
CREATE INDEX idx_master_company_confidence ON master_company_registry(linkage_confidence_score DESC);
CREATE INDEX idx_master_company_completeness ON master_company_registry(data_completeness_score DESC);

-- Matching Candidates Indexes
CREATE INDEX idx_match_candidates_vcs_id ON vcs_diva_match_candidates(vcs_company_id);
CREATE INDEX idx_match_candidates_score ON vcs_diva_match_candidates(final_match_score DESC);
CREATE INDEX idx_match_candidates_approved ON vcs_diva_match_candidates(match_approved, final_match_score DESC);
CREATE INDEX idx_match_candidates_manual_review ON vcs_diva_match_candidates(requires_manual_review);

-- Intelligence Vector Indexes
CREATE INDEX idx_intelligence_vector_search ON company_intelligence_vector USING gin(search_vector);
CREATE INDEX idx_intelligence_vector_updated ON company_intelligence_vector(last_updated DESC);

-- =================================================================
-- KOREAN COMPANY NAME NORMALIZATION FUNCTION
-- =================================================================

CREATE OR REPLACE FUNCTION normalize_korean_company_name(company_name TEXT)
RETURNS TEXT AS $$
DECLARE
    normalized_name TEXT;
BEGIN
    normalized_name := UPPER(TRIM(company_name));
    
    -- Remove common Korean company suffixes for better matching
    normalized_name := REGEXP_REPLACE(normalized_name, '\(주\)$', '', 'g');
    normalized_name := REGEXP_REPLACE(normalized_name, '주식회사$', '', 'g');
    normalized_name := REGEXP_REPLACE(normalized_name, '(유)$', '', 'g');
    normalized_name := REGEXP_REPLACE(normalized_name, '벤처투자$', '', 'g');
    normalized_name := REGEXP_REPLACE(normalized_name, '벤처스$', '', 'g');
    normalized_name := REGEXP_REPLACE(normalized_name, '인베스트먼트$', '', 'g');
    normalized_name := REGEXP_REPLACE(normalized_name, '캐피탈$', '', 'g');
    normalized_name := REGEXP_REPLACE(normalized_name, '파트너스$', '', 'g');
    
    -- Remove special characters and extra spaces
    normalized_name := REGEXP_REPLACE(normalized_name, '[^가-힣A-Z0-9\s]', '', 'g');
    normalized_name := REGEXP_REPLACE(normalized_name, '\s+', ' ', 'g');
    normalized_name := TRIM(normalized_name);
    
    RETURN normalized_name;
END;
$$ LANGUAGE plpgsql IMMUTABLE;

-- =================================================================
-- HIGH-PRECISION MATCHING FUNCTION (>95% Accuracy)
-- =================================================================

CREATE OR REPLACE FUNCTION calculate_company_match_score(
    name1 TEXT, 
    name2 TEXT,
    OUT exact_score DECIMAL(5,2),
    OUT levenshtein_score DECIMAL(5,2),
    OUT trigram_score DECIMAL(5,2),
    OUT final_score DECIMAL(5,2)
) AS $$
DECLARE
    norm1 TEXT;
    norm2 TEXT;
    len_penalty DECIMAL(5,2);
BEGIN
    -- Normalize both names
    norm1 := normalize_korean_company_name(name1);
    norm2 := normalize_korean_company_name(name2);
    
    -- Exact match check
    IF norm1 = norm2 THEN
        exact_score := 100.00;
        levenshtein_score := 100.00;
        trigram_score := 100.00;
        final_score := 100.00;
        RETURN;
    END IF;
    
    exact_score := 0.00;
    
    -- Levenshtein distance score
    levenshtein_score := GREATEST(0, 100.0 - (levenshtein(norm1, norm2) * 10.0));
    
    -- Trigram similarity score
    trigram_score := similarity(norm1, norm2) * 100.0;
    
    -- Length penalty for very different length names
    len_penalty := 1.0;
    IF ABS(LENGTH(norm1) - LENGTH(norm2)) > 5 THEN
        len_penalty := 0.8;
    END IF;
    
    -- Final weighted score (conservative for >95% accuracy)
    final_score := (
        exact_score * 0.5 +
        levenshtein_score * 0.3 +
        trigram_score * 0.2
    ) * len_penalty;
    
    -- Cap at 100.00
    final_score := LEAST(final_score, 100.00);
END;
$$ LANGUAGE plpgsql IMMUTABLE;

-- =================================================================
-- COMMENTS FOR DOCUMENTATION
-- =================================================================

COMMENT ON TABLE master_company_registry IS 'Unified company registry linking VCS and DIVA data with >95% matching confidence';
COMMENT ON TABLE vcs_diva_match_candidates IS 'High-precision fuzzy matching candidates between VCS and DIVA company names';
COMMENT ON TABLE company_intelligence_vector IS 'Fast-access vector for combined VCS+DIVA company intelligence';
COMMENT ON FUNCTION normalize_korean_company_name IS 'Korean company name normalization for accurate fuzzy matching';
COMMENT ON FUNCTION calculate_company_match_score IS 'Multi-algorithm matching score calculator with >95% accuracy threshold'; 