-- VCS Fund CORRECTED UPSERT Batch 34/74 (Records 1651-1700)
-- FIXED: Removed fund_name_en column that does not exist
-- Generated from VCS API Scraper fund data
-- Generated at: 2025-06-05T00:34:30.265Z
-- Schema: Matches actual fund_table structure (no fund_name_en)

-- CORRECTED FUND DATA (UPSERT - Safe for Duplicates)
-- Processing 50 fund records
-- Will INSERT new records or UPDATE existing ones

-- Record 1651: 에스유피(SUP)-3호 벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20200245',
  '에스유피(SUP)-3호 벤처투자조합',
  'VCS Registered Fund',
  27400000000,
  27400000000,
  '2024-07-05',
  'Active',
  '스케일업파트너스',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20240606","registration_date":"2024-07-05","expiry_date":"2032-07-04","formation_total_amount":"274.0","investment_character_code":"04","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20200245","operator_company_name":"스케일업파트너스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.265Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1652: 에스유피(SUP)-3호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20200245',
  '에스유피(SUP)-3호 개인투자조합',
  'VCS Registered Fund',
  950000000,
  950000000,
  '2022-01-06',
  'Active',
  '스케일업파트너스',
  NULL,
  '{"fund_id":"AS20220025","registration_date":"2022-01-06","expiry_date":"2027-01-05","formation_total_amount":"9.5","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200245","operator_company_name":"스케일업파트너스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.265Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1653: 에스유피(SUP)-1호 벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20200245',
  '에스유피(SUP)-1호 벤처투자조합',
  'VCS Registered Fund',
  5200000000,
  5200000000,
  '2022-03-24',
  'Active',
  '스케일업파트너스',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20220341","registration_date":"2022-03-24","expiry_date":"2027-03-23","formation_total_amount":"52.0","investment_character_code":"25","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20200245","operator_company_name":"스케일업파트너스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.265Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1654: 에스엠씨아이7호위풍당당콘텐츠코리아펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20120006',
  '에스엠씨아이7호위풍당당콘텐츠코리아펀드',
  'VCS Registered Fund',
  25300000000,
  25300000000,
  '2015-10-07',
  'Active',
  '레오파트너스인베스트먼트',
  '{"영상(영화+드라마+애니메이션)","문화"}',
  '{"fund_id":"AS20150061","registration_date":"2015-10-07","expiry_date":"2025-09-30","formation_total_amount":"253.0","investment_character_code":"24","industry_code":"6","investment_field_type":"문화","investment_field_detail_type":"영상(영화+드라마+애니메이션)","mother_fund_id":"MF00000001","operator_company_id":"OP20120006","operator_company_name":"레오파트너스인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.265Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1655: 에스엠시노밸류메이커스1호펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20150006',
  '에스엠시노밸류메이커스1호펀드',
  'VCS Registered Fund',
  3430000000,
  3430000000,
  '2021-02-24',
  'Active',
  '에스엠시노기술투자',
  '{"바이오","일반"}',
  '{"fund_id":"AS20210150","registration_date":"2021-02-24","expiry_date":"2026-02-23","formation_total_amount":"34.3","investment_character_code":"25","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"바이오","mother_fund_id":"","operator_company_id":"OP20150006","operator_company_name":"에스엠시노기술투자","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.265Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1656: 에스엘아이 퀀텀 성장 2호 펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20000040',
  '에스엘아이 퀀텀 성장 2호 펀드',
  'VCS Registered Fund',
  135000000000,
  135000000000,
  '2022-10-18',
  'Active',
  '에스엘인베스트먼트',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20221197","registration_date":"2022-10-18","expiry_date":"2030-10-17","formation_total_amount":"1350.0","investment_character_code":"10","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20000040","operator_company_name":"에스엘인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.265Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1657: 에스엔유-라이프 미션 벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20080014',
  '에스엔유-라이프 미션 벤처투자조합',
  'VCS Registered Fund',
  5050000000,
  5050000000,
  '2024-12-05',
  'Active',
  '서울대학교기술지주',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20241273","registration_date":"2024-12-05","expiry_date":"2031-12-04","formation_total_amount":"50.5","investment_character_code":"20","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20080014","operator_company_name":"서울대학교기술지주","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.265Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1658: 에스에이지 스케일업 펀드4호
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20150029',
  '에스에이지 스케일업 펀드4호',
  'VCS Registered Fund',
  100000000,
  100000000,
  '2022-01-28',
  'Active',
  'SAGKOREA',
  NULL,
  '{"fund_id":"AS20220096","registration_date":"2022-01-28","expiry_date":"2027-12-31","formation_total_amount":"1.0","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20150029","operator_company_name":"SAGKOREA","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.265Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1659: 에스에스투투자조합2호
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20200409',
  '에스에스투투자조합2호',
  'VCS Registered Fund',
  640000000,
  640000000,
  '2021-02-04',
  'Active',
  '에스에스투인베스트먼트',
  NULL,
  '{"fund_id":"AS20210077","registration_date":"2021-02-04","expiry_date":"2026-12-31","formation_total_amount":"6.4","investment_character_code":"","industry_code":"4","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200409","operator_company_name":"에스에스투인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.265Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1660: 에스에스투투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20200409',
  '에스에스투투자조합1호',
  'VCS Registered Fund',
  310000000,
  310000000,
  '2021-01-22',
  'Active',
  '에스에스투인베스트먼트',
  NULL,
  '{"fund_id":"AS20210051","registration_date":"2021-01-22","expiry_date":"2026-12-31","formation_total_amount":"3.1","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200409","operator_company_name":"에스에스투인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.265Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1661: 에스에스투완도개인투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20200409',
  '에스에스투완도개인투자조합1호',
  'VCS Registered Fund',
  100000000,
  100000000,
  '2021-10-10',
  'Active',
  '에스에스투인베스트먼트',
  NULL,
  '{"fund_id":"AS20210967","registration_date":"2021-10-10","expiry_date":"2026-12-31","formation_total_amount":"1.0","investment_character_code":"","industry_code":"4","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200409","operator_company_name":"에스에스투인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.265Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1662: 에스에스투개인투자조합8호
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20200409',
  '에스에스투개인투자조합8호',
  'VCS Registered Fund',
  100000000,
  100000000,
  '2022-12-21',
  'Active',
  '에스에스투인베스트먼트',
  NULL,
  '{"fund_id":"AS20221509","registration_date":"2022-12-21","expiry_date":"2027-12-31","formation_total_amount":"1.0","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200409","operator_company_name":"에스에스투인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.265Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1663: 에스에스투개인투자조합7호
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20200409',
  '에스에스투개인투자조합7호',
  'VCS Registered Fund',
  100000000,
  100000000,
  '2021-04-27',
  'Active',
  '에스에스투인베스트먼트',
  NULL,
  '{"fund_id":"AS20210331","registration_date":"2021-04-27","expiry_date":"2026-12-31","formation_total_amount":"1.0","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200409","operator_company_name":"에스에스투인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.265Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1664: 에스에스투개인투자조합5호
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20200409',
  '에스에스투개인투자조합5호',
  'VCS Registered Fund',
  150000000,
  150000000,
  '2021-07-14',
  'Active',
  '에스에스투인베스트먼트',
  NULL,
  '{"fund_id":"AS20210535","registration_date":"2021-07-14","expiry_date":"2026-12-31","formation_total_amount":"1.5","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200409","operator_company_name":"에스에스투인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.265Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1665: 에스에스투개인투자조합4호
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20200409',
  '에스에스투개인투자조합4호',
  'VCS Registered Fund',
  270000000,
  270000000,
  '2021-04-26',
  'Active',
  '에스에스투인베스트먼트',
  NULL,
  '{"fund_id":"AS20210313","registration_date":"2021-04-26","expiry_date":"2026-12-31","formation_total_amount":"2.7","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200409","operator_company_name":"에스에스투인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.265Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1666: 에스에스투개인투자조합3호
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20200409',
  '에스에스투개인투자조합3호',
  'VCS Registered Fund',
  290000000,
  290000000,
  '2021-09-06',
  'Active',
  '에스에스투인베스트먼트',
  NULL,
  '{"fund_id":"AS20210801","registration_date":"2021-09-06","expiry_date":"2026-12-31","formation_total_amount":"2.9","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200409","operator_company_name":"에스에스투인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.265Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1667: 에스에스투개인투자조합19호
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20200409',
  '에스에스투개인투자조합19호',
  'VCS Registered Fund',
  100000000,
  100000000,
  '2023-03-29',
  'Active',
  '에스에스투인베스트먼트',
  NULL,
  '{"fund_id":"AS20230230","registration_date":"2023-03-29","expiry_date":"2028-12-31","formation_total_amount":"1.0","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200409","operator_company_name":"에스에스투인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.265Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1668: 에스에스투개인투자조합18호
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20200409',
  '에스에스투개인투자조합18호',
  'VCS Registered Fund',
  100000000,
  100000000,
  '2022-05-26',
  'Active',
  '에스에스투인베스트먼트',
  NULL,
  '{"fund_id":"AS20220578","registration_date":"2022-05-26","expiry_date":"2027-12-31","formation_total_amount":"1.0","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200409","operator_company_name":"에스에스투인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.265Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1669: 에스에스투개인투자조합17호
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20200409',
  '에스에스투개인투자조합17호',
  'VCS Registered Fund',
  190000000,
  190000000,
  '2022-06-13',
  'Active',
  '에스에스투인베스트먼트',
  NULL,
  '{"fund_id":"AS20220653","registration_date":"2022-06-13","expiry_date":"2027-12-31","formation_total_amount":"1.9","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200409","operator_company_name":"에스에스투인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.265Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1670: 에스에스투개인투자조합14호
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20200409',
  '에스에스투개인투자조합14호',
  'VCS Registered Fund',
  240000000,
  240000000,
  '2021-12-29',
  'Active',
  '에스에스투인베스트먼트',
  NULL,
  '{"fund_id":"AS20211415","registration_date":"2021-12-29","expiry_date":"2026-12-31","formation_total_amount":"2.4","investment_character_code":"","industry_code":"4","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200409","operator_company_name":"에스에스투인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.265Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1671: 에스에스투개인투자조합13호
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20200409',
  '에스에스투개인투자조합13호',
  'VCS Registered Fund',
  820000000,
  820000000,
  '2022-03-22',
  'Active',
  '에스에스투인베스트먼트',
  NULL,
  '{"fund_id":"AS20220274","registration_date":"2022-03-22","expiry_date":"2027-12-31","formation_total_amount":"8.2","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200409","operator_company_name":"에스에스투인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.265Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1672: 에스에스투개인투자조합12호
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20200409',
  '에스에스투개인투자조합12호',
  'VCS Registered Fund',
  200000000,
  200000000,
  '2021-11-18',
  'Active',
  '에스에스투인베스트먼트',
  NULL,
  '{"fund_id":"AS20211147","registration_date":"2021-11-18","expiry_date":"2026-12-31","formation_total_amount":"2.0","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200409","operator_company_name":"에스에스투인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.265Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1673: 에스에스투개인투자조합11호
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20200409',
  '에스에스투개인투자조합11호',
  'VCS Registered Fund',
  100000000,
  100000000,
  '2022-01-24',
  'Active',
  '에스에스투인베스트먼트',
  NULL,
  '{"fund_id":"AS20220082","registration_date":"2022-01-24","expiry_date":"2027-12-31","formation_total_amount":"1.0","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200409","operator_company_name":"에스에스투인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.265Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1674: 에스에스투개인투자조합10호
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20200409',
  '에스에스투개인투자조합10호',
  'VCS Registered Fund',
  190000000,
  190000000,
  '2021-11-24',
  'Active',
  '에스에스투인베스트먼트',
  NULL,
  '{"fund_id":"AS20211174","registration_date":"2021-11-24","expiry_date":"2026-12-31","formation_total_amount":"1.9","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200409","operator_company_name":"에스에스투인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.265Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1675: 에스에스투 개인투자조합 20호
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20200409',
  '에스에스투 개인투자조합 20호',
  'VCS Registered Fund',
  100000000,
  100000000,
  '2024-01-26',
  'Active',
  '에스에스투인베스트먼트',
  NULL,
  '{"fund_id":"AS20240055","registration_date":"2024-01-26","expiry_date":"2029-12-31","formation_total_amount":"1.0","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200409","operator_company_name":"에스에스투인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.265Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1676: 에스앤유공학기술 유니콘발굴 투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20080014',
  '에스앤유공학기술 유니콘발굴 투자조합 1호',
  'VCS Registered Fund',
  5300000000,
  5300000000,
  '2022-07-29',
  'Active',
  '서울대학교기술지주',
  NULL,
  '{"fund_id":"AS20220757","registration_date":"2022-07-29","expiry_date":"2029-07-28","formation_total_amount":"53.0","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20080014","operator_company_name":"서울대학교기술지주","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.265Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1677: 에스앤에스-델타 벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20180010',
  '에스앤에스-델타 벤처투자조합',
  'VCS Registered Fund',
  5300000000,
  5300000000,
  '2022-04-08',
  'Active',
  '델타인베스트먼트',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20220399","registration_date":"2022-04-08","expiry_date":"2027-04-07","formation_total_amount":"53.0","investment_character_code":"16","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20180010","operator_company_name":"델타인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.265Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1678: 에스앤에스 벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20220288',
  '에스앤에스 벤처투자조합',
  'VCS Registered Fund',
  5300000000,
  5300000000,
  '2022-04-08',
  'Active',
  '에스앤에스인베스트먼트',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20220399","registration_date":"2022-04-08","expiry_date":"2027-04-07","formation_total_amount":"53.0","investment_character_code":"16","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20220288","operator_company_name":"에스앤에스인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.265Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1679: 에스알더넥스트랩투자조합3호
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20200174',
  '에스알더넥스트랩투자조합3호',
  'VCS Registered Fund',
  220000000,
  220000000,
  '2024-03-11',
  'Active',
  '스타트업리서치',
  NULL,
  '{"fund_id":"AS20240168","registration_date":"2024-03-11","expiry_date":"2029-03-05","formation_total_amount":"2.2","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200174","operator_company_name":"스타트업리서치","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.265Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1680: 에스알글로벌그로스투자조합6호
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20200174',
  '에스알글로벌그로스투자조합6호',
  'VCS Registered Fund',
  460000000,
  460000000,
  '2021-07-14',
  'Active',
  '스타트업리서치',
  NULL,
  '{"fund_id":"AS20210542","registration_date":"2021-07-14","expiry_date":"2026-07-14","formation_total_amount":"4.6","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200174","operator_company_name":"스타트업리서치","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.266Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1681: 에스알글로벌그로스투자조합17호
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20200174',
  '에스알글로벌그로스투자조합17호',
  'VCS Registered Fund',
  100000000,
  100000000,
  '2024-10-04',
  'Active',
  '스타트업리서치',
  NULL,
  '{"fund_id":"AS20240914","registration_date":"2024-10-04","expiry_date":"2029-09-22","formation_total_amount":"1.0","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200174","operator_company_name":"스타트업리서치","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.266Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1682: 에스알글로벌그로스투자조합13호
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20200174',
  '에스알글로벌그로스투자조합13호',
  'VCS Registered Fund',
  370000000,
  370000000,
  '2022-10-26',
  'Active',
  '스타트업리서치',
  NULL,
  '{"fund_id":"AS20221199","registration_date":"2022-10-26","expiry_date":"2027-10-25","formation_total_amount":"3.7","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200174","operator_company_name":"스타트업리서치","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.266Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1683: 에스알글로벌그로스투자조합11호
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20200174',
  '에스알글로벌그로스투자조합11호',
  'VCS Registered Fund',
  400000000,
  400000000,
  '2022-04-18',
  'Active',
  '스타트업리서치',
  NULL,
  '{"fund_id":"AS20220410","registration_date":"2022-04-18","expiry_date":"2027-04-17","formation_total_amount":"4.0","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200174","operator_company_name":"스타트업리서치","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.266Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1684: 에스알글로벌그로스투자조합 15호
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20200174',
  '에스알글로벌그로스투자조합 15호',
  'VCS Registered Fund',
  450000000,
  450000000,
  '2024-02-28',
  'Active',
  '스타트업리서치',
  NULL,
  '{"fund_id":"AS20240137","registration_date":"2024-02-28","expiry_date":"2029-02-26","formation_total_amount":"4.5","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200174","operator_company_name":"스타트업리서치","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.266Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1685: 에스알글로벌그로스 투자조합 5호
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20200174',
  '에스알글로벌그로스 투자조합 5호',
  'VCS Registered Fund',
  210000000,
  210000000,
  '2021-01-29',
  'Active',
  '스타트업리서치',
  NULL,
  '{"fund_id":"AS20210068","registration_date":"2021-01-29","expiry_date":"2026-12-31","formation_total_amount":"2.1","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200174","operator_company_name":"스타트업리서치","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.266Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1686: 에스알(SR) 블루이코노미 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20140001',
  '에스알(SR) 블루이코노미 투자조합',
  'VCS Registered Fund',
  15000000000,
  15000000000,
  '2019-10-08',
  'Active',
  '아이엠투자파트너스',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20190463","registration_date":"2019-10-08","expiry_date":"2027-10-07","formation_total_amount":"150.0","investment_character_code":"10","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20140001","operator_company_name":"아이엠투자파트너스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.266Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1687: 에스알-이녹스 메타버스 벤처투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20200174',
  '에스알-이녹스 메타버스 벤처투자조합 1호',
  'VCS Registered Fund',
  2020000000,
  2020000000,
  '2022-05-02',
  'Active',
  '스타트업리서치',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20220501","registration_date":"2022-05-02","expiry_date":"2027-05-01","formation_total_amount":"20.2","investment_character_code":"20","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20200174","operator_company_name":"스타트업리서치","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.266Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1688: 에스아이디 오픈이노베이션 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20160038',
  '에스아이디 오픈이노베이션 개인투자조합',
  'VCS Registered Fund',
  1000000000,
  1000000000,
  '2022-11-21',
  'Active',
  '에스아이디파트너스',
  NULL,
  '{"fund_id":"AS20221292","registration_date":"2022-11-21","expiry_date":"2028-12-30","formation_total_amount":"10.0","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20160038","operator_company_name":"에스아이디파트너스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.266Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1689: 에스아이디 디스플레이 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20160038',
  '에스아이디 디스플레이 개인투자조합',
  'VCS Registered Fund',
  250000000,
  250000000,
  '2024-04-23',
  'Active',
  '에스아이디파트너스',
  NULL,
  '{"fund_id":"AS20240331","registration_date":"2024-04-23","expiry_date":"2030-03-30","formation_total_amount":"2.5","investment_character_code":"","industry_code":"4","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20160038","operator_company_name":"에스아이디파트너스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.266Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1690: 에스세컨더리투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20220510',
  '에스세컨더리투자조합1호',
  'VCS Registered Fund',
  10500000000,
  10500000000,
  '2023-06-12',
  'Active',
  '에스벤처스',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20230474","registration_date":"2023-06-12","expiry_date":"2028-06-11","formation_total_amount":"105.0","investment_character_code":"16","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20220510","operator_company_name":"에스벤처스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.266Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1691: 에스비에이(SBA)7호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20190134',
  '에스비에이(SBA)7호 개인투자조합',
  'VCS Registered Fund',
  120000000,
  120000000,
  '2023-07-28',
  'Active',
  '킹고스프링',
  NULL,
  '{"fund_id":"AS20230622","registration_date":"2023-07-28","expiry_date":"2028-07-27","formation_total_amount":"1.2","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190134","operator_company_name":"킹고스프링","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.266Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1692: 에스비에이(SBA)11호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20190134',
  '에스비에이(SBA)11호 개인투자조합',
  'VCS Registered Fund',
  400000000,
  400000000,
  '2024-08-13',
  'Active',
  '킹고스프링',
  NULL,
  '{"fund_id":"AS20240763","registration_date":"2024-08-13","expiry_date":"2029-08-07","formation_total_amount":"4.0","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190134","operator_company_name":"킹고스프링","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.266Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1693: 에스비에이(SBA)10호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20190134',
  '에스비에이(SBA)10호 개인투자조합',
  'VCS Registered Fund',
  210000000,
  210000000,
  '2023-12-06',
  'Active',
  '킹고스프링',
  NULL,
  '{"fund_id":"AS20231175","registration_date":"2023-12-06","expiry_date":"2028-12-05","formation_total_amount":"2.1","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190134","operator_company_name":"킹고스프링","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.266Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1694: 에스비에이(SBA) 9호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20190134',
  '에스비에이(SBA) 9호 개인투자조합',
  'VCS Registered Fund',
  160000000,
  160000000,
  '2022-12-02',
  'Active',
  '킹고스프링',
  NULL,
  '{"fund_id":"AS20221353","registration_date":"2022-12-02","expiry_date":"2027-12-01","formation_total_amount":"1.6","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190134","operator_company_name":"킹고스프링","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.266Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1695: 에스비에이(SBA) 3호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20190134',
  '에스비에이(SBA) 3호 개인투자조합',
  'VCS Registered Fund',
  170000000,
  170000000,
  '2020-07-16',
  'Active',
  '킹고스프링',
  NULL,
  '{"fund_id":"AS20200306","registration_date":"2020-07-16","expiry_date":"2025-07-15","formation_total_amount":"1.7","investment_character_code":"","industry_code":"3","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190134","operator_company_name":"킹고스프링","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.266Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1696: 에스비에이(SBA) 12호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20190134',
  '에스비에이(SBA) 12호 개인투자조합',
  'VCS Registered Fund',
  120000000,
  120000000,
  '2025-02-20',
  'Active',
  '킹고스프링',
  NULL,
  '{"fund_id":"AS20250104","registration_date":"2025-02-20","expiry_date":"2030-02-13","formation_total_amount":"1.2","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190134","operator_company_name":"킹고스프링","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.266Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1697: 에스비아이-피오 데이터혁신 벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP19860008',
  '에스비아이-피오 데이터혁신 벤처투자조합',
  'VCS Registered Fund',
  10400000000,
  10400000000,
  '2023-12-27',
  'Active',
  '에스비아이인베스트먼트',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20231347","registration_date":"2023-12-27","expiry_date":"2028-12-26","formation_total_amount":"104.0","investment_character_code":"25","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP19860008","operator_company_name":"에스비아이인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.266Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1698: 에스비아이-케이아이에스 2022 비아이씨(Best-In-Class) 3호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP19860008',
  '에스비아이-케이아이에스 2022 비아이씨(Best-In-Class) 3호 투자조합',
  'VCS Registered Fund',
  21500000000,
  21500000000,
  '2022-12-01',
  'Active',
  '에스비아이인베스트먼트',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20221383","registration_date":"2022-12-01","expiry_date":"2027-11-30","formation_total_amount":"215.0","investment_character_code":"02","industry_code":"6","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP19860008","operator_company_name":"에스비아이인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.266Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1699: 에스비아이-케이아이에스 2021 비아이씨(Best-In-Class) 2호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP19860008',
  '에스비아이-케이아이에스 2021 비아이씨(Best-In-Class) 2호 투자조합',
  'VCS Registered Fund',
  20300000000,
  20300000000,
  '2021-08-13',
  'Active',
  '에스비아이인베스트먼트',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20210724","registration_date":"2021-08-13","expiry_date":"2026-08-12","formation_total_amount":"203.0","investment_character_code":"02","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP19860008","operator_company_name":"에스비아이인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.266Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1700: 에스비아이 소부장 스타 펀드 2호
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP19860008',
  '에스비아이 소부장 스타 펀드 2호',
  'VCS Registered Fund',
  34400000000,
  34400000000,
  '2024-08-06',
  'Active',
  '에스비아이인베스트먼트',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20240746","registration_date":"2024-08-06","expiry_date":"2031-08-05","formation_total_amount":"344.0","investment_character_code":"03","industry_code":"1","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP19860008","operator_company_name":"에스비아이인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.266Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Corrected Batch 34 completed! 50 fund records processed.
-- Progress: 1700/3689 total records

