-- ===============================================
-- RESET DIVA TABLES FOR FRESH APIFY RUN
-- ===============================================
-- This script deletes all DIVA data to prepare for a fresh scraper run
-- 
-- SAFE: Preserves these tables (DO NOT TOUCH):
--   - vc_table (your core VC data)
--   - fund_table (your core Fund data)
--   - diva_income_statements (you're working on this)
--   - diva_balance_sheets (you're working on this)
--   - contacts_full, contacts_matched (your contact data)
--   - unified_maintenance_reports (maintenance history)
-- 
-- WILL DELETE: These 6 DIVA tables for fresh scraping:
--   - diva_investment_performance
--   - diva_association_status  
--   - diva_personnel_status
--   - diva_professional_personnel
--   - diva_violations
--   - diva_vc_map
-- ===============================================

-- Show current counts before deletion
SELECT 'BEFORE DELETION - Current DIVA Table Counts' as status;

SELECT 
    'diva_investment_performance' as table_name, 
    (SELECT COUNT(*) FROM diva_investment_performance) as current_count
UNION ALL
SELECT 
    'diva_association_status' as table_name, 
    (SELECT COUNT(*) FROM diva_association_status) as current_count
UNION ALL
SELECT 
    'diva_personnel_status' as table_name, 
    (SELECT COUNT(*) FROM diva_personnel_status) as current_count
UNION ALL
SELECT 
    'diva_professional_personnel' as table_name, 
    (SELECT COUNT(*) FROM diva_professional_personnel) as current_count
UNION ALL
SELECT 
    'diva_violations' as table_name, 
    (SELECT COUNT(*) FROM diva_violations) as current_count
UNION ALL
SELECT 
    'diva_vc_map' as table_name, 
    (SELECT COUNT(*) FROM diva_vc_map) as current_count;

-- Calculate total records to be deleted
SELECT 
    'TOTAL_RECORDS_TO_DELETE' as description,
    (
        (SELECT COUNT(*) FROM diva_investment_performance) +
        (SELECT COUNT(*) FROM diva_association_status) +
        (SELECT COUNT(*) FROM diva_personnel_status) +
        (SELECT COUNT(*) FROM diva_professional_personnel) +
        (SELECT COUNT(*) FROM diva_violations) +
        (SELECT COUNT(*) FROM diva_vc_map)
    ) as total_records;

-- ===============================================
-- ACTUAL DELETION COMMANDS
-- ===============================================
-- Uncomment the DELETE statements below when ready to execute:

-- DELETE FROM diva_investment_performance;
-- DELETE FROM diva_association_status;
-- DELETE FROM diva_personnel_status;
-- DELETE FROM diva_professional_personnel;
-- DELETE FROM diva_violations;
-- DELETE FROM diva_vc_map;

-- ===============================================
-- VERIFICATION AFTER DELETION
-- ===============================================
-- Run this section after uncommenting and executing the DELETE statements above

-- Show counts after deletion (should all be 0)
SELECT 'AFTER DELETION - DIVA Table Counts (should be 0)' as status;

SELECT 
    'diva_investment_performance' as table_name, 
    (SELECT COUNT(*) FROM diva_investment_performance) as remaining_count
UNION ALL
SELECT 
    'diva_association_status' as table_name, 
    (SELECT COUNT(*) FROM diva_association_status) as remaining_count
UNION ALL
SELECT 
    'diva_personnel_status' as table_name, 
    (SELECT COUNT(*) FROM diva_personnel_status) as remaining_count
UNION ALL
SELECT 
    'diva_professional_personnel' as table_name, 
    (SELECT COUNT(*) FROM diva_professional_personnel) as remaining_count
UNION ALL
SELECT 
    'diva_violations' as table_name, 
    (SELECT COUNT(*) FROM diva_violations) as remaining_count
UNION ALL
SELECT 
    'diva_vc_map' as table_name, 
    (SELECT COUNT(*) FROM diva_vc_map) as remaining_count;

-- Verify preserved tables are untouched
SELECT 'PRESERVED TABLES - Should remain unchanged' as status;

SELECT 
    'vc_table' as table_name, 
    (SELECT COUNT(*) FROM vc_table) as preserved_count
UNION ALL
SELECT 
    'fund_table' as table_name, 
    (SELECT COUNT(*) FROM fund_table) as preserved_count
UNION ALL
SELECT 
    'diva_balance_sheets' as table_name, 
    (SELECT COUNT(*) FROM diva_balance_sheets) as preserved_count
UNION ALL
SELECT 
    'diva_income_statements' as table_name, 
    (SELECT COUNT(*) FROM diva_income_statements) as preserved_count
UNION ALL
SELECT 
    'contacts_full' as table_name, 
    (SELECT COUNT(*) FROM contacts_full) as preserved_count
UNION ALL
SELECT 
    'contacts_matched' as table_name, 
    (SELECT COUNT(*) FROM contacts_matched) as preserved_count;

-- Final confirmation
SELECT 
    CASE 
        WHEN (
            (SELECT COUNT(*) FROM diva_investment_performance) +
            (SELECT COUNT(*) FROM diva_association_status) +
            (SELECT COUNT(*) FROM diva_personnel_status) +
            (SELECT COUNT(*) FROM diva_professional_personnel) +
            (SELECT COUNT(*) FROM diva_violations) +
            (SELECT COUNT(*) FROM diva_vc_map)
        ) = 0 
        THEN '✅ SUCCESS: All DIVA tables cleared for fresh Apify run'
        ELSE '❌ WARNING: Some DIVA tables still contain data'
    END as cleanup_status; 