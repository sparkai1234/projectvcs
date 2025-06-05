-- VCS Fund MINIMAL UPSERT Batch 8/74 (Records 351-400)
-- MINIMAL: Only using basic columns that definitely exist
-- Generated from VCS API Scraper fund data
-- Generated at: 2025-06-05T00:40:21.659Z
-- Schema: Minimal fund_table structure (basic columns only)

-- MINIMAL FUND DATA (UPSERT - Safe for Duplicates)
-- Processing 50 fund records
-- Will INSERT new records or UPDATE existing ones

-- Record 351: 트리니티 4차산업 투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20220530',
  '트리니티 4차산업 투자조합 1호',
  2230000000,
  '2023-05-15',
  '{"fund_id":"AS20230385","registration_date":"2023-05-15","expiry_date":"2028-05-14","formation_total_amount":"22.3","investment_character_code":"20","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20220530","operator_company_name":"트리니티벤처파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"트리니티벤처파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.659Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 352: 트리거 하이테크 1호 조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20240099',
  '트리거 하이테크 1호 조합',
  2080000000,
  '2024-10-02',
  '{"fund_id":"AS20240931","registration_date":"2024-10-02","expiry_date":"2029-10-01","formation_total_amount":"20.8","investment_character_code":"25","industry_code":"1","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20240099","operator_company_name":"트리거투자파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"트리거투자파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.659Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 353: 트리거 파마테크 2호 조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20240099',
  '트리거 파마테크 2호 조합',
  4750000000,
  '2024-11-15',
  '{"fund_id":"AS20241141","registration_date":"2024-11-15","expiry_date":"2029-11-14","formation_total_amount":"47.5","investment_character_code":"25","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"일반 기타","mother_fund_id":"","operator_company_id":"OP20240099","operator_company_name":"트리거투자파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"트리거투자파트너스","investment_focus":["일반 기타","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.659Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 354: 트랜스링크프로젝트펀드I
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200513',
  '트랜스링크프로젝트펀드I',
  2050000000,
  '2021-06-21',
  '{"fund_id":"AS20210501","registration_date":"2021-06-21","expiry_date":"2026-06-20","formation_total_amount":"20.5","investment_character_code":"25","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20200513","operator_company_name":"트랜스링크인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"트랜스링크인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.659Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 355: 트랜스링크-DAY1투자조합V
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200513',
  '트랜스링크-DAY1투자조합V',
  12000000000,
  '2022-04-06',
  '{"fund_id":"AS20220394","registration_date":"2022-04-06","expiry_date":"2032-04-05","formation_total_amount":"120.0","investment_character_code":"20","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20200513","operator_company_name":"트랜스링크인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"트랜스링크인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.659Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 356: 트라이앵글스타트업투자조합2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210392',
  '트라이앵글스타트업투자조합2호',
  350000000,
  '2022-06-30',
  '{"fund_id":"AS20220668","registration_date":"2022-06-30","expiry_date":"2027-12-31","formation_total_amount":"3.5","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20210392","operator_company_name":"트라이앵글벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"트라이앵글벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.659Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 357: 트라이앵글 스타트업 투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210392',
  '트라이앵글 스타트업 투자조합1호',
  200000000,
  '2021-12-09',
  '{"fund_id":"AS20211240","registration_date":"2021-12-09","expiry_date":"2026-12-31","formation_total_amount":"2.0","investment_character_code":"","industry_code":"6","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20210392","operator_company_name":"트라이앵글벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"트라이앵글벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.659Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 358: 트라이앵글 3호 K뷰티디바이스투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20220738',
  '트라이앵글 3호 K뷰티디바이스투자조합',
  2000000000,
  '2024-11-20',
  '{"fund_id":"AS20241178","registration_date":"2024-11-20","expiry_date":"2029-11-19","formation_total_amount":"20.0","investment_character_code":"25","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"일반 기타","mother_fund_id":"","operator_company_id":"OP20220738","operator_company_name":"트라이앵글파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"트라이앵글파트너스","investment_focus":["일반 기타","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.659Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 359: 트라이앵글 2호 유니콘 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20220738',
  '트라이앵글 2호 유니콘 투자조합',
  7270000000,
  '2024-05-14',
  '{"fund_id":"AS20240417","registration_date":"2024-05-14","expiry_date":"2029-05-13","formation_total_amount":"72.7","investment_character_code":"25","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20220738","operator_company_name":"트라이앵글파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"트라이앵글파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.659Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 360: 투잇 프로젝트펀드 1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20080018',
  '투잇 프로젝트펀드 1호',
  110000000,
  '2024-10-18',
  '{"fund_id":"AS20240991","registration_date":"2024-10-18","expiry_date":"2029-10-16","formation_total_amount":"1.1","investment_character_code":"","industry_code":"3","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20080018","operator_company_name":"투잇인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"투잇인베스트먼트","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.659Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 361: 투잇 벤처펀드 3호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20080018',
  '투잇 벤처펀드 3호',
  420000000,
  '2023-08-02',
  '{"fund_id":"AS20230631","registration_date":"2023-08-02","expiry_date":"2028-07-24","formation_total_amount":"4.2","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20080018","operator_company_name":"투잇인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"투잇인베스트먼트","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.659Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 362: 투잇 개인투자조합 2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20080018',
  '투잇 개인투자조합 2호',
  110000000,
  '2023-05-24',
  '{"fund_id":"AS20230390","registration_date":"2023-05-24","expiry_date":"2028-05-16","formation_total_amount":"1.1","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20080018","operator_company_name":"투잇인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"투잇인베스트먼트","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.659Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 363: 투잇 개인투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20080018',
  '투잇 개인투자조합 1호',
  150000000,
  '2023-04-11',
  '{"fund_id":"AS20230254","registration_date":"2023-04-11","expiry_date":"2028-04-04","formation_total_amount":"1.5","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20080018","operator_company_name":"투잇인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"투잇인베스트먼트","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.659Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 364: 테일 스타트업 투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210161',
  '테일 스타트업 투자조합1호',
  5000000000,
  '2021-09-14',
  '{"fund_id":"AS20210858","registration_date":"2021-09-14","expiry_date":"2027-09-13","formation_total_amount":"50.0","investment_character_code":"02","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20210161","operator_company_name":"테일벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"테일벤처스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.659Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 365: 테이플log+스타트업투자조합5호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210452',
  '테이플log+스타트업투자조합5호',
  430000000,
  '2024-07-25',
  '{"fund_id":"AS20240666","registration_date":"2024-07-25","expiry_date":"2029-07-31","formation_total_amount":"4.3","investment_character_code":"","industry_code":"6","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20210452","operator_company_name":"(주)페이서파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"(주)페이서파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.659Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 366: 탭(TAP)스타트업투자조합제20호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190269',
  '탭(TAP)스타트업투자조합제20호',
  110000000,
  '2025-02-25',
  '{"fund_id":"AS20250135","registration_date":"2025-02-25","expiry_date":"2030-02-24","formation_total_amount":"1.1","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190269","operator_company_name":"탭엔젤파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"탭엔젤파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.659Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 367: 탭-디에이 벤처투자조합 제2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190269',
  '탭-디에이 벤처투자조합 제2호',
  2520000000,
  '2022-05-11',
  '{"fund_id":"AS20220524","registration_date":"2022-05-11","expiry_date":"2027-05-10","formation_total_amount":"25.2","investment_character_code":"20","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20190269","operator_company_name":"탭엔젤파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"탭엔젤파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.659Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 368: 탭-디에이 벤처투자조합 제1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190269',
  '탭-디에이 벤처투자조합 제1호',
  3110000000,
  '2021-10-01',
  '{"fund_id":"AS20210954","registration_date":"2021-10-01","expiry_date":"2026-09-30","formation_total_amount":"31.1","investment_character_code":"20","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20190269","operator_company_name":"탭엔젤파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"탭엔젤파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.659Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 369: 탭 스타트업 투자조합 제9호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190269',
  '탭 스타트업 투자조합 제9호',
  260000000,
  '2022-10-27',
  '{"fund_id":"AS20221201","registration_date":"2022-10-27","expiry_date":"2027-10-26","formation_total_amount":"2.6","investment_character_code":"","industry_code":"4","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190269","operator_company_name":"탭엔젤파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"탭엔젤파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.659Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 370: 탭 스타트업 투자조합 제8호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190269',
  '탭 스타트업 투자조합 제8호',
  100000000,
  '2022-07-29',
  '{"fund_id":"AS20220845","registration_date":"2022-07-29","expiry_date":"2027-07-28","formation_total_amount":"1.0","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190269","operator_company_name":"탭엔젤파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"탭엔젤파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.659Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 371: 탭 스타트업 투자조합 제7호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190269',
  '탭 스타트업 투자조합 제7호',
  370000000,
  '2022-07-25',
  '{"fund_id":"AS20220829","registration_date":"2022-07-25","expiry_date":"2027-07-24","formation_total_amount":"3.7","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190269","operator_company_name":"탭엔젤파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"탭엔젤파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.659Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 372: 탭 스타트업 투자조합 제5호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190269',
  '탭 스타트업 투자조합 제5호',
  260000000,
  '2021-02-04',
  '{"fund_id":"AS20210081","registration_date":"2021-02-04","expiry_date":"2026-02-03","formation_total_amount":"2.6","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190269","operator_company_name":"탭엔젤파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"탭엔젤파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.659Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 373: 탭 스타트업 투자조합 제19호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190269',
  '탭 스타트업 투자조합 제19호',
  100000000,
  '2024-05-23',
  '{"fund_id":"AS20240434","registration_date":"2024-05-23","expiry_date":"2029-05-21","formation_total_amount":"1.0","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190269","operator_company_name":"탭엔젤파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"탭엔젤파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.659Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 374: 탭 스타트업 투자조합 제18호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190269',
  '탭 스타트업 투자조합 제18호',
  220000000,
  '2024-05-23',
  '{"fund_id":"AS20240433","registration_date":"2024-05-23","expiry_date":"2029-05-21","formation_total_amount":"2.2","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190269","operator_company_name":"탭엔젤파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"탭엔젤파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.659Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 375: 탭 스타트업 투자조합 제17호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190269',
  '탭 스타트업 투자조합 제17호',
  590000000,
  '2023-12-19',
  '{"fund_id":"AS20231261","registration_date":"2023-12-19","expiry_date":"2028-12-18","formation_total_amount":"5.9","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190269","operator_company_name":"탭엔젤파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"탭엔젤파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.659Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 376: 탭 스타트업 투자조합 제16호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190269',
  '탭 스타트업 투자조합 제16호',
  140000000,
  '2024-02-13',
  '{"fund_id":"AS20240077","registration_date":"2024-02-13","expiry_date":"2029-02-12","formation_total_amount":"1.4","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190269","operator_company_name":"탭엔젤파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"탭엔젤파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.659Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 377: 탭 스타트업 투자조합 제15호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190269',
  '탭 스타트업 투자조합 제15호',
  100000000,
  '2023-09-25',
  '{"fund_id":"AS20230836","registration_date":"2023-09-25","expiry_date":"2028-09-24","formation_total_amount":"1.0","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190269","operator_company_name":"탭엔젤파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"탭엔젤파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.659Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 378: 탭 스타트업 투자조합 제14호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190269',
  '탭 스타트업 투자조합 제14호',
  140000000,
  '2023-09-08',
  '{"fund_id":"AS20230789","registration_date":"2023-09-08","expiry_date":"2028-09-07","formation_total_amount":"1.4","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190269","operator_company_name":"탭엔젤파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"탭엔젤파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.659Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 379: 탭 스타트업 투자조합 제13호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190269',
  '탭 스타트업 투자조합 제13호',
  210000000,
  '2023-08-22',
  '{"fund_id":"AS20230697","registration_date":"2023-08-22","expiry_date":"2028-08-21","formation_total_amount":"2.1","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190269","operator_company_name":"탭엔젤파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"탭엔젤파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.659Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 380: 탭 스타트업 투자조합 제11호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190269',
  '탭 스타트업 투자조합 제11호',
  190000000,
  '2023-01-02',
  '{"fund_id":"AS20230009","registration_date":"2023-01-02","expiry_date":"2028-01-01","formation_total_amount":"1.9","investment_character_code":"","industry_code":"6","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190269","operator_company_name":"탭엔젤파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"탭엔젤파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.659Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 381: 탭 스타트업 투자조합 제10호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190269',
  '탭 스타트업 투자조합 제10호',
  180000000,
  '2022-12-28',
  '{"fund_id":"AS20221541","registration_date":"2022-12-28","expiry_date":"2027-12-27","formation_total_amount":"1.8","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190269","operator_company_name":"탭엔젤파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"탭엔젤파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.660Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 382: 탭 스케일업(TAP Scale-up) 투자조합 제3호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190269',
  '탭 스케일업(TAP Scale-up) 투자조합 제3호',
  120000000,
  '2022-04-18',
  '{"fund_id":"AS20220368","registration_date":"2022-04-18","expiry_date":"2027-04-17","formation_total_amount":"1.2","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190269","operator_company_name":"탭엔젤파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"탭엔젤파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.660Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 383: 탭 바이오(TAP BIO) 투자조합 제8호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190269',
  '탭 바이오(TAP BIO) 투자조합 제8호',
  550000000,
  '2022-02-08',
  '{"fund_id":"AS20220104","registration_date":"2022-02-08","expiry_date":"2027-02-07","formation_total_amount":"5.5","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190269","operator_company_name":"탭엔젤파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"탭엔젤파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.660Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 384: 탭 바이오 투자조합 제9호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190269',
  '탭 바이오 투자조합 제9호',
  870000000,
  '2022-12-21',
  '{"fund_id":"AS20221511","registration_date":"2022-12-21","expiry_date":"2027-12-20","formation_total_amount":"8.7","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190269","operator_company_name":"탭엔젤파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"탭엔젤파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.660Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 385: 탭 바이오 투자조합 제2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190269',
  '탭 바이오 투자조합 제2호',
  100000000,
  '2020-11-05',
  '{"fund_id":"AS20200630","registration_date":"2020-11-05","expiry_date":"2025-11-04","formation_total_amount":"1.0","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190269","operator_company_name":"탭엔젤파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"탭엔젤파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.660Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 386: 탭 바이오 투자조합 제10호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190269',
  '탭 바이오 투자조합 제10호',
  210000000,
  '2022-12-20',
  '{"fund_id":"AS20221408","registration_date":"2022-12-20","expiry_date":"2027-12-19","formation_total_amount":"2.1","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190269","operator_company_name":"탭엔젤파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"탭엔젤파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.660Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 387: 타임웍스 중년창업 벤처펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210321',
  '타임웍스 중년창업 벤처펀드',
  31000000000,
  '2024-07-09',
  '{"fund_id":"AS20240629","registration_date":"2024-07-09","expiry_date":"2032-07-08","formation_total_amount":"310.0","investment_character_code":"01","industry_code":"1","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20210321","operator_company_name":"타임웍스인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"타임웍스인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.660Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 388: 타임웍스 원더스 스타트업 벤처펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210321',
  '타임웍스 원더스 스타트업 벤처펀드',
  27000000000,
  '2022-12-16',
  '{"fund_id":"AS20221497","registration_date":"2022-12-16","expiry_date":"2030-12-15","formation_total_amount":"270.0","investment_character_code":"02","industry_code":"1","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20210321","operator_company_name":"타임웍스인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"타임웍스인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.660Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 389: 타임웍스 원더스 레볼루션 3호 펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210321',
  '타임웍스 원더스 레볼루션 3호 펀드',
  2300000000,
  '2025-02-13',
  '{"fund_id":"AS20250109","registration_date":"2025-02-13","expiry_date":"2030-02-12","formation_total_amount":"23.0","investment_character_code":"16","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20210321","operator_company_name":"타임웍스인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"타임웍스인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.660Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 390: 타임웍스 원더스 레볼루션 2호 펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210321',
  '타임웍스 원더스 레볼루션 2호 펀드',
  2300000000,
  '2024-07-30',
  '{"fund_id":"AS20240709","registration_date":"2024-07-30","expiry_date":"2029-07-29","formation_total_amount":"23.0","investment_character_code":"16","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20210321","operator_company_name":"타임웍스인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"타임웍스인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.660Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 391: 타임웍스 원더스 레볼루션 1호 펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210321',
  '타임웍스 원더스 레볼루션 1호 펀드',
  2300000000,
  '2022-09-27',
  '{"fund_id":"AS20221119","registration_date":"2022-09-27","expiry_date":"2027-09-26","formation_total_amount":"23.0","investment_character_code":"16","industry_code":"4","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20210321","operator_company_name":"타임웍스인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"타임웍스인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.660Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 392: 타임웍스 원더스 뉴딜 벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210321',
  '타임웍스 원더스 뉴딜 벤처투자조합',
  25000000000,
  '2022-01-03',
  '{"fund_id":"AS20220010","registration_date":"2022-01-03","expiry_date":"2030-01-02","formation_total_amount":"250.0","investment_character_code":"03","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20210321","operator_company_name":"타임웍스인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"타임웍스인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.660Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 393: 타임와이즈글로벌콘텐츠투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20000044',
  '타임와이즈글로벌콘텐츠투자조합',
  18600000000,
  '2020-08-05',
  '{"fund_id":"AS20200404","registration_date":"2020-08-05","expiry_date":"2027-08-04","formation_total_amount":"186.0","investment_character_code":"24","industry_code":"6","investment_field_type":"문화","investment_field_detail_type":"문화 기타","mother_fund_id":"MF00000001","operator_company_id":"OP20000044","operator_company_name":"씨제이인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"씨제이인베스트먼트","investment_focus":["문화 기타","문화"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.660Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 394: 타이거 퍼스트 벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210504',
  '타이거 퍼스트 벤처투자조합',
  10500000000,
  '2021-11-03',
  '{"fund_id":"AS20211077","registration_date":"2021-11-03","expiry_date":"2026-11-02","formation_total_amount":"105.0","investment_character_code":"02","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20210504","operator_company_name":"타이거자산운용투자일임","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"타이거자산운용투자일임","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.660Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 395: 타이거 드림메이커 벤처투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210504',
  '타이거 드림메이커 벤처투자조합 1호',
  2000000000,
  '2022-04-04',
  '{"fund_id":"AS20220377","registration_date":"2022-04-04","expiry_date":"2027-04-03","formation_total_amount":"20.0","investment_character_code":"02","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20210504","operator_company_name":"타이거자산운용투자일임","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"타이거자산운용투자일임","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.660Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 396: 킹슬리Taurus 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20160025',
  '킹슬리Taurus 개인투자조합',
  200000000,
  '2021-01-12',
  '{"fund_id":"AS20210041","registration_date":"2021-01-12","expiry_date":"2026-01-11","formation_total_amount":"2.0","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20160025","operator_company_name":"킹슬리벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"킹슬리벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.660Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 397: 킹슬리 엔젤3호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20160025',
  '킹슬리 엔젤3호 개인투자조합',
  6000000000,
  '2021-09-27',
  '{"fund_id":"AS20210882","registration_date":"2021-09-27","expiry_date":"2028-09-26","formation_total_amount":"60.0","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"MF00000001","operator_company_id":"OP20160025","operator_company_name":"킹슬리벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"킹슬리벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.660Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 398: 킹슬리 엔젤2호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20160025',
  '킹슬리 엔젤2호 개인투자조합',
  5800000000,
  '2019-09-05',
  '{"fund_id":"AS20190382","registration_date":"2019-09-05","expiry_date":"2026-09-04","formation_total_amount":"58.0","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"MF00000008","operator_company_id":"OP20160025","operator_company_name":"킹슬리벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"킹슬리벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.660Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 399: 킹슬리 스타트업 6호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20160025',
  '킹슬리 스타트업 6호 개인투자조합',
  100000000,
  '2018-12-10',
  '{"fund_id":"AS20180621","registration_date":"2018-12-10","expiry_date":"2025-12-09","formation_total_amount":"1.0","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20160025","operator_company_name":"킹슬리벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"킹슬리벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.660Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 400: 킹슬리 스타트업 4호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20160025',
  '킹슬리 스타트업 4호 개인투자조합',
  180000000,
  '2018-09-12',
  '{"fund_id":"AS20180278","registration_date":"2018-09-12","expiry_date":"2025-09-11","formation_total_amount":"1.8","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20160025","operator_company_name":"킹슬리벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"킹슬리벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.660Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Minimal Batch 8 completed! 50 fund records processed.
-- Progress: 400/3689 total records

