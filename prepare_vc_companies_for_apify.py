#!/usr/bin/env python3
"""
🔄 VC Companies CSV to Apify Input Converter
=============================================

Converts the VC List CSV file to the proper format for the 
VC Company Matcher Apify actor.

Usage:
    python prepare_vc_companies_for_apify.py [csv_file_path] [--output output.json] [--limit N]

Features:
- Reads Korean VC company names from CSV
- Removes duplicates and empty entries
- Formats for Apify actor input
- Optional limiting for testing
"""

import csv
import json
import argparse
import sys
from pathlib import Path

def read_vc_companies_from_csv(csv_file_path):
    """
    Read VC company names from CSV file
    
    Args:
        csv_file_path (str): Path to the CSV file
        
    Returns:
        list: List of company names
    """
    companies = []
    
    try:
        # Try different encodings
        encodings = ['utf-8', 'cp949', 'euc-kr', 'utf-8-sig']
        
        for encoding in encodings:
            try:
                with open(csv_file_path, 'r', encoding=encoding, newline='') as file:
                    # Try to detect if it's a proper CSV or just line-separated
                    content = file.read()
                    file.seek(0)
                    
                    if ',' in content:
                        # It's a CSV file
                        csv_reader = csv.reader(file)
                        for row in csv_reader:
                            if row:  # Skip empty rows
                                company_name = row[0].strip()
                                if company_name:
                                    companies.append(company_name)
                    else:
                        # It's line-separated
                        for line in file:
                            company_name = line.strip()
                            if company_name:
                                companies.append(company_name)
                
                print(f"✅ Successfully read file with {encoding} encoding")
                break
                
            except UnicodeDecodeError:
                continue
        
        if not companies:
            raise Exception("Could not read the file with any encoding")
            
    except Exception as e:
        print(f"❌ Error reading CSV file: {e}")
        sys.exit(1)
    
    return companies

def clean_company_names(companies):
    """
    Clean and deduplicate company names
    
    Args:
        companies (list): Raw list of company names
        
    Returns:
        list: Cleaned list of unique company names
    """
    cleaned = []
    seen = set()
    
    for company in companies:
        # Clean the name
        cleaned_name = company.strip()
        
        # Skip empty names
        if not cleaned_name:
            continue
            
        # Skip duplicates (case-insensitive)
        if cleaned_name.lower() not in seen:
            cleaned.append(cleaned_name)
            seen.add(cleaned_name.lower())
    
    return cleaned

def create_apify_input(companies, supabase_url=None, supabase_key=None, max_companies=None):
    """
    Create Apify actor input format
    
    Args:
        companies (list): List of company names
        supabase_url (str): Supabase URL (optional)
        supabase_key (str): Supabase API key (optional) 
        max_companies (int): Limit number of companies (optional)
        
    Returns:
        dict: Apify input format
    """
    input_data = {
        "vcCompanies": companies[:max_companies] if max_companies else companies,
        "maxConcurrency": 1,
        "delayBetweenRequests": 3000
    }
    
    if supabase_url:
        input_data["supabaseUrl"] = supabase_url
    if supabase_key:
        input_data["supabaseKey"] = supabase_key
    if max_companies:
        input_data["maxCompanies"] = max_companies
    
    return input_data

def main():
    parser = argparse.ArgumentParser(
        description="Convert VC Companies CSV to Apify Input Format"
    )
    parser.add_argument(
        "csv_file", 
        nargs='?',
        default="c:/Users/k/Downloads/VC LIst  - Sheet1.csv",
        help="Path to the CSV file (default: Downloads path)"
    )
    parser.add_argument(
        "--output", "-o",
        default="vc_companies_apify_input.json",
        help="Output JSON file path (default: vc_companies_apify_input.json)"
    )
    parser.add_argument(
        "--limit", "-l",
        type=int,
        help="Limit number of companies for testing"
    )
    parser.add_argument(
        "--supabase-url",
        help="Supabase URL (optional)"
    )
    parser.add_argument(
        "--supabase-key", 
        help="Supabase API key (optional)"
    )
    
    args = parser.parse_args()
    
    print("🔄 VC Companies CSV to Apify Input Converter")
    print("=" * 50)
    
    # Check if CSV file exists
    csv_path = Path(args.csv_file)
    if not csv_path.exists():
        print(f"❌ CSV file not found: {csv_path}")
        sys.exit(1)
    
    print(f"📁 Reading CSV file: {csv_path}")
    
    # Read companies from CSV
    companies = read_vc_companies_from_csv(args.csv_file)
    print(f"📊 Read {len(companies)} companies from CSV")
    
    # Clean and deduplicate
    cleaned_companies = clean_company_names(companies)
    print(f"🧹 After cleaning: {len(cleaned_companies)} unique companies")
    
    # Show sample companies
    print(f"📋 Sample companies:")
    for i, company in enumerate(cleaned_companies[:5]):
        print(f"   {i+1}. {company}")
    if len(cleaned_companies) > 5:
        print(f"   ... and {len(cleaned_companies) - 5} more")
    
    # Create Apify input
    apify_input = create_apify_input(
        cleaned_companies,
        args.supabase_url,
        args.supabase_key,
        args.limit
    )
    
    # Save to JSON file
    output_path = Path(args.output)
    with open(output_path, 'w', encoding='utf-8') as f:
        json.dump(apify_input, f, indent=2, ensure_ascii=False)
    
    print(f"💾 Saved Apify input to: {output_path}")
    print(f"📊 Final input contains {len(apify_input['vcCompanies'])} companies")
    
    if args.limit:
        print(f"⚠️ Limited to {args.limit} companies for testing")
    
    print("\n🚀 Ready for Apify!")
    print("Next steps:")
    print("1. Upload this actor to Apify")
    print("2. Use the generated JSON as input")
    print("3. Set your Supabase credentials in the actor input")
    print("4. Run the actor to match company URLs and representatives")

if __name__ == "__main__":
    main() 