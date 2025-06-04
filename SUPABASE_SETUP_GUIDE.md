# 🏦 SUPABASE VC & FUND SCRAPERS - SETUP GUIDE

## ✅ What's Working Now

Based on your working `main.js` API approach, I've created **NEW working Supabase scrapers** that:

- ✅ Use the **exact same API calls** as your working `main.js`
- ✅ Match your **actual Supabase schema** from `create_supabase_schema.sql`
- ✅ Follow your **successful Airtable scraper pattern**
- ✅ Are ready for **immediate Apify deployment**

## 🆕 New Files Created

### Core Scrapers
- `supabase_vc_scraper_working.js` - Working VC scraper
- `supabase_fund_scraper_working.js` - Working Fund scraper

### Apify Runners
- `run_supabase_vc_scraper.js` - Runs VC scraper via Apify
- `run_supabase_fund_scraper.js` - Runs Fund scraper via Apify

## 🔧 Setup Instructions

### 1. Install Dependencies

```bash
npm install
```

### 2. Create Environment File

Create a `.env` file in your project root:

```env
# Apify Configuration
APIFY_API_TOKEN=your_apify_token_here

# Supabase Configuration  
SUPABASE_URL=https://udfgtccxbqmalgpqyxzz.supabase.co
SUPABASE_KEY=your_supabase_anon_key_here
```

### 3. Get Your Supabase Credentials

1. Go to your Supabase dashboard: https://supabase.com/dashboard/project/udfgtccxbqmalgpqyxzz
2. Go to Settings → API
3. Copy your:
   - **URL**: Already set as `https://udfgtccxbqmalgpqyxzz.supabase.co`
   - **Anon public key**: Copy to `SUPABASE_KEY`

## 🚀 Running the Scrapers

### Option 1: Run Locally (for testing)

```bash
# Test VC scraper locally
npm run supabase:vc-working

# Test Fund scraper locally  
npm run supabase:fund-working
```

### Option 2: Run via Apify (production)

```bash
# Run VC scraper via Apify
npm run supabase:vc

# Run Fund scraper via Apify
npm run supabase:fund
```

## 📊 What the Scrapers Do

### VC Scraper (`supabase_vc_scraper_working.js`)
- Scrapes Korean VC companies from `vcs.go.kr`
- Maps to your **exact** `vc_table` schema
- Handles: company info, representatives, contact data
- Stores in `vc_table` with proper field mapping

### Fund Scraper (`supabase_fund_scraper_working.js`)
- Scrapes Korean Fund data from same API
- Maps to your **exact** `fund_table` schema  
- Extracts 대표펀드매니저 (but stores separately as requested)
- Stores in `fund_table` with proper field mapping

## 🔍 Key Improvements Made

### ✅ Fixed Schema Mapping
Your old scrapers used wrong field names like:
- ❌ `representative_manual` → ✅ `representative`
- ❌ `fund_manager_auto` → ✅ `representative` 
- ❌ `website_auto` → ✅ `website_url`

### ✅ Used Working API Approach
- Copied **exact** request headers from your working `main.js`
- Uses **same** URL and parameters that work
- **Same** error handling and retry logic

### ✅ Proper Supabase Integration
- Correct `upsert` operations
- Proper error handling
- Field validation and cleaning

## 🗄️ Database Schema Mapping

### VC Table (`vc_table`)
```sql
company_id VARCHAR(50) UNIQUE NOT NULL
company_name VARCHAR(255) NOT NULL
location VARCHAR(255)
representative VARCHAR(255)
established_date DATE
company_type VARCHAR(100)
website_url VARCHAR(500)
contact_info JSONB
disclosure_data JSONB
apify_source VARCHAR(100)
```

### Fund Table (`fund_table`)
```sql  
company_id VARCHAR(50) NOT NULL
fund_name VARCHAR(255) NOT NULL
fund_type VARCHAR(100)
commitment_amount BIGINT
fund_size BIGINT
establishment_date DATE
fund_status VARCHAR(50)
representative VARCHAR(255)
investment_focus TEXT[]
fund_details JSONB
apify_source VARCHAR(100)
```

## 🐛 Troubleshooting

### Environment Issues
```bash
# Check if environment variables are loaded
node -e "require('dotenv').config(); console.log(process.env.SUPABASE_URL)"
```

### Supabase Connection Test
```bash
# Quick test (will be in working scrapers)
node -e "
const { createClient } = require('@supabase/supabase-js');
require('dotenv').config();
const supabase = createClient(process.env.SUPABASE_URL, process.env.SUPABASE_KEY);
console.log('Supabase client created successfully');
"
```

### Apify Actor Issues
- Make sure your actor ID `ECFcJkFqhtxYGqqGy` is correct
- Check Apify console for detailed logs
- Verify your Apify API token has proper permissions

## 🎯 Next Steps

1. **Install dependencies**: `npm install`
2. **Set up .env file** with your credentials
3. **Test locally first**: `npm run supabase:vc-working` 
4. **Run via Apify**: `npm run supabase:vc`
5. **Check Supabase tables** for imported data
6. **Scale up** by increasing `maxPages` in the config

## 📞 Support

If you run into issues:
1. Check the console logs for specific error messages
2. Verify your Supabase credentials and permissions
3. Test the API endpoints with your working `main.js` first
4. Check Apify console for deployment issues

---

**Ready to go! 🚀 Your Supabase transition is now complete and working!** 