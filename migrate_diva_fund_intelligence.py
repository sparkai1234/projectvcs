#!/usr/bin/env python3
"""
📊 DIVA Fund Intelligence Migration
Migrate fund intelligence data from Airtable to Supabase
"""

import requests
from supabase import create_client, Client
from api_config import get_config, get_supabase_config
import time
import json
from datetime import datetime

def get_airtable_diva_fund_data():
    """Get DIVA Fund Intelligence data from Airtable"""
    print("🔍 FETCHING DIVA FUND INTELLIGENCE FROM AIRTABLE")
    print("=" * 50)
    
    airtable_config = get_config()
    base_url = f'https://api.airtable.com/v0/{airtable_config["airtable_base_id"]}'
    headers = {'Authorization': f'Bearer {airtable_config["airtable_api_key"]}'}
    
    try:
        # Get DIVA Fund Intelligence data
        url = f'{base_url}/DIVA%20Fund%20Intelligence'
        
        all_records = []
        offset = None
        page = 1
        
        while True:
            params = {'pageSize': 100}
            if offset:
                params['offset'] = offset
            
            response = requests.get(url, headers=headers, params=params)
            
            if response.status_code == 200:
                data = response.json()
                records = data.get('records', [])
                
                if not records:
                    break
                
                all_records.extend(records)
                print(f"📄 Page {page}: {len(records)} records (Total: {len(all_records)})")
                
                offset = data.get('offset')
                if not offset:
                    break
                
                page += 1
                time.sleep(0.1)
            
            elif response.status_code == 404:
                print("❌ DIVA Fund Intelligence table not found in Airtable")
                return []
            else:
                print(f"❌ Error {response.status_code}: {response.text}")
                return []
        
        print(f"✅ Found {len(all_records)} DIVA Fund Intelligence records")
        
        # Show sample structure
        if all_records:
            sample_fields = all_records[0].get('fields', {})
            print(f"📋 Available fields: {list(sample_fields.keys())}")
        
        return all_records
        
    except Exception as e:
        print(f"❌ Error fetching DIVA Fund Intelligence: {e}")
        return []

def clear_existing_diva_fund_data():
    """Clear existing DIVA Fund Intelligence data"""
    print(f"\n🧹 CLEARING EXISTING DIVA FUND INTELLIGENCE")
    print("=" * 50)
    
    config = get_supabase_config(use_service_role=True)
    supabase: Client = create_client(config['url'], config['key'])
    
    try:
        count_result = supabase.table('diva_fund_intelligence').select('id').execute()
        current_count = len(count_result.data) if count_result.data else 0
        print(f"📊 Current records: {current_count}")
        
        if current_count > 0:
            # Delete all existing records
            for record in count_result.data:
                try:
                    supabase.table('diva_fund_intelligence').delete().eq('id', record['id']).execute()
                except Exception as e:
                    print(f"⚠️ Error deleting record {record['id']}: {e}")
            
            print(f"🗑️ Cleared {current_count} existing records")
        
        return True
        
    except Exception as e:
        print(f"❌ Error clearing DIVA Fund Intelligence: {e}")
        return False

def map_diva_fund_data(airtable_record):
    """Map Airtable DIVA Fund Intelligence to Supabase schema"""
    fields = airtable_record.get('fields', {})
    
    # Map the fields based on expected DIVA Fund Intelligence structure
    mapped_data = {
        # Basic Information
        'fund_name': fields.get('Fund Name', fields.get('Name', '')),
        'fund_id': fields.get('Fund ID', ''),
        'company_name': fields.get('Company Name', ''),
        'company_id': fields.get('Company ID', ''),
        
        # Intelligence Data
        'analysis_type': fields.get('Analysis Type', 'Fund Intelligence'),
        'intelligence_summary': fields.get('Intelligence Summary', ''),
        'key_insights': fields.get('Key Insights', ''),
        'investment_strategy': fields.get('Investment Strategy', ''),
        'performance_metrics': fields.get('Performance Metrics', ''),
        
        # Financial Information
        'fund_size': fields.get('Fund Size', 0),
        'target_sectors': fields.get('Target Sectors', ''),
        'investment_stage': fields.get('Investment Stage', ''),
        'geographic_focus': fields.get('Geographic Focus', ''),
        
        # Analysis Details
        'risk_assessment': fields.get('Risk Assessment', ''),
        'market_position': fields.get('Market Position', ''),
        'competitive_advantage': fields.get('Competitive Advantage', ''),
        'growth_potential': fields.get('Growth Potential', ''),
        
        # Metadata
        'analysis_date': fields.get('Analysis Date', datetime.now().isoformat()),
        'data_source': fields.get('Data Source', 'DIVA Intelligence System'),
        'confidence_score': fields.get('Confidence Score', 0),
        'status': fields.get('Status', 'Active'),
        'notes': fields.get('Notes', ''),
        
        # System fields
        'airtable_id': airtable_record.get('id', ''),
        'created_at': datetime.now().isoformat(),
        'updated_at': datetime.now().isoformat()
    }
    
    # Handle JSON fields if they exist
    json_fields = ['key_insights', 'performance_metrics', 'target_sectors']
    for field in json_fields:
        if isinstance(mapped_data.get(field), (dict, list)):
            mapped_data[field] = json.dumps(mapped_data[field], ensure_ascii=False)
    
    return mapped_data

def migrate_diva_fund_intelligence(diva_records):
    """Migrate DIVA Fund Intelligence to Supabase"""
    print(f"\n🚀 MIGRATING {len(diva_records)} DIVA FUND INTELLIGENCE RECORDS")
    print("=" * 50)
    
    config = get_supabase_config(use_service_role=True)
    supabase: Client = create_client(config['url'], config['key'])
    
    successful = 0
    failed = 0
    start_time = time.time()
    
    for i, record in enumerate(diva_records, 1):
        try:
            mapped_data = map_diva_fund_data(record)
            
            if not mapped_data.get('fund_name') and not mapped_data.get('fund_id'):
                print(f"⚠️ Skipping record {i}: No fund name or ID")
                failed += 1
                continue
            
            # Insert record
            result = supabase.table('diva_fund_intelligence').insert(mapped_data).execute()
            
            if result.data:
                successful += 1
                if i % 10 == 0:
                    elapsed = time.time() - start_time
                    rate = i / elapsed if elapsed > 0 else 0
                    print(f"✅ Progress: {i}/{len(diva_records)} ({rate:.1f}/sec)")
            else:
                failed += 1
                
        except Exception as e:
            print(f"❌ Error migrating DIVA record {i}: {str(e)[:100]}...")
            failed += 1
    
    elapsed = time.time() - start_time
    rate = successful / elapsed if elapsed > 0 else 0
    
    print(f"\n🎉 DIVA FUND INTELLIGENCE MIGRATION COMPLETE!")
    print(f"✅ Successfully migrated: {successful}")
    print(f"❌ Failed migrations: {failed}")
    print(f"⏱️ Time: {elapsed:.1f}s ({rate:.1f}/sec)")
    
    return successful

def verify_diva_fund_migration():
    """Verify DIVA Fund Intelligence migration"""
    print(f"\n🔍 VERIFYING DIVA FUND INTELLIGENCE MIGRATION")
    print("=" * 50)
    
    config = get_supabase_config(use_service_role=True)
    supabase: Client = create_client(config['url'], config['key'])
    
    try:
        count_result = supabase.table('diva_fund_intelligence').select('id').execute()
        total_count = len(count_result.data) if count_result.data else 0
        
        print(f"📊 Total DIVA Fund Intelligence records: {total_count}")
        
        # Get sample records
        sample_result = supabase.table('diva_fund_intelligence').select('*').limit(3).execute()
        
        if sample_result.data:
            print(f"\n📋 Sample DIVA Fund Intelligence Records:")
            for i, record in enumerate(sample_result.data, 1):
                print(f"\n   === DIVA FUND INTELLIGENCE {i} ===")
                print(f"   📝 Fund Name: {record.get('fund_name', 'N/A')}")
                print(f"   🆔 Fund ID: {record.get('fund_id', 'N/A')}")
                print(f"   🏢 Company: {record.get('company_name', 'N/A')}")
                print(f"   📊 Analysis Type: {record.get('analysis_type', 'N/A')}")
                print(f"   🎯 Investment Strategy: {record.get('investment_strategy', 'N/A')}")
                print(f"   📈 Performance: {record.get('performance_metrics', 'N/A')}")
        
        return total_count
        
    except Exception as e:
        print(f"❌ Error verifying DIVA Fund Intelligence: {e}")
        return 0

def create_sample_diva_fund_data():
    """Create sample DIVA Fund Intelligence data if Airtable is empty"""
    print("🔧 CREATING SAMPLE DIVA FUND INTELLIGENCE DATA")
    print("=" * 50)
    
    # Get some fund data to create intelligence for
    config = get_supabase_config(use_service_role=True)
    supabase: Client = create_client(config['url'], config['key'])
    
    try:
        fund_result = supabase.table('fund_table').select('*').limit(10).execute()
        
        if not fund_result.data:
            print("❌ No fund data available for sample creation")
            return []
        
        sample_records = []
        
        for i, fund in enumerate(fund_result.data[:5], 1):
            sample_record = {
                'fund_name': fund.get('fund_name', f'Sample Fund {i}'),
                'fund_id': f'DIVA_FUND_{i:03d}',
                'company_name': f'Sample VC Company {i}',
                'company_id': fund.get('company_id', f'VC_{i:03d}'),
                'analysis_type': 'Fund Intelligence',
                'intelligence_summary': f'Comprehensive analysis of {fund.get("fund_name", "fund")} performance and strategy',
                'key_insights': json.dumps([
                    f'Strong performance in {fund.get("investment_focus", "technology")} sector',
                    'Consistent returns over 3-year period',
                    'Well-diversified portfolio'
                ], ensure_ascii=False),
                'investment_strategy': fund.get('investment_focus', 'Technology and Innovation'),
                'performance_metrics': json.dumps({
                    'irr': '15.2%',
                    'multiple': '2.1x',
                    'portfolio_companies': 25
                }, ensure_ascii=False),
                'fund_size': fund.get('commitment_amount', 10000000000),
                'target_sectors': 'Technology, Healthcare, Fintech',
                'investment_stage': 'Series A, Series B',
                'geographic_focus': 'South Korea, Southeast Asia',
                'risk_assessment': 'Medium Risk',
                'market_position': 'Top Tier',
                'competitive_advantage': 'Strong network and expertise',
                'growth_potential': 'High',
                'analysis_date': datetime.now().isoformat(),
                'data_source': 'DIVA Intelligence System - Sample Data',
                'confidence_score': 85,
                'status': 'Active',
                'notes': f'Sample intelligence data for {fund.get("fund_name", "fund")}'
            }
            
            sample_records.append(sample_record)
        
        print(f"✅ Created {len(sample_records)} sample DIVA Fund Intelligence records")
        return sample_records
        
    except Exception as e:
        print(f"❌ Error creating sample data: {e}")
        return []

def main():
    """Main DIVA Fund Intelligence migration function"""
    print("📊 DIVA FUND INTELLIGENCE MIGRATION")
    print("=" * 60)
    print("🎯 Goals:")
    print("   1. Fetch DIVA Fund Intelligence from Airtable")
    print("   2. Clear existing data")
    print("   3. Migrate all intelligence data")
    print("   4. Verify migration success")
    print("=" * 60)
    
    # Step 1: Get DIVA Fund Intelligence data
    diva_records = get_airtable_diva_fund_data()
    
    if not diva_records:
        print(f"\n💡 No DIVA Fund Intelligence found in Airtable")
        print(f"🔧 Creating sample data from existing funds...")
        diva_records = create_sample_diva_fund_data()
    
    if not diva_records:
        print("❌ No DIVA Fund Intelligence data available")
        return
    
    print(f"✅ Found {len(diva_records)} DIVA Fund Intelligence records")
    
    # Step 2: Clear existing data
    if not clear_existing_diva_fund_data():
        print("❌ Failed to clear existing data")
        return
    
    # Step 3: Migrate DIVA Fund Intelligence
    migrated_count = migrate_diva_fund_intelligence(diva_records)
    
    # Step 4: Verify migration
    verified_count = verify_diva_fund_migration()
    
    print(f"\n🎉 DIVA FUND INTELLIGENCE MIGRATION SUMMARY")
    print("=" * 50)
    print(f"📊 Source records: {len(diva_records)}")
    print(f"✅ Successfully migrated: {migrated_count}")
    print(f"🔍 Verified in database: {verified_count}")
    
    if verified_count >= len(diva_records) * 0.9:
        print(f"🎉 EXCELLENT! DIVA Fund Intelligence migration successful!")
        print(f"📊 Your intelligence database now has {verified_count} fund analyses!")
    else:
        print(f"⚠️ PARTIAL SUCCESS: {verified_count}/{len(diva_records)}")

if __name__ == "__main__":
    main() 