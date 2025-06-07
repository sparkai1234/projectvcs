# 🎯 DIVA SCRAPER v5.0 - ENHANCED PLAYWRIGHT DEPLOYMENT GUIDE

## 🚀 Version Overview

**DIVA Scraper v5.0 - Enhanced Playwright Edition**
- **Critical Upgrade**: Multi-strategy 전체보기 button detection
- **Primary Target**: 92+ violations records (manual benchmark)
- **Technology**: Playwright instead of Puppeteer for superior reliability
- **Expected Results**: 18.4x more data than previous versions

## 📊 Benchmark Targets

| Data Source | Target Records | Previous Version | Improvement |
|-------------|----------------|------------------|-------------|
| **Violations** | **92+ (CRITICAL)** | 5 records | **18.4x** |
| Investment Performance | 50+ | Variable | Improved |
| Financial Statements | 50+ | Variable | Improved |
| Association Status | 50+ | Variable | Improved |
| Personnel Status | 50+ | Variable | Improved |
| Professional Personnel | 50+ | Variable | Improved |
| VC Map | 50+ | Variable | Improved |
| Statistics | 20+ | Variable | Improved |
| **TOTAL TARGET** | **500+ records** | ~50 records | **10x** |

## 🎯 Key v5.0 Enhancements

### 1. Multi-Strategy 전체보기 Detection
- **Text Content Matching**: Searches for '전체보기', '전체', '모두보기'
- **Value Attribute Matching**: input[value*="전체"]
- **Class Name Matching**: .전체, .전체보기, .all-view
- **XPath Text Matching**: Advanced xpath selectors
- **CSS Advanced Selectors**: button[onclick*="전체"], [title*="전체"]

### 2. Enhanced Waiting Strategies
- **NetworkIdle**: Waits for network activity to settle
- **DOM Stability**: Monitors row count changes over time
- **Multi-timeout**: Race conditions for reliability
- **Korean-optimized**: Better handling of dynamic content

### 3. Improved Error Handling
- **Screenshots on Failure**: Automatic debugging screenshots
- **Retry Mechanisms**: Multiple click attempts
- **Force Click**: Alternative clicking methods
- **Enhanced Logging**: Detailed strategy performance tracking

## 🔧 Deployment Steps

### Step 1: Git Commit and Push
```bash
# Navigate to project directory
cd apify/diva-scraper

# Add all v5.0 files
git add .

# Commit with clear version message
git commit -m "🎯 DIVA Scraper v5.0 - Enhanced Playwright Edition

- Multi-strategy 전체보기 detection (5 different methods)
- Enhanced waiting strategies for complete data loading
- Targeting 92+ violations records benchmark
- Improved Korean text extraction and processing
- Advanced error handling with screenshots
- Updated dependencies: Playwright 1.41.0, Crawlee 3.5.8"

# Push to trigger Apify auto-deployment
git push origin master
```

### Step 2: Verify Apify Integration
1. **GitHub Integration**: Confirm auto-sync is active
2. **Build Status**: Check Apify actor build succeeds
3. **Dependencies**: Verify Playwright installation
4. **Configuration**: Confirm input schema is updated

### Step 3: Test Deployment

#### Test Configuration (INPUT-V5-ENHANCED.json)
```json
{
    "maxPages": 999,
    "dataSource": "all", 
    "exportToSupabase": true,
    "testMode": false,
    "headless": true,
    "delay": 3000,
    "navigationTimeout": 180000,
    "requestTimeout": 600000
}
```

#### Small Scale Test (Violations Only)
```json
{
    "maxPages": 999,
    "dataSource": "violations",
    "exportToSupabase": true,
    "testMode": true
}
```

### Step 4: Monitor Performance

#### Key Metrics to Track:
- **전체보기 Detection Success Rate**: Should be >90%
- **Violations Records**: Target 92+
- **Strategy Performance**: Which detection method works best
- **Screenshots Generated**: For debugging failures
- **DOM Stability**: Row count stabilization

#### Expected Log Patterns:
```
✅ v5.0 SUCCESS: Found 전체보기 using textMatch!
🎯 v5.0: Successfully clicked 전체보기! Initiating enhanced wait...
📊 v5.0: DOM stability check 3/5 - rows: 94
✅ v5.0: DOM stabilized, proceeding with extraction
🎯 EXCELLENT: 94 violations records (102.2% of 92 benchmark)!
```

## 🎯 Success Criteria

### Primary Success (CRITICAL)
- **✅ Violations Records**: 92+ records extracted
- **✅ 전체보기 Detection**: Successfully found and clicked
- **✅ Data Quality**: Clean Korean text extraction
- **✅ No Critical Errors**: Stable execution

### Secondary Success
- **✅ All Sources**: 50+ records per major data source
- **✅ Total Records**: 500+ total records
- **✅ Performance**: <30 minutes execution time
- **✅ Reliability**: <5% error rate

### Benchmark Comparison
- **Previous**: 5 violations records (94.6% data loss)
- **Target**: 92+ violations records (manual benchmark)
- **Success**: Match or exceed 92 violations

## 🚨 Troubleshooting

### Issue 1: 전체보기 Button Not Found
**Symptoms**: All 5 detection strategies fail
**Debug**: Check generated screenshots
**Solution**: Analyze page structure changes

### Issue 2: Low Violations Count
**Symptoms**: <50 violations records extracted
**Debug**: Review DOM stability logs
**Solution**: Increase wait times or check page changes

### Issue 3: Timeout Errors
**Symptoms**: Navigation or request timeouts
**Debug**: Check network conditions
**Solution**: Increase timeout values in configuration

### Issue 4: Korean Text Issues
**Symptoms**: Garbled or missing Korean characters
**Debug**: Check encoding and language headers
**Solution**: Verify UTF-8 support and Accept-Language

## 📈 Performance Monitoring

### Real-time Monitoring Commands
```bash
# Monitor live execution
node monitor_live_run.js

# Check extraction results  
node check_data_flow.js

# Verify Supabase integration
node test_vcs_supabase_integration.js
```

### Success Metrics Dashboard
- **Data Completeness**: 92+ violations vs manual benchmark
- **Strategy Effectiveness**: Which detection methods work
- **Extraction Quality**: Korean text accuracy
- **Error Rate**: <5% target
- **Speed**: <30 minutes target

## 🏆 Expected Outcomes

### Data Completeness Revolution
- **Before**: 5 violations records (5.4% of available data)
- **After**: 92+ violations records (100%+ of manual benchmark)
- **Improvement**: 18.4x more violations data

### Technology Advancement  
- **From**: Puppeteer single-strategy detection
- **To**: Playwright multi-strategy detection
- **Benefit**: Superior reliability for Korean websites

### Business Intelligence Enhancement
- **Complete**: violations tracking and compliance monitoring
- **Enhanced**: financial performance analysis
- **Improved**: personnel and organizational intelligence

## 🎯 Deployment Checklist

- [ ] Code committed to git with v5.0 tag
- [ ] Package.json updated to version 5.0.0
- [ ] Input configuration created (INPUT-V5-ENHANCED.json)
- [ ] Apify auto-deployment triggered
- [ ] Dependencies updated (Playwright 1.41.0)
- [ ] Test run completed successfully
- [ ] Violations benchmark achieved (92+ records)
- [ ] Supabase integration verified
- [ ] Error handling tested
- [ ] Performance monitoring active

## 🔗 Related Files

- **Main Script**: `main.js` (v5.0 Enhanced Playwright)
- **Configuration**: `INPUT-V5-ENHANCED.json`
- **Dependencies**: `package.json` (updated)
- **Documentation**: `DEPLOYMENT-GUIDE-V5.md` (this file)
- **Monitoring**: `../monitor_live_run.js`

---

**🎯 Ready for Production**: DIVA Scraper v5.0 Enhanced Playwright Edition
**🚀 Target Achievement**: 92+ violations records benchmark
**✨ Technology**: Multi-strategy 전체보기 detection with Playwright 