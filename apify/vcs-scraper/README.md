# 🇰🇷 Korean VCS Weekly Scraper - Apify Actor

Professional weekly automation for scraping Korean VCS (벤처정보서비스) investor and fund data with direct Supabase integration.

## 🎯 **What This Actor Does**

This Apify actor automatically scrapes data from the Korea Venture Capital Association (VCS) website and provides:

- **👥 Investor Data**: VC companies, operators, and investment profiles
- **💰 Fund Data**: Investment funds, portfolios, and fund management details
- **📊 Weekly Automation**: Scheduled runs every Sunday at 6 AM KST
- **🔄 Smart Updates**: Incremental or full data synchronization
- **📤 Direct Export**: Automatic Supabase database integration
- **📧 Notifications**: Email and webhook alerts on completion/failure

## 🚀 **Quick Start**

### 1. **Deploy to Apify**
```bash
# Clone the repository
git clone https://github.com/sparkai1234/projectvcs.git
cd projectvcs/apify/vcs-scraper

# Deploy to Apify (requires Apify CLI)
apify push
```

### 2. **Configure in Apify Console**
1. Go to [Apify Console](https://console.apify.com)
2. Find your "Korean VCS Weekly Scraper" actor
3. Set up the input parameters (see below)
4. Configure weekly schedule: **Sundays at 6:00 AM KST**

### 3. **Input Configuration**

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `updateMode` | dropdown | "incremental" | **Incremental**: Get only new/changed data<br>**Full**: Complete data refresh |
| `dataSource` | dropdown | "both" | **Investors**: VC companies only<br>**Funds**: Investment funds only<br>**Both**: Complete dataset |
| `maxPages` | number | 50 | Maximum pages to scrape per data source |
| `notifyOnCompletion` | boolean | true | Send notifications when scraping completes |
| `exportToSupabase` | boolean | true | Auto-export to your Supabase database |
| `supabaseUrl` | string | - | Your Supabase project URL |
| `supabaseKey` | string | - | Your Supabase service role key |

## 🔧 **Setup Instructions**

### **Step 1: Supabase Configuration**
1. Get your Supabase URL: `https://your-project.supabase.co`
2. Get your service role key from Supabase Dashboard → Settings → API
3. Ensure these tables exist in your database:
   - `investor_table` (for VC investor data)
   - `fund_table` (for investment fund data)

### **Step 2: Environment Variables**
Set these in Apify Console → Actor → Settings → Environment variables:
```
SUPABASE_URL=https://your-project.supabase.co
SUPABASE_SERVICE_ROLE_KEY=your-service-role-key
```

### **Step 3: Weekly Schedule**
In Apify Console → Actor → Schedules:
- **Name**: VCS Weekly Update
- **Cron**: `0 6 * * 0` (Every Sunday at 6 AM)
- **Timezone**: Asia/Seoul
- **Input**: Use your configured parameters

## 📊 **Output Data Structure**

The actor outputs structured data to both Apify dataset and Supabase:

```json
{
  "timestamp": "2025-06-05T06:00:00.000Z",
  "source": "VCS_WEEKLY_SCRAPER_APIFY",
  "version": "1.0.0",
  "updateMode": "incremental",
  "dataSource": "both",
  "investors": {
    "count": 150,
    "data": [
      {
        "investor_id": "OP123456",
        "company_name": "Korea Investment Partners",
        "detail_url": "https://www.vcs.go.kr/web/portal/investor/view/OP123456",
        "extraction_date": "2025-06-05T06:00:00.000Z",
        "source": "VCS_WEEKLY_SCRAPER"
      }
    ]
  },
  "funds": {
    "count": 75,
    "data": [...]
  },
  "metadata": {
    "totalRecords": 225,
    "duration_seconds": 120,
    "platform": "Apify Cloud"
  }
}
```

## 🎛️ **Apify Console Benefits**

### **Easy Scheduling**
- ✅ Point-and-click weekly schedule setup
- ✅ Visual calendar interface
- ✅ Timezone support (Asia/Seoul)
- ❌ No complex cron expressions needed

### **Parameter Management**
- ✅ Web form interface for all settings
- ✅ Dropdown menus for options
- ✅ Input validation and defaults
- ❌ No YAML file editing required

### **Monitoring & Alerts**
- ✅ Real-time run monitoring
- ✅ Email notifications on success/failure
- ✅ Webhook integration for Slack/Discord
- ✅ Detailed logs and error reporting

### **Data Access**
- ✅ Built-in dataset storage with API
- ✅ Multiple export formats (JSON, CSV, Excel)
- ✅ Direct download links
- ✅ API endpoints for integration

## 🔄 **Weekly Automation Workflow**

```
📅 Every Sunday 6:00 AM KST
├── 🚀 Actor starts automatically
├── 🌐 Launches browser with Korean locale
├── 📄 Navigates to VCS investor portal
├── 🔍 Extracts investor data (pagination)
├── 💰 Extracts fund data (if enabled)
├── 📊 Validates and structures data
├── 💾 Saves to Apify dataset
├── 📤 Exports to Supabase (if configured)
├── 📧 Sends completion notification
└── ✅ Run completes successfully
```

## 🚨 **Error Handling**

The actor includes comprehensive error handling:

- **Retry Logic**: 3 attempts for failed requests
- **Browser Recovery**: Automatic browser restart on crashes
- **Data Validation**: Ensures data integrity before export
- **Graceful Degradation**: Continues if one data source fails
- **Detailed Logging**: Complete error traces for debugging

## 📈 **Performance & Limits**

- **Memory**: 1024 MB (adjustable)
- **Timeout**: 1 hour (adjustable)
- **Rate Limiting**: 2-second delays between requests
- **Browser**: Headless Playwright with Korean locale
- **Concurrency**: Single browser instance for stability

## 🛠️ **Development & Testing**

### **Local Testing**
```bash
# Install dependencies
npm install

# Set environment variables
export SUPABASE_URL="your-url"
export SUPABASE_SERVICE_ROLE_KEY="your-key"

# Run locally
npm start
```

### **Deploy Updates**
```bash
# Update code and push to Apify
apify push

# Test with specific input
apify call --input '{"updateMode":"incremental","dataSource":"both","maxPages":5}'
```

## 🎯 **Korean VC Intelligence Platform**

This actor is part of the comprehensive Korean VC Intelligence Platform:

- **VCS Scraper** (This actor) - Weekly investor/fund data
- **DIVA Scraper** (Phase 2) - Financial reports and violations
- **Government Scrapers** (Phase 3) - K-Growth, KDB, KVIC data
- **Unified Dashboard** (Phase 4) - Analytics and reporting

## 📞 **Support**

- **Documentation**: Check Apify Console logs for detailed execution info
- **Issues**: Report bugs via GitHub Issues
- **Updates**: Actor automatically uses latest version on schedule

---

## 🏆 **Why Apify Over GitHub Actions?**

| Feature | Apify | GitHub Actions |
|---------|-------|----------------|
| **UI Configuration** | ✅ Web forms | ❌ YAML editing |
| **Scheduling** | ✅ Visual calendar | ❌ Cron expressions |
| **Monitoring** | ✅ Real-time dashboard | ❌ Check logs manually |
| **Browser Support** | ✅ Built-in Playwright | ❌ Complex setup |
| **Data Storage** | ✅ Integrated datasets | ❌ External storage needed |
| **Notifications** | ✅ Built-in webhooks | ❌ Custom implementation |
| **Weekly Focus** | ✅ Perfect for weekly runs | ❌ Designed for CI/CD |

**Perfect choice for Korean VC Intelligence Platform! 🇰🇷🚀** 