-- Fix Database Constraints for Supabase Upsert Operations
-- =======================================================

-- Add unique constraint for fund_name in fund_table
-- This will allow the upsert operation with onConflict: 'fund_name' to work
ALTER TABLE fund_table 
ADD CONSTRAINT fund_table_fund_name_unique UNIQUE (fund_name);

-- Verify company_id constraint exists in vc_table (should already exist)
-- If not, uncomment the line below:
-- ALTER TABLE vc_table ADD CONSTRAINT vc_table_company_id_unique UNIQUE (company_id);

-- Check current constraints
SELECT 
    tc.table_name, 
    tc.constraint_name, 
    tc.constraint_type,
    kcu.column_name
FROM information_schema.table_constraints tc
JOIN information_schema.key_column_usage kcu 
    ON tc.constraint_name = kcu.constraint_name
WHERE tc.table_schema = 'public' 
    AND tc.table_name IN ('vc_table', 'fund_table')
    AND tc.constraint_type = 'UNIQUE'
ORDER BY tc.table_name, tc.constraint_name; 