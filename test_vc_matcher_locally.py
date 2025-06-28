#!/usr/bin/env python3
"""
🧪 Local Test for VC Company Matcher
=====================================

Test the VC company matching logic locally before deploying to Apify.
This simulates the process with a small set of companies.

Usage:
    python test_vc_matcher_locally.py
"""

import json
import subprocess
import sys
from pathlib import Path

def test_csv_conversion():
    """Test the CSV to JSON conversion"""
    print("🧪 Testing CSV to JSON conversion...")
    
    try:
        # Test with a limit of 5 companies
        result = subprocess.run([
            sys.executable, 
            "prepare_vc_companies_for_apify.py",
            "c:/Users/k/Downloads/VC LIst  - Sheet1.csv",
            "--limit", "5",
            "--output", "test_vc_input.json"
        ], capture_output=True, text=True, timeout=30)
        
        if result.returncode == 0:
            print("✅ CSV conversion successful")
            
            # Load and display the result
            with open("test_vc_input.json", "r", encoding="utf-8") as f:
                data = json.load(f)
            
            print(f"📊 Test data contains {len(data['vcCompanies'])} companies:")
            for i, company in enumerate(data['vcCompanies'], 1):
                print(f"   {i}. {company}")
            
            return data
        else:
            print(f"❌ CSV conversion failed: {result.stderr}")
            return None
            
    except Exception as e:
        print(f"❌ Error testing CSV conversion: {e}")
        return None

def validate_apify_structure():
    """Validate the Apify actor structure"""
    print("\n🧪 Validating Apify actor structure...")
    
    required_files = [
        "apify/vc-company-matcher/main.js",
        "apify/vc-company-matcher/package.json",
        "apify/vc-company-matcher/README.md"
    ]
    
    missing_files = []
    for file_path in required_files:
        if not Path(file_path).exists():
            missing_files.append(file_path)
    
    if missing_files:
        print(f"❌ Missing files: {missing_files}")
        return False
    else:
        print("✅ All required Apify files present")
        return True

def check_package_json():
    """Check package.json for required dependencies"""
    print("\n🧪 Checking package.json dependencies...")
    
    try:
        with open("apify/vc-company-matcher/package.json", "r") as f:
            package_data = json.load(f)
        
        required_deps = ["apify", "@supabase/supabase-js", "crawlee", "puppeteer"]
        missing_deps = []
        
        dependencies = package_data.get("dependencies", {})
        for dep in required_deps:
            if dep not in dependencies:
                missing_deps.append(dep)
        
        if missing_deps:
            print(f"❌ Missing dependencies: {missing_deps}")
            return False
        else:
            print("✅ All required dependencies present")
            print(f"📦 Dependencies: {list(dependencies.keys())}")
            return True
            
    except Exception as e:
        print(f"❌ Error checking package.json: {e}")
        return False

def simulate_processing_flow(test_companies):
    """Simulate the three-fold processing flow"""
    print("\n🧪 Simulating three-fold processing flow...")
    
    print("📋 Processing Order:")
    print("1. 🌲 InnoForest (innoforest.co.kr) - Basic info + URL")
    print("2. 📰 News Search (최우선) - Current 대표이사")
    print("3. 🌐 Company Website - Verification")
    
    if not test_companies:
        print("❌ No test companies available")
        return False
    
    print(f"\n🎯 Would process {len(test_companies)} companies:")
    
    for i, company in enumerate(test_companies[:3], 1):  # Show first 3
        print(f"\n   📋 Company {i}: {company}")
        print(f"   🌲 Step 1: Search InnoForest for {company}")
        print(f"   📰 Step 2: Search News (우선) for 대표이사")
        print(f"   🌐 Step 3: Check company website if URL found")
        print(f"   💾 Step 4: Update Supabase with results")
    
    if len(test_companies) > 3:
        print(f"   ... and {len(test_companies) - 3} more companies")
    
    print("\n✅ Processing flow simulation complete")
    return True

def check_supabase_schema():
    """Check if Supabase schema files exist"""
    print("\n🧪 Checking Supabase schema compatibility...")
    
    schema_files = [
        "archive/database-utilities/create_supabase_schema.sql"
    ]
    
    for schema_file in schema_files:
        if Path(schema_file).exists():
            print(f"✅ Found schema file: {schema_file}")
            
            # Check for vc_table with representative and website_url fields
            try:
                with open(schema_file, "r", encoding="utf-8") as f:
                    content = f.read()
                
                if "vc_table" in content and "representative" in content and "website_url" in content:
                    print("✅ vc_table with required fields found in schema")
                    return True
                else:
                    print("⚠️ vc_table or required fields not found in schema")
                    return False
                    
            except Exception as e:
                print(f"❌ Error reading schema: {e}")
                return False
        else:
            print(f"⚠️ Schema file not found: {schema_file}")
    
    return False

def generate_deployment_checklist():
    """Generate deployment checklist"""
    print("\n📋 Apify Deployment Checklist")
    print("=" * 40)
    print("□ 1. Create new actor in Apify Console")
    print("□ 2. Upload main.js and package.json files")
    print("□ 3. Set environment variables:")
    print("     - SUPABASE_URL")
    print("     - SUPABASE_KEY")
    print("□ 4. Configure actor input with test companies")
    print("□ 5. Set maxCompanies: 5 for initial testing")
    print("□ 6. Run test with small batch first")
    print("□ 7. Verify Supabase updates")
    print("□ 8. Scale up to full company list")
    print("\n🚀 Ready for deployment!")

def main():
    print("🧪 VC Company Matcher - Local Testing")
    print("=" * 50)
    
    # Test 1: CSV Conversion
    test_data = test_csv_conversion()
    
    # Test 2: Apify Structure
    structure_valid = validate_apify_structure()
    
    # Test 3: Package Dependencies
    deps_valid = check_package_json()
    
    # Test 4: Processing Flow Simulation
    test_companies = test_data.get("vcCompanies", []) if test_data else []
    flow_valid = simulate_processing_flow(test_companies)
    
    # Test 5: Supabase Schema
    schema_valid = check_supabase_schema()
    
    # Summary
    print("\n🎯 Test Summary")
    print("=" * 20)
    tests = [
        ("CSV Conversion", test_data is not None),
        ("Apify Structure", structure_valid),
        ("Dependencies", deps_valid),
        ("Processing Flow", flow_valid),
        ("Supabase Schema", schema_valid)
    ]
    
    passed = 0
    for test_name, result in tests:
        status = "✅ PASS" if result else "❌ FAIL"
        print(f"{status} {test_name}")
        if result:
            passed += 1
    
    print(f"\n📊 Results: {passed}/{len(tests)} tests passed")
    
    if passed == len(tests):
        print("🎉 All tests passed! Ready for Apify deployment.")
        generate_deployment_checklist()
    else:
        print("⚠️ Some tests failed. Please fix issues before deployment.")
    
    # Cleanup
    test_files = ["test_vc_input.json"]
    for file in test_files:
        if Path(file).exists():
            Path(file).unlink()
            print(f"🧹 Cleaned up: {file}")

if __name__ == "__main__":
    main() 