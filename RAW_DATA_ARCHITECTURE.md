# Raw Data Architecture for DIVA System

## Overview

Your DIVA system now follows a **raw data first** architecture, similar to how `vc_table` and `fund_table` work. This provides better data integrity, flexibility, and analysis capabilities.

## Current Data Architecture

### ✅ **Raw Data Tables** (Store Original Scraped Data)

| Table | Status | Description | Data Source |
|-------|--------|-------------|-------------|
| `vc_table` | ✅ **Active** | Raw VC company data | vcs.go.kr scraper |
| `fund_table` | ✅ **Active** | Raw fund data | vcs.go.kr scraper |
| `contacts_full` | ✅ **Active** | Raw contact data | Contact scrapers |
| `diva_personnel_raw` | ⚠️ **Needs Creation** | Raw DIVA personnel data | DIVA personnel scraper |
| `diva_fund_raw` | ⚠️ **Needs Creation** | Raw DIVA fund data | DIVA fund scraper |
| `diva_disclosure_raw` | ⚠️ **Needs Creation** | Raw DIVA disclosure data | DIVA disclosure scraper |
| `diva_professional_raw` | ⚠️ **Needs Creation** | Raw DIVA professional data | DIVA professional scraper |

### ✅ **Processed/Analysis Tables** (Derived from Raw Data)

| Table | Status | Description | Source Tables |
|-------|--------|-------------|---------------|
| `diva_intelligence` | ✅ **Active** | Aggregated intelligence analysis | `diva_personnel_raw` |
| `diva_professional_network` | ✅ **Active** | Professional network analysis | `diva_professional_raw` |
| `diva_fund_intelligence` | ✅ **Active** | Fund intelligence analysis | `diva_fund_raw` |
| `contacts_matched` | ✅ **Active** | Fuzzy matched contacts | `contacts_full` |

## Raw DIVA Personnel Table Schema

```sql
CREATE TABLE diva_personnel_raw (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    
    -- Company identification
    company_id VARCHAR(50) NOT NULL,           -- Links to vc_table
    company_name VARCHAR(255) NOT NULL,        -- Company name
    
    -- Personnel numbers (raw scraped data)
    total_personnel INTEGER DEFAULT 0,         -- 전체 인력
    professional_staff INTEGER DEFAULT 0,      -- 전문인력  
    investment_review_staff INTEGER DEFAULT 0, -- 심사인력
    management_staff INTEGER DEFAULT 0,        -- 경영지원인력
    
    -- Scraping metadata
    reference_year_month VARCHAR(20),          -- Period (e.g., "2025-04")
    page_number INTEGER,                       -- Source page number
    row_index INTEGER,                         -- Row position on page
    extracted_at TIMESTAMP,                    -- When scraped
    source_url TEXT,                           -- Source URL
    
    -- Standard timestamps
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW(),
    
    -- Foreign key
    FOREIGN KEY (company_id) REFERENCES vc_table(company_id)
);
```

## Current Data Sample

From your existing DIVA data, we have 10 companies with complete raw personnel data:

```json
{
  "company_id": "OP20190375",
  "company_name": "경남벤처투자",
  "total_personnel": 10,
  "professional_staff": 5,
  "investment_review_staff": 6,
  "management_staff": 4,
  "reference_year_month": "2025-04",
  "page_number": 1,
  "row_index": 1,
  "extracted_at": "2025-06-04T23:20:25.231248",
  "source_url": "http://diva.kvca.or.kr/div/dii/DivItmMnpwrInq"
}
```

## Benefits of Raw Data Architecture

### 🎯 **Flexibility**
- Query raw data for custom analysis
- Recalculate metrics without re-scraping
- Historical data tracking

### 🔍 **Data Integrity**
- Audit trail of original scraped data
- No data loss during processing
- Ability to reprocess with improved algorithms

### 📊 **Consistency**
- Matches your existing `vc_table`/`fund_table` pattern
- Unified data architecture across all sources
- Easier maintenance and understanding

### 🔄 **Reprocessing**
- Update analysis algorithms without re-scraping
- A/B test different processing approaches
- Fix processing bugs retroactively

## Setup Instructions

### 1. Create Raw Tables
```bash
# Go to Supabase SQL Editor
https://supabase.com/dashboard/project/udfgtccxbqmalgpqyxzz/sql

# Run the SQL file
create_diva_raw_tables.sql
```

### 2. Import Raw Data
```bash
# Import the CSV file to diva_personnel_raw table
diva_personnel_raw.csv
```

### 3. Verify Setup
```bash
npm run diva:check-structure
npm run diva:verify
```

## NPM Scripts

| Script | Purpose |
|--------|---------|
| `npm run diva:check-structure` | Analyze current data structure |
| `npm run diva:migrate-raw` | Extract raw data from processed tables |
| `npm run diva:setup-raw` | Setup raw tables and create import files |
| `npm run diva:verify` | Verify data integrity |

## Files Created

| File | Purpose |
|------|---------|
| `create_diva_raw_tables.sql` | SQL to create raw tables |
| `diva_personnel_raw.csv` | Raw personnel data for import |
| `diva_personnel_raw_complete.json` | Complete raw data in JSON format |
| `RAW_DATA_ARCHITECTURE.md` | This documentation |

## Next Steps

1. **Create Tables**: Run `create_diva_raw_tables.sql` in Supabase
2. **Import Data**: Upload `diva_personnel_raw.csv` to `diva_personnel_raw` table
3. **Update Scrapers**: Modify DIVA scrapers to save to raw tables first
4. **Rebuild Processing**: Update intelligence tables to be built from raw data
5. **Expand Raw Data**: Add fund, disclosure, and professional raw tables

## Data Flow

```
DIVA Website
     ↓ (scraping)
Raw Tables (diva_personnel_raw, etc.)
     ↓ (processing/analysis)
Intelligence Tables (diva_intelligence, etc.)
     ↓ (API/queries)
Analysis & Reports
```

This architecture gives you the same benefits as your `vc_table`/`fund_table` setup: raw data for flexibility, processed tables for quick analysis. 