-- ========================================
-- SUPABASE AUTOMATED DEDUPLICATION SYSTEM
-- ========================================

-- 1. CREATE DEDUPLICATION FUNCTION
-- ========================================

CREATE OR REPLACE FUNCTION remove_duplicates_after_insert()
RETURNS TRIGGER AS $$
BEGIN
    -- Remove VC duplicates (keep most recent)
    IF TG_TABLE_NAME = 'vc_table' THEN
        DELETE FROM vc_table 
        WHERE company_name = NEW.company_name 
          AND id != NEW.id 
          AND created_at < NEW.created_at;
    END IF;
    
    -- Remove Fund duplicates (keep most recent)
    IF TG_TABLE_NAME = 'fund_table' THEN
        DELETE FROM fund_table 
        WHERE fund_name = NEW.fund_name 
          AND id != NEW.id 
          AND created_at < NEW.created_at;
    END IF;
    
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- ========================================
-- 2. CREATE TRIGGERS FOR AUTO-CLEANUP
-- ========================================

-- Trigger for VC table
DROP TRIGGER IF EXISTS auto_dedupe_vc_trigger ON vc_table;
CREATE TRIGGER auto_dedupe_vc_trigger
    AFTER INSERT ON vc_table
    FOR EACH ROW
    EXECUTE FUNCTION remove_duplicates_after_insert();

-- Trigger for Fund table  
DROP TRIGGER IF EXISTS auto_dedupe_fund_trigger ON fund_table;
CREATE TRIGGER auto_dedupe_fund_trigger
    AFTER INSERT ON fund_table
    FOR EACH ROW
    EXECUTE FUNCTION remove_duplicates_after_insert();

-- ========================================
-- 3. MANUAL CLEANUP FUNCTION (ON-DEMAND)
-- ========================================

CREATE OR REPLACE FUNCTION manual_dedupe_all_tables()
RETURNS TABLE(
    table_name TEXT,
    records_before INTEGER,
    records_after INTEGER,
    duplicates_removed INTEGER
) AS $$
DECLARE
    vc_before INTEGER;
    vc_after INTEGER;
    fund_before INTEGER;
    fund_after INTEGER;
BEGIN
    -- Count before cleanup
    SELECT COUNT(*) INTO vc_before FROM vc_table;
    SELECT COUNT(*) INTO fund_before FROM fund_table;
    
    -- Cleanup VCs (keep latest)
    DELETE FROM vc_table v1
    WHERE EXISTS (
        SELECT 1 FROM vc_table v2 
        WHERE v2.company_name = v1.company_name 
          AND v2.created_at > v1.created_at
    );
    
    -- Cleanup Funds (keep latest)
    DELETE FROM fund_table f1
    WHERE EXISTS (
        SELECT 1 FROM fund_table f2 
        WHERE f2.fund_name = f1.fund_name 
          AND f2.created_at > f1.created_at
    );
    
    -- Count after cleanup
    SELECT COUNT(*) INTO vc_after FROM vc_table;
    SELECT COUNT(*) INTO fund_after FROM fund_table;
    
    -- Return results
    RETURN QUERY VALUES 
        ('vc_table', vc_before, vc_after, vc_before - vc_after),
        ('fund_table', fund_before, fund_after, fund_before - fund_after);
END;
$$ LANGUAGE plpgsql;

-- ========================================
-- 4. DUPLICATE CHECK FUNCTION
-- ========================================

CREATE OR REPLACE FUNCTION check_duplicates()
RETURNS TABLE(
    table_name TEXT,
    total_records INTEGER,
    unique_records INTEGER,
    duplicate_count INTEGER,
    duplicate_percentage NUMERIC
) AS $$
BEGIN
    RETURN QUERY
    SELECT 
        'vc_table'::TEXT,
        (SELECT COUNT(*)::INTEGER FROM vc_table),
        (SELECT COUNT(DISTINCT company_name)::INTEGER FROM vc_table),
        (SELECT COUNT(*)::INTEGER FROM vc_table) - (SELECT COUNT(DISTINCT company_name)::INTEGER FROM vc_table),
        ROUND(
            ((SELECT COUNT(*)::INTEGER FROM vc_table) - (SELECT COUNT(DISTINCT company_name)::INTEGER FROM vc_table))::NUMERIC / 
            NULLIF((SELECT COUNT(*)::INTEGER FROM vc_table), 0) * 100, 2
        )
    UNION ALL
    SELECT 
        'fund_table'::TEXT,
        (SELECT COUNT(*)::INTEGER FROM fund_table),
        (SELECT COUNT(DISTINCT fund_name)::INTEGER FROM fund_table),
        (SELECT COUNT(*)::INTEGER FROM fund_table) - (SELECT COUNT(DISTINCT fund_name)::INTEGER FROM fund_table),
        ROUND(
            ((SELECT COUNT(*)::INTEGER FROM fund_table) - (SELECT COUNT(DISTINCT fund_name)::INTEGER FROM fund_table))::NUMERIC / 
            NULLIF((SELECT COUNT(*)::INTEGER FROM fund_table), 0) * 100, 2
        );
END;
$$ LANGUAGE plpgsql;

-- ========================================
-- 5. USAGE EXAMPLES
-- ========================================

-- Check current duplicates:
-- SELECT * FROM check_duplicates();

-- Run manual cleanup:
-- SELECT * FROM manual_dedupe_all_tables();

-- Test auto-deduplication (triggers work automatically on INSERT) 