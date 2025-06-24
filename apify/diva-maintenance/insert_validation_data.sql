-- ===============================================
-- INSERT VALIDATION DATA INTO FINANCIAL TABLES
-- Contains 8 balance sheet + 8 income statement records
-- ===============================================

-- Insert Balance Sheet Data
INSERT INTO diva_balance_sheets (
    company_name,
    data_year,
    total_assets,
    startup_investment_assets,
    total_liabilities,
    paid_in_capital,
    total_equity
) VALUES 
('경남벤처투자', 2024, 1906836617, 1247497945, 659338672, 709742532, 1247497945),
('골든오크벤처스', 2024, 1012972410, 723005910, 289966500, 295325510, 723005910),
('넥스트지인베스트먼트', 2024, 2574841206, 2224734640, 350106566, 266276272, 2224734640),
('다날투자파트너스', 2024, 9117139395, 6430624281, 2686515114, 2727203769, 6430624281),
('대성창업투자', 2024, 20088466445, 9850013605, 10238452840, 14904556223, 9850013605),
('미래에셋벤처투자', 2024, 68452052040, 47006795703, 21445256337, 21423593734, 47006795703),
('본엔젤스벤처파트너스', 2024, 44689108275, 28709903228, 15979205047, 15967552386, 28709903228),
('신한벤처투자', 2024, 38688935720, 35950786347, 2738149373, 2909370460, 35950786347);

-- Insert Income Statement Data
INSERT INTO diva_income_statements (
    company_name,
    data_year,
    operating_revenue,
    operating_expenses,
    operating_profit,
    net_income_before_taxes,
    net_profit
) VALUES
('경남벤처투자', 2024, 709742532, 132490618, 577251914, 577251914, 577251914),
('골든오크벤처스', 2024, 295325510, 0, 295325510, 295325510, 295325510),
('넥스트지인베스트먼트', 2024, 266276272, 88533698, 177742574, 177742574, 177742574),
('다날투자파트너스', 2024, 2727203769, 367466441, 2359737328, 2359737328, 2359737328),
('대성창업투자', 2024, 14904556223, 1058569961, 13845986262, 13845986262, 13845986262),
('미래에셋벤처투자', 2024, 21423593734, 6762634002, 14660959732, 8557020639, 8557020639),
('본엔젤스벤처파트너스', 2024, 15967552386, 1141035150, 14826517236, 14826517236, 14826517236),
('신한벤처투자', 2024, 2909370460, -866854569, 3776225029, 3776225029, 3776225029);

-- Verify the inserted data
SELECT 
    'Balance Sheets' as table_name, 
    COUNT(*) as record_count,
    MIN(total_assets) as min_assets,
    MAX(total_assets) as max_assets
FROM diva_balance_sheets
WHERE data_year = 2024

UNION ALL

SELECT 
    'Income Statements' as table_name, 
    COUNT(*) as record_count,
    MIN(operating_revenue) as min_revenue,
    MAX(operating_revenue) as max_revenue
FROM diva_income_statements  
WHERE data_year = 2024;

-- Show sample records
SELECT 
    'Sample Balance Sheet' as info,
    company_name,
    total_assets,
    total_equity,
    total_liabilities
FROM diva_balance_sheets 
WHERE data_year = 2024;

SELECT 
    'Sample Income Statement' as info,
    company_name,
    operating_revenue,
    operating_profit,
    net_profit
FROM diva_income_statements 
WHERE data_year = 2024; 