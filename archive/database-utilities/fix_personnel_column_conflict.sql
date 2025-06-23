-- Fix Personnel Table Column Conflict
-- Handle the case where management_support_staff column already exists

-- First, create the table if it doesn't exist
CREATE TABLE IF NOT EXISTS diva_personnel_raw (
    id BIGSERIAL PRIMARY KEY,
    company_name TEXT,
    total_staff INTEGER,
    professional_staff INTEGER,
    investment_review_staff INTEGER,
    extracted_at TIMESTAMPTZ DEFAULT NOW(),
    source_url TEXT,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Add the management_support_staff column only if it doesn't exist
-- Use a function to check and add conditionally
DO $$
BEGIN
    -- Check if the column exists
    IF NOT EXISTS (
        SELECT 1 
        FROM information_schema.columns 
        WHERE table_name = 'diva_personnel_raw' 
        AND column_name = 'management_support_staff'
    ) THEN
        -- Add the column if it doesn't exist
        ALTER TABLE diva_personnel_raw ADD COLUMN management_support_staff INTEGER;
        RAISE NOTICE 'Added management_support_staff column';
    ELSE
        RAISE NOTICE 'management_support_staff column already exists';
    END IF;
END $$;

-- Enable RLS
ALTER TABLE diva_personnel_raw ENABLE ROW LEVEL SECURITY;

-- Create or replace the RLS policy
DROP POLICY IF EXISTS "Enable all operations for authenticated users" ON diva_personnel_raw;
CREATE POLICY "Enable all operations for authenticated users" ON diva_personnel_raw 
FOR ALL TO authenticated USING (true) WITH CHECK (true);

-- Verify the final table structure
SELECT 
    column_name, 
    data_type, 
    is_nullable,
    column_default
FROM information_schema.columns 
WHERE table_name = 'diva_personnel_raw' 
ORDER BY ordinal_position; 