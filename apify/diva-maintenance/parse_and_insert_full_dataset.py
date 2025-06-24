"""
Parse Full Korean VC Financial Dataset
Process BOTH income statement and balance sheet datasets and create SQL inserts
"""

# Income Statement Data (from user's first message)
income_statement_data = """경남벤처투자	고유계정	12	일반	개별	1,906,836,617	1,247,497,945	659,338,672	709,742,532	577,251,914	상세
골든오크벤처스	고유계정	12	일반	개별	1,012,972,410	723,005,910	289,966,500	295,325,510	295,325,510	상세
그랜드벤처스	고유계정	12	일반	개별	66,454,546	254,505,743	-188,051,197	-124,629,805	-124,629,805	상세
글로넷벤처파트너스	고유계정	12	일반	개별	516,690,055	982,453,469	-465,763,414	-393,516,984	-393,516,984	상세
네오인사이트벤처스	고유계정	12	일반	개별	45,371,814	835,396,946	-790,025,132	-790,316,368	-790,316,368	상세
넥스트지인베스트먼트	고유계정	12	일반	개별	2,574,841,206	2,224,734,640	350,106,566	266,276,272	177,742,574	상세
노보섹인베스트먼트	고유계정	12	일반	개별	1,349,364,866	1,617,782,885	-268,418,019	-167,452,279	-119,113,459	상세
노틸러스인베스트먼트	고유계정	12	일반	개별	2,175,545,429	2,352,969,242	-177,423,813	-112,994,404	-102,680,035	상세
다날투자파트너스	고유계정	12	K-IFRS	개별	9,117,139,395	6,430,624,281	2,686,515,114	2,727,203,769	2,359,737,328	상세"""

# Balance Sheet Data (from user's second message) - COMPLETE DATASET 
balance_sheet_data = """경남벤처투자	고유계정	12	일반	개별	5,257,825,484	2,623,949,842	186,283,286	4,700,000,000	5,071,542,198	상세
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
데브시스터즈벤처스	고유계정	12	일반	개별	17,020,300,475	11,023,243,263	809,021,671	10,000,000,000	16,211,278,804	상세
데일리파트너스	고유계정	12	일반	개별	13,657,263,913	6,893,813,269	692,334,069	11,120,000,000	12,964,929,844	상세
동훈인베스트먼트	고유계정	12	일반	개별	8,026,754,162	5,817,521,097	495,600,610	7,000,000,000	7,531,153,552	상세"""

def clean_number(value_str):
    """Clean Korean formatted numbers"""
    if not value_str or value_str.strip() == '':
        return 0
    # Remove commas and convert to integer, handle negative numbers
    cleaned = value_str.replace(',', '').replace(' ', '')
    return int(cleaned)

def parse_data_line(line):
    """Parse a single line of data"""
    if not line.strip() or '상세' not in line:
        return None
        
    parts = line.strip().split('\t')
    if len(parts) < 10:
        return None
    
    company_name = parts[0]
    
    # Financial figures (columns 5-9)
    try:
        col_5 = clean_number(parts[5])
        col_6 = clean_number(parts[6]) 
        col_7 = clean_number(parts[7])
        col_8 = clean_number(parts[8])
        col_9 = clean_number(parts[9])
        
        return {
            'company_name': company_name,
            'col_5': col_5, 'col_6': col_6, 'col_7': col_7, 'col_8': col_8, 'col_9': col_9
        }
    except (ValueError, IndexError):
        return None

def parse_dataset(data_str):
    """Parse a dataset string into structured data"""
    lines = data_str.strip().split('\n')
    parsed_data = []
    
    for line in lines:
        result = parse_data_line(line)
        if result:
            parsed_data.append(result)
    
    return parsed_data

def generate_sql_inserts():
    """Generate SQL INSERT statements for both tables"""
    
    # Parse both datasets
    income_data = parse_dataset(income_statement_data)
    balance_data = parse_dataset(balance_sheet_data)
    
    print(f"-- Parsed {len(income_data)} income statement records")  
    print(f"-- Parsed {len(balance_data)} balance sheet records")
    print()
    
    # Clear existing data
    print("-- CLEAR EXISTING DATA")
    print("DELETE FROM diva_balance_sheets WHERE data_year = 2024;")
    print("DELETE FROM diva_income_statements WHERE data_year = 2024;")
    print()
    
    # Generate balance sheet inserts
    print("-- INSERT BALANCE SHEET DATA")
    print("INSERT INTO diva_balance_sheets (")
    print("    company_name, data_year, total_assets, startup_investment_assets,") 
    print("    total_liabilities, paid_in_capital, total_equity")
    print(") VALUES")
    
    for i, item in enumerate(balance_data):
        comma = "," if i < len(balance_data) - 1 else ";"
        # Balance sheet mapping: col_5=total_assets, col_6=startup_investment_assets, 
        # col_7=total_liabilities, col_8=paid_in_capital, col_9=total_equity
        print(f"('{item['company_name']}', 2024, {item['col_5']}, {item['col_6']}, {item['col_7']}, {item['col_8']}, {item['col_9']}){comma}")
    
    print()
    print("-- INSERT INCOME STATEMENT DATA")
    print("INSERT INTO diva_income_statements (")
    print("    company_name, data_year, operating_revenue, operating_expenses,")
    print("    operating_profit, net_income_before_taxes, net_profit")
    print(") VALUES")
    
    for i, item in enumerate(income_data):
        comma = "," if i < len(income_data) - 1 else ";"
        # Income statement mapping: col_8=operating_revenue, col_6=operating_expenses,
        # col_7=operating_profit, col_8=net_income_before_taxes, col_9=net_profit
        operating_revenue = item['col_8']
        operating_expenses = item['col_6'] 
        operating_profit = item['col_7']
        net_income_before_taxes = item['col_8']
        net_profit = item['col_9']
        
        print(f"('{item['company_name']}', 2024, {operating_revenue}, {operating_expenses}, {operating_profit}, {net_income_before_taxes}, {net_profit}){comma}")
    
    print()
    print("-- VERIFICATION QUERIES")
    print("SELECT 'Balance Sheets' as table_name, COUNT(*) as record_count FROM diva_balance_sheets WHERE data_year = 2024")
    print("UNION ALL") 
    print("SELECT 'Income Statements' as table_name, COUNT(*) as record_count FROM diva_income_statements WHERE data_year = 2024;")
    print()
    print("-- Sample balance sheet data")
    print("SELECT company_name, total_assets, total_equity FROM diva_balance_sheets WHERE data_year = 2024 ORDER BY total_assets DESC;")
    print()
    print("-- Sample income statement data") 
    print("SELECT company_name, operating_revenue, net_profit FROM diva_income_statements WHERE data_year = 2024 ORDER BY operating_revenue DESC;")

if __name__ == "__main__":
    generate_sql_inserts() 