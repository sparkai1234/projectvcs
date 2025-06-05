-- VCS Fund MINIMAL UPSERT Batch 50/74 (Records 2451-2500)
-- MINIMAL: Only using basic columns that definitely exist
-- Generated from VCS API Scraper fund data
-- Generated at: 2025-06-05T00:40:21.927Z
-- Schema: Minimal fund_table structure (basic columns only)

-- MINIMAL FUND DATA (UPSERT - Safe for Duplicates)
-- Processing 50 fund records
-- Will INSERT new records or UPDATE existing ones

-- Record 2451: 비전에쿼티 핀테크 투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200061',
  '비전에쿼티 핀테크 투자조합1호',
  2000000000,
  '2023-06-29',
  '{"fund_id":"AS20230551","registration_date":"2023-06-29","expiry_date":"2028-06-28","formation_total_amount":"20.0","investment_character_code":"25","industry_code":"9","investment_field_type":"일반","investment_field_detail_type":"IT","mother_fund_id":"","operator_company_id":"OP20200061","operator_company_name":"비전에쿼티파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"비전에쿼티파트너스","investment_focus":["IT","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.927Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2452: 비전-에이비 뉴미디어 벤처투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200215',
  '비전-에이비 뉴미디어 벤처투자조합 1호',
  1000000000,
  '2025-03-28',
  '{"fund_id":"AS20250240","registration_date":"2025-03-28","expiry_date":"2030-03-27","formation_total_amount":"10.0","investment_character_code":"25","industry_code":"9","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20200215","operator_company_name":"어나더브레인","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"어나더브레인","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.927Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2453: 비전 혁신성장 벤처투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210480',
  '비전 혁신성장 벤처투자조합 1호',
  3100000000,
  '2023-06-29',
  '{"fund_id":"AS20230550","registration_date":"2023-06-29","expiry_date":"2028-06-28","formation_total_amount":"31.0","investment_character_code":"04","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20210480","operator_company_name":"비전벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"비전벤처스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.927Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2454: 비전 제7호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210260',
  '비전 제7호 투자조합',
  320000000,
  '2024-01-18',
  '{"fund_id":"AS20240042","registration_date":"2024-01-18","expiry_date":"2029-01-17","formation_total_amount":"3.2","investment_character_code":"","industry_code":"3","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20210260","operator_company_name":"그래비티벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"그래비티벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.927Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2455: 비전 제6호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210260',
  '비전 제6호 투자조합',
  120000000,
  '2023-08-21',
  '{"fund_id":"AS20230694","registration_date":"2023-08-21","expiry_date":"2028-08-20","formation_total_amount":"1.2","investment_character_code":"","industry_code":"3","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20210260","operator_company_name":"그래비티벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"그래비티벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.927Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2456: 비전 제5호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210260',
  '비전 제5호 투자조합',
  590000000,
  '2023-05-24',
  '{"fund_id":"AS20230393","registration_date":"2023-05-24","expiry_date":"2028-05-23","formation_total_amount":"5.9","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20210260","operator_company_name":"그래비티벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"그래비티벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.927Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2457: 비전 제4호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210260',
  '비전 제4호 투자조합',
  530000000,
  '2022-08-12',
  '{"fund_id":"AS20220881","registration_date":"2022-08-12","expiry_date":"2027-08-11","formation_total_amount":"5.3","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20210260","operator_company_name":"그래비티벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"그래비티벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.927Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2458: 비전 제3호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210260',
  '비전 제3호 투자조합',
  430000000,
  '2022-05-31',
  '{"fund_id":"AS20220611","registration_date":"2022-05-31","expiry_date":"2027-05-30","formation_total_amount":"4.3","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20210260","operator_company_name":"그래비티벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"그래비티벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.927Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2459: 비전 제1호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210260',
  '비전 제1호 투자조합',
  890000000,
  '2022-02-14',
  '{"fund_id":"AS20220138","registration_date":"2022-02-14","expiry_date":"2027-02-13","formation_total_amount":"8.9","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20210260","operator_company_name":"그래비티벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"그래비티벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.927Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2460: 비전 신성장동력 벤처투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210480',
  '비전 신성장동력 벤처투자조합 1호',
  2550000000,
  '2021-12-23',
  '{"fund_id":"AS20211396","registration_date":"2021-12-23","expiry_date":"2026-12-22","formation_total_amount":"25.5","investment_character_code":"25","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20210480","operator_company_name":"비전벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"비전벤처스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.927Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2461: 비전 소부장 벤처투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210480',
  '비전 소부장 벤처투자조합 1호',
  5800000000,
  '2022-02-22',
  '{"fund_id":"AS20220173","registration_date":"2022-02-22","expiry_date":"2027-02-21","formation_total_amount":"58.0","investment_character_code":"25","industry_code":"1","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20210480","operator_company_name":"비전벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"비전벤처스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.927Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2462: 비오케이 M&A 1호 펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20100011',
  '비오케이 M&A 1호 펀드',
  4300000000,
  '2017-08-02',
  '{"fund_id":"AS20170082","registration_date":"2017-08-02","expiry_date":"2025-10-31","formation_total_amount":"43.0","investment_character_code":"17","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20100011","operator_company_name":"아이원인베스트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"아이원인베스트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.927Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2463: 비엠벤처스9호조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200511',
  '비엠벤처스9호조합',
  2000000000,
  '2024-04-02',
  '{"fund_id":"AS20240244","registration_date":"2024-04-02","expiry_date":"2029-04-01","formation_total_amount":"20.0","investment_character_code":"25","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20200511","operator_company_name":"비엠벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"비엠벤처스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.927Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2464: 비엠벤처스8호조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200511',
  '비엠벤처스8호조합',
  3500000000,
  '2024-04-04',
  '{"fund_id":"AS20240263","registration_date":"2024-04-04","expiry_date":"2029-04-03","formation_total_amount":"35.0","investment_character_code":"25","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20200511","operator_company_name":"비엠벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"비엠벤처스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.927Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2465: 비엠벤처스7호조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200511',
  '비엠벤처스7호조합',
  2450000000,
  '2024-03-11',
  '{"fund_id":"AS20240181","registration_date":"2024-03-11","expiry_date":"2029-03-10","formation_total_amount":"24.5","investment_character_code":"25","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20200511","operator_company_name":"비엠벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"비엠벤처스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.928Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2466: 비엠벤처스6호조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200511',
  '비엠벤처스6호조합',
  3040000000,
  '2023-11-15',
  '{"fund_id":"AS20231083","registration_date":"2023-11-15","expiry_date":"2028-11-14","formation_total_amount":"30.4","investment_character_code":"25","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20200511","operator_company_name":"비엠벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"비엠벤처스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.928Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2467: 비엠벤처스5호조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200511',
  '비엠벤처스5호조합',
  5390000000,
  '2023-07-17',
  '{"fund_id":"AS20230606","registration_date":"2023-07-17","expiry_date":"2028-07-16","formation_total_amount":"53.9","investment_character_code":"25","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"부품소재","mother_fund_id":"","operator_company_id":"OP20200511","operator_company_name":"비엠벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"비엠벤처스","investment_focus":["부품소재","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.928Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2468: 비엠벤처스4호조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200511',
  '비엠벤처스4호조합',
  2180000000,
  '2023-02-20',
  '{"fund_id":"AS20230109","registration_date":"2023-02-20","expiry_date":"2028-02-19","formation_total_amount":"21.8","investment_character_code":"16","industry_code":"4","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20200511","operator_company_name":"비엠벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"비엠벤처스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.928Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2469: 비엠벤처스3호조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200511',
  '비엠벤처스3호조합',
  2000000000,
  '2022-10-17',
  '{"fund_id":"AS20221189","registration_date":"2022-10-17","expiry_date":"2027-10-16","formation_total_amount":"20.0","investment_character_code":"16","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20200511","operator_company_name":"비엠벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"비엠벤처스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.928Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2470: 비엠벤처스2호조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200511',
  '비엠벤처스2호조합',
  2100000000,
  '2022-09-20',
  '{"fund_id":"AS20221077","registration_date":"2022-09-20","expiry_date":"2027-09-19","formation_total_amount":"21.0","investment_character_code":"16","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20200511","operator_company_name":"비엠벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"비엠벤처스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.928Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2471: 비엠벤처스1호조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200511',
  '비엠벤처스1호조합',
  6480000000,
  '2021-05-28',
  '{"fund_id":"AS20210428","registration_date":"2021-05-28","expiry_date":"2026-05-27","formation_total_amount":"64.8","investment_character_code":"25","industry_code":"7","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20200511","operator_company_name":"비엠벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"비엠벤처스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.928Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2472: 비엠 K-배터리 터프테크 투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200511',
  '비엠 K-배터리 터프테크 투자조합 1호',
  15000000000,
  '2024-07-30',
  '{"fund_id":"AS20240707","registration_date":"2024-07-30","expiry_date":"2032-07-29","formation_total_amount":"150.0","investment_character_code":"03","industry_code":"9","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20200511","operator_company_name":"비엠벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"비엠벤처스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.928Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2473: 비엔케이티2021대한민국버팀목벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190017',
  '비엔케이티2021대한민국버팀목벤처투자조합',
  37500000000,
  '2021-08-06',
  '{"fund_id":"AS20210693","registration_date":"2021-08-06","expiry_date":"2029-08-05","formation_total_amount":"375.0","investment_character_code":"22","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20190017","operator_company_name":"티인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"티인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.928Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2474: 비엔케이(BNK)-케이앤 해양신산업 투자조합 제2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20150011',
  '비엔케이(BNK)-케이앤 해양신산업 투자조합 제2호',
  20000000000,
  '2023-11-28',
  '{"fund_id":"AS20231159","registration_date":"2023-11-28","expiry_date":"2031-11-27","formation_total_amount":"200.0","investment_character_code":"31","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20150011","operator_company_name":"케이앤투자파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"케이앤투자파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.928Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2475: 비엔케이-현대 방산기술혁신펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19970003',
  '비엔케이-현대 방산기술혁신펀드',
  40000000000,
  '2023-01-05',
  '{"fund_id":"AS20230024","registration_date":"2023-01-05","expiry_date":"2033-01-04","formation_total_amount":"400.0","investment_character_code":"10","industry_code":"1","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP19970003","operator_company_name":"현대기술투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"현대기술투자","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.928Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2476: 비엔케이-코바코 광고·마케팅 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20090004',
  '비엔케이-코바코 광고·마케팅 투자조합',
  30000000000,
  '2022-11-29',
  '{"fund_id":"AS20221365","registration_date":"2022-11-29","expiry_date":"2030-11-28","formation_total_amount":"300.0","investment_character_code":"10","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20090004","operator_company_name":"비엔케이벤처투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"비엔케이벤처투자","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.928Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2477: 비엔케이-케이앤 영호남 특구기업 육성 벤처투자조합 제1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20150011',
  '비엔케이-케이앤 영호남 특구기업 육성 벤처투자조합 제1호',
  19000000000,
  '2021-09-03',
  '{"fund_id":"AS20210807","registration_date":"2021-09-03","expiry_date":"2029-09-02","formation_total_amount":"190.0","investment_character_code":"18","industry_code":"4","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20150011","operator_company_name":"케이앤투자파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"케이앤투자파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.928Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2478: 비엔케이-나우 부산 지역혁신펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20070002',
  '비엔케이-나우 부산 지역혁신펀드',
  17000000000,
  '2024-12-23',
  '{"fund_id":"AS20241417","registration_date":"2024-12-23","expiry_date":"2032-12-22","formation_total_amount":"170.0","investment_character_code":"18","industry_code":"9","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000022","operator_company_id":"OP20070002","operator_company_name":"나우아이비캐피탈","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"나우아이비캐피탈","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.928Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2479: 비엔케이 유스타 (BNK U-STAR) 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20150041',
  '비엔케이 유스타 (BNK U-STAR) 개인투자조합',
  4000000000,
  '2020-06-01',
  '{"fund_id":"AS20200234","registration_date":"2020-06-01","expiry_date":"2027-05-31","formation_total_amount":"40.0","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"MF00000001","operator_company_id":"OP20150041","operator_company_name":"울산창조경제혁신센터","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"울산창조경제혁신센터","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.928Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2480: 비엔케이 스토리지B 부산 지역혁신펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20090004',
  '비엔케이 스토리지B 부산 지역혁신펀드',
  25000000000,
  '2024-01-03',
  '{"fund_id":"AS20240010","registration_date":"2024-01-03","expiry_date":"2032-01-02","formation_total_amount":"250.0","investment_character_code":"18","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000015","operator_company_id":"OP20090004","operator_company_name":"비엔케이벤처투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"비엔케이벤처투자","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.928Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2481: 비엔케이 스마트 비대면 펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20090004',
  '비엔케이 스마트 비대면 펀드',
  20000000000,
  '2021-06-15',
  '{"fund_id":"AS20210474","registration_date":"2021-06-15","expiry_date":"2028-06-14","formation_total_amount":"200.0","investment_character_code":"10","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20090004","operator_company_name":"비엔케이벤처투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"비엔케이벤처투자","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.928Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2482: 비엔케이 부산지역뉴딜 벤처펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20090004',
  '비엔케이 부산지역뉴딜 벤처펀드',
  25000000000,
  '2021-12-20',
  '{"fund_id":"AS20211358","registration_date":"2021-12-20","expiry_date":"2029-12-19","formation_total_amount":"250.0","investment_character_code":"10","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000015","operator_company_id":"OP20090004","operator_company_name":"비엔케이벤처투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"비엔케이벤처투자","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.928Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2483: 비엔케이 미래혁신성장 펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20090004',
  '비엔케이 미래혁신성장 펀드',
  25000000000,
  '2025-02-13',
  '{"fund_id":"AS20250108","registration_date":"2025-02-13","expiry_date":"2033-02-12","formation_total_amount":"250.0","investment_character_code":"18","industry_code":"9","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20090004","operator_company_name":"비엔케이벤처투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"비엔케이벤처투자","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.928Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2484: 비엔케이 동남권 지역뉴딜 벤처펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20090004',
  '비엔케이 동남권 지역뉴딜 벤처펀드',
  20000000000,
  '2022-05-25',
  '{"fund_id":"AS20220583","registration_date":"2022-05-25","expiry_date":"2030-05-24","formation_total_amount":"200.0","investment_character_code":"10","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000016","operator_company_id":"OP20090004","operator_company_name":"비엔케이벤처투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"비엔케이벤처투자","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.928Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2485: 비엔케이 2024 대한민국 재도약 벤처투자조합 제3호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19970009',
  '비엔케이 2024 대한민국 재도약 벤처투자조합 제3호',
  25500000000,
  '2024-08-05',
  '{"fund_id":"AS20240740","registration_date":"2024-08-05","expiry_date":"2032-08-04","formation_total_amount":"255.0","investment_character_code":"22","industry_code":"9","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP19970009","operator_company_name":"비엔케이투자증권","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"비엔케이투자증권","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.928Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2486: 비엔케이 2022 대한민국 버팀목 벤처투자조합 제2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19970009',
  '비엔케이 2022 대한민국 버팀목 벤처투자조합 제2호',
  30000000000,
  '2022-10-06',
  '{"fund_id":"AS20221146","registration_date":"2022-10-06","expiry_date":"2030-10-05","formation_total_amount":"300.0","investment_character_code":"18","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP19970009","operator_company_name":"비엔케이투자증권","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"비엔케이투자증권","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.928Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2487: 비엔에이치스타트업3호투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20150015',
  '비엔에이치스타트업3호투자조합',
  49500000000,
  '2018-11-05',
  '{"fund_id":"AS20180328","registration_date":"2018-11-05","expiry_date":"2026-11-04","formation_total_amount":"495.0","investment_character_code":"20","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20150015","operator_company_name":"비엔에이치인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"비엔에이치인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.928Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2488: 비엔에이치4호기술금융투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20150015',
  '비엔에이치4호기술금융투자조합',
  61200000000,
  '2020-12-21',
  '{"fund_id":"AS20200818","registration_date":"2020-12-21","expiry_date":"2028-12-20","formation_total_amount":"612.0","investment_character_code":"09","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"특허","mother_fund_id":"MF00000001","operator_company_id":"OP20150015","operator_company_name":"비엔에이치인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"비엔에이치인베스트먼트","investment_focus":["특허","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.928Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2489: 비에이피제이와이제1호 황제펭귄투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20170004',
  '비에이피제이와이제1호 황제펭귄투자조합',
  2940000000,
  '2023-09-08',
  '{"fund_id":"AS20230806","registration_date":"2023-09-08","expiry_date":"2028-09-07","formation_total_amount":"29.4","investment_character_code":"04","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20170004","operator_company_name":"비에이파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"비에이파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.928Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2490: 비에이피제6호 넥스트펭귄투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20170004',
  '비에이피제6호 넥스트펭귄투자조합',
  21000000000,
  '2023-11-03',
  '{"fund_id":"AS20231022","registration_date":"2023-11-03","expiry_date":"2031-11-02","formation_total_amount":"210.0","investment_character_code":"20","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20170004","operator_company_name":"비에이파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"비에이파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.928Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2491: 비에이피제5호 핑크펭귄투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20170004',
  '비에이피제5호 핑크펭귄투자조합',
  30000000000,
  '2022-07-25',
  '{"fund_id":"AS20220851","registration_date":"2022-07-25","expiry_date":"2030-07-24","formation_total_amount":"300.0","investment_character_code":"21","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20170004","operator_company_name":"비에이파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"비에이파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.928Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2492: 비에이피제4호 스텝업펭귄투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20170004',
  '비에이피제4호 스텝업펭귄투자조합',
  20000000000,
  '2021-07-13',
  '{"fund_id":"AS20210583","registration_date":"2021-07-13","expiry_date":"2029-07-12","formation_total_amount":"200.0","investment_character_code":"20","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20170004","operator_company_name":"비에이파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"비에이파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.928Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2493: 비에이피제3호 플라잉펭귄투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20170004',
  '비에이피제3호 플라잉펭귄투자조합',
  20000000000,
  '2020-08-05',
  '{"fund_id":"AS20200421","registration_date":"2020-08-05","expiry_date":"2028-08-04","formation_total_amount":"200.0","investment_character_code":"20","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20170004","operator_company_name":"비에이파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"비에이파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.928Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2494: 비에이피제2호 퍼스트펭귄투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20170004',
  '비에이피제2호 퍼스트펭귄투자조합',
  22000000000,
  '2019-06-05',
  '{"fund_id":"AS20190248","registration_date":"2019-06-05","expiry_date":"2027-06-04","formation_total_amount":"220.0","investment_character_code":"20","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20170004","operator_company_name":"비에이파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"비에이파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.928Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2495: 비에이피제1호첨단기술투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20170004',
  '비에이피제1호첨단기술투자조합',
  14000000000,
  '2017-06-09',
  '{"fund_id":"AS20170057","registration_date":"2017-06-09","expiry_date":"2025-06-08","formation_total_amount":"140.0","investment_character_code":"20","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20170004","operator_company_name":"비에이파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"비에이파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.928Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2496: 비에이피 세컨더리제2호투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20170004',
  '비에이피 세컨더리제2호투자조합',
  7040000000,
  '2023-09-14',
  '{"fund_id":"AS20230826","registration_date":"2023-09-14","expiry_date":"2028-09-13","formation_total_amount":"70.4","investment_character_code":"03","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20170004","operator_company_name":"비에이파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"비에이파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.928Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2497: 비에스케이(BSK) 11호 넥스트 유니콘 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20100012',
  '비에스케이(BSK) 11호 넥스트 유니콘 투자조합',
  36000000000,
  '2023-12-13',
  '{"fund_id":"AS20231271","registration_date":"2023-12-13","expiry_date":"2031-12-12","formation_total_amount":"360.0","investment_character_code":"20","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20100012","operator_company_name":"비에스케이인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"비에스케이인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.928Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2498: 비에스케이-퍼스트게이트 개인투자조합 2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200436',
  '비에스케이-퍼스트게이트 개인투자조합 2호',
  1990000000,
  '2021-11-17',
  '{"fund_id":"AS20211120","registration_date":"2021-11-17","expiry_date":"2027-11-16","formation_total_amount":"19.9","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200436","operator_company_name":"퍼스트게이트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"퍼스트게이트","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.928Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2499: 비에스케이-퍼스트게이트 개인투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200436',
  '비에스케이-퍼스트게이트 개인투자조합 1호',
  1990000000,
  '2021-11-17',
  '{"fund_id":"AS20211119","registration_date":"2021-11-17","expiry_date":"2027-11-16","formation_total_amount":"19.9","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200436","operator_company_name":"퍼스트게이트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"퍼스트게이트","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.928Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2500: 비스타트업-씨엔티테크 개인투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20180020',
  '비스타트업-씨엔티테크 개인투자조합 1호',
  420000000,
  '2022-05-09',
  '{"fund_id":"AS20220500","registration_date":"2022-05-09","expiry_date":"2029-05-08","formation_total_amount":"4.2","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20180020","operator_company_name":"씨엔티테크","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"씨엔티테크","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.928Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Minimal Batch 50 completed! 50 fund records processed.
-- Progress: 2500/3689 total records

