-- 🧹 CLEAR DIVA TABLES ONLY - Preserve All Other Data
-- Safe deletion script for fresh DIVA scraper production run
-- Date: June 10, 2025
-- Purpose: Remove old DIVA data to prevent overwrite conflicts

-- ⚠️  IMPORTANT: This only affects DIVA tables, all other tables remain untouched

BEGIN;

DO $$ 
DECLARE 
    row_count INTEGER;
BEGIN
    -- Clear DIVA Investment Performance
    DELETE FROM diva_investment_performance;
    GET DIAGNOSTICS row_count = ROW_COUNT;
    RAISE NOTICE 'Cleared diva_investment_performance: % records removed', row_count;

    -- Clear DIVA Financial Statements  
    DELETE FROM diva_financial_statements;
    GET DIAGNOSTICS row_count = ROW_COUNT;
    RAISE NOTICE 'Cleared diva_financial_statements: % records removed', row_count;

    -- Clear DIVA Association Status
    DELETE FROM diva_association_status;
    GET DIAGNOSTICS row_count = ROW_COUNT;
    RAISE NOTICE 'Cleared diva_association_status: % records removed', row_count;

    -- Clear DIVA Personnel Status
    DELETE FROM diva_personnel_status;
    GET DIAGNOSTICS row_count = ROW_COUNT;
    RAISE NOTICE 'Cleared diva_personnel_status: % records removed', row_count;

    -- Clear DIVA Professional Personnel
    DELETE FROM diva_professional_personnel;
    GET DIAGNOSTICS row_count = ROW_COUNT;
    RAISE NOTICE 'Cleared diva_professional_personnel: % records removed', row_count;

    -- Clear DIVA Violations
    DELETE FROM diva_violations;
    GET DIAGNOSTICS row_count = ROW_COUNT;
    RAISE NOTICE 'Cleared diva_violations: % records removed', row_count;

    -- Clear DIVA VC Map
    DELETE FROM diva_vc_map;
    GET DIAGNOSTICS row_count = ROW_COUNT;
    RAISE NOTICE 'Cleared diva_vc_map: % records removed', row_count;
    
END $$;

-- Verify all DIVA tables are empty
SELECT 
    'diva_investment_performance' as table_name, 
    COUNT(*) as remaining_records 
FROM diva_investment_performance
UNION ALL
SELECT 
    'diva_financial_statements' as table_name, 
    COUNT(*) as remaining_records 
FROM diva_financial_statements
UNION ALL
SELECT 
    'diva_association_status' as table_name, 
    COUNT(*) as remaining_records 
FROM diva_association_status
UNION ALL
SELECT 
    'diva_personnel_status' as table_name, 
    COUNT(*) as remaining_records 
FROM diva_personnel_status
UNION ALL
SELECT 
    'diva_professional_personnel' as table_name, 
    COUNT(*) as remaining_records 
FROM diva_professional_personnel
UNION ALL
SELECT 
    'diva_violations' as table_name, 
    COUNT(*) as remaining_records 
FROM diva_violations
UNION ALL
SELECT 
    'diva_vc_map' as table_name, 
    COUNT(*) as remaining_records 
FROM diva_vc_map;

COMMIT;

-- 🎯 SUMMARY: All DIVA tables cleared successfully
-- Ready for fresh production scraper run with zero conflicts
-- All other database tables remain completely untouched 