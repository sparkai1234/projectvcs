-- VCS Fund UPSERT Batch 59/74 (Records 2901-2950)
-- Uses ON CONFLICT DO UPDATE to insert new or update existing funds
-- Generated from VCS API Scraper fund data
-- Generated at: 2025-06-05T00:28:06.858Z
-- Schema: Matches fund_table structure

-- FUND DATA (UPSERT - Safe for Duplicates)
-- Processing 50 fund records
-- Will INSERT new records or UPDATE existing ones

-- Record 2901: 리벤처스 바이오 헬스케어 2호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20200492',
  '리벤처스 바이오 헬스케어 2호 투자조합',
  NULL,
  'VCS Registered Fund',
  220000000,
  220000000,
  '2022-08-31',
  'Active',
  '리벤처스',
  NULL,
  '{"fund_id":"AS20220959","registration_date":"2022-08-31","expiry_date":"2027-08-18","formation_total_amount":"2.2","investment_character_code":"","industry_code":"6","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200492","operator_company_name":"리벤처스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.858Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_name_en = EXCLUDED.fund_name_en,
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2902: 리벤처스 바이오 헬스케어 1호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20200492',
  '리벤처스 바이오 헬스케어 1호 투자조합',
  NULL,
  'VCS Registered Fund',
  700000000,
  700000000,
  '2023-02-21',
  'Active',
  '리벤처스',
  NULL,
  '{"fund_id":"AS20230067","registration_date":"2023-02-21","expiry_date":"2028-01-25","formation_total_amount":"7.0","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200492","operator_company_name":"리벤처스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.858Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_name_en = EXCLUDED.fund_name_en,
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2903: 리벤처스 디지털컨텐츠 투자조합 제1호
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20200492',
  '리벤처스 디지털컨텐츠 투자조합 제1호',
  NULL,
  'VCS Registered Fund',
  860000000,
  860000000,
  '2021-09-09',
  'Active',
  '리벤처스',
  NULL,
  '{"fund_id":"AS20210786","registration_date":"2021-09-09","expiry_date":"2026-08-31","formation_total_amount":"8.6","investment_character_code":"","industry_code":"6","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200492","operator_company_name":"리벤처스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.858Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_name_en = EXCLUDED.fund_name_en,
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2904: 리벤처스 TP 3호 조합
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20200492',
  '리벤처스 TP 3호 조합',
  NULL,
  'VCS Registered Fund',
  1810000000,
  1810000000,
  '2023-06-05',
  'Active',
  '리벤처스',
  NULL,
  '{"fund_id":"AS20230428","registration_date":"2023-06-05","expiry_date":"2028-05-25","formation_total_amount":"18.1","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200492","operator_company_name":"리벤처스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.858Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_name_en = EXCLUDED.fund_name_en,
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2905: 리벤처스 TP 2호 조합
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20200468',
  '리벤처스 TP 2호 조합',
  NULL,
  'VCS Registered Fund',
  340000000,
  340000000,
  '2021-04-19',
  'Active',
  '엠엠에스벤처스',
  NULL,
  '{"fund_id":"AS20210174","registration_date":"2021-04-19","expiry_date":"2026-04-18","formation_total_amount":"3.4","investment_character_code":"","industry_code":"4","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200468","operator_company_name":"엠엠에스벤처스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.858Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_name_en = EXCLUDED.fund_name_en,
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2906: 리벤처스 TP 1호 조합
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20200492',
  '리벤처스 TP 1호 조합',
  NULL,
  'VCS Registered Fund',
  990000000,
  990000000,
  '2021-03-22',
  'Active',
  '리벤처스',
  NULL,
  '{"fund_id":"AS20210199","registration_date":"2021-03-22","expiry_date":"2026-03-21","formation_total_amount":"9.9","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200492","operator_company_name":"리벤처스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.858Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_name_en = EXCLUDED.fund_name_en,
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2907: 리벤처스 9호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20200492',
  '리벤처스 9호 투자조합',
  NULL,
  'VCS Registered Fund',
  220000000,
  220000000,
  '2023-06-07',
  'Active',
  '리벤처스',
  NULL,
  '{"fund_id":"AS20230463","registration_date":"2023-06-07","expiry_date":"2028-06-04","formation_total_amount":"2.2","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200492","operator_company_name":"리벤처스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.858Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_name_en = EXCLUDED.fund_name_en,
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2908: 리벤처스 8호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20200492',
  '리벤처스 8호 투자조합',
  NULL,
  'VCS Registered Fund',
  100000000,
  100000000,
  '2023-09-25',
  'Active',
  '리벤처스',
  NULL,
  '{"fund_id":"AS20230858","registration_date":"2023-09-25","expiry_date":"2028-09-21","formation_total_amount":"1.0","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200492","operator_company_name":"리벤처스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.858Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_name_en = EXCLUDED.fund_name_en,
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2909: 리벤처스 5호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20200492',
  '리벤처스 5호 투자조합',
  NULL,
  'VCS Registered Fund',
  100000000,
  100000000,
  '2025-03-28',
  'Active',
  '리벤처스',
  NULL,
  '{"fund_id":"AS20250208","registration_date":"2025-03-28","expiry_date":"2030-03-23","formation_total_amount":"1.0","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200492","operator_company_name":"리벤처스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.858Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_name_en = EXCLUDED.fund_name_en,
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2910: 리벤처스 4호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20200492',
  '리벤처스 4호 투자조합',
  NULL,
  'VCS Registered Fund',
  150000000,
  150000000,
  '2022-12-06',
  'Active',
  '리벤처스',
  NULL,
  '{"fund_id":"AS20221223","registration_date":"2022-12-06","expiry_date":"2027-10-25","formation_total_amount":"1.5","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200492","operator_company_name":"리벤처스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.858Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_name_en = EXCLUDED.fund_name_en,
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2911: 리벤처스 3호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20200492',
  '리벤처스 3호 투자조합',
  NULL,
  'VCS Registered Fund',
  300000000,
  300000000,
  '2022-03-11',
  'Active',
  '리벤처스',
  NULL,
  '{"fund_id":"AS20220245","registration_date":"2022-03-11","expiry_date":"2027-03-10","formation_total_amount":"3.0","investment_character_code":"","industry_code":"3","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200492","operator_company_name":"리벤처스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.858Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_name_en = EXCLUDED.fund_name_en,
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2912: 리벤처스 10호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20200492',
  '리벤처스 10호 투자조합',
  NULL,
  'VCS Registered Fund',
  100000000,
  100000000,
  '2024-06-04',
  'Active',
  '리벤처스',
  NULL,
  '{"fund_id":"AS20240478","registration_date":"2024-06-04","expiry_date":"2029-05-30","formation_total_amount":"1.0","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200492","operator_company_name":"리벤처스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.858Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_name_en = EXCLUDED.fund_name_en,
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2913: 롯데홈쇼핑-와디즈 넥스트브랜드 육성펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20230009',
  '롯데홈쇼핑-와디즈 넥스트브랜드 육성펀드',
  NULL,
  'VCS Registered Fund',
  5000000000,
  5000000000,
  '2024-07-10',
  'Active',
  '와디즈파트너스',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20240635","registration_date":"2024-07-10","expiry_date":"2029-07-09","formation_total_amount":"50.0","investment_character_code":"18","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20230009","operator_company_name":"와디즈파트너스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.858Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_name_en = EXCLUDED.fund_name_en,
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2914: 롯데-BCCEI스타트업펀드2호
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20210101',
  '롯데-BCCEI스타트업펀드2호',
  NULL,
  'VCS Registered Fund',
  2000000000,
  2000000000,
  '2022-05-26',
  'Active',
  '롯데벤처스',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20220591","registration_date":"2022-05-26","expiry_date":"2030-05-25","formation_total_amount":"20.0","investment_character_code":"20","industry_code":"9","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20210101","operator_company_name":"롯데벤처스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.858Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_name_en = EXCLUDED.fund_name_en,
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2915: 로우파트너스 개인투자조합 제5호
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20150026',
  '로우파트너스 개인투자조합 제5호',
  NULL,
  'VCS Registered Fund',
  120000000,
  120000000,
  '2022-07-13',
  'Active',
  '로우파트너스',
  NULL,
  '{"fund_id":"AS20220652","registration_date":"2022-07-13","expiry_date":"2027-06-09","formation_total_amount":"1.2","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20150026","operator_company_name":"로우파트너스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.858Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_name_en = EXCLUDED.fund_name_en,
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2916: 로우파트너스 개인투자조합 제4호
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20150026',
  '로우파트너스 개인투자조합 제4호',
  NULL,
  'VCS Registered Fund',
  110000000,
  110000000,
  '2022-03-31',
  'Active',
  '로우파트너스',
  NULL,
  '{"fund_id":"AS20220277","registration_date":"2022-03-31","expiry_date":"2027-03-10","formation_total_amount":"1.1","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20150026","operator_company_name":"로우파트너스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.858Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_name_en = EXCLUDED.fund_name_en,
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2917: 로우파트너스 개인투자조합 제3호
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20150026',
  '로우파트너스 개인투자조합 제3호',
  NULL,
  'VCS Registered Fund',
  250000000,
  250000000,
  '2022-02-25',
  'Active',
  '로우파트너스',
  NULL,
  '{"fund_id":"AS20220163","registration_date":"2022-02-25","expiry_date":"2027-02-20","formation_total_amount":"2.5","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20150026","operator_company_name":"로우파트너스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.858Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_name_en = EXCLUDED.fund_name_en,
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2918: 로우파트너스 개인투자조합 제2호
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20150026',
  '로우파트너스 개인투자조합 제2호',
  NULL,
  'VCS Registered Fund',
  430000000,
  430000000,
  '2021-12-29',
  'Active',
  '로우파트너스',
  NULL,
  '{"fund_id":"AS20211400","registration_date":"2021-12-29","expiry_date":"2028-12-26","formation_total_amount":"4.3","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20150026","operator_company_name":"로우파트너스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.858Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_name_en = EXCLUDED.fund_name_en,
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2919: 로우파트너스 개인투자조합 제1호
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20150026',
  '로우파트너스 개인투자조합 제1호',
  NULL,
  'VCS Registered Fund',
  1530000000,
  1530000000,
  '2020-08-10',
  'Active',
  '로우파트너스',
  NULL,
  '{"fund_id":"AS20200391","registration_date":"2020-08-10","expiry_date":"2027-08-09","formation_total_amount":"15.3","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"MF00000001","operator_company_id":"OP20150026","operator_company_name":"로우파트너스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.858Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_name_en = EXCLUDED.fund_name_en,
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2920: 로우 지역 벤처투자 펀드 제1호
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20150026',
  '로우 지역 벤처투자 펀드 제1호',
  NULL,
  'VCS Registered Fund',
  5200000000,
  5200000000,
  '2022-12-08',
  'Active',
  '로우파트너스',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20221423","registration_date":"2022-12-08","expiry_date":"2030-12-07","formation_total_amount":"52.0","investment_character_code":"20","industry_code":"9","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20150026","operator_company_name":"로우파트너스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.858Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_name_en = EXCLUDED.fund_name_en,
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2921: 로아인벤션랩 투자조합 3호
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20140013',
  '로아인벤션랩 투자조합 3호',
  NULL,
  'VCS Registered Fund',
  110000000,
  110000000,
  '2018-07-02',
  'Active',
  '더인벤션랩',
  NULL,
  '{"fund_id":"AS20180489","registration_date":"2018-07-02","expiry_date":"2025-07-31","formation_total_amount":"1.1","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20140013","operator_company_name":"더인벤션랩","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.858Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_name_en = EXCLUDED.fund_name_en,
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2922: 로보틱스초기스타트업 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20140013',
  '로보틱스초기스타트업 개인투자조합',
  NULL,
  'VCS Registered Fund',
  500000000,
  500000000,
  '2022-10-24',
  'Active',
  '더인벤션랩',
  NULL,
  '{"fund_id":"AS20221174","registration_date":"2022-10-24","expiry_date":"2027-10-23","formation_total_amount":"5.0","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20140013","operator_company_name":"더인벤션랩","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.858Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_name_en = EXCLUDED.fund_name_en,
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2923: 로드스톤-IPCNB 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20190230',
  '로드스톤-IPCNB 개인투자조합',
  NULL,
  'VCS Registered Fund',
  400000000,
  400000000,
  '2021-12-31',
  'Active',
  '아이피씨앤비',
  NULL,
  '{"fund_id":"AS20211442","registration_date":"2021-12-31","expiry_date":"2028-12-31","formation_total_amount":"4.0","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190230","operator_company_name":"아이피씨앤비","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.858Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_name_en = EXCLUDED.fund_name_en,
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2924: 로그 성장기여세컨더리펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20190011',
  '로그 성장기여세컨더리펀드',
  NULL,
  'VCS Registered Fund',
  10000000000,
  10000000000,
  '2016-04-01',
  'Active',
  '로그인베스트먼트',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20160049","registration_date":"2016-04-01","expiry_date":"2026-03-31","formation_total_amount":"100.0","investment_character_code":"16","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20190011","operator_company_name":"로그인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.858Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_name_en = EXCLUDED.fund_name_en,
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2925: 로그 성장기여4호펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20190011',
  '로그 성장기여4호펀드',
  NULL,
  'VCS Registered Fund',
  30300000000,
  30300000000,
  '2020-03-12',
  'Active',
  '로그인베스트먼트',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20200134","registration_date":"2020-03-12","expiry_date":"2027-03-11","formation_total_amount":"303.0","investment_character_code":"01","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20190011","operator_company_name":"로그인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.858Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_name_en = EXCLUDED.fund_name_en,
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2926: 로그 성장기여3호펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20190011',
  '로그 성장기여3호펀드',
  NULL,
  'VCS Registered Fund',
  30300000000,
  30300000000,
  '2019-12-24',
  'Active',
  '로그인베스트먼트',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20200014","registration_date":"2019-12-24","expiry_date":"2026-12-23","formation_total_amount":"303.0","investment_character_code":"01","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20190011","operator_company_name":"로그인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.858Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_name_en = EXCLUDED.fund_name_en,
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2927: 로그 성장기여2호펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20190011',
  '로그 성장기여2호펀드',
  NULL,
  'VCS Registered Fund',
  30300000000,
  30300000000,
  '2019-04-30',
  'Active',
  '로그인베스트먼트',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20190169","registration_date":"2019-04-30","expiry_date":"2026-04-29","formation_total_amount":"303.0","investment_character_code":"16","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20190011","operator_company_name":"로그인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.858Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_name_en = EXCLUDED.fund_name_en,
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2928: 로그 성장기여1호펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20190011',
  '로그 성장기여1호펀드',
  NULL,
  'VCS Registered Fund',
  30300000000,
  30300000000,
  '2019-02-20',
  'Active',
  '로그인베스트먼트',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20190067","registration_date":"2019-02-20","expiry_date":"2026-02-19","formation_total_amount":"303.0","investment_character_code":"16","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20190011","operator_company_name":"로그인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.858Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_name_en = EXCLUDED.fund_name_en,
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2929: 로간한양개인투자조합제5호
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20200224',
  '로간한양개인투자조합제5호',
  NULL,
  'VCS Registered Fund',
  260000000,
  260000000,
  '2024-12-02',
  'Active',
  '로간',
  NULL,
  '{"fund_id":"AS20241201","registration_date":"2024-12-02","expiry_date":"2029-12-01","formation_total_amount":"2.6","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200224","operator_company_name":"로간","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.859Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_name_en = EXCLUDED.fund_name_en,
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2930: 로간펫테크1호개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20200224',
  '로간펫테크1호개인투자조합',
  NULL,
  'VCS Registered Fund',
  100000000,
  100000000,
  '2022-11-22',
  'Active',
  '로간',
  NULL,
  '{"fund_id":"AS20221277","registration_date":"2022-11-22","expiry_date":"2027-11-30","formation_total_amount":"1.0","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200224","operator_company_name":"로간","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.859Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_name_en = EXCLUDED.fund_name_en,
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2931: 로간소부장개인투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20200224',
  '로간소부장개인투자조합1호',
  NULL,
  'VCS Registered Fund',
  220000000,
  220000000,
  '2022-03-16',
  'Active',
  '로간',
  NULL,
  '{"fund_id":"AS20220217","registration_date":"2022-03-16","expiry_date":"2027-03-31","formation_total_amount":"2.2","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200224","operator_company_name":"로간","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.859Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_name_en = EXCLUDED.fund_name_en,
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2932: 로간2호 콘텐츠재기지원투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20210061',
  '로간2호 콘텐츠재기지원투자조합',
  NULL,
  'VCS Registered Fund',
  13700000000,
  13700000000,
  '2021-11-08',
  'Active',
  '로간벤처스',
  '{"영상(영화+드라마+애니메이션)","문화"}',
  '{"fund_id":"AS20211103","registration_date":"2021-11-08","expiry_date":"2028-11-07","formation_total_amount":"137.0","investment_character_code":"24","industry_code":"6","investment_field_type":"문화","investment_field_detail_type":"영상(영화+드라마+애니메이션)","mother_fund_id":"MF00000001","operator_company_id":"OP20210061","operator_company_name":"로간벤처스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.859Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_name_en = EXCLUDED.fund_name_en,
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2933: 로간1호 콘텐츠가치평가투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20210061',
  '로간1호 콘텐츠가치평가투자조합',
  NULL,
  'VCS Registered Fund',
  12200000000,
  12200000000,
  '2021-10-08',
  'Active',
  '로간벤처스',
  '{"영상(영화+드라마+애니메이션)","문화"}',
  '{"fund_id":"AS20210966","registration_date":"2021-10-08","expiry_date":"2028-10-07","formation_total_amount":"122.0","investment_character_code":"24","industry_code":"6","investment_field_type":"문화","investment_field_detail_type":"영상(영화+드라마+애니메이션)","mother_fund_id":"MF00000001","operator_company_id":"OP20210061","operator_company_name":"로간벤처스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.859Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_name_en = EXCLUDED.fund_name_en,
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2934: 로간 청년창업투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20210061',
  '로간 청년창업투자조합',
  NULL,
  'VCS Registered Fund',
  16950000000,
  16950000000,
  '2023-11-23',
  'Active',
  '로간벤처스',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20231140","registration_date":"2023-11-23","expiry_date":"2031-11-22","formation_total_amount":"169.5","investment_character_code":"21","industry_code":"6","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20210061","operator_company_name":"로간벤처스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.859Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_name_en = EXCLUDED.fund_name_en,
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2935: 로간 NEW콘텐츠가치평가투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20210061',
  '로간 NEW콘텐츠가치평가투자조합',
  NULL,
  'VCS Registered Fund',
  17400000000,
  17400000000,
  '2023-10-17',
  'Active',
  '로간벤처스',
  '{"영상(영화+드라마+애니메이션)","문화"}',
  '{"fund_id":"AS20230943","registration_date":"2023-10-17","expiry_date":"2030-10-16","formation_total_amount":"174.0","investment_character_code":"24","industry_code":"6","investment_field_type":"문화","investment_field_detail_type":"영상(영화+드라마+애니메이션)","mother_fund_id":"MF00000001","operator_company_id":"OP20210061","operator_company_name":"로간벤처스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.859Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_name_en = EXCLUDED.fund_name_en,
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2936: 로간 KB&서울시 첫걸음동행 사회투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20210061',
  '로간 KB&서울시 첫걸음동행 사회투자조합',
  NULL,
  'VCS Registered Fund',
  17700000000,
  17700000000,
  '2023-06-07',
  'Active',
  '로간벤처스',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20230469","registration_date":"2023-06-07","expiry_date":"2031-06-06","formation_total_amount":"177.0","investment_character_code":"10","industry_code":"9","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20210061","operator_company_name":"로간벤처스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.859Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_name_en = EXCLUDED.fund_name_en,
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2937: 렛츠투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20200224',
  '렛츠투자조합1호',
  NULL,
  'VCS Registered Fund',
  130000000,
  130000000,
  '2023-12-06',
  'Active',
  '로간',
  NULL,
  '{"fund_id":"AS20231167","registration_date":"2023-12-06","expiry_date":"2028-12-05","formation_total_amount":"1.3","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200224","operator_company_name":"로간","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.859Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_name_en = EXCLUDED.fund_name_en,
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2938: 레티나 1 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20190221',
  '레티나 1 개인투자조합',
  NULL,
  'VCS Registered Fund',
  310000000,
  310000000,
  '2023-06-28',
  'Active',
  '젠엑시스',
  NULL,
  '{"fund_id":"AS20230534","registration_date":"2023-06-28","expiry_date":"2028-06-27","formation_total_amount":"3.1","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190221","operator_company_name":"젠엑시스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.859Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_name_en = EXCLUDED.fund_name_en,
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2939: 레오라이징스타콘텐츠펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20120006',
  '레오라이징스타콘텐츠펀드',
  NULL,
  'VCS Registered Fund',
  2000000000,
  2000000000,
  '2023-10-25',
  'Active',
  '레오파트너스인베스트먼트',
  '{"게임","문화"}',
  '{"fund_id":"AS20230976","registration_date":"2023-10-25","expiry_date":"2028-10-24","formation_total_amount":"20.0","investment_character_code":"24","industry_code":"6","investment_field_type":"문화","investment_field_detail_type":"게임","mother_fund_id":"","operator_company_id":"OP20120006","operator_company_name":"레오파트너스인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.859Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_name_en = EXCLUDED.fund_name_en,
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2940: 레오9호 효성청년창업펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20120006',
  '레오9호 효성청년창업펀드',
  NULL,
  'VCS Registered Fund',
  15500000000,
  15500000000,
  '2017-12-28',
  'Active',
  '레오파트너스인베스트먼트',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20180003","registration_date":"2017-12-28","expiry_date":"2025-12-27","formation_total_amount":"155.0","investment_character_code":"21","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20120006","operator_company_name":"레오파트너스인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.859Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_name_en = EXCLUDED.fund_name_en,
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2941: 레오11호 바이오펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20120006',
  '레오11호 바이오펀드',
  NULL,
  'VCS Registered Fund',
  2150000000,
  2150000000,
  '2023-04-24',
  'Active',
  '레오파트너스인베스트먼트',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20230318","registration_date":"2023-04-24","expiry_date":"2028-04-23","formation_total_amount":"21.5","investment_character_code":"25","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20120006","operator_company_name":"레오파트너스인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.859Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_name_en = EXCLUDED.fund_name_en,
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2942: 레오10호 소액투자전문펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20120006',
  '레오10호 소액투자전문펀드',
  NULL,
  'VCS Registered Fund',
  15100000000,
  15100000000,
  '2018-03-22',
  'Active',
  '레오파트너스인베스트먼트',
  '{"문화 기타","문화"}',
  '{"fund_id":"AS20180147","registration_date":"2018-03-22","expiry_date":"2026-03-21","formation_total_amount":"151.0","investment_character_code":"24","industry_code":"6","investment_field_type":"문화","investment_field_detail_type":"문화 기타","mother_fund_id":"MF00000001","operator_company_id":"OP20120006","operator_company_name":"레오파트너스인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.859Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_name_en = EXCLUDED.fund_name_en,
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2943: 레드일렉 배터리 제일 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20210616',
  '레드일렉 배터리 제일 투자조합',
  NULL,
  'VCS Registered Fund',
  2000000000,
  2000000000,
  '2023-06-16',
  'Active',
  '레드일렉',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20230494","registration_date":"2023-06-16","expiry_date":"2028-06-15","formation_total_amount":"20.0","investment_character_code":"20","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20210616","operator_company_name":"레드일렉","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.859Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_name_en = EXCLUDED.fund_name_en,
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2944: 레드일렉 개인투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20210616',
  '레드일렉 개인투자조합 1호',
  NULL,
  'VCS Registered Fund',
  370000000,
  370000000,
  '2023-12-06',
  'Active',
  '레드일렉',
  NULL,
  '{"fund_id":"AS20231188","registration_date":"2023-12-06","expiry_date":"2028-12-05","formation_total_amount":"3.7","investment_character_code":"","industry_code":"3","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20210616","operator_company_name":"레드일렉","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.859Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_name_en = EXCLUDED.fund_name_en,
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2945: 럭키인바이츠1호펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20190245',
  '럭키인바이츠1호펀드',
  NULL,
  'VCS Registered Fund',
  4270000000,
  4270000000,
  '2024-12-12',
  'Active',
  '오픈워터인베스트먼트',
  '{"일반 기타","일반"}',
  '{"fund_id":"AS20241330","registration_date":"2024-12-12","expiry_date":"2029-12-11","formation_total_amount":"42.7","investment_character_code":"25","industry_code":"4","investment_field_type":"일반","investment_field_detail_type":"일반 기타","mother_fund_id":"","operator_company_id":"OP20190245","operator_company_name":"오픈워터인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.859Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_name_en = EXCLUDED.fund_name_en,
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2946: 래버리지 개인투자조합 제3호
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20200217',
  '래버리지 개인투자조합 제3호',
  NULL,
  'VCS Registered Fund',
  900000000,
  900000000,
  '2024-02-28',
  'Active',
  '래버리지',
  NULL,
  '{"fund_id":"AS20240129","registration_date":"2024-02-28","expiry_date":"2034-02-27","formation_total_amount":"9.0","investment_character_code":"","industry_code":"3","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200217","operator_company_name":"래버리지","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.859Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_name_en = EXCLUDED.fund_name_en,
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2947: 래버리지 개인투자조합 제2호
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20200217',
  '래버리지 개인투자조합 제2호',
  NULL,
  'VCS Registered Fund',
  100000000,
  100000000,
  '2022-02-23',
  'Active',
  '래버리지',
  NULL,
  '{"fund_id":"AS20220180","registration_date":"2022-02-23","expiry_date":"2027-02-22","formation_total_amount":"1.0","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200217","operator_company_name":"래버리지","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.859Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_name_en = EXCLUDED.fund_name_en,
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2948: 래버리지 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20200217',
  '래버리지 개인투자조합',
  NULL,
  'VCS Registered Fund',
  200000000,
  200000000,
  '2021-05-18',
  'Active',
  '래버리지',
  NULL,
  '{"fund_id":"AS20210381","registration_date":"2021-05-18","expiry_date":"2026-05-17","formation_total_amount":"2.0","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200217","operator_company_name":"래버리지","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.859Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_name_en = EXCLUDED.fund_name_en,
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2949: 라플라스 벤처투자조합 3호
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20220445',
  '라플라스 벤처투자조합 3호',
  NULL,
  'VCS Registered Fund',
  2100000000,
  2100000000,
  '2025-03-17',
  'Active',
  '라플라스파트너스',
  '{"신성장","일반"}',
  '{"fund_id":"AS20250197","registration_date":"2025-03-17","expiry_date":"2032-03-16","formation_total_amount":"21.0","investment_character_code":"25","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"신성장","mother_fund_id":"","operator_company_id":"OP20220445","operator_company_name":"라플라스파트너스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.859Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_name_en = EXCLUDED.fund_name_en,
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2950: 라플라스 벤처투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20220445',
  '라플라스 벤처투자조합 1호',
  NULL,
  'VCS Registered Fund',
  2100000000,
  2100000000,
  '2022-10-17',
  'Active',
  '라플라스파트너스',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20221192","registration_date":"2022-10-17","expiry_date":"2029-10-16","formation_total_amount":"21.0","investment_character_code":"02","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20220445","operator_company_name":"라플라스파트너스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.859Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_name_en = EXCLUDED.fund_name_en,
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Batch 59 completed! 50 fund records processed.
-- Progress: 2950/3689 total records

