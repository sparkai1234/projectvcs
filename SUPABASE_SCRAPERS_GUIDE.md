# 🚀 DIVA Supabase Scrapers v2.0 - Enhanced Data Extraction

## 📋 Overview

The updated DIVA scraping system now targets **Supabase** directly and includes **enhanced data extraction** with a focus on:

### 🎯 **Key Enhancements:**
- **대표펀드매니저 (Fund Manager Representative)** extraction for Fund data
- **대표 (Company Representative)** extraction for VC company data  
- **Operating Amount accuracy** preservation (stored in 억원 as per vcs.go.kr)
- **Direct Supabase integration** (no more Airtable dependency)
- **Enhanced data quality tracking** and validation
- **Comprehensive field mapping** for both VC and Fund tables

---

## 🏗️ **Architecture Overview**

### **Old System (Archived):**
```
vcs.go.kr → Apify → Airtable → Manual Migration → Supabase
```

### **New System (Current):**
```
vcs.go.kr → Enhanced Scrapers → Supabase (Direct)
```

---

## 📦 **Installation & Setup**

### **1. Install Node.js Dependencies**
```bash
cd src/supabase
npm install
```

### **2. Verify Configuration**
The scrapers are pre-configured with your Supabase credentials. Check:
- **URL**: `https://udfgtccxbqmalgpqyxzz.supabase.co`
- **Service Role Key**: Already configured in scrapers

### **3. Verify Supabase Tables**
Ensure these tables exist:
- `vc_table` (for VC company data)
- `fund_table` (for fund data)

---

## 🚀 **Usage**

### **Option 1: Python Wrappers (Recommended)**

#### **Run Fund Scraper:**
```bash
# Scrape all fund pages with enhanced manager data
python run_supabase_fund_scraper.py

# Limit to 5 pages for testing
python run_supabase_fund_scraper.py --max-pages 5

# Start from page 10
python run_supabase_fund_scraper.py --start-page 10

# Disable detailed scraping (faster)
python run_supabase_fund_scraper.py --no-detailed-scraping
```

#### **Run VC Scraper:**
```bash
# Scrape all VC company pages
python run_supabase_vc_scraper.py

# Limit to 3 pages for testing
python run_supabase_vc_scraper.py --max-pages 3

# Quick scraping without detailed extraction
python run_supabase_vc_scraper.py --no-detailed-scraping
```

### **Option 2: Direct Node.js Execution**

#### **Fund Scraper:**
```bash
cd src/supabase
node supabase_fund_scraper.js
```

#### **VC Scraper:**
```bash
cd src/supabase
node supabase_vc_scraper.js
```

---

## 🔍 **Enhanced Data Extraction**

### **Fund Data Enhancements:**

#### **🏦 Enhanced Fund Manager Extraction:**
The fund scraper now extracts `대표펀드매니저` information from multiple sources:

```javascript
// Primary extraction sources
const fundManager = 
    item.reprsntNm ||          // Representative name field
    item.fundMngrNm ||         // Fund manager name field  
    item.operInstReprsntNm ||  // Operating institution representative
    item.operReprsntNm ||      // Operator representative
    item.mngrNm ||             // Manager name
    item.ceoNm ||              // CEO name
    item.reprsnt ||            // Representative
    item.fundReprsnt ||        // Fund representative
    null;
```

#### **📊 Populated Fields:**
- `representative`: **대표펀드매니저** name ⭐ **KEY FIELD**
- `fund_name`: Fund name in Korean
- `fund_size`: Size in 원 (converted from 억원)
- `establishment_date`: Fund establishment date
- `expiry_date`: Fund expiry date
- `investment_detail`: Investment focus areas
- `company_id`: Linked VC company ID

### **VC Data Enhancements:**

#### **🏢 Enhanced Representative Extraction:**
The VC scraper extracts company representative information:

```javascript
// Representative extraction sources
const representative = 
    item.reprsntNm ||          // Representative name field
    item.operInstReprsntNm ||  // Operating institution representative
    item.ceoNm ||              // CEO name
    item.reprsnt ||            // Representative
    item.mngrNm ||             // Manager name
    null;
```

#### **💰 Operating Amount Accuracy:**
- Preserves original 억원 units from vcs.go.kr
- No unnecessary conversions
- Maintains data accuracy for AI analysis

#### **📊 Populated Fields:**
- `representative`: **대표** name ⭐ **KEY FIELD**
- `company_name`: Company name in Korean
- `operating_amount`: Operating amount in 억원
- `location`: Company location
- `established_date`: Company establishment date
- `website_url`: Company website
- `contact_info`: Structured contact data

---

## 📈 **Data Quality Tracking**

### **Real-time Quality Metrics:**
Both scrapers provide real-time data quality feedback:

```
📋 Fund Manager Data: 156/200 records (78.0%) have manager info
👤 Representative Data: 45/50 records (90.0%) have representative info
💰 Operating Amount Data: 48/50 records (96.0%) have operating amounts
```

### **Confidence Scoring:**
- **High Confidence**: Direct field extraction
- **Low Confidence**: Missing or inferred data

---

## 🔄 **Integration with OpenAI Interface**

### **Enhanced Fund Display:**
The comprehensive OpenAI interface now shows fund manager information:

```markdown
=== 💼 펀드 포트폴리오 ===
펀드명: 미래에셋 프라이빗 에쿼티 제3호
  규모: 2000 억원
  설립일: 2023-03-15
  👤 대표펀드매니저: 김철수
  투자분야: 중소/벤처일반
  만료일: 2028-03-14
```

### **Query Examples:**
```python
# Query fund manager information
analyzer.ask_comprehensive_question("미래에셋벤처투자의 대표펀드매니저는 누구인가요?")

# Query operating amounts with enhanced accuracy
analyzer.ask_comprehensive_question("스톤브릿지벤처스의 운용자산 규모는?")
```

---

## ⚙️ **Configuration Options**

### **Scraper Configuration:**
Each scraper can be configured via environment variables or direct modification:

```javascript
const SCRAPER_CONFIG = {
    maxPages: null,              // null = all pages
    startPage: 1,                // Starting page
    batchSize: 20,               // Records per batch  
    delayBetweenRequests: 100,   // ms delay between requests
    delayBetweenBatches: 300,    // ms delay between batches
    enableDetailedScraping: true // Enhanced data extraction
};
```

### **Performance Tuning:**

#### **For Speed:**
```bash
# Disable detailed scraping for faster execution
python run_supabase_fund_scraper.py --no-detailed-scraping --max-pages 10
```

#### **For Maximum Data Quality:**
```bash
# Enable all enhancements (default)
python run_supabase_fund_scraper.py
```

---

## 📊 **Expected Results**

### **Fund Table Results:**
- **Total Records**: ~3,000-4,000 funds
- **Manager Data Coverage**: 70-80% with representative names
- **Financial Data**: 95%+ with fund sizes
- **Investment Focus**: 90%+ with investment details

### **VC Table Results:**
- **Total Records**: ~700-800 VC companies  
- **Representative Data**: 85-90% with representative names
- **Operating Amounts**: 95%+ with operating amounts in 억원
- **Contact Info**: 80%+ with website URLs

---

## 🔧 **Troubleshooting**

### **Common Issues:**

#### **"Node.js not found"**
```bash
# Install Node.js (version 16+)
# Windows: Download from nodejs.org
# Mac: brew install node
# Linux: sudo apt install nodejs npm
```

#### **"Supabase connection error"**
- Verify service role key in scraper files
- Check network connectivity
- Ensure Supabase project is active

#### **"Low data quality"**
- Check if enhanced scraping is enabled
- Verify vcs.go.kr website accessibility
- Review rate limiting settings

### **Performance Issues:**
```bash
# Reduce batch size for slower connections
# Edit SCRAPER_CONFIG.batchSize in scraper files

# Increase delays for rate limiting
# Edit SCRAPER_CONFIG.delayBetweenRequests
```

---

## 📁 **File Structure**

```
📂 DIVA Intelligence System
├── 📂 archive/                     # Archived Airtable versions
│   ├── airtable_fund_scraper.js   # Old fund scraper
│   └── airtable_vc_scraper.js     # Old VC scraper
├── 📂 src/supabase/               # New Supabase scrapers
│   ├── package.json               # Node.js dependencies
│   ├── supabase_fund_scraper.js   # Enhanced fund scraper
│   └── supabase_vc_scraper.js     # Enhanced VC scraper
├── run_supabase_fund_scraper.py   # Python wrapper for funds
├── run_supabase_vc_scraper.py     # Python wrapper for VCs
└── comprehensive_vc_openai_interface.py # Updated AI interface
```

---

## 🎯 **Next Steps**

### **1. Test the Scrapers:**
```bash
# Quick test with limited pages
python run_supabase_fund_scraper.py --max-pages 2
python run_supabase_vc_scraper.py --max-pages 2
```

### **2. Verify Data Quality:**
```bash
# Check fund manager data in Supabase
python -c "
from comprehensive_vc_openai_interface import ComprehensiveVCAnalyzer
analyzer = ComprehensiveVCAnalyzer()
analyzer.ask_comprehensive_question('대표펀드매니저 정보가 있는 펀드들을 보여주세요')
"
```

### **3. Full Production Run:**
```bash
# Run complete scraping
python run_supabase_fund_scraper.py
python run_supabase_vc_scraper.py
```

---

## ✅ **Success Criteria**

### **✅ Fund Scraper Success:**
- [ ] Fund table populated with 3,000+ records
- [ ] 70%+ records have representative (대표펀드매니저) data
- [ ] 95%+ records have fund size data
- [ ] Investment details properly extracted

### **✅ VC Scraper Success:**
- [ ] VC table populated with 700+ records  
- [ ] 85%+ records have representative (대표) data
- [ ] 95%+ records have operating amount data
- [ ] Contact information properly structured

### **✅ Integration Success:**
- [ ] OpenAI interface displays fund manager names
- [ ] Representative information visible in queries
- [ ] Operating amounts accurate in 억원 units

---

## 🎉 **Benefits of New System**

### **🚀 Performance:**
- **Direct Supabase integration** (no migration needed)
- **Faster execution** with larger batch sizes
- **Real-time progress tracking**

### **📊 Data Quality:**
- **Enhanced field extraction** for key personnel data
- **Multiple fallback sources** for representative information
- **Comprehensive validation** and quality scoring

### **🔧 Maintainability:**
- **No Airtable dependency** (cost savings)
- **Modular architecture** with Python wrappers
- **Easy configuration** via command-line arguments

### **🎯 Accuracy:**
- **대표펀드매니저 data** now properly captured and displayed
- **Operating amounts** preserved in original 억원 units
- **Investment focus** areas properly categorized

**Ready to transform your VC data pipeline with enhanced accuracy! 🚀** 