-- Cleanup Fund Table - Remove unwanted fields
-- Remove fields that are no longer needed

ALTER TABLE fund_table DROP COLUMN IF EXISTS commitment_amount;
ALTER TABLE fund_table DROP COLUMN IF EXISTS total_amount;
ALTER TABLE fund_table DROP COLUMN IF EXISTS registration_date;
ALTER TABLE fund_table DROP COLUMN IF EXISTS investment_focus;
ALTER TABLE fund_table DROP COLUMN IF EXISTS fund_type;
ALTER TABLE fund_table DROP COLUMN IF EXISTS fund_details;
ALTER TABLE fund_table DROP COLUMN IF EXISTS investment_field;
ALTER TABLE fund_table DROP COLUMN IF EXISTS investment_character;
ALTER TABLE fund_table DROP COLUMN IF EXISTS company_industry;
ALTER TABLE fund_table DROP COLUMN IF EXISTS description;
ALTER TABLE fund_table DROP COLUMN IF EXISTS sector;
ALTER TABLE fund_table DROP COLUMN IF EXISTS data_source;

-- Verify remaining structure
SELECT column_name, data_type 
FROM information_schema.columns 
WHERE table_name = 'fund_table' 
ORDER BY ordinal_position;
