# 🚀 **DIVA Scraper v2.0 - Apify Cloud Deployment Guide**

## 🇰🇷 **Enhanced Korean Financial Intelligence Deployment**

This guide walks you through deploying the **Enhanced DIVA Scraper v2.0** to Apify Cloud using GitHub integration, based on the successful VCS v2.2.7 deployment.

---

## 📋 **PREREQUISITES**

✅ **GitHub Repository**: https://github.com/sparkai1234/projectvcs.git  
✅ **Apify Account**: https://console.apify.com  
✅ **Supabase Database**: Korean financial intelligence tables ready  
✅ **DIVA System v2.0**: Successfully pushed to GitHub master branch  

---

## 🚀 **STEP-BY-STEP DEPLOYMENT**

### **Step 1: Create New Actor on Apify**

1. **Navigate to Apify Console**: https://console.apify.com/actors
2. **Click "Create Actor"**
3. **Enter Actor Details**:
   ```
   Actor Name: enhanced-diva-intelligence-scraper-v2
   Title: 🇰🇷 Enhanced DIVA Intelligence Scraper v2.0
   Description: Enhanced Korean DIVA Financial Intelligence Scraper with Smart Conflict Resolution
   ```

### **Step 2: Configure GitHub Integration**

1. **Go to "Source" Tab**
2. **Select "Git repository"**
3. **Configure Repository Settings**:
   ```
   Git URL: https://github.com/sparkai1234/projectvcs.git
   Branch: master
   Directory: apify/diva-scraper
   Build Command: npm install
   Start Command: npm start
   ```

### **Step 3: Set Environment Variables**

1. **Go to "Environment Variables" Tab**
2. **Add Required Variables**:
   ```
   SUPABASE_URL=https://bvjbcgfprkhluhsxrxmr.supabase.co
   SUPABASE_SERVICE_ROLE_KEY=your-service-role-key-here
   ```

### **Step 4: Configure Actor Settings**

1. **Go to "Settings" Tab**
2. **Configure Timeout & Memory**:
   ```
   Timeout: 7200 seconds (2 hours)
   Memory: 8192 MB (8 GB)
   Build timeout: 600 seconds
   ```

### **Step 5: Configure Input Schema**

1. **Go to "Input Schema" Tab**
2. **Copy content from**: `INPUT_SCHEMA_V2.json`
3. **Or use the enhanced schema with v2.0 features**

---

## 🧪 **TESTING CONFIGURATIONS**

### **Test Configuration 1: Limited Test Run**
```json
{
    "updateMode": "incremental",
    "maxPages": 5,
    "dataSource": "investment_performance",
    "exportToSupabase": true,
    "testMode": true,
    "unlimitedExtraction": false,
    "delay": 3000,
    "headless": true
}
```

### **Test Configuration 2: Single Data Source**
```json
{
    "updateMode": "incremental",
    "maxPages": 10,
    "dataSource": "financial_statements",
    "exportToSupabase": true,
    "testMode": false,
    "unlimitedExtraction": false,
    "delay": 3000,
    "headless": true
}
```

### **Production Configuration: Full Intelligence**
```json
{
    "updateMode": "incremental",
    "maxPages": 999,
    "dataSource": "all",
    "exportToSupabase": true,
    "testMode": false,
    "unlimitedExtraction": true,
    "delay": 3000,
    "headless": true
}
```

---

## 🔧 **DEPLOYMENT VERIFICATION**

### **Step 1: Build Verification**
1. **Trigger Build** from GitHub sync
2. **Check Build Logs** for Korean locale support
3. **Verify Dependencies** installation

### **Step 2: Test Run**
1. **Start Test Run** with limited configuration
2. **Monitor Logs** for Korean portal connection
3. **Verify Supabase** data insertion

### **Step 3: Production Validation**
1. **Check Data Quality** in Supabase tables
2. **Verify Korean Text** processing accuracy
3. **Confirm Smart Conflict Resolution** functionality

---

## 📊 **EXPECTED SUPABASE TABLES**

The scraper will populate these tables:

| Table Name | Primary Purpose | Key Fields |
|------------|-----------------|------------|
| `diva_investment_performance_raw` | VC Investment Data | company_name, investment_date, amount |
| `diva_financial_statements_raw` | Company Financials | company_name, reporting_year, metrics |
| `diva_association_status_raw` | KVCA Membership | company_name, status, membership_date |
| `diva_personnel_status_raw` | Team Information | company_name, headcount, composition |
| `diva_professional_personnel_raw` | Expert Staff | company_name, expert_count, certifications |
| `diva_violations_raw` | Compliance Issues | company_name, violation_type, date |
| `diva_vc_map_raw` | Geographic Data | company_name, location, network_data |
| `diva_statistics_raw` | Market Statistics | data_type, period, metrics |

---

## 🎯 **PRODUCTION SCHEDULING**

### **Recommended Schedule**
```
📅 KOREAN FINANCIAL INTELLIGENCE PIPELINE:

SUNDAY SCHEDULE (KST):
├── 07:00 AM: VCS Scraper v2.2.7 (90 min)
├── 08:30 AM: VCS Maintenance v2.0 (13 sec)  
├── 09:00 AM: DIVA Scraper v2.0 (90 min) ← NEW
└── 10:30 AM: DIVA Maintenance v2.0 (13 sec) ← NEW
```

### **Automation Setup**
1. **Create Scheduled Task** on Apify
2. **Set Weekly Trigger**: Every Sunday 9:00 AM KST
3. **Use Production Configuration** (unlimited extraction)
4. **Enable Email Notifications** for completion/errors

---

## 🛡️ **SECURITY CONSIDERATIONS**

### **Environment Variables**
- **Never commit** Supabase keys to GitHub
- **Use Apify secrets** for sensitive credentials
- **Rotate keys** regularly for security

### **Rate Limiting**
- **3-second delays** for Korean portal stability
- **Single concurrency** to avoid blocking
- **Korean locale support** for text processing

---

## 📈 **MONITORING & ALERTING**

### **Key Metrics to Monitor**
- **Extraction Success Rate**: Should be >95%
- **Korean Text Processing**: Verify encoding accuracy
- **Supabase Insertion Rate**: Monitor conflicts resolution
- **Runtime Duration**: Should complete within 90 minutes

### **Alert Conditions**
- **Actor failure** or timeout
- **Supabase connection** errors
- **Korean text encoding** issues
- **Data quality** degradation

---

## 🎉 **SUCCESS CRITERIA**

✅ **Actor builds successfully** from GitHub  
✅ **Korean portal access** working  
✅ **Supabase data insertion** with smart conflict resolution  
✅ **Korean text processing** accurate  
✅ **Production run** completes within 90 minutes  
✅ **Data quality metrics** meet standards  

---

## 🚨 **TROUBLESHOOTING**

### **Common Issues & Solutions**

#### **Build Failures**
```bash
# Check package.json dependencies
# Verify GitHub sync configuration
# Review build logs for Korean locale issues
```

#### **Korean Portal Access Issues**
```bash
# Increase request delays (5000ms)
# Verify Korean locale environment variables
# Check browser launch arguments
```

#### **Supabase Connection Problems**
```bash
# Verify environment variables
# Check service role key permissions
# Review table schemas match expected format
```

#### **Korean Text Encoding Problems**
```bash
# Verify UTF-8 encoding settings
# Check Korean locale configuration
# Review text processing functions
```

---

## 📞 **SUPPORT CONTACTS**

- **Technical Issues**: SparkAI DIVA Intelligence Team
- **Apify Platform**: Apify Support (support@apify.com)
- **Supabase Database**: Supabase Support
- **GitHub Repository**: https://github.com/sparkai1234/projectvcs

---

## 🎯 **NEXT STEPS AFTER DEPLOYMENT**

1. **Deploy DIVA Maintenance System v2.0**
2. **Setup Weekly Automation Schedule**
3. **Configure Email Reporting**
4. **Launch Unified Dashboard**
5. **Monitor Production Performance**

---

*🇰🇷 Enhanced DIVA Scraper v2.0 - Ready for Korean Financial Intelligence Production* 