-- Cleanup VC Table - Remove unwanted fields
-- Remove fields that are no longer needed for scraping

-- VC Table field removals
ALTER TABLE vc_table DROP COLUMN IF EXISTS data_type;
ALTER TABLE vc_table DROP COLUMN IF EXISTS operating_scale;
ALTER TABLE vc_table DROP COLUMN IF EXISTS business_category;
ALTER TABLE vc_table DROP COLUMN IF EXISTS strategy_planner;
ALTER TABLE vc_table DROP COLUMN IF EXISTS data_source;

-- Verify remaining structure
SELECT column_name, data_type 
FROM information_schema.columns 
WHERE table_name = 'vc_table' 
ORDER BY ordinal_position; 