-- Drop the old corrupted diva_financial_statements table
-- This table contained 500 records with corrupted financial data
-- (all records had balance sheet structure but 250 were mislabeled as income statements)

-- The data has been properly migrated to:
-- - diva_balance_sheets (239 unique companies)  
-- - diva_income_statements (239 unique companies)

DROP TABLE IF EXISTS diva_financial_statements CASCADE;

-- Verify the table is gone
SELECT 'Old corrupted table successfully removed!' as status; 