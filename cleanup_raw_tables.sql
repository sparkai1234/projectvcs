-- =====================================================
-- CLEANUP UNUSED DIVA RAW TABLES
-- =====================================================
-- These tables exist in schema but are not used by the 
-- current DIVA scraper workflow which goes directly 
-- to processed tables.
-- =====================================================

-- Drop all DIVA raw tables (unused)
DROP TABLE IF EXISTS public.diva_financial_raw CASCADE;
DROP TABLE IF EXISTS public.diva_investment_performance_raw CASCADE;
DROP TABLE IF EXISTS public.diva_association_raw CASCADE;
DROP TABLE IF EXISTS public.diva_personnel_raw CASCADE;
DROP TABLE IF EXISTS public.diva_professional_raw CASCADE;
DROP TABLE IF EXISTS public.diva_disclosure_raw CASCADE;
DROP TABLE IF EXISTS public.diva_fund_raw CASCADE;
DROP TABLE IF EXISTS public.diva_vcmap_raw CASCADE;
DROP TABLE IF EXISTS public.diva_violation_raw CASCADE;

-- Verification query to confirm tables are dropped
SELECT 
    schemaname,
    tablename 
FROM pg_tables 
WHERE 
    schemaname = 'public' 
    AND tablename LIKE 'diva_%_raw'
ORDER BY tablename;

-- This should return 0 rows after cleanup

-- Summary of remaining DIVA tables (processed tables only)
SELECT 
    schemaname,
    tablename,
    'ACTIVE - Used by scraper' as status
FROM pg_tables 
WHERE 
    schemaname = 'public' 
    AND tablename LIKE 'diva_%'
    AND tablename NOT LIKE '%_raw'
ORDER BY tablename; 