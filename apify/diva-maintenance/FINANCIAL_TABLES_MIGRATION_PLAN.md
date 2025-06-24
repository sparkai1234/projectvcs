# 🏦 DIVA Financial Tables Migration Plan

## 🚨 Critical Issue Identified

**Problem**: The current `diva_financial_statements` table has **data corruption**:
- 500 records total (250 balance sheets + 250 income statements)
- **ALL records have balance sheet structure** (assets, liabilities, equity)
- **250 records are mislabeled** as "income_statement" but contain balance sheet data
- **NO income statement data** (operating_revenue, operating_profit, etc.) exists

## 🎯 Solution: Separate Financial Tables

### New Architecture:
1. **`diva_balance_sheets`** - Pure balance sheet data (재무상태표)
2. **`diva_income_statements`** - Pure income statement data (손익계산서)

## 📋 Migration Steps

### Step 1: Execute Schema
```sql
-- Run: separate_financial_tables_schema.sql in Supabase SQL Editor
-- Creates: diva_balance_sheets, diva_income_statements tables
-- Includes: Indexes, triggers, views, RLS policies
```

### Step 2: Migrate Data
```bash
# Run the migration script
python migrate_financial_tables.py
```

### Step 3: Update DIVA Maintenance v3.0
- Update duplicate detection for separate tables
- Update data quality analysis
- Update cleanup procedures

### Step 4: Verify & Test
- Verify data integrity
- Test DIVA Maintenance v3.0
- Update dashboard integration

## 📊 Expected Results

### Before Migration:
```
diva_financial_statements: 500 records
├── 250 "balance_sheet" records ✅ (correct structure)
└── 250 "income_statement" records ❌ (wrong structure - has balance data)
```

### After Migration:
```
diva_balance_sheets: 250 records
├── Company assets, liabilities, equity data ✅
└── Proper balance sheet structure ✅

diva_income_statements: 250 records  
├── Company revenue, expenses, profit data ✅
└── Proper income statement structure ✅
```

## 🔧 Technical Benefits

1. **Data Integrity**: Each table has proper field structure
2. **Performance**: Optimized indexes for each data type
3. **Clarity**: Clear separation of financial statement types
4. **Compatibility**: Combined view for backward compatibility
5. **Analysis**: Financial health analysis view with proper ratios

## 🎯 Field Mapping

### Balance Sheets (재무상태표):
- `total_assets` ← column_5 (자산)
- `startup_investment_assets` ← column_6 (창업투자자산)
- `total_liabilities` ← column_7 (부채)
- `paid_in_capital` ← column_8 (자본금/출자금)
- `total_equity` ← column_9 (자본)

### Income Statements (손익계산서):
- `operating_revenue` ← column_5 (영업수익)
- `operating_expenses` ← column_6 (영업비용)
- `operating_profit` ← column_7 (영업이익)
- `net_income_before_taxes` ← column_8 (법인세비용차감전이익)
- `net_profit` ← column_9 (당기순이익)

## 🚀 Next Steps

1. **Execute Schema**: Run `separate_financial_tables_schema.sql`
2. **Run Migration**: Execute `migrate_financial_tables.py`
3. **Update DIVA v3.0**: Modify maintenance system for new tables
4. **Test & Verify**: Ensure data integrity and proper functionality
5. **Deploy**: Update production systems

## 📈 Impact on DIVA Maintenance v3.0

The maintenance system will need updates to:
- Check both `diva_balance_sheets` and `diva_income_statements` tables
- Detect duplicates in each table separately
- Analyze data quality for proper financial metrics
- Generate comprehensive financial health reports

This migration will **resolve the critical data corruption** and provide a **solid foundation** for accurate financial analysis of Korean VC firms. 