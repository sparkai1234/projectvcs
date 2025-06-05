-- VCS Fund MINIMAL UPSERT Batch 30/74 (Records 1451-1500)
-- MINIMAL: Only using basic columns that definitely exist
-- Generated from VCS API Scraper fund data
-- Generated at: 2025-06-05T00:40:21.833Z
-- Schema: Minimal fund_table structure (basic columns only)

-- MINIMAL FUND DATA (UPSERT - Safe for Duplicates)
-- Processing 50 fund records
-- Will INSERT new records or UPDATE existing ones

-- Record 1451: 엔슬 8호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20160031',
  '엔슬 8호 개인투자조합',
  180000000,
  '2022-04-08',
  '{"fund_id":"AS20220288","registration_date":"2022-04-08","expiry_date":"2027-04-07","formation_total_amount":"1.8","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20160031","operator_company_name":"엔슬파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"엔슬파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.833Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1452: 엔슬 7호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20160031',
  '엔슬 7호 개인투자조합',
  320000000,
  '2021-11-08',
  '{"fund_id":"AS20211041","registration_date":"2021-11-08","expiry_date":"2028-11-07","formation_total_amount":"3.2","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20160031","operator_company_name":"엔슬파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"엔슬파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.833Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1453: 엔슬 6호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20160031',
  '엔슬 6호 개인투자조합',
  210000000,
  '2021-10-29',
  '{"fund_id":"AS20211040","registration_date":"2021-10-29","expiry_date":"2028-10-28","formation_total_amount":"2.1","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20160031","operator_company_name":"엔슬파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"엔슬파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.833Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1454: 엔슬 4호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20160031',
  '엔슬 4호 개인투자조합',
  300000000,
  '2020-03-20',
  '{"fund_id":"AS20200133","registration_date":"2020-03-20","expiry_date":"2027-03-19","formation_total_amount":"3.0","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20160031","operator_company_name":"엔슬파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"엔슬파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.833Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1455: 엔슬 16호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20160031',
  '엔슬 16호 개인투자조합',
  110000000,
  '2024-02-13',
  '{"fund_id":"AS20240072","registration_date":"2024-02-13","expiry_date":"2030-02-12","formation_total_amount":"1.1","investment_character_code":"","industry_code":"3","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20160031","operator_company_name":"엔슬파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"엔슬파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.833Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1456: 엔슬 15호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20160031',
  '엔슬 15호 개인투자조합',
  200000000,
  '2023-06-27',
  '{"fund_id":"AS20230536","registration_date":"2023-06-27","expiry_date":"2029-06-26","formation_total_amount":"2.0","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20160031","operator_company_name":"엔슬파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"엔슬파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.833Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1457: 엔슬 14호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20160031',
  '엔슬 14호 개인투자조합',
  420000000,
  '2023-05-03',
  '{"fund_id":"AS20230339","registration_date":"2023-05-03","expiry_date":"2030-05-02","formation_total_amount":"4.2","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20160031","operator_company_name":"엔슬파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"엔슬파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.833Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1458: 엔슬 13호 벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20160031',
  '엔슬 13호 벤처투자조합',
  2050000000,
  '2023-05-03',
  '{"fund_id":"AS20230354","registration_date":"2023-05-03","expiry_date":"2030-05-02","formation_total_amount":"20.5","investment_character_code":"20","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20160031","operator_company_name":"엔슬파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"엔슬파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.833Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1459: 엔슬 11호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20160031',
  '엔슬 11호 개인투자조합',
  430000000,
  '2022-04-29',
  '{"fund_id":"AS20220428","registration_date":"2022-04-29","expiry_date":"2029-04-28","formation_total_amount":"4.3","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20160031","operator_company_name":"엔슬파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"엔슬파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.833Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1460: 엔슬 10호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20160031',
  '엔슬 10호 개인투자조합',
  550000000,
  '2022-03-31',
  '{"fund_id":"AS20220287","registration_date":"2022-03-31","expiry_date":"2028-03-30","formation_total_amount":"5.5","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20160031","operator_company_name":"엔슬파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"엔슬파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.833Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1461: 엔비에이치-코스넷 세미콘 넥스트 벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20160017',
  '엔비에이치-코스넷 세미콘 넥스트 벤처투자조합',
  2200000000,
  '2022-01-11',
  '{"fund_id":"AS20220036","registration_date":"2022-01-11","expiry_date":"2027-01-10","formation_total_amount":"22.0","investment_character_code":"25","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20160017","operator_company_name":"NBH캐피탈","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"NBH캐피탈","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.833Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1462: 엔비에이치-코스넷 세미콘 그로스 벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20160017',
  '엔비에이치-코스넷 세미콘 그로스 벤처투자조합',
  10000000000,
  '2021-12-30',
  '{"fund_id":"AS20220001","registration_date":"2021-12-30","expiry_date":"2026-12-29","formation_total_amount":"100.0","investment_character_code":"25","industry_code":"1","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20160017","operator_company_name":"NBH캐피탈","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"NBH캐피탈","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.833Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1463: 엔블록셀렉트투자조합제1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210507',
  '엔블록셀렉트투자조합제1호',
  2020000000,
  '2024-03-18',
  '{"fund_id":"AS20240208","registration_date":"2024-03-18","expiry_date":"2031-03-17","formation_total_amount":"20.2","investment_character_code":"28","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20210507","operator_company_name":"엔블록인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"엔블록인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.833Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1464: 엔브이씨-케이클라비스 2024 부산지역혁신 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20180040',
  '엔브이씨-케이클라비스 2024 부산지역혁신 투자조합',
  14000000000,
  '2025-04-23',
  '{"fund_id":"AS20250318","registration_date":"2025-04-23","expiry_date":"2033-04-22","formation_total_amount":"140.0","investment_character_code":"18","industry_code":"9","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000022","operator_company_id":"OP20180040","operator_company_name":"엔브이씨파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"엔브이씨파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.833Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1465: 엔브이씨 소부장 8호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20180040',
  '엔브이씨 소부장 8호 투자조합',
  4300000000,
  '2021-12-06',
  '{"fund_id":"AS20211235","registration_date":"2021-12-06","expiry_date":"2026-12-05","formation_total_amount":"43.0","investment_character_code":"25","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20180040","operator_company_name":"엔브이씨파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"엔브이씨파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.833Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1466: 엔브이씨 세컨더리 9호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20180040',
  '엔브이씨 세컨더리 9호 투자조합',
  4180000000,
  '2023-09-21',
  '{"fund_id":"AS20230854","registration_date":"2023-09-21","expiry_date":"2028-09-20","formation_total_amount":"41.8","investment_character_code":"16","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20180040","operator_company_name":"엔브이씨파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"엔브이씨파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.833Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1467: 엔브이씨 바이오헬스케어 2호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20180040',
  '엔브이씨 바이오헬스케어 2호 투자조합',
  3440000000,
  '2020-10-28',
  '{"fund_id":"AS20200601","registration_date":"2020-10-28","expiry_date":"2025-10-27","formation_total_amount":"34.4","investment_character_code":"01","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20180040","operator_company_name":"엔브이씨파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"엔브이씨파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.833Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1468: 엔브이씨 디지털 콘텐츠 6호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20180040',
  '엔브이씨 디지털 콘텐츠 6호 투자조합',
  2000000000,
  '2021-03-12',
  '{"fund_id":"AS20210193","registration_date":"2021-03-12","expiry_date":"2026-03-11","formation_total_amount":"20.0","investment_character_code":"24","industry_code":"6","investment_field_type":"문화","investment_field_detail_type":"문화 기타","mother_fund_id":"","operator_company_id":"OP20180040","operator_company_name":"엔브이씨파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"엔브이씨파트너스","investment_focus":["문화 기타","문화"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.833Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1469: 엔브이씨 기술혁신 7호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20180040',
  '엔브이씨 기술혁신 7호 투자조합',
  2310000000,
  '2021-11-25',
  '{"fund_id":"AS20211190","registration_date":"2021-11-25","expiry_date":"2026-11-24","formation_total_amount":"23.1","investment_character_code":"02","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20180040","operator_company_name":"엔브이씨파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"엔브이씨파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.833Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1470: 엔브이씨 게임-컨텐츠 3호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20180040',
  '엔브이씨 게임-컨텐츠 3호 투자조합',
  3200000000,
  '2019-01-18',
  '{"fund_id":"AS20190030","registration_date":"2019-01-18","expiry_date":"2025-12-31","formation_total_amount":"32.0","investment_character_code":"25","industry_code":"6","investment_field_type":"문화","investment_field_detail_type":"문화 기타","mother_fund_id":"","operator_company_id":"OP20180040","operator_company_name":"엔브이씨파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"엔브이씨파트너스","investment_focus":["문화 기타","문화"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.833Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1471: 엔브이씨 4차 산업혁명 5호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20180040',
  '엔브이씨 4차 산업혁명 5호 투자조합',
  2040000000,
  '2020-08-10',
  '{"fund_id":"AS20200408","registration_date":"2020-08-10","expiry_date":"2025-08-09","formation_total_amount":"20.4","investment_character_code":"01","industry_code":"6","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20180040","operator_company_name":"엔브이씨파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"엔브이씨파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.833Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1472: 엔브이씨 2019 바이오헬스케어 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20180040',
  '엔브이씨 2019 바이오헬스케어 투자조합',
  6120000000,
  '2019-10-22',
  '{"fund_id":"AS20190467","registration_date":"2019-10-22","expiry_date":"2026-10-21","formation_total_amount":"61.2","investment_character_code":"04","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20180040","operator_company_name":"엔브이씨파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"엔브이씨파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.833Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1473: 엔더블류브이피-BSK 코스메틱 투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20100012',
  '엔더블류브이피-BSK 코스메틱 투자조합 1호',
  2170000000,
  '2024-11-15',
  '{"fund_id":"AS20241142","registration_date":"2024-11-15","expiry_date":"2029-11-14","formation_total_amount":"21.7","investment_character_code":"03","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"부품소재","mother_fund_id":"","operator_company_id":"OP20100012","operator_company_name":"비에스케이인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"비에스케이인베스트먼트","investment_focus":["부품소재","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.833Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1474: 엑스트라마일 임팩트 6호 벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20110015',
  '엑스트라마일 임팩트 6호 벤처투자조합',
  10000000000,
  '2023-11-13',
  '{"fund_id":"AS20231070","registration_date":"2023-11-13","expiry_date":"2031-11-12","formation_total_amount":"100.0","investment_character_code":"20","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20110015","operator_company_name":"엠와이소셜컴퍼니","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"엠와이소셜컴퍼니","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.833Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1475: 엑스트라마일 임팩트 5호 벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20110015',
  '엑스트라마일 임팩트 5호 벤처투자조합',
  6000000000,
  '2021-12-20',
  '{"fund_id":"AS20211360","registration_date":"2021-12-20","expiry_date":"2029-12-19","formation_total_amount":"60.0","investment_character_code":"24","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20110015","operator_company_name":"엠와이소셜컴퍼니","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"엠와이소셜컴퍼니","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.833Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1476: 엑스트라마일 임팩트 4호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20110015',
  '엑스트라마일 임팩트 4호 개인투자조합',
  640000000,
  '2022-06-21',
  '{"fund_id":"AS20220666","registration_date":"2022-06-21","expiry_date":"2029-06-20","formation_total_amount":"6.4","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20110015","operator_company_name":"엠와이소셜컴퍼니","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"엠와이소셜컴퍼니","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.833Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1477: 엑스트라마일 임팩트 3호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20110015',
  '엑스트라마일 임팩트 3호 개인투자조합',
  1050000000,
  '2021-08-12',
  '{"fund_id":"AS20210701","registration_date":"2021-08-12","expiry_date":"2028-08-11","formation_total_amount":"10.5","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20110015","operator_company_name":"엠와이소셜컴퍼니","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"엠와이소셜컴퍼니","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.833Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1478: 엑스트라마일 임팩트 2호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20110015',
  '엑스트라마일 임팩트 2호 개인투자조합',
  2000000000,
  '2020-02-25',
  '{"fund_id":"AS20200085","registration_date":"2020-02-25","expiry_date":"2027-02-24","formation_total_amount":"20.0","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"MF00000001","operator_company_id":"OP20110015","operator_company_name":"엠와이소셜컴퍼니","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"엠와이소셜컴퍼니","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.833Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1479: 엑스트라마일 임팩트 1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20110015',
  '엑스트라마일 임팩트 1호',
  1000000000,
  '2019-07-04',
  '{"fund_id":"AS20190277","registration_date":"2019-07-04","expiry_date":"2026-07-03","formation_total_amount":"10.0","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20110015","operator_company_name":"엠와이소셜컴퍼니","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"엠와이소셜컴퍼니","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.833Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1480: 엑스트라마일 베트남 1호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20110015',
  '엑스트라마일 베트남 1호 개인투자조합',
  260000000,
  '2023-07-12',
  '{"fund_id":"AS20230579","registration_date":"2023-07-12","expiry_date":"2031-07-11","formation_total_amount":"2.6","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20110015","operator_company_name":"엠와이소셜컴퍼니","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"엠와이소셜컴퍼니","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.833Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1481: 엑스퀘어드 포디움 벤처펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20220038',
  '엑스퀘어드 포디움 벤처펀드',
  2000000000,
  '2022-06-27',
  '{"fund_id":"AS20220713","registration_date":"2022-06-27","expiry_date":"2027-06-26","formation_total_amount":"20.0","investment_character_code":"16","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20220038","operator_company_name":"엑스퀘어드","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"엑스퀘어드","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.834Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1482: 엑스퀘어드 디스커버리 벤처펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20220038',
  '엑스퀘어드 디스커버리 벤처펀드',
  2580000000,
  '2022-04-04',
  '{"fund_id":"AS20220378","registration_date":"2022-04-04","expiry_date":"2027-04-03","formation_total_amount":"25.8","investment_character_code":"16","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20220038","operator_company_name":"엑스퀘어드","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"엑스퀘어드","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.834Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1483: 엑스퀘어드 넥스트 벤처펀드 제3호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20220038',
  '엑스퀘어드 넥스트 벤처펀드 제3호',
  25000000000,
  '2024-01-08',
  '{"fund_id":"AS20240019","registration_date":"2024-01-08","expiry_date":"2034-01-07","formation_total_amount":"250.0","investment_character_code":"20","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20220038","operator_company_name":"엑스퀘어드","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"엑스퀘어드","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.834Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1484: 엑스퀘어드 넥스트 벤처펀드 제2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20220038',
  '엑스퀘어드 넥스트 벤처펀드 제2호',
  6260000000,
  '2022-03-22',
  '{"fund_id":"AS20220327","registration_date":"2022-03-22","expiry_date":"2027-03-21","formation_total_amount":"62.6","investment_character_code":"20","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20220038","operator_company_name":"엑스퀘어드","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"엑스퀘어드","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.834Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1485: 엑스퀘어드 넥스트 벤처펀드 제1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20220038',
  '엑스퀘어드 넥스트 벤처펀드 제1호',
  9000000000,
  '2022-01-27',
  '{"fund_id":"AS20220098","registration_date":"2022-01-27","expiry_date":"2027-01-26","formation_total_amount":"90.0","investment_character_code":"16","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20220038","operator_company_name":"엑스퀘어드","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"엑스퀘어드","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.834Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1486: 엑스코나 배터리 얼라이언스 펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20220038',
  '엑스코나 배터리 얼라이언스 펀드',
  11110000000,
  '2024-07-16',
  '{"fund_id":"AS20240659","registration_date":"2024-07-16","expiry_date":"2029-07-15","formation_total_amount":"111.1","investment_character_code":"20","industry_code":"4","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20220038","operator_company_name":"엑스퀘어드","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"엑스퀘어드","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.834Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1487: 엑스엘바이오-이노스타트업 개인투자조합 4호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200331',
  '엑스엘바이오-이노스타트업 개인투자조합 4호',
  430000000,
  '2021-04-26',
  '{"fund_id":"AS20210314","registration_date":"2021-04-26","expiry_date":"2026-04-25","formation_total_amount":"4.3","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200331","operator_company_name":"더이노베이터스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"더이노베이터스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.834Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1488: 엑스시공(X-SIGONG) IP 투자조합 제2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190163',
  '엑스시공(X-SIGONG) IP 투자조합 제2호',
  100000000,
  '2021-04-12',
  '{"fund_id":"AS20210274","registration_date":"2021-04-12","expiry_date":"2026-04-11","formation_total_amount":"1.0","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190163","operator_company_name":"컴퍼니엑스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"컴퍼니엑스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.834Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1489: 엑스 시공특허 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190163',
  '엑스 시공특허 투자조합',
  470000000,
  '2022-07-29',
  '{"fund_id":"AS20220846","registration_date":"2022-07-29","expiry_date":"2027-07-28","formation_total_amount":"4.7","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190163","operator_company_name":"컴퍼니엑스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"컴퍼니엑스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.834Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1490: 엑스 시공아이피 투자조합 제8호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190163',
  '엑스 시공아이피 투자조합 제8호',
  420000000,
  '2023-09-21',
  '{"fund_id":"AS20230792","registration_date":"2023-09-21","expiry_date":"2028-09-20","formation_total_amount":"4.2","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190163","operator_company_name":"컴퍼니엑스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"컴퍼니엑스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.834Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1491: 엑스 시공아이피 투자조합 제7호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190163',
  '엑스 시공아이피 투자조합 제7호',
  120000000,
  '2023-08-25',
  '{"fund_id":"AS20230744","registration_date":"2023-08-25","expiry_date":"2028-08-24","formation_total_amount":"1.2","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190163","operator_company_name":"컴퍼니엑스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"컴퍼니엑스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.834Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1492: 엑스 시공아이피 투자조합 제6호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190163',
  '엑스 시공아이피 투자조합 제6호',
  230000000,
  '2023-08-25',
  '{"fund_id":"AS20230708","registration_date":"2023-08-25","expiry_date":"2028-08-24","formation_total_amount":"2.3","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190163","operator_company_name":"컴퍼니엑스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"컴퍼니엑스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.834Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1493: 엑스 시공아이피 투자조합 제5호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190163',
  '엑스 시공아이피 투자조합 제5호',
  230000000,
  '2023-01-11',
  '{"fund_id":"AS20230034","registration_date":"2023-01-11","expiry_date":"2028-01-10","formation_total_amount":"2.3","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190163","operator_company_name":"컴퍼니엑스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"컴퍼니엑스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.834Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1494: 엑스 시공아이피 투자조합 제3호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190163',
  '엑스 시공아이피 투자조합 제3호',
  120000000,
  '2022-02-17',
  '{"fund_id":"AS20220153","registration_date":"2022-02-17","expiry_date":"2027-02-16","formation_total_amount":"1.2","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190163","operator_company_name":"컴퍼니엑스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"컴퍼니엑스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.834Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1495: 엑스 시공 아이피 개인투자조합 제4호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190163',
  '엑스 시공 아이피 개인투자조합 제4호',
  500000000,
  '2023-01-30',
  '{"fund_id":"AS20230046","registration_date":"2023-01-30","expiry_date":"2028-01-29","formation_total_amount":"5.0","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190163","operator_company_name":"컴퍼니엑스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"컴퍼니엑스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.834Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1496: 엑셀이노베이션펀드3호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200224',
  '엑셀이노베이션펀드3호',
  200000000,
  '2022-09-23',
  '{"fund_id":"AS20221039","registration_date":"2022-09-23","expiry_date":"2027-09-30","formation_total_amount":"2.0","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200224","operator_company_name":"로간","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"로간","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.834Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1497: 엑셀이노베이션펀드2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200224',
  '엑셀이노베이션펀드2호',
  200000000,
  '2022-10-04',
  '{"fund_id":"AS20221091","registration_date":"2022-10-04","expiry_date":"2027-10-10","formation_total_amount":"2.0","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200224","operator_company_name":"로간","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"로간","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.834Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1498: 엑셀이노베이션펀드1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200224',
  '엑셀이노베이션펀드1호',
  420000000,
  '2022-09-28',
  '{"fund_id":"AS20221087","registration_date":"2022-09-28","expiry_date":"2027-09-30","formation_total_amount":"4.2","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200224","operator_company_name":"로간","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"로간","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.834Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1499: 엑셀비전펀드3호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200224',
  '엑셀비전펀드3호',
  250000000,
  '2022-09-20',
  '{"fund_id":"AS20221024","registration_date":"2022-09-20","expiry_date":"2027-09-30","formation_total_amount":"2.5","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200224","operator_company_name":"로간","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"로간","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.834Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1500: 엑셀비전펀드2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200224',
  '엑셀비전펀드2호',
  100000000,
  '2021-08-05',
  '{"fund_id":"AS20210666","registration_date":"2021-08-05","expiry_date":"2026-08-04","formation_total_amount":"1.0","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200224","operator_company_name":"로간","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"로간","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.834Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Minimal Batch 30 completed! 50 fund records processed.
-- Progress: 1500/3689 total records

