-- VCS Fund MINIMAL UPSERT Batch 58/74 (Records 2851-2900)
-- MINIMAL: Only using basic columns that definitely exist
-- Generated from VCS API Scraper fund data
-- Generated at: 2025-06-05T00:40:21.971Z
-- Schema: Minimal fund_table structure (basic columns only)

-- MINIMAL FUND DATA (UPSERT - Safe for Duplicates)
-- Processing 50 fund records
-- Will INSERT new records or UPDATE existing ones

-- Record 2851: 마크-솔리드원 뷰티인텔리전스펀드 1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200328',
  '마크-솔리드원 뷰티인텔리전스펀드 1호',
  10000000000,
  '2024-09-13',
  '{"fund_id":"AS20240911","registration_date":"2024-09-13","expiry_date":"2029-09-12","formation_total_amount":"100.0","investment_character_code":"01","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20200328","operator_company_name":"마크앤컴퍼니","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"마크앤컴퍼니","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.971Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2852: 마젤란 핀테크 투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20110007',
  '마젤란 핀테크 투자조합 1호',
  10000000000,
  '2023-08-08',
  '{"fund_id":"AS20230685","registration_date":"2023-08-08","expiry_date":"2031-08-07","formation_total_amount":"100.0","investment_character_code":"28","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20110007","operator_company_name":"마젤란기술투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"마젤란기술투자","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.971Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2853: 마이블루오션투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210183',
  '마이블루오션투자조합1호',
  420000000,
  '2024-11-12',
  '{"fund_id":"AS20241072","registration_date":"2024-11-12","expiry_date":"2029-11-11","formation_total_amount":"4.2","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20210183","operator_company_name":"블루오션벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"블루오션벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.971Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2854: 마이다스동아-엔에스씨 애니메이션 캐릭터 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20130001',
  '마이다스동아-엔에스씨 애니메이션 캐릭터 투자조합',
  15000000000,
  '2020-08-10',
  '{"fund_id":"AS20200410","registration_date":"2020-08-10","expiry_date":"2028-08-09","formation_total_amount":"150.0","investment_character_code":"24","industry_code":"6","investment_field_type":"문화","investment_field_detail_type":"문화 기타","mother_fund_id":"MF00000001","operator_company_id":"OP20130001","operator_company_name":"마이다스동아인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"마이다스동아인베스트먼트","investment_focus":["문화 기타","문화"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.971Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2855: 마이다스동아-엔에스씨 수산펀드 2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20130001',
  '마이다스동아-엔에스씨 수산펀드 2호',
  20000000000,
  '2019-12-31',
  '{"fund_id":"AS20200007","registration_date":"2019-12-31","expiry_date":"2027-12-30","formation_total_amount":"200.0","investment_character_code":"10","industry_code":"9","investment_field_type":"일반","investment_field_detail_type":"일반 기타","mother_fund_id":"MF00000001","operator_company_id":"OP20130001","operator_company_name":"마이다스동아인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"마이다스동아인베스트먼트","investment_focus":["일반 기타","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.971Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2856: 마이다스동아-엔브이씨 2022 해양 신산업 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20130001',
  '마이다스동아-엔브이씨 2022 해양 신산업 투자조합',
  29250000000,
  '2022-12-27',
  '{"fund_id":"AS20221545","registration_date":"2022-12-27","expiry_date":"2030-12-26","formation_total_amount":"292.5","investment_character_code":"10","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20130001","operator_company_name":"마이다스동아인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"마이다스동아인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.971Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2857: 마이다스동아-엔브이씨 2022 부산 지역혁신 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20130001',
  '마이다스동아-엔브이씨 2022 부산 지역혁신 투자조합',
  21500000000,
  '2023-01-04',
  '{"fund_id":"AS20230022","registration_date":"2023-01-04","expiry_date":"2031-01-03","formation_total_amount":"215.0","investment_character_code":"10","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000015","operator_company_id":"OP20130001","operator_company_name":"마이다스동아인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"마이다스동아인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.971Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2858: 마이다스동아 바이오내비게이터 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20130001',
  '마이다스동아 바이오내비게이터 투자조합',
  8800000000,
  '2020-06-25',
  '{"fund_id":"AS20200283","registration_date":"2020-06-25","expiry_date":"2025-06-24","formation_total_amount":"88.0","investment_character_code":"01","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20130001","operator_company_name":"마이다스동아인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"마이다스동아인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.971Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2859: 마이다스동아 글로벌콘텐츠 투자조합 3호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20130001',
  '마이다스동아 글로벌콘텐츠 투자조합 3호',
  4140000000,
  '2022-02-07',
  '{"fund_id":"AS20220116","registration_date":"2022-02-07","expiry_date":"2027-02-06","formation_total_amount":"41.4","investment_character_code":"16","industry_code":"2","investment_field_type":"문화","investment_field_detail_type":"음반","mother_fund_id":"","operator_company_id":"OP20130001","operator_company_name":"마이다스동아인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"마이다스동아인베스트먼트","investment_focus":["음반","문화"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.971Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2860: 마이다스동아 글로벌콘텐츠 투자조합 2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20130001',
  '마이다스동아 글로벌콘텐츠 투자조합 2호',
  11500000000,
  '2019-07-31',
  '{"fund_id":"AS20190318","registration_date":"2019-07-31","expiry_date":"2027-07-30","formation_total_amount":"115.0","investment_character_code":"24","industry_code":"8","investment_field_type":"문화","investment_field_detail_type":"문화 기타","mother_fund_id":"MF00000001","operator_company_id":"OP20130001","operator_company_name":"마이다스동아인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"마이다스동아인베스트먼트","investment_focus":["문화 기타","문화"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.971Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2861: 마그나프렌드 임팩트인핸스 펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20100002',
  '마그나프렌드 임팩트인핸스 펀드',
  25000000000,
  '2019-08-06',
  '{"fund_id":"AS20190355","registration_date":"2019-08-06","expiry_date":"2027-08-05","formation_total_amount":"250.0","investment_character_code":"23","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20100002","operator_company_name":"마그나인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"마그나인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.971Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2862: 마그나3호 Rising Star 펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20100002',
  '마그나3호 Rising Star 펀드',
  16000000000,
  '2015-07-15',
  '{"fund_id":"AS20150085","registration_date":"2015-07-15","expiry_date":"2025-07-14","formation_total_amount":"160.0","investment_character_code":"21","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20100002","operator_company_name":"마그나인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"마그나인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.971Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2863: 마그나-액시스 관광벤처펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20100002',
  '마그나-액시스 관광벤처펀드',
  28000000000,
  '2019-03-11',
  '{"fund_id":"AS20190077","registration_date":"2019-03-11","expiry_date":"2027-03-10","formation_total_amount":"280.0","investment_character_code":"10","industry_code":"8","investment_field_type":"문화","investment_field_detail_type":"문화 기타","mother_fund_id":"MF00000001","operator_company_id":"OP20100002","operator_company_name":"마그나인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"마그나인베스트먼트","investment_focus":["문화 기타","문화"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.972Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2864: 마그나 아시아문화중심도시 육성 펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20100002',
  '마그나 아시아문화중심도시 육성 펀드',
  10000000000,
  '2017-02-21',
  '{"fund_id":"AS20170022","registration_date":"2017-02-21","expiry_date":"2026-02-19","formation_total_amount":"100.0","investment_character_code":"24","industry_code":"7","investment_field_type":"문화","investment_field_detail_type":"문화 기타","mother_fund_id":"MF00000001","operator_company_id":"OP20100002","operator_company_name":"마그나인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"마그나인베스트먼트","investment_focus":["문화 기타","문화"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.972Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2865: 마그나 X CJ프레시웨이 시너지펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20100002',
  '마그나 X CJ프레시웨이 시너지펀드',
  3300000000,
  '2023-03-06',
  '{"fund_id":"AS20230147","registration_date":"2023-03-06","expiry_date":"2031-03-05","formation_total_amount":"33.0","investment_character_code":"10","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20100002","operator_company_name":"마그나인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"마그나인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.972Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2866: 마그나 VITA 펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20100002',
  '마그나 VITA 펀드',
  28000000000,
  '2020-11-18',
  '{"fund_id":"AS20200658","registration_date":"2020-11-18","expiry_date":"2028-11-17","formation_total_amount":"280.0","investment_character_code":"10","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20100002","operator_company_name":"마그나인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"마그나인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.972Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2867: 마그나 Rising Star 2 펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20100002',
  '마그나 Rising Star 2 펀드',
  25000000000,
  '2020-09-21',
  '{"fund_id":"AS20200519","registration_date":"2020-09-21","expiry_date":"2028-09-20","formation_total_amount":"250.0","investment_character_code":"20","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20100002","operator_company_name":"마그나인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"마그나인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.972Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2868: 마그나 K뷰티-S 펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20100002',
  '마그나 K뷰티-S 펀드',
  2090000000,
  '2024-12-17',
  '{"fund_id":"AS20241369","registration_date":"2024-12-17","expiry_date":"2029-12-16","formation_total_amount":"20.9","investment_character_code":"25","industry_code":"4","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20100002","operator_company_name":"마그나인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"마그나인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.972Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2869: 마그나 K뷰티-R 펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20100002',
  '마그나 K뷰티-R 펀드',
  2070000000,
  '2024-12-17',
  '{"fund_id":"AS20241368","registration_date":"2024-12-17","expiry_date":"2029-12-16","formation_total_amount":"20.7","investment_character_code":"25","industry_code":"4","investment_field_type":"일반","investment_field_detail_type":"일반 기타","mother_fund_id":"","operator_company_id":"OP20100002","operator_company_name":"마그나인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"마그나인베스트먼트","investment_focus":["일반 기타","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.972Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2870: 마그나 K뷰티-I 펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20100002',
  '마그나 K뷰티-I 펀드',
  6260000000,
  '2024-12-23',
  '{"fund_id":"AS20241415","registration_date":"2024-12-23","expiry_date":"2029-12-22","formation_total_amount":"62.6","investment_character_code":"25","industry_code":"4","investment_field_type":"일반","investment_field_detail_type":"일반 기타","mother_fund_id":"","operator_company_id":"OP20100002","operator_company_name":"마그나인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"마그나인베스트먼트","investment_focus":["일반 기타","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.972Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2871: 마그나 IMPACT 펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20100002',
  '마그나 IMPACT 펀드',
  17200000000,
  '2024-09-05',
  '{"fund_id":"AS20240874","registration_date":"2024-09-05","expiry_date":"2032-09-04","formation_total_amount":"172.0","investment_character_code":"23","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20100002","operator_company_name":"마그나인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"마그나인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.972Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2872: 마그나 e-신산업 펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20100002',
  '마그나 e-신산업 펀드',
  34500000000,
  '2023-08-04',
  '{"fund_id":"AS20230670","registration_date":"2023-08-04","expiry_date":"2033-08-03","formation_total_amount":"345.0","investment_character_code":"11","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20100002","operator_company_name":"마그나인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"마그나인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.972Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2873: 링크 베터 투자조합 4호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210382',
  '링크 베터 투자조합 4호',
  490000000,
  '2024-08-26',
  '{"fund_id":"AS20240770","registration_date":"2024-08-26","expiry_date":"2029-08-25","formation_total_amount":"4.9","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20210382","operator_company_name":"베터그라운드","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"베터그라운드","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.972Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2874: 링크 베터 투자조합 3호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210382',
  '링크 베터 투자조합 3호',
  1930000000,
  '2024-08-09',
  '{"fund_id":"AS20240690","registration_date":"2024-08-09","expiry_date":"2029-08-08","formation_total_amount":"19.3","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20210382","operator_company_name":"베터그라운드","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"베터그라운드","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.972Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2875: 링크 베터 투자조합 2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210382',
  '링크 베터 투자조합 2호',
  710000000,
  '2024-03-29',
  '{"fund_id":"AS20240237","registration_date":"2024-03-29","expiry_date":"2029-03-28","formation_total_amount":"7.1","investment_character_code":"","industry_code":"6","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20210382","operator_company_name":"베터그라운드","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"베터그라운드","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.972Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2876: 링크 베터 투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210382',
  '링크 베터 투자조합 1호',
  1550000000,
  '2022-08-04',
  '{"fund_id":"AS20220834","registration_date":"2022-08-04","expiry_date":"2027-08-03","formation_total_amount":"15.5","investment_character_code":"","industry_code":"1","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20210382","operator_company_name":"베터그라운드","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"베터그라운드","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.972Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2877: 린드먼팬아시아신성장투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20060005',
  '린드먼팬아시아신성장투자조합',
  97780000000,
  '2011-10-28',
  '{"fund_id":"AS20110069","registration_date":"2011-10-28","expiry_date":"2025-10-27","formation_total_amount":"977.8","investment_character_code":"27","industry_code":"1","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20060005","operator_company_name":"린드먼아시아인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"린드먼아시아인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.972Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2878: 린드먼아시아투자조합16호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20060005',
  '린드먼아시아투자조합16호',
  80100000000,
  '2021-01-04',
  '{"fund_id":"AS20210021","registration_date":"2021-01-04","expiry_date":"2029-01-03","formation_total_amount":"801.0","investment_character_code":"17","industry_code":"9","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20060005","operator_company_name":"린드먼아시아인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"린드먼아시아인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.972Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2879: 린드먼아시아투자조합14호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20060005',
  '린드먼아시아투자조합14호',
  50100000000,
  '2019-12-20',
  '{"fund_id":"AS20200015","registration_date":"2019-12-20","expiry_date":"2027-12-19","formation_total_amount":"501.0","investment_character_code":"02","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20060005","operator_company_name":"린드먼아시아인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"린드먼아시아인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.972Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2880: 린드먼아시아투자조합12호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20060005',
  '린드먼아시아투자조합12호',
  30200000000,
  '2017-09-01',
  '{"fund_id":"AS20170103","registration_date":"2017-09-01","expiry_date":"2026-01-31","formation_total_amount":"302.0","investment_character_code":"17","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20060005","operator_company_name":"린드먼아시아인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"린드먼아시아인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.972Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2881: 린드먼-우리 기술금융투자조합제13호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20060005',
  '린드먼-우리 기술금융투자조합제13호',
  60100000000,
  '2018-12-05',
  '{"fund_id":"AS20180365","registration_date":"2018-12-05","expiry_date":"2026-12-04","formation_total_amount":"601.0","investment_character_code":"09","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20060005","operator_company_name":"린드먼아시아인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"린드먼아시아인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.972Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2882: 린 혁신성장 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20220058',
  '린 혁신성장 투자조합',
  2320000000,
  '2023-06-13',
  '{"fund_id":"AS20230487","registration_date":"2023-06-13","expiry_date":"2028-06-12","formation_total_amount":"23.2","investment_character_code":"02","industry_code":"9","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20220058","operator_company_name":"린벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"린벤처스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.972Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2883: 린 에너지 투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20220058',
  '린 에너지 투자조합1호',
  2000000000,
  '2023-02-22',
  '{"fund_id":"AS20230116","registration_date":"2023-02-22","expiry_date":"2028-02-21","formation_total_amount":"20.0","investment_character_code":"11","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20220058","operator_company_name":"린벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"린벤처스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.972Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2884: 린 사이버보안 벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20220058',
  '린 사이버보안 벤처투자조합',
  20000000000,
  '2024-11-01',
  '{"fund_id":"AS20241070","registration_date":"2024-11-01","expiry_date":"2032-10-31","formation_total_amount":"200.0","investment_character_code":"10","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20220058","operator_company_name":"린벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"린벤처스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.972Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2885: 린 문화예술 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20220058',
  '린 문화예술 투자조합',
  2000000000,
  '2023-08-11',
  '{"fund_id":"AS20230699","registration_date":"2023-08-11","expiry_date":"2028-08-10","formation_total_amount":"20.0","investment_character_code":"24","industry_code":"8","investment_field_type":"문화","investment_field_detail_type":"문화 기타","mother_fund_id":"","operator_company_id":"OP20220058","operator_company_name":"린벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"린벤처스","investment_focus":["문화 기타","문화"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.972Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2886: 리벤처스-허브넷 혁신커머스 투자조합 
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200492',
  '리벤처스-허브넷 혁신커머스 투자조합 ',
  540000000,
  '2022-05-06',
  '{"fund_id":"AS20220463","registration_date":"2022-05-06","expiry_date":"2027-04-25","formation_total_amount":"5.4","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200492","operator_company_name":"리벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"리벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.972Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2887: 리벤처스-플랜아이 사내벤처 1호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200492',
  '리벤처스-플랜아이 사내벤처 1호 투자조합',
  270000000,
  '2023-06-16',
  '{"fund_id":"AS20230424","registration_date":"2023-06-16","expiry_date":"2028-05-25","formation_total_amount":"2.7","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200492","operator_company_name":"리벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"리벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.972Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2888: 리벤처스-세종 혁신성장 투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200492',
  '리벤처스-세종 혁신성장 투자조합 1호',
  230000000,
  '2025-02-25',
  '{"fund_id":"AS20250118","registration_date":"2025-02-25","expiry_date":"2030-02-17","formation_total_amount":"2.3","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200492","operator_company_name":"리벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"리벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.972Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2889: 리벤처스 테크 이노베이션 투자조합8호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200492',
  '리벤처스 테크 이노베이션 투자조합8호',
  650000000,
  '2023-10-12',
  '{"fund_id":"AS20230889","registration_date":"2023-10-12","expiry_date":"2028-10-04","formation_total_amount":"6.5","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200492","operator_company_name":"리벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"리벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.972Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2890: 리벤처스 테크 이노베이션 투자조합6호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200492',
  '리벤처스 테크 이노베이션 투자조합6호',
  470000000,
  '2023-07-28',
  '{"fund_id":"AS20230629","registration_date":"2023-07-28","expiry_date":"2028-07-23","formation_total_amount":"4.7","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200492","operator_company_name":"리벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"리벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.972Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2891: 리벤처스 테크 이노베이션 투자조합5호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200492',
  '리벤처스 테크 이노베이션 투자조합5호',
  180000000,
  '2023-08-07',
  '{"fund_id":"AS20230641","registration_date":"2023-08-07","expiry_date":"2028-07-25","formation_total_amount":"1.8","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200492","operator_company_name":"리벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"리벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.972Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2892: 리벤처스 테크 이노베이션 투자조합 7호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200492',
  '리벤처스 테크 이노베이션 투자조합 7호',
  160000000,
  '2024-08-14',
  '{"fund_id":"AS20240765","registration_date":"2024-08-14","expiry_date":"2029-08-11","formation_total_amount":"1.6","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200492","operator_company_name":"리벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"리벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.972Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2893: 리벤처스 테크 이노베이션 투자조합 4호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200492',
  '리벤처스 테크 이노베이션 투자조합 4호',
  110000000,
  '2024-08-05',
  '{"fund_id":"AS20240727","registration_date":"2024-08-05","expiry_date":"2029-08-01","formation_total_amount":"1.1","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200492","operator_company_name":"리벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"리벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.972Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2894: 리벤처스 테크 이노베이션 투자조합 3호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200492',
  '리벤처스 테크 이노베이션 투자조합 3호',
  120000000,
  '2023-02-15',
  '{"fund_id":"AS20230068","registration_date":"2023-02-15","expiry_date":"2028-01-25","formation_total_amount":"1.2","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200492","operator_company_name":"리벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"리벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.972Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2895: 리벤처스 테크 이노베이션 투자조합 2호 
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200492',
  '리벤처스 테크 이노베이션 투자조합 2호 ',
  110000000,
  '2022-12-01',
  '{"fund_id":"AS20221287","registration_date":"2022-12-01","expiry_date":"2027-11-09","formation_total_amount":"1.1","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200492","operator_company_name":"리벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"리벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.972Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2896: 리벤처스 테크 이노베이션 투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200492',
  '리벤처스 테크 이노베이션 투자조합 1호',
  110000000,
  '2022-10-19',
  '{"fund_id":"AS20221133","registration_date":"2022-10-19","expiry_date":"2027-09-28","formation_total_amount":"1.1","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200492","operator_company_name":"리벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"리벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.972Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2897: 리벤처스 지역엔젤 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200492',
  '리벤처스 지역엔젤 투자조합',
  5000000000,
  '2024-01-21',
  '{"fund_id":"AS20240024","registration_date":"2024-01-21","expiry_date":"2031-01-09","formation_total_amount":"50.0","investment_character_code":"","industry_code":"6","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"MF00000021","operator_company_id":"OP20200492","operator_company_name":"리벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"리벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.972Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2898: 리벤처스 에듀테크 1호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200492',
  '리벤처스 에듀테크 1호 투자조합',
  120000000,
  '2022-09-01',
  '{"fund_id":"AS20220975","registration_date":"2022-09-01","expiry_date":"2027-08-22","formation_total_amount":"1.2","investment_character_code":"","industry_code":"6","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200492","operator_company_name":"리벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"리벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.972Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2899: 리벤처스 에그테크 투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200492',
  '리벤처스 에그테크 투자조합 1호',
  220000000,
  '2022-12-05',
  '{"fund_id":"AS20221318","registration_date":"2022-12-05","expiry_date":"2027-11-16","formation_total_amount":"2.2","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200492","operator_company_name":"리벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"리벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.972Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2900: 리벤처스 바이오 헬스케어 7호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200492',
  '리벤처스 바이오 헬스케어 7호 투자조합',
  100000000,
  '2023-06-28',
  '{"fund_id":"AS20230525","registration_date":"2023-06-28","expiry_date":"2028-06-21","formation_total_amount":"1.0","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200492","operator_company_name":"리벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"리벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.972Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Minimal Batch 58 completed! 50 fund records processed.
-- Progress: 2900/3689 total records

