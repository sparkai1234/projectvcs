-- ===============================================
-- COMPREHENSIVE DATA VERIFICATION
-- Check both balance sheets and income statements
-- ===============================================

-- 1. Count records in both tables
SELECT 
    'RECORD COUNTS' as section,
    'Balance Sheets' as table_name, 
    COUNT(*) as record_count
FROM diva_balance_sheets
WHERE data_year = 2024

UNION ALL

SELECT 
    'RECORD COUNTS' as section,
    'Income Statements' as table_name, 
    COUNT(*) as record_count
FROM diva_income_statements  
WHERE data_year = 2024;

-- 2. Show ALL Balance Sheet Records
SELECT 
    'BALANCE SHEET DATA' as section,
    company_name,
    total_assets,
    startup_investment_assets,
    total_liabilities,
    paid_in_capital,
    total_equity
FROM diva_balance_sheets 
WHERE data_year = 2024
ORDER BY company_name;

-- 3. Show ALL Income Statement Records  
SELECT 
    'INCOME STATEMENT DATA' as section,
    company_name,
    operating_revenue,
    operating_expenses,
    operating_profit,
    net_income_before_taxes,
    net_profit
FROM diva_income_statements 
WHERE data_year = 2024
ORDER BY company_name;

-- 4. Combined view showing company matches
SELECT 
    'COMPANY MATCHING' as section,
    COALESCE(b.company_name, i.company_name) as company_name,
    CASE WHEN b.company_name IS NOT NULL THEN 'YES' ELSE 'NO' END as has_balance_sheet,
    CASE WHEN i.company_name IS NOT NULL THEN 'YES' ELSE 'NO' END as has_income_statement
FROM diva_balance_sheets b
    FULL OUTER JOIN diva_income_statements i ON b.company_name = i.company_name AND b.data_year = i.data_year
WHERE COALESCE(b.data_year, i.data_year) = 2024
ORDER BY company_name; 