#!/usr/bin/env python3
"""
Test Fixed Search Logic
Verify that search improvements prevent false matches
"""

from comprehensive_vc_openai_interface import ComprehensiveVCAnalyzer

def test_search_logic():
    """Test the fixed search logic with problematic queries"""
    print("Testing Fixed Search Logic")
    print("=" * 50)
    
    analyzer = ComprehensiveVCAnalyzer()
    
    # Test cases that should fail properly
    test_cases = [
        "유엔벤처스",      # Should not match anything 
        "UN벤처스",        # Should not match anything
        "존재하지않는회사",   # Should not match anything
        "스톤브릿지벤처스",   # Should match correctly
        "카카오벤처스",      # Should match correctly
    ]
    
    print("🔍 Testing search logic with various queries...")
    print()
    
    for i, query in enumerate(test_cases, 1):
        print(f"Test {i}: Searching for '{query}'")
        
        try:
            # Test the search logic directly
            data = analyzer.get_comprehensive_company_data(query)
            
            if data.get("company_profile"):
                company = data["company_profile"]
                print(f"   ✅ Found: {company.get('company_name', 'Unknown')}")
                print(f"   📍 Representative: {company.get('representative', 'N/A')}")
                print(f"   🌐 Website: {company.get('website_url', 'N/A')}")
            else:
                search_result = data.get("query_info", {}).get("search_result", "No search result info")
                print(f"   ❌ Not found: {search_result}")
                
        except Exception as e:
            print(f"   ❌ Error: {e}")
        
        print()
    
    print("🧪 Testing OpenAI interface with 'not found' case...")
    
    # Test the full OpenAI interface
    try:
        result = analyzer.ask_comprehensive_question("유엔벤처스에 대해 알려주세요")
        print("OpenAI Response:")
        print(result)
    except Exception as e:
        print(f"❌ OpenAI interface error: {e}")


if __name__ == "__main__":
    test_search_logic() 