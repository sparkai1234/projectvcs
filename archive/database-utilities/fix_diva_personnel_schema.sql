-- Fix DIVA Personnel Schema - Add Missing Column
-- Based on actual scraper data structure

ALTER TABLE diva_personnel_raw 
ADD COLUMN IF NOT EXISTS management_support_staff INTEGER;

-- Update RLS policies if needed
ALTER TABLE diva_personnel_raw ENABLE ROW LEVEL SECURITY;

-- Verify table structure
SELECT column_name, data_type, is_nullable 
FROM information_schema.columns 
WHERE table_name = 'diva_personnel_raw' 
ORDER BY ordinal_position; 