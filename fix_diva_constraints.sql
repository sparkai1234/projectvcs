-- ================================
-- Fix DIVA Table Constraints for Upsert Operations
-- Adds unique constraints needed for ON CONFLICT clauses
-- ================================

-- Add unique constraint on company_id for diva_intelligence
-- (This allows ON CONFLICT operations)
ALTER TABLE diva_intelligence 
ADD CONSTRAINT unique_diva_intelligence_company_id 
UNIQUE (company_id);

-- Add unique constraint on company_id for diva_professional_network
ALTER TABLE diva_professional_network 
ADD CONSTRAINT unique_diva_professional_network_company_id 
UNIQUE (company_id);

-- Add unique constraint on company_id for diva_fund_intelligence
ALTER TABLE diva_fund_intelligence 
ADD CONSTRAINT unique_diva_fund_intelligence_company_id 
UNIQUE (company_id);

-- Verify the constraints were added
SELECT 
    tc.table_name,
    tc.constraint_name,
    tc.constraint_type,
    kcu.column_name
FROM information_schema.table_constraints tc
JOIN information_schema.key_column_usage kcu 
    ON tc.constraint_name = kcu.constraint_name
WHERE tc.table_schema = 'public'
    AND tc.table_name IN ('diva_intelligence', 'diva_professional_network', 'diva_fund_intelligence')
    AND tc.constraint_type = 'UNIQUE'
ORDER BY tc.table_name, tc.constraint_name; 