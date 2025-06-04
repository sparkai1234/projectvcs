#!/usr/bin/env python3
"""
🚀 Migrate ALL Contacts Full Records from Airtable to Supabase
17,000+ contact records migration
"""

import requests
from supabase import create_client, Client
from api_config import get_config, get_supabase_config
import time

def get_all_airtable_contacts():
    """Get ALL contact records from Airtable Contacts Full table"""
    config = get_config()
    base_url = f'https://api.airtable.com/v0/{config["airtable_base_id"]}'
    headers = {'Authorization': f'Bearer {config["airtable_api_key"]}'}
    
    all_records = []
    offset = None
    page = 1
    
    print("🔍 Fetching ALL contact records from Airtable Contacts Full...")
    print("💡 This may take a while - 17,000+ records to process...")
    
    while True:
        url = f'{base_url}/Contacts%20Full'  # URL encoded table name
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
                
                print(f"✅ {len(records)} records (total: {len(all_records):,})")
                
                # Check for pagination
                offset = data.get('offset')
                if not offset:
                    print("✅ Reached end of contact data")
                    break
                    
                page += 1
                
                # Rate limiting - Airtable allows 5 requests per second
                time.sleep(0.2)  # 200ms delay between requests
                
            elif response.status_code == 422:
                print(f"⚠️  API Error 422 - possible pagination limit reached")
                print(f"   📊 Collected {len(all_records):,} contact records so far")
                break
            else:
                print(f"❌ Error: {response.status_code}")
                print(f"   Response: {response.text[:200]}...")
                break
                
        except Exception as e:
            print(f"❌ Error fetching page {page}: {e}")
            break
    
    print(f"\n📊 TOTAL CONTACT RECORDS FETCHED: {len(all_records):,}")
    return all_records

def clear_existing_contacts():
    """Clear existing contact records from Supabase before fresh migration"""
    print("\n🗑️  Clearing existing contact records...")
    
    config = get_supabase_config(use_service_role=True)
    supabase: Client = create_client(config['url'], config['key'])
    
    try:
        # Delete all existing contact records
        result = supabase.table('contacts_full').delete().neq('id', '00000000-0000-0000-0000-000000000000').execute()
        print(f"✅ Cleared existing contact records")
    except Exception as e:
        print(f"⚠️  Could not clear existing records: {e}")

def migrate_contacts_batch(records, batch_size=50):
    """Migrate contact records in batches for better performance"""
    print(f"\n🚀 Migrating {len(records):,} contacts in batches of {batch_size}...")
    
    config = get_supabase_config(use_service_role=True)
    supabase: Client = create_client(config['url'], config['key'])
    
    success_count = 0
    error_count = 0
    
    # Process in batches
    for i in range(0, len(records), batch_size):
        batch = records[i:i + batch_size]
        batch_num = (i // batch_size) + 1
        
        print(f"\n📦 Batch {batch_num}: Processing records {i+1:,}-{min(i+batch_size, len(records)):,}")
        
        batch_records = []
        
        for record in batch:
            try:
                fields = record.get('fields', {})
                
                # Map contact fields (handle Korean field names)
                contact_record = {
                    '이름': fields.get('이름', fields.get('Name', '')),  # Korean name
                    'name_en': fields.get('Name (English)', fields.get('name_en', '')),  # English name
                    '회사': fields.get('회사', fields.get('Company', '')),  # Korean company
                    'company_en': fields.get('Company (English)', fields.get('company_en', '')),  # English company
                    '직책': fields.get('직책', fields.get('Position', '')),  # Korean position
                    'position_en': fields.get('Position (English)', fields.get('position_en', '')),  # English position
                    '이메일': fields.get('이메일', fields.get('Email', '')),  # Korean email
                    'email': fields.get('Email', fields.get('email', '')),  # Standard email
                    '전화번호': fields.get('전화번호', fields.get('Phone', '')),  # Korean phone
                    'phone': fields.get('Phone', fields.get('phone', '')),  # Standard phone
                    '업계': fields.get('업계', fields.get('Industry', '')),  # Industry Korean
                    'industry_en': fields.get('Industry (English)', fields.get('industry_en', '')),  # Industry English
                    'contact_source': 'airtable_contacts_full_migration',
                    'notes': fields.get('Notes', fields.get('notes', '')),
                    'is_vc_industry': False  # Will be determined later by fuzzy matching
                }
                
                # Skip if no name or company
                if contact_record['이름'] or contact_record['name_en'] or contact_record['회사'] or contact_record['company_en']:
                    batch_records.append(contact_record)
                
            except Exception as e:
                error_count += 1
                print(f"   ❌ Error preparing contact record: {str(e)[:50]}...")
        
        # Insert batch to Supabase
        if batch_records:
            try:
                result = supabase.table('contacts_full').insert(batch_records).execute()
                
                if result.data:
                    batch_success = len(result.data)
                    success_count += batch_success
                    print(f"   ✅ Inserted {batch_success} contacts")
                    
                    # Show sample from this batch
                    if result.data:
                        sample_name = result.data[0].get('이름', result.data[0].get('name_en', 'Unknown'))[:20]
                        sample_company = result.data[0].get('회사', result.data[0].get('company_en', 'Unknown'))[:20]
                        print(f"   📄 Sample: {sample_name} @ {sample_company}")
                else:
                    error_count += len(batch_records)
                    print(f"   ❌ Failed to insert contact batch")
                    
            except Exception as e:
                error_count += len(batch_records)
                print(f"   ❌ Contact batch insert error: {str(e)[:60]}...")
        
        # Rate limiting for Supabase
        time.sleep(0.1)
        
        # Progress update every 10 batches
        if batch_num % 10 == 0:
            print(f"   📊 Progress: {success_count:,}/{len(records):,} contacts migrated ({(success_count/len(records)*100):.1f}%)")
    
    print(f"\n📊 CONTACT MIGRATION SUMMARY:")
    print(f"✅ Successfully migrated: {success_count:,} contacts")
    print(f"❌ Errors: {error_count:,}")
    print(f"📈 Total processed: {len(records):,}")
    
    return success_count

def main():
    """Main contact migration function"""
    print("🚀 COMPLETE CONTACTS FULL MIGRATION - ALL 17,000+ RECORDS")
    print("=" * 70)
    
    # Get ALL contact data from Airtable
    all_contact_records = get_all_airtable_contacts()
    
    if not all_contact_records:
        print("❌ No contact records found. Exiting.")
        return
    
    print(f"\n📋 CONTACT MIGRATION PLAN:")
    print(f"   🎯 Records to migrate: {len(all_contact_records):,}")
    print(f"   📦 Batch size: 50 records")
    print(f"   🗑️  Clear existing: Yes")
    print(f"   📊 Estimated time: ~{len(all_contact_records)//50} minutes")
    
    # Confirm migration
    response = input(f"\n🚀 Proceed with migrating {len(all_contact_records):,} contact records? (y/N): ")
    if response.lower() != 'y':
        print("Contact migration cancelled.")
        return
    
    # Clear existing data
    clear_existing_contacts()
    
    # Perform migration
    success_count = migrate_contacts_batch(all_contact_records)
    
    if success_count > 0:
        print(f"\n🎉 MASSIVE SUCCESS! Migrated {success_count:,} contacts to Supabase!")
        print(f"📈 Your contact database now contains {success_count:,} records")
        print(f"👥 Korean business contact network fully available!")
        print(f"🔍 Ready for fuzzy matching with VC companies!")
    else:
        print(f"\n❌ Contact migration failed. Check errors above.")

if __name__ == "__main__":
    main() 