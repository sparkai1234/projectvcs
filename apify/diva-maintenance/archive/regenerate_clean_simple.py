import os
import random
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
    
    return create_client(SUPABASE_URL, SUPABASE_KEY)

print('Regenerating Clean Validation Dataset (Simple)')
print('=' * 45)

supabase = get_supabase_client()
print('Connected to Supabase')

# Clear existing data
print('Clearing existing data...')
supabase.table('diva_balance_sheets').delete().neq('id', '00000000-0000-0000-0000-000000000000').execute()
supabase.table('diva_income_statements').delete().neq('id', '00000000-0000-0000-0000-000000000000').execute()

# Base companies (clean names only)
companies = ['경남벤처투자', '골든오크벤처스', '그랜드벤처스', '글로넷벤처파트너스', '네오인사이트벤처스']

# Generate balance sheet records - just use 2024 for all to avoid constraint issues
print('Uploading balance sheet records...')
balance_records = []
for i in range(250):
    company = companies[i % len(companies)]
    factor = random.uniform(0.8, 1.2)
    
    # Use sequential years within valid range
    year = 2020 + (i // len(companies)) % 11  # Cycle through 2020-2030
    
    record = {
        'company_name': company,
        'data_year': year,
        'total_assets': int(5000000000 * factor),
        'startup_investment_assets': int(2000000000 * factor),
        'total_liabilities': int(500000000 * factor),
        'paid_in_capital': int(3000000000 * factor),
        'total_equity': int(4500000000 * factor)
    }
    balance_records.append(record)

# Upload balance sheets in batches
for batch_num in range(5):
    start_idx = batch_num * 50
    end_idx = start_idx + 50
    batch = balance_records[start_idx:end_idx]
    try:
        supabase.table('diva_balance_sheets').insert(batch).execute()
        print(f'Uploaded {end_idx}/250 balance records')
    except Exception as e:
        print(f'Error in batch {batch_num}: {str(e)}')
        # Try inserting one by one
        for record in batch:
            try:
                supabase.table('diva_balance_sheets').insert([record]).execute()
            except:
                pass  # Skip duplicates

# Generate income statement records
print('Uploading income statement records...')
income_records = []
for i in range(250):
    company = companies[i % len(companies)]
    factor = random.uniform(0.8, 1.2)
    
    # Use sequential years within valid range
    year = 2020 + (i // len(companies)) % 11  # Cycle through 2020-2030
    
    record = {
        'company_name': company,
        'data_year': year,
        'operating_revenue': int(1000000000 * factor),
        'operating_expenses': int(800000000 * factor),
        'operating_profit': int(200000000 * factor),
        'net_income_before_taxes': int(250000000 * factor),
        'net_profit': int(180000000 * factor)
    }
    income_records.append(record)

# Upload income statements in batches
for batch_num in range(5):
    start_idx = batch_num * 50
    end_idx = start_idx + 50
    batch = income_records[start_idx:end_idx]
    try:
        supabase.table('diva_income_statements').insert(batch).execute()
        print(f'Uploaded {end_idx}/250 income records')
    except Exception as e:
        print(f'Error in batch {batch_num}: {str(e)}')
        # Try inserting one by one
        for record in batch:
            try:
                supabase.table('diva_income_statements').insert([record]).execute()
            except:
                pass  # Skip duplicates

# Verify final results
print('Verifying final results...')
balance_count = supabase.table('diva_balance_sheets').select('id').execute()
income_count = supabase.table('diva_income_statements').select('id').execute()

balance_total = len(balance_count.data) if balance_count.data else 0
income_total = len(income_count.data) if income_count.data else 0

print(f'Final count - Balance sheets: {balance_total}')
print(f'Final count - Income statements: {income_total}')

# Sample data
balance_sample = supabase.table('diva_balance_sheets').select('company_name, data_year').limit(5).execute()
print('Sample balance sheet records:')
for i, record in enumerate(balance_sample.data):
    print(f'  {i+1}. {record["company_name"]} ({record["data_year"]})')

# Check for version numbers
balance_with_versions = supabase.table('diva_balance_sheets').select('company_name').like('company_name', '%_v%').execute()
income_with_versions = supabase.table('diva_income_statements').select('company_name').like('company_name', '%_v%').execute()

version_count = len(balance_with_versions.data or []) + len(income_with_versions.data or [])

print(f'Records with version numbers: {version_count}')
if version_count == 0:
    print('✅ SUCCESS: All company names are clean!')
else:
    print('❌ WARNING: Some version numbers still found')

print('Clean regeneration complete!')
print(f'Total records: {balance_total + income_total}') 