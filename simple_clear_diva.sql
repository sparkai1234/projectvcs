-- Complete DIVA Database Clearing Script
-- Based on actual Supabase schema - run each DELETE statement individually

-- Core DIVA raw tables
DELETE FROM diva_financial_raw;            -- Main table with 525 records
DELETE FROM diva_association_raw;
DELETE FROM diva_disclosure_raw;
DELETE FROM diva_fund_raw;
DELETE FROM diva_personnel_raw;
DELETE FROM diva_professional_raw;
DELETE FROM diva_investment_performance_raw;
DELETE FROM diva_vcmap_raw;
DELETE FROM diva_violation_raw;

-- DIVA processed/status tables  
DELETE FROM diva_association_status;
DELETE FROM diva_financial_statements;
DELETE FROM diva_investment_performance;
DELETE FROM diva_personnel_status;
DELETE FROM diva_professional_personnel;
DELETE FROM diva_vc_map;
DELETE FROM diva_violations;

-- DIVA intelligence tables
DELETE FROM diva_fund_intelligence;
DELETE FROM diva_intelligence;
DELETE FROM diva_professional_network;

-- Verification - count remaining records in key tables
SELECT 'diva_financial_raw' as table_name, COUNT(*) as remaining FROM diva_financial_raw
UNION ALL
SELECT 'diva_association_raw' as table_name, COUNT(*) as remaining FROM diva_association_raw
UNION ALL  
SELECT 'diva_vc_map' as table_name, COUNT(*) as remaining FROM diva_vc_map
UNION ALL
SELECT 'diva_violations' as table_name, COUNT(*) as remaining FROM diva_violations
UNION ALL
SELECT 'diva_investment_performance' as table_name, COUNT(*) as remaining FROM diva_investment_performance
UNION ALL
SELECT 'diva_professional_personnel' as table_name, COUNT(*) as remaining FROM diva_professional_personnel; 