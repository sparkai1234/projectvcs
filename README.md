# 🚀 DIVA Intelligence System v2.0 - Enhanced Data Integrity

> **Korean VC & Fund Intelligence Platform with Enhanced 대표펀드매니저 Data Extraction**

## 📋 Overview

The DIVA Intelligence System is a comprehensive Korean venture capital and fund analysis platform that provides real-time data scraping, duplicate-free data integrity, and AI-powered insights for Korean VC ecosystem analysis.

### 🎯 **Latest v2.0 Features (Enhanced Data Integrity):**

- **🔒 Data Integrity**: Proper duplicate checking and handling for all scrapers
- **📊 Enhanced Fund Manager Data**: Comprehensive 대표펀드매니저 (Fund Manager Representative) extraction
- **🏢 Enhanced VC Data**: Improved 대표 (Company Representative) and operating amount extraction  
- **🤖 AI-Powered Analysis**: GPT-4 integration for comprehensive VC ecosystem insights
- **⚡ Direct Supabase Integration**: No Airtable dependency, faster performance
- **📈 Real-time Quality Metrics**: Live tracking of data extraction success rates

---

## 🏗️ **System Architecture**

```
vcs.go.kr (Korean VC Portal) 
    ↓
Enhanced Scrapers (Node.js)
    ↓  
Supabase Database (PostgreSQL)
    ↓
Comprehensive AI Interface (Python + OpenAI)
    ↓
Intelligent VC & Fund Analysis
```

---

## 🚀 **Quick Start**

### **1. Install Dependencies**
```bash
# Python dependencies
pip install supabase openai fuzzywuzzy python-levenshtein

# Node.js dependencies
cd src/supabase
npm install
```

### **2. Configure API Keys**
Update `api_config.py` with your keys:
- Supabase URL and Service Key
- OpenAI API Key

### **3. Run Enhanced Scrapers**
```bash
# Fund scraper with duplicate handling
python run_supabase_fund_scraper.py --max-pages 5

# VC scraper with duplicate handling  
python run_supabase_vc_scraper.py --max-pages 3
```

### **4. Start AI Analysis**
```bash
python comprehensive_vc_openai_interface.py
```

---

## 📊 **Current Database Status**

- **✅ VC Companies**: ~717 records with enhanced representative data
- **✅ Investment Funds**: ~3,700 records with 대표펀드매니저 information
- **✅ Contact Database**: 16,391 records with fuzzy matching
- **✅ Data Integrity**: Proper duplicate handling implemented

---

## 🔧 **Core Components**

### **Enhanced Scrapers (`src/supabase/`)**
- `supabase_fund_scraper.js` - Enhanced fund data with manager extraction
- `supabase_vc_scraper.js` - Enhanced VC data with representative extraction
- Both include comprehensive duplicate checking and data integrity

### **Python Interfaces**
- `comprehensive_vc_openai_interface.py` - Main AI analysis interface
- `run_supabase_fund_scraper.py` - Fund scraper wrapper
- `run_supabase_vc_scraper.py` - VC scraper wrapper

### **Configuration**
- `api_config.py` - API keys and database configuration
- `SUPABASE_SCRAPERS_GUIDE.md` - Comprehensive setup guide

---

## 🎯 **Key Features**

### **🔒 Data Integrity**
- **Duplicate Detection**: Uses unique identifiers (`fund_id`, `company_id`)
- **Smart Updates**: Only updates when new data is better than existing
- **Quality Tracking**: Real-time metrics for data extraction success

### **📊 Enhanced Data Extraction**
- **Fund Manager Data**: Multiple source extraction for 대표펀드매니저
- **VC Representative Data**: Comprehensive 대표 information extraction
- **Operating Amounts**: Accurate preservation in 억원 units
- **Investment Details**: Proper categorization and field mapping

### **🤖 AI-Powered Analysis**
- **Company Profiles**: Comprehensive VC company analysis
- **Fund Portfolios**: Detailed fund manager and investment focus analysis
- **Market Intelligence**: Investment trends and strategy insights
- **Korean Language**: Native Korean language processing and analysis

---

## 📈 **Data Quality Metrics**

### **Expected Results:**
- **Fund Manager Coverage**: 70-80% of funds have 대표펀드매니저 data
- **VC Representative Coverage**: 85-90% of companies have 대표 data  
- **Operating Amount Accuracy**: 95%+ coverage with correct 억원 values
- **Duplicate Prevention**: 100% unique records maintained

---

## 📂 **Project Structure**

```
📂 DIVA Intelligence System v2.0
├── 📂 src/supabase/           # Enhanced scrapers with data integrity
├── 📂 archive/                # Archived development files
│   ├── airtable_*.js         # Original Airtable scrapers  
│   ├── development/          # Development and test files
│   ├── migration_files/      # Database migration scripts
│   └── reports/              # Historical reports and data
├── 📂 docs/                  # Documentation
├── 📂 scripts/               # Utility scripts
├── comprehensive_vc_openai_interface.py  # Main AI interface
├── run_supabase_*_scraper.py # Scraper wrappers
├── api_config.py             # Configuration
└── SUPABASE_SCRAPERS_GUIDE.md # Setup guide
```

---

## 🔧 **Configuration Options**

### **Scraper Configuration:**
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

### **Usage Examples:**
```bash
# Quick test
python run_supabase_fund_scraper.py --max-pages 2

# Full production run
python run_supabase_fund_scraper.py

# No enhanced scraping (faster)
python run_supabase_fund_scraper.py --no-detailed-scraping
```

---

## 🎉 **Success Criteria**

### **✅ System Health Indicators:**
- [ ] Fund table: 3,000-4,000 unique records
- [ ] VC table: 700-800 unique companies
- [ ] 70%+ fund manager data coverage
- [ ] 85%+ VC representative data coverage
- [ ] Zero duplicate records
- [ ] AI interface displays enhanced data

---

## 📖 **Documentation**

- **`SUPABASE_SCRAPERS_GUIDE.md`** - Complete setup and usage guide
- **`GIT_COMMANDS.md`** - Git workflow for the project
- **`api_config.py`** - Configuration reference

---

## 🚀 **Getting Support**

For issues, questions, or contributions:
1. Check the comprehensive guides in the `docs/` folder
2. Review the `SUPABASE_SCRAPERS_GUIDE.md` for detailed setup
3. Examine the archived files for historical context

---

**Ready to analyze the Korean VC ecosystem with enhanced data integrity! 🎯** 