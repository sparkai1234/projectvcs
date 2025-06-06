-- Final Database Fixes for Remaining Issues
-- Progress: 5/7 tables working, fixing the last 2

-- 1. Fix diva_violation_raw - Add missing 'number' column
ALTER TABLE diva_violation_raw ADD COLUMN IF NOT EXISTS number TEXT;

-- 2. Fix diva_professional_raw - Make company_id nullable (same issue as personnel table)
ALTER TABLE diva_professional_raw ALTER COLUMN company_id DROP NOT NULL;

-- Verify the fixes worked
SELECT 'diva_violation_raw columns:' as info;
SELECT column_name, data_type, is_nullable 
FROM information_schema.columns 
WHERE table_name = 'diva_violation_raw' 
ORDER BY ordinal_position;

SELECT 'diva_professional_raw columns:' as info;
SELECT column_name, data_type, is_nullable 
FROM information_schema.columns 
WHERE table_name = 'diva_professional_raw' 
ORDER BY ordinal_position; 