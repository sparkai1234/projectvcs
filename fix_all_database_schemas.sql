-- Fix All DIVA Database Schema Issues
-- Based on comprehensive diagnosis showing multiple missing columns

-- 1. Fix diva_personnel_raw - Make company_id nullable since it's not provided by scraper
ALTER TABLE diva_personnel_raw ALTER COLUMN company_id DROP NOT NULL;

-- 2. Fix diva_violation_raw - Add missing columns
ALTER TABLE diva_violation_raw ADD COLUMN IF NOT EXISTS correction_type TEXT;

-- 3. Fix diva_association_raw - Add missing columns  
ALTER TABLE diva_association_raw ADD COLUMN IF NOT EXISTS called_amount BIGINT;

-- 4. Fix diva_professional_raw - Add missing columns
ALTER TABLE diva_professional_raw ADD COLUMN IF NOT EXISTS experience TEXT;

-- 5. Create vc_map table if it doesn't exist
CREATE TABLE IF NOT EXISTS vc_map (
    id BIGSERIAL PRIMARY KEY,
    rank INTEGER,
    company_name TEXT,
    personnel_count INTEGER,
    professional_count INTEGER,
    extracted_at TIMESTAMPTZ DEFAULT NOW(),
    source_url TEXT,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Enable RLS for vc_map table
ALTER TABLE vc_map ENABLE ROW LEVEL SECURITY;

-- Create RLS policy for vc_map
DROP POLICY IF EXISTS "Enable all operations for authenticated users" ON vc_map;
CREATE POLICY "Enable all operations for authenticated users" ON vc_map 
FOR ALL TO authenticated USING (true) WITH CHECK (true);

-- Add any other missing columns to existing tables

-- For diva_financial_raw - ensure all columns exist
ALTER TABLE diva_financial_raw ADD COLUMN IF NOT EXISTS accounting_standard TEXT;
ALTER TABLE diva_financial_raw ADD COLUMN IF NOT EXISTS startup_investment_assets BIGINT;

-- For diva_association_raw - ensure all columns exist  
ALTER TABLE diva_association_raw ADD COLUMN IF NOT EXISTS fund_name TEXT;
ALTER TABLE diva_association_raw ADD COLUMN IF NOT EXISTS total_commitment BIGINT;
ALTER TABLE diva_association_raw ADD COLUMN IF NOT EXISTS establishment_date DATE;
ALTER TABLE diva_association_raw ADD COLUMN IF NOT EXISTS fund_duration_years INTEGER;
ALTER TABLE diva_association_raw ADD COLUMN IF NOT EXISTS fund_status TEXT;
ALTER TABLE diva_association_raw ADD COLUMN IF NOT EXISTS investment_focus TEXT;

-- For diva_professional_raw - ensure all columns exist
ALTER TABLE diva_professional_raw ADD COLUMN IF NOT EXISTS professional_name TEXT;
ALTER TABLE diva_professional_raw ADD COLUMN IF NOT EXISTS position TEXT;
ALTER TABLE diva_professional_raw ADD COLUMN IF NOT EXISTS specialization TEXT;

-- Verify all table structures
SELECT 
    table_name,
    column_name,
    data_type,
    is_nullable
FROM information_schema.columns 
WHERE table_name IN (
    'diva_investment_performance_raw',
    'diva_financial_raw', 
    'diva_personnel_raw',
    'diva_violation_raw',
    'diva_association_raw',
    'diva_professional_raw',
    'vc_map'
)
ORDER BY table_name, ordinal_position; 