# 🔗 Fuzzy Company Matching Setup Guide

Link your **VC Table**, **Fund Table**, and **Contacts Table** using intelligent fuzzy matching!

## 🎯 What This Solves

**Your Goal**: *"I want to see what companies operated what funds and who are the people in my contact list work for those companies."*

**The Challenge**: Company names don't match exactly:
- VC Table: `"Samsung Venture Investment"`
- Contacts: `"삼성벤처투자"`

**The Solution**: Fuzzy matching with 80%+ accuracy!

## 🚀 Quick Setup (3 Steps)

### Step 1: Update API Key

Edit `fuzzy_company_matcher.py` line 160:

```python
API_KEY = "patOUfAsek4nbpvHm.49789..."  # ← Replace with your full API key
```

**Get your API key from**: https://airtable.com/create/tokens

### Step 2: Verify Table Names

Check these match your Airtable exactly (lines 167-172):

```python
"VC_TABLE": "VC Table",              # ← Your VC table name
"FUND_TABLE": "Fund Table",          # ← Your fund table name  
"CONTACTS_TABLE": "Contacts Table",  # ← Your contacts table name
"VC_COMPANY_FIELD": "Company Name",  # ← VC company field
"FUND_COMPANY_FIELD": "Company Name", # ← Fund company field
"CONTACTS_COMPANY_FIELD": "회사",     # ← Contact company field (Korean)
```

### Step 3: Run Analysis

```bash
python fuzzy_company_matcher.py
```

## 📊 Expected Results

### Console Output
```
🔗 Airtable Company Fuzzy Matcher
==================================================
📊 Fetching data from VC Table...
✅ Found 45 companies in VC Table
📊 Fetching data from Fund Table...
✅ Found 23 companies in Fund Table
📊 Fetching data from Contacts Table...
✅ Found 127 companies in Contacts Table

🔍 Starting fuzzy matching (threshold: 80%)...
✨ Match found: '삼성벤처투자' → 'Samsung Venture Investment' (95%)
✨ Match found: 'LG전자' → 'LG Electronics' (88%)
✨ Match found: '네이버' → 'Naver Corporation' (85%)

📋 SUMMARY
==============================
VC Companies: 45
Fund Companies: 23
Contact Companies: 127
Successful Matches: 34
Match Rate: 26.8%
```

### Generated Files

1. **`company_relationship_report.md`** - Human readable analysis
2. **`company_relationships.json`** - Structured data for automation

## 🎯 Understanding Your Results

### Match Quality Guide

| Score | Quality | Action |
|-------|---------|---------|
| 90-100% | Excellent | Auto-link with confidence |
| 80-89% | Good | Review briefly, likely correct |
| 70-79% | Fair | Manual verification needed |
| 60-69% | Poor | Probably incorrect |

### Sample Relationship Report

```markdown
# Company Relationship Analysis Report

## Samsung Venture Investment
- **VC Records**: 1
- **Fund Records**: 3  
- **Contact Matches**: 2
  - 삼성벤처투자 (95% match)
  - Samsung VI (88% match)

## LG Electronics  
- **VC Records**: 1
- **Fund Records**: 2
- **Contact Matches**: 1
  - LG전자 (88% match)
```

## ⚙️ Fine-Tuning

### If Match Rate is Too Low (< 20%)

Lower the threshold in `fuzzy_company_matcher.py`:

```python
THRESHOLD = 70  # Try 70% instead of 80%
```

### If Too Many False Matches

Raise the threshold:

```python
THRESHOLD = 85  # Try 85% instead of 80%
```

### Common Issues

**"API Key Error"**
- Ensure key starts with `pat`
- Check [Airtable permissions](https://airtable.com/appdR8V9lJaRW8VkR/tblZdnYYQxNfmN7lu/viwn8yWJohA3XtH3k?blocks=hide)

**"Table Not Found"**
- Verify exact table names (case sensitive)
- Check field names match exactly

**"No Data Found"**
- Ensure tables have data
- Check field names are correct

## 🔄 Using the Results

### Option 1: Manual Airtable Linking

1. Open `company_relationship_report.md`
2. For each high-confidence match (80%+):
   - Go to your Contacts record
   - Add linked record to VC/Fund tables
   - Use the matched company name

### Option 2: Automated Linking (Advanced)

Use the `company_relationships.json` file to:
- Create Airtable automation scripts
- Build custom linking workflows
- Generate relationship dashboards

## 🎉 Success Scenarios

### Scenario 1: Investment Network Analysis
```
Contact: 김철수 @ LG전자
→ Linked to: LG Electronics (88% match)
  ├── VC Records: 1 (LG investment division)
  └── Fund Records: 2 (LG Innovation Fund, LG Tech Ventures)
```

**Result**: You can now see all LG-related funds and know who to contact!

### Scenario 2: Fund-Company Relationships  
```
Company: Samsung Venture Investment
├── Fund Records: 3 (Samsung Catalyst Fund, Samsung NEXT, Samsung Ventures)
└── Contact Matches: 2 (삼성벤처투자, Samsung VI)
```

**Result**: Complete view of Samsung's fund ecosystem + your contacts!

## 🔧 Advanced Customization

### Custom Preprocessing

Add to `fuzzy_company_matcher.py` to improve matching:

```python
def preprocess_company_name(name):
    # Remove common words that cause confusion
    remove_words = ['Corporation', '주식회사', 'Co.', 'Ltd', 'Inc']
    for word in remove_words:
        name = name.replace(word, '').strip()
    return name
```

### Industry-Specific Rules

```python
# Add manual overrides for known variations
MANUAL_MAPPINGS = {
    "네이버": "Naver Corporation",
    "카카오": "Kakao Corp",
    "삼성": "Samsung"
}
```

---

## 🚀 Next Steps

1. **Run the analysis** with your data
2. **Review the matches** in the report
3. **Adjust threshold** if needed
4. **Create Airtable links** for high-confidence matches
5. **Set up automation** for new data

**Perfect for building your Korean VC ecosystem network! 🇰🇷** 