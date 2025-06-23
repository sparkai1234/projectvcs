-- ============================================================
-- VC TABLE SCHEMA UPDATE - Add Rich VC Company Data Fields
-- Execute in Supabase SQL Editor to support complete VC data
-- ============================================================

-- Add all missing fields for rich VC company data structure
ALTER TABLE vc_table ADD COLUMN IF NOT EXISTS industry TEXT;
ALTER TABLE vc_table ADD COLUMN IF NOT EXISTS zip_code TEXT;
ALTER TABLE vc_table ADD COLUMN IF NOT EXISTS founded TEXT;
ALTER TABLE vc_table ADD COLUMN IF NOT EXISTS operating_scale INTEGER;
ALTER TABLE vc_table ADD COLUMN IF NOT EXISTS operating_amount DECIMAL(10,2);
ALTER TABLE vc_table ADD COLUMN IF NOT EXISTS business_category TEXT;
ALTER TABLE vc_table ADD COLUMN IF NOT EXISTS strategy_planner BOOLEAN;
ALTER TABLE vc_table ADD COLUMN IF NOT EXISTS data_type TEXT;
ALTER TABLE vc_table ADD COLUMN IF NOT EXISTS status TEXT;
ALTER TABLE vc_table ADD COLUMN IF NOT EXISTS data_source TEXT;
ALTER TABLE vc_table ADD COLUMN IF NOT EXISTS import_date TIMESTAMP WITH TIME ZONE;

-- Add indexes for better query performance
CREATE INDEX IF NOT EXISTS idx_vc_table_industry ON vc_table(industry);
CREATE INDEX IF NOT EXISTS idx_vc_table_zip_code ON vc_table(zip_code);
CREATE INDEX IF NOT EXISTS idx_vc_table_operating_scale ON vc_table(operating_scale);
CREATE INDEX IF NOT EXISTS idx_vc_table_data_source ON vc_table(data_source);
CREATE INDEX IF NOT EXISTS idx_vc_table_business_category ON vc_table(business_category);
CREATE INDEX IF NOT EXISTS idx_vc_table_data_type ON vc_table(data_type);

-- Add comments for documentation
COMMENT ON COLUMN vc_table.industry IS 'Industry classification (e.g., 전기/기계/장비)';
COMMENT ON COLUMN vc_table.zip_code IS 'Company zip code (e.g., 06019)';
COMMENT ON COLUMN vc_table.founded IS 'Company founding period (e.g., 1년 4개월)';
COMMENT ON COLUMN vc_table.operating_scale IS 'Operating scale classification (integer)';
COMMENT ON COLUMN vc_table.operating_amount IS 'Operating amount in billions (e.g., 116.9)';
COMMENT ON COLUMN vc_table.business_category IS 'Business category classification';
COMMENT ON COLUMN vc_table.strategy_planner IS 'Has strategy planner (true/false)';
COMMENT ON COLUMN vc_table.data_type IS 'Data type (e.g., VC Company)';
COMMENT ON COLUMN vc_table.status IS 'Company status (active/inactive)';
COMMENT ON COLUMN vc_table.data_source IS 'Data source (Korean VC Database - vcs.go.kr)';

-- Verify VC table schema update
SELECT 
    'vc_table schema updated successfully' as status,
    count(*) as total_columns
FROM information_schema.columns 
WHERE table_name = 'vc_table' 
AND table_schema = 'public';

-- Show all columns after update
SELECT 
    column_name,
    data_type,
    is_nullable
FROM information_schema.columns 
WHERE table_name = 'vc_table' 
AND table_schema = 'public'
ORDER BY ordinal_position; 