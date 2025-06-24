-- ===============================================
-- CHECK CURRENT DIVA TABLE COUNTS
-- ===============================================
-- Compare current database counts with DIVA scraper targets
-- Expected totals from scraper: 4,843 records across 6 tables
-- ===============================================

-- Show current counts vs expected targets
SELECT 
    'investment_performance' as table_name, 
    (SELECT COUNT(*) FROM diva_investment_performance) as current_count,
    333 as expected_target,
    (SELECT COUNT(*) FROM diva_investment_performance) - 333 as difference
UNION ALL
SELECT 
    'association_status' as table_name, 
    (SELECT COUNT(*) FROM diva_association_status) as current_count,
    2231 as expected_target,
    (SELECT COUNT(*) FROM diva_association_status) - 2231 as difference
UNION ALL
SELECT 
    'personnel_status' as table_name, 
    (SELECT COUNT(*) FROM diva_personnel_status) as current_count,
    251 as expected_target,
    (SELECT COUNT(*) FROM diva_personnel_status) - 251 as difference
UNION ALL
SELECT 
    'professional_personnel' as table_name, 
    (SELECT COUNT(*) FROM diva_professional_personnel) as current_count,
    1685 as expected_target,
    (SELECT COUNT(*) FROM diva_professional_personnel) - 1685 as difference
UNION ALL
SELECT 
    'violations' as table_name, 
    (SELECT COUNT(*) FROM diva_violations) as current_count,
    92 as expected_target,
    (SELECT COUNT(*) FROM diva_violations) - 92 as difference
UNION ALL
SELECT 
    'vc_map' as table_name, 
    (SELECT COUNT(*) FROM diva_vc_map) as current_count,
    251 as expected_target,
    (SELECT COUNT(*) FROM diva_vc_map) - 251 as difference
ORDER BY difference DESC;

-- Calculate total summary
SELECT 
    'SUMMARY' as description,
    (
        (SELECT COUNT(*) FROM diva_investment_performance) +
        (SELECT COUNT(*) FROM diva_association_status) +
        (SELECT COUNT(*) FROM diva_personnel_status) +
        (SELECT COUNT(*) FROM diva_professional_personnel) +
        (SELECT COUNT(*) FROM diva_violations) +
        (SELECT COUNT(*) FROM diva_vc_map)
    ) as current_total,
    4843 as expected_total,
    (
        (SELECT COUNT(*) FROM diva_investment_performance) +
        (SELECT COUNT(*) FROM diva_association_status) +
        (SELECT COUNT(*) FROM diva_personnel_status) +
        (SELECT COUNT(*) FROM diva_professional_personnel) +
        (SELECT COUNT(*) FROM diva_violations) +
        (SELECT COUNT(*) FROM diva_vc_map)
    ) - 4843 as total_difference; 