#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Simple Fuzzy Company Matcher - Windows Compatible
Links VC Table, Fund Table, and Contacts Full through company names
"""

import requests
import json
from fuzzywuzzy import fuzz, process
import time

def fetch_table_data(api_key, base_id, table_name, company_field):
    """Fetch company names from specified table"""
    print(f"Fetching data from {table_name}...")
    
    url = f"https://api.airtable.com/v0/{base_id}/{table_name}"
    all_records = {}
    offset = None
    
    headers = {
        "Authorization": f"Bearer {api_key}",
        "Content-Type": "application/json"
    }
    
    while True:
        params = {"fields[]": company_field}
        if offset:
            params["offset"] = offset
            
        response = requests.get(url, headers=headers, params=params)
        
        if response.status_code != 200:
            print(f"ERROR fetching {table_name}: {response.text}")
            break
            
        data = response.json()
        
        for record in data.get("records", []):
            company_name = record.get("fields", {}).get(company_field)
            if company_name:
                all_records[record["id"]] = company_name.strip()
        
        offset = data.get("offset")
        if not offset:
            break
            
        time.sleep(0.2)  # Rate limiting
    
    print(f"Found {len(all_records)} companies in {table_name}")
    return all_records

def fuzzy_match_companies(vc_companies, fund_companies, contact_companies, threshold=80):
    """Perform fuzzy matching between company names"""
    print(f"Starting fuzzy matching (threshold: {threshold}%)...")
    
    matches = []
    
    # Combine VC and Fund companies
    all_vc_fund_companies = {}
    
    for record_id, company in vc_companies.items():
        if company not in all_vc_fund_companies:
            all_vc_fund_companies[company] = {"vc_records": [], "fund_records": []}
        all_vc_fund_companies[company]["vc_records"].append(record_id)
    
    for record_id, company in fund_companies.items():
        if company not in all_vc_fund_companies:
            all_vc_fund_companies[company] = {"vc_records": [], "fund_records": []}
        all_vc_fund_companies[company]["fund_records"].append(record_id)
    
    print(f"Total unique VC/Fund companies: {len(all_vc_fund_companies)}")
    
    # Match contacts against VC/Fund companies
    for contact_record_id, contact_company in contact_companies.items():
        best_matches = process.extract(contact_company, list(all_vc_fund_companies.keys()), limit=3)
        
        for match_company, score in best_matches:
            if score >= threshold:
                print(f"MATCH: '{contact_company}' -> '{match_company}' ({score}%)")
                
                matches.append({
                    "contact_company": contact_company,
                    "matched_company": match_company,
                    "score": score,
                    "contact_record_id": contact_record_id,
                    "vc_records": all_vc_fund_companies[match_company]["vc_records"],
                    "fund_records": all_vc_fund_companies[match_company]["fund_records"]
                })
                break
    
    print(f"Found {len(matches)} fuzzy matches")
    return matches

def main():
    API_KEY = "patOUfAsek4nbpvHm.49789ced0e2b0304bdc507f110d936277cd3da18ec3efc9347c93e6a1810919e"
    BASE_ID = "appdR8V9lJaRW8VkR"
    THRESHOLD = 80
    
    print("Simple Fuzzy Company Matcher")
    print("=" * 50)
    
    # Load data from all tables
    vc_companies = fetch_table_data(API_KEY, BASE_ID, "VC Table", "Company Name")
    fund_companies = fetch_table_data(API_KEY, BASE_ID, "Fund Table", "Company Name (Korean)")
    contact_companies = fetch_table_data(API_KEY, BASE_ID, "Contacts Full", "회사")
    
    print("\nData Summary:")
    print(f"  VC Companies: {len(vc_companies)}")
    print(f"  Fund Companies: {len(fund_companies)}")
    print(f"  Contact Companies: {len(contact_companies)}")
    
    if len(contact_companies) == 0:
        print("ERROR: No contact companies found!")
        return
    
    # Perform fuzzy matching
    matches = fuzzy_match_companies(vc_companies, fund_companies, contact_companies, THRESHOLD)
    
    # Save results
    results = {
        "matches": matches,
        "stats": {
            "total_vc_companies": len(vc_companies),
            "total_fund_companies": len(fund_companies),
            "total_contact_companies": len(contact_companies),
            "total_matches": len(matches),
            "match_rate": len(matches) / len(contact_companies) * 100 if contact_companies else 0
        }
    }
    
    with open("simple_fuzzy_results.json", "w", encoding="utf-8") as f:
        json.dump(results, f, indent=2, ensure_ascii=False)
    
    print("\nSUMMARY")
    print("=" * 30)
    print(f"VC Companies: {results['stats']['total_vc_companies']}")
    print(f"Fund Companies: {results['stats']['total_fund_companies']}")
    print(f"Contact Companies: {results['stats']['total_contact_companies']}")
    print(f"Successful Matches: {results['stats']['total_matches']}")
    print(f"Match Rate: {results['stats']['match_rate']:.1f}%")
    
    print(f"\nResults saved to: simple_fuzzy_results.json")

if __name__ == "__main__":
    main() 