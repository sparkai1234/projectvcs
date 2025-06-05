-- VCS Fund MINIMAL UPSERT Batch 40/74 (Records 1951-2000)
-- MINIMAL: Only using basic columns that definitely exist
-- Generated from VCS API Scraper fund data
-- Generated at: 2025-06-05T00:40:21.882Z
-- Schema: Minimal fund_table structure (basic columns only)

-- MINIMAL FUND DATA (UPSERT - Safe for Duplicates)
-- Processing 50 fund records
-- Will INSERT new records or UPDATE existing ones

-- Record 1951: 씨엔티테크 제4호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20180020',
  '씨엔티테크 제4호 개인투자조합',
  3400000000,
  '2020-06-01',
  '{"fund_id":"AS20200236","registration_date":"2020-06-01","expiry_date":"2027-05-31","formation_total_amount":"34.0","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"MF00000001","operator_company_id":"OP20180020","operator_company_name":"씨엔티테크","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"씨엔티테크","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.882Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1952: 씨엔티테크 제2호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20180020',
  '씨엔티테크 제2호 개인투자조합',
  5450000000,
  '2019-09-17',
  '{"fund_id":"AS20190407","registration_date":"2019-09-17","expiry_date":"2026-09-16","formation_total_amount":"54.5","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"MF00000008","operator_company_id":"OP20180020","operator_company_name":"씨엔티테크","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"씨엔티테크","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.882Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1953: 씨엔티테크 제22호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20180020',
  '씨엔티테크 제22호 투자조합',
  12000000000,
  '2023-02-14',
  '{"fund_id":"AS20230094","registration_date":"2023-02-14","expiry_date":"2031-02-13","formation_total_amount":"120.0","investment_character_code":"20","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20180020","operator_company_name":"씨엔티테크","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"씨엔티테크","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.882Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1954: 씨엔티테크 제18호 스포츠 스타트업 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20180020',
  '씨엔티테크 제18호 스포츠 스타트업 투자조합',
  4500000000,
  '2022-08-31',
  '{"fund_id":"AS20221003","registration_date":"2022-08-31","expiry_date":"2029-08-30","formation_total_amount":"45.0","investment_character_code":"20","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20180020","operator_company_name":"씨엔티테크","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"씨엔티테크","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.882Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1955: 씨엔티테크 제15호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20180020',
  '씨엔티테크 제15호 개인투자조합',
  1990000000,
  '2022-02-23',
  '{"fund_id":"AS20220176","registration_date":"2022-02-23","expiry_date":"2029-02-22","formation_total_amount":"19.9","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20180020","operator_company_name":"씨엔티테크","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"씨엔티테크","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.882Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1956: 씨엔티테크 제14호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20180020',
  '씨엔티테크 제14호 개인투자조합',
  210000000,
  '2022-02-24',
  '{"fund_id":"AS20220183","registration_date":"2022-02-24","expiry_date":"2029-02-23","formation_total_amount":"2.1","investment_character_code":"","industry_code":"1","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20180020","operator_company_name":"씨엔티테크","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"씨엔티테크","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.882Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1957: 씨엔티테크 제13호 농식품 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20180020',
  '씨엔티테크 제13호 농식품 투자조합',
  7140000000,
  '2022-01-11',
  '{"fund_id":"AS20220039","registration_date":"2022-01-11","expiry_date":"2030-01-10","formation_total_amount":"71.4","investment_character_code":"20","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20180020","operator_company_name":"씨엔티테크","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"씨엔티테크","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.882Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1958: 씨엔티테크 제11호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20180020',
  '씨엔티테크 제11호 개인투자조합',
  470000000,
  '2021-11-03',
  '{"fund_id":"AS20211034","registration_date":"2021-11-03","expiry_date":"2028-11-02","formation_total_amount":"4.7","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20180020","operator_company_name":"씨엔티테크","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"씨엔티테크","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.882Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1959: 씨엔티테크 스포츠출발 제1호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20180020',
  '씨엔티테크 스포츠출발 제1호 투자조합',
  4000000000,
  '2023-12-04',
  '{"fund_id":"AS20231197","registration_date":"2023-12-04","expiry_date":"2031-12-03","formation_total_amount":"40.0","investment_character_code":"07","industry_code":"9","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20180020","operator_company_name":"씨엔티테크","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"씨엔티테크","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.882Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1960: 씨엔티테크 스타트업 투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20180020',
  '씨엔티테크 스타트업 투자조합 1호',
  160000000,
  '2018-11-21',
  '{"fund_id":"AS20180599","registration_date":"2018-11-21","expiry_date":"2026-01-02","formation_total_amount":"1.6","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20180020","operator_company_name":"씨엔티테크","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"씨엔티테크","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.882Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1961: 씨엔티테크 바인서포터즈 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20180020',
  '씨엔티테크 바인서포터즈 투자조합',
  330000000,
  '2022-03-31',
  '{"fund_id":"AS20220249","registration_date":"2022-03-31","expiry_date":"2032-03-29","formation_total_amount":"3.3","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20180020","operator_company_name":"씨엔티테크","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"씨엔티테크","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.882Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1962: 씨엔티-케이오씨피 제1호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200200',
  '씨엔티-케이오씨피 제1호 개인투자조합',
  1040000000,
  '2022-06-10',
  '{"fund_id":"AS20220623","registration_date":"2022-06-10","expiry_date":"2027-06-09","formation_total_amount":"10.4","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200200","operator_company_name":"케이오씨파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"케이오씨파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.882Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1963: 씨씨브이씨 코리아 소부장 펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20100009',
  '씨씨브이씨 코리아 소부장 펀드',
  2600000000,
  '2023-08-10',
  '{"fund_id":"AS20230696","registration_date":"2023-08-10","expiry_date":"2028-08-09","formation_total_amount":"26.0","investment_character_code":"03","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20100009","operator_company_name":"쿨리지코너인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"쿨리지코너인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.882Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1964: 씨씨브이씨 우리동네 도시재생 펀드(CCVC 우리동네 도시재생 펀드)
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20100009',
  '씨씨브이씨 우리동네 도시재생 펀드(CCVC 우리동네 도시재생 펀드)',
  25000000000,
  '2021-05-28',
  '{"fund_id":"AS20210429","registration_date":"2021-05-28","expiry_date":"2031-05-27","formation_total_amount":"250.0","investment_character_code":"18","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20100009","operator_company_name":"쿨리지코너인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"쿨리지코너인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.882Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1965: 씨씨브이씨 우리동네 도시재생 펀드 II
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20100009',
  '씨씨브이씨 우리동네 도시재생 펀드 II',
  12500000000,
  '2022-05-11',
  '{"fund_id":"AS20220525","registration_date":"2022-05-11","expiry_date":"2032-05-10","formation_total_amount":"125.0","investment_character_code":"18","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20100009","operator_company_name":"쿨리지코너인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"쿨리지코너인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.882Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1966: 씨씨브이씨 신디케이트 리드 펀드 II
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20100009',
  '씨씨브이씨 신디케이트 리드 펀드 II',
  10000000000,
  '2022-08-12',
  '{"fund_id":"AS20220938","registration_date":"2022-08-12","expiry_date":"2032-08-11","formation_total_amount":"100.0","investment_character_code":"20","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20100009","operator_company_name":"쿨리지코너인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"쿨리지코너인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.882Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1967: 씨씨브이씨 ESG 임팩트 펀드 IV
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20100009',
  '씨씨브이씨 ESG 임팩트 펀드 IV',
  20000000000,
  '2023-05-04',
  '{"fund_id":"AS20230357","registration_date":"2023-05-04","expiry_date":"2031-05-03","formation_total_amount":"200.0","investment_character_code":"23","industry_code":"4","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20100009","operator_company_name":"쿨리지코너인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"쿨리지코너인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.882Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1968: 씨브이엘(CVL)-텐원더스투자조합2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200089',
  '씨브이엘(CVL)-텐원더스투자조합2호',
  110000000,
  '2022-06-08',
  '{"fund_id":"AS20220633","registration_date":"2022-06-08","expiry_date":"2027-06-07","formation_total_amount":"1.1","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200089","operator_company_name":"텐원더스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"텐원더스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.882Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1969: 씨브이씨스케일업오픈이노베이션펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20170010',
  '씨브이씨스케일업오픈이노베이션펀드',
  70000000000,
  '2023-06-01',
  '{"fund_id":"AS20230450","registration_date":"2023-06-01","expiry_date":"2033-05-31","formation_total_amount":"700.0","investment_character_code":"02","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20170010","operator_company_name":"라이트하우스컴바인인베스트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"라이트하우스컴바인인베스트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.882Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1970: 쏠리드엑스(SX) 1호 벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20240308',
  '쏠리드엑스(SX) 1호 벤처투자조합',
  5000000000,
  '2024-09-12',
  '{"fund_id":"AS20240904","registration_date":"2024-09-12","expiry_date":"2029-09-11","formation_total_amount":"50.0","investment_character_code":"03","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20240308","operator_company_name":"쏠리드엑스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"쏠리드엑스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.883Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1971: 쏠레어컬처플러스 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20170011',
  '쏠레어컬처플러스 투자조합',
  24000000000,
  '2021-07-05',
  '{"fund_id":"AS20210556","registration_date":"2021-07-05","expiry_date":"2028-07-04","formation_total_amount":"240.0","investment_character_code":"24","industry_code":"6","investment_field_type":"문화","investment_field_detail_type":"영상(영화+드라마+애니메이션)","mother_fund_id":"MF00000001","operator_company_id":"OP20170011","operator_company_name":"쏠레어파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"쏠레어파트너스","investment_focus":["영상(영화+드라마+애니메이션)","문화"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.883Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1972: 쏠레어스케일업 영화투자조합 2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20170011',
  '쏠레어스케일업 영화투자조합 2호',
  21120000000,
  '2023-09-08',
  '{"fund_id":"AS20230802","registration_date":"2023-09-08","expiry_date":"2029-09-07","formation_total_amount":"211.2","investment_character_code":"24","industry_code":"6","investment_field_type":"문화","investment_field_detail_type":"영상(영화+드라마+애니메이션)","mother_fund_id":"MF00000001","operator_company_id":"OP20170011","operator_company_name":"쏠레어파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"쏠레어파트너스","investment_focus":["영상(영화+드라마+애니메이션)","문화"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.883Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1973: 쏠레어메인 영화투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20170011',
  '쏠레어메인 영화투자조합',
  30000000000,
  '2021-09-01',
  '{"fund_id":"AS20210795","registration_date":"2021-09-01","expiry_date":"2028-08-31","formation_total_amount":"300.0","investment_character_code":"24","industry_code":"6","investment_field_type":"문화","investment_field_detail_type":"영상(영화+드라마+애니메이션)","mother_fund_id":"MF00000001","operator_company_id":"OP20170011","operator_company_name":"쏠레어파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"쏠레어파트너스","investment_focus":["영상(영화+드라마+애니메이션)","문화"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.883Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1974: 심본투자파트너스 1호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20170005',
  '심본투자파트너스 1호 투자조합',
  17400000000,
  '2017-08-25',
  '{"fund_id":"AS20170096","registration_date":"2017-08-25","expiry_date":"2025-08-24","formation_total_amount":"174.0","investment_character_code":"20","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20170005","operator_company_name":"심본투자파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"심본투자파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.883Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1975: 심본2호 리스타트 펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20170005',
  '심본2호 리스타트 펀드',
  19560000000,
  '2018-01-05',
  '{"fund_id":"AS20180089","registration_date":"2018-01-05","expiry_date":"2026-01-04","formation_total_amount":"195.6","investment_character_code":"22","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20170005","operator_company_name":"심본투자파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"심본투자파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.883Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1976: 심본 지역혁신1호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20170005',
  '심본 지역혁신1호 투자조합',
  21300000000,
  '2024-04-08',
  '{"fund_id":"AS20240276","registration_date":"2024-04-08","expiry_date":"2032-04-07","formation_total_amount":"213.0","investment_character_code":"10","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000018","operator_company_id":"OP20170005","operator_company_name":"심본투자파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"심본투자파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.883Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1977: 심본 뉴챌린지 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20170005',
  '심본 뉴챌린지 투자조합',
  14870000000,
  '2021-09-29',
  '{"fund_id":"AS20210926","registration_date":"2021-09-29","expiry_date":"2029-09-28","formation_total_amount":"148.7","investment_character_code":"18","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20170005","operator_company_name":"심본투자파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"심본투자파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.883Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1978: 신한젠티움인천스타트업지원펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190351',
  '신한젠티움인천스타트업지원펀드',
  3100000000,
  '2020-12-22',
  '{"fund_id":"AS20200826","registration_date":"2020-12-22","expiry_date":"2027-12-21","formation_total_amount":"31.0","investment_character_code":"18","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20190351","operator_company_name":"젠티움파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"젠티움파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.883Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1979: 신한젠티움스타트업펀드2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190351',
  '신한젠티움스타트업펀드2호',
  8400000000,
  '2022-01-12',
  '{"fund_id":"AS20220053","registration_date":"2022-01-12","expiry_date":"2029-01-11","formation_total_amount":"84.0","investment_character_code":"20","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20190351","operator_company_name":"젠티움파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"젠티움파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.883Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1980: 신한은행-대성 문화콘텐츠 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19870004',
  '신한은행-대성 문화콘텐츠 투자조합',
  7000000000,
  '2016-12-28',
  '{"fund_id":"AS20160226","registration_date":"2016-12-28","expiry_date":"2025-06-27","formation_total_amount":"70.0","investment_character_code":"24","industry_code":"6","investment_field_type":"문화","investment_field_detail_type":"영상(영화+드라마+애니메이션)","mother_fund_id":"","operator_company_id":"OP19870004","operator_company_name":"대성창업투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"대성창업투자","investment_focus":["영상(영화+드라마+애니메이션)","문화"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.883Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1981: 신한벤처 투모로우 투자조합 2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20000041',
  '신한벤처 투모로우 투자조합 2호',
  30350000000,
  '2022-05-23',
  '{"fund_id":"AS20220581","registration_date":"2022-05-23","expiry_date":"2027-05-22","formation_total_amount":"303.5","investment_character_code":"16","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20000041","operator_company_name":"신한벤처투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"신한벤처투자","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.883Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1982: 신한벤처 투모로우 투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20000041',
  '신한벤처 투모로우 투자조합 1호',
  230000000000,
  '2021-11-17',
  '{"fund_id":"AS20211148","registration_date":"2021-11-17","expiry_date":"2029-11-16","formation_total_amount":"2300.0","investment_character_code":"10","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20000041","operator_company_name":"신한벤처투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"신한벤처투자","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.883Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1983: 신한-퀀텀창업초기펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20170021',
  '신한-퀀텀창업초기펀드',
  12200000000,
  '2022-03-07',
  '{"fund_id":"AS20220237","registration_date":"2022-03-07","expiry_date":"2028-03-06","formation_total_amount":"122.0","investment_character_code":"20","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20170021","operator_company_name":"퀀텀벤처스코리아","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"퀀텀벤처스코리아","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.883Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1984: 신한-코그니티브 청년창업 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20160008',
  '신한-코그니티브 청년창업 투자조합',
  30500000000,
  '2017-12-29',
  '{"fund_id":"AS20180045","registration_date":"2017-12-29","expiry_date":"2025-12-28","formation_total_amount":"305.0","investment_character_code":"21","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20160008","operator_company_name":"에이지인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"에이지인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.883Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1985: 신한-진앤뉴노멀퍼스트무버벤처투자조합제1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200240',
  '신한-진앤뉴노멀퍼스트무버벤처투자조합제1호',
  18000000000,
  '2022-10-19',
  '{"fund_id":"AS20221205","registration_date":"2022-10-19","expiry_date":"2027-10-18","formation_total_amount":"180.0","investment_character_code":"02","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20200240","operator_company_name":"진앤투자파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"진앤투자파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.883Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1986: 신한-지앤텍 스마트혁신펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20000045',
  '신한-지앤텍 스마트혁신펀드',
  26000000000,
  '2022-09-08',
  '{"fund_id":"AS20221045","registration_date":"2022-09-08","expiry_date":"2030-09-07","formation_total_amount":"260.0","investment_character_code":"02","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20000045","operator_company_name":"지앤텍벤처투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"지앤텍벤처투자","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.883Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1987: 신한-오픈워터 Pre-IPO 투자조합 제1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190245',
  '신한-오픈워터 Pre-IPO 투자조합 제1호',
  10000000000,
  '2023-08-21',
  '{"fund_id":"AS20230745","registration_date":"2023-08-21","expiry_date":"2030-08-20","formation_total_amount":"100.0","investment_character_code":"28","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20190245","operator_company_name":"오픈워터인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"오픈워터인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.883Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1988: 신한-에코 벤처투자조합 제2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200340',
  '신한-에코 벤처투자조합 제2호',
  12500000000,
  '2023-07-18',
  '{"fund_id":"AS20230618","registration_date":"2023-07-18","expiry_date":"2031-07-17","formation_total_amount":"125.0","investment_character_code":"05","industry_code":"4","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20200340","operator_company_name":"에코프로파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"에코프로파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.883Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1989: 신한-알바트로스 기술투자펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20080001',
  '신한-알바트로스 기술투자펀드',
  30000000000,
  '2017-01-17',
  '{"fund_id":"AS20170013","registration_date":"2017-01-17","expiry_date":"2026-01-16","formation_total_amount":"300.0","investment_character_code":"20","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20080001","operator_company_name":"알바트로스인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"알바트로스인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.883Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1990: 신한-아이스퀘어 벤처투자조합 제1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200340',
  '신한-아이스퀘어 벤처투자조합 제1호',
  12500000000,
  '2022-12-23',
  '{"fund_id":"AS20221539","registration_date":"2022-12-23","expiry_date":"2030-12-22","formation_total_amount":"125.0","investment_character_code":"02","industry_code":"4","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20200340","operator_company_name":"에코프로파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"에코프로파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.883Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1991: 신한-씨제이 기술혁신펀드 제1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20000044',
  '신한-씨제이 기술혁신펀드 제1호',
  20000000000,
  '2023-07-24',
  '{"fund_id":"AS20230627","registration_date":"2023-07-24","expiry_date":"2031-07-23","formation_total_amount":"200.0","investment_character_code":"06","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20000044","operator_company_name":"씨제이인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"씨제이인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.883Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1992: 신한-스퀘어 스타트업 기술금융 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190052',
  '신한-스퀘어 스타트업 기술금융 투자조합',
  20510000000,
  '2019-09-04',
  '{"fund_id":"AS20190421","registration_date":"2019-09-04","expiry_date":"2027-09-03","formation_total_amount":"205.1","investment_character_code":"20","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20190052","operator_company_name":"스퀘어벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"스퀘어벤처스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.883Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1993: 신한-스닉픽 바이오헬스케어 바운스백 펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190183',
  '신한-스닉픽 바이오헬스케어 바운스백 펀드',
  10000000000,
  '2022-12-21',
  '{"fund_id":"AS20221522","registration_date":"2022-12-21","expiry_date":"2028-12-20","formation_total_amount":"100.0","investment_character_code":"04","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"바이오","mother_fund_id":"","operator_company_id":"OP20190183","operator_company_name":"스닉픽인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"스닉픽인베스트먼트","investment_focus":["바이오","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.883Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1994: 신한-수인베스트먼트 청년창업 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20170014',
  '신한-수인베스트먼트 청년창업 투자조합',
  27500000000,
  '2017-12-26',
  '{"fund_id":"AS20170159","registration_date":"2017-12-26","expiry_date":"2025-12-25","formation_total_amount":"275.0","investment_character_code":"21","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20170014","operator_company_name":"수인베스트먼트캐피탈","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"수인베스트먼트캐피탈","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.883Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1995: 신한-수인베스트먼트 그린 위즈 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20170014',
  '신한-수인베스트먼트 그린 위즈 투자조합',
  40000000000,
  '2024-12-05',
  '{"fund_id":"AS20241271","registration_date":"2024-12-05","expiry_date":"2032-12-04","formation_total_amount":"400.0","investment_character_code":"05","industry_code":"4","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20170014","operator_company_name":"수인베스트먼트캐피탈","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"수인베스트먼트캐피탈","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.883Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1996: 신한-수 세컨더리 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20170014',
  '신한-수 세컨더리 투자조합',
  22550000000,
  '2023-11-27',
  '{"fund_id":"AS20231141","registration_date":"2023-11-27","expiry_date":"2029-11-26","formation_total_amount":"225.5","investment_character_code":"01","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20170014","operator_company_name":"수인베스트먼트캐피탈","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"수인베스트먼트캐피탈","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.883Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1997: 신한-마이다스동아 세컨더리 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20130001',
  '신한-마이다스동아 세컨더리 투자조합',
  10000000000,
  '2017-12-04',
  '{"fund_id":"AS20170147","registration_date":"2017-12-04","expiry_date":"2026-12-03","formation_total_amount":"100.0","investment_character_code":"16","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20130001","operator_company_name":"마이다스동아인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"마이다스동아인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.883Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1998: 신한-데브 헬스케어 투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20150002',
  '신한-데브 헬스케어 투자조합 1호',
  7500000000,
  '2022-02-09',
  '{"fund_id":"AS20220128","registration_date":"2022-02-09","expiry_date":"2027-02-08","formation_total_amount":"75.0","investment_character_code":"25","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20150002","operator_company_name":"데브시스터즈벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"데브시스터즈벤처스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.883Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1999: 신한-네오플럭스 에너지 신산업 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20000041',
  '신한-네오플럭스 에너지 신산업 투자조합',
  60000000000,
  '2017-12-22',
  '{"fund_id":"AS20180006","registration_date":"2017-12-22","expiry_date":"2025-12-21","formation_total_amount":"600.0","investment_character_code":"02","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20000041","operator_company_name":"신한벤처투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"신한벤처투자","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.883Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2000: 신한-네오 소재부품장비 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20000041',
  '신한-네오 소재부품장비 투자조합',
  19900000000,
  '2020-12-30',
  '{"fund_id":"AS20210009","registration_date":"2020-12-30","expiry_date":"2028-12-29","formation_total_amount":"199.0","investment_character_code":"03","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"부품소재","mother_fund_id":"MF00000001","operator_company_id":"OP20000041","operator_company_name":"신한벤처투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"신한벤처투자","investment_focus":["부품소재","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.883Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Minimal Batch 40 completed! 50 fund records processed.
-- Progress: 2000/3689 total records

