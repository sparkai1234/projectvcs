-- =====================================================
-- CLEAN OLD FINANCIAL STATEMENTS DATA
-- =====================================================
-- WARNING: This will permanently delete data from diva_financial_statements table ONLY
-- SAFE: Does NOT touch diva_balance_sheets or diva_income_statements tables
-- 
-- Purpose: Remove old financial statements data that was scraped before 
-- the dual-tab financial scraping was disabled in DIVA scraper v5.3.21
-- =====================================================

-- Check if diva_financial_statements table exists and show current count
SELECT 
    CASE 
        WHEN EXISTS (SELECT 1 FROM information_schema.tables 
                     WHERE table_schema = 'public' 
                     AND table_name = 'diva_financial_statements')
        THEN CONCAT('diva_financial_statements table exists with ', 
                   (SELECT COUNT(*) FROM diva_financial_statements), ' records')
        ELSE 'diva_financial_statements table does not exist'
    END as table_status;

-- Delete all records from diva_financial_statements table (if it exists)
-- Uncomment the line below when ready to execute:
-- DELETE FROM diva_financial_statements;

-- Alternative: Drop the entire table (uncomment if you want to remove the table completely)
-- DROP TABLE IF EXISTS diva_financial_statements CASCADE;

-- Show final DIVA table counts after cleanup (6 active tables only)
SELECT 
    'investment_performance' as table_name, 
    (SELECT COUNT(*) FROM diva_investment_performance) as record_count,
    '333 expected' as target
UNION ALL
SELECT 
    'association_status' as table_name, 
    (SELECT COUNT(*) FROM diva_association_status) as record_count,
    '2,231 expected' as target
UNION ALL
SELECT 
    'personnel_status' as table_name, 
    (SELECT COUNT(*) FROM diva_personnel_status) as record_count,
    '251 expected' as target
UNION ALL
SELECT 
    'professional_personnel' as table_name, 
    (SELECT COUNT(*) FROM diva_professional_personnel) as record_count,
    '1,685 expected' as target
UNION ALL
SELECT 
    'violations' as table_name, 
    (SELECT COUNT(*) FROM diva_violations) as record_count,
    '92 expected' as target
UNION ALL
SELECT 
    'vc_map' as table_name, 
    (SELECT COUNT(*) FROM diva_vc_map) as record_count,
    '251 expected' as target;

-- Calculate total records across 6 active DIVA tables (excluding financial_statements)
SELECT 
    'TOTAL_ACTIVE_RECORDS' as description,
    (
        (SELECT COUNT(*) FROM diva_investment_performance) +
        (SELECT COUNT(*) FROM diva_association_status) +
        (SELECT COUNT(*) FROM diva_personnel_status) +
        (SELECT COUNT(*) FROM diva_professional_personnel) +
        (SELECT COUNT(*) FROM diva_violations) +
        (SELECT COUNT(*) FROM diva_vc_map)
    ) as current_total,
    '4,843' as expected_total;

-- =====================================================
-- RESET AUTO-INCREMENT (PostgreSQL/Supabase)
-- =====================================================

-- Reset the sequence for the ID column (optional)
-- ALTER SEQUENCE diva_financial_statements_id_seq RESTART WITH 1;

-- =====================================================
-- NOTES:
-- =====================================================
-- 1. This script ONLY affects diva_financial_statements table
-- 2. diva_balance and diva_income tables are NOT touched
-- 3. Uncomment the DELETE statements when ready to execute
-- 4. Run the check queries first to see what will be deleted
-- 5. Consider backing up data before deletion if needed
-- ===================================================== 