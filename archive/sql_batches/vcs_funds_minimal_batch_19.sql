-- VCS Fund MINIMAL UPSERT Batch 19/74 (Records 901-950)
-- MINIMAL: Only using basic columns that definitely exist
-- Generated from VCS API Scraper fund data
-- Generated at: 2025-06-05T00:40:21.785Z
-- Schema: Minimal fund_table structure (basic columns only)

-- MINIMAL FUND DATA (UPSERT - Safe for Duplicates)
-- Processing 50 fund records
-- Will INSERT new records or UPDATE existing ones

-- Record 901: 제이비위드플러스6호 조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200038',
  '제이비위드플러스6호 조합',
  110000000,
  '2025-01-31',
  '{"fund_id":"AS20250068","registration_date":"2025-01-31","expiry_date":"2030-01-22","formation_total_amount":"1.1","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200038","operator_company_name":"제이비벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"제이비벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.785Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 902: 제이비위드플러스(JB With Plus)1호 조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200038',
  '제이비위드플러스(JB With Plus)1호 조합',
  240000000,
  '2020-03-23',
  '{"fund_id":"AS20200139","registration_date":"2020-03-23","expiry_date":"2026-03-19","formation_total_amount":"2.4","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200038","operator_company_name":"제이비벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"제이비벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.785Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 903: 제이비위드플러스(JB With PLUS) 2호 조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200038',
  '제이비위드플러스(JB With PLUS) 2호 조합',
  290000000,
  '2020-07-20',
  '{"fund_id":"AS20200337","registration_date":"2020-07-20","expiry_date":"2025-07-31","formation_total_amount":"2.9","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200038","operator_company_name":"제이비벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"제이비벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.785Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 904: 제이비위드플러스 5호 조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200038',
  '제이비위드플러스 5호 조합',
  810000000,
  '2023-09-22',
  '{"fund_id":"AS20230842","registration_date":"2023-09-22","expiry_date":"2028-09-18","formation_total_amount":"8.1","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200038","operator_company_name":"제이비벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"제이비벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.785Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 905: 제이비위드플러스 4호 조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200038',
  '제이비위드플러스 4호 조합',
  1150000000,
  '2022-07-25',
  '{"fund_id":"AS20220842","registration_date":"2022-07-25","expiry_date":"2027-07-20","formation_total_amount":"11.5","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200038","operator_company_name":"제이비벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"제이비벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.785Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 906: 제이비원개인투자조합제3호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20220646',
  '제이비원개인투자조합제3호',
  540000000,
  '2024-11-18',
  '{"fund_id":"AS20241091","registration_date":"2024-11-18","expiry_date":"2032-11-05","formation_total_amount":"5.4","investment_character_code":"","industry_code":"3","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20220646","operator_company_name":"원투자파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"원투자파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.785Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 907: 제이비원개인투자조합제2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20220646',
  '제이비원개인투자조합제2호',
  350000000,
  '2024-04-23',
  '{"fund_id":"AS20240305","registration_date":"2024-04-23","expiry_date":"2032-04-11","formation_total_amount":"3.5","investment_character_code":"","industry_code":"3","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20220646","operator_company_name":"원투자파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"원투자파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.785Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 908: 제이비원개인투자조합 제1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20220646',
  '제이비원개인투자조합 제1호',
  630000000,
  '2023-12-07',
  '{"fund_id":"AS20231152","registration_date":"2023-12-07","expiry_date":"2031-11-26","formation_total_amount":"6.3","investment_character_code":"","industry_code":"3","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20220646","operator_company_name":"원투자파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"원투자파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.785Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 909: 제이비에듀 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200038',
  '제이비에듀 투자조합',
  220000000,
  '2024-12-30',
  '{"fund_id":"AS20241440","registration_date":"2024-12-30","expiry_date":"2029-12-25","formation_total_amount":"2.2","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200038","operator_company_name":"제이비벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"제이비벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.785Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 910: 제이비벤처스 라이즈 1호 조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200038',
  '제이비벤처스 라이즈 1호 조합',
  3000000000,
  '2024-01-23',
  '{"fund_id":"AS20240043","registration_date":"2024-01-23","expiry_date":"2032-01-16","formation_total_amount":"30.0","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"MF00000021","operator_company_id":"OP20200038","operator_company_name":"제이비벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"제이비벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.785Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 911: 제이비벤처스 네발자국 투자 조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200038',
  '제이비벤처스 네발자국 투자 조합',
  150000000,
  '2022-03-22',
  '{"fund_id":"AS20220272","registration_date":"2022-03-22","expiry_date":"2027-03-09","formation_total_amount":"1.5","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200038","operator_company_name":"제이비벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"제이비벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.785Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 912: 제이비(JB)기술지주 개인투자조합 제2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20110010',
  '제이비(JB)기술지주 개인투자조합 제2호',
  3000000000,
  '2021-12-09',
  '{"fund_id":"AS20211234","registration_date":"2021-12-09","expiry_date":"2029-12-05","formation_total_amount":"30.0","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"MF00000001","operator_company_id":"OP20110010","operator_company_name":"전북지역대학연합기술지주","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"전북지역대학연합기술지주","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.785Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 913: 제이비(JB) 지역특화 밸류업 개인투자조합 제3호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20110010',
  '제이비(JB) 지역특화 밸류업 개인투자조합 제3호',
  3300000000,
  '2024-01-30',
  '{"fund_id":"AS20240049","registration_date":"2024-01-30","expiry_date":"2032-01-17","formation_total_amount":"33.0","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"MF00000021","operator_company_id":"OP20110010","operator_company_name":"전북지역대학연합기술지주","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"전북지역대학연합기술지주","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.785Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 914: 제로투앤3호투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20220424',
  '제로투앤3호투자조합',
  110000000,
  '2024-05-30',
  '{"fund_id":"AS20240463","registration_date":"2024-05-30","expiry_date":"2029-05-29","formation_total_amount":"1.1","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20220424","operator_company_name":"제로투원파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"제로투원파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.785Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 915: 제로투앤1호투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20220424',
  '제로투앤1호투자조합',
  110000000,
  '2023-08-01',
  '{"fund_id":"AS20230645","registration_date":"2023-08-01","expiry_date":"2028-07-31","formation_total_amount":"1.1","investment_character_code":"","industry_code":"6","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20220424","operator_company_name":"제로투원파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"제로투원파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.785Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 916: 제5호 G-IN 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190278',
  '제5호 G-IN 개인투자조합',
  1060000000,
  '2023-12-12',
  '{"fund_id":"AS20231235","registration_date":"2023-12-12","expiry_date":"2028-12-07","formation_total_amount":"10.6","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190278","operator_company_name":"광주창조경제혁신센터","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"광주창조경제혁신센터","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.785Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 917: 제4호 G-IN 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190278',
  '제4호 G-IN 개인투자조합',
  150000000,
  '2023-09-11',
  '{"fund_id":"AS20230774","registration_date":"2023-09-11","expiry_date":"2028-08-30","formation_total_amount":"1.5","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190278","operator_company_name":"광주창조경제혁신센터","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"광주창조경제혁신센터","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.785Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 918: 제3호 비티비벤처스 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210045',
  '제3호 비티비벤처스 개인투자조합',
  700000000,
  '2024-04-03',
  '{"fund_id":"AS20240214","registration_date":"2024-04-03","expiry_date":"2032-04-02","formation_total_amount":"7.0","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20210045","operator_company_name":"비티비벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"비티비벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.785Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 919: 제3호 G-IN 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190278',
  '제3호 G-IN 개인투자조합',
  380000000,
  '2022-02-25',
  '{"fund_id":"AS20220191","registration_date":"2022-02-25","expiry_date":"2029-02-28","formation_total_amount":"3.8","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190278","operator_company_name":"광주창조경제혁신센터","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"광주창조경제혁신센터","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.785Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 920: 제2호 G-IN 엔젤투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190278',
  '제2호 G-IN 엔젤투자조합',
  360000000,
  '2022-01-20',
  '{"fund_id":"AS20220073","registration_date":"2022-01-20","expiry_date":"2027-01-19","formation_total_amount":"3.6","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190278","operator_company_name":"광주창조경제혁신센터","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"광주창조경제혁신센터","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.785Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 921: 제1호 K-바이오혁신 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210068',
  '제1호 K-바이오혁신 개인투자조합',
  180000000,
  '2022-04-27',
  '{"fund_id":"AS20220459","registration_date":"2022-04-27","expiry_date":"2027-04-26","formation_total_amount":"1.8","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20210068","operator_company_name":"드림벤처스유한책임회사","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"드림벤처스유한책임회사","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.785Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 922: 제1호 G-IN 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190278',
  '제1호 G-IN 개인투자조합',
  240000000,
  '2020-01-06',
  '{"fund_id":"AS20200019","registration_date":"2020-01-06","expiry_date":"2026-12-31","formation_total_amount":"2.4","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190278","operator_company_name":"광주창조경제혁신센터","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"광주창조경제혁신센터","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.785Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 923: 전북혁신창업투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20170044',
  '전북혁신창업투자조합1호',
  500000000,
  '2021-12-24',
  '{"fund_id":"AS20211386","registration_date":"2021-12-24","expiry_date":"2026-12-31","formation_total_amount":"5.0","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20170044","operator_company_name":"한국바이오투자파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"한국바이오투자파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.785Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 924: 전북초기투자 크립톤 혁신펀드1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20110014',
  '전북초기투자 크립톤 혁신펀드1호',
  5000000000,
  '2024-07-29',
  '{"fund_id":"AS20240649","registration_date":"2024-07-29","expiry_date":"2032-07-28","formation_total_amount":"50.0","investment_character_code":"","industry_code":"6","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"MF00000001","operator_company_id":"OP20110014","operator_company_name":"크립톤","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"크립톤","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.785Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 925: 전북벤처 혁신투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190335',
  '전북벤처 혁신투자조합1호',
  200000000,
  '2022-12-15',
  '{"fund_id":"AS20221472","registration_date":"2022-12-15","expiry_date":"2027-12-20","formation_total_amount":"2.0","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190335","operator_company_name":"전북창조경제혁신센터","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"전북창조경제혁신센터","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.785Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 926: 전북대학교 제2호 대학창업 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20170030',
  '전북대학교 제2호 대학창업 개인투자조합',
  2700000000,
  '2021-08-24',
  '{"fund_id":"AS20210711","registration_date":"2021-08-24","expiry_date":"2029-08-23","formation_total_amount":"27.0","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"MF00000001","operator_company_id":"OP20170030","operator_company_name":"특허법인지원","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"특허법인지원","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.785Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 927: 전북경제기술벤처개인투자조합제1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200320',
  '전북경제기술벤처개인투자조합제1호',
  310000000,
  '2024-12-02',
  '{"fund_id":"AS20241184","registration_date":"2024-12-02","expiry_date":"2029-11-20","formation_total_amount":"3.1","investment_character_code":"","industry_code":"3","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200320","operator_company_name":"전북특별자치도경제통상진흥원","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"전북특별자치도경제통상진흥원","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.785Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 928: 전북·강원 지역혁신 벤처펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20000029',
  '전북·강원 지역혁신 벤처펀드',
  59400000000,
  '2023-03-08',
  '{"fund_id":"AS20230180","registration_date":"2023-03-08","expiry_date":"2035-03-07","formation_total_amount":"594.0","investment_character_code":"10","industry_code":"9","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20000029","operator_company_name":"한국벤처투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"한국벤처투자","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.786Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 929: 전북-효성-에스제이 탄소성장펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20100006',
  '전북-효성-에스제이 탄소성장펀드',
  20000000000,
  '2016-09-13',
  '{"fund_id":"AS20160018","registration_date":"2016-09-13","expiry_date":"2025-09-12","formation_total_amount":"200.0","investment_character_code":"18","industry_code":"4","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20100006","operator_company_name":"에스제이투자파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"에스제이투자파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.786Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 930: 전북-에스제이 퍼스트무버 벤처펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20100006',
  '전북-에스제이 퍼스트무버 벤처펀드',
  18000000000,
  '2019-01-22',
  '{"fund_id":"AS20190036","registration_date":"2019-01-22","expiry_date":"2027-01-21","formation_total_amount":"180.0","investment_character_code":"20","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20100006","operator_company_name":"에스제이투자파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"에스제이투자파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.786Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 931: 전북 지역혁신 임팩트 투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20110015',
  '전북 지역혁신 임팩트 투자조합 1호',
  1000000000,
  '2023-12-20',
  '{"fund_id":"AS20231214","registration_date":"2023-12-20","expiry_date":"2031-12-19","formation_total_amount":"10.0","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"MF00000021","operator_company_id":"OP20110015","operator_company_name":"엠와이소셜컴퍼니","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"엠와이소셜컴퍼니","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.786Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 932: 전남그린에너지펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20070004',
  '전남그린에너지펀드',
  7600000000,
  '2009-01-23',
  '{"fund_id":"AS20090005","registration_date":"2009-01-23","expiry_date":"2025-10-22","formation_total_amount":"76.0","investment_character_code":"18","industry_code":"9","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20070004","operator_company_name":"삼호그린인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"삼호그린인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.786Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 933: 전남-보광 청년창업 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19890005',
  '전남-보광 청년창업 투자조합',
  10000000000,
  '2018-06-28',
  '{"fund_id":"AS20180185","registration_date":"2018-06-28","expiry_date":"2028-06-27","formation_total_amount":"100.0","investment_character_code":"18","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP19890005","operator_company_name":"보광인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"보광인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.786Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 934: 전남 엔젤투자매칭펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20120017',
  '전남 엔젤투자매칭펀드',
  5000000000,
  '2015-11-20',
  '{"fund_id":"AS20150092","registration_date":"2015-11-20","expiry_date":"2025-11-19","formation_total_amount":"50.0","investment_character_code":"20","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20120017","operator_company_name":"한국엔젤투자협회","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"한국엔젤투자협회","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.786Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 935: 임팩트스퀘어 사회적기업 디딤돌 벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190342',
  '임팩트스퀘어 사회적기업 디딤돌 벤처투자조합',
  5800000000,
  '2020-11-09',
  '{"fund_id":"AS20200642","registration_date":"2020-11-09","expiry_date":"2028-11-08","formation_total_amount":"58.0","investment_character_code":"23","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20190342","operator_company_name":"임팩트스퀘어","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"임팩트스퀘어","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.786Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 936: 임팩트스퀘어 사회적기업 디딤돌 2호 벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190342',
  '임팩트스퀘어 사회적기업 디딤돌 2호 벤처투자조합',
  6000000000,
  '2022-05-11',
  '{"fund_id":"AS20220528","registration_date":"2022-05-11","expiry_date":"2030-05-10","formation_total_amount":"60.0","investment_character_code":"20","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20190342","operator_company_name":"임팩트스퀘어","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"임팩트스퀘어","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.786Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 937: 임팩트스퀘어 ESG 글로벌 성장지원 벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190342',
  '임팩트스퀘어 ESG 글로벌 성장지원 벤처투자조합',
  2050000000,
  '2023-01-27',
  '{"fund_id":"AS20230075","registration_date":"2023-01-27","expiry_date":"2031-01-26","formation_total_amount":"20.5","investment_character_code":"20","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20190342","operator_company_name":"임팩트스퀘어","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"임팩트스퀘어","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.786Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 938: 임팩트벤처투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200156',
  '임팩트벤처투자조합1호',
  2400000000,
  '2021-12-29',
  '{"fund_id":"AS20211441","registration_date":"2021-12-29","expiry_date":"2026-12-28","formation_total_amount":"24.0","investment_character_code":"03","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20200156","operator_company_name":"임팩트파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"임팩트파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.786Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 939: 임팩트 혁신 개인투자조합 4호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190401',
  '임팩트 혁신 개인투자조합 4호',
  100000000,
  '2023-02-21',
  '{"fund_id":"AS20230090","registration_date":"2023-02-21","expiry_date":"2028-02-20","formation_total_amount":"1.0","investment_character_code":"","industry_code":"7","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190401","operator_company_name":"임팩트재단","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"임팩트재단","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.786Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 940: 임팩트 혁신 개인투자조합 3호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190401',
  '임팩트 혁신 개인투자조합 3호',
  680000000,
  '2022-01-14',
  '{"fund_id":"AS20220052","registration_date":"2022-01-14","expiry_date":"2027-01-13","formation_total_amount":"6.8","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190401","operator_company_name":"임팩트재단","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"임팩트재단","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.786Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 941: 임팩트 피크닉 투자조합 3호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190413',
  '임팩트 피크닉 투자조합 3호',
  4300000000,
  '2024-10-17',
  '{"fund_id":"AS20240989","registration_date":"2024-10-17","expiry_date":"2032-10-16","formation_total_amount":"43.0","investment_character_code":"05","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20190413","operator_company_name":"소풍벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"소풍벤처스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.786Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 942: 임팩트 피크닉 투자조합 2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190413',
  '임팩트 피크닉 투자조합 2호',
  3340000000,
  '2024-03-13',
  '{"fund_id":"AS20240186","registration_date":"2024-03-13","expiry_date":"2032-03-12","formation_total_amount":"33.4","investment_character_code":"05","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20190413","operator_company_name":"소풍벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"소풍벤처스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.786Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 943: 임팩트 피크닉 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190413',
  '임팩트 피크닉 투자조합',
  10300000000,
  '2022-04-14',
  '{"fund_id":"AS20220424","registration_date":"2022-04-14","expiry_date":"2030-04-13","formation_total_amount":"103.0","investment_character_code":"20","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20190413","operator_company_name":"소풍벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"소풍벤처스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.786Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 944: 임팩트 컬렉티브 코리아 펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200136',
  '임팩트 컬렉티브 코리아 펀드',
  5000000000,
  '2020-11-18',
  '{"fund_id":"AS20200659","registration_date":"2020-11-18","expiry_date":"2028-11-17","formation_total_amount":"50.0","investment_character_code":"20","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20200136","operator_company_name":"더벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"더벤처스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.786Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 945: 임팩트 그로우 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190413',
  '임팩트 그로우 투자조합',
  2500000000,
  '2021-12-31',
  '{"fund_id":"AS20220005","registration_date":"2021-12-31","expiry_date":"2029-12-30","formation_total_amount":"25.0","investment_character_code":"20","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20190413","operator_company_name":"소풍벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"소풍벤처스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.786Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 946: 일자리 창출 성장지원 펀드 3호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20000029',
  '일자리 창출 성장지원 펀드 3호',
  20500000000,
  '2022-10-26',
  '{"fund_id":"AS20221227","registration_date":"2022-10-26","expiry_date":"2030-10-25","formation_total_amount":"205.0","investment_character_code":"14","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20000029","operator_company_name":"한국벤처투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"한국벤처투자","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.786Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 947: 일자리 창출 성장지원 펀드 2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20000029',
  '일자리 창출 성장지원 펀드 2호',
  20500000000,
  '2021-06-25',
  '{"fund_id":"AS20210523","registration_date":"2021-06-25","expiry_date":"2029-06-24","formation_total_amount":"205.0","investment_character_code":"14","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20000029","operator_company_name":"한국벤처투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"한국벤처투자","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.786Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 948: 일자리 창출 성장지원 펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20000029',
  '일자리 창출 성장지원 펀드',
  50600000000,
  '2018-08-16',
  '{"fund_id":"AS20180207","registration_date":"2018-08-16","expiry_date":"2029-08-15","formation_total_amount":"506.0","investment_character_code":"10","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20000029","operator_company_name":"한국벤처투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"한국벤처투자","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.786Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 949: 일신 파이팅코리아 스포츠투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19900005',
  '일신 파이팅코리아 스포츠투자조합',
  12000000000,
  '2024-11-25',
  '{"fund_id":"AS20241198","registration_date":"2024-11-25","expiry_date":"2030-11-24","formation_total_amount":"120.0","investment_character_code":"07","industry_code":"9","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP19900005","operator_company_name":"일신창업투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"일신창업투자","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.786Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 950: 일신 뉴코리안웨이브 3호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19900005',
  '일신 뉴코리안웨이브 3호 투자조합',
  22000000000,
  '2019-07-30',
  '{"fund_id":"AS20190312","registration_date":"2019-07-30","expiry_date":"2027-07-29","formation_total_amount":"220.0","investment_character_code":"24","industry_code":"6","investment_field_type":"문화","investment_field_detail_type":"공연","mother_fund_id":"MF00000001","operator_company_id":"OP19900005","operator_company_name":"일신창업투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"일신창업투자","investment_focus":["공연","문화"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.786Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Minimal Batch 19 completed! 50 fund records processed.
-- Progress: 950/3689 total records

