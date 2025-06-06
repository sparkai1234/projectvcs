-- Fix Violations Table Schema - Add Missing classification_name Column
-- Based on Apify logs showing missing 'classification_name' column

-- Add the missing classification_name column to diva_violation_raw table
ALTER TABLE diva_violation_raw 
ADD COLUMN IF NOT EXISTS classification_name TEXT;

-- Verify the table structure
SELECT 
    column_name, 
    data_type, 
    is_nullable,
    column_default
FROM information_schema.columns 
WHERE table_name = 'diva_violation_raw' 
ORDER BY ordinal_position;

-- Test insert with the expected data structure
INSERT INTO diva_violation_raw (
    number,
    company_name,
    action_date,
    action_end_date,
    classification_name,
    correction_type,
    violation_type,
    action_type,
    extracted_at,
    source_url
) VALUES (
    'TEST',
    'Test Company',
    '2025-06-06',
    NULL,
    '-',
    '전자보고',
    '1년간 미투자',
    '경고',
    NOW(),
    'http://test.url'
) ON CONFLICT DO NOTHING;

-- Clean up test record
DELETE FROM diva_violation_raw WHERE number = 'TEST';

COMMENT ON COLUMN diva_violation_raw.classification_name IS 'Classification name for violation (사정분류명)';

-- Show final table structure
\d diva_violation_raw; 