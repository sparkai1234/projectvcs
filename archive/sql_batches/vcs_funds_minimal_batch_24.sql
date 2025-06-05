-- VCS Fund MINIMAL UPSERT Batch 24/74 (Records 1151-1200)
-- MINIMAL: Only using basic columns that definitely exist
-- Generated from VCS API Scraper fund data
-- Generated at: 2025-06-05T00:40:21.807Z
-- Schema: Minimal fund_table structure (basic columns only)

-- MINIMAL FUND DATA (UPSERT - Safe for Duplicates)
-- Processing 50 fund records
-- Will INSERT new records or UPDATE existing ones

-- Record 1151: 유스업개인투자조합 79호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190212',
  '유스업개인투자조합 79호',
  1200000000,
  '2023-09-27',
  '{"fund_id":"AS20230861","registration_date":"2023-09-27","expiry_date":"2028-09-26","formation_total_amount":"12.0","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190212","operator_company_name":"유스업파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"유스업파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.807Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1152: 유스업개인투자조합 78호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190212',
  '유스업개인투자조합 78호',
  1230000000,
  '2023-08-08',
  '{"fund_id":"AS20230659","registration_date":"2023-08-08","expiry_date":"2028-08-07","formation_total_amount":"12.3","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190212","operator_company_name":"유스업파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"유스업파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.807Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1153: 유스업개인투자조합 77호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190212',
  '유스업개인투자조합 77호',
  990000000,
  '2023-07-31',
  '{"fund_id":"AS20230624","registration_date":"2023-07-31","expiry_date":"2028-07-30","formation_total_amount":"9.9","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190212","operator_company_name":"유스업파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"유스업파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.807Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1154: 유스업개인투자조합 76호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190212',
  '유스업개인투자조합 76호',
  1230000000,
  '2023-07-11',
  '{"fund_id":"AS20230576","registration_date":"2023-07-11","expiry_date":"2028-07-10","formation_total_amount":"12.3","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190212","operator_company_name":"유스업파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"유스업파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.807Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1155: 유스업개인투자조합 75호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190212',
  '유스업개인투자조합 75호',
  1100000000,
  '2023-09-04',
  '{"fund_id":"AS20230761","registration_date":"2023-09-04","expiry_date":"2028-09-03","formation_total_amount":"11.0","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190212","operator_company_name":"유스업파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"유스업파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.807Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1156: 유스업개인투자조합 74호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190212',
  '유스업개인투자조합 74호',
  1100000000,
  '2023-03-24',
  '{"fund_id":"AS20230222","registration_date":"2023-03-24","expiry_date":"2028-03-23","formation_total_amount":"11.0","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190212","operator_company_name":"유스업파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"유스업파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.807Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1157: 유스업개인투자조합 73호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190212',
  '유스업개인투자조합 73호',
  880000000,
  '2023-06-20',
  '{"fund_id":"AS20230505","registration_date":"2023-06-20","expiry_date":"2028-06-19","formation_total_amount":"8.8","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190212","operator_company_name":"유스업파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"유스업파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.807Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1158: 유스업개인투자조합 72호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190212',
  '유스업개인투자조합 72호',
  870000000,
  '2023-05-24',
  '{"fund_id":"AS20230399","registration_date":"2023-05-24","expiry_date":"2028-05-23","formation_total_amount":"8.7","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190212","operator_company_name":"유스업파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"유스업파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.807Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1159: 유스업개인투자조합 71호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190212',
  '유스업개인투자조합 71호',
  1000000000,
  '2023-04-18',
  '{"fund_id":"AS20230290","registration_date":"2023-04-18","expiry_date":"2028-04-17","formation_total_amount":"10.0","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190212","operator_company_name":"유스업파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"유스업파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.807Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1160: 유스업개인투자조합 70호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190212',
  '유스업개인투자조합 70호',
  930000000,
  '2023-03-14',
  '{"fund_id":"AS20230141","registration_date":"2023-03-14","expiry_date":"2028-03-13","formation_total_amount":"9.3","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190212","operator_company_name":"유스업파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"유스업파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.807Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1161: 유스업개인투자조합 69호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190212',
  '유스업개인투자조합 69호',
  890000000,
  '2023-02-27',
  '{"fund_id":"AS20230100","registration_date":"2023-02-27","expiry_date":"2028-02-26","formation_total_amount":"8.9","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190212","operator_company_name":"유스업파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"유스업파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.807Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1162: 유스업개인투자조합 68호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190212',
  '유스업개인투자조합 68호',
  970000000,
  '2022-12-19',
  '{"fund_id":"AS20221453","registration_date":"2022-12-19","expiry_date":"2027-12-18","formation_total_amount":"9.7","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190212","operator_company_name":"유스업파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"유스업파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.807Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1163: 유스업개인투자조합 67호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190212',
  '유스업개인투자조합 67호',
  960000000,
  '2022-12-19',
  '{"fund_id":"AS20221430","registration_date":"2022-12-19","expiry_date":"2027-12-18","formation_total_amount":"9.6","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190212","operator_company_name":"유스업파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"유스업파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.807Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1164: 유스업개인투자조합 66호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190212',
  '유스업개인투자조합 66호',
  970000000,
  '2022-12-19',
  '{"fund_id":"AS20221441","registration_date":"2022-12-19","expiry_date":"2027-12-18","formation_total_amount":"9.7","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190212","operator_company_name":"유스업파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"유스업파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.807Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1165: 유스업개인투자조합 65호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190212',
  '유스업개인투자조합 65호',
  920000000,
  '2022-12-19',
  '{"fund_id":"AS20221403","registration_date":"2022-12-19","expiry_date":"2027-12-18","formation_total_amount":"9.2","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190212","operator_company_name":"유스업파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"유스업파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.807Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1166: 유스업개인투자조합 64호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190212',
  '유스업개인투자조합 64호',
  1140000000,
  '2022-12-09',
  '{"fund_id":"AS20221388","registration_date":"2022-12-09","expiry_date":"2027-12-08","formation_total_amount":"11.4","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190212","operator_company_name":"유스업파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"유스업파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.807Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1167: 유스업개인투자조합 63호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190212',
  '유스업개인투자조합 63호',
  880000000,
  '2022-11-30',
  '{"fund_id":"AS20221344","registration_date":"2022-11-30","expiry_date":"2027-11-29","formation_total_amount":"8.8","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190212","operator_company_name":"유스업파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"유스업파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.807Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1168: 유스업개인투자조합 62호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190212',
  '유스업개인투자조합 62호',
  1180000000,
  '2022-11-30',
  '{"fund_id":"AS20221329","registration_date":"2022-11-30","expiry_date":"2027-11-29","formation_total_amount":"11.8","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190212","operator_company_name":"유스업파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"유스업파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.807Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1169: 유스업개인투자조합 61호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190212',
  '유스업개인투자조합 61호',
  410000000,
  '2022-12-19',
  '{"fund_id":"AS20221429","registration_date":"2022-12-19","expiry_date":"2027-12-18","formation_total_amount":"4.1","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190212","operator_company_name":"유스업파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"유스업파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.807Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1170: 유스업개인투자조합 60호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190212',
  '유스업개인투자조합 60호',
  1040000000,
  '2022-11-07',
  '{"fund_id":"AS20221250","registration_date":"2022-11-07","expiry_date":"2027-11-06","formation_total_amount":"10.4","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190212","operator_company_name":"유스업파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"유스업파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.807Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1171: 유스업개인투자조합 59호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190212',
  '유스업개인투자조합 59호',
  940000000,
  '2022-12-15',
  '{"fund_id":"AS20221376","registration_date":"2022-12-15","expiry_date":"2027-12-14","formation_total_amount":"9.4","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190212","operator_company_name":"유스업파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"유스업파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.807Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1172: 유스업개인투자조합 58호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190212',
  '유스업개인투자조합 58호',
  970000000,
  '2022-11-22',
  '{"fund_id":"AS20221272","registration_date":"2022-11-22","expiry_date":"2027-11-21","formation_total_amount":"9.7","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190212","operator_company_name":"유스업파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"유스업파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.807Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1173: 유스업개인투자조합 57호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190212',
  '유스업개인투자조합 57호',
  1210000000,
  '2022-10-24',
  '{"fund_id":"AS20221168","registration_date":"2022-10-24","expiry_date":"2027-10-23","formation_total_amount":"12.1","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190212","operator_company_name":"유스업파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"유스업파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.807Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1174: 유스업개인투자조합 54호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190212',
  '유스업개인투자조합 54호',
  1140000000,
  '2022-09-20',
  '{"fund_id":"AS20221035","registration_date":"2022-09-20","expiry_date":"2027-09-19","formation_total_amount":"11.4","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190212","operator_company_name":"유스업파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"유스업파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.807Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1175: 유스업개인투자조합 53호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190212',
  '유스업개인투자조합 53호',
  950000000,
  '2022-09-06',
  '{"fund_id":"AS20220993","registration_date":"2022-09-06","expiry_date":"2027-09-05","formation_total_amount":"9.5","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190212","operator_company_name":"유스업파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"유스업파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.807Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1176: 유스업개인투자조합 52호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190212',
  '유스업개인투자조합 52호',
  990000000,
  '2022-07-25',
  '{"fund_id":"AS20220816","registration_date":"2022-07-25","expiry_date":"2027-07-24","formation_total_amount":"9.9","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190212","operator_company_name":"유스업파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"유스업파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.807Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1177: 유스업개인투자조합 47호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190212',
  '유스업개인투자조합 47호',
  750000000,
  '2022-05-26',
  '{"fund_id":"AS20220585","registration_date":"2022-05-26","expiry_date":"2027-05-25","formation_total_amount":"7.5","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190212","operator_company_name":"유스업파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"유스업파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.807Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1178: 유스업개인투자조합 23호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190212',
  '유스업개인투자조합 23호',
  390000000,
  '2021-04-19',
  '{"fund_id":"AS20210293","registration_date":"2021-04-19","expiry_date":"2026-04-18","formation_total_amount":"3.9","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190212","operator_company_name":"유스업파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"유스업파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.807Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1179: 유스업개인투자조합 21호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190212',
  '유스업개인투자조합 21호',
  820000000,
  '2020-12-21',
  '{"fund_id":"AS20200785","registration_date":"2020-12-21","expiry_date":"2025-12-20","formation_total_amount":"8.2","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190212","operator_company_name":"유스업파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"유스업파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.807Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1180: 유스업개인투자조합 19호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190212',
  '유스업개인투자조합 19호',
  960000000,
  '2020-12-16',
  '{"fund_id":"AS20200774","registration_date":"2020-12-16","expiry_date":"2025-12-15","formation_total_amount":"9.6","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190212","operator_company_name":"유스업파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"유스업파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.807Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1181: 유스업개인투자조합 18호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190212',
  '유스업개인투자조합 18호',
  950000000,
  '2020-11-23',
  '{"fund_id":"AS20200683","registration_date":"2020-11-23","expiry_date":"2025-11-22","formation_total_amount":"9.5","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190212","operator_company_name":"유스업파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"유스업파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.807Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1182: 유스업개인투자조합 17호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190212',
  '유스업개인투자조합 17호',
  910000000,
  '2020-11-23',
  '{"fund_id":"AS20200679","registration_date":"2020-11-23","expiry_date":"2025-11-22","formation_total_amount":"9.1","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190212","operator_company_name":"유스업파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"유스업파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.807Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1183: 유스업개인투자조합 16호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190212',
  '유스업개인투자조합 16호',
  990000000,
  '2020-11-11',
  '{"fund_id":"AS20200634","registration_date":"2020-11-11","expiry_date":"2025-11-10","formation_total_amount":"9.9","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190212","operator_company_name":"유스업파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"유스업파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.808Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1184: 유스업개인투자조합 15호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190212',
  '유스업개인투자조합 15호',
  630000000,
  '2020-11-03',
  '{"fund_id":"AS20200606","registration_date":"2020-11-03","expiry_date":"2025-11-02","formation_total_amount":"6.3","investment_character_code":"","industry_code":"4","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190212","operator_company_name":"유스업파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"유스업파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.808Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1185: 유스업개인투자조합 14호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190212',
  '유스업개인투자조합 14호',
  690000000,
  '2020-09-28',
  '{"fund_id":"AS20200540","registration_date":"2020-09-28","expiry_date":"2025-09-27","formation_total_amount":"6.9","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190212","operator_company_name":"유스업파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"유스업파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.808Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1186: 유스업개인투자조합 13호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190212',
  '유스업개인투자조합 13호',
  940000000,
  '2020-09-16',
  '{"fund_id":"AS20200490","registration_date":"2020-09-16","expiry_date":"2025-09-15","formation_total_amount":"9.4","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190212","operator_company_name":"유스업파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"유스업파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.808Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1187: 유스업개인투자조합 11호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190212',
  '유스업개인투자조합 11호',
  780000000,
  '2020-07-21',
  '{"fund_id":"AS20200340","registration_date":"2020-07-21","expiry_date":"2025-07-20","formation_total_amount":"7.8","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190212","operator_company_name":"유스업파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"유스업파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.808Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1188: 유스업99호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190212',
  '유스업99호 개인투자조합',
  850000000,
  '2024-12-19',
  '{"fund_id":"AS20241321","registration_date":"2024-12-19","expiry_date":"2029-12-18","formation_total_amount":"8.5","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190212","operator_company_name":"유스업파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"유스업파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.808Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1189: 유스업98호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190212',
  '유스업98호 개인투자조합',
  960000000,
  '2024-12-19',
  '{"fund_id":"AS20241339","registration_date":"2024-12-19","expiry_date":"2029-12-18","formation_total_amount":"9.6","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190212","operator_company_name":"유스업파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"유스업파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.808Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1190: 유스업97호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190212',
  '유스업97호 개인투자조합',
  1070000000,
  '2024-12-13',
  '{"fund_id":"AS20241262","registration_date":"2024-12-13","expiry_date":"2029-12-12","formation_total_amount":"10.7","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190212","operator_company_name":"유스업파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"유스업파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.808Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1191: 유스업96호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190212',
  '유스업96호 개인투자조합',
  1090000000,
  '2024-12-06',
  '{"fund_id":"AS20241216","registration_date":"2024-12-06","expiry_date":"2029-12-04","formation_total_amount":"10.9","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190212","operator_company_name":"유스업파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"유스업파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.808Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1192: 유스업95호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190212',
  '유스업95호 개인투자조합',
  1470000000,
  '2024-11-12',
  '{"fund_id":"AS20241080","registration_date":"2024-11-12","expiry_date":"2029-11-11","formation_total_amount":"14.7","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190212","operator_company_name":"유스업파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"유스업파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.808Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1193: 유스업94호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190212',
  '유스업94호 개인투자조합',
  1280000000,
  '2024-11-07',
  '{"fund_id":"AS20241050","registration_date":"2024-11-07","expiry_date":"2029-11-06","formation_total_amount":"12.8","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190212","operator_company_name":"유스업파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"유스업파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.808Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1194: 유스업93호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190212',
  '유스업93호 개인투자조합',
  1350000000,
  '2024-10-17',
  '{"fund_id":"AS20240939","registration_date":"2024-10-17","expiry_date":"2029-10-14","formation_total_amount":"13.5","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190212","operator_company_name":"유스업파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"유스업파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.808Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1195: 유스업92호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190212',
  '유스업92호 개인투자조합',
  930000000,
  '2024-08-30',
  '{"fund_id":"AS20240798","registration_date":"2024-08-30","expiry_date":"2029-08-29","formation_total_amount":"9.3","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190212","operator_company_name":"유스업파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"유스업파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.808Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1196: 유스업91호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190212',
  '유스업91호 개인투자조합',
  1230000000,
  '2024-08-01',
  '{"fund_id":"AS20240674","registration_date":"2024-08-01","expiry_date":"2029-07-31","formation_total_amount":"12.3","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190212","operator_company_name":"유스업파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"유스업파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.808Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1197: 유스업90호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190212',
  '유스업90호 개인투자조합',
  1280000000,
  '2024-06-10',
  '{"fund_id":"AS20240483","registration_date":"2024-06-10","expiry_date":"2029-06-09","formation_total_amount":"12.8","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190212","operator_company_name":"유스업파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"유스업파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.808Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1198: 유스업89호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190212',
  '유스업89호 개인투자조합',
  810000000,
  '2024-04-12',
  '{"fund_id":"AS20240267","registration_date":"2024-04-12","expiry_date":"2029-04-11","formation_total_amount":"8.1","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190212","operator_company_name":"유스업파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"유스업파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.808Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1199: 유스업88호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190212',
  '유스업88호 개인투자조합',
  770000000,
  '2024-03-11',
  '{"fund_id":"AS20240126","registration_date":"2024-03-11","expiry_date":"2029-03-10","formation_total_amount":"7.7","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190212","operator_company_name":"유스업파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"유스업파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.808Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1200: 유스업87호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190212',
  '유스업87호 개인투자조합',
  960000000,
  '2023-12-19',
  '{"fund_id":"AS20231251","registration_date":"2023-12-19","expiry_date":"2028-12-18","formation_total_amount":"9.6","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190212","operator_company_name":"유스업파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"유스업파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.808Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Minimal Batch 24 completed! 50 fund records processed.
-- Progress: 1200/3689 total records

