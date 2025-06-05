# 🕐 VCS Scraper - Apify Cloud Scheduling Setup

## 🚀 **AUTOMATED SCHEDULING STRATEGY**

### **1. PRIMARY VCS SCRAPER SCHEDULE**
**Recommended**: Daily at 2 AM KST (Korean business hours consideration)

```
Cron Expression: 0 17 * * *  (UTC - 9 hours ahead of KST)
```

**Configuration in Apify Console:**
- Go to **Schedules** → **Create New Schedule**
- **Actor**: Your VCS Scraper
- **Input Configuration**:
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

### **2. AUTOMATED MAINTENANCE SYSTEM**

#### **Option A: Include in VCS Scraper (Recommended)**
Add maintenance to the end of your VCS scraper run:

**Modify main.js to include:**
```javascript
// At the end of successful scraping
if (exportToSupabase && supabaseClient) {
    console.log('🔧 Running post-scrape maintenance...');
    
    // Simple duplicate check
    const maintenanceResults = await runQuickMaintenance(supabaseClient);
    console.log('✅ Maintenance complete:', maintenanceResults);
}
```

#### **Option B: Separate Maintenance Schedule**
**Schedule**: 30 minutes after scraper (2:30 AM KST)
```
Cron Expression: 30 17 * * *
```

**Create separate Apify Actor for maintenance:**
- **Actor Name**: `vcs-maintenance`
- **Source**: Upload `scheduled_maintenance_system.js`
- **Environment Variables**: Same as VCS scraper

### **3. MONITORING & ALERTS**

#### **Weekly Health Check**
**Schedule**: Every Sunday at 1 AM KST
```
Cron Expression: 0 16 * * 0
```

**Purpose**: 
- Generate weekly reports
- Check long-term data trends
- Performance optimization

#### **Error Monitoring**
- **Apify Notifications**: Enable email alerts for failed runs
- **Custom Webhook**: Optional integration with Slack/Discord

### **4. BACKUP STRATEGY**

#### **Monthly Data Export**
**Schedule**: 1st of each month at 3 AM KST
```
Cron Expression: 0 18 1 * *
```

**Script**: Export full dataset to JSON/CSV for backup

---

## 🛠️ **MAINTENANCE REQUIREMENTS**

### **✅ AUTOMATIC (No Action Required)**
1. **Real-time Deduplication**: Triggers handle duplicates on insert
2. **Data Validation**: Built into scraper transformation functions  
3. **Rate Limiting**: Automatic delays prevent API overload
4. **Error Handling**: Graceful failure recovery

### **🔧 PERIODIC (Automated via Scheduling)**
1. **Database Health Checks**: Connection, record counts, freshness
2. **Duplicate Detection**: Weekly deep scans
3. **Data Quality Validation**: Missing fields, invalid data
4. **Performance Monitoring**: Query optimization

### **📊 MANUAL (Monthly Review)**
1. **Schedule Optimization**: Adjust timing based on Korean market hours
2. **Data Analysis**: Growth trends, market insights
3. **System Updates**: Apify actor version updates
4. **Capacity Planning**: Storage and performance scaling

---

## 🎯 **OPTIMAL SCHEDULE CONFIGURATION**

### **Daily Production Schedule**
```
📅 MONDAY - FRIDAY (Business Days)
🕐 2:00 AM KST - VCS Data Scraping
🕐 2:30 AM KST - Automated Maintenance  
🕐 3:00 AM KST - Health Check & Reporting

📅 SATURDAY - SUNDAY (Weekends)  
🕐 3:00 AM KST - VCS Data Scraping (reduced frequency)
🕐 3:30 AM KST - Weekly Deep Maintenance
```

### **Environment Variables Required**
```
SUPABASE_URL=https://udfgtccxbqmalgpqyxzz.supabase.co
SUPABASE_KEY=your_service_role_key
```

---

## 🚨 **MONITORING CHECKLIST**

### **Daily Monitoring (Automated)**
- [ ] Scraper completed successfully
- [ ] Data flowing to Supabase  
- [ ] No duplicate buildup
- [ ] All records have valid names

### **Weekly Review (5 minutes)**
- [ ] Check Apify run history
- [ ] Review data growth trends
- [ ] Verify schedule timing optimal
- [ ] Check error rates

### **Monthly Optimization (15 minutes)**
- [ ] Analyze market data patterns
- [ ] Optimize scraping schedules
- [ ] Review system performance
- [ ] Plan capacity scaling

---

## 🎉 **ZERO-MAINTENANCE OPERATION**

With this setup, your VCS intelligence platform will:
- ✅ **Automatically collect** fresh Korean VC data daily
- ✅ **Automatically clean** duplicates and maintain quality  
- ✅ **Automatically monitor** system health and performance
- ✅ **Automatically alert** on any issues

**Your role**: Simply review weekly reports and enjoy clean, up-to-date Korean VC intelligence! 🚀 