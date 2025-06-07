# 🇰🇷 Korean DIVA Financial Data Scraper - Standalone Edition

> **🎯 MISSION CRITICAL** - Solving the 94.6% data completeness crisis with enhanced Playwright technology

## 🚀 Quick Deploy to Apify

This is a **standalone, ready-to-deploy** DIVA scraper that bypasses GitHub integration issues. Simply copy the files to Apify Console and deploy immediately.

### ⚡ Instant Deployment Steps

1. **Create New Actor** in Apify Console
2. **Copy/Paste Files** directly into the code editor:
   - `main.js` → Main scraper logic
   - `package.json` → Dependencies
   - `Dockerfile` → Build configuration  
   - `actor.json` → Actor settings
   - `INPUT_SCHEMA.json` → Input configuration
3. **Click Build** → Deploy instantly
4. **Run with confidence** → Target 92+ violations records

## 📊 Performance Targets

| Metric | Previous (Puppeteer) | Target (Standalone) | Improvement |
|--------|---------------------|---------------------|-------------|
| **Violations Found** | 5 records | 92+ records | **18.4x** |
| **Data Completeness** | 5.4% | >95% | **17.6x** |
| **Success Rate** | Unreliable | >95% | **Stable** |
| **Processing Time** | Variable | <45 minutes | **Optimized** |

## ✨ Enhanced Features

### 🔍 Multi-Strategy Detection
- **5 Detection Methods** for 전체보기 button
- **Korean Text Recognition** with Unicode optimization
- **Smart Fallback System** for maximum reliability

### ⏱️ Advanced Waiting & Stability
- **NetworkIdle Detection** - Waits for complete page load
- **DOM Stability Monitoring** - Ensures content fully rendered
- **Progressive Timeout Strategy** - 2s → 5s → 10s escalation

### 🛡️ Enhanced Error Recovery
- **Automatic Screenshots** on failure
- **Graceful Degradation** - Continues despite partial failures
- **Detailed Error Logging** - Complete diagnostic information

## 🎯 Configuration Options

### Basic Settings
```json
{
  "updateMode": "incremental",     // "incremental" | "full"
  "dataSource": "all",             // "all" | "violations" | "performance"
  "maxPages": 50,                  // Maximum pages to process
  "targetRecords": 92              // Expected violation records
}
```

### Advanced Options
```json
{
  "enableScreenshots": true,       // Capture debug screenshots
  "waitStrategy": "networkidle",   // Page load detection method
  "retryAttempts": 3,              // Failure retry count
  "debugMode": false               // Verbose logging
}
```

## 🔧 How It Works

### 1. Korean Website Optimization
- **Korean Locale Support** (`ko-KR`, `Asia/Seoul`)
- **Korean Font Installation** (Nanum fonts)
- **Unicode Text Processing** for Korean characters

### 2. Multi-Strategy Button Detection
```javascript
// Strategy 1: Korean text content
page.locator('button, a, input').filter({ hasText: '전체보기' })

// Strategy 2: Value attributes  
page.locator('input[value*="전체보기"], button[value*="전체보기"]')

// Strategy 3: Class names and IDs
page.locator('.btn-all, .view-all, #viewAll, #btnAll')

// Strategy 4: XPath fallback
page.locator('//button[contains(text(), "전체")]')

// Strategy 5: CSS comprehensive
page.locator('button:has-text("전체"), a:has-text("전체")')
```

### 3. Data Extraction & Validation
- **Multiple Selector Strategies** for maximum coverage
- **Content Filtering** for violations (`위반`, `제재`, `처분`)
- **Performance Metrics** tracking and validation
- **Target Achievement** verification (92+ records)

## 📈 Output Data Structure

### Violation Records
```json
{
  "id": "violation_1704067200000_abc123def",
  "type": "violation",
  "content": "Korean violation text...",
  "source": "diva.kvca.or.kr", 
  "extractedAt": "2024-01-01T00:00:00.000Z",
  "processingMode": "incremental",
  "metadata": {
    "selector": "table tr",
    "scraper": "diva-standalone-v1.0",
    "targetAchieved": true
  }
}
```

### Performance Metrics
```json
{
  "totalRecords": 150,
  "violationsFound": 95,
  "targetRecords": 92,
  "targetAchieved": true,
  "dataCompleteness": 103.26,
  "improvement": "19.0x",
  "timestamp": "2024-01-01T00:00:00.000Z",
  "version": "standalone-v1.0"
}
```

## 🐛 Troubleshooting

### Common Issues

**❌ "No violations found"**
- ✅ Check if 전체보기 button was detected
- ✅ Enable screenshots to see page state
- ✅ Verify website structure hasn't changed

**❌ "Low record count"**
- ✅ Increase `maxPages` parameter
- ✅ Check `targetRecords` setting
- ✅ Enable `debugMode` for detailed logging

**❌ "Timeout errors"**
- ✅ Switch to `waitStrategy: "load"`
- ✅ Increase `retryAttempts`
- ✅ Check network connectivity

### Debug Mode
Enable comprehensive debugging:
```json
{
  "debugMode": true,
  "enableScreenshots": true,
  "retryAttempts": 5
}
```

## 🎯 Success Criteria

### ✅ Target Achievement
- **92+ Violation Records** extracted successfully
- **>95% Data Completeness** vs manual verification
- **<5% Error Rate** in processing
- **<45 Minutes** total processing time

### 📊 Quality Validation
- **Content Verification** - All records contain violation keywords
- **Format Consistency** - Standardized data structure
- **Duplicate Detection** - Unique record identification
- **Performance Tracking** - Metrics vs benchmarks

## 💡 Pro Tips

1. **Start Small** - Test with `maxPages: 10` first
2. **Enable Screenshots** - Essential for debugging
3. **Monitor Performance** - Check metrics after each run
4. **Adjust Targets** - Set realistic `targetRecords` based on website size
5. **Use Incremental** - Faster processing with `updateMode: "incremental"`

## 🚀 Ready to Deploy?

This standalone scraper is **production-ready** and designed to:
- ✅ **Bypass GitHub Integration Issues**
- ✅ **Deploy Instantly** to Apify Console
- ✅ **Achieve 92+ Violations Target**
- ✅ **Solve Data Completeness Crisis**

**Copy the files → Paste in Apify → Build → Run → Success! 🎉**

---

**Mission**: Solve the 94.6% data completeness crisis and achieve reliable Korean DIVA financial compliance monitoring with 18.4x performance improvement. 