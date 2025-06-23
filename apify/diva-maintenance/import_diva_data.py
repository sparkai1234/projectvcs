#!/usr/bin/env python3
"""
DIVA Data Import Script
Imports DIVA dataset from JSON into Supabase tables
"""

import json
import os
from supabase import create_client, Client
from datetime import datetime
import sys

class DIVADataImporter:
    def __init__(self):
        """Initialize the DIVA data importer"""
        self.supabase_url = os.getenv('SUPABASE_URL')
        self.supabase_key = os.getenv('SUPABASE_SERVICE_ROLE_KEY') or os.getenv('SUPABASE_KEY')
        
        if not self.supabase_url or not self.supabase_key:
            print("❌ Error: SUPABASE_URL and SUPABASE_SERVICE_ROLE_KEY environment variables required")
            sys.exit(1)
        
        self.supabase: Client = create_client(self.supabase_url, self.supabase_key)
        print(f"✅ Connected to Supabase: {self.supabase_url[:50]}...")
        
        # Define column mappings for each data type based on actual schema
        self.column_mappings = {
            'investment_performance': {
                'table': 'diva_investment_performance',
                'columns': {
                    'column_0': 'company_name',
                    'column_1': 'govt_finance_companies',
                    'column_2': 'govt_finance_amount', 
                    'column_3': 'fund_companies',
                    'column_4': 'fund_amount',
                    'column_5': 'total_companies',
                    'column_6': 'total_amount'
                }
            },
            'financial_statements_balance': {
                'table': 'diva_financial_statements',
                'type': 'balance',
                'columns': {
                    'column_0': 'company_name',
                    'column_1': 'financial_resources',
                    'column_2': 'settlement_month',
                    'column_3': 'accounting_standards',
                    'column_4': 'financial_classification',
                    'column_5': 'assets',
                    'column_6': 'liabilities',
                    'column_7': 'startup_investment_assets',
                    'column_8': 'paid_in_capital',
                    'column_9': 'capital'
                }
            },
            'financial_statements_income': {
                'table': 'diva_financial_statements', 
                'type': 'income',
                'columns': {
                    'column_0': 'company_name',
                    'column_1': 'financial_resources',
                    'column_2': 'settlement_month',
                    'column_3': 'accounting_standards',
                    'column_4': 'financial_classification',
                    'column_5': 'operating_revenue',
                    'column_6': 'operating_expenses',
                    'column_7': 'operating_profit',
                    'column_8': 'net_income_before_taxes',
                    'column_9': 'net_profit'
                }
            },
            'association_status': {
                'table': 'diva_association_status',
                'columns': {
                    'column_0': 'fund_number',
                    'column_1': 'company_name',
                    'column_2': 'fund_name',
                    'column_3': 'registration_date',
                    'column_4': 'total_amount_krw',
                    'column_5': 'expiry_date',
                    'column_6': 'investment_fields',
                    'column_7': 'purpose_classification',
                    'column_8': 'support_category'
                }
            },
            'personnel_status': {
                'table': 'diva_personnel_status',
                'columns': {
                    'column_0': 'company_name',
                    'column_1': 'total_employees',
                    'column_2': 'professionals',
                    'column_3': 'investment_officers',
                    'column_4': 'business_support'
                }
            },
            'professional_personnel': {
                'table': 'diva_professional_personnel',
                'columns': {
                    'column_1': 'company_name',
                    'column_2': 'person_name',
                    'column_3': 'work_experience',
                    'column_4': 'professional_experience',
                    'column_5': 'vc_work_experience'
                }
            },
            'violations': {
                'table': 'diva_violations',
                'columns': {
                    'column_0': 'violation_number',
                    'column_1': 'company_name',
                    'column_2': 'action_date',
                    'column_3': 'expected_action_date',
                    'column_5': 'inspection_category',
                    'column_6': 'violation_type',
                    'column_7': 'action_category'
                }
            },
            'vc_map': {
                'table': 'diva_vc_map',
                'columns': {
                    'column_0': 'ranking',
                    'column_1': 'company_name',
                    'column_2': 'total_employees',
                    'column_3': 'professional_employees'
                }
            }
        }
    
    def clean_numeric_value(self, value):
        """Clean numeric values (remove commas, convert to appropriate type)"""
        if not value or value == '':
            return None
        
        # Remove commas and convert to number
        try:
            cleaned = str(value).replace(',', '').replace(' ', '')
            if cleaned.isdigit():
                return int(cleaned)
            elif '.' in cleaned:
                return float(cleaned)
            else:
                return cleaned
        except:
            return value
    
    def clean_date_value(self, value):
        """Clean date values"""
        if not value or value == '':
            return None
        
        try:
            # Handle YYYY-MM-DD format
            if len(str(value)) == 10 and '-' in str(value):
                return str(value)
            else:
                return str(value)
        except:
            return value
    
    def process_record(self, record, data_type):
        """Process a single record for insertion"""
        if data_type not in self.column_mappings:
            print(f"⚠️ Unknown data type: {data_type}")
            return None
        
        mapping = self.column_mappings[data_type]
        processed_record = {
            'source_url': record.get('dataSource', 'diva-scraper'),
            'extracted_at': record.get('extractedAt'),
            'data_year': datetime.now().year  # Default year
        }
        
        # Map columns based on data type
        for col_key, db_column in mapping['columns'].items():
            if col_key in record:
                value = record[col_key]
                
                # Apply cleaning based on column type
                if db_column in ['total_amount_krw', 'assets', 'liabilities', 'capital', 'fund_amount', 'govt_finance_amount', 'total_amount', 'startup_investment_assets', 'paid_in_capital', 'operating_revenue', 'operating_expenses', 'operating_profit', 'net_income_before_taxes', 'net_profit']:
                    value = self.clean_numeric_value(value)
                elif db_column in ['registration_date', 'expiry_date', 'action_date', 'expected_action_date']:
                    value = self.clean_date_value(value)
                elif db_column in ['total_employees', 'professionals', 'investment_officers', 'business_support', 'ranking', 'fund_number', 'violation_number', 'govt_finance_companies', 'fund_companies', 'total_companies', 'professional_employees']:
                    value = self.clean_numeric_value(value)
                
                processed_record[db_column] = value
        
        # Handle special cases
        if data_type == 'financial_statements_balance':
            processed_record['tab_type'] = 'balance_sheet'
        elif data_type == 'financial_statements_income':
            processed_record['tab_type'] = 'income_statement'
        
        return processed_record
    
    def import_data_type(self, data_type, records):
        """Import records for a specific data type"""
        if data_type not in self.column_mappings:
            print(f"⚠️ Skipping unknown data type: {data_type}")
            return False
        
        table_name = self.column_mappings[data_type]['table']
        print(f"\n📊 Importing {len(records)} records to {table_name}...")
        
        processed_records = []
        for record in records:
            processed = self.process_record(record, data_type)
            if processed:
                processed_records.append(processed)
        
        if not processed_records:
            print(f"⚠️ No valid records to import for {data_type}")
            return False
        
        try:
            # Insert in batches of 100
            batch_size = 100
            total_inserted = 0
            
            for i in range(0, len(processed_records), batch_size):
                batch = processed_records[i:i + batch_size]
                
                response = self.supabase.table(table_name).insert(batch).execute()
                
                if response.data:
                    total_inserted += len(response.data)
                    print(f"  ✅ Inserted batch {i//batch_size + 1}: {len(response.data)} records")
                else:
                    print(f"  ⚠️ Batch {i//batch_size + 1} failed")
            
            print(f"✅ Successfully imported {total_inserted}/{len(processed_records)} records to {table_name}")
            return True
            
        except Exception as e:
            print(f"❌ Error importing to {table_name}: {str(e)}")
            return False
    
    def import_dataset(self, dataset_path):
        """Import the complete DIVA dataset"""
        print(f"🚀 === DIVA Data Import Started ===")
        print(f"📋 Dataset: {dataset_path}")
        
        # Load dataset
        try:
            with open(dataset_path, 'r', encoding='utf-8') as f:
                data = json.load(f)
            print(f"✅ Loaded {len(data):,} records from dataset")
        except Exception as e:
            print(f"❌ Error loading dataset: {e}")
            return False
        
        # Group records by data type
        data_by_type = {}
        for record in data:
            data_type = record.get('dataType', 'unknown')
            if data_type not in data_by_type:
                data_by_type[data_type] = []
            data_by_type[data_type].append(record)
        
        print(f"\n📊 Data types found:")
        for data_type, records in data_by_type.items():
            print(f"  - {data_type}: {len(records):,} records")
        
        # Import each data type
        success_count = 0
        total_types = len(data_by_type)
        
        for data_type, records in data_by_type.items():
            success = self.import_data_type(data_type, records)
            if success:
                success_count += 1
        
        print(f"\n🎉 === Import Complete ===")
        print(f"✅ Successfully imported {success_count}/{total_types} data types")
        print(f"📊 Total records processed: {len(data):,}")
        
        return success_count == total_types

def main():
    """Main import function"""
    dataset_path = "../diva-scraper-standalone/dataset_final-diva-scraper_2025-06-10_00-27-35-666.json"
    
    if not os.path.exists(dataset_path):
        print(f"❌ Dataset file not found: {dataset_path}")
        sys.exit(1)
    
    # Create importer and run import
    importer = DIVADataImporter()
    success = importer.import_dataset(dataset_path)
    
    if success:
        print(f"\n🎉 DIVA data import completed successfully!")
        print(f"🔧 Run the DIVA maintenance system to clean up any duplicates")
    else:
        print(f"\n❌ Import completed with errors")
        sys.exit(1)

if __name__ == "__main__":
    main() 