-- VCS Fund EXACT UPSERT Batch 60/74 (Records 2951-3000)
-- EXACT: Uses actual fund_table schema columns
-- Generated from VCS API Scraper fund data
-- Generated at: 2025-06-05T00:42:07.308Z
-- Schema: Exact match to actual fund_table structure

-- EXACT FUND DATA (UPSERT - Safe for Duplicates)
-- Processing 50 fund records
-- Will INSERT new records or UPDATE existing ones

-- Record 2951: 라이콘 스타트업 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20170046',
  '라이콘 스타트업 투자조합',
  3000000000,
  '2024-07-13',
  'Active',
  '시리즈벤처스',
  'VCS_API_SCRAPER',
  'AS20240614',
  '시리즈벤처스',
  '산업코드: 2 | 조성총액: 30.0억원',
  '2032-07-07',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20240614","mother_fund_id":"MF00000001","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"30.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.308Z"}',
  '2025-06-05T00:42:07.308Z'
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

-- Record 2952: 라이징스타 지역AC세컨더리 벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20210208',
  '라이징스타 지역AC세컨더리 벤처투자조합',
  10000000000,
  '2024-07-16',
  'Active',
  '라이징에스벤처스',
  'VCS_API_SCRAPER',
  'AS20240657',
  '라이징에스벤처스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 04 | 산업코드: 5 | 조성총액: 100.0억원',
  '2031-07-15',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20240657","mother_fund_id":"MF00000001","investment_character_code":"04","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"100.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.308Z"}',
  '2025-06-05T00:42:07.308Z'
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

-- Record 2953: 라구나 초기 바이오 투자조합 제1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20180014',
  '라구나 초기 바이오 투자조합 제1호',
  2620000000,
  '2019-05-30',
  'Active',
  '라구나인베스트먼트',
  'VCS_API_SCRAPER',
  'AS20190217',
  '라구나인베스트먼트',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 01 | 산업코드: 5 | 조성총액: 26.2억원',
  '2025-12-20',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20190217","mother_fund_id":"","investment_character_code":"01","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"26.2","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.308Z"}',
  '2025-06-05T00:42:07.308Z'
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

-- Record 2954: 라구나 청년창업 투자조합 제1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20180014',
  '라구나 청년창업 투자조합 제1호',
  14000000000,
  '2018-12-27',
  'Active',
  '라구나인베스트먼트',
  'VCS_API_SCRAPER',
  'AS20190002',
  '라구나인베스트먼트',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 21 | 산업코드: 2 | 조성총액: 140.0억원',
  '2026-12-26',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20190002","mother_fund_id":"MF00000001","investment_character_code":"21","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"140.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.308Z"}',
  '2025-06-05T00:42:07.308Z'
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

-- Record 2955: 라구나 창업초기 투자조합 제2호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20180014',
  '라구나 창업초기 투자조합 제2호',
  12300000000,
  '2019-12-30',
  'Active',
  '라구나인베스트먼트',
  'VCS_API_SCRAPER',
  'AS20200002',
  '라구나인베스트먼트',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 20 | 산업코드: 5 | 조성총액: 123.0억원',
  '2027-12-29',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20200002","mother_fund_id":"MF00000001","investment_character_code":"20","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"123.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.308Z"}',
  '2025-06-05T00:42:07.308Z'
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

-- Record 2956: 라구나 유니콘 플러스 펀드 제5호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20180014',
  '라구나 유니콘 플러스 펀드 제5호',
  26300000000,
  '2022-10-26',
  'Active',
  '라구나인베스트먼트',
  'VCS_API_SCRAPER',
  'AS20221222',
  '라구나인베스트먼트',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 02 | 산업코드: 2 | 조성총액: 263.0억원',
  '2030-10-25',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20221222","mother_fund_id":"","investment_character_code":"02","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"263.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.308Z"}',
  '2025-06-05T00:42:07.308Z'
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

-- Record 2957: 라구나 스케일업 펀드 제6호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20180014',
  '라구나 스케일업 펀드 제6호',
  58100000000,
  '2024-02-28',
  'Active',
  '라구나인베스트먼트',
  'VCS_API_SCRAPER',
  'AS20240152',
  '라구나인베스트먼트',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 08 | 산업코드: 2 | 조성총액: 581.0억원',
  '2032-02-27',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20240152","mother_fund_id":"MF00000001","investment_character_code":"08","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"581.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.308Z"}',
  '2025-06-05T00:42:07.308Z'
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

-- Record 2958: 라구나 다이나믹 게임&콘텐츠 펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20180014',
  '라구나 다이나믹 게임&콘텐츠 펀드',
  15860000000,
  '2020-10-25',
  'Active',
  '라구나인베스트먼트',
  'VCS_API_SCRAPER',
  'AS20200595',
  '라구나인베스트먼트',
  '투자분야: 문화 | 세부분야: 문화 기타 | 투자성격코드: 24 | 산업코드: 7 | 조성총액: 158.6억원',
  '2027-10-24',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20200595","mother_fund_id":"MF00000001","investment_character_code":"24","industry_code":"7","investment_field_type":"문화","investment_field_detail_type":"문화 기타","formation_total_amount":"158.6","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.308Z"}',
  '2025-06-05T00:42:07.308Z'
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

-- Record 2959: 라구나 Pre-IPO 퓨쳐 투자조합 제5호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20180014',
  '라구나 Pre-IPO 퓨쳐 투자조합 제5호',
  4400000000,
  '2021-02-04',
  'Active',
  '라구나인베스트먼트',
  'VCS_API_SCRAPER',
  'AS20210108',
  '라구나인베스트먼트',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 25 | 산업코드: 5 | 조성총액: 44.0억원',
  '2026-02-03',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20210108","mother_fund_id":"","investment_character_code":"25","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"44.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.308Z"}',
  '2025-06-05T00:42:07.308Z'
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

-- Record 2960: 라구나 Pre-IPO 퓨쳐 투자조합 제4호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20180014',
  '라구나 Pre-IPO 퓨쳐 투자조합 제4호',
  3300000000,
  '2020-07-10',
  'Active',
  '라구나인베스트먼트',
  'VCS_API_SCRAPER',
  'AS20200376',
  '라구나인베스트먼트',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 16 | 산업코드: 5 | 조성총액: 33.0억원',
  '2025-07-09',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20200376","mother_fund_id":"","investment_character_code":"16","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"33.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.308Z"}',
  '2025-06-05T00:42:07.308Z'
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

-- Record 2961: 라구나 Pre-IPO 큐라티스 투자조합 제7호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20180014',
  '라구나 Pre-IPO 큐라티스 투자조합 제7호',
  4000000000,
  '2021-09-09',
  'Active',
  '라구나인베스트먼트',
  'VCS_API_SCRAPER',
  'AS20210840',
  '라구나인베스트먼트',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 25 | 산업코드: 9 | 조성총액: 40.0억원',
  '2026-09-08',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20210840","mother_fund_id":"","investment_character_code":"25","industry_code":"9","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"40.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.308Z"}',
  '2025-06-05T00:42:07.308Z'
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

-- Record 2962: 라구나 Pre-IPO 이지템 투자조합 제11호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20180014',
  '라구나 Pre-IPO 이지템 투자조합 제11호',
  4450000000,
  '2024-02-01',
  'Active',
  '라구나인베스트먼트',
  'VCS_API_SCRAPER',
  'AS20240071',
  '라구나인베스트먼트',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 04 | 산업코드: 5 | 조성총액: 44.5억원',
  '2029-01-31',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20240071","mother_fund_id":"","investment_character_code":"04","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"44.5","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.308Z"}',
  '2025-06-05T00:42:07.308Z'
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

-- Record 2963: 라구나 Pre-IPO 이뮨 투자조합 제2호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20180014',
  '라구나 Pre-IPO 이뮨 투자조합 제2호',
  5280000000,
  '2019-03-25',
  'Active',
  '라구나인베스트먼트',
  'VCS_API_SCRAPER',
  'AS20190085',
  '라구나인베스트먼트',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 01 | 산업코드: 5 | 조성총액: 52.8억원',
  '2026-04-04',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20190085","mother_fund_id":"","investment_character_code":"01","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"52.8","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.308Z"}',
  '2025-06-05T00:42:07.308Z'
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

-- Record 2964: 라구나 Pre-IPO 유니콘 투자조합 제3호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20180014',
  '라구나 Pre-IPO 유니콘 투자조합 제3호',
  3500000000,
  '2020-03-18',
  'Active',
  '라구나인베스트먼트',
  'VCS_API_SCRAPER',
  'AS20200140',
  '라구나인베스트먼트',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 16 | 산업코드: 2 | 조성총액: 35.0억원',
  '2027-03-16',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20200140","mother_fund_id":"","investment_character_code":"16","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"35.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.308Z"}',
  '2025-06-05T00:42:07.308Z'
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

-- Record 2965: 라구나 Pre-IPO 삼총사 투자조합 제10호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20180014',
  '라구나 Pre-IPO 삼총사 투자조합 제10호',
  2000000000,
  '2022-06-10',
  'Active',
  '라구나인베스트먼트',
  'VCS_API_SCRAPER',
  'AS20220650',
  '라구나인베스트먼트',
  '투자분야: 문화 | 세부분야: 공연 | 투자성격코드: 24 | 산업코드: 6 | 조성총액: 20.0억원',
  '2027-06-09',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20220650","mother_fund_id":"","investment_character_code":"24","industry_code":"6","investment_field_type":"문화","investment_field_detail_type":"공연","formation_total_amount":"20.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.308Z"}',
  '2025-06-05T00:42:07.308Z'
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

-- Record 2966: 라구나 Pre-IPO 블리몽키즈 투자조합 제13호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20180014',
  '라구나 Pre-IPO 블리몽키즈 투자조합 제13호',
  2110000000,
  '2024-11-20',
  'Active',
  '라구나인베스트먼트',
  'VCS_API_SCRAPER',
  'AS20241174',
  '라구나인베스트먼트',
  '투자분야: 일반 | 세부분야: 일반 기타 | 투자성격코드: 25 | 산업코드: 2 | 조성총액: 21.1억원',
  '2029-11-19',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20241174","mother_fund_id":"","investment_character_code":"25","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"일반 기타","formation_total_amount":"21.1","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.308Z"}',
  '2025-06-05T00:42:07.308Z'
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

-- Record 2967: 라구나 Pre-IPO 브레이브 투자조합 제9호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20180014',
  '라구나 Pre-IPO 브레이브 투자조합 제9호',
  2010000000,
  '2022-06-16',
  'Active',
  '라구나인베스트먼트',
  'VCS_API_SCRAPER',
  'AS20220676',
  '라구나인베스트먼트',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 25 | 산업코드: 8 | 조성총액: 20.1억원',
  '2027-06-15',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20220676","mother_fund_id":"","investment_character_code":"25","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"20.1","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.308Z"}',
  '2025-06-05T00:42:07.308Z'
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

-- Record 2968: 라구나 Pre-IPO 메타버스 투자조합 제8호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20180014',
  '라구나 Pre-IPO 메타버스 투자조합 제8호',
  2100000000,
  '2021-09-14',
  'Active',
  '라구나인베스트먼트',
  'VCS_API_SCRAPER',
  'AS20210859',
  '라구나인베스트먼트',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 25 | 산업코드: 7 | 조성총액: 21.0억원',
  '2026-09-13',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20210859","mother_fund_id":"","investment_character_code":"25","industry_code":"7","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"21.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.308Z"}',
  '2025-06-05T00:42:07.308Z'
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

-- Record 2969: 라구나 Pre-IPO Exo 투자조합 제6호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20180014',
  '라구나 Pre-IPO Exo 투자조합 제6호',
  2130000000,
  '2021-10-07',
  'Active',
  '라구나인베스트먼트',
  'VCS_API_SCRAPER',
  'AS20210957',
  '라구나인베스트먼트',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 25 | 산업코드: 5 | 조성총액: 21.3억원',
  '2026-10-06',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20210957","mother_fund_id":"","investment_character_code":"25","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"21.3","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.308Z"}',
  '2025-06-05T00:42:07.308Z'
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

-- Record 2970: 땡스시그니처투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20230013',
  '땡스시그니처투자조합 1호',
  10000000000,
  '2023-03-06',
  'Active',
  '땡스벤처스',
  'VCS_API_SCRAPER',
  'AS20230148',
  '땡스벤처스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 02 | 산업코드: 2 | 조성총액: 100.0억원',
  '2031-03-05',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20230148","mother_fund_id":"","investment_character_code":"02","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"100.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.308Z"}',
  '2025-06-05T00:42:07.308Z'
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

-- Record 2971: 디티앤아이-아그리 투 라이프 펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20150009',
  '디티앤아이-아그리 투 라이프 펀드',
  30000000000,
  '2022-08-17',
  'Active',
  '디티앤인베스트먼트',
  'VCS_API_SCRAPER',
  'AS20220963',
  '디티앤인베스트먼트',
  '투자분야: 일반 | 세부분야: 일반 기타 | 투자성격코드: 01 | 산업코드: 5 | 조성총액: 300.0억원',
  '2030-08-16',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20220963","mother_fund_id":"","investment_character_code":"01","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"일반 기타","formation_total_amount":"300.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.308Z"}',
  '2025-06-05T00:42:07.308Z'
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

-- Record 2972: 디티앤로보테크투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20150009',
  '디티앤로보테크투자조합1호',
  5700000000,
  '2024-08-13',
  'Active',
  '디티앤인베스트먼트',
  'VCS_API_SCRAPER',
  'AS20240775',
  '디티앤인베스트먼트',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 25 | 산업코드: 3 | 조성총액: 57.0억원',
  '2029-08-12',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20240775","mother_fund_id":"","investment_character_code":"25","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"57.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.308Z"}',
  '2025-06-05T00:42:07.308Z'
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

-- Record 2973: 디티앤-케이아이에스그로쓰(DTN-KISGrowth)2021투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20150009',
  '디티앤-케이아이에스그로쓰(DTN-KISGrowth)2021투자조합',
  13100000000,
  '2021-06-21',
  'Active',
  '디티앤인베스트먼트',
  'VCS_API_SCRAPER',
  'AS20210502',
  '디티앤인베스트먼트',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 01 | 산업코드: 5 | 조성총액: 131.0억원',
  '2026-06-20',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20210502","mother_fund_id":"","investment_character_code":"01","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"131.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.308Z"}',
  '2025-06-05T00:42:07.308Z'
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

-- Record 2974: 디티앤 그로쓰 2023 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20150009',
  '디티앤 그로쓰 2023 투자조합',
  12200000000,
  '2023-11-16',
  'Active',
  '디티앤인베스트먼트',
  'VCS_API_SCRAPER',
  'AS20231092',
  '디티앤인베스트먼트',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 01 | 산업코드: 5 | 조성총액: 122.0억원',
  '2028-11-15',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20231092","mother_fund_id":"","investment_character_code":"01","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"122.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.308Z"}',
  '2025-06-05T00:42:07.308Z'
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

-- Record 2975: 디티씨 엑스포넌트 K2G 벤처투자조합 제1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20240546',
  '디티씨 엑스포넌트 K2G 벤처투자조합 제1호',
  1000000000,
  '2025-01-22',
  'Active',
  '디티씨글로벌파트너스',
  'VCS_API_SCRAPER',
  'AS20250067',
  '디티씨글로벌파트너스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 20 | 산업코드: 9 | 조성총액: 10.0억원',
  '2030-01-21',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20250067","mother_fund_id":"","investment_character_code":"20","industry_code":"9","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"10.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.308Z"}',
  '2025-06-05T00:42:07.308Z'
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

-- Record 2976: 디투유 제9호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20210105',
  '디투유 제9호 투자조합',
  3900000000,
  '2023-08-28',
  'Active',
  '메인스트리트벤처스',
  'VCS_API_SCRAPER',
  'AS20230746',
  '메인스트리트벤처스',
  '산업코드: 8 | 조성총액: 39.0억원',
  '2028-08-27',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20230746","mother_fund_id":"","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"39.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.308Z"}',
  '2025-06-05T00:42:07.308Z'
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

-- Record 2977: 디투유 제8호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20210105',
  '디투유 제8호 투자조합',
  3300000000,
  '2023-03-28',
  'Active',
  '메인스트리트벤처스',
  'VCS_API_SCRAPER',
  'AS20230235',
  '메인스트리트벤처스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 16 | 산업코드: 6 | 조성총액: 33.0억원',
  '2028-03-27',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20230235","mother_fund_id":"","investment_character_code":"16","industry_code":"6","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"33.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.308Z"}',
  '2025-06-05T00:42:07.308Z'
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

-- Record 2978: 디투유 제5호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20210105',
  '디투유 제5호 투자조합',
  740000000,
  '2022-04-20',
  'Active',
  '메인스트리트벤처스',
  'VCS_API_SCRAPER',
  'AS20220396',
  '메인스트리트벤처스',
  '산업코드: 8 | 조성총액: 7.4억원',
  '2027-04-19',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20220396","mother_fund_id":"","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"7.4","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.308Z"}',
  '2025-06-05T00:42:07.308Z'
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

-- Record 2979: 디투유 제4호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20210105',
  '디투유 제4호 투자조합',
  900000000,
  '2022-03-29',
  'Active',
  '메인스트리트벤처스',
  'VCS_API_SCRAPER',
  'AS20220257',
  '메인스트리트벤처스',
  '산업코드: 2 | 조성총액: 9.0억원',
  '2027-03-28',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20220257","mother_fund_id":"","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"9.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.308Z"}',
  '2025-06-05T00:42:07.308Z'
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

-- Record 2980: 디투유 제3호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20210105',
  '디투유 제3호 투자조합',
  1530000000,
  '2021-12-20',
  'Active',
  '메인스트리트벤처스',
  'VCS_API_SCRAPER',
  'AS20211335',
  '메인스트리트벤처스',
  '산업코드: 2 | 조성총액: 15.3억원',
  '2026-12-19',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20211335","mother_fund_id":"","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"15.3","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.308Z"}',
  '2025-06-05T00:42:07.308Z'
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

-- Record 2981: 디투유 제2호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20210105',
  '디투유 제2호 투자조합',
  1300000000,
  '2021-12-20',
  'Active',
  '메인스트리트벤처스',
  'VCS_API_SCRAPER',
  'AS20211334',
  '메인스트리트벤처스',
  '산업코드: 2 | 조성총액: 13.0억원',
  '2026-12-19',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20211334","mother_fund_id":"","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"13.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.308Z"}',
  '2025-06-05T00:42:07.308Z'
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

-- Record 2982: 디투유 제12호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20210105',
  '디투유 제12호 투자조합',
  7100000000,
  '2024-12-20',
  'Active',
  '메인스트리트벤처스',
  'VCS_API_SCRAPER',
  'AS20241400',
  '메인스트리트벤처스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 01 | 산업코드: 2 | 조성총액: 71.0억원',
  '2029-12-19',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20241400","mother_fund_id":"","investment_character_code":"01","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"71.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.308Z"}',
  '2025-06-05T00:42:07.308Z'
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

-- Record 2983: 디투유 제11호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20210105',
  '디투유 제11호 투자조합',
  3360000000,
  '2024-03-26',
  'Active',
  '메인스트리트벤처스',
  'VCS_API_SCRAPER',
  'AS20240187',
  '메인스트리트벤처스',
  '산업코드: 9 | 조성총액: 33.6억원',
  '2029-03-25',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20240187","mother_fund_id":"","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"33.6","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.308Z"}',
  '2025-06-05T00:42:07.308Z'
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

-- Record 2984: 디투유 제10호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20210105',
  '디투유 제10호 투자조합',
  340000000,
  '2023-09-22',
  'Active',
  '메인스트리트벤처스',
  'VCS_API_SCRAPER',
  'AS20230824',
  '메인스트리트벤처스',
  '산업코드: 8 | 조성총액: 3.4억원',
  '2028-09-21',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20230824","mother_fund_id":"","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"3.4","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.308Z"}',
  '2025-06-05T00:42:07.308Z'
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

-- Record 2985: 디케이아이 그로잉 스타 8호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20110006',
  '디케이아이 그로잉 스타 8호 투자조합',
  17000000000,
  '2024-08-27',
  'Active',
  '대교인베스트먼트',
  'VCS_API_SCRAPER',
  'AS20240837',
  '대교인베스트먼트',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 20 | 산업코드: 5 | 조성총액: 170.0억원',
  '2032-08-26',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20240837","mother_fund_id":"MF00000001","investment_character_code":"20","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"170.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.308Z"}',
  '2025-06-05T00:42:07.308Z'
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

-- Record 2986: 디케이아이 그로잉 스타 7호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20110006',
  '디케이아이 그로잉 스타 7호 투자조합',
  40000000000,
  '2023-05-16',
  'Active',
  '대교인베스트먼트',
  'VCS_API_SCRAPER',
  'AS20230386',
  '대교인베스트먼트',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 02 | 산업코드: 8 | 조성총액: 400.0억원',
  '2031-05-15',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20230386","mother_fund_id":"","investment_character_code":"02","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"400.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.308Z"}',
  '2025-06-05T00:42:07.308Z'
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

-- Record 2987: 디케이아이 그로잉 스타 6호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20110006',
  '디케이아이 그로잉 스타 6호 투자조합',
  25000000000,
  '2021-11-26',
  'Active',
  '대교인베스트먼트',
  'VCS_API_SCRAPER',
  'AS20211196',
  '대교인베스트먼트',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 18 | 산업코드: 5 | 조성총액: 250.0억원',
  '2029-11-25',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20211196","mother_fund_id":"MF00000001","investment_character_code":"18","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"250.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.308Z"}',
  '2025-06-05T00:42:07.308Z'
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

-- Record 2988: 디케이스타트업플러스 투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20210408',
  '디케이스타트업플러스 투자조합1호',
  9400000000,
  '2021-08-11',
  'Active',
  '모비딕벤처스',
  'VCS_API_SCRAPER',
  'AS20210714',
  '모비딕벤처스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 02 | 산업코드: 2 | 조성총액: 94.0억원',
  '2026-08-10',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20210714","mother_fund_id":"","investment_character_code":"02","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"94.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.308Z"}',
  '2025-06-05T00:42:07.309Z'
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

-- Record 2989: 디지털콘텐츠 개인투자조합2호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20140013',
  '디지털콘텐츠 개인투자조합2호',
  180000000,
  '2020-12-28',
  'Active',
  '더인벤션랩',
  'VCS_API_SCRAPER',
  'AS20200829',
  '더인벤션랩',
  '산업코드: 8 | 조성총액: 1.8억원',
  '2028-02-28',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20200829","mother_fund_id":"","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"1.8","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.309Z"}',
  '2025-06-05T00:42:07.309Z'
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

-- Record 2990: 디지털콘텐츠 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20140013',
  '디지털콘텐츠 개인투자조합',
  110000000,
  '2020-06-02',
  'Active',
  '더인벤션랩',
  'VCS_API_SCRAPER',
  'AS20200241',
  '더인벤션랩',
  '산업코드: 2 | 조성총액: 1.1억원',
  '2027-09-30',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20200241","mother_fund_id":"","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"1.1","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.309Z"}',
  '2025-06-05T00:42:07.309Z'
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

-- Record 2991: 디지털이노베이션2030 개인투자조합4호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20140013',
  '디지털이노베이션2030 개인투자조합4호',
  1710000000,
  '2024-06-20',
  'Active',
  '더인벤션랩',
  'VCS_API_SCRAPER',
  'AS20240533',
  '더인벤션랩',
  '산업코드: 8 | 조성총액: 17.1억원',
  '2029-06-19',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20240533","mother_fund_id":"","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"17.1","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.309Z"}',
  '2025-06-05T00:42:07.309Z'
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

-- Record 2992: 디지털이노베이션2030 개인투자조합3호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20140013',
  '디지털이노베이션2030 개인투자조합3호',
  690000000,
  '2023-02-28',
  'Active',
  '더인벤션랩',
  'VCS_API_SCRAPER',
  'AS20230120',
  '더인벤션랩',
  '산업코드: 2 | 조성총액: 6.9억원',
  '2028-02-27',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20230120","mother_fund_id":"","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"6.9","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.309Z"}',
  '2025-06-05T00:42:07.309Z'
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

-- Record 2993: 디지털이노베이션2030 개인투자조합2호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20140013',
  '디지털이노베이션2030 개인투자조합2호',
  630000000,
  '2021-11-25',
  'Active',
  '더인벤션랩',
  'VCS_API_SCRAPER',
  'AS20211185',
  '더인벤션랩',
  '산업코드: 8 | 조성총액: 6.3억원',
  '2026-11-30',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20211185","mother_fund_id":"","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"6.3","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.309Z"}',
  '2025-06-05T00:42:07.309Z'
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

-- Record 2994: 디지털이노베이션2030 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20140013',
  '디지털이노베이션2030 개인투자조합',
  480000000,
  '2021-02-09',
  'Active',
  '더인벤션랩',
  'VCS_API_SCRAPER',
  'AS20210093',
  '더인벤션랩',
  '산업코드: 8 | 조성총액: 4.8억원',
  '2026-02-28',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20210093","mother_fund_id":"","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"4.8","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.309Z"}',
  '2025-06-05T00:42:07.309Z'
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

-- Record 2995: 디지털 혁신콘텐츠 투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20140019',
  '디지털 혁신콘텐츠 투자조합 1호',
  770000000,
  '2024-10-17',
  'Active',
  '대구창조경제혁신센터',
  'VCS_API_SCRAPER',
  'AS20240969',
  '대구창조경제혁신센터',
  '산업코드: 2 | 조성총액: 7.7억원',
  '2029-10-17',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20240969","mother_fund_id":"","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"7.7","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.309Z"}',
  '2025-06-05T00:42:07.309Z'
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

-- Record 2996: 디지털 이노베이션 벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20210709',
  '디지털 이노베이션 벤처투자조합',
  10260000000,
  '2021-12-27',
  'Active',
  '에이온인베스트먼트',
  'VCS_API_SCRAPER',
  'AS20211419',
  '에이온인베스트먼트',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 25 | 산업코드: 8 | 조성총액: 102.6억원',
  '2026-12-26',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20211419","mother_fund_id":"","investment_character_code":"25","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"102.6","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.309Z"}',
  '2025-06-05T00:42:07.309Z'
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

-- Record 2997: 디에이치피(DHP)메디스비개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20190042',
  '디에이치피(DHP)메디스비개인투자조합',
  340000000,
  '2025-02-28',
  'Active',
  '디지털헬스케어파트너스',
  'VCS_API_SCRAPER',
  'AS20250125',
  '디지털헬스케어파트너스',
  '산업코드: 8 | 조성총액: 3.4억원',
  '2033-02-27',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20250125","mother_fund_id":"","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"3.4","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.309Z"}',
  '2025-06-05T00:42:07.309Z'
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

-- Record 2998: 디에이치피(DHP)개인투자조합제7호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20190042',
  '디에이치피(DHP)개인투자조합제7호',
  730000000,
  '2024-03-20',
  'Active',
  '디지털헬스케어파트너스',
  'VCS_API_SCRAPER',
  'AS20240174',
  '디지털헬스케어파트너스',
  '산업코드: 2 | 조성총액: 7.3억원',
  '2032-03-19',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20240174","mother_fund_id":"","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"7.3","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.309Z"}',
  '2025-06-05T00:42:07.309Z'
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

-- Record 2999: 디에이치피(DHP)개인투자조합제6호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20190042',
  '디에이치피(DHP)개인투자조합제6호',
  1310000000,
  '2022-08-26',
  'Active',
  '디지털헬스케어파트너스',
  'VCS_API_SCRAPER',
  'AS20220944',
  '디지털헬스케어파트너스',
  '산업코드: 2 | 조성총액: 13.1억원',
  '2030-08-25',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20220944","mother_fund_id":"","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"13.1","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.309Z"}',
  '2025-06-05T00:42:07.309Z'
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

-- Record 3000: 디에이치피(DHP)개인투자조합제5호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20190042',
  '디에이치피(DHP)개인투자조합제5호',
  820000000,
  '2021-07-30',
  'Active',
  '디지털헬스케어파트너스',
  'VCS_API_SCRAPER',
  'AS20210653',
  '디지털헬스케어파트너스',
  '산업코드: 2 | 조성총액: 8.2억원',
  '2029-07-29',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20210653","mother_fund_id":"","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"8.2","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.309Z"}',
  '2025-06-05T00:42:07.309Z'
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

-- Exact Batch 60 completed! 50 fund records processed.
-- Progress: 3000/3689 total records

