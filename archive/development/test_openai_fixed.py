#!/usr/bin/env python3
"""
Test OpenAI Interface with Fixed Search Logic
"""

from comprehensive_vc_openai_interface import ComprehensiveVCAnalyzer

def test_openai_interface():
    """Test the OpenAI interface with fixed search logic"""
    print("Testing OpenAI Interface with Fixed Search Logic")
    print("=" * 60)
    
    analyzer = ComprehensiveVCAnalyzer()
    
    # Test "not found" case
    print("1. Testing 'not found' case: 유엔벤처스")
    try:
        result = analyzer.ask_comprehensive_question("유엔벤처스에 대해 알려주세요")
        print("OpenAI Response:")
        print("-" * 40)
        print(result)
        print("-" * 40)
    except Exception as e:
        print(f"Error: {e}")
    
    print("\n" + "=" * 60)
    
    # Test successful case
    print("2. Testing successful case: 스톤브릿지벤처스")
    try:
        result = analyzer.ask_comprehensive_question("스톤브릿지벤처스에 대해 알려주세요")
        print("OpenAI Response:")
        print("-" * 40)
        print(result[:500] + "..." if len(result) > 500 else result)
        print("-" * 40)
    except Exception as e:
        print(f"Error: {e}")


if __name__ == "__main__":
    test_openai_interface() 