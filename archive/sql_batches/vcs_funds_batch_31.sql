-- VCS Fund UPSERT Batch 31/74 (Records 1501-1550)
-- Uses ON CONFLICT DO UPDATE to insert new or update existing funds
-- Generated from VCS API Scraper fund data
-- Generated at: 2025-06-05T00:28:06.745Z
-- Schema: Matches fund_table structure

-- FUND DATA (UPSERT - Safe for Duplicates)
-- Processing 50 fund records
-- Will INSERT new records or UPDATE existing ones

-- Record 1501: 엑셀비전펀드1호
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20200224',
  '엑셀비전펀드1호',
  NULL,
  'VCS Registered Fund',
  100000000,
  100000000,
  '2021-10-07',
  'Active',
  '로간',
  NULL,
  '{"fund_id":"AS20210948","registration_date":"2021-10-07","expiry_date":"2026-10-06","formation_total_amount":"1.0","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200224","operator_company_name":"로간","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.745Z"}'::jsonb,
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

-- Record 1502: 엑센트리 개인투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20190229',
  '엑센트리 개인투자조합 1호',
  NULL,
  'VCS Registered Fund',
  200000000,
  200000000,
  '2023-04-19',
  'Active',
  '엑센트리',
  NULL,
  '{"fund_id":"AS20230298","registration_date":"2023-04-19","expiry_date":"2028-04-17","formation_total_amount":"2.0","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190229","operator_company_name":"엑센트리","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.745Z"}'::jsonb,
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

-- Record 1503: 에프앤핀테크벤처투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20220268',
  '에프앤핀테크벤처투자조합1호',
  NULL,
  'VCS Registered Fund',
  1010000000,
  1010000000,
  '2024-06-04',
  'Active',
  '스토리앤데이터',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20240487","registration_date":"2024-06-04","expiry_date":"2030-06-03","formation_total_amount":"10.1","investment_character_code":"28","industry_code":"9","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20220268","operator_company_name":"스토리앤데이터","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.745Z"}'::jsonb,
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

-- Record 1504: 에프브이 인베스트먼트 투자조합 01호
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20200008',
  '에프브이 인베스트먼트 투자조합 01호',
  NULL,
  'VCS Registered Fund',
  3400000000,
  3400000000,
  '2022-09-06',
  'Active',
  '에프브이인베스트먼트',
  '{"부품소재","일반"}',
  '{"fund_id":"AS20221025","registration_date":"2022-09-06","expiry_date":"2027-09-05","formation_total_amount":"34.0","investment_character_code":"03","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"부품소재","mother_fund_id":"","operator_company_id":"OP20200008","operator_company_name":"에프브이인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.745Z"}'::jsonb,
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

-- Record 1505: 에티컬 엑스트라마일 1호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20110015',
  '에티컬 엑스트라마일 1호 개인투자조합',
  NULL,
  'VCS Registered Fund',
  100000000,
  100000000,
  '2020-05-29',
  'Active',
  '엠와이소셜컴퍼니',
  NULL,
  '{"fund_id":"AS20200227","registration_date":"2020-05-29","expiry_date":"2027-05-28","formation_total_amount":"1.0","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20110015","operator_company_name":"엠와이소셜컴퍼니","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.745Z"}'::jsonb,
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

-- Record 1506: 에트리홀딩스기술사업화개인투자조합2호
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20100014',
  '에트리홀딩스기술사업화개인투자조합2호',
  NULL,
  'VCS Registered Fund',
  9000000000,
  9000000000,
  '2019-09-17',
  'Active',
  '에트리홀딩스',
  NULL,
  '{"fund_id":"AS20190406","registration_date":"2019-09-17","expiry_date":"2026-09-16","formation_total_amount":"90.0","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"MF00000001","operator_company_id":"OP20100014","operator_company_name":"에트리홀딩스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.745Z"}'::jsonb,
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

-- Record 1507: 에트리홀딩스-신한유니콘투자조합 제1호
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20100014',
  '에트리홀딩스-신한유니콘투자조합 제1호',
  NULL,
  'VCS Registered Fund',
  10000000000,
  10000000000,
  '2021-09-06',
  'Active',
  '에트리홀딩스',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20210812","registration_date":"2021-09-06","expiry_date":"2027-09-05","formation_total_amount":"100.0","investment_character_code":"20","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20100014","operator_company_name":"에트리홀딩스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.745Z"}'::jsonb,
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

-- Record 1508: 에코프로 전북-강원 지역혁신 벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20200340',
  '에코프로 전북-강원 지역혁신 벤처투자조합',
  NULL,
  'VCS Registered Fund',
  17000000000,
  17000000000,
  '2024-07-10',
  'Active',
  '에코프로파트너스',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20240634","registration_date":"2024-07-10","expiry_date":"2032-07-09","formation_total_amount":"170.0","investment_character_code":"10","industry_code":"4","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000019","operator_company_id":"OP20200340","operator_company_name":"에코프로파트너스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.745Z"}'::jsonb,
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

-- Record 1509: 에코프로 이차전지 벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20200340',
  '에코프로 이차전지 벤처투자조합',
  NULL,
  'VCS Registered Fund',
  30000000000,
  30000000000,
  '2024-07-10',
  'Active',
  '에코프로파트너스',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20240631","registration_date":"2024-07-10","expiry_date":"2032-07-09","formation_total_amount":"300.0","investment_character_code":"11","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20200340","operator_company_name":"에코프로파트너스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.745Z"}'::jsonb,
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

-- Record 1510: 에코마인즈 AI 펀드 2호
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20180065',
  '에코마인즈 AI 펀드 2호',
  NULL,
  'VCS Registered Fund',
  400000000,
  400000000,
  '2021-01-20',
  'Active',
  '엔피프틴파트너스',
  NULL,
  '{"fund_id":"AS20210037","registration_date":"2021-01-20","expiry_date":"2027-03-31","formation_total_amount":"4.0","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20180065","operator_company_name":"엔피프틴파트너스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.745Z"}'::jsonb,
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

-- Record 1511: 에코마인즈 AI 펀드 1호
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20180065',
  '에코마인즈 AI 펀드 1호',
  NULL,
  'VCS Registered Fund',
  200000000,
  200000000,
  '2020-02-14',
  'Active',
  '엔피프틴파트너스',
  NULL,
  '{"fund_id":"AS20200066","registration_date":"2020-02-14","expiry_date":"2026-02-13","formation_total_amount":"2.0","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20180065","operator_company_name":"엔피프틴파트너스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.745Z"}'::jsonb,
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

-- Record 1512: 에코ESG제4호 조합
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20200340',
  '에코ESG제4호 조합',
  NULL,
  'VCS Registered Fund',
  2260000000,
  2260000000,
  '2023-09-19',
  'Active',
  '에코프로파트너스',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20230844","registration_date":"2023-09-19","expiry_date":"2028-09-18","formation_total_amount":"22.6","investment_character_code":"03","industry_code":"4","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20200340","operator_company_name":"에코프로파트너스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.745Z"}'::jsonb,
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

-- Record 1513: 에코 오픈 이노베이션 조합 1호
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20200340',
  '에코 오픈 이노베이션 조합 1호',
  NULL,
  'VCS Registered Fund',
  34700000000,
  34700000000,
  '2024-04-09',
  'Active',
  '에코프로파트너스',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20240282","registration_date":"2024-04-09","expiry_date":"2032-04-08","formation_total_amount":"347.0","investment_character_code":"03","industry_code":"4","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20200340","operator_company_name":"에코프로파트너스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.745Z"}'::jsonb,
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

-- Record 1514: 에코 딥테크 벤처투자조합 제1호
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20200340',
  '에코 딥테크 벤처투자조합 제1호',
  NULL,
  'VCS Registered Fund',
  6600000000,
  6600000000,
  '2023-12-22',
  'Active',
  '에코프로파트너스',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20231337","registration_date":"2023-12-22","expiry_date":"2028-12-21","formation_total_amount":"66.0","investment_character_code":"03","industry_code":"4","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20200340","operator_company_name":"에코프로파트너스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.745Z"}'::jsonb,
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

-- Record 1515: 에코 ESG 제3호 조합
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20200340',
  '에코 ESG 제3호 조합',
  NULL,
  'VCS Registered Fund',
  2020000000,
  2020000000,
  '2023-08-18',
  'Active',
  '에코프로파트너스',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20230737","registration_date":"2023-08-18","expiry_date":"2028-08-17","formation_total_amount":"20.2","investment_character_code":"03","industry_code":"4","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20200340","operator_company_name":"에코프로파트너스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.745Z"}'::jsonb,
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

-- Record 1516: 에코 ESG 제2호 조합
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20200340',
  '에코 ESG 제2호 조합',
  NULL,
  'VCS Registered Fund',
  3700000000,
  3700000000,
  '2023-05-18',
  'Active',
  '에코프로파트너스',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20230406","registration_date":"2023-05-18","expiry_date":"2028-05-17","formation_total_amount":"37.0","investment_character_code":"02","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20200340","operator_company_name":"에코프로파트너스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.745Z"}'::jsonb,
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

-- Record 1517: 에이티피핀테크조합제1호
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20210025',
  '에이티피핀테크조합제1호',
  NULL,
  'VCS Registered Fund',
  7070000000,
  7070000000,
  '2022-04-18',
  'Active',
  '에이티피벤처스',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20220429","registration_date":"2022-04-18","expiry_date":"2027-04-17","formation_total_amount":"70.7","investment_character_code":"16","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20210025","operator_company_name":"에이티피벤처스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.745Z"}'::jsonb,
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

-- Record 1518: 에이티피실버케어투자조합제1호
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20210025',
  '에이티피실버케어투자조합제1호',
  NULL,
  'VCS Registered Fund',
  270000000,
  270000000,
  '2023-08-11',
  'Active',
  '에이티피벤처스',
  NULL,
  '{"fund_id":"AS20230666","registration_date":"2023-08-11","expiry_date":"2028-08-10","formation_total_amount":"2.7","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20210025","operator_company_name":"에이티피벤처스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.745Z"}'::jsonb,
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

-- Record 1519: 에이티피신소재투자조합제1호
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20210025',
  '에이티피신소재투자조합제1호',
  NULL,
  'VCS Registered Fund',
  890000000,
  890000000,
  '2023-05-08',
  'Active',
  '에이티피벤처스',
  NULL,
  '{"fund_id":"AS20230350","registration_date":"2023-05-08","expiry_date":"2028-05-07","formation_total_amount":"8.9","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20210025","operator_company_name":"에이티피벤처스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.745Z"}'::jsonb,
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

-- Record 1520: 에이티피소셜벤처조합제2호
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20210025',
  '에이티피소셜벤처조합제2호',
  NULL,
  'VCS Registered Fund',
  2020000000,
  2020000000,
  '2024-03-11',
  'Active',
  '에이티피벤처스',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20240183","registration_date":"2024-03-11","expiry_date":"2029-03-10","formation_total_amount":"20.2","investment_character_code":"23","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20210025","operator_company_name":"에이티피벤처스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.745Z"}'::jsonb,
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

-- Record 1521: 에이티피소셜벤처조합제1호
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20210025',
  '에이티피소셜벤처조합제1호',
  NULL,
  'VCS Registered Fund',
  2220000000,
  2220000000,
  '2024-03-11',
  'Active',
  '에이티피벤처스',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20240182","registration_date":"2024-03-11","expiry_date":"2029-03-10","formation_total_amount":"22.2","investment_character_code":"23","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20210025","operator_company_name":"에이티피벤처스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.745Z"}'::jsonb,
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

-- Record 1522: 에이티피빅데이터벤처조합제1호
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20210025',
  '에이티피빅데이터벤처조합제1호',
  NULL,
  'VCS Registered Fund',
  2300000000,
  2300000000,
  '2024-12-18',
  'Active',
  '에이티피벤처스',
  '{"일반 기타","일반"}',
  '{"fund_id":"AS20241381","registration_date":"2024-12-18","expiry_date":"2029-12-17","formation_total_amount":"23.0","investment_character_code":"25","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"일반 기타","mother_fund_id":"","operator_company_id":"OP20210025","operator_company_name":"에이티피벤처스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.745Z"}'::jsonb,
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

-- Record 1523: 에이티넘성장투자조합2023
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP19880002',
  '에이티넘성장투자조합2023',
  NULL,
  'VCS Registered Fund',
  860000000000,
  860000000000,
  '2023-09-25',
  'Active',
  '에이티넘인베스트먼트',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20230865","registration_date":"2023-09-25","expiry_date":"2031-09-24","formation_total_amount":"8600.0","investment_character_code":"01","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP19880002","operator_company_name":"에이티넘인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.745Z"}'::jsonb,
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

-- Record 1524: 에이티넘성장투자조합2020
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP19880002',
  '에이티넘성장투자조합2020',
  NULL,
  'VCS Registered Fund',
  550000000000,
  550000000000,
  '2020-12-08',
  'Active',
  '에이티넘인베스트먼트',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20200751","registration_date":"2020-12-08","expiry_date":"2028-12-07","formation_total_amount":"5500.0","investment_character_code":"10","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP19880002","operator_company_name":"에이티넘인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.745Z"}'::jsonb,
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

-- Record 1525: 에이티넘성장투자조합2018
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP19880002',
  '에이티넘성장투자조합2018',
  NULL,
  'VCS Registered Fund',
  350000000000,
  350000000000,
  '2017-12-28',
  'Active',
  '에이티넘인베스트먼트',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20180051","registration_date":"2017-12-28","expiry_date":"2025-12-27","formation_total_amount":"3500.0","investment_character_code":"02","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP19880002","operator_company_name":"에이티넘인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.745Z"}'::jsonb,
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

-- Record 1526: 에이티넘고성장기업투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP19880002',
  '에이티넘고성장기업투자조합',
  NULL,
  'VCS Registered Fund',
  203000000000,
  203000000000,
  '2014-03-12',
  'Active',
  '에이티넘인베스트먼트',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20140019","registration_date":"2014-03-12","expiry_date":"2025-09-11","formation_total_amount":"2030.0","investment_character_code":"01","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP19880002","operator_company_name":"에이티넘인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.745Z"}'::jsonb,
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

-- Record 1527: 에이투지-아이피 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20180002',
  '에이투지-아이피 투자조합',
  NULL,
  'VCS Registered Fund',
  16500000000,
  16500000000,
  '2021-10-18',
  'Active',
  '코나벤처파트너스',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20210991","registration_date":"2021-10-18","expiry_date":"2028-10-17","formation_total_amount":"165.0","investment_character_code":"25","industry_code":"6","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20180002","operator_company_name":"코나벤처파트너스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.745Z"}'::jsonb,
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

-- Record 1528: 에이타스 벤처펀드 02
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20230278',
  '에이타스 벤처펀드 02',
  NULL,
  'VCS Registered Fund',
  2150000000,
  2150000000,
  '2025-02-25',
  'Active',
  '에이타스파트너스',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20250143","registration_date":"2025-02-25","expiry_date":"2030-02-24","formation_total_amount":"21.5","investment_character_code":"28","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20230278","operator_company_name":"에이타스파트너스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.745Z"}'::jsonb,
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

-- Record 1529: 에이타스 벤처펀드 01
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20230278',
  '에이타스 벤처펀드 01',
  NULL,
  'VCS Registered Fund',
  2000000000,
  2000000000,
  '2024-02-16',
  'Active',
  '에이타스파트너스',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20240104","registration_date":"2024-02-16","expiry_date":"2029-02-15","formation_total_amount":"20.0","investment_character_code":"04","industry_code":"1","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20230278","operator_company_name":"에이타스파트너스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.745Z"}'::jsonb,
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

-- Record 1530: 에이치지이니셔티브 포용적기술 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20140018',
  '에이치지이니셔티브 포용적기술 투자조합',
  NULL,
  'VCS Registered Fund',
  7000000000,
  7000000000,
  '2024-09-24',
  'Active',
  '에이치지이니셔티브',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20240924","registration_date":"2024-09-24","expiry_date":"2032-09-23","formation_total_amount":"70.0","investment_character_code":"01","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20140018","operator_company_name":"에이치지이니셔티브","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.745Z"}'::jsonb,
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

-- Record 1531: 에이치지이니셔티브 글로벌 헬스케어 펀드 1호
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20140018',
  '에이치지이니셔티브 글로벌 헬스케어 펀드 1호',
  NULL,
  'VCS Registered Fund',
  2610000000,
  2610000000,
  '2020-12-16',
  'Active',
  '에이치지이니셔티브',
  '{"바이오","일반"}',
  '{"fund_id":"AS20200789","registration_date":"2020-12-16","expiry_date":"2025-12-15","formation_total_amount":"26.1","investment_character_code":"04","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"바이오","mother_fund_id":"","operator_company_id":"OP20140018","operator_company_name":"에이치지이니셔티브","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.745Z"}'::jsonb,
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

-- Record 1532: 에이치엘비아이 알밤 제1호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20220396',
  '에이치엘비아이 알밤 제1호 투자조합',
  NULL,
  'VCS Registered Fund',
  10000000000,
  10000000000,
  '2022-07-14',
  'Active',
  '에이치엘비인베스트먼트',
  '{"바이오","일반"}',
  '{"fund_id":"AS20220792","registration_date":"2022-07-14","expiry_date":"2029-07-13","formation_total_amount":"100.0","investment_character_code":"04","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"바이오","mother_fund_id":"","operator_company_id":"OP20220396","operator_company_name":"에이치엘비인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.745Z"}'::jsonb,
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

-- Record 1533: 에이치엔젤 투자조합 글로벌 1호
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20200034',
  '에이치엔젤 투자조합 글로벌 1호',
  NULL,
  'VCS Registered Fund',
  250000000,
  250000000,
  '2021-10-29',
  'Active',
  '헥사곤벤처스',
  NULL,
  '{"fund_id":"AS20211045","registration_date":"2021-10-29","expiry_date":"2026-12-31","formation_total_amount":"2.5","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200034","operator_company_name":"헥사곤벤처스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.745Z"}'::jsonb,
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

-- Record 1534: 에이치엔젤 투자조합 8호
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20200034',
  '에이치엔젤 투자조합 8호',
  NULL,
  'VCS Registered Fund',
  100000000,
  100000000,
  '2021-12-17',
  'Active',
  '헥사곤벤처스',
  NULL,
  '{"fund_id":"AS20211316","registration_date":"2021-12-17","expiry_date":"2026-12-31","formation_total_amount":"1.0","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200034","operator_company_name":"헥사곤벤처스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.745Z"}'::jsonb,
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

-- Record 1535: 에이치엔젤 투자조합 7호
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20200034',
  '에이치엔젤 투자조합 7호',
  NULL,
  'VCS Registered Fund',
  540000000,
  540000000,
  '2021-09-23',
  'Active',
  '헥사곤벤처스',
  NULL,
  '{"fund_id":"AS20210880","registration_date":"2021-09-23","expiry_date":"2026-12-31","formation_total_amount":"5.4","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200034","operator_company_name":"헥사곤벤처스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.745Z"}'::jsonb,
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

-- Record 1536: 에이치업 개인투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20220559',
  '에이치업 개인투자조합 1호',
  NULL,
  'VCS Registered Fund',
  100000000,
  100000000,
  '2024-06-20',
  'Active',
  '(주)에이치앤벤처스',
  NULL,
  '{"fund_id":"AS20240532","registration_date":"2024-06-20","expiry_date":"2029-06-19","formation_total_amount":"1.0","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20220559","operator_company_name":"(주)에이치앤벤처스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.745Z"}'::jsonb,
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

-- Record 1537: 에이치앤비 혁신성장 1호 펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20000044',
  '에이치앤비 혁신성장 1호 펀드',
  NULL,
  'VCS Registered Fund',
  5100000000,
  5100000000,
  '2021-06-21',
  'Active',
  '씨제이인베스트먼트',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20210498","registration_date":"2021-06-21","expiry_date":"2029-06-20","formation_total_amount":"51.0","investment_character_code":"10","industry_code":"9","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20000044","operator_company_name":"씨제이인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.745Z"}'::jsonb,
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

-- Record 1538: 에이치비청년미래투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP19990005',
  '에이치비청년미래투자조합',
  NULL,
  'VCS Registered Fund',
  74600000000,
  74600000000,
  '2024-07-30',
  'Active',
  '에이치비인베스트먼트',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20240705","registration_date":"2024-07-30","expiry_date":"2032-07-29","formation_total_amount":"746.0","investment_character_code":"21","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP19990005","operator_company_name":"에이치비인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.745Z"}'::jsonb,
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

-- Record 1539: 에이치비성장지원엠앤에이투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP19990005',
  '에이치비성장지원엠앤에이투자조합',
  NULL,
  'VCS Registered Fund',
  61500000000,
  61500000000,
  '2015-10-28',
  'Active',
  '에이치비인베스트먼트',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20150111","registration_date":"2015-10-28","expiry_date":"2025-10-27","formation_total_amount":"615.0","investment_character_code":"17","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP19990005","operator_company_name":"에이치비인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.745Z"}'::jsonb,
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

-- Record 1540: 에이치비딥테크상생투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP19990005',
  '에이치비딥테크상생투자조합',
  NULL,
  'VCS Registered Fund',
  36000000000,
  36000000000,
  '2023-11-16',
  'Active',
  '에이치비인베스트먼트',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20231093","registration_date":"2023-11-16","expiry_date":"2031-11-15","formation_total_amount":"360.0","investment_character_code":"17","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP19990005","operator_company_name":"에이치비인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.745Z"}'::jsonb,
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

-- Record 1541: 에이치비 핀테크 데이터 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP19990005',
  '에이치비 핀테크 데이터 투자조합',
  NULL,
  'VCS Registered Fund',
  7000000000,
  7000000000,
  '2022-05-19',
  'Active',
  '에이치비인베스트먼트',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20220564","registration_date":"2022-05-19","expiry_date":"2027-05-18","formation_total_amount":"70.0","investment_character_code":"02","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP19990005","operator_company_name":"에이치비인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.745Z"}'::jsonb,
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

-- Record 1542: 에이치비 스케일업 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP19990005',
  '에이치비 스케일업 투자조합',
  NULL,
  'VCS Registered Fund',
  40000000000,
  40000000000,
  '2024-10-17',
  'Active',
  '에이치비인베스트먼트',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20241002","registration_date":"2024-10-17","expiry_date":"2034-10-16","formation_total_amount":"400.0","investment_character_code":"08","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP19990005","operator_company_name":"에이치비인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.745Z"}'::jsonb,
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

-- Record 1543: 에이치비 디지털 혁신 성장 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP19990005',
  '에이치비 디지털 혁신 성장 투자조합',
  NULL,
  'VCS Registered Fund',
  21000000000,
  21000000000,
  '2022-01-24',
  'Active',
  '에이치비인베스트먼트',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20220090","registration_date":"2022-01-24","expiry_date":"2027-01-23","formation_total_amount":"210.0","investment_character_code":"02","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP19990005","operator_company_name":"에이치비인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.745Z"}'::jsonb,
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

-- Record 1544: 에이치비 디지털 혁신 성장 3호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP19990005',
  '에이치비 디지털 혁신 성장 3호 투자조합',
  NULL,
  'VCS Registered Fund',
  31000000000,
  31000000000,
  '2024-03-26',
  'Active',
  '에이치비인베스트먼트',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20240223","registration_date":"2024-03-26","expiry_date":"2031-03-25","formation_total_amount":"310.0","investment_character_code":"28","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP19990005","operator_company_name":"에이치비인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.745Z"}'::jsonb,
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

-- Record 1545: 에이치비 디지털 혁신 성장 2호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP19990005',
  '에이치비 디지털 혁신 성장 2호 투자조합',
  NULL,
  'VCS Registered Fund',
  37000000000,
  37000000000,
  '2023-03-06',
  'Active',
  '에이치비인베스트먼트',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20230145","registration_date":"2023-03-06","expiry_date":"2028-03-05","formation_total_amount":"370.0","investment_character_code":"02","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP19990005","operator_company_name":"에이치비인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.745Z"}'::jsonb,
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

-- Record 1546: 에이치비 글로벌 핀테크 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP19990005',
  '에이치비 글로벌 핀테크 투자조합',
  NULL,
  'VCS Registered Fund',
  10000000000,
  10000000000,
  '2022-04-04',
  'Active',
  '에이치비인베스트먼트',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20220375","registration_date":"2022-04-04","expiry_date":"2027-04-03","formation_total_amount":"100.0","investment_character_code":"16","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP19990005","operator_company_name":"에이치비인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.745Z"}'::jsonb,
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

-- Record 1547: 에이치 피아이 5호 벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20200326',
  '에이치 피아이 5호 벤처투자조합',
  NULL,
  'VCS Registered Fund',
  2020000000,
  2020000000,
  '2024-09-10',
  'Active',
  '에스비파트너스',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20240893","registration_date":"2024-09-10","expiry_date":"2034-09-09","formation_total_amount":"20.2","investment_character_code":"06","industry_code":"9","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20200326","operator_company_name":"에스비파트너스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.745Z"}'::jsonb,
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

-- Record 1548: 에이제이-코스넷세미콘원벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20160017',
  '에이제이-코스넷세미콘원벤처투자조합',
  NULL,
  'VCS Registered Fund',
  13500000000,
  13500000000,
  '2021-04-01',
  'Active',
  'NBH캐피탈',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20210254","registration_date":"2021-04-01","expiry_date":"2026-03-31","formation_total_amount":"135.0","investment_character_code":"25","industry_code":"1","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20160017","operator_company_name":"NBH캐피탈","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.745Z"}'::jsonb,
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

-- Record 1549: 에이온 클라우드 컨버전스 벤처투자조합 2호
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20210709',
  '에이온 클라우드 컨버전스 벤처투자조합 2호',
  NULL,
  'VCS Registered Fund',
  2830000000,
  2830000000,
  '2024-07-15',
  'Active',
  '에이온인베스트먼트',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20240639","registration_date":"2024-07-15","expiry_date":"2029-07-14","formation_total_amount":"28.3","investment_character_code":"25","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20210709","operator_company_name":"에이온인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.745Z"}'::jsonb,
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

-- Record 1550: 에이온 클라우드 컨버전스 벤처투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20210709',
  '에이온 클라우드 컨버전스 벤처투자조합 1호',
  NULL,
  'VCS Registered Fund',
  6460000000,
  6460000000,
  '2024-05-16',
  'Active',
  '에이온인베스트먼트',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20240427","registration_date":"2024-05-16","expiry_date":"2029-05-15","formation_total_amount":"64.6","investment_character_code":"25","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20210709","operator_company_name":"에이온인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.745Z"}'::jsonb,
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

-- Batch 31 completed! 50 fund records processed.
-- Progress: 1550/3689 total records

