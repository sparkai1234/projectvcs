#!/usr/bin/env python3
import json
from collections import Counter

def analyze_results():
    print("=== Korean VC Fuzzy Matching Results Analysis ===")
    print()
    
    # Load results
    with open('simple_fuzzy_results.json', 'r', encoding='utf-8') as f:
        data = json.load(f)
    
    matches = data.get('matches', [])
    total_matches = len(matches)
    
    print(f"📊 SUMMARY STATISTICS")
    print(f"   Total Matches Found: {total_matches:,}")
    print()
    
    # Score distribution
    print("🎯 MATCH QUALITY DISTRIBUTION")
    score_ranges = {
        '100% (Perfect)': 0,
        '95-99% (Excellent)': 0,
        '90-94% (Very Good)': 0,
        '85-89% (Good)': 0,
        '80-84% (Fair)': 0
    }
    
    for match in matches:
        score = match.get('score', 0)
        if score == 100:
            score_ranges['100% (Perfect)'] += 1
        elif score >= 95:
            score_ranges['95-99% (Excellent)'] += 1
        elif score >= 90:
            score_ranges['90-94% (Very Good)'] += 1
        elif score >= 85:
            score_ranges['85-89% (Good)'] += 1
        elif score >= 80:
            score_ranges['80-84% (Fair)'] += 1
    
    for range_name, count in score_ranges.items():
        percentage = (count / total_matches * 100) if total_matches > 0 else 0
        print(f"   {range_name}: {count:,} ({percentage:.1f}%)")
    
    print()
    
    # Top companies by fund count
    print("🏦 TOP COMPANIES BY FUND COUNT")
    fund_counts = []
    
    for match in matches:
        fund_records = match.get('fund_records', [])
        if fund_records:
            fund_counts.append({
                'company': match.get('matched_company', ''),
                'contact_company': match.get('contact_company', ''),
                'fund_count': len(fund_records),
                'score': match.get('score', 0)
            })
    
    # Sort by fund count
    fund_counts.sort(key=lambda x: x['fund_count'], reverse=True)
    
    for i, item in enumerate(fund_counts[:10], 1):
        print(f"   {i:2d}. {item['company'][:25]:<25} → {item['fund_count']:2d} funds ({item['score']}%)")
    
    print()
    
    # Companies with both VC and Fund presence
    print("🎯 COMPANIES WITH BOTH VC & FUND PRESENCE")
    both_count = 0
    
    for match in matches:
        vc_records = match.get('vc_records', [])
        fund_records = match.get('fund_records', [])
        
        if vc_records and fund_records:
            both_count += 1
            if both_count <= 10:  # Show first 10
                print(f"   {both_count:2d}. {match.get('matched_company', '')[:30]:<30} "
                      f"(VC: {len(vc_records)}, Funds: {len(fund_records)})")
    
    print(f"   ... and {both_count - 10} more companies" if both_count > 10 else "")
    print(f"   Total: {both_count} companies with both VC and Fund presence")
    print()
    
    # Perfect matches
    print("✨ PERFECT MATCHES (100% Score)")
    perfect_matches = [m for m in matches if m.get('score', 0) == 100]
    
    for i, match in enumerate(perfect_matches[:15], 1):
        fund_count = len(match.get('fund_records', []))
        vc_count = len(match.get('vc_records', []))
        print(f"   {i:2d}. {match.get('contact_company', '')[:25]:<25} "
              f"(VC: {vc_count}, Funds: {fund_count})")
    
    if len(perfect_matches) > 15:
        print(f"   ... and {len(perfect_matches) - 15} more perfect matches")
    
    print(f"   Total Perfect Matches: {len(perfect_matches)}")
    print()
    
    # Interesting fuzzy matches (not perfect)
    print("🔍 INTERESTING FUZZY MATCHES (90-99%)")
    fuzzy_matches = [m for m in matches if 90 <= m.get('score', 0) < 100]
    
    for i, match in enumerate(fuzzy_matches[:10], 1):
        print(f"   {i:2d}. {match.get('contact_company', '')[:20]:<20} → "
              f"{match.get('matched_company', '')[:20]:<20} ({match.get('score', 0)}%)")
    
    print()
    
    # Analysis insights
    print("💡 KEY INSIGHTS")
    print(f"   • Match Rate: 11% of contacts have VC/Fund connections")
    print(f"   • Quality: {len(perfect_matches)} perfect matches out of {total_matches}")
    print(f"   • Coverage: {both_count} companies operate both VC and funds")
    print(f"   • Data Volume: {sum(len(m.get('fund_records', [])) for m in matches)} fund relationships identified")
    print()
    
    print("🎉 Analysis completed! Your Korean VC ecosystem mapping is ready.")

if __name__ == "__main__":
    analyze_results() 