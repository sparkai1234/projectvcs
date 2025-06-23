# 🔧 Unified Maintenance Architecture v3.0

## Overview

The Unified Maintenance Architecture provides a consolidated approach to maintaining both VCS and DIVA systems with shared logic, unified reporting, and centralized dashboard integration.

## 🏗️ Architecture Components

### 1. **Shared Maintenance Core** (`apify/shared-maintenance-core/`)
- **Purpose**: Base class providing common maintenance functionality
- **Features**: 
  - Abstract methods for health checks, duplicate detection, cleanup, and quality analysis
  - Unified reporting logic
  - Dashboard integration
  - Memory/history tracking
- **Usage**: Extended by both VCS and DIVA maintenance systems

### 2. **VCS Maintenance System** (`apify/vcs-maintenance/`)
- **Purpose**: VCS-specific maintenance operations
- **Extends**: `MaintenanceSystemCore`
- **Handles**: 
  - VC and Fund table maintenance
  - VCS-specific duplicate detection
  - Investment data quality analysis

### 3. **DIVA Maintenance System** (`apify/diva-maintenance/`)
- **Purpose**: DIVA-specific maintenance operations  
- **Extends**: `MaintenanceSystemCore`
- **Handles**:
  - Financial statements, investment performance, personnel data
  - DIVA-specific duplicate detection
  - Korean financial data quality analysis

### 4. **Consolidated Email Reporter** (`apify/consolidated-email-reporter/`)
- **Purpose**: Unified email reporting for both systems
- **Features**:
  - Combines VCS and DIVA reports
  - HTML and text email formats
  - Dashboard summary integration
  - Fallback to Actor storage

### 5. **Unified Dashboard** (Supabase)
- **Purpose**: Centralized monitoring and reporting
- **Components**:
  - `unified_maintenance_reports` table
  - Dashboard views and functions
  - Performance trend analysis
  - Critical issue notifications

## 📊 Data Flow

```
┌─────────────────┐    ┌─────────────────┐
│  VCS Maintenance │    │ DIVA Maintenance │
│     System      │    │     System       │
└─────────┬───────┘    └─────────┬───────┘
          │                      │
          │ Extends              │ Extends
          ▼                      ▼
    ┌─────────────────────────────────┐
    │   Shared Maintenance Core       │
    │   - Health Checks               │
    │   - Duplicate Detection         │
    │   - Quality Analysis            │
    │   - Unified Reporting           │
    └─────────────┬───────────────────┘
                  │
                  ▼
    ┌─────────────────────────────────┐
    │     Unified Dashboard           │
    │   (unified_maintenance_reports) │
    └─────────────┬───────────────────┘
                  │
                  ▼
    ┌─────────────────────────────────┐
    │  Consolidated Email Reporter    │
    │   - Combined Reports            │
    │   - HTML/Text Emails            │
    │   - Dashboard Summaries         │
    └─────────────────────────────────┘
```

## 🚀 Usage

### Running Individual Maintenance Systems

#### VCS Maintenance
```javascript
// Input configuration
{
  "maintenanceType": "standard",
  "performCleanup": true,
  "dashboard": { "enabled": true }
}
```

#### DIVA Maintenance  
```javascript
// Input configuration
{
  "maintenanceType": "standard", 
  "performCleanup": true,
  "dashboard": { "enabled": true }
}
```

### Running Consolidated Email Reporter
```javascript
// Input configuration
{
  "emailRecipients": ["admin@company.com"],
  "smtpHost": "smtp.gmail.com",
  "smtpUser": "your-email@gmail.com",
  "smtpPass": "your-app-password"
}
```

## 📋 Maintenance Reports Structure

### Unified Report Format
```json
{
  "system_type": "VCS|DIVA",
  "timestamp": "2024-01-15T10:30:00Z",
  "maintenance_type": "standard",
  "duration_seconds": 45,
  "success_rate": 100,
  "database_health": {
    "total_records": 25000,
    "specific_counts": {...}
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
    "status": "HEALTHY|NEEDS_ATTENTION|ERROR",
    "processing_speed": 555
  }
}
```

## 🗄️ Database Schema

### Unified Maintenance Reports Table
```sql
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

### Dashboard Views
- `unified_maintenance_latest_status` - Latest status per system
- `unified_maintenance_health_overview` - 24-hour health summary  
- `unified_maintenance_dashboard` - 7-day dashboard view

## 📧 Email Reporting

### Consolidated Email Features
- **Combined Status**: Overall health across both systems
- **System Comparison**: Side-by-side metrics
- **Dashboard Summary**: Key performance indicators
- **HTML Format**: Professional formatting with styling
- **Fallback Storage**: Saves to Actor storage if email fails

### Sample Email Content
```
🔧 UNIFIED MAINTENANCE REPORT ✅
==========================================

📅 Report Date: 2024-01-15 19:30:00
🎯 Overall Status: HEALTHY
📊 Systems Monitored: VCS & DIVA

📊 DASHBOARD SUMMARY
===================
• Total Systems: 2
• Reports Generated: 4
• Healthy Systems: 2
• Average Quality Score: 96/100
• Total Duplicates Removed: 23
• Total Records Processed: 30,343

🏢 VCS SYSTEM STATUS
===================
Status: HEALTHY ✅
Duration: 45 seconds
Records Processed: 25,000
Duplicates Removed: 15
Quality Score: 98/100

💰 DIVA SYSTEM STATUS
====================
Status: HEALTHY ✅
Duration: 60 seconds  
Records Processed: 5,343
Duplicates Removed: 8
Quality Score: 95/100
```

## 🔧 Configuration

### Environment Variables
```bash
# Supabase Configuration
SUPABASE_URL=your-supabase-url
SUPABASE_SERVICE_ROLE_KEY=your-service-role-key

# Email Configuration (Optional)
SMTP_HOST=smtp.gmail.com
SMTP_PORT=587
SMTP_USER=your-email@gmail.com
SMTP_PASS=your-app-password
```

### Apify Actor Configuration
Each maintenance system accepts these common inputs:
- `maintenanceType`: "standard" | "deep" | "emergency"
- `performCleanup`: boolean (default: true)
- `dashboard.enabled`: boolean (default: true)
- `emailConfig.enabled`: boolean (default: true)

## 📈 Monitoring & Alerts

### Dashboard Queries
```sql
-- Get latest status for all systems
SELECT * FROM unified_maintenance_latest_status;

-- Get health overview for last 24 hours  
SELECT * FROM unified_maintenance_health_overview;

-- Get performance trends for specific system
SELECT * FROM get_system_performance_trends('VCS', 7);
```

### Critical Issue Notifications
- Automatic PostgreSQL notifications for:
  - System status = 'ERROR'
  - Quality score < 80
- Real-time alerts via `pg_notify`

## 🔄 Deployment

### 1. Deploy Shared Core
```bash
cd apify/shared-maintenance-core
npm install
# Deploy to Apify (if needed as separate actor)
```

### 2. Update VCS Maintenance
```bash
cd apify/vcs-maintenance  
npm install
# Deploy to Apify
```

### 3. Update DIVA Maintenance
```bash
cd apify/diva-maintenance
npm install  
# Deploy to Apify
```

### 4. Deploy Email Reporter
```bash
cd apify/consolidated-email-reporter
npm install
# Deploy to Apify
```

### 5. Setup Database Schema
```bash
# Run unified-maintenance-schema.sql in Supabase
psql -h your-host -d your-db -f database/unified-maintenance-schema.sql
```

## 🎯 Benefits

### 1. **Consistency**
- Same logic and features across both systems
- Unified reporting format
- Consistent quality standards

### 2. **Maintainability** 
- Single source of truth for core functionality
- Easy to update shared features
- Reduced code duplication

### 3. **Visibility**
- Consolidated dashboard view
- Unified email reports
- Cross-system performance comparison

### 4. **Scalability**
- Easy to add new maintenance systems
- Extensible architecture
- Modular design

## 🚨 Troubleshooting

### Common Issues

1. **Import Errors**: Ensure all modules use ES6 imports consistently
2. **Database Connection**: Verify Supabase credentials and table permissions
3. **Email Delivery**: Check SMTP configuration and firewall settings
4. **Missing Reports**: Verify Actor storage and database connectivity

### Debug Commands
```bash
# Check Actor storage
curl "https://api.apify.com/v2/acts/YOUR-ACTOR-ID/runs/last/dataset/items"

# Test database connection
node -e "import { createClient } from '@supabase/supabase-js'; console.log('Connected');"

# Verify email configuration  
node -e "import nodemailer from 'nodemailer'; console.log('Email ready');"
```

## 📝 Future Enhancements

- [ ] Real-time dashboard with WebSocket updates
- [ ] Slack/Teams integration for notifications
- [ ] Performance trend analysis and predictions
- [ ] Automated maintenance scheduling
- [ ] Cross-system data integrity checks
- [ ] Mobile-responsive dashboard interface

---

**Version**: 3.0  
**Last Updated**: January 2024  
**Maintained By**: SparkLabs Team 