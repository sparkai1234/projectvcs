# 🔗 Company Relationship Analyzer

Fuzzy matching system to link companies across your **VC Table**, **Fund Table**, and **Contacts Table** in Airtable.

## 🎯 What This Does

Creates intelligent relationships between:
- **VC Companies** (Company Name field)  
- **Fund Companies** (Company Name field)
- **Contact Companies** (회사 field)

**Example Results:**
```
✨ Match found: 'ABC벤처파트너스' → 'ABC Venture Partners' (95%)
✨ Match found: '삼성SDS' → 'Samsung SDS' (88%)
✨ Match found: 'LG전자' → 'LG Electronics' (92%)
```

## 🚀 Quick Start

### 1. Install Dependencies

```bash
pip install -r requirements.txt
```

### 2. Configure Your Settings

Edit `config.py` with your Airtable details:

```python
AIRTABLE_CONFIG = {
    "API_KEY": "patYourActualAPIKey123...",  # ← Replace this
    "BASE_ID": "appdR8V9lJaRW8VkR",        # ← Should be correct
    "FUZZY_THRESHOLD": 80,                  # ← Adjust if needed
    # ... other settings
}
```

### 3. Run Analysis

```bash
python run_fuzzy_matcher.py
```

## 📊 Understanding Results

### Match Quality Thresholds

| Threshold | Match Quality | Use Case |
|-----------|---------------|----------|
| 90-100% | Excellent | High confidence matches |
| 80-89% | Good | Most reliable for linking |
| 70-79% | Fair | Review manually |
| 60-69% | Poor | Requires verification |

### Output Files

1. **`company_relationship_report.md`** - Human-readable analysis
2. **`company_relationships.json`** - Structured data for processing

## 🎯 Use Cases

### Scenario 1: Fund Analysis
*"Which companies operated which funds?"*

```
Company: Samsung Venture Investment
├── VC Records: 1 
├── Fund Records: 3
└── Contact Matches: 2
    ├── 삼성벤처투자 (95% match)
    └── Samsung VI (88% match)
```

### Scenario 2: Contact Network
*"Who do I know at companies that operate funds?"*

```
Contact: 김철수 @ LG전자
→ Matched to: LG Electronics (92%)
  ├── VC Records: 1 (LG investment arm)
  └── Fund Records: 2 (LG Innovation Fund, LG Tech Fund)
```

## ⚙️ Configuration Options

### Fuzzy Matching Settings

```python
# In config.py
"FUZZY_THRESHOLD": 80,        # Minimum similarity (60-90 recommended)
"MAX_MATCHES_PER_CONTACT": 1, # Matches per contact company
```

### Table & Field Names

**Must match your Airtable exactly:**

```python
"VC_TABLE": "VC Table",              # Your VC table name
"FUND_TABLE": "Fund Table",          # Your fund table name  
"CONTACTS_TABLE": "Contacts Table",  # Your contacts table name

"VC_COMPANY_FIELD": "Company Name",     # VC company field
"FUND_COMPANY_FIELD": "Company Name",   # Fund company field
"CONTACTS_COMPANY_FIELD": "회사",       # Contact company field
```

## 🔧 Troubleshooting

### Common Issues

**"API Key Error"**
- Ensure API key starts with `pat`
- Check permissions in Airtable
- Verify base access

**"No Matches Found"** 
- Lower threshold (try 70 or 60)
- Check field names match exactly
- Verify data exists in tables

**"Field Not Found"**
- Double-check table names
- Verify field names are exact
- Check for typos in Korean characters

### Performance Tips

**Large Datasets:**
- Start with threshold 85+ 
- Process in smaller batches
- Monitor API rate limits

**Low Match Rates:**
- Try threshold 70-75
- Check for name variations
- Consider company name standardization

## 📈 Sample Output

```
🔗 Company Relationship Analyzer
==================================================
📊 Configuration:
   Base ID: appdR8V9lJaRW8VkR
   Fuzzy Threshold: 80%
   Tables: VC Table, Fund Table, Contacts Table

🎯 ANALYSIS RESULTS
========================================
📈 Companies Found:
   VC Companies: 45
   Fund Companies: 23
   Contact Companies: 127

🔗 Matching Results:
   Successful Matches: 34
   Match Rate: 26.8%

✨ Sample Matches:
   1. 'ABC벤처파트너스' → 'ABC Venture Partners' (95%)
   2. '삼성SDS' → 'Samsung SDS' (88%)
   3. 'LG전자' → 'LG Electronics' (92%)
   4. '네이버' → 'NAVER Corporation' (85%)
   5. '카카오' → 'Kakao Corp' (91%)
```

## 🚀 Next Steps

1. **Review Results**: Check `company_relationship_report.md`
2. **Verify Matches**: Ensure fuzzy matches are accurate  
3. **Adjust Threshold**: Fine-tune in `config.py`
4. **Create Links**: Use results to build Airtable relationships
5. **Automate**: Set up regular matching for new data

## 📝 Advanced Usage

### Custom Matching Logic

You can modify `fuzzy_company_matcher.py` to:
- Add custom preprocessing (remove common words)
- Implement industry-specific matching
- Add manual override rules
- Include additional matching algorithms

### Integration with Airtable Automations

Use the JSON output to trigger Airtable automations that:
- Create linked records automatically
- Send notifications for high-confidence matches
- Generate relationship reports

---

## 🤝 Support

Having issues? Check:
1. Your API key has correct permissions
2. Table/field names match exactly  
3. Python dependencies are installed
4. Threshold settings are appropriate

**Perfect for Korean VC ecosystem data analysis!** 🇰🇷 