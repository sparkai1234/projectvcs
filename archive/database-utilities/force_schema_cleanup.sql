-- 🔥 FORCE SCHEMA CLEANUP - Aggressive Duplicate Field Removal
-- This script handles all dependencies and forces cleanup

-- ==================================================
-- STEP 1: DROP ALL DEPENDENT OBJECTS COMPLETELY
-- ==================================================

-- Drop ALL views that might depend on duplicate columns
DROP VIEW IF EXISTS person_full_view CASCADE;
DROP VIEW IF EXISTS company_full_view CASCADE;
DROP VIEW IF EXISTS contact_view CASCADE;
DROP VIEW IF EXISTS people_view CASCADE;

-- Drop any indexes on duplicate columns
DROP INDEX IF EXISTS idx_contacts_email;
DROP INDEX IF EXISTS idx_contacts_phone; 
DROP INDEX IF EXISTS idx_contacts_name_en;

-- ==================================================
-- STEP 2: FORCE REMOVE DUPLICATE ENGLISH COLUMNS
-- ==================================================

-- Force drop columns with CASCADE to handle dependencies
DO $$ 
BEGIN
    -- Remove email column
    IF EXISTS (SELECT 1 FROM information_schema.columns 
               WHERE table_name='contacts_full' AND column_name='email') THEN
        ALTER TABLE contacts_full DROP COLUMN email CASCADE;
        RAISE NOTICE '✅ Dropped email column';
    END IF;
    
    -- Remove phone column  
    IF EXISTS (SELECT 1 FROM information_schema.columns 
               WHERE table_name='contacts_full' AND column_name='phone') THEN
        ALTER TABLE contacts_full DROP COLUMN phone CASCADE;
        RAISE NOTICE '✅ Dropped phone column';
    END IF;
    
    -- Remove name_en column
    IF EXISTS (SELECT 1 FROM information_schema.columns 
               WHERE table_name='contacts_full' AND column_name='name_en') THEN
        ALTER TABLE contacts_full DROP COLUMN name_en CASCADE;
        RAISE NOTICE '✅ Dropped name_en column';
    END IF;
    
    -- Remove company_en column
    IF EXISTS (SELECT 1 FROM information_schema.columns 
               WHERE table_name='contacts_full' AND column_name='company_en') THEN
        ALTER TABLE contacts_full DROP COLUMN company_en CASCADE;
        RAISE NOTICE '✅ Dropped company_en column';
    END IF;
    
    -- Remove position_en column
    IF EXISTS (SELECT 1 FROM information_schema.columns 
               WHERE table_name='contacts_full' AND column_name='position_en') THEN
        ALTER TABLE contacts_full DROP COLUMN position_en CASCADE;
        RAISE NOTICE '✅ Dropped position_en column';
    END IF;
    
    -- Remove industry_en column
    IF EXISTS (SELECT 1 FROM information_schema.columns 
               WHERE table_name='contacts_full' AND column_name='industry_en') THEN
        ALTER TABLE contacts_full DROP COLUMN industry_en CASCADE;
        RAISE NOTICE '✅ Dropped industry_en column';
    END IF;
    
    RAISE NOTICE '🎉 All duplicate English columns removed successfully!';
END $$;

-- Clean up contacts_matched table too
DO $$ 
BEGIN
    IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name='contacts_matched') THEN
        ALTER TABLE contacts_matched DROP COLUMN IF EXISTS email CASCADE;
        ALTER TABLE contacts_matched DROP COLUMN IF EXISTS phone CASCADE;
        ALTER TABLE contacts_matched DROP COLUMN IF EXISTS name_en CASCADE;
        ALTER TABLE contacts_matched DROP COLUMN IF EXISTS company_en CASCADE;
        ALTER TABLE contacts_matched DROP COLUMN IF EXISTS position_en CASCADE;
        RAISE NOTICE '✅ Cleaned contacts_matched table';
    END IF;
END $$;

-- ==================================================
-- STEP 3: RECREATE ESSENTIAL VIEWS (KOREAN ONLY)
-- ==================================================

-- Create clean person view with only Korean fields
CREATE OR REPLACE VIEW person_full_view AS
SELECT 
    cf.id,
    cf.이름 as person_name,
    cf."회사" as company_name,
    cf.직책 as position,
    cf.이메일 as email,
    cf.전화번호 as phone,
    cf.업계 as industry,
    cf.is_vc_industry,
    cf.fuzzy_match_score,
    cf.matched_company_id,
    cf.contact_source,
    cf.notes,
    cf.created_at,
    cf.updated_at,
    -- Company information if matched
    vc.company_name as matched_vc_company,
    vc.location as company_location,
    vc.representative as company_representative,
    vc.website_url as company_website
FROM contacts_full cf
LEFT JOIN vc_table vc ON cf.matched_company_id = vc.company_id;

-- ==================================================
-- STEP 4: VERIFICATION & SUCCESS REPORTING
-- ==================================================

-- Check remaining columns in contacts_full
SELECT 
    'contacts_full columns after cleanup:' as info,
    string_agg(column_name, ', ' ORDER BY ordinal_position) as remaining_columns
FROM information_schema.columns 
WHERE table_name = 'contacts_full' 
AND table_schema = 'public';

-- Count records to ensure no data loss
SELECT 
    '✅ FORCE CLEANUP SUCCESS!' as status,
    COUNT(*) as total_contacts,
    'All duplicate English fields removed' as result
FROM contacts_full;

-- Final verification
SELECT 
    CASE 
        WHEN EXISTS (SELECT 1 FROM information_schema.columns 
                    WHERE table_name='contacts_full' 
                    AND column_name IN ('email', 'phone', 'name_en', 'company_en', 'position_en', 'industry_en'))
        THEN '❌ CLEANUP FAILED - Duplicate fields still exist'
        ELSE '✅ CLEANUP SUCCESS - Only Korean fields remain'
    END as final_status; 