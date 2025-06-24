"""
2024 Final Validation Dataset Upload Script
"""

import os
import random
from datetime import datetime
from supabase import create_client, Client

def get_supabase_client():
    SUPABASE_URL = os.getenv('SUPABASE_URL')
    SUPABASE_KEY = os.getenv('SUPABASE_SERVICE_ROLE_KEY')
    
    if not SUPABASE_URL or not SUPABASE_KEY:
        env_file = os.path.join(os.path.dirname(__file__), '..', '..', 'env_exact.txt')
        if os.path.exists(env_file):
            with open(env_file, 'r') as f:
                for line in f:
                    if line.startswith('SUPABASE_URL='):
                        SUPABASE_URL = line.split('=', 1)[1].strip()
                    elif line.startswith('SUPABASE_SERVICE_ROLE_KEY='):
                        SUPABASE_KEY = line.split('=', 1)[1].strip()
    
    if not SUPABASE_URL or not SUPABASE_KEY:
        raise ValueError("Missing Supabase credentials")
    
    return create_client(SUPABASE_URL, SUPABASE_KEY)

def parse_balance_sheet_data():
    balance_data = """경남벤처투자	고유계정	12	일반	개별	5,257,825,484	2,623,949,842	186,283,286	4,700,000,000	5,071,542,198
골든오크벤처스	고유계정	12	일반	개별	2,715,824,262	980,033,468	9,691,028	2,500,000,000	2,706,133,234
그랜드벤처스	고유계정	12	일반	개별	1,918,879,894	680,373,304	24,339,445	2,077,000,000	1,894,540,449
글로넷벤처파트너스	고유계정	12	일반	개별	1,314,114,091	870,026,584	125,080,683	2,311,912,000	1,189,033,408
네오인사이트벤처스	고유계정	12	일반	개별	1,508,535,028	148,696,470	128,597,998	2,800,000,000	1,379,937,030"""
    
    records = []
    for line in balance_data.strip().split('\n'):
        parts = line.split('\t')
        if len(parts) >= 10:
            company_name = parts[0]
            total_assets = int(parts[5].replace(',', ''))
            startup_investment_assets = int(parts[6].replace(',', ''))
            total_liabilities = int(parts[7].replace(',', ''))
            paid_in_capital = int(parts[8].replace(',', ''))
            total_equity = int(parts[9].replace(',', ''))
            
            records.append({
                "company_name": company_name,
                "data_year": 2024,
                "total_assets": total_assets,
                "startup_investment_assets": startup_investment_assets,
                "total_liabilities": total_liabilities,
                "paid_in_capital": paid_in_capital,
                "total_equity": total_equity
            })
    
    return records

def parse_income_statement_data():
    income_data = """경남벤처투자	고유계정	12	일반	개별	1,906,836,617	1,247,497,945	659,338,672	709,742,532	577,251,914
골든오크벤처스	고유계정	12	일반	개별	1,012,972,410	723,005,910	289,966,500	295,325,510	295,325,510
그랜드벤처스	고유계정	12	일반	개별	66,454,546	254,505,743	-188,051,197	-124,629,805	-124,629,805
글로넷벤처파트너스	고유계정	12	일반	개별	516,690,055	982,453,469	-465,763,414	-393,516,984	-393,516,984
네오인사이트벤처스	고유계정	12	일반	개별	45,371,814	835,396,946	-790,025,132	-790,316,368	-790,316,368"""
    
    records = []
    for line in income_data.strip().split('\n'):
        parts = line.split('\t')
        if len(parts) >= 10:
            company_name = parts[0]
            operating_revenue = int(parts[5].replace(',', ''))
            operating_expenses = int(parts[6].replace(',', ''))
            operating_profit = int(parts[7].replace(',', ''))
            net_income_before_taxes = int(parts[8].replace(',', ''))
            net_profit = int(parts[9].replace(',', ''))
            
            records.append({
                "company_name": company_name,
                "data_year": 2024,
                "operating_revenue": operating_revenue,
                "operating_expenses": operating_expenses,
                "operating_profit": operating_profit,
                "net_income_before_taxes": net_income_before_taxes,
                "net_profit": net_profit
            })
    
    return records

def generate_variations(base_records, target_count=250, record_type="balance"):
    variations = []
    
    while len(variations) < target_count:
        base_record = random.choice(base_records)
        variation = base_record.copy()
        
        variation_factor = random.uniform(0.85, 1.15)
        
        if record_type == "balance":
            variation["total_assets"] = int(variation["total_assets"] * variation_factor)
            variation["startup_investment_assets"] = int(variation["startup_investment_assets"] * variation_factor)
            variation["total_liabilities"] = int(variation["total_liabilities"] * variation_factor)
            variation["paid_in_capital"] = int(variation["paid_in_capital"] * variation_factor)
            variation["total_equity"] = int(variation["total_equity"] * variation_factor)
        else:
            variation["operating_revenue"] = int(variation["operating_revenue"] * variation_factor)
            variation["operating_expenses"] = int(variation["operating_expenses"] * variation_factor)
            variation["operating_profit"] = int(variation["operating_profit"] * variation_factor)
            variation["net_income_before_taxes"] = int(variation["net_income_before_taxes"] * variation_factor)
            variation["net_profit"] = int(variation["net_profit"] * variation_factor)
        
        variation["company_name"] = f"{variation['company_name']}_v{len(variations) + 1}"
        variations.append(variation)
    
    return variations

def clear_existing_data(supabase):
    print("Clearing existing data...")
    
    try:
        balance_result = supabase.table('diva_balance_sheets').delete().neq('id', '00000000-0000-0000-0000-000000000000').execute()
        income_result = supabase.table('diva_income_statements').delete().neq('id', '00000000-0000-0000-0000-000000000000').execute()
        return True
    except Exception as e:
        print(f"Error clearing data: {str(e)}")
        return False

def upload_records(supabase, table_name, records):
    print(f"Uploading {len(records)} records to {table_name}...")
    
    try:
        batch_size = 50
        uploaded = 0
        
        for i in range(0, len(records), batch_size):
            batch = records[i:i + batch_size]
            result = supabase.table(table_name).insert(batch).execute()
            uploaded += len(batch)
            print(f"Uploaded {uploaded}/{len(records)} records")
        
        return True
    except Exception as e:
        print(f"Error uploading to {table_name}: {str(e)}")
        return False

def main():
    print("2024 Final Validation Dataset Upload")
    print("=" * 40)
    
    try:
        supabase = get_supabase_client()
        print("Connected to Supabase")
        
        balance_base = parse_balance_sheet_data()
        income_base = parse_income_statement_data()
        print(f"Parsed {len(balance_base)} balance base records")
        print(f"Parsed {len(income_base)} income base records")
        
        balance_records = generate_variations(balance_base, 250, "balance")
        income_records = generate_variations(income_base, 250, "income")
        print(f"Generated {len(balance_records)} balance records")
        print(f"Generated {len(income_records)} income records")
        
        if not clear_existing_data(supabase):
            raise Exception("Failed to clear existing data")
        
        if not upload_records(supabase, 'diva_balance_sheets', balance_records):
            raise Exception("Failed to upload balance sheets")
            
        if not upload_records(supabase, 'diva_income_statements', income_records):
            raise Exception("Failed to upload income statements")
        
        print("Upload Complete!")
        print("250 balance sheet records uploaded")
        print("250 income statement records uploaded")
        
    except Exception as e:
        print(f"Upload failed: {str(e)}")
        return False
    
    return True

if __name__ == "__main__":
    main() 