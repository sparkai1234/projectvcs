-- VCS Fund CORRECTED UPSERT Batch 45/74 (Records 2201-2250)
-- FIXED: Removed fund_name_en column that does not exist
-- Generated from VCS API Scraper fund data
-- Generated at: 2025-06-05T00:34:30.308Z
-- Schema: Matches actual fund_table structure (no fund_name_en)

-- CORRECTED FUND DATA (UPSERT - Safe for Duplicates)
-- Processing 50 fund records
-- Will INSERT new records or UPDATE existing ones

-- Record 2201: 스마트 아이엠엠 살루스 헬스케어 벤처펀드 제2호 
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP19990002',
  '스마트 아이엠엠 살루스 헬스케어 벤처펀드 제2호 ',
  'VCS Registered Fund',
  55500000000,
  55500000000,
  '2023-05-23',
  'Active',
  '아이엠엠인베스트먼트',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20230419","registration_date":"2023-05-23","expiry_date":"2028-05-22","formation_total_amount":"555.0","investment_character_code":"10","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP19990002","operator_company_name":"아이엠엠인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.308Z"}'::jsonb,
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

-- Record 2202: 스마트 씨제이-대성 메타버스 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP19870004',
  '스마트 씨제이-대성 메타버스 투자조합',
  'VCS Registered Fund',
  15000000000,
  15000000000,
  '2021-08-05',
  'Active',
  '대성창업투자',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20210682","registration_date":"2021-08-05","expiry_date":"2028-08-04","formation_total_amount":"150.0","investment_character_code":"02","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP19870004","operator_company_name":"대성창업투자","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.308Z"}'::jsonb,
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

-- Record 2203: 스마트 스프링 펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20150007',
  '스마트 스프링 펀드',
  'VCS Registered Fund',
  28000000000,
  28000000000,
  '2021-01-04',
  'Active',
  '스프링캠프',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20210019","registration_date":"2021-01-04","expiry_date":"2029-01-03","formation_total_amount":"280.0","investment_character_code":"10","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20150007","operator_company_name":"스프링캠프","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.308Z"}'::jsonb,
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

-- Record 2204: 스마트 스파크랩 클라우드 제1호 펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20190384',
  '스마트 스파크랩 클라우드 제1호 펀드',
  'VCS Registered Fund',
  10000000000,
  10000000000,
  '2021-01-04',
  'Active',
  '스파크랩',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20210017","registration_date":"2021-01-04","expiry_date":"2026-01-03","formation_total_amount":"100.0","investment_character_code":"10","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20190384","operator_company_name":"스파크랩","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.308Z"}'::jsonb,
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

-- Record 2205: 스마트 수인베스트먼트 언택트 제이커브 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20170014',
  '스마트 수인베스트먼트 언택트 제이커브 투자조합',
  'VCS Registered Fund',
  40000000000,
  40000000000,
  '2021-08-24',
  'Active',
  '수인베스트먼트캐피탈',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20210746","registration_date":"2021-08-24","expiry_date":"2029-08-23","formation_total_amount":"400.0","investment_character_code":"02","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20170014","operator_company_name":"수인베스트먼트캐피탈","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.308Z"}'::jsonb,
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

-- Record 2206: 스마트 수소경제 및 E-신산업 BSK 10호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20100012',
  '스마트 수소경제 및 E-신산업 BSK 10호 투자조합',
  'VCS Registered Fund',
  48500000000,
  48500000000,
  '2020-12-08',
  'Active',
  '비에스케이인베스트먼트',
  '{"에너지","일반"}',
  '{"fund_id":"AS20200752","registration_date":"2020-12-08","expiry_date":"2030-12-07","formation_total_amount":"485.0","investment_character_code":"11","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"에너지","mother_fund_id":"MF00000001","operator_company_id":"OP20100012","operator_company_name":"비에스케이인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.308Z"}'::jsonb,
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

-- Record 2207: 스마트 서울투자 비대면 펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20100003',
  '스마트 서울투자 비대면 펀드',
  'VCS Registered Fund',
  12500000000,
  12500000000,
  '2021-09-16',
  'Active',
  '서울투자파트너스',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20210875","registration_date":"2021-09-16","expiry_date":"2029-09-15","formation_total_amount":"125.0","investment_character_code":"02","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20100003","operator_company_name":"서울투자파트너스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.308Z"}'::jsonb,
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

-- Record 2208: 스마트 사우스뱅크 디스커버리 벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20200326',
  '스마트 사우스뱅크 디스커버리 벤처투자조합',
  'VCS Registered Fund',
  15190000000,
  15190000000,
  '2020-12-16',
  'Active',
  '에스비파트너스',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20200801","registration_date":"2020-12-16","expiry_date":"2025-12-15","formation_total_amount":"151.9","investment_character_code":"10","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20200326","operator_company_name":"에스비파트너스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.308Z"}'::jsonb,
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

-- Record 2209: 스마트 비전에쿼티 이노베이션 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20200061',
  '스마트 비전에쿼티 이노베이션 투자조합',
  'VCS Registered Fund',
  12000000000,
  12000000000,
  '2022-12-14',
  'Active',
  '비전에쿼티파트너스',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20221478","registration_date":"2022-12-14","expiry_date":"2030-12-13","formation_total_amount":"120.0","investment_character_code":"06","industry_code":"1","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20200061","operator_company_name":"비전에쿼티파트너스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.308Z"}'::jsonb,
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

-- Record 2210: 스마트 비엔케이 뉴딜 펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20090004',
  '스마트 비엔케이 뉴딜 펀드',
  'VCS Registered Fund',
  35000000000,
  35000000000,
  '2021-08-06',
  'Active',
  '비엔케이벤처투자',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20210692","registration_date":"2021-08-06","expiry_date":"2028-08-05","formation_total_amount":"350.0","investment_character_code":"05","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20090004","operator_company_name":"비엔케이벤처투자","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.308Z"}'::jsonb,
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

-- Record 2211: 스마트 브이플랫폼 코리아센터 멘토링 펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20180006',
  '스마트 브이플랫폼 코리아센터 멘토링 펀드',
  'VCS Registered Fund',
  21750000000,
  21750000000,
  '2022-07-21',
  'Active',
  '브이플랫폼인베스트먼트',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20220837","registration_date":"2022-07-21","expiry_date":"2029-07-20","formation_total_amount":"217.5","investment_character_code":"10","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20180006","operator_company_name":"브이플랫폼인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.308Z"}'::jsonb,
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

-- Record 2212: 스마트 뮤어우즈 비대면 1호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20200321',
  '스마트 뮤어우즈 비대면 1호 투자조합',
  'VCS Registered Fund',
  20210000000,
  20210000000,
  '2022-10-24',
  'Active',
  '뮤어우즈벤처스',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20221218","registration_date":"2022-10-24","expiry_date":"2029-10-23","formation_total_amount":"202.1","investment_character_code":"02","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20200321","operator_company_name":"뮤어우즈벤처스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.308Z"}'::jsonb,
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

-- Record 2213: 스마트 무신사-한국투자 펀드 1호
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20200253',
  '스마트 무신사-한국투자 펀드 1호',
  'VCS Registered Fund',
  20210000000,
  20210000000,
  '2021-01-14',
  'Active',
  '무신사파트너스',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20210062","registration_date":"2021-01-14","expiry_date":"2028-01-13","formation_total_amount":"202.1","investment_character_code":"10","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20200253","operator_company_name":"무신사파트너스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.308Z"}'::jsonb,
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

-- Record 2214: 스마트 마그나킹고 그린펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20100002',
  '스마트 마그나킹고 그린펀드',
  'VCS Registered Fund',
  25200000000,
  25200000000,
  '2021-02-01',
  'Active',
  '마그나인베스트먼트',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20210098","registration_date":"2021-02-01","expiry_date":"2029-01-31","formation_total_amount":"252.0","investment_character_code":"10","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20100002","operator_company_name":"마그나인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.308Z"}'::jsonb,
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

-- Record 2215: 스마트 대한민국 라구나 비대면 펀드 제4호
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20180014',
  '스마트 대한민국 라구나 비대면 펀드 제4호',
  'VCS Registered Fund',
  50000000000,
  50000000000,
  '2021-07-12',
  'Active',
  '라구나인베스트먼트',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20210579","registration_date":"2021-07-12","expiry_date":"2029-07-11","formation_total_amount":"500.0","investment_character_code":"10","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20180014","operator_company_name":"라구나인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.308Z"}'::jsonb,
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

-- Record 2216: 스마트 대한민국 경동킹고 바이오펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20170033',
  '스마트 대한민국 경동킹고 바이오펀드',
  'VCS Registered Fund',
  27000000000,
  27000000000,
  '2021-01-06',
  'Active',
  '킹고투자파트너스',
  '{"바이오","일반"}',
  '{"fund_id":"AS20210046","registration_date":"2021-01-06","expiry_date":"2029-01-05","formation_total_amount":"270.0","investment_character_code":"04","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"바이오","mother_fund_id":"MF00000001","operator_company_id":"OP20170033","operator_company_name":"킹고투자파트너스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.308Z"}'::jsonb,
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

-- Record 2217: 스마트 대한민국 KT 넥스트 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20190180',
  '스마트 대한민국 KT 넥스트 투자조합',
  'VCS Registered Fund',
  22000000000,
  22000000000,
  '2021-09-29',
  'Active',
  '쿼드벤처스',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20210923","registration_date":"2021-09-29","expiry_date":"2029-09-28","formation_total_amount":"220.0","investment_character_code":"01","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20190180","operator_company_name":"쿼드벤처스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.308Z"}'::jsonb,
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

-- Record 2218: 스마트 대교 동행 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20110006',
  '스마트 대교 동행 투자조합',
  'VCS Registered Fund',
  20000000000,
  20000000000,
  '2020-12-23',
  'Active',
  '대교인베스트먼트',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20200837","registration_date":"2020-12-23","expiry_date":"2028-12-22","formation_total_amount":"200.0","investment_character_code":"10","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20110006","operator_company_name":"대교인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.308Z"}'::jsonb,
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

-- Record 2219: 스마트 그린뉴딜 제피러스랩 혁신벤처펀드 제1호
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20170048',
  '스마트 그린뉴딜 제피러스랩 혁신벤처펀드 제1호',
  'VCS Registered Fund',
  10000000000,
  10000000000,
  '2021-09-17',
  'Active',
  '제피러스랩',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20210887","registration_date":"2021-09-17","expiry_date":"2029-09-16","formation_total_amount":"100.0","investment_character_code":"20","industry_code":"9","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20170048","operator_company_name":"제피러스랩","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.308Z"}'::jsonb,
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

-- Record 2220: 스마트 그린뉴딜 소방산업펀드 5호
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20160011',
  '스마트 그린뉴딜 소방산업펀드 5호',
  'VCS Registered Fund',
  18500000000,
  18500000000,
  '2020-12-29',
  'Active',
  '어니스트벤처스',
  '{"환경","일반"}',
  '{"fund_id":"AS20210007","registration_date":"2020-12-29","expiry_date":"2028-12-28","formation_total_amount":"185.0","investment_character_code":"10","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"환경","mother_fund_id":"MF00000001","operator_company_id":"OP20160011","operator_company_name":"어니스트벤처스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.308Z"}'::jsonb,
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

-- Record 2221: 스마트 그린뉴딜 SGC 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20220034',
  '스마트 그린뉴딜 SGC 투자조합',
  'VCS Registered Fund',
  25000000000,
  25000000000,
  '2023-01-04',
  'Active',
  '에스지씨파트너스',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20230021","registration_date":"2023-01-04","expiry_date":"2031-01-03","formation_total_amount":"250.0","investment_character_code":"02","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20220034","operator_company_name":"에스지씨파트너스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.308Z"}'::jsonb,
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

-- Record 2222: 스마트 LSK 3호 펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20160010',
  '스마트 LSK 3호 펀드',
  'VCS Registered Fund',
  55000000000,
  55000000000,
  '2020-08-06',
  'Active',
  '엘에스케이인베스트먼트',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20200418","registration_date":"2020-08-06","expiry_date":"2028-08-05","formation_total_amount":"550.0","investment_character_code":"20","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20160010","operator_company_name":"엘에스케이인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.308Z"}'::jsonb,
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

-- Record 2223: 스마트 iM 디지털그린 벤처펀드 2호
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20140001',
  '스마트 iM 디지털그린 벤처펀드 2호',
  'VCS Registered Fund',
  30000000000,
  30000000000,
  '2023-01-05',
  'Active',
  '아이엠투자파트너스',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20230025","registration_date":"2023-01-05","expiry_date":"2031-01-04","formation_total_amount":"300.0","investment_character_code":"10","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20140001","operator_company_name":"아이엠투자파트너스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.308Z"}'::jsonb,
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

-- Record 2224: 스마트 iM 디지털그린 벤처펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20140001',
  '스마트 iM 디지털그린 벤처펀드',
  'VCS Registered Fund',
  30000000000,
  30000000000,
  '2021-09-06',
  'Active',
  '아이엠투자파트너스',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20210814","registration_date":"2021-09-06","expiry_date":"2029-09-05","formation_total_amount":"300.0","investment_character_code":"10","industry_code":"9","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20140001","operator_company_name":"아이엠투자파트너스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.308Z"}'::jsonb,
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

-- Record 2225: 스마트 IBK-퀀텀 그린신산업펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20170021',
  '스마트 IBK-퀀텀 그린신산업펀드',
  'VCS Registered Fund',
  30500000000,
  30500000000,
  '2021-11-26',
  'Active',
  '퀀텀벤처스코리아',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20211200","registration_date":"2021-11-26","expiry_date":"2029-11-25","formation_total_amount":"305.0","investment_character_code":"10","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20170021","operator_company_name":"퀀텀벤처스코리아","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.308Z"}'::jsonb,
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

-- Record 2226: 스마트 HIP 제4호 벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20210475',
  '스마트 HIP 제4호 벤처투자조합',
  'VCS Registered Fund',
  37000000000,
  37000000000,
  '2022-09-23',
  'Active',
  '현대투자파트너스',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20221096","registration_date":"2022-09-23","expiry_date":"2030-09-22","formation_total_amount":"370.0","investment_character_code":"10","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20210475","operator_company_name":"현대투자파트너스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.308Z"}'::jsonb,
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

-- Record 2227: 스마트 CKD 바이오-헬스케어 1호 벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP19970005',
  '스마트 CKD 바이오-헬스케어 1호 벤처투자조합',
  'VCS Registered Fund',
  52000000000,
  52000000000,
  '2021-09-06',
  'Active',
  '씨케이디창업투자',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20210813","registration_date":"2021-09-06","expiry_date":"2029-09-05","formation_total_amount":"520.0","investment_character_code":"04","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP19970005","operator_company_name":"씨케이디창업투자","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.308Z"}'::jsonb,
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

-- Record 2228: 스마트 A 온택트 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20180046',
  '스마트 A 온택트 투자조합',
  'VCS Registered Fund',
  73500000000,
  73500000000,
  '2021-09-29',
  'Active',
  '에이벤처스',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20210931","registration_date":"2021-09-29","expiry_date":"2029-09-28","formation_total_amount":"735.0","investment_character_code":"10","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20180046","operator_company_name":"에이벤처스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.308Z"}'::jsonb,
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

-- Record 2229: 스마트 4차산업 스퀘어 투자조합 2호
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20190052',
  '스마트 4차산업 스퀘어 투자조합 2호',
  'VCS Registered Fund',
  10000000000,
  10000000000,
  '2021-11-17',
  'Active',
  '스퀘어벤처스',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20211153","registration_date":"2021-11-17","expiry_date":"2029-11-16","formation_total_amount":"100.0","investment_character_code":"02","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20190052","operator_company_name":"스퀘어벤처스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.308Z"}'::jsonb,
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

-- Record 2230: 스마일게이트화통아진펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP19990003',
  '스마일게이트화통아진펀드',
  'VCS Registered Fund',
  58000000000,
  58000000000,
  '2015-07-29',
  'Active',
  '스마일게이트인베스트먼트',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20150007","registration_date":"2015-07-29","expiry_date":"2025-07-28","formation_total_amount":"580.0","investment_character_code":"15","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP19990003","operator_company_name":"스마일게이트인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.308Z"}'::jsonb,
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

-- Record 2231: 스마일게이트혁신성장펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP19990003',
  '스마일게이트혁신성장펀드',
  'VCS Registered Fund',
  265200000000,
  265200000000,
  '2024-01-10',
  'Active',
  '스마일게이트인베스트먼트',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20240026","registration_date":"2024-01-10","expiry_date":"2032-01-09","formation_total_amount":"2652.0","investment_character_code":"10","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP19990003","operator_company_name":"스마일게이트인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.308Z"}'::jsonb,
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

-- Record 2232: 스마일게이트핀테크1호투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP19990003',
  '스마일게이트핀테크1호투자조합',
  'VCS Registered Fund',
  30000000000,
  30000000000,
  '2022-08-22',
  'Active',
  '스마일게이트인베스트먼트',
  '{"일반 기타","일반"}',
  '{"fund_id":"AS20220969","registration_date":"2022-08-22","expiry_date":"2030-08-21","formation_total_amount":"300.0","investment_character_code":"01","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"일반 기타","mother_fund_id":"","operator_company_id":"OP19990003","operator_company_name":"스마일게이트인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.308Z"}'::jsonb,
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

-- Record 2233: 스마일게이트패스파인더펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP19990003',
  '스마일게이트패스파인더펀드',
  'VCS Registered Fund',
  129000000000,
  129000000000,
  '2018-12-28',
  'Active',
  '스마일게이트인베스트먼트',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20190013","registration_date":"2018-12-28","expiry_date":"2026-12-27","formation_total_amount":"1290.0","investment_character_code":"02","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP19990003","operator_company_name":"스마일게이트인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.308Z"}'::jsonb,
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

-- Record 2234: 스마일게이트패스트무버1호투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP19990003',
  '스마일게이트패스트무버1호투자조합',
  'VCS Registered Fund',
  33330000000,
  33330000000,
  '2022-07-12',
  'Active',
  '스마일게이트인베스트먼트',
  '{"일반 기타","일반"}',
  '{"fund_id":"AS20220787","registration_date":"2022-07-12","expiry_date":"2027-07-11","formation_total_amount":"333.3","investment_character_code":"01","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"일반 기타","mother_fund_id":"","operator_company_id":"OP19990003","operator_company_name":"스마일게이트인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.308Z"}'::jsonb,
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

-- Record 2235: 스마일게이트청년창업펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP19990003',
  '스마일게이트청년창업펀드',
  'VCS Registered Fund',
  30000000000,
  30000000000,
  '2013-09-12',
  'Active',
  '스마일게이트인베스트먼트',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20130028","registration_date":"2013-09-12","expiry_date":"2025-09-11","formation_total_amount":"300.0","investment_character_code":"21","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP19990003","operator_company_name":"스마일게이트인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.308Z"}'::jsonb,
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

-- Record 2236: 스마일게이트오렌지펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP19990003',
  '스마일게이트오렌지펀드',
  'VCS Registered Fund',
  20000000000,
  20000000000,
  '2011-11-14',
  'Active',
  '스마일게이트인베스트먼트',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20110058","registration_date":"2011-11-14","expiry_date":"2025-11-13","formation_total_amount":"200.0","investment_character_code":"01","industry_code":"7","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP19990003","operator_company_name":"스마일게이트인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.308Z"}'::jsonb,
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

-- Record 2237: 스마일게이트아프로디테서브원펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP19990003',
  '스마일게이트아프로디테서브원펀드',
  'VCS Registered Fund',
  10500000000,
  10500000000,
  '2021-11-04',
  'Active',
  '스마일게이트인베스트먼트',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20211087","registration_date":"2021-11-04","expiry_date":"2026-11-03","formation_total_amount":"105.0","investment_character_code":"01","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP19990003","operator_company_name":"스마일게이트인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.308Z"}'::jsonb,
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

-- Record 2238: 스마일게이트스마트오렌지펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP19990003',
  '스마일게이트스마트오렌지펀드',
  'VCS Registered Fund',
  15000000000,
  15000000000,
  '2021-06-16',
  'Active',
  '스마일게이트인베스트먼트',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20210483","registration_date":"2021-06-16","expiry_date":"2026-06-15","formation_total_amount":"150.0","investment_character_code":"01","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP19990003","operator_company_name":"스마일게이트인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.308Z"}'::jsonb,
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

-- Record 2239: 스마일게이트바이오산업펀드3호
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP19990003',
  '스마일게이트바이오산업펀드3호',
  'VCS Registered Fund',
  15500000000,
  15500000000,
  '2020-06-17',
  'Active',
  '스마일게이트인베스트먼트',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20200270","registration_date":"2020-06-17","expiry_date":"2025-06-16","formation_total_amount":"155.0","investment_character_code":"01","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP19990003","operator_company_name":"스마일게이트인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.308Z"}'::jsonb,
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

-- Record 2240: 스마일게이트바이오산업펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP19990003',
  '스마일게이트바이오산업펀드',
  'VCS Registered Fund',
  10500000000,
  10500000000,
  '2018-10-05',
  'Active',
  '스마일게이트인베스트먼트',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20180308","registration_date":"2018-10-05","expiry_date":"2025-10-04","formation_total_amount":"105.0","investment_character_code":"25","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP19990003","operator_company_name":"스마일게이트인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.308Z"}'::jsonb,
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

-- Record 2241: 스마일게이트로켓부스터3호
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP19990003',
  '스마일게이트로켓부스터3호',
  'VCS Registered Fund',
  25000000000,
  25000000000,
  '2024-08-07',
  'Active',
  '스마일게이트인베스트먼트',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20240754","registration_date":"2024-08-07","expiry_date":"2032-08-06","formation_total_amount":"250.0","investment_character_code":"20","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP19990003","operator_company_name":"스마일게이트인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.308Z"}'::jsonb,
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

-- Record 2242: 스마일게이트로켓부스터2호
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP19990003',
  '스마일게이트로켓부스터2호',
  'VCS Registered Fund',
  7000000000,
  7000000000,
  '2022-05-03',
  'Active',
  '스마일게이트인베스트먼트',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20220505","registration_date":"2022-05-03","expiry_date":"2030-05-02","formation_total_amount":"70.0","investment_character_code":"20","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP19990003","operator_company_name":"스마일게이트인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.308Z"}'::jsonb,
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

-- Record 2243: 스마일게이트로켓부스터1호펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP19990003',
  '스마일게이트로켓부스터1호펀드',
  'VCS Registered Fund',
  2200000000,
  2200000000,
  '2021-04-28',
  'Active',
  '스마일게이트인베스트먼트',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20210345","registration_date":"2021-04-28","expiry_date":"2028-04-27","formation_total_amount":"22.0","investment_character_code":"20","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP19990003","operator_company_name":"스마일게이트인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.308Z"}'::jsonb,
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

-- Record 2244: 스마일게이트딥테크사업화1호펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP19990003',
  '스마일게이트딥테크사업화1호펀드',
  'VCS Registered Fund',
  48750000000,
  48750000000,
  '2020-07-27',
  'Active',
  '스마일게이트인베스트먼트',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20200382","registration_date":"2020-07-27","expiry_date":"2027-07-26","formation_total_amount":"487.5","investment_character_code":"09","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP19990003","operator_company_name":"스마일게이트인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.308Z"}'::jsonb,
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

-- Record 2245: 스마일게이트뉴딜펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP19990003',
  '스마일게이트뉴딜펀드',
  'VCS Registered Fund',
  110900000000,
  110900000000,
  '2021-12-13',
  'Active',
  '스마일게이트인베스트먼트',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20211264","registration_date":"2021-12-13","expiry_date":"2029-12-12","formation_total_amount":"1109.0","investment_character_code":"10","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP19990003","operator_company_name":"스마일게이트인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.308Z"}'::jsonb,
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

-- Record 2246: 스마일게이트녹색성장3호펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP19990003',
  '스마일게이트녹색성장3호펀드',
  'VCS Registered Fund',
  43000000000,
  43000000000,
  '2022-09-20',
  'Active',
  '스마일게이트인베스트먼트',
  '{"환경","일반"}',
  '{"fund_id":"AS20221078","registration_date":"2022-09-20","expiry_date":"2029-09-19","formation_total_amount":"430.0","investment_character_code":"05","industry_code":"9","investment_field_type":"일반","investment_field_detail_type":"환경","mother_fund_id":"MF00000001","operator_company_id":"OP19990003","operator_company_name":"스마일게이트인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.308Z"}'::jsonb,
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

-- Record 2247: 스마일게이트녹색성장2호펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP19990003',
  '스마일게이트녹색성장2호펀드',
  'VCS Registered Fund',
  20000000000,
  20000000000,
  '2020-11-12',
  'Active',
  '스마일게이트인베스트먼트',
  '{"환경","일반"}',
  '{"fund_id":"AS20200654","registration_date":"2020-11-12","expiry_date":"2027-11-11","formation_total_amount":"200.0","investment_character_code":"05","industry_code":"9","investment_field_type":"일반","investment_field_detail_type":"환경","mother_fund_id":"MF00000001","operator_company_id":"OP19990003","operator_company_name":"스마일게이트인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.308Z"}'::jsonb,
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

-- Record 2248: 스마일게이트녹색성장1호펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP19990003',
  '스마일게이트녹색성장1호펀드',
  'VCS Registered Fund',
  42000000000,
  42000000000,
  '2017-12-13',
  'Active',
  '스마일게이트인베스트먼트',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20170160","registration_date":"2017-12-13","expiry_date":"2025-06-12","formation_total_amount":"420.0","investment_character_code":"05","industry_code":"9","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP19990003","operator_company_name":"스마일게이트인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.308Z"}'::jsonb,
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

-- Record 2249: 스마일게이트넥스트커머스3호펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP19990003',
  '스마일게이트넥스트커머스3호펀드',
  'VCS Registered Fund',
  4600000000,
  4600000000,
  '2022-04-26',
  'Active',
  '스마일게이트인베스트먼트',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20220466","registration_date":"2022-04-26","expiry_date":"2027-04-25","formation_total_amount":"46.0","investment_character_code":"25","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP19990003","operator_company_name":"스마일게이트인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.308Z"}'::jsonb,
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

-- Record 2250: 스마일게이트넥스트커머스2호펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP19990003',
  '스마일게이트넥스트커머스2호펀드',
  'VCS Registered Fund',
  10600000000,
  10600000000,
  '2021-10-26',
  'Active',
  '스마일게이트인베스트먼트',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20211026","registration_date":"2021-10-26","expiry_date":"2026-10-25","formation_total_amount":"106.0","investment_character_code":"01","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP19990003","operator_company_name":"스마일게이트인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.308Z"}'::jsonb,
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

-- Corrected Batch 45 completed! 50 fund records processed.
-- Progress: 2250/3689 total records

