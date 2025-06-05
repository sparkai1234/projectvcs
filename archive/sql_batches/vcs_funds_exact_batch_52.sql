-- VCS Fund EXACT UPSERT Batch 52/74 (Records 2551-2600)
-- EXACT: Uses actual fund_table schema columns
-- Generated from VCS API Scraper fund data
-- Generated at: 2025-06-05T00:42:07.274Z
-- Schema: Exact match to actual fund_table structure

-- EXACT FUND DATA (UPSERT - Safe for Duplicates)
-- Processing 50 fund records
-- Will INSERT new records or UPDATE existing ones

-- Record 2551: 블랙펄프롭테크펀드I
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20220039',
  '블랙펄프롭테크펀드I',
  40500000000,
  '2022-05-27',
  'Active',
  '블랙펄벤처스',
  'VCS_API_SCRAPER',
  'AS20220604',
  '블랙펄벤처스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 16 | 산업코드: 2 | 조성총액: 405.0억원',
  '2027-05-26',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20220604","mother_fund_id":"","investment_character_code":"16","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"405.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.274Z"}',
  '2025-06-05T00:42:07.274Z'
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

-- Record 2552: 블랙펄세컨더리펀드III
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20220039',
  '블랙펄세컨더리펀드III',
  6090000000,
  '2022-05-03',
  'Active',
  '블랙펄벤처스',
  'VCS_API_SCRAPER',
  'AS20220507',
  '블랙펄벤처스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 16 | 산업코드: 1 | 조성총액: 60.9억원',
  '2027-05-02',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20220507","mother_fund_id":"","investment_character_code":"16","industry_code":"1","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"60.9","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.274Z"}',
  '2025-06-05T00:42:07.274Z'
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

-- Record 2553: 블랙펄세컨더리펀드II
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20220039',
  '블랙펄세컨더리펀드II',
  4700000000,
  '2022-03-14',
  'Active',
  '블랙펄벤처스',
  'VCS_API_SCRAPER',
  'AS20220291',
  '블랙펄벤처스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 16 | 산업코드: 2 | 조성총액: 47.0억원',
  '2027-03-13',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20220291","mother_fund_id":"","investment_character_code":"16","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"47.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.274Z"}',
  '2025-06-05T00:42:07.274Z'
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

-- Record 2554: 블랙펄세컨더리펀드I
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20220039',
  '블랙펄세컨더리펀드I',
  4600000000,
  '2022-02-11',
  'Active',
  '블랙펄벤처스',
  'VCS_API_SCRAPER',
  'AS20220135',
  '블랙펄벤처스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 16 | 산업코드: 6 | 조성총액: 46.0억원',
  '2027-02-10',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20220135","mother_fund_id":"","investment_character_code":"16","industry_code":"6","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"46.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.274Z"}',
  '2025-06-05T00:42:07.274Z'
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

-- Record 2555: 블랙마운틴트랜스링크그리너지프로젝트펀드1
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200513',
  '블랙마운틴트랜스링크그리너지프로젝트펀드1',
  4650000000,
  '2023-03-21',
  'Active',
  '트랜스링크인베스트먼트',
  'VCS_API_SCRAPER',
  'AS20230220',
  '트랜스링크인베스트먼트',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 25 | 산업코드: 3 | 조성총액: 46.5억원',
  '2031-03-20',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20230220","mother_fund_id":"","investment_character_code":"25","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"46.5","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.274Z"}',
  '2025-06-05T00:42:07.275Z'
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

-- Record 2556: 브이플랫폼 에어로스페이스 밸류업펀드 1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20180006',
  '브이플랫폼 에어로스페이스 밸류업펀드 1호',
  4300000000,
  '2021-09-09',
  'Active',
  '브이플랫폼인베스트먼트',
  'VCS_API_SCRAPER',
  'AS20210839',
  '브이플랫폼인베스트먼트',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 03 | 산업코드: 3 | 조성총액: 43.0억원',
  '2028-09-08',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20210839","mother_fund_id":"","investment_character_code":"03","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"43.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.275Z"}',
  '2025-06-05T00:42:07.275Z'
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

-- Record 2557: 브이플랫폼 모빌리티 밸류업 펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20180006',
  '브이플랫폼 모빌리티 밸류업 펀드',
  3300000000,
  '2023-07-17',
  'Active',
  '브이플랫폼인베스트먼트',
  'VCS_API_SCRAPER',
  'AS20230608',
  '브이플랫폼인베스트먼트',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 10 | 산업코드: 3 | 조성총액: 33.0억원',
  '2028-07-16',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20230608","mother_fund_id":"","investment_character_code":"10","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"33.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.275Z"}',
  '2025-06-05T00:42:07.275Z'
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

-- Record 2558: 브이플랫폼 노블리스 오블리제 벤처펀드 2호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20180006',
  '브이플랫폼 노블리스 오블리제 벤처펀드 2호',
  7730000000,
  '2021-04-14',
  'Active',
  '브이플랫폼인베스트먼트',
  'VCS_API_SCRAPER',
  'AS20210297',
  '브이플랫폼인베스트먼트',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 03 | 산업코드: 1 | 조성총액: 77.3억원',
  '2028-04-13',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20210297","mother_fund_id":"","investment_character_code":"03","industry_code":"1","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"77.3","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.275Z"}',
  '2025-06-05T00:42:07.275Z'
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

-- Record 2559: 브이플랫폼 노블리스 오블리제 벤처펀드 1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20180006',
  '브이플랫폼 노블리스 오블리제 벤처펀드 1호',
  6450000000,
  '2020-09-08',
  'Active',
  '브이플랫폼인베스트먼트',
  'VCS_API_SCRAPER',
  'AS20200486',
  '브이플랫폼인베스트먼트',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 01 | 산업코드: 1 | 조성총액: 64.5억원',
  '2027-09-07',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20200486","mother_fund_id":"","investment_character_code":"01","industry_code":"1","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"64.5","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.275Z"}',
  '2025-06-05T00:42:07.275Z'
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

-- Record 2560: 브이이피 반도체성장 2호 G-펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200061',
  '브이이피 반도체성장 2호 G-펀드',
  30000000000,
  '2024-12-24',
  'Active',
  '비전에쿼티파트너스',
  'VCS_API_SCRAPER',
  'AS20241433',
  '비전에쿼티파트너스',
  '투자분야: 일반 | 세부분야: 부품소재 | 투자성격코드: 03 | 산업코드: 9 | 조성총액: 300.0억원',
  '2032-12-23',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20241433","mother_fund_id":"","investment_character_code":"03","industry_code":"9","investment_field_type":"일반","investment_field_detail_type":"부품소재","formation_total_amount":"300.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.275Z"}',
  '2025-06-05T00:42:07.275Z'
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

-- Record 2561: 브이이피 미학지능SR펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200061',
  '브이이피 미학지능SR펀드',
  52020000000,
  '2023-08-17',
  'Active',
  '비전에쿼티파트너스',
  'VCS_API_SCRAPER',
  'AS20230736',
  '비전에쿼티파트너스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 25 | 산업코드: 8 | 조성총액: 520.2억원',
  '2028-08-16',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20230736","mother_fund_id":"","investment_character_code":"25","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"520.2","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.275Z"}',
  '2025-06-05T00:42:07.275Z'
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

-- Record 2562: 브이이피 미학지능3호펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200061',
  '브이이피 미학지능3호펀드',
  10950000000,
  '2024-08-21',
  'Active',
  '비전에쿼티파트너스',
  'VCS_API_SCRAPER',
  'AS20240803',
  '비전에쿼티파트너스',
  '투자분야: 일반 | 세부분야: 일반 기타 | 투자성격코드: 25 | 산업코드: 4 | 조성총액: 109.5억원',
  '2029-08-20',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20240803","mother_fund_id":"","investment_character_code":"25","industry_code":"4","investment_field_type":"일반","investment_field_detail_type":"일반 기타","formation_total_amount":"109.5","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.275Z"}',
  '2025-06-05T00:42:07.275Z'
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

-- Record 2563: 브이이안 제1호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20170045',
  '브이이안 제1호 개인투자조합',
  770000000,
  '2021-12-10',
  'Active',
  '벤처필드',
  'VCS_API_SCRAPER',
  'AS20211248',
  '벤처필드',
  '산업코드: 2 | 조성총액: 7.7억원',
  '2026-12-09',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20211248","mother_fund_id":"","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"7.7","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.275Z"}',
  '2025-06-05T00:42:07.275Z'
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

-- Record 2564: 브이엔에이엠 에스사이언스 제1호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20170045',
  '브이엔에이엠 에스사이언스 제1호 개인투자조합',
  530000000,
  '2021-06-04',
  'Active',
  '벤처필드',
  'VCS_API_SCRAPER',
  'AS20210434',
  '벤처필드',
  '산업코드: 8 | 조성총액: 5.3억원',
  '2026-06-03',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20210434","mother_fund_id":"","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"5.3","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.275Z"}',
  '2025-06-05T00:42:07.275Z'
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

-- Record 2565: 브이에이비켐 투자조합 2호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20170045',
  '브이에이비켐 투자조합 2호',
  110000000,
  '2024-01-18',
  'Active',
  '벤처필드',
  'VCS_API_SCRAPER',
  'AS20240023',
  '벤처필드',
  '산업코드: 9 | 조성총액: 1.1억원',
  '2029-01-17',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20240023","mother_fund_id":"","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"1.1","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.275Z"}',
  '2025-06-05T00:42:07.275Z'
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

-- Record 2566: 브이에이비켐 제 1호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20170045',
  '브이에이비켐 제 1호 개인투자조합',
  990000000,
  '2021-10-15',
  'Active',
  '벤처필드',
  'VCS_API_SCRAPER',
  'AS20210984',
  '벤처필드',
  '산업코드: 5 | 조성총액: 9.9억원',
  '2026-10-14',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20210984","mother_fund_id":"","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"9.9","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.275Z"}',
  '2025-06-05T00:42:07.275Z'
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

-- Record 2567: 브이에스스타개인투자조합7호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20100016',
  '브이에스스타개인투자조합7호',
  590000000,
  '2022-12-07',
  'Active',
  '벤처스퀘어',
  'VCS_API_SCRAPER',
  'AS20221357',
  '벤처스퀘어',
  '산업코드: 8 | 조성총액: 5.9억원',
  '2027-12-06',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20221357","mother_fund_id":"","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"5.9","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.275Z"}',
  '2025-06-05T00:42:07.275Z'
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

-- Record 2568: 브이에스-케이오씨피 프로젝트 투자조합 4호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200200',
  '브이에스-케이오씨피 프로젝트 투자조합 4호',
  1620000000,
  '2022-03-28',
  'Active',
  '케이오씨파트너스',
  'VCS_API_SCRAPER',
  'AS20220258',
  '케이오씨파트너스',
  '산업코드: 2 | 조성총액: 16.2억원',
  '2027-03-27',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20220258","mother_fund_id":"","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"16.2","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.275Z"}',
  '2025-06-05T00:42:07.275Z'
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

-- Record 2569: 브이에스-케이오씨피 프로젝트 투자조합 3호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200200',
  '브이에스-케이오씨피 프로젝트 투자조합 3호',
  980000000,
  '2021-10-27',
  'Active',
  '케이오씨파트너스',
  'VCS_API_SCRAPER',
  'AS20211017',
  '케이오씨파트너스',
  '산업코드: 8 | 조성총액: 9.8억원',
  '2026-10-26',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20211017","mother_fund_id":"","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"9.8","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.275Z"}',
  '2025-06-05T00:42:07.275Z'
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

-- Record 2570: 브이에스-케이오씨피 프로젝트 투자조합 2호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200200',
  '브이에스-케이오씨피 프로젝트 투자조합 2호',
  900000000,
  '2021-06-18',
  'Active',
  '케이오씨파트너스',
  'VCS_API_SCRAPER',
  'AS20210460',
  '케이오씨파트너스',
  '산업코드: 8 | 조성총액: 9.0억원',
  '2029-06-17',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20210460","mother_fund_id":"","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"9.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.275Z"}',
  '2025-06-05T00:42:07.275Z'
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

-- Record 2571: 브이에스 스타 개인투자조합3호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20100016',
  '브이에스 스타 개인투자조합3호',
  530000000,
  '2019-12-13',
  'Active',
  '벤처스퀘어',
  'VCS_API_SCRAPER',
  'AS20190580',
  '벤처스퀘어',
  '산업코드: 8 | 조성총액: 5.3억원',
  '2026-12-13',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20190580","mother_fund_id":"","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"5.3","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.275Z"}',
  '2025-06-05T00:42:07.275Z'
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

-- Record 2572: 브이에스 스타 개인투자조합 9호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20100016',
  '브이에스 스타 개인투자조합 9호',
  370000000,
  '2023-12-26',
  'Active',
  '벤처스퀘어',
  'VCS_API_SCRAPER',
  'AS20231297',
  '벤처스퀘어',
  '산업코드: 2 | 조성총액: 3.7억원',
  '2028-12-25',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20231297","mother_fund_id":"","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"3.7","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.275Z"}',
  '2025-06-05T00:42:07.275Z'
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

-- Record 2573: 브이에스 스타 개인투자조합 8호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20100016',
  '브이에스 스타 개인투자조합 8호',
  500000000,
  '2023-07-10',
  'Active',
  '벤처스퀘어',
  'VCS_API_SCRAPER',
  'AS20230565',
  '벤처스퀘어',
  '산업코드: 3 | 조성총액: 5.0억원',
  '2028-07-09',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20230565","mother_fund_id":"","investment_character_code":"","industry_code":"3","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"5.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.275Z"}',
  '2025-06-05T00:42:07.275Z'
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

-- Record 2574: 브이에스 스타 개인투자조합 6호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20100016',
  '브이에스 스타 개인투자조합 6호',
  1070000000,
  '2022-03-25',
  'Active',
  '벤처스퀘어',
  'VCS_API_SCRAPER',
  'AS20220282',
  '벤처스퀘어',
  '산업코드: 3 | 조성총액: 10.7억원',
  '2027-03-24',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20220282","mother_fund_id":"","investment_character_code":"","industry_code":"3","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"10.7","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.275Z"}',
  '2025-06-05T00:42:07.275Z'
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

-- Record 2575: 브이에스 스타 개인투자조합 5호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20100016',
  '브이에스 스타 개인투자조합 5호',
  990000000,
  '2021-08-20',
  'Active',
  '벤처스퀘어',
  'VCS_API_SCRAPER',
  'AS20210736',
  '벤처스퀘어',
  '산업코드: 8 | 조성총액: 9.9억원',
  '2026-08-19',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20210736","mother_fund_id":"","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"9.9","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.275Z"}',
  '2025-06-05T00:42:07.275Z'
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

-- Record 2576: 브이에스 스타 개인투자조합 4호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20100016',
  '브이에스 스타 개인투자조합 4호',
  920000000,
  '2020-10-16',
  'Active',
  '벤처스퀘어',
  'VCS_API_SCRAPER',
  'AS20200582',
  '벤처스퀘어',
  '산업코드: 2 | 조성총액: 9.2억원',
  '2025-10-15',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20200582","mother_fund_id":"","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"9.2","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.275Z"}',
  '2025-06-05T00:42:07.275Z'
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

-- Record 2577: 브이에스 스타 개인투자조합 2호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20100016',
  '브이에스 스타 개인투자조합 2호',
  740000000,
  '2019-10-30',
  'Active',
  '벤처스퀘어',
  'VCS_API_SCRAPER',
  'AS20190472',
  '벤처스퀘어',
  '산업코드: 2 | 조성총액: 7.4억원',
  '2025-10-29',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20190472","mother_fund_id":"","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"7.4","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.275Z"}',
  '2025-06-05T00:42:07.275Z'
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

-- Record 2578: 브이에스 경기혁신투자조합2호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20150037',
  '브이에스 경기혁신투자조합2호',
  6740000000,
  '2024-12-18',
  'Active',
  '경기창조경제혁신센터',
  'VCS_API_SCRAPER',
  'AS20241380',
  '경기창조경제혁신센터',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 09 | 산업코드: 3 | 조성총액: 67.4억원',
  '2032-12-17',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20241380","mother_fund_id":"MF00000001","investment_character_code":"09","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"67.4","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.275Z"}',
  '2025-06-05T00:42:07.275Z'
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

-- Record 2579: 브이에스 경기혁신투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20150037',
  '브이에스 경기혁신투자조합',
  5100000000,
  '2022-10-21',
  'Active',
  '경기창조경제혁신센터',
  'VCS_API_SCRAPER',
  'AS20221180',
  '경기창조경제혁신센터',
  '산업코드: 2 | 조성총액: 51.0억원',
  '2029-10-20',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20221180","mother_fund_id":"MF00000001","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"51.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.275Z"}',
  '2025-06-05T00:42:07.275Z'
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

-- Record 2580: 브이에스 경기혁신 유니콘브릿지조합1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20150037',
  '브이에스 경기혁신 유니콘브릿지조합1호',
  160000000,
  '2023-08-29',
  'Active',
  '경기창조경제혁신센터',
  'VCS_API_SCRAPER',
  'AS20230748',
  '경기창조경제혁신센터',
  '산업코드: 3 | 조성총액: 1.6억원',
  '2028-08-28',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20230748","mother_fund_id":"","investment_character_code":"","industry_code":"3","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"1.6","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.275Z"}',
  '2025-06-05T00:42:07.275Z'
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

-- Record 2581: 브이뉴통 제2호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20170045',
  '브이뉴통 제2호 개인투자조합',
  200000000,
  '2022-11-30',
  'Active',
  '벤처필드',
  'VCS_API_SCRAPER',
  'AS20221339',
  '벤처필드',
  '산업코드: 9 | 조성총액: 2.0억원',
  '2027-11-29',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20221339","mother_fund_id":"","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"2.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.275Z"}',
  '2025-06-05T00:42:07.275Z'
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

-- Record 2582: 브이뉴통 제1호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20170045',
  '브이뉴통 제1호 개인투자조합',
  360000000,
  '2021-11-22',
  'Active',
  '벤처필드',
  'VCS_API_SCRAPER',
  'AS20211157',
  '벤처필드',
  '산업코드: 8 | 조성총액: 3.6억원',
  '2026-11-21',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20211157","mother_fund_id":"","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"3.6","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.275Z"}',
  '2025-06-05T00:42:07.275Z'
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

-- Record 2583: 브이뉴롤메드 제1호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20170045',
  '브이뉴롤메드 제1호 개인투자조합',
  330000000,
  '2021-11-25',
  'Active',
  '벤처필드',
  'VCS_API_SCRAPER',
  'AS20211176',
  '벤처필드',
  '산업코드: 8 | 조성총액: 3.3억원',
  '2026-11-24',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20211176","mother_fund_id":"","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"3.3","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.275Z"}',
  '2025-06-05T00:42:07.275Z'
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

-- Record 2584: 브이넥스탭 제1호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20170045',
  '브이넥스탭 제1호 개인투자조합',
  990000000,
  '2021-07-06',
  'Active',
  '벤처필드',
  'VCS_API_SCRAPER',
  'AS20210514',
  '벤처필드',
  '산업코드: 8 | 조성총액: 9.9억원',
  '2026-07-05',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20210514","mother_fund_id":"","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"9.9","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.275Z"}',
  '2025-06-05T00:42:07.275Z'
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

-- Record 2585: 브이공만세 제1호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20170045',
  '브이공만세 제1호 개인투자조합',
  300000000,
  '2021-09-29',
  'Active',
  '벤처필드',
  'VCS_API_SCRAPER',
  'AS20210907',
  '벤처필드',
  '산업코드: 2 | 조성총액: 3.0억원',
  '2026-09-28',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20210907","mother_fund_id":"","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"3.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.275Z"}',
  '2025-06-05T00:42:07.275Z'
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

-- Record 2586: 브릿지폴-수성 벤처투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20190277',
  '브릿지폴-수성 벤처투자조합 1호',
  12000000000,
  '2021-05-04',
  'Active',
  '프로텍벤처스',
  'VCS_API_SCRAPER',
  'AS20210357',
  '프로텍벤처스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 02 | 산업코드: 1 | 조성총액: 120.0억원',
  '2026-05-03',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20210357","mother_fund_id":"","investment_character_code":"02","industry_code":"1","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"120.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.275Z"}',
  '2025-06-05T00:42:07.275Z'
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

-- Record 2587: 브릿지폴-수성 벤처투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20230489',
  '브릿지폴-수성 벤처투자조합 1호',
  12000000000,
  '2021-05-04',
  'Active',
  '제이케이피파트너스',
  'VCS_API_SCRAPER',
  'AS20210357',
  '제이케이피파트너스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 02 | 산업코드: 1 | 조성총액: 120.0억원',
  '2026-05-03',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20210357","mother_fund_id":"","investment_character_code":"02","industry_code":"1","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"120.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.275Z"}',
  '2025-06-05T00:42:07.275Z'
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

-- Record 2588: 브릿지폴-나이스 벤처투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20190277',
  '브릿지폴-나이스 벤처투자조합 1호',
  5250000000,
  '2023-05-25',
  'Active',
  '프로텍벤처스',
  'VCS_API_SCRAPER',
  'AS20230421',
  '프로텍벤처스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 25 | 산업코드: 3 | 조성총액: 52.5억원',
  '2028-05-24',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20230421","mother_fund_id":"","investment_character_code":"25","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"52.5","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.275Z"}',
  '2025-06-05T00:42:07.275Z'
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

-- Record 2589: 브릿지폴-SBP 벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20190277',
  '브릿지폴-SBP 벤처투자조합',
  4220000000,
  '2021-04-21',
  'Active',
  '프로텍벤처스',
  'VCS_API_SCRAPER',
  'AS20210316',
  '프로텍벤처스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 25 | 산업코드: 6 | 조성총액: 42.2억원',
  '2026-04-20',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20210316","mother_fund_id":"","investment_character_code":"25","industry_code":"6","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"42.2","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.275Z"}',
  '2025-06-05T00:42:07.275Z'
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

-- Record 2590: 브릿지폴-SBP 벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20230489',
  '브릿지폴-SBP 벤처투자조합',
  4220000000,
  '2021-04-21',
  'Active',
  '제이케이피파트너스',
  'VCS_API_SCRAPER',
  'AS20210316',
  '제이케이피파트너스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 25 | 산업코드: 6 | 조성총액: 42.2억원',
  '2026-04-20',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20210316","mother_fund_id":"","investment_character_code":"25","industry_code":"6","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"42.2","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.275Z"}',
  '2025-06-05T00:42:07.275Z'
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

-- Record 2591: 브릿지폴 스마트 ICT 투자조합 2호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20190277',
  '브릿지폴 스마트 ICT 투자조합 2호',
  4000000000,
  '2022-08-23',
  'Active',
  '프로텍벤처스',
  'VCS_API_SCRAPER',
  'AS20220986',
  '프로텍벤처스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 25 | 산업코드: 3 | 조성총액: 40.0억원',
  '2027-08-22',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20220986","mother_fund_id":"","investment_character_code":"25","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"40.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.275Z"}',
  '2025-06-05T00:42:07.275Z'
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

-- Record 2592: 브릿지폴 스마트 ICT 투자조합 2호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20230489',
  '브릿지폴 스마트 ICT 투자조합 2호',
  4000000000,
  '2022-08-23',
  'Active',
  '제이케이피파트너스',
  'VCS_API_SCRAPER',
  'AS20220986',
  '제이케이피파트너스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 25 | 산업코드: 3 | 조성총액: 40.0억원',
  '2027-08-22',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20220986","mother_fund_id":"","investment_character_code":"25","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"40.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.275Z"}',
  '2025-06-05T00:42:07.275Z'
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

-- Record 2593: 브릿지폴 스마트 ICT 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20190277',
  '브릿지폴 스마트 ICT 투자조합',
  2000000000,
  '2020-06-30',
  'Active',
  '프로텍벤처스',
  'VCS_API_SCRAPER',
  'AS20200299',
  '프로텍벤처스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 01 | 산업코드: 4 | 조성총액: 20.0억원',
  '2025-06-29',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20200299","mother_fund_id":"","investment_character_code":"01","industry_code":"4","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"20.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.275Z"}',
  '2025-06-05T00:42:07.275Z'
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

-- Record 2594: 브릿지폴 스마트 ICT 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20230489',
  '브릿지폴 스마트 ICT 투자조합',
  2000000000,
  '2020-06-30',
  'Active',
  '제이케이피파트너스',
  'VCS_API_SCRAPER',
  'AS20200299',
  '제이케이피파트너스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 01 | 산업코드: 4 | 조성총액: 20.0억원',
  '2025-06-29',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20200299","mother_fund_id":"","investment_character_code":"01","industry_code":"4","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"20.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.275Z"}',
  '2025-06-05T00:42:07.275Z'
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

-- Record 2595: 브릿지스퀘어LOG+제주스타트업투자조합2호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200362',
  '브릿지스퀘어LOG+제주스타트업투자조합2호',
  110000000,
  '2022-02-22',
  'Active',
  '브릿지스퀘어',
  'VCS_API_SCRAPER',
  'AS20220165',
  '브릿지스퀘어',
  '산업코드: 2 | 조성총액: 1.1억원',
  '2027-02-20',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20220165","mother_fund_id":"","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"1.1","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.275Z"}',
  '2025-06-05T00:42:07.275Z'
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

-- Record 2596: 브릿지스퀘어LOG+스타트업투자조합5호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200362',
  '브릿지스퀘어LOG+스타트업투자조합5호',
  160000000,
  '2023-11-22',
  'Active',
  '브릿지스퀘어',
  'VCS_API_SCRAPER',
  'AS20231099',
  '브릿지스퀘어',
  '산업코드: 3 | 조성총액: 1.6억원',
  '2028-11-16',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20231099","mother_fund_id":"","investment_character_code":"","industry_code":"3","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"1.6","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.275Z"}',
  '2025-06-05T00:42:07.275Z'
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

-- Record 2597: 브릿지스퀘어LOG+스타트업투자조합4호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200362',
  '브릿지스퀘어LOG+스타트업투자조합4호',
  190000000,
  '2022-11-02',
  'Active',
  '브릿지스퀘어',
  'VCS_API_SCRAPER',
  'AS20221229',
  '브릿지스퀘어',
  '산업코드: 2 | 조성총액: 1.9억원',
  '2027-10-26',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20221229","mother_fund_id":"","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"1.9","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.275Z"}',
  '2025-06-05T00:42:07.275Z'
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

-- Record 2598: 브릿지스퀘어LOG+스타트업투자조합3호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200362',
  '브릿지스퀘어LOG+스타트업투자조합3호',
  100000000,
  '2022-05-20',
  'Active',
  '브릿지스퀘어',
  'VCS_API_SCRAPER',
  'AS20220413',
  '브릿지스퀘어',
  '산업코드: 2 | 조성총액: 1.0억원',
  '2027-05-19',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20220413","mother_fund_id":"","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"1.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.275Z"}',
  '2025-06-05T00:42:07.275Z'
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

-- Record 2599: 브릿지스퀘어 Log+제주스타트업투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200362',
  '브릿지스퀘어 Log+제주스타트업투자조합1호',
  110000000,
  '2021-03-22',
  'Active',
  '브릿지스퀘어',
  'VCS_API_SCRAPER',
  'AS20210218',
  '브릿지스퀘어',
  '산업코드: 2 | 조성총액: 1.1억원',
  '2026-03-31',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20210218","mother_fund_id":"","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"1.1","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.275Z"}',
  '2025-06-05T00:42:07.275Z'
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

-- Record 2600: 브릿지 개인투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200331',
  '브릿지 개인투자조합 1호',
  280000000,
  '2024-05-20',
  'Active',
  '더이노베이터스',
  'VCS_API_SCRAPER',
  'AS20240409',
  '더이노베이터스',
  '산업코드: 9 | 조성총액: 2.8억원',
  '2029-05-19',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20240409","mother_fund_id":"","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"2.8","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.275Z"}',
  '2025-06-05T00:42:07.275Z'
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

-- Exact Batch 52 completed! 50 fund records processed.
-- Progress: 2600/3689 total records

