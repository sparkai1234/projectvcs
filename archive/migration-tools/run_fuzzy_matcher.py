#!/usr/bin/env python3
"""
Run Fuzzy Company Matcher
Simple script to execute the fuzzy matching analysis
"""

from fuzzy_company_matcher import AirtableFuzzyMatcher
from config import AIRTABLE_CONFIG
import json

def main():
    print("🔗 Company Relationship Analyzer")
    print("=" * 50)
    print("This will analyze relationships between:")
    print("- VC Table (Company Name)")
    print("- Fund Table (Company Name)")
    print("- Contacts Table (회사)")
    print()
    
    # Get configuration
    config = AIRTABLE_CONFIG
    
    # Validate API key
    if "..." in config["API_KEY"]:
        print("❌ Please update your API key in config.py")
        print("   Replace 'patOUfAsek4nbpvHm.49789...' with your full API key")
        return
    
    print(f"📊 Configuration:")
    print(f"   Base ID: {config['BASE_ID']}")
    print(f"   Fuzzy Threshold: {config['FUZZY_THRESHOLD']}%")
    print(f"   Tables: {config['VC_TABLE']}, {config['FUND_TABLE']}, {config['CONTACTS_TABLE']}")
    print()
    
    # Initialize matcher
    matcher = AirtableFuzzyMatcher(
        api_key=config["API_KEY"],
        base_id=config["BASE_ID"]
    )
    
    # Override table names from config
    matcher.vc_table = config["VC_TABLE"]
    matcher.fund_table = config["FUND_TABLE"] 
    matcher.contacts_table = config["CONTACTS_TABLE"]
    matcher.vc_field = config["VC_COMPANY_FIELD"]
    matcher.fund_field = config["FUND_COMPANY_FIELD"]
    matcher.contacts_field = config["CONTACTS_COMPANY_FIELD"]
    
    try:
        # Run analysis
        results = matcher.run_analysis_with_config(config)
        
        # Save detailed results
        with open("company_relationships.json", "w", encoding="utf-8") as f:
            json.dump(results, f, indent=2, ensure_ascii=False)
        
        # Print summary
        print("\n🎯 ANALYSIS RESULTS")
        print("=" * 40)
        stats = results["stats"]
        print(f"📈 Companies Found:")
        print(f"   VC Companies: {stats['total_vc_companies']}")
        print(f"   Fund Companies: {stats['total_fund_companies']}") 
        print(f"   Contact Companies: {stats['total_contact_companies']}")
        print()
        print(f"🔗 Matching Results:")
        print(f"   Successful Matches: {stats['total_matches']}")
        print(f"   Match Rate: {stats['match_rate']:.1f}%")
        print()
        
        if results["matches"]:
            print("✨ Sample Matches:")
            for i, match in enumerate(results["matches"][:5]):  # Show first 5
                print(f"   {i+1}. '{match['contact_company']}' → '{match['matched_company']}' ({match['score']}%)")
            
            if len(results["matches"]) > 5:
                print(f"   ... and {len(results['matches']) - 5} more matches")
        
        print(f"\n📄 Files Created:")
        print(f"   • company_relationship_report.md - Human readable report")
        print(f"   • company_relationships.json - Detailed data for processing")
        
        # Show next steps
        print(f"\n🚀 Next Steps:")
        print(f"   1. Review company_relationship_report.md")
        print(f"   2. Verify the matches look correct") 
        print(f"   3. Adjust threshold in config.py if needed")
        print(f"   4. Use the relationship data to create Airtable links")
        
    except Exception as e:
        print(f"❌ Error during analysis: {e}")
        print("Please check:")
        print("- Your API key is correct")
        print("- Table names match exactly") 
        print("- Field names match exactly")
        print("- You have access to the base")

if __name__ == "__main__":
    main() 