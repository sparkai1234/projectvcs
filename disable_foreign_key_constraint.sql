-- Temporarily disable foreign key constraint for fund_table
-- This allows funds to have company_ids that don't exist in vc_table

-- Drop the foreign key constraint
ALTER TABLE fund_table DROP CONSTRAINT IF EXISTS fund_table_company_id_fkey;

-- Verify constraint is removed
SELECT conname, contype 
FROM pg_constraint 
WHERE conrelid = 'fund_table'::regclass 
  AND contype = 'f';

-- Note: We can re-add the constraint later if needed:
-- ALTER TABLE fund_table ADD CONSTRAINT fund_table_company_id_fkey 
-- FOREIGN KEY (company_id) REFERENCES vc_table(company_id); 