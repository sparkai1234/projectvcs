-- VCS Fund MINIMAL UPSERT Batch 17/74 (Records 801-850)
-- MINIMAL: Only using basic columns that definitely exist
-- Generated from VCS API Scraper fund data
-- Generated at: 2025-06-05T00:40:21.776Z
-- Schema: Minimal fund_table structure (basic columns only)

-- MINIMAL FUND DATA (UPSERT - Safe for Duplicates)
-- Processing 50 fund records
-- Will INSERT new records or UPDATE existing ones

-- Record 801: 지노바 3호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210102',
  '지노바 3호 투자조합',
  6500000000,
  '2022-07-14',
  '{"fund_id":"AS20220791","registration_date":"2022-07-14","expiry_date":"2027-07-13","formation_total_amount":"65.0","investment_character_code":"25","industry_code":"4","investment_field_type":"일반","investment_field_detail_type":"바이오","mother_fund_id":"","operator_company_id":"OP20210102","operator_company_name":"지노바인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"지노바인베스트먼트","investment_focus":["바이오","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.777Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 802: 지노바 2호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210102',
  '지노바 2호 투자조합',
  2250000000,
  '2022-01-14',
  '{"fund_id":"AS20220062","registration_date":"2022-01-14","expiry_date":"2027-01-13","formation_total_amount":"22.5","investment_character_code":"16","industry_code":"4","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20210102","operator_company_name":"지노바인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"지노바인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.777Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 803: 지노바 1호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210102',
  '지노바 1호 투자조합',
  10000000000,
  '2021-07-16',
  '{"fund_id":"AS20210607","registration_date":"2021-07-16","expiry_date":"2026-07-15","formation_total_amount":"100.0","investment_character_code":"20","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20210102","operator_company_name":"지노바인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"지노바인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.777Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 804: 중소벤처기업상생펀드Ⅱ
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20000044',
  '중소벤처기업상생펀드Ⅱ',
  4080000000,
  '2017-01-06',
  '{"fund_id":"AS20170009","registration_date":"2017-01-06","expiry_date":"2026-01-05","formation_total_amount":"40.8","investment_character_code":"20","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20000044","operator_company_name":"씨제이인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"씨제이인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.777Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 805: 중소벤처기업상생 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20000044',
  '중소벤처기업상생 투자조합',
  10000000000,
  '2016-09-13',
  '{"fund_id":"AS20160005","registration_date":"2016-09-13","expiry_date":"2025-09-12","formation_total_amount":"100.0","investment_character_code":"01","industry_code":"9","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20000044","operator_company_name":"씨제이인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"씨제이인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.777Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 806: 줌인파트너스 인공지능 개인투자조합 제2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20220293',
  '줌인파트너스 인공지능 개인투자조합 제2호',
  660000000,
  '2023-11-20',
  '{"fund_id":"AS20231104","registration_date":"2023-11-20","expiry_date":"2028-11-19","formation_total_amount":"6.6","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20220293","operator_company_name":"줌인파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"줌인파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.777Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 807: 줌인파트너스 바이오 개인투자조합 제3호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20220293',
  '줌인파트너스 바이오 개인투자조합 제3호',
  240000000,
  '2024-12-06',
  '{"fund_id":"AS20241245","registration_date":"2024-12-06","expiry_date":"2029-12-05","formation_total_amount":"2.4","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20220293","operator_company_name":"줌인파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"줌인파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.777Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 808: 존스앤로켓 유한회사 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210350',
  '존스앤로켓 유한회사 투자조합',
  220000000,
  '2022-01-18',
  '{"fund_id":"AS20220059","registration_date":"2022-01-18","expiry_date":"2027-01-17","formation_total_amount":"2.2","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20210350","operator_company_name":"존스앤로켓","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"존스앤로켓","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.777Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 809: 존스앤로켓 베트남 혁신펀드 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210350',
  '존스앤로켓 베트남 혁신펀드 투자조합',
  1000000000,
  '2023-02-28',
  '{"fund_id":"AS20230122","registration_date":"2023-02-28","expiry_date":"2028-02-27","formation_total_amount":"10.0","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20210350","operator_company_name":"존스앤로켓","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"존스앤로켓","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.777Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 810: 존스앤로켓 바이오 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210350',
  '존스앤로켓 바이오 투자조합',
  280000000,
  '2022-07-15',
  '{"fund_id":"AS20220775","registration_date":"2022-07-15","expiry_date":"2027-07-14","formation_total_amount":"2.8","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20210350","operator_company_name":"존스앤로켓","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"존스앤로켓","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.777Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 811: 존스앤로켓 뉴에라 펀드 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210350',
  '존스앤로켓 뉴에라 펀드 투자조합',
  670000000,
  '2024-10-28',
  '{"fund_id":"AS20241025","registration_date":"2024-10-28","expiry_date":"2029-10-27","formation_total_amount":"6.7","investment_character_code":"","industry_code":"7","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20210350","operator_company_name":"존스앤로켓","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"존스앤로켓","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.777Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 812: 존스앤로켓 ESG펀드 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210350',
  '존스앤로켓 ESG펀드 투자조합',
  360000000,
  '2023-03-24',
  '{"fund_id":"AS20230223","registration_date":"2023-03-24","expiry_date":"2028-03-23","formation_total_amount":"3.6","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20210350","operator_company_name":"존스앤로켓","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"존스앤로켓","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.777Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 813: 존스앤로켓 AI 기술 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210350',
  '존스앤로켓 AI 기술 투자조합',
  1740000000,
  '2022-06-28',
  '{"fund_id":"AS20220718","registration_date":"2022-06-28","expiry_date":"2027-06-27","formation_total_amount":"17.4","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20210350","operator_company_name":"존스앤로켓","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"존스앤로켓","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.777Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 814: 조이시티-씨엔티테크 제1호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20180020',
  '조이시티-씨엔티테크 제1호 투자조합',
  2000000000,
  '2023-02-21',
  '{"fund_id":"AS20230111","registration_date":"2023-02-21","expiry_date":"2030-02-20","formation_total_amount":"20.0","investment_character_code":"20","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20180020","operator_company_name":"씨엔티테크","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"씨엔티테크","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.777Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 815: 조슈아파트너스투자조합11호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200131',
  '조슈아파트너스투자조합11호',
  100000000,
  '2024-10-28',
  '{"fund_id":"AS20240984","registration_date":"2024-10-28","expiry_date":"2029-10-16","formation_total_amount":"1.0","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200131","operator_company_name":"조슈아파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"조슈아파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.777Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 816: 조슈아파트너스투자조합10호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200131',
  '조슈아파트너스투자조합10호',
  820000000,
  '2023-10-25',
  '{"fund_id":"AS20230905","registration_date":"2023-10-25","expiry_date":"2028-10-09","formation_total_amount":"8.2","investment_character_code":"","industry_code":"6","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200131","operator_company_name":"조슈아파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"조슈아파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.777Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 817: 조슈아파트너스 투자조합9호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200131',
  '조슈아파트너스 투자조합9호',
  240000000,
  '2023-03-29',
  '{"fund_id":"AS20230216","registration_date":"2023-03-29","expiry_date":"2028-03-20","formation_total_amount":"2.4","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200131","operator_company_name":"조슈아파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"조슈아파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.777Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 818: 조슈아파트너스 투자조합8호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200131',
  '조슈아파트너스 투자조합8호',
  390000000,
  '2024-02-08',
  '{"fund_id":"AS20230194","registration_date":"2024-02-08","expiry_date":"2029-02-07","formation_total_amount":"3.9","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200131","operator_company_name":"조슈아파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"조슈아파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.777Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 819: 젤코바벤처스2호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20220442',
  '젤코바벤처스2호 투자조합',
  780000000,
  '2024-02-23',
  '{"fund_id":"AS20240103","registration_date":"2024-02-23","expiry_date":"2030-02-22","formation_total_amount":"7.8","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20220442","operator_company_name":"젤코바벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"젤코바벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.777Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 820: 젤코바벤처스1호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20220442',
  '젤코바벤처스1호 투자조합',
  1590000000,
  '2023-02-06',
  '{"fund_id":"AS20230082","registration_date":"2023-02-06","expiry_date":"2029-02-05","formation_total_amount":"15.9","investment_character_code":"","industry_code":"4","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20220442","operator_company_name":"젤코바벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"젤코바벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.777Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 821: 젠티움4호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190351',
  '젠티움4호 개인투자조합',
  740000000,
  '2021-01-05',
  '{"fund_id":"AS20200852","registration_date":"2021-01-05","expiry_date":"2026-01-04","formation_total_amount":"7.4","investment_character_code":"","industry_code":"3","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190351","operator_company_name":"젠티움파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"젠티움파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.777Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 822: 젠티움3호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190351',
  '젠티움3호 개인투자조합',
  230000000,
  '2019-12-10',
  '{"fund_id":"AS20190575","registration_date":"2019-12-10","expiry_date":"2026-12-09","formation_total_amount":"2.3","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190351","operator_company_name":"젠티움파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"젠티움파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.777Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 823: 젠티움 9호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190351',
  '젠티움 9호 개인투자조합',
  1570000000,
  '2023-04-04',
  '{"fund_id":"AS20230234","registration_date":"2023-04-04","expiry_date":"2028-04-03","formation_total_amount":"15.7","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190351","operator_company_name":"젠티움파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"젠티움파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.777Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 824: 젠티움 8호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190351',
  '젠티움 8호 개인투자조합',
  120000000,
  '2021-11-17',
  '{"fund_id":"AS20211125","registration_date":"2021-11-17","expiry_date":"2028-11-16","formation_total_amount":"1.2","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190351","operator_company_name":"젠티움파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"젠티움파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.777Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 825: 젠티움 10호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190351',
  '젠티움 10호 개인투자조합',
  260000000,
  '2024-12-30',
  '{"fund_id":"AS20241451","registration_date":"2024-12-30","expiry_date":"2029-12-29","formation_total_amount":"2.6","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190351","operator_company_name":"젠티움파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"젠티움파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.777Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 826: 젠엑시스(주) 제4호개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190221',
  '젠엑시스(주) 제4호개인투자조합',
  230000000,
  '2021-03-17',
  '{"fund_id":"AS20210180","registration_date":"2021-03-17","expiry_date":"2026-03-16","formation_total_amount":"2.3","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190221","operator_company_name":"젠엑시스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"젠엑시스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.777Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 827: 젠엑시스(주) 제3호개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190221',
  '젠엑시스(주) 제3호개인투자조합',
  580000000,
  '2020-12-22',
  '{"fund_id":"AS20200800","registration_date":"2020-12-22","expiry_date":"2025-12-21","formation_total_amount":"5.8","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190221","operator_company_name":"젠엑시스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"젠엑시스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.777Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 828: 젠엑시스(주) 제2호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190221',
  '젠엑시스(주) 제2호 개인투자조합',
  600000000,
  '2020-09-17',
  '{"fund_id":"AS20200497","registration_date":"2020-09-17","expiry_date":"2025-09-16","formation_total_amount":"6.0","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190221","operator_company_name":"젠엑시스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"젠엑시스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.777Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 829: 젠엑시스-스카이워커 제1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190221',
  '젠엑시스-스카이워커 제1호',
  420000000,
  '2023-08-01',
  '{"fund_id":"AS20230638","registration_date":"2023-08-01","expiry_date":"2028-07-31","formation_total_amount":"4.2","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190221","operator_company_name":"젠엑시스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"젠엑시스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.777Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 830: 젠엑시스 혁신 개인투자조합 3호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190221',
  '젠엑시스 혁신 개인투자조합 3호',
  660000000,
  '2022-10-14',
  '{"fund_id":"AS20221162","registration_date":"2022-10-14","expiry_date":"2027-10-13","formation_total_amount":"6.6","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190221","operator_company_name":"젠엑시스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"젠엑시스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.777Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 831: 젠엑시스 혁신 개인투자조합 2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190221',
  '젠엑시스 혁신 개인투자조합 2호',
  1100000000,
  '2021-11-17',
  '{"fund_id":"AS20211140","registration_date":"2021-11-17","expiry_date":"2026-11-16","formation_total_amount":"11.0","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190221","operator_company_name":"젠엑시스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"젠엑시스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.777Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 832: 젠엑시스 혁신 개인투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190221',
  '젠엑시스 혁신 개인투자조합 1호',
  1080000000,
  '2021-07-26',
  '{"fund_id":"AS20210612","registration_date":"2021-07-26","expiry_date":"2026-07-25","formation_total_amount":"10.8","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190221","operator_company_name":"젠엑시스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"젠엑시스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.777Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 833: 젠엑시스 제6호개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190221',
  '젠엑시스 제6호개인투자조합',
  110000000,
  '2021-07-09',
  '{"fund_id":"AS20210532","registration_date":"2021-07-09","expiry_date":"2026-07-08","formation_total_amount":"1.1","investment_character_code":"","industry_code":"4","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190221","operator_company_name":"젠엑시스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"젠엑시스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.777Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 834: 젠엑시스 제5호개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190221',
  '젠엑시스 제5호개인투자조합',
  1320000000,
  '2022-05-10',
  '{"fund_id":"AS20220499","registration_date":"2022-05-10","expiry_date":"2027-05-09","formation_total_amount":"13.2","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190221","operator_company_name":"젠엑시스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"젠엑시스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.777Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 835: 젠엑시스 벨류파인더 4호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190221',
  '젠엑시스 벨류파인더 4호 개인투자조합',
  250000000,
  '2023-12-26',
  '{"fund_id":"AS20231334","registration_date":"2023-12-26","expiry_date":"2028-12-25","formation_total_amount":"2.5","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190221","operator_company_name":"젠엑시스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"젠엑시스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.777Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 836: 젠엑시스 벨류파인더 3호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190221',
  '젠엑시스 벨류파인더 3호 개인투자조합',
  230000000,
  '2023-11-20',
  '{"fund_id":"AS20231096","registration_date":"2023-11-20","expiry_date":"2028-11-19","formation_total_amount":"2.3","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190221","operator_company_name":"젠엑시스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"젠엑시스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.777Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 837: 젠엑시스 벨류파인더 2호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190221',
  '젠엑시스 벨류파인더 2호 개인투자조합',
  310000000,
  '2022-12-07',
  '{"fund_id":"AS20221347","registration_date":"2022-12-07","expiry_date":"2027-12-06","formation_total_amount":"3.1","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190221","operator_company_name":"젠엑시스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"젠엑시스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.777Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 838: 젠엑시스 바이오&헬스케어 개인투자조합 2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190221',
  '젠엑시스 바이오&헬스케어 개인투자조합 2호',
  130000000,
  '2024-12-19',
  '{"fund_id":"AS20241328","registration_date":"2024-12-19","expiry_date":"2029-12-18","formation_total_amount":"1.3","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190221","operator_company_name":"젠엑시스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"젠엑시스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.777Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 839: 젠엑시스 바이오&헬스케어 개인투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190221',
  '젠엑시스 바이오&헬스케어 개인투자조합 1호',
  230000000,
  '2024-11-27',
  '{"fund_id":"AS20241199","registration_date":"2024-11-27","expiry_date":"2029-11-26","formation_total_amount":"2.3","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190221","operator_company_name":"젠엑시스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"젠엑시스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.777Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 840: 젠엑시스 딥테크 개인투자조합 2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190221',
  '젠엑시스 딥테크 개인투자조합 2호',
  400000000,
  '2024-11-18',
  '{"fund_id":"AS20241132","registration_date":"2024-11-18","expiry_date":"2029-11-17","formation_total_amount":"4.0","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190221","operator_company_name":"젠엑시스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"젠엑시스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.777Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 841: 젠엑시스 딥테크 개인투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190221',
  '젠엑시스 딥테크 개인투자조합 1호',
  560000000,
  '2024-08-30',
  '{"fund_id":"AS20240806","registration_date":"2024-08-30","expiry_date":"2029-08-29","formation_total_amount":"5.6","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190221","operator_company_name":"젠엑시스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"젠엑시스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.777Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 842: 젠엑시스 디지털헬스케어 제2호개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190221',
  '젠엑시스 디지털헬스케어 제2호개인투자조합',
  110000000,
  '2023-03-29',
  '{"fund_id":"AS20230215","registration_date":"2023-03-29","expiry_date":"2028-03-28","formation_total_amount":"1.1","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190221","operator_company_name":"젠엑시스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"젠엑시스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.777Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 843: 젠엑시스 디지털헬스케어 제1호개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190221',
  '젠엑시스 디지털헬스케어 제1호개인투자조합',
  660000000,
  '2021-11-17',
  '{"fund_id":"AS20211136","registration_date":"2021-11-17","expiry_date":"2026-11-16","formation_total_amount":"6.6","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190221","operator_company_name":"젠엑시스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"젠엑시스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.777Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 844: 젠엑시스 NEXT IPO 개인투자조합 5호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190221',
  '젠엑시스 NEXT IPO 개인투자조합 5호',
  340000000,
  '2025-03-31',
  '{"fund_id":"AS20250211","registration_date":"2025-03-31","expiry_date":"2030-03-30","formation_total_amount":"3.4","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190221","operator_company_name":"젠엑시스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"젠엑시스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.777Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 845: 젠엑시스 NEXT IPO 개인투자조합 3호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190221',
  '젠엑시스 NEXT IPO 개인투자조합 3호',
  440000000,
  '2024-09-23',
  '{"fund_id":"AS20240884","registration_date":"2024-09-23","expiry_date":"2029-09-22","formation_total_amount":"4.4","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190221","operator_company_name":"젠엑시스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"젠엑시스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.777Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 846: 젠엑시스 NEXT IPO 개인투자조합 2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190221',
  '젠엑시스 NEXT IPO 개인투자조합 2호',
  560000000,
  '2023-08-01',
  '{"fund_id":"AS20230634","registration_date":"2023-08-01","expiry_date":"2028-07-31","formation_total_amount":"5.6","investment_character_code":"","industry_code":"1","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190221","operator_company_name":"젠엑시스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"젠엑시스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.777Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 847: 젠엑시스 NEXT IPO 개인투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190221',
  '젠엑시스 NEXT IPO 개인투자조합 1호',
  530000000,
  '2023-08-01',
  '{"fund_id":"AS20230633","registration_date":"2023-08-01","expiry_date":"2028-07-31","formation_total_amount":"5.3","investment_character_code":"","industry_code":"1","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190221","operator_company_name":"젠엑시스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"젠엑시스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.777Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 848: 젠엑시스 ESG IMPACT 개인투자조합 제3호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190221',
  '젠엑시스 ESG IMPACT 개인투자조합 제3호',
  340000000,
  '2024-10-31',
  '{"fund_id":"AS20241020","registration_date":"2024-10-31","expiry_date":"2029-10-29","formation_total_amount":"3.4","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190221","operator_company_name":"젠엑시스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"젠엑시스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.777Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 849: 젠엑시스 ESG IMPACT 개인투자조합 제2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190221',
  '젠엑시스 ESG IMPACT 개인투자조합 제2호',
  100000000,
  '2024-05-17',
  '{"fund_id":"AS20240405","registration_date":"2024-05-17","expiry_date":"2029-05-18","formation_total_amount":"1.0","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190221","operator_company_name":"젠엑시스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"젠엑시스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.777Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 850: 젠엑시스 ESG IMPACT 개인투자조합 제1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190221',
  '젠엑시스 ESG IMPACT 개인투자조합 제1호',
  460000000,
  '2023-11-20',
  '{"fund_id":"AS20231090","registration_date":"2023-11-20","expiry_date":"2028-11-19","formation_total_amount":"4.6","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190221","operator_company_name":"젠엑시스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"젠엑시스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.777Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Minimal Batch 17 completed! 50 fund records processed.
-- Progress: 850/3689 total records

