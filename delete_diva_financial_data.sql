-- ===============================================
-- DELETE DIVA FINANCIAL DATA
-- Script to clear corrupted financial data before migration
-- Note: Uses the new separate tables architecture
-- ===============================================

-- Disable foreign key checks temporarily (if needed)
-- SET session_replication_role = replica;

-- Delete all records from diva_balance_sheets table
DELETE FROM diva_balance_sheets;

-- Delete all records from diva_income_statements table  
DELETE FROM diva_income_statements;

-- Optional: Reset sequences if using auto-incrementing IDs
-- ALTER SEQUENCE diva_balance_sheets_id_seq RESTART WITH 1;
-- ALTER SEQUENCE diva_income_statements_id_seq RESTART WITH 1;

-- Re-enable foreign key checks (if disabled above)
-- SET session_replication_role = DEFAULT;

-- Verify deletion
SELECT 'diva_balance_sheets' as table_name, COUNT(*) as remaining_records FROM diva_balance_sheets
UNION ALL
SELECT 'diva_income_statements' as table_name, COUNT(*) as remaining_records FROM diva_income_statements;

-- Expected result: Both tables should show 0 remaining records 