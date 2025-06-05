-- VCS Fund MINIMAL UPSERT Batch 62/74 (Records 3051-3100)
-- MINIMAL: Only using basic columns that definitely exist
-- Generated from VCS API Scraper fund data
-- Generated at: 2025-06-05T00:40:21.992Z
-- Schema: Minimal fund_table structure (basic columns only)

-- MINIMAL FUND DATA (UPSERT - Safe for Duplicates)
-- Processing 50 fund records
-- Will INSERT new records or UPDATE existing ones

-- Record 3051: 데일리 스완슨 바이오 헬스케어 펀드 9호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20140004',
  '데일리 스완슨 바이오 헬스케어 펀드 9호',
  500000000,
  '2024-07-04',
  '{"fund_id":"AS20240579","registration_date":"2024-07-04","expiry_date":"2029-07-03","formation_total_amount":"5.0","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20140004","operator_company_name":"데일리파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"데일리파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.992Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3052: 데일리 스완슨 바이오 헬스케어 펀드 8호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20140004',
  '데일리 스완슨 바이오 헬스케어 펀드 8호',
  4200000000,
  '2021-09-01',
  '{"fund_id":"AS20210794","registration_date":"2021-09-01","expiry_date":"2026-08-31","formation_total_amount":"42.0","investment_character_code":"04","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"바이오","mother_fund_id":"","operator_company_id":"OP20140004","operator_company_name":"데일리파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"데일리파트너스","investment_focus":["바이오","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.992Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3053: 데일리 스완슨 바이오 헬스케어 펀드 7호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20140004',
  '데일리 스완슨 바이오 헬스케어 펀드 7호',
  5300000000,
  '2021-07-01',
  '{"fund_id":"AS20210543","registration_date":"2021-07-01","expiry_date":"2026-06-30","formation_total_amount":"53.0","investment_character_code":"04","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20140004","operator_company_name":"데일리파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"데일리파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.992Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3054: 데일리 스완슨 바이오 헬스케어 펀드 5호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20140004',
  '데일리 스완슨 바이오 헬스케어 펀드 5호',
  4270000000,
  '2020-05-25',
  '{"fund_id":"AS20200215","registration_date":"2020-05-25","expiry_date":"2026-05-24","formation_total_amount":"42.7","investment_character_code":"01","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20140004","operator_company_name":"데일리파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"데일리파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.992Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3055: 데일리 스완슨 바이오 헬스케어 펀드 3호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20140004',
  '데일리 스완슨 바이오 헬스케어 펀드 3호',
  5530000000,
  '2019-07-23',
  '{"fund_id":"AS20190319","registration_date":"2019-07-23","expiry_date":"2025-07-22","formation_total_amount":"55.3","investment_character_code":"25","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"바이오","mother_fund_id":"","operator_company_id":"OP20140004","operator_company_name":"데일리파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"데일리파트너스","investment_focus":["바이오","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.992Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3056: 데일리 스완슨 바이오 헬스케어 펀드 11호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20140004',
  '데일리 스완슨 바이오 헬스케어 펀드 11호',
  350000000,
  '2024-12-13',
  '{"fund_id":"AS20241275","registration_date":"2024-12-13","expiry_date":"2029-12-12","formation_total_amount":"3.5","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20140004","operator_company_name":"데일리파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"데일리파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.992Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3057: 데일리 스완슨 바이오 헬스케어 펀드 10호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20140004',
  '데일리 스완슨 바이오 헬스케어 펀드 10호',
  650000000,
  '2024-07-04',
  '{"fund_id":"AS20240578","registration_date":"2024-07-04","expiry_date":"2029-07-03","formation_total_amount":"6.5","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20140004","operator_company_name":"데일리파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"데일리파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.992Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3058: 데일리 스노우볼 바이오 헬스케어 펀드2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20140004',
  '데일리 스노우볼 바이오 헬스케어 펀드2호',
  11600000000,
  '2023-06-27',
  '{"fund_id":"AS20230540","registration_date":"2023-06-27","expiry_date":"2028-06-26","formation_total_amount":"116.0","investment_character_code":"16","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"바이오","mother_fund_id":"","operator_company_id":"OP20140004","operator_company_name":"데일리파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"데일리파트너스","investment_focus":["바이오","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.992Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3059: 데일리 스노우볼 바이오 헬스케어 펀드1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20140004',
  '데일리 스노우볼 바이오 헬스케어 펀드1호',
  11400000000,
  '2019-06-28',
  '{"fund_id":"AS20190275","registration_date":"2019-06-28","expiry_date":"2026-06-27","formation_total_amount":"114.0","investment_character_code":"16","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20140004","operator_company_name":"데일리파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"데일리파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.992Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3060: 데일리 넥스트 웨이브 바이오 헬스케어 펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20140004',
  '데일리 넥스트 웨이브 바이오 헬스케어 펀드',
  10110000000,
  '2020-07-21',
  '{"fund_id":"AS20200345","registration_date":"2020-07-21","expiry_date":"2026-07-20","formation_total_amount":"101.1","investment_character_code":"01","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20140004","operator_company_name":"데일리파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"데일리파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.992Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3061: 데일리 골든아워 바이오 헬스케어 펀드3호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20140004',
  '데일리 골든아워 바이오 헬스케어 펀드3호',
  3000000000,
  '2020-11-16',
  '{"fund_id":"AS20200632","registration_date":"2020-11-16","expiry_date":"2025-11-15","formation_total_amount":"30.0","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20140004","operator_company_name":"데일리파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"데일리파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.992Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3062: 데일리 골든아워 바이오 헬스케어 펀드 2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20140004',
  '데일리 골든아워 바이오 헬스케어 펀드 2호',
  5200000000,
  '2019-10-14',
  '{"fund_id":"AS20190468","registration_date":"2019-10-14","expiry_date":"2026-10-13","formation_total_amount":"52.0","investment_character_code":"04","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20140004","operator_company_name":"데일리파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"데일리파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.992Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3063: 데일리 골든아워 바이오 헬스케어 펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20140004',
  '데일리 골든아워 바이오 헬스케어 펀드',
  3440000000,
  '2019-02-01',
  '{"fund_id":"AS20190064","registration_date":"2019-02-01","expiry_date":"2026-01-31","formation_total_amount":"34.4","investment_character_code":"20","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20140004","operator_company_name":"데일리파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"데일리파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.992Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3064: 데브-혁신솔루션 창업초기 8호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20150002',
  '데브-혁신솔루션 창업초기 8호',
  30000000000,
  '2022-10-31',
  '{"fund_id":"AS20221241","registration_date":"2022-10-31","expiry_date":"2030-10-30","formation_total_amount":"300.0","investment_character_code":"20","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20150002","operator_company_name":"데브시스터즈벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"데브시스터즈벤처스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.992Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3065: 데브-혁신모험초기 투자조합 4호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20150002',
  '데브-혁신모험초기 투자조합 4호',
  10000000000,
  '2018-09-11',
  '{"fund_id":"AS20180259","registration_date":"2018-09-11","expiry_date":"2026-09-10","formation_total_amount":"100.0","investment_character_code":"20","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20150002","operator_company_name":"데브시스터즈벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"데브시스터즈벤처스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.992Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3066: 데브-크래프톤 문화투자조합 9호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20150002',
  '데브-크래프톤 문화투자조합 9호',
  30000000000,
  '2023-08-09',
  '{"fund_id":"AS20230691","registration_date":"2023-08-09","expiry_date":"2031-08-08","formation_total_amount":"300.0","investment_character_code":"24","industry_code":"7","investment_field_type":"문화","investment_field_detail_type":"문화 기타","mother_fund_id":"MF00000001","operator_company_id":"OP20150002","operator_company_name":"데브시스터즈벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"데브시스터즈벤처스","investment_focus":["문화 기타","문화"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.992Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3067: 데브-청년창업 투자조합 6호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20150002',
  '데브-청년창업 투자조합 6호',
  20000000000,
  '2020-07-10',
  '{"fund_id":"AS20200322","registration_date":"2020-07-10","expiry_date":"2028-07-09","formation_total_amount":"200.0","investment_character_code":"21","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20150002","operator_company_name":"데브시스터즈벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"데브시스터즈벤처스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.992Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3068: 데브-청년창업 투자조합 2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20150002',
  '데브-청년창업 투자조합 2호',
  15000000000,
  '2016-06-21',
  '{"fund_id":"AS20160022","registration_date":"2016-06-21","expiry_date":"2025-06-20","formation_total_amount":"150.0","investment_character_code":"20","industry_code":"7","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20150002","operator_company_name":"데브시스터즈벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"데브시스터즈벤처스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.992Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3069: 데브-넥시드 청년창업 투자조합 3호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20150002',
  '데브-넥시드 청년창업 투자조합 3호',
  15000000000,
  '2017-12-22',
  '{"fund_id":"AS20170158","registration_date":"2017-12-22","expiry_date":"2025-12-21","formation_total_amount":"150.0","investment_character_code":"21","industry_code":"7","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20150002","operator_company_name":"데브시스터즈벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"데브시스터즈벤처스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.992Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3070: 데브-KDBC 문화투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20150002',
  '데브-KDBC 문화투자조합',
  20000000000,
  '2018-12-07',
  '{"fund_id":"AS20180363","registration_date":"2018-12-07","expiry_date":"2026-12-06","formation_total_amount":"200.0","investment_character_code":"24","industry_code":"7","investment_field_type":"문화","investment_field_detail_type":"게임","mother_fund_id":"MF00000001","operator_company_id":"OP20150002","operator_company_name":"데브시스터즈벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"데브시스터즈벤처스","investment_focus":["게임","문화"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.992Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3071: 데브 챔피언 1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20150002',
  '데브 챔피언 1호',
  3900000000,
  '2021-07-23',
  '{"fund_id":"AS20210632","registration_date":"2021-07-23","expiry_date":"2026-07-22","formation_total_amount":"39.0","investment_character_code":"16","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20150002","operator_company_name":"데브시스터즈벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"데브시스터즈벤처스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.992Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3072: 더인벤션랩 패션테크초기스타트업 투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20140013',
  '더인벤션랩 패션테크초기스타트업 투자조합1호',
  1200000000,
  '2023-06-20',
  '{"fund_id":"AS20230504","registration_date":"2023-06-20","expiry_date":"2028-06-19","formation_total_amount":"12.0","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20140013","operator_company_name":"더인벤션랩","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"더인벤션랩","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.992Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3073: 더인벤션랩 초기프롭테크 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20140013',
  '더인벤션랩 초기프롭테크 투자조합',
  210000000,
  '2023-02-28',
  '{"fund_id":"AS20230118","registration_date":"2023-02-28","expiry_date":"2028-02-27","formation_total_amount":"2.1","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20140013","operator_company_name":"더인벤션랩","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"더인벤션랩","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.992Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3074: 더인벤션랩 어나더브레인 바이오투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20140013',
  '더인벤션랩 어나더브레인 바이오투자조합',
  330000000,
  '2024-05-30',
  '{"fund_id":"AS20240459","registration_date":"2024-05-30","expiry_date":"2029-05-29","formation_total_amount":"3.3","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20140013","operator_company_name":"더인벤션랩","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"더인벤션랩","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.992Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3075: 더인벤션랩 성장사다리 개인투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20140013',
  '더인벤션랩 성장사다리 개인투자조합1호',
  320000000,
  '2024-01-26',
  '{"fund_id":"AS20240057","registration_date":"2024-01-26","expiry_date":"2029-01-25","formation_total_amount":"3.2","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20140013","operator_company_name":"더인벤션랩","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"더인벤션랩","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.992Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3076: 더인벤션랩 딥테크초기스타트업4호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20140013',
  '더인벤션랩 딥테크초기스타트업4호 투자조합',
  310000000,
  '2024-04-04',
  '{"fund_id":"AS20240227","registration_date":"2024-04-04","expiry_date":"2029-04-03","formation_total_amount":"3.1","investment_character_code":"","industry_code":"1","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20140013","operator_company_name":"더인벤션랩","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"더인벤션랩","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.992Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3077: 더인벤션랩 딥테크초기스타트업3호 투자조합 
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20140013',
  '더인벤션랩 딥테크초기스타트업3호 투자조합 ',
  240000000,
  '2024-01-04',
  '{"fund_id":"AS20240006","registration_date":"2024-01-04","expiry_date":"2029-01-03","formation_total_amount":"2.4","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20140013","operator_company_name":"더인벤션랩","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"더인벤션랩","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.992Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3078: 더인벤션랩 딥테크초기스타트업 투자조합1호 
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20140013',
  '더인벤션랩 딥테크초기스타트업 투자조합1호 ',
  690000000,
  '2023-05-02',
  '{"fund_id":"AS20230341","registration_date":"2023-05-02","expiry_date":"2029-05-01","formation_total_amount":"6.9","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20140013","operator_company_name":"더인벤션랩","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"더인벤션랩","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.992Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3079: 더인벤션랩 딥테크성장스타트업 벤처투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20140013',
  '더인벤션랩 딥테크성장스타트업 벤처투자조합1호',
  3000000000,
  '2024-03-15',
  '{"fund_id":"AS20240198","registration_date":"2024-03-15","expiry_date":"2030-03-14","formation_total_amount":"30.0","investment_character_code":"30","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20140013","operator_company_name":"더인벤션랩","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"더인벤션랩","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.992Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3080: 더인벤션랩 개인투자조합8호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20140013',
  '더인벤션랩 개인투자조합8호',
  240000000,
  '2025-03-27',
  '{"fund_id":"AS20250194","registration_date":"2025-03-27","expiry_date":"2030-03-26","formation_total_amount":"2.4","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20140013","operator_company_name":"더인벤션랩","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"더인벤션랩","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.992Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3081: 더인벤션랩 개인투자조합7호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20140013',
  '더인벤션랩 개인투자조합7호',
  250000000,
  '2024-12-30',
  '{"fund_id":"AS20241438","registration_date":"2024-12-30","expiry_date":"2029-12-29","formation_total_amount":"2.5","investment_character_code":"","industry_code":"3","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20140013","operator_company_name":"더인벤션랩","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"더인벤션랩","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.992Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3082: 더인벤션랩 개인투자조합6호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20140013',
  '더인벤션랩 개인투자조합6호',
  690000000,
  '2024-09-24',
  '{"fund_id":"AS20240896","registration_date":"2024-09-24","expiry_date":"2029-09-23","formation_total_amount":"6.9","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20140013","operator_company_name":"더인벤션랩","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"더인벤션랩","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.992Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3083: 더웰스인베스트먼트 청년창업투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20160007',
  '더웰스인베스트먼트 청년창업투자조합',
  10000000000,
  '2017-06-26',
  '{"fund_id":"AS20170059","registration_date":"2017-06-26","expiry_date":"2025-06-25","formation_total_amount":"100.0","investment_character_code":"21","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20160007","operator_company_name":"더웰스인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"더웰스인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.992Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3084: 더웰스인베스트먼트 제1호 한국벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20160007',
  '더웰스인베스트먼트 제1호 한국벤처투자조합',
  3120000000,
  '2018-04-05',
  '{"fund_id":"AS20180164","registration_date":"2018-04-05","expiry_date":"2026-04-03","formation_total_amount":"31.2","investment_character_code":"17","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20160007","operator_company_name":"더웰스인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"더웰스인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.993Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3085: 더웰스도시재생투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20160007',
  '더웰스도시재생투자조합',
  25000000000,
  '2020-06-08',
  '{"fund_id":"AS20200256","registration_date":"2020-06-08","expiry_date":"2027-06-07","formation_total_amount":"250.0","investment_character_code":"10","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20160007","operator_company_name":"더웰스인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"더웰스인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.993Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3086: 더웰스-키움 그로쓰캐피탈 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20160007',
  '더웰스-키움 그로쓰캐피탈 투자조합',
  10100000000,
  '2023-04-06',
  '{"fund_id":"AS20230256","registration_date":"2023-04-06","expiry_date":"2028-04-05","formation_total_amount":"101.0","investment_character_code":"25","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20160007","operator_company_name":"더웰스인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"더웰스인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.993Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3087: 더웰스-클레어보이언트IP기술사업화투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20140003',
  '더웰스-클레어보이언트IP기술사업화투자조합',
  57500000000,
  '2021-02-17',
  '{"fund_id":"AS20210122","registration_date":"2021-02-17","expiry_date":"2029-02-16","formation_total_amount":"575.0","investment_character_code":"04","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20140003","operator_company_name":"클레어보이언트벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"클레어보이언트벤처스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.993Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3088: 더웰스-클레어보이언트IP기술사업화투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20160007',
  '더웰스-클레어보이언트IP기술사업화투자조합',
  57500000000,
  '2021-02-17',
  '{"fund_id":"AS20210122","registration_date":"2021-02-17","expiry_date":"2029-02-16","formation_total_amount":"575.0","investment_character_code":"04","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20160007","operator_company_name":"더웰스인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"더웰스인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.993Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3089: 더웰스-IBKC 오픈이노베이션 펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20160007',
  '더웰스-IBKC 오픈이노베이션 펀드',
  16000000000,
  '2021-07-30',
  '{"fund_id":"AS20210658","registration_date":"2021-07-30","expiry_date":"2027-07-29","formation_total_amount":"160.0","investment_character_code":"02","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20160007","operator_company_name":"더웰스인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"더웰스인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.993Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3090: 더웰스 엔자임 그로쓰캐피탈 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20160007',
  '더웰스 엔자임 그로쓰캐피탈 투자조합',
  12600000000,
  '2024-12-10',
  '{"fund_id":"AS20241305","registration_date":"2024-12-10","expiry_date":"2029-12-09","formation_total_amount":"126.0","investment_character_code":"25","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20160007","operator_company_name":"더웰스인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"더웰스인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.993Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3091: 더웰스 세컨더리 제1호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20160007',
  '더웰스 세컨더리 제1호 투자조합',
  7600000000,
  '2020-07-07',
  '{"fund_id":"AS20200336","registration_date":"2020-07-07","expiry_date":"2025-07-06","formation_total_amount":"76.0","investment_character_code":"16","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20160007","operator_company_name":"더웰스인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"더웰스인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.993Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3092: 더웰스 딥테크 제3호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20160007',
  '더웰스 딥테크 제3호 투자조합',
  9200000000,
  '2022-06-23',
  '{"fund_id":"AS20220705","registration_date":"2022-06-23","expiry_date":"2027-06-22","formation_total_amount":"92.0","investment_character_code":"02","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20160007","operator_company_name":"더웰스인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"더웰스인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.993Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3093: 더웰스 딥테크 제2호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20160007',
  '더웰스 딥테크 제2호 투자조합',
  11770000000,
  '2021-12-15',
  '{"fund_id":"AS20211300","registration_date":"2021-12-15","expiry_date":"2026-12-14","formation_total_amount":"117.7","investment_character_code":"16","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20160007","operator_company_name":"더웰스인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"더웰스인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.993Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3094: 더웰스 딥테크 제1호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20160007',
  '더웰스 딥테크 제1호 투자조합',
  13000000000,
  '2021-01-15',
  '{"fund_id":"AS20210065","registration_date":"2021-01-15","expiry_date":"2026-01-14","formation_total_amount":"130.0","investment_character_code":"02","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20160007","operator_company_name":"더웰스인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"더웰스인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.993Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3095: 더웰스 닥터스헬스케어 제3호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20160007',
  '더웰스 닥터스헬스케어 제3호 투자조합',
  4700000000,
  '2020-10-28',
  '{"fund_id":"AS20200600","registration_date":"2020-10-28","expiry_date":"2025-10-27","formation_total_amount":"47.0","investment_character_code":"01","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20160007","operator_company_name":"더웰스인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"더웰스인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.993Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3096: 더웰스 IP기술사업화 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20160007',
  '더웰스 IP기술사업화 투자조합',
  20000000000,
  '2018-11-09',
  '{"fund_id":"AS20180343","registration_date":"2018-11-09","expiry_date":"2026-11-08","formation_total_amount":"200.0","investment_character_code":"09","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"특허","mother_fund_id":"MF00000001","operator_company_id":"OP20160007","operator_company_name":"더웰스인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"더웰스인베스트먼트","investment_focus":["특허","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.993Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3097: 더웍스제3호개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190239',
  '더웍스제3호개인투자조합',
  100000000,
  '2024-08-09',
  '{"fund_id":"AS20240748","registration_date":"2024-08-09","expiry_date":"2029-08-08","formation_total_amount":"1.0","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190239","operator_company_name":"더웍스코리아","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"더웍스코리아","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.993Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3098: 더웍스제2호개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190239',
  '더웍스제2호개인투자조합',
  100000000,
  '2024-04-29',
  '{"fund_id":"AS20240356","registration_date":"2024-04-29","expiry_date":"2029-04-25","formation_total_amount":"1.0","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190239","operator_company_name":"더웍스코리아","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"더웍스코리아","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.993Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3099: 더시드1호펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20150018',
  '더시드1호펀드',
  7050000000,
  '2019-01-25',
  '{"fund_id":"AS20190035","registration_date":"2019-01-25","expiry_date":"2026-01-24","formation_total_amount":"70.5","investment_character_code":"17","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20150018","operator_company_name":"더시드인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"더시드인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.993Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3100: 더시드1호 세컨더리투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20150018',
  '더시드1호 세컨더리투자조합',
  5550000000,
  '2022-08-31',
  '{"fund_id":"AS20221004","registration_date":"2022-08-31","expiry_date":"2027-08-30","formation_total_amount":"55.5","investment_character_code":"16","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20150018","operator_company_name":"더시드인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"더시드인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.993Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Minimal Batch 62 completed! 50 fund records processed.
-- Progress: 3100/3689 total records

