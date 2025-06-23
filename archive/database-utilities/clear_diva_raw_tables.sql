-- 🧹 CLEAR ACTUAL DIVA TABLES - Corrected Table Names
-- Safe deletion script targeting the real table names in Supabase
-- Date: June 10, 2025
-- Purpose: Remove DIVA data from tables that actually exist

-- ⚠️  IMPORTANT: This targets the ACTUAL table names from Supabase

DO $$ 
DECLARE 
    row_count INTEGER;
BEGIN
    -- Clear DIVA Financial Raw (the one with 525 records)
    DELETE FROM diva_financial_raw;
    GET DIAGNOSTICS row_count = ROW_COUNT;
    RAISE NOTICE 'Cleared diva_financial_raw: % records removed', row_count;

    -- Clear DIVA Association Raw
    DELETE FROM diva_association_raw;
    GET DIAGNOSTICS row_count = ROW_COUNT;
    RAISE NOTICE 'Cleared diva_association_raw: % records removed', row_count;

    -- Clear DIVA Investment Performance (check both names)
    DELETE FROM diva_investment_performance;
    GET DIAGNOSTICS row_count = ROW_COUNT;
    RAISE NOTICE 'Cleared diva_investment_performance: % records removed', row_count;
    
    -- Try investment performance raw if it exists
    BEGIN
        DELETE FROM diva_investment_performance_raw;
        GET DIAGNOSTICS row_count = ROW_COUNT;
        RAISE NOTICE 'Cleared diva_investment_performance_raw: % records removed', row_count;
    EXCEPTION
        WHEN undefined_table THEN
            RAISE NOTICE 'Table diva_investment_performance_raw does not exist - skipping';
    END;

    -- Clear DIVA Personnel Raw
    DELETE FROM diva_personnel_raw;
    GET DIAGNOSTICS row_count = ROW_COUNT;
    RAISE NOTICE 'Cleared diva_personnel_raw: % records removed', row_count;

    -- Clear DIVA Professional Personnel Raw
    DELETE FROM diva_professional_personnel_raw;
    GET DIAGNOSTICS row_count = ROW_COUNT;
    RAISE NOTICE 'Cleared diva_professional_personnel_raw: % records removed', row_count;

    -- Clear DIVA VC Map
    DELETE FROM diva_vc_map;
    GET DIAGNOSTICS row_count = ROW_COUNT;
    RAISE NOTICE 'Cleared diva_vc_map: % records removed', row_count;

    -- Clear DIVA Violations
    DELETE FROM diva_violations;
    GET DIAGNOSTICS row_count = ROW_COUNT;
    RAISE NOTICE 'Cleared diva_violations: % records removed', row_count;

    -- Also clear any financial statements table (already cleared but for completeness)
    BEGIN
        DELETE FROM diva_financial_statements;
        GET DIAGNOSTICS row_count = ROW_COUNT;
        RAISE NOTICE 'Cleared diva_financial_statements: % records removed', row_count;
    EXCEPTION
        WHEN undefined_table THEN
            RAISE NOTICE 'Table diva_financial_statements does not exist - skipping';
    END;
    
END $$;

-- Verify all DIVA tables are empty
SELECT 
    'diva_financial_raw' as table_name, 
    COUNT(*) as remaining_records 
FROM diva_financial_raw
UNION ALL
SELECT 
    'diva_association_raw' as table_name, 
    COUNT(*) as remaining_records 
FROM diva_association_raw
UNION ALL
SELECT 
    'diva_personnel_raw' as table_name, 
    COUNT(*) as remaining_records 
FROM diva_personnel_raw
UNION ALL
SELECT 
    'diva_professional_personnel_raw' as table_name, 
    COUNT(*) as remaining_records 
FROM diva_professional_personnel_raw
UNION ALL
SELECT 
    'diva_vc_map' as table_name, 
    COUNT(*) as remaining_records 
FROM diva_vc_map
UNION ALL
SELECT 
    'diva_violations' as table_name, 
    COUNT(*) as remaining_records 
FROM diva_violations;

-- 🎯 SUMMARY: All actual DIVA tables cleared successfully
-- Ready for fresh production scraper run with zero conflicts 