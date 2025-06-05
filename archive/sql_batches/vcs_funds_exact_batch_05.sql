-- VCS Fund EXACT UPSERT Batch 5/74 (Records 201-250)
-- EXACT: Uses actual fund_table schema columns
-- Generated from VCS API Scraper fund data
-- Generated at: 2025-06-05T00:42:07.081Z
-- Schema: Exact match to actual fund_table structure

-- EXACT FUND DATA (UPSERT - Safe for Duplicates)
-- Processing 50 fund records
-- Will INSERT new records or UPDATE existing ones

-- Record 201: 프라이머프로라타투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20170039',
  '프라이머프로라타투자조합1호',
  2360000000,
  '2018-09-07',
  'Active',
  '프라이머시즌5',
  'VCS_API_SCRAPER',
  'AS20180539',
  '프라이머시즌5',
  '산업코드: 8 | 조성총액: 23.6억원',
  '2025-09-06',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20180539","mother_fund_id":"","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"23.6","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.081Z"}',
  '2025-06-05T00:42:07.081Z'
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

-- Record 202: 프라이머파트너스투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20170039',
  '프라이머파트너스투자조합1호',
  650000000,
  '2023-01-09',
  'Active',
  '프라이머시즌5',
  'VCS_API_SCRAPER',
  'AS20230026',
  '프라이머시즌5',
  '산업코드: 8 | 조성총액: 6.5억원',
  '2030-01-08',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20230026","mother_fund_id":"","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"6.5","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.081Z"}',
  '2025-06-05T00:42:07.081Z'
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

-- Record 203: 프라이머시즌7투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20170039',
  '프라이머시즌7투자조합',
  18490000000,
  '2025-02-07',
  'Active',
  '프라이머시즌5',
  'VCS_API_SCRAPER',
  'AS20250089',
  '프라이머시즌5',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 20 | 산업코드: 2 | 조성총액: 184.9억원',
  '2035-02-06',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20250089","mother_fund_id":"","investment_character_code":"20","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"184.9","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.081Z"}',
  '2025-06-05T00:42:07.081Z'
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

-- Record 204: 프라이머시즌6투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20170039',
  '프라이머시즌6투자조합',
  10640000000,
  '2020-10-15',
  'Active',
  '프라이머시즌5',
  'VCS_API_SCRAPER',
  'AS20200583',
  '프라이머시즌5',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 20 | 산업코드: 2 | 조성총액: 106.4억원',
  '2030-10-14',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20200583","mother_fund_id":"","investment_character_code":"20","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"106.4","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.081Z"}',
  '2025-06-05T00:42:07.081Z'
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

-- Record 205: 프라이머시즌5투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20170039',
  '프라이머시즌5투자조합1호',
  4090000000,
  '2018-06-27',
  'Active',
  '프라이머시즌5',
  'VCS_API_SCRAPER',
  'AS20180485',
  '프라이머시즌5',
  '산업코드: 8 | 조성총액: 40.9억원',
  '2025-06-25',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20180485","mother_fund_id":"","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"40.9","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.081Z"}',
  '2025-06-05T00:42:07.081Z'
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

-- Record 206: 프라이머사제프로젝트펀드1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20170039',
  '프라이머사제프로젝트펀드1호',
  4700000000,
  '2021-09-16',
  'Active',
  '프라이머시즌5',
  'VCS_API_SCRAPER',
  'AS20210874',
  '프라이머시즌5',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 25 | 산업코드: 2 | 조성총액: 47.0억원',
  '2029-09-15',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20210874","mother_fund_id":"","investment_character_code":"25","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"47.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.081Z"}',
  '2025-06-05T00:42:07.081Z'
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

-- Record 207: 프라이머부스트투자조합3호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20170039',
  '프라이머부스트투자조합3호',
  1900000000,
  '2023-05-24',
  'Active',
  '프라이머시즌5',
  'VCS_API_SCRAPER',
  'AS20230411',
  '프라이머시즌5',
  '산업코드: 8 | 조성총액: 19.0억원',
  '2033-05-23',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20230411","mother_fund_id":"","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"19.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.081Z"}',
  '2025-06-05T00:42:07.081Z'
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

-- Record 208: 프라이머부스트투자조합2호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20170039',
  '프라이머부스트투자조합2호',
  4050000000,
  '2020-11-03',
  'Active',
  '프라이머시즌5',
  'VCS_API_SCRAPER',
  'AS20200604',
  '프라이머시즌5',
  '산업코드: 8 | 조성총액: 40.5억원',
  '2030-11-02',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20200604","mother_fund_id":"","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"40.5","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.082Z"}',
  '2025-06-05T00:42:07.082Z'
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

-- Record 209: 프라이머부스트투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20170039',
  '프라이머부스트투자조합1호',
  2640000000,
  '2020-03-17',
  'Active',
  '프라이머시즌5',
  'VCS_API_SCRAPER',
  'AS20200102',
  '프라이머시즌5',
  '산업코드: 8 | 조성총액: 26.4억원',
  '2027-03-03',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20200102","mother_fund_id":"","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"26.4","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.082Z"}',
  '2025-06-05T00:42:07.082Z'
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

-- Record 210: 퓨처플레이혁신솔루션펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20160003',
  '퓨처플레이혁신솔루션펀드',
  29750000000,
  '2021-06-22',
  'Active',
  '퓨처플레이',
  'VCS_API_SCRAPER',
  'AS20210506',
  '퓨처플레이',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 20 | 산업코드: 2 | 조성총액: 297.5억원',
  '2029-06-21',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20210506","mother_fund_id":"MF00000001","investment_character_code":"20","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"297.5","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.082Z"}',
  '2025-06-05T00:42:07.082Z'
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

-- Record 211: 퓨처플레이제2호개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20160003',
  '퓨처플레이제2호개인투자조합',
  5500000000,
  '2020-08-10',
  'Active',
  '퓨처플레이',
  'VCS_API_SCRAPER',
  'AS20200392',
  '퓨처플레이',
  '산업코드: 8 | 조성총액: 55.0억원',
  '2028-08-09',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20200392","mother_fund_id":"MF00000001","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"55.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.082Z"}',
  '2025-06-05T00:42:07.082Z'
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

-- Record 212: 퓨처플레이유니콘펀드3호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20160003',
  '퓨처플레이유니콘펀드3호',
  11300000000,
  '2024-10-22',
  'Active',
  '퓨처플레이',
  'VCS_API_SCRAPER',
  'AS20240974',
  '퓨처플레이',
  '산업코드: 5 | 조성총액: 113.0억원',
  '2032-10-21',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20240974","mother_fund_id":"","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"113.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.082Z"}',
  '2025-06-05T00:42:07.082Z'
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

-- Record 213: 퓨처플레이유니콘펀드2호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20160003',
  '퓨처플레이유니콘펀드2호',
  15700000000,
  '2023-09-27',
  'Active',
  '퓨처플레이',
  'VCS_API_SCRAPER',
  'AS20230868',
  '퓨처플레이',
  '산업코드: 2 | 조성총액: 157.0억원',
  '2031-09-26',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20230868","mother_fund_id":"","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"157.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.082Z"}',
  '2025-06-05T00:42:07.082Z'
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

-- Record 214: 퓨처플레이유니콘펀드1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20160003',
  '퓨처플레이유니콘펀드1호',
  14300000000,
  '2022-08-17',
  'Active',
  '퓨처플레이',
  'VCS_API_SCRAPER',
  'AS20220883',
  '퓨처플레이',
  '산업코드: 8 | 조성총액: 143.0억원',
  '2029-08-16',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20220883","mother_fund_id":"","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"143.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.082Z"}',
  '2025-06-05T00:42:07.082Z'
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

-- Record 215: 퓨처플레이-신한 테크이노베이션 제2호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20160003',
  '퓨처플레이-신한 테크이노베이션 제2호',
  21500000000,
  '2021-11-17',
  'Active',
  '퓨처플레이',
  'VCS_API_SCRAPER',
  'AS20211150',
  '퓨처플레이',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 02 | 산업코드: 2 | 조성총액: 215.0억원',
  '2029-11-16',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20211150","mother_fund_id":"","investment_character_code":"02","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"215.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.082Z"}',
  '2025-06-05T00:42:07.082Z'
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

-- Record 216: 퓨처플레이 혁신성장펀드 제1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20160003',
  '퓨처플레이 혁신성장펀드 제1호',
  42000000000,
  '2023-12-19',
  'Active',
  '퓨처플레이',
  'VCS_API_SCRAPER',
  'AS20231307',
  '퓨처플레이',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 30 | 산업코드: 2 | 조성총액: 420.0억원',
  '2031-12-18',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20231307","mother_fund_id":"MF00000001","investment_character_code":"30","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"420.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.082Z"}',
  '2025-06-05T00:42:07.082Z'
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

-- Record 217: 퓨처플레이 파이오니어펀드 제1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20160003',
  '퓨처플레이 파이오니어펀드 제1호',
  12400000000,
  '2023-04-25',
  'Active',
  '퓨처플레이',
  'VCS_API_SCRAPER',
  'AS20230324',
  '퓨처플레이',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 20 | 산업코드: 2 | 조성총액: 124.0억원',
  '2031-04-24',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20230324","mother_fund_id":"MF00000001","investment_character_code":"20","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"124.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.082Z"}',
  '2025-06-05T00:42:07.082Z'
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

-- Record 218: 퓨처플레이 뉴-엔터테인먼트펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20160003',
  '퓨처플레이 뉴-엔터테인먼트펀드',
  17520000000,
  '2022-04-12',
  'Active',
  '퓨처플레이',
  'VCS_API_SCRAPER',
  'AS20220409',
  '퓨처플레이',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 20 | 산업코드: 2 | 조성총액: 175.2억원',
  '2030-04-11',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20220409","mother_fund_id":"","investment_character_code":"20","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"175.2","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.082Z"}',
  '2025-06-05T00:42:07.082Z'
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

-- Record 219: 퓨처리딩바이오투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20000042',
  '퓨처리딩바이오투자조합',
  10000000000,
  '2019-06-11',
  'Active',
  '에스엠비투자파트너스',
  'VCS_API_SCRAPER',
  'AS20190244',
  '에스엠비투자파트너스',
  '투자분야: 일반 | 세부분야: 바이오 | 투자성격코드: 01 | 산업코드: 5 | 조성총액: 100.0억원',
  '2029-06-10',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20190244","mother_fund_id":"","investment_character_code":"01","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"바이오","formation_total_amount":"100.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.082Z"}',
  '2025-06-05T00:42:07.082Z'
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

-- Record 220: 푸드테크초기스타트업 개인투자조합4호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20140013',
  '푸드테크초기스타트업 개인투자조합4호',
  310000000,
  '2024-06-04',
  'Active',
  '더인벤션랩',
  'VCS_API_SCRAPER',
  'AS20240477',
  '더인벤션랩',
  '산업코드: 9 | 조성총액: 3.1억원',
  '2029-06-03',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20240477","mother_fund_id":"","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"3.1","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.082Z"}',
  '2025-06-05T00:42:07.082Z'
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

-- Record 221: 푸드테크초기스타트업 개인투자조합3호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20140013',
  '푸드테크초기스타트업 개인투자조합3호',
  120000000,
  '2023-05-15',
  'Active',
  '더인벤션랩',
  'VCS_API_SCRAPER',
  'AS20230367',
  '더인벤션랩',
  '산업코드: 8 | 조성총액: 1.2억원',
  '2028-05-31',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20230367","mother_fund_id":"","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"1.2","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.082Z"}',
  '2025-06-05T00:42:07.082Z'
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

-- Record 222: 푸드테크초기스타트업 개인투자조합2호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20140013',
  '푸드테크초기스타트업 개인투자조합2호',
  250000000,
  '2023-05-08',
  'Active',
  '더인벤션랩',
  'VCS_API_SCRAPER',
  'AS20230355',
  '더인벤션랩',
  '산업코드: 7 | 조성총액: 2.5억원',
  '2028-05-07',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20230355","mother_fund_id":"","investment_character_code":"","industry_code":"7","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"2.5","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.082Z"}',
  '2025-06-05T00:42:07.082Z'
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

-- Record 223: 푸드테크초기스타트업 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20140013',
  '푸드테크초기스타트업 개인투자조합',
  620000000,
  '2022-01-06',
  'Active',
  '더인벤션랩',
  'VCS_API_SCRAPER',
  'AS20220009',
  '더인벤션랩',
  '산업코드: 9 | 조성총액: 6.2억원',
  '2027-02-28',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20220009","mother_fund_id":"","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"6.2","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.082Z"}',
  '2025-06-05T00:42:07.082Z'
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

-- Record 224: 포항 아이스퀘어 그린테크 제1호 벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200340',
  '포항 아이스퀘어 그린테크 제1호 벤처투자조합',
  10000000000,
  '2021-05-04',
  'Active',
  '에코프로파트너스',
  'VCS_API_SCRAPER',
  'AS20210359',
  '에코프로파트너스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 03 | 산업코드: 4 | 조성총액: 100.0억원',
  '2027-05-03',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20210359","mother_fund_id":"","investment_character_code":"03","industry_code":"4","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"100.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.082Z"}',
  '2025-06-05T00:42:07.082Z'
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

-- Record 225: 포지티브 에이아이 벤처투자조합 제1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20220322',
  '포지티브 에이아이 벤처투자조합 제1호',
  6200000000,
  '2023-10-23',
  'Active',
  '포지티브인베스트먼트',
  'VCS_API_SCRAPER',
  'AS20230966',
  '포지티브인베스트먼트',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 02 | 산업코드: 8 | 조성총액: 62.0억원',
  '2028-10-22',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20230966","mother_fund_id":"","investment_character_code":"02","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"62.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.082Z"}',
  '2025-06-05T00:42:07.082Z'
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

-- Record 226: 포지티브 소재부품장비 벤처투자조합 제1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20220322',
  '포지티브 소재부품장비 벤처투자조합 제1호',
  4550000000,
  '2022-07-08',
  'Active',
  '포지티브인베스트먼트',
  'VCS_API_SCRAPER',
  'AS20220761',
  '포지티브인베스트먼트',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 16 | 산업코드: 4 | 조성총액: 45.5억원',
  '2027-07-07',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20220761","mother_fund_id":"","investment_character_code":"16","industry_code":"4","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"45.5","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.082Z"}',
  '2025-06-05T00:42:07.082Z'
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

-- Record 227: 포지티브 세컨더리 벤처투자조합 제2호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20220322',
  '포지티브 세컨더리 벤처투자조합 제2호',
  36200000000,
  '2024-04-04',
  'Active',
  '포지티브인베스트먼트',
  'VCS_API_SCRAPER',
  'AS20240262',
  '포지티브인베스트먼트',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 16 | 산업코드: 8 | 조성총액: 362.0억원',
  '2029-04-03',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20240262","mother_fund_id":"","investment_character_code":"16","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"362.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.082Z"}',
  '2025-06-05T00:42:07.082Z'
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

-- Record 228: 포지티브 세컨더리 벤처투자조합 제1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20220322',
  '포지티브 세컨더리 벤처투자조합 제1호',
  31850000000,
  '2022-07-08',
  'Active',
  '포지티브인베스트먼트',
  'VCS_API_SCRAPER',
  'AS20220770',
  '포지티브인베스트먼트',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 16 | 산업코드: 5 | 조성총액: 318.5억원',
  '2027-07-07',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20220770","mother_fund_id":"","investment_character_code":"16","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"318.5","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.082Z"}',
  '2025-06-05T00:42:07.082Z'
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

-- Record 229: 포지티브 로보틱스 벤처투자조합 제1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20220322',
  '포지티브 로보틱스 벤처투자조합 제1호',
  2200000000,
  '2025-02-13',
  'Active',
  '포지티브인베스트먼트',
  'VCS_API_SCRAPER',
  'AS20250107',
  '포지티브인베스트먼트',
  '투자분야: 일반 | 세부분야: 일반 기타 | 투자성격코드: 25 | 산업코드: 3 | 조성총액: 22.0억원',
  '2030-02-12',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20250107","mother_fund_id":"","investment_character_code":"25","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"일반 기타","formation_total_amount":"22.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.082Z"}',
  '2025-06-05T00:42:07.082Z'
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

-- Record 230: 포스트코비드 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20140013',
  '포스트코비드 개인투자조합',
  300000000,
  '2023-08-22',
  'Active',
  '더인벤션랩',
  'VCS_API_SCRAPER',
  'AS20230702',
  '더인벤션랩',
  '산업코드: 2 | 조성총액: 3.0억원',
  '2028-08-21',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20230702","mother_fund_id":"","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"3.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.082Z"}',
  '2025-06-05T00:42:07.082Z'
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

-- Record 231: 포스텍홀딩스 지역뉴딜 벤처펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20120010',
  '포스텍홀딩스 지역뉴딜 벤처펀드',
  29500000000,
  '2022-07-21',
  'Active',
  '포항공과대학교기술지주',
  'VCS_API_SCRAPER',
  'AS20220832',
  '포항공과대학교기술지주',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 20 | 산업코드: 8 | 조성총액: 295.0억원',
  '2032-07-20',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20220832","mother_fund_id":"MF00000001","investment_character_code":"20","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"295.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.082Z"}',
  '2025-06-05T00:42:07.082Z'
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

-- Record 232: 포스텍 홀딩스 7호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20120010',
  '포스텍 홀딩스 7호 투자조합',
  5000000000,
  '2023-03-15',
  'Active',
  '포항공과대학교기술지주',
  'VCS_API_SCRAPER',
  'AS20230179',
  '포항공과대학교기술지주',
  '산업코드: 2 | 조성총액: 50.0억원',
  '2033-03-14',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20230179","mother_fund_id":"MF00000001","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"50.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.082Z"}',
  '2025-06-05T00:42:07.082Z'
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

-- Record 233: 포스텍 홀딩스 6호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20120010',
  '포스텍 홀딩스 6호 투자조합',
  5000000000,
  '2021-09-13',
  'Active',
  '포항공과대학교기술지주',
  'VCS_API_SCRAPER',
  'AS20210836',
  '포항공과대학교기술지주',
  '산업코드: 2 | 조성총액: 50.0억원',
  '2031-09-12',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20210836","mother_fund_id":"MF00000001","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"50.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.082Z"}',
  '2025-06-05T00:42:07.082Z'
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

-- Record 234: 포스텍 홀딩스 5호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20120010',
  '포스텍 홀딩스 5호 투자조합',
  4000000000,
  '2020-06-29',
  'Active',
  '포항공과대학교기술지주',
  'VCS_API_SCRAPER',
  'AS20200289',
  '포항공과대학교기술지주',
  '산업코드: 2 | 조성총액: 40.0억원',
  '2030-06-28',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20200289","mother_fund_id":"MF00000001","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"40.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.082Z"}',
  '2025-06-05T00:42:07.082Z'
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

-- Record 235: 포스텍 홀딩스 4호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20120010',
  '포스텍 홀딩스 4호 투자조합',
  7500000000,
  '2020-08-10',
  'Active',
  '포항공과대학교기술지주',
  'VCS_API_SCRAPER',
  'AS20200390',
  '포항공과대학교기술지주',
  '산업코드: 5 | 조성총액: 75.0억원',
  '2030-08-09',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20200390","mother_fund_id":"MF00000001","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"75.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.082Z"}',
  '2025-06-05T00:42:07.082Z'
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

-- Record 236: 포스텍 홀딩스 3호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20120010',
  '포스텍 홀딩스 3호 투자조합',
  5000000000,
  '2019-12-03',
  'Active',
  '포항공과대학교기술지주',
  'VCS_API_SCRAPER',
  'AS20190549',
  '포항공과대학교기술지주',
  '산업코드: 2 | 조성총액: 50.0억원',
  '2029-12-02',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20190549","mother_fund_id":"MF00000001","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"50.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.082Z"}',
  '2025-06-05T00:42:07.082Z'
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

-- Record 237: 포스텍 홀딩스 2호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20120010',
  '포스텍 홀딩스 2호 개인투자조합',
  4000000000,
  '2018-11-13',
  'Active',
  '포항공과대학교기술지주',
  'VCS_API_SCRAPER',
  'AS20180321',
  '포항공과대학교기술지주',
  '산업코드: 2 | 조성총액: 40.0억원',
  '2025-11-12',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20180321","mother_fund_id":"MF00000008","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"40.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.082Z"}',
  '2025-06-05T00:42:07.082Z'
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

-- Record 238: 포스텍 경북 챌린지 씨드 1호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20120010',
  '포스텍 경북 챌린지 씨드 1호 개인투자조합',
  5000000000,
  '2018-09-03',
  'Active',
  '포항공과대학교기술지주',
  'VCS_API_SCRAPER',
  'AS20180213',
  '포항공과대학교기술지주',
  '산업코드: 2 | 조성총액: 50.0억원',
  '2028-09-02',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20180213","mother_fund_id":"MF00000001","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"50.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.082Z"}',
  '2025-06-05T00:42:07.082Z'
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

-- Record 239: 포스코-KB 조선업 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP19900001',
  '포스코-KB 조선업 투자조합',
  40000000000,
  '2017-06-22',
  'Active',
  '케이비인베스트먼트',
  'VCS_API_SCRAPER',
  'AS20170062',
  '케이비인베스트먼트',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 10 | 산업코드: 3 | 조성총액: 400.0억원',
  '2025-06-21',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20170062","mother_fund_id":"MF00000001","investment_character_code":"10","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"400.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.082Z"}',
  '2025-06-05T00:42:07.082Z'
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

-- Record 240: 포스코 부산 지역뉴딜 벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP19970007',
  '포스코 부산 지역뉴딜 벤처투자조합',
  25000000000,
  '2021-12-29',
  'Active',
  '포스코기술투자',
  'VCS_API_SCRAPER',
  'AS20211447',
  '포스코기술투자',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 18 | 산업코드: 8 | 조성총액: 250.0억원',
  '2029-12-28',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20211447","mother_fund_id":"MF00000015","investment_character_code":"18","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"250.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.082Z"}',
  '2025-06-05T00:42:07.082Z'
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

-- Record 241: 포스코 문화융합콘텐츠펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP19970007',
  '포스코 문화융합콘텐츠펀드',
  30000000000,
  '2016-09-26',
  'Active',
  '포스코기술투자',
  'VCS_API_SCRAPER',
  'AS20160077',
  '포스코기술투자',
  '투자분야: 문화 | 세부분야: 문화 기타 | 투자성격코드: 24 | 산업코드: 6 | 조성총액: 300.0억원',
  '2025-09-25',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20160077","mother_fund_id":"MF00000001","investment_character_code":"24","industry_code":"6","investment_field_type":"문화","investment_field_detail_type":"문화 기타","formation_total_amount":"300.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.082Z"}',
  '2025-06-05T00:42:07.082Z'
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

-- Record 242: 포스코 4차 산업혁명 펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP19970007',
  '포스코 4차 산업혁명 펀드',
  21000000000,
  '2017-12-29',
  'Active',
  '포스코기술투자',
  'VCS_API_SCRAPER',
  'AS20180049',
  '포스코기술투자',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 02 | 산업코드: 2 | 조성총액: 210.0억원',
  '2025-12-28',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20180049","mother_fund_id":"MF00000001","investment_character_code":"02","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"210.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.082Z"}',
  '2025-06-05T00:42:07.082Z'
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

-- Record 243: 펫케어초기스타트업 개인투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20140013',
  '펫케어초기스타트업 개인투자조합1호',
  1350000000,
  '2021-10-01',
  'Active',
  '더인벤션랩',
  'VCS_API_SCRAPER',
  'AS20210942',
  '더인벤션랩',
  '산업코드: 2 | 조성총액: 13.5억원',
  '2026-10-31',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20210942","mother_fund_id":"","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"13.5","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.082Z"}',
  '2025-06-05T00:42:07.082Z'
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

-- Record 244: 펜처 한국영화 메인투자 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20190265',
  '펜처 한국영화 메인투자 투자조합',
  42000000000,
  '2024-08-07',
  'Active',
  '펜처인베스트',
  'VCS_API_SCRAPER',
  'AS20240752',
  '펜처인베스트',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 24 | 산업코드: 6 | 조성총액: 420.0억원',
  '2031-08-06',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20240752","mother_fund_id":"MF00000001","investment_character_code":"24","industry_code":"6","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"420.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.082Z"}',
  '2025-06-05T00:42:07.082Z'
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

-- Record 245: 펜처 케이-콘텐츠 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20190265',
  '펜처 케이-콘텐츠 투자조합',
  101100000000,
  '2022-11-16',
  'Active',
  '펜처인베스트',
  'VCS_API_SCRAPER',
  'AS20221309',
  '펜처인베스트',
  '투자분야: 문화 | 세부분야: 영상(영화+드라마+애니메이션) | 투자성격코드: 24 | 산업코드: 6 | 조성총액: 1011.0억원',
  '2030-11-15',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20221309","mother_fund_id":"","investment_character_code":"24","industry_code":"6","investment_field_type":"문화","investment_field_detail_type":"영상(영화+드라마+애니메이션)","formation_total_amount":"1011.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.082Z"}',
  '2025-06-05T00:42:07.082Z'
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

-- Record 246: 펜처 중저예산영화전문 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20190265',
  '펜처 중저예산영화전문 투자조합',
  20100000000,
  '2022-09-08',
  'Active',
  '펜처인베스트',
  'VCS_API_SCRAPER',
  'AS20221047',
  '펜처인베스트',
  '투자분야: 문화 | 세부분야: 영상(영화+드라마+애니메이션) | 투자성격코드: 24 | 산업코드: 6 | 조성총액: 201.0억원',
  '2028-09-07',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20221047","mother_fund_id":"MF00000001","investment_character_code":"24","industry_code":"6","investment_field_type":"문화","investment_field_detail_type":"영상(영화+드라마+애니메이션)","formation_total_amount":"201.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.082Z"}',
  '2025-06-05T00:42:07.082Z'
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

-- Record 247: 펜처 바이오 텐베거 투자조합 제1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20190265',
  '펜처 바이오 텐베거 투자조합 제1호',
  3000000000,
  '2020-02-21',
  'Active',
  '펜처인베스트',
  'VCS_API_SCRAPER',
  'AS20200078',
  '펜처인베스트',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 01 | 산업코드: 5 | 조성총액: 30.0억원',
  '2026-02-20',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20200078","mother_fund_id":"","investment_character_code":"01","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"30.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.082Z"}',
  '2025-06-05T00:42:07.082Z'
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

-- Record 248: 펜처 더블헬릭스 벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20190265',
  '펜처 더블헬릭스 벤처투자조합',
  4500000000,
  '2020-12-21',
  'Active',
  '펜처인베스트',
  'VCS_API_SCRAPER',
  'AS20200820',
  '펜처인베스트',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 04 | 산업코드: 5 | 조성총액: 45.0억원',
  '2025-12-20',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20200820","mother_fund_id":"","investment_character_code":"04","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"45.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.082Z"}',
  '2025-06-05T00:42:07.082Z'
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

-- Record 249: 펜처 글로벌콘텐츠 IP 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20190265',
  '펜처 글로벌콘텐츠 IP 투자조합',
  50050000000,
  '2024-08-20',
  'Active',
  '펜처인베스트',
  'VCS_API_SCRAPER',
  'AS20240795',
  '펜처인베스트',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 24 | 산업코드: 6 | 조성총액: 500.5억원',
  '2032-08-19',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20240795","mother_fund_id":"MF00000001","investment_character_code":"24","industry_code":"6","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"500.5","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.082Z"}',
  '2025-06-05T00:42:07.082Z'
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

-- Record 250: 펜마이지스타투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20220274',
  '펜마이지스타투자조합1호',
  300000000,
  '2024-02-15',
  'Active',
  '펜벤처스코리아',
  'VCS_API_SCRAPER',
  'AS20240089',
  '펜벤처스코리아',
  '산업코드: 1 | 조성총액: 3.0억원',
  '2032-02-14',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20240089","mother_fund_id":"","investment_character_code":"","industry_code":"1","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"3.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.082Z"}',
  '2025-06-05T00:42:07.082Z'
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

-- Exact Batch 5 completed! 50 fund records processed.
-- Progress: 250/3689 total records

