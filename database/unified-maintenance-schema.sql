-- =============================================
-- UNIFIED MAINTENANCE DASHBOARD SCHEMA v3.0
-- Supports both VCS and DIVA maintenance systems
-- =============================================

-- Drop existing table if it exists
DROP TABLE IF EXISTS unified_maintenance_reports;

-- Create unified maintenance reports table
CREATE TABLE unified_maintenance_reports (
    id BIGSERIAL PRIMARY KEY,
    system_type TEXT NOT NULL CHECK (system_type IN ('VCS', 'DIVA')),
    status TEXT NOT NULL CHECK (status IN ('HEALTHY', 'NEEDS_ATTENTION', 'ERROR')),
    
    -- Performance Metrics
    duration_seconds INTEGER NOT NULL DEFAULT 0,
    quality_score INTEGER NOT NULL DEFAULT 0 CHECK (quality_score >= 0 AND quality_score <= 100),
    duplicates_removed INTEGER NOT NULL DEFAULT 0,
    records_processed INTEGER NOT NULL DEFAULT 0,
    
    -- Full Report Data (JSONB for flexible storage)
    report_data JSONB NOT NULL,
    
    -- Timestamps
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Create indexes for efficient querying
CREATE INDEX idx_unified_maintenance_system_type ON unified_maintenance_reports(system_type);
CREATE INDEX idx_unified_maintenance_status ON unified_maintenance_reports(status);
CREATE INDEX idx_unified_maintenance_created_at ON unified_maintenance_reports(created_at DESC);
CREATE INDEX idx_unified_maintenance_quality_score ON unified_maintenance_reports(quality_score DESC);

-- Create composite index for dashboard queries
CREATE INDEX idx_unified_maintenance_dashboard ON unified_maintenance_reports(system_type, created_at DESC, status);

-- Create trigger to automatically update updated_at
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ language 'plpgsql';

CREATE TRIGGER update_unified_maintenance_reports_updated_at 
    BEFORE UPDATE ON unified_maintenance_reports 
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

-- Create view for dashboard summary
CREATE OR REPLACE VIEW unified_maintenance_dashboard AS
SELECT 
    system_type,
    status,
    quality_score,
    duplicates_removed,
    records_processed,
    duration_seconds,
    created_at,
    ROW_NUMBER() OVER (PARTITION BY system_type ORDER BY created_at DESC) as row_num
FROM unified_maintenance_reports
WHERE created_at >= NOW() - INTERVAL '7 days';

-- Create view for latest status per system
CREATE OR REPLACE VIEW unified_maintenance_latest_status AS
SELECT DISTINCT ON (system_type)
    system_type,
    status,
    quality_score,
    duplicates_removed,
    records_processed,
    duration_seconds,
    created_at
FROM unified_maintenance_reports
ORDER BY system_type, created_at DESC;

-- Create view for system health overview
CREATE OR REPLACE VIEW unified_maintenance_health_overview AS
SELECT 
    COUNT(DISTINCT system_type) as total_systems,
    COUNT(*) as total_reports,
    COUNT(CASE WHEN status = 'HEALTHY' THEN 1 END) as healthy_reports,
    COUNT(CASE WHEN status = 'NEEDS_ATTENTION' THEN 1 END) as attention_reports,
    COUNT(CASE WHEN status = 'ERROR' THEN 1 END) as error_reports,
    ROUND(AVG(quality_score), 2) as avg_quality_score,
    SUM(duplicates_removed) as total_duplicates_removed,
    SUM(records_processed) as total_records_processed,
    MAX(created_at) as last_report_time
FROM unified_maintenance_reports
WHERE created_at >= NOW() - INTERVAL '24 hours';

-- Insert sample data for testing (optional)
-- INSERT INTO unified_maintenance_reports (system_type, status, duration_seconds, quality_score, duplicates_removed, records_processed, report_data)
-- VALUES 
--     ('VCS', 'HEALTHY', 45, 98, 15, 25000, '{"test": true}'),
--     ('DIVA', 'HEALTHY', 60, 95, 8, 5343, '{"test": true}');

-- Grant permissions (adjust as needed)
-- GRANT SELECT, INSERT, UPDATE ON unified_maintenance_reports TO maintenance_user;
-- GRANT SELECT ON unified_maintenance_dashboard TO dashboard_user;
-- GRANT SELECT ON unified_maintenance_latest_status TO dashboard_user;
-- GRANT SELECT ON unified_maintenance_health_overview TO dashboard_user;

-- Create function to clean old reports (keep last 30 days)
CREATE OR REPLACE FUNCTION cleanup_old_maintenance_reports()
RETURNS INTEGER AS $$
DECLARE
    deleted_count INTEGER;
BEGIN
    DELETE FROM unified_maintenance_reports 
    WHERE created_at < NOW() - INTERVAL '30 days';
    
    GET DIAGNOSTICS deleted_count = ROW_COUNT;
    RETURN deleted_count;
END;
$$ LANGUAGE plpgsql;

-- Create function to get system performance trends
CREATE OR REPLACE FUNCTION get_system_performance_trends(
    p_system_type TEXT DEFAULT NULL,
    p_days INTEGER DEFAULT 7
)
RETURNS TABLE(
    system_type TEXT,
    report_date DATE,
    avg_quality_score NUMERIC,
    total_duplicates_removed INTEGER,
    total_records_processed INTEGER,
    avg_duration NUMERIC
) AS $$
BEGIN
    RETURN QUERY
    SELECT 
        umr.system_type,
        DATE(umr.created_at) as report_date,
        ROUND(AVG(umr.quality_score), 2) as avg_quality_score,
        SUM(umr.duplicates_removed) as total_duplicates_removed,
        SUM(umr.records_processed) as total_records_processed,
        ROUND(AVG(umr.duration_seconds), 2) as avg_duration
    FROM unified_maintenance_reports umr
    WHERE 
        umr.created_at >= NOW() - (p_days || ' days')::INTERVAL
        AND (p_system_type IS NULL OR umr.system_type = p_system_type)
    GROUP BY umr.system_type, DATE(umr.created_at)
    ORDER BY umr.system_type, report_date DESC;
END;
$$ LANGUAGE plpgsql;

-- =============================================
-- EXAMPLE QUERIES FOR DASHBOARD
-- =============================================

-- Get latest status for all systems
-- SELECT * FROM unified_maintenance_latest_status;

-- Get health overview for last 24 hours
-- SELECT * FROM unified_maintenance_health_overview;

-- Get performance trends for VCS system (last 7 days)
-- SELECT * FROM get_system_performance_trends('VCS', 7);

-- Get all reports for a specific system (last 10)
-- SELECT system_type, status, quality_score, created_at 
-- FROM unified_maintenance_reports 
-- WHERE system_type = 'DIVA' 
-- ORDER BY created_at DESC 
-- LIMIT 10;

-- Get systems that need attention
-- SELECT DISTINCT ON (system_type) system_type, status, quality_score, created_at
-- FROM unified_maintenance_reports 
-- WHERE status != 'HEALTHY'
-- ORDER BY system_type, created_at DESC;

COMMENT ON TABLE unified_maintenance_reports IS 'Unified maintenance reports for VCS and DIVA systems';
COMMENT ON COLUMN unified_maintenance_reports.system_type IS 'Type of system: VCS or DIVA';
COMMENT ON COLUMN unified_maintenance_reports.status IS 'System health status: HEALTHY, NEEDS_ATTENTION, or ERROR';
COMMENT ON COLUMN unified_maintenance_reports.quality_score IS 'Data quality score from 0-100';
COMMENT ON COLUMN unified_maintenance_reports.report_data IS 'Full maintenance report in JSON format';

-- Create notification function for critical issues
CREATE OR REPLACE FUNCTION notify_critical_maintenance_issues()
RETURNS TRIGGER AS $$
BEGIN
    -- Notify if system status is ERROR or quality score is below 80
    IF NEW.status = 'ERROR' OR NEW.quality_score < 80 THEN
        PERFORM pg_notify(
            'maintenance_alert',
            json_build_object(
                'system_type', NEW.system_type,
                'status', NEW.status,
                'quality_score', NEW.quality_score,
                'timestamp', NEW.created_at
            )::text
        );
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Create trigger for critical issue notifications
CREATE TRIGGER maintenance_critical_alert_trigger
    AFTER INSERT ON unified_maintenance_reports
    FOR EACH ROW EXECUTE FUNCTION notify_critical_maintenance_issues(); 