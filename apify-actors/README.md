# 🇰🇷 Korean VC & Fund Data Scrapers

**Professional Apify Actors for Korean Venture Capital Data Collection**

Automatically scrape and organize Korean VC and fund data from the official vcs.go.kr database into your Airtable with proper field mapping.

## 🎯 Overview

This repository contains two specialized Apify actors that transform messy Korean VC data into clean, organized Airtable records:

### 🧪 Korean VC Scraper
**Scrapes venture capital company data**
- **Source**: Korean VC Database (vcs.go.kr)
- **Target**: VC Table in Airtable
- **Fields**: 13 organized columns (Company Name, Industry, Location, etc.)
- **Data Type**: VC company information

### 🏦 Korean Fund Scraper
**Scrapes fund data**
- **Source**: Korean VC Database (vcs.go.kr) 
- **Target**: Fund Table in Airtable
- **Fields**: 10 focused columns (Fund Name, Operating Amount, etc.)
- **Data Type**: Investment fund information

## ✨ Key Features

### 🎨 **Proper Field Mapping**
No more data dumps! Each piece of information goes to its correct column:
- Company names → Company Name fields
- Financial data → Operating Amount (numeric)
- Dates → Founded/Registration fields
- Categories → Industry/Business Category fields

### ☁️ **Cloud Infrastructure**
- Runs on Apify's robust cloud platform
- Automatic scaling and reliability
- Built-in monitoring and alerts
- Professional logging and error handling

### 📅 **Scheduling & Automation**
- Set up daily, weekly, or custom schedules
- Automatic data updates without manual intervention
- Configurable incremental updates
- Smart retry logic for failed requests

### 🛡️ **Production Ready**
- Rate limiting and respectful scraping
- Comprehensive error handling
- Input validation and safety checks
- Detailed logging and monitoring

## 📊 Data Transformation

### Before (Problem)
```
❌ Everything dumped into single "Notes" field
❌ No organization or structure
❌ Difficult to analyze or filter
❌ Manual data cleanup required
```

### After (Solution)
```
✅ 13 organized VC fields + 10 fund fields
✅ Proper data types (text, numbers, dates)
✅ Clean, filterable columns
✅ Ready for analysis and reporting
```

## 🚀 Quick Start

### 1. **Deploy to Apify**
- Upload actors to [Apify Console](https://console.apify.com)
- Follow the [Deployment Guide](./DEPLOYMENT_GUIDE.md)

### 2. **Configure Settings**
```json
{
  "airtableApiKey": "patYourApiKeyHere",
  "airtableBaseId": "appYourBaseIdHere",
  "airtableTableName": "VC Table",
  "maxPages": 5
}
```

### 3. **Run & Schedule**
- Test with small page limits first
- Set up automated schedules
- Monitor data quality

## 📋 Actor Comparison

| Feature | VC Scraper | Fund Scraper |
|---|---|---|
| **Data Source** | VC Companies (tabMenu=1) | Funds (tabMenu=2) |
| **Airtable Fields** | 13 organized columns | 10 focused columns |
| **Primary Use** | Company research | Fund analysis |
| **Update Frequency** | Daily recommended | Weekly recommended |
| **Data Volume** | Higher (more companies) | Lower (fewer funds) |

## 🔧 Configuration Options

Both actors share the same configuration structure:

| Setting | Description | Default |
|---|---|---|
| **airtableApiKey** | Your Airtable API key | Required |
| **airtableBaseId** | Your Airtable base ID | Required |
| **airtableTableName** | Target table name | "VC Table" / "Fund Table" |
| **maxPages** | Limit pages to scrape | All pages |
| **startPage** | Resume from specific page | 1 |
| **batchSize** | Records per API call | 10 |
| **delayBetweenRequests** | Request throttling (ms) | 200 |
| **delayBetweenBatches** | Batch throttling (ms) | 500 |

## 📈 Performance Metrics

### Expected Performance
- **Speed**: 10-50 records per minute
- **Memory**: ~1GB for large datasets  
- **Success Rate**: 95%+ when properly configured
- **API Efficiency**: Optimized batch operations

### Cost Estimation (Apify)
- **Small runs** (5 pages): ~$0.01-0.05
- **Medium runs** (50 pages): ~$0.10-0.50
- **Full database**: ~$1-5 depending on size
- **Monthly automation**: ~$10-50 total

## 🛠️ Troubleshooting

### Common Issues

**No data appearing in Airtable**
- ✅ Check API key and base ID
- ✅ Verify table names match exactly
- ✅ Ensure table has proper field structure

**Actor timing out**
- ✅ Reduce `maxPages` parameter
- ✅ Increase timeout in actor settings
- ✅ Check if source website is accessible

**Rate limiting errors**
- ✅ Increase `delayBetweenRequests`
- ✅ Reduce `batchSize`
- ✅ Stagger scheduled runs

## 📁 Repository Structure

```
apify-actors/
├── 📄 README.md                    (This file)
├── 📄 DEPLOYMENT_GUIDE.md          (Step-by-step deployment)
├── 🧪 korean-vc-scraper/           (VC company scraper)
│   ├── main.js                     (Main actor code)
│   ├── package.json                (Dependencies)
│   ├── INPUT_SCHEMA.json           (Configuration schema)
│   ├── Dockerfile                  (Container setup)
│   ├── README.md                   (VC-specific docs)
│   └── .actor/
│       └── actor.json              (Actor metadata)
└── 🏦 korean-fund-scraper/         (Fund scraper)
    ├── main.js                     (Main actor code)
    ├── package.json                (Dependencies)
    ├── INPUT_SCHEMA.json           (Configuration schema)
    ├── Dockerfile                  (Container setup)
    ├── README.md                   (Fund-specific docs)
    └── .actor/
        └── actor.json              (Actor metadata)
```

## 🎯 Use Cases

### 🔍 **VC Research**
- Track Korean VC landscape
- Identify investment opportunities
- Monitor company growth
- Build contact databases

### 📊 **Market Analysis**
- Fund size trends over time
- Industry investment patterns
- Geographic distribution analysis
- Competitive intelligence

### 🤖 **Automated Reporting**
- Daily VC updates for teams
- Weekly fund reports
- Monthly market summaries
- Real-time dashboard feeds

## 🔗 Related Resources

- **[Deployment Guide](./DEPLOYMENT_GUIDE.md)** - Step-by-step setup
- **[Korean VC Scraper](./korean-vc-scraper/README.md)** - VC-specific documentation
- **[Korean Fund Scraper](./korean-fund-scraper/README.md)** - Fund-specific documentation
- **[Apify Documentation](https://docs.apify.com)** - Platform documentation
- **[Airtable API](https://airtable.com/api)** - Integration documentation

---

## 🎉 Ready to Deploy?

1. **📚 Read**: [Deployment Guide](./DEPLOYMENT_GUIDE.md)
2. **🚀 Deploy**: Upload actors to Apify Console
3. **⚙️ Configure**: Set your Airtable credentials
4. **🧪 Test**: Run with small page limits
5. **📅 Schedule**: Set up automation
6. **📊 Monitor**: Track performance and data quality

**Transform your Korean VC data collection from manual work to automated excellence!** 🇰🇷✨ 