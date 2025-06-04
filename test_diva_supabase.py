#!/usr/bin/env python3
"""
Test DIVA to Supabase Integration using existing test data
"""

import json
import os
from diva_to_supabase import DIVASupabaseIntegrator

def main():
    print("🧪 Testing DIVA to Supabase Integration")
    print("=======================================")
    
    # Set environment variables directly with FRESH WORKING KEYS
    os.environ['SUPABASE_URL'] = 'https://udfgtccxbqmalgpqyxzz.supabase.co'
    os.environ['SUPABASE_KEY'] = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InVkZmd0Y2N4YnFtYWxncHF5eHp6Iiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc0ODk0NjY5NiwiZXhwIjoyMDY0NTIyNjk2fQ.JgyEKjOhuZpNCCOadsaK90Q8CcoPf_rgdtSXh-1BU18'
    
    # Get environment variables
    supabase_url = os.getenv('SUPABASE_URL')
    supabase_key = os.getenv('SUPABASE_KEY')
    
    if not supabase_url or not supabase_key:
        print("❌ Missing Supabase credentials!")
        print("Please set SUPABASE_URL and SUPABASE_KEY environment variables")
        return
    
    # Load test data
    try:
        with open('test_diva_data.json', 'r', encoding='utf-8') as f:
            test_data = json.load(f)
        print(f"✅ Loaded {len(test_data)} test records")
    except FileNotFoundError:
        print("❌ test_diva_data.json not found. Run python run_diva_scraper.py first")
        return
    
    try:
        # Initialize Supabase integrator
        print("🗄️ Initializing Supabase integration...")
        integrator = DIVASupabaseIntegrator(supabase_url, supabase_key)
        
        # Test uploading to diva_intelligence table
        print("📤 Testing upload to diva_intelligence table...")
        intelligence_result = integrator.upload_diva_intelligence(test_data)
        
        # Test uploading to diva_professional_network table
        print("👥 Testing upload to diva_professional_network table...")
        network_result = integrator.upload_professional_network_data(test_data)
        
        # Test linking with existing VC data
        print("🔗 Testing link with existing VC company data...")
        linked_count = integrator.link_with_existing_vc_data()
        
        # Generate summary report
        print("📊 Generating test summary report...")
        report = integrator.generate_summary_report()
        
        print(f"""
✅ DIVA TO SUPABASE TEST COMPLETED!
===================================
📊 Intelligence Records: {len(intelligence_result)}
👥 Professional Network Records: {len(network_result)}  
🔗 Linked with VC Companies: {linked_count}
📋 Summary Report: Generated
🎯 Test successful!
        """)
        
    except Exception as e:
        print(f"❌ Test failed: {e}")
        import traceback
        traceback.print_exc()

if __name__ == "__main__":
    main() 