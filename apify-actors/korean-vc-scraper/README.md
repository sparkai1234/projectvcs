# Korean VC Company Scraper

🇰🇷 **Professional scraper for Korean venture capital company data**

This Apify actor scrapes venture capital company information from the official Korean VC database (vcs.go.kr) and automatically sends it to your Airtable base with proper field mapping and organization.

## 🎯 Features

- **📊 Complete Data Coverage** - Scrapes all VC companies from the Korean database
- **🎨 Proper Field Mapping** - Data is organized into separate, meaningful columns 
- **☁️ Cloud-Based** - Runs on Apify's robust infrastructure
- **📅 Schedulable** - Set up automatic data updates
- **🔄 Reliable** - Built-in retry logic and error handling
- **⚡ Configurable** - Customize scraping parameters and delays

## 📋 Data Fields Collected

The actor collects and maps the following data to your Airtable:

| Airtable Field | Source Data | Description |
|---|---|---|
| Company Name | operInstNm | Primary company name |
| Company Name (Korean) | operInstNm | Korean company name |
| Company ID | operInstId | Unique company identifier |
| Industry | comIndNm | Industry classification |
| Location | sigunguNm | Company location |
| Founded | foundYy | Founding year |
| Company Type | operInstTpNm | Type of organization |
| Operating Scale | operScaleCd | Scale of operations |
| Operating Amount | operBoundAmt | Operating amount (numeric) |
| Business Category | comBzcarrCd | Business category code |
| Zip Code | headofcZipcd | Postal code |
| Strategy Planner | strtplanerYn | Has strategy planner (Yes/No) |
| Notes | (formatted) | Detailed information summary |

## 🚀 Quick Start

1. **Set up your Airtable**:
   - Create a base with a "VC Table" table
   - Get your API key from Airtable
   - Note your Base ID

2. **Configure the actor**:
   - Enter your Airtable API Key
   - Enter your Airtable Base ID
   - Customize other settings as needed

3. **Run the actor**:
   - Click "Start" to begin scraping
   - Monitor progress in real-time
   - Data will appear in your Airtable automatically

## ⚙️ Configuration Options

| Setting | Description | Default | Required |
|---|---|---|---|
| **Airtable API Key** | Your Airtable API key | - | ✅ Yes |
| **Airtable Base ID** | Your Airtable base ID | - | ✅ Yes |
| **Airtable Table Name** | Target table name | "VC Table" | No |
| **Max Pages** | Limit pages to scrape | All pages | No |
| **Start Page** | Page to start from | 1 | No |
| **Batch Size** | Records per Airtable batch | 10 | No |
| **Request Delay** | Delay between requests (ms) | 200 | No |
| **Batch Delay** | Delay between batches (ms) | 500 | No |

## 📊 Example Output

Each company record includes comprehensive information:

```json
{
  "Company Name": "한국벤처파트너스",
  "Company ID": "1234567890",
  "Industry": "IT서비스",
  "Location": "서울특별시 강남구",
  "Founded": "2010",
  "Operating Amount": 50.5,
  "Strategy Planner": "Yes"
}
```

## 🔧 Advanced Usage

### Scheduling Runs
Set up automatic data collection:
- Go to Schedules in your actor
- Set frequency (daily, weekly, etc.)
- Your data stays automatically updated

### Incremental Updates
To avoid duplicates:
- Use `startPage` to resume from a specific page
- Set `maxPages` to limit each run
- Combine with scheduling for efficient updates

### Rate Limiting
Respectful scraping settings:
- Default delays are optimized for stability
- Increase delays if you encounter rate limits
- Monitor logs for any issues

## 📈 Performance

- **Speed**: ~10-50 records per minute (depending on delays)
- **Memory**: Uses ~1GB RAM for large datasets
- **Reliability**: Built-in retry logic for failed requests
- **Scalability**: Handles databases with thousands of records

## 🛠️ Troubleshooting

### Common Issues

**"Airtable API Error"**
- Check your API key is valid
- Verify base ID is correct
- Ensure table name matches exactly

**"Request Failed"**
- Increase delay between requests
- Check your internet connection
- Try reducing batch size

**"No Data Found"**
- Verify the Korean VC website is accessible
- Check if site structure has changed
- Contact support if issue persists

## 📞 Support

- **Documentation**: [Apify Actor Documentation](https://docs.apify.com)
- **Community**: [Apify Discord](https://discord.gg/jyEM2PRvMU)
- **Issues**: Report via Apify Console

---

**🔥 Ready to get started?** Configure your settings and click "Start" to begin collecting Korean VC data automatically! 