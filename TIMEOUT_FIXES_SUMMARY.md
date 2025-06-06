# DIVA Scraper Timeout Fixes

## 🚨 Issues Identified from Apify Logs

Based on the Apify logs at https://api.apify.com/v2/logs/Yg0O6cTG7Sp8SzmOL, the main problems were:

### 1. Protocol Timeout Errors
```
❌ Pagination error for financial_statements: ProtocolError: Runtime.callFunctionOn timed out
```
- **Cause**: Browser operations taking longer than default timeout (30 seconds)
- **Impact**: Scraper failing during pagination, especially on financial statements

### 2. Long-Running Operations
- Scraper running for 10+ minutes without completion
- Browser operations hanging on slow Korean government websites
- Memory and resource exhaustion

## 🔧 Fixes Implemented

### 1. **Increased Browser Timeouts**
```javascript
// Before: Default timeouts (30 seconds)
protocolTimeout: 180000, // 3 minutes protocol timeout

// Browser-level timeouts
page.setDefaultTimeout(180000); // 3 minutes default timeout
page.setDefaultNavigationTimeout(180000); // 3 minutes navigation timeout
```

### 2. **Enhanced Crawler Configuration**
```javascript
const crawler = new PuppeteerCrawler({
    maxConcurrency: 1, // Process one page at a time
    requestHandlerTimeoutSecs: 600, // 10 minutes per request
    navigationTimeoutSecs: 180, // 3 minutes for navigation
    
    browserPoolOptions: {
        maxOpenPagesPerBrowser: 1, // Only one page per browser
        retireBrowserAfterPageCount: 5, // Retire browser after 5 pages
    }
});
```

### 3. **Timeout-Protected Pagination**
```javascript
// Before: Direct operations that could hang
await nextButton.click();

// After: Promise.race with timeout protection
await Promise.race([
    nextButton.click(),
    new Promise((_, reject) => setTimeout(() => reject(new Error('Click timeout')), 10000))
]);
```

### 4. **Retry Logic and Error Handling**
```javascript
let consecutiveTimeouts = 0;
const maxTimeouts = 3; // Stop after 3 consecutive timeouts

while (currentPage < maxPages && consecutiveTimeouts < maxTimeouts) {
    try {
        // Protected operations
        consecutiveTimeouts = 0; // Reset on success
    } catch (error) {
        consecutiveTimeouts++;
        if (consecutiveTimeouts >= maxTimeouts) break;
    }
}
```

### 5. **Optimized Configuration**
```javascript
const config = {
    maxPages: 25, // Reduced from 50 to prevent timeouts
    delay: 5000,  // Increased from 2000ms to 5000ms
};
```

## 📊 Key Improvements

| Issue | Before | After |
|-------|--------|-------|
| Protocol Timeout | 30 seconds | 180 seconds (3 minutes) |
| Request Timeout | 300 seconds | 600 seconds (10 minutes) |
| Pagination Strategy | Direct operations | Promise.race with timeouts |
| Concurrency | Multiple | 1 (sequential processing) |
| Error Handling | Basic | Retry logic with timeout detection |
| Browser Management | Persistent | Retire after 5 pages |

## 🎯 Expected Results

1. **No More Protocol Timeouts**: Browser operations protected with 3-minute timeouts
2. **Graceful Error Recovery**: Automatic retry on timeout with backoff
3. **Better Memory Management**: Browser retirement prevents memory leaks
4. **Sequential Processing**: Reduces server load and improves reliability
5. **Complete Data Collection**: Even if some pages timeout, scraper continues

## 🚀 Testing the Fixes

Run the test script to validate improvements:

```bash
node test_timeout_fixes.js
```

## 📋 Monitoring Recommendations

1. **Watch for these improved log messages**:
   - `✅ Successfully clicked page X for dataType`
   - `⏱️ Timeout detected, waiting longer before retry...`
   - `📄 Completed pagination for dataType - processed X pages (Y timeouts)`

2. **Success indicators**:
   - Reduced protocol timeout errors
   - Successful pagination completion
   - Data collection continuing even after timeouts

3. **If issues persist**:
   - Further increase `protocolTimeout` to 300 seconds (5 minutes)
   - Reduce `maxPages` to 10 for testing
   - Monitor Apify memory usage

## 🔄 Deployment

The fixes are implemented in the main scraper file:
- `apify/diva-scraper/main.js` - Updated with all timeout protections
- Ready for immediate deployment to Apify

The scraper will now handle slow Korean government websites much more reliably! 