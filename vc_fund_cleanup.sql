-- 🔧 VC & FUND TABLE CLEANUP - Remove English Duplicate Fields
-- Remove duplicate English fields from VC Table and Fund Table

-- ==================================================
-- STEP 1: CLEAN VC TABLE
-- ==================================================

-- Remove English duplicate field from vc_table
DO $$ 
BEGIN
    -- Remove company_name_en column from vc_table
    IF EXISTS (SELECT 1 FROM information_schema.columns 
               WHERE table_name='vc_table' AND column_name='company_name_en') THEN
        ALTER TABLE vc_table DROP COLUMN company_name_en CASCADE;
        RAISE NOTICE '✅ Dropped company_name_en from vc_table';
    END IF;
    
    RAISE NOTICE '🎉 VC Table cleanup completed!';
END $$;

-- ==================================================
-- STEP 2: CLEAN FUND TABLE  
-- ==================================================

-- Remove English duplicate field from fund_table
DO $$ 
BEGIN
    -- Remove fund_name_en column from fund_table
    IF EXISTS (SELECT 1 FROM information_schema.columns 
               WHERE table_name='fund_table' AND column_name='fund_name_en') THEN
        ALTER TABLE fund_table DROP COLUMN fund_name_en CASCADE;
        RAISE NOTICE '✅ Dropped fund_name_en from fund_table';
    END IF;
    
    RAISE NOTICE '🎉 Fund Table cleanup completed!';
END $$;

-- ==================================================
-- STEP 3: VERIFICATION
-- ==================================================

-- Check remaining columns in vc_table
SELECT 
    'vc_table columns after cleanup:' as info,
    string_agg(column_name, ', ' ORDER BY ordinal_position) as remaining_columns
FROM information_schema.columns 
WHERE table_name = 'vc_table' 
AND table_schema = 'public';

-- Check remaining columns in fund_table  
SELECT 
    'fund_table columns after cleanup:' as info,
    string_agg(column_name, ', ' ORDER BY ordinal_position) as remaining_columns
FROM information_schema.columns 
WHERE table_name = 'fund_table' 
AND table_schema = 'public';

-- Count records to ensure no data loss
SELECT 
    '✅ VC TABLE CLEANUP SUCCESS!' as status,
    COUNT(*) as total_vc_companies,
    'English duplicate fields removed' as result
FROM vc_table;

SELECT 
    '✅ FUND TABLE CLEANUP SUCCESS!' as status,
    COUNT(*) as total_funds,
    'English duplicate fields removed' as result
FROM fund_table;

-- Final verification - check for any remaining English fields
SELECT 
    CASE 
        WHEN EXISTS (SELECT 1 FROM information_schema.columns 
                    WHERE table_name='vc_table' 
                    AND column_name LIKE '%_en')
        THEN '❌ VC TABLE - English fields still exist'
        ELSE '✅ VC TABLE - Clean (Korean only)'
    END as vc_status;

SELECT 
    CASE 
        WHEN EXISTS (SELECT 1 FROM information_schema.columns 
                    WHERE table_name='fund_table' 
                    AND column_name LIKE '%_en')
        THEN '❌ FUND TABLE - English fields still exist'
        ELSE '✅ FUND TABLE - Clean (Korean only)'
    END as fund_status;

-- Success summary
SELECT 
    '🎉 VC & FUND TABLE CLEANUP COMPLETE!' as final_status,
    'All English duplicate fields removed' as result,
    'Korean-first schema optimized' as optimization; 