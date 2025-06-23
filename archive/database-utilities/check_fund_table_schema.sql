-- Check actual fund_table schema
-- Run this in Supabase SQL Editor to see the real column structure

SELECT 
    column_name,
    data_type,
    is_nullable,
    column_default
FROM information_schema.columns 
WHERE table_name = 'fund_table' 
AND table_schema = 'public'
ORDER BY ordinal_position;

-- Alternative query if the above doesn't work
SELECT * FROM fund_table LIMIT 0; 