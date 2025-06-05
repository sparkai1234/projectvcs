-- VCS Fund UPSERT Batch 41/74 (Records 2001-2050)
-- Uses ON CONFLICT DO UPDATE to insert new or update existing funds
-- Generated from VCS API Scraper fund data
-- Generated at: 2025-06-05T00:28:06.777Z
-- Schema: Matches fund_table structure

-- FUND DATA (UPSERT - Safe for Duplicates)
-- Processing 50 fund records
-- Will INSERT new records or UPDATE existing ones

-- Record 2001: 신한-네오 Market-Frontier 투자조합 2호
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20000041',
  '신한-네오 Market-Frontier 투자조합 2호',
  NULL,
  'VCS Registered Fund',
  100000000000,
  100000000000,
  '2021-01-04',
  'Active',
  '신한벤처투자',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20210012","registration_date":"2021-01-04","expiry_date":"2029-01-03","formation_total_amount":"1000.0","investment_character_code":"08","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20000041","operator_company_name":"신한벤처투자","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.777Z"}'::jsonb,
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

-- Record 2002: 신한-HGI 사회적기업 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20140018',
  '신한-HGI 사회적기업 투자조합',
  NULL,
  'VCS Registered Fund',
  5000000000,
  5000000000,
  '2022-07-25',
  'Active',
  '에이치지이니셔티브',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20220854","registration_date":"2022-07-25","expiry_date":"2030-07-24","formation_total_amount":"50.0","investment_character_code":"10","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20140018","operator_company_name":"에이치지이니셔티브","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.777Z"}'::jsonb,
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

-- Record 2003: 신한-CCVC 스타트업 세컨더리 펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20100009',
  '신한-CCVC 스타트업 세컨더리 펀드',
  NULL,
  'VCS Registered Fund',
  15000000000,
  15000000000,
  '2021-07-01',
  'Active',
  '쿨리지코너인베스트먼트',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20210545","registration_date":"2021-07-01","expiry_date":"2026-06-30","formation_total_amount":"150.0","investment_character_code":"16","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20100009","operator_company_name":"쿨리지코너인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.777Z"}'::jsonb,
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

-- Record 2004: 신한 하이퍼 퓨처스 투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20000041',
  '신한 하이퍼 퓨처스 투자조합 1호',
  NULL,
  'VCS Registered Fund',
  8900000000,
  8900000000,
  '2023-09-07',
  'Active',
  '신한벤처투자',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20230796","registration_date":"2023-09-07","expiry_date":"2031-09-06","formation_total_amount":"89.0","investment_character_code":"20","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20000041","operator_company_name":"신한벤처투자","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.777Z"}'::jsonb,
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

-- Record 2005: 신한 하이퍼 커넥트 투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20000041',
  '신한 하이퍼 커넥트 투자조합 1호',
  NULL,
  'VCS Registered Fund',
  270000000000,
  270000000000,
  '2023-07-06',
  'Active',
  '신한벤처투자',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20230567","registration_date":"2023-07-06","expiry_date":"2031-07-05","formation_total_amount":"2700.0","investment_character_code":"02","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20000041","operator_company_name":"신한벤처투자","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.777Z"}'::jsonb,
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

-- Record 2006: 신한 에이치비 웰니스 1호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP19990005',
  '신한 에이치비 웰니스 1호 투자조합',
  NULL,
  'VCS Registered Fund',
  10300000000,
  10300000000,
  '2023-07-17',
  'Active',
  '에이치비인베스트먼트',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20230607","registration_date":"2023-07-17","expiry_date":"2028-07-16","formation_total_amount":"103.0","investment_character_code":"16","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP19990005","operator_company_name":"에이치비인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.777Z"}'::jsonb,
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

-- Record 2007: 신한 에스지씨 ESG 투자조합 제1호
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20220034',
  '신한 에스지씨 ESG 투자조합 제1호',
  NULL,
  'VCS Registered Fund',
  10000000000,
  10000000000,
  '2022-12-16',
  'Active',
  '에스지씨파트너스',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20221494","registration_date":"2022-12-16","expiry_date":"2029-12-15","formation_total_amount":"100.0","investment_character_code":"02","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20220034","operator_company_name":"에스지씨파트너스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.777Z"}'::jsonb,
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

-- Record 2008: 신한 스퀘어브릿지 ESG 투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20000041',
  '신한 스퀘어브릿지 ESG 투자조합 1호',
  NULL,
  'VCS Registered Fund',
  33000000000,
  33000000000,
  '2022-09-19',
  'Active',
  '신한벤처투자',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20221068","registration_date":"2022-09-19","expiry_date":"2030-09-18","formation_total_amount":"330.0","investment_character_code":"10","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20000041","operator_company_name":"신한벤처투자","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.777Z"}'::jsonb,
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

-- Record 2009: 신한 글로벌 플래그십 투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20000041',
  '신한 글로벌 플래그십 투자조합 1호',
  NULL,
  'VCS Registered Fund',
  200000000000,
  200000000000,
  '2022-07-15',
  'Active',
  '신한벤처투자',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20220819","registration_date":"2022-07-15","expiry_date":"2032-07-14","formation_total_amount":"2000.0","investment_character_code":"15","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20000041","operator_company_name":"신한벤처투자","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.777Z"}'::jsonb,
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

-- Record 2010: 신한 Market-Frontier 투자조합 3호
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20000041',
  '신한 Market-Frontier 투자조합 3호',
  NULL,
  'VCS Registered Fund',
  100000000000,
  100000000000,
  '2024-05-01',
  'Active',
  '신한벤처투자',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20240381","registration_date":"2024-05-01","expiry_date":"2031-04-30","formation_total_amount":"1000.0","investment_character_code":"16","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20000041","operator_company_name":"신한벤처투자","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.777Z"}'::jsonb,
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

-- Record 2011: 신한 M&A-ESG 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20000041',
  '신한 M&A-ESG 투자조합',
  NULL,
  'VCS Registered Fund',
  60000000000,
  60000000000,
  '2023-05-12',
  'Active',
  '신한벤처투자',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20230382","registration_date":"2023-05-12","expiry_date":"2031-05-11","formation_total_amount":"600.0","investment_character_code":"17","industry_code":"9","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20000041","operator_company_name":"신한벤처투자","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.777Z"}'::jsonb,
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

-- Record 2012: 신영-BSK 디지털혁신 뉴딜 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20210024',
  '신영-BSK 디지털혁신 뉴딜 투자조합',
  NULL,
  'VCS Registered Fund',
  100000000000,
  100000000000,
  '2022-02-11',
  'Active',
  '신영증권',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20220139","registration_date":"2022-02-11","expiry_date":"2030-02-10","formation_total_amount":"1000.0","investment_character_code":"02","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20210024","operator_company_name":"신영증권","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.777Z"}'::jsonb,
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

-- Record 2013: 신세계-케이디비씨아뜰리에투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20200285',
  '신세계-케이디비씨아뜰리에투자조합',
  NULL,
  'VCS Registered Fund',
  56000000000,
  56000000000,
  '2023-12-19',
  'Active',
  '시그나이트',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20231312","registration_date":"2023-12-19","expiry_date":"2031-12-18","formation_total_amount":"560.0","investment_character_code":"10","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20200285","operator_company_name":"시그나이트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.777Z"}'::jsonb,
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

-- Record 2014: 시리즈벤처스 시리즈 스트롱 7호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20170046',
  '시리즈벤처스 시리즈 스트롱 7호 투자조합',
  NULL,
  'VCS Registered Fund',
  200000000,
  200000000,
  '2024-06-20',
  'Active',
  '시리즈벤처스',
  NULL,
  '{"fund_id":"AS20240541","registration_date":"2024-06-20","expiry_date":"2032-06-16","formation_total_amount":"2.0","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20170046","operator_company_name":"시리즈벤처스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.777Z"}'::jsonb,
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

-- Record 2015: 시리즈벤처스 시리즈 스트롱 6호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20170046',
  '시리즈벤처스 시리즈 스트롱 6호 투자조합',
  NULL,
  'VCS Registered Fund',
  120000000,
  120000000,
  '2024-02-15',
  'Active',
  '시리즈벤처스',
  NULL,
  '{"fund_id":"AS20240086","registration_date":"2024-02-15","expiry_date":"2032-02-06","formation_total_amount":"1.2","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20170046","operator_company_name":"시리즈벤처스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.777Z"}'::jsonb,
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

-- Record 2016: 시리즈벤처스 시리즈 스트롱 5호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20170046',
  '시리즈벤처스 시리즈 스트롱 5호 투자조합',
  NULL,
  'VCS Registered Fund',
  140000000,
  140000000,
  '2023-12-22',
  'Active',
  '시리즈벤처스',
  NULL,
  '{"fund_id":"AS20231243","registration_date":"2023-12-22","expiry_date":"2031-12-10","formation_total_amount":"1.4","investment_character_code":"","industry_code":"3","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20170046","operator_company_name":"시리즈벤처스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.777Z"}'::jsonb,
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

-- Record 2017: 시리즈벤처스 시리즈 스트롱 4호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20170046',
  '시리즈벤처스 시리즈 스트롱 4호 투자조합',
  NULL,
  'VCS Registered Fund',
  160000000,
  160000000,
  '2023-04-19',
  'Active',
  '시리즈벤처스',
  NULL,
  '{"fund_id":"AS20230297","registration_date":"2023-04-19","expiry_date":"2031-04-17","formation_total_amount":"1.6","investment_character_code":"","industry_code":"4","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20170046","operator_company_name":"시리즈벤처스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.777Z"}'::jsonb,
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

-- Record 2018: 시리즈벤처스 시리즈 스트롱 3호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20170046',
  '시리즈벤처스 시리즈 스트롱 3호 투자조합',
  NULL,
  'VCS Registered Fund',
  110000000,
  110000000,
  '2022-07-05',
  'Active',
  '시리즈벤처스',
  NULL,
  '{"fund_id":"AS20220731","registration_date":"2022-07-05","expiry_date":"2030-06-30","formation_total_amount":"1.1","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20170046","operator_company_name":"시리즈벤처스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.777Z"}'::jsonb,
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

-- Record 2019: 시리즈벤처스 시리즈 스트롱 2호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20170046',
  '시리즈벤처스 시리즈 스트롱 2호 투자조합',
  NULL,
  'VCS Registered Fund',
  500000000,
  500000000,
  '2021-09-06',
  'Active',
  '시리즈벤처스',
  NULL,
  '{"fund_id":"AS20210760","registration_date":"2021-09-06","expiry_date":"2027-08-25","formation_total_amount":"5.0","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20170046","operator_company_name":"시리즈벤처스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.777Z"}'::jsonb,
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

-- Record 2020: 시리즈벤처스 시리즈 스트롱 1호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20170046',
  '시리즈벤처스 시리즈 스트롱 1호 투자조합',
  NULL,
  'VCS Registered Fund',
  240000000,
  240000000,
  '2021-08-12',
  'Active',
  '시리즈벤처스',
  NULL,
  '{"fund_id":"AS20210706","registration_date":"2021-08-12","expiry_date":"2026-08-11","formation_total_amount":"2.4","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20170046","operator_company_name":"시리즈벤처스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.777Z"}'::jsonb,
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

-- Record 2021: 시리즈X경남창조경제혁신센터 창업펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20170046',
  '시리즈X경남창조경제혁신센터 창업펀드',
  NULL,
  'VCS Registered Fund',
  120000000,
  120000000,
  '2019-11-18',
  'Active',
  '시리즈벤처스',
  NULL,
  '{"fund_id":"AS20190497","registration_date":"2019-11-18","expiry_date":"2026-11-17","formation_total_amount":"1.2","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20170046","operator_company_name":"시리즈벤처스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.777Z"}'::jsonb,
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

-- Record 2022: 시리즈X갈매엔젤클럽 창업펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20170046',
  '시리즈X갈매엔젤클럽 창업펀드',
  NULL,
  'VCS Registered Fund',
  190000000,
  190000000,
  '2019-10-15',
  'Active',
  '시리즈벤처스',
  NULL,
  '{"fund_id":"AS20190451","registration_date":"2019-10-15","expiry_date":"2026-10-14","formation_total_amount":"1.9","investment_character_code":"","industry_code":"4","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20170046","operator_company_name":"시리즈벤처스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.777Z"}'::jsonb,
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

-- Record 2023: 시리즈 스타트업 창업펀드 CA
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20170046',
  '시리즈 스타트업 창업펀드 CA',
  NULL,
  'VCS Registered Fund',
  170000000,
  170000000,
  '2019-04-24',
  'Active',
  '시리즈벤처스',
  NULL,
  '{"fund_id":"AS20190150","registration_date":"2019-04-24","expiry_date":"2026-04-23","formation_total_amount":"1.7","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20170046","operator_company_name":"시리즈벤처스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.777Z"}'::jsonb,
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

-- Record 2024: 시드앤JC개인투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20210089',
  '시드앤JC개인투자조합 1호',
  NULL,
  'VCS Registered Fund',
  110000000,
  110000000,
  '2024-04-29',
  'Active',
  '시드앤파트너스',
  NULL,
  '{"fund_id":"AS20240297","registration_date":"2024-04-29","expiry_date":"2029-04-28","formation_total_amount":"1.1","investment_character_code":"","industry_code":"3","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20210089","operator_company_name":"시드앤파트너스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.777Z"}'::jsonb,
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

-- Record 2025: 시너지 피나코테크 1호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20140010',
  '시너지 피나코테크 1호 투자조합',
  NULL,
  'VCS Registered Fund',
  400000000,
  400000000,
  '2024-08-27',
  'Active',
  '시너지아이비투자',
  NULL,
  '{"fund_id":"AS20240782","registration_date":"2024-08-27","expiry_date":"2029-08-25","formation_total_amount":"4.0","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20140010","operator_company_name":"시너지아이비투자","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.777Z"}'::jsonb,
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

-- Record 2026: 시너지 시니어케어 1호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20140010',
  '시너지 시니어케어 1호 투자조합',
  NULL,
  'VCS Registered Fund',
  120000000,
  120000000,
  '2024-09-09',
  'Active',
  '시너지아이비투자',
  NULL,
  '{"fund_id":"AS20240862","registration_date":"2024-09-09","expiry_date":"2029-09-08","formation_total_amount":"1.2","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20140010","operator_company_name":"시너지아이비투자","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.777Z"}'::jsonb,
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

-- Record 2027: 시너지 밸류크리에이티브 1호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20140010',
  '시너지 밸류크리에이티브 1호 개인투자조합',
  NULL,
  'VCS Registered Fund',
  4070000000,
  4070000000,
  '2024-08-14',
  'Active',
  '시너지아이비투자',
  NULL,
  '{"fund_id":"AS20240738","registration_date":"2024-08-14","expiry_date":"2034-08-13","formation_total_amount":"40.7","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20140010","operator_company_name":"시너지아이비투자","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.777Z"}'::jsonb,
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

-- Record 2028: 시너지 밸류 웨이브 벤처펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20140010',
  '시너지 밸류 웨이브 벤처펀드',
  NULL,
  'VCS Registered Fund',
  18000000000,
  18000000000,
  '2018-01-08',
  'Active',
  '시너지아이비투자',
  '{"특허","일반"}',
  '{"fund_id":"AS20180090","registration_date":"2018-01-08","expiry_date":"2026-01-07","formation_total_amount":"180.0","investment_character_code":"09","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"특허","mother_fund_id":"MF00000001","operator_company_id":"OP20140010","operator_company_name":"시너지아이비투자","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.777Z"}'::jsonb,
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

-- Record 2029: 시너지 바이오 헬스케어 벤처펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20140010',
  '시너지 바이오 헬스케어 벤처펀드',
  NULL,
  'VCS Registered Fund',
  30000000000,
  30000000000,
  '2018-10-26',
  'Active',
  '시너지아이비투자',
  '{"바이오","일반"}',
  '{"fund_id":"AS20180324","registration_date":"2018-10-26","expiry_date":"2028-10-25","formation_total_amount":"300.0","investment_character_code":"04","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"바이오","mother_fund_id":"MF00000001","operator_company_id":"OP20140010","operator_company_name":"시너지아이비투자","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.777Z"}'::jsonb,
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

-- Record 2030: 시너지 딥테크 오픈이노베이션 3호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20140010',
  '시너지 딥테크 오픈이노베이션 3호 투자조합',
  NULL,
  'VCS Registered Fund',
  470000000,
  470000000,
  '2024-12-30',
  'Active',
  '시너지아이비투자',
  NULL,
  '{"fund_id":"AS20241441","registration_date":"2024-12-30","expiry_date":"2029-12-29","formation_total_amount":"4.7","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20140010","operator_company_name":"시너지아이비투자","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.777Z"}'::jsonb,
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

-- Record 2031: 시너지 딥테크 오픈이노베이션 2호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20140010',
  '시너지 딥테크 오픈이노베이션 2호 투자조합',
  NULL,
  'VCS Registered Fund',
  110000000,
  110000000,
  '2024-11-06',
  'Active',
  '시너지아이비투자',
  NULL,
  '{"fund_id":"AS20241041","registration_date":"2024-11-06","expiry_date":"2029-11-04","formation_total_amount":"1.1","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20140010","operator_company_name":"시너지아이비투자","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.778Z"}'::jsonb,
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

-- Record 2032: 시너지 딥테크 오픈이노베이션 1호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20140010',
  '시너지 딥테크 오픈이노베이션 1호 투자조합',
  NULL,
  'VCS Registered Fund',
  360000000,
  360000000,
  '2024-06-17',
  'Active',
  '시너지아이비투자',
  NULL,
  '{"fund_id":"AS20240539","registration_date":"2024-06-17","expiry_date":"2029-06-16","formation_total_amount":"3.6","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20140010","operator_company_name":"시너지아이비투자","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.778Z"}'::jsonb,
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

-- Record 2033: 시너지 Value Creative 벤처펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20140010',
  '시너지 Value Creative 벤처펀드',
  NULL,
  'VCS Registered Fund',
  2300000000,
  2300000000,
  '2017-06-16',
  'Active',
  '시너지아이비투자',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20170058","registration_date":"2017-06-16","expiry_date":"2025-06-15","formation_total_amount":"23.0","investment_character_code":"20","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20140010","operator_company_name":"시너지아이비투자","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.778Z"}'::jsonb,
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

-- Record 2034: 시너스 1호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20220304',
  '시너스 1호 개인투자조합',
  NULL,
  'VCS Registered Fund',
  550000000,
  550000000,
  '2023-12-21',
  'Active',
  '시너스파트너스',
  NULL,
  '{"fund_id":"AS20231308","registration_date":"2023-12-21","expiry_date":"2028-12-18","formation_total_amount":"5.5","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20220304","operator_company_name":"시너스파트너스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.778Z"}'::jsonb,
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

-- Record 2035: 시그나이트-썬더 벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20200285',
  '시그나이트-썬더 벤처투자조합',
  NULL,
  'VCS Registered Fund',
  23000000000,
  23000000000,
  '2021-12-21',
  'Active',
  '시그나이트',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20211377","registration_date":"2021-12-21","expiry_date":"2026-12-20","formation_total_amount":"230.0","investment_character_code":"25","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20200285","operator_company_name":"시그나이트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.778Z"}'::jsonb,
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

-- Record 2036: 시그나이트-라엘 벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20200285',
  '시그나이트-라엘 벤처투자조합',
  NULL,
  'VCS Registered Fund',
  26010000000,
  26010000000,
  '2022-03-07',
  'Active',
  '시그나이트',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20220241","registration_date":"2022-03-07","expiry_date":"2027-03-06","formation_total_amount":"260.1","investment_character_code":"25","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20200285","operator_company_name":"시그나이트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.778Z"}'::jsonb,
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

-- Record 2037: 승승스타트업투자조합9호
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20150039',
  '승승스타트업투자조합9호',
  NULL,
  'VCS Registered Fund',
  100000000,
  100000000,
  '2022-02-10',
  'Active',
  '후앤후',
  NULL,
  '{"fund_id":"AS20220127","registration_date":"2022-02-10","expiry_date":"2027-06-30","formation_total_amount":"1.0","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20150039","operator_company_name":"후앤후","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.778Z"}'::jsonb,
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

-- Record 2038: 승승스타트업투자조합7호
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20150039',
  '승승스타트업투자조합7호',
  NULL,
  'VCS Registered Fund',
  150000000,
  150000000,
  '2021-10-01',
  'Active',
  '후앤후',
  NULL,
  '{"fund_id":"AS20210941","registration_date":"2021-10-01","expiry_date":"2026-12-31","formation_total_amount":"1.5","investment_character_code":"","industry_code":"4","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20150039","operator_company_name":"후앤후","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.778Z"}'::jsonb,
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

-- Record 2039: 승승스타트업투자조합5호
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20150039',
  '승승스타트업투자조합5호',
  NULL,
  'VCS Registered Fund',
  260000000,
  260000000,
  '2021-06-01',
  'Active',
  '후앤후',
  NULL,
  '{"fund_id":"AS20210398","registration_date":"2021-06-01","expiry_date":"2026-06-30","formation_total_amount":"2.6","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20150039","operator_company_name":"후앤후","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.778Z"}'::jsonb,
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

-- Record 2040: 승승스타트업투자조합4호
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20150039',
  '승승스타트업투자조합4호',
  NULL,
  'VCS Registered Fund',
  100000000,
  100000000,
  '2021-01-28',
  'Active',
  '후앤후',
  NULL,
  '{"fund_id":"AS20210067","registration_date":"2021-01-28","expiry_date":"2026-06-30","formation_total_amount":"1.0","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20150039","operator_company_name":"후앤후","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.778Z"}'::jsonb,
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

-- Record 2041: 승승스타트업투자조합3호
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20150039',
  '승승스타트업투자조합3호',
  NULL,
  'VCS Registered Fund',
  120000000,
  120000000,
  '2020-09-28',
  'Active',
  '후앤후',
  NULL,
  '{"fund_id":"AS20200532","registration_date":"2020-09-28","expiry_date":"2025-12-31","formation_total_amount":"1.2","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20150039","operator_company_name":"후앤후","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.778Z"}'::jsonb,
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

-- Record 2042: 승승스타트업투자조합2호
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20150039',
  '승승스타트업투자조합2호',
  NULL,
  'VCS Registered Fund',
  150000000,
  150000000,
  '2020-09-17',
  'Active',
  '후앤후',
  NULL,
  '{"fund_id":"AS20200502","registration_date":"2020-09-17","expiry_date":"2025-12-31","formation_total_amount":"1.5","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20150039","operator_company_name":"후앤후","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.778Z"}'::jsonb,
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

-- Record 2043: 승승스타트업투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20150039',
  '승승스타트업투자조합1호',
  NULL,
  'VCS Registered Fund',
  100000000,
  100000000,
  '2020-04-17',
  'Active',
  '후앤후',
  NULL,
  '{"fund_id":"AS20200171","registration_date":"2020-04-17","expiry_date":"2025-12-31","formation_total_amount":"1.0","investment_character_code":"","industry_code":"4","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20150039","operator_company_name":"후앤후","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.778Z"}'::jsonb,
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

-- Record 2044: 승승스타트업투자조합10호
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20150039',
  '승승스타트업투자조합10호',
  NULL,
  'VCS Registered Fund',
  100000000,
  100000000,
  '2022-01-28',
  'Active',
  '후앤후',
  NULL,
  '{"fund_id":"AS20220097","registration_date":"2022-01-28","expiry_date":"2027-06-30","formation_total_amount":"1.0","investment_character_code":"","industry_code":"3","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20150039","operator_company_name":"후앤후","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.778Z"}'::jsonb,
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

-- Record 2045: 스프링캠프-KIF 초기전문 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20150007',
  '스프링캠프-KIF 초기전문 투자조합',
  NULL,
  'VCS Registered Fund',
  19500000000,
  19500000000,
  '2024-01-16',
  'Active',
  '스프링캠프',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20240040","registration_date":"2024-01-16","expiry_date":"2031-01-15","formation_total_amount":"195.0","investment_character_code":"06","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20150007","operator_company_name":"스프링캠프","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.778Z"}'::jsonb,
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

-- Record 2046: 스프링캠프 초기전문 투자조합 제4호
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20150007',
  '스프링캠프 초기전문 투자조합 제4호',
  NULL,
  'VCS Registered Fund',
  10410000000,
  10410000000,
  '2022-05-27',
  'Active',
  '스프링캠프',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20220608","registration_date":"2022-05-27","expiry_date":"2030-05-26","formation_total_amount":"104.1","investment_character_code":"02","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20150007","operator_company_name":"스프링캠프","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.778Z"}'::jsonb,
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

-- Record 2047: 스프링캠프 초기전문 투자조합 제2호
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20150007',
  '스프링캠프 초기전문 투자조합 제2호',
  NULL,
  'VCS Registered Fund',
  65250000000,
  65250000000,
  '2020-05-15',
  'Active',
  '스프링캠프',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20200206","registration_date":"2020-05-15","expiry_date":"2028-05-14","formation_total_amount":"652.5","investment_character_code":"20","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20150007","operator_company_name":"스프링캠프","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.778Z"}'::jsonb,
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

-- Record 2048: 스프링캠프 초기전문 투자조합 제1호
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20150007',
  '스프링캠프 초기전문 투자조합 제1호',
  NULL,
  'VCS Registered Fund',
  40000000000,
  40000000000,
  '2017-05-17',
  'Active',
  '스프링캠프',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20170047","registration_date":"2017-05-17","expiry_date":"2026-05-16","formation_total_amount":"400.0","investment_character_code":"20","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20150007","operator_company_name":"스프링캠프","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.778Z"}'::jsonb,
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

-- Record 2049: 스프링캠프 상생 펀드 2호
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20150007',
  '스프링캠프 상생 펀드 2호',
  NULL,
  'VCS Registered Fund',
  1000000000,
  1000000000,
  '2023-04-27',
  'Active',
  '스프링캠프',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20230331","registration_date":"2023-04-27","expiry_date":"2030-04-26","formation_total_amount":"10.0","investment_character_code":"20","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20150007","operator_company_name":"스프링캠프","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.778Z"}'::jsonb,
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

-- Record 2050: 스프링캠프 상생 펀드 1호
INSERT INTO fund_table (
  company_id, fund_name, fund_name_en, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20150007',
  '스프링캠프 상생 펀드 1호',
  NULL,
  'VCS Registered Fund',
  1000000000,
  1000000000,
  '2023-04-27',
  'Active',
  '스프링캠프',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20230330","registration_date":"2023-04-27","expiry_date":"2030-04-26","formation_total_amount":"10.0","investment_character_code":"20","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20150007","operator_company_name":"스프링캠프","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:28:06.778Z"}'::jsonb,
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

-- Batch 41 completed! 50 fund records processed.
-- Progress: 2050/3689 total records

