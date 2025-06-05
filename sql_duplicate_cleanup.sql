-- ========================================
-- SUPABASE DUPLICATE DETECTION & CLEANUP
-- ========================================

-- 1. ANALYZE CURRENT DUPLICATES
-- ========================================

-- Check VC table duplicates (by company_name)
SELECT 
    'VC Duplicates' as table_name,
    company_name,
    COUNT(*) as duplicate_count
FROM vc_table 
GROUP BY company_name 
HAVING COUNT(*) > 1
ORDER BY duplicate_count DESC;

-- Check Fund table duplicates (by fund_name)
SELECT 
    'Fund Duplicates' as table_name,
    fund_name,
    COUNT(*) as duplicate_count
FROM fund_table 
GROUP BY fund_name 
HAVING COUNT(*) > 1
ORDER BY duplicate_count DESC;

-- Get total duplicate counts
SELECT 
    'Summary' as type,
    (SELECT COUNT(*) FROM vc_table) as total_vcs,
    (SELECT COUNT(DISTINCT company_name) FROM vc_table) as unique_vcs,
    (SELECT COUNT(*) FROM fund_table) as total_funds,
    (SELECT COUNT(DISTINCT fund_name) FROM fund_table) as unique_funds;

-- ========================================
-- 2. CLEANUP DUPLICATES (KEEP LATEST)
-- ========================================

-- Delete duplicate VCs (keep the most recent entry for each company_name)
DELETE FROM vc_table 
WHERE id NOT IN (
    SELECT DISTINCT ON (company_name) id
    FROM vc_table 
    ORDER BY company_name, created_at DESC
);

-- Delete duplicate Funds (keep the most recent entry for each fund_name)
DELETE FROM fund_table 
WHERE id NOT IN (
    SELECT DISTINCT ON (fund_name) id
    FROM fund_table 
    ORDER BY fund_name, created_at DESC
);

-- ========================================
-- 3. VERIFY CLEANUP RESULTS
-- ========================================

-- Check remaining duplicates (should be zero)
SELECT 
    'Post-Cleanup VCs' as type,
    COUNT(*) as total_records,
    COUNT(DISTINCT company_name) as unique_names,
    COUNT(*) - COUNT(DISTINCT company_name) as remaining_duplicates
FROM vc_table;

SELECT 
    'Post-Cleanup Funds' as type,
    COUNT(*) as total_records,
    COUNT(DISTINCT fund_name) as unique_names,
    COUNT(*) - COUNT(DISTINCT fund_name) as remaining_duplicates
FROM fund_table;

-- Show cleanup summary
SELECT 
    'CLEANUP COMPLETE' as status,
    (SELECT COUNT(*) FROM vc_table) as final_vcs,
    (SELECT COUNT(*) FROM fund_table) as final_funds,
    (SELECT COUNT(*) FROM vc_table) + (SELECT COUNT(*) FROM fund_table) as total_records; 