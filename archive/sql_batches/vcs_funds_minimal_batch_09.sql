-- VCS Fund MINIMAL UPSERT Batch 9/74 (Records 401-450)
-- MINIMAL: Only using basic columns that definitely exist
-- Generated from VCS API Scraper fund data
-- Generated at: 2025-06-05T00:40:21.665Z
-- Schema: Minimal fund_table structure (basic columns only)

-- MINIMAL FUND DATA (UPSERT - Safe for Duplicates)
-- Processing 50 fund records
-- Will INSERT new records or UPDATE existing ones

-- Record 401: 킹슬리 센터보드 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20160025',
  '킹슬리 센터보드 투자조합',
  990000000,
  '2022-08-22',
  '{"fund_id":"AS20220934","registration_date":"2022-08-22","expiry_date":"2027-08-21","formation_total_amount":"9.9","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20160025","operator_company_name":"킹슬리벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"킹슬리벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.665Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 402: 킹슬리 SAFE 엔젤 4호 벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20160025',
  '킹슬리 SAFE 엔젤 4호 벤처투자조합',
  16150000000,
  '2022-04-08',
  '{"fund_id":"AS20220398","registration_date":"2022-04-08","expiry_date":"2032-04-07","formation_total_amount":"161.5","investment_character_code":"02","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20160025","operator_company_name":"킹슬리벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"킹슬리벤처스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.666Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 403: 킹슬리 Gemini 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20160025',
  '킹슬리 Gemini 개인투자조합',
  170000000,
  '2021-08-30',
  '{"fund_id":"AS20210776","registration_date":"2021-08-30","expiry_date":"2026-08-29","formation_total_amount":"1.7","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20160025","operator_company_name":"킹슬리벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"킹슬리벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.666Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 404: 킹고 테크 임팩트 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20170033',
  '킹고 테크 임팩트 투자조합',
  21000000000,
  '2024-08-05',
  '{"fund_id":"AS20240741","registration_date":"2024-08-05","expiry_date":"2032-08-04","formation_total_amount":"210.0","investment_character_code":"20","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20170033","operator_company_name":"킹고투자파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"킹고투자파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.666Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 405: 킹고 세컨더리 투자조합 제1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20170033',
  '킹고 세컨더리 투자조합 제1호',
  36000000000,
  '2022-08-23',
  '{"fund_id":"AS20220978","registration_date":"2022-08-23","expiry_date":"2027-08-22","formation_total_amount":"360.0","investment_character_code":"16","industry_code":"4","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20170033","operator_company_name":"킹고투자파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"킹고투자파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.666Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 406: 키움뉴히어로8호펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19990010',
  '키움뉴히어로8호펀드',
  125000000000,
  '2024-07-03',
  '{"fund_id":"AS20240594","registration_date":"2024-07-03","expiry_date":"2032-07-02","formation_total_amount":"1250.0","investment_character_code":"03","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP19990010","operator_company_name":"키움인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"키움인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.666Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 407: 키움뉴히어로7호핀테크혁신펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19990010',
  '키움뉴히어로7호핀테크혁신펀드',
  30000000000,
  '2023-08-10',
  '{"fund_id":"AS20230700","registration_date":"2023-08-10","expiry_date":"2031-08-09","formation_total_amount":"300.0","investment_character_code":"10","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP19990010","operator_company_name":"키움인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"키움인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.666Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 408: 키움뉴히어로6호창업초기펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19990010',
  '키움뉴히어로6호창업초기펀드',
  50400000000,
  '2022-12-29',
  '{"fund_id":"AS20230004","registration_date":"2022-12-29","expiry_date":"2030-12-28","formation_total_amount":"504.0","investment_character_code":"02","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP19990010","operator_company_name":"키움인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"키움인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.666Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 409: 키움뉴히어로5호디지털혁신펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19990010',
  '키움뉴히어로5호디지털혁신펀드',
  141400000000,
  '2022-12-01',
  '{"fund_id":"AS20221384","registration_date":"2022-12-01","expiry_date":"2030-11-30","formation_total_amount":"1414.0","investment_character_code":"02","industry_code":"4","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP19990010","operator_company_name":"키움인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"키움인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.666Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 410: 키움뉴히어로4호스케일업펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19990010',
  '키움뉴히어로4호스케일업펀드',
  140000000000,
  '2021-10-07',
  '{"fund_id":"AS20210959","registration_date":"2021-10-07","expiry_date":"2029-10-06","formation_total_amount":"1400.0","investment_character_code":"08","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP19990010","operator_company_name":"키움인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"키움인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.666Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 411: 키움뉴히어로3호핀테크혁신펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19990010',
  '키움뉴히어로3호핀테크혁신펀드',
  20000000000,
  '2021-05-21',
  '{"fund_id":"AS20210406","registration_date":"2021-05-21","expiry_date":"2029-05-20","formation_total_amount":"200.0","investment_character_code":"02","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP19990010","operator_company_name":"키움인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"키움인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.666Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 412: 키움뉴히어로2호기술혁신펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19990010',
  '키움뉴히어로2호기술혁신펀드',
  53500000000,
  '2020-11-18',
  '{"fund_id":"AS20200661","registration_date":"2020-11-18","expiry_date":"2028-11-17","formation_total_amount":"535.0","investment_character_code":"09","industry_code":"4","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP19990010","operator_company_name":"키움인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"키움인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.666Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 413: 키움뉴히어로1호펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19990010',
  '키움뉴히어로1호펀드',
  30000000000,
  '2020-05-25',
  '{"fund_id":"AS20200222","registration_date":"2020-05-25","expiry_date":"2028-05-24","formation_total_amount":"300.0","investment_character_code":"20","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP19990010","operator_company_name":"키움인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"키움인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.666Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 414: 키움-유안타 2019 스케일업 펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19890001',
  '키움-유안타 2019 스케일업 펀드',
  125000000000,
  '2020-04-29',
  '{"fund_id":"AS20200196","registration_date":"2020-04-29","expiry_date":"2028-04-28","formation_total_amount":"1250.0","investment_character_code":"01","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP19890001","operator_company_name":"유안타인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"유안타인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.666Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 415: 키움-신한이노베이션제2호투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19990010',
  '키움-신한이노베이션제2호투자조합',
  35000000000,
  '2021-08-04',
  '{"fund_id":"AS20210678","registration_date":"2021-08-04","expiry_date":"2027-08-03","formation_total_amount":"350.0","investment_character_code":"16","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP19990010","operator_company_name":"키움인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"키움인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.666Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 416: 키움-신한 이노베이션 제1호 투자조합 
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19990010',
  '키움-신한 이노베이션 제1호 투자조합 ',
  30000000000,
  '2019-06-21',
  '{"fund_id":"AS20190255","registration_date":"2019-06-21","expiry_date":"2025-06-20","formation_total_amount":"300.0","investment_character_code":"02","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP19990010","operator_company_name":"키움인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"키움인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.666Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 417: 클러스트벤처스 개인투자조합 제3호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20220606',
  '클러스트벤처스 개인투자조합 제3호',
  110000000,
  '2024-11-27',
  '{"fund_id":"AS20241186","registration_date":"2024-11-27","expiry_date":"2029-12-31","formation_total_amount":"1.1","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20220606","operator_company_name":"클러스트벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"클러스트벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.666Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 418: 클러스트벤처스 개인투자조합 제2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20220606',
  '클러스트벤처스 개인투자조합 제2호',
  150000000,
  '2023-10-17',
  '{"fund_id":"AS20230935","registration_date":"2023-10-17","expiry_date":"2028-11-30","formation_total_amount":"1.5","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20220606","operator_company_name":"클러스트벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"클러스트벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.666Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 419: 클러스트벤처스 개인투자조합 제1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20220606',
  '클러스트벤처스 개인투자조합 제1호',
  110000000,
  '2023-05-03',
  '{"fund_id":"AS20230351","registration_date":"2023-05-03","expiry_date":"2028-06-30","formation_total_amount":"1.1","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20220606","operator_company_name":"클러스트벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"클러스트벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.666Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 420: 클러스터 개인투자조합 제7호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20220606',
  '클러스터 개인투자조합 제7호',
  120000000,
  '2022-08-22',
  '{"fund_id":"AS20220913","registration_date":"2022-08-22","expiry_date":"2027-10-31","formation_total_amount":"1.2","investment_character_code":"","industry_code":"7","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20220606","operator_company_name":"클러스트벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"클러스트벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.666Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 421: 클러스터 개인투자조합 제1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20220606',
  '클러스터 개인투자조합 제1호',
  200000000,
  '2021-07-15',
  '{"fund_id":"AS20210536","registration_date":"2021-07-15","expiry_date":"2026-07-31","formation_total_amount":"2.0","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20220606","operator_company_name":"클러스트벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"클러스트벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.666Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 422: 클라우드 AI 벤처펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210709',
  '클라우드 AI 벤처펀드',
  2130000000,
  '2025-03-24',
  '{"fund_id":"AS20250215","registration_date":"2025-03-24","expiry_date":"2030-03-23","formation_total_amount":"21.3","investment_character_code":"25","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20210709","operator_company_name":"에이온인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"에이온인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.666Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 423: 크립톤-크립톤엑스 지역재생투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20110014',
  '크립톤-크립톤엑스 지역재생투자조합1호',
  200000000,
  '2024-05-23',
  '{"fund_id":"AS20240442","registration_date":"2024-05-23","expiry_date":"2029-05-22","formation_total_amount":"2.0","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20110014","operator_company_name":"크립톤","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"크립톤","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.666Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 424: 크립톤-엔젤링크 개인투자조합 3호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20110014',
  '크립톤-엔젤링크 개인투자조합 3호',
  220000000,
  '2021-09-15',
  '{"fund_id":"AS20210862","registration_date":"2021-09-15","expiry_date":"2026-09-14","formation_total_amount":"2.2","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20110014","operator_company_name":"크립톤","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"크립톤","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.666Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 425: 크립톤-엔젤링크 개인투자조합 2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20110014',
  '크립톤-엔젤링크 개인투자조합 2호',
  1330000000,
  '2021-09-30',
  '{"fund_id":"AS20210919","registration_date":"2021-09-30","expiry_date":"2026-09-29","formation_total_amount":"13.3","investment_character_code":"","industry_code":"3","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20110014","operator_company_name":"크립톤","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"크립톤","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.666Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 426: 크립톤-엔젤링크 개인투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20110014',
  '크립톤-엔젤링크 개인투자조합 1호',
  160000000,
  '2020-07-30',
  '{"fund_id":"AS20200369","registration_date":"2020-07-30","expiry_date":"2025-07-29","formation_total_amount":"1.6","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20110014","operator_company_name":"크립톤","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"크립톤","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.666Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 427: 크립톤-엔젤링크 7호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20110014',
  '크립톤-엔젤링크 7호 개인투자조합',
  1430000000,
  '2024-08-14',
  '{"fund_id":"AS20240750","registration_date":"2024-08-14","expiry_date":"2029-08-13","formation_total_amount":"14.3","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20110014","operator_company_name":"크립톤","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"크립톤","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.666Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 428: 크립톤-엔젤링크 6호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20110014',
  '크립톤-엔젤링크 6호 개인투자조합',
  220000000,
  '2024-07-15',
  '{"fund_id":"AS20240610","registration_date":"2024-07-15","expiry_date":"2029-07-14","formation_total_amount":"2.2","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20110014","operator_company_name":"크립톤","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"크립톤","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.666Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 429: 크립톤-엔젤링크 5호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20110014',
  '크립톤-엔젤링크 5호 개인투자조합',
  170000000,
  '2023-09-21',
  '{"fund_id":"AS20230810","registration_date":"2023-09-21","expiry_date":"2028-09-20","formation_total_amount":"1.7","investment_character_code":"","industry_code":"7","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20110014","operator_company_name":"크립톤","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"크립톤","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.666Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 430: 크립톤-엔젤링크 4호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20110014',
  '크립톤-엔젤링크 4호 개인투자조합',
  1660000000,
  '2022-04-18',
  '{"fund_id":"AS20220381","registration_date":"2022-04-18","expiry_date":"2027-04-17","formation_total_amount":"16.6","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20110014","operator_company_name":"크립톤","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"크립톤","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.666Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 431: 크로스로드창업초기벤처펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20230065',
  '크로스로드창업초기벤처펀드',
  20050000000,
  '2023-11-15',
  '{"fund_id":"AS20231080","registration_date":"2023-11-15","expiry_date":"2031-11-14","formation_total_amount":"200.5","investment_character_code":"20","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20230065","operator_company_name":"크로스로드파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"크로스로드파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.666Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 432: 크로스로드슈퍼갭벤처펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20230065',
  '크로스로드슈퍼갭벤처펀드',
  20050000000,
  '2023-11-16',
  '{"fund_id":"AS20231094","registration_date":"2023-11-16","expiry_date":"2031-11-15","formation_total_amount":"200.5","investment_character_code":"28","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20230065","operator_company_name":"크로스로드파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"크로스로드파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.666Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 433: 크래프톤-코나 아이피 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20180002',
  '크래프톤-코나 아이피 투자조합',
  30000000000,
  '2023-08-09',
  '{"fund_id":"AS20230692","registration_date":"2023-08-09","expiry_date":"2031-08-08","formation_total_amount":"300.0","investment_character_code":"24","industry_code":"7","investment_field_type":"문화","investment_field_detail_type":"문화 기타","mother_fund_id":"MF00000001","operator_company_id":"OP20180002","operator_company_name":"코나벤처파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"코나벤처파트너스","investment_focus":["문화 기타","문화"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.666Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 434: 큐브 바운스백 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20090006',
  '큐브 바운스백 투자조합',
  15000000000,
  '2015-04-17',
  '{"fund_id":"AS20150035","registration_date":"2015-04-17","expiry_date":"2025-11-23","formation_total_amount":"150.0","investment_character_code":"22","industry_code":"9","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20090006","operator_company_name":"큐브벤처파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"큐브벤처파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.666Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 435: 큐브 뉴 트렌드 제1호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20090006',
  '큐브 뉴 트렌드 제1호 투자조합',
  10000000000,
  '2022-04-26',
  '{"fund_id":"AS20220467","registration_date":"2022-04-26","expiry_date":"2027-04-25","formation_total_amount":"100.0","investment_character_code":"06","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20090006","operator_company_name":"큐브벤처파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"큐브벤처파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.666Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 436: 큐브 그로쓰 제3호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20090006',
  '큐브 그로쓰 제3호 투자조합',
  2000000000,
  '2020-07-27',
  '{"fund_id":"AS20200357","registration_date":"2020-07-27","expiry_date":"2025-07-26","formation_total_amount":"20.0","investment_character_code":"01","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20090006","operator_company_name":"큐브벤처파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"큐브벤처파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.666Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 437: 퀀텀프렌드벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20170021',
  '퀀텀프렌드벤처투자조합',
  3480000000,
  '2021-07-06',
  '{"fund_id":"AS20210560","registration_date":"2021-07-06","expiry_date":"2026-07-05","formation_total_amount":"34.8","investment_character_code":"25","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20170021","operator_company_name":"퀀텀벤처스코리아","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"퀀텀벤처스코리아","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.666Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 438: 퀀텀창업초기1호투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20170021',
  '퀀텀창업초기1호투자조합',
  21300000000,
  '2018-12-10',
  '{"fund_id":"AS20180366","registration_date":"2018-12-10","expiry_date":"2026-12-09","formation_total_amount":"213.0","investment_character_code":"20","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20170021","operator_company_name":"퀀텀벤처스코리아","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"퀀텀벤처스코리아","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.666Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 439: 퀀텀점프펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20180067',
  '퀀텀점프펀드',
  100000000,
  '2021-04-12',
  '{"fund_id":"AS20210272","registration_date":"2021-04-12","expiry_date":"2026-04-11","formation_total_amount":"1.0","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20180067","operator_company_name":"와이플래닛","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"와이플래닛","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.666Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 440: 퀀텀일구이무제2호벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20170021',
  '퀀텀일구이무제2호벤처투자조합',
  5600000000,
  '2021-04-12',
  '{"fund_id":"AS20210291","registration_date":"2021-04-12","expiry_date":"2026-04-11","formation_total_amount":"56.0","investment_character_code":"25","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"IT","mother_fund_id":"","operator_company_id":"OP20170021","operator_company_name":"퀀텀벤처스코리아","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"퀀텀벤처스코리아","investment_focus":["IT","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.666Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 441: 퀀텀일구이무벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20170021',
  '퀀텀일구이무벤처투자조합',
  6100000000,
  '2020-10-19',
  '{"fund_id":"AS20200585","registration_date":"2020-10-19","expiry_date":"2025-10-18","formation_total_amount":"61.0","investment_character_code":"16","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20170021","operator_company_name":"퀀텀벤처스코리아","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"퀀텀벤처스코리아","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.666Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 442: 퀀텀세컨더리제1호펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20170021',
  '퀀텀세컨더리제1호펀드',
  29900000000,
  '2023-01-18',
  '{"fund_id":"AS20230053","registration_date":"2023-01-18","expiry_date":"2030-01-17","formation_total_amount":"299.0","investment_character_code":"16","industry_code":"9","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20170021","operator_company_name":"퀀텀벤처스코리아","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"퀀텀벤처스코리아","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.666Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 443: 퀀텀딥테크엔젤1호펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20170021',
  '퀀텀딥테크엔젤1호펀드',
  3000000000,
  '2021-07-05',
  '{"fund_id":"AS20210557","registration_date":"2021-07-05","expiry_date":"2028-07-04","formation_total_amount":"30.0","investment_character_code":"20","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20170021","operator_company_name":"퀀텀벤처스코리아","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"퀀텀벤처스코리아","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.666Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 444: 퀀텀5G특화4차산업고급기술펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20170021',
  '퀀텀5G특화4차산업고급기술펀드',
  49700000000,
  '2019-11-28',
  '{"fund_id":"AS20190560","registration_date":"2019-11-28","expiry_date":"2027-11-27","formation_total_amount":"497.0","investment_character_code":"02","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20170021","operator_company_name":"퀀텀벤처스코리아","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"퀀텀벤처스코리아","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.666Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 445: 퀀텀-코리아오메가4차산업핵심기술펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20170021',
  '퀀텀-코리아오메가4차산업핵심기술펀드',
  34000000000,
  '2019-02-25',
  '{"fund_id":"AS20190078","registration_date":"2019-02-25","expiry_date":"2027-02-24","formation_total_amount":"340.0","investment_character_code":"02","industry_code":"1","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20170021","operator_company_name":"퀀텀벤처스코리아","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"퀀텀벤처스코리아","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.666Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 446: 퀀텀 10호 딥테크펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20170021',
  '퀀텀 10호 딥테크펀드',
  54000000000,
  '2023-01-18',
  '{"fund_id":"AS20230052","registration_date":"2023-01-18","expiry_date":"2031-01-17","formation_total_amount":"540.0","investment_character_code":"06","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20170021","operator_company_name":"퀀텀벤처스코리아","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"퀀텀벤처스코리아","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.666Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 447: 쿼드인사이트4호투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190180',
  '쿼드인사이트4호투자조합',
  3460000000,
  '2021-12-17',
  '{"fund_id":"AS20211305","registration_date":"2021-12-17","expiry_date":"2028-12-16","formation_total_amount":"34.6","investment_character_code":"","industry_code":"3","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190180","operator_company_name":"쿼드벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"쿼드벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.666Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 448: 쿼드인사이트3호투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190180',
  '쿼드인사이트3호투자조합',
  4000000000,
  '2021-03-15',
  '{"fund_id":"AS20210178","registration_date":"2021-03-15","expiry_date":"2026-03-14","formation_total_amount":"40.0","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190180","operator_company_name":"쿼드벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"쿼드벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.666Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 449: 쿼드인사이트2호투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190180',
  '쿼드인사이트2호투자조합',
  1000000000,
  '2020-12-09',
  '{"fund_id":"AS20200729","registration_date":"2020-12-09","expiry_date":"2027-12-08","formation_total_amount":"10.0","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190180","operator_company_name":"쿼드벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"쿼드벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.666Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 450: 쿼드인사이트1호투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190180',
  '쿼드인사이트1호투자조합',
  1280000000,
  '2020-11-16',
  '{"fund_id":"AS20200633","registration_date":"2020-11-16","expiry_date":"2026-11-15","formation_total_amount":"12.8","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190180","operator_company_name":"쿼드벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"쿼드벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.666Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Minimal Batch 9 completed! 50 fund records processed.
-- Progress: 450/3689 total records

