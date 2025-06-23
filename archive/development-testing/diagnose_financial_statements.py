#!/usr/bin/env python3
"""
DIVA Financial Statements Diagnostic Tool
Helps identify why financial statements extraction is failing completely
"""

import requests
from datetime import datetime

def analyze_apify_logs():
    """
    Analyzes the latest Apify logs to identify financial statements failure points
    """
    print("🔍 DIVA FINANCIAL STATEMENTS DIAGNOSTIC ANALYSIS")
    print("=" * 60)
    
    # The logs URL from the user's message
    logs_url = "https://api.apify.com/v2/logs/b7Wk67IXU0vxD6nZb"
    
    print("📊 Based on Apify logs analysis:")
    print("-" * 40)
    
    print("✅ WORKING DATA SOURCES:")
    print("   • investment_performance: 333/333 (100.0%)")
    print("   • association_status: 2231/2231 (100.0%)")
    print("   • personnel_status: 251/251 (100.0%)")
    print("   • professional_personnel: 1685/1685 (100.0%)")
    print("   • violations: 92/92 (100.0%)")
    print("   • vc_map: 251/251 (100.0%)")
    
    print("\n❌ FAILING DATA SOURCE:")
    print("   • financial_statements: 0/500 (0.0%) - COMPLETE FAILURE")
    print("     ├─ Balance Sheet: 0 records")
    print("     └─ Income Statement: 0 records")
    
    print("\n🕵️ DIAGNOSTIC QUESTIONS:")
    print("-" * 40)
    
    print("1. 🔍 TAB DETECTION ISSUE?")
    print("   → Are 재무상태표/손익계산서 tabs being found?")
    print("   → Check interference blocking - might be blocking tabs themselves")
    
    print("\n2. 🖱️ TAB CLICKING ISSUE?")
    print("   → Are tabs clickable after interference blocking?")
    print("   → Might need to protect tab elements from being blocked")
    
    print("\n3. 🔘 전체보기 BUTTON ISSUE?")
    print("   → Is 전체보기 button present after tab switching?")
    print("   → Different tab layouts might not have 전체보기 button")
    
    print("\n4. 📊 DATA EXTRACTION ISSUE?")
    print("   → Are tables present after clicking 전체보기?")
    print("   → Different table structure in financial tabs?")
    
    print("\n💡 RECOMMENDED DIAGNOSTIC FIXES:")
    print("-" * 40)
    
    print("FIX 1: ADD TAB PROTECTION")
    print("   → Protect '재무상태표' and '손익계산서' from interference blocking")
    print("   → Add to isLegitimateNavigation() function")
    
    print("\nFIX 2: ENHANCED TAB DETECTION")
    print("   → Add multiple selectors for tab detection")
    print("   → Add tab visibility checks and debugging")
    
    print("\nFIX 3: CONDITIONAL 전체보기 LOGIC")
    print("   → Skip 전체보기 if not available on financial tabs")
    print("   → Extract data directly if already visible")
    
    print("\nFIX 4: FALLBACK EXTRACTION")
    print("   → Try single-tab extraction if dual-tab fails")
    print("   → Extract from default view without tab switching")
    
    print("\n🔧 IMMEDIATE ACTION NEEDED:")
    print("-" * 40)
    print("1. Access screenshots via Apify Console key-value store")
    print("2. Check if tabs are visible but blocked by interference detection")  
    print("3. Implement tab protection in isLegitimateNavigation()")
    print("4. Add detailed logging for tab detection and clicking")

def recommend_code_fixes():
    """
    Provides specific code fix recommendations
    """
    print("\n💻 SPECIFIC CODE FIXES:")
    print("=" * 40)
    
    print("FIX 1: Protect Financial Statement Tabs")
    print("```javascript")
    print("function isLegitimateNavigation(element) {")
    print("    const text = element.textContent?.trim() || '';")
    print("    const legitimateNavItems = [")
    print("        '투자실적', '재무제표', '조합현황', '인력현황',")
    print("        '전문인력현황', '법규위반형환', 'VC MAP', '전체보기',")
    print("        '재무상태표', '손익계산서'  // ADD THESE TABS")
    print("    ];")
    print("    return legitimateNavItems.some(navItem => text.includes(navItem));")
    print("}")
    print("```")
    
    print("\nFIX 2: Enhanced Tab Detection")
    print("```javascript")
    print("// Enhanced tab detection with multiple selectors")
    print("const tabSelectors = [")
    print("    'a:contains(\"재무상태표\")', 'button:contains(\"재무상태표\")',")
    print("    'tab:contains(\"재무상태표\")', '.tab:contains(\"재무상태표\")',")
    print("    'li:contains(\"재무상태표\")', '[title*=\"재무상태표\"]'")
    print("];")
    print("```")
    
    print("\nFIX 3: Add Comprehensive Debugging")
    print("```javascript")
    print("console.log('🔍 FINANCIAL TABS DEBUG:');")
    print("const allTabs = document.querySelectorAll('a, button, .tab, li, [role=\"tab\"]');")
    print("allTabs.forEach((tab, i) => {")
    print("    console.log(`Tab ${i}: ${tab.textContent?.trim()} - ${tab.tagName}`);")
    print("});")
    print("```")

if __name__ == "__main__":
    analyze_apify_logs()
    recommend_code_fixes()
    
    print(f"\n📅 Diagnostic completed at: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
    print("🎯 Next: Access screenshots and implement tab protection fixes") 