#!/usr/bin/env python3
import requests
import json
import time
from datetime import datetime

# Configuration
AIRTABLE_API_KEY = "patOUfAsek4nbpvHm.49789ced0e2b0304bdc507f110d936277cd3da18ec3efc9347c93e6a1810919e"
AIRTABLE_BASE_ID = "appdR8V9lJaRW8VkR"

# Headers for Airtable API
headers = {
    'Authorization': f'Bearer {AIRTABLE_API_KEY}',
    'Content-Type': 'application/json'
}

def simple_similarity(a, b):
    """Simple similarity based on common characters"""
    if not a or not b:
        return 0
    
    # Normalize and compare
    a_clean = str(a).strip().lower()
    b_clean = str(b).strip().lower()
    
    if a_clean == b_clean:
        return 100
    
    # Check if one contains the other
    if a_clean in b_clean or b_clean in a_clean:
        return 85
    
    # Count common characters
    common = set(a_clean) & set(b_clean)
    total = set(a_clean) | set(b_clean)
    
    if len(total) == 0:
        return 0
    
    return int((len(common) / len(total)) * 100)

def fetch_all_records(table_name, fields=None):
    """Fetch all records from a table"""
    url = f"https://api.airtable.com/v0/{AIRTABLE_BASE_ID}/{table_name}"
    
    params = {}
    if fields:
        for field in fields:
            params[f'fields[]'] = field
    
    all_records = []
    offset = None
    
    while True:
        if offset:
            params['offset'] = offset
        
        try:
            response = requests.get(url, headers=headers, params=params)
            response.raise_for_status()
            data = response.json()
            
            all_records.extend(data.get('records', []))
            
            offset = data.get('offset')
            if not offset:
                break
                
            time.sleep(0.2)  # Rate limiting
            
        except Exception as e:
            print(f"Error fetching {table_name}: {e}")
            break
    
    return all_records

def main():
    print("=== Korean VC Fuzzy Company Matcher ===")
    print(f"Started at: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
    print()
    
    # Fetch data from all tables
    print("1. Fetching VC companies...")
    vc_records = fetch_all_records("VC Table", ["Company Name"])
    print(f"   Found {len(vc_records)} VC companies")
    
    print("2. Fetching Fund companies...")
    fund_records = fetch_all_records("Fund Table", ["Company Name (Korean)"])
    print(f"   Found {len(fund_records)} Fund companies")
    
    print("3. Fetching Contacts...")
    contact_records = fetch_all_records("Contacts Full", ["회사"])
    print(f"   Found {len(contact_records)} contacts")
    print()
    
    # Create combined company list
    companies = []
    
    # Add VC companies
    for record in vc_records:
        company_name = record.get('fields', {}).get('Company Name', '').strip()
        if company_name:
            companies.append({
                'name': company_name,
                'type': 'VC',
                'record_id': record['id']
            })
    
    # Add Fund companies
    for record in fund_records:
        company_name = record.get('fields', {}).get('Company Name (Korean)', '').strip()
        if company_name:
            companies.append({
                'name': company_name,
                'type': 'Fund',
                'record_id': record['id']
            })
    
    print(f"Total unique companies to match against: {len(companies)}")
    print()
    
    # Process contacts
    matches = []
    no_matches = []
    
    total_contacts = len(contact_records)
    processed = 0
    start_time = time.time()
    
    print("4. Starting fuzzy matching...")
    print(f"   Processing {total_contacts} contacts...")
    
    for contact in contact_records:
        processed += 1
        
        # Progress update every 100 contacts
        if processed % 100 == 0 or processed == total_contacts:
            elapsed = time.time() - start_time
            rate = processed / elapsed if elapsed > 0 else 0
            eta = (total_contacts - processed) / rate if rate > 0 else 0
            
            print(f"   Progress: {processed}/{total_contacts} ({processed/total_contacts*100:.1f}%) - "
                  f"Rate: {rate:.1f}/sec - ETA: {eta/60:.1f}min")
        
        contact_company = contact.get('fields', {}).get('회사', '').strip()
        if not contact_company or len(contact_company) < 2:
            no_matches.append({
                'contact_id': contact['id'],
                'contact_company': contact_company,
                'reason': 'Empty or too short company name'
            })
            continue
        
        # Find best match
        best_match = None
        best_score = 0
        
        for company in companies:
            score = simple_similarity(contact_company, company['name'])
            if score > best_score and score >= 80:  # 80% threshold
                best_score = score
                best_match = company
        
        if best_match:
            matches.append({
                'contact_id': contact['id'],
                'contact_company': contact_company,
                'matched_company': best_match['name'],
                'matched_type': best_match['type'],
                'matched_record_id': best_match['record_id'],
                'similarity_score': best_score
            })
        else:
            no_matches.append({
                'contact_id': contact['id'],
                'contact_company': contact_company,
                'reason': 'No match above 80% threshold'
            })
    
    # Save results
    print()
    print("5. Saving results...")
    
    results = {
        'summary': {
            'total_contacts': total_contacts,
            'total_companies': len(companies),
            'matches_found': len(matches),
            'no_matches': len(no_matches),
            'match_rate': f"{len(matches)/total_contacts*100:.1f}%",
            'processing_time_minutes': f"{(time.time() - start_time)/60:.1f}",
            'generated_at': datetime.now().isoformat()
        },
        'matches': matches[:50],  # First 50 matches
        'sample_no_matches': no_matches[:20]  # First 20 no-matches
    }
    
    with open('simple_fuzzy_results.json', 'w', encoding='utf-8') as f:
        json.dump(results, f, ensure_ascii=False, indent=2)
    
    # Print summary
    print(f"✅ Analysis Complete!")
    print(f"   📊 {len(matches)} matches found ({len(matches)/total_contacts*100:.1f}%)")
    print(f"   ⏱️  Processing time: {(time.time() - start_time)/60:.1f} minutes")
    print(f"   💾 Results saved to: simple_fuzzy_results.json")
    print()
    
    # Show top matches
    print("🎯 Top 10 Matches:")
    for i, match in enumerate(matches[:10], 1):
        print(f"   {i:2d}. {match['contact_company'][:20]:<20} → "
              f"{match['matched_company'][:20]:<20} ({match['similarity_score']}% {match['matched_type']})")
    
    print()
    print("Analysis completed successfully! 🎉")

if __name__ == "__main__":
    main() 