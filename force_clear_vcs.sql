-- Force clear all VCS-related data
-- Run this in Supabase SQL Editor

-- 1. First, disable foreign key constraints temporarily
SET session_replication_role = 'replica';

-- 2. Clear all dependent tables
DELETE FROM contacts_matched;
DELETE FROM fund_table;
DELETE FROM vc_table;

-- 3. Re-enable foreign key constraints
SET session_replication_role = 'origin';

-- 4. Verify all tables are empty
SELECT 'vc_table' as table_name, count(*) as remaining_records FROM vc_table
UNION ALL
SELECT 'fund_table' as table_name, count(*) as remaining_records FROM fund_table
UNION ALL
SELECT 'contacts_matched' as table_name, count(*) as remaining_records FROM contacts_matched;

-- Expected result: All counts should be 0 