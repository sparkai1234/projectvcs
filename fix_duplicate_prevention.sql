-- ===============================================
-- FIX DUPLICATE PREVENTION IN DIVA TABLES
-- ===============================================
-- Add unique constraints to prevent duplicates at database level
-- This will force the scraper to handle conflicts properly
-- ===============================================

-- 1. Investment Performance - unique per company per year
ALTER TABLE diva_investment_performance 
ADD CONSTRAINT unique_investment_performance 
UNIQUE (company_name, data_year);

-- 2. Association Status - unique per company per fund
-- Note: Some companies might have multiple funds, so we'll use company+fund combo
-- If fund_name is nullable, we'll just use company_name
ALTER TABLE diva_association_status 
ADD CONSTRAINT unique_association_status 
UNIQUE (company_name, fund_name);

-- Alternative if fund_name has too many nulls:
-- ALTER TABLE diva_association_status 
-- ADD CONSTRAINT unique_association_status 
-- UNIQUE (company_name, data_year);

-- 3. Personnel Status - unique per company per year
ALTER TABLE diva_personnel_status 
ADD CONSTRAINT unique_personnel_status 
UNIQUE (company_name, data_year);

-- 4. Professional Personnel - unique per company per person per year
-- This allows multiple people per company but prevents duplicate person entries
ALTER TABLE diva_professional_personnel 
ADD CONSTRAINT unique_professional_personnel 
UNIQUE (company_name, person_name, data_year);

-- 5. Violations - unique per company per violation type per year
-- This allows multiple violations per company but prevents duplicate violations
ALTER TABLE diva_violations 
ADD CONSTRAINT unique_violations 
UNIQUE (company_name, violation_type, data_year);

-- 6. VC Map - unique per company per year
ALTER TABLE diva_vc_map 
ADD CONSTRAINT unique_vc_map 
UNIQUE (company_name, data_year);

-- Verify constraints were added
SELECT 
    table_name,
    constraint_name,
    constraint_type
FROM information_schema.table_constraints 
WHERE table_schema = 'public' 
AND table_name LIKE 'diva_%'
AND constraint_type = 'UNIQUE'
ORDER BY table_name; 