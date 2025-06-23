-- ================================
-- Clean Up Duplicates and Add Constraints
-- Removes duplicate records before adding unique constraints
-- ================================

-- Step 1: Check for duplicates in each table
SELECT 'diva_intelligence duplicates:' as table_check;
SELECT company_id, COUNT(*) as count 
FROM diva_intelligence 
WHERE company_id IS NOT NULL
GROUP BY company_id 
HAVING COUNT(*) > 1;

SELECT 'diva_professional_network duplicates:' as table_check;
SELECT company_id, COUNT(*) as count 
FROM diva_professional_network 
WHERE company_id IS NOT NULL
GROUP BY company_id 
HAVING COUNT(*) > 1;

SELECT 'diva_fund_intelligence duplicates:' as table_check;
SELECT company_id, COUNT(*) as count 
FROM diva_fund_intelligence 
WHERE company_id IS NOT NULL
GROUP BY company_id 
HAVING COUNT(*) > 1;

-- Step 2: Clean up duplicates (keep the most recent record for each company_id)

-- Clean diva_intelligence duplicates
DELETE FROM diva_intelligence 
WHERE id NOT IN (
    SELECT DISTINCT ON (company_id) id 
    FROM diva_intelligence 
    WHERE company_id IS NOT NULL
    ORDER BY company_id, created_at DESC
);

-- Clean diva_professional_network duplicates  
DELETE FROM diva_professional_network 
WHERE id NOT IN (
    SELECT DISTINCT ON (company_id) id 
    FROM diva_professional_network 
    WHERE company_id IS NOT NULL
    ORDER BY company_id, created_at DESC
);

-- Clean diva_fund_intelligence duplicates
DELETE FROM diva_fund_intelligence 
WHERE id NOT IN (
    SELECT DISTINCT ON (company_id) id 
    FROM diva_fund_intelligence 
    WHERE company_id IS NOT NULL
    ORDER BY company_id, created_at DESC
);

-- Step 3: Add unique constraints (now that duplicates are cleaned)

-- Add unique constraint on company_id for diva_intelligence
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

-- Step 4: Verify final record counts and constraints
SELECT 'Final record counts:' as summary;

SELECT 'diva_intelligence' as table_name, COUNT(*) as total_records, COUNT(DISTINCT company_id) as unique_companies
FROM diva_intelligence;

SELECT 'diva_professional_network' as table_name, COUNT(*) as total_records, COUNT(DISTINCT company_id) as unique_companies  
FROM diva_professional_network;

SELECT 'diva_fund_intelligence' as table_name, COUNT(*) as total_records, COUNT(DISTINCT company_id) as unique_companies
FROM diva_fund_intelligence;

-- Verify constraints were added
SELECT 'Unique constraints added:' as constraints_summary;
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