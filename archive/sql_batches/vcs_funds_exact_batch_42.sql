-- VCS Fund EXACT UPSERT Batch 42/74 (Records 2051-2100)
-- EXACT: Uses actual fund_table schema columns
-- Generated from VCS API Scraper fund data
-- Generated at: 2025-06-05T00:42:07.235Z
-- Schema: Exact match to actual fund_table structure

-- EXACT FUND DATA (UPSERT - Safe for Duplicates)
-- Processing 50 fund records
-- Will INSERT new records or UPDATE existing ones

-- Record 2051: 스프링캠프 극초기 투자조합 제1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20150007',
  '스프링캠프 극초기 투자조합 제1호',
  1000000000,
  '2024-01-24',
  'Active',
  '스프링캠프',
  'VCS_API_SCRAPER',
  'AS20240054',
  '스프링캠프',
  '산업코드: 8 | 조성총액: 10.0억원',
  '2029-01-23',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20240054","mother_fund_id":"","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"10.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.235Z"}',
  '2025-06-05T00:42:07.235Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 2052: 스프링에이아이투자조합 제1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20220223',
  '스프링에이아이투자조합 제1호',
  2100000000,
  '2022-10-06',
  'Active',
  '힐스프링인베스트먼트',
  'VCS_API_SCRAPER',
  'AS20221149',
  '힐스프링인베스트먼트',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 02 | 산업코드: 9 | 조성총액: 21.0억원',
  '2027-10-05',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20221149","mother_fund_id":"","investment_character_code":"02","industry_code":"9","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"21.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.235Z"}',
  '2025-06-05T00:42:07.235Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 2053: 스프링스페이스테크투자조합 제1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20220223',
  '스프링스페이스테크투자조합 제1호',
  19500000000,
  '2022-05-23',
  'Active',
  '힐스프링인베스트먼트',
  'VCS_API_SCRAPER',
  'AS20220580',
  '힐스프링인베스트먼트',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 25 | 산업코드: 1 | 조성총액: 195.0억원',
  '2027-05-22',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20220580","mother_fund_id":"","investment_character_code":"25","industry_code":"1","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"195.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.235Z"}',
  '2025-06-05T00:42:07.235Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 2054: 스프링리걸테크투자조합 제1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20220223',
  '스프링리걸테크투자조합 제1호',
  2000000000,
  '2022-08-23',
  'Active',
  '힐스프링인베스트먼트',
  'VCS_API_SCRAPER',
  'AS20220977',
  '힐스프링인베스트먼트',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 25 | 산업코드: 8 | 조성총액: 20.0억원',
  '2027-08-22',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20220977","mother_fund_id":"","investment_character_code":"25","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"20.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.235Z"}',
  '2025-06-05T00:42:07.235Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 2055: 스포테인먼트 SAP-Y&A 개인투자조합 제1호-P
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20150027',
  '스포테인먼트 SAP-Y&A 개인투자조합 제1호-P',
  100000000,
  '2025-03-06',
  'Active',
  '와이앤아처',
  'VCS_API_SCRAPER',
  'AS20250136',
  '와이앤아처',
  '산업코드: 9 | 조성총액: 1.0억원',
  '2030-03-05',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20250136","mother_fund_id":"","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"1.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.235Z"}',
  '2025-06-05T00:42:07.235Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 2056: 스페이스점프 유스타 개인투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20080018',
  '스페이스점프 유스타 개인투자조합 1호',
  540000000,
  '2021-09-16',
  'Active',
  '투잇인베스트먼트',
  'VCS_API_SCRAPER',
  'AS20210837',
  '투잇인베스트먼트',
  '산업코드: 5 | 조성총액: 5.4억원',
  '2026-09-08',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20210837","mother_fund_id":"","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"5.4","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.235Z"}',
  '2025-06-05T00:42:07.235Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 2057: 스페이스점프 개인투자조합 5호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20080018',
  '스페이스점프 개인투자조합 5호',
  430000000,
  '2023-03-03',
  'Active',
  '투잇인베스트먼트',
  'VCS_API_SCRAPER',
  'AS20230137',
  '투잇인베스트먼트',
  '산업코드: 8 | 조성총액: 4.3억원',
  '2028-03-01',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20230137","mother_fund_id":"","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"4.3","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.235Z"}',
  '2025-06-05T00:42:07.235Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 2058: 스페이스점프 개인투자조합 4호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20080018',
  '스페이스점프 개인투자조합 4호',
  500000000,
  '2022-10-24',
  'Active',
  '투잇인베스트먼트',
  'VCS_API_SCRAPER',
  'AS20221200',
  '투잇인베스트먼트',
  '산업코드: 2 | 조성총액: 5.0억원',
  '2027-10-18',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20221200","mother_fund_id":"","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"5.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.235Z"}',
  '2025-06-05T00:42:07.235Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 2059: 스페이스점프 개인투자조합 3호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20080018',
  '스페이스점프 개인투자조합 3호',
  110000000,
  '2022-05-20',
  'Active',
  '투잇인베스트먼트',
  'VCS_API_SCRAPER',
  'AS20220511',
  '투잇인베스트먼트',
  '산업코드: 8 | 조성총액: 1.1억원',
  '2027-05-19',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20220511","mother_fund_id":"","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"1.1","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.235Z"}',
  '2025-06-05T00:42:07.235Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 2060: 스페이스점프 개인투자조합 2호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20080018',
  '스페이스점프 개인투자조합 2호',
  310000000,
  '2022-03-16',
  'Active',
  '투잇인베스트먼트',
  'VCS_API_SCRAPER',
  'AS20220234',
  '투잇인베스트먼트',
  '산업코드: 1 | 조성총액: 3.1억원',
  '2027-03-14',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20220234","mother_fund_id":"","investment_character_code":"","industry_code":"1","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"3.1","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.235Z"}',
  '2025-06-05T00:42:07.235Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 2061: 스파크펫 3호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20190384',
  '스파크펫 3호 개인투자조합',
  770000000,
  '2021-04-12',
  'Active',
  '스파크랩',
  'VCS_API_SCRAPER',
  'AS20210273',
  '스파크랩',
  '산업코드: 8 | 조성총액: 7.7억원',
  '2028-04-11',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20210273","mother_fund_id":"","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"7.7","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.235Z"}',
  '2025-06-05T00:42:07.235Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 2062: 스파크펫 2호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20190384',
  '스파크펫 2호 개인투자조합',
  680000000,
  '2021-03-30',
  'Active',
  '스파크랩',
  'VCS_API_SCRAPER',
  'AS20210232',
  '스파크랩',
  '산업코드: 8 | 조성총액: 6.8억원',
  '2028-03-29',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20210232","mother_fund_id":"","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"6.8","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.235Z"}',
  '2025-06-05T00:42:07.235Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 2063: 스파크펫 1호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20190384',
  '스파크펫 1호 개인투자조합',
  840000000,
  '2021-02-09',
  'Active',
  '스파크랩',
  'VCS_API_SCRAPER',
  'AS20210106',
  '스파크랩',
  '산업코드: 8 | 조성총액: 8.4억원',
  '2028-02-08',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20210106","mother_fund_id":"","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"8.4","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.235Z"}',
  '2025-06-05T00:42:07.235Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 2064: 스파크랩코리아 액셀러레이터 제4호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20190384',
  '스파크랩코리아 액셀러레이터 제4호 투자조합',
  10310000000,
  '2021-09-07',
  'Active',
  '스파크랩',
  'VCS_API_SCRAPER',
  'AS20210825',
  '스파크랩',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 20 | 산업코드: 2 | 조성총액: 103.1억원',
  '2026-09-06',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20210825","mother_fund_id":"","investment_character_code":"20","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"103.1","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.235Z"}',
  '2025-06-05T00:42:07.235Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 2065: 스파크랩 프론티어랩스 제1호 펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20210445',
  '스파크랩 프론티어랩스 제1호 펀드',
  2520000000,
  '2021-10-01',
  'Active',
  '스파크랩파트너스',
  'VCS_API_SCRAPER',
  'AS20210952',
  '스파크랩파트너스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 20 | 산업코드: 8 | 조성총액: 25.2억원',
  '2026-09-30',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20210952","mother_fund_id":"","investment_character_code":"20","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"25.2","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.235Z"}',
  '2025-06-05T00:42:07.235Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 2066: 스파크랩 테크 퍼스트 스텝 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20190384',
  '스파크랩 테크 퍼스트 스텝 투자조합',
  15200000000,
  '2022-05-13',
  'Active',
  '스파크랩',
  'VCS_API_SCRAPER',
  'AS20220543',
  '스파크랩',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 20 | 산업코드: 8 | 조성총액: 152.0억원',
  '2032-05-12',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20220543","mother_fund_id":"MF00000001","investment_character_code":"20","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"152.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.235Z"}',
  '2025-06-05T00:42:07.235Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 2067: 스파크랩 디스커버리펀드 7호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20190384',
  '스파크랩 디스커버리펀드 7호 개인투자조합',
  440000000,
  '2023-10-24',
  'Active',
  '스파크랩',
  'VCS_API_SCRAPER',
  'AS20230946',
  '스파크랩',
  '산업코드: 3 | 조성총액: 4.4억원',
  '2030-10-23',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20230946","mother_fund_id":"","investment_character_code":"","industry_code":"3","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"4.4","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.235Z"}',
  '2025-06-05T00:42:07.235Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 2068: 스파크랩 디스커버리펀드 6호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20190384',
  '스파크랩 디스커버리펀드 6호 개인투자조합',
  620000000,
  '2022-08-30',
  'Active',
  '스파크랩',
  'VCS_API_SCRAPER',
  'AS20220951',
  '스파크랩',
  '산업코드: 5 | 조성총액: 6.2억원',
  '2029-08-29',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20220951","mother_fund_id":"","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"6.2","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.235Z"}',
  '2025-06-05T00:42:07.236Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 2069: 스파크랩 디스커버리펀드 5호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20190384',
  '스파크랩 디스커버리펀드 5호',
  1380000000,
  '2021-11-23',
  'Active',
  '스파크랩',
  'VCS_API_SCRAPER',
  'AS20211166',
  '스파크랩',
  '산업코드: 5 | 조성총액: 13.8억원',
  '2028-11-22',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20211166","mother_fund_id":"","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"13.8","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.236Z"}',
  '2025-06-05T00:42:07.236Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 2070: 스파크랩 디스커버리펀드 4호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20190384',
  '스파크랩 디스커버리펀드 4호',
  820000000,
  '2021-11-23',
  'Active',
  '스파크랩',
  'VCS_API_SCRAPER',
  'AS20211163',
  '스파크랩',
  '산업코드: 5 | 조성총액: 8.2억원',
  '2028-11-22',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20211163","mother_fund_id":"","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"8.2","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.236Z"}',
  '2025-06-05T00:42:07.236Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 2071: 스파크랩 디스커버리펀드 3호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20190384',
  '스파크랩 디스커버리펀드 3호 개인투자조합',
  1060000000,
  '2020-10-16',
  'Active',
  '스파크랩',
  'VCS_API_SCRAPER',
  'AS20200581',
  '스파크랩',
  '산업코드: 9 | 조성총액: 10.6억원',
  '2027-10-15',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20200581","mother_fund_id":"","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"10.6","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.236Z"}',
  '2025-06-05T00:42:07.236Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 2072: 스파크랩 디스커버리펀드 2호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20190384',
  '스파크랩 디스커버리펀드 2호',
  1500000000,
  '2019-12-24',
  'Active',
  '스파크랩',
  'VCS_API_SCRAPER',
  'AS20190624',
  '스파크랩',
  '산업코드: 9 | 조성총액: 15.0억원',
  '2026-12-23',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20190624","mother_fund_id":"","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"15.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.236Z"}',
  '2025-06-05T00:42:07.236Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 2073: 스파크랩 디스커버리펀드 1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20190384',
  '스파크랩 디스커버리펀드 1호',
  2410000000,
  '2019-12-17',
  'Active',
  '스파크랩',
  'VCS_API_SCRAPER',
  'AS20190593',
  '스파크랩',
  '산업코드: 5 | 조성총액: 24.1억원',
  '2026-12-16',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20190593","mother_fund_id":"","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"24.1","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.236Z"}',
  '2025-06-05T00:42:07.236Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 2074: 스틱청년일자리펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP19990012',
  '스틱청년일자리펀드',
  88000000000,
  '2019-10-04',
  'Active',
  '스틱벤처스',
  'VCS_API_SCRAPER',
  'AS20190459',
  '스틱벤처스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 14 | 산업코드: 2 | 조성총액: 880.0억원',
  '2027-10-03',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20190459","mother_fund_id":"MF00000011","investment_character_code":"14","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"880.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.236Z"}',
  '2025-06-05T00:42:07.236Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 2075: 스틱이노베이션펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP19990012',
  '스틱이노베이션펀드',
  257000000000,
  '2022-04-29',
  'Active',
  '스틱벤처스',
  'VCS_API_SCRAPER',
  'AS20220496',
  '스틱벤처스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 08 | 산업코드: 2 | 조성총액: 2570.0억원',
  '2030-04-28',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20220496","mother_fund_id":"MF00000001","investment_character_code":"08","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"2570.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.236Z"}',
  '2025-06-05T00:42:07.236Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 2076: 스틱4차산업혁명Jump-up펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP19990012',
  '스틱4차산업혁명Jump-up펀드',
  102500000000,
  '2020-07-31',
  'Active',
  '스틱벤처스',
  'VCS_API_SCRAPER',
  'AS20200406',
  '스틱벤처스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 02 | 산업코드: 2 | 조성총액: 1025.0억원',
  '2028-07-30',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20200406","mother_fund_id":"MF00000001","investment_character_code":"02","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"1025.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.236Z"}',
  '2025-06-05T00:42:07.236Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 2077: 스틱 해외진출 플랫폼 펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP19990012',
  '스틱 해외진출 플랫폼 펀드',
  78880000000,
  '2014-12-12',
  'Active',
  '스틱벤처스',
  'VCS_API_SCRAPER',
  'AS20140048',
  '스틱벤처스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 15 | 산업코드: 8 | 조성총액: 788.8억원',
  '2025-12-10',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20140048","mother_fund_id":"MF00000001","investment_character_code":"15","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"788.8","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.236Z"}',
  '2025-06-05T00:42:07.236Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 2078: 스틱 4차산업혁명 펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP19990012',
  '스틱 4차산업혁명 펀드',
  108300000000,
  '2017-12-27',
  'Active',
  '스틱벤처스',
  'VCS_API_SCRAPER',
  'AS20180043',
  '스틱벤처스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 02 | 산업코드: 5 | 조성총액: 1083.0억원',
  '2025-12-26',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20180043","mother_fund_id":"MF00000001","investment_character_code":"02","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"1083.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.236Z"}',
  '2025-06-05T00:42:07.236Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 2079: 스톤브릿지한국형유니콘투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20080011',
  '스톤브릿지한국형유니콘투자조합',
  105000000000,
  '2018-12-27',
  'Active',
  '스톤브릿지벤처스',
  'VCS_API_SCRAPER',
  'AS20190001',
  '스톤브릿지벤처스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 02 | 산업코드: 2 | 조성총액: 1050.0억원',
  '2025-12-26',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20190001","mother_fund_id":"","investment_character_code":"02","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"1050.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.236Z"}',
  '2025-06-05T00:42:07.236Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 2080: 스톤브릿지이노베이션쿼터투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20080011',
  '스톤브릿지이노베이션쿼터투자조합',
  31000000000,
  '2015-10-22',
  'Active',
  '스톤브릿지벤처스',
  'VCS_API_SCRAPER',
  'AS20150082',
  '스톤브릿지벤처스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 10 | 산업코드: 5 | 조성총액: 310.0억원',
  '2025-10-21',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20150082","mother_fund_id":"","investment_character_code":"10","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"310.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.236Z"}',
  '2025-06-05T00:42:07.236Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 2081: 스톤브릿지오퍼튜니티1호투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20080011',
  '스톤브릿지오퍼튜니티1호투자조합',
  17110000000,
  '2017-06-09',
  'Active',
  '스톤브릿지벤처스',
  'VCS_API_SCRAPER',
  'AS20170055',
  '스톤브릿지벤처스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 16 | 산업코드: 2 | 조성총액: 171.1억원',
  '2025-10-31',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20170055","mother_fund_id":"","investment_character_code":"16","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"171.1","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.236Z"}',
  '2025-06-05T00:42:07.236Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 2082: 스톤브릿지영프론티어투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20080011',
  '스톤브릿지영프론티어투자조합',
  42500000000,
  '2017-12-29',
  'Active',
  '스톤브릿지벤처스',
  'VCS_API_SCRAPER',
  'AS20180025',
  '스톤브릿지벤처스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 21 | 산업코드: 5 | 조성총액: 425.0억원',
  '2025-12-28',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20180025","mother_fund_id":"MF00000001","investment_character_code":"21","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"425.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.236Z"}',
  '2025-06-05T00:42:07.236Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 2083: 스톤브릿지신한유니콘세컨더리 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20080011',
  '스톤브릿지신한유니콘세컨더리 투자조합',
  59200000000,
  '2021-12-21',
  'Active',
  '스톤브릿지벤처스',
  'VCS_API_SCRAPER',
  'AS20211376',
  '스톤브릿지벤처스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 16 | 산업코드: 2 | 조성총액: 592.0억원',
  '2026-12-20',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20211376","mother_fund_id":"","investment_character_code":"16","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"592.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.236Z"}',
  '2025-06-05T00:42:07.236Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 2084: 스톤브릿지고성장기업1호투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20080011',
  '스톤브릿지고성장기업1호투자조합',
  6800000000,
  '2019-10-02',
  'Active',
  '스톤브릿지벤처스',
  'VCS_API_SCRAPER',
  'AS20190469',
  '스톤브릿지벤처스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 01 | 산업코드: 3 | 조성총액: 68.0억원',
  '2025-10-01',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20190469","mother_fund_id":"","investment_character_code":"01","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"68.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.236Z"}',
  '2025-06-05T00:42:07.236Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 2085: 스톤브릿지DX사업재편 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20080011',
  '스톤브릿지DX사업재편 투자조합',
  200000000000,
  '2022-02-22',
  'Active',
  '스톤브릿지벤처스',
  'VCS_API_SCRAPER',
  'AS20220172',
  '스톤브릿지벤처스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 02 | 산업코드: 5 | 조성총액: 2000.0억원',
  '2030-02-21',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20220172","mother_fund_id":"MF00000001","investment_character_code":"02","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"2000.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.236Z"}',
  '2025-06-05T00:42:07.236Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 2086: 스톤브릿지DNA혁신성장투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20080011',
  '스톤브릿지DNA혁신성장투자조합',
  146000000000,
  '2020-12-02',
  'Active',
  '스톤브릿지벤처스',
  'VCS_API_SCRAPER',
  'AS20200723',
  '스톤브릿지벤처스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 02 | 산업코드: 2 | 조성총액: 1460.0억원',
  '2028-12-01',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20200723","mother_fund_id":"MF00000001,MF00000011","investment_character_code":"02","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"1460.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.236Z"}',
  '2025-06-05T00:42:07.236Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 2087: 스톤브릿지2020벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20080011',
  '스톤브릿지2020벤처투자조합',
  10000000000,
  '2020-07-10',
  'Active',
  '스톤브릿지벤처스',
  'VCS_API_SCRAPER',
  'AS20200346',
  '스톤브릿지벤처스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 01 | 산업코드: 1 | 조성총액: 100.0억원',
  '2025-07-09',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20200346","mother_fund_id":"","investment_character_code":"01","industry_code":"1","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"100.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.236Z"}',
  '2025-06-05T00:42:07.236Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 2088: 스톤브릿지 신성장4.0 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20080011',
  '스톤브릿지 신성장4.0 투자조합',
  250500000000,
  '2024-01-10',
  'Active',
  '스톤브릿지벤처스',
  'VCS_API_SCRAPER',
  'AS20240027',
  '스톤브릿지벤처스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 28 | 산업코드: 1 | 조성총액: 2505.0억원',
  '2032-01-09',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20240027","mother_fund_id":"","investment_character_code":"28","industry_code":"1","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"2505.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.236Z"}',
  '2025-06-05T00:42:07.236Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 2089: 스토리지엠 개인투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20170045',
  '스토리지엠 개인투자조합 1호',
  280000000,
  '2022-10-07',
  'Active',
  '벤처필드',
  'VCS_API_SCRAPER',
  'AS20221108',
  '벤처필드',
  '산업코드: 8 | 조성총액: 2.8억원',
  '2027-10-06',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20221108","mother_fund_id":"","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"2.8","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.236Z"}',
  '2025-06-05T00:42:07.236Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 2090: 스테이션케이-씨엔티테크 제1호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20180020',
  '스테이션케이-씨엔티테크 제1호 투자조합',
  3000000000,
  '2024-05-22',
  'Active',
  '씨엔티테크',
  'VCS_API_SCRAPER',
  'AS20240446',
  '씨엔티테크',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 06 | 산업코드: 2 | 조성총액: 30.0억원',
  '2031-05-21',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20240446","mother_fund_id":"","investment_character_code":"06","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"30.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.236Z"}',
  '2025-06-05T00:42:07.236Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 2091: 스테이션니오 개인투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200115',
  '스테이션니오 개인투자조합1호',
  130000000,
  '2020-08-25',
  'Active',
  '스테이션니오',
  'VCS_API_SCRAPER',
  'AS20200442',
  '스테이션니오',
  '산업코드: 8 | 조성총액: 1.3억원',
  '2025-12-30',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20200442","mother_fund_id":"","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"1.3","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.236Z"}',
  '2025-06-05T00:42:07.236Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 2092: 스테이션니오 개인투자조합 2호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200115',
  '스테이션니오 개인투자조합 2호',
  190000000,
  '2021-08-30',
  'Active',
  '스테이션니오',
  'VCS_API_SCRAPER',
  'AS20210775',
  '스테이션니오',
  '산업코드: 9 | 조성총액: 1.9억원',
  '2026-12-30',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20210775","mother_fund_id":"","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"1.9","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.236Z"}',
  '2025-06-05T00:42:07.236Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 2093: 스탤리온신성장FOCUS투자조합5호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20220354',
  '스탤리온신성장FOCUS투자조합5호',
  3530000000,
  '2024-09-13',
  'Active',
  '스탤리온파트너스',
  'VCS_API_SCRAPER',
  'AS20240905',
  '스탤리온파트너스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 25 | 산업코드: 2 | 조성총액: 35.3억원',
  '2032-09-12',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20240905","mother_fund_id":"","investment_character_code":"25","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"35.3","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.236Z"}',
  '2025-06-05T00:42:07.236Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 2094: 스탤리온신성장FOCUS투자조합4호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20220354',
  '스탤리온신성장FOCUS투자조합4호',
  4150000000,
  '2023-05-15',
  'Active',
  '스탤리온파트너스',
  'VCS_API_SCRAPER',
  'AS20230384',
  '스탤리온파트너스',
  '투자분야: 일반 | 세부분야: 에너지 | 투자성격코드: 25 | 산업코드: 3 | 조성총액: 41.5억원',
  '2028-05-14',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20230384","mother_fund_id":"","investment_character_code":"25","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"에너지","formation_total_amount":"41.5","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.236Z"}',
  '2025-06-05T00:42:07.236Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 2095: 스탤리온신성장FOCUS투자조합3호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20220354',
  '스탤리온신성장FOCUS투자조합3호',
  2500000000,
  '2023-02-28',
  'Active',
  '스탤리온파트너스',
  'VCS_API_SCRAPER',
  'AS20230136',
  '스탤리온파트너스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 25 | 산업코드: 3 | 조성총액: 25.0억원',
  '2031-02-27',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20230136","mother_fund_id":"","investment_character_code":"25","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"25.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.236Z"}',
  '2025-06-05T00:42:07.236Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 2096: 스탤리온신성장FOCUS투자조합2호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20220354',
  '스탤리온신성장FOCUS투자조합2호',
  2950000000,
  '2022-09-20',
  'Active',
  '스탤리온파트너스',
  'VCS_API_SCRAPER',
  'AS20221079',
  '스탤리온파트너스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 25 | 산업코드: 3 | 조성총액: 29.5억원',
  '2027-09-19',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20221079","mother_fund_id":"","investment_character_code":"25","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"29.5","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.236Z"}',
  '2025-06-05T00:42:07.236Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 2097: 스탤리온신성장FOCUS투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20220354',
  '스탤리온신성장FOCUS투자조합1호',
  5930000000,
  '2022-06-27',
  'Active',
  '스탤리온파트너스',
  'VCS_API_SCRAPER',
  'AS20220709',
  '스탤리온파트너스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 02 | 산업코드: 8 | 조성총액: 59.3억원',
  '2030-06-26',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20220709","mother_fund_id":"","investment_character_code":"02","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"59.3","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.236Z"}',
  '2025-06-05T00:42:07.236Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 2098: 스타트업혁신성장투자조합8호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20220489',
  '스타트업혁신성장투자조합8호',
  190000000,
  '2024-12-17',
  'Active',
  '필로소피아벤처스',
  'VCS_API_SCRAPER',
  'AS20241311',
  '필로소피아벤처스',
  '산업코드: 2 | 조성총액: 1.9억원',
  '2029-12-15',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20241311","mother_fund_id":"","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"1.9","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.236Z"}',
  '2025-06-05T00:42:07.236Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 2099: 스타트업혁신성장투자조합7호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20220489',
  '스타트업혁신성장투자조합7호',
  120000000,
  '2024-12-13',
  'Active',
  '필로소피아벤처스',
  'VCS_API_SCRAPER',
  'AS20241319',
  '필로소피아벤처스',
  '산업코드: 2 | 조성총액: 1.2억원',
  '2029-12-12',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20241319","mother_fund_id":"","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"1.2","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.236Z"}',
  '2025-06-05T00:42:07.236Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 2100: 스타트업혁신성장투자조합6호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20220489',
  '스타트업혁신성장투자조합6호',
  100000000,
  '2024-12-27',
  'Active',
  '필로소피아벤처스',
  'VCS_API_SCRAPER',
  'AS20241382',
  '필로소피아벤처스',
  '산업코드: 2 | 조성총액: 1.0억원',
  '2029-12-26',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20241382","mother_fund_id":"","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"1.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.236Z"}',
  '2025-06-05T00:42:07.236Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Exact Batch 42 completed! 50 fund records processed.
-- Progress: 2100/3689 total records

