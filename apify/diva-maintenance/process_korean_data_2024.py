#!/usr/bin/env python3
"""
Process Real Korean VC Company Data for 2024
Uses exactly the data provided by user - processes both income and balance sheet data
"""

import os
from supabase import create_client, Client

# Supabase configuration
SUPABASE_URL = "https://udfgtccxbqmalgpqyxzz.supabase.co"
SUPABASE_SERVICE_KEY = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InVkZmd0Y2N4YnFtYWxncHF5eHp6Iiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc0ODk0NjY5NiwiZXhwIjoyMDY0NTIyNjk2fQ.JgyEKjOhuZpNCCOadsaK90Q8CcoPf_rgdtSXh-1BU18"

def clean_number(value: str) -> float:
    """Clean Korean number format to float"""
    if not value or value == '상세':
        return 0.0
    return float(value.replace(',', ''))

def process_income_data():
    """Process income statement data from user input"""
    # Income statement data provided by user
    income_data = """경남벤처투자	고유계정	12	일반	개별	3,652,088,433	3,652,088,433	2,933,481,853	718,606,580	-39,264,509	679,342,071	679,342,071	상세
골든오크벤처스	고유계정	12	일반	개별	1,176,648,262	1,176,648,262	461,515,028	715,133,234	-9,000,000	706,133,234	706,133,234	상세
그랜드벤처스	고유계정	12	일반	개별	394,540,449	394,540,449	0	394,540,449	-24,339,445	370,200,004	370,200,004	상세
글로넷벤처파트너스	고유계정	12	일반	개별	689,033,408	689,033,408	500,000,000	189,033,408	-125,080,683	63,952,725	63,952,725	상세
네오인사이트벤처스	고유계정	12	일반	개별	379,937,030	379,937,030	251,339,032	128,597,998	-128,597,998	0	0	상세"""
    
    records = []
    for line in income_data.strip().split('\n'):
        parts = line.split('\t')
        if len(parts) >= 8:
            records.append({
                'company_name': parts[0],
                'data_year': 2024,
                'revenue': clean_number(parts[4]),
                'operating_income': clean_number(parts[5]),
                'net_income': clean_number(parts[6]),
                'total_assets': clean_number(parts[7])
            })
    return records

def process_balance_data():
    """Process balance sheet data from user input - first 10 companies"""
    balance_data = """경남벤처투자	고유계정	12	일반	개별	5,257,825,484	2,623,949,842	186,283,286	4,700,000,000	5,071,542,198	상세
골든오크벤처스	고유계정	12	일반	개별	2,715,824,262	980,033,468	9,691,028	2,500,000,000	2,706,133,234	상세
그랜드벤처스	고유계정	12	일반	개별	1,918,879,894	680,373,304	24,339,445	2,077,000,000	1,894,540,449	상세
글로넷벤처파트너스	고유계정	12	일반	개별	1,314,114,091	870,026,584	125,080,683	2,311,912,000	1,189,033,408	상세
네오인사이트벤처스	고유계정	12	일반	개별	1,508,535,028	148,696,470	128,597,998	2,800,000,000	1,379,937,030	상세
넥스트지인베스트먼트	고유계정	12	일반	개별	13,433,334,665	10,059,181,385	4,809,162,857	7,315,000,000	8,624,171,808	상세
노보섹인베스트먼트	고유계정	12	일반	개별	4,914,917,638	1,015,658,720	421,778,942	5,000,140,000	4,493,138,696	상세
노틸러스인베스트먼트	고유계정	12	일반	개별	2,270,795,642	1,025,468,341	584,932,351	2,450,725,000	1,685,863,291	상세
다날투자파트너스	고유계정	12	K-IFRS	개별	12,664,456,209	6,514,251,142	2,069,789,674	10,000,000,000	10,594,666,535	상세
다성벤처스	고유계정	12	일반	개별	2,213,428,553	281,219,518	19,012,198	3,000,000,000	2,194,416,355	상세"""
    
    records = []
    for line in balance_data.strip().split('\n'):
        parts = line.split('\t')
        if len(parts) >= 10:
            records.append({
                'company_name': parts[0],
                'data_year': 2024,
                'total_assets': clean_number(parts[5]),
                'venture_investment_assets': clean_number(parts[6]),
                'total_liabilities': clean_number(parts[7]),
                'paid_in_capital': clean_number(parts[8]),
                'total_equity': clean_number(parts[9])
            })
    return records

def main():
    """Upload the processed data"""
    print("🚀 Processing real Korean VC company data for 2024...")
    
    supabase: Client = create_client(SUPABASE_URL, SUPABASE_SERVICE_KEY)
    
    try:
        # Clear existing 2024 data
        print("🧹 Clearing existing 2024 data...")
        supabase.table('diva_income_statements').delete().eq('data_year', 2024).execute()
        supabase.table('diva_balance_sheets').delete().eq('data_year', 2024).execute()
        
        # Process and upload income statements
        income_records = process_income_data()
        if income_records:
            supabase.table('diva_income_statements').insert(income_records).execute()
            print(f"✅ Income Statements: {len(income_records)} records uploaded")
        
        # Process and upload balance sheets
        balance_records = process_balance_data()
        if balance_records:
            supabase.table('diva_balance_sheets').insert(balance_records).execute()
            print(f"✅ Balance Sheets: {len(balance_records)} records uploaded")
        
        # Verify
        income_count = supabase.table('diva_income_statements').select('*', count='exact').eq('data_year', 2024).execute()
        balance_count = supabase.table('diva_balance_sheets').select('*', count='exact').eq('data_year', 2024).execute()
        
        print(f"\n📊 Final Count:")
        print(f"Income Statements: {income_count.count}")
        print(f"Balance Sheets: {balance_count.count}")
        print(f"Total: {income_count.count + balance_count.count}")
        
        print("\n✅ Upload completed successfully!")
        
    except Exception as e:
        print(f"❌ Error: {str(e)}")
        raise

if __name__ == "__main__":
    main() 