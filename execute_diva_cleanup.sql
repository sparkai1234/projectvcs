-- ===============================================
-- EXECUTE DIVA CLEANUP - DIRECT DELETION
-- ===============================================
-- This script directly deletes all DIVA data for fresh Apify run
-- SAFE: Does NOT touch vc_table, fund_table, diva_balance_sheets, diva_income_statements
-- ===============================================

-- Show current counts before deletion
SELECT 'Current counts before cleanup:' as status;
SELECT 
    'diva_investment_performance' as table_name, 
    COUNT(*) as current_count 
FROM diva_investment_performance
UNION ALL
SELECT 'diva_association_status', COUNT(*) FROM diva_association_status
UNION ALL
SELECT 'diva_personnel_status', COUNT(*) FROM diva_personnel_status
UNION ALL
SELECT 'diva_professional_personnel', COUNT(*) FROM diva_professional_personnel
UNION ALL
SELECT 'diva_violations', COUNT(*) FROM diva_violations
UNION ALL
SELECT 'diva_vc_map', COUNT(*) FROM diva_vc_map;

-- Execute deletions
DELETE FROM diva_investment_performance;
DELETE FROM diva_association_status;
DELETE FROM diva_personnel_status;
DELETE FROM diva_professional_personnel;
DELETE FROM diva_violations;
DELETE FROM diva_vc_map;

-- Verify deletion (should all show 0)
SELECT 'Counts after cleanup (should be 0):' as status;
SELECT 
    'diva_investment_performance' as table_name, 
    COUNT(*) as remaining_count 
FROM diva_investment_performance
UNION ALL
SELECT 'diva_association_status', COUNT(*) FROM diva_association_status
UNION ALL
SELECT 'diva_personnel_status', COUNT(*) FROM diva_personnel_status
UNION ALL
SELECT 'diva_professional_personnel', COUNT(*) FROM diva_professional_personnel
UNION ALL
SELECT 'diva_violations', COUNT(*) FROM diva_violations
UNION ALL
SELECT 'diva_vc_map', COUNT(*) FROM diva_vc_map;

-- Final status check
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
        THEN '✅ SUCCESS: All DIVA tables cleared - Ready for fresh Apify run!'
        ELSE '❌ ERROR: Some tables still contain data'
    END as final_status; 