-- VCS Fund MINIMAL UPSERT Batch 48/74 (Records 2351-2400)
-- MINIMAL: Only using basic columns that definitely exist
-- Generated from VCS API Scraper fund data
-- Generated at: 2025-06-05T00:40:21.919Z
-- Schema: Minimal fund_table structure (basic columns only)

-- MINIMAL FUND DATA (UPSERT - Safe for Duplicates)
-- Processing 50 fund records
-- Will INSERT new records or UPDATE existing ones

-- Record 2351: 세르파개인투자조합2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20170044',
  '세르파개인투자조합2호',
  1000000000,
  '2022-05-11',
  '{"fund_id":"AS20220462","registration_date":"2022-05-11","expiry_date":"2027-05-31","formation_total_amount":"10.0","investment_character_code":"","industry_code":"4","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20170044","operator_company_name":"한국바이오투자파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"한국바이오투자파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.919Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2352: 세르파개인투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20170044',
  '세르파개인투자조합1호',
  400000000,
  '2020-10-07',
  '{"fund_id":"AS20200558","registration_date":"2020-10-07","expiry_date":"2025-10-06","formation_total_amount":"4.0","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20170044","operator_company_name":"한국바이오투자파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"한국바이오투자파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.919Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2353: 세르파 개인투자조합 5호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20170044',
  '세르파 개인투자조합 5호',
  1000000000,
  '2024-06-03',
  '{"fund_id":"AS20240479","registration_date":"2024-06-03","expiry_date":"2029-06-30","formation_total_amount":"10.0","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20170044","operator_company_name":"한국바이오투자파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"한국바이오투자파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.919Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2354: 성장사다리비엔에이치스타트업투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20150015',
  '성장사다리비엔에이치스타트업투자조합',
  21400000000,
  '2014-01-08',
  '{"fund_id":"AS20140070","registration_date":"2014-01-08","expiry_date":"2026-01-07","formation_total_amount":"214.0","investment_character_code":"20","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20150015","operator_company_name":"비엔에이치인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"비엔에이치인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.919Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2355: 성장금융-2018KIF 서울 4차산업혁명 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20080006',
  '성장금융-2018KIF 서울 4차산업혁명 투자조합',
  50000000000,
  '2019-06-12',
  '{"fund_id":"AS20190249","registration_date":"2019-06-12","expiry_date":"2027-06-11","formation_total_amount":"500.0","investment_character_code":"02","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20080006","operator_company_name":"캡스톤파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"캡스톤파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.919Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2356: 성동임팩트 벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20110015',
  '성동임팩트 벤처투자조합',
  2000000000,
  '2020-12-22',
  '{"fund_id":"AS20200824","registration_date":"2020-12-22","expiry_date":"2028-12-21","formation_total_amount":"20.0","investment_character_code":"23","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20110015","operator_company_name":"엠와이소셜컴퍼니","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"엠와이소셜컴퍼니","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.919Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2357: 성동 ESG 임팩트 펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20110015',
  '성동 ESG 임팩트 펀드',
  3000000000,
  '2022-12-15',
  '{"fund_id":"AS20221482","registration_date":"2022-12-15","expiry_date":"2029-12-14","formation_total_amount":"30.0","investment_character_code":"20","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20110015","operator_company_name":"엠와이소셜컴퍼니","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"엠와이소셜컴퍼니","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.919Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2358: 선보코어밸류 개인투자조합5호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20160030',
  '선보코어밸류 개인투자조합5호',
  500000000,
  '2021-04-05',
  '{"fund_id":"AS20210248","registration_date":"2021-04-05","expiry_date":"2026-04-04","formation_total_amount":"5.0","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20160030","operator_company_name":"선보엔젤파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"선보엔젤파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.919Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2359: 선보엔젤 오픈이노베이션 펀드1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20160030',
  '선보엔젤 오픈이노베이션 펀드1호',
  10000000000,
  '2019-08-29',
  '{"fund_id":"AS20190387","registration_date":"2019-08-29","expiry_date":"2026-08-28","formation_total_amount":"100.0","investment_character_code":"","industry_code":"1","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"MF00000008","operator_company_id":"OP20160030","operator_company_name":"선보엔젤파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"선보엔젤파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.919Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2360: 선보엔젤 오픈이노베이션 지역혁신펀드 2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20160030',
  '선보엔젤 오픈이노베이션 지역혁신펀드 2호',
  25000000000,
  '2022-10-31',
  '{"fund_id":"AS20221238","registration_date":"2022-10-31","expiry_date":"2030-10-30","formation_total_amount":"250.0","investment_character_code":"20","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000015","operator_company_id":"OP20160030","operator_company_name":"선보엔젤파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"선보엔젤파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.919Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2361: 선보엔젤 오픈이노베이션 지역엔젤펀드 3호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20160030',
  '선보엔젤 오픈이노베이션 지역엔젤펀드 3호',
  6000000000,
  '2024-02-16',
  '{"fund_id":"AS20240098","registration_date":"2024-02-16","expiry_date":"2032-02-14","formation_total_amount":"60.0","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"MF00000021","operator_company_id":"OP20160030","operator_company_name":"선보엔젤파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"선보엔젤파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.919Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2362: 선보 코어밸류 개인투자조합 8호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20160030',
  '선보 코어밸류 개인투자조합 8호',
  210000000,
  '2024-07-29',
  '{"fund_id":"AS20240693","registration_date":"2024-07-29","expiry_date":"2029-07-25","formation_total_amount":"2.1","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20160030","operator_company_name":"선보엔젤파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"선보엔젤파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.919Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2363: 선보 코어밸류 개인투자조합 7호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20160030',
  '선보 코어밸류 개인투자조합 7호',
  420000000,
  '2022-03-07',
  '{"fund_id":"AS20220213","registration_date":"2022-03-07","expiry_date":"2027-03-02","formation_total_amount":"4.2","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20160030","operator_company_name":"선보엔젤파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"선보엔젤파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.919Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2364: 선보 코어밸류 개인투자조합 6호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20160030',
  '선보 코어밸류 개인투자조합 6호',
  1100000000,
  '2021-12-28',
  '{"fund_id":"AS20211426","registration_date":"2021-12-28","expiry_date":"2026-12-27","formation_total_amount":"11.0","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20160030","operator_company_name":"선보엔젤파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"선보엔젤파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.919Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2365: 선보 코어밸류 개인투자조합 4호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20160030',
  '선보 코어밸류 개인투자조합 4호',
  210000000,
  '2020-12-22',
  '{"fund_id":"AS20200810","registration_date":"2020-12-22","expiry_date":"2025-12-21","formation_total_amount":"2.1","investment_character_code":"","industry_code":"4","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20160030","operator_company_name":"선보엔젤파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"선보엔젤파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.919Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2366: 선보 코어밸류 개인투자조합 3호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20160030',
  '선보 코어밸류 개인투자조합 3호',
  250000000,
  '2020-11-23',
  '{"fund_id":"AS20200668","registration_date":"2020-11-23","expiry_date":"2025-11-22","formation_total_amount":"2.5","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20160030","operator_company_name":"선보엔젤파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"선보엔젤파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.919Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2367: 선보 코어밸류 개인투자조합 2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20160030',
  '선보 코어밸류 개인투자조합 2호',
  300000000,
  '2020-11-05',
  '{"fund_id":"AS20200615","registration_date":"2020-11-05","expiry_date":"2025-11-04","formation_total_amount":"3.0","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20160030","operator_company_name":"선보엔젤파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"선보엔젤파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.919Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2368: 선보 코어밸류 개인투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20160030',
  '선보 코어밸류 개인투자조합 1호',
  430000000,
  '2020-08-10',
  '{"fund_id":"AS20200385","registration_date":"2020-08-10","expiry_date":"2025-08-09","formation_total_amount":"4.3","investment_character_code":"","industry_code":"1","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20160030","operator_company_name":"선보엔젤파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"선보엔젤파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.919Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2369: 서울투자해양신산업벤처펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20100003',
  '서울투자해양신산업벤처펀드',
  21600000000,
  '2024-06-25',
  '{"fund_id":"AS20240566","registration_date":"2024-06-25","expiry_date":"2032-06-24","formation_total_amount":"216.0","investment_character_code":"31","industry_code":"9","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20100003","operator_company_name":"서울투자파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"서울투자파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.919Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2370: 서울투자지역혁신벤처펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20100003',
  '서울투자지역혁신벤처펀드',
  19400000000,
  '2024-04-29',
  '{"fund_id":"AS20240367","registration_date":"2024-04-29","expiry_date":"2032-04-28","formation_total_amount":"194.0","investment_character_code":"18","industry_code":"4","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000019","operator_company_id":"OP20100003","operator_company_name":"서울투자파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"서울투자파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.919Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2371: 서울투자스마트지역뉴딜펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20100003',
  '서울투자스마트지역뉴딜펀드',
  30000000000,
  '2022-09-08',
  '{"fund_id":"AS20221046","registration_date":"2022-09-08","expiry_date":"2030-09-07","formation_total_amount":"300.0","investment_character_code":"18","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20100003","operator_company_name":"서울투자파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"서울투자파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.919Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2372: 서울투자 혁신모험 벤처조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20100003',
  '서울투자 혁신모험 벤처조합',
  34000000000,
  '2019-10-24',
  '{"fund_id":"AS20190485","registration_date":"2019-10-24","expiry_date":"2027-10-23","formation_total_amount":"340.0","investment_character_code":"20","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20100003","operator_company_name":"서울투자파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"서울투자파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.919Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2373: 서울투자 창조경제 혁신펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20100003',
  '서울투자 창조경제 혁신펀드',
  33500000000,
  '2015-07-08',
  '{"fund_id":"AS20150008","registration_date":"2015-07-08","expiry_date":"2025-07-07","formation_total_amount":"335.0","investment_character_code":"18","industry_code":"4","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20100003","operator_company_name":"서울투자파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"서울투자파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.919Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2374: 서울투자 성장산업 벤처조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20100003',
  '서울투자 성장산업 벤처조합',
  50000000000,
  '2017-07-03',
  '{"fund_id":"AS20170074","registration_date":"2017-07-03","expiry_date":"2025-07-02","formation_total_amount":"500.0","investment_character_code":"01","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20100003","operator_company_name":"서울투자파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"서울투자파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.919Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2375: 서울창경베터 핀테크 투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210382',
  '서울창경베터 핀테크 투자조합 1호',
  380000000,
  '2025-01-20',
  '{"fund_id":"AS20250039","registration_date":"2025-01-20","expiry_date":"2030-01-19","formation_total_amount":"3.8","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20210382","operator_company_name":"베터그라운드","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"베터그라운드","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.919Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2376: 서울창경-킹고 개인투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190134',
  '서울창경-킹고 개인투자조합 1호',
  390000000,
  '2025-02-14',
  '{"fund_id":"AS20250092","registration_date":"2025-02-14","expiry_date":"2032-02-13","formation_total_amount":"3.9","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190134","operator_company_name":"킹고스프링","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"킹고스프링","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.919Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2377: 서울시립대-엔슬 개인투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20160031',
  '서울시립대-엔슬 개인투자조합 1호',
  1000000000,
  '2024-12-12',
  '{"fund_id":"AS20241267","registration_date":"2024-12-12","expiry_date":"2031-12-09","formation_total_amount":"10.0","investment_character_code":"","industry_code":"1","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20160031","operator_company_name":"엔슬파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"엔슬파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.919Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2378: 서울랩-업스케일 투자조합2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210719',
  '서울랩-업스케일 투자조합2호',
  160000000,
  '2025-03-25',
  '{"fund_id":"AS20250187","registration_date":"2025-03-25","expiry_date":"2030-03-24","formation_total_amount":"1.6","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20210719","operator_company_name":"서울랩파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"서울랩파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.919Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2379: 서울랩-업스케일 투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210719',
  '서울랩-업스케일 투자조합1호',
  110000000,
  '2023-11-20',
  '{"fund_id":"AS20231063","registration_date":"2023-11-20","expiry_date":"2028-11-19","formation_total_amount":"1.1","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20210719","operator_company_name":"서울랩파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"서울랩파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.919Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2380: 서울랩-블리스바인 투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210212',
  '서울랩-블리스바인 투자조합1호',
  230000000,
  '2022-10-07',
  '{"fund_id":"AS20221122","registration_date":"2022-10-07","expiry_date":"2027-10-06","formation_total_amount":"2.3","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20210212","operator_company_name":"블리스바인벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"블리스바인벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.919Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2381: 서울대 STH 핀테크혁신 벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20080014',
  '서울대 STH 핀테크혁신 벤처투자조합',
  19000000000,
  '2021-09-28',
  '{"fund_id":"AS20210906","registration_date":"2021-09-28","expiry_date":"2028-09-27","formation_total_amount":"190.0","investment_character_code":"02","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20080014","operator_company_name":"서울대학교기술지주","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"서울대학교기술지주","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.919Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2382: 서울대 STH 창업초기 벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20080014',
  '서울대 STH 창업초기 벤처투자조합',
  10100000000,
  '2021-12-03',
  '{"fund_id":"AS20211224","registration_date":"2021-12-03","expiry_date":"2028-12-02","formation_total_amount":"101.0","investment_character_code":"20","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20080014","operator_company_name":"서울대학교기술지주","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"서울대학교기술지주","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.919Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2383: 서울대 STH 제6호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20080014',
  '서울대 STH 제6호 개인투자조합',
  5550000000,
  '2022-12-29',
  '{"fund_id":"AS20221543","registration_date":"2022-12-29","expiry_date":"2029-12-28","formation_total_amount":"55.5","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"MF00000001","operator_company_id":"OP20080014","operator_company_name":"서울대학교기술지주","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"서울대학교기술지주","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.919Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2384: 서울대 STH 제3호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20080014',
  '서울대 STH 제3호 개인투자조합',
  13400000000,
  '2018-11-29',
  '{"fund_id":"AS20180354","registration_date":"2018-11-29","expiry_date":"2025-11-28","formation_total_amount":"134.0","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"MF00000008","operator_company_id":"OP20080014","operator_company_name":"서울대학교기술지주","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"서울대학교기술지주","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.919Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2385: 서울대 STH 제2호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20080014',
  '서울대 STH 제2호 개인투자조합',
  4000000000,
  '2018-08-16',
  '{"fund_id":"AS20180193","registration_date":"2018-08-16","expiry_date":"2028-08-15","formation_total_amount":"40.0","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"MF00000001","operator_company_id":"OP20080014","operator_company_name":"서울대학교기술지주","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"서울대학교기술지주","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.919Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2386: 서울대 STH 제1호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20080014',
  '서울대 STH 제1호 개인투자조합',
  6000000000,
  '2017-08-29',
  '{"fund_id":"AS20170084","registration_date":"2017-08-29","expiry_date":"2027-08-28","formation_total_amount":"60.0","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"MF00000001","operator_company_id":"OP20080014","operator_company_name":"서울대학교기술지주","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"서울대학교기술지주","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.919Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2387: 서울대 STH 브라이토닉스 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20080014',
  '서울대 STH 브라이토닉스 개인투자조합',
  310000000,
  '2018-09-13',
  '{"fund_id":"AS20180283","registration_date":"2018-09-13","expiry_date":"2026-12-31","formation_total_amount":"3.1","investment_character_code":"","industry_code":"3","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20080014","operator_company_name":"서울대학교기술지주","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"서울대학교기술지주","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.919Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2388: 서울대 STH 기술사업화 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20080014',
  '서울대 STH 기술사업화 개인투자조합',
  9000000000,
  '2019-09-18',
  '{"fund_id":"AS20190409","registration_date":"2019-09-18","expiry_date":"2026-09-17","formation_total_amount":"90.0","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"MF00000001","operator_company_id":"OP20080014","operator_company_name":"서울대학교기술지주","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"서울대학교기술지주","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.919Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2389: 서울대 STH 관악S밸리 벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20080014',
  '서울대 STH 관악S밸리 벤처투자조합',
  11650000000,
  '2023-11-20',
  '{"fund_id":"AS20231110","registration_date":"2023-11-20","expiry_date":"2031-11-19","formation_total_amount":"116.5","investment_character_code":"09","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20080014","operator_company_name":"서울대학교기술지주","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"서울대학교기술지주","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.919Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2390: 서울대 STH IP창업 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20080014',
  '서울대 STH IP창업 개인투자조합',
  5550000000,
  '2023-01-30',
  '{"fund_id":"AS20221544","registration_date":"2023-01-30","expiry_date":"2030-01-29","formation_total_amount":"55.5","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"MF00000001","operator_company_id":"OP20080014","operator_company_name":"서울대학교기술지주","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"서울대학교기술지주","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.919Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2391: 서울대 STH IP 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20080014',
  '서울대 STH IP 개인투자조합',
  9000000000,
  '2020-08-10',
  '{"fund_id":"AS20200389","registration_date":"2020-08-10","expiry_date":"2027-08-09","formation_total_amount":"90.0","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"MF00000001","operator_company_id":"OP20080014","operator_company_name":"서울대학교기술지주","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"서울대학교기술지주","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.919Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2392: 서울 캠퍼스타운 대학창업 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190065',
  '서울 캠퍼스타운 대학창업 개인투자조합',
  600000000,
  '2024-10-22',
  '{"fund_id":"AS20240942","registration_date":"2024-10-22","expiry_date":"2029-10-21","formation_total_amount":"6.0","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190065","operator_company_name":"국민대학교기술지주","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"국민대학교기술지주","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.919Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2393: 새한벤처펀드4호(SHVF-4)
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19890003',
  '새한벤처펀드4호(SHVF-4)',
  39600000000,
  '2016-11-30',
  '{"fund_id":"AS20160210","registration_date":"2016-11-30","expiry_date":"2025-11-29","formation_total_amount":"396.0","investment_character_code":"01","industry_code":"9","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP19890003","operator_company_name":"새한창업투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"새한창업투자","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.919Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2394: 새한벤처펀드18호(SHVF-18)
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19890003',
  '새한벤처펀드18호(SHVF-18)',
  14780000000,
  '2021-09-06',
  '{"fund_id":"AS20210817","registration_date":"2021-09-06","expiry_date":"2026-09-05","formation_total_amount":"147.8","investment_character_code":"06","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP19890003","operator_company_name":"새한창업투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"새한창업투자","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.919Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2395: 새한벤처펀드 9호(SHVF-9)
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19890003',
  '새한벤처펀드 9호(SHVF-9)',
  2700000000,
  '2020-07-16',
  '{"fund_id":"AS20200332","registration_date":"2020-07-16","expiry_date":"2025-07-15","formation_total_amount":"27.0","investment_character_code":"01","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP19890003","operator_company_name":"새한창업투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"새한창업투자","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.919Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2396: 새한벤처펀드 7호(SHVF-7)
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19890003',
  '새한벤처펀드 7호(SHVF-7)',
  10100000000,
  '2020-02-24',
  '{"fund_id":"AS20200086","registration_date":"2020-02-24","expiry_date":"2028-02-23","formation_total_amount":"101.0","investment_character_code":"01","industry_code":"9","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP19890003","operator_company_name":"새한창업투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"새한창업투자","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.919Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2397: 새한벤처펀드 6호(SHVF-6)
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19890003',
  '새한벤처펀드 6호(SHVF-6)',
  19500000000,
  '2019-12-30',
  '{"fund_id":"AS20200003","registration_date":"2019-12-30","expiry_date":"2026-12-29","formation_total_amount":"195.0","investment_character_code":"01","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP19890003","operator_company_name":"새한창업투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"새한창업투자","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.919Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2398: 새한벤처펀드 5호(SHVF-5)
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19890003',
  '새한벤처펀드 5호(SHVF-5)',
  16100000000,
  '2019-06-27',
  '{"fund_id":"AS20190261","registration_date":"2019-06-27","expiry_date":"2026-06-26","formation_total_amount":"161.0","investment_character_code":"01","industry_code":"7","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP19890003","operator_company_name":"새한창업투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"새한창업투자","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.919Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2399: 새한벤처펀드 3호(SHVF-3)
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19890003',
  '새한벤처펀드 3호(SHVF-3)',
  2000000000,
  '2016-06-03',
  '{"fund_id":"AS20160002","registration_date":"2016-06-03","expiry_date":"2026-06-02","formation_total_amount":"20.0","investment_character_code":"01","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP19890003","operator_company_name":"새한창업투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"새한창업투자","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.920Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2400: 새한벤처펀드 22호(SHVF-22)
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19890003',
  '새한벤처펀드 22호(SHVF-22)',
  20100000000,
  '2022-08-31',
  '{"fund_id":"AS20221002","registration_date":"2022-08-31","expiry_date":"2027-08-30","formation_total_amount":"201.0","investment_character_code":"25","industry_code":"6","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP19890003","operator_company_name":"새한창업투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"새한창업투자","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.920Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Minimal Batch 48 completed! 50 fund records processed.
-- Progress: 2400/3689 total records

