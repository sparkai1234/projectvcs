-- VCS Fund MINIMAL UPSERT Batch 69/74 (Records 3401-3450)
-- MINIMAL: Only using basic columns that definitely exist
-- Generated from VCS API Scraper fund data
-- Generated at: 2025-06-05T00:40:22.039Z
-- Schema: Minimal fund_table structure (basic columns only)

-- MINIMAL FUND DATA (UPSERT - Safe for Duplicates)
-- Processing 50 fund records
-- Will INSERT new records or UPDATE existing ones

-- Record 3401: YUTH 대학창업기업 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20110012',
  'YUTH 대학창업기업 개인투자조합',
  3000000000,
  '2017-08-29',
  '{"fund_id":"AS20170085","registration_date":"2017-08-29","expiry_date":"2025-08-28","formation_total_amount":"30.0","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"MF00000001","operator_company_id":"OP20110012","operator_company_name":"연세대학교기술지주","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"연세대학교기술지주","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.039Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3402: YK-컴퍼니에이 바이오 투자조합 2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20180057',
  'YK-컴퍼니에이 바이오 투자조합 2호',
  550000000,
  '2021-06-24',
  '{"fund_id":"AS20210513","registration_date":"2021-06-24","expiry_date":"2026-06-23","formation_total_amount":"5.5","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20180057","operator_company_name":"컴퍼니에이","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"컴퍼니에이","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.039Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3403: YK-컴퍼니에이 바이오 투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20180057',
  'YK-컴퍼니에이 바이오 투자조합 1호',
  620000000,
  '2021-06-24',
  '{"fund_id":"AS20210477","registration_date":"2021-06-24","expiry_date":"2026-06-23","formation_total_amount":"6.2","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20180057","operator_company_name":"컴퍼니에이","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"컴퍼니에이","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.039Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3404: Y&A스타트업투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20150027',
  'Y&A스타트업투자조합1호',
  240000000,
  '2017-12-04',
  '{"fund_id":"AS20180120","registration_date":"2017-12-04","expiry_date":"2025-12-03","formation_total_amount":"2.4","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20150027","operator_company_name":"와이앤아처","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"와이앤아처","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.039Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3405: X-SIGONG IP 투자조합 제1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190163',
  'X-SIGONG IP 투자조합 제1호',
  100000000,
  '2020-09-08',
  '{"fund_id":"AS20200476","registration_date":"2020-09-08","expiry_date":"2025-09-07","formation_total_amount":"1.0","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190163","operator_company_name":"컴퍼니엑스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"컴퍼니엑스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.040Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3406: WP(더블유피) 바이오 헬스케어 1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190417',
  'WP(더블유피) 바이오 헬스케어 1호',
  1640000000,
  '2020-04-28',
  '{"fund_id":"AS20200184","registration_date":"2020-04-28","expiry_date":"2027-04-27","formation_total_amount":"16.4","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190417","operator_company_name":"와이드앤파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"와이드앤파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.040Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3407: WE지방기업육성펀드1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190174',
  'WE지방기업육성펀드1호',
  16000000000,
  '2019-11-25',
  '{"fund_id":"AS20190558","registration_date":"2019-11-25","expiry_date":"2027-11-24","formation_total_amount":"160.0","investment_character_code":"18","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20190174","operator_company_name":"위벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"위벤처스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.040Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3408: WE일자리펀드1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190174',
  'WE일자리펀드1호',
  30000000000,
  '2021-01-04',
  '{"fund_id":"AS20210023","registration_date":"2021-01-04","expiry_date":"2029-01-03","formation_total_amount":"300.0","investment_character_code":"14","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20190174","operator_company_name":"위벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"위벤처스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.040Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3409: UNOi 블록버스터 디스커버리 벤처펀드 1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20180006',
  'UNOi 블록버스터 디스커버리 벤처펀드 1호',
  15000000000,
  '2018-04-16',
  '{"fund_id":"AS20180162","registration_date":"2018-04-16","expiry_date":"2028-04-15","formation_total_amount":"150.0","investment_character_code":"01","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20180006","operator_company_name":"브이플랫폼인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"브이플랫폼인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.040Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3410: Translink글로벌파트너쉽청년창업투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200513',
  'Translink글로벌파트너쉽청년창업투자조합',
  35000000000,
  '2017-12-29',
  '{"fund_id":"AS20180026","registration_date":"2017-12-29","expiry_date":"2025-12-28","formation_total_amount":"350.0","investment_character_code":"21","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20200513","operator_company_name":"트랜스링크인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"트랜스링크인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.040Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3411: TGCK 한중문화산업공동발전투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20140005',
  'TGCK 한중문화산업공동발전투자조합',
  47060000000,
  '2016-05-31',
  '{"fund_id":"AS20160102","registration_date":"2016-05-31","expiry_date":"2026-05-30","formation_total_amount":"470.6","investment_character_code":"24","industry_code":"6","investment_field_type":"문화","investment_field_detail_type":"문화 기타","mother_fund_id":"MF00000001","operator_company_id":"OP20140005","operator_company_name":"티지씨케이파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"티지씨케이파트너스","investment_focus":["문화 기타","문화"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.040Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3412: TAP Start-up(탭 스타트업) 투자조합 제3호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190269',
  'TAP Start-up(탭 스타트업) 투자조합 제3호',
  110000000,
  '2021-01-12',
  '{"fund_id":"AS20210031","registration_date":"2021-01-12","expiry_date":"2026-01-11","formation_total_amount":"1.1","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190269","operator_company_name":"탭엔젤파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"탭엔젤파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.040Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3413: TAP Start-up(탭 스타트업) 투자조합 제2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190269',
  'TAP Start-up(탭 스타트업) 투자조합 제2호',
  430000000,
  '2020-06-08',
  '{"fund_id":"AS20200252","registration_date":"2020-06-08","expiry_date":"2027-06-07","formation_total_amount":"4.3","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190269","operator_company_name":"탭엔젤파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"탭엔젤파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.040Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3414: TAP Start-up 투자조합 제6호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190269',
  'TAP Start-up 투자조합 제6호',
  290000000,
  '2021-07-23',
  '{"fund_id":"AS20210611","registration_date":"2021-07-23","expiry_date":"2026-07-22","formation_total_amount":"2.9","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190269","operator_company_name":"탭엔젤파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"탭엔젤파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.040Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3415: TAP Scale-up 투자조합 제2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190269',
  'TAP Scale-up 투자조합 제2호',
  1260000000,
  '2022-01-14',
  '{"fund_id":"AS20220045","registration_date":"2022-01-14","expiry_date":"2027-01-13","formation_total_amount":"12.6","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190269","operator_company_name":"탭엔젤파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"탭엔젤파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.040Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3416: TAP Scale-up 투자조합 제1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190269',
  'TAP Scale-up 투자조합 제1호',
  220000000,
  '2021-09-27',
  '{"fund_id":"AS20210892","registration_date":"2021-09-27","expiry_date":"2026-09-26","formation_total_amount":"2.2","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190269","operator_company_name":"탭엔젤파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"탭엔젤파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.040Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3417: TAP BIO 투자조합 제7호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190269',
  'TAP BIO 투자조합 제7호',
  320000000,
  '2021-05-31',
  '{"fund_id":"AS20210397","registration_date":"2021-05-31","expiry_date":"2026-05-30","formation_total_amount":"3.2","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190269","operator_company_name":"탭엔젤파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"탭엔젤파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.040Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3418: TAP BIO 투자조합 제6호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190269',
  'TAP BIO 투자조합 제6호',
  420000000,
  '2021-05-17',
  '{"fund_id":"AS20210372","registration_date":"2021-05-17","expiry_date":"2026-05-16","formation_total_amount":"4.2","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190269","operator_company_name":"탭엔젤파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"탭엔젤파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.040Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3419: TAP BIO 투자조합 제5호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190269',
  'TAP BIO 투자조합 제5호',
  950000000,
  '2021-05-18',
  '{"fund_id":"AS20210377","registration_date":"2021-05-18","expiry_date":"2026-05-17","formation_total_amount":"9.5","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190269","operator_company_name":"탭엔젤파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"탭엔젤파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.040Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3420: SYP 전북특구 스타트업 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20160040',
  'SYP 전북특구 스타트업 개인투자조합',
  110000000,
  '2019-08-23',
  '{"fund_id":"AS20190367","registration_date":"2019-08-23","expiry_date":"2027-08-22","formation_total_amount":"1.1","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20160040","operator_company_name":"에스와이피","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"에스와이피","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.040Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3421: SWG20스타트업 동반성장 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20140013',
  'SWG20스타트업 동반성장 개인투자조합',
  340000000,
  '2020-11-23',
  '{"fund_id":"AS20200672","registration_date":"2020-11-23","expiry_date":"2025-12-30","formation_total_amount":"3.4","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20140013","operator_company_name":"더인벤션랩","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"더인벤션랩","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.040Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3422: SV글로벌 바이오·헬스케어 펀드2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20060002',
  'SV글로벌 바이오·헬스케어 펀드2호',
  53000000000,
  '2017-06-28',
  '{"fund_id":"AS20170065","registration_date":"2017-06-28","expiry_date":"2025-06-27","formation_total_amount":"530.0","investment_character_code":"04","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"바이오","mother_fund_id":"MF00000001","operator_company_id":"OP20060002","operator_company_name":"에스브이인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"에스브이인베스트먼트","investment_focus":["바이오","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.040Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3423: SV 한·중 문화-ICT융합펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20060002',
  'SV 한·중 문화-ICT융합펀드',
  46000000000,
  '2015-11-24',
  '{"fund_id":"AS20150091","registration_date":"2015-11-24","expiry_date":"2025-11-23","formation_total_amount":"460.0","investment_character_code":"24","industry_code":"6","investment_field_type":"문화","investment_field_detail_type":"문화 기타","mother_fund_id":"MF00000001","operator_company_id":"OP20060002","operator_company_name":"에스브이인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"에스브이인베스트먼트","investment_focus":["문화 기타","문화"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.040Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3424: SV Gap-Coverage펀드 2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20060002',
  'SV Gap-Coverage펀드 2호',
  68100000000,
  '2016-07-28',
  '{"fund_id":"AS20160050","registration_date":"2016-07-28","expiry_date":"2025-07-27","formation_total_amount":"681.0","investment_character_code":"16","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20060002","operator_company_name":"에스브이인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"에스브이인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.040Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3425: SUP-2호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200245',
  'SUP-2호 개인투자조합',
  1100000000,
  '2021-01-12',
  '{"fund_id":"AS20210024","registration_date":"2021-01-12","expiry_date":"2026-01-11","formation_total_amount":"11.0","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200245","operator_company_name":"스케일업파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"스케일업파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.040Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3426: SUP-1호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200245',
  'SUP-1호 개인투자조합',
  1130000000,
  '2020-09-16',
  '{"fund_id":"AS20200491","registration_date":"2020-09-16","expiry_date":"2025-09-15","formation_total_amount":"11.3","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200245","operator_company_name":"스케일업파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"스케일업파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.040Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3427: SLi 퀀텀 성장 펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20000040',
  'SLi 퀀텀 성장 펀드',
  96000000000,
  '2017-06-22',
  '{"fund_id":"AS20170061","registration_date":"2017-06-22","expiry_date":"2025-06-21","formation_total_amount":"960.0","investment_character_code":"01","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20000040","operator_company_name":"에스엘인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"에스엘인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.040Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3428: SLi 소재부품 투자펀드 2014-1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20000040',
  'SLi 소재부품 투자펀드 2014-1호',
  30000000000,
  '2014-07-16',
  '{"fund_id":"AS20140027","registration_date":"2014-07-16","expiry_date":"2025-07-15","formation_total_amount":"300.0","investment_character_code":"03","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"부품소재","mother_fund_id":"MF00000001","operator_company_id":"OP20000040","operator_company_name":"에스엘인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"에스엘인베스트먼트","investment_focus":["부품소재","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.040Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3429: SLi Next  이노베이션 펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20000040',
  'SLi Next  이노베이션 펀드',
  75000000000,
  '2020-12-09',
  '{"fund_id":"AS20200761","registration_date":"2020-12-09","expiry_date":"2028-12-08","formation_total_amount":"750.0","investment_character_code":"02","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001,MF00000011","operator_company_id":"OP20000040","operator_company_name":"에스엘인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"에스엘인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.040Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3430: SLi Growth Accel 2 투자펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20000040',
  'SLi Growth Accel 2 투자펀드',
  20000000000,
  '2013-12-23',
  '{"fund_id":"AS20130022","registration_date":"2013-12-23","expiry_date":"2025-06-22","formation_total_amount":"200.0","investment_character_code":"01","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20000040","operator_company_name":"에스엘인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"에스엘인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.040Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3431: SK-KNET창조경제혁신투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20080005',
  'SK-KNET창조경제혁신투자조합',
  30000000000,
  '2015-12-18',
  '{"fund_id":"AS20150033","registration_date":"2015-12-18","expiry_date":"2025-12-17","formation_total_amount":"300.0","investment_character_code":"20","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20080005","operator_company_name":"케이넷투자파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"케이넷투자파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.040Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3432: SK-KNET 청년창업투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20080005',
  'SK-KNET 청년창업투자조합',
  30000000000,
  '2014-12-16',
  '{"fund_id":"AS20140079","registration_date":"2014-12-16","expiry_date":"2025-12-15","formation_total_amount":"300.0","investment_character_code":"20","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20080005","operator_company_name":"케이넷투자파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"케이넷투자파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.040Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3433: SIP-KIS 2019 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20100003',
  'SIP-KIS 2019 투자조합',
  10750000000,
  '2019-09-05',
  '{"fund_id":"AS20190436","registration_date":"2019-09-05","expiry_date":"2025-09-04","formation_total_amount":"107.5","investment_character_code":"01","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20100003","operator_company_name":"서울투자파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"서울투자파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.040Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3434: SGI-GS칼텍스 전남 바이오케미칼 투자펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20070004',
  'SGI-GS칼텍스 전남 바이오케미칼 투자펀드',
  15750000000,
  '2016-03-10',
  '{"fund_id":"AS20160065","registration_date":"2016-03-10","expiry_date":"2026-03-09","formation_total_amount":"157.5","investment_character_code":"04","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20070004","operator_company_name":"삼호그린인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"삼호그린인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.040Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3435: SGI 퍼스트펭귄스타트업펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20070004',
  'SGI 퍼스트펭귄스타트업펀드',
  39000000000,
  '2014-11-24',
  '{"fund_id":"AS20140012","registration_date":"2014-11-24","expiry_date":"2025-11-23","formation_total_amount":"390.0","investment_character_code":"20","industry_code":"1","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20070004","operator_company_name":"삼호그린인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"삼호그린인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.040Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3436: SGI 유니콘 스타트업 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20070004',
  'SGI 유니콘 스타트업 투자조합',
  30000000000,
  '2018-09-18',
  '{"fund_id":"AS20180273","registration_date":"2018-09-18","expiry_date":"2026-09-18","formation_total_amount":"300.0","investment_character_code":"20","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20070004","operator_company_name":"삼호그린인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"삼호그린인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.040Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3437: SGI 신성장 메짜닌펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20070004',
  'SGI 신성장 메짜닌펀드',
  5000000000,
  '2011-04-14',
  '{"fund_id":"AS20110007","registration_date":"2011-04-14","expiry_date":"2026-04-13","formation_total_amount":"50.0","investment_character_code":"01","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20070004","operator_company_name":"삼호그린인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"삼호그린인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.040Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3438: SGI 세컨더리 투자조합 제2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20070004',
  'SGI 세컨더리 투자조합 제2호',
  8400000000,
  '2017-12-05',
  '{"fund_id":"AS20170146","registration_date":"2017-12-05","expiry_date":"2026-12-04","formation_total_amount":"84.0","investment_character_code":"16","industry_code":"9","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20070004","operator_company_name":"삼호그린인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"삼호그린인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.040Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3439: SGI Dolphin 중소벤처기업 M&A 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20070004',
  'SGI Dolphin 중소벤처기업 M&A 투자조합',
  50530000000,
  '2019-06-13',
  '{"fund_id":"AS20190246","registration_date":"2019-06-13","expiry_date":"2027-06-12","formation_total_amount":"505.3","investment_character_code":"17","industry_code":"4","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20070004","operator_company_name":"삼호그린인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"삼호그린인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.040Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3440: SF 글로벌라이징 펀드 1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20160035',
  'SF 글로벌라이징 펀드 1호',
  230000000,
  '2020-08-28',
  '{"fund_id":"AS20200448","registration_date":"2020-08-28","expiry_date":"2025-12-30","formation_total_amount":"2.3","investment_character_code":"","industry_code":"6","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20160035","operator_company_name":"스마트파머","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"스마트파머","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.040Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3441: SETI고급기술창업초기투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200513',
  'SETI고급기술창업초기투자조합',
  18700000000,
  '2017-08-01',
  '{"fund_id":"AS20170080","registration_date":"2017-08-01","expiry_date":"2025-07-31","formation_total_amount":"187.0","investment_character_code":"20","industry_code":"4","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20200513","operator_company_name":"트랜스링크인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"트랜스링크인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.040Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3442: SETI-KIF창업투자조합IV
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200513',
  'SETI-KIF창업투자조합IV',
  27250000000,
  '2019-11-13',
  '{"fund_id":"AS20190516","registration_date":"2019-11-13","expiry_date":"2027-11-12","formation_total_amount":"272.5","investment_character_code":"20","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20200513","operator_company_name":"트랜스링크인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"트랜스링크인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.040Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3443: SBI-프렌드 EV 1호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19860008',
  'SBI-프렌드 EV 1호 투자조합',
  11600000000,
  '2020-09-07',
  '{"fund_id":"AS20200480","registration_date":"2020-09-07","expiry_date":"2025-09-06","formation_total_amount":"116.0","investment_character_code":"25","industry_code":"4","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP19860008","operator_company_name":"에스비아이인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"에스비아이인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.040Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3444: SBI-성장사다리 코넥스 활성화펀드 제2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19860008',
  'SBI-성장사다리 코넥스 활성화펀드 제2호',
  38400000000,
  '2017-10-23',
  '{"fund_id":"AS20170125","registration_date":"2017-10-23","expiry_date":"2025-10-22","formation_total_amount":"384.0","investment_character_code":"13","industry_code":"6","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP19860008","operator_company_name":"에스비아이인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"에스비아이인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.040Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3445: SBI-성장사다리 코넥스 활성화펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19860008',
  'SBI-성장사다리 코넥스 활성화펀드',
  40000000000,
  '2014-08-22',
  '{"fund_id":"AS20140031","registration_date":"2014-08-22","expiry_date":"2025-08-21","formation_total_amount":"400.0","investment_character_code":"13","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP19860008","operator_company_name":"에스비아이인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"에스비아이인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.040Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3446: SBI-KIS 밸류업 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19860008',
  'SBI-KIS 밸류업 투자조합',
  13500000000,
  '2018-06-14',
  '{"fund_id":"AS20180182","registration_date":"2018-06-14","expiry_date":"2025-06-13","formation_total_amount":"135.0","investment_character_code":"01","industry_code":"9","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP19860008","operator_company_name":"에스비아이인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"에스비아이인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.040Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3447: SBI-KIS 2019 BIC(Best-In-Class) 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19860008',
  'SBI-KIS 2019 BIC(Best-In-Class) 투자조합',
  17500000000,
  '2019-07-17',
  '{"fund_id":"AS20190298","registration_date":"2019-07-17","expiry_date":"2025-07-16","formation_total_amount":"175.0","investment_character_code":"01","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP19860008","operator_company_name":"에스비아이인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"에스비아이인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.040Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3448: SBI 헬스케어 펀드 제1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19860008',
  'SBI 헬스케어 펀드 제1호',
  7900000000,
  '2016-12-15',
  '{"fund_id":"AS20160220","registration_date":"2016-12-15","expiry_date":"2025-12-14","formation_total_amount":"79.0","investment_character_code":"25","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"바이오","mother_fund_id":"","operator_company_id":"OP19860008","operator_company_name":"에스비아이인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"에스비아이인베스트먼트","investment_focus":["바이오","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.040Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3449: SBI 크로스보더 어드밴티지 펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19860008',
  'SBI 크로스보더 어드밴티지 펀드',
  81000000000,
  '2017-03-17',
  '{"fund_id":"AS20170027","registration_date":"2017-03-17","expiry_date":"2026-03-16","formation_total_amount":"810.0","investment_character_code":"15","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP19860008","operator_company_name":"에스비아이인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"에스비아이인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.040Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3450: SBI 커머스 이노베이션 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19860008',
  'SBI 커머스 이노베이션 투자조합',
  21200000000,
  '2018-05-28',
  '{"fund_id":"AS20180178","registration_date":"2018-05-28","expiry_date":"2025-09-20","formation_total_amount":"212.0","investment_character_code":"16","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP19860008","operator_company_name":"에스비아이인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"에스비아이인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.040Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Minimal Batch 69 completed! 50 fund records processed.
-- Progress: 3450/3689 total records

