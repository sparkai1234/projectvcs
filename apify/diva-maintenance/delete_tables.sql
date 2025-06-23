-- Enhanced DIVA Maintenance System v2.2
-- Table Deletion Script
-- Run this in your Supabase SQL Editor to remove specified tables

-- WARNING: This will permanently delete the tables and all their data
-- Make sure you have backups if needed

-- Check if tables exist and show their record counts before deletion
DO $$
DECLARE
    fund_intel_count INTEGER := 0;
    intel_count INTEGER := 0;
    person_view_count INTEGER := 0;
BEGIN
    -- Check diva_fund_intelligence
    SELECT COUNT(*) INTO fund_intel_count 
    FROM diva_fund_intelligence;
    RAISE NOTICE 'diva_fund_intelligence has % records', fund_intel_count;
    
    -- Check diva_intelligence  
    SELECT COUNT(*) INTO intel_count 
    FROM diva_intelligence;
    RAISE NOTICE 'diva_intelligence has % records', intel_count;
    
    -- Check person_full_view
    SELECT COUNT(*) INTO person_view_count 
    FROM person_full_view;
    RAISE NOTICE 'person_full_view has % records', person_view_count;
    
EXCEPTION
    WHEN OTHERS THEN
        RAISE NOTICE 'Error checking table counts: %', SQLERRM;
END $$;

-- Drop tables and views in safe order (considering potential dependencies)
-- Note: CASCADE will remove dependent objects (views, foreign keys, etc.)

-- 1. Drop diva_fund_intelligence (TABLE)
DROP TABLE IF EXISTS diva_fund_intelligence CASCADE;
SELECT 'diva_fund_intelligence table deleted' AS status;

-- 2. Drop diva_intelligence (TABLE)
DROP TABLE IF EXISTS diva_intelligence CASCADE;
SELECT 'diva_intelligence table deleted' AS status;

-- 3. Drop person_full_view (VIEW)
DROP VIEW IF EXISTS person_full_view CASCADE;
SELECT 'person_full_view view deleted' AS status;

-- Verification: Check that tables and views no longer exist
DO $$
BEGIN
    -- Check for remaining tables
    PERFORM 1 FROM information_schema.tables 
    WHERE table_name IN ('diva_fund_intelligence', 'diva_intelligence')
    AND table_schema = 'public';
    
    -- Check for remaining views
    PERFORM 1 FROM information_schema.views 
    WHERE table_name = 'person_full_view'
    AND table_schema = 'public';
    
    IF NOT FOUND THEN
        RAISE NOTICE '✅ All specified tables and views have been successfully deleted';
    ELSE
        RAISE NOTICE '⚠️ Some tables/views may still exist - please check manually';
    END IF;
END $$;

-- Optional: Clean up any orphaned sequences
-- (Uncomment if you want to remove auto-increment sequences)
-- DROP SEQUENCE IF EXISTS diva_fund_intelligence_id_seq CASCADE;
-- DROP SEQUENCE IF EXISTS diva_intelligence_id_seq CASCADE;
-- DROP SEQUENCE IF EXISTS person_full_view_id_seq CASCADE;

SELECT 'Table deletion script completed' AS final_status; 