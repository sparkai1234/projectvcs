#!/usr/bin/env python3
"""
Fix Professional Personnel Table
Re-imports professional personnel data with correct column mappings
"""

import json
import os
from supabase import create_client, Client
from datetime import datetime
import sys

def fix_professional_personnel():
    """Fix the professional personnel table with correct column mappings"""
    print("🔧 === FIXING PROFESSIONAL PERSONNEL TABLE ===")
    
    # Initialize Supabase client
    supabase_url = os.getenv('SUPABASE_URL')
    supabase_key = os.getenv('SUPABASE_SERVICE_ROLE_KEY') or os.getenv('SUPABASE_KEY')
    
    if not supabase_url or not supabase_key:
        print("❌ Error: SUPABASE_URL and SUPABASE_SERVICE_ROLE_KEY environment variables required")
        sys.exit(1)
    
    supabase: Client = create_client(supabase_url, supabase_key)
    print(f"✅ Connected to Supabase")
    
    # Load dataset
    dataset_path = "../diva-scraper-standalone/dataset_final-diva-scraper_2025-06-10_00-27-35-666.json"
    
    try:
        with open(dataset_path, 'r', encoding='utf-8') as f:
            data = json.load(f)
        print(f"✅ Loaded {len(data):,} records from dataset")
    except Exception as e:
        print(f"❌ Error loading dataset: {e}")
        return False
    
    # First, clear existing professional personnel data
    print("🗑️ Clearing existing professional personnel data...")
    try:
        response = supabase.table('diva_professional_personnel').delete().neq('id', 0).execute()
        print(f"✅ Cleared existing professional personnel data")
    except Exception as e:
        print(f"❌ Error clearing table: {e}")
        return False
    
    # Filter for professional personnel records
    professional_records = [record for record in data if record.get('dataType') == 'professional_personnel']
    print(f"📊 Found {len(professional_records)} professional personnel records")
    
    # Process with CORRECT column mappings
    processed_records = []
    
    for record in professional_records:
        processed_record = {
            'company_name': record.get('column_0'),  # Company name
            'person_name': record.get('column_1'),   # Person name  
            'work_experience': clean_numeric_value(record.get('column_2')),  # Work experience
            'professional_experience': clean_numeric_value(record.get('column_3')),  # Professional experience
            'vc_work_experience': clean_numeric_value(record.get('column_4')),  # VC work experience
            'vc_professional_experience': clean_numeric_value(record.get('column_5')),  # VC professional experience
            'data_year': datetime.now().year,
            'source_url': record.get('dataSource', 'professional_personnel'),
            'extracted_at': record.get('extractedAt')
        }
        
        # Only add if both company name and person name exist
        if processed_record['company_name'] and processed_record['person_name']:
            processed_records.append(processed_record)
    
    print(f"📋 Processed {len(processed_records)} professional personnel records")
    
    if not processed_records:
        print("❌ No valid professional personnel records to import")
        return False
    
    try:
        # Import in batches
        batch_size = 100
        total_inserted = 0
        
        for i in range(0, len(processed_records), batch_size):
            batch = processed_records[i:i + batch_size]
            
            response = supabase.table('diva_professional_personnel').insert(batch).execute()
            
            if response.data:
                total_inserted += len(response.data)
                print(f"  ✅ Inserted batch {i//batch_size + 1}: {len(response.data)} records")
            else:
                print(f"  ⚠️ Batch {i//batch_size + 1} failed")
        
        print(f"✅ Successfully imported {total_inserted}/{len(processed_records)} professional personnel records")
        
        # Verify the import with sample data
        response = supabase.table('diva_professional_personnel').select('*').limit(3).execute()
        
        if response.data:
            print(f"\n📋 SAMPLE FIXED RECORDS:")
            for i, record in enumerate(response.data[:3]):
                print(f"   Record {i+1}:")
                print(f"   - Company: {record.get('company_name')}")
                print(f"   - Person: {record.get('person_name')}")
                print(f"   - Work Experience: {record.get('work_experience')}")
                print(f"   - Professional Experience: {record.get('professional_experience')}")
                print(f"   - VC Work Experience: {record.get('vc_work_experience')}")
                print(f"   - VC Professional Experience: {record.get('vc_professional_experience')}")
        
        # Final count verification
        response = supabase.table('diva_professional_personnel').select('*', count='exact').execute()
        final_count = response.count
        
        print(f"\n📊 FINAL COUNT: {final_count} professional personnel records")
        
        if final_count == len(professional_records):
            print(f"🎉 SUCCESS: All professional personnel records imported correctly!")
        else:
            print(f"⚠️ Expected {len(professional_records)}, got {final_count}")
        
        return True
        
    except Exception as e:
        print(f"❌ Error importing professional personnel: {str(e)}")
        return False

def clean_numeric_value(value):
    """Clean numeric values (remove commas, convert to appropriate type)"""
    if not value or value == '':
        return None
    
    try:
        cleaned = str(value).replace(',', '').replace(' ', '')
        if '.' in cleaned:
            return float(cleaned)
        elif cleaned.isdigit():
            return int(cleaned)
        else:
            return None
    except:
        return None

if __name__ == "__main__":
    success = fix_professional_personnel()
    if success:
        print(f"\n🎉 Professional personnel table fix completed successfully!")
    else:
        print(f"\n❌ Professional personnel table fix failed")
        sys.exit(1) 