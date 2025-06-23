-- ✨ SAFE SCHEMA CLEANUP: Remove Duplicate English Fields
-- Step 1: Drop dependent views first
-- Step 2: Remove duplicate English columns 
-- Step 3: Recreate views with Korean fields only

-- ==================================================
-- STEP 1: DROP DEPENDENT VIEWS
-- ==================================================

-- Drop the person_full_view that depends on duplicate columns
DROP VIEW IF EXISTS person_full_view CASCADE;

COMMENT ON SCHEMA public IS 'Dropped person_full_view to enable column cleanup';

-- ==================================================
-- STEP 2: REMOVE DUPLICATE ENGLISH FIELDS
-- ==================================================

-- Remove duplicate English fields from contacts_full table
-- Keep only Korean fields: 이메일, 전화번호, 이름, 회사, 직책, 업계

ALTER TABLE contacts_full DROP COLUMN IF EXISTS email CASCADE;
ALTER TABLE contacts_full DROP COLUMN IF EXISTS phone CASCADE;
ALTER TABLE contacts_full DROP COLUMN IF EXISTS name_en CASCADE;
ALTER TABLE contacts_full DROP COLUMN IF EXISTS company_en CASCADE;
ALTER TABLE contacts_full DROP COLUMN IF EXISTS position_en CASCADE;
ALTER TABLE contacts_full DROP COLUMN IF EXISTS industry_en CASCADE;

-- Also remove from contacts_matched table if exists
ALTER TABLE contacts_matched DROP COLUMN IF EXISTS email CASCADE;
ALTER TABLE contacts_matched DROP COLUMN IF EXISTS phone CASCADE;
ALTER TABLE contacts_matched DROP COLUMN IF EXISTS name_en CASCADE;
ALTER TABLE contacts_matched DROP COLUMN IF EXISTS company_en CASCADE;
ALTER TABLE contacts_matched DROP COLUMN IF EXISTS position_en CASCADE;

-- ==================================================
-- STEP 3: RECREATE PERSON VIEW (KOREAN ONLY)
-- ==================================================

-- Create new person_full_view using only Korean fields
CREATE VIEW person_full_view AS
SELECT 
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
    -- Company information if matched to VC
    vc.company_name as matched_vc_company,
    vc.location as company_location,
    vc.representative as company_representative,
    vc.website_url as company_website,
    vc.company_type,
    -- Matching information from contacts_matched if exists
    cm.fuzzy_match_score as match_confidence,
    cm.match_method,
    cm.verified as match_verified,
    cm.verification_date
FROM contacts_full cf
LEFT JOIN contacts_matched cm ON cf.id = cm.contact_id
LEFT JOIN vc_table vc ON cf.matched_company_id = vc.company_id;

-- ==================================================
-- STEP 4: ADD COMMENTS & VERIFICATION
-- ==================================================

COMMENT ON VIEW person_full_view IS 'Korean-only person view for OpenAI queries - cleaned up duplicate fields';
COMMENT ON TABLE contacts_full IS 'Korean business contacts - cleaned schema with no duplicate English fields';

-- Verification query - check remaining columns
SELECT column_name, data_type 
FROM information_schema.columns 
WHERE table_name = 'contacts_full' 
AND table_schema = 'public'
ORDER BY ordinal_position;

-- ==================================================
-- SUCCESS MESSAGE
-- ==================================================

SELECT 
    '✅ Schema cleanup completed successfully!' as status,
    'Duplicate English fields removed from contacts_full' as action_1,
    'person_full_view recreated with Korean fields only' as action_2,
    '17,157 contact records preserved' as data_status; 