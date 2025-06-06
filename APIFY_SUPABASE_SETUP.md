# 🔧 Apify Supabase Environment Setup

## Current Issue
Your DIVA scraper is running successfully but failing to insert data into Supabase due to missing environment variables.

## 🚨 **URGENT FIX REQUIRED**

### Step 1: Set Environment Variables in Apify

1. **Go to your Apify Actor**: https://console.apify.com/actors
2. **Find your "comprehensive-diva-scraper" actor**
3. **Click on Settings → Environment Variables**
4. **Add these two variables:**

```bash
SUPABASE_URL=https://udfgtccxbqmalgpqyxzz.supabase.co
SUPABASE_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InVkZmd0Y2N4YnFtYWxncHF5eHp6Iiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc0ODk0NjY5NiwiZXhwIjoyMDY0NTIyNjk2fQ.JgyEKjOhuZpNCCOadsaK90Q8CcoPf_rgdtSXh-1BU18
```

### Step 2: Re-deploy Updated Code

The scraper code has been updated with better error handling. You need to:

1. **Push the updated `main.js` to GitHub**
2. **Re-build the Apify actor** with the new code
3. **Run a test** to verify Supabase connection

### Step 3: Test the Fix

After setting environment variables, your logs should show:
```
✅ Supabase client initialized
📋 Supabase URL: https://udfgtccxbqmalgpqyxzz.supabase.co
🔑 Supabase Key: ...F-1BU18
✅ Supabase connection test passed
```

Instead of:
```
⚠️ Supabase export disabled - missing credentials
```

## 📊 Expected Results After Fix

With the improved error handling, you'll now see detailed error messages instead of empty `{}` objects:

```
❌ Supabase insert error for diva_financial_raw:
   Code: 23502
   Message: null value in column "company_id" violates not-null constraint
   Details: Failing row contains...
   Hint: null
   Data attempted: { "company_name": "...", ... }
```

This will help identify any remaining table schema mismatches.

## 🎯 Next Steps After Environment Fix

1. **Monitor logs** for detailed error messages
2. **Fix any table schema issues** that are revealed
3. **Verify data is successfully inserted** into all DIVA tables
4. **Schedule regular runs** (Mon/Wed as planned)

## 🔗 Quick Links

- **Apify Console**: https://console.apify.com/actors
- **Current Run Logs**: https://api.apify.com/v2/logs/4eRocHSOXK6t4zkHB
- **Supabase Dashboard**: https://udfgtccxbqmalgpqyxzz.supabase.co
- **GitHub Repository**: https://github.com/sparkai1234/projectvcs.git

---

**Status**: 🔴 **REQUIRES IMMEDIATE ACTION** - Environment variables needed for Supabase integration 