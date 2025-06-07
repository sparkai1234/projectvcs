# 🇰🇷 Korean DIVA Financial Data Scraper v5.0 - Enhanced Playwright Edition

> **🎯 CRITICAL DEPLOYMENT REFRESH v5.0.1** - Targeting 92+ violations records benchmark with enhanced Playwright detection

**Enhanced Playwright Edition** specifically designed to solve the **94.6% data completeness crisis** discovered in manual testing.

**📊 Performance Target**: 
- **Previous**: 5 violations records (94.6% data loss)  
- **Manual Verification**: 92 violations records found
- **v5.0 Target**: 92+ violations records (18.4x improvement)

## ✨ Enhanced v5.0 Features

### 🔍 Multi-Strategy 전체보기 Detection
- **5 Detection Methods**: Text content, value attributes, class names, XPath, CSS selectors  
- **Enhanced Korean Text Handling**: Improved Unicode processing
- **Smart Fallback System**: Automatic method switching if primary fails

### ⏱️ Advanced Waiting & Stability
- **NetworkIdle Detection**: Waits for network requests to complete
- **DOM Stability Monitoring**: Ensures content fully loaded
- **Progressive Timeout Strategy**: 3s → 5s → 10s escalation

### 🛡️ Enhanced Error Recovery  
- **Automatic Screenshots**: Captures state on failure for debugging
- **Graceful Degradation**: Continues processing even if some records fail
- **Detailed Error Logging**: Comprehensive failure analysis

### 📈 Performance Optimizations
- **Intelligent Page Detection**: Smart content analysis
- **Efficient Resource Usage**: Optimized memory and CPU utilization
- **Robust Session Management**: Improved browser stability

## 🚀 Quick Start

```bash
# Clone and navigate
git clone https://github.com/sparkai1234/projectvcs.git
cd projectvcs/apify/diva-scraper

# Install dependencies  
npm install

# Configure input (see INPUT-V5-ENHANCED.json)
{
  "updateMode": "incremental",
  "dataSource": "all",
  "maxPages": 50,
  "targetRecords": 92
}

# Deploy to Apify
apify push

# Run locally for testing
apify run
```

## 🎯 Critical Benchmarks

- **Target Violations**: 92+ records (verified manually)
- **Data Completeness**: >95% (vs previous 5.4%)
- **Performance**: 18.4x improvement minimum
- **Error Rate**: <5% failure tolerance
- **Processing Time**: <45 minutes for full dataset

## 🔧 Enhanced Configuration

### Input Parameters
- `updateMode`: "incremental" | "full" - Processing strategy
- `dataSource`: "all" | "violations" | "performance" - Data scope  
- `maxPages`: Number - Maximum pages to process
- `targetRecords`: Number - Expected record count for validation
- `enableScreenshots`: Boolean - Capture debugging screenshots

### Advanced Options
- `waitStrategy`: "networkidle" | "domcontent" | "load" - Loading detection
- `retryAttempts`: Number (default: 3) - Failure retry count
- `timeoutSecs`: Number (default: 3600) - Maximum execution time

## 📊 Data Quality Validation

The scraper includes built-in validation to ensure data quality:

1. **Record Count Validation**: Verifies target record count achieved
2. **Data Completeness Check**: Ensures all required fields populated  
3. **Format Consistency**: Validates data format and structure
4. **Duplicate Detection**: Identifies and handles duplicate records

## 🐛 Troubleshooting

### Common Issues

**"Could not find button"**: 
- Enhanced v5.0 includes 5 detection methods
- Check screenshots in key-value store for debugging

**"Low record count"**:
- Verify target website structure hasn't changed
- Check performance metrics in output

**"Timeout errors"**:
- Increase `timeoutSecs` parameter
- Review network connectivity

### Debug Mode
Enable detailed logging:
```json
{
  "debugMode": true,
  "enableScreenshots": true,
  "verboseLogging": true
}
```

## 📈 Version History

### v5.0.1 - Deployment Configuration Enhancement
- **Added**: Explicit GitHub branch configuration for Apify deployment
- **Fixed**: Deployment cache refresh mechanism
- **Improved**: Repository integration stability

### v5.0 - Enhanced Playwright Edition  
- **NEW**: Multi-strategy 전체보기 button detection (5 methods)
- **NEW**: Advanced waiting strategies (networkidle, DOM stability)
- **NEW**: Enhanced Korean text processing
- **FIXED**: 94.6% data completeness crisis
- **TARGET**: 92+ violations records (18.4x improvement)

### v3.2 - Puppeteer Legacy
- **ISSUE**: Only captured 5 violations records  
- **PROBLEM**: 94.6% data loss identified in manual testing
- **DECISION**: Migration to Playwright for enhanced reliability

## 📞 Support & Deployment

- **Repository**: sparkai1234/projectvcs  
- **Path**: apify/diva-scraper/
- **Deployment**: Automatic via git-apify integration
- **Monitoring**: Built-in performance metrics and error reporting

---

**🎯 Mission**: Solve the 94.6% data completeness crisis and achieve reliable 92+ violations record extraction for Korean DIVA financial compliance monitoring. 