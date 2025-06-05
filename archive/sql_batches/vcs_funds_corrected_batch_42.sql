-- VCS Fund CORRECTED UPSERT Batch 42/74 (Records 2051-2100)
-- FIXED: Removed fund_name_en column that does not exist
-- Generated from VCS API Scraper fund data
-- Generated at: 2025-06-05T00:34:30.295Z
-- Schema: Matches actual fund_table structure (no fund_name_en)

-- CORRECTED FUND DATA (UPSERT - Safe for Duplicates)
-- Processing 50 fund records
-- Will INSERT new records or UPDATE existing ones

-- Record 2051: 스프링캠프 극초기 투자조합 제1호
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20150007',
  '스프링캠프 극초기 투자조합 제1호',
  'VCS Registered Fund',
  1000000000,
  1000000000,
  '2024-01-24',
  'Active',
  '스프링캠프',
  NULL,
  '{"fund_id":"AS20240054","registration_date":"2024-01-24","expiry_date":"2029-01-23","formation_total_amount":"10.0","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20150007","operator_company_name":"스프링캠프","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.295Z"}'::jsonb,
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

-- Record 2052: 스프링에이아이투자조합 제1호
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20220223',
  '스프링에이아이투자조합 제1호',
  'VCS Registered Fund',
  2100000000,
  2100000000,
  '2022-10-06',
  'Active',
  '힐스프링인베스트먼트',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20221149","registration_date":"2022-10-06","expiry_date":"2027-10-05","formation_total_amount":"21.0","investment_character_code":"02","industry_code":"9","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20220223","operator_company_name":"힐스프링인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.295Z"}'::jsonb,
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

-- Record 2053: 스프링스페이스테크투자조합 제1호
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20220223',
  '스프링스페이스테크투자조합 제1호',
  'VCS Registered Fund',
  19500000000,
  19500000000,
  '2022-05-23',
  'Active',
  '힐스프링인베스트먼트',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20220580","registration_date":"2022-05-23","expiry_date":"2027-05-22","formation_total_amount":"195.0","investment_character_code":"25","industry_code":"1","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20220223","operator_company_name":"힐스프링인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.295Z"}'::jsonb,
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

-- Record 2054: 스프링리걸테크투자조합 제1호
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20220223',
  '스프링리걸테크투자조합 제1호',
  'VCS Registered Fund',
  2000000000,
  2000000000,
  '2022-08-23',
  'Active',
  '힐스프링인베스트먼트',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20220977","registration_date":"2022-08-23","expiry_date":"2027-08-22","formation_total_amount":"20.0","investment_character_code":"25","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20220223","operator_company_name":"힐스프링인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.295Z"}'::jsonb,
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

-- Record 2055: 스포테인먼트 SAP-Y&A 개인투자조합 제1호-P
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20150027',
  '스포테인먼트 SAP-Y&A 개인투자조합 제1호-P',
  'VCS Registered Fund',
  100000000,
  100000000,
  '2025-03-06',
  'Active',
  '와이앤아처',
  NULL,
  '{"fund_id":"AS20250136","registration_date":"2025-03-06","expiry_date":"2030-03-05","formation_total_amount":"1.0","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20150027","operator_company_name":"와이앤아처","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.295Z"}'::jsonb,
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

-- Record 2056: 스페이스점프 유스타 개인투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20080018',
  '스페이스점프 유스타 개인투자조합 1호',
  'VCS Registered Fund',
  540000000,
  540000000,
  '2021-09-16',
  'Active',
  '투잇인베스트먼트',
  NULL,
  '{"fund_id":"AS20210837","registration_date":"2021-09-16","expiry_date":"2026-09-08","formation_total_amount":"5.4","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20080018","operator_company_name":"투잇인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.295Z"}'::jsonb,
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

-- Record 2057: 스페이스점프 개인투자조합 5호
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20080018',
  '스페이스점프 개인투자조합 5호',
  'VCS Registered Fund',
  430000000,
  430000000,
  '2023-03-03',
  'Active',
  '투잇인베스트먼트',
  NULL,
  '{"fund_id":"AS20230137","registration_date":"2023-03-03","expiry_date":"2028-03-01","formation_total_amount":"4.3","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20080018","operator_company_name":"투잇인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.295Z"}'::jsonb,
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

-- Record 2058: 스페이스점프 개인투자조합 4호
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20080018',
  '스페이스점프 개인투자조합 4호',
  'VCS Registered Fund',
  500000000,
  500000000,
  '2022-10-24',
  'Active',
  '투잇인베스트먼트',
  NULL,
  '{"fund_id":"AS20221200","registration_date":"2022-10-24","expiry_date":"2027-10-18","formation_total_amount":"5.0","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20080018","operator_company_name":"투잇인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.295Z"}'::jsonb,
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

-- Record 2059: 스페이스점프 개인투자조합 3호
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20080018',
  '스페이스점프 개인투자조합 3호',
  'VCS Registered Fund',
  110000000,
  110000000,
  '2022-05-20',
  'Active',
  '투잇인베스트먼트',
  NULL,
  '{"fund_id":"AS20220511","registration_date":"2022-05-20","expiry_date":"2027-05-19","formation_total_amount":"1.1","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20080018","operator_company_name":"투잇인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.295Z"}'::jsonb,
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

-- Record 2060: 스페이스점프 개인투자조합 2호
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20080018',
  '스페이스점프 개인투자조합 2호',
  'VCS Registered Fund',
  310000000,
  310000000,
  '2022-03-16',
  'Active',
  '투잇인베스트먼트',
  NULL,
  '{"fund_id":"AS20220234","registration_date":"2022-03-16","expiry_date":"2027-03-14","formation_total_amount":"3.1","investment_character_code":"","industry_code":"1","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20080018","operator_company_name":"투잇인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.295Z"}'::jsonb,
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

-- Record 2061: 스파크펫 3호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20190384',
  '스파크펫 3호 개인투자조합',
  'VCS Registered Fund',
  770000000,
  770000000,
  '2021-04-12',
  'Active',
  '스파크랩',
  NULL,
  '{"fund_id":"AS20210273","registration_date":"2021-04-12","expiry_date":"2028-04-11","formation_total_amount":"7.7","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190384","operator_company_name":"스파크랩","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.295Z"}'::jsonb,
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

-- Record 2062: 스파크펫 2호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20190384',
  '스파크펫 2호 개인투자조합',
  'VCS Registered Fund',
  680000000,
  680000000,
  '2021-03-30',
  'Active',
  '스파크랩',
  NULL,
  '{"fund_id":"AS20210232","registration_date":"2021-03-30","expiry_date":"2028-03-29","formation_total_amount":"6.8","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190384","operator_company_name":"스파크랩","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.295Z"}'::jsonb,
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

-- Record 2063: 스파크펫 1호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20190384',
  '스파크펫 1호 개인투자조합',
  'VCS Registered Fund',
  840000000,
  840000000,
  '2021-02-09',
  'Active',
  '스파크랩',
  NULL,
  '{"fund_id":"AS20210106","registration_date":"2021-02-09","expiry_date":"2028-02-08","formation_total_amount":"8.4","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190384","operator_company_name":"스파크랩","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.295Z"}'::jsonb,
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

-- Record 2064: 스파크랩코리아 액셀러레이터 제4호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20190384',
  '스파크랩코리아 액셀러레이터 제4호 투자조합',
  'VCS Registered Fund',
  10310000000,
  10310000000,
  '2021-09-07',
  'Active',
  '스파크랩',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20210825","registration_date":"2021-09-07","expiry_date":"2026-09-06","formation_total_amount":"103.1","investment_character_code":"20","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20190384","operator_company_name":"스파크랩","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.296Z"}'::jsonb,
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

-- Record 2065: 스파크랩 프론티어랩스 제1호 펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20210445',
  '스파크랩 프론티어랩스 제1호 펀드',
  'VCS Registered Fund',
  2520000000,
  2520000000,
  '2021-10-01',
  'Active',
  '스파크랩파트너스',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20210952","registration_date":"2021-10-01","expiry_date":"2026-09-30","formation_total_amount":"25.2","investment_character_code":"20","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20210445","operator_company_name":"스파크랩파트너스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.296Z"}'::jsonb,
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

-- Record 2066: 스파크랩 테크 퍼스트 스텝 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20190384',
  '스파크랩 테크 퍼스트 스텝 투자조합',
  'VCS Registered Fund',
  15200000000,
  15200000000,
  '2022-05-13',
  'Active',
  '스파크랩',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20220543","registration_date":"2022-05-13","expiry_date":"2032-05-12","formation_total_amount":"152.0","investment_character_code":"20","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20190384","operator_company_name":"스파크랩","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.296Z"}'::jsonb,
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

-- Record 2067: 스파크랩 디스커버리펀드 7호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20190384',
  '스파크랩 디스커버리펀드 7호 개인투자조합',
  'VCS Registered Fund',
  440000000,
  440000000,
  '2023-10-24',
  'Active',
  '스파크랩',
  NULL,
  '{"fund_id":"AS20230946","registration_date":"2023-10-24","expiry_date":"2030-10-23","formation_total_amount":"4.4","investment_character_code":"","industry_code":"3","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190384","operator_company_name":"스파크랩","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.296Z"}'::jsonb,
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

-- Record 2068: 스파크랩 디스커버리펀드 6호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20190384',
  '스파크랩 디스커버리펀드 6호 개인투자조합',
  'VCS Registered Fund',
  620000000,
  620000000,
  '2022-08-30',
  'Active',
  '스파크랩',
  NULL,
  '{"fund_id":"AS20220951","registration_date":"2022-08-30","expiry_date":"2029-08-29","formation_total_amount":"6.2","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190384","operator_company_name":"스파크랩","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.296Z"}'::jsonb,
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

-- Record 2069: 스파크랩 디스커버리펀드 5호
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20190384',
  '스파크랩 디스커버리펀드 5호',
  'VCS Registered Fund',
  1380000000,
  1380000000,
  '2021-11-23',
  'Active',
  '스파크랩',
  NULL,
  '{"fund_id":"AS20211166","registration_date":"2021-11-23","expiry_date":"2028-11-22","formation_total_amount":"13.8","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190384","operator_company_name":"스파크랩","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.296Z"}'::jsonb,
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

-- Record 2070: 스파크랩 디스커버리펀드 4호
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20190384',
  '스파크랩 디스커버리펀드 4호',
  'VCS Registered Fund',
  820000000,
  820000000,
  '2021-11-23',
  'Active',
  '스파크랩',
  NULL,
  '{"fund_id":"AS20211163","registration_date":"2021-11-23","expiry_date":"2028-11-22","formation_total_amount":"8.2","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190384","operator_company_name":"스파크랩","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.296Z"}'::jsonb,
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

-- Record 2071: 스파크랩 디스커버리펀드 3호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20190384',
  '스파크랩 디스커버리펀드 3호 개인투자조합',
  'VCS Registered Fund',
  1060000000,
  1060000000,
  '2020-10-16',
  'Active',
  '스파크랩',
  NULL,
  '{"fund_id":"AS20200581","registration_date":"2020-10-16","expiry_date":"2027-10-15","formation_total_amount":"10.6","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190384","operator_company_name":"스파크랩","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.296Z"}'::jsonb,
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

-- Record 2072: 스파크랩 디스커버리펀드 2호
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20190384',
  '스파크랩 디스커버리펀드 2호',
  'VCS Registered Fund',
  1500000000,
  1500000000,
  '2019-12-24',
  'Active',
  '스파크랩',
  NULL,
  '{"fund_id":"AS20190624","registration_date":"2019-12-24","expiry_date":"2026-12-23","formation_total_amount":"15.0","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190384","operator_company_name":"스파크랩","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.296Z"}'::jsonb,
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

-- Record 2073: 스파크랩 디스커버리펀드 1호
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20190384',
  '스파크랩 디스커버리펀드 1호',
  'VCS Registered Fund',
  2410000000,
  2410000000,
  '2019-12-17',
  'Active',
  '스파크랩',
  NULL,
  '{"fund_id":"AS20190593","registration_date":"2019-12-17","expiry_date":"2026-12-16","formation_total_amount":"24.1","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190384","operator_company_name":"스파크랩","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.296Z"}'::jsonb,
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

-- Record 2074: 스틱청년일자리펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP19990012',
  '스틱청년일자리펀드',
  'VCS Registered Fund',
  88000000000,
  88000000000,
  '2019-10-04',
  'Active',
  '스틱벤처스',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20190459","registration_date":"2019-10-04","expiry_date":"2027-10-03","formation_total_amount":"880.0","investment_character_code":"14","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000011","operator_company_id":"OP19990012","operator_company_name":"스틱벤처스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.296Z"}'::jsonb,
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

-- Record 2075: 스틱이노베이션펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP19990012',
  '스틱이노베이션펀드',
  'VCS Registered Fund',
  257000000000,
  257000000000,
  '2022-04-29',
  'Active',
  '스틱벤처스',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20220496","registration_date":"2022-04-29","expiry_date":"2030-04-28","formation_total_amount":"2570.0","investment_character_code":"08","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP19990012","operator_company_name":"스틱벤처스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.296Z"}'::jsonb,
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

-- Record 2076: 스틱4차산업혁명Jump-up펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP19990012',
  '스틱4차산업혁명Jump-up펀드',
  'VCS Registered Fund',
  102500000000,
  102500000000,
  '2020-07-31',
  'Active',
  '스틱벤처스',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20200406","registration_date":"2020-07-31","expiry_date":"2028-07-30","formation_total_amount":"1025.0","investment_character_code":"02","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP19990012","operator_company_name":"스틱벤처스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.296Z"}'::jsonb,
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

-- Record 2077: 스틱 해외진출 플랫폼 펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP19990012',
  '스틱 해외진출 플랫폼 펀드',
  'VCS Registered Fund',
  78880000000,
  78880000000,
  '2014-12-12',
  'Active',
  '스틱벤처스',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20140048","registration_date":"2014-12-12","expiry_date":"2025-12-10","formation_total_amount":"788.8","investment_character_code":"15","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP19990012","operator_company_name":"스틱벤처스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.296Z"}'::jsonb,
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

-- Record 2078: 스틱 4차산업혁명 펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP19990012',
  '스틱 4차산업혁명 펀드',
  'VCS Registered Fund',
  108300000000,
  108300000000,
  '2017-12-27',
  'Active',
  '스틱벤처스',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20180043","registration_date":"2017-12-27","expiry_date":"2025-12-26","formation_total_amount":"1083.0","investment_character_code":"02","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP19990012","operator_company_name":"스틱벤처스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.296Z"}'::jsonb,
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

-- Record 2079: 스톤브릿지한국형유니콘투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20080011',
  '스톤브릿지한국형유니콘투자조합',
  'VCS Registered Fund',
  105000000000,
  105000000000,
  '2018-12-27',
  'Active',
  '스톤브릿지벤처스',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20190001","registration_date":"2018-12-27","expiry_date":"2025-12-26","formation_total_amount":"1050.0","investment_character_code":"02","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20080011","operator_company_name":"스톤브릿지벤처스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.296Z"}'::jsonb,
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

-- Record 2080: 스톤브릿지이노베이션쿼터투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20080011',
  '스톤브릿지이노베이션쿼터투자조합',
  'VCS Registered Fund',
  31000000000,
  31000000000,
  '2015-10-22',
  'Active',
  '스톤브릿지벤처스',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20150082","registration_date":"2015-10-22","expiry_date":"2025-10-21","formation_total_amount":"310.0","investment_character_code":"10","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20080011","operator_company_name":"스톤브릿지벤처스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.296Z"}'::jsonb,
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

-- Record 2081: 스톤브릿지오퍼튜니티1호투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20080011',
  '스톤브릿지오퍼튜니티1호투자조합',
  'VCS Registered Fund',
  17110000000,
  17110000000,
  '2017-06-09',
  'Active',
  '스톤브릿지벤처스',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20170055","registration_date":"2017-06-09","expiry_date":"2025-10-31","formation_total_amount":"171.1","investment_character_code":"16","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20080011","operator_company_name":"스톤브릿지벤처스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.296Z"}'::jsonb,
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

-- Record 2082: 스톤브릿지영프론티어투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20080011',
  '스톤브릿지영프론티어투자조합',
  'VCS Registered Fund',
  42500000000,
  42500000000,
  '2017-12-29',
  'Active',
  '스톤브릿지벤처스',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20180025","registration_date":"2017-12-29","expiry_date":"2025-12-28","formation_total_amount":"425.0","investment_character_code":"21","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20080011","operator_company_name":"스톤브릿지벤처스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.296Z"}'::jsonb,
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

-- Record 2083: 스톤브릿지신한유니콘세컨더리 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20080011',
  '스톤브릿지신한유니콘세컨더리 투자조합',
  'VCS Registered Fund',
  59200000000,
  59200000000,
  '2021-12-21',
  'Active',
  '스톤브릿지벤처스',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20211376","registration_date":"2021-12-21","expiry_date":"2026-12-20","formation_total_amount":"592.0","investment_character_code":"16","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20080011","operator_company_name":"스톤브릿지벤처스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.296Z"}'::jsonb,
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

-- Record 2084: 스톤브릿지고성장기업1호투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20080011',
  '스톤브릿지고성장기업1호투자조합',
  'VCS Registered Fund',
  6800000000,
  6800000000,
  '2019-10-02',
  'Active',
  '스톤브릿지벤처스',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20190469","registration_date":"2019-10-02","expiry_date":"2025-10-01","formation_total_amount":"68.0","investment_character_code":"01","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20080011","operator_company_name":"스톤브릿지벤처스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.296Z"}'::jsonb,
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

-- Record 2085: 스톤브릿지DX사업재편 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20080011',
  '스톤브릿지DX사업재편 투자조합',
  'VCS Registered Fund',
  200000000000,
  200000000000,
  '2022-02-22',
  'Active',
  '스톤브릿지벤처스',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20220172","registration_date":"2022-02-22","expiry_date":"2030-02-21","formation_total_amount":"2000.0","investment_character_code":"02","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20080011","operator_company_name":"스톤브릿지벤처스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.296Z"}'::jsonb,
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

-- Record 2086: 스톤브릿지DNA혁신성장투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20080011',
  '스톤브릿지DNA혁신성장투자조합',
  'VCS Registered Fund',
  146000000000,
  146000000000,
  '2020-12-02',
  'Active',
  '스톤브릿지벤처스',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20200723","registration_date":"2020-12-02","expiry_date":"2028-12-01","formation_total_amount":"1460.0","investment_character_code":"02","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001,MF00000011","operator_company_id":"OP20080011","operator_company_name":"스톤브릿지벤처스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.296Z"}'::jsonb,
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

-- Record 2087: 스톤브릿지2020벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20080011',
  '스톤브릿지2020벤처투자조합',
  'VCS Registered Fund',
  10000000000,
  10000000000,
  '2020-07-10',
  'Active',
  '스톤브릿지벤처스',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20200346","registration_date":"2020-07-10","expiry_date":"2025-07-09","formation_total_amount":"100.0","investment_character_code":"01","industry_code":"1","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20080011","operator_company_name":"스톤브릿지벤처스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.296Z"}'::jsonb,
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

-- Record 2088: 스톤브릿지 신성장4.0 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20080011',
  '스톤브릿지 신성장4.0 투자조합',
  'VCS Registered Fund',
  250500000000,
  250500000000,
  '2024-01-10',
  'Active',
  '스톤브릿지벤처스',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20240027","registration_date":"2024-01-10","expiry_date":"2032-01-09","formation_total_amount":"2505.0","investment_character_code":"28","industry_code":"1","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20080011","operator_company_name":"스톤브릿지벤처스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.296Z"}'::jsonb,
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

-- Record 2089: 스토리지엠 개인투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20170045',
  '스토리지엠 개인투자조합 1호',
  'VCS Registered Fund',
  280000000,
  280000000,
  '2022-10-07',
  'Active',
  '벤처필드',
  NULL,
  '{"fund_id":"AS20221108","registration_date":"2022-10-07","expiry_date":"2027-10-06","formation_total_amount":"2.8","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20170045","operator_company_name":"벤처필드","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.296Z"}'::jsonb,
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

-- Record 2090: 스테이션케이-씨엔티테크 제1호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20180020',
  '스테이션케이-씨엔티테크 제1호 투자조합',
  'VCS Registered Fund',
  3000000000,
  3000000000,
  '2024-05-22',
  'Active',
  '씨엔티테크',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20240446","registration_date":"2024-05-22","expiry_date":"2031-05-21","formation_total_amount":"30.0","investment_character_code":"06","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20180020","operator_company_name":"씨엔티테크","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.296Z"}'::jsonb,
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

-- Record 2091: 스테이션니오 개인투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20200115',
  '스테이션니오 개인투자조합1호',
  'VCS Registered Fund',
  130000000,
  130000000,
  '2020-08-25',
  'Active',
  '스테이션니오',
  NULL,
  '{"fund_id":"AS20200442","registration_date":"2020-08-25","expiry_date":"2025-12-30","formation_total_amount":"1.3","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200115","operator_company_name":"스테이션니오","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.296Z"}'::jsonb,
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

-- Record 2092: 스테이션니오 개인투자조합 2호
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20200115',
  '스테이션니오 개인투자조합 2호',
  'VCS Registered Fund',
  190000000,
  190000000,
  '2021-08-30',
  'Active',
  '스테이션니오',
  NULL,
  '{"fund_id":"AS20210775","registration_date":"2021-08-30","expiry_date":"2026-12-30","formation_total_amount":"1.9","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200115","operator_company_name":"스테이션니오","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.296Z"}'::jsonb,
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

-- Record 2093: 스탤리온신성장FOCUS투자조합5호
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20220354',
  '스탤리온신성장FOCUS투자조합5호',
  'VCS Registered Fund',
  3530000000,
  3530000000,
  '2024-09-13',
  'Active',
  '스탤리온파트너스',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20240905","registration_date":"2024-09-13","expiry_date":"2032-09-12","formation_total_amount":"35.3","investment_character_code":"25","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20220354","operator_company_name":"스탤리온파트너스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.296Z"}'::jsonb,
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

-- Record 2094: 스탤리온신성장FOCUS투자조합4호
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20220354',
  '스탤리온신성장FOCUS투자조합4호',
  'VCS Registered Fund',
  4150000000,
  4150000000,
  '2023-05-15',
  'Active',
  '스탤리온파트너스',
  '{"에너지","일반"}',
  '{"fund_id":"AS20230384","registration_date":"2023-05-15","expiry_date":"2028-05-14","formation_total_amount":"41.5","investment_character_code":"25","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"에너지","mother_fund_id":"","operator_company_id":"OP20220354","operator_company_name":"스탤리온파트너스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.296Z"}'::jsonb,
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

-- Record 2095: 스탤리온신성장FOCUS투자조합3호
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20220354',
  '스탤리온신성장FOCUS투자조합3호',
  'VCS Registered Fund',
  2500000000,
  2500000000,
  '2023-02-28',
  'Active',
  '스탤리온파트너스',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20230136","registration_date":"2023-02-28","expiry_date":"2031-02-27","formation_total_amount":"25.0","investment_character_code":"25","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20220354","operator_company_name":"스탤리온파트너스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.296Z"}'::jsonb,
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

-- Record 2096: 스탤리온신성장FOCUS투자조합2호
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20220354',
  '스탤리온신성장FOCUS투자조합2호',
  'VCS Registered Fund',
  2950000000,
  2950000000,
  '2022-09-20',
  'Active',
  '스탤리온파트너스',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20221079","registration_date":"2022-09-20","expiry_date":"2027-09-19","formation_total_amount":"29.5","investment_character_code":"25","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20220354","operator_company_name":"스탤리온파트너스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.296Z"}'::jsonb,
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

-- Record 2097: 스탤리온신성장FOCUS투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20220354',
  '스탤리온신성장FOCUS투자조합1호',
  'VCS Registered Fund',
  5930000000,
  5930000000,
  '2022-06-27',
  'Active',
  '스탤리온파트너스',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20220709","registration_date":"2022-06-27","expiry_date":"2030-06-26","formation_total_amount":"59.3","investment_character_code":"02","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20220354","operator_company_name":"스탤리온파트너스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.296Z"}'::jsonb,
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

-- Record 2098: 스타트업혁신성장투자조합8호
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20220489',
  '스타트업혁신성장투자조합8호',
  'VCS Registered Fund',
  190000000,
  190000000,
  '2024-12-17',
  'Active',
  '필로소피아벤처스',
  NULL,
  '{"fund_id":"AS20241311","registration_date":"2024-12-17","expiry_date":"2029-12-15","formation_total_amount":"1.9","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20220489","operator_company_name":"필로소피아벤처스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.296Z"}'::jsonb,
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

-- Record 2099: 스타트업혁신성장투자조합7호
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20220489',
  '스타트업혁신성장투자조합7호',
  'VCS Registered Fund',
  120000000,
  120000000,
  '2024-12-13',
  'Active',
  '필로소피아벤처스',
  NULL,
  '{"fund_id":"AS20241319","registration_date":"2024-12-13","expiry_date":"2029-12-12","formation_total_amount":"1.2","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20220489","operator_company_name":"필로소피아벤처스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.296Z"}'::jsonb,
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

-- Record 2100: 스타트업혁신성장투자조합6호
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20220489',
  '스타트업혁신성장투자조합6호',
  'VCS Registered Fund',
  100000000,
  100000000,
  '2024-12-27',
  'Active',
  '필로소피아벤처스',
  NULL,
  '{"fund_id":"AS20241382","registration_date":"2024-12-27","expiry_date":"2029-12-26","formation_total_amount":"1.0","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20220489","operator_company_name":"필로소피아벤처스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.296Z"}'::jsonb,
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

-- Corrected Batch 42 completed! 50 fund records processed.
-- Progress: 2100/3689 total records

