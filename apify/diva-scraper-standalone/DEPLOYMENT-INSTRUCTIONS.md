# 🚀 DIVA SCRAPER v5.3.14.14 - DEPLOYMENT INSTRUCTIONS

## **CRITICAL: DIAGNOSTIC 전체보기 INVESTIGATION EDITION**

**Version**: 5.3.14.14  
**Mission**: Investigate why 전체보기 only shows 24 rows instead of 500+  
**Status**: ✅ READY FOR DEPLOYMENT

---

## **📋 Pre-Deployment Checklist**

- ✅ **Version Updated**: actor.json shows v5.3.14.14
- ✅ **Main.js Updated**: Console shows "DIAGNOSTIC 전체보기 INVESTIGATION EDITION"
- ✅ **Memory Increased**: 2048MB (was 1024MB)
- ✅ **Enhanced Waiting**: 20 checks, 5s intervals for financial data
- ✅ **Diagnostic Mode**: Multiple show-all strategies + extreme debugging

---

## **🔧 Deployment Steps**

### **1. APIFY CLI Deployment (Recommended)**
```bash
# Navigate to project directory
cd apify/diva-scraper-standalone

# Login to Apify (if not already logged in)
apify login

# Deploy the actor
apify push

# Run the actor
apify call
```

### **2. Manual Deployment via Apify Console**
1. **Zip the entire project folder**:
   - Include: `main.js`, `actor.json`, `package.json`, `Dockerfile`, `README.md`
   - Exclude: `node_modules/`, `storage/`, `*.json` data files

2. **Upload to Apify Console**:
   - Go to [Apify Console](https://console.apify.com)
   - Create new Actor or update existing
   - Upload zip file
   - Build and Run

---

## **🎯 Expected Diagnostic Output**

The v5.3.14.14 will provide **extreme diagnostics** to investigate the 전체보기 issue:

```
DIVA SCRAPER v5.3.14.14 - DIAGNOSTIC 전체보기 INVESTIGATION EDITION
MISSION: Investigate why 전체보기 only shows 24 rows instead of 500+
APPROACH: Extreme diagnostics + Multiple show-all strategies
TARGET: Find the REAL mechanism to show ALL financial records
```

### **Key Diagnostic Features**:
- **🔍 Multiple 전체보기 strategies**: textMatch, valueMatch, classMatch, xpathMatch
- **⏰ Ultra-long waiting**: 20 checks × 5 seconds = 100+ seconds waiting
- **📊 Enhanced monitoring**: Financial-specific row counting with 200+ minimum expectations
- **📸 Comprehensive screenshots**: Every step documented for analysis

---

## **🚨 Critical Investigation Points**

### **Current Problem Analysis**:
```
✅ 전체보기 button IS being clicked successfully
❌ Only generates 24 rows (20 data records) instead of 500+
❌ Same 40/500 (8.0%) result across all attempts
```

### **Diagnostic Hypotheses**:
1. **Wrong Button**: Different "show all" mechanism exists
2. **Additional Steps**: More actions needed after clicking 전체보기  
3. **Server Limitation**: Site only shows limited records
4. **Timing Issue**: Need much longer waiting for complete generation

### **Expected Breakthrough**:
The diagnostic version will reveal:
- **Which buttons are available** on the financial page
- **How long data actually takes to load** after clicking
- **Whether more data appears with extreme waiting**
- **If alternative show-all mechanisms exist**

---

## **📊 Success Criteria**

**v5.3.14.14 Success**: 
- ✅ **Deploys correctly** with v5.3.14.14 in logs (not v5.3.14.7)
- ✅ **Provides detailed diagnostics** about 전체보기 mechanism
- ✅ **Identifies root cause** of 24-row limitation
- ✅ **Discovers alternative approach** to get all 500+ records

**Target Results**:
- Current: financial_statements: 40/500 (8.0%)
- Goal: financial_statements: 500/500 (100.0%)

---

## **🔥 DEPLOYMENT VERIFICATION**

After deployment, verify the correct version is running:

1. **Check Logs**: Should show "v5.3.14.14 - DIAGNOSTIC 전체보기 INVESTIGATION"
2. **Monitor Financial Extraction**: Look for enhanced diagnostic output
3. **Review Screenshots**: Comprehensive debugging images saved
4. **Analyze Results**: Detailed investigation of 전체보기 mechanism

---

**Ready for deployment! This diagnostic version will solve the 전체보기 mystery.** 