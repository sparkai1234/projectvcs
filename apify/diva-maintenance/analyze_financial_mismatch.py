#!/usr/bin/env python3
"""
Analyze Financial Statement Mismatch
Analyzes the differences between balance sheet and income statement data
"""

import json
import os
from supabase import create_client, Client
import sys

def analyze_financial_mismatch():
    """Analyze the mismatch between balance sheets and income statements"""
    print("🔍 === ANALYZING FINANCIAL STATEMENT MISMATCH ===")
    
    # Initialize Supabase client
    supabase_url = os.getenv('SUPABASE_URL')
    supabase_key = os.getenv('SUPABASE_SERVICE_ROLE_KEY') or os.getenv('SUPABASE_KEY')
    
    if not supabase_url or not supabase_key:
        print("❌ Error: SUPABASE_URL and SUPABASE_SERVICE_ROLE_KEY environment variables required")
        sys.exit(1)
    
    supabase: Client = create_client(supabase_url, supabase_key)
    print(f"✅ Connected to Supabase")
    
    # Load original dataset
    dataset_path = "../diva-scraper-standalone/dataset_final-diva-scraper_2025-06-10_00-27-35-666.json"
    
    try:
        with open(dataset_path, 'r', encoding='utf-8') as f:
            data = json.load(f)
        print(f"✅ Loaded {len(data):,} records from dataset")
    except Exception as e:
        print(f"❌ Error loading dataset: {e}")
        return False
    
    # Extract companies from original dataset
    balance_companies = set()
    income_companies = set()
    
    for record in data:
        company_name = record.get('column_0')
        if not company_name:
            continue
            
        company_name = company_name.lower().strip()
        
        if record.get('dataType') == 'financial_statements_balance':
            balance_companies.add(company_name)
        elif record.get('dataType') == 'financial_statements_income':
            income_companies.add(company_name)
    
    print(f"📊 ORIGINAL DATASET:")
    print(f"   - Balance sheet companies: {len(balance_companies)}")
    print(f"   - Income statement companies: {len(income_companies)}")
    print(f"   - Companies in both: {len(balance_companies & income_companies)}")
    print(f"   - Balance only: {len(balance_companies - income_companies)}")
    print(f"   - Income only: {len(income_companies - balance_companies)}")
    
    # Get current database state
    try:
        response = supabase.table('diva_financial_statements').select('company_name, tab_type').execute()
        current_data = response.data
        
        current_balance = set()
        current_income = set()
        
        for row in current_data:
            if not row['company_name']:
                continue
                
            company_name = row['company_name'].lower().strip()
            
            if row['tab_type'] == 'balance_sheet':
                current_balance.add(company_name)
            elif row['tab_type'] == 'income_statement':
                current_income.add(company_name)
        
        print(f"\n📊 CURRENT DATABASE:")
        print(f"   - Balance sheet companies: {len(current_balance)}")
        print(f"   - Income statement companies: {len(current_income)}")
        print(f"   - Companies in both: {len(current_balance & current_income)}")
        print(f"   - Balance only: {len(current_balance - current_income)}")
        print(f"   - Income only: {len(current_income - current_balance)}")
        
        # Find missing companies
        missing_balance = balance_companies - current_balance
        missing_income = income_companies - current_income
        
        print(f"\n🔍 MISSING DATA:")
        print(f"   - Missing balance sheets: {len(missing_balance)}")
        print(f"   - Missing income statements: {len(missing_income)}")
        
        if missing_balance:
            print(f"\n📋 Missing Balance Sheet Companies (first 10):")
            for i, company in enumerate(list(missing_balance)[:10]):
                print(f"   {i+1}. {company}")
        
        if missing_income:
            print(f"\n📋 Missing Income Statement Companies (first 10):")
            for i, company in enumerate(list(missing_income)[:10]):
                print(f"   {i+1}. {company}")
        
        # Check for companies that should have both but are missing one
        should_have_both = balance_companies & income_companies
        missing_pairs = []
        
        for company in should_have_both:
            has_balance = company in current_balance
            has_income = company in current_income
            
            if not (has_balance and has_income):
                missing_pairs.append({
                    'company': company,
                    'has_balance': has_balance,
                    'has_income': has_income
                })
        
        if missing_pairs:
            print(f"\n⚠️ COMPANIES MISSING PAIRED DATA ({len(missing_pairs)} companies):")
            for i, pair in enumerate(missing_pairs[:10]):
                status = []
                if not pair['has_balance']:
                    status.append('missing balance')
                if not pair['has_income']:
                    status.append('missing income')
                print(f"   {i+1}. {pair['company']} - {', '.join(status)}")
        
        return True
        
    except Exception as e:
        print(f"❌ Error analyzing database: {str(e)}")
        return False

if __name__ == "__main__":
    success = analyze_financial_mismatch()
    if success:
        print(f"\n🎉 Financial statement analysis completed!")
    else:
        print(f"\n❌ Financial statement analysis failed")
        sys.exit(1) 