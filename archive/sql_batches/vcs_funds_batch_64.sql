-- VCS Fund UPSERT Batch 64/74 (Records 3151-3200)
-- Uses ON CONFLICT DO UPDATE to insert new or update existing funds
-- Generated from VCS API Scraper fund data
-- Generated at: 2025-06-05T00:28:06.882Z
-- Schema: Matches fund_table structure

-- FUND DATA (UPSERT - Safe for Duplicates)
-- Processing 50 fund records
-- Will INSERT new records or UPDATE existing ones

-- Record 3151: 달빛 혁신창업·성장지원펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20220645',
  '달빛 혁신창업·성장지원펀드',
  NULL,
  'VCS Registered Fund',
  25000000000,
  25000000000,
  '2019-09-25',
  'Active',
  '인라이트벤처스',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20190423","registration_date":"2019-09-25","expiry_date":"2027-09-24","formation_total_amount":"250.0","investment_character_code":"18","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20220645","operator_company_name":"인라이트벤처스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.882Z"}'::jsonb,
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

-- Record 3152: 단디 하모 스타트업 투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20170046',
  '단디 하모 스타트업 투자조합 1호',
  NULL,
  'VCS Registered Fund',
  10000000000,
  10000000000,
  '2023-01-04',
  'Active',
  '시리즈벤처스',
  NULL,
  '{"fund_id":"AS20230015","registration_date":"2023-01-04","expiry_date":"2031-01-01","formation_total_amount":"100.0","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"MF00000001","operator_company_id":"OP20170046","operator_company_name":"시리즈벤처스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.882Z"}'::jsonb,
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

-- Record 3153: 다이나믹 4차산업 벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20220530',
  '다이나믹 4차산업 벤처투자조합',
  NULL,
  'VCS Registered Fund',
  2220000000,
  2220000000,
  '2023-07-10',
  'Active',
  '트리니티벤처파트너스',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20230577","registration_date":"2023-07-10","expiry_date":"2028-07-09","formation_total_amount":"22.2","investment_character_code":"20","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20220530","operator_company_name":"트리니티벤처파트너스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.882Z"}'::jsonb,
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

-- Record 3154: 다음청년창업투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20100005',
  '다음청년창업투자조합',
  NULL,
  'VCS Registered Fund',
  25300000000,
  25300000000,
  '2014-07-04',
  'Active',
  '동문파트너즈',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20140077","registration_date":"2014-07-04","expiry_date":"2025-07-03","formation_total_amount":"253.0","investment_character_code":"20","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20100005","operator_company_name":"동문파트너즈","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.882Z"}'::jsonb,
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

-- Record 3155: 다윈세컨더리제2호투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20200391',
  '다윈세컨더리제2호투자조합',
  NULL,
  'VCS Registered Fund',
  2750000000,
  2750000000,
  '2024-06-20',
  'Active',
  '다윈인베스트먼트',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20240556","registration_date":"2024-06-20","expiry_date":"2029-06-19","formation_total_amount":"27.5","investment_character_code":"16","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20200391","operator_company_name":"다윈인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.882Z"}'::jsonb,
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

-- Record 3156: 다성1호투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20230313',
  '다성1호투자조합',
  NULL,
  'VCS Registered Fund',
  10000000000,
  10000000000,
  '2023-08-16',
  'Active',
  '다성벤처스',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20230738","registration_date":"2023-08-16","expiry_date":"2031-08-15","formation_total_amount":"100.0","investment_character_code":"20","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20230313","operator_company_name":"다성벤처스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.882Z"}'::jsonb,
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

-- Record 3157: 다산창업초기투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20100005',
  '다산창업초기투자조합',
  NULL,
  'VCS Registered Fund',
  30000000000,
  30000000000,
  '2019-01-31',
  'Active',
  '동문파트너즈',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20190038","registration_date":"2019-01-31","expiry_date":"2027-01-30","formation_total_amount":"300.0","investment_character_code":"20","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20100005","operator_company_name":"동문파트너즈","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.882Z"}'::jsonb,
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

-- Record 3158: 다산에스비에이재기투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20100005',
  '다산에스비에이재기투자조합',
  NULL,
  'VCS Registered Fund',
  20000000000,
  20000000000,
  '2018-02-27',
  'Active',
  '동문파트너즈',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20180135","registration_date":"2018-02-27","expiry_date":"2026-02-26","formation_total_amount":"200.0","investment_character_code":"22","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20100005","operator_company_name":"동문파트너즈","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.882Z"}'::jsonb,
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

-- Record 3159: 다빈치 투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20210265',
  '다빈치 투자조합 1호',
  NULL,
  'VCS Registered Fund',
  850000000,
  850000000,
  '2023-10-24',
  'Active',
  '다빈치벤처스',
  NULL,
  '{"fund_id":"AS20230957","registration_date":"2023-10-24","expiry_date":"2028-10-23","formation_total_amount":"8.5","investment_character_code":"","industry_code":"3","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20210265","operator_company_name":"다빈치벤처스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.882Z"}'::jsonb,
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

-- Record 3160: 다름개인투자조합 6호
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20220398',
  '다름개인투자조합 6호',
  NULL,
  'VCS Registered Fund',
  150000000,
  150000000,
  '2025-02-03',
  'Active',
  '다름과이음',
  NULL,
  '{"fund_id":"AS20250056","registration_date":"2025-02-03","expiry_date":"2030-02-02","formation_total_amount":"1.5","investment_character_code":"","industry_code":"7","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20220398","operator_company_name":"다름과이음","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.882Z"}'::jsonb,
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

-- Record 3161: 다름개인투자조합 5호
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20220398',
  '다름개인투자조합 5호',
  NULL,
  'VCS Registered Fund',
  100000000,
  100000000,
  '2024-12-17',
  'Active',
  '다름과이음',
  NULL,
  '{"fund_id":"AS20241290","registration_date":"2024-12-17","expiry_date":"2029-12-16","formation_total_amount":"1.0","investment_character_code":"","industry_code":"4","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20220398","operator_company_name":"다름과이음","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.882Z"}'::jsonb,
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

-- Record 3162: 다름개인투자조합 4호
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20220398',
  '다름개인투자조합 4호',
  NULL,
  'VCS Registered Fund',
  100000000,
  100000000,
  '2024-12-10',
  'Active',
  '다름과이음',
  NULL,
  '{"fund_id":"AS20241254","registration_date":"2024-12-10","expiry_date":"2029-12-09","formation_total_amount":"1.0","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20220398","operator_company_name":"다름과이음","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.882Z"}'::jsonb,
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

-- Record 3163: 다름개인투자조합 3호
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20220398',
  '다름개인투자조합 3호',
  NULL,
  'VCS Registered Fund',
  110000000,
  110000000,
  '2024-01-02',
  'Active',
  '다름과이음',
  NULL,
  '{"fund_id":"AS20231328","registration_date":"2024-01-02","expiry_date":"2029-01-01","formation_total_amount":"1.1","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20220398","operator_company_name":"다름과이음","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.882Z"}'::jsonb,
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

-- Record 3164: 다름개인투자조합 2호
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20220398',
  '다름개인투자조합 2호',
  NULL,
  'VCS Registered Fund',
  420000000,
  420000000,
  '2023-09-04',
  'Active',
  '다름과이음',
  NULL,
  '{"fund_id":"AS20230733","registration_date":"2023-09-04","expiry_date":"2028-09-03","formation_total_amount":"4.2","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20220398","operator_company_name":"다름과이음","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.882Z"}'::jsonb,
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

-- Record 3165: 다름개인투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20220398',
  '다름개인투자조합 1호',
  NULL,
  'VCS Registered Fund',
  110000000,
  110000000,
  '2023-07-19',
  'Active',
  '다름과이음',
  NULL,
  '{"fund_id":"AS20230590","registration_date":"2023-07-19","expiry_date":"2028-07-18","formation_total_amount":"1.1","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20220398","operator_company_name":"다름과이음","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.882Z"}'::jsonb,
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

-- Record 3166: 다래임팩트 펠로우쉽 투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20200156',
  '다래임팩트 펠로우쉽 투자조합 1호',
  NULL,
  'VCS Registered Fund',
  150000000,
  150000000,
  '2022-08-16',
  'Active',
  '임팩트파트너스',
  NULL,
  '{"fund_id":"AS20220890","registration_date":"2022-08-16","expiry_date":"2027-08-15","formation_total_amount":"1.5","investment_character_code":"","industry_code":"1","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200156","operator_company_name":"임팩트파트너스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.882Z"}'::jsonb,
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

-- Record 3167: 다래임팩트 펠로우쉽 투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20150034',
  '다래임팩트 펠로우쉽 투자조합 1호',
  NULL,
  'VCS Registered Fund',
  150000000,
  150000000,
  '2022-08-16',
  'Active',
  '다래전략사업화센터',
  NULL,
  '{"fund_id":"AS20220890","registration_date":"2022-08-16","expiry_date":"2027-08-15","formation_total_amount":"1.5","investment_character_code":"","industry_code":"1","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20150034","operator_company_name":"다래전략사업화센터","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.882Z"}'::jsonb,
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

-- Record 3168: 다래-부산테크그로우업 창업펀드 1호
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20150034',
  '다래-부산테크그로우업 창업펀드 1호',
  NULL,
  'VCS Registered Fund',
  220000000,
  220000000,
  '2020-09-16',
  'Active',
  '다래전략사업화센터',
  NULL,
  '{"fund_id":"AS20200495","registration_date":"2020-09-16","expiry_date":"2025-12-30","formation_total_amount":"2.2","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20150034","operator_company_name":"다래전략사업화센터","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.882Z"}'::jsonb,
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

-- Record 3169: 다래-메이트(DARAE-MATE) 개인투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20150034',
  '다래-메이트(DARAE-MATE) 개인투자조합 1호',
  NULL,
  'VCS Registered Fund',
  120000000,
  120000000,
  '2023-10-24',
  'Active',
  '다래전략사업화센터',
  NULL,
  '{"fund_id":"AS20230956","registration_date":"2023-10-24","expiry_date":"2029-10-23","formation_total_amount":"1.2","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20150034","operator_company_name":"다래전략사업화센터","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.882Z"}'::jsonb,
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

-- Record 3170: 다래 개인투자조합 6호
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20150034',
  '다래 개인투자조합 6호',
  NULL,
  'VCS Registered Fund',
  180000000,
  180000000,
  '2024-05-16',
  'Active',
  '다래전략사업화센터',
  NULL,
  '{"fund_id":"AS20240400","registration_date":"2024-05-16","expiry_date":"2030-05-15","formation_total_amount":"1.8","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20150034","operator_company_name":"다래전략사업화센터","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.882Z"}'::jsonb,
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

-- Record 3171: 다래 개인투자조합 5호
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20150034',
  '다래 개인투자조합 5호',
  NULL,
  'VCS Registered Fund',
  250000000,
  250000000,
  '2024-03-13',
  'Active',
  '다래전략사업화센터',
  NULL,
  '{"fund_id":"AS20240173","registration_date":"2024-03-13","expiry_date":"2030-03-12","formation_total_amount":"2.5","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20150034","operator_company_name":"다래전략사업화센터","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.882Z"}'::jsonb,
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

-- Record 3172: 다래 개인투자조합 4호
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20150034',
  '다래 개인투자조합 4호',
  NULL,
  'VCS Registered Fund',
  230000000,
  230000000,
  '2023-08-21',
  'Active',
  '다래전략사업화센터',
  NULL,
  '{"fund_id":"AS20230705","registration_date":"2023-08-21","expiry_date":"2029-08-20","formation_total_amount":"2.3","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20150034","operator_company_name":"다래전략사업화센터","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.882Z"}'::jsonb,
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

-- Record 3173: 다래 개인투자조합 3호
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20150034',
  '다래 개인투자조합 3호',
  NULL,
  'VCS Registered Fund',
  120000000,
  120000000,
  '2023-05-15',
  'Active',
  '다래전략사업화센터',
  NULL,
  '{"fund_id":"AS20230370","registration_date":"2023-05-15","expiry_date":"2029-05-14","formation_total_amount":"1.2","investment_character_code":"","industry_code":"1","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20150034","operator_company_name":"다래전략사업화센터","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.883Z"}'::jsonb,
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

-- Record 3174: 다래 개인투자조합 2호
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20150034',
  '다래 개인투자조합 2호',
  NULL,
  'VCS Registered Fund',
  1950000000,
  1950000000,
  '2022-11-01',
  'Active',
  '다래전략사업화센터',
  NULL,
  '{"fund_id":"AS20221215","registration_date":"2022-11-01","expiry_date":"2028-10-31","formation_total_amount":"19.5","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20150034","operator_company_name":"다래전략사업화센터","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.883Z"}'::jsonb,
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

-- Record 3175: 다래 개인투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20150034',
  '다래 개인투자조합 1호',
  NULL,
  'VCS Registered Fund',
  110000000,
  110000000,
  '2021-03-23',
  'Active',
  '다래전략사업화센터',
  NULL,
  '{"fund_id":"AS20210215","registration_date":"2021-03-23","expiry_date":"2026-04-30","formation_total_amount":"1.1","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20150034","operator_company_name":"다래전략사업화센터","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.883Z"}'::jsonb,
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

-- Record 3176: 다담 성장지원 9호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20130002',
  '다담 성장지원 9호 투자조합',
  NULL,
  'VCS Registered Fund',
  3650000000,
  3650000000,
  '2021-07-16',
  'Active',
  '로이투자파트너스',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20210605","registration_date":"2021-07-16","expiry_date":"2026-07-15","formation_total_amount":"36.5","investment_character_code":"04","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20130002","operator_company_name":"로이투자파트너스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.883Z"}'::jsonb,
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

-- Record 3177: 다담 대전 성장지원 1호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20130002',
  '다담 대전 성장지원 1호 투자조합',
  NULL,
  'VCS Registered Fund',
  10000000000,
  10000000000,
  '2019-11-20',
  'Active',
  '로이투자파트너스',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20190525","registration_date":"2019-11-20","expiry_date":"2027-11-19","formation_total_amount":"100.0","investment_character_code":"18","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20130002","operator_company_name":"로이투자파트너스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.883Z"}'::jsonb,
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

-- Record 3178: 다담 4차산업 소셜임팩트 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20130002',
  '다담 4차산업 소셜임팩트 투자조합',
  NULL,
  'VCS Registered Fund',
  14500000000,
  14500000000,
  '2018-11-16',
  'Active',
  '로이투자파트너스',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20180348","registration_date":"2018-11-16","expiry_date":"2026-11-15","formation_total_amount":"145.0","investment_character_code":"23","industry_code":"9","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20130002","operator_company_name":"로이투자파트너스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.883Z"}'::jsonb,
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

-- Record 3179: 다날지역뉴딜벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20100005',
  '다날지역뉴딜벤처투자조합',
  NULL,
  'VCS Registered Fund',
  16700000000,
  16700000000,
  '2022-07-08',
  'Active',
  '동문파트너즈',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20220772","registration_date":"2022-07-08","expiry_date":"2030-07-07","formation_total_amount":"167.0","investment_character_code":"18","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20100005","operator_company_name":"동문파트너즈","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.883Z"}'::jsonb,
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

-- Record 3180: 다날-코맥스 스마트테크투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20200305',
  '다날-코맥스 스마트테크투자조합',
  NULL,
  'VCS Registered Fund',
  1000000000,
  1000000000,
  '2023-08-11',
  'Active',
  '다날투자파트너스',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20230707","registration_date":"2023-08-11","expiry_date":"2030-08-10","formation_total_amount":"10.0","investment_character_code":"28","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20200305","operator_company_name":"다날투자파트너스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.883Z"}'::jsonb,
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

-- Record 3181: 다날-경기혁신 벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20200305',
  '다날-경기혁신 벤처투자조합',
  NULL,
  'VCS Registered Fund',
  5900000000,
  5900000000,
  '2024-03-29',
  'Active',
  '다날투자파트너스',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20240240","registration_date":"2024-03-29","expiry_date":"2031-03-28","formation_total_amount":"59.0","investment_character_code":"28","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20200305","operator_company_name":"다날투자파트너스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.883Z"}'::jsonb,
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

-- Record 3182: 다날-EMA 경기 시드 레벨업
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20200305',
  '다날-EMA 경기 시드 레벨업',
  NULL,
  'VCS Registered Fund',
  1000000000,
  1000000000,
  '2024-08-14',
  'Active',
  '다날투자파트너스',
  '{"중소/벤처일반","문화"}',
  '{"fund_id":"AS20240781","registration_date":"2024-08-14","expiry_date":"2029-08-13","formation_total_amount":"10.0","investment_character_code":"24","industry_code":"6","investment_field_type":"문화","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20200305","operator_company_name":"다날투자파트너스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.883Z"}'::jsonb,
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

-- Record 3183: 다날 플랫폼 1호
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20200305',
  '다날 플랫폼 1호',
  NULL,
  'VCS Registered Fund',
  2000000000,
  2000000000,
  '2021-08-27',
  'Active',
  '다날투자파트너스',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20210771","registration_date":"2021-08-27","expiry_date":"2029-08-26","formation_total_amount":"20.0","investment_character_code":"20","industry_code":"9","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20200305","operator_company_name":"다날투자파트너스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.883Z"}'::jsonb,
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

-- Record 3184: 다날 라이징 유니콘
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20200305',
  '다날 라이징 유니콘',
  NULL,
  'VCS Registered Fund',
  5200000000,
  5200000000,
  '2022-12-08',
  'Active',
  '다날투자파트너스',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20221420","registration_date":"2022-12-08","expiry_date":"2030-12-07","formation_total_amount":"52.0","investment_character_code":"06","industry_code":"9","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20200305","operator_company_name":"다날투자파트너스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.883Z"}'::jsonb,
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

-- Record 3185: 뉴패러다임혁신스타트업제3호개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20160026',
  '뉴패러다임혁신스타트업제3호개인투자조합',
  NULL,
  'VCS Registered Fund',
  6000000000,
  6000000000,
  '2020-05-29',
  'Active',
  '뉴패러다임인베스트먼트',
  NULL,
  '{"fund_id":"AS20200228","registration_date":"2020-05-29","expiry_date":"2027-05-28","formation_total_amount":"60.0","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"MF00000001","operator_company_id":"OP20160026","operator_company_name":"뉴패러다임인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.883Z"}'::jsonb,
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

-- Record 3186: 뉴패러다임혁신성장제5호개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20160026',
  '뉴패러다임혁신성장제5호개인투자조합',
  NULL,
  'VCS Registered Fund',
  11100000000,
  11100000000,
  '2021-09-06',
  'Active',
  '뉴패러다임인베스트먼트',
  NULL,
  '{"fund_id":"AS20210810","registration_date":"2021-09-06","expiry_date":"2028-09-05","formation_total_amount":"111.0","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"MF00000001","operator_company_id":"OP20160026","operator_company_name":"뉴패러다임인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.883Z"}'::jsonb,
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

-- Record 3187: 뉴패러다임아기유니콘성장제6호개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20160026',
  '뉴패러다임아기유니콘성장제6호개인투자조합',
  NULL,
  'VCS Registered Fund',
  11600000000,
  11600000000,
  '2022-10-05',
  'Active',
  '뉴패러다임인베스트먼트',
  NULL,
  '{"fund_id":"AS20221101","registration_date":"2022-10-05","expiry_date":"2029-10-04","formation_total_amount":"116.0","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"MF00000001","operator_company_id":"OP20160026","operator_company_name":"뉴패러다임인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.883Z"}'::jsonb,
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

-- Record 3188: 뉴패러다임 스타엔젤 제2호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20160026',
  '뉴패러다임 스타엔젤 제2호 개인투자조합',
  NULL,
  'VCS Registered Fund',
  600000000,
  600000000,
  '2019-06-13',
  'Active',
  '뉴패러다임인베스트먼트',
  NULL,
  '{"fund_id":"AS20190234","registration_date":"2019-06-13","expiry_date":"2026-06-12","formation_total_amount":"6.0","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20160026","operator_company_name":"뉴패러다임인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.883Z"}'::jsonb,
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

-- Record 3189: 뉴패러다임 스타엔젤 제1호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20160026',
  '뉴패러다임 스타엔젤 제1호 개인투자조합',
  NULL,
  'VCS Registered Fund',
  800000000,
  800000000,
  '2017-09-04',
  'Active',
  '뉴패러다임인베스트먼트',
  NULL,
  '{"fund_id":"AS20180104","registration_date":"2017-09-04","expiry_date":"2029-09-03","formation_total_amount":"8.0","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20160026","operator_company_name":"뉴패러다임인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.883Z"}'::jsonb,
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

-- Record 3190: 뉴키즈 창업가 선순환 투자조합 9호
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20220644',
  '뉴키즈 창업가 선순환 투자조합 9호',
  NULL,
  'VCS Registered Fund',
  100000000,
  100000000,
  '2024-11-11',
  'Active',
  '뉴키즈인베스트먼트',
  NULL,
  '{"fund_id":"AS20241068","registration_date":"2024-11-11","expiry_date":"2029-11-10","formation_total_amount":"1.0","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20220644","operator_company_name":"뉴키즈인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.883Z"}'::jsonb,
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

-- Record 3191: 뉴키즈 창업가 선순환 투자조합 8호
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20220644',
  '뉴키즈 창업가 선순환 투자조합 8호',
  NULL,
  'VCS Registered Fund',
  100000000,
  100000000,
  '2024-10-28',
  'Active',
  '뉴키즈인베스트먼트',
  NULL,
  '{"fund_id":"AS20240994","registration_date":"2024-10-28","expiry_date":"2032-10-27","formation_total_amount":"1.0","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20220644","operator_company_name":"뉴키즈인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.883Z"}'::jsonb,
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

-- Record 3192: 뉴키즈 창업가 선순환 투자조합 7호
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20220644',
  '뉴키즈 창업가 선순환 투자조합 7호',
  NULL,
  'VCS Registered Fund',
  170000000,
  170000000,
  '2024-10-25',
  'Active',
  '뉴키즈인베스트먼트',
  NULL,
  '{"fund_id":"AS20240982","registration_date":"2024-10-25","expiry_date":"2031-10-24","formation_total_amount":"1.7","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20220644","operator_company_name":"뉴키즈인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.883Z"}'::jsonb,
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

-- Record 3193: 뉴키즈 창업가 선순환 투자조합 6호
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20220644',
  '뉴키즈 창업가 선순환 투자조합 6호',
  NULL,
  'VCS Registered Fund',
  150000000,
  150000000,
  '2024-09-24',
  'Active',
  '뉴키즈인베스트먼트',
  NULL,
  '{"fund_id":"AS20240899","registration_date":"2024-09-24","expiry_date":"2031-09-23","formation_total_amount":"1.5","investment_character_code":"","industry_code":"4","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20220644","operator_company_name":"뉴키즈인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.883Z"}'::jsonb,
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

-- Record 3194: 뉴키즈 창업가 선순환 투자조합 5호
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20220644',
  '뉴키즈 창업가 선순환 투자조합 5호',
  NULL,
  'VCS Registered Fund',
  100000000,
  100000000,
  '2024-08-26',
  'Active',
  '뉴키즈인베스트먼트',
  NULL,
  '{"fund_id":"AS20240789","registration_date":"2024-08-26","expiry_date":"2031-08-25","formation_total_amount":"1.0","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20220644","operator_company_name":"뉴키즈인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.883Z"}'::jsonb,
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

-- Record 3195: 뉴키즈 창업가 선순환 투자조합 4호
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20220644',
  '뉴키즈 창업가 선순환 투자조합 4호',
  NULL,
  'VCS Registered Fund',
  100000000,
  100000000,
  '2024-03-05',
  'Active',
  '뉴키즈인베스트먼트',
  NULL,
  '{"fund_id":"AS20240151","registration_date":"2024-03-05","expiry_date":"2031-03-04","formation_total_amount":"1.0","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20220644","operator_company_name":"뉴키즈인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.883Z"}'::jsonb,
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

-- Record 3196: 뉴키즈 창업가 선순환 투자조합 3호
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20220644',
  '뉴키즈 창업가 선순환 투자조합 3호',
  NULL,
  'VCS Registered Fund',
  100000000,
  100000000,
  '2024-02-19',
  'Active',
  '뉴키즈인베스트먼트',
  NULL,
  '{"fund_id":"AS20240087","registration_date":"2024-02-19","expiry_date":"2031-02-18","formation_total_amount":"1.0","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20220644","operator_company_name":"뉴키즈인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.883Z"}'::jsonb,
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

-- Record 3197: 뉴키즈 창업가 선순환 투자조합 2호
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20220644',
  '뉴키즈 창업가 선순환 투자조합 2호',
  NULL,
  'VCS Registered Fund',
  100000000,
  100000000,
  '2023-11-22',
  'Active',
  '뉴키즈인베스트먼트',
  NULL,
  '{"fund_id":"AS20231119","registration_date":"2023-11-22","expiry_date":"2030-11-21","formation_total_amount":"1.0","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20220644","operator_company_name":"뉴키즈인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.883Z"}'::jsonb,
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

-- Record 3198: 뉴키즈 창업가 선순환 투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20220644',
  '뉴키즈 창업가 선순환 투자조합 1호',
  NULL,
  'VCS Registered Fund',
  100000000,
  100000000,
  '2023-11-01',
  'Active',
  '뉴키즈인베스트먼트',
  NULL,
  '{"fund_id":"AS20230989","registration_date":"2023-11-01","expiry_date":"2030-10-31","formation_total_amount":"1.0","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20220644","operator_company_name":"뉴키즈인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.883Z"}'::jsonb,
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

-- Record 3199: 뉴키즈 창업가 선순환 투자조합 11호
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20220644',
  '뉴키즈 창업가 선순환 투자조합 11호',
  NULL,
  'VCS Registered Fund',
  100000000,
  100000000,
  '2025-02-11',
  'Active',
  '뉴키즈인베스트먼트',
  NULL,
  '{"fund_id":"AS20250079","registration_date":"2025-02-11","expiry_date":"2032-02-10","formation_total_amount":"1.0","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20220644","operator_company_name":"뉴키즈인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.883Z"}'::jsonb,
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

-- Record 3200: 뉴키즈 창업가 선순환 투자조합 10호
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20220644',
  '뉴키즈 창업가 선순환 투자조합 10호',
  NULL,
  'VCS Registered Fund',
  100000000,
  100000000,
  '2025-02-20',
  'Active',
  '뉴키즈인베스트먼트',
  NULL,
  '{"fund_id":"AS20250100","registration_date":"2025-02-20","expiry_date":"2032-02-19","formation_total_amount":"1.0","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20220644","operator_company_name":"뉴키즈인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.883Z"}'::jsonb,
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

-- Batch 64 completed! 50 fund records processed.
-- Progress: 3200/3689 total records

