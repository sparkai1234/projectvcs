-- VCS Fund MEGA BATCH 10/10
-- Combines small batches 73 to 74
-- Generated at: 2025-06-05T00:48:12.887Z
-- MEGA BATCH: Larger batches for faster import

-- From vcs_funds_simple_batch_73.sql (50 records)
INSERT INTO fund_table (
);
INSERT INTO fund_table (
);
INSERT INTO fund_table (
);
INSERT INTO fund_table (
);
INSERT INTO fund_table (
);
INSERT INTO fund_table (
);
INSERT INTO fund_table (
);
INSERT INTO fund_table (
);
INSERT INTO fund_table (
);
INSERT INTO fund_table (
);
INSERT INTO fund_table (
);
INSERT INTO fund_table (
);
INSERT INTO fund_table (
);
INSERT INTO fund_table (
);
INSERT INTO fund_table (
);
INSERT INTO fund_table (
);
INSERT INTO fund_table (
);
INSERT INTO fund_table (
);
INSERT INTO fund_table (
);
INSERT INTO fund_table (
);
INSERT INTO fund_table (
);
INSERT INTO fund_table (
);
INSERT INTO fund_table (
);
INSERT INTO fund_table (
);
INSERT INTO fund_table (
);
INSERT INTO fund_table (
);
INSERT INTO fund_table (
);
INSERT INTO fund_table (
);
INSERT INTO fund_table (
);
INSERT INTO fund_table (
);
INSERT INTO fund_table (
);
INSERT INTO fund_table (
);
INSERT INTO fund_table (
);
INSERT INTO fund_table (
);
INSERT INTO fund_table (
);
INSERT INTO fund_table (
);
INSERT INTO fund_table (
);
INSERT INTO fund_table (
);
INSERT INTO fund_table (
);
INSERT INTO fund_table (
);
INSERT INTO fund_table (
);
INSERT INTO fund_table (
);
INSERT INTO fund_table (
);
INSERT INTO fund_table (
);
INSERT INTO fund_table (
);
INSERT INTO fund_table (
);
INSERT INTO fund_table (
);
INSERT INTO fund_table (
);
INSERT INTO fund_table (
);
INSERT INTO fund_table (
);

-- From vcs_funds_simple_batch_74.sql (39 records)
INSERT INTO fund_table (
);
INSERT INTO fund_table (
);
INSERT INTO fund_table (
);
INSERT INTO fund_table (
);
INSERT INTO fund_table (
);
INSERT INTO fund_table (
);
INSERT INTO fund_table (
);
INSERT INTO fund_table (
);
INSERT INTO fund_table (
);
INSERT INTO fund_table (
);
INSERT INTO fund_table (
);
INSERT INTO fund_table (
);
INSERT INTO fund_table (
);
INSERT INTO fund_table (
);
INSERT INTO fund_table (
);
INSERT INTO fund_table (
);
INSERT INTO fund_table (
);
INSERT INTO fund_table (
);
INSERT INTO fund_table (
);
INSERT INTO fund_table (
);
INSERT INTO fund_table (
);
INSERT INTO fund_table (
);
INSERT INTO fund_table (
);
INSERT INTO fund_table (
);
INSERT INTO fund_table (
);
INSERT INTO fund_table (
);
INSERT INTO fund_table (
);
INSERT INTO fund_table (
);
INSERT INTO fund_table (
);
INSERT INTO fund_table (
);
INSERT INTO fund_table (
);
INSERT INTO fund_table (
);
INSERT INTO fund_table (
);
INSERT INTO fund_table (
);
INSERT INTO fund_table (
);
INSERT INTO fund_table (
);
INSERT INTO fund_table (
);
INSERT INTO fund_table (
);
INSERT INTO fund_table (
);

-- Mega Batch 10 Summary:
-- Combined batches: 73-74
-- Total records: 89
-- Progress: 100.0% of mega batches

-- Final verification query for mega batch import
SELECT 
  'VCS Fund MEGA Import Progress' as status,
  COUNT(*) as total_vcs_funds,
  COUNT(DISTINCT company_id) as unique_operators,
  SUM(fund_size) / 1000000000 as total_fund_size_billions_krw
FROM fund_table WHERE apify_source = 'VCS_API_SCRAPER';
