-- VCS Fund EXACT UPSERT Batch 66/74 (Records 3251-3300)
-- EXACT: Uses actual fund_table schema columns
-- Generated from VCS API Scraper fund data
-- Generated at: 2025-06-05T00:42:07.331Z
-- Schema: Exact match to actual fund_table structure

-- EXACT FUND DATA (UPSERT - Safe for Duplicates)
-- Processing 50 fund records
-- Will INSERT new records or UPDATE existing ones

-- Record 3251: 네오플럭스 Market-Frontier 세컨더리펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20000041',
  '네오플럭스 Market-Frontier 세컨더리펀드',
  76000000000,
  '2016-12-28',
  'Active',
  '신한벤처투자',
  'VCS_API_SCRAPER',
  'AS20170006',
  '신한벤처투자',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 16 | 산업코드: 9 | 조성총액: 760.0억원',
  '2025-12-27',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20170006","mother_fund_id":"MF00000001","investment_character_code":"16","industry_code":"9","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"760.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.331Z"}',
  '2025-06-05T00:42:07.331Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 3252: 네오인사이트 3호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20220147',
  '네오인사이트 3호 투자조합',
  2100000000,
  '2025-04-28',
  'Active',
  '네오인사이트벤처스',
  'VCS_API_SCRAPER',
  'AS20250328',
  '네오인사이트벤처스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 28 | 산업코드: 9 | 조성총액: 21.0억원',
  '2030-04-27',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20250328","mother_fund_id":"","investment_character_code":"28","industry_code":"9","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"21.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.331Z"}',
  '2025-06-05T00:42:07.331Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 3253: 네오인사이트 2호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20220147',
  '네오인사이트 2호 투자조합',
  2050000000,
  '2025-03-24',
  'Active',
  '네오인사이트벤처스',
  'VCS_API_SCRAPER',
  'AS20250219',
  '네오인사이트벤처스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 03 | 산업코드: 2 | 조성총액: 20.5억원',
  '2030-03-23',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20250219","mother_fund_id":"","investment_character_code":"03","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"20.5","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.331Z"}',
  '2025-06-05T00:42:07.331Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 3254: 네오인사이트 1호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20220147',
  '네오인사이트 1호 투자조합',
  2050000000,
  '2023-11-14',
  'Active',
  '네오인사이트벤처스',
  'VCS_API_SCRAPER',
  'AS20231077',
  '네오인사이트벤처스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 01 | 산업코드: 2 | 조성총액: 20.5억원',
  '2028-11-13',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20231077","mother_fund_id":"","investment_character_code":"01","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"20.5","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.331Z"}',
  '2025-06-05T00:42:07.331Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 3255: 네스트컴퍼니 개인투자조합1호(Nest Company Angel Investment Fund Ⅰ)
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200361',
  '네스트컴퍼니 개인투자조합1호(Nest Company Angel Investment Fund Ⅰ)',
  900000000,
  '2021-02-09',
  'Active',
  '네스트컴퍼니',
  'VCS_API_SCRAPER',
  'AS20210083',
  '네스트컴퍼니',
  '산업코드: 2 | 조성총액: 9.0억원',
  '2026-02-08',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20210083","mother_fund_id":"","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"9.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.331Z"}',
  '2025-06-05T00:42:07.331Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 3256: 네모미래연구소투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200224',
  '네모미래연구소투자조합1호',
  670000000,
  '2021-10-15',
  'Active',
  '로간',
  'VCS_API_SCRAPER',
  'AS20210980',
  '로간',
  '산업코드: 9 | 조성총액: 6.7억원',
  '2029-10-14',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20210980","mother_fund_id":"","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"6.7","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.331Z"}',
  '2025-06-05T00:42:07.331Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 3257: 내비온홍릉스타트업투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20190415',
  '내비온홍릉스타트업투자조합1호',
  220000000,
  '2021-12-29',
  'Active',
  '내비온',
  'VCS_API_SCRAPER',
  'AS20211420',
  '내비온',
  '산업코드: 5 | 조성총액: 2.2억원',
  '2026-12-28',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20211420","mother_fund_id":"","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"2.2","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.331Z"}',
  '2025-06-05T00:42:07.331Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 3258: 내비온-하임벤처투자 테크펌 스케일업 펀드 제1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20190415',
  '내비온-하임벤처투자 테크펌 스케일업 펀드 제1호',
  400000000,
  '2024-12-02',
  'Active',
  '내비온',
  'VCS_API_SCRAPER',
  'AS20241166',
  '내비온',
  '산업코드: 8 | 조성총액: 4.0억원',
  '2029-12-01',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20241166","mother_fund_id":"","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"4.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.331Z"}',
  '2025-06-05T00:42:07.331Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 3259: 내비온 테크펌 스케일업 펀드 제2호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20190415',
  '내비온 테크펌 스케일업 펀드 제2호',
  500000000,
  '2023-01-20',
  'Active',
  '내비온',
  'VCS_API_SCRAPER',
  'AS20230062',
  '내비온',
  '산업코드: 3 | 조성총액: 5.0억원',
  '2028-01-19',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20230062","mother_fund_id":"","investment_character_code":"","industry_code":"3","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"5.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.331Z"}',
  '2025-06-05T00:42:07.331Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 3260: 내비온 테크펌 스케일업 펀드 제1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20190415',
  '내비온 테크펌 스케일업 펀드 제1호',
  500000000,
  '2023-01-30',
  'Active',
  '내비온',
  'VCS_API_SCRAPER',
  'AS20230061',
  '내비온',
  '산업코드: 3 | 조성총액: 5.0억원',
  '2028-01-29',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20230061","mother_fund_id":"","investment_character_code":"","industry_code":"3","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"5.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.331Z"}',
  '2025-06-05T00:42:07.331Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 3261: 나우윈코로나펀드 2호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20070002',
  '나우윈코로나펀드 2호',
  22000000000,
  '2022-11-10',
  'Active',
  '나우아이비캐피탈',
  'VCS_API_SCRAPER',
  'AS20221289',
  '나우아이비캐피탈',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 10 | 산업코드: 9 | 조성총액: 220.0억원',
  '2030-11-09',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20221289","mother_fund_id":"MF00000001","investment_character_code":"10","industry_code":"9","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"220.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.331Z"}',
  '2025-06-05T00:42:07.331Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 3262: 나우윈코로나펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20070002',
  '나우윈코로나펀드',
  30000000000,
  '2021-07-06',
  'Active',
  '나우아이비캐피탈',
  'VCS_API_SCRAPER',
  'AS20210561',
  '나우아이비캐피탈',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 10 | 산업코드: 2 | 조성총액: 300.0억원',
  '2029-07-05',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20210561","mother_fund_id":"MF00000001","investment_character_code":"10","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"300.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.331Z"}',
  '2025-06-05T00:42:07.331Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 3263: 나우 소부장펀드 1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20070002',
  '나우 소부장펀드 1호',
  28000000000,
  '2022-09-20',
  'Active',
  '나우아이비캐피탈',
  'VCS_API_SCRAPER',
  'AS20221073',
  '나우아이비캐피탈',
  '투자분야: 일반 | 세부분야: 부품소재 | 투자성격코드: 03 | 산업코드: 1 | 조성총액: 280.0억원',
  '2030-09-19',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20221073","mother_fund_id":"MF00000001","investment_character_code":"03","industry_code":"1","investment_field_type":"일반","investment_field_detail_type":"부품소재","formation_total_amount":"280.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.331Z"}',
  '2025-06-05T00:42:07.331Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 3264: 나눔엔젤스-대일펀드 2호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20190142',
  '나눔엔젤스-대일펀드 2호',
  2060000000,
  '2021-06-03',
  'Active',
  '나눔엔젤스',
  'VCS_API_SCRAPER',
  'AS20210449',
  '나눔엔젤스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 02 | 산업코드: 2 | 조성총액: 20.6억원',
  '2029-06-02',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20210449","mother_fund_id":"","investment_character_code":"02","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"20.6","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.331Z"}',
  '2025-06-05T00:42:07.331Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 3265: 나눔엔젤스 AI펀드 3호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20190142',
  '나눔엔젤스 AI펀드 3호',
  110000000,
  '2022-01-14',
  'Active',
  '나눔엔젤스',
  'VCS_API_SCRAPER',
  'AS20220054',
  '나눔엔젤스',
  '산업코드: 8 | 조성총액: 1.1억원',
  '2030-01-13',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20220054","mother_fund_id":"","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"1.1","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.331Z"}',
  '2025-06-05T00:42:07.331Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 3266: 나눔엔젤스 4차산업 펀드1호 
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20190142',
  '나눔엔젤스 4차산업 펀드1호 ',
  160000000,
  '2020-10-06',
  'Active',
  '나눔엔젤스',
  'VCS_API_SCRAPER',
  'AS20200546',
  '나눔엔젤스',
  '산업코드: 2 | 조성총액: 1.6억원',
  '2028-10-05',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20200546","mother_fund_id":"","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"1.6","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.331Z"}',
  '2025-06-05T00:42:07.331Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 3267: 끌림헬스케어투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200094',
  '끌림헬스케어투자조합',
  990000000,
  '2021-09-09',
  'Active',
  '끌림벤처스',
  'VCS_API_SCRAPER',
  'AS20210819',
  '끌림벤처스',
  '산업코드: 4 | 조성총액: 9.9억원',
  '2026-09-08',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20210819","mother_fund_id":"","investment_character_code":"","industry_code":"4","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"9.9","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.331Z"}',
  '2025-06-05T00:42:07.331Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 3268: 끌림플랫폼투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200094',
  '끌림플랫폼투자조합',
  680000000,
  '2021-12-07',
  'Active',
  '끌림벤처스',
  'VCS_API_SCRAPER',
  'AS20211216',
  '끌림벤처스',
  '산업코드: 2 | 조성총액: 6.8억원',
  '2026-12-06',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20211216","mother_fund_id":"","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"6.8","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.331Z"}',
  '2025-06-05T00:42:07.331Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 3269: 끌림에어스투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200094',
  '끌림에어스투자조합',
  5560000000,
  '2020-11-18',
  'Active',
  '끌림벤처스',
  'VCS_API_SCRAPER',
  'AS20200662',
  '끌림벤처스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 25 | 산업코드: 2 | 조성총액: 55.6억원',
  '2025-11-17',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20200662","mother_fund_id":"","investment_character_code":"25","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"55.6","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.331Z"}',
  '2025-06-05T00:42:07.331Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 3270: 끌림디지털헬스케어투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200094',
  '끌림디지털헬스케어투자조합',
  1670000000,
  '2021-11-26',
  'Active',
  '끌림벤처스',
  'VCS_API_SCRAPER',
  'AS20211189',
  '끌림벤처스',
  '산업코드: 2 | 조성총액: 16.7억원',
  '2026-11-25',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20211189","mother_fund_id":"","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"16.7","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.331Z"}',
  '2025-06-05T00:42:07.331Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 3271: 끌림넥스트투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200094',
  '끌림넥스트투자조합',
  7800000000,
  '2022-01-26',
  'Active',
  '끌림벤처스',
  'VCS_API_SCRAPER',
  'AS20220094',
  '끌림벤처스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 20 | 산업코드: 2 | 조성총액: 78.0억원',
  '2027-01-26',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20220094","mother_fund_id":"","investment_character_code":"20","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"78.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.331Z"}',
  '2025-06-05T00:42:07.331Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 3272: 끌림IBKC메디컬투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200094',
  '끌림IBKC메디컬투자조합',
  3940000000,
  '2021-01-28',
  'Active',
  '끌림벤처스',
  'VCS_API_SCRAPER',
  'AS20210087',
  '끌림벤처스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 25 | 산업코드: 2 | 조성총액: 39.4억원',
  '2026-01-27',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20210087","mother_fund_id":"","investment_character_code":"25","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"39.4","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.331Z"}',
  '2025-06-05T00:42:07.331Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 3273: 끌림ESG투자조합제2호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200094',
  '끌림ESG투자조합제2호',
  1500000000,
  '2021-11-08',
  'Active',
  '끌림벤처스',
  'VCS_API_SCRAPER',
  'AS20211094',
  '끌림벤처스',
  '산업코드: 2 | 조성총액: 15.0억원',
  '2029-11-07',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20211094","mother_fund_id":"","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"15.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.332Z"}',
  '2025-06-05T00:42:07.332Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 3274: 끌림ESG투자조합제1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200094',
  '끌림ESG투자조합제1호',
  3000000000,
  '2021-11-03',
  'Active',
  '끌림벤처스',
  'VCS_API_SCRAPER',
  'AS20211080',
  '끌림벤처스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 02 | 산업코드: 2 | 조성총액: 30.0억원',
  '2029-11-02',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20211080","mother_fund_id":"","investment_character_code":"02","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"30.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.332Z"}',
  '2025-06-05T00:42:07.332Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 3275: 김기사랩 투자조합2호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20190068',
  '김기사랩 투자조합2호',
  4550000000,
  '2020-04-07',
  'Active',
  '김기사랩',
  'VCS_API_SCRAPER',
  'AS20200156',
  '김기사랩',
  '산업코드: 8 | 조성총액: 45.5억원',
  '2028-04-06',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20200156","mother_fund_id":"","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"45.5","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.332Z"}',
  '2025-06-05T00:42:07.332Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 3276: 김기사랩 투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20190068',
  '김기사랩 투자조합1호',
  650000000,
  '2019-05-29',
  'Active',
  '김기사랩',
  'VCS_API_SCRAPER',
  'AS20190201',
  '김기사랩',
  '산업코드: 9 | 조성총액: 6.5억원',
  '2027-05-31',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20190201","mother_fund_id":"","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"6.5","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.332Z"}',
  '2025-06-05T00:42:07.332Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 3277: 김기사랩 투자조합 3호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20190068',
  '김기사랩 투자조합 3호',
  14430000000,
  '2022-05-04',
  'Active',
  '김기사랩',
  'VCS_API_SCRAPER',
  'AS20220434',
  '김기사랩',
  '산업코드: 2 | 조성총액: 144.3억원',
  '2030-05-03',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20220434","mother_fund_id":"","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"144.3","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.332Z"}',
  '2025-06-05T00:42:07.332Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 3278: 기술혁신전문G&G펀드1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP19970007',
  '기술혁신전문G&G펀드1호',
  68000000000,
  '2020-10-19',
  'Active',
  '포스코기술투자',
  'VCS_API_SCRAPER',
  'AS20200588',
  '포스코기술투자',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 09 | 산업코드: 5 | 조성총액: 680.0억원',
  '2028-10-18',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20200588","mother_fund_id":"","investment_character_code":"09","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"680.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.332Z"}',
  '2025-06-05T00:42:07.332Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 3279: 기술과가치청권펀드1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20190147',
  '기술과가치청권펀드1호',
  100000000,
  '2022-08-22',
  'Active',
  '기술과가치',
  'VCS_API_SCRAPER',
  'AS20220919',
  '기술과가치',
  '산업코드: 8 | 조성총액: 1.0억원',
  '2027-08-31',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20220919","mother_fund_id":"","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"1.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.332Z"}',
  '2025-06-05T00:42:07.332Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 3280: 기술과가치어미새펀드1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20190147',
  '기술과가치어미새펀드1호',
  210000000,
  '2022-08-31',
  'Active',
  '기술과가치',
  'VCS_API_SCRAPER',
  'AS20220995',
  '기술과가치',
  '산업코드: 8 | 조성총액: 2.1억원',
  '2027-09-30',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20220995","mother_fund_id":"","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"2.1","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.332Z"}',
  '2025-06-05T00:42:07.332Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 3281: 글로벌푸드테크투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20210373',
  '글로벌푸드테크투자조합',
  6420000000,
  '2024-07-02',
  'Active',
  '컴파벤처스',
  'VCS_API_SCRAPER',
  'AS20240590',
  '컴파벤처스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 25 | 산업코드: 2 | 조성총액: 64.2억원',
  '2029-07-01',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20240590","mother_fund_id":"","investment_character_code":"25","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"64.2","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.332Z"}',
  '2025-06-05T00:42:07.332Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 3282: 글로벌성장지원투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP19860003',
  '글로벌성장지원투자조합',
  61000000000,
  '2015-07-23',
  'Active',
  '엠벤처투자',
  'VCS_API_SCRAPER',
  'AS20150030',
  '엠벤처투자',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 15 | 산업코드: 1 | 조성총액: 610.0억원',
  '2025-12-21',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20150030","mother_fund_id":"MF00000001","investment_character_code":"15","industry_code":"1","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"610.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.332Z"}',
  '2025-06-05T00:42:07.332Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 3283: 글로벌머티리얼리더투자조합제1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20210373',
  '글로벌머티리얼리더투자조합제1호',
  5010000000,
  '2022-12-21',
  'Active',
  '컴파벤처스',
  'VCS_API_SCRAPER',
  'AS20221523',
  '컴파벤처스',
  '투자분야: 일반 | 세부분야: 부품소재 | 투자성격코드: 03 | 산업코드: 4 | 조성총액: 50.1억원',
  '2027-12-20',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20221523","mother_fund_id":"","investment_character_code":"03","industry_code":"4","investment_field_type":"일반","investment_field_detail_type":"부품소재","formation_total_amount":"50.1","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.332Z"}',
  '2025-06-05T00:42:07.332Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 3284: 글로벌게이트웨이펀드IV
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20150020',
  '글로벌게이트웨이펀드IV',
  23000000000,
  '2024-02-06',
  'Active',
  '레드배지퍼시픽',
  'VCS_API_SCRAPER',
  'AS20240083',
  '레드배지퍼시픽',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 06 | 산업코드: 8 | 조성총액: 230.0억원',
  '2032-02-05',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20240083","mother_fund_id":"","investment_character_code":"06","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"230.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.332Z"}',
  '2025-06-05T00:42:07.332Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 3285: 글로벌ICT융합펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20120007',
  '글로벌ICT융합펀드',
  25000000000,
  '2015-07-20',
  'Active',
  '디에스씨인베스트먼트',
  'VCS_API_SCRAPER',
  'AS20150100',
  '디에스씨인베스트먼트',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 15 | 산업코드: 5 | 조성총액: 250.0억원',
  '2025-07-19',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20150100","mother_fund_id":"MF00000001","investment_character_code":"15","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"250.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.332Z"}',
  '2025-06-05T00:42:07.332Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 3286: 글로벌 혁신성장 펀드Ⅱ
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20000044',
  '글로벌 혁신성장 펀드Ⅱ',
  52000000000,
  '2022-01-14',
  'Active',
  '씨제이인베스트먼트',
  'VCS_API_SCRAPER',
  'AS20220061',
  '씨제이인베스트먼트',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 06 | 산업코드: 2 | 조성총액: 520.0억원',
  '2030-01-13',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20220061","mother_fund_id":"","investment_character_code":"06","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"520.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.332Z"}',
  '2025-06-05T00:42:07.332Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 3287: 글로벌 혁신성장 펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20000044',
  '글로벌 혁신성장 펀드',
  69200000000,
  '2019-01-18',
  'Active',
  '씨제이인베스트먼트',
  'VCS_API_SCRAPER',
  'AS20190027',
  '씨제이인베스트먼트',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 01 | 산업코드: 8 | 조성총액: 692.0억원',
  '2027-01-17',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20190027","mother_fund_id":"","investment_character_code":"01","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"692.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.332Z"}',
  '2025-06-05T00:42:07.332Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 3288: 글로벌 혁신 RNA 신약 벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20210709',
  '글로벌 혁신 RNA 신약 벤처투자조합',
  11730000000,
  '2022-01-18',
  'Active',
  '에이온인베스트먼트',
  'VCS_API_SCRAPER',
  'AS20220068',
  '에이온인베스트먼트',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 25 | 산업코드: 5 | 조성총액: 117.3억원',
  '2027-01-17',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20220068","mother_fund_id":"","investment_character_code":"25","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"117.3","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.332Z"}',
  '2025-06-05T00:42:07.332Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 3289: 글로벌 첨단에듀케이션 성장지원 1호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200270',
  '글로벌 첨단에듀케이션 성장지원 1호 투자조합',
  320000000,
  '2023-08-25',
  'Active',
  '아이엑스브이',
  'VCS_API_SCRAPER',
  'AS20230716',
  '아이엑스브이',
  '산업코드: 8 | 조성총액: 3.2억원',
  '2028-08-24',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20230716","mother_fund_id":"","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"3.2","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.332Z"}',
  '2025-06-05T00:42:07.332Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 3290: 글로벌 성장 SV 1호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200126',
  '글로벌 성장 SV 1호 개인투자조합',
  1860000000,
  '2023-11-07',
  'Active',
  '씨앤벤처파트너스',
  'VCS_API_SCRAPER',
  'AS20231025',
  '씨앤벤처파트너스',
  '산업코드: 3 | 조성총액: 18.6억원',
  '2030-11-06',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20231025","mother_fund_id":"","investment_character_code":"","industry_code":"3","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"18.6","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.332Z"}',
  '2025-06-05T00:42:07.332Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 3291: 글로벌 게이트웨이 펀드Ⅰ
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP19860008',
  '글로벌 게이트웨이 펀드Ⅰ',
  30000000000,
  '2016-07-26',
  'Active',
  '에스비아이인베스트먼트',
  'VCS_API_SCRAPER',
  'AS20160010',
  '에스비아이인베스트먼트',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 01 | 산업코드: 2 | 조성총액: 300.0억원',
  '2025-07-25',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20160010","mother_fund_id":"","investment_character_code":"01","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"300.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.332Z"}',
  '2025-06-05T00:42:07.332Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 3292: 글로벌 게이트웨이 펀드 III
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20150020',
  '글로벌 게이트웨이 펀드 III',
  20000000000,
  '2020-12-08',
  'Active',
  '레드배지퍼시픽',
  'VCS_API_SCRAPER',
  'AS20200754',
  '레드배지퍼시픽',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 02 | 산업코드: 8 | 조성총액: 200.0억원',
  '2026-12-07',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20200754","mother_fund_id":"","investment_character_code":"02","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"200.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.332Z"}',
  '2025-06-05T00:42:07.332Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 3293: 글로벌 게이트웨이 엑세스V
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20150020',
  '글로벌 게이트웨이 엑세스V',
  5380000000,
  '2025-03-24',
  'Active',
  '레드배지퍼시픽',
  'VCS_API_SCRAPER',
  'AS20250214',
  '레드배지퍼시픽',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 06 | 산업코드: 8 | 조성총액: 53.8억원',
  '2030-03-23',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20250214","mother_fund_id":"","investment_character_code":"06","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"53.8","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.332Z"}',
  '2025-06-05T00:42:07.332Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 3294: 글로넷벤처 바이오 전문투자조합 제2호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20190428',
  '글로넷벤처 바이오 전문투자조합 제2호',
  2000000000,
  '2024-06-18',
  'Active',
  '글로넷벤처파트너스',
  'VCS_API_SCRAPER',
  'AS20240546',
  '글로넷벤처파트너스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 04 | 산업코드: 4 | 조성총액: 20.0억원',
  '2029-06-17',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20240546","mother_fund_id":"","investment_character_code":"04","industry_code":"4","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"20.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.332Z"}',
  '2025-06-05T00:42:07.332Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 3295: 글로넷벤처 바이오 전문투자조합 제1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20190428',
  '글로넷벤처 바이오 전문투자조합 제1호',
  2000000000,
  '2021-01-05',
  'Active',
  '글로넷벤처파트너스',
  'VCS_API_SCRAPER',
  'AS20210033',
  '글로넷벤처파트너스',
  '투자분야: 일반 | 세부분야: 바이오 | 투자성격코드: 04 | 산업코드: 4 | 조성총액: 20.0억원',
  '2026-01-04',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20210033","mother_fund_id":"","investment_character_code":"04","industry_code":"4","investment_field_type":"일반","investment_field_detail_type":"바이오","formation_total_amount":"20.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.332Z"}',
  '2025-06-05T00:42:07.332Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 3296: 그리트 투자조합6호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200462',
  '그리트 투자조합6호',
  320000000,
  '2023-06-14',
  'Active',
  '그리트벤처스',
  'VCS_API_SCRAPER',
  'AS20230476',
  '그리트벤처스',
  '산업코드: 9 | 조성총액: 3.2억원',
  '2028-06-13',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20230476","mother_fund_id":"","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"3.2","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.332Z"}',
  '2025-06-05T00:42:07.332Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 3297: 그리트 투자조합5호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200462',
  '그리트 투자조합5호',
  540000000,
  '2022-07-06',
  'Active',
  '그리트벤처스',
  'VCS_API_SCRAPER',
  'AS20220726',
  '그리트벤처스',
  '산업코드: 5 | 조성총액: 5.4억원',
  '2027-07-05',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20220726","mother_fund_id":"","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"5.4","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.332Z"}',
  '2025-06-05T00:42:07.332Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 3298: 그리트 투자조합3호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200462',
  '그리트 투자조합3호',
  1450000000,
  '2022-07-25',
  'Active',
  '그리트벤처스',
  'VCS_API_SCRAPER',
  'AS20220814',
  '그리트벤처스',
  '산업코드: 8 | 조성총액: 14.5억원',
  '2027-07-24',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20220814","mother_fund_id":"","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"14.5","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.332Z"}',
  '2025-06-05T00:42:07.332Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 3299: 그리트 투자조합2호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200462',
  '그리트 투자조합2호',
  950000000,
  '2021-11-08',
  'Active',
  '그리트벤처스',
  'VCS_API_SCRAPER',
  'AS20211097',
  '그리트벤처스',
  '산업코드: 2 | 조성총액: 9.5억원',
  '2026-11-07',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20211097","mother_fund_id":"","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"9.5","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.332Z"}',
  '2025-06-05T00:42:07.332Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 3300: 그리트 투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200462',
  '그리트 투자조합1호',
  570000000,
  '2021-11-17',
  'Active',
  '그리트벤처스',
  'VCS_API_SCRAPER',
  'AS20211131',
  '그리트벤처스',
  '산업코드: 5 | 조성총액: 5.7억원',
  '2026-11-16',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20211131","mother_fund_id":"","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"5.7","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.332Z"}',
  '2025-06-05T00:42:07.332Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Exact Batch 66 completed! 50 fund records processed.
-- Progress: 3300/3689 total records

