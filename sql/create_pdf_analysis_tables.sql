-- 🤖📊 PDF AI ANALYSIS TABLES
-- ============================
--
-- Stores AI-powered insights from Fund of Funds annual reports:
-- 1. PDF Analysis Results - OpenAI extracted insights
-- 2. Trend Analysis - AI-generated trend reports
-- 3. Investment Intelligence - Cross-referenced insights
-- 4. Performance tracking views
--
-- ULTIMATE VALUE: Transform unstructured PDF reports into structured intelligence

-- 📄 PDF Analysis Results Table
CREATE TABLE IF NOT EXISTS pdf_analysis_results (
    id BIGSERIAL PRIMARY KEY,
    
    -- File Identification
    file_name TEXT NOT NULL,
    fund_source TEXT NOT NULL, -- 'KDB', 'K-Growth', 'KVIC', etc.
    report_type TEXT NOT NULL, -- 'Annual Report', 'Quarterly Update', etc.
    report_year INTEGER,
    report_period TEXT, -- 'Q1', 'Q2', 'Annual', etc.
    
    -- PDF Metadata
    pdf_pages INTEGER,
    pdf_info JSONB, -- PDF metadata (title, author, creation date, etc.)
    file_size BIGINT, -- File size in bytes
    
    -- AI Analysis Results (structured JSON data)
    investment_summary JSONB, -- Total investments, funds, companies, sectors
    portfolio_performance JSONB, -- Returns, IRR, exits, performance metrics
    market_trends JSONB, -- Market outlook, hot sectors, emerging trends
    risk_assessment JSONB, -- Risk factors, mitigation strategies
    future_outlook JSONB, -- Investment strategy, targets, timeline
    sector_analysis JSONB, -- Sector-specific insights and allocations
    geographic_allocation JSONB, -- Geographic distribution and expansion
    exit_activity JSONB, -- IPO, M&A, and other exit activities
    
    -- Comprehensive Trend Report
    trend_report JSONB, -- AI-generated comprehensive trend analysis
    
    -- Analysis Metadata
    processed_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    ai_model TEXT NOT NULL, -- 'gpt-4-turbo-preview', etc.
    analysis_version TEXT DEFAULT '1.0',
    processing_time_seconds INTEGER,
    
    -- Quality Metrics
    extraction_success BOOLEAN DEFAULT true,
    analysis_confidence DECIMAL(3,2), -- 0.00 to 1.00
    data_completeness DECIMAL(3,2), -- 0.00 to 1.00
    
    -- Metadata
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    
    -- Constraints
    UNIQUE(file_name, fund_source, report_year)
);

-- 📈 AI Trend Insights Table (Normalized trend data for analytics)
CREATE TABLE IF NOT EXISTS ai_trend_insights (
    id BIGSERIAL PRIMARY KEY,
    
    -- Source Reference
    pdf_analysis_id BIGINT REFERENCES pdf_analysis_results(id),
    fund_source TEXT NOT NULL,
    report_year INTEGER,
    
    -- Trend Categories
    trend_type TEXT NOT NULL, -- 'investment_volume', 'sector_shift', 'performance', etc.
    trend_category TEXT NOT NULL, -- 'positive', 'negative', 'neutral'
    
    -- Trend Details
    trend_title TEXT NOT NULL,
    trend_description TEXT,
    trend_impact TEXT, -- 'high', 'medium', 'low'
    trend_confidence DECIMAL(3,2), -- AI confidence in this trend
    
    -- Quantitative Data (if available)
    trend_value DECIMAL(15,2), -- Numeric value if applicable
    trend_unit TEXT, -- 'KRW', 'percentage', 'count', etc.
    previous_value DECIMAL(15,2), -- Previous period value for comparison
    change_percentage DECIMAL(5,2), -- Percentage change
    
    -- Context
    sector TEXT, -- Specific sector if applicable
    geography TEXT, -- Geographic focus if applicable
    investment_stage TEXT, -- Investment stage if applicable
    
    -- Time Context
    trend_period TEXT, -- 'short_term', 'medium_term', 'long_term'
    forecast_period TEXT, -- Future outlook period
    
    -- Metadata
    extracted_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    ai_extracted BOOLEAN DEFAULT true,
    
    -- Constraints
    UNIQUE(pdf_analysis_id, trend_type, trend_title)
);

-- 💡 Investment Intelligence View (Cross-referenced insights)
CREATE TABLE IF NOT EXISTS investment_intelligence_insights (
    id BIGSERIAL PRIMARY KEY,
    
    -- Intelligence Type
    insight_type TEXT NOT NULL, -- 'opportunity', 'risk', 'trend', 'recommendation'
    insight_category TEXT NOT NULL, -- 'sector', 'stage', 'geography', 'strategy'
    
    -- Insight Details
    title TEXT NOT NULL,
    description TEXT,
    impact_level TEXT, -- 'critical', 'high', 'medium', 'low'
    actionability TEXT, -- 'immediate', 'short_term', 'long_term', 'monitoring'
    
    -- Data Sources (can reference multiple PDF analyses)
    source_pdf_analyses INTEGER[], -- Array of pdf_analysis_results IDs
    source_funds TEXT[], -- Array of fund sources that support this insight
    confidence_score DECIMAL(3,2), -- Aggregated confidence across sources
    
    -- Context
    relevant_sectors TEXT[],
    relevant_stages TEXT[],
    relevant_geographies TEXT[],
    
    -- Quantitative Support
    supporting_data JSONB, -- Quantitative data supporting the insight
    market_size_estimate BIGINT, -- Market size in KRW if applicable
    
    -- Timeline
    insight_timeframe TEXT, -- When this insight is relevant
    next_review_date DATE, -- When to reassess this insight
    
    -- Metadata
    generated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    generated_by TEXT DEFAULT 'AI_ANALYSIS',
    status TEXT DEFAULT 'active', -- 'active', 'outdated', 'superseded'
    
    -- Tracking
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Create comprehensive indexes for PDF analysis data
CREATE INDEX IF NOT EXISTS idx_pdf_analysis_fund_source ON pdf_analysis_results(fund_source);
CREATE INDEX IF NOT EXISTS idx_pdf_analysis_report_year ON pdf_analysis_results(report_year DESC);
CREATE INDEX IF NOT EXISTS idx_pdf_analysis_processed_at ON pdf_analysis_results(processed_at DESC);
CREATE INDEX IF NOT EXISTS idx_pdf_analysis_file_name ON pdf_analysis_results(file_name);

-- Trend insights indexes
CREATE INDEX IF NOT EXISTS idx_trend_insights_fund_source ON ai_trend_insights(fund_source);
CREATE INDEX IF NOT EXISTS idx_trend_insights_trend_type ON ai_trend_insights(trend_type);
CREATE INDEX IF NOT EXISTS idx_trend_insights_trend_category ON ai_trend_insights(trend_category);
CREATE INDEX IF NOT EXISTS idx_trend_insights_impact ON ai_trend_insights(trend_impact);
CREATE INDEX IF NOT EXISTS idx_trend_insights_sector ON ai_trend_insights(sector);
CREATE INDEX IF NOT EXISTS idx_trend_insights_year ON ai_trend_insights(report_year DESC);

-- Investment intelligence indexes
CREATE INDEX IF NOT EXISTS idx_investment_intel_type ON investment_intelligence_insights(insight_type);
CREATE INDEX IF NOT EXISTS idx_investment_intel_category ON investment_intelligence_insights(insight_category);
CREATE INDEX IF NOT EXISTS idx_investment_intel_impact ON investment_intelligence_insights(impact_level);
CREATE INDEX IF NOT EXISTS idx_investment_intel_actionability ON investment_intelligence_insights(actionability);
CREATE INDEX IF NOT EXISTS idx_investment_intel_status ON investment_intelligence_insights(status);

-- 🔍 PDF INTELLIGENCE SUMMARY VIEW
-- ================================
-- Provides high-level overview of AI-extracted insights

CREATE OR REPLACE VIEW pdf_intelligence_summary AS
SELECT 
    fund_source,
    COUNT(*) AS total_reports_analyzed,
    AVG(pdf_pages) AS avg_pages_per_report,
    MIN(report_year) AS earliest_report,
    MAX(report_year) AS latest_report,
    
    -- Analysis quality metrics
    AVG(analysis_confidence) AS avg_confidence,
    AVG(data_completeness) AS avg_completeness,
    COUNT(CASE WHEN extraction_success THEN 1 END) AS successful_extractions,
    
    -- Content analysis
    COUNT(CASE WHEN investment_summary IS NOT NULL THEN 1 END) AS reports_with_investment_data,
    COUNT(CASE WHEN portfolio_performance IS NOT NULL THEN 1 END) AS reports_with_performance_data,
    COUNT(CASE WHEN market_trends IS NOT NULL THEN 1 END) AS reports_with_trend_data,
    COUNT(CASE WHEN trend_report IS NOT NULL THEN 1 END) AS reports_with_trend_analysis,
    
    -- Recent activity
    MAX(processed_at) AS last_processed,
    
    -- AI model usage
    array_agg(DISTINCT ai_model) AS ai_models_used
    
FROM pdf_analysis_results
GROUP BY fund_source
ORDER BY total_reports_analyzed DESC;

-- 📊 TREND ANALYSIS DASHBOARD VIEW
-- ================================
-- Aggregates trend insights for dashboard visualization

CREATE OR REPLACE VIEW trend_analysis_dashboard AS
WITH trend_aggregation AS (
    SELECT 
        t.fund_source,
        t.trend_type,
        t.trend_category,
        COUNT(*) AS trend_count,
        AVG(t.trend_confidence) AS avg_confidence,
        
        -- Quantitative aggregations where applicable
        AVG(CASE WHEN t.trend_value IS NOT NULL THEN t.trend_value END) AS avg_trend_value,
        AVG(CASE WHEN t.change_percentage IS NOT NULL THEN t.change_percentage END) AS avg_change_percentage,
        
        -- Time context
        COUNT(CASE WHEN t.trend_period = 'short_term' THEN 1 END) AS short_term_trends,
        COUNT(CASE WHEN t.trend_period = 'medium_term' THEN 1 END) AS medium_term_trends,
        COUNT(CASE WHEN t.trend_period = 'long_term' THEN 1 END) AS long_term_trends,
        
        -- Impact assessment
        COUNT(CASE WHEN t.trend_impact = 'high' THEN 1 END) AS high_impact_trends,
        COUNT(CASE WHEN t.trend_impact = 'medium' THEN 1 END) AS medium_impact_trends,
        COUNT(CASE WHEN t.trend_impact = 'low' THEN 1 END) AS low_impact_trends,
        
        -- Recent trends
        MAX(t.extracted_at) AS latest_trend_date
        
    FROM ai_trend_insights t
    GROUP BY t.fund_source, t.trend_type, t.trend_category
)
SELECT 
    fund_source,
    trend_type,
    trend_category,
    trend_count,
    ROUND(avg_confidence, 2) AS avg_confidence,
    ROUND(avg_trend_value, 0) AS avg_trend_value,
    ROUND(avg_change_percentage, 1) AS avg_change_percentage,
    
    -- Trend timeline distribution
    short_term_trends,
    medium_term_trends, 
    long_term_trends,
    
    -- Impact classification
    CASE 
        WHEN high_impact_trends > medium_impact_trends + low_impact_trends THEN 'High Impact Focus'
        WHEN medium_impact_trends >= high_impact_trends THEN 'Moderate Impact Focus'
        ELSE 'Mixed Impact'
    END AS impact_profile,
    
    latest_trend_date
    
FROM trend_aggregation
ORDER BY fund_source, trend_count DESC;

-- 🎯 INVESTMENT OPPORTUNITIES VIEW
-- ================================
-- AI-identified investment opportunities from PDF analysis

CREATE OR REPLACE VIEW ai_investment_opportunities AS
WITH opportunity_analysis AS (
    SELECT 
        p.fund_source,
        p.report_year,
        
        -- Extract sector opportunities from investment summaries
        CASE 
            WHEN p.investment_summary->>'top_sectors' IS NOT NULL 
            THEN CAST(p.investment_summary->>'top_sectors' AS TEXT)
            ELSE NULL 
        END AS hot_sectors,
        
        -- Extract growth metrics
        CASE 
            WHEN p.portfolio_performance->>'year_over_year_growth' IS NOT NULL
            THEN CAST(p.portfolio_performance->>'year_over_year_growth' AS TEXT)
            ELSE NULL
        END AS yoy_growth,
        
        -- Extract market outlook
        CASE 
            WHEN p.market_trends->>'market_outlook' IS NOT NULL
            THEN CAST(p.market_trends->>'market_outlook' AS TEXT)
            ELSE NULL
        END AS market_outlook,
        
        -- Extract investment themes
        CASE 
            WHEN p.future_outlook->>'investment_themes' IS NOT NULL
            THEN CAST(p.future_outlook->>'investment_themes' AS TEXT)
            ELSE NULL
        END AS investment_themes,
        
        p.processed_at
        
    FROM pdf_analysis_results p
    WHERE p.extraction_success = true
    AND (p.investment_summary IS NOT NULL OR p.market_trends IS NOT NULL)
)
SELECT 
    fund_source,
    report_year,
    hot_sectors,
    yoy_growth,
    market_outlook,
    investment_themes,
    
    -- Opportunity scoring (simple heuristic)
    CASE 
        WHEN market_outlook = 'positive' AND yoy_growth IS NOT NULL THEN 'High Opportunity'
        WHEN market_outlook = 'positive' OR yoy_growth IS NOT NULL THEN 'Moderate Opportunity'
        WHEN market_outlook = 'neutral' THEN 'Stable Opportunity'
        ELSE 'Cautious Opportunity'
    END AS opportunity_level,
    
    processed_at AS analysis_date
    
FROM opportunity_analysis
WHERE hot_sectors IS NOT NULL OR investment_themes IS NOT NULL
ORDER BY report_year DESC, fund_source;

-- Add table comments for documentation
COMMENT ON TABLE pdf_analysis_results IS 'AI-powered analysis results from Fund of Funds annual reports (KDB, K-Growth, etc.)';
COMMENT ON TABLE ai_trend_insights IS 'Normalized trend insights extracted from PDF reports by AI analysis';
COMMENT ON TABLE investment_intelligence_insights IS 'Cross-referenced investment intelligence and actionable insights';
COMMENT ON VIEW pdf_intelligence_summary IS 'High-level overview of PDF analysis results and quality metrics';
COMMENT ON VIEW trend_analysis_dashboard IS 'Aggregated trend data for dashboard visualization and analysis';
COMMENT ON VIEW ai_investment_opportunities IS 'AI-identified investment opportunities from annual report analysis';

-- 📈 Comprehensive Trend Reports Table
CREATE TABLE IF NOT EXISTS trend_reports (
    id BIGSERIAL PRIMARY KEY,
    
    -- Report Identification
    report_date DATE NOT NULL,
    report_type TEXT NOT NULL, -- 'comprehensive_trend_analysis', 'sector_focus', 'monthly_update'
    
    -- Report Data
    report_data JSONB NOT NULL, -- Complete report as JSON
    data_sources TEXT[], -- Array of data sources used
    
    -- Generation Metadata
    generated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    ai_model TEXT, -- OpenAI model used for synthesis
    generation_time_seconds INTEGER,
    
    -- Report Status
    status TEXT DEFAULT 'published', -- 'draft', 'published', 'archived'
    version INTEGER DEFAULT 1,
    
    -- Quality Metrics
    data_quality_score DECIMAL(3,2), -- 0.00 to 1.00
    insight_count INTEGER, -- Number of insights generated
    confidence_score DECIMAL(3,2), -- Overall confidence in analysis
    
    -- Metadata
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    
    -- Constraints
    UNIQUE(report_date, report_type)
);

-- Create indexes for trend reports
CREATE INDEX IF NOT EXISTS idx_trend_reports_date ON trend_reports(report_date DESC);
CREATE INDEX IF NOT EXISTS idx_trend_reports_type ON trend_reports(report_type);
CREATE INDEX IF NOT EXISTS idx_trend_reports_generated_at ON trend_reports(generated_at DESC);
CREATE INDEX IF NOT EXISTS idx_trend_reports_status ON trend_reports(status);

-- Add table comment
COMMENT ON TABLE trend_reports IS 'Comprehensive trend analysis reports combining AI insights with live market data';

-- Success message
SELECT 'PDF AI Analysis tables and views created successfully! Ready for OpenAI-powered report analysis.' AS status; 