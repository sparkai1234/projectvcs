-- ============================================================
-- FUND TABLE SCHEMA UPDATE - Add Rich Data Fields
-- Execute in Supabase SQL Editor to support complete fund data
-- ============================================================

-- Add all missing fields for rich fund data structure
ALTER TABLE fund_table ADD COLUMN IF NOT EXISTS fund_id TEXT;
ALTER TABLE fund_table ADD COLUMN IF NOT EXISTS company_name TEXT;
ALTER TABLE fund_table ADD COLUMN IF NOT EXISTS total_amount BIGINT;
ALTER TABLE fund_table ADD COLUMN IF NOT EXISTS investment_field TEXT;
ALTER TABLE fund_table ADD COLUMN IF NOT EXISTS investment_detail TEXT;
ALTER TABLE fund_table ADD COLUMN IF NOT EXISTS investment_character TEXT;
ALTER TABLE fund_table ADD COLUMN IF NOT EXISTS company_industry TEXT;
ALTER TABLE fund_table ADD COLUMN IF NOT EXISTS registration_date DATE;
ALTER TABLE fund_table ADD COLUMN IF NOT EXISTS expiry_date DATE;
ALTER TABLE fund_table ADD COLUMN IF NOT EXISTS notes TEXT;
ALTER TABLE fund_table ADD COLUMN IF NOT EXISTS description TEXT;
ALTER TABLE fund_table ADD COLUMN IF NOT EXISTS sector TEXT;
ALTER TABLE fund_table ADD COLUMN IF NOT EXISTS data_source TEXT;
ALTER TABLE fund_table ADD COLUMN IF NOT EXISTS import_date TIMESTAMP WITH TIME ZONE;

-- Add indexes for better query performance
CREATE INDEX IF NOT EXISTS idx_fund_table_fund_id ON fund_table(fund_id);
CREATE INDEX IF NOT EXISTS idx_fund_table_company_name ON fund_table(company_name);
CREATE INDEX IF NOT EXISTS idx_fund_table_investment_field ON fund_table(investment_field);
CREATE INDEX IF NOT EXISTS idx_fund_table_registration_date ON fund_table(registration_date);
CREATE INDEX IF NOT EXISTS idx_fund_table_data_source ON fund_table(data_source);

-- Add comments for documentation
COMMENT ON COLUMN fund_table.fund_id IS 'Fund ID from Korean VC Database (e.g., AS20160034)';
COMMENT ON COLUMN fund_table.company_name IS 'VC Company name in Korean (e.g., 캡스톤파트너스)';
COMMENT ON COLUMN fund_table.total_amount IS 'Total fund amount in KRW';
COMMENT ON COLUMN fund_table.investment_field IS 'Investment field (e.g., 일반)';
COMMENT ON COLUMN fund_table.investment_detail IS 'Investment detail (e.g., 중소/벤처일반)';
COMMENT ON COLUMN fund_table.investment_character IS 'Investment character code (e.g., 02)';
COMMENT ON COLUMN fund_table.company_industry IS 'Company industry classification (e.g., 2)';
COMMENT ON COLUMN fund_table.registration_date IS 'Fund registration date';
COMMENT ON COLUMN fund_table.expiry_date IS 'Fund expiry date';
COMMENT ON COLUMN fund_table.data_source IS 'Data source (Korean VC Database - vcs.go.kr)';

-- Verify schema update
SELECT 
    'fund_table schema updated successfully' as status,
    count(*) as total_columns
FROM information_schema.columns 
WHERE table_name = 'fund_table' 
AND table_schema = 'public';

-- Show all columns after update
SELECT 
    column_name,
    data_type,
    is_nullable
FROM information_schema.columns 
WHERE table_name = 'fund_table' 
AND table_schema = 'public'
ORDER BY ordinal_position; 