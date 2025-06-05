# 📁 Archive Directory

This directory contains files that were archived during the migration to Apify automation platform.

## 📅 Archive Date: 2025-06-05

## 🗂️ Contents:

### `/sql_batches/` - SQL Batch Files
- **Count**: 84+ files
- **Total Size**: ~4.2GB
- **Description**: Old VCS fund data import batch files
- **Files**: 
  - `vcs_funds_simple_batch_01.sql` to `vcs_funds_simple_batch_74.sql`
  - `vcs_funds_mega_batch_01.sql` to `vcs_funds_mega_batch_10.sql`
  - `vcs_funds_fixed_mega_batch_01.sql` to `vcs_funds_fixed_mega_batch_10.sql`

### `/old_scripts/` - Legacy Scripts
- **Description**: Scripts used for creating SQL batch files
- **Files**:
  - `create_fixed_mega_batch.js`
  - `create_mega_batch.js`
  - `create_simple_fund_importer.js`
  - `create_exact_fund_importer.js`
  - `create_minimal_fund_importer.js`
  - `create_corrected_fund_importer.js`
  - `create_vcs_fund_importer.js`
  - `create_upsert_batches.js`
  - `create_upsert_vcs_sql.js`
  - `create_corrected_vcs_sql.js`
  - `create_batch_sql_files.js`

## 🎯 Reason for Archiving

These files were archived as part of the migration to **Apify Weekly Automation Platform**:

1. **SQL Batch Files**: No longer needed as data will be automatically imported via Apify actors
2. **Legacy Scripts**: Batch creation scripts are obsolete with new automated workflow
3. **Clean Repository**: Preparing for GitHub sync before Apify migration

## 🔍 Recovery

If any of these files are needed in the future:
1. Check this archive directory
2. Files can be restored to the main project if needed
3. All files are preserved with original content

---

**Migration Status**: Ready for Apify Phase 1 - VCS Scraper Actor deployment 🚀 