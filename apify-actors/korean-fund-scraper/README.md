# Korean Fund Scraper

🏦 **Professional scraper for Korean fund data**

This Apify actor scrapes fund information from the official Korean VC database (vcs.go.kr) and automatically sends it to your Airtable base with proper field mapping and organization.

## 🎯 Features

- **📊 Complete Fund Coverage** - Scrapes all funds from the Korean database
- **🎨 Proper Field Mapping** - Data is organized into separate, meaningful columns 
- **☁️ Cloud-Based** - Runs on Apify's robust infrastructure
- **📅 Schedulable** - Set up automatic data updates
- **🔄 Reliable** - Built-in retry logic and error handling
- **⚡ Configurable** - Customize scraping parameters and delays

## 📋 Data Fields Collected

The actor collects and maps the following fund data to your Airtable:

| Airtable Field | Source Data | Description |
|---|---|---|
| Name | fundNm / operInstNm | Fund name (primary) |
| Company Name (Korean) | operInstNm | Operating company name |
| Company ID | operInstId | Unique company identifier |
| Industry | invstFldTpNm | Investment field/industry |
| Founded | regDd | Registration date |
| Operating Amount | formTotamt | Fund amount in 억원 (numeric) |
| Business Category | invstCharcCd | Investment character code |
| Data Type | (fixed) | "Fund Company" |
| Status | (fixed) | "Todo" |
| Notes | (formatted) | Detailed fund information |

## 🚀 Quick Start

1. **Set up your Airtable**:
   - Create a base with a "Fund Table" table
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
| **Airtable Table Name** | Target table name | "Fund Table" | No |
| **Max Pages** | Limit pages to scrape | All pages | No |
| **Start Page** | Page to start from | 1 | No |
| **Batch Size** | Records per Airtable batch | 10 | No |
| **Request Delay** | Delay between requests (ms) | 200 | No |
| **Batch Delay** | Delay between batches (ms) | 500 | No |

## 📊 Example Output

Each fund record includes comprehensive information:

```json
{
  "Name": "코리아 스타트업 투자조합",
  "Company Name (Korean)": "한국벤처파트너스",
  "Company ID": "1234567890",
  "Industry": "IT서비스",
  "Founded": "20230315",
  "Operating Amount": 100.5,
  "Business Category": "벤처투자조합"
}
```

## 📝 Detailed Notes Section

Each record includes a comprehensive Notes field with:

- **Fund Information**: Fund name, ID, registration and expiry dates
- **Company Information**: Operating company details
- **Investment Details**: Total amount, investment fields, character codes
- **Import Info**: Data type, import timestamp, source

## 🔧 Advanced Usage

### Scheduling Runs
Set up automatic data collection:
- Go to Schedules in your actor
- Set frequency (daily, weekly, etc.)
- Your fund data stays automatically updated

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

- **Speed**: ~10-50 fund records per minute (depending on delays)
- **Memory**: Uses ~1GB RAM for large datasets
- **Reliability**: Built-in retry logic for failed requests
- **Scalability**: Handles databases with thousands of fund records

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

**"No Fund Data Found"**
- Verify the Korean VC website is accessible
- Check if site structure has changed
- Contact support if issue persists

## 📊 Fund Data Structure

The Korean database contains funds with these key characteristics:
- **Fund Name** (fundNm): Official fund name
- **Operating Company** (operInstNm): Company managing the fund
- **Investment Field** (invstFldTpNm): Sector focus (IT, Bio, etc.)
- **Fund Amount** (formTotamt): Total fund size in 억원
- **Registration Date** (regDd): When fund was registered

## 📞 Support

- **Documentation**: [Apify Actor Documentation](https://docs.apify.com)
- **Community**: [Apify Discord](https://discord.gg/jyEM2PRvMU)
- **Issues**: Report via Apify Console

---

**🔥 Ready to get started?** Configure your settings and click "Start" to begin collecting Korean fund data automatically! 