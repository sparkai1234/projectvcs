# 🚀 **APIFY SETUP GUIDE** - Deploy Your VCS Scraper

## 🎯 **QUICK DEPLOYMENT (10 MINUTES)**

### **Step 1: Prepare Actor Files**
```bash
# 1. Zip the apify/vcs-scraper directory
cd apify/vcs-scraper
zip -r korean-vcs-scraper.zip . 

# Files included:
# ├── main.js (main scraper logic)
# ├── package.json (dependencies)
# └── INPUT_SCHEMA.json (UI form configuration)
```

### **Step 2: Deploy to Apify Console**

1. **Go to [Apify Console](https://console.apify.com)**
2. **Click "Create New" → "Actor"**
3. **Upload your zip file** or copy-paste the code
4. **Name**: `korean-vc-vcs-scraper`
5. **Click "Build & Run"**

### **Step 3: Configure Weekly Schedule (UI-Based)**

**🎛️ IN APIFY CONSOLE (NO CODE NEEDED):**

1. **Click "Schedules" tab**
2. **Click "Create Schedule"**
3. **Fill out the form:**
   ```
   Name: VCS Weekly Update
   Cron Expression: 0 6 * * 0  (Sundays 6 AM)
   Timezone: Asia/Seoul
   ```
4. **Click "Save"**

**That's it! No YAML editing, no code deployment!**

---

## 🎯 **UI-BASED PARAMETER MANAGEMENT**

### **INSTEAD OF CODE EDITING:**

**❌ GitHub Actions Way:**
```yaml
# Edit this every time you want to change settings:
env:
  MAX_PAGES: 100
  UPDATE_MODE: incremental
  DATA_SOURCE: both
```

**✅ Apify Console Way:**
1. **Go to Actor → Input tab**
2. **Use dropdown menus:**
   - 📊 Update Mode: [Full Scrape ▼]
   - 🎯 Data Source: [Both ▼] 
   - 📄 Max Pages: [100]
   - 📧 Notifications: [✓]
3. **Click "Save & Start"**

---

## 📅 **OPTIMAL WEEKLY SCHEDULE**

### **RECOMMENDED APIFY SCHEDULES:**

#### **VCS Scraper (Primary)**
```
Schedule Name: VCS Weekly Data Update
Cron: 0 6 * * 0 (Sundays 6:00 AM KST)
Actor: korean-vc-vcs-scraper
Input: {
  "updateMode": "incremental",
  "dataSource": "both", 
  "maxPages": 100,
  "notifyOnCompletion": true
}
```

#### **DIVA Scraper (Coming Next Week)**
```
Schedule Name: DIVA Weekly Financial Data
Cron: 0 8 * * 3 (Wednesdays 8:00 AM KST)
Actor: korean-vc-diva-scraper
Input: {
  "dataTypes": ["investments", "violations", "reports"],
  "notifyOnCompletion": true
}
```

#### **Government Data (Coming Week 3)**
```
Schedule Name: Government Weekly Data
Cron: 0 7 * * 5 (Fridays 7:00 AM KST)
Actor: korean-vc-government-scraper  
Input: {
  "sources": ["kgrowth", "kdb", "kvic"],
  "notifyOnCompletion": true
}
```

---

## 🎛️ **APIFY CONSOLE ADVANTAGES**

### **🌟 UI FEATURES YOU'LL LOVE:**

#### **📊 Visual Dashboard:**
- **Real-time run monitoring** with progress bars
- **Visual charts** of data scraped over time
- **Performance metrics** (duration, success rate)
- **Data preview** with searchable interface

#### **⚙️ Easy Configuration:**
- **Point-and-click scheduling** (no cron expressions to memorize)
- **Dropdown parameter selection** (no typing required)
- **Instant parameter changes** (no code deployment)
- **One-click manual triggers** (test anytime)

#### **📧 Professional Notifications:**
- **Email alerts** on completion/failure
- **Slack integration** for team notifications
- **Webhook support** for custom integrations
- **SMS alerts** for critical failures

#### **💾 Data Management:**
- **Organized datasets** with automatic storage
- **API access** to all your scraped data
- **Multiple export formats** (JSON, CSV, Excel)
- **Data retention policies** (automatic cleanup)

---

## 🔧 **CONFIGURATION EXAMPLES**

### **FOR TESTING (FIRST TIME):**
```json
{
  "updateMode": "incremental",
  "dataSource": "investors", 
  "maxPages": 5,
  "notifyOnCompletion": true,
  "exportToSupabase": false
}
```

### **FOR PRODUCTION (WEEKLY RUNS):**
```json
{
  "updateMode": "incremental",
  "dataSource": "both",
  "maxPages": 100, 
  "notifyOnCompletion": true,
  "exportToSupabase": true,
  "supabaseUrl": "https://your-project.supabase.co",
  "supabaseKey": "your-service-role-key"
}
```

### **FOR MONTHLY FULL REFRESH:**
```json
{
  "updateMode": "full",
  "dataSource": "both",
  "maxPages": 500,
  "notifyOnCompletion": true,
  "exportToSupabase": true
}
```

---

## 📊 **MONITORING & ALERTS**

### **APIFY WILL AUTOMATICALLY:**
- **📈 Track performance** (duration, records scraped)
- **🚨 Send alerts** on failures or anomalies
- **📊 Generate reports** on data quality
- **🔄 Retry failures** with exponential backoff
- **📱 Mobile notifications** via Apify mobile app

### **DASHBOARD FEATURES:**
```
📊 Real-time Metrics:
├── ✅ Successful runs: 47/50 (94%)
├── ⏱️ Average duration: 3.2 minutes  
├── 📈 Records per run: ~4,400
├── 🎯 Data quality: 99.8%
└── 📅 Next run: Sunday 6:00 AM KST
```

---

## 🎯 **NEXT STEPS:**

### **TODAY:**
1. **📤 Deploy VCS actor** to Apify (10 minutes)
2. **⚙️ Set weekly schedule** via UI (2 minutes)
3. **🧪 Test with small dataset** (5 minutes)

### **THIS WEEKEND:**
1. **🔄 First automated Sunday run** 
2. **📊 Monitor dashboard** for success
3. **📧 Verify notifications** work

### **NEXT WEEK:**
1. **📈 Add DIVA scraper** for financial data
2. **🎛️ Configure Wednesday schedule**
3. **🔗 Integrate with existing workflows**

**Your Korean VC Intelligence Platform will run itself while you focus on analysis! 🇰🇷⚡** 