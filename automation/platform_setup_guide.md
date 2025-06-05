# 🚀 **ROBUST SCHEDULED DATA SCRAPING PLATFORM** - Setup Guide

## 🎯 **PHASE 1: IMMEDIATE IMPLEMENTATION (TODAY)**

### **Step 1: Test Enhanced VCS Updater Locally**

```bash
# 1. Test the enhanced updater
npm run vcs:update-enhanced

# 2. Verify it creates proper logs
ls -la automation/logs/

# 3. Check update data
ls -la vcs_daily_updates/
```

### **Step 2: Set Up GitHub Repository (If Not Already Done)**

```bash
# 1. Initialize git repository (if needed)
git init
git add .
git commit -m "🚀 Initial Korean VC Intelligence System"

# 2. Create GitHub repository
# Go to GitHub → New Repository → "korean-vc-intelligence"

# 3. Push to GitHub
git remote add origin https://github.com/YOURUSERNAME/korean-vc-intelligence.git
git branch -M main
git push -u origin main
```

### **Step 3: Configure GitHub Secrets**

1. **Go to GitHub Repository** → Settings → Secrets and variables → Actions
2. **Add Repository Secrets:**
   ```
   SUPABASE_URL = https://your-project.supabase.co
   SUPABASE_SERVICE_ROLE_KEY = your-service-role-key
   ```

### **Step 4: Test GitHub Actions**

1. **Trigger Manual Run:**
   - GitHub → Actions → "VCS Daily Data Update" → "Run workflow"
   - Select "dry_run: true" for safe testing
   - Monitor execution in real-time

2. **Verify Results:**
   - Check workflow completion
   - Download artifacts (logs & data)
   - Review job summaries

---

## 🎯 **PHASE 2: APIFY INTEGRATION (THIS WEEK)**

### **Step 1: Apify Account Setup**

1. **Create Apify Account:**
   - Go to [apify.com](https://apify.com)
   - Sign up (free tier includes $5 credit)
   - Verify email and complete setup

2. **Get API Credentials:**
   - Apify Console → Settings → Integrations
   - Copy API Token
   - Add to GitHub Secrets: `APIFY_TOKEN`

### **Step 2: DIVA Scraper Migration**

```bash
# 1. Install Apify CLI
npm install -g apify-cli

# 2. Create Apify actor for DIVA
apify create diva-scraper

# 3. Convert existing DIVA scrapers
# (We'll create this together)
```

### **Step 3: Test DIVA Integration**

```bash
# 1. Test DIVA scraper locally
npm run diva:test

# 2. Deploy to Apify
apify push

# 3. Test cloud execution
apify call diva-scraper
```

---

## 🎯 **PHASE 3: FULL PLATFORM OPTIMIZATION (NEXT WEEK)**

### **Production Deployment Checklist**

#### **✅ RELIABILITY**
- [x] GitHub Actions daily scheduling (6 AM KST)
- [x] Enhanced error handling & retry logic
- [x] Comprehensive logging & monitoring
- [ ] Email/Slack failure notifications
- [ ] Local backup scheduler (Windows Task Scheduler)

#### **✅ DATA QUALITY**
- [x] Data validation before import
- [x] Duplicate detection & handling
- [x] Schema verification
- [ ] Automated data quality reports
- [ ] Anomaly detection

#### **✅ MONITORING**
- [x] GitHub Actions workflow monitoring
- [x] Structured logging with metrics
- [x] Health checks after updates
- [ ] Real-time dashboard
- [ ] Performance metrics tracking

#### **✅ SCALABILITY**
- [x] Modular scraper architecture
- [x] Cloud-based scheduling
- [ ] Auto-scaling for high loads
- [ ] Multi-region deployment

---

## 💰 **COST OPTIMIZATION**

### **Current Setup (Phase 1):**
- **GitHub Actions**: Free (2,000 minutes/month)
- **Supabase**: Free tier (up to 50MB database)
- **Total**: $0/month

### **With Apify (Phase 2):**
- **Apify**: $49/month (Starter plan)
- **GitHub Actions**: Free
- **Supabase**: Free tier
- **Total**: $49/month (~$588/year)

### **ROI Calculation:**
- **Manual data collection**: ~20 hours/month × $50/hour = $1,000/month
- **Automated platform**: $49/month
- **ROI**: 95% cost reduction + 24/7 fresh data

---

## 🛠️ **TROUBLESHOOTING GUIDE**

### **Common Issues & Solutions**

#### **1. GitHub Actions Fails**
```bash
# Check secrets are set correctly
# Go to GitHub → Settings → Secrets

# Common fixes:
- Verify SUPABASE_URL format (https://...)
- Check SUPABASE_SERVICE_ROLE_KEY (not anon key)
- Ensure repository is public or has Actions enabled
```

#### **2. VCS API Changes**
```bash
# Test API endpoint manually
curl "https://www.vcs.go.kr/web/portal/investor/search?tabMenu=1&cp=1"

# Update scraper if needed
npm run vcs:api-file
```

#### **3. Database Connection Issues**
```bash
# Test Supabase connection
node -e "
const { createClient } = require('@supabase/supabase-js');
const client = createClient(process.env.SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);
client.from('vc_table').select('count').then(console.log);
"
```

#### **4. Data Quality Issues**
```bash
# Run validation manually
npm run vcs:update-enhanced

# Check logs
cat automation/logs/enhanced_vcs_update_*.log | grep -i error
```

---

## 📊 **MONITORING & ALERTING SETUP**

### **Daily Monitoring Checklist**
1. **Check GitHub Actions** → Actions tab for daily runs
2. **Review artifacts** → Download logs if needed
3. **Database health** → Run health check workflow
4. **Data freshness** → Verify latest import timestamps

### **Weekly Performance Review**
1. **Success rate** → Target: >95%
2. **Data quality** → Target: >99% validation rate
3. **Performance** → Target: <30 minutes per update
4. **Cost monitoring** → Track Apify usage

### **Monthly Optimization**
1. **Scraper performance tuning**
2. **Data source evaluation** (add/remove sources)
3. **Cost optimization review**
4. **Feature enhancement planning**

---

## 🎯 **NEXT ACTIONS - IMMEDIATE PRIORITIES**

### **TODAY (Phase 1):**
1. ✅ **Test enhanced VCS updater locally**
2. ✅ **Set up GitHub repository with secrets**
3. ✅ **Run first GitHub Actions workflow**
4. ⏳ **Monitor and verify successful execution**

### **THIS WEEK (Phase 2):**
1. 🎯 **Create Apify account**
2. 🎯 **Test DIVA scraper integration**
3. 🎯 **Set up weekly DIVA automation**
4. 🎯 **Integrate DIVA data with VCS intelligence**

### **SUCCESS METRICS:**
- **Data Freshness**: Daily VCS updates (currently manual monthly)
- **Reliability**: >95% uptime (currently ~70% manual success)
- **Coverage**: 5+ data sources (currently 2 manual)
- **Cost**: <$50/month (currently $0 but limited value)

---

## 🚀 **STRATEGIC VISION**

### **3-Month Goal: Most Advanced Korean VC Platform**
- **Real-time data** from all major Korean VC sources
- **AI-powered insights** and investment matching
- **Automated reporting** and trend analysis
- **API endpoints** for third-party integrations

### **6-Month Goal: Market Leadership**
- **Comprehensive coverage** of Korean VC ecosystem
- **Predictive analytics** for investment trends
- **Commercial API** for revenue generation
- **International expansion** (Japan, Singapore)

**Your Korean VC Intelligence System will be the definitive source for Korean venture capital data! 🇰🇷🚀** 