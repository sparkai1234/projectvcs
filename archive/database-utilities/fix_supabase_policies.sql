-- ================================
-- FIX SUPABASE RLS POLICIES FOR SERVICE ROLE
-- This fixes the 401 authentication issues
-- ================================

-- Disable RLS on all tables for service role access
-- This is the most straightforward approach for backend operations

-- Option 1: Completely disable RLS (simplest for backend operations)
ALTER TABLE vc_table DISABLE ROW LEVEL SECURITY;
ALTER TABLE fund_table DISABLE ROW LEVEL SECURITY;
ALTER TABLE diva_intelligence DISABLE ROW LEVEL SECURITY;
ALTER TABLE diva_professional_network DISABLE ROW LEVEL SECURITY;
ALTER TABLE diva_fund_intelligence DISABLE ROW LEVEL SECURITY;
ALTER TABLE contacts_full DISABLE ROW LEVEL SECURITY;
ALTER TABLE contacts_matched DISABLE ROW LEVEL SECURITY;

-- Option 2: If you prefer to keep RLS enabled but allow service role access
-- Uncomment the section below instead of the DISABLE commands above

/*
-- Create bypass policies for service role
DROP POLICY IF EXISTS "Bypass RLS for service role" ON vc_table;
CREATE POLICY "Bypass RLS for service role" ON vc_table FOR ALL 
TO service_role
USING (true);

DROP POLICY IF EXISTS "Bypass RLS for service role" ON fund_table;
CREATE POLICY "Bypass RLS for service role" ON fund_table FOR ALL 
TO service_role
USING (true);

DROP POLICY IF EXISTS "Bypass RLS for service role" ON diva_intelligence;
CREATE POLICY "Bypass RLS for service role" ON diva_intelligence FOR ALL 
TO service_role
USING (true);

DROP POLICY IF EXISTS "Bypass RLS for service role" ON diva_professional_network;
CREATE POLICY "Bypass RLS for service role" ON diva_professional_network FOR ALL 
TO service_role
USING (true);

DROP POLICY IF EXISTS "Bypass RLS for service role" ON diva_fund_intelligence;
CREATE POLICY "Bypass RLS for service role" ON diva_fund_intelligence FOR ALL 
TO service_role
USING (true);

DROP POLICY IF EXISTS "Bypass RLS for service role" ON contacts_full;
CREATE POLICY "Bypass RLS for service role" ON contacts_full FOR ALL 
TO service_role
USING (true);

DROP POLICY IF EXISTS "Bypass RLS for service role" ON contacts_matched;
CREATE POLICY "Bypass RLS for service role" ON contacts_matched FOR ALL 
TO service_role
USING (true);
*/

-- Verify current policies
SELECT schemaname, tablename, policyname, roles
FROM pg_policies 
WHERE schemaname = 'public' 
AND tablename IN ('vc_table', 'fund_table', 'diva_intelligence', 'diva_professional_network', 'diva_fund_intelligence', 'contacts_full', 'contacts_matched');

-- Check RLS status
SELECT schemaname, tablename, rowsecurity
FROM pg_tables 
WHERE schemaname = 'public' 
AND tablename IN ('vc_table', 'fund_table', 'diva_intelligence', 'diva_professional_network', 'diva_fund_intelligence', 'contacts_full', 'contacts_matched')
ORDER BY tablename; 