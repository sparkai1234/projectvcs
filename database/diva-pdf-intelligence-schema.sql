-- 🇰🇷 DIVA PDF Intelligence System Database Schema
-- Korean VC Statistics PDF Analysis with LLM Intelligence Storage
-- Supporting PDF extraction, analysis, and insights generation

-- ================================================================
-- PDF 분석 원시 데이터 (PDF ANALYSIS RAW DATA)
-- ================================================================
CREATE TABLE IF NOT EXISTS diva_pdf_analysis (
    id BIGSERIAL PRIMARY KEY,
    
    -- PDF 기본 정보 (PDF Basic Information)
    pdf_title TEXT NOT NULL,
    pdf_url TEXT,
    pdf_type TEXT DEFAULT 'korean_vc_statistics',
    file_size_bytes BIGINT,
    page_count INTEGER,
    
    -- 추출된 콘텐츠 (Extracted Content)
    text_content TEXT, -- Full extracted text
    tables_extracted JSONB DEFAULT '[]', -- Extracted tables as JSON
    images_extracted JSONB DEFAULT '[]', -- Image metadata
    
    -- LLM 분석 결과 (LLM Analysis Results)
    llm_summary TEXT, -- Executive summary from LLM
    llm_key_insights JSONB DEFAULT '[]', -- Array of key insights
    llm_data_points JSONB DEFAULT '[]', -- Structured data points
    llm_market_trends JSONB DEFAULT '[]', -- Market trend analysis
    llm_recommendations JSONB DEFAULT '[]', -- Strategic recommendations
    
    -- 품질 및 메타데이터 (Quality and Metadata)
    analysis_quality_score INTEGER DEFAULT 0, -- 0-100 quality score
    llm_confidence_score INTEGER DEFAULT 0, -- LLM confidence in analysis
    processing_duration_seconds INTEGER,
    language TEXT DEFAULT 'korean',
    
    -- 기술적 메타데이터 (Technical Metadata)
    extraction_method TEXT DEFAULT 'pdf-parse',
    llm_provider TEXT, -- openai, anthropic, etc.
    llm_model TEXT, -- gpt-4, claude-3, etc.
    processing_timestamp TIMESTAMPTZ DEFAULT NOW(),
    source_system TEXT DEFAULT 'DIVA_PDF_INTELLIGENCE_V1.0',
    
    -- 추적 및 감사 (Tracking and Audit)
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW(),
    
    -- 제약조건 (Constraints)
    UNIQUE(pdf_title, pdf_url)
);

-- ================================================================
-- 지능형 보고서 (INTELLIGENCE REPORTS)
-- ================================================================
CREATE TABLE IF NOT EXISTS diva_intelligence_reports (
    id BIGSERIAL PRIMARY KEY,
    
    -- 보고서 기본 정보 (Report Basic Information)
    report_title TEXT NOT NULL,
    report_type TEXT DEFAULT 'korean_vc_market_intelligence',
    generation_date TIMESTAMPTZ DEFAULT NOW(),
    reporting_period TEXT, -- Q1 2024, 2023 Annual, etc.
    
    -- 분석 범위 (Analysis Scope)
    total_pdfs_analyzed INTEGER DEFAULT 0,
    source_documents JSONB DEFAULT '[]', -- Array of source PDF references
    data_quality_score INTEGER DEFAULT 0,
    
    -- 핵심 분석 결과 (Key Analysis Results)
    executive_summary TEXT,
    market_overview JSONB DEFAULT '{}',
    key_trends JSONB DEFAULT '[]',
    investment_insights JSONB DEFAULT '[]',
    sector_analysis JSONB DEFAULT '{}',
    
    -- 정량적 인사이트 (Quantitative Insights)
    total_investment_krw BIGINT, -- Total investment amount in KRW
    deal_count INTEGER, -- Number of deals
    average_deal_size_krw BIGINT,
    top_sectors JSONB DEFAULT '[]',
    geographic_distribution JSONB DEFAULT '{}',
    
    -- 정성적 분석 (Qualitative Analysis)
    market_sentiment TEXT, -- positive, neutral, negative
    regulatory_changes JSONB DEFAULT '[]',
    competitive_landscape TEXT,
    future_outlook TEXT,
    
    -- 추천사항 (Recommendations)
    strategic_recommendations JSONB DEFAULT '[]',
    risk_factors JSONB DEFAULT '[]',
    opportunities JSONB DEFAULT '[]',
    
    -- 메타데이터 (Metadata)
    analysis_depth TEXT DEFAULT 'comprehensive', -- basic, standard, comprehensive
    language TEXT DEFAULT 'korean',
    analyst_notes TEXT,
    confidence_level INTEGER DEFAULT 0, -- 0-100
    
    -- 기술적 정보 (Technical Information)
    generation_method TEXT DEFAULT 'automated_llm_analysis',
    processing_duration_minutes INTEGER,
    generated_by TEXT DEFAULT 'DIVA_PDF_INTELLIGENCE_V1.0',
    
    -- 추적 정보 (Tracking Information)
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- ================================================================
-- PDF 다운로드 추적 (PDF DOWNLOAD TRACKING)
-- ================================================================
CREATE TABLE IF NOT EXISTS diva_pdf_downloads (
    id BIGSERIAL PRIMARY KEY,
    
    -- 다운로드 정보 (Download Information)
    pdf_url TEXT NOT NULL,
    pdf_title TEXT,
    download_timestamp TIMESTAMPTZ DEFAULT NOW(),
    file_size_bytes BIGINT,
    download_duration_seconds INTEGER,
    
    -- 상태 정보 (Status Information)
    download_status TEXT DEFAULT 'success', -- success, failed, timeout
    error_message TEXT,
    retry_count INTEGER DEFAULT 0,
    
    -- 처리 상태 (Processing Status)
    analysis_status TEXT DEFAULT 'pending', -- pending, processing, completed, failed
    analysis_started_at TIMESTAMPTZ,
    analysis_completed_at TIMESTAMPTZ,
    
    -- 참조 (References)
    analysis_id BIGINT REFERENCES diva_pdf_analysis(id),
    
    -- 메타데이터 (Metadata)
    source_page_url TEXT,
    user_agent TEXT,
    ip_address INET,
    
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- ================================================================
-- 시장 인사이트 추출 (MARKET INSIGHTS EXTRACTION)
-- ================================================================
CREATE TABLE IF NOT EXISTS diva_market_insights (
    id BIGSERIAL PRIMARY KEY,
    
    -- 인사이트 기본 정보 (Insight Basic Information)
    insight_title TEXT NOT NULL,
    insight_category TEXT, -- investment_trend, market_size, regulatory, competitive
    insight_type TEXT, -- quantitative, qualitative, mixed
    
    -- 인사이트 내용 (Insight Content)
    insight_description TEXT,
    supporting_data JSONB DEFAULT '{}',
    confidence_score INTEGER DEFAULT 0, -- 0-100
    
    -- 출처 정보 (Source Information)
    source_pdf_ids JSONB DEFAULT '[]', -- Array of PDF analysis IDs
    source_pages TEXT, -- Page numbers or sections
    extraction_method TEXT DEFAULT 'llm_analysis',
    
    -- 분류 및 태그 (Classification and Tags)
    market_sector TEXT, -- fintech, healthtech, e-commerce, etc.
    geographic_scope TEXT, -- korea, seoul, busan, global
    time_period TEXT, -- Q1 2024, 2023, historical
    tags JSONB DEFAULT '[]',
    
    -- 영향도 분석 (Impact Analysis)
    market_impact TEXT, -- high, medium, low
    investment_implications TEXT,
    strategic_importance INTEGER DEFAULT 0, -- 0-10 scale
    
    -- 추적 정보 (Tracking Information)
    discovered_at TIMESTAMPTZ DEFAULT NOW(),
    validated_at TIMESTAMPTZ,
    validated_by TEXT,
    
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- ================================================================
-- 통합 뷰: 완전한 PDF 인텔리전스 (COMBINED VIEW: COMPLETE PDF INTELLIGENCE)
-- ================================================================
CREATE OR REPLACE VIEW diva_complete_pdf_intelligence AS
SELECT 
    -- PDF 분석 기본 정보
    pdf.id as analysis_id,
    pdf.pdf_title,
    pdf.pdf_type,
    pdf.file_size_bytes,
    pdf.page_count,
    
    -- 분석 품질 지표
    pdf.analysis_quality_score,
    pdf.llm_confidence_score,
    pdf.processing_duration_seconds,
    
    -- LLM 인사이트 요약
    json_array_length(pdf.llm_key_insights) as insights_count,
    json_array_length(pdf.llm_data_points) as data_points_count,
    json_array_length(pdf.llm_market_trends) as trends_count,
    
    -- 다운로드 정보
    dl.download_timestamp,
    dl.download_status,
    dl.analysis_status,
    
    -- 관련 인사이트 수
    (SELECT COUNT(*) FROM diva_market_insights mi 
     WHERE pdf.id::text = ANY(SELECT jsonb_array_elements_text(mi.source_pdf_ids))) as related_insights_count,
    
    -- 메타데이터
    pdf.language,
    pdf.llm_provider,
    pdf.source_system,
    pdf.created_at,
    pdf.updated_at
    
FROM diva_pdf_analysis pdf
LEFT JOIN diva_pdf_downloads dl ON pdf.id = dl.analysis_id;

-- ================================================================
-- 인덱스 생성 (CREATE INDEXES)
-- ================================================================

-- PDF Analysis Indexes
CREATE INDEX IF NOT EXISTS idx_pdf_analysis_title ON diva_pdf_analysis(pdf_title);
CREATE INDEX IF NOT EXISTS idx_pdf_analysis_type ON diva_pdf_analysis(pdf_type);
CREATE INDEX IF NOT EXISTS idx_pdf_analysis_timestamp ON diva_pdf_analysis(processing_timestamp);
CREATE INDEX IF NOT EXISTS idx_pdf_analysis_quality ON diva_pdf_analysis(analysis_quality_score DESC);
CREATE INDEX IF NOT EXISTS idx_pdf_analysis_language ON diva_pdf_analysis(language);

-- Intelligence Reports Indexes
CREATE INDEX IF NOT EXISTS idx_intelligence_reports_date ON diva_intelligence_reports(generation_date);
CREATE INDEX IF NOT EXISTS idx_intelligence_reports_type ON diva_intelligence_reports(report_type);
CREATE INDEX IF NOT EXISTS idx_intelligence_reports_quality ON diva_intelligence_reports(data_quality_score DESC);

-- Market Insights Indexes
CREATE INDEX IF NOT EXISTS idx_market_insights_category ON diva_market_insights(insight_category);
CREATE INDEX IF NOT EXISTS idx_market_insights_sector ON diva_market_insights(market_sector);
CREATE INDEX IF NOT EXISTS idx_market_insights_impact ON diva_market_insights(market_impact);
CREATE INDEX IF NOT EXISTS idx_market_insights_discovered ON diva_market_insights(discovered_at);

-- JSON 인덱스 (JSON Indexes)
CREATE INDEX IF NOT EXISTS idx_pdf_insights_gin ON diva_pdf_analysis USING GIN (llm_key_insights);
CREATE INDEX IF NOT EXISTS idx_pdf_trends_gin ON diva_pdf_analysis USING GIN (llm_market_trends);
CREATE INDEX IF NOT EXISTS idx_report_recommendations_gin ON diva_intelligence_reports USING GIN (strategic_recommendations);

-- ================================================================
-- RLS (Row Level Security) 정책
-- ================================================================

-- Enable RLS
ALTER TABLE diva_pdf_analysis ENABLE ROW LEVEL SECURITY;
ALTER TABLE diva_intelligence_reports ENABLE ROW LEVEL SECURITY;
ALTER TABLE diva_pdf_downloads ENABLE ROW LEVEL SECURITY;
ALTER TABLE diva_market_insights ENABLE ROW LEVEL SECURITY;

-- Service role policies (for Apify scraper)
CREATE POLICY "Allow service role full access to pdf analysis" 
    ON diva_pdf_analysis FOR ALL 
    TO service_role USING (true);

CREATE POLICY "Allow service role full access to intelligence reports" 
    ON diva_intelligence_reports FOR ALL 
    TO service_role USING (true);

CREATE POLICY "Allow service role full access to pdf downloads" 
    ON diva_pdf_downloads FOR ALL 
    TO service_role USING (true);

CREATE POLICY "Allow service role full access to market insights" 
    ON diva_market_insights FOR ALL 
    TO service_role USING (true);

-- Authenticated user policies (read-only)
CREATE POLICY "Allow authenticated read access to pdf analysis" 
    ON diva_pdf_analysis FOR SELECT 
    TO authenticated USING (true);

CREATE POLICY "Allow authenticated read access to intelligence reports" 
    ON diva_intelligence_reports FOR SELECT 
    TO authenticated USING (true);

CREATE POLICY "Allow authenticated read access to market insights" 
    ON diva_market_insights FOR SELECT 
    TO authenticated USING (true);

-- ================================================================
-- 유용한 함수들 (USEFUL FUNCTIONS)
-- ================================================================

-- PDF 분석 품질 계산 함수
CREATE OR REPLACE FUNCTION calculate_pdf_analysis_quality(
    text_length INTEGER,
    insights_count INTEGER,
    data_points_count INTEGER,
    llm_confidence INTEGER
) RETURNS INTEGER AS $$
BEGIN
    RETURN LEAST(
        (CASE WHEN text_length > 1000 THEN 30 ELSE text_length / 33 END) +
        (insights_count * 5) +
        (data_points_count * 3) +
        (llm_confidence * 0.4),
        100
    )::INTEGER;
END;
$$ LANGUAGE plpgsql;

-- 시장 트렌드 집계 함수
CREATE OR REPLACE FUNCTION aggregate_market_trends(
    start_date TIMESTAMPTZ DEFAULT NOW() - INTERVAL '30 days'
) RETURNS JSON AS $$
DECLARE
    result JSON;
BEGIN
    SELECT json_build_object(
        'total_reports', COUNT(*),
        'avg_quality_score', AVG(data_quality_score),
        'top_trends', (
            SELECT json_agg(trend)
            FROM (
                SELECT jsonb_array_elements_text(key_trends) as trend
                FROM diva_intelligence_reports
                WHERE generation_date >= start_date
            ) trends
            GROUP BY trend
            ORDER BY COUNT(*) DESC
            LIMIT 10
        )
    ) INTO result
    FROM diva_intelligence_reports
    WHERE generation_date >= start_date;
    
    RETURN result;
END;
$$ LANGUAGE plpgsql;

-- ================================================================
-- 테이블 코멘트 (TABLE COMMENTS)
-- ================================================================

COMMENT ON TABLE diva_pdf_analysis IS 
'Korean VC Statistics PDF analysis with LLM-powered insights and intelligence extraction';

COMMENT ON TABLE diva_intelligence_reports IS 
'Comprehensive Korean VC market intelligence reports generated from multiple PDF sources';

COMMENT ON TABLE diva_pdf_downloads IS 
'Tracking and monitoring of PDF download activities from DIVA portal';

COMMENT ON TABLE diva_market_insights IS 
'Extracted and validated market insights from Korean VC statistical documents';

COMMENT ON VIEW diva_complete_pdf_intelligence IS 
'Complete view of PDF intelligence including analysis quality, insights, and processing status';

-- ================================================================
-- 샘플 쿼리 (SAMPLE QUERIES)
-- ================================================================

-- 최근 30일간 분석된 PDF 현황
-- SELECT pdf_type, COUNT(*) as count, AVG(analysis_quality_score) as avg_quality
-- FROM diva_pdf_analysis 
-- WHERE processing_timestamp >= NOW() - INTERVAL '30 days'
-- GROUP BY pdf_type
-- ORDER BY count DESC;

-- 최고 품질의 시장 인사이트
-- SELECT insight_title, market_sector, confidence_score, strategic_importance
-- FROM diva_market_insights
-- WHERE confidence_score >= 80 AND strategic_importance >= 7
-- ORDER BY strategic_importance DESC, confidence_score DESC
-- LIMIT 20;

-- 완전한 PDF 인텔리전스 현황
-- SELECT analysis_id, pdf_title, insights_count, trends_count, analysis_quality_score
-- FROM diva_complete_pdf_intelligence
-- WHERE analysis_status = 'completed' AND analysis_quality_score >= 70
-- ORDER BY analysis_quality_score DESC
-- LIMIT 15; 