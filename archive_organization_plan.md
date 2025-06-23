# DIVA Project File Organization Plan

## 🏆 PRODUCTION ESSENTIAL FILES (Keep in Root)
**Core production files that must remain easily accessible:**

### Main Production Scripts
- `main.js` - Core DIVA scraper (latest working version)
- `package.json` - Dependencies
- `requirements.txt` - Python dependencies
- `actor.json` - Apify configuration
- `.env` - Environment variables (template)

### Current Database Schema & Utilities
- `simple_clear_diva.sql` - Production database clearing script
- `PRODUCTION_SUCCESS.md` - Production completion documentation

### Essential Documentation
- `README.md` - Main project documentation
- `SUPABASE_SETUP_GUIDE.md` - Database setup
- `APIFY_SUPABASE_SETUP.md` - Deployment guide

---

## 📁 ARCHIVE CATEGORIES

### 1. `archive/old-versions/`
**Previous versions and iterations:**
- `temp_v5310.js`
- `v5310_working_main.js` 
- `precision_fixes_v5310.js`
- `v5310_deployment_summary.md`
- `DIVA-V5-DEPLOYMENT-STATUS.md`

### 2. `archive/development-testing/`
**Development, testing, and debugging files:**
- `test_*.js` - All test files
- `debug_*.js` - All debug files  
- `diagnose_*.py` - All diagnostic files
- `validate_*.py` - All validation files
- `analyze_*.py` - All analysis files
- `check_*.js` - All check files
- `verify_*.js` - All verification files

### 3. `archive/database-utilities/`
**Database management and migration tools:**
- `create_*.sql` - Database creation scripts
- `fix_*.sql` - Database fix scripts
- `cleanup_*.sql` - Database cleanup scripts
- `migrate_*.py` - Migration scripts
- `*_schema*.sql` - Schema files
- All constraint and table management files

### 4. `archive/migration-tools/`
**Data migration and transfer utilities:**
- `*migration*.py` - All migration scripts
- `*upload*.py` - All upload scripts  
- `transfer_*.js` - All transfer scripts
- `*_matcher*.py` - All matching scripts

### 5. `archive/documentation/`
**Historical documentation and guides:**
- Status update files (`*STATUS*.md`)
- Deployment guides for old versions
- Investigation reports and logs
- Setup guides for deprecated processes

---

## 🎯 NEXT STEPS
1. Execute file moves according to categories
2. Verify essential files remain accessible
3. Update README with new organization structure
4. Create quick access aliases for archived tools if needed 