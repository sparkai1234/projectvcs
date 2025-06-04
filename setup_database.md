## 🚨 IMPORTANT: Column Error Fixed!

**✅ The `business_description` column error has been resolved!** 

The SQL files now use the correct column names and include proper fallbacks for columns that may not exist yet.

---

# 🗄️ Database Setup Guide - Korean VC Intelligence System

## Quick Setup Instructions

### **Step 1: Access Supabase Dashboard**
1. Go to [supabase.com](https://supabase.com)
2. Sign in and select your project
3. Navigate to **SQL Editor** in the left sidebar

### **Step 2: Execute SQL Files in Order**

Copy and paste each SQL file content into the SQL Editor and click "Run":

#### **A. Fund of Funds Tables** 
📁 Copy content from: `sql/create_fund_of_funds_tables.sql`
- Creates `kdb_fund_of_funds_raw` table
- Creates `kgrowth_fund_of_funds_raw` table  
- Creates integrated views for analysis

#### **B. KVIC API Tables**
📁 Copy content from: `sql/create_kvic_tables.sql`
- Creates `kvic_investment_raw` table
- Creates `kvic_fund_raw` table
- Creates `kvic_portfolio_raw` table
- Creates government VC analytics views

#### **C. PDF AI Analysis Tables**
📁 Copy content from: `sql/create_pdf_analysis_tables.sql`
- Creates `pdf_analysis_results` table
- Creates `ai_trend_insights` table
- Creates `investment_intelligence_insights` table
- Creates `trend_reports` table
- Creates analysis views

### **Step 3: Verify Tables Created**

Run this query to verify all tables exist:

```sql
SELECT table_name, table_type 
FROM information_schema.tables 
WHERE table_schema = 'public' 
AND table_name LIKE '%fund%' 
   OR table_name LIKE '%kvic%' 
   OR table_name LIKE '%pdf%'
   OR table_name LIKE '%trend%'
ORDER BY table_name;
```

Expected tables:
- ✅ `kdb_fund_of_funds_raw`
- ✅ `kgrowth_fund_of_funds_raw`
- ✅ `kvic_investment_raw`
- ✅ `kvic_fund_raw`
- ✅ `kvic_portfolio_raw`
- ✅ `pdf_analysis_results`
- ✅ `ai_trend_insights`
- ✅ `investment_intelligence_insights`
- ✅ `trend_reports`

## 🔧 Alternative: Command Line Setup

If you have `psql` installed or can access it:

```bash
# Set your database URL
export DATABASE_URL="postgresql://postgres:[password]@db.[project-ref].supabase.co:5432/postgres"

# Run all setup commands
npm run db:setup-all

# Or run individually:
npm run db:create-fof-tables
npm run db:create-kvic-tables  
npm run db:create-pdf-tables
```

## 🚀 After Database Setup

Once tables are created, you can:

1. **Start scraping Fund of Funds data:**
   ```bash
   npm run fof:all
   ```

2. **Add PDF reports and analyze:**
   ```bash
   # Add PDF files to pdf_reports/ directory
   npm run pdf:analyze
   ```

3. **Generate trend reports:**
   ```bash
   npm run trends:generate
   ```

## 📊 Data Flow Architecture

```
┌─────────────────────┐    ┌─────────────────────┐    ┌─────────────────────┐
│   Raw Data Tables   │    │   AI Analysis       │    │   Trend Reports     │
│                     │    │                     │    │                     │
│ • kdb_fund_...      │    │ • pdf_analysis_...  │    │ • trend_reports     │
│ • kgrowth_fund_...  │───▶│ • ai_trend_...      │───▶│ • JSON exports      │
│ • kvic_...          │    │ • investment_...    │    │ • Markdown reports  │
└─────────────────────┘    └─────────────────────┘    └─────────────────────┘
```

## ⚠️ Important Notes

- **Run SQL files in order** (Fund of Funds → KVIC → PDF Analysis)
- **Each SQL file is idempotent** - safe to run multiple times
- **Tables use `IF NOT EXISTS`** - won't overwrite existing data
- **Indexes are created automatically** for optimal performance

---

**Ready to build the most comprehensive Korean VC intelligence system! 🇰🇷🚀** 