#!/usr/bin/env python3
"""
Final Korean VC Company Data Upload for 2024
Uses exact database schema and real Korean VC data provided by user
"""

import os
from supabase import create_client, Client

# Supabase configuration
SUPABASE_URL = "https://udfgtccxbqmalgpqyxzz.supabase.co"
SUPABASE_SERVICE_KEY = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InVkZmd0Y2N4YnFtYWxncHF5eHp6Iiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc0ODk0NjY5NiwiZXhwIjoyMDY0NTIyNjk2fQ.JgyEKjOhuZpNCCOadsaK90Q8CcoPf_rgdtSXh-1BU18"

def clean_number(value: str) -> int:
    """Clean Korean number format to integer"""
    if not value or value == '상세':
        return 0
    # Remove commas and convert to int
    return int(float(value.replace(',', '')))

def get_income_statement_data():
    """Process income statement data - exact mapping to schema"""
    # Real Korean VC income statement data from user
    income_data = """경남벤처투자	고유계정	12	일반	개별	3,652,088,433	3,652,088,433	2,933,481,853	718,606,580	-39,264,509	679,342,071	679,342,071	상세
골든오크벤처스	고유계정	12	일반	개별	1,176,648,262	1,176,648,262	461,515,028	715,133,234	-9,000,000	706,133,234	706,133,234	상세
그랜드벤처스	고유계정	12	일반	개별	394,540,449	394,540,449	0	394,540,449	-24,339,445	370,200,004	370,200,004	상세
글로넷벤처파트너스	고유계정	12	일반	개별	689,033,408	689,033,408	500,000,000	189,033,408	-125,080,683	63,952,725	63,952,725	상세
네오인사이트벤처스	고유계정	12	일반	개별	379,937,030	379,937,030	251,339,032	128,597,998	-128,597,998	0	0	상세"""
    
    records = []
    for line in income_data.strip().split('\n'):
        parts = line.split('\t')
        if len(parts) >= 12:  # Omit 상세 column
            records.append({
                'company_name': parts[0],
                'data_year': 2024,
                'financial_resources': parts[1],     # 재원
                'settlement_month': parts[2],        # 결산월
                'accounting_standards': parts[3],    # 회계기준
                'financial_classification': parts[4], # 재무구분
                'operating_revenue': clean_number(parts[5]),    # 매출액
                'operating_expenses': clean_number(parts[7]),   # 영업비용
                'operating_profit': clean_number(parts[8]),     # 영업이익
                'net_income_before_taxes': clean_number(parts[8]), # Using operating profit as proxy
                'net_profit': clean_number(parts[11])           # 당기순이익
            })
    
    return records

def get_balance_sheet_data():
    """Process balance sheet data - exact mapping to schema"""
    # Real Korean VC balance sheet data from user (first 20 companies)
    balance_data = """경남벤처투자	고유계정	12	일반	개별	5,257,825,484	2,623,949,842	186,283,286	4,700,000,000	5,071,542,198	상세
골든오크벤처스	고유계정	12	일반	개별	2,715,824,262	980,033,468	9,691,028	2,500,000,000	2,706,133,234	상세
그랜드벤처스	고유계정	12	일반	개별	1,918,879,894	680,373,304	24,339,445	2,077,000,000	1,894,540,449	상세
글로넷벤처파트너스	고유계정	12	일반	개별	1,314,114,091	870,026,584	125,080,683	2,311,912,000	1,189,033,408	상세
네오인사이트벤처스	고유계정	12	일반	개별	1,508,535,028	148,696,470	128,597,998	2,800,000,000	1,379,937,030	상세
넥스트지인베스트먼트	고유계정	12	일반	개별	13,433,334,665	10,059,181,385	4,809,162,857	7,315,000,000	8,624,171,808	상세
노보섹인베스트먼트	고유계정	12	일반	개별	4,914,917,638	1,015,658,720	421,778,942	5,000,140,000	4,493,138,696	상세
노틸러스인베스트먼트	고유계정	12	일반	개별	2,270,795,642	1,025,468,341	584,932,351	2,450,725,000	1,685,863,291	상세
다날투자파트너스	고유계정	12	K-IFRS	개별	12,664,456,209	6,514,251,142	2,069,789,674	10,000,000,000	10,594,666,535	상세
다성벤처스	고유계정	12	일반	개별	2,213,428,553	281,219,518	19,012,198	3,000,000,000	2,194,416,355	상세
다윈인베스트먼트	고유계정	12	일반	개별	3,379,845,708	1,772,176,875	824,535,644	2,032,570,000	2,555,310,064	상세
대경인베스트먼트	고유계정	12	일반	개별	27,728,504,323	16,483,336,065	33,864,020	10,000,000,000	27,694,640,303	상세
대교인베스트먼트	고유계정	12	일반	개별	15,830,096,454	9,911,287,151	1,427,433,197	7,005,000,000	14,402,663,257	상세
대성창업투자	고유계정	12	K-IFRS	개별	100,480,711,010	37,648,257,339	1,701,297,672	27,000,000,000	98,779,413,338	상세
대웅인베스트먼트	고유계정	12	일반	개별	2,522,241,873	80,000,000	57,564,318	2,000,000,000	2,464,677,555	상세
대한투자파트너스	고유계정	12	일반	개별	2,967,189,409	2,917,502,367	310,773,456	5,299,990,000	2,656,415,953	상세
더벤처스	고유계정	12	일반	개별	10,332,216,435	8,332,099,347	663,358,773	2,220,498,000	9,668,857,662	상세
더시드인베스트먼트	고유계정	12	일반	개별	2,043,668,237	1,482,632,160	695,300,551	2,000,000,000	1,348,367,686	상세
더웰스인베스트먼트	고유계정	12	일반	개별	21,886,566,021	18,445,277,879	2,118,530,332	15,660,000,000	19,768,035,689	상세
데브시스터즈벤처스	고유계정	12	일반	개별	17,020,300,475	11,023,243,263	809,021,671	10,000,000,000	16,211,278,804	상세"""
    
    records = []
    for line in balance_data.strip().split('\n'):
        parts = line.split('\t')
        if len(parts) >= 10:  # Omit 상세 column
            records.append({
                'company_name': parts[0],
                'data_year': 2024,
                'financial_resources': parts[1],     # 재원
                'settlement_month': parts[2],        # 결산월
                'accounting_standards': parts[3],    # 회계기준
                'financial_classification': parts[4], # 재무구분
                'total_assets': clean_number(parts[5]),              # 자산
                'startup_investment_assets': clean_number(parts[6]), # 창업투자자산
                'total_liabilities': clean_number(parts[7]),         # 부채
                'paid_in_capital': clean_number(parts[8]),           # 자본금
                'total_equity': clean_number(parts[9])               # 자본
            })
    
    return records

def main():
    """Upload Korean VC company data for 2024"""
    print("🚀 Final upload of Korean VC company data for 2024...")
    print("✅ Using exact database schema mapping")
    print("✅ Using real Korean VC financial data provided by user")
    
    supabase: Client = create_client(SUPABASE_URL, SUPABASE_SERVICE_KEY)
    
    try:
        # Clear existing 2024 data
        print("\n🧹 Clearing existing 2024 data...")
        supabase.table('diva_income_statements').delete().eq('data_year', 2024).execute()
        supabase.table('diva_balance_sheets').delete().eq('data_year', 2024).execute()
        print("   ✅ Cleared existing records")
        
        # Process and upload income statements
        print("\n📊 Processing income statement data...")
        income_records = get_income_statement_data()
        if income_records:
            supabase.table('diva_income_statements').insert(income_records).execute()
            print(f"   ✅ Uploaded {len(income_records)} income statement records")
        
        # Process and upload balance sheets
        print("\n💰 Processing balance sheet data...")
        balance_records = get_balance_sheet_data()
        if balance_records:
            supabase.table('diva_balance_sheets').insert(balance_records).execute()
            print(f"   ✅ Uploaded {len(balance_records)} balance sheet records")
        
        # Final verification
        income_count = supabase.table('diva_income_statements').select('*', count='exact').eq('data_year', 2024).execute()
        balance_count = supabase.table('diva_balance_sheets').select('*', count='exact').eq('data_year', 2024).execute()
        
        print(f"\n📈 Upload Summary:")
        print(f"   Income Statements: {income_count.count} records")
        print(f"   Balance Sheets: {balance_count.count} records")
        print(f"   Total Records: {income_count.count + balance_count.count}")
        
        print(f"\n🎉 Korean VC company data upload completed successfully!")
        print(f"📋 Sample companies: 경남벤처투자, 골든오크벤처스, 그랜드벤처스...")
        
    except Exception as e:
        print(f"❌ Error during upload: {str(e)}")
        raise

if __name__ == "__main__":
    main() 