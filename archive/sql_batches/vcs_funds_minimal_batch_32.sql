-- VCS Fund MINIMAL UPSERT Batch 32/74 (Records 1551-1600)
-- MINIMAL: Only using basic columns that definitely exist
-- Generated from VCS API Scraper fund data
-- Generated at: 2025-06-05T00:40:21.846Z
-- Schema: Minimal fund_table structure (basic columns only)

-- MINIMAL FUND DATA (UPSERT - Safe for Duplicates)
-- Processing 50 fund records
-- Will INSERT new records or UPDATE existing ones

-- Record 1551: 에이온 창업초기 벤처펀드 2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210709',
  '에이온 창업초기 벤처펀드 2호',
  2020000000,
  '2022-10-17',
  '{"fund_id":"AS20221190","registration_date":"2022-10-17","expiry_date":"2032-10-16","formation_total_amount":"20.2","investment_character_code":"02","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20210709","operator_company_name":"에이온인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"에이온인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.846Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1552: 에이온 창업초기 벤처펀드 1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210709',
  '에이온 창업초기 벤처펀드 1호',
  3030000000,
  '2022-10-17',
  '{"fund_id":"AS20221191","registration_date":"2022-10-17","expiry_date":"2030-10-16","formation_total_amount":"30.3","investment_character_code":"02","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20210709","operator_company_name":"에이온인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"에이온인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.846Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1553: 에이온 소재 혁신 벤처펀드 1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210709',
  '에이온 소재 혁신 벤처펀드 1호',
  2050000000,
  '2025-02-07',
  '{"fund_id":"AS20250088","registration_date":"2025-02-07","expiry_date":"2030-02-06","formation_total_amount":"20.5","investment_character_code":"25","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"일반 기타","mother_fund_id":"","operator_company_id":"OP20210709","operator_company_name":"에이온인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"에이온인베스트먼트","investment_focus":["일반 기타","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.846Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1554: 에이온 바이오 유니콘 벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210709',
  '에이온 바이오 유니콘 벤처투자조합',
  2050000000,
  '2023-03-06',
  '{"fund_id":"AS20230146","registration_date":"2023-03-06","expiry_date":"2028-03-05","formation_total_amount":"20.5","investment_character_code":"25","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20210709","operator_company_name":"에이온인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"에이온인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.846Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1555: 에이온 디지털 컨버전스 벤처투자조합 2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210709',
  '에이온 디지털 컨버전스 벤처투자조합 2호',
  2200000000,
  '2022-07-21',
  '{"fund_id":"AS20220839","registration_date":"2022-07-21","expiry_date":"2030-07-20","formation_total_amount":"22.0","investment_character_code":"25","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20210709","operator_company_name":"에이온인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"에이온인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.846Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1556: 에이온 디지털 컨버전스 벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210709',
  '에이온 디지털 컨버전스 벤처투자조합',
  3150000000,
  '2022-03-15',
  '{"fund_id":"AS20220300","registration_date":"2022-03-15","expiry_date":"2027-03-14","formation_total_amount":"31.5","investment_character_code":"25","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20210709","operator_company_name":"에이온인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"에이온인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.846Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1557: 에이온 글로벌 RNA 유니콘 벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210709',
  '에이온 글로벌 RNA 유니콘 벤처투자조합',
  6210000000,
  '2024-08-21',
  '{"fund_id":"AS20240800","registration_date":"2024-08-21","expiry_date":"2029-08-20","formation_total_amount":"62.1","investment_character_code":"25","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"일반 기타","mother_fund_id":"","operator_company_id":"OP20210709","operator_company_name":"에이온인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"에이온인베스트먼트","investment_focus":["일반 기타","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.846Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1558: 에이온 AICBM 벤처투자조합 3호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210709',
  '에이온 AICBM 벤처투자조합 3호',
  4850000000,
  '2025-01-06',
  '{"fund_id":"AS20250011","registration_date":"2025-01-06","expiry_date":"2030-01-05","formation_total_amount":"48.5","investment_character_code":"25","industry_code":"9","investment_field_type":"일반","investment_field_detail_type":"일반 기타","mother_fund_id":"","operator_company_id":"OP20210709","operator_company_name":"에이온인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"에이온인베스트먼트","investment_focus":["일반 기타","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.846Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1559: 에이온 AICBM 벤처투자조합 2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210709',
  '에이온 AICBM 벤처투자조합 2호',
  2000000000,
  '2022-10-26',
  '{"fund_id":"AS20221226","registration_date":"2022-10-26","expiry_date":"2027-10-25","formation_total_amount":"20.0","investment_character_code":"25","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20210709","operator_company_name":"에이온인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"에이온인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.846Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1560: 에이온 AICBM 벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210709',
  '에이온 AICBM 벤처투자조합',
  3300000000,
  '2022-05-31',
  '{"fund_id":"AS20220626","registration_date":"2022-05-31","expiry_date":"2027-05-30","formation_total_amount":"33.0","investment_character_code":"25","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20210709","operator_company_name":"에이온인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"에이온인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.846Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1561: 에이오에이포르토스투자조합8호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20230164',
  '에이오에이포르토스투자조합8호',
  2000000000,
  '2024-10-24',
  '{"fund_id":"AS20241034","registration_date":"2024-10-24","expiry_date":"2029-10-23","formation_total_amount":"20.0","investment_character_code":"25","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20230164","operator_company_name":"에이오에이캐피탈파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"에이오에이캐피탈파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.846Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1562: 에이오에이포르토스투자조합4호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20230164',
  '에이오에이포르토스투자조합4호',
  2400000000,
  '2024-04-09',
  '{"fund_id":"AS20240284","registration_date":"2024-04-09","expiry_date":"2029-04-08","formation_total_amount":"24.0","investment_character_code":"25","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20230164","operator_company_name":"에이오에이캐피탈파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"에이오에이캐피탈파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.846Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1563: 에이오에이아토스투자조합6호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20230164',
  '에이오에이아토스투자조합6호',
  2200000000,
  '2023-11-21',
  '{"fund_id":"AS20231114","registration_date":"2023-11-21","expiry_date":"2028-11-20","formation_total_amount":"22.0","investment_character_code":"25","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20230164","operator_company_name":"에이오에이캐피탈파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"에이오에이캐피탈파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.846Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1564: 에이오에이아토스투자조합5호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20230164',
  '에이오에이아토스투자조합5호',
  2310000000,
  '2023-08-23',
  '{"fund_id":"AS20230755","registration_date":"2023-08-23","expiry_date":"2028-08-22","formation_total_amount":"23.1","investment_character_code":"25","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20230164","operator_company_name":"에이오에이캐피탈파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"에이오에이캐피탈파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.846Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1565: 에이오에이아토스투자조합2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20230164',
  '에이오에이아토스투자조합2호',
  2700000000,
  '2023-07-12',
  '{"fund_id":"AS20230589","registration_date":"2023-07-12","expiry_date":"2028-07-11","formation_total_amount":"27.0","investment_character_code":"16","industry_code":"4","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20230164","operator_company_name":"에이오에이캐피탈파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"에이오에이캐피탈파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.846Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1566: 에이오에이아토스투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20230164',
  '에이오에이아토스투자조합1호',
  4200000000,
  '2021-10-26',
  '{"fund_id":"AS20211025","registration_date":"2021-10-26","expiry_date":"2026-10-25","formation_total_amount":"42.0","investment_character_code":"02","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20230164","operator_company_name":"에이오에이캐피탈파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"에이오에이캐피탈파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.846Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1567: 에이오에이아라미스투자조합7호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20230164',
  '에이오에이아라미스투자조합7호',
  3300000000,
  '2025-01-09',
  '{"fund_id":"AS20250033","registration_date":"2025-01-09","expiry_date":"2030-01-08","formation_total_amount":"33.0","investment_character_code":"25","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20230164","operator_company_name":"에이오에이캐피탈파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"에이오에이캐피탈파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.846Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1568: 에이오에이아라미스투자조합3호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20230164',
  '에이오에이아라미스투자조합3호',
  2200000000,
  '2023-07-24',
  '{"fund_id":"AS20230626","registration_date":"2023-07-24","expiry_date":"2028-07-23","formation_total_amount":"22.0","investment_character_code":"25","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20230164","operator_company_name":"에이오에이캐피탈파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"에이오에이캐피탈파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.846Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1569: 에이엑스(AX) 개인(엔젤)투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190230',
  '에이엑스(AX) 개인(엔젤)투자조합',
  350000000,
  '2024-05-28',
  '{"fund_id":"AS20240436","registration_date":"2024-05-28","expiry_date":"2029-05-26","formation_total_amount":"3.5","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190230","operator_company_name":"아이피씨앤비","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"아이피씨앤비","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.846Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1570: 에이앤피1호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20120003',
  '에이앤피1호 개인투자조합',
  900000000,
  '2024-07-25',
  '{"fund_id":"AS20240646","registration_date":"2024-07-25","expiry_date":"2029-08-31","formation_total_amount":"9.0","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20120003","operator_company_name":"액트너랩","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"액트너랩","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.846Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1571: 에이아이피 헬스케어 벤처투자조합 제1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200108',
  '에이아이피 헬스케어 벤처투자조합 제1호',
  2110000000,
  '2021-05-14',
  '{"fund_id":"AS20210396","registration_date":"2021-05-14","expiry_date":"2026-05-13","formation_total_amount":"21.1","investment_character_code":"25","industry_code":"4","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20200108","operator_company_name":"에이아이피벤처파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"에이아이피벤처파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.846Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1572: 에이아이피 컨텐츠-M3X 벤처투자조합 제8호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200108',
  '에이아이피 컨텐츠-M3X 벤처투자조합 제8호',
  2210000000,
  '2022-10-31',
  '{"fund_id":"AS20221244","registration_date":"2022-10-31","expiry_date":"2027-10-30","formation_total_amount":"22.1","investment_character_code":"25","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20200108","operator_company_name":"에이아이피벤처파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"에이아이피벤처파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.846Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1573: 에이아이피 컨텐츠-M3X 벤처투자조합 제7호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200108',
  '에이아이피 컨텐츠-M3X 벤처투자조합 제7호',
  2400000000,
  '2022-05-03',
  '{"fund_id":"AS20220506","registration_date":"2022-05-03","expiry_date":"2027-05-02","formation_total_amount":"24.0","investment_character_code":"16","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20200108","operator_company_name":"에이아이피벤처파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"에이아이피벤처파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.846Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1574: 에이아이피 컨텐츠 벤처투자조합 제1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200108',
  '에이아이피 컨텐츠 벤처투자조합 제1호',
  2050000000,
  '2021-09-02',
  '{"fund_id":"AS20210798","registration_date":"2021-09-02","expiry_date":"2026-09-01","formation_total_amount":"20.5","investment_character_code":"25","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20200108","operator_company_name":"에이아이피벤처파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"에이아이피벤처파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.846Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1575: 에이아이피 이노베이션 벤처투자조합 제3호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200108',
  '에이아이피 이노베이션 벤처투자조합 제3호',
  4220000000,
  '2024-11-05',
  '{"fund_id":"AS20241084","registration_date":"2024-11-05","expiry_date":"2029-11-04","formation_total_amount":"42.2","investment_character_code":"16","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"일반 기타","mother_fund_id":"","operator_company_id":"OP20200108","operator_company_name":"에이아이피벤처파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"에이아이피벤처파트너스","investment_focus":["일반 기타","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.846Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1576: 에이아이피 이노베이션 벤처투자조합 제2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200108',
  '에이아이피 이노베이션 벤처투자조합 제2호',
  2150000000,
  '2022-09-20',
  '{"fund_id":"AS20221082","registration_date":"2022-09-20","expiry_date":"2027-09-19","formation_total_amount":"21.5","investment_character_code":"25","industry_code":"1","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20200108","operator_company_name":"에이아이피벤처파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"에이아이피벤처파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.846Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1577: 에이아이피 이노베이션 벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200108',
  '에이아이피 이노베이션 벤처투자조합',
  4200000000,
  '2022-02-22',
  '{"fund_id":"AS20220181","registration_date":"2022-02-22","expiry_date":"2027-02-21","formation_total_amount":"42.0","investment_character_code":"25","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20200108","operator_company_name":"에이아이피벤처파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"에이아이피벤처파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.846Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1578: 에이아이피 스프라우트 벤처투자조합 제1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200108',
  '에이아이피 스프라우트 벤처투자조합 제1호',
  2750000000,
  '2021-02-24',
  '{"fund_id":"AS20210152","registration_date":"2021-02-24","expiry_date":"2026-02-23","formation_total_amount":"27.5","investment_character_code":"25","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20200108","operator_company_name":"에이아이피벤처파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"에이아이피벤처파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.846Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1579: 에이아이피 빅모멘텀 벤처투자조합 제2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200108',
  '에이아이피 빅모멘텀 벤처투자조합 제2호',
  8370000000,
  '2024-04-09',
  '{"fund_id":"AS20240285","registration_date":"2024-04-09","expiry_date":"2029-04-08","formation_total_amount":"83.7","investment_character_code":"16","industry_code":"4","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20200108","operator_company_name":"에이아이피벤처파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"에이아이피벤처파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.846Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1580: 에이아이피 빅모멘텀 벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200108',
  '에이아이피 빅모멘텀 벤처투자조합',
  8410000000,
  '2023-03-16',
  '{"fund_id":"AS20230202","registration_date":"2023-03-16","expiry_date":"2028-03-15","formation_total_amount":"84.1","investment_character_code":"04","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20200108","operator_company_name":"에이아이피벤처파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"에이아이피벤처파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.846Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1581: 에이아이피 반도체-M3X 벤처투자조합 제1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200108',
  '에이아이피 반도체-M3X 벤처투자조합 제1호',
  25000000000,
  '2021-06-16',
  '{"fund_id":"AS20210485","registration_date":"2021-06-16","expiry_date":"2026-06-15","formation_total_amount":"250.0","investment_character_code":"25","industry_code":"1","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20200108","operator_company_name":"에이아이피벤처파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"에이아이피벤처파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.846Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1582: 에이아이피 개인투자조합 제2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200108',
  '에이아이피 개인투자조합 제2호',
  1440000000,
  '2023-08-22',
  '{"fund_id":"AS20230718","registration_date":"2023-08-22","expiry_date":"2028-08-21","formation_total_amount":"14.4","investment_character_code":"","industry_code":"1","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200108","operator_company_name":"에이아이피벤처파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"에이아이피벤처파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.847Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1583: 에이아이피 개인투자조합 제1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200108',
  '에이아이피 개인투자조합 제1호',
  270000000,
  '2023-04-24',
  '{"fund_id":"AS20230316","registration_date":"2023-04-24","expiry_date":"2028-04-23","formation_total_amount":"2.7","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200108","operator_company_name":"에이아이피벤처파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"에이아이피벤처파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.847Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1584: 에이아이피 WaveOn-HMO 벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200108',
  '에이아이피 WaveOn-HMO 벤처투자조합',
  2200000000,
  '2021-09-29',
  '{"fund_id":"AS20210915","registration_date":"2021-09-29","expiry_date":"2026-09-28","formation_total_amount":"22.0","investment_character_code":"25","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20200108","operator_company_name":"에이아이피벤처파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"에이아이피벤처파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.847Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1585: 에이아이피 SW-M3X 벤처투자조합 제10호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200108',
  '에이아이피 SW-M3X 벤처투자조합 제10호',
  1110000000,
  '2023-04-13',
  '{"fund_id":"AS20230282","registration_date":"2023-04-13","expiry_date":"2028-04-12","formation_total_amount":"11.1","investment_character_code":"16","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20200108","operator_company_name":"에이아이피벤처파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"에이아이피벤처파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.847Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1586: 에이아이피 SoC-M3X 벤처투자조합 제9호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200108',
  '에이아이피 SoC-M3X 벤처투자조합 제9호',
  1940000000,
  '2023-02-24',
  '{"fund_id":"AS20230123","registration_date":"2023-02-24","expiry_date":"2028-02-23","formation_total_amount":"19.4","investment_character_code":"16","industry_code":"1","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20200108","operator_company_name":"에이아이피벤처파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"에이아이피벤처파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.847Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1587: 에이아이피 PreIPO-M3X 벤처투자조합 제4호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200108',
  '에이아이피 PreIPO-M3X 벤처투자조합 제4호',
  2010000000,
  '2021-07-01',
  '{"fund_id":"AS20210546","registration_date":"2021-07-01","expiry_date":"2026-06-30","formation_total_amount":"20.1","investment_character_code":"25","industry_code":"1","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20200108","operator_company_name":"에이아이피벤처파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"에이아이피벤처파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.847Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1588: 에이아이피 M3X 벤처투자조합 제15호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200108',
  '에이아이피 M3X 벤처투자조합 제15호',
  4730000000,
  '2025-03-28',
  '{"fund_id":"AS20250238","registration_date":"2025-03-28","expiry_date":"2030-03-27","formation_total_amount":"47.3","investment_character_code":"25","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20200108","operator_company_name":"에이아이피벤처파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"에이아이피벤처파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.847Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1589: 에이아이피 M3X 벤처투자조합 제14호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200108',
  '에이아이피 M3X 벤처투자조합 제14호',
  1200000000,
  '2024-10-15',
  '{"fund_id":"AS20240980","registration_date":"2024-10-15","expiry_date":"2029-10-14","formation_total_amount":"12.0","investment_character_code":"16","industry_code":"4","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20200108","operator_company_name":"에이아이피벤처파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"에이아이피벤처파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.847Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1590: 에이아이피 M3X 벤처투자조합 제13호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200108',
  '에이아이피 M3X 벤처투자조합 제13호',
  1150000000,
  '2024-09-13',
  '{"fund_id":"AS20240908","registration_date":"2024-09-13","expiry_date":"2029-09-12","formation_total_amount":"11.5","investment_character_code":"16","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20200108","operator_company_name":"에이아이피벤처파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"에이아이피벤처파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.847Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1591: 에이아이피 M3X 벤처투자조합 제12호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200108',
  '에이아이피 M3X 벤처투자조합 제12호',
  1580000000,
  '2024-04-09',
  '{"fund_id":"AS20240283","registration_date":"2024-04-09","expiry_date":"2029-04-08","formation_total_amount":"15.8","investment_character_code":"16","industry_code":"4","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20200108","operator_company_name":"에이아이피벤처파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"에이아이피벤처파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.847Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1592: 에이아이피 M3X 벤처투자조합 제11호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200108',
  '에이아이피 M3X 벤처투자조합 제11호',
  2830000000,
  '2024-01-09',
  '{"fund_id":"AS20240021","registration_date":"2024-01-09","expiry_date":"2029-01-08","formation_total_amount":"28.3","investment_character_code":"16","industry_code":"4","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20200108","operator_company_name":"에이아이피벤처파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"에이아이피벤처파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.847Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1593: 에이아이피 H2-M3X 벤처투자조합 제6호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200108',
  '에이아이피 H2-M3X 벤처투자조합 제6호',
  7000000000,
  '2021-12-16',
  '{"fund_id":"AS20211322","registration_date":"2021-12-16","expiry_date":"2026-12-15","formation_total_amount":"70.0","investment_character_code":"25","industry_code":"9","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20200108","operator_company_name":"에이아이피벤처파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"에이아이피벤처파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.847Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1594: 에이아이피 AI-M3X 벤처투자조합 제5호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200108',
  '에이아이피 AI-M3X 벤처투자조합 제5호',
  2730000000,
  '2021-08-13',
  '{"fund_id":"AS20210727","registration_date":"2021-08-13","expiry_date":"2026-08-12","formation_total_amount":"27.3","investment_character_code":"25","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20200108","operator_company_name":"에이아이피벤처파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"에이아이피벤처파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.847Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1595: 에이아이피 AI-M3X 벤처투자조합 제2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200108',
  '에이아이피 AI-M3X 벤처투자조합 제2호',
  2250000000,
  '2021-06-01',
  '{"fund_id":"AS20210438","registration_date":"2021-06-01","expiry_date":"2026-05-31","formation_total_amount":"22.5","investment_character_code":"25","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20200108","operator_company_name":"에이아이피벤처파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"에이아이피벤처파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.847Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1596: 에이아이피 5G-M3X 벤처투자조합 제3호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200108',
  '에이아이피 5G-M3X 벤처투자조합 제3호',
  2000000000,
  '2021-06-17',
  '{"fund_id":"AS20210489","registration_date":"2021-06-17","expiry_date":"2026-06-16","formation_total_amount":"20.0","investment_character_code":"25","industry_code":"1","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20200108","operator_company_name":"에이아이피벤처파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"에이아이피벤처파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.847Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1597: 에이아이엔젤-씨엔티테크 개인투자조합 2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20180020',
  '에이아이엔젤-씨엔티테크 개인투자조합 2호',
  5520000000,
  '2022-12-19',
  '{"fund_id":"AS20221438","registration_date":"2022-12-19","expiry_date":"2030-12-18","formation_total_amount":"55.2","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"MF00000001","operator_company_id":"OP20180020","operator_company_name":"씨엔티테크","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"씨엔티테크","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.847Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1598: 에이아이엔젤-씨엔티테크 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20180020',
  '에이아이엔젤-씨엔티테크 개인투자조합',
  600000000,
  '2021-08-05',
  '{"fund_id":"AS20210674","registration_date":"2021-08-05","expiry_date":"2029-08-04","formation_total_amount":"6.0","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20180020","operator_company_name":"씨엔티테크","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"씨엔티테크","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.847Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1599: 에이아이신기술개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20140013',
  '에이아이신기술개인투자조합',
  110000000,
  '2020-06-02',
  '{"fund_id":"AS20200240","registration_date":"2020-06-02","expiry_date":"2025-07-30","formation_total_amount":"1.1","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20140013","operator_company_name":"더인벤션랩","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"더인벤션랩","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.847Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1600: 에이아이메디컬테크 초기스타트업 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20140013',
  '에이아이메디컬테크 초기스타트업 투자조합',
  510000000,
  '2023-05-24',
  '{"fund_id":"AS20230398","registration_date":"2023-05-24","expiry_date":"2028-05-23","formation_total_amount":"5.1","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20140013","operator_company_name":"더인벤션랩","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"더인벤션랩","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.847Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Minimal Batch 32 completed! 50 fund records processed.
-- Progress: 1600/3689 total records

