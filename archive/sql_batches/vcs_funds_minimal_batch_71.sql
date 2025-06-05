-- VCS Fund MINIMAL UPSERT Batch 71/74 (Records 3501-3550)
-- MINIMAL: Only using basic columns that definitely exist
-- Generated from VCS API Scraper fund data
-- Generated at: 2025-06-05T00:40:22.048Z
-- Schema: Minimal fund_table structure (basic columns only)

-- MINIMAL FUND DATA (UPSERT - Safe for Duplicates)
-- Processing 50 fund records
-- Will INSERT new records or UPDATE existing ones

-- Record 3501: KT청년창업DNA투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20150023',
  'KT청년창업DNA투자조합',
  24000000000,
  '2020-05-28',
  '{"fund_id":"AS20200232","registration_date":"2020-05-28","expiry_date":"2028-05-27","formation_total_amount":"240.0","investment_character_code":"21","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20150023","operator_company_name":"케이티인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"케이티인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.048Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3502: KTBN 방송영상콘텐츠 전문투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20080009',
  'KTBN 방송영상콘텐츠 전문투자조합',
  10000000000,
  '2016-11-28',
  '{"fund_id":"AS20160206","registration_date":"2016-11-28","expiry_date":"2025-11-27","formation_total_amount":"100.0","investment_character_code":"24","industry_code":"6","investment_field_type":"문화","investment_field_detail_type":"영상(영화+드라마+애니메이션)","mother_fund_id":"","operator_company_id":"OP20080009","operator_company_name":"우리벤처파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"우리벤처파트너스","investment_focus":["영상(영화+드라마+애니메이션)","문화"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.048Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3503: KTBN 미래콘텐츠일자리창출투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20080009',
  'KTBN 미래콘텐츠일자리창출투자조합',
  30000000000,
  '2018-10-24',
  '{"fund_id":"AS20180309","registration_date":"2018-10-24","expiry_date":"2026-10-23","formation_total_amount":"300.0","investment_character_code":"24","industry_code":"6","investment_field_type":"문화","investment_field_detail_type":"문화 기타","mother_fund_id":"MF00000001","operator_company_id":"OP20080009","operator_company_name":"우리벤처파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"우리벤처파트너스","investment_focus":["문화 기타","문화"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.048Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3504: KTBN 9호 디지털콘텐츠코리아 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20080009',
  'KTBN 9호 디지털콘텐츠코리아 투자조합',
  30000000000,
  '2016-03-30',
  '{"fund_id":"AS20160004","registration_date":"2016-03-30","expiry_date":"2026-03-29","formation_total_amount":"300.0","investment_character_code":"24","industry_code":"6","investment_field_type":"문화","investment_field_detail_type":"문화 기타","mother_fund_id":"MF00000001","operator_company_id":"OP20080009","operator_company_name":"우리벤처파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"우리벤처파트너스","investment_focus":["문화 기타","문화"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.048Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3505: KTBN 8호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20080009',
  'KTBN 8호 투자조합',
  46000000000,
  '2016-03-04',
  '{"fund_id":"AS20160053","registration_date":"2016-03-04","expiry_date":"2026-03-03","formation_total_amount":"460.0","investment_character_code":"26","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20080009","operator_company_name":"우리벤처파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"우리벤처파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.048Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3506: KTBN 18호 벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20080009',
  'KTBN 18호 벤처투자조합',
  281000000000,
  '2021-01-04',
  '{"fund_id":"AS20210018","registration_date":"2021-01-04","expiry_date":"2029-01-03","formation_total_amount":"2810.0","investment_character_code":"08","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20080009","operator_company_name":"우리벤처파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"우리벤처파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.048Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3507: KTBN 16호 벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20080009',
  'KTBN 16호 벤처투자조합',
  195000000000,
  '2018-12-28',
  '{"fund_id":"AS20190003","registration_date":"2018-12-28","expiry_date":"2026-12-27","formation_total_amount":"1950.0","investment_character_code":"20","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"일반 기타","mother_fund_id":"","operator_company_id":"OP20080009","operator_company_name":"우리벤처파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"우리벤처파트너스","investment_focus":["일반 기타","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.048Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3508: KTBN 13호 벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20080009',
  'KTBN 13호 벤처투자조합',
  51000000000,
  '2017-12-29',
  '{"fund_id":"AS20180024","registration_date":"2017-12-29","expiry_date":"2025-12-28","formation_total_amount":"510.0","investment_character_code":"02","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"일반 기타","mother_fund_id":"MF00000001","operator_company_id":"OP20080009","operator_company_name":"우리벤처파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"우리벤처파트너스","investment_focus":["일반 기타","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.048Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3509: KTBN 11호 한중시너지펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20080009',
  'KTBN 11호 한중시너지펀드',
  166000000000,
  '2016-12-29',
  '{"fund_id":"AS20170007","registration_date":"2016-12-29","expiry_date":"2025-12-28","formation_total_amount":"1660.0","investment_character_code":"15","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"일반 기타","mother_fund_id":"MF00000001","operator_company_id":"OP20080009","operator_company_name":"우리벤처파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"우리벤처파트너스","investment_focus":["일반 기타","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.048Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3510: KTB-KORUS 펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20080009',
  'KTB-KORUS 펀드',
  8000000000,
  '2012-12-03',
  '{"fund_id":"AS20120021","registration_date":"2012-12-03","expiry_date":"2025-12-02","formation_total_amount":"80.0","investment_character_code":"15","industry_code":"9","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20080009","operator_company_name":"우리벤처파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"우리벤처파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.048Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3511: KSA-리벤처스 바이오테크 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200492',
  'KSA-리벤처스 바이오테크 투자조합',
  990000000,
  '2021-06-16',
  '{"fund_id":"AS20210458","registration_date":"2021-06-16","expiry_date":"2026-06-15","formation_total_amount":"9.9","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200492","operator_company_name":"리벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"리벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.048Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3512: KOVA 개인투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190187',
  'KOVA 개인투자조합 1호',
  100000000,
  '2021-08-05',
  '{"fund_id":"AS20210655","registration_date":"2021-08-05","expiry_date":"2026-07-28","formation_total_amount":"1.0","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190187","operator_company_name":"벤처기업협회","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"벤처기업협회","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.048Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3513: KoFC-SGI녹색산업투자조합제1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20070004',
  'KoFC-SGI녹색산업투자조합제1호',
  33500000000,
  '2010-07-07',
  '{"fund_id":"AS20100004","registration_date":"2010-07-07","expiry_date":"2027-07-31","formation_total_amount":"335.0","investment_character_code":"27","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"신성장","mother_fund_id":"","operator_company_id":"OP20070004","operator_company_name":"삼호그린인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"삼호그린인베스트먼트","investment_focus":["신성장","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.048Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3514: KOCP프로젝트1호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20100016',
  'KOCP프로젝트1호 투자조합',
  550000000,
  '2020-12-21',
  '{"fund_id":"AS20200793","registration_date":"2020-12-21","expiry_date":"2025-12-20","formation_total_amount":"5.5","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20100016","operator_company_name":"벤처스퀘어","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"벤처스퀘어","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.048Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3515: KOCP 제2호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200200',
  'KOCP 제2호 개인투자조합',
  480000000,
  '2021-10-14',
  '{"fund_id":"AS20210977","registration_date":"2021-10-14","expiry_date":"2026-10-13","formation_total_amount":"4.8","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200200","operator_company_name":"케이오씨파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"케이오씨파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.048Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3516: KOCP 제1호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200200',
  'KOCP 제1호 개인투자조합',
  240000000,
  '2020-12-15',
  '{"fund_id":"AS20200765","registration_date":"2020-12-15","expiry_date":"2025-12-14","formation_total_amount":"2.4","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200200","operator_company_name":"케이오씨파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"케이오씨파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.048Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3517: KIF-카카오 우리은행 기술금융투자펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20120008',
  'KIF-카카오 우리은행 기술금융투자펀드',
  76000000000,
  '2017-12-14',
  '{"fund_id":"AS20170140","registration_date":"2017-12-14","expiry_date":"2025-12-13","formation_total_amount":"760.0","investment_character_code":"09","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20120008","operator_company_name":"카카오벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"카카오벤처스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.048Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3518: KDBC-유티씨바이오헬스케어투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19880001',
  'KDBC-유티씨바이오헬스케어투자조합',
  11750000000,
  '2021-03-05',
  '{"fund_id":"AS20210166","registration_date":"2021-03-05","expiry_date":"2026-03-04","formation_total_amount":"117.5","investment_character_code":"04","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"바이오","mother_fund_id":"","operator_company_id":"OP19880001","operator_company_name":"유티씨인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"유티씨인베스트먼트","investment_focus":["바이오","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.048Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3519: KDB-LH 중견기업연합펀드1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20170010',
  'KDB-LH 중견기업연합펀드1호',
  41300000000,
  '2017-09-28',
  '{"fund_id":"AS20170118","registration_date":"2017-09-28","expiry_date":"2025-09-27","formation_total_amount":"413.0","investment_character_code":"01","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20170010","operator_company_name":"라이트하우스컴바인인베스트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"라이트하우스컴바인인베스트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.049Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3520: KC한국영화투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190006',
  'KC한국영화투자조합',
  16400000000,
  '2020-07-16',
  '{"fund_id":"AS20200335","registration_date":"2020-07-16","expiry_date":"2025-07-15","formation_total_amount":"164.0","investment_character_code":"24","industry_code":"6","investment_field_type":"문화","investment_field_detail_type":"영상(영화+드라마+애니메이션)","mother_fund_id":"MF00000001","operator_company_id":"OP20190006","operator_company_name":"케이씨벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"케이씨벤처스","investment_focus":["영상(영화+드라마+애니메이션)","문화"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.049Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3521: KC상생투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190006',
  'KC상생투자조합',
  42000000000,
  '2019-02-08',
  '{"fund_id":"AS20190058","registration_date":"2019-02-08","expiry_date":"2026-02-07","formation_total_amount":"420.0","investment_character_code":"01","industry_code":"6","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20190006","operator_company_name":"케이씨벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"케이씨벤처스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.049Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3522: KC 비바체 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190006',
  'KC 비바체 투자조합',
  25300000000,
  '2020-01-31',
  '{"fund_id":"AS20200051","registration_date":"2020-01-31","expiry_date":"2027-01-30","formation_total_amount":"253.0","investment_character_code":"01","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20190006","operator_company_name":"케이씨벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"케이씨벤처스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.049Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3523: KB-솔리더스 글로벌 헬스케어 펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19900001',
  'KB-솔리더스 글로벌 헬스케어 펀드',
  150000000000,
  '2016-01-25',
  '{"fund_id":"AS20160025","registration_date":"2016-01-25","expiry_date":"2026-01-24","formation_total_amount":"1500.0","investment_character_code":"04","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"바이오","mother_fund_id":"MF00000001","operator_company_id":"OP19900001","operator_company_name":"케이비인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"케이비인베스트먼트","investment_focus":["바이오","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.049Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3524: KB 코넥스 활성화 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19900001',
  'KB 코넥스 활성화 투자조합',
  32000000000,
  '2017-07-14',
  '{"fund_id":"AS20170078","registration_date":"2017-07-14","expiry_date":"2025-07-13","formation_total_amount":"320.0","investment_character_code":"13","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP19900001","operator_company_name":"케이비인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"케이비인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.049Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3525: KB 청년창업 3.0 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19900001',
  'KB 청년창업 3.0 투자조합',
  30000000000,
  '2017-12-29',
  '{"fund_id":"AS20180020","registration_date":"2017-12-29","expiry_date":"2026-12-28","formation_total_amount":"300.0","investment_character_code":"21","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP19900001","operator_company_name":"케이비인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"케이비인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.049Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3526: KB 지식재산 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19900001',
  'KB 지식재산 투자조합',
  50000000000,
  '2015-02-10',
  '{"fund_id":"AS20150027","registration_date":"2015-02-10","expiry_date":"2026-02-09","formation_total_amount":"500.0","investment_character_code":"09","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"특허","mother_fund_id":"MF00000001","operator_company_id":"OP19900001","operator_company_name":"케이비인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"케이비인베스트먼트","investment_focus":["특허","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.049Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3527: KB NEW콘텐츠 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19900001',
  'KB NEW콘텐츠 투자조합',
  24870000000,
  '2017-11-22',
  '{"fund_id":"AS20170134","registration_date":"2017-11-22","expiry_date":"2025-11-21","formation_total_amount":"248.7","investment_character_code":"24","industry_code":"6","investment_field_type":"문화","investment_field_detail_type":"문화 기타","mother_fund_id":"MF00000001","operator_company_id":"OP19900001","operator_company_name":"케이비인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"케이비인베스트먼트","investment_focus":["문화 기타","문화"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.049Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3528: KAKAO-CCVC 제주창조경제혁신펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20100009',
  'KAKAO-CCVC 제주창조경제혁신펀드',
  2000000000,
  '2016-06-03',
  '{"fund_id":"AS20160057","registration_date":"2016-06-03","expiry_date":"2026-06-02","formation_total_amount":"20.0","investment_character_code":"18","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20100009","operator_company_name":"쿨리지코너인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"쿨리지코너인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.049Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3529: KAI-KVIC 가상증강현실투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20000066',
  'KAI-KVIC 가상증강현실투자조합',
  20000000000,
  '2018-03-30',
  '{"fund_id":"AS20180152","registration_date":"2018-03-30","expiry_date":"2028-03-29","formation_total_amount":"200.0","investment_character_code":"02","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"IT","mother_fund_id":"MF00000001","operator_company_id":"OP20000066","operator_company_name":"코리아에셋투자증권","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"코리아에셋투자증권","investment_focus":["IT","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.049Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3530: KACC개인투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190073',
  'KACC개인투자조합1호',
  100000000,
  '2020-09-22',
  '{"fund_id":"AS20200518","registration_date":"2020-09-22","expiry_date":"2025-09-21","formation_total_amount":"1.0","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190073","operator_company_name":"케이액셀러레이터","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"케이액셀러레이터","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.049Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3531: K-Growth 크라우드 투스텝 펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20110007',
  'K-Growth 크라우드 투스텝 펀드',
  11000000000,
  '2016-03-21',
  '{"fund_id":"AS20160070","registration_date":"2016-03-21","expiry_date":"2026-03-20","formation_total_amount":"110.0","investment_character_code":"02","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20110007","operator_company_name":"마젤란기술투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"마젤란기술투자","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.049Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3532: JNP벤처스타개인투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20130005',
  'JNP벤처스타개인투자조합 1호',
  100000000,
  '2019-04-12',
  '{"fund_id":"AS20190138","registration_date":"2019-04-12","expiry_date":"2027-04-11","formation_total_amount":"1.0","investment_character_code":"","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20130005","operator_company_name":"제이엔피글로벌","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"제이엔피글로벌","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.049Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3533: JB With PLUS 3호 조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200038',
  'JB With PLUS 3호 조합',
  280000000,
  '2021-09-16',
  '{"fund_id":"AS20210855","registration_date":"2021-09-16","expiry_date":"2026-09-13","formation_total_amount":"2.8","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200038","operator_company_name":"제이비벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"제이비벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.049Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3534: ISU-콘텐츠코리아모험펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20000021',
  'ISU-콘텐츠코리아모험펀드',
  21500000000,
  '2020-07-30',
  '{"fund_id":"AS20200375","registration_date":"2020-07-30","expiry_date":"2027-07-29","formation_total_amount":"215.0","investment_character_code":"24","industry_code":"6","investment_field_type":"문화","investment_field_detail_type":"문화 기타","mother_fund_id":"MF00000001","operator_company_id":"OP20000021","operator_company_name":"이수창업투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"이수창업투자","investment_focus":["문화 기타","문화"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.049Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3535: ISU-위풍당당콘텐츠코리아펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20000021',
  'ISU-위풍당당콘텐츠코리아펀드',
  16000000000,
  '2015-07-06',
  '{"fund_id":"AS20150114","registration_date":"2015-07-06","expiry_date":"2025-10-05","formation_total_amount":"160.0","investment_character_code":"24","industry_code":"6","investment_field_type":"문화","investment_field_detail_type":"영상(영화+드라마+애니메이션)","mother_fund_id":"MF00000001","operator_company_id":"OP20000021","operator_company_name":"이수창업투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"이수창업투자","investment_focus":["영상(영화+드라마+애니메이션)","문화"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.049Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3536: ISU-세컨더리1호투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20000021',
  'ISU-세컨더리1호투자조합',
  3050000000,
  '2016-10-18',
  '{"fund_id":"AS20160114","registration_date":"2016-10-18","expiry_date":"2025-12-31","formation_total_amount":"30.5","investment_character_code":"16","industry_code":"6","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20000021","operator_company_name":"이수창업투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"이수창업투자","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.049Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3537: ISU-글로벌콘텐츠코리아펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20000021',
  'ISU-글로벌콘텐츠코리아펀드',
  15200000000,
  '2020-11-04',
  '{"fund_id":"AS20200624","registration_date":"2020-11-04","expiry_date":"2027-11-03","formation_total_amount":"152.0","investment_character_code":"24","industry_code":"6","investment_field_type":"문화","investment_field_detail_type":"문화 기타","mother_fund_id":"MF00000001","operator_company_id":"OP20000021","operator_company_name":"이수창업투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"이수창업투자","investment_focus":["문화 기타","문화"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.049Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3538: ISU-S&M콘텐츠투자조합 2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20000021',
  'ISU-S&M콘텐츠투자조합 2호',
  24000000000,
  '2017-07-19',
  '{"fund_id":"AS20170072","registration_date":"2017-07-19","expiry_date":"2025-07-18","formation_total_amount":"240.0","investment_character_code":"24","industry_code":"6","investment_field_type":"문화","investment_field_detail_type":"영상(영화+드라마+애니메이션)","mother_fund_id":"MF00000001","operator_company_id":"OP20000021","operator_company_name":"이수창업투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"이수창업투자","investment_focus":["영상(영화+드라마+애니메이션)","문화"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.049Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3539: ISU-AJ스포츠투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20000021',
  'ISU-AJ스포츠투자조합',
  16000000000,
  '2018-11-08',
  '{"fund_id":"AS20180344","registration_date":"2018-11-08","expiry_date":"2026-11-07","formation_total_amount":"160.0","investment_character_code":"07","industry_code":"7","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20000021","operator_company_name":"이수창업투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"이수창업투자","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.049Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3540: IPS프로개인투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190084',
  'IPS프로개인투자조합 1호',
  100000000,
  '2020-02-17',
  '{"fund_id":"AS20200068","registration_date":"2020-02-17","expiry_date":"2026-02-16","formation_total_amount":"1.0","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190084","operator_company_name":"아이피에스벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"아이피에스벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.049Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3541: IPS스타트업밸류업6호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190084',
  'IPS스타트업밸류업6호 개인투자조합',
  1620000000,
  '2021-08-05',
  '{"fund_id":"AS20210667","registration_date":"2021-08-05","expiry_date":"2026-08-04","formation_total_amount":"16.2","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190084","operator_company_name":"아이피에스벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"아이피에스벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.049Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3542: IPS스타트업밸류업5호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190084',
  'IPS스타트업밸류업5호 개인투자조합',
  1750000000,
  '2021-04-19',
  '{"fund_id":"AS20210287","registration_date":"2021-04-19","expiry_date":"2026-04-18","formation_total_amount":"17.5","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190084","operator_company_name":"아이피에스벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"아이피에스벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.049Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3543: IPS스타트업밸류업4호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190084',
  'IPS스타트업밸류업4호 개인투자조합',
  870000000,
  '2020-11-06',
  '{"fund_id":"AS20200625","registration_date":"2020-11-06","expiry_date":"2025-11-05","formation_total_amount":"8.7","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190084","operator_company_name":"아이피에스벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"아이피에스벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.049Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3544: IPS스타트업밸류업3호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190084',
  'IPS스타트업밸류업3호 개인투자조합',
  530000000,
  '2020-09-04',
  '{"fund_id":"AS20200456","registration_date":"2020-09-04","expiry_date":"2025-09-03","formation_total_amount":"5.3","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190084","operator_company_name":"아이피에스벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"아이피에스벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.049Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3545: IPS멀티렉스투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190084',
  'IPS멀티렉스투자조합',
  150000000,
  '2020-07-22',
  '{"fund_id":"AS20200343","registration_date":"2020-07-22","expiry_date":"2025-07-21","formation_total_amount":"1.5","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190084","operator_company_name":"아이피에스벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"아이피에스벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.049Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3546: IPS 스타트업밸류업2호개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190084',
  'IPS 스타트업밸류업2호개인투자조합',
  1900000000,
  '2020-01-31',
  '{"fund_id":"AS20200050","registration_date":"2020-01-31","expiry_date":"2026-01-30","formation_total_amount":"19.0","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190084","operator_company_name":"아이피에스벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"아이피에스벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.049Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3547: IMP 1호 펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20120010',
  'IMP 1호 펀드',
  5100000000,
  '2020-09-07',
  '{"fund_id":"AS20200482","registration_date":"2020-09-07","expiry_date":"2027-09-06","formation_total_amount":"51.0","investment_character_code":"20","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20120010","operator_company_name":"포항공과대학교기술지주","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"포항공과대학교기술지주","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.049Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3548: IMM 세컨더리 벤처펀드 제4호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19990002',
  'IMM 세컨더리 벤처펀드 제4호',
  60000000000,
  '2020-04-24',
  '{"fund_id":"AS20200197","registration_date":"2020-04-24","expiry_date":"2028-04-23","formation_total_amount":"600.0","investment_character_code":"16","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP19990002","operator_company_name":"아이엠엠인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"아이엠엠인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.049Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3549: IMM 세컨더리 벤처펀드 제3호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19990002',
  'IMM 세컨더리 벤처펀드 제3호',
  66000000000,
  '2018-04-23',
  '{"fund_id":"AS20180166","registration_date":"2018-04-23","expiry_date":"2026-04-22","formation_total_amount":"660.0","investment_character_code":"16","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP19990002","operator_company_name":"아이엠엠인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"아이엠엠인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.049Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3550: IMM Style 벤처펀드 제1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19990002',
  'IMM Style 벤처펀드 제1호',
  10500000000,
  '2019-09-25',
  '{"fund_id":"AS20190429","registration_date":"2019-09-25","expiry_date":"2025-09-24","formation_total_amount":"105.0","investment_character_code":"01","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP19990002","operator_company_name":"아이엠엠인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"아이엠엠인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.049Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Minimal Batch 71 completed! 50 fund records processed.
-- Progress: 3550/3689 total records

