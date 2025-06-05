# 🤖 VCS AUTOMATION SETUP GUIDE

## Overview
This guide shows you how to set up automated daily/weekly updates for your VCS database to keep it fresh with the latest Korean VC data.

## 🎯 What the Automation Does

1. **Daily Scraping**: Automatically scrapes VCS.GO.KR using our proven API method
2. **Smart Comparison**: Compares new data with existing database records  
3. **New Record Detection**: Identifies only new investors/funds (avoids duplicates)
4. **Organized Storage**: Saves new records in timestamped directories
5. **Detailed Logging**: Creates logs for monitoring and troubleshooting

## 📅 Scheduling Options

### Option 1: Windows Task Scheduler (Recommended for Windows)

1. **Open Task Scheduler** → Create Basic Task
2. **Set Trigger**: Daily at 6:00 AM (when VCS servers are less busy)
3. **Set Action**: Start a Program
   - Program: `node`
   - Arguments: `automation/vcs_daily_updater.js`
   - Start in: `C:\Users\k\OneDrive\바탕 화면\projectvcs`

### Option 2: Cron Job (Linux/Mac)

Add to crontab (`crontab -e`):
```bash
# Run VCS updater daily at 6:00 AM
0 6 * * * cd /path/to/projectvcs && node automation/vcs_daily_updater.js >> automation/logs/cron.log 2>&1
```

### Option 3: GitHub Actions (Cloud-based)

Create `.github/workflows/vcs-updater.yml`:
```yaml
name: VCS Daily Update
on:
  schedule:
    - cron: '0 6 * * *'  # Daily at 6:00 AM UTC
  workflow_dispatch:  # Allow manual trigger

jobs:
  update-vcs-data:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: actions/setup-node@v3
        with:
          node-version: '18'
      - run: npm install
      - run: node automation/vcs_daily_updater.js
        env:
          SUPABASE_URL: ${{ secrets.SUPABASE_URL }}
          SUPABASE_SERVICE_ROLE_KEY: ${{ secrets.SUPABASE_SERVICE_ROLE_KEY }}
```

## 🎛️ Configuration

### Environment Variables
Make sure these are set:
```bash
SUPABASE_URL=https://your-project.supabase.co
SUPABASE_SERVICE_ROLE_KEY=your-service-role-key
```

### Automation Settings (in `vcs_daily_updater.js`):
```javascript
const CONFIG = {
    logDir: 'automation/logs',           // Where to store logs
    updateDataDir: 'vcs_daily_updates',  // Where to store new data
    retentionDays: 7,                    // How long to keep logs
    enableNotifications: false           // Email/Slack alerts (future)
};
```

## 📊 Output Structure

After each run, you'll get:

```
vcs_daily_updates/
├── update_2025-06-05T06-00-00-000Z/
│   ├── new_investors.json        # Only new investor records
│   ├── new_funds.json           # Only new fund records  
│   └── update_summary.json      # Summary statistics
├── update_2025-06-06T06-00-00-000Z/
│   └── update_summary.json      # No new records today
└── ...

automation/logs/
├── vcs_update_2025-06-05T06-00-00-000Z.log
├── vcs_update_2025-06-06T06-00-00-000Z.log
└── ...
```

## 🔍 Monitoring

### Log Analysis
Check logs to see:
- How many records were found
- How many are new vs existing
- Any errors or issues
- Performance metrics

### Example Log:
```json
{
  "timestamp": "2025-06-05T06:00:00.000Z",
  "status": "completed",
  "records_found": 4406,
  "records_new": 15,
  "records_updated": 0,
  "errors": [],
  "duration_seconds": 45.2,
  "details": {
    "new_investors": 3,
    "new_funds": 12,
    "existing_investors": 717,
    "existing_funds": 3689
  }
}
```

## 🚀 Quick Start Commands

Add these to your `package.json`:

```json
{
  "scripts": {
    "vcs:update": "node automation/vcs_daily_updater.js",
    "vcs:logs": "ls -la automation/logs/",
    "vcs:schedule": "echo 'Check automation/setup_scheduling.md for scheduling options'"
  }
}
```

Run manually to test:
```bash
npm run vcs:update
```

## 🎯 Integration with Your Workflow

### Manual Review Process
1. Automation detects new records
2. Review `new_investors.json` and `new_funds.json`
3. Import to database when satisfied
4. Monitor logs for any issues

### Fully Automated Process (Advanced)
- Once you trust the automation, add automatic database import
- Set up notifications for new record alerts
- Create dashboards for monitoring

## 🛡️ Best Practices

1. **Test First**: Run manually several times before scheduling
2. **Monitor Logs**: Check logs regularly for the first week
3. **Backup Database**: Always backup before automation
4. **Rate Limiting**: Don't run more than once per day (respect VCS servers)
5. **Error Handling**: The script handles errors gracefully and logs everything

## 🔧 Troubleshooting

### Common Issues:
- **Network timeouts**: VCS servers may be slow - script retries automatically
- **Missing data**: Check VCS.GO.KR website for maintenance
- **Database connection**: Verify Supabase credentials are current
- **File permissions**: Ensure Node.js can write to directories

### Debug Mode:
Add verbose logging by setting environment variable:
```bash
DEBUG=1 node automation/vcs_daily_updater.js
```

---

**Ready to automate your Korean VC intelligence! 🇰🇷🤖** 