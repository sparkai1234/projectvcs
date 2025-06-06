# 🔧 Enhanced VCS Maintenance System v2.0

## Overview

The **Enhanced VCS Maintenance System** is a comprehensive Apify actor designed to maintain the health and quality of your Korean Venture Capital (VCS) database. It performs automated duplicate detection, data quality checks, cleanup operations, and generates detailed reports with email notifications.

## 🌟 Key Features

### 🔍 **Advanced Duplicate Detection**
- **Smart Analysis**: Detects duplicates by company name and fund name with case-insensitive matching
- **Detailed Tracking**: Identifies duplicate groups with record counts and specific IDs
- **Batch Processing**: Handles large datasets efficiently with batch operations

### 🧹 **Intelligent Cleanup**
- **Safe Removal**: Keeps the oldest record in each duplicate group
- **Batch Deletion**: Processes fund duplicates in batches for performance
- **Change Tracking**: Records all cleanup actions for audit trails

### 📊 **Comprehensive Data Quality Checks**
- **Missing Data Detection**: Identifies records with missing names or critical fields
- **Invalid Data Validation**: Checks for negative amounts and malformed data
- **Data Freshness Analysis**: Tracks data age and recent activity

### 📧 **Email Reporting**
- **Automated Notifications**: Sends maintenance reports via email
- **Customizable Recipients**: Configure multiple email addresses
- **Alert Thresholds**: Set custom thresholds for automatic alerts

### 📈 **Dashboard Integration**
- **Real-time Metrics**: Generates data for dashboard visualization
- **API-Ready Output**: Structured JSON reports for external systems
- **Webhook Support**: Real-time notifications to external services

## 🚀 Quick Start

### 1. **Basic Configuration**
```json
{
    "maintenanceType": "standard",
    "cleanupDuplicates": true,
    "generateReport": true
}
```

### 2. **With Email Notifications**
```json
{
    "maintenanceType": "standard",
    "cleanupDuplicates": true,
    "generateReport": true,
    "emailConfig": {
        "enabled": true,
        "recipients": ["admin@company.com"],
        "alertThreshold": 10
    }
}
```

### 3. **Deep Maintenance (Weekly)**
```json
{
    "maintenanceType": "deep",
    "cleanupDuplicates": true,
    "generateReport": true,
    "dataQualityChecks": {
        "checkMissingNames": true,
        "checkInvalidAmounts": true,
        "checkDataFreshness": true
    }
}
```

## 📋 Configuration Options

### **Maintenance Types**
- **`standard`**: Regular daily maintenance
- **`deep`**: Comprehensive weekly analysis
- **`emergency`**: Quick duplicate cleanup
- **`weekly`**: Scheduled weekly deep scan

### **Email Configuration**
- **`enabled`**: Enable/disable email notifications
- **`recipients`**: Array of email addresses
- **`alertThreshold`**: Send alerts when duplicates exceed this number

### **Data Quality Checks**
- **`checkMissingNames`**: Validate required name fields
- **`checkInvalidAmounts`**: Check for negative or invalid amounts
- **`checkDataFreshness`**: Analyze data age and activity

## 📊 Output Data

### **Maintenance Report Structure**
```json
{
    "timestamp": "2025-06-06T12:00:00.000Z",
    "maintenance_type": "standard",
    "duration_seconds": 45,
    "success_rate": 100,
    "database_health": {
        "total_records": 4406,
        "vc_count": 717,
        "fund_count": 3689
    },
    "duplicate_analysis": {
        "duplicates_found": 15,
        "duplicates_removed": 15,
        "cleanup_success": true
    },
    "data_quality": {
        "quality_score": 98,
        "issues_found": 2
    },
    "performance": {
        "status": "HEALTHY",
        "errors_encountered": 0
    }
}
```

### **Changes Tracking**
- **Additions**: New records added since last run
- **Deletions**: Records removed during cleanup
- **Duplicate Resolutions**: Detailed duplicate cleanup actions
- **Data Quality Fixes**: Quality improvements made

## 🕐 Scheduling

### **Recommended Schedule**
- **Daily Maintenance**: 30 minutes after VCS scraper completion
- **Weekly Deep Scan**: Sunday at 1:00 AM KST
- **Emergency Cleanup**: On-demand when issues detected

### **Cron Expressions**
```bash
# Daily maintenance (2:30 AM KST)
30 17 * * *

# Weekly deep scan (1:00 AM KST Sunday)
0 16 * * 0

# Emergency cleanup (manual trigger)
```

## 🔧 Environment Variables

### **Required**
```env
SUPABASE_URL=https://your-project.supabase.co
SUPABASE_SERVICE_ROLE_KEY=your-service-role-key
```

### **Optional**
```env
SUPABASE_KEY=alternative-key
EMAIL_SERVICE_API_KEY=your-email-service-key
WEBHOOK_SECRET=your-webhook-secret
```

## 📈 Dashboard Integration

### **Key Metrics Available**
- Total records processed
- Duplicates found and removed
- Data quality score
- Processing time and success rate
- Recent activity trends

### **API Endpoints for Dashboard**
```javascript
// Get latest maintenance report
const report = await apify.dataset.getItems({
    limit: 1,
    desc: true
});

// Get maintenance history
const history = await apify.dataset.getItems({
    limit: 30,
    desc: true
});
```

## 🎯 Success Criteria

### **Daily Success Indicators**
- ✅ Maintenance completes in under 60 seconds
- ✅ Data quality score above 95%
- ✅ Zero critical errors
- ✅ Duplicates removed successfully

### **Performance Benchmarks**
- **Processing Speed**: > 100 records/second
- **Memory Usage**: < 500MB
- **Success Rate**: > 99%
- **Response Time**: < 2 minutes

## 🚨 Alerts & Monitoring

### **Automatic Alerts Triggered When**
- Duplicates exceed configured threshold
- Data quality score drops below 80%
- Processing time exceeds 5 minutes
- Critical errors encountered

### **Email Alert Content**
- Maintenance status and duration
- Issues found and actions taken
- Data quality metrics
- Recommendations for manual review

## 🔗 Integration with DIVA Maintenance

The enhanced VCS maintenance system is designed to work seamlessly with the upcoming **DIVA Maintenance System**, providing:

- **Unified Reporting**: Combined VCS + DIVA maintenance reports
- **Cross-Platform Metrics**: Comparative analysis between systems
- **Consolidated Dashboard**: Single view of all maintenance activities
- **Synchronized Scheduling**: Coordinated maintenance windows

## 🆘 Troubleshooting

### **Common Issues**

**1. High Duplicate Count**
- Check if VCS scraper is creating duplicates
- Review unique naming strategy
- Consider running emergency cleanup

**2. Low Data Quality Score**
- Review data validation rules
- Check for missing required fields
- Verify API data mapping

**3. Long Processing Time**
- Check database connection
- Review batch sizes
- Monitor memory usage

### **Support**
For issues or questions, review the maintenance logs in Apify Console storage or contact the development team.

## 📝 Version History

### **v2.0.0** - Enhanced Maintenance System
- Advanced duplicate detection
- Comprehensive email reporting
- Dashboard integration ready
- Improved performance monitoring

### **v1.0.0** - Basic Maintenance
- Simple duplicate detection
- Basic cleanup functionality
- Console logging only 