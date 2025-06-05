-- VCS Fund MINIMAL UPSERT Batch 52/74 (Records 2551-2600)
-- MINIMAL: Only using basic columns that definitely exist
-- Generated from VCS API Scraper fund data
-- Generated at: 2025-06-05T00:40:21.936Z
-- Schema: Minimal fund_table structure (basic columns only)

-- MINIMAL FUND DATA (UPSERT - Safe for Duplicates)
-- Processing 50 fund records
-- Will INSERT new records or UPDATE existing ones

-- Record 2551: 블랙펄프롭테크펀드I
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20220039',
  '블랙펄프롭테크펀드I',
  40500000000,
  '2022-05-27',
  '{"fund_id":"AS20220604","registration_date":"2022-05-27","expiry_date":"2027-05-26","formation_total_amount":"405.0","investment_character_code":"16","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20220039","operator_company_name":"블랙펄벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"블랙펄벤처스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.936Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2552: 블랙펄세컨더리펀드III
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20220039',
  '블랙펄세컨더리펀드III',
  6090000000,
  '2022-05-03',
  '{"fund_id":"AS20220507","registration_date":"2022-05-03","expiry_date":"2027-05-02","formation_total_amount":"60.9","investment_character_code":"16","industry_code":"1","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20220039","operator_company_name":"블랙펄벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"블랙펄벤처스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.936Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2553: 블랙펄세컨더리펀드II
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20220039',
  '블랙펄세컨더리펀드II',
  4700000000,
  '2022-03-14',
  '{"fund_id":"AS20220291","registration_date":"2022-03-14","expiry_date":"2027-03-13","formation_total_amount":"47.0","investment_character_code":"16","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20220039","operator_company_name":"블랙펄벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"블랙펄벤처스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.936Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2554: 블랙펄세컨더리펀드I
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20220039',
  '블랙펄세컨더리펀드I',
  4600000000,
  '2022-02-11',
  '{"fund_id":"AS20220135","registration_date":"2022-02-11","expiry_date":"2027-02-10","formation_total_amount":"46.0","investment_character_code":"16","industry_code":"6","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20220039","operator_company_name":"블랙펄벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"블랙펄벤처스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.936Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2555: 블랙마운틴트랜스링크그리너지프로젝트펀드1
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200513',
  '블랙마운틴트랜스링크그리너지프로젝트펀드1',
  4650000000,
  '2023-03-21',
  '{"fund_id":"AS20230220","registration_date":"2023-03-21","expiry_date":"2031-03-20","formation_total_amount":"46.5","investment_character_code":"25","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20200513","operator_company_name":"트랜스링크인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"트랜스링크인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.936Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2556: 브이플랫폼 에어로스페이스 밸류업펀드 1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20180006',
  '브이플랫폼 에어로스페이스 밸류업펀드 1호',
  4300000000,
  '2021-09-09',
  '{"fund_id":"AS20210839","registration_date":"2021-09-09","expiry_date":"2028-09-08","formation_total_amount":"43.0","investment_character_code":"03","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20180006","operator_company_name":"브이플랫폼인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"브이플랫폼인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.936Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2557: 브이플랫폼 모빌리티 밸류업 펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20180006',
  '브이플랫폼 모빌리티 밸류업 펀드',
  3300000000,
  '2023-07-17',
  '{"fund_id":"AS20230608","registration_date":"2023-07-17","expiry_date":"2028-07-16","formation_total_amount":"33.0","investment_character_code":"10","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20180006","operator_company_name":"브이플랫폼인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"브이플랫폼인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.936Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2558: 브이플랫폼 노블리스 오블리제 벤처펀드 2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20180006',
  '브이플랫폼 노블리스 오블리제 벤처펀드 2호',
  7730000000,
  '2021-04-14',
  '{"fund_id":"AS20210297","registration_date":"2021-04-14","expiry_date":"2028-04-13","formation_total_amount":"77.3","investment_character_code":"03","industry_code":"1","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20180006","operator_company_name":"브이플랫폼인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"브이플랫폼인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.936Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2559: 브이플랫폼 노블리스 오블리제 벤처펀드 1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20180006',
  '브이플랫폼 노블리스 오블리제 벤처펀드 1호',
  6450000000,
  '2020-09-08',
  '{"fund_id":"AS20200486","registration_date":"2020-09-08","expiry_date":"2027-09-07","formation_total_amount":"64.5","investment_character_code":"01","industry_code":"1","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20180006","operator_company_name":"브이플랫폼인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"브이플랫폼인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.936Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2560: 브이이피 반도체성장 2호 G-펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200061',
  '브이이피 반도체성장 2호 G-펀드',
  30000000000,
  '2024-12-24',
  '{"fund_id":"AS20241433","registration_date":"2024-12-24","expiry_date":"2032-12-23","formation_total_amount":"300.0","investment_character_code":"03","industry_code":"9","investment_field_type":"일반","investment_field_detail_type":"부품소재","mother_fund_id":"","operator_company_id":"OP20200061","operator_company_name":"비전에쿼티파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"비전에쿼티파트너스","investment_focus":["부품소재","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.936Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2561: 브이이피 미학지능SR펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200061',
  '브이이피 미학지능SR펀드',
  52020000000,
  '2023-08-17',
  '{"fund_id":"AS20230736","registration_date":"2023-08-17","expiry_date":"2028-08-16","formation_total_amount":"520.2","investment_character_code":"25","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20200061","operator_company_name":"비전에쿼티파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"비전에쿼티파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.937Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2562: 브이이피 미학지능3호펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200061',
  '브이이피 미학지능3호펀드',
  10950000000,
  '2024-08-21',
  '{"fund_id":"AS20240803","registration_date":"2024-08-21","expiry_date":"2029-08-20","formation_total_amount":"109.5","investment_character_code":"25","industry_code":"4","investment_field_type":"일반","investment_field_detail_type":"일반 기타","mother_fund_id":"","operator_company_id":"OP20200061","operator_company_name":"비전에쿼티파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"비전에쿼티파트너스","investment_focus":["일반 기타","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.937Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2563: 브이이안 제1호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20170045',
  '브이이안 제1호 개인투자조합',
  770000000,
  '2021-12-10',
  '{"fund_id":"AS20211248","registration_date":"2021-12-10","expiry_date":"2026-12-09","formation_total_amount":"7.7","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20170045","operator_company_name":"벤처필드","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"벤처필드","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.937Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2564: 브이엔에이엠 에스사이언스 제1호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20170045',
  '브이엔에이엠 에스사이언스 제1호 개인투자조합',
  530000000,
  '2021-06-04',
  '{"fund_id":"AS20210434","registration_date":"2021-06-04","expiry_date":"2026-06-03","formation_total_amount":"5.3","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20170045","operator_company_name":"벤처필드","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"벤처필드","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.937Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2565: 브이에이비켐 투자조합 2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20170045',
  '브이에이비켐 투자조합 2호',
  110000000,
  '2024-01-18',
  '{"fund_id":"AS20240023","registration_date":"2024-01-18","expiry_date":"2029-01-17","formation_total_amount":"1.1","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20170045","operator_company_name":"벤처필드","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"벤처필드","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.937Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2566: 브이에이비켐 제 1호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20170045',
  '브이에이비켐 제 1호 개인투자조합',
  990000000,
  '2021-10-15',
  '{"fund_id":"AS20210984","registration_date":"2021-10-15","expiry_date":"2026-10-14","formation_total_amount":"9.9","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20170045","operator_company_name":"벤처필드","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"벤처필드","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.937Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2567: 브이에스스타개인투자조합7호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20100016',
  '브이에스스타개인투자조합7호',
  590000000,
  '2022-12-07',
  '{"fund_id":"AS20221357","registration_date":"2022-12-07","expiry_date":"2027-12-06","formation_total_amount":"5.9","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20100016","operator_company_name":"벤처스퀘어","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"벤처스퀘어","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.937Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2568: 브이에스-케이오씨피 프로젝트 투자조합 4호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200200',
  '브이에스-케이오씨피 프로젝트 투자조합 4호',
  1620000000,
  '2022-03-28',
  '{"fund_id":"AS20220258","registration_date":"2022-03-28","expiry_date":"2027-03-27","formation_total_amount":"16.2","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200200","operator_company_name":"케이오씨파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"케이오씨파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.937Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2569: 브이에스-케이오씨피 프로젝트 투자조합 3호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200200',
  '브이에스-케이오씨피 프로젝트 투자조합 3호',
  980000000,
  '2021-10-27',
  '{"fund_id":"AS20211017","registration_date":"2021-10-27","expiry_date":"2026-10-26","formation_total_amount":"9.8","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200200","operator_company_name":"케이오씨파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"케이오씨파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.937Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2570: 브이에스-케이오씨피 프로젝트 투자조합 2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200200',
  '브이에스-케이오씨피 프로젝트 투자조합 2호',
  900000000,
  '2021-06-18',
  '{"fund_id":"AS20210460","registration_date":"2021-06-18","expiry_date":"2029-06-17","formation_total_amount":"9.0","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200200","operator_company_name":"케이오씨파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"케이오씨파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.937Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2571: 브이에스 스타 개인투자조합3호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20100016',
  '브이에스 스타 개인투자조합3호',
  530000000,
  '2019-12-13',
  '{"fund_id":"AS20190580","registration_date":"2019-12-13","expiry_date":"2026-12-13","formation_total_amount":"5.3","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20100016","operator_company_name":"벤처스퀘어","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"벤처스퀘어","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.937Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2572: 브이에스 스타 개인투자조합 9호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20100016',
  '브이에스 스타 개인투자조합 9호',
  370000000,
  '2023-12-26',
  '{"fund_id":"AS20231297","registration_date":"2023-12-26","expiry_date":"2028-12-25","formation_total_amount":"3.7","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20100016","operator_company_name":"벤처스퀘어","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"벤처스퀘어","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.937Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2573: 브이에스 스타 개인투자조합 8호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20100016',
  '브이에스 스타 개인투자조합 8호',
  500000000,
  '2023-07-10',
  '{"fund_id":"AS20230565","registration_date":"2023-07-10","expiry_date":"2028-07-09","formation_total_amount":"5.0","investment_character_code":"","industry_code":"3","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20100016","operator_company_name":"벤처스퀘어","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"벤처스퀘어","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.937Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2574: 브이에스 스타 개인투자조합 6호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20100016',
  '브이에스 스타 개인투자조합 6호',
  1070000000,
  '2022-03-25',
  '{"fund_id":"AS20220282","registration_date":"2022-03-25","expiry_date":"2027-03-24","formation_total_amount":"10.7","investment_character_code":"","industry_code":"3","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20100016","operator_company_name":"벤처스퀘어","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"벤처스퀘어","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.937Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2575: 브이에스 스타 개인투자조합 5호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20100016',
  '브이에스 스타 개인투자조합 5호',
  990000000,
  '2021-08-20',
  '{"fund_id":"AS20210736","registration_date":"2021-08-20","expiry_date":"2026-08-19","formation_total_amount":"9.9","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20100016","operator_company_name":"벤처스퀘어","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"벤처스퀘어","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.937Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2576: 브이에스 스타 개인투자조합 4호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20100016',
  '브이에스 스타 개인투자조합 4호',
  920000000,
  '2020-10-16',
  '{"fund_id":"AS20200582","registration_date":"2020-10-16","expiry_date":"2025-10-15","formation_total_amount":"9.2","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20100016","operator_company_name":"벤처스퀘어","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"벤처스퀘어","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.937Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2577: 브이에스 스타 개인투자조합 2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20100016',
  '브이에스 스타 개인투자조합 2호',
  740000000,
  '2019-10-30',
  '{"fund_id":"AS20190472","registration_date":"2019-10-30","expiry_date":"2025-10-29","formation_total_amount":"7.4","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20100016","operator_company_name":"벤처스퀘어","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"벤처스퀘어","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.937Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2578: 브이에스 경기혁신투자조합2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20150037',
  '브이에스 경기혁신투자조합2호',
  6740000000,
  '2024-12-18',
  '{"fund_id":"AS20241380","registration_date":"2024-12-18","expiry_date":"2032-12-17","formation_total_amount":"67.4","investment_character_code":"09","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20150037","operator_company_name":"경기창조경제혁신센터","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"경기창조경제혁신센터","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.937Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2579: 브이에스 경기혁신투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20150037',
  '브이에스 경기혁신투자조합',
  5100000000,
  '2022-10-21',
  '{"fund_id":"AS20221180","registration_date":"2022-10-21","expiry_date":"2029-10-20","formation_total_amount":"51.0","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"MF00000001","operator_company_id":"OP20150037","operator_company_name":"경기창조경제혁신센터","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"경기창조경제혁신센터","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.937Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2580: 브이에스 경기혁신 유니콘브릿지조합1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20150037',
  '브이에스 경기혁신 유니콘브릿지조합1호',
  160000000,
  '2023-08-29',
  '{"fund_id":"AS20230748","registration_date":"2023-08-29","expiry_date":"2028-08-28","formation_total_amount":"1.6","investment_character_code":"","industry_code":"3","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20150037","operator_company_name":"경기창조경제혁신센터","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"경기창조경제혁신센터","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.937Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2581: 브이뉴통 제2호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20170045',
  '브이뉴통 제2호 개인투자조합',
  200000000,
  '2022-11-30',
  '{"fund_id":"AS20221339","registration_date":"2022-11-30","expiry_date":"2027-11-29","formation_total_amount":"2.0","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20170045","operator_company_name":"벤처필드","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"벤처필드","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.937Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2582: 브이뉴통 제1호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20170045',
  '브이뉴통 제1호 개인투자조합',
  360000000,
  '2021-11-22',
  '{"fund_id":"AS20211157","registration_date":"2021-11-22","expiry_date":"2026-11-21","formation_total_amount":"3.6","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20170045","operator_company_name":"벤처필드","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"벤처필드","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.937Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2583: 브이뉴롤메드 제1호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20170045',
  '브이뉴롤메드 제1호 개인투자조합',
  330000000,
  '2021-11-25',
  '{"fund_id":"AS20211176","registration_date":"2021-11-25","expiry_date":"2026-11-24","formation_total_amount":"3.3","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20170045","operator_company_name":"벤처필드","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"벤처필드","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.937Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2584: 브이넥스탭 제1호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20170045',
  '브이넥스탭 제1호 개인투자조합',
  990000000,
  '2021-07-06',
  '{"fund_id":"AS20210514","registration_date":"2021-07-06","expiry_date":"2026-07-05","formation_total_amount":"9.9","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20170045","operator_company_name":"벤처필드","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"벤처필드","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.937Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2585: 브이공만세 제1호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20170045',
  '브이공만세 제1호 개인투자조합',
  300000000,
  '2021-09-29',
  '{"fund_id":"AS20210907","registration_date":"2021-09-29","expiry_date":"2026-09-28","formation_total_amount":"3.0","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20170045","operator_company_name":"벤처필드","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"벤처필드","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.937Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2586: 브릿지폴-수성 벤처투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190277',
  '브릿지폴-수성 벤처투자조합 1호',
  12000000000,
  '2021-05-04',
  '{"fund_id":"AS20210357","registration_date":"2021-05-04","expiry_date":"2026-05-03","formation_total_amount":"120.0","investment_character_code":"02","industry_code":"1","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20190277","operator_company_name":"프로텍벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"프로텍벤처스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.937Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2587: 브릿지폴-수성 벤처투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20230489',
  '브릿지폴-수성 벤처투자조합 1호',
  12000000000,
  '2021-05-04',
  '{"fund_id":"AS20210357","registration_date":"2021-05-04","expiry_date":"2026-05-03","formation_total_amount":"120.0","investment_character_code":"02","industry_code":"1","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20230489","operator_company_name":"제이케이피파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"제이케이피파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.937Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2588: 브릿지폴-나이스 벤처투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190277',
  '브릿지폴-나이스 벤처투자조합 1호',
  5250000000,
  '2023-05-25',
  '{"fund_id":"AS20230421","registration_date":"2023-05-25","expiry_date":"2028-05-24","formation_total_amount":"52.5","investment_character_code":"25","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20190277","operator_company_name":"프로텍벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"프로텍벤처스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.937Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2589: 브릿지폴-SBP 벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190277',
  '브릿지폴-SBP 벤처투자조합',
  4220000000,
  '2021-04-21',
  '{"fund_id":"AS20210316","registration_date":"2021-04-21","expiry_date":"2026-04-20","formation_total_amount":"42.2","investment_character_code":"25","industry_code":"6","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20190277","operator_company_name":"프로텍벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"프로텍벤처스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.937Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2590: 브릿지폴-SBP 벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20230489',
  '브릿지폴-SBP 벤처투자조합',
  4220000000,
  '2021-04-21',
  '{"fund_id":"AS20210316","registration_date":"2021-04-21","expiry_date":"2026-04-20","formation_total_amount":"42.2","investment_character_code":"25","industry_code":"6","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20230489","operator_company_name":"제이케이피파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"제이케이피파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.937Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2591: 브릿지폴 스마트 ICT 투자조합 2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190277',
  '브릿지폴 스마트 ICT 투자조합 2호',
  4000000000,
  '2022-08-23',
  '{"fund_id":"AS20220986","registration_date":"2022-08-23","expiry_date":"2027-08-22","formation_total_amount":"40.0","investment_character_code":"25","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20190277","operator_company_name":"프로텍벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"프로텍벤처스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.937Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2592: 브릿지폴 스마트 ICT 투자조합 2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20230489',
  '브릿지폴 스마트 ICT 투자조합 2호',
  4000000000,
  '2022-08-23',
  '{"fund_id":"AS20220986","registration_date":"2022-08-23","expiry_date":"2027-08-22","formation_total_amount":"40.0","investment_character_code":"25","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20230489","operator_company_name":"제이케이피파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"제이케이피파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.937Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2593: 브릿지폴 스마트 ICT 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190277',
  '브릿지폴 스마트 ICT 투자조합',
  2000000000,
  '2020-06-30',
  '{"fund_id":"AS20200299","registration_date":"2020-06-30","expiry_date":"2025-06-29","formation_total_amount":"20.0","investment_character_code":"01","industry_code":"4","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20190277","operator_company_name":"프로텍벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"프로텍벤처스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.937Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2594: 브릿지폴 스마트 ICT 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20230489',
  '브릿지폴 스마트 ICT 투자조합',
  2000000000,
  '2020-06-30',
  '{"fund_id":"AS20200299","registration_date":"2020-06-30","expiry_date":"2025-06-29","formation_total_amount":"20.0","investment_character_code":"01","industry_code":"4","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20230489","operator_company_name":"제이케이피파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"제이케이피파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.937Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2595: 브릿지스퀘어LOG+제주스타트업투자조합2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200362',
  '브릿지스퀘어LOG+제주스타트업투자조합2호',
  110000000,
  '2022-02-22',
  '{"fund_id":"AS20220165","registration_date":"2022-02-22","expiry_date":"2027-02-20","formation_total_amount":"1.1","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200362","operator_company_name":"브릿지스퀘어","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"브릿지스퀘어","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.937Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2596: 브릿지스퀘어LOG+스타트업투자조합5호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200362',
  '브릿지스퀘어LOG+스타트업투자조합5호',
  160000000,
  '2023-11-22',
  '{"fund_id":"AS20231099","registration_date":"2023-11-22","expiry_date":"2028-11-16","formation_total_amount":"1.6","investment_character_code":"","industry_code":"3","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200362","operator_company_name":"브릿지스퀘어","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"브릿지스퀘어","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.937Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2597: 브릿지스퀘어LOG+스타트업투자조합4호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200362',
  '브릿지스퀘어LOG+스타트업투자조합4호',
  190000000,
  '2022-11-02',
  '{"fund_id":"AS20221229","registration_date":"2022-11-02","expiry_date":"2027-10-26","formation_total_amount":"1.9","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200362","operator_company_name":"브릿지스퀘어","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"브릿지스퀘어","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.937Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2598: 브릿지스퀘어LOG+스타트업투자조합3호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200362',
  '브릿지스퀘어LOG+스타트업투자조합3호',
  100000000,
  '2022-05-20',
  '{"fund_id":"AS20220413","registration_date":"2022-05-20","expiry_date":"2027-05-19","formation_total_amount":"1.0","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200362","operator_company_name":"브릿지스퀘어","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"브릿지스퀘어","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.937Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2599: 브릿지스퀘어 Log+제주스타트업투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200362',
  '브릿지스퀘어 Log+제주스타트업투자조합1호',
  110000000,
  '2021-03-22',
  '{"fund_id":"AS20210218","registration_date":"2021-03-22","expiry_date":"2026-03-31","formation_total_amount":"1.1","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200362","operator_company_name":"브릿지스퀘어","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"브릿지스퀘어","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.937Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2600: 브릿지 개인투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200331',
  '브릿지 개인투자조합 1호',
  280000000,
  '2024-05-20',
  '{"fund_id":"AS20240409","registration_date":"2024-05-20","expiry_date":"2029-05-19","formation_total_amount":"2.8","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200331","operator_company_name":"더이노베이터스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"더이노베이터스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.937Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Minimal Batch 52 completed! 50 fund records processed.
-- Progress: 2600/3689 total records

