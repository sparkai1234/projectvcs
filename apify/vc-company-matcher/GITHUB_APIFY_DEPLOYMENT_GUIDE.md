# 🚀 VC Company Matcher - GitHub-Apify Deployment Guide

## 🔍 Korean VC URL & Representative Matcher - Production Deployment

Your comprehensive **VC Company Matcher** is now **committed to GitHub** and ready for automatic deployment via GitHub-Apify sync!

### ✅ **Current Status:**
- **Repository:** https://github.com/sparkai1234/projectvcs
- **Branch:** master  
- **Actor Path:** `/apify/vc-company-matcher/`
- **Companies Ready:** 715 Korean VC companies
- **GitHub Push:** ✅ **COMPLETED** (Commit: 435a1ff)

---

## 🔧 **Step-by-Step Apify Setup:**

### 1. **Create New Actor in Apify Console**
1. Go to [Apify Console](https://console.apify.com)
2. Click **"Create new Actor"**
3. Choose **"Import from GitHub"**

### 2. **GitHub Integration Setup**
```
Repository: sparkai1234/projectvcs
Branch: master
Root directory: apify/vc-company-matcher
```

### 3. **Actor Configuration**
```
Name: VC-Company-Matcher
Title: 🔍 Korean VC Company URL & Representative Matcher
Description: Three-fold priority matcher for Korean VC URLs and 대표이사 info
Categories: BUSINESS, FINANCE, DATA_ANALYTICS, WEB_SCRAPING
```

### 4. **Environment Variables** (Add in Actor Settings)
```
SUPABASE_URL=https://udfgtccxbqmalgpqyxzz.supabase.co
SUPABASE_KEY=[Your Supabase Service Role Key]
```

### 5. **Build Configuration**
```
Dockerfile: Auto-detected
Base image: apify/actor-node-puppeteer-chrome:18
Memory: 1024 MB
Timeout: 7200 seconds (2 hours for 715 companies)
```

---

## 🎯 **Three-Fold Priority Process:**

### **1. 혁신의 숲 (InnoForest)** 🌲
- **Source:** [innoforest.co.kr](https://www.innoforest.co.kr/)
- **Purpose:** Basic company info + website URLs
- **Priority:** Foundation data (potentially outdated)

### **2. News Articles (최우선)** 📰
- **Source:** Naver News search
- **Purpose:** **CURRENT 대표이사 information**
- **Priority:** **HIGHEST** - overrides all other sources

### **3. Company Websites** 🌐
- **Source:** Team pages, 인사말 sections
- **Purpose:** Verification and fallback
- **Priority:** Secondary confirmation

---

## 📊 **Test Input for Initial Deployment:**

```json
{
  "vcCompanies": [
    "강원대학교기술지주회사",
    "강원창조경제혁신센터",
    "게이트웨이즈",
    "겟투",
    "경기창조경제혁신센터"
  ],
  "supabaseUrl": "https://udfgtccxbqmalgpqyxzz.supabase.co",
  "supabaseKey": "[Your Service Role Key]",
  "maxConcurrency": 1,
  "delayBetweenRequests": 3000,
  "maxCompanies": 5
}
```

## 🚀 **Production Input (Full 715 Companies):**

**Use the pre-generated input:**
```bash
# Already generated and ready:
vc_companies_apify_input.json (715 companies)
```

**Or regenerate:**
```bash
python prepare_vc_companies_for_apify.py "c:\Users\k\Downloads\VC LIst  - Sheet1.csv"
```

---

## 💾 **Supabase Integration:**

### **Target Table:** `vc_table`
### **Updated Fields:**
- `website_url` - Company official website
- `representative` - Current 대표이사/CEO info  
- `updated_at` - Processing timestamp

### **Update Logic:**
- Matches existing records by `company_name`
- Only updates records that already exist
- News sources take priority for representative info

---

## 🎛️ **Configuration Options:**

### **For Testing (5 companies):**
```json
{
  "maxCompanies": 5,
  "maxConcurrency": 1,
  "delayBetweenRequests": 5000
}
```

### **For Production (715 companies):**
```json
{
  "maxConcurrency": 2,
  "delayBetweenRequests": 3000,
  "maxCompanies": null
}
```

---

## 📈 **Expected Results:**

### **Success Metrics:**
- **Website URLs Found:** ~60-80% of companies
- **Representatives Found:** ~40-60% of companies  
- **Supabase Updates:** All found data automatically saved
- **Processing Time:** ~2-3 seconds per company

### **Output Format:**
```json
{
  "company_name": "카카오벤처스",
  "website_url": "https://www.kakaoventures.com",
  "representative": "대표이사 김철수",
  "representative_sources": ["News (최우선)"],
  "sources": ["InnoForest", "News (Priority)"],
  "processing_date": "2024-01-15T10:30:00.000Z"
}
```

---

## 🔐 **Security & Rate Limiting:**

### **Korean Site Optimization:**
- 3-5 second delays between requests
- Headless browsing for privacy
- Multiple encoding support (UTF-8, EUC-KR)
- Respectful scraping practices

### **Environment Security:**
- Store Supabase credentials as Actor secrets
- Never commit API keys to GitHub
- Use proper error handling

---

## 🚀 **Deployment Steps:**

### **1. Create Actor in Apify Console:**
1. Create new Actor from GitHub
2. Point to: `sparkai1234/projectvcs/apify/vc-company-matcher`
3. Add environment variables (SUPABASE_URL, SUPABASE_KEY)
4. Test with 5 companies first

### **2. Future Updates:**
```bash
# Make changes locally
git add apify/vc-company-matcher/
git commit -m "Update VC matcher logic"
git push origin master
# → Apify auto-deploys! ✨
```

### **3. Production Scaling:**
1. Test with `maxCompanies: 5`
2. Verify Supabase updates
3. Scale to `maxCompanies: 50` 
4. Finally process all 715 companies

---

## 🎉 **Ready for GitHub-Apify Deployment!**

Your **Korean VC Company Matcher** is now ready with:

- ✅ **GitHub-Apify sync** for professional deployment
- ✅ **Three-fold priority logic** with News articles priority
- ✅ **715 Korean VC companies** ready for processing
- ✅ **Supabase integration** for automatic data updates
- ✅ **Advanced pattern matching** for Korean 대표이사 extraction
- ✅ **Rate limiting** optimized for Korean websites
- ✅ **Comprehensive error handling** for production stability

**🔍 Your Korean VC intelligence enhancement system is production-ready!** 🚀

---

## 📞 **Next Steps:**

1. **Deploy to Apify** using GitHub import
2. **Test with 5 companies** first
3. **Verify Supabase updates** in your database
4. **Scale to full 715 companies**
5. **Schedule regular updates** for maintaining current data

**The most current 대표이사 information will always come from news sources!** 📰✨ 