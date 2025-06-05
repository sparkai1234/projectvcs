-- VCS Fund UPSERT Batch 61/74 (Records 3001-3050)
-- Uses ON CONFLICT DO UPDATE to insert new or update existing funds
-- Generated from VCS API Scraper fund data
-- Generated at: 2025-06-05T00:28:06.867Z
-- Schema: Matches fund_table structure

-- FUND DATA (UPSERT - Safe for Duplicates)
-- Processing 50 fund records
-- Will INSERT new records or UPDATE existing ones

-- Record 3001: 디에이치피(DHP)개인투자조합제4호
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20190042',
  '디에이치피(DHP)개인투자조합제4호',
  NULL,
  'VCS Registered Fund',
  820000000,
  820000000,
  '2021-07-30',
  'Active',
  '디지털헬스케어파트너스',
  NULL,
  '{"fund_id":"AS20210652","registration_date":"2021-07-30","expiry_date":"2029-07-29","formation_total_amount":"8.2","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190042","operator_company_name":"디지털헬스케어파트너스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.867Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_name_en = EXCLUDED.fund_name_en,
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

-- Record 3002: 디에이치피(DHP) 라피티개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20190042',
  '디에이치피(DHP) 라피티개인투자조합',
  NULL,
  'VCS Registered Fund',
  110000000,
  110000000,
  '2021-07-13',
  'Active',
  '디지털헬스케어파트너스',
  NULL,
  '{"fund_id":"AS20210533","registration_date":"2021-07-13","expiry_date":"2028-07-12","formation_total_amount":"1.1","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190042","operator_company_name":"디지털헬스케어파트너스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.867Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_name_en = EXCLUDED.fund_name_en,
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

-- Record 3003: 디에스씨홈런펀드제1호
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20120007',
  '디에스씨홈런펀드제1호',
  NULL,
  'VCS Registered Fund',
  248000000000,
  248000000000,
  '2022-08-17',
  'Active',
  '디에스씨인베스트먼트',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20220966","registration_date":"2022-08-17","expiry_date":"2030-08-16","formation_total_amount":"2480.0","investment_character_code":"02","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20120007","operator_company_name":"디에스씨인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.867Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_name_en = EXCLUDED.fund_name_en,
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

-- Record 3004: 디에스씨테크밸류업펀드4호
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20120007',
  '디에스씨테크밸류업펀드4호',
  NULL,
  'VCS Registered Fund',
  25000000000,
  25000000000,
  '2021-10-26',
  'Active',
  '디에스씨인베스트먼트',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20211031","registration_date":"2021-10-26","expiry_date":"2026-10-25","formation_total_amount":"250.0","investment_character_code":"02","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20120007","operator_company_name":"디에스씨인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.867Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_name_en = EXCLUDED.fund_name_en,
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

-- Record 3005: 디에스씨테크밸류업펀드3호
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20120007',
  '디에스씨테크밸류업펀드3호',
  NULL,
  'VCS Registered Fund',
  23800000000,
  23800000000,
  '2021-09-29',
  'Active',
  '디에스씨인베스트먼트',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20210920","registration_date":"2021-09-29","expiry_date":"2026-09-28","formation_total_amount":"238.0","investment_character_code":"02","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20120007","operator_company_name":"디에스씨인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.867Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_name_en = EXCLUDED.fund_name_en,
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

-- Record 3006: 디에스씨세컨더리패키지인수펀드제1호
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20120007',
  '디에스씨세컨더리패키지인수펀드제1호',
  NULL,
  'VCS Registered Fund',
  300000000000,
  300000000000,
  '2023-12-27',
  'Active',
  '디에스씨인베스트먼트',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20231346","registration_date":"2023-12-27","expiry_date":"2029-12-26","formation_total_amount":"3000.0","investment_character_code":"16","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20120007","operator_company_name":"디에스씨인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.867Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_name_en = EXCLUDED.fund_name_en,
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

-- Record 3007: 디에스씨세컨더리벤처펀드제4호
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20120007',
  '디에스씨세컨더리벤처펀드제4호',
  NULL,
  'VCS Registered Fund',
  13000000000,
  13000000000,
  '2021-06-21',
  'Active',
  '디에스씨인베스트먼트',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20210496","registration_date":"2021-06-21","expiry_date":"2026-06-20","formation_total_amount":"130.0","investment_character_code":"25","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20120007","operator_company_name":"디에스씨인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.867Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_name_en = EXCLUDED.fund_name_en,
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

-- Record 3008: 디에스씨도미넌스투자조합제1호
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20120007',
  '디에스씨도미넌스투자조합제1호',
  NULL,
  'VCS Registered Fund',
  10500000000,
  10500000000,
  '2021-12-03',
  'Active',
  '디에스씨인베스트먼트',
  '{"IT","일반"}',
  '{"fund_id":"AS20211222","registration_date":"2021-12-03","expiry_date":"2026-12-02","formation_total_amount":"105.0","investment_character_code":"25","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"IT","mother_fund_id":"","operator_company_id":"OP20120007","operator_company_name":"디에스씨인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.867Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_name_en = EXCLUDED.fund_name_en,
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

-- Record 3009: 디에스벤처 4차산업혁명 전문투자조합 제3호
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20190428',
  '디에스벤처 4차산업혁명 전문투자조합 제3호',
  NULL,
  'VCS Registered Fund',
  2200000000,
  2200000000,
  '2023-06-13',
  'Active',
  '글로넷벤처파트너스',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20230485","registration_date":"2023-06-13","expiry_date":"2028-06-12","formation_total_amount":"22.0","investment_character_code":"25","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20190428","operator_company_name":"글로넷벤처파트너스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.867Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_name_en = EXCLUDED.fund_name_en,
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

-- Record 3010: 디에스벤처 4차산업혁명 전문투자조합 제2호
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20190428',
  '디에스벤처 4차산업혁명 전문투자조합 제2호',
  NULL,
  'VCS Registered Fund',
  2000000000,
  2000000000,
  '2022-07-26',
  'Active',
  '글로넷벤처파트너스',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20220857","registration_date":"2022-07-26","expiry_date":"2027-07-25","formation_total_amount":"20.0","investment_character_code":"02","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20190428","operator_company_name":"글로넷벤처파트너스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.867Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_name_en = EXCLUDED.fund_name_en,
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

-- Record 3011: 디에스벤처 4차산업혁명 전문투자조합 제1호
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20190428',
  '디에스벤처 4차산업혁명 전문투자조합 제1호',
  NULL,
  'VCS Registered Fund',
  2500000000,
  2500000000,
  '2021-07-23',
  'Active',
  '글로넷벤처파트너스',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20210631","registration_date":"2021-07-23","expiry_date":"2026-07-22","formation_total_amount":"25.0","investment_character_code":"02","industry_code":"9","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20190428","operator_company_name":"글로넷벤처파트너스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.868Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_name_en = EXCLUDED.fund_name_en,
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

-- Record 3012: 디쓰리 임팩트 벤처투자조합 제2호
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20180011',
  '디쓰리 임팩트 벤처투자조합 제2호',
  NULL,
  'VCS Registered Fund',
  30850000000,
  30850000000,
  '2019-08-09',
  'Active',
  '디쓰리쥬빌리파트너스',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20190372","registration_date":"2019-08-09","expiry_date":"2027-08-08","formation_total_amount":"308.5","investment_character_code":"23","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20180011","operator_company_name":"디쓰리쥬빌리파트너스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.868Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_name_en = EXCLUDED.fund_name_en,
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

-- Record 3013: 디쓰리 미래환경 벤처투자조합 제2호
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20180011',
  '디쓰리 미래환경 벤처투자조합 제2호',
  NULL,
  'VCS Registered Fund',
  44000000000,
  44000000000,
  '2024-09-05',
  'Active',
  '디쓰리쥬빌리파트너스',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20240865","registration_date":"2024-09-05","expiry_date":"2032-09-04","formation_total_amount":"440.0","investment_character_code":"05","industry_code":"9","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20180011","operator_company_name":"디쓰리쥬빌리파트너스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.868Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_name_en = EXCLUDED.fund_name_en,
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

-- Record 3014: 디쓰리 미래환경 ECO 벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20180011',
  '디쓰리 미래환경 ECO 벤처투자조합',
  NULL,
  'VCS Registered Fund',
  28500000000,
  28500000000,
  '2021-08-26',
  'Active',
  '디쓰리쥬빌리파트너스',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20210763","registration_date":"2021-08-26","expiry_date":"2029-08-25","formation_total_amount":"285.0","investment_character_code":"02","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20180011","operator_company_name":"디쓰리쥬빌리파트너스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.868Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_name_en = EXCLUDED.fund_name_en,
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

-- Record 3015: 디쓰리 ESG 벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20180011',
  '디쓰리 ESG 벤처투자조합',
  NULL,
  'VCS Registered Fund',
  15000000000,
  15000000000,
  '2021-06-04',
  'Active',
  '디쓰리쥬빌리파트너스',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20210454","registration_date":"2021-06-04","expiry_date":"2031-06-03","formation_total_amount":"150.0","investment_character_code":"05","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20180011","operator_company_name":"디쓰리쥬빌리파트너스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.868Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_name_en = EXCLUDED.fund_name_en,
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

-- Record 3016: 디브이피시스템반도체투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20140007',
  '디브이피시스템반도체투자조합',
  NULL,
  'VCS Registered Fund',
  26000000000,
  26000000000,
  '2021-10-26',
  'Active',
  '대덕벤처파트너스',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20211027","registration_date":"2021-10-26","expiry_date":"2029-10-25","formation_total_amount":"260.0","investment_character_code":"03","industry_code":"1","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20140007","operator_company_name":"대덕벤처파트너스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.868Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_name_en = EXCLUDED.fund_name_en,
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

-- Record 3017: 디브이피소부장스케일업투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20140007',
  '디브이피소부장스케일업투자조합',
  NULL,
  'VCS Registered Fund',
  17000000000,
  17000000000,
  '2023-07-31',
  'Active',
  '대덕벤처파트너스',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20230652","registration_date":"2023-07-31","expiry_date":"2031-07-30","formation_total_amount":"170.0","investment_character_code":"03","industry_code":"4","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20140007","operator_company_name":"대덕벤처파트너스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.868Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_name_en = EXCLUDED.fund_name_en,
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

-- Record 3018: 디브이피-SK증권지역혁신벤처투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20190257',
  '디브이피-SK증권지역혁신벤처투자조합1호',
  NULL,
  'VCS Registered Fund',
  21260000000,
  21260000000,
  '2023-10-13',
  'Active',
  '에스케이증권',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20230928","registration_date":"2023-10-13","expiry_date":"2031-10-12","formation_total_amount":"212.6","investment_character_code":"18","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000018","operator_company_id":"OP20190257","operator_company_name":"에스케이증권","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.868Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_name_en = EXCLUDED.fund_name_en,
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

-- Record 3019: 디랩콘텐츠유니콘일자리투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20180025',
  '디랩콘텐츠유니콘일자리투자조합1호',
  NULL,
  'VCS Registered Fund',
  27500000000,
  27500000000,
  '2020-01-29',
  'Active',
  '엔벤처스',
  '{"문화 기타","문화"}',
  '{"fund_id":"AS20200052","registration_date":"2020-01-29","expiry_date":"2028-01-28","formation_total_amount":"275.0","investment_character_code":"24","industry_code":"6","investment_field_type":"문화","investment_field_detail_type":"문화 기타","mother_fund_id":"MF00000001","operator_company_id":"OP20180025","operator_company_name":"엔벤처스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.868Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_name_en = EXCLUDED.fund_name_en,
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

-- Record 3020: 디랩 브이에스 개인투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20100016',
  '디랩 브이에스 개인투자조합 1호',
  NULL,
  'VCS Registered Fund',
  1270000000,
  1270000000,
  '2018-12-17',
  'Active',
  '벤처스퀘어',
  NULL,
  '{"fund_id":"AS20180630","registration_date":"2018-12-17","expiry_date":"2025-12-16","formation_total_amount":"12.7","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20100016","operator_company_name":"벤처스퀘어","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.868Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_name_en = EXCLUDED.fund_name_en,
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

-- Record 3021: 드림랩 창업투자 제1호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20150028',
  '드림랩 창업투자 제1호 개인투자조합',
  NULL,
  'VCS Registered Fund',
  160000000,
  160000000,
  '2022-08-03',
  'Active',
  '드림랩',
  NULL,
  '{"fund_id":"AS20220873","registration_date":"2022-08-03","expiry_date":"2028-07-31","formation_total_amount":"1.6","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20150028","operator_company_name":"드림랩","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.868Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_name_en = EXCLUDED.fund_name_en,
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

-- Record 3022: 동훈 테크스타 5호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20070007',
  '동훈 테크스타 5호 투자조합',
  NULL,
  'VCS Registered Fund',
  15000000000,
  15000000000,
  '2019-07-15',
  'Active',
  '동훈인베스트먼트',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20190297","registration_date":"2019-07-15","expiry_date":"2027-07-14","formation_total_amount":"150.0","investment_character_code":"20","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20070007","operator_company_name":"동훈인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.868Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_name_en = EXCLUDED.fund_name_en,
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

-- Record 3023: 동훈 청년창업펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20070007',
  '동훈 청년창업펀드',
  NULL,
  'VCS Registered Fund',
  10000000000,
  10000000000,
  '2015-10-07',
  'Active',
  '동훈인베스트먼트',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20150050","registration_date":"2015-10-07","expiry_date":"2025-08-07","formation_total_amount":"100.0","investment_character_code":"20","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20070007","operator_company_name":"동훈인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.868Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_name_en = EXCLUDED.fund_name_en,
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

-- Record 3024: 동훈 정석 6호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20070007',
  '동훈 정석 6호 투자조합',
  NULL,
  'VCS Registered Fund',
  8250000000,
  8250000000,
  '2023-12-06',
  'Active',
  '동훈인베스트먼트',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20231215","registration_date":"2023-12-06","expiry_date":"2028-12-05","formation_total_amount":"82.5","investment_character_code":"25","industry_code":"4","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20070007","operator_company_name":"동훈인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.868Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_name_en = EXCLUDED.fund_name_en,
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

-- Record 3025: 동문미디어콘텐츠&문화기술투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20100005',
  '동문미디어콘텐츠&문화기술투자조합',
  NULL,
  'VCS Registered Fund',
  34000000000,
  34000000000,
  '2010-08-30',
  'Active',
  '동문파트너즈',
  '{"문화 기타","문화"}',
  '{"fund_id":"AS20100039","registration_date":"2010-08-30","expiry_date":"2026-04-29","formation_total_amount":"340.0","investment_character_code":"24","industry_code":"6","investment_field_type":"문화","investment_field_detail_type":"문화 기타","mother_fund_id":"MF00000001","operator_company_id":"OP20100005","operator_company_name":"동문파트너즈","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.868Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_name_en = EXCLUDED.fund_name_en,
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

-- Record 3026: 동남권 지역혁신 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20190375',
  '동남권 지역혁신 투자조합',
  NULL,
  'VCS Registered Fund',
  20000000000,
  20000000000,
  '2023-11-16',
  'Active',
  '경남벤처투자',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20231105","registration_date":"2023-11-16","expiry_date":"2031-11-15","formation_total_amount":"200.0","investment_character_code":"10","industry_code":"9","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000016","operator_company_id":"OP20190375","operator_company_name":"경남벤처투자","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.868Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_name_en = EXCLUDED.fund_name_en,
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

-- Record 3027: 동남권 지역혁신 엔젤투자 펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20160002',
  '동남권 지역혁신 엔젤투자 펀드',
  NULL,
  'VCS Registered Fund',
  5010000000,
  5010000000,
  '2024-01-08',
  'Active',
  '부산지역대학연합기술지주',
  NULL,
  '{"fund_id":"AS20240020","registration_date":"2024-01-08","expiry_date":"2032-01-07","formation_total_amount":"50.1","investment_character_code":"","industry_code":"3","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"MF00000021","operator_company_id":"OP20160002","operator_company_name":"부산지역대학연합기술지주","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.868Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_name_en = EXCLUDED.fund_name_en,
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

-- Record 3028: 동남권 지역뉴딜 벤처펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20000029',
  '동남권 지역뉴딜 벤처펀드',
  NULL,
  'VCS Registered Fund',
  84900000000,
  84900000000,
  '2022-03-31',
  'Active',
  '한국벤처투자',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20220357","registration_date":"2022-03-31","expiry_date":"2034-03-30","formation_total_amount":"849.0","investment_character_code":"10","industry_code":"9","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20000029","operator_company_name":"한국벤처투자","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.868Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_name_en = EXCLUDED.fund_name_en,
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

-- Record 3029: 도약하다 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20210487',
  '도약하다 투자조합',
  NULL,
  'VCS Registered Fund',
  15800000000,
  15800000000,
  '2020-06-02',
  'Active',
  '인비저닝파트너스',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20200247","registration_date":"2020-06-02","expiry_date":"2028-06-01","formation_total_amount":"158.0","investment_character_code":"21","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20210487","operator_company_name":"인비저닝파트너스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.868Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_name_en = EXCLUDED.fund_name_en,
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

-- Record 3030: 도담벤처스 투자조합 1호 
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20210581',
  '도담벤처스 투자조합 1호 ',
  NULL,
  'VCS Registered Fund',
  1990000000,
  1990000000,
  '2022-05-13',
  'Active',
  '도담벤처스',
  NULL,
  '{"fund_id":"AS20220516","registration_date":"2022-05-13","expiry_date":"2030-05-12","formation_total_amount":"19.9","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20210581","operator_company_name":"도담벤처스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.868Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_name_en = EXCLUDED.fund_name_en,
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

-- Record 3031: 델타프롭테크유니콘투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20180010',
  '델타프롭테크유니콘투자조합',
  NULL,
  'VCS Registered Fund',
  2000000000,
  2000000000,
  '2020-04-17',
  'Active',
  '델타인베스트먼트',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20200158","registration_date":"2020-04-17","expiry_date":"2027-04-16","formation_total_amount":"20.0","investment_character_code":"25","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20180010","operator_company_name":"델타인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.868Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_name_en = EXCLUDED.fund_name_en,
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

-- Record 3032: 델타유니콘투자조합3호
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20180010',
  '델타유니콘투자조합3호',
  NULL,
  'VCS Registered Fund',
  2300000000,
  2300000000,
  '2021-12-08',
  'Active',
  '델타인베스트먼트',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20211250","registration_date":"2021-12-08","expiry_date":"2026-12-07","formation_total_amount":"23.0","investment_character_code":"02","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20180010","operator_company_name":"델타인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.868Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_name_en = EXCLUDED.fund_name_en,
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

-- Record 3033: 델타유니콘투자조합2호
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20180010',
  '델타유니콘투자조합2호',
  NULL,
  'VCS Registered Fund',
  5060000000,
  5060000000,
  '2021-12-16',
  'Active',
  '델타인베스트먼트',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20211319","registration_date":"2021-12-16","expiry_date":"2026-12-15","formation_total_amount":"50.6","investment_character_code":"25","industry_code":"9","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20180010","operator_company_name":"델타인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.868Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_name_en = EXCLUDED.fund_name_en,
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

-- Record 3034: 델타스타투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20180010',
  '델타스타투자조합1호',
  NULL,
  'VCS Registered Fund',
  2050000000,
  2050000000,
  '2023-02-21',
  'Active',
  '델타인베스트먼트',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20230110","registration_date":"2023-02-21","expiry_date":"2028-02-20","formation_total_amount":"20.5","investment_character_code":"16","industry_code":"9","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20180010","operator_company_name":"델타인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.868Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_name_en = EXCLUDED.fund_name_en,
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

-- Record 3035: 델타스타투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20230164',
  '델타스타투자조합1호',
  NULL,
  'VCS Registered Fund',
  2050000000,
  2050000000,
  '2023-02-21',
  'Active',
  '에이오에이캐피탈파트너스',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20230110","registration_date":"2023-02-21","expiry_date":"2028-02-20","formation_total_amount":"20.5","investment_character_code":"16","industry_code":"9","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20230164","operator_company_name":"에이오에이캐피탈파트너스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.868Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_name_en = EXCLUDED.fund_name_en,
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

-- Record 3036: 델타벤처투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20180010',
  '델타벤처투자조합1호',
  NULL,
  'VCS Registered Fund',
  10000000000,
  10000000000,
  '2018-11-06',
  'Active',
  '델타인베스트먼트',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20180331","registration_date":"2018-11-06","expiry_date":"2026-11-05","formation_total_amount":"100.0","investment_character_code":"19","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20180010","operator_company_name":"델타인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.868Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_name_en = EXCLUDED.fund_name_en,
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

-- Record 3037: 델타메타버스유니콘투자조합2호
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20180010',
  '델타메타버스유니콘투자조합2호',
  NULL,
  'VCS Registered Fund',
  4200000000,
  4200000000,
  '2021-10-26',
  'Active',
  '델타인베스트먼트',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20211025","registration_date":"2021-10-26","expiry_date":"2026-10-25","formation_total_amount":"42.0","investment_character_code":"02","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20180010","operator_company_name":"델타인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.868Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_name_en = EXCLUDED.fund_name_en,
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

-- Record 3038: 데일리 파운틴헤드 프로젝트 펀드2호
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20140004',
  '데일리 파운틴헤드 프로젝트 펀드2호',
  NULL,
  'VCS Registered Fund',
  4390000000,
  4390000000,
  '2024-08-20',
  'Active',
  '데일리파트너스',
  '{"일반 기타","일반"}',
  '{"fund_id":"AS20240792","registration_date":"2024-08-20","expiry_date":"2029-08-19","formation_total_amount":"43.9","investment_character_code":"01","industry_code":"9","investment_field_type":"일반","investment_field_detail_type":"일반 기타","mother_fund_id":"","operator_company_id":"OP20140004","operator_company_name":"데일리파트너스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.868Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_name_en = EXCLUDED.fund_name_en,
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

-- Record 3039: 데일리 파운틴헤드 프로젝트 펀드1호
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20140004',
  '데일리 파운틴헤드 프로젝트 펀드1호',
  NULL,
  'VCS Registered Fund',
  5480000000,
  5480000000,
  '2024-02-16',
  'Active',
  '데일리파트너스',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20240109","registration_date":"2024-02-16","expiry_date":"2029-02-15","formation_total_amount":"54.8","investment_character_code":"30","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20140004","operator_company_name":"데일리파트너스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.868Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_name_en = EXCLUDED.fund_name_en,
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

-- Record 3040: 데일리 파운틴헤드 블라인드 펀드1호
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20140004',
  '데일리 파운틴헤드 블라인드 펀드1호',
  NULL,
  'VCS Registered Fund',
  12500000000,
  12500000000,
  '2025-01-02',
  'Active',
  '데일리파트너스',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20250001","registration_date":"2025-01-02","expiry_date":"2033-01-01","formation_total_amount":"125.0","investment_character_code":"10","industry_code":"9","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20140004","operator_company_name":"데일리파트너스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.868Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_name_en = EXCLUDED.fund_name_en,
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

-- Record 3041: 데일리 크릭 바이오 헬스케어 펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20140004',
  '데일리 크릭 바이오 헬스케어 펀드',
  NULL,
  'VCS Registered Fund',
  48400000000,
  48400000000,
  '2022-12-09',
  'Active',
  '데일리파트너스',
  '{"바이오","일반"}',
  '{"fund_id":"AS20221445","registration_date":"2022-12-09","expiry_date":"2030-12-08","formation_total_amount":"484.0","investment_character_code":"04","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"바이오","mother_fund_id":"MF00000001","operator_company_id":"OP20140004","operator_company_name":"데일리파트너스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.868Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_name_en = EXCLUDED.fund_name_en,
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

-- Record 3042: 데일리 임파워링 바이오 헬스케어 펀드4호
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20140004',
  '데일리 임파워링 바이오 헬스케어 펀드4호',
  NULL,
  'VCS Registered Fund',
  14650000000,
  14650000000,
  '2020-10-05',
  'Active',
  '데일리파트너스',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20200548","registration_date":"2020-10-05","expiry_date":"2025-10-04","formation_total_amount":"146.5","investment_character_code":"01","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20140004","operator_company_name":"데일리파트너스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.868Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_name_en = EXCLUDED.fund_name_en,
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

-- Record 3043: 데일리 임파워링 바이오 헬스케어 펀드2호
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20140004',
  '데일리 임파워링 바이오 헬스케어 펀드2호',
  NULL,
  'VCS Registered Fund',
  37900000000,
  37900000000,
  '2019-01-29',
  'Active',
  '데일리파트너스',
  '{"바이오","일반"}',
  '{"fund_id":"AS20190039","registration_date":"2019-01-29","expiry_date":"2026-01-28","formation_total_amount":"379.0","investment_character_code":"01","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"바이오","mother_fund_id":"","operator_company_id":"OP20140004","operator_company_name":"데일리파트너스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.868Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_name_en = EXCLUDED.fund_name_en,
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

-- Record 3044: 데일리 임파워링 바이오 헬스케어 펀드 5호
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20140004',
  '데일리 임파워링 바이오 헬스케어 펀드 5호',
  NULL,
  'VCS Registered Fund',
  20700000000,
  20700000000,
  '2022-02-09',
  'Active',
  '데일리파트너스',
  '{"바이오","일반"}',
  '{"fund_id":"AS20220130","registration_date":"2022-02-09","expiry_date":"2027-02-08","formation_total_amount":"207.0","investment_character_code":"04","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"바이오","mother_fund_id":"","operator_company_id":"OP20140004","operator_company_name":"데일리파트너스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.868Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_name_en = EXCLUDED.fund_name_en,
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

-- Record 3045: 데일리 임파워링 바이오 헬스케어 펀드 3호
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20140004',
  '데일리 임파워링 바이오 헬스케어 펀드 3호',
  NULL,
  'VCS Registered Fund',
  15800000000,
  15800000000,
  '2019-04-12',
  'Active',
  '데일리파트너스',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20190162","registration_date":"2019-04-12","expiry_date":"2026-04-11","formation_total_amount":"158.0","investment_character_code":"01","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20140004","operator_company_name":"데일리파트너스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.868Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_name_en = EXCLUDED.fund_name_en,
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

-- Record 3046: 데일리 임파워링 바이오 헬스케어 펀드 1호
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20140004',
  '데일리 임파워링 바이오 헬스케어 펀드 1호',
  NULL,
  'VCS Registered Fund',
  34100000000,
  34100000000,
  '2018-08-22',
  'Active',
  '데일리파트너스',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20180214","registration_date":"2018-08-22","expiry_date":"2025-08-21","formation_total_amount":"341.0","investment_character_code":"01","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20140004","operator_company_name":"데일리파트너스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.868Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_name_en = EXCLUDED.fund_name_en,
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

-- Record 3047: 데일리 왓슨 바이오 헬스케어 펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20140004',
  '데일리 왓슨 바이오 헬스케어 펀드',
  NULL,
  'VCS Registered Fund',
  24700000000,
  24700000000,
  '2019-07-26',
  'Active',
  '데일리파트너스',
  '{"바이오","일반"}',
  '{"fund_id":"AS20190338","registration_date":"2019-07-26","expiry_date":"2026-07-25","formation_total_amount":"247.0","investment_character_code":"20","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"바이오","mother_fund_id":"MF00000001","operator_company_id":"OP20140004","operator_company_name":"데일리파트너스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.868Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_name_en = EXCLUDED.fund_name_en,
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

-- Record 3048: 데일리 얼리버드 바이오 헬스케어 펀드1호
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20140004',
  '데일리 얼리버드 바이오 헬스케어 펀드1호',
  NULL,
  'VCS Registered Fund',
  10170000000,
  10170000000,
  '2021-03-22',
  'Active',
  '데일리파트너스',
  NULL,
  '{"fund_id":"AS20210205","registration_date":"2021-03-22","expiry_date":"2026-03-21","formation_total_amount":"101.7","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20140004","operator_company_name":"데일리파트너스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.869Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_name_en = EXCLUDED.fund_name_en,
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

-- Record 3049: 데일리 얼리버드 바이오 헬스케어 펀드 2호
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20140004',
  '데일리 얼리버드 바이오 헬스케어 펀드 2호',
  NULL,
  'VCS Registered Fund',
  5800000000,
  5800000000,
  '2021-07-23',
  'Active',
  '데일리파트너스',
  NULL,
  '{"fund_id":"AS20210591","registration_date":"2021-07-23","expiry_date":"2026-07-22","formation_total_amount":"58.0","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20140004","operator_company_name":"데일리파트너스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.869Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_name_en = EXCLUDED.fund_name_en,
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

-- Record 3050: 데일리 스완슨 바이오 헬스케어 펀드6호
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20140004',
  '데일리 스완슨 바이오 헬스케어 펀드6호',
  NULL,
  'VCS Registered Fund',
  5700000000,
  5700000000,
  '2021-04-14',
  'Active',
  '데일리파트너스',
  NULL,
  '{"fund_id":"AS20210263","registration_date":"2021-04-14","expiry_date":"2026-04-13","formation_total_amount":"57.0","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20140004","operator_company_name":"데일리파트너스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.869Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_name_en = EXCLUDED.fund_name_en,
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

-- Batch 61 completed! 50 fund records processed.
-- Progress: 3050/3689 total records

