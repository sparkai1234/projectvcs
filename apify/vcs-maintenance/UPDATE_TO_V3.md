# 🚀 Update VCS Maintenance Actor to v3.0

## Quick Update Guide

### 1. **Update main.js**
Replace the entire content of `main.js` in your Apify Actor with the new v3.0 version.

**Key Changes in v3.0:**
- Now extends `MaintenanceSystemCore` from shared architecture
- Enhanced duplicate detection and quality analysis
- Unified dashboard integration
- Quality score calculation (0-100)
- Memory tracking capabilities

### 2. **Update package.json**
Replace the `package.json` with the new v3.0 configuration:

```json
{
    "name": "vcs-maintenance-system",
    "version": "3.0.0",
    "description": "VCS Maintenance System v3.0 - Part of Unified Maintenance Architecture with shared core and consolidated reporting",
    "main": "main.js",
    "type": "module",
    "scripts": {
        "start": "node main.js",
        "test": "node test/maintenance-test.js"
    },
    "dependencies": {
        "apify": "^3.4.2",
        "@supabase/supabase-js": "^2.38.0",
        "node-cron": "^3.0.2",
        "nodemailer": "^6.9.7"
    },
    "keywords": [
        "vcs",
        "maintenance", 
        "duplicates",
        "data-quality",
        "korean-startups",
        "venture-capital",
        "unified-architecture",
        "shared-core",
        "apify"
    ],
    "author": "SparkLabs VCS Team",
    "license": "MIT",
    "repository": {
        "type": "git",
        "url": "https://github.com/sparkai1234/projectvcs.git",
        "directory": "apify/vcs-maintenance"
    },
    "engines": {
        "node": ">=18.0.0"
    }
}
```

### 3. **Add Shared Maintenance Core**
You need to add the shared maintenance core files. Create a new folder structure:

```
apify/
├── vcs-maintenance/
│   ├── main.js (updated)
│   ├── package.json (updated)
│   └── shared-maintenance-core/
│       ├── MaintenanceSystem.js (new)
│       └── package.json (new)
```

### 4. **Update Input Schema (Optional)**
The input schema remains the same, but you can add new options:

```json
{
    "title": "VCS Maintenance v3.0 Input",
    "type": "object",
    "schemaVersion": 1,
    "properties": {
        "maintenanceType": {
            "title": "Maintenance Type",
            "type": "string",
            "description": "Type of maintenance to perform",
            "default": "standard",
            "enum": ["standard", "deep", "quick"]
        },
        "performCleanup": {
            "title": "Perform Cleanup",
            "type": "boolean",
            "description": "Whether to actually remove duplicates",
            "default": true
        },
        "dashboard": {
            "title": "Dashboard Integration",
            "type": "object",
            "description": "Dashboard integration settings",
            "properties": {
                "enabled": {
                    "title": "Enable Dashboard",
                    "type": "boolean",
                    "default": true
                }
            }
        },
        "action": {
            "title": "Action Type",
            "type": "string",
            "description": "Action to perform",
            "default": "maintenance",
            "enum": ["maintenance", "retrieveMemories"]
        },
        "memoryOptions": {
            "title": "Memory Options",
            "type": "object",
            "description": "Options for memory retrieval",
            "properties": {
                "limit": {
                    "title": "Limit",
                    "type": "integer",
                    "default": 10
                },
                "sortBy": {
                    "title": "Sort By",
                    "type": "string",
                    "default": "created_at"
                }
            }
        }
    }
}
```

## 🔧 Step-by-Step Update Process

### In Apify Console:

1. **Go to Source Tab**
   - Click on the "Source" tab in your VCS Maintenance Actor

2. **Update main.js**
   - Replace the entire content with the new v3.0 main.js
   - The new version extends MaintenanceSystemCore

3. **Update package.json**
   - Replace with the v3.0 package.json configuration
   - Version should be "3.0.0"

4. **Add Shared Core (Important!)**
   - Create a new folder: `shared-maintenance-core`
   - Add `MaintenanceSystem.js` file
   - Add `package.json` for shared core

5. **Save Changes**
   - Click "Save" to save all changes

6. **Build Actor**
   - Click "Build" to create a new version
   - This will be build 0.0.3 (v3.0)

7. **Test the Actor**
   - Run a test with basic configuration:
   ```json
   {
     "maintenanceType": "standard",
     "performCleanup": true,
     "dashboard": { "enabled": true }
   }
   ```

## 📊 Expected v3.0 Output

### Console Logs:
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

### Actor Storage:
- `vcs_maintenance_report` - Full maintenance report
- `vcs_maintenance_summary` - Quick summary metrics

### Database:
- New record in `unified_maintenance_reports` table with `system_type = 'VCS'`

## 🚨 Important Notes

1. **Shared Core Dependency**: The v3.0 requires the shared maintenance core files
2. **Database Schema**: Make sure the unified maintenance schema is applied to Supabase
3. **Environment Variables**: Same as v2.0 (SUPABASE_URL, SUPABASE_SERVICE_ROLE_KEY)
4. **Backward Compatibility**: All v2.0 functionality is preserved

## ✅ Verification Checklist

- [ ] main.js updated to v3.0
- [ ] package.json updated to version 3.0.0
- [ ] Shared maintenance core files added
- [ ] Actor builds successfully
- [ ] Test run completes without errors
- [ ] Quality score appears in logs
- [ ] Dashboard integration works
- [ ] Actor storage contains expected outputs

## 🔄 Rollback Plan

If issues occur, you can rollback to v2.0:
1. Use the previous build (0.0.2)
2. Or restore the v2.0 main.js and package.json from git history

---

**Version**: 3.0.0  
**Update Date**: June 2024  
**Status**: Ready for deployment  
**Compatibility**: Backward compatible with v2.0 inputs 