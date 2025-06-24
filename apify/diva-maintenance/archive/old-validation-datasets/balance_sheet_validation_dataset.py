"""
Balance Sheet Validation Dataset
Contains validation data for DIVA balance sheet records without detailed (상세) fields
"""

balance_sheet_validation_data = [
    {
        "company_name": "스마일게이트홀딩스",
        "data_year": 2024,
        "fiscal_year": 2024,
        "total_assets": 2847691000000,
        "startup_investment_assets": 2500000000000,
        "total_liabilities": 347691000000,
        "paid_in_capital": 1000000000000,
        "total_equity": 2500000000000,
        "dataType": "financial_statements_balance"
    },
    {
        "company_name": "넥슨",
        "data_year": 2024,
        "fiscal_year": 2024,
        "total_assets": 5234567000000,
        "startup_investment_assets": 3000000000000,
        "total_liabilities": 1234567000000,
        "paid_in_capital": 2000000000000,
        "total_equity": 4000000000000,
        "dataType": "financial_statements_balance"
    },
    {
        "company_name": "카카오",
        "data_year": 2024,
        "fiscal_year": 2024,
        "total_assets": 8765432000000,
        "startup_investment_assets": 5000000000000,
        "total_liabilities": 2765432000000,
        "paid_in_capital": 3000000000000,
        "total_equity": 6000000000000,
        "dataType": "financial_statements_balance"
    },
    {
        "company_name": "네이버",
        "data_year": 2024,
        "fiscal_year": 2024,
        "total_assets": 12345678000000,
        "startup_investment_assets": 8000000000000,
        "total_liabilities": 4345678000000,
        "paid_in_capital": 4000000000000,
        "total_equity": 8000000000000,
        "dataType": "financial_statements_balance"
    },
    {
        "company_name": "엔씨소프트",
        "data_year": 2024,
        "fiscal_year": 2024,
        "total_assets": 3456789000000,
        "startup_investment_assets": 2000000000000,
        "total_liabilities": 1456789000000,
        "paid_in_capital": 1500000000000,
        "total_equity": 2000000000000,
        "dataType": "financial_statements_balance"
    }
]

# Field definitions for balance sheet validation
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

# Validation rules
validation_rules = {
    "total_assets": "Must equal total_liabilities + total_equity (accounting equation)",
    "startup_investment_assets": "Should be <= total_assets",
    "paid_in_capital": "Should be <= total_equity",
    "data_year": "Should match fiscal_year for current data",
    "dataType": "Must be 'financial_statements_balance' for balance sheet data"
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
    
    # Check paid in capital
    if record["paid_in_capital"] > record["total_equity"]:
        errors.append("Paid in capital exceeds total equity")
    
    # Check data type
    if record["dataType"] != "financial_statements_balance":
        errors.append("Invalid dataType for balance sheet")
    
    return errors

def validate_all_records():
    """Validate all balance sheet records in the dataset"""
    all_errors = {}
    
    for i, record in enumerate(balance_sheet_validation_data):
        errors = validate_balance_sheet_record(record)
        if errors:
            all_errors[f"Record {i+1} ({record['company_name']})"] = errors
    
    return all_errors

if __name__ == "__main__":
    print("Balance Sheet Validation Dataset")
    print("=" * 50)
    print(f"Total records: {len(balance_sheet_validation_data)}")
    print(f"Fields per record: {len(balance_sheet_fields)}")
    
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
    
    # Show sample record
    print(f"\nSample Record ({balance_sheet_validation_data[0]['company_name']}):")
    for field, value in balance_sheet_validation_data[0].items():
        korean_name = balance_sheet_fields.get(field, field)
        if isinstance(value, int) and value > 1000000:
            formatted_value = f"{value:,} ({value/1000000000:.1f}B KRW)"
        else:
            formatted_value = value
        print(f"  {field} ({korean_name}): {formatted_value}")