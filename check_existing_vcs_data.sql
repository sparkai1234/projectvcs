-- Check existing VCS data in vc_table
-- This will help us understand what data is already imported

-- Count VCS records by source
SELECT 
    apify_source,
    COUNT(*) as record_count,
    MIN(import_date) as first_imported,
    MAX(import_date) as last_imported
FROM vc_table 
WHERE apify_source LIKE '%VCS%' OR apify_source LIKE '%API%'
GROUP BY apify_source
ORDER BY record_count DESC;

-- Check specific company that caused the error
SELECT 
    company_id,
    company_name,
    apify_source,
    import_date,
    created_at
FROM vc_table 
WHERE company_id = 'OP20220559';

-- Get sample of existing VCS data (first 5 records)
SELECT 
    company_id,
    company_name,
    location,
    apify_source,
    import_date
FROM vc_table 
WHERE apify_source LIKE '%VCS%' OR apify_source LIKE '%API%'
ORDER BY import_date DESC
LIMIT 5; 