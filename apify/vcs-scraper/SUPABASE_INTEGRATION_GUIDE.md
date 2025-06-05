# 🚀 VCS Scraper v2.2.0 - Supabase Integration Guide

## 📋 Overview

Your VCS scraper v2.1.3 has been upgraded to **v2.2.0** with full Supabase integration! Now it automatically saves all scraped data directly to your Supabase database.

## ✨ What's New in v2.2.0

- **🔗 Automatic Supabase Integration**: Data flows directly from VCS API → Apify → Supabase
- **📊 Smart Data Transformation**: Converts VCS data to match your database schema
- **🔄 Upsert Strategy**: Updates existing records, inserts new ones
- **⚡ Real-time Processing**: Data appears in Supabase as it's scraped
- **🛡️ Error Handling**: Continues scraping even if some database writes fail

## 🎯 Database Schema

Your data is saved to these Supabase tables:

### `vc_table` (Investors/VCs)
- **company_id**: Unique identifier from VCS
- **company_name**: Korean company name
- **location**: City/region
- **representative**: CEO/representative name
- **established_date**: Founding date
- **contact_info**: Address, phone (JSONB)
- **disclosure_data**: Industry, business details (JSONB)

### `fund_table` (Investment Funds)
- **company_id**: Links to vc_table
- **fund_name**: Fund name
- **fund_type**: Fund category
- **fund_size**: Fund size in KRW
- **establishment_date**: Fund launch date
- **investment_focus**: Investment areas (array)
- **fund_details**: Additional fund info (JSONB)

## 🔧 Setup Instructions

### 1. Get Your Supabase Service Role Key

1. Go to your [Supabase Dashboard](https://supabase.com/dashboard/project/udfgtccxbqmalgpqyxzz/settings/api)
2. Navigate to **Settings** → **API**
3. Copy your **service_role** key (not the anon key!)

### 2. Configure Apify Actor

When running your VCS scraper in Apify:

```json
{
  "updateMode": "incremental",
  "dataSource": "both",
  "maxPages": 100,
  "exportToSupabase": true,
  "supabaseUrl": "https://udfgtccxbqmalgpqyxzz.supabase.co",
  "supabaseKey": "your_service_role_key_here"
}
```

### 3. Test Locally (Optional)

```bash
# Create .env file
echo "SUPABASE_SERVICE_ROLE_KEY=your_key_here" > .env

# Run test
node test_vcs_supabase_integration.js
```

## 📊 How It Works

1. **🌐 VCS API Scraping**: Extracts data using proven v2.1.3 workflow
2. **🔄 Data Transformation**: Converts to Supabase schema format
3. **💾 Database Upsert**: Saves to your tables with conflict resolution
4. **📈 Real-time Updates**: See data appear in Supabase as scraping progresses

## 🎛️ Configuration Options

| Parameter | Description | Default |
|-----------|-------------|---------|
| `exportToSupabase` | Enable database export | `true` |
| `supabaseUrl` | Your project URL | Pre-configured |
| `supabaseKey` | Service role key | Required |
| `dataSource` | What to scrape | `"both"` |
| `maxPages` | Pages per source | `100` |

## 🔍 Monitoring & Logs

Watch the Apify logs for:
- `✅ Supabase client initialized` - Connection successful
- `💾 Upserting X records to Supabase...` - Data being saved
- `✅ Supabase upsert complete: X success, Y errors` - Batch results

## 🚨 Troubleshooting

### "Missing Supabase credentials"
- Ensure `supabaseKey` is provided in Actor input
- Check the key is the **service_role** key, not anon key

### "Database connection failed"
- Verify your Supabase project is active
- Check Row Level Security (RLS) policies allow service role access

### "Upsert errors"
- Check table schema matches expectations
- Verify foreign key constraints are satisfied

## 📈 Performance

- **Rate Limiting**: 100ms between database writes
- **Batch Processing**: Processes data page by page
- **Error Tolerance**: Continues scraping if some writes fail
- **Memory Efficient**: Streams data without accumulating

## 🎉 Expected Results

Running with `dataSource: "both"` should give you:
- **~717 investors** in `vc_table`
- **~3,689 funds** in `fund_table`
- **Real-time data updates** as scraping progresses

## 🔗 Useful Links

- [Your Supabase Dashboard](https://supabase.com/dashboard/project/udfgtccxbqmalgpqyxzz)
- [View vc_table](https://supabase.com/dashboard/project/udfgtccxbqmalgpqyxzz/editor/20438)
- [View fund_table](https://supabase.com/dashboard/project/udfgtccxbqmalgpqyxzz/editor/20439)

---

🎯 **Ready to go!** Your VCS scraper v2.2.0 is now fully integrated with Supabase and ready for production use. 