-- 🧹 SAFE CLEAR DIVA TABLES - Handles Missing Tables
-- Safe deletion script with error handling for non-existent tables
-- Date: June 10, 2025

DO $$ 
DECLARE 
    row_count INTEGER;
BEGIN
    -- Clear DIVA Financial Raw (the one with 525 records)
    BEGIN
        DELETE FROM diva_financial_raw;
        GET DIAGNOSTICS row_count = ROW_COUNT;
        RAISE NOTICE 'Cleared diva_financial_raw: % records removed', row_count;
    EXCEPTION
        WHEN undefined_table THEN
            RAISE NOTICE 'Table diva_financial_raw does not exist - skipping';
    END;

    -- Clear DIVA Association Raw
    BEGIN
        DELETE FROM diva_association_raw;
        GET DIAGNOSTICS row_count = ROW_COUNT;
        RAISE NOTICE 'Cleared diva_association_raw: % records removed', row_count;
    EXCEPTION
        WHEN undefined_table THEN
            RAISE NOTICE 'Table diva_association_raw does not exist - skipping';
    END;

    -- Clear DIVA Investment Performance
    BEGIN
        DELETE FROM diva_investment_performance;
        GET DIAGNOSTICS row_count = ROW_COUNT;
        RAISE NOTICE 'Cleared diva_investment_performance: % records removed', row_count;
    EXCEPTION
        WHEN undefined_table THEN
            RAISE NOTICE 'Table diva_investment_performance does not exist - skipping';
    END;

    -- Clear DIVA Personnel Raw
    BEGIN
        DELETE FROM diva_personnel_raw;
        GET DIAGNOSTICS row_count = ROW_COUNT;
        RAISE NOTICE 'Cleared diva_personnel_raw: % records removed', row_count;
    EXCEPTION
        WHEN undefined_table THEN
            RAISE NOTICE 'Table diva_personnel_raw does not exist - skipping';
    END;

    -- Clear DIVA Professional Personnel Raw (this one was missing)
    BEGIN
        DELETE FROM diva_professional_personnel_raw;
        GET DIAGNOSTICS row_count = ROW_COUNT;
        RAISE NOTICE 'Cleared diva_professional_personnel_raw: % records removed', row_count;
    EXCEPTION
        WHEN undefined_table THEN
            RAISE NOTICE 'Table diva_professional_personnel_raw does not exist - skipping';
    END;

    -- Clear DIVA Professional Personnel (try without _raw)
    BEGIN
        DELETE FROM diva_professional_personnel;
        GET DIAGNOSTICS row_count = ROW_COUNT;
        RAISE NOTICE 'Cleared diva_professional_personnel: % records removed', row_count;
    EXCEPTION
        WHEN undefined_table THEN
            RAISE NOTICE 'Table diva_professional_personnel does not exist - skipping';
    END;

    -- Clear DIVA VC Map
    BEGIN
        DELETE FROM diva_vc_map;
        GET DIAGNOSTICS row_count = ROW_COUNT;
        RAISE NOTICE 'Cleared diva_vc_map: % records removed', row_count;
    EXCEPTION
        WHEN undefined_table THEN
            RAISE NOTICE 'Table diva_vc_map does not exist - skipping';
    END;

    -- Clear DIVA Violations
    BEGIN
        DELETE FROM diva_violations;
        GET DIAGNOSTICS row_count = ROW_COUNT;
        RAISE NOTICE 'Cleared diva_violations: % records removed', row_count;
    EXCEPTION
        WHEN undefined_table THEN
            RAISE NOTICE 'Table diva_violations does not exist - skipping';
    END;

    -- Clear DIVA Financial Statements (try without _raw)
    BEGIN
        DELETE FROM diva_financial_statements;
        GET DIAGNOSTICS row_count = ROW_COUNT;
        RAISE NOTICE 'Cleared diva_financial_statements: % records removed', row_count;
    EXCEPTION
        WHEN undefined_table THEN
            RAISE NOTICE 'Table diva_financial_statements does not exist - skipping';
    END;

    -- Clear DIVA Association Status (try without _raw)
    BEGIN
        DELETE FROM diva_association_status;
        GET DIAGNOSTICS row_count = ROW_COUNT;
        RAISE NOTICE 'Cleared diva_association_status: % records removed', row_count;
    EXCEPTION
        WHEN undefined_table THEN
            RAISE NOTICE 'Table diva_association_status does not exist - skipping';
    END;

    -- Clear DIVA Personnel Status (try without _raw)
    BEGIN
        DELETE FROM diva_personnel_status;
        GET DIAGNOSTICS row_count = ROW_COUNT;
        RAISE NOTICE 'Cleared diva_personnel_status: % records removed', row_count;
    EXCEPTION
        WHEN undefined_table THEN
            RAISE NOTICE 'Table diva_personnel_status does not exist - skipping';
    END;
    
    RAISE NOTICE 'DIVA table cleanup completed!';
END $$; 