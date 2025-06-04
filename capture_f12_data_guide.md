# 🛠 How to Capture F12 Data from DIVA Portal

## 📋 Step-by-Step Guide

### 1. **Network Tab Capture**
```
1. Open F12 Developer Tools
2. Go to "Network" tab
3. Refresh the page or click search
4. Right-click on relevant requests → "Copy as cURL"
5. Look for XHR/Fetch requests containing JSON data
```

### 2. **Key Requests to Look For**
- API calls to endpoints like `/api/...` or `/div/...`
- POST requests when you click search
- Pagination requests when clicking page numbers
- Any JSON responses containing the table data

### 3. **What to Copy & Share**

#### A. **Request Headers**
```
Copy the full request including:
- URL
- Method (GET/POST)
- Headers
- Request payload/body
```

#### B. **Response Data**
```
Copy the JSON/XML response that contains:
- Company names (회사명)
- Investment amounts (출자금)
- Portfolio data
- Pagination info
```

#### C. **HTML Structure**
```
Right-click on the table → Inspect Element
Copy the table HTML structure
```

### 4. **Specific Files to Create**

Please create these files with your captured data:

#### `diva_network_requests.txt`
```
Paste all relevant network requests here
Include both the request and response
```

#### `diva_table_structure.html`
```
Paste the HTML structure of the data table
```

#### `diva_api_response.json`
```
Paste any JSON responses containing the actual data
```

## 🎯 What I'm Looking For

### **Priority 1: Investment Data API**
The JSON/XML that contains:
- 성남벤처투자: {출자금: 11, 전환전액: 6, 투자잔액: 6, 경영관리: 5}
- 골든오크벤처스: {출자금: 6, 전환전액: 3, 투자잔액: 2, 경영관리: 4}
- etc.

### **Priority 2: Search/Filter Mechanism**
- How to search by company name
- How to filter by date ranges
- How pagination works

### **Priority 3: Authentication/Session**
- Any cookies or tokens needed
- Session management
- Rate limiting information

## 🚀 Once You Share This Data

I'll be able to:

1. **Create a targeted scraper** that extracts exactly this investment data
2. **Build proper API integration** using the actual endpoints
3. **Handle authentication** and session management correctly  
4. **Set up efficient pagination** to get all records
5. **Parse the data structure** accurately for Airtable upload

## 📝 Quick Copy-Paste Format

You can just paste everything in this format:

```
=== NETWORK REQUEST ===
URL: [paste URL]
Method: [GET/POST]
Headers: [paste headers]
Body: [paste request body if any]

=== RESPONSE ===
[paste full response]

=== TABLE HTML ===
[paste table HTML structure]
```

This will give me everything I need to build a perfect scraper for this specific data! 🎯 