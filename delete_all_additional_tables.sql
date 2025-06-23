-- =====================================================
-- DELETE ALL KVIC, KDB, KGROWTH, PDF TABLES
-- =====================================================
-- This will delete 9 tables total:
-- - 7 empty tables (0 records)
-- - 2 tables with minimal data (5 records total)
-- =====================================================

-- KVIC Tables (all empty)
DROP TABLE IF EXISTS public.kvic_fund_raw CASCADE;
DROP TABLE IF EXISTS public.kvic_investment_raw CASCADE;
DROP TABLE IF EXISTS public.kvic_portfolio_raw CASCADE;

-- KDB Table (3 records - will be deleted)
DROP TABLE IF EXISTS public.kdb_fund_of_funds_raw CASCADE;

-- KGrowth Table (2 records - will be deleted)
DROP TABLE IF EXISTS public.kgrowth_fund_of_funds_raw CASCADE;

-- PDF/AI Analysis Tables (all empty)
DROP TABLE IF EXISTS public.pdf_analysis_results CASCADE;
DROP TABLE IF EXISTS public.ai_trend_insights CASCADE;
DROP TABLE IF EXISTS public.investment_intelligence_insights CASCADE;
DROP TABLE IF EXISTS public.trend_reports CASCADE;

-- Verification query (should return 0 rows after cleanup)
SELECT 
    tablename,
    'SHOULD NOT EXIST AFTER CLEANUP' as status
FROM pg_tables 
WHERE 
    schemaname = 'public' 
    AND (
        tablename LIKE 'kvic_%' OR
        tablename LIKE 'kdb_%' OR
        tablename LIKE 'kgrowth_%' OR
        tablename IN ('pdf_analysis_results', 'ai_trend_insights', 'investment_intelligence_insights', 'trend_reports')
    )
ORDER BY tablename;

-- Final verification: Show remaining DIVA tables (should only show processed tables)
SELECT 
    tablename,
    'ACTIVE DIVA TABLE' as status
FROM pg_tables 
WHERE 
    schemaname = 'public' 
    AND tablename LIKE 'diva_%'
ORDER BY tablename; 