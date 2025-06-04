-- 🔗 ADD FOREIGN KEY CONSTRAINTS LATER
-- =====================================
-- 
-- Run this AFTER the main tables are created and working
-- First check the vc_table structure to confirm the correct primary key

-- 🔍 First, check the vc_table structure:
SELECT column_name, data_type, is_nullable, column_default
FROM information_schema.columns 
WHERE table_name = 'vc_table' 
ORDER BY ordinal_position;

-- 🔍 Check what constraints exist on vc_table:
SELECT 
    tc.constraint_name, 
    tc.constraint_type, 
    kcu.column_name
FROM information_schema.table_constraints tc
JOIN information_schema.key_column_usage kcu 
    ON tc.constraint_name = kcu.constraint_name
WHERE tc.table_name = 'vc_table';

-- 🔗 ADD FOREIGN KEY CONSTRAINTS (uncomment after confirming structure)
-- 
-- If vc_table has a primary key on 'id' column:
-- ALTER TABLE diva_vcmap_raw 
-- ADD CONSTRAINT fk_vcmap_company 
-- FOREIGN KEY (company_id) 
-- REFERENCES vc_table(id)
-- ON DELETE CASCADE;
-- 
-- ALTER TABLE diva_violation_raw 
-- ADD CONSTRAINT fk_violations_company 
-- FOREIGN KEY (company_id) 
-- REFERENCES vc_table(id)
-- ON DELETE CASCADE;

-- 🔗 Alternative: If vc_table has unique constraint on company_name:
-- ALTER TABLE diva_vcmap_raw 
-- ADD CONSTRAINT fk_vcmap_company 
-- FOREIGN KEY (company_name) 
-- REFERENCES vc_table(company_name)
-- ON DELETE CASCADE;
-- 
-- ALTER TABLE diva_violation_raw 
-- ADD CONSTRAINT fk_violations_company 
-- FOREIGN KEY (company_name) 
-- REFERENCES vc_table(company_name)
-- ON DELETE CASCADE;

-- 📝 NOTE: Run the SELECT statements first to understand vc_table structure,
-- then uncomment and run the appropriate ALTER TABLE statements 