# 🚀 VCS Maintenance v3.0 Deployment Guide

## Overview

VCS Maintenance System v3.0 is now part of the Unified Maintenance Architecture, providing enhanced features, consolidated reporting, and shared core functionality.

## ✅ Pre-Deployment Validation

**Status**: ✅ **PASSED** - All validation tests completed successfully

### Validation Results:
- ✅ **Syntax**: Valid ES6 module with proper imports
- ✅ **Structure**: Extends MaintenanceSystemCore correctly  
- ✅ **Package**: v3.0 configuration with all dependencies
- ✅ **Shared Core**: Base class available and exported
- ✅ **Methods**: All required maintenance methods implemented

## 🔧 What's New in v3.0

### 🎯 **Core Changes**
- **Unified Architecture**: Now extends `MaintenanceSystemCore`
- **Consistent Logic**: Same maintenance patterns as DIVA system
- **Enhanced Reporting**: Unified dashboard integration
- **Consolidated Email**: Prepares data for combined VCS+DIVA reports

### 📊 **New Features**
- **System Type Tagging**: All reports tagged with 'VCS'
- **Quality Score Calculation**: Automated quality scoring
- **Dashboard Integration**: Saves to `unified_maintenance_reports` table
- **Memory Tracking**: Retrieves past maintenance histories
- **Consolidated Email Prep**: Prepares data for unified reporting

### 🔄 **Maintained Features**
- **Duplicate Detection**: Enhanced VC and Fund duplicate detection
- **Data Quality Analysis**: Comprehensive quality checks
- **Cleanup Operations**: Smart duplicate removal
- **Health Monitoring**: Database health assessments
- **Error Handling**: Robust error tracking and reporting

## 🚀 Deployment Steps

### 1. **Apify Actor Deployment**

```bash
# Navigate to VCS maintenance directory
cd apify/vcs-maintenance

# Verify all files are ready
npm install
node validate-v3.js

# Deploy to Apify (using Apify CLI)
apify push
```

### 2. **Environment Configuration**

Set these environment variables in Apify Actor settings:

```bash
# Required
SUPABASE_URL=your-supabase-project-url
SUPABASE_SERVICE_ROLE_KEY=your-service-role-key

# Optional (for email features)
SMTP_HOST=smtp.gmail.com
SMTP_PORT=587
SMTP_USER=your-email@domain.com
SMTP_PASS=your-app-password
```

### 3. **Database Schema Setup**

Run the unified maintenance schema in your Supabase database:

```sql
-- Run this in Supabase SQL Editor
-- File: database/unified-maintenance-schema.sql
CREATE TABLE unified_maintenance_reports (
    id BIGSERIAL PRIMARY KEY,
    system_type TEXT NOT NULL CHECK (system_type IN ('VCS', 'DIVA')),
    status TEXT NOT NULL CHECK (status IN ('HEALTHY', 'NEEDS_ATTENTION', 'ERROR')),
    duration_seconds INTEGER NOT NULL DEFAULT 0,
    quality_score INTEGER NOT NULL DEFAULT 0,
    duplicates_removed INTEGER NOT NULL DEFAULT 0,
    records_processed INTEGER NOT NULL DEFAULT 0,
    report_data JSONB NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);
```

### 4. **Test Deployment**

#### Basic Maintenance Run
```json
{
  "maintenanceType": "standard",
  "performCleanup": true,
  "dashboard": { "enabled": true }
}
```

#### Memory Retrieval Test
```json
{
  "action": "retrieveMemories",
  "memoryOptions": {
    "limit": 5,
    "sortBy": "created_at",
    "ascending": false
  }
}
```

## 📊 Expected Outputs

### 1. **Actor Storage**
- `vcs_maintenance_report` - Full maintenance report
- `vcs_maintenance_summary` - Quick summary metrics

### 2. **Supabase Database**
- New record in `unified_maintenance_reports` with `system_type = 'VCS'`
- Dashboard views updated with latest VCS metrics

### 3. **Console Logs**
```
🇰🇷 VCS Maintenance Actor v3.0 Started
✅ [VCS] Supabase client initialized successfully
📊 [VCS] Current Records: 1,234 VCs, 5,678 Funds (Total: 6,912)
🔄 [VCS] Duplicates Found: 15 VCs, 8 Funds
🗑️ [VCS] Removed 23 duplicate records
🎯 [VCS] Quality Score: 98/100
💾 [VCS] VCS report saved to unified dashboard successfully
🎉 === VCS MAINTENANCE COMPLETED SUCCESSFULLY ===
```

## 🔍 Monitoring & Verification

### 1. **Dashboard Queries**
```sql
-- Check latest VCS status
SELECT * FROM unified_maintenance_latest_status WHERE system_type = 'VCS';

-- Get VCS performance trends (last 7 days)
SELECT * FROM get_system_performance_trends('VCS', 7);

-- View recent VCS reports
SELECT system_type, status, quality_score, created_at 
FROM unified_maintenance_reports 
WHERE system_type = 'VCS' 
ORDER BY created_at DESC 
LIMIT 5;
```

### 2. **Health Indicators**
- ✅ **Status**: Should be 'HEALTHY' for normal operations
- ✅ **Quality Score**: Should be 90+ for good data quality
- ✅ **Processing Speed**: Should be 100+ records/second
- ✅ **Error Count**: Should be 0 for successful runs

### 3. **Integration Verification**
- **Unified Dashboard**: VCS data appears in consolidated views
- **Email Preparation**: VCS report data saved for consolidated emails
- **Memory System**: Past VCS reports retrievable via memories action

## 🚨 Troubleshooting

### Common Issues

#### 1. **Import Errors**
```
Error: Cannot find package 'apify'
```
**Solution**: Ensure shared-maintenance-core has dependencies installed
```bash
cd ../shared-maintenance-core && npm install
```

#### 2. **Database Connection Errors**
```
Error: Missing Supabase credentials
```
**Solution**: Verify environment variables are set correctly in Apify Actor settings

#### 3. **Dashboard Integration Failures**
```
Error: relation "unified_maintenance_reports" does not exist
```
**Solution**: Run the unified maintenance schema SQL in Supabase

#### 4. **Quality Score Issues**
**Symptoms**: Quality score consistently low (< 80)
**Investigation**: Check data quality analysis logs for specific issues
**Solution**: Address data quality issues in source VCS data

### Debug Commands

```bash
# Test actor locally
node main.js

# Validate configuration
node validate-v3.js

# Check dependencies
npm list

# View recent logs
apify log
```

## 📈 Performance Expectations

### Typical Performance Metrics
- **Duration**: 30-60 seconds for standard maintenance
- **Records Processed**: 20,000-50,000 total VCS records
- **Duplicates Found**: 0-50 (depending on data freshness)
- **Quality Score**: 95-100 for well-maintained data
- **Memory Usage**: < 500MB during execution

### Scaling Considerations
- **Large Datasets** (>100k records): Increase Actor memory to 2GB
- **High Duplicate Count** (>500): Consider batch processing
- **Frequent Runs** (daily): Enable incremental processing

## 🔄 Migration from v2.0

### Automatic Migrations
- ✅ **Configuration**: Input format remains compatible
- ✅ **Outputs**: Same Actor storage keys maintained
- ✅ **Functionality**: All v2.0 features preserved

### New Capabilities
- 🆕 **Unified Dashboard**: Automatic integration
- 🆕 **System Tagging**: All reports tagged with 'VCS'
- 🆕 **Memory Retrieval**: Access to maintenance history
- 🆕 **Quality Scoring**: Automated quality calculations
- 🆕 **Consolidated Prep**: Ready for unified email reports

## ✅ Post-Deployment Checklist

- [ ] VCS Maintenance Actor deployed to Apify
- [ ] Environment variables configured
- [ ] Database schema applied to Supabase
- [ ] Test maintenance run completed successfully
- [ ] Dashboard integration verified
- [ ] Quality scores within expected range (90+)
- [ ] Memory retrieval functionality tested
- [ ] Error monitoring configured
- [ ] Documentation updated for team

## 🎯 Next Steps

1. **Deploy DIVA Maintenance v3.0** - Complete unified architecture
2. **Setup Consolidated Email Reporter** - Enable unified reporting
3. **Configure Automated Scheduling** - Regular maintenance runs
4. **Dashboard Monitoring** - Setup alerts for quality issues
5. **Performance Optimization** - Monitor and tune based on usage

---

**Version**: 3.0.0  
**Deployment Date**: June 2024  
**Status**: ✅ Ready for Production  
**Validated By**: Automated validation suite  
**Next Review**: After DIVA v3.0 deployment 