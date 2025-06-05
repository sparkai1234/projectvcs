-- VCS Fund CORRECTED UPSERT Batch 5/74 (Records 201-250)
-- FIXED: Removed fund_name_en column that does not exist
-- Generated from VCS API Scraper fund data
-- Generated at: 2025-06-05T00:34:30.157Z
-- Schema: Matches actual fund_table structure (no fund_name_en)

-- CORRECTED FUND DATA (UPSERT - Safe for Duplicates)
-- Processing 50 fund records
-- Will INSERT new records or UPDATE existing ones

-- Record 201: 프라이머프로라타투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20170039',
  '프라이머프로라타투자조합1호',
  'VCS Registered Fund',
  2360000000,
  2360000000,
  '2018-09-07',
  'Active',
  '프라이머시즌5',
  NULL,
  '{"fund_id":"AS20180539","registration_date":"2018-09-07","expiry_date":"2025-09-06","formation_total_amount":"23.6","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20170039","operator_company_name":"프라이머시즌5","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.157Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
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

-- Record 202: 프라이머파트너스투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20170039',
  '프라이머파트너스투자조합1호',
  'VCS Registered Fund',
  650000000,
  650000000,
  '2023-01-09',
  'Active',
  '프라이머시즌5',
  NULL,
  '{"fund_id":"AS20230026","registration_date":"2023-01-09","expiry_date":"2030-01-08","formation_total_amount":"6.5","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20170039","operator_company_name":"프라이머시즌5","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.157Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
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

-- Record 203: 프라이머시즌7투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20170039',
  '프라이머시즌7투자조합',
  'VCS Registered Fund',
  18490000000,
  18490000000,
  '2025-02-07',
  'Active',
  '프라이머시즌5',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20250089","registration_date":"2025-02-07","expiry_date":"2035-02-06","formation_total_amount":"184.9","investment_character_code":"20","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20170039","operator_company_name":"프라이머시즌5","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.157Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
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

-- Record 204: 프라이머시즌6투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20170039',
  '프라이머시즌6투자조합',
  'VCS Registered Fund',
  10640000000,
  10640000000,
  '2020-10-15',
  'Active',
  '프라이머시즌5',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20200583","registration_date":"2020-10-15","expiry_date":"2030-10-14","formation_total_amount":"106.4","investment_character_code":"20","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20170039","operator_company_name":"프라이머시즌5","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.157Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
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

-- Record 205: 프라이머시즌5투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20170039',
  '프라이머시즌5투자조합1호',
  'VCS Registered Fund',
  4090000000,
  4090000000,
  '2018-06-27',
  'Active',
  '프라이머시즌5',
  NULL,
  '{"fund_id":"AS20180485","registration_date":"2018-06-27","expiry_date":"2025-06-25","formation_total_amount":"40.9","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20170039","operator_company_name":"프라이머시즌5","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.157Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
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

-- Record 206: 프라이머사제프로젝트펀드1호
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20170039',
  '프라이머사제프로젝트펀드1호',
  'VCS Registered Fund',
  4700000000,
  4700000000,
  '2021-09-16',
  'Active',
  '프라이머시즌5',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20210874","registration_date":"2021-09-16","expiry_date":"2029-09-15","formation_total_amount":"47.0","investment_character_code":"25","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20170039","operator_company_name":"프라이머시즌5","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.157Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
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

-- Record 207: 프라이머부스트투자조합3호
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20170039',
  '프라이머부스트투자조합3호',
  'VCS Registered Fund',
  1900000000,
  1900000000,
  '2023-05-24',
  'Active',
  '프라이머시즌5',
  NULL,
  '{"fund_id":"AS20230411","registration_date":"2023-05-24","expiry_date":"2033-05-23","formation_total_amount":"19.0","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20170039","operator_company_name":"프라이머시즌5","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.157Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
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

-- Record 208: 프라이머부스트투자조합2호
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20170039',
  '프라이머부스트투자조합2호',
  'VCS Registered Fund',
  4050000000,
  4050000000,
  '2020-11-03',
  'Active',
  '프라이머시즌5',
  NULL,
  '{"fund_id":"AS20200604","registration_date":"2020-11-03","expiry_date":"2030-11-02","formation_total_amount":"40.5","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20170039","operator_company_name":"프라이머시즌5","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.157Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
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

-- Record 209: 프라이머부스트투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20170039',
  '프라이머부스트투자조합1호',
  'VCS Registered Fund',
  2640000000,
  2640000000,
  '2020-03-17',
  'Active',
  '프라이머시즌5',
  NULL,
  '{"fund_id":"AS20200102","registration_date":"2020-03-17","expiry_date":"2027-03-03","formation_total_amount":"26.4","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20170039","operator_company_name":"프라이머시즌5","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.157Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
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

-- Record 210: 퓨처플레이혁신솔루션펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20160003',
  '퓨처플레이혁신솔루션펀드',
  'VCS Registered Fund',
  29750000000,
  29750000000,
  '2021-06-22',
  'Active',
  '퓨처플레이',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20210506","registration_date":"2021-06-22","expiry_date":"2029-06-21","formation_total_amount":"297.5","investment_character_code":"20","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20160003","operator_company_name":"퓨처플레이","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.157Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
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

-- Record 211: 퓨처플레이제2호개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20160003',
  '퓨처플레이제2호개인투자조합',
  'VCS Registered Fund',
  5500000000,
  5500000000,
  '2020-08-10',
  'Active',
  '퓨처플레이',
  NULL,
  '{"fund_id":"AS20200392","registration_date":"2020-08-10","expiry_date":"2028-08-09","formation_total_amount":"55.0","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"MF00000001","operator_company_id":"OP20160003","operator_company_name":"퓨처플레이","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.157Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
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

-- Record 212: 퓨처플레이유니콘펀드3호
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20160003',
  '퓨처플레이유니콘펀드3호',
  'VCS Registered Fund',
  11300000000,
  11300000000,
  '2024-10-22',
  'Active',
  '퓨처플레이',
  NULL,
  '{"fund_id":"AS20240974","registration_date":"2024-10-22","expiry_date":"2032-10-21","formation_total_amount":"113.0","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20160003","operator_company_name":"퓨처플레이","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.157Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
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

-- Record 213: 퓨처플레이유니콘펀드2호
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20160003',
  '퓨처플레이유니콘펀드2호',
  'VCS Registered Fund',
  15700000000,
  15700000000,
  '2023-09-27',
  'Active',
  '퓨처플레이',
  NULL,
  '{"fund_id":"AS20230868","registration_date":"2023-09-27","expiry_date":"2031-09-26","formation_total_amount":"157.0","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20160003","operator_company_name":"퓨처플레이","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.157Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
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

-- Record 214: 퓨처플레이유니콘펀드1호
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20160003',
  '퓨처플레이유니콘펀드1호',
  'VCS Registered Fund',
  14300000000,
  14300000000,
  '2022-08-17',
  'Active',
  '퓨처플레이',
  NULL,
  '{"fund_id":"AS20220883","registration_date":"2022-08-17","expiry_date":"2029-08-16","formation_total_amount":"143.0","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20160003","operator_company_name":"퓨처플레이","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.157Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
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

-- Record 215: 퓨처플레이-신한 테크이노베이션 제2호
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20160003',
  '퓨처플레이-신한 테크이노베이션 제2호',
  'VCS Registered Fund',
  21500000000,
  21500000000,
  '2021-11-17',
  'Active',
  '퓨처플레이',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20211150","registration_date":"2021-11-17","expiry_date":"2029-11-16","formation_total_amount":"215.0","investment_character_code":"02","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20160003","operator_company_name":"퓨처플레이","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.157Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
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

-- Record 216: 퓨처플레이 혁신성장펀드 제1호
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20160003',
  '퓨처플레이 혁신성장펀드 제1호',
  'VCS Registered Fund',
  42000000000,
  42000000000,
  '2023-12-19',
  'Active',
  '퓨처플레이',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20231307","registration_date":"2023-12-19","expiry_date":"2031-12-18","formation_total_amount":"420.0","investment_character_code":"30","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20160003","operator_company_name":"퓨처플레이","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.157Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
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

-- Record 217: 퓨처플레이 파이오니어펀드 제1호
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20160003',
  '퓨처플레이 파이오니어펀드 제1호',
  'VCS Registered Fund',
  12400000000,
  12400000000,
  '2023-04-25',
  'Active',
  '퓨처플레이',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20230324","registration_date":"2023-04-25","expiry_date":"2031-04-24","formation_total_amount":"124.0","investment_character_code":"20","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20160003","operator_company_name":"퓨처플레이","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.157Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
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

-- Record 218: 퓨처플레이 뉴-엔터테인먼트펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20160003',
  '퓨처플레이 뉴-엔터테인먼트펀드',
  'VCS Registered Fund',
  17520000000,
  17520000000,
  '2022-04-12',
  'Active',
  '퓨처플레이',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20220409","registration_date":"2022-04-12","expiry_date":"2030-04-11","formation_total_amount":"175.2","investment_character_code":"20","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20160003","operator_company_name":"퓨처플레이","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.157Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
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

-- Record 219: 퓨처리딩바이오투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20000042',
  '퓨처리딩바이오투자조합',
  'VCS Registered Fund',
  10000000000,
  10000000000,
  '2019-06-11',
  'Active',
  '에스엠비투자파트너스',
  '{"바이오","일반"}',
  '{"fund_id":"AS20190244","registration_date":"2019-06-11","expiry_date":"2029-06-10","formation_total_amount":"100.0","investment_character_code":"01","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"바이오","mother_fund_id":"","operator_company_id":"OP20000042","operator_company_name":"에스엠비투자파트너스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.157Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
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

-- Record 220: 푸드테크초기스타트업 개인투자조합4호
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20140013',
  '푸드테크초기스타트업 개인투자조합4호',
  'VCS Registered Fund',
  310000000,
  310000000,
  '2024-06-04',
  'Active',
  '더인벤션랩',
  NULL,
  '{"fund_id":"AS20240477","registration_date":"2024-06-04","expiry_date":"2029-06-03","formation_total_amount":"3.1","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20140013","operator_company_name":"더인벤션랩","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.157Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
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

-- Record 221: 푸드테크초기스타트업 개인투자조합3호
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20140013',
  '푸드테크초기스타트업 개인투자조합3호',
  'VCS Registered Fund',
  120000000,
  120000000,
  '2023-05-15',
  'Active',
  '더인벤션랩',
  NULL,
  '{"fund_id":"AS20230367","registration_date":"2023-05-15","expiry_date":"2028-05-31","formation_total_amount":"1.2","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20140013","operator_company_name":"더인벤션랩","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.157Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
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

-- Record 222: 푸드테크초기스타트업 개인투자조합2호
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20140013',
  '푸드테크초기스타트업 개인투자조합2호',
  'VCS Registered Fund',
  250000000,
  250000000,
  '2023-05-08',
  'Active',
  '더인벤션랩',
  NULL,
  '{"fund_id":"AS20230355","registration_date":"2023-05-08","expiry_date":"2028-05-07","formation_total_amount":"2.5","investment_character_code":"","industry_code":"7","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20140013","operator_company_name":"더인벤션랩","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.157Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
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

-- Record 223: 푸드테크초기스타트업 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20140013',
  '푸드테크초기스타트업 개인투자조합',
  'VCS Registered Fund',
  620000000,
  620000000,
  '2022-01-06',
  'Active',
  '더인벤션랩',
  NULL,
  '{"fund_id":"AS20220009","registration_date":"2022-01-06","expiry_date":"2027-02-28","formation_total_amount":"6.2","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20140013","operator_company_name":"더인벤션랩","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.157Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
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

-- Record 224: 포항 아이스퀘어 그린테크 제1호 벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20200340',
  '포항 아이스퀘어 그린테크 제1호 벤처투자조합',
  'VCS Registered Fund',
  10000000000,
  10000000000,
  '2021-05-04',
  'Active',
  '에코프로파트너스',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20210359","registration_date":"2021-05-04","expiry_date":"2027-05-03","formation_total_amount":"100.0","investment_character_code":"03","industry_code":"4","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20200340","operator_company_name":"에코프로파트너스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.157Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
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

-- Record 225: 포지티브 에이아이 벤처투자조합 제1호
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20220322',
  '포지티브 에이아이 벤처투자조합 제1호',
  'VCS Registered Fund',
  6200000000,
  6200000000,
  '2023-10-23',
  'Active',
  '포지티브인베스트먼트',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20230966","registration_date":"2023-10-23","expiry_date":"2028-10-22","formation_total_amount":"62.0","investment_character_code":"02","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20220322","operator_company_name":"포지티브인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.157Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
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

-- Record 226: 포지티브 소재부품장비 벤처투자조합 제1호
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20220322',
  '포지티브 소재부품장비 벤처투자조합 제1호',
  'VCS Registered Fund',
  4550000000,
  4550000000,
  '2022-07-08',
  'Active',
  '포지티브인베스트먼트',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20220761","registration_date":"2022-07-08","expiry_date":"2027-07-07","formation_total_amount":"45.5","investment_character_code":"16","industry_code":"4","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20220322","operator_company_name":"포지티브인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.157Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
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

-- Record 227: 포지티브 세컨더리 벤처투자조합 제2호
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20220322',
  '포지티브 세컨더리 벤처투자조합 제2호',
  'VCS Registered Fund',
  36200000000,
  36200000000,
  '2024-04-04',
  'Active',
  '포지티브인베스트먼트',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20240262","registration_date":"2024-04-04","expiry_date":"2029-04-03","formation_total_amount":"362.0","investment_character_code":"16","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20220322","operator_company_name":"포지티브인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.157Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
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

-- Record 228: 포지티브 세컨더리 벤처투자조합 제1호
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20220322',
  '포지티브 세컨더리 벤처투자조합 제1호',
  'VCS Registered Fund',
  31850000000,
  31850000000,
  '2022-07-08',
  'Active',
  '포지티브인베스트먼트',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20220770","registration_date":"2022-07-08","expiry_date":"2027-07-07","formation_total_amount":"318.5","investment_character_code":"16","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20220322","operator_company_name":"포지티브인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.157Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
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

-- Record 229: 포지티브 로보틱스 벤처투자조합 제1호
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20220322',
  '포지티브 로보틱스 벤처투자조합 제1호',
  'VCS Registered Fund',
  2200000000,
  2200000000,
  '2025-02-13',
  'Active',
  '포지티브인베스트먼트',
  '{"일반 기타","일반"}',
  '{"fund_id":"AS20250107","registration_date":"2025-02-13","expiry_date":"2030-02-12","formation_total_amount":"22.0","investment_character_code":"25","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"일반 기타","mother_fund_id":"","operator_company_id":"OP20220322","operator_company_name":"포지티브인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.157Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
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

-- Record 230: 포스트코비드 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20140013',
  '포스트코비드 개인투자조합',
  'VCS Registered Fund',
  300000000,
  300000000,
  '2023-08-22',
  'Active',
  '더인벤션랩',
  NULL,
  '{"fund_id":"AS20230702","registration_date":"2023-08-22","expiry_date":"2028-08-21","formation_total_amount":"3.0","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20140013","operator_company_name":"더인벤션랩","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.157Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
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

-- Record 231: 포스텍홀딩스 지역뉴딜 벤처펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20120010',
  '포스텍홀딩스 지역뉴딜 벤처펀드',
  'VCS Registered Fund',
  29500000000,
  29500000000,
  '2022-07-21',
  'Active',
  '포항공과대학교기술지주',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20220832","registration_date":"2022-07-21","expiry_date":"2032-07-20","formation_total_amount":"295.0","investment_character_code":"20","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20120010","operator_company_name":"포항공과대학교기술지주","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.157Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
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

-- Record 232: 포스텍 홀딩스 7호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20120010',
  '포스텍 홀딩스 7호 투자조합',
  'VCS Registered Fund',
  5000000000,
  5000000000,
  '2023-03-15',
  'Active',
  '포항공과대학교기술지주',
  NULL,
  '{"fund_id":"AS20230179","registration_date":"2023-03-15","expiry_date":"2033-03-14","formation_total_amount":"50.0","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"MF00000001","operator_company_id":"OP20120010","operator_company_name":"포항공과대학교기술지주","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.157Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
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

-- Record 233: 포스텍 홀딩스 6호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20120010',
  '포스텍 홀딩스 6호 투자조합',
  'VCS Registered Fund',
  5000000000,
  5000000000,
  '2021-09-13',
  'Active',
  '포항공과대학교기술지주',
  NULL,
  '{"fund_id":"AS20210836","registration_date":"2021-09-13","expiry_date":"2031-09-12","formation_total_amount":"50.0","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"MF00000001","operator_company_id":"OP20120010","operator_company_name":"포항공과대학교기술지주","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.157Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
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

-- Record 234: 포스텍 홀딩스 5호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20120010',
  '포스텍 홀딩스 5호 투자조합',
  'VCS Registered Fund',
  4000000000,
  4000000000,
  '2020-06-29',
  'Active',
  '포항공과대학교기술지주',
  NULL,
  '{"fund_id":"AS20200289","registration_date":"2020-06-29","expiry_date":"2030-06-28","formation_total_amount":"40.0","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"MF00000001","operator_company_id":"OP20120010","operator_company_name":"포항공과대학교기술지주","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.157Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
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

-- Record 235: 포스텍 홀딩스 4호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20120010',
  '포스텍 홀딩스 4호 투자조합',
  'VCS Registered Fund',
  7500000000,
  7500000000,
  '2020-08-10',
  'Active',
  '포항공과대학교기술지주',
  NULL,
  '{"fund_id":"AS20200390","registration_date":"2020-08-10","expiry_date":"2030-08-09","formation_total_amount":"75.0","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"MF00000001","operator_company_id":"OP20120010","operator_company_name":"포항공과대학교기술지주","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.157Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
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

-- Record 236: 포스텍 홀딩스 3호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20120010',
  '포스텍 홀딩스 3호 투자조합',
  'VCS Registered Fund',
  5000000000,
  5000000000,
  '2019-12-03',
  'Active',
  '포항공과대학교기술지주',
  NULL,
  '{"fund_id":"AS20190549","registration_date":"2019-12-03","expiry_date":"2029-12-02","formation_total_amount":"50.0","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"MF00000001","operator_company_id":"OP20120010","operator_company_name":"포항공과대학교기술지주","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.157Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
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

-- Record 237: 포스텍 홀딩스 2호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20120010',
  '포스텍 홀딩스 2호 개인투자조합',
  'VCS Registered Fund',
  4000000000,
  4000000000,
  '2018-11-13',
  'Active',
  '포항공과대학교기술지주',
  NULL,
  '{"fund_id":"AS20180321","registration_date":"2018-11-13","expiry_date":"2025-11-12","formation_total_amount":"40.0","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"MF00000008","operator_company_id":"OP20120010","operator_company_name":"포항공과대학교기술지주","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.157Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
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

-- Record 238: 포스텍 경북 챌린지 씨드 1호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20120010',
  '포스텍 경북 챌린지 씨드 1호 개인투자조합',
  'VCS Registered Fund',
  5000000000,
  5000000000,
  '2018-09-03',
  'Active',
  '포항공과대학교기술지주',
  NULL,
  '{"fund_id":"AS20180213","registration_date":"2018-09-03","expiry_date":"2028-09-02","formation_total_amount":"50.0","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"MF00000001","operator_company_id":"OP20120010","operator_company_name":"포항공과대학교기술지주","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.157Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
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

-- Record 239: 포스코-KB 조선업 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP19900001',
  '포스코-KB 조선업 투자조합',
  'VCS Registered Fund',
  40000000000,
  40000000000,
  '2017-06-22',
  'Active',
  '케이비인베스트먼트',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20170062","registration_date":"2017-06-22","expiry_date":"2025-06-21","formation_total_amount":"400.0","investment_character_code":"10","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP19900001","operator_company_name":"케이비인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.157Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
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

-- Record 240: 포스코 부산 지역뉴딜 벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP19970007',
  '포스코 부산 지역뉴딜 벤처투자조합',
  'VCS Registered Fund',
  25000000000,
  25000000000,
  '2021-12-29',
  'Active',
  '포스코기술투자',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20211447","registration_date":"2021-12-29","expiry_date":"2029-12-28","formation_total_amount":"250.0","investment_character_code":"18","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000015","operator_company_id":"OP19970007","operator_company_name":"포스코기술투자","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.157Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
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

-- Record 241: 포스코 문화융합콘텐츠펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP19970007',
  '포스코 문화융합콘텐츠펀드',
  'VCS Registered Fund',
  30000000000,
  30000000000,
  '2016-09-26',
  'Active',
  '포스코기술투자',
  '{"문화 기타","문화"}',
  '{"fund_id":"AS20160077","registration_date":"2016-09-26","expiry_date":"2025-09-25","formation_total_amount":"300.0","investment_character_code":"24","industry_code":"6","investment_field_type":"문화","investment_field_detail_type":"문화 기타","mother_fund_id":"MF00000001","operator_company_id":"OP19970007","operator_company_name":"포스코기술투자","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.157Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
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

-- Record 242: 포스코 4차 산업혁명 펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP19970007',
  '포스코 4차 산업혁명 펀드',
  'VCS Registered Fund',
  21000000000,
  21000000000,
  '2017-12-29',
  'Active',
  '포스코기술투자',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20180049","registration_date":"2017-12-29","expiry_date":"2025-12-28","formation_total_amount":"210.0","investment_character_code":"02","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP19970007","operator_company_name":"포스코기술투자","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.157Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
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

-- Record 243: 펫케어초기스타트업 개인투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20140013',
  '펫케어초기스타트업 개인투자조합1호',
  'VCS Registered Fund',
  1350000000,
  1350000000,
  '2021-10-01',
  'Active',
  '더인벤션랩',
  NULL,
  '{"fund_id":"AS20210942","registration_date":"2021-10-01","expiry_date":"2026-10-31","formation_total_amount":"13.5","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20140013","operator_company_name":"더인벤션랩","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.157Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
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

-- Record 244: 펜처 한국영화 메인투자 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20190265',
  '펜처 한국영화 메인투자 투자조합',
  'VCS Registered Fund',
  42000000000,
  42000000000,
  '2024-08-07',
  'Active',
  '펜처인베스트',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20240752","registration_date":"2024-08-07","expiry_date":"2031-08-06","formation_total_amount":"420.0","investment_character_code":"24","industry_code":"6","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20190265","operator_company_name":"펜처인베스트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.157Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
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

-- Record 245: 펜처 케이-콘텐츠 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20190265',
  '펜처 케이-콘텐츠 투자조합',
  'VCS Registered Fund',
  101100000000,
  101100000000,
  '2022-11-16',
  'Active',
  '펜처인베스트',
  '{"영상(영화+드라마+애니메이션)","문화"}',
  '{"fund_id":"AS20221309","registration_date":"2022-11-16","expiry_date":"2030-11-15","formation_total_amount":"1011.0","investment_character_code":"24","industry_code":"6","investment_field_type":"문화","investment_field_detail_type":"영상(영화+드라마+애니메이션)","mother_fund_id":"","operator_company_id":"OP20190265","operator_company_name":"펜처인베스트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.157Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
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

-- Record 246: 펜처 중저예산영화전문 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20190265',
  '펜처 중저예산영화전문 투자조합',
  'VCS Registered Fund',
  20100000000,
  20100000000,
  '2022-09-08',
  'Active',
  '펜처인베스트',
  '{"영상(영화+드라마+애니메이션)","문화"}',
  '{"fund_id":"AS20221047","registration_date":"2022-09-08","expiry_date":"2028-09-07","formation_total_amount":"201.0","investment_character_code":"24","industry_code":"6","investment_field_type":"문화","investment_field_detail_type":"영상(영화+드라마+애니메이션)","mother_fund_id":"MF00000001","operator_company_id":"OP20190265","operator_company_name":"펜처인베스트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.157Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
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

-- Record 247: 펜처 바이오 텐베거 투자조합 제1호
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20190265',
  '펜처 바이오 텐베거 투자조합 제1호',
  'VCS Registered Fund',
  3000000000,
  3000000000,
  '2020-02-21',
  'Active',
  '펜처인베스트',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20200078","registration_date":"2020-02-21","expiry_date":"2026-02-20","formation_total_amount":"30.0","investment_character_code":"01","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20190265","operator_company_name":"펜처인베스트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.157Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
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

-- Record 248: 펜처 더블헬릭스 벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20190265',
  '펜처 더블헬릭스 벤처투자조합',
  'VCS Registered Fund',
  4500000000,
  4500000000,
  '2020-12-21',
  'Active',
  '펜처인베스트',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20200820","registration_date":"2020-12-21","expiry_date":"2025-12-20","formation_total_amount":"45.0","investment_character_code":"04","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20190265","operator_company_name":"펜처인베스트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.157Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
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

-- Record 249: 펜처 글로벌콘텐츠 IP 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20190265',
  '펜처 글로벌콘텐츠 IP 투자조합',
  'VCS Registered Fund',
  50050000000,
  50050000000,
  '2024-08-20',
  'Active',
  '펜처인베스트',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20240795","registration_date":"2024-08-20","expiry_date":"2032-08-19","formation_total_amount":"500.5","investment_character_code":"24","industry_code":"6","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20190265","operator_company_name":"펜처인베스트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.157Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
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

-- Record 250: 펜마이지스타투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20220274',
  '펜마이지스타투자조합1호',
  'VCS Registered Fund',
  300000000,
  300000000,
  '2024-02-15',
  'Active',
  '펜벤처스코리아',
  NULL,
  '{"fund_id":"AS20240089","registration_date":"2024-02-15","expiry_date":"2032-02-14","formation_total_amount":"3.0","investment_character_code":"","industry_code":"1","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20220274","operator_company_name":"펜벤처스코리아","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.157Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
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

-- Corrected Batch 5 completed! 50 fund records processed.
-- Progress: 250/3689 total records

