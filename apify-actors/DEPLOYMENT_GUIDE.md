# 🚀 Apify Actors Deployment Guide

Complete guide to deploy your Korean VC and Fund scrapers to Apify Cloud.

## 📦 What We've Built

You now have **2 professional Apify actors** ready for cloud deployment:

### 🧪 Korean VC Scraper
- **Path**: `apify-actors/korean-vc-scraper/`
- **Purpose**: Scrapes VC company data from vcs.go.kr
- **Target Table**: VC Table (13 clean fields)

### 🏦 Korean Fund Scraper  
- **Path**: `apify-actors/korean-fund-scraper/`
- **Purpose**: Scrapes fund data from vcs.go.kr
- **Target Table**: Fund Table (10 clean fields)

## 🎯 Deployment Options

### Option 1: Upload via Apify Console (Recommended)

1. **Create Apify Account**:
   - Go to [console.apify.com](https://console.apify.com)
   - Sign up or log in
   - Go to "Actors" section

2. **Create First Actor (VC Scraper)**:
   - Click "Create new" → "Source code"
   - Name: `Korean VC Scraper`
   - Description: `Scrapes Korean VC company data`
   - Choose "Node.js" template

3. **Upload VC Scraper Files**:
   ```
   📁 korean-vc-scraper/
   ├── main.js              (copy content)
   ├── package.json         (copy content)  
   ├── INPUT_SCHEMA.json    (copy content)
   ├── Dockerfile           (copy content)
   ├── README.md            (copy content)
   └── .actor/
       └── actor.json       (copy content)
   ```

4. **Create Second Actor (Fund Scraper)**:
   - Repeat process for `korean-fund-scraper/`
   - Upload all files similarly

### Option 2: Use Apify CLI (Advanced)

1. **Install Apify CLI**:
   ```bash
   npm install -g apify-cli
   apify login
   ```

2. **Deploy VC Scraper**:
   ```bash
   cd apify-actors/korean-vc-scraper
   apify push
   ```

3. **Deploy Fund Scraper**:
   ```bash
   cd ../korean-fund-scraper
   apify push
   ```

## ⚙️ Configuration Setup

### Required Settings (Both Actors)

When running your actors, configure these required fields:

| Field | Value | Note |
|---|---|---|
| **Airtable API Key** | `patOUfAsek4nbpvHm.49789...` | Your actual API key |
| **Airtable Base ID** | `appdR8V9lJaRW8VkR` | Your base ID |
| **Airtable Table Name** | `VC Table` or `Fund Table` | Must match exactly |

### Optional Settings

| Field | VC Default | Fund Default | Description |
|---|---|---|---|
| Max Pages | All | All | Limit scraping scope |
| Start Page | 1 | 1 | Resume from specific page |
| Batch Size | 10 | 10 | Airtable API batch size |
| Request Delay | 200ms | 200ms | Delay between requests |
| Batch Delay | 500ms | 500ms | Delay between Airtable calls |

## 📅 Setting Up Schedules

### Recommended Schedule Configuration

1. **Go to Actor** → **Schedules** → **Create new**

2. **VC Data Schedule**:
   - **Name**: "Daily VC Update"
   - **Cron**: `0 2 * * *` (daily at 2 AM)
   - **Config**: Max pages = 5 (for incremental updates)

3. **Fund Data Schedule**:
   - **Name**: "Weekly Fund Update" 
   - **Cron**: `0 3 * * 1` (weekly Monday at 3 AM)
   - **Config**: Max pages = 3 (funds change less frequently)

### Cron Schedule Examples

| Schedule | Cron Expression | Use Case |
|---|---|---|
| Daily at 2 AM | `0 2 * * *` | Regular updates |
| Every 6 hours | `0 */6 * * *` | Frequent monitoring |
| Weekly Monday | `0 3 * * 1` | Weekly batch updates |
| Monthly 1st | `0 4 1 * *` | Full data refresh |

## 🔧 Testing Your Deployment

### 1. Initial Test Run

**VC Scraper Test**:
- Set `maxPages: 2`
- Set `startPage: 1`
- Run and verify data appears in Airtable

**Fund Scraper Test**:
- Set `maxPages: 2` 
- Set `startPage: 1`
- Run and verify data appears in Airtable

### 2. Verify Field Mapping

Check that data appears in correct columns:

**VC Table Should Have**:
- Company Name, Company ID, Industry, Location
- Founded, Company Type, Operating Scale, etc.
- Detailed Notes with formatted information

**Fund Table Should Have**:
- Name (Fund Name), Company Name (Korean), Company ID
- Industry, Founded, Operating Amount, etc.
- Detailed Notes with fund information

### 3. Monitor Performance

Watch for:
- **Success Rate**: Should be 95%+ 
- **Runtime**: ~2-5 minutes for 2 pages
- **Memory Usage**: Should stay under 1GB
- **API Calls**: Monitor Airtable API limits

## 🚨 Troubleshooting

### Common Deployment Issues

**"Actor build failed"**
- Check package.json syntax
- Ensure all files are uploaded
- Verify Dockerfile format

**"Input validation error"**
- Check INPUT_SCHEMA.json format
- Verify required fields are provided
- Test with example input

**"Airtable connection failed"**
- Verify API key is correct
- Check base ID format
- Ensure table names match exactly

### Performance Optimization

**If scraping is slow**:
- Increase `delayBetweenRequests` to 500ms
- Reduce `batchSize` to 5
- Use `maxPages` to limit scope

**If Airtable rate limits hit**:
- Increase `delayBetweenBatches` to 1000ms
- Reduce `batchSize` to 5
- Stagger your scheduled runs

## 📊 Monitoring & Alerts

### Set Up Notifications

1. **Go to Actor** → **Settings** → **Notifications**

2. **Configure Alerts**:
   - ✅ Run failed
   - ✅ Run succeeded (for critical actors)
   - ✅ Run exceeded timeout
   - ❌ Run started (too noisy)

3. **Notification Channels**:
   - Email (always recommended)
   - Slack (for team coordination)
   - Webhook (for custom integrations)

### Key Metrics to Monitor

| Metric | Good Range | Action if Outside |
|---|---|---|
| Success Rate | 95-100% | Check logs, adjust delays |
| Runtime | 2-30 min | Optimize or increase timeout |
| Memory Usage | <1GB | Check for memory leaks |
| Items Scraped | Expected count ±10% | Verify source availability |

## 🎉 Success Checklist

- [ ] Both actors deployed to Apify Console
- [ ] Test runs completed successfully  
- [ ] Data appearing correctly in Airtable
- [ ] Field mapping working properly
- [ ] Schedules configured and active
- [ ] Notifications set up
- [ ] Performance monitoring in place

## 🔄 Maintenance Tasks

### Weekly
- [ ] Check actor run logs
- [ ] Verify data quality in Airtable
- [ ] Monitor API usage/limits

### Monthly  
- [ ] Review and optimize schedules
- [ ] Update actor versions if needed
- [ ] Clean up old dataset entries
- [ ] Review cost and usage metrics

---

## 🎯 Next Steps

Once deployed:

1. **Test both actors** with small page limits first
2. **Set up schedules** for automatic data collection
3. **Monitor performance** for the first week
4. **Scale up** page limits once stable
5. **Add alerts** for critical failures

**🚀 You're ready to go live with professional Korean VC data collection!** 