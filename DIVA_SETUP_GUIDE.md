# 🚀 DIVA Personnel Data Scraper Setup Guide

## 🎯 What This Does

This toolkit extracts **investment portfolio and personnel data** from the DIVA portal and integrates it with your existing Airtable VC intelligence platform.

### **Data Extracted:**
- **Company Names** & IDs
- **Total Personnel** counts
- **Professional Staff** numbers
- **Investment Review Staff**
- **Management Staff**
- **Calculated Ratios** (professional %, management %, etc.)

### **Value to Your VC Portal:**
- Portfolio performance analytics
- Company staffing insights
- Investment capacity analysis
- Professional expertise mapping

## 📦 Installation

### 1. **Install Dependencies**
```bash
pip install -r diva_requirements.txt
```

### 2. **Set Environment Variables**
```bash
# Windows PowerShell
$env:AIRTABLE_API_KEY="your_airtable_api_key_here"
$env:AIRTABLE_BASE_ID="appdR8V9lJaRW8VkR"

# Linux/Mac
export AIRTABLE_API_KEY="your_airtable_api_key_here"
export AIRTABLE_BASE_ID="appdR8V9lJaRW8VkR"
```

## 🧪 Quick Test

### **Test the Scraper (No Airtable needed)**
```bash
python run_diva_scraper.py
```

This will:
- Extract data from first 2 pages
- Save to JSON and CSV files
- Show summary statistics
- Verify the scraper works

**Expected Output:**
```
🚀 DIVA Personnel Data Scraper - Test Run
📊 Testing scraper with first 2 pages...
✅ TEST RESULTS:
📈 Companies extracted: 10
👥 Total personnel: 87
📊 Average company size: 8.7
🏢 Largest company: 그래비티벤처스
💾 Data saved to: test_diva_data.json
```

## 🔄 Full Integration

### **Run Complete Scraping + Airtable Upload**
```bash
python diva_to_airtable.py
```

This will:
1. **Scrape all 51+ pages** from DIVA portal
2. **Create "Personnel Data" table** in Airtable
3. **Upload all personnel records**
4. **Link with existing VC companies**
5. **Generate summary report**

## 📊 What Gets Created in Airtable

### **New Table: "Personnel Data"**
```
Fields:
├── Company Name (Text)
├── Company ID (Text) 
├── Total Personnel (Number)
├── Professional Staff (Number)
├── Investment Review Staff (Number)
├── Management Staff (Number)
├── Professional Percentage (Formula)
├── Investment Review Percentage (Formula)
├── Management Percentage (Formula)
├── Linked VC Companies (Link to VC Table)
├── Reference Year Month (Text)
├── Data Source (Text)
├── Last Updated (Date)
└── DIVA URL (URL)
```

### **Auto-Generated Analytics**
- **Professional ratios** by company
- **Investment capacity** metrics
- **Management involvement** scores
- **Company size** comparisons

## 🔗 Linking with Existing Data

The system automatically:

1. **Matches company names** between Personnel Data and VC Table
2. **Uses fuzzy matching** for variations in naming
3. **Creates linked records** for relationship analysis
4. **Enables cross-table filtering** and views

### **Matching Examples:**
```
Personnel Data        → VC Table
"경남벤처투자"         → "경남벤처투자"    ✅ Exact match
"골든오크벤처스"        → "Golden Oak"    ✅ Fuzzy match  
"그래비티벤처스"        → "Gravity VC"    ✅ Fuzzy match
```

## 📈 Usage Examples

### **1. Find Most Professional VC Teams**
Filter by "Professional Percentage" > 80%

### **2. Investment Capacity Analysis**
Sort by "Investment Review Staff" to find most capable teams

### **3. Management Involvement Metrics**
Compare "Management Staff" ratios across portfolio companies

### **4. Company Size vs Performance**
Cross-reference "Total Personnel" with fund performance data

## ⚙️ Configuration Options

### **Modify Scraping Parameters**
In `diva_to_airtable.py`:
```python
personnel_data = scraper.scrape_all_pages(
    year_month="2025-04",     # Target month
    max_pages=51,             # All pages (51+ total)
    delay=2                   # Delay between requests
)
```

### **Update Field Mappings**
Modify the field mapping in the `upload_personnel_data()` function to change how data maps to Airtable.

## 🔄 Automation Setup

### **Weekly Updates**
Set up a scheduled task to run:
```bash
python diva_to_airtable.py
```

### **Monthly Reports**
The system generates summary reports automatically:
```
📊 DIVA PERSONNEL DATA SUMMARY REPORT
=====================================
📈 Overall Statistics:
   • Total Companies: 255
   • Total Personnel: 2,847
   • Average Company Size: 11.2
   • Linked to VC Records: 89 (87.3%)
```

## 🚨 Troubleshooting

### **Common Issues:**

#### **"No data extracted"**
- Check internet connection
- Verify DIVA portal is accessible
- Try reducing `max_pages` for testing

#### **"Airtable API Error"**
- Verify API key is correct
- Check base ID matches your workspace
- Ensure table permissions allow creation

#### **"Import Error"**
- Run: `pip install -r diva_requirements.txt`
- Check Python version (3.7+ required)

### **Debug Mode:**
Add this to enable detailed logging:
```python
import logging
logging.basicConfig(level=logging.DEBUG)
```

## 📊 Expected Results

### **Sample Companies Data:**
```
경남벤처투자:      11 total, 6 professional (54.5%)
골든오크벤처스:     6 total, 3 professional (50.0%)
그래비티벤처스:    12 total, 5 professional (41.7%)
글로넷벤처파트너스:  5 total, 2 professional (40.0%)
```

### **Portfolio Analytics:**
- **255+ VC companies** with personnel data
- **2,800+ total staff** across ecosystem
- **Professional staff ratios** for expertise analysis
- **Investment capacity** metrics for deal flow

## 🎯 Integration with Existing VC Portal

This DIVA data enhances your existing platform by adding:

1. **Personnel Analytics** to company profiles
2. **Investment Capacity** metrics for deal sourcing
3. **Professional Expertise** mapping for partnerships
4. **Organizational Structure** insights for due diligence

## 🔮 Future Enhancements

1. **Real-time Monitoring** for personnel changes
2. **Historical Tracking** of team growth
3. **Performance Correlation** with staffing levels
4. **AI-Powered Insights** on optimal team structures

---

## 🚀 Quick Start Commands

```bash
# 1. Install
pip install -r diva_requirements.txt

# 2. Test
python run_diva_scraper.py

# 3. Set API key
$env:AIRTABLE_API_KEY="your_key_here"

# 4. Full integration
python diva_to_airtable.py
```

**Your VC intelligence platform just got a major upgrade!** 🎉 