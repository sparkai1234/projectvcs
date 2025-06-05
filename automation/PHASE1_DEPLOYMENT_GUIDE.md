# 🚀 **PHASE 1 DEPLOYMENT GUIDE** - VCS Scraper to Apify

## 🎯 **Quick Deployment (5 Minutes)**

### **Step 1: Prepare for Deployment**

✅ **Files Ready:**
- `apify/vcs-scraper/main.js` - Actor code with modern browser automation  
- `apify/vcs-scraper/package.json` - Dependencies (Apify SDK + Playwright)
- `apify/vcs-scraper/INPUT_SCHEMA.json` - Web form configuration
- `apify/vcs-scraper/Dockerfile` - Container setup
- `apify/vcs-scraper/actor.json` - Actor metadata
- `apify/vcs-scraper/README.md` - Complete documentation

### **Step 2: Deploy to Apify Cloud**

#### **Option A: Web Console Upload (Easiest)**

1. **Go to Apify Console**
   - Visit: https://console.apify.com
   - Login to your account

2. **Create New Actor**
   - Click "Create Actor" 
   - Choose "Empty JavaScript Actor"
   - Name: `korean-vcs-weekly-scraper`

3. **Upload Files**
   - Replace the default `main.js` with our version
   - Update `package.json` with our dependencies
   - Add `INPUT_SCHEMA.json` for the web form
   - Add `Dockerfile` for proper environment
   - Upload `README.md` for documentation

4. **Build & Test**
   - Click "Build" 
   - Wait for build to complete
   - Click "Start" with test input

#### **Option B: Apify CLI (Advanced)**

```bash
# Install Apify CLI
npm install -g apify-cli

# Login to Apify
apify login

# Navigate to VCS scraper
cd apify/vcs-scraper

# Deploy to Apify
apify push
```

### **Step 3: Configure Actor Settings**

#### **Memory & Timeout**
- **Memory**: 1024 MB (can increase if needed)
- **Timeout**: 3600 seconds (1 hour)
- **Build**: Always use latest

#### **Environment Variables**
Add these in Actor Settings → Environment:
```
SUPABASE_URL=https://your-project.supabase.co
SUPABASE_SERVICE_ROLE_KEY=your-service-role-key
```

### **Step 4: Test Run with Sample Input**

Use this test configuration:
```json
{
    "updateMode": "incremental",
    "dataSource": "investors", 
    "maxPages": 3,
    "notifyOnCompletion": false,
    "exportToSupabase": true,
    "supabaseUrl": "https://your-project.supabase.co",
    "supabaseKey": "your-service-role-key"
}
```

**Expected Results:**
- ✅ Actor starts and launches browser
- ✅ Navigates to VCS website 
- ✅ Extracts investor data from 3 pages
- ✅ Saves to Apify dataset
- ✅ Exports to Supabase (if configured)
- ✅ Completes in 2-5 minutes

### **Step 5: Set Up Weekly Schedule**

#### **Create Schedule**
1. **Actor Console** → **Schedules** → **Create Schedule**
2. **Settings:**
   - **Name**: `VCS Weekly Sunday Update`
   - **Cron**: `0 6 * * 0` 
   - **Timezone**: `Asia/Seoul`
   - **Actor Input**: Production configuration (see below)

#### **Production Input Configuration**
```json
{
    "updateMode": "incremental",
    "dataSource": "both",
    "maxPages": 100,
    "notifyOnCompletion": true,
    "exportToSupabase": true
}
```

### **Step 6: Configure Notifications**

#### **Email Notifications**
- **Actor Settings** → **Notifications** 
- ✅ Enable "Send email on failure"
- ✅ Enable "Send email on success" (optional)

#### **Webhook Notifications** (Optional)
For Slack/Discord integration:
- **Webhooks** → **Add Webhook**
- URL: Your Slack/Discord webhook URL
- Events: `RUN.SUCCEEDED`, `RUN.FAILED`

---

## 🎛️ **Apify Console UI Benefits**

### **vs GitHub Actions:**
| Feature | Apify Console | GitHub Actions |
|---------|---------------|----------------|
| **Schedule Setup** | ✅ Visual calendar | ❌ YAML cron |
| **Parameter Changes** | ✅ Web form | ❌ Code editing |
| **Monitoring** | ✅ Real-time dashboard | ❌ Check logs manually |
| **Notifications** | ✅ Built-in webhooks | ❌ Custom setup |
| **Data Access** | ✅ Instant downloads | ❌ Artifact hunting |

### **Weekly Schedule Benefits:**
- 🕐 **Perfect Timing**: Sunday 6 AM KST for Monday business prep
- 📊 **Fresh Data**: VCS typically updates Friday/Saturday  
- ⚡ **Resource Efficiency**: Weekly vs daily reduces costs 85%
- 🔄 **Reliable**: Apify's infrastructure designed for scheduled jobs

---

## 🚨 **Troubleshooting**

### **Build Fails**
- Check `package.json` dependencies are valid
- Ensure Dockerfile uses correct base image
- Verify all files are uploaded correctly

### **Actor Fails During Run**
- Check browser automation settings
- Verify VCS website hasn't changed structure  
- Review Apify logs for specific errors
- Test with smaller `maxPages` first

### **Supabase Export Fails**
- Verify environment variables are set correctly
- Check Supabase service role key permissions
- Ensure tables (`investor_table`, `fund_table`) exist
- Test Supabase connection separately

### **No Data Extracted**
- VCS website may have anti-bot protection
- Try different browser settings in actor
- Check if VCS has changed their page structure
- Review extraction selectors in code

---

## 📊 **Success Metrics**

### **After Successful Deployment:**
- ✅ Actor builds without errors
- ✅ Test run completes in 2-5 minutes
- ✅ Extracts 50+ investor records per run
- ✅ Weekly schedule triggers automatically
- ✅ Data appears in Supabase database
- ✅ Notifications work correctly

### **Weekly Performance:**
- 📈 **Expected Runtime**: 5-15 minutes
- 📊 **Data Volume**: 100-500 investor records  
- 💰 **Cost**: ~$2-5/month on Apify
- 🔄 **Reliability**: 95%+ success rate

---

## 🏆 **Phase 1 Success = Ready for Phase 2**

Once VCS scraper is running smoothly:
- ✅ **Phase 2**: Add DIVA financial scraper (Wednesdays)
- ✅ **Phase 3**: Add government data scrapers (Fridays) 
- ✅ **Phase 4**: Unified dashboard and analytics

**You'll have a professional, automated Korean VC intelligence platform! 🇰🇷🚀** 