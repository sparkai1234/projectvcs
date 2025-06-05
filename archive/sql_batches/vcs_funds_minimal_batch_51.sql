-- VCS Fund MINIMAL UPSERT Batch 51/74 (Records 2501-2550)
-- MINIMAL: Only using basic columns that definitely exist
-- Generated from VCS API Scraper fund data
-- Generated at: 2025-06-05T00:40:21.932Z
-- Schema: Minimal fund_table structure (basic columns only)

-- MINIMAL FUND DATA (UPSERT - Safe for Duplicates)
-- Processing 50 fund records
-- Will INSERT new records or UPDATE existing ones

-- Record 2501: 비스퀘어 아이피텍코리아 진화 개인투자조합 8호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200369',
  '비스퀘어 아이피텍코리아 진화 개인투자조합 8호',
  220000000,
  '2022-03-23',
  '{"fund_id":"AS20220294","registration_date":"2022-03-23","expiry_date":"2027-03-13","formation_total_amount":"2.2","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200369","operator_company_name":"아이피텍코리아","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"아이피텍코리아","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.932Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2502: 비스퀘어 아이피텍코리아 진화 개인투자조합 3호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200369',
  '비스퀘어 아이피텍코리아 진화 개인투자조합 3호',
  540000000,
  '2021-07-27',
  '{"fund_id":"AS20210613","registration_date":"2021-07-27","expiry_date":"2026-07-26","formation_total_amount":"5.4","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200369","operator_company_name":"아이피텍코리아","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"아이피텍코리아","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.932Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2503: 비스퀘어 개인투자조합 2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200024',
  '비스퀘어 개인투자조합 2호',
  110000000,
  '2024-12-31',
  '{"fund_id":"AS20241457","registration_date":"2024-12-31","expiry_date":"2029-12-29","formation_total_amount":"1.1","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200024","operator_company_name":"비스퀘어","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"비스퀘어","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.932Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2504: 비스퀘어 개인투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200024',
  '비스퀘어 개인투자조합 1호',
  110000000,
  '2023-06-08',
  '{"fund_id":"AS20230462","registration_date":"2023-06-08","expiry_date":"2028-06-04","formation_total_amount":"1.1","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200024","operator_company_name":"비스퀘어","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"비스퀘어","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.932Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2505: 비스마트엔젤투자조합 제1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20160032',
  '비스마트엔젤투자조합 제1호',
  100000000,
  '2018-04-13',
  '{"fund_id":"AS20180439","registration_date":"2018-04-13","expiry_date":"2026-04-12","formation_total_amount":"1.0","investment_character_code":"","industry_code":"4","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20160032","operator_company_name":"비스마트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"비스마트","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.932Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2506: 비룡-이노스타트업 개인투자조합 6호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200331',
  '비룡-이노스타트업 개인투자조합 6호',
  200000000,
  '2023-02-28',
  '{"fund_id":"AS20230114","registration_date":"2023-02-28","expiry_date":"2028-02-27","formation_total_amount":"2.0","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200331","operator_company_name":"더이노베이터스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"더이노베이터스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.932Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2507: 비룡-이노스타트업 개인투자조합 2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200331',
  '비룡-이노스타트업 개인투자조합 2호',
  280000000,
  '2021-05-25',
  '{"fund_id":"AS20210382","registration_date":"2021-05-25","expiry_date":"2026-05-24","formation_total_amount":"2.8","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200331","operator_company_name":"더이노베이터스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"더이노베이터스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.932Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2508: 비룡 페이스메이커스 개인투자조합 2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20170041',
  '비룡 페이스메이커스 개인투자조합 2호',
  260000000,
  '2024-12-30',
  '{"fund_id":"AS20241432","registration_date":"2024-12-30","expiry_date":"2029-12-31","formation_total_amount":"2.6","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20170041","operator_company_name":"페이스메이커스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"페이스메이커스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.932Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2509: 비룡 페이스메이커스 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20170041',
  '비룡 페이스메이커스 개인투자조합',
  380000000,
  '2023-12-26',
  '{"fund_id":"AS20231332","registration_date":"2023-12-26","expiry_date":"2028-12-31","formation_total_amount":"3.8","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20170041","operator_company_name":"페이스메이커스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"페이스메이커스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.932Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2510: 비디씨엑셀러레이터 스타트업투자조합5호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20220578',
  '비디씨엑셀러레이터 스타트업투자조합5호',
  110000000,
  '2024-10-17',
  '{"fund_id":"AS20240945","registration_date":"2024-10-17","expiry_date":"2029-10-16","formation_total_amount":"1.1","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20220578","operator_company_name":"비디씨엑셀러레이터","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"비디씨엑셀러레이터","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.932Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2511: 비디씨엑셀러레이터 스타트업투자조합4호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20220578',
  '비디씨엑셀러레이터 스타트업투자조합4호',
  1200000000,
  '2024-06-07',
  '{"fund_id":"AS20240473","registration_date":"2024-06-07","expiry_date":"2029-06-06","formation_total_amount":"12.0","investment_character_code":"","industry_code":"1","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20220578","operator_company_name":"비디씨엑셀러레이터","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"비디씨엑셀러레이터","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.932Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2512: 비디씨엑셀러레이터 스타트업투자조합3호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20220578',
  '비디씨엑셀러레이터 스타트업투자조합3호',
  400000000,
  '2023-11-01',
  '{"fund_id":"AS20230994","registration_date":"2023-11-01","expiry_date":"2028-10-31","formation_total_amount":"4.0","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20220578","operator_company_name":"비디씨엑셀러레이터","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"비디씨엑셀러레이터","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.932Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2513: 비디씨엑셀러레이터 스타트업투자조합2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20220578',
  '비디씨엑셀러레이터 스타트업투자조합2호',
  570000000,
  '2023-07-31',
  '{"fund_id":"AS20230603","registration_date":"2023-07-31","expiry_date":"2028-07-30","formation_total_amount":"5.7","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20220578","operator_company_name":"비디씨엑셀러레이터","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"비디씨엑셀러레이터","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.932Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2514: 비디씨엑셀러레이터 스타트업투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20220578',
  '비디씨엑셀러레이터 스타트업투자조합1호',
  550000000,
  '2023-06-14',
  '{"fund_id":"AS20230460","registration_date":"2023-06-14","expiry_date":"2028-06-13","formation_total_amount":"5.5","investment_character_code":"","industry_code":"1","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20220578","operator_company_name":"비디씨엑셀러레이터","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"비디씨엑셀러레이터","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.932Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2515: 비디씨-엠엠에스 투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200468',
  '비디씨-엠엠에스 투자조합 1호',
  580000000,
  '2023-09-12',
  '{"fund_id":"AS20230766","registration_date":"2023-09-12","expiry_date":"2028-08-28","formation_total_amount":"5.8","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200468","operator_company_name":"엠엠에스벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"엠엠에스벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.932Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2516: 블리스바인-두근두근 투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210212',
  '블리스바인-두근두근 투자조합1호',
  600000000,
  '2022-04-18',
  '{"fund_id":"AS20220380","registration_date":"2022-04-18","expiry_date":"2027-04-17","formation_total_amount":"6.0","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20210212","operator_company_name":"블리스바인벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"블리스바인벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.932Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2517: 블리스바인-고려대첨기비 1호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210212',
  '블리스바인-고려대첨기비 1호 투자조합',
  110000000,
  '2023-09-25',
  '{"fund_id":"AS20230835","registration_date":"2023-09-25","expiry_date":"2028-09-24","formation_total_amount":"1.1","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20210212","operator_company_name":"블리스바인벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"블리스바인벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.932Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2518: 블리스바인-경기혁신 딥테크 투자조합3호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210212',
  '블리스바인-경기혁신 딥테크 투자조합3호',
  950000000,
  '2024-08-21',
  '{"fund_id":"AS20240767","registration_date":"2024-08-21","expiry_date":"2029-08-20","formation_total_amount":"9.5","investment_character_code":"","industry_code":"4","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20210212","operator_company_name":"블리스바인벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"블리스바인벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.932Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2519: 블리스바인-경기혁신 딥테크 투자조합2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210212',
  '블리스바인-경기혁신 딥테크 투자조합2호',
  1660000000,
  '2024-04-19',
  '{"fund_id":"AS20240300","registration_date":"2024-04-19","expiry_date":"2029-04-18","formation_total_amount":"16.6","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20210212","operator_company_name":"블리스바인벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"블리스바인벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.932Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2520: 블리스바인-경기혁신 딥테크 투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210212',
  '블리스바인-경기혁신 딥테크 투자조합1호',
  2100000000,
  '2023-10-04',
  '{"fund_id":"AS20230877","registration_date":"2023-10-04","expiry_date":"2028-10-03","formation_total_amount":"21.0","investment_character_code":"","industry_code":"3","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20210212","operator_company_name":"블리스바인벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"블리스바인벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.932Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2521: 블리스바인-Welkeeps 투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210212',
  '블리스바인-Welkeeps 투자조합1호',
  690000000,
  '2021-09-15',
  '{"fund_id":"AS20210868","registration_date":"2021-09-15","expiry_date":"2026-09-14","formation_total_amount":"6.9","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20210212","operator_company_name":"블리스바인벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"블리스바인벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.932Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2522: 블리스바인-Vineyard 투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210212',
  '블리스바인-Vineyard 투자조합1호',
  1590000000,
  '2021-12-15',
  '{"fund_id":"AS20211263","registration_date":"2021-12-15","expiry_date":"2026-12-14","formation_total_amount":"15.9","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20210212","operator_company_name":"블리스바인벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"블리스바인벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.932Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2523: 블리스바인 프론티어 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210212',
  '블리스바인 프론티어 투자조합',
  3090000000,
  '2023-03-07',
  '{"fund_id":"AS20230158","registration_date":"2023-03-07","expiry_date":"2028-03-06","formation_total_amount":"30.9","investment_character_code":"02","industry_code":"6","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20210212","operator_company_name":"블리스바인벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"블리스바인벤처스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.932Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2524: 블리스바인 프로미스(Promise) 투자조합3호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210212',
  '블리스바인 프로미스(Promise) 투자조합3호',
  610000000,
  '2024-07-08',
  '{"fund_id":"AS20240576","registration_date":"2024-07-08","expiry_date":"2029-07-07","formation_total_amount":"6.1","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20210212","operator_company_name":"블리스바인벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"블리스바인벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.932Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2525: 블리스바인 프로미스(Promise) 투자조합2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210212',
  '블리스바인 프로미스(Promise) 투자조합2호',
  100000000,
  '2024-07-08',
  '{"fund_id":"AS20240575","registration_date":"2024-07-08","expiry_date":"2029-07-07","formation_total_amount":"1.0","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20210212","operator_company_name":"블리스바인벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"블리스바인벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.932Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2526: 블리스바인 프로미스(Promise) 투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210212',
  '블리스바인 프로미스(Promise) 투자조합1호',
  1000000000,
  '2022-12-19',
  '{"fund_id":"AS20221413","registration_date":"2022-12-19","expiry_date":"2027-12-18","formation_total_amount":"10.0","investment_character_code":"","industry_code":"4","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20210212","operator_company_name":"블리스바인벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"블리스바인벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.932Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2527: 블리스바인 글로벌스타1호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210212',
  '블리스바인 글로벌스타1호 투자조합',
  3000000000,
  '2022-05-27',
  '{"fund_id":"AS20220606","registration_date":"2022-05-27","expiry_date":"2027-05-26","formation_total_amount":"30.0","investment_character_code":"20","industry_code":"4","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20210212","operator_company_name":"블리스바인벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"블리스바인벤처스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.932Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2528: 블리스바인 Vintage1호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210212',
  '블리스바인 Vintage1호 투자조합',
  4550000000,
  '2021-09-16',
  '{"fund_id":"AS20210873","registration_date":"2021-09-16","expiry_date":"2026-09-15","formation_total_amount":"45.5","investment_character_code":"02","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20210212","operator_company_name":"블리스바인벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"블리스바인벤처스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.932Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2529: 블리스바인 ESG 투자조합2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210212',
  '블리스바인 ESG 투자조합2호',
  140000000,
  '2024-08-05',
  '{"fund_id":"AS20240700","registration_date":"2024-08-05","expiry_date":"2029-08-04","formation_total_amount":"1.4","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20210212","operator_company_name":"블리스바인벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"블리스바인벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.932Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2530: 블리스-하임 딥테크 투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210212',
  '블리스-하임 딥테크 투자조합1호',
  690000000,
  '2025-01-03',
  '{"fund_id":"AS20241453","registration_date":"2025-01-03","expiry_date":"2030-01-02","formation_total_amount":"6.9","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20210212","operator_company_name":"블리스바인벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"블리스바인벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.932Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2531: 블리스-에코 딥테크 투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210212',
  '블리스-에코 딥테크 투자조합1호',
  3190000000,
  '2024-08-13',
  '{"fund_id":"AS20240776","registration_date":"2024-08-13","expiry_date":"2029-08-12","formation_total_amount":"31.9","investment_character_code":"03","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20210212","operator_company_name":"블리스바인벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"블리스바인벤처스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.932Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2532: 블루포인트2022 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20140008',
  '블루포인트2022 개인투자조합',
  17780000000,
  '2022-06-22',
  '{"fund_id":"AS20220660","registration_date":"2022-06-22","expiry_date":"2029-06-21","formation_total_amount":"177.8","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20140008","operator_company_name":"블루포인트파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"블루포인트파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.932Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2533: 블루포인트2021 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20140008',
  '블루포인트2021 개인투자조합',
  11360000000,
  '2021-09-30',
  '{"fund_id":"AS20210895","registration_date":"2021-09-30","expiry_date":"2028-09-23","formation_total_amount":"113.6","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20140008","operator_company_name":"블루포인트파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"블루포인트파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.932Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2534: 블루포인트 티핑포인트 벤처투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20140008',
  '블루포인트 티핑포인트 벤처투자조합1호',
  15000000000,
  '2024-07-15',
  '{"fund_id":"AS20240637","registration_date":"2024-07-15","expiry_date":"2031-07-14","formation_total_amount":"150.0","investment_character_code":"20","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20140008","operator_company_name":"블루포인트파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"블루포인트파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.932Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2535: 블루포인트 스타트업 개인투자조합2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20140008',
  '블루포인트 스타트업 개인투자조합2호',
  4000000000,
  '2018-02-28',
  '{"fund_id":"AS20180134","registration_date":"2018-02-28","expiry_date":"2026-02-27","formation_total_amount":"40.0","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"MF00000008","operator_company_id":"OP20140008","operator_company_name":"블루포인트파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"블루포인트파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.932Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2536: 블루포인트 디스커버리 벤처투자조합2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20140008',
  '블루포인트 디스커버리 벤처투자조합2호',
  9600000000,
  '2021-09-29',
  '{"fund_id":"AS20210934","registration_date":"2021-09-29","expiry_date":"2029-09-28","formation_total_amount":"96.0","investment_character_code":"02","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20140008","operator_company_name":"블루포인트파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"블루포인트파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.932Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2537: 블루포인트 디비 컨티뉴이티 벤처투자조합2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20140008',
  '블루포인트 디비 컨티뉴이티 벤처투자조합2호',
  5000000000,
  '2021-11-16',
  '{"fund_id":"AS20211146","registration_date":"2021-11-16","expiry_date":"2026-11-15","formation_total_amount":"50.0","investment_character_code":"02","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20140008","operator_company_name":"블루포인트파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"블루포인트파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.932Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2538: 블루포인트 디비 컨티뉴이티 벤처투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20140008',
  '블루포인트 디비 컨티뉴이티 벤처투자조합1호',
  14000000000,
  '2021-07-26',
  '{"fund_id":"AS20210634","registration_date":"2021-07-26","expiry_date":"2026-07-25","formation_total_amount":"140.0","investment_character_code":"02","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20140008","operator_company_name":"블루포인트파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"블루포인트파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.932Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2539: 블루오션벤처스 개인투자조합6호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210183',
  '블루오션벤처스 개인투자조합6호',
  400000000,
  '2023-09-21',
  '{"fund_id":"AS20230799","registration_date":"2023-09-21","expiry_date":"2028-09-20","formation_total_amount":"4.0","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20210183","operator_company_name":"블루오션벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"블루오션벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.932Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2540: 블루오션벤처스 개인투자조합5호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210183',
  '블루오션벤처스 개인투자조합5호',
  110000000,
  '2023-03-20',
  '{"fund_id":"AS20230171","registration_date":"2023-03-20","expiry_date":"2028-03-19","formation_total_amount":"1.1","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20210183","operator_company_name":"블루오션벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"블루오션벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.932Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2541: 블루오션벤처스 개인투자조합4호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210183',
  '블루오션벤처스 개인투자조합4호',
  110000000,
  '2023-03-20',
  '{"fund_id":"AS20230170","registration_date":"2023-03-20","expiry_date":"2028-03-19","formation_total_amount":"1.1","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20210183","operator_company_name":"블루오션벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"블루오션벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.932Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2542: 블루오션벤처스 개인투자조합3호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210183',
  '블루오션벤처스 개인투자조합3호',
  330000000,
  '2023-03-20',
  '{"fund_id":"AS20230169","registration_date":"2023-03-20","expiry_date":"2028-03-19","formation_total_amount":"3.3","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20210183","operator_company_name":"블루오션벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"블루오션벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.932Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2543: 블루오션벤처스 개인투자조합2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210183',
  '블루오션벤처스 개인투자조합2호',
  330000000,
  '2023-01-30',
  '{"fund_id":"AS20230065","registration_date":"2023-01-30","expiry_date":"2028-01-29","formation_total_amount":"3.3","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20210183","operator_company_name":"블루오션벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"블루오션벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.932Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2544: 블루오션벤처스 개인투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210183',
  '블루오션벤처스 개인투자조합1호',
  330000000,
  '2022-12-19',
  '{"fund_id":"AS20221449","registration_date":"2022-12-19","expiry_date":"2027-12-18","formation_total_amount":"3.3","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20210183","operator_company_name":"블루오션벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"블루오션벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.932Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2545: 블루버스 드림메이커 벤처투자조합 제1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20220691',
  '블루버스 드림메이커 벤처투자조합 제1호',
  3010000000,
  '2023-07-26',
  '{"fund_id":"AS20230643","registration_date":"2023-07-26","expiry_date":"2028-07-25","formation_total_amount":"30.1","investment_character_code":"03","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20220691","operator_company_name":"블루버스인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"블루버스인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.932Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2546: 블록크래프터스 개인투자조합2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200102',
  '블록크래프터스 개인투자조합2호',
  610000000,
  '2021-06-01',
  '{"fund_id":"AS20210408","registration_date":"2021-06-01","expiry_date":"2027-05-03","formation_total_amount":"6.1","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200102","operator_company_name":"블록크래프터스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"블록크래프터스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.932Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2547: 블록크래프터스 개인투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200102',
  '블록크래프터스 개인투자조합1호',
  350000000,
  '2020-07-23',
  '{"fund_id":"AS20200351","registration_date":"2020-07-23","expiry_date":"2026-07-31","formation_total_amount":"3.5","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200102","operator_company_name":"블록크래프터스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"블록크래프터스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.932Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2548: 블록크래프터스 개인투자조합 프로젝트 1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200102',
  '블록크래프터스 개인투자조합 프로젝트 1호',
  100000000,
  '2022-08-31',
  '{"fund_id":"AS20220952","registration_date":"2022-08-31","expiry_date":"2027-12-05","formation_total_amount":"1.0","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200102","operator_company_name":"블록크래프터스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"블록크래프터스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.933Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2549: 블랙펄하이테크펀드I
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20220039',
  '블랙펄하이테크펀드I',
  2650000000,
  '2022-04-29',
  '{"fund_id":"AS20220494","registration_date":"2022-04-29","expiry_date":"2027-04-28","formation_total_amount":"26.5","investment_character_code":"25","industry_code":"4","investment_field_type":"일반","investment_field_detail_type":"부품소재","mother_fund_id":"","operator_company_id":"OP20220039","operator_company_name":"블랙펄벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"블랙펄벤처스","investment_focus":["부품소재","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.933Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2550: 블랙펄프롭테크펀드II
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20220039',
  '블랙펄프롭테크펀드II',
  2100000000,
  '2022-05-27',
  '{"fund_id":"AS20220605","registration_date":"2022-05-27","expiry_date":"2027-05-26","formation_total_amount":"21.0","investment_character_code":"16","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20220039","operator_company_name":"블랙펄벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"블랙펄벤처스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.933Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Minimal Batch 51 completed! 50 fund records processed.
-- Progress: 2550/3689 total records

