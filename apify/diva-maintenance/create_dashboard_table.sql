-- Enhanced DIVA Maintenance System v2.2
-- Dashboard Table Creation Script
-- Run this in your Supabase SQL Editor if the maintenance_reports table doesn't exist

CREATE TABLE IF NOT EXISTS maintenance_reports (
    id SERIAL PRIMARY KEY,
    system_type VARCHAR(50) NOT NULL,
    status VARCHAR(50) NOT NULL,
    duration_seconds INTEGER,
    quality_score INTEGER,
    duplicates_removed INTEGER,
    records_processed INTEGER,
    report_data JSONB,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Add indexes for better performance
CREATE INDEX IF NOT EXISTS idx_maintenance_reports_system_type ON maintenance_reports(system_type);
CREATE INDEX IF NOT EXISTS idx_maintenance_reports_created_at ON maintenance_reports(created_at);
CREATE INDEX IF NOT EXISTS idx_maintenance_reports_status ON maintenance_reports(status);

-- Add comments for documentation
COMMENT ON TABLE maintenance_reports IS 'Stores maintenance reports from DIVA and VCS systems';
COMMENT ON COLUMN maintenance_reports.system_type IS 'System that generated the report (DIVA, VCS, etc.)';
COMMENT ON COLUMN maintenance_reports.status IS 'Health status (HEALTHY, NEEDS_ATTENTION)';
COMMENT ON COLUMN maintenance_reports.report_data IS 'Full JSON report data';

-- Grant permissions (adjust as needed for your setup)
-- GRANT SELECT, INSERT ON maintenance_reports TO service_role;
-- GRANT SELECT ON maintenance_reports TO anon; 