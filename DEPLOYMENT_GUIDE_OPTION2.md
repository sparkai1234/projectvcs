# 🚀 VCS Option 2 Deployment Guide: Separate Schedules

## ✅ **COMPLETED STEPS**
- [x] SQL triggers installed in Supabase
- [x] Maintenance system tested locally (2 seconds, healthy database)
- [x] Maintenance actor created and pushed to GitHub

## 🎯 **NEXT STEPS: APIFY CONSOLE SETUP**

### **STEP 1: Create VCS Maintenance Actor**

1. **Go to Apify Console** → **Actors** → **Create New**
2. **Actor Name**: `vcs-maintenance`
3. **Source Type**: **Git Repository**
4. **Git URL**: `https://github.com/sparkai1234/projectvcs.git`
5. **Directory**: `apify/vcs-maintenance`
6. **Node.js Version**: `18` (recommended)

### **STEP 2: Configure Environment Variables**

**In the Maintenance Actor settings:**
- `SUPABASE_URL`: `https://udfgtccxbqmalgpqyxzz.supabase.co`
- `SUPABASE_KEY`: `your_service_role_key` (same as VCS scraper)

### **STEP 3: Test the Maintenance Actor**

**Run once manually with default input:**
```json
{
  "maintenanceType": "full",
  "cleanupDuplicates": true,
  "generateReport": true
}
```

**Expected Output:**
```
✅ 📊 Current Records: 718 VCs, 3675 Funds
✅ No duplicates detected
✅ Status: HEALTHY
🎉 VCS MAINTENANCE COMPLETED SUCCESSFULLY
```

### **STEP 4: Configure Schedules**

#### **A. Daily VCS Scraper Schedule**
1. **Go to Schedules** → **Create New Schedule**
2. **Name**: `VCS Daily Scraper`
3. **Actor**: Your existing VCS scraper
4. **Cron**: `0 17 * * *` (2:00 AM KST daily)
5. **Input**: 
   ```json
   {
     "updateMode": "incremental",
     "maxPages": 999,
     "dataSource": "both",
     "exportToSupabase": true,
     "testMode": false,
     "unlimitedExtraction": true
   }
   ```

#### **B. Daily Maintenance Schedule**
1. **Create New Schedule**
2. **Name**: `VCS Daily Maintenance`
3. **Actor**: `vcs-maintenance` (the one you just created)
4. **Cron**: `30 17 * * *` (2:30 AM KST daily - 30 min after scraper)
5. **Input**:
   ```json
   {
     "maintenanceType": "full",
     "cleanupDuplicates": true,
     "generateReport": true
   }
   ```

#### **C. Weekly Deep Maintenance Schedule**
1. **Create New Schedule**
2. **Name**: `VCS Weekly Deep Scan`
3. **Actor**: `vcs-maintenance`
4. **Cron**: `0 16 * * 0` (1:00 AM KST every Sunday)
5. **Input**:
   ```json
   {
     "maintenanceType": "weekly",
     "cleanupDuplicates": true,
     "generateReport": true
   }
   ```

### **STEP 5: Enable Notifications**

**For each schedule:**
1. **Go to Schedule Settings** → **Notifications**
2. **Enable**: Email notifications on failure
3. **Add your email** for alerts

---

## 📅 **FINAL SCHEDULE OVERVIEW**

```
🌅 DAILY OPERATION (Monday-Sunday)
├── 2:00 AM KST - VCS Data Scraping (30-35 mins)
├── 2:30 AM KST - Automated Maintenance (2-3 mins)
└── 3:00 AM KST - Ready for business day

🌟 WEEKLY OPERATION (Sundays)
├── 1:00 AM KST - Deep Maintenance Scan (5 mins)
├── 2:00 AM KST - VCS Data Scraping (30-35 mins)
├── 2:30 AM KST - Regular Maintenance (2-3 mins)
└── 3:00 AM KST - Weekly report ready
```

## 🎯 **SUCCESS CRITERIA**

**Daily Success Indicators:**
- ✅ VCS scraper completes (~4,400 records)
- ✅ Maintenance finds 0-2 duplicates
- ✅ All records have valid names
- ✅ Total time: ~35 minutes

**Weekly Success Indicators:**
- ✅ Deep scan finds minimal issues
- ✅ Database remains healthy
- ✅ Performance stays optimal
- ✅ Growth trends positive

## 🔧 **MAINTENANCE REPORTS**

**Access Maintenance Reports:**
1. **Go to Apify Console** → **Actors** → **vcs-maintenance**
2. **View recent runs** → **Storage** → **MAINTENANCE_REPORT**

**Report Contents:**
```json
{
  "success": true,
  "duration": 2,
  "totalRecords": 4393,
  "vcCount": 718,
  "fundCount": 3675,
  "duplicatesRemoved": 0,
  "recentActivity": {
    "vcs": 0,
    "funds": 0
  }
}
```

## 🎉 **ZERO-MAINTENANCE ACHIEVEMENT**

After setup, your system will:
- 🤖 **Automatically scrape** fresh Korean VC data daily
- 🧹 **Automatically maintain** database quality
- 📊 **Automatically generate** health reports
- 🚨 **Automatically alert** on any issues

**Your involvement**: Check weekly reports (5 minutes/week) 🚀 