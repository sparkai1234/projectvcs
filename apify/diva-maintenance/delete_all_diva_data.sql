-- Enhanced DIVA Maintenance System v2.2
-- COMPLETE DIVA DATA DELETION SCRIPT
-- This script deletes ALL data from DIVA tables while preserving table structures
-- Run this in your Supabase SQL Editor to clean all DIVA data for fresh repopulation

-- ⚠️ WARNING: This will permanently delete ALL DIVA data
-- Make sure you have backups if needed - this action cannot be undone

-- Show current data counts before deletion
DO $$
DECLARE
    investment_count INTEGER := 0;
    financial_count INTEGER := 0;
    association_count INTEGER := 0;
    personnel_count INTEGER := 0;
    professional_count INTEGER := 0;
    violations_count INTEGER := 0;
    vcmap_count INTEGER := 0;
    network_count INTEGER := 0;
    total_count INTEGER := 0;
BEGIN
    RAISE NOTICE '🔍 === CURRENT DIVA DATA COUNTS ===';
    
    -- Count each table
    SELECT COUNT(*) INTO investment_count FROM diva_investment_performance;
    RAISE NOTICE 'diva_investment_performance: % records', investment_count;
    
    SELECT COUNT(*) INTO financial_count FROM diva_financial_statements;
    RAISE NOTICE 'diva_financial_statements: % records', financial_count;
    
    SELECT COUNT(*) INTO association_count FROM diva_association_status;
    RAISE NOTICE 'diva_association_status: % records', association_count;
    
    SELECT COUNT(*) INTO personnel_count FROM diva_personnel_status;
    RAISE NOTICE 'diva_personnel_status: % records', personnel_count;
    
    SELECT COUNT(*) INTO professional_count FROM diva_professional_personnel;
    RAISE NOTICE 'diva_professional_personnel: % records', professional_count;
    
    SELECT COUNT(*) INTO violations_count FROM diva_violations;
    RAISE NOTICE 'diva_violations: % records', violations_count;
    
    SELECT COUNT(*) INTO vcmap_count FROM diva_vc_map;
    RAISE NOTICE 'diva_vc_map: % records', vcmap_count;
    
    SELECT COUNT(*) INTO network_count FROM diva_professional_network;
    RAISE NOTICE 'diva_professional_network: % records', network_count;
    
    total_count := investment_count + financial_count + association_count + 
                   personnel_count + professional_count + violations_count + 
                   vcmap_count + network_count;
    
    RAISE NOTICE '📊 TOTAL DIVA RECORDS: %', total_count;
    RAISE NOTICE '';
    RAISE NOTICE '🗑️ === STARTING DATA DELETION ===';
    
EXCEPTION
    WHEN OTHERS THEN
        RAISE NOTICE 'Error counting records: %', SQLERRM;
END $$;

-- Delete all data from DIVA tables in safe order
-- Start with tables that might have foreign key dependencies

-- 1. Delete professional network data
DELETE FROM diva_professional_network;
SELECT 'diva_professional_network data deleted' AS status;

-- 2. Delete VC map data
DELETE FROM diva_vc_map;
SELECT 'diva_vc_map data deleted' AS status;

-- 3. Delete violations data
DELETE FROM diva_violations;
SELECT 'diva_violations data deleted' AS status;

-- 4. Delete professional personnel data
DELETE FROM diva_professional_personnel;
SELECT 'diva_professional_personnel data deleted' AS status;

-- 5. Delete personnel status data
DELETE FROM diva_personnel_status;
SELECT 'diva_personnel_status data deleted' AS status;

-- 6. Delete association status data
DELETE FROM diva_association_status;
SELECT 'diva_association_status data deleted' AS status;

-- 7. Delete financial statements data
DELETE FROM diva_financial_statements;
SELECT 'diva_financial_statements data deleted' AS status;

-- 8. Delete investment performance data
DELETE FROM diva_investment_performance;
SELECT 'diva_investment_performance data deleted' AS status;

-- Reset auto-increment sequences to start fresh
-- This ensures new data starts with ID = 1

DO $$
BEGIN
    RAISE NOTICE '🔄 === RESETTING AUTO-INCREMENT SEQUENCES ===';
    
    -- Reset sequences if they exist
    PERFORM setval(pg_get_serial_sequence('diva_investment_performance', 'id'), 1, false);
    RAISE NOTICE 'Reset diva_investment_performance sequence';
    
    PERFORM setval(pg_get_serial_sequence('diva_financial_statements', 'id'), 1, false);
    RAISE NOTICE 'Reset diva_financial_statements sequence';
    
    PERFORM setval(pg_get_serial_sequence('diva_association_status', 'id'), 1, false);
    RAISE NOTICE 'Reset diva_association_status sequence';
    
    PERFORM setval(pg_get_serial_sequence('diva_personnel_status', 'id'), 1, false);
    RAISE NOTICE 'Reset diva_personnel_status sequence';
    
    PERFORM setval(pg_get_serial_sequence('diva_professional_personnel', 'id'), 1, false);
    RAISE NOTICE 'Reset diva_professional_personnel sequence';
    
    PERFORM setval(pg_get_serial_sequence('diva_violations', 'id'), 1, false);
    RAISE NOTICE 'Reset diva_violations sequence';
    
    PERFORM setval(pg_get_serial_sequence('diva_vc_map', 'id'), 1, false);
    RAISE NOTICE 'Reset diva_vc_map sequence';
    
    PERFORM setval(pg_get_serial_sequence('diva_professional_network', 'id'), 1, false);
    RAISE NOTICE 'Reset diva_professional_network sequence';
    
EXCEPTION
    WHEN OTHERS THEN
        RAISE NOTICE 'Note: Some sequences may not exist or cannot be reset: %', SQLERRM;
END $$;

-- Verification: Confirm all tables are now empty
DO $$
DECLARE
    investment_count INTEGER := 0;
    financial_count INTEGER := 0;
    association_count INTEGER := 0;
    personnel_count INTEGER := 0;
    professional_count INTEGER := 0;
    violations_count INTEGER := 0;
    vcmap_count INTEGER := 0;
    network_count INTEGER := 0;
    total_remaining INTEGER := 0;
BEGIN
    RAISE NOTICE '';
    RAISE NOTICE '✅ === VERIFICATION: POST-DELETION COUNTS ===';
    
    -- Count remaining records
    SELECT COUNT(*) INTO investment_count FROM diva_investment_performance;
    SELECT COUNT(*) INTO financial_count FROM diva_financial_statements;
    SELECT COUNT(*) INTO association_count FROM diva_association_status;
    SELECT COUNT(*) INTO personnel_count FROM diva_personnel_status;
    SELECT COUNT(*) INTO professional_count FROM diva_professional_personnel;
    SELECT COUNT(*) INTO violations_count FROM diva_violations;
    SELECT COUNT(*) INTO vcmap_count FROM diva_vc_map;
    SELECT COUNT(*) INTO network_count FROM diva_professional_network;
    
    total_remaining := investment_count + financial_count + association_count + 
                      personnel_count + professional_count + violations_count + 
                      vcmap_count + network_count;
    
    IF total_remaining = 0 THEN
        RAISE NOTICE '🎉 SUCCESS: All DIVA data has been deleted (% records remaining)', total_remaining;
        RAISE NOTICE '📋 All table structures preserved';
        RAISE NOTICE '🔄 All sequences reset to start from ID 1';
        RAISE NOTICE '✅ Database ready for fresh DIVA data population';
    ELSE
        RAISE NOTICE '⚠️ WARNING: % records still remain - please check manually', total_remaining;
        RAISE NOTICE 'Remaining: inv:% fin:% assoc:% pers:% prof:% viol:% vc:% net:%', 
                     investment_count, financial_count, association_count, 
                     personnel_count, professional_count, violations_count, 
                     vcmap_count, network_count;
    END IF;
    
EXCEPTION
    WHEN OTHERS THEN
        RAISE NOTICE 'Error during verification: %', SQLERRM;
END $$;

-- Final status
SELECT '🎯 DIVA data deletion script completed' AS final_status;
SELECT 'Ready for fresh data population' AS next_step; 