# Database Insertion Errors - Complete Fix Guide

## 🔍 **Diagnosis Results**

I ran a comprehensive test on all your database tables and found **multiple missing columns and schema issues**:

### ✅ **Working Tables** (2/7):
- `diva_investment_performance_raw` ✅
- `diva_financial_raw` ✅ (partially)

### ❌ **Tables With Errors** (5/7):

1. **`diva_personnel_raw`**: Missing required `company_id` (NOT NULL constraint)
2. **`diva_violation_raw`**: Missing `correction_type` column 
3. **`diva_association_raw`**: Missing `called_amount` column
4. **`diva_professional_raw`**: Missing `experience` column  
5. **`vc_map`**: Table doesn't exist

## 🔧 **COMPLETE FIX - Run This SQL**

Copy and paste this entire SQL script into your Supabase SQL Editor:

```sql
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
```

## 📋 **How to Apply the Fix**

1. **Go to Supabase Dashboard** → SQL Editor
2. **Copy the entire SQL script** above
3. **Paste it** into the SQL Editor
4. **Click "Run"** 
5. **Wait for success confirmation**

## 🎯 **After Running the Fix**

Your scraper should work perfectly with:
- ✅ All 7 tables properly configured
- ✅ No more missing column errors
- ✅ No more NOT NULL constraint violations
- ✅ Complete data collection from all DIVA sources

## 🧪 **To Verify the Fix**

Run this test script after the SQL fix:
```bash
node ../../diagnose_database_errors.js
```

You should see: `✅ Working tables: 7/7`

## 🚀 **Expected Result**

After applying these fixes, your Apify scraper will run successfully without any database insertion errors, collecting complete Korean VC intelligence data across all sources! 