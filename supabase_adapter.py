#!/usr/bin/env python3
"""
🔄 Supabase Adapter for DIVA Intelligence System

This adapter provides an Airtable-compatible interface for Supabase,
allowing your existing Apify scrapers to work without modification.

✅ Same API as Airtable
✅ No scraper changes needed
✅ Korean text support
✅ Automatic table routing
"""

import json
from typing import Dict, List, Any, Optional
from datetime import datetime
from supabase import create_client, Client
from api_config import get_supabase_config

class SupabaseAdapter:
    """
    Adapter that provides Airtable-like interface for Supabase
    Allows existing scrapers to work without modification
    """
    
    def __init__(self):
        """Initialize the Supabase adapter"""
        config = get_supabase_config()
        self.supabase: Client = create_client(config['url'], config['key'])
        
        # Table mapping: Airtable table names → Supabase table names
        self.table_mapping = {
            'VC Table': 'vc_table',
            'Fund Table': 'fund_table',
            'DIVA Intelligence': 'diva_intelligence',
            'DIVA Professional Network': 'diva_professional_network',
            'DIVA Fund Intelligence': 'diva_fund_intelligence',
            'Contacts Full': 'contacts_full',
            'Contacts Matched': 'contacts_matched'
        }
        
        # Field mapping for each table
        self.field_mappings = {
            'vc_table': {
                'Company ID': 'company_id',
                'Company Name': 'company_name',
                'Company Name (EN)': 'company_name_en',
                'Location': 'location',
                'Representative': 'representative',
                'Established Date': 'established_date',
                'Company Type': 'company_type',
                'Website': 'website_url',
                'Phone': ('contact_info', 'phone'),
                'Email': ('contact_info', 'email'),
                'Address': ('contact_info', 'address')
            },
            'fund_table': {
                'Company ID': 'company_id',
                'Fund Name': 'fund_name',
                'Fund Name (EN)': 'fund_name_en',
                'Fund Type': 'fund_type',
                'Commitment Amount': 'commitment_amount',
                'Fund Size': 'fund_size',
                'Establishment Date': 'establishment_date',
                'Fund Status': 'fund_status',
                'Representative': 'representative',
                'Investment Focus': 'investment_focus'
            }
        }

    def create_record(self, table_name: str, fields: Dict[str, Any]) -> Dict[str, Any]:
        """
        Create a record in Supabase (Airtable-compatible interface)
        
        Args:
            table_name: Airtable table name (e.g., 'VC Table')
            fields: Dictionary of field values
            
        Returns:
            Created record with id and fields
        """
        try:
            # Map table name
            supabase_table = self.table_mapping.get(table_name)
            if not supabase_table:
                raise ValueError(f"Unknown table: {table_name}")
            
            # Convert fields to Supabase format
            supabase_record = self._convert_fields_to_supabase(supabase_table, fields)
            
            # Add metadata
            supabase_record['created_at'] = datetime.now().isoformat()
            supabase_record['updated_at'] = datetime.now().isoformat()
            
            # Insert record
            result = self.supabase.table(supabase_table).insert(supabase_record).execute()
            
            if result.data:
                # Convert back to Airtable format for compatibility
                return {
                    'id': result.data[0]['id'],
                    'fields': self._convert_fields_to_airtable(supabase_table, result.data[0])
                }
            else:
                raise Exception("Failed to create record")
                
        except Exception as e:
            print(f"Error creating record in {table_name}: {e}")
            raise

    def create_records(self, table_name: str, records: List[Dict[str, Any]]) -> List[Dict[str, Any]]:
        """
        Create multiple records in Supabase (batch insert)
        
        Args:
            table_name: Airtable table name
            records: List of records with 'fields' key
            
        Returns:
            List of created records
        """
        try:
            # Map table name
            supabase_table = self.table_mapping.get(table_name)
            if not supabase_table:
                raise ValueError(f"Unknown table: {table_name}")
            
            # Convert all records
            supabase_records = []
            for record in records:
                fields = record.get('fields', {})
                supabase_record = self._convert_fields_to_supabase(supabase_table, fields)
                supabase_record['created_at'] = datetime.now().isoformat()
                supabase_record['updated_at'] = datetime.now().isoformat()
                supabase_records.append(supabase_record)
            
            # Batch insert
            result = self.supabase.table(supabase_table).insert(supabase_records).execute()
            
            if result.data:
                # Convert back to Airtable format
                return [
                    {
                        'id': record['id'],
                        'fields': self._convert_fields_to_airtable(supabase_table, record)
                    }
                    for record in result.data
                ]
            else:
                raise Exception("Failed to create records")
                
        except Exception as e:
            print(f"Error creating records in {table_name}: {e}")
            raise

    def update_record(self, table_name: str, record_id: str, fields: Dict[str, Any]) -> Dict[str, Any]:
        """
        Update a record in Supabase
        
        Args:
            table_name: Airtable table name
            record_id: Record ID to update
            fields: Fields to update
            
        Returns:
            Updated record
        """
        try:
            # Map table name
            supabase_table = self.table_mapping.get(table_name)
            if not supabase_table:
                raise ValueError(f"Unknown table: {table_name}")
            
            # Convert fields
            supabase_record = self._convert_fields_to_supabase(supabase_table, fields)
            supabase_record['updated_at'] = datetime.now().isoformat()
            
            # Update record
            result = self.supabase.table(supabase_table).update(supabase_record).eq('id', record_id).execute()
            
            if result.data:
                return {
                    'id': result.data[0]['id'],
                    'fields': self._convert_fields_to_airtable(supabase_table, result.data[0])
                }
            else:
                raise Exception("Failed to update record")
                
        except Exception as e:
            print(f"Error updating record in {table_name}: {e}")
            raise

    def get_records(self, table_name: str, max_records: int = 100, offset: str = None) -> Dict[str, Any]:
        """
        Get records from Supabase (with pagination)
        
        Args:
            table_name: Airtable table name
            max_records: Maximum number of records to return
            offset: Pagination offset
            
        Returns:
            Dictionary with 'records' and optional 'offset'
        """
        try:
            # Map table name
            supabase_table = self.table_mapping.get(table_name)
            if not supabase_table:
                raise ValueError(f"Unknown table: {table_name}")
            
            # Build query
            query = self.supabase.table(supabase_table).select('*')
            
            # Handle pagination
            start = int(offset) if offset else 0
            query = query.range(start, start + max_records - 1)
            
            result = query.execute()
            
            if result.data:
                # Convert to Airtable format
                records = [
                    {
                        'id': record['id'],
                        'fields': self._convert_fields_to_airtable(supabase_table, record)
                    }
                    for record in result.data
                ]
                
                response = {'records': records}
                
                # Add pagination offset if there might be more records
                if len(records) == max_records:
                    response['offset'] = str(start + max_records)
                
                return response
            else:
                return {'records': []}
                
        except Exception as e:
            print(f"Error getting records from {table_name}: {e}")
            raise

    def find_record_by_company_id(self, table_name: str, company_id: str) -> Optional[Dict[str, Any]]:
        """
        Find a record by company ID (useful for updates)
        
        Args:
            table_name: Airtable table name
            company_id: Company ID to search for
            
        Returns:
            Record if found, None otherwise
        """
        try:
            # Map table name
            supabase_table = self.table_mapping.get(table_name)
            if not supabase_table:
                raise ValueError(f"Unknown table: {table_name}")
            
            # Search by company_id
            result = self.supabase.table(supabase_table).select('*').eq('company_id', company_id).execute()
            
            if result.data and len(result.data) > 0:
                record = result.data[0]
                return {
                    'id': record['id'],
                    'fields': self._convert_fields_to_airtable(supabase_table, record)
                }
            else:
                return None
                
        except Exception as e:
            print(f"Error finding record by company ID in {table_name}: {e}")
            return None

    def upsert_record(self, table_name: str, fields: Dict[str, Any]) -> Dict[str, Any]:
        """
        Insert or update a record based on company_id
        
        Args:
            table_name: Airtable table name
            fields: Record fields
            
        Returns:
            Created or updated record
        """
        company_id = fields.get('Company ID')
        if not company_id:
            # No company ID, just create
            return self.create_record(table_name, fields)
        
        # Check if record exists
        existing_record = self.find_record_by_company_id(table_name, company_id)
        
        if existing_record:
            # Update existing record
            return self.update_record(table_name, existing_record['id'], fields)
        else:
            # Create new record
            return self.create_record(table_name, fields)

    def _convert_fields_to_supabase(self, table_name: str, fields: Dict[str, Any]) -> Dict[str, Any]:
        """Convert Airtable fields to Supabase format"""
        if table_name not in self.field_mappings:
            # For tables without specific mapping, store as JSONB
            return {'data': fields}
        
        mapping = self.field_mappings[table_name]
        result = {}
        
        for airtable_field, value in fields.items():
            if airtable_field in mapping:
                supabase_field = mapping[airtable_field]
                
                if isinstance(supabase_field, tuple):
                    # Nested field (e.g., contact_info.phone)
                    parent_field, child_field = supabase_field
                    if parent_field not in result:
                        result[parent_field] = {}
                    result[parent_field][child_field] = value
                else:
                    # Direct field mapping
                    result[supabase_field] = value
            else:
                # Store unmapped fields in a JSON column
                if 'additional_data' not in result:
                    result['additional_data'] = {}
                result['additional_data'][airtable_field] = value
        
        return result

    def _convert_fields_to_airtable(self, table_name: str, record: Dict[str, Any]) -> Dict[str, Any]:
        """Convert Supabase record to Airtable fields format"""
        if table_name not in self.field_mappings:
            # Return raw data for unmapped tables
            return record.get('data', {})
        
        mapping = self.field_mappings[table_name]
        result = {}
        
        # Reverse mapping
        for airtable_field, supabase_field in mapping.items():
            if isinstance(supabase_field, tuple):
                # Nested field
                parent_field, child_field = supabase_field
                if parent_field in record and isinstance(record[parent_field], dict):
                    value = record[parent_field].get(child_field)
                    if value is not None:
                        result[airtable_field] = value
            else:
                # Direct field
                if supabase_field in record:
                    result[airtable_field] = record[supabase_field]
        
        # Add additional data
        if 'additional_data' in record and isinstance(record['additional_data'], dict):
            result.update(record['additional_data'])
        
        return result


# Global adapter instance
_adapter = None

def get_supabase_adapter() -> SupabaseAdapter:
    """Get the global Supabase adapter instance"""
    global _adapter
    if _adapter is None:
        _adapter = SupabaseAdapter()
    return _adapter


# Airtable-compatible functions for existing scrapers
def create_record(table_name: str, fields: Dict[str, Any]) -> Dict[str, Any]:
    """Create a record using Supabase (Airtable-compatible)"""
    return get_supabase_adapter().create_record(table_name, fields)

def create_records(table_name: str, records: List[Dict[str, Any]]) -> List[Dict[str, Any]]:
    """Create multiple records using Supabase (Airtable-compatible)"""
    return get_supabase_adapter().create_records(table_name, records)

def update_record(table_name: str, record_id: str, fields: Dict[str, Any]) -> Dict[str, Any]:
    """Update a record using Supabase (Airtable-compatible)"""
    return get_supabase_adapter().update_record(table_name, record_id, fields)

def upsert_record(table_name: str, fields: Dict[str, Any]) -> Dict[str, Any]:
    """Upsert a record using Supabase (Airtable-compatible)"""
    return get_supabase_adapter().upsert_record(table_name, fields)

def get_records(table_name: str, max_records: int = 100, offset: str = None) -> Dict[str, Any]:
    """Get records using Supabase (Airtable-compatible)"""
    return get_supabase_adapter().get_records(table_name, max_records, offset)


# Example usage for your scrapers:
if __name__ == "__main__":
    # Test the adapter
    adapter = get_supabase_adapter()
    
    # Example: Create a VC company record (same as Airtable API)
    vc_record = {
        'Company ID': 'TEST001',
        'Company Name': '테스트 벤처캐피털',
        'Location': '서울특별시',
        'Representative': '김테스트',
        'Company Type': 'VC'
    }
    
    try:
        result = create_record('VC Table', vc_record)
        print(f"✅ Created VC record: {result}")
        
        # Example: Create a fund record
        fund_record = {
            'Company ID': 'TEST001',
            'Fund Name': '테스트펀드 1호',
            'Fund Type': 'VC Fund',
            'Fund Status': 'Active'
        }
        
        result = create_record('Fund Table', fund_record)
        print(f"✅ Created Fund record: {result}")
        
    except Exception as e:
        print(f"❌ Test failed: {e}") 