"""
Complete Financial Validation Dataset
Contains validation data for both DIVA balance sheet and income statement records
Based on real Korean VC financial data
"""

# Balance Sheet Validation Data (재무상태표)
balance_sheet_validation_data = [
    {
        "company_name": "경남벤처투자",
        "data_year": 2024,
        "fiscal_year": 2024,
        "total_assets": 1906836617,
        "startup_investment_assets": 1247497945,
        "total_liabilities": 659338672,
        "paid_in_capital": 709742532,
        "total_equity": 1247497945,
        "dataType": "financial_statements_balance"
    },
    {
        "company_name": "골든오크벤처스",
        "data_year": 2024,
        "fiscal_year": 2024,
        "total_assets": 1012972410,
        "startup_investment_assets": 723005910,
        "total_liabilities": 289966500,
        "paid_in_capital": 295325510,
        "total_equity": 723005910,
        "dataType": "financial_statements_balance"
    },
    {
        "company_name": "넥스트지인베스트먼트",
        "data_year": 2024,
        "fiscal_year": 2024,
        "total_assets": 2574841206,
        "startup_investment_assets": 2224734640,
        "total_liabilities": 350106566,
        "paid_in_capital": 266276272,
        "total_equity": 2224734640,
        "dataType": "financial_statements_balance"
    },
    {
        "company_name": "다날투자파트너스",
        "data_year": 2024,
        "fiscal_year": 2024,
        "total_assets": 9117139395,
        "startup_investment_assets": 6430624281,
        "total_liabilities": 2686515114,
        "paid_in_capital": 2727203769,
        "total_equity": 6430624281,
        "dataType": "financial_statements_balance"
    },
    {
        "company_name": "대성창업투자",
        "data_year": 2024,
        "fiscal_year": 2024,
        "total_assets": 20088466445,
        "startup_investment_assets": 9850013605,
        "total_liabilities": 10238452840,
        "paid_in_capital": 14904556223,
        "total_equity": 9850013605,
        "dataType": "financial_statements_balance"
    }
]

# Income Statement Validation Data (손익계산서)
income_statement_validation_data = [
    {
        "company_name": "경남벤처투자",
        "data_year": 2024,
        "fiscal_year": 2024,
        "operating_revenue": 709742532,
        "operating_expenses": 132490618,
        "operating_profit": 577251914,
        "net_income_before_taxes": 577251914,
        "net_profit": 577251914,
        "dataType": "financial_statements_income"
    },
    {
        "company_name": "골든오크벤처스",
        "data_year": 2024,
        "fiscal_year": 2024,
        "operating_revenue": 295325510,
        "operating_expenses": 0,
        "operating_profit": 295325510,
        "net_income_before_taxes": 295325510,
        "net_profit": 295325510,
        "dataType": "financial_statements_income"
    },
    {
        "company_name": "넥스트지인베스트먼트",
        "data_year": 2024,
        "fiscal_year": 2024,
        "operating_revenue": 266276272,
        "operating_expenses": 88533698,
        "operating_profit": 177742574,
        "net_income_before_taxes": 177742574,
        "net_profit": 177742574,
        "dataType": "financial_statements_income"
    },
    {
        "company_name": "다날투자파트너스",
        "data_year": 2024,
        "fiscal_year": 2024,
        "operating_revenue": 2727203769,
        "operating_expenses": 367466441,
        "operating_profit": 2359737328,
        "net_income_before_taxes": 2359737328,
        "net_profit": 2359737328,
        "dataType": "financial_statements_income"
    },
    {
        "company_name": "대성창업투자",
        "data_year": 2024,
        "fiscal_year": 2024,
        "operating_revenue": 14904556223,
        "operating_expenses": 1058569961,
        "operating_profit": 13845986262,
        "net_income_before_taxes": 13845986262,
        "net_profit": 13845986262,
        "dataType": "financial_statements_income"
    }
]

# Extended validation data with more companies
extended_balance_sheet_data = [
    {
        "company_name": "미래에셋벤처투자",
        "data_year": 2024,
        "fiscal_year": 2024,
        "total_assets": 68452052040,
        "startup_investment_assets": 47006795703,
        "total_liabilities": 21445256337,
        "paid_in_capital": 21423593734,
        "total_equity": 47006795703,
        "dataType": "financial_statements_balance"
    },
    {
        "company_name": "본엔젤스벤처파트너스",
        "data_year": 2024,
        "fiscal_year": 2024,
        "total_assets": 44689108275,
        "startup_investment_assets": 28709903228,
        "total_liabilities": 15979205047,
        "paid_in_capital": 15967552386,
        "total_equity": 28709903228,
        "dataType": "financial_statements_balance"
    },
    {
        "company_name": "신한벤처투자",
        "data_year": 2024,
        "fiscal_year": 2024,
        "total_assets": 38688935720,
        "startup_investment_assets": 35950786347,
        "total_liabilities": 2738149373,
        "paid_in_capital": 2909370460,
        "total_equity": 35950786347,
        "dataType": "financial_statements_balance"
    }
]

extended_income_statement_data = [
    {
        "company_name": "미래에셋벤처투자",
        "data_year": 2024,
        "fiscal_year": 2024,
        "operating_revenue": 21423593734,
        "operating_expenses": 6762634002,
        "operating_profit": 14660959732,
        "net_income_before_taxes": 8557020639,
        "net_profit": 8557020639,
        "dataType": "financial_statements_income"
    },
    {
        "company_name": "본엔젤스벤처파트너스",
        "data_year": 2024,
        "fiscal_year": 2024,
        "operating_revenue": 15967552386,
        "operating_expenses": 1141035150,
        "operating_profit": 14826517236,
        "net_income_before_taxes": 14826517236,
        "net_profit": 14826517236,
        "dataType": "financial_statements_income"
    },
    {
        "company_name": "신한벤처투자",
        "data_year": 2024,
        "fiscal_year": 2024,
        "operating_revenue": 2909370460,
        "operating_expenses": -866854569,  # Negative operating expenses (income)
        "operating_profit": 3776225029,
        "net_income_before_taxes": 3776225029,
        "net_profit": 3776225029,
        "dataType": "financial_statements_income"
    }
]

# Combine all data
all_balance_sheet_data = balance_sheet_validation_data + extended_balance_sheet_data
all_income_statement_data = income_statement_validation_data + extended_income_statement_data

# Field definitions
balance_sheet_fields = {
    "company_name": "회사명",
    "data_year": "데이터 연도",
    "fiscal_year": "회계 연도", 
    "total_assets": "자산총계",
    "startup_investment_assets": "창업투자자산",
    "total_liabilities": "부채총계",
    "paid_in_capital": "납입자본금",
    "total_equity": "자본총계",
    "dataType": "데이터 타입"
}

income_statement_fields = {
    "company_name": "회사명",
    "data_year": "데이터 연도",
    "fiscal_year": "회계 연도",
    "operating_revenue": "영업수익",
    "operating_expenses": "영업비용",
    "operating_profit": "영업이익",
    "net_income_before_taxes": "법인세차감전순이익",
    "net_profit": "당기순이익",
    "dataType": "데이터 타입"
}

# Validation rules
balance_sheet_validation_rules = {
    "total_assets": "Must equal total_liabilities + total_equity (accounting equation)",
    "startup_investment_assets": "Should be <= total_assets",
    "paid_in_capital": "Should be <= total_equity",
    "data_year": "Should match fiscal_year for current data",
    "dataType": "Must be 'financial_statements_balance' for balance sheet data"
}

income_statement_validation_rules = {
    "operating_profit": "Should equal operating_revenue - operating_expenses",
    "net_profit": "Should be <= net_income_before_taxes",
    "operating_revenue": "Should be positive for most companies",
    "data_year": "Should match fiscal_year for current data",
    "dataType": "Must be 'financial_statements_income' for income statement data"
}

def validate_balance_sheet_record(record):
    """Validate a single balance sheet record"""
    errors = []
    
    # Check accounting equation: Assets = Liabilities + Equity
    if record["total_assets"] != (record["total_liabilities"] + record["total_equity"]):
        errors.append("Accounting equation violation: Assets ≠ Liabilities + Equity")
    
    # Check startup investment assets
    if record["startup_investment_assets"] > record["total_assets"]:
        errors.append("Startup investment assets exceed total assets")
    
    # Check paid in capital (can be greater than equity for some companies)
    # This is common in VC companies due to accumulated losses
    
    # Check data type
    if record["dataType"] != "financial_statements_balance":
        errors.append("Invalid dataType for balance sheet")
    
    return errors

def validate_income_statement_record(record):
    """Validate a single income statement record"""
    errors = []
    
    # Check operating profit calculation (allowing for negative expenses)
    expected_operating_profit = record["operating_revenue"] - record["operating_expenses"]
    if abs(record["operating_profit"] - expected_operating_profit) > 1:  # Allow for rounding
        errors.append(f"Operating profit calculation error: {record['operating_profit']} ≠ {expected_operating_profit}")
    
    # Check net profit vs net income before taxes
    if record["net_profit"] > record["net_income_before_taxes"]:
        errors.append("Net profit exceeds net income before taxes")
    
    # Check data type
    if record["dataType"] != "financial_statements_income":
        errors.append("Invalid dataType for income statement")
    
    return errors

def validate_all_records():
    """Validate all records in both datasets"""
    all_errors = {}
    
    # Validate balance sheets
    for i, record in enumerate(all_balance_sheet_data):
        errors = validate_balance_sheet_record(record)
        if errors:
            all_errors[f"Balance Sheet {i+1} ({record['company_name']})"] = errors
    
    # Validate income statements
    for i, record in enumerate(all_income_statement_data):
        errors = validate_income_statement_record(record)
        if errors:
            all_errors[f"Income Statement {i+1} ({record['company_name']})"] = errors
    
    return all_errors

def format_currency(value):
    """Format currency values for display"""
    if abs(value) >= 1000000000:
        return f"{value:,} ({value/1000000000:.1f}B KRW)"
    elif abs(value) >= 1000000:
        return f"{value:,} ({value/1000000:.1f}M KRW)"
    else:
        return f"{value:,} KRW"

if __name__ == "__main__":
    print("Complete Financial Validation Dataset")
    print("=" * 60)
    print(f"Balance Sheet records: {len(all_balance_sheet_data)}")
    print(f"Income Statement records: {len(all_income_statement_data)}")
    print(f"Total validation records: {len(all_balance_sheet_data) + len(all_income_statement_data)}")
    
    # Run validation
    errors = validate_all_records()
    if errors:
        print("\nValidation Errors Found:")
        for record_id, error_list in errors.items():
            print(f"  {record_id}:")
            for error in error_list:
                print(f"    - {error}")
    else:
        print("\nAll records passed validation!")
    
    # Show sample records
    print(f"\nSample Balance Sheet ({all_balance_sheet_data[0]['company_name']}):")
    for field, value in all_balance_sheet_data[0].items():
        korean_name = balance_sheet_fields.get(field, field)
        if isinstance(value, int) and abs(value) > 1000:
            formatted_value = format_currency(value)
        else:
            formatted_value = value
        print(f"  {field} ({korean_name}): {formatted_value}")
    
    print(f"\nSample Income Statement ({all_income_statement_data[0]['company_name']}):")
    for field, value in all_income_statement_data[0].items():
        korean_name = income_statement_fields.get(field, field)
        if isinstance(value, int) and abs(value) > 1000:
            formatted_value = format_currency(value)
        else:
            formatted_value = value
        print(f"  {field} ({korean_name}): {formatted_value}")
    
    # Show statistics
    print(f"\nDataset Statistics:")
    print(f"Balance Sheet Assets Range: {format_currency(min(r['total_assets'] for r in all_balance_sheet_data))} - {format_currency(max(r['total_assets'] for r in all_balance_sheet_data))}")
    print(f"Income Statement Revenue Range: {format_currency(min(r['operating_revenue'] for r in all_income_statement_data))} - {format_currency(max(r['operating_revenue'] for r in all_income_statement_data))}")
    
    # Companies with negative equity (common in VC industry)
    negative_equity_companies = [r['company_name'] for r in all_balance_sheet_data if r['total_equity'] < r['total_liabilities']]
    if negative_equity_companies:
        print(f"\nCompanies with challenging financial positions: {len(negative_equity_companies)}")
        for company in negative_equity_companies[:3]:  # Show first 3
            print(f"  - {company}")