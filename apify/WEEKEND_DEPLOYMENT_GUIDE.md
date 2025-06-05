# 🚀 **WEEKEND DEPLOYMENT - VCS APIFY ACTOR**

## ⏰ **TIMELINE: DEPLOY THIS WEEKEND FOR SUNDAY RUN**

### **🎯 SATURDAY AFTERNOON (2 HOURS MAX):**

---

## 📤 **STEP 1: DEPLOY TO APIFY CONSOLE**

### **Quick Upload Method:**

1. **Go to [Apify Console](https://console.apify.com/actors)**
2. **Click "Create New Actor"**
3. **Choose "Start from scratch"**
4. **Name**: `korean-vc-vcs-scraper`
5. **Copy-paste these files:**

#### **📄 main.js**
```
Copy from: apify/vcs-scraper/main.js
→ Paste into Apify Console main.js tab
```

#### **📦 package.json**
```
Copy from: apify/vcs-scraper/package.json  
→ Paste into Apify Console package.json tab
```

#### **🎛️ INPUT_SCHEMA.json**
```
Copy from: apify/vcs-scraper/INPUT_SCHEMA.json
→ Paste into Apify Console Input Schema tab
```

6. **Click "Build"** (takes ~2 minutes)
7. **Wait for "Build succeeded" ✅**

---

## ⚙️ **STEP 2: CONFIGURE FIRST TEST RUN**

### **Input Configuration:**

**In Apify Console → Input tab:**

```json
{
  "updateMode": "incremental",
  "dataSource": "investors",
  "maxPages": 5,
  "notifyOnCompletion": true,
  "exportToSupabase": false
}
```

**Why these settings:**
- `"investors"` only = faster test (~2 minutes)
- `maxPages: 5` = small dataset (~50 records)
- `exportToSupabase: false` = test scraping only

### **Click "Start" and Monitor:**

```
🕐 Expected test duration: 2-3 minutes
📊 Expected results: ~50 investor records
✅ Success indicator: "VCS WEEKLY SCRAPING COMPLETED"
```

---

## 📅 **STEP 3: SET UP WEEKLY SCHEDULE**

### **After Successful Test:**

1. **Click "Schedules" tab**
2. **Click "Create Schedule"**
3. **Fill form:**

```
Schedule Name: VCS Weekly Data Update
Description: Korean VCS data - every Sunday 6 AM KST
Cron Expression: 0 6 * * 0
Timezone: Asia/Seoul
Actor: korean-vc-vcs-scraper
```

4. **Input for Production Runs:**

```json
{
  "updateMode": "incremental",
  "dataSource": "both",
  "maxPages": 100,
  "notifyOnCompletion": true,
  "exportToSupabase": true,
  "supabaseUrl": "YOUR_SUPABASE_URL",
  "supabaseKey": "YOUR_SERVICE_ROLE_KEY"
}
```

5. **Click "Save Schedule"**

---

## 🎉 **STEP 4: FIRST AUTOMATED RUN (SUNDAY)**

### **What Will Happen:**
```
📅 Sunday June 8, 2025 at 6:00 AM KST:
├── 🚀 Apify automatically starts VCS scraper
├── 📊 Scrapes both investors & funds (~4,400 records)
├── 💾 Saves data to Apify dataset  
├── 📤 Exports to your Supabase database
├── 📧 Sends you completion email
└── ⏱️ Total duration: ~5-8 minutes
```

### **You'll Get Email Notification:**
```
✅ VCS Weekly Scraper - SUCCESS
📊 Total records: 4,406
👥 Investors: 717
💰 Funds: 3,689
⏱️ Duration: 6.2 minutes
🔗 View details: [Apify Console Link]
```

---

## 📊 **MONITORING YOUR NEW PLATFORM**

### **📱 Apify Mobile App (Recommended):**
- Download from App Store/Play Store
- Get push notifications on your phone
- Monitor runs in real-time

### **🖥️ Apify Console Dashboard:**
- **Actors** → `korean-vc-vcs-scraper`
- **Runs** tab shows all executions
- **Datasets** tab shows all scraped data
- **Schedules** tab manages your weekly timing

### **📧 Email Notifications:**
- Success/failure alerts
- Performance summaries  
- Data quality reports

---

## 🎯 **VALIDATION CHECKLIST**

### **✅ After Saturday Deployment:**
- [ ] Actor builds successfully
- [ ] Test run completes (~5 investor records)
- [ ] Schedule shows "Next run: Sunday 6:00 AM KST"
- [ ] Notifications configured

### **✅ After Sunday's First Run:**
- [ ] Received success email notification
- [ ] ~4,400 records scraped (similar to previous)
- [ ] Data exported to Supabase
- [ ] No error messages in logs

---

## 🚨 **TROUBLESHOOTING (IF NEEDED)**

### **Build Fails:**
```
Fix: Check package.json syntax
→ Use exact content from apify/vcs-scraper/package.json
```

### **Test Run Fails:**
```
Fix: Check VCS API access
→ Try: npm run vcs:api-file locally first
```

### **Schedule Doesn't Trigger:**
```
Fix: Check timezone setting
→ Must be "Asia/Seoul" not "UTC"
```

### **Supabase Export Fails:**
```
Fix: Check credentials in Input
→ Verify supabaseUrl and supabaseKey are correct
```

---

## 🏆 **SUCCESS OUTCOME**

### **By Monday Morning:**
```
🎉 YOUR KOREAN VC INTELLIGENCE SYSTEM:
├── ✅ Runs automatically every Sunday
├── 📊 Fresh data for Monday business decisions
├── 🎛️ Easy parameter changes via UI
├── 📱 Mobile monitoring & alerts
├── 💰 Maximizing your paid Apify account
└── 🚀 Ready for DIVA integration next week
```

**From now on: Zero manual VCS data collection needed! 🇰🇷⚡**

---

## 📞 **NEED HELP?**

**If anything goes wrong:**
1. Check **Apify Console → Runs → Latest Run → Log**
2. Look for error messages in red
3. Reference `apify/APIFY_SETUP_GUIDE.md` for detailed troubleshooting

**Your Korean VC Intelligence Platform automation starts this Sunday! 🌟** 