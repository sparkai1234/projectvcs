#!/usr/bin/env python3
"""
🚀 Migrate ALL Fund Records from Airtable to Supabase
Handles pagination to get all 3,600+ fund records
"""

import requests
from supabase import create_client, Client
from api_config import get_config, get_supabase_config
import time

def get_all_airtable_funds():
    """Get ALL fund records from Airtable with proper pagination"""
    config = get_config()
    base_url = f'https://api.airtable.com/v0/{config["airtable_base_id"]}'
    headers = {'Authorization': f'Bearer {config["airtable_api_key"]}'}
    
    all_records = []
    offset = None
    page = 1
    
    print("🔍 Fetching ALL fund records from Airtable...")
    print("💡 This may take a while due to API rate limits...")
    
    while True:
        url = f'{base_url}/Fund%20Table'
        params = {'pageSize': 100}  # Max records per request
        if offset:
            params['offset'] = offset
            
        try:
            print(f"   📥 Fetching page {page}...", end=" ")
            response = requests.get(url, headers=headers, params=params)
            
            if response.status_code == 200:
                data = response.json()
                records = data.get('records', [])
                all_records.extend(records)
                
                print(f"✅ {len(records)} records (total: {len(all_records)})")
                
                # Check for pagination
                offset = data.get('offset')
                if not offset:
                    print("✅ Reached end of data")
                    break
                    
                page += 1
                
                # Rate limiting - Airtable allows 5 requests per second
                time.sleep(0.2)  # 200ms delay between requests
                
            elif response.status_code == 422:
                print(f"⚠️  API Error 422 - possible pagination limit reached")
                print(f"   📊 Collected {len(all_records)} records so far")
                break
            else:
                print(f"❌ Error: {response.status_code}")
                print(f"   Response: {response.text[:200]}...")
                break
                
        except Exception as e:
            print(f"❌ Error fetching page {page}: {e}")
            break
    
    print(f"\n📊 TOTAL FUND RECORDS FETCHED: {len(all_records)}")
    return all_records

def clear_existing_funds():
    """Clear existing fund records from Supabase before fresh migration"""
    print("\n🗑️  Clearing existing fund records...")
    
    config = get_supabase_config(use_service_role=True)
    supabase: Client = create_client(config['url'], config['key'])
    
    try:
        # Delete all existing fund records
        result = supabase.table('fund_table').delete().neq('id', '00000000-0000-0000-0000-000000000000').execute()
        print(f"✅ Cleared existing fund records")
    except Exception as e:
        print(f"⚠️  Could not clear existing records: {e}")

def migrate_funds_batch(records, batch_size=50):
    """Migrate fund records in batches for better performance"""
    print(f"\n🚀 Migrating {len(records)} funds in batches of {batch_size}...")
    
    config = get_supabase_config(use_service_role=True)
    supabase: Client = create_client(config['url'], config['key'])
    
    success_count = 0
    error_count = 0
    
    # Process in batches
    for i in range(0, len(records), batch_size):
        batch = records[i:i + batch_size]
        batch_num = (i // batch_size) + 1
        
        print(f"\n📦 Batch {batch_num}: Processing records {i+1}-{min(i+batch_size, len(records))}")
        
        batch_records = []
        
        for record in batch:
            try:
                fields = record.get('fields', {})
                
                # Map fields correctly
                fund_record = {
                    'company_id': fields.get('Company ID', ''),
                    'fund_name': fields.get('Name', ''),
                    'fund_type': fields.get('Data Type', ''),
                    'commitment_amount': int(float(fields.get('Operating Amount', 0)) * 1000000000) if fields.get('Operating Amount') else None,
                    'establishment_date': fields.get('Founded'),  # Keep as string
                    'fund_status': fields.get('Status', ''),
                    'apify_source': 'airtable_full_migration'
                }
                
                # Skip if essential data missing
                if fund_record['company_id'] and fund_record['fund_name']:
                    batch_records.append(fund_record)
                
            except Exception as e:
                error_count += 1
                print(f"   ❌ Error preparing record: {str(e)[:50]}...")
        
        # Insert batch to Supabase
        if batch_records:
            try:
                result = supabase.table('fund_table').insert(batch_records).execute()
                
                if result.data:
                    batch_success = len(result.data)
                    success_count += batch_success
                    print(f"   ✅ Inserted {batch_success} records")
                    
                    # Show sample from this batch
                    if result.data:
                        sample_name = result.data[0].get('fund_name', 'Unknown')[:30]
                        print(f"   📄 Sample: {sample_name}...")
                else:
                    error_count += len(batch_records)
                    print(f"   ❌ Failed to insert batch")
                    
            except Exception as e:
                error_count += len(batch_records)
                print(f"   ❌ Batch insert error: {str(e)[:60]}...")
        
        # Rate limiting for Supabase
        time.sleep(0.1)
    
    print(f"\n📊 MIGRATION SUMMARY:")
    print(f"✅ Successfully migrated: {success_count:,} funds")
    print(f"❌ Errors: {error_count:,}")
    print(f"📈 Total processed: {len(records):,}")
    
    return success_count

def main():
    """Main migration function"""
    print("🚀 COMPLETE FUND MIGRATION - ALL 3,600+ RECORDS")
    print("=" * 60)
    
    # Get ALL fund data from Airtable
    all_fund_records = get_all_airtable_funds()
    
    if not all_fund_records:
        print("❌ No fund records found. Exiting.")
        return
    
    print(f"\n📋 MIGRATION PLAN:")
    print(f"   🎯 Records to migrate: {len(all_fund_records):,}")
    print(f"   📦 Batch size: 50 records")
    print(f"   🗑️  Clear existing: Yes")
    
    # Confirm migration
    response = input(f"\n🚀 Proceed with migrating {len(all_fund_records):,} fund records? (y/N): ")
    if response.lower() != 'y':
        print("Migration cancelled.")
        return
    
    # Clear existing data
    clear_existing_funds()
    
    # Perform migration
    success_count = migrate_funds_batch(all_fund_records)
    
    if success_count > 0:
        print(f"\n🎉 SUCCESS! Migrated {success_count:,} funds to Supabase!")
        print(f"📈 Your fund database now contains {success_count:,} records")
        print(f"💰 Korean VC fund data fully available!")
    else:
        print(f"\n❌ Migration failed. Check errors above.")

if __name__ == "__main__":
    main() 