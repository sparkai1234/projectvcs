-- VCS Fund MINIMAL UPSERT Batch 28/74 (Records 1351-1400)
-- MINIMAL: Only using basic columns that definitely exist
-- Generated from VCS API Scraper fund data
-- Generated at: 2025-06-05T00:40:21.824Z
-- Schema: Minimal fund_table structure (basic columns only)

-- MINIMAL FUND DATA (UPSERT - Safe for Duplicates)
-- Processing 50 fund records
-- Will INSERT new records or UPDATE existing ones

-- Record 1351: 오픈워터뉴스페이스투자조합6호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190245',
  '오픈워터뉴스페이스투자조합6호',
  4240000000,
  '2021-04-13',
  '{"fund_id":"AS20210294","registration_date":"2021-04-13","expiry_date":"2028-04-12","formation_total_amount":"42.4","investment_character_code":"25","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20190245","operator_company_name":"오픈워터인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"오픈워터인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.824Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1352: 오픈워터뉴라이프투자조합7호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190245',
  '오픈워터뉴라이프투자조합7호',
  4300000000,
  '2021-06-28',
  '{"fund_id":"AS20210528","registration_date":"2021-06-28","expiry_date":"2028-06-27","formation_total_amount":"43.0","investment_character_code":"25","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20190245","operator_company_name":"오픈워터인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"오픈워터인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.824Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1353: 오픈워터글로벌유니콘2호펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190245',
  '오픈워터글로벌유니콘2호펀드',
  2000000000,
  '2024-08-07',
  '{"fund_id":"AS20240755","registration_date":"2024-08-07","expiry_date":"2029-08-06","formation_total_amount":"20.0","investment_character_code":"25","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"일반 기타","mother_fund_id":"","operator_company_id":"OP20190245","operator_company_name":"오픈워터인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"오픈워터인베스트먼트","investment_focus":["일반 기타","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.824Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1354: 오픈워터글로벌유니콘1호펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190245',
  '오픈워터글로벌유니콘1호펀드',
  2430000000,
  '2023-06-16',
  '{"fund_id":"AS20230496","registration_date":"2023-06-16","expiry_date":"2030-06-15","formation_total_amount":"24.3","investment_character_code":"06","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20190245","operator_company_name":"오픈워터인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"오픈워터인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.824Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1355: 오픈워터그린유니콘투자조합9호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190245',
  '오픈워터그린유니콘투자조합9호',
  3320000000,
  '2021-11-22',
  '{"fund_id":"AS20211171","registration_date":"2021-11-22","expiry_date":"2028-11-21","formation_total_amount":"33.2","investment_character_code":"25","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"환경","mother_fund_id":"","operator_company_id":"OP20190245","operator_company_name":"오픈워터인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"오픈워터인베스트먼트","investment_focus":["환경","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.824Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1356: 오픈워터그린유니콘투자조합12호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190245',
  '오픈워터그린유니콘투자조합12호',
  2080000000,
  '2022-04-06',
  '{"fund_id":"AS20220395","registration_date":"2022-04-06","expiry_date":"2029-04-05","formation_total_amount":"20.8","investment_character_code":"10","industry_code":"9","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20190245","operator_company_name":"오픈워터인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"오픈워터인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.824Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1357: 오픈워터-에스제이지피 소부장 1호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190245',
  '오픈워터-에스제이지피 소부장 1호 투자조합',
  2700000000,
  '2024-04-22',
  '{"fund_id":"AS20240334","registration_date":"2024-04-22","expiry_date":"2029-04-21","formation_total_amount":"27.0","investment_character_code":"16","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20190245","operator_company_name":"오픈워터인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"오픈워터인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.824Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1358: 오픈워터 와이지 시큐리티 유니콘 투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190245',
  '오픈워터 와이지 시큐리티 유니콘 투자조합 1호',
  3350000000,
  '2021-09-14',
  '{"fund_id":"AS20210857","registration_date":"2021-09-14","expiry_date":"2026-09-13","formation_total_amount":"33.5","investment_character_code":"25","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20190245","operator_company_name":"오픈워터인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"오픈워터인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.824Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1359: 오픈워터 시그니처 Pre-IPO 투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190245',
  '오픈워터 시그니처 Pre-IPO 투자조합1호',
  6900000000,
  '2025-01-09',
  '{"fund_id":"AS20250028","registration_date":"2025-01-09","expiry_date":"2030-01-08","formation_total_amount":"69.0","investment_character_code":"28","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20190245","operator_company_name":"오픈워터인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"오픈워터인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.824Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1360: 오픈워터 Pre-IPO 투자조합4호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190245',
  '오픈워터 Pre-IPO 투자조합4호',
  3330000000,
  '2023-09-14',
  '{"fund_id":"AS20230827","registration_date":"2023-09-14","expiry_date":"2030-09-13","formation_total_amount":"33.3","investment_character_code":"25","industry_code":"6","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20190245","operator_company_name":"오픈워터인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"오픈워터인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.824Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1361: 오픈워터 Pre-IPO 투자조합13호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190245',
  '오픈워터 Pre-IPO 투자조합13호',
  3370000000,
  '2022-05-31',
  '{"fund_id":"AS20220624","registration_date":"2022-05-31","expiry_date":"2029-05-30","formation_total_amount":"33.7","investment_character_code":"16","industry_code":"1","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20190245","operator_company_name":"오픈워터인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"오픈워터인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.824Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1362: 오픈워터 Pre-IPO 투자조합10호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190245',
  '오픈워터 Pre-IPO 투자조합10호',
  6500000000,
  '2021-12-21',
  '{"fund_id":"AS20211383","registration_date":"2021-12-21","expiry_date":"2026-12-20","formation_total_amount":"65.0","investment_character_code":"16","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20190245","operator_company_name":"오픈워터인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"오픈워터인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.824Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1363: 오픈 이노베이션 투자조합 2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20180065',
  '오픈 이노베이션 투자조합 2호',
  420000000,
  '2021-09-29',
  '{"fund_id":"AS20210904","registration_date":"2021-09-29","expiry_date":"2026-09-27","formation_total_amount":"4.2","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20180065","operator_company_name":"엔피프틴파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"엔피프틴파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.824Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1364: 오퍼스투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20120014',
  '오퍼스투자조합',
  120000000,
  '2023-01-30',
  '{"fund_id":"AS20230038","registration_date":"2023-01-30","expiry_date":"2028-01-29","formation_total_amount":"1.2","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20120014","operator_company_name":"오퍼스이앤씨","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"오퍼스이앤씨","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.824Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1365: 오크트리2호 벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210725',
  '오크트리2호 벤처투자조합',
  3030000000,
  '2022-02-16',
  '{"fund_id":"AS20220156","registration_date":"2022-02-16","expiry_date":"2027-02-15","formation_total_amount":"30.3","investment_character_code":"10","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20210725","operator_company_name":"포레스트벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"포레스트벤처스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.824Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1366: 오엔 제5호 세컨더리 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200243',
  '오엔 제5호 세컨더리 투자조합',
  34000000000,
  '2024-04-08',
  '{"fund_id":"AS20240278","registration_date":"2024-04-08","expiry_date":"2029-04-07","formation_total_amount":"340.0","investment_character_code":"06","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20200243","operator_company_name":"오엔벤처투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"오엔벤처투자","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.824Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1367: 오엔 제4호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200243',
  '오엔 제4호 투자조합',
  6000000000,
  '2023-07-18',
  '{"fund_id":"AS20230612","registration_date":"2023-07-18","expiry_date":"2028-07-17","formation_total_amount":"60.0","investment_character_code":"16","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20200243","operator_company_name":"오엔벤처투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"오엔벤처투자","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.824Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1368: 오엔 제3호 세컨더리 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200243',
  '오엔 제3호 세컨더리 투자조합',
  10000000000,
  '2021-07-28',
  '{"fund_id":"AS20210649","registration_date":"2021-07-28","expiry_date":"2026-07-27","formation_total_amount":"100.0","investment_character_code":"16","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20200243","operator_company_name":"오엔벤처투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"오엔벤처투자","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.824Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1369: 오엔 제2호 세컨더리 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200243',
  '오엔 제2호 세컨더리 투자조합',
  20000000000,
  '2021-04-20',
  '{"fund_id":"AS20210309","registration_date":"2021-04-20","expiry_date":"2026-04-19","formation_total_amount":"200.0","investment_character_code":"16","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20200243","operator_company_name":"오엔벤처투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"오엔벤처투자","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.824Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1370: 오렌지플래닛개인투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19990003',
  '오렌지플래닛개인투자조합1호',
  1900000000,
  '2022-03-22',
  '{"fund_id":"AS20220285","registration_date":"2022-03-22","expiry_date":"2027-03-21","formation_total_amount":"19.0","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP19990003","operator_company_name":"스마일게이트인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"스마일게이트인베스트먼트","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.824Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1371: 오라클지역뉴딜벤처펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210666',
  '오라클지역뉴딜벤처펀드',
  10000000000,
  '2022-07-05',
  '{"fund_id":"AS20220746","registration_date":"2022-07-05","expiry_date":"2030-07-04","formation_total_amount":"100.0","investment_character_code":"02","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20210666","operator_company_name":"오라클벤처투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"오라클벤처투자","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.824Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1372: 오라클아문단펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210666',
  '오라클아문단펀드',
  20000000000,
  '2024-01-08',
  '{"fund_id":"AS20240018","registration_date":"2024-01-08","expiry_date":"2032-01-07","formation_total_amount":"200.0","investment_character_code":"18","industry_code":"6","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20210666","operator_company_name":"오라클벤처투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"오라클벤처투자","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.824Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1373: 오라클벤처펀드1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210666',
  '오라클벤처펀드1호',
  2200000000,
  '2025-04-28',
  '{"fund_id":"AS20250329","registration_date":"2025-04-28","expiry_date":"2032-04-27","formation_total_amount":"22.0","investment_character_code":"06","industry_code":"9","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20210666","operator_company_name":"오라클벤처투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"오라클벤처투자","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.824Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1374: 오라클바이오앤모어펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210666',
  '오라클바이오앤모어펀드',
  7600000000,
  '2023-01-11',
  '{"fund_id":"AS20230043","registration_date":"2023-01-11","expiry_date":"2029-01-10","formation_total_amount":"76.0","investment_character_code":"02","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20210666","operator_company_name":"오라클벤처투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"오라클벤처투자","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.824Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1375: 오다스톤 원더풀 투자조합 제1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190019',
  '오다스톤 원더풀 투자조합 제1호',
  2320000000,
  '2024-10-21',
  '{"fund_id":"AS20241010","registration_date":"2024-10-21","expiry_date":"2029-10-20","formation_total_amount":"23.2","investment_character_code":"25","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20190019","operator_company_name":"오다스톤인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"오다스톤인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.824Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1376: 오다스톤 바이오 투자조합 제1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190019',
  '오다스톤 바이오 투자조합 제1호',
  2100000000,
  '2023-04-18',
  '{"fund_id":"AS20230301","registration_date":"2023-04-18","expiry_date":"2028-04-17","formation_total_amount":"21.0","investment_character_code":"25","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20190019","operator_company_name":"오다스톤인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"오다스톤인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.824Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1377: 오다스톤 디지털 투자조합 제1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190019',
  '오다스톤 디지털 투자조합 제1호',
  3060000000,
  '2024-04-08',
  '{"fund_id":"AS20240277","registration_date":"2024-04-08","expiry_date":"2031-04-07","formation_total_amount":"30.6","investment_character_code":"25","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20190019","operator_company_name":"오다스톤인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"오다스톤인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.824Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1378: 오거스트 한국영화르네상스 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20230076',
  '오거스트 한국영화르네상스 투자조합',
  11820000000,
  '2024-05-03',
  '{"fund_id":"AS20240382","registration_date":"2024-05-03","expiry_date":"2030-05-02","formation_total_amount":"118.2","investment_character_code":"24","industry_code":"6","investment_field_type":"문화","investment_field_detail_type":"영상(영화+드라마+애니메이션)","mother_fund_id":"MF00000001","operator_company_id":"OP20230076","operator_company_name":"오거스트벤처파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"오거스트벤처파트너스","investment_focus":["영상(영화+드라마+애니메이션)","문화"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.824Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1379: 옐로씨프론티어 벤처투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20230284',
  '옐로씨프론티어 벤처투자조합1호',
  2850000000,
  '2025-04-14',
  '{"fund_id":"AS20250284","registration_date":"2025-04-14","expiry_date":"2030-04-13","formation_total_amount":"28.5","investment_character_code":"28","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20230284","operator_company_name":"옐로씨펀드","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"옐로씨펀드","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.824Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1380: 영호남 지역균형발전 특구펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19870004',
  '영호남 지역균형발전 특구펀드',
  19000000000,
  '2021-01-12',
  '{"fund_id":"AS20210058","registration_date":"2021-01-12","expiry_date":"2029-01-11","formation_total_amount":"190.0","investment_character_code":"18","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP19870004","operator_company_name":"대성창업투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"대성창업투자","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.824Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1381: 영호남 연구개발특구펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20180007',
  '영호남 연구개발특구펀드',
  50000000000,
  '2025-02-26',
  '{"fund_id":"AS20250147","registration_date":"2025-02-26","expiry_date":"2033-02-25","formation_total_amount":"500.0","investment_character_code":"18","industry_code":"9","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000022","operator_company_id":"OP20180007","operator_company_name":"이앤벤처파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"이앤벤처파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.824Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1382: 영프론트원 크릿 메타버스 펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200352',
  '영프론트원 크릿 메타버스 펀드',
  30000000000,
  '2022-05-19',
  '{"fund_id":"AS20220563","registration_date":"2022-05-19","expiry_date":"2029-05-18","formation_total_amount":"300.0","investment_character_code":"21","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20200352","operator_company_name":"크릿벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"크릿벤처스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.824Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1383: 연세대학교기술지주 대학창업기업 개인투자조합 YUTH 2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20110012',
  '연세대학교기술지주 대학창업기업 개인투자조합 YUTH 2호',
  3500000000,
  '2019-09-16',
  '{"fund_id":"AS20190403","registration_date":"2019-09-16","expiry_date":"2029-09-15","formation_total_amount":"35.0","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"MF00000001","operator_company_id":"OP20110012","operator_company_name":"연세대학교기술지주","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"연세대학교기술지주","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.824Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1384: 연세대학교기술지주 개인투자조합 YUTH 4호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20110012',
  '연세대학교기술지주 개인투자조합 YUTH 4호',
  4400000000,
  '2021-10-29',
  '{"fund_id":"AS20211042","registration_date":"2021-10-29","expiry_date":"2031-10-28","formation_total_amount":"44.0","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"MF00000001","operator_company_id":"OP20110012","operator_company_name":"연세대학교기술지주","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"연세대학교기술지주","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.824Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1385: 연세대학교기술지주 개인투자조합 YUTH 3호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20110012',
  '연세대학교기술지주 개인투자조합 YUTH 3호',
  5000000000,
  '2020-09-22',
  '{"fund_id":"AS20200515","registration_date":"2020-09-22","expiry_date":"2030-09-21","formation_total_amount":"50.0","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"MF00000001","operator_company_id":"OP20110012","operator_company_name":"연세대학교기술지주","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"연세대학교기술지주","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.824Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1386: 연세대학교기술지주 IP펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20110012',
  '연세대학교기술지주 IP펀드',
  30000000000,
  '2023-07-26',
  '{"fund_id":"AS20230639","registration_date":"2023-07-26","expiry_date":"2031-07-25","formation_total_amount":"300.0","investment_character_code":"09","industry_code":"9","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20110012","operator_company_name":"연세대학교기술지주","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"연세대학교기술지주","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.824Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1387: 연세대학교 기술창업 벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20110012',
  '연세대학교 기술창업 벤처투자조합',
  3210000000,
  '2021-02-15',
  '{"fund_id":"AS20210119","registration_date":"2021-02-15","expiry_date":"2031-02-14","formation_total_amount":"32.1","investment_character_code":"01","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20110012","operator_company_name":"연세대학교기술지주","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"연세대학교기술지주","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.824Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1388: 연구개발특구 지역혁신펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20220645',
  '연구개발특구 지역혁신펀드',
  60600000000,
  '2023-01-10',
  '{"fund_id":"AS20230035","registration_date":"2023-01-10","expiry_date":"2031-01-09","formation_total_amount":"606.0","investment_character_code":"18","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20220645","operator_company_name":"인라이트벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"인라이트벤처스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.824Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1389: 연구개발특구 일자리창출펀드 2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19970007',
  '연구개발특구 일자리창출펀드 2호',
  73350000000,
  '2018-07-25',
  '{"fund_id":"AS20180194","registration_date":"2018-07-25","expiry_date":"2026-07-24","formation_total_amount":"733.5","investment_character_code":"18","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP19970007","operator_company_name":"포스코기술투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"포스코기술투자","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.824Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1390: 엠티아이-에스제이지피 소부장 1호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20110007',
  '엠티아이-에스제이지피 소부장 1호 투자조합',
  2700000000,
  '2024-04-22',
  '{"fund_id":"AS20240334","registration_date":"2024-04-22","expiry_date":"2029-04-21","formation_total_amount":"27.0","investment_character_code":"16","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20110007","operator_company_name":"마젤란기술투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"마젤란기술투자","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.824Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1391: 엠티아이 와이지 시큐리티 유니콘 투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20110007',
  '엠티아이 와이지 시큐리티 유니콘 투자조합 1호',
  3350000000,
  '2021-09-14',
  '{"fund_id":"AS20210857","registration_date":"2021-09-14","expiry_date":"2026-09-13","formation_total_amount":"33.5","investment_character_code":"25","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20110007","operator_company_name":"마젤란기술투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"마젤란기술투자","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.824Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1392: 엠차이나펀드1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19860003',
  '엠차이나펀드1호',
  42500000000,
  '2008-01-11',
  '{"fund_id":"AS20080015","registration_date":"2008-01-11","expiry_date":"2025-06-30","formation_total_amount":"425.0","investment_character_code":"15","industry_code":"1","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP19860003","operator_company_name":"엠벤처투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"엠벤처투자","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.824Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1393: 엠엠에스브이(MMSV) 플랫폼 9호 조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200468',
  '엠엠에스브이(MMSV) 플랫폼 9호 조합',
  320000000,
  '2024-05-31',
  '{"fund_id":"AS20240432","registration_date":"2024-05-31","expiry_date":"2031-05-19","formation_total_amount":"3.2","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200468","operator_company_name":"엠엠에스벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"엠엠에스벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.825Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1394: 엠엠에스브이(MMSV) 플랫폼 7호 조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200468',
  '엠엠에스브이(MMSV) 플랫폼 7호 조합',
  260000000,
  '2022-08-31',
  '{"fund_id":"AS20220948","registration_date":"2022-08-31","expiry_date":"2029-08-16","formation_total_amount":"2.6","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200468","operator_company_name":"엠엠에스벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"엠엠에스벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.825Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1395: 엠엠에스브이(MMSV) 시너지 1호 조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200468',
  '엠엠에스브이(MMSV) 시너지 1호 조합',
  100000000,
  '2022-03-07',
  '{"fund_id":"AS20220211","registration_date":"2022-03-07","expiry_date":"2027-03-01","formation_total_amount":"1.0","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200468","operator_company_name":"엠엠에스벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"엠엠에스벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.825Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1396: 엠엠에스브이(MMSV) 소재부품 13호 조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200468',
  '엠엠에스브이(MMSV) 소재부품 13호 조합',
  270000000,
  '2024-10-28',
  '{"fund_id":"AS20241011","registration_date":"2024-10-28","expiry_date":"2031-10-21","formation_total_amount":"2.7","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200468","operator_company_name":"엠엠에스벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"엠엠에스벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.825Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1397: 엠엠에스브이(MMSV) 소재부품 12호 조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200468',
  '엠엠에스브이(MMSV) 소재부품 12호 조합',
  370000000,
  '2022-12-08',
  '{"fund_id":"AS20221340","registration_date":"2022-12-08","expiry_date":"2027-11-22","formation_total_amount":"3.7","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200468","operator_company_name":"엠엠에스벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"엠엠에스벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.825Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1398: 엠엠에스브이(MMSV) 소재부품 10호 조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200468',
  '엠엠에스브이(MMSV) 소재부품 10호 조합',
  320000000,
  '2022-04-18',
  '{"fund_id":"AS20220416","registration_date":"2022-04-18","expiry_date":"2029-04-13","formation_total_amount":"3.2","investment_character_code":"","industry_code":"3","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200468","operator_company_name":"엠엠에스벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"엠엠에스벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.825Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1399: 엠엠에스브이(MMSV) 바이오 4호 조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200468',
  '엠엠에스브이(MMSV) 바이오 4호 조합',
  320000000,
  '2024-12-17',
  '{"fund_id":"AS20241312","registration_date":"2024-12-17","expiry_date":"2031-12-10","formation_total_amount":"3.2","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200468","operator_company_name":"엠엠에스벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"엠엠에스벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.825Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1400: 엠에이브이아이(MAVI)신성장좋은기업투자조합3호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19990017',
  '엠에이브이아이(MAVI)신성장좋은기업투자조합3호',
  23000000000,
  '2021-06-21',
  '{"fund_id":"AS20210500","registration_date":"2021-06-21","expiry_date":"2028-06-20","formation_total_amount":"230.0","investment_character_code":"02","industry_code":"7","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP19990017","operator_company_name":"미래에셋벤처투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"미래에셋벤처투자","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.825Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Minimal Batch 28 completed! 50 fund records processed.
-- Progress: 1400/3689 total records

