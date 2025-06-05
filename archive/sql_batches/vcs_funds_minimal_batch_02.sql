-- VCS Fund MINIMAL UPSERT Batch 2/74 (Records 51-100)
-- MINIMAL: Only using basic columns that definitely exist
-- Generated from VCS API Scraper fund data
-- Generated at: 2025-06-05T00:40:21.626Z
-- Schema: Minimal fund_table structure (basic columns only)

-- MINIMAL FUND DATA (UPSERT - Safe for Duplicates)
-- Processing 50 fund records
-- Will INSERT new records or UPDATE existing ones

-- Record 51: 헤이브이씨(Hey VC) 개인투자조합 제1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20160040',
  '헤이브이씨(Hey VC) 개인투자조합 제1호',
  500000000,
  '2022-05-25',
  '{"fund_id":"AS20220568","registration_date":"2022-05-25","expiry_date":"2027-05-24","formation_total_amount":"5.0","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20160040","operator_company_name":"에스와이피","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"에스와이피","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.626Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 52: 허니팟 와이지 1호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20240136',
  '허니팟 와이지 1호 투자조합',
  3300000000,
  '2024-07-22',
  '{"fund_id":"AS20240679","registration_date":"2024-07-22","expiry_date":"2029-07-21","formation_total_amount":"33.0","investment_character_code":"16","industry_code":"4","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20240136","operator_company_name":"허니팟벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"허니팟벤처스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.627Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 53: 허니팟 버즈1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20240136',
  '허니팟 버즈1호',
  2480000000,
  '2024-04-22',
  '{"fund_id":"AS20240335","registration_date":"2024-04-22","expiry_date":"2029-04-21","formation_total_amount":"24.8","investment_character_code":"16","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20240136","operator_company_name":"허니팟벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"허니팟벤처스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.627Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 54: 허니팟 HGI 뉴 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20240136',
  '허니팟 HGI 뉴 투자조합',
  3080000000,
  '2024-10-07',
  '{"fund_id":"AS20240950","registration_date":"2024-10-07","expiry_date":"2029-10-06","formation_total_amount":"30.8","investment_character_code":"01","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20240136","operator_company_name":"허니팟벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"허니팟벤처스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.627Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 55: 해외VC 글로벌 펀드 2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20000029',
  '해외VC 글로벌 펀드 2호',
  291870000000,
  '2016-07-15',
  '{"fund_id":"AS20160075","registration_date":"2016-07-15","expiry_date":"2035-07-14","formation_total_amount":"2918.7","investment_character_code":"16","industry_code":"9","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20000029","operator_company_name":"한국벤처투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"한국벤처투자","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.627Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 56: 해외VC 글로벌 펀드 1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20000029',
  '해외VC 글로벌 펀드 1호',
  578130000000,
  '2013-10-04',
  '{"fund_id":"AS20130040","registration_date":"2013-10-04","expiry_date":"2034-10-03","formation_total_amount":"5781.3","investment_character_code":"16","industry_code":"9","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20000029","operator_company_name":"한국벤처투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"한국벤처투자","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.627Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 57: 해양신산업등대투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20170010',
  '해양신산업등대투자조합',
  14300000000,
  '2021-11-08',
  '{"fund_id":"AS20211105","registration_date":"2021-11-08","expiry_date":"2029-11-07","formation_total_amount":"143.0","investment_character_code":"10","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20170010","operator_company_name":"라이트하우스컴바인인베스트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"라이트하우스컴바인인베스트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.627Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 58: 해시드 벤처투자조합3호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200386',
  '해시드 벤처투자조합3호',
  32650000000,
  '2024-04-29',
  '{"fund_id":"AS20240368","registration_date":"2024-04-29","expiry_date":"2032-04-28","formation_total_amount":"326.5","investment_character_code":"06","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20200386","operator_company_name":"해시드벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"해시드벤처스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.627Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 59: 해시드 벤처투자조합2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200386',
  '해시드 벤처투자조합2호',
  240000000000,
  '2021-12-03',
  '{"fund_id":"AS20211229","registration_date":"2021-12-03","expiry_date":"2028-12-02","formation_total_amount":"2400.0","investment_character_code":"02","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20200386","operator_company_name":"해시드벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"해시드벤처스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.627Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 60: 해시드 벤처투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200386',
  '해시드 벤처투자조합1호',
  117700000000,
  '2020-11-12',
  '{"fund_id":"AS20200652","registration_date":"2020-11-12","expiry_date":"2027-11-11","formation_total_amount":"1177.0","investment_character_code":"01","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20200386","operator_company_name":"해시드벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"해시드벤처스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.627Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 61: 한화소재부품장비제1호투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19620001',
  '한화소재부품장비제1호투자조합',
  5600000000,
  '2020-09-29',
  '{"fund_id":"AS20200543","registration_date":"2020-09-29","expiry_date":"2025-09-28","formation_total_amount":"56.0","investment_character_code":"25","industry_code":"1","investment_field_type":"일반","investment_field_detail_type":"부품소재","mother_fund_id":"MF00000001","operator_company_id":"OP19620001","operator_company_name":"한화투자증권","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"한화투자증권","investment_focus":["부품소재","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.627Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 62: 한화-원익 K방산 기술혁신 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19620001',
  '한화-원익 K방산 기술혁신 투자조합',
  50000000000,
  '2024-04-11',
  '{"fund_id":"AS20240293","registration_date":"2024-04-11","expiry_date":"2034-04-10","formation_total_amount":"500.0","investment_character_code":"10","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP19620001","operator_company_name":"한화투자증권","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"한화투자증권","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.627Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 63: 한투 바른동행 셰르파 제3호 펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20220008',
  '한투 바른동행 셰르파 제3호 펀드',
  15000000000,
  '2024-05-30',
  '{"fund_id":"AS20240474","registration_date":"2024-05-30","expiry_date":"2029-05-29","formation_total_amount":"150.0","investment_character_code":"20","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20220008","operator_company_name":"한국투자액셀러레이터","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"한국투자액셀러레이터","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.627Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 64: 한투 바른동행 셰르파 제2호 펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20220008',
  '한투 바른동행 셰르파 제2호 펀드',
  15000000000,
  '2023-05-26',
  '{"fund_id":"AS20230433","registration_date":"2023-05-26","expiry_date":"2028-05-25","formation_total_amount":"150.0","investment_character_code":"20","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20220008","operator_company_name":"한국투자액셀러레이터","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"한국투자액셀러레이터","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.627Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 65: 한투 바른동행 셰르파 제1호 펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20220008',
  '한투 바른동행 셰르파 제1호 펀드',
  15000000000,
  '2022-03-14',
  '{"fund_id":"AS20220289","registration_date":"2022-03-14","expiry_date":"2027-03-13","formation_total_amount":"150.0","investment_character_code":"20","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20220008","operator_company_name":"한국투자액셀러레이터","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"한국투자액셀러레이터","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.627Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 66: 한컴-미래에셋 4차 산업혁명 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19990017',
  '한컴-미래에셋 4차 산업혁명 투자조합',
  15000000000,
  '2018-07-06',
  '{"fund_id":"AS20180191","registration_date":"2018-07-06","expiry_date":"2025-07-05","formation_total_amount":"150.0","investment_character_code":"01","industry_code":"1","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP19990017","operator_company_name":"미래에셋벤처투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"미래에셋벤처투자","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.627Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 67: 한양대학교 창업엔진 개인투자조합 3호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20080013',
  '한양대학교 창업엔진 개인투자조합 3호',
  5170000000,
  '2022-09-20',
  '{"fund_id":"AS20221019","registration_date":"2022-09-20","expiry_date":"2029-09-19","formation_total_amount":"51.7","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"MF00000001","operator_company_id":"OP20080013","operator_company_name":"한양대학교기술지주회사","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"한양대학교기술지주회사","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.627Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 68: 한양대학교 창업엔진 개인투자조합 2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20080013',
  '한양대학교 창업엔진 개인투자조합 2호',
  1000000000,
  '2020-01-09',
  '{"fund_id":"AS20200036","registration_date":"2020-01-09","expiry_date":"2027-01-08","formation_total_amount":"10.0","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"MF00000001","operator_company_id":"OP20080013","operator_company_name":"한양대학교기술지주회사","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"한양대학교기술지주회사","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.627Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 69: 한양대학교 창업엔진 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20080013',
  '한양대학교 창업엔진 개인투자조합',
  2740000000,
  '2018-08-01',
  '{"fund_id":"AS20180189","registration_date":"2018-08-01","expiry_date":"2028-07-29","formation_total_amount":"27.4","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"MF00000001","operator_company_id":"OP20080013","operator_company_name":"한양대학교기술지주회사","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"한양대학교기술지주회사","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.627Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 70: 한양대학교 스타트업 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20080013',
  '한양대학교 스타트업 개인투자조합',
  3050000000,
  '2018-10-05',
  '{"fund_id":"AS20180288","registration_date":"2018-10-05","expiry_date":"2025-10-04","formation_total_amount":"30.5","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"MF00000008","operator_company_id":"OP20080013","operator_company_name":"한양대학교기술지주회사","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"한양대학교기술지주회사","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.627Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 71: 한양대학교 블루라이언 벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20080013',
  '한양대학교 블루라이언 벤처투자조합',
  3600000000,
  '2022-09-06',
  '{"fund_id":"AS20221027","registration_date":"2022-09-06","expiry_date":"2029-09-05","formation_total_amount":"36.0","investment_character_code":"20","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20080013","operator_company_name":"한양대학교기술지주회사","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"한양대학교기술지주회사","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.627Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 72: 한양대학교 기술창업 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20080013',
  '한양대학교 기술창업 개인투자조합',
  1500000000,
  '2018-09-10',
  '{"fund_id":"AS20180281","registration_date":"2018-09-10","expiry_date":"2025-09-30","formation_total_amount":"15.0","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20080013","operator_company_name":"한양대학교기술지주회사","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"한양대학교기술지주회사","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.627Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 73: 한세예스24 라이징스타2호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200489',
  '한세예스24 라이징스타2호 투자조합',
  5050000000,
  '2023-02-21',
  '{"fund_id":"AS20230113","registration_date":"2023-02-21","expiry_date":"2030-02-20","formation_total_amount":"50.5","investment_character_code":"20","industry_code":"4","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20200489","operator_company_name":"한세예스24파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"한세예스24파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.627Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 74: 한세예스24 라이징스타2호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210207',
  '한세예스24 라이징스타2호 투자조합',
  5050000000,
  '2023-02-21',
  '{"fund_id":"AS20230113","registration_date":"2023-02-21","expiry_date":"2030-02-20","formation_total_amount":"50.5","investment_character_code":"20","industry_code":"4","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20210207","operator_company_name":"뉴본벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"뉴본벤처스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.627Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 75: 한세예스24 라이징스타 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200489',
  '한세예스24 라이징스타 투자조합',
  10110000000,
  '2021-03-30',
  '{"fund_id":"AS20210242","registration_date":"2021-03-30","expiry_date":"2026-03-29","formation_total_amount":"101.1","investment_character_code":"20","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20200489","operator_company_name":"한세예스24파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"한세예스24파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.627Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 76: 한세예스24 라이징스타 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210207',
  '한세예스24 라이징스타 투자조합',
  10110000000,
  '2021-03-30',
  '{"fund_id":"AS20210242","registration_date":"2021-03-30","expiry_date":"2026-03-29","formation_total_amount":"101.1","investment_character_code":"20","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20210207","operator_company_name":"뉴본벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"뉴본벤처스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.627Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 77: 한사투 청년 임팩트 개인투자조합 2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200171',
  '한사투 청년 임팩트 개인투자조합 2호',
  200000000,
  '2020-09-16',
  '{"fund_id":"AS20200494","registration_date":"2020-09-16","expiry_date":"2025-09-15","formation_total_amount":"2.0","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200171","operator_company_name":"한국사회투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"한국사회투자","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.627Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 78: 한사투 의료 임팩트 개인투자조합 4호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200171',
  '한사투 의료 임팩트 개인투자조합 4호',
  100000000,
  '2022-01-03',
  '{"fund_id":"AS20211460","registration_date":"2022-01-03","expiry_date":"2027-01-02","formation_total_amount":"1.0","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200171","operator_company_name":"한국사회투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"한국사회투자","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.627Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 79: 한사투 라이징테크 임팩트 개인투자조합 9호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200171',
  '한사투 라이징테크 임팩트 개인투자조합 9호',
  180000000,
  '2023-12-11',
  '{"fund_id":"AS20231210","registration_date":"2023-12-11","expiry_date":"2028-12-10","formation_total_amount":"1.8","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200171","operator_company_name":"한국사회투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"한국사회투자","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.627Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 80: 한사투 농업 임팩트 개인투자조합 5호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200171',
  '한사투 농업 임팩트 개인투자조합 5호',
  150000000,
  '2022-01-03',
  '{"fund_id":"AS20211459","registration_date":"2022-01-03","expiry_date":"2027-01-02","formation_total_amount":"1.5","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200171","operator_company_name":"한국사회투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"한국사회투자","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.627Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 81: 한사투 넷제로테크 임팩트 개인투자조합 7호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200171',
  '한사투 넷제로테크 임팩트 개인투자조합 7호',
  530000000,
  '2022-10-07',
  '{"fund_id":"AS20221085","registration_date":"2022-10-07","expiry_date":"2027-10-06","formation_total_amount":"5.3","investment_character_code":"","industry_code":"3","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200171","operator_company_name":"한국사회투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"한국사회투자","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.627Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 82: 한사투 그린 임팩트 개인투자조합 3호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200171',
  '한사투 그린 임팩트 개인투자조합 3호',
  130000000,
  '2021-01-29',
  '{"fund_id":"AS20210070","registration_date":"2021-01-29","expiry_date":"2026-01-28","formation_total_amount":"1.3","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200171","operator_company_name":"한국사회투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"한국사회투자","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.627Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 83: 한사투 ESG 임팩트 개인투자조합 6호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200171',
  '한사투 ESG 임팩트 개인투자조합 6호',
  300000000,
  '2022-03-29',
  '{"fund_id":"AS20220262","registration_date":"2022-03-29","expiry_date":"2027-03-28","formation_total_amount":"3.0","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200171","operator_company_name":"한국사회투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"한국사회투자","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.627Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 84: 한림바이오개인투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210148',
  '한림바이오개인투자조합1호',
  1550000000,
  '2024-07-25',
  '{"fund_id":"AS20240684","registration_date":"2024-07-25","expiry_date":"2029-07-24","formation_total_amount":"15.5","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20210148","operator_company_name":"한림제약","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"한림제약","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.627Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 85: 한림대-로우 대학창업 제1호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20220754',
  '한림대-로우 대학창업 제1호 개인투자조합',
  2470000000,
  '2024-10-21',
  '{"fund_id":"AS20241006","registration_date":"2024-10-21","expiry_date":"2032-10-17","formation_total_amount":"24.7","investment_character_code":"","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"","mother_fund_id":"MF00000001","operator_company_id":"OP20220754","operator_company_name":"한림대학교기술지주","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"한림대학교기술지주","investment_focus":["일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.627Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 86: 한림-가이아바이오투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20150008',
  '한림-가이아바이오투자조합1호',
  2470000000,
  '2023-12-11',
  '{"fund_id":"AS20231249","registration_date":"2023-12-11","expiry_date":"2028-12-10","formation_total_amount":"24.7","investment_character_code":"25","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20150008","operator_company_name":"가이아벤처파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"가이아벤처파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.627Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 87: 한림 DHD 1호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20220754',
  '한림 DHD 1호 투자조합',
  1580000000,
  '2023-07-10',
  '{"fund_id":"AS20230581","registration_date":"2023-07-10","expiry_date":"2030-07-09","formation_total_amount":"15.8","investment_character_code":"20","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20220754","operator_company_name":"한림대학교기술지주","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"한림대학교기술지주","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.627Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 88: 한동베스트1호투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20000032',
  '한동베스트1호투자조합',
  2150000000,
  '2019-03-04',
  '{"fund_id":"AS20190074","registration_date":"2019-03-04","expiry_date":"2026-03-03","formation_total_amount":"21.5","investment_character_code":"01","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"바이오","mother_fund_id":"","operator_company_id":"OP20000032","operator_company_name":"윈베스트벤처투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"윈베스트벤처투자","investment_focus":["바이오","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.627Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 89: 한국투자동유블루호라이즌투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19860004',
  '한국투자동유블루호라이즌투자조합',
  5750000000,
  '2024-12-16',
  '{"fund_id":"AS20241354","registration_date":"2024-12-16","expiry_date":"2029-12-15","formation_total_amount":"57.5","investment_character_code":"25","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP19860004","operator_company_name":"한국투자파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"한국투자파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.627Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 90: 한국투자-킹고 소부장육성 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19860004',
  '한국투자-킹고 소부장육성 투자조합',
  112500000000,
  '2021-11-08',
  '{"fund_id":"AS20211099","registration_date":"2021-11-08","expiry_date":"2030-11-07","formation_total_amount":"1125.0","investment_character_code":"03","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP19860004","operator_company_name":"한국투자파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"한국투자파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.628Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 91: 한국투자-뉴메인 그로스캐피탈 1호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19860004',
  '한국투자-뉴메인 그로스캐피탈 1호 투자조합',
  8800000000,
  '2023-12-05',
  '{"fund_id":"AS20231202","registration_date":"2023-12-05","expiry_date":"2028-12-04","formation_total_amount":"88.0","investment_character_code":"25","industry_code":"1","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP19860004","operator_company_name":"한국투자파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"한국투자파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.628Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 92: 한국투자 핵심역량 레버리지 Ⅱ 펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19860004',
  '한국투자 핵심역량 레버리지 Ⅱ 펀드',
  260500000000,
  '2025-01-09',
  '{"fund_id":"AS20250032","registration_date":"2025-01-09","expiry_date":"2033-01-08","formation_total_amount":"2605.0","investment_character_code":"01","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP19860004","operator_company_name":"한국투자파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"한국투자파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.628Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 93: 한국투자 핀테크 혁신펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19860004',
  '한국투자 핀테크 혁신펀드',
  24000000000,
  '2020-07-03',
  '{"fund_id":"AS20200377","registration_date":"2020-07-03","expiry_date":"2028-07-02","formation_total_amount":"240.0","investment_character_code":"02","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP19860004","operator_company_name":"한국투자파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"한국투자파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.628Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 94: 한국투자 컨티뉴에이션 Ⅰ 펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19860004',
  '한국투자 컨티뉴에이션 Ⅰ 펀드',
  50000000000,
  '2024-12-12',
  '{"fund_id":"AS20241331","registration_date":"2024-12-12","expiry_date":"2029-12-11","formation_total_amount":"500.0","investment_character_code":"01","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP19860004","operator_company_name":"한국투자파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"한국투자파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.628Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 95: 한국투자 유망서비스산업 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19860004',
  '한국투자 유망서비스산업 투자조합',
  45000000000,
  '2016-03-04',
  '{"fund_id":"AS20160098","registration_date":"2016-03-04","expiry_date":"2026-03-03","formation_total_amount":"450.0","investment_character_code":"26","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP19860004","operator_company_name":"한국투자파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"한국투자파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.628Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 96: 한국투자 벤치마크 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19860004',
  '한국투자 벤치마크 투자조합',
  18500000000,
  '2025-03-14',
  '{"fund_id":"AS20250191","registration_date":"2025-03-14","expiry_date":"2030-03-13","formation_total_amount":"185.0","investment_character_code":"16","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP19860004","operator_company_name":"한국투자파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"한국투자파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.628Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 97: 한국투자 밸류체인(VC) S2 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19860004',
  '한국투자 밸류체인(VC) S2 투자조합',
  10000000000,
  '2024-12-16',
  '{"fund_id":"AS20241353","registration_date":"2024-12-16","expiry_date":"2029-12-15","formation_total_amount":"100.0","investment_character_code":"16","industry_code":"9","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP19860004","operator_company_name":"한국투자파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"한국투자파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.628Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 98: 한국투자 밸류체인(VC) S1 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19860004',
  '한국투자 밸류체인(VC) S1 투자조합',
  81000000000,
  '2024-01-17',
  '{"fund_id":"AS20240045","registration_date":"2024-01-17","expiry_date":"2030-01-16","formation_total_amount":"810.0","investment_character_code":"16","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP19860004","operator_company_name":"한국투자파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"한국투자파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.628Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 99: 한국투자 바이오 글로벌 펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19860004',
  '한국투자 바이오 글로벌 펀드',
  350000000000,
  '2020-07-29',
  '{"fund_id":"AS20200405","registration_date":"2020-07-29","expiry_date":"2028-07-28","formation_total_amount":"3500.0","investment_character_code":"04","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"바이오","mother_fund_id":"MF00000001","operator_company_id":"OP19860004","operator_company_name":"한국투자파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"한국투자파트너스","investment_focus":["바이오","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.628Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 100: 한국투자 믿음성장 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19860004',
  '한국투자 믿음성장 투자조합',
  27500000000,
  '2021-12-21',
  '{"fund_id":"AS20211384","registration_date":"2021-12-21","expiry_date":"2026-12-20","formation_total_amount":"275.0","investment_character_code":"16","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP19860004","operator_company_name":"한국투자파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"한국투자파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.628Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Minimal Batch 2 completed! 50 fund records processed.
-- Progress: 100/3689 total records

