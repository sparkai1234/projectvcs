-- VCS Fund EXACT UPSERT Batch 36/74 (Records 1751-1800)
-- EXACT: Uses actual fund_table schema columns
-- Generated from VCS API Scraper fund data
-- Generated at: 2025-06-05T00:42:07.211Z
-- Schema: Exact match to actual fund_table structure

-- EXACT FUND DATA (UPSERT - Safe for Duplicates)
-- Processing 50 fund records
-- Will INSERT new records or UPDATE existing ones

-- Record 1751: 어나더브레인 엔젤시드 개인투자조합6호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200215',
  '어나더브레인 엔젤시드 개인투자조합6호',
  100000000,
  '2023-09-21',
  'Active',
  '어나더브레인',
  'VCS_API_SCRAPER',
  'AS20230800',
  '어나더브레인',
  '산업코드: 8 | 조성총액: 1.0억원',
  '2028-09-20',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20230800","mother_fund_id":"","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"1.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.211Z"}',
  '2025-06-05T00:42:07.211Z'
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

-- Record 1752: 어나더브레인 엔젤시드 개인투자조합5호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200215',
  '어나더브레인 엔젤시드 개인투자조합5호',
  100000000,
  '2023-11-29',
  'Active',
  '어나더브레인',
  'VCS_API_SCRAPER',
  'AS20231129',
  '어나더브레인',
  '산업코드: 8 | 조성총액: 1.0억원',
  '2028-11-28',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20231129","mother_fund_id":"","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"1.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.211Z"}',
  '2025-06-05T00:42:07.211Z'
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

-- Record 1753: 어나더브레인 엔젤시드 개인투자조합 9호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200215',
  '어나더브레인 엔젤시드 개인투자조합 9호',
  100000000,
  '2024-04-29',
  'Active',
  '어나더브레인',
  'VCS_API_SCRAPER',
  'AS20240354',
  '어나더브레인',
  '산업코드: 7 | 조성총액: 1.0억원',
  '2029-12-31',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20240354","mother_fund_id":"","investment_character_code":"","industry_code":"7","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"1.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.211Z"}',
  '2025-06-05T00:42:07.211Z'
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

-- Record 1754: 어나더브레인 엔젤시드 개인투자조합 8호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200215',
  '어나더브레인 엔젤시드 개인투자조합 8호',
  1330000000,
  '2024-04-18',
  'Active',
  '어나더브레인',
  'VCS_API_SCRAPER',
  'AS20240291',
  '어나더브레인',
  '산업코드: 2 | 조성총액: 13.3억원',
  '2029-12-31',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20240291","mother_fund_id":"","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"13.3","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.211Z"}',
  '2025-06-05T00:42:07.211Z'
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

-- Record 1755: 어나더브레인 엔젤시드 개인투자조합 7호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200215',
  '어나더브레인 엔젤시드 개인투자조합 7호',
  700000000,
  '2023-12-21',
  'Active',
  '어나더브레인',
  'VCS_API_SCRAPER',
  'AS20231304',
  '어나더브레인',
  '산업코드: 9 | 조성총액: 7.0억원',
  '2028-12-20',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20231304","mother_fund_id":"","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"7.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.211Z"}',
  '2025-06-05T00:42:07.211Z'
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

-- Record 1756: 어나더브레인 엔젤시드 개인투자조합 4호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200215',
  '어나더브레인 엔젤시드 개인투자조합 4호',
  610000000,
  '2022-12-19',
  'Active',
  '어나더브레인',
  'VCS_API_SCRAPER',
  'AS20221460',
  '어나더브레인',
  '산업코드: 8 | 조성총액: 6.1억원',
  '2027-12-31',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20221460","mother_fund_id":"","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"6.1","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.211Z"}',
  '2025-06-05T00:42:07.211Z'
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

-- Record 1757: 어나더브레인 엔젤시드 개인투자조합 3호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200215',
  '어나더브레인 엔젤시드 개인투자조합 3호',
  120000000,
  '2023-06-08',
  'Active',
  '어나더브레인',
  'VCS_API_SCRAPER',
  'AS20230466',
  '어나더브레인',
  '산업코드: 8 | 조성총액: 1.2억원',
  '2028-12-31',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20230466","mother_fund_id":"","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"1.2","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.211Z"}',
  '2025-06-05T00:42:07.211Z'
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

-- Record 1758: 어나더브레인 엔젤시드 개인투자조합 2호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200215',
  '어나더브레인 엔젤시드 개인투자조합 2호',
  390000000,
  '2022-10-05',
  'Active',
  '어나더브레인',
  'VCS_API_SCRAPER',
  'AS20221089',
  '어나더브레인',
  '산업코드: 9 | 조성총액: 3.9억원',
  '2027-12-31',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20221089","mother_fund_id":"","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"3.9","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.211Z"}',
  '2025-06-05T00:42:07.211Z'
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

-- Record 1759: 어나더브레인 엔젤시드 개인투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200215',
  '어나더브레인 엔젤시드 개인투자조합 1호',
  110000000,
  '2022-07-08',
  'Active',
  '어나더브레인',
  'VCS_API_SCRAPER',
  'AS20220752',
  '어나더브레인',
  '산업코드: 8 | 조성총액: 1.1억원',
  '2027-12-31',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20220752","mother_fund_id":"","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"1.1","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.211Z"}',
  '2025-06-05T00:42:07.211Z'
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

-- Record 1760: 어나더브레인 엔젤시드 개인투자조합 10호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200215',
  '어나더브레인 엔젤시드 개인투자조합 10호',
  220000000,
  '2024-08-08',
  'Active',
  '어나더브레인',
  'VCS_API_SCRAPER',
  'AS20240719',
  '어나더브레인',
  '산업코드: 8 | 조성총액: 2.2억원',
  '2029-12-31',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20240719","mother_fund_id":"","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"2.2","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.211Z"}',
  '2025-06-05T00:42:07.211Z'
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

-- Record 1761: 어나더브레인 에스비엔젤 클럽 개인투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200215',
  '어나더브레인 에스비엔젤 클럽 개인투자조합1호',
  1000000000,
  '2024-08-05',
  'Active',
  '어나더브레인',
  'VCS_API_SCRAPER',
  'AS20240691',
  '어나더브레인',
  '산업코드: 2 | 조성총액: 10.0억원',
  '2029-12-31',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20240691","mother_fund_id":"","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"10.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.211Z"}',
  '2025-06-05T00:42:07.211Z'
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

-- Record 1762: 어나더브레인 벤처투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200215',
  '어나더브레인 벤처투자조합 1호',
  1020000000,
  '2024-12-23',
  'Active',
  '어나더브레인',
  'VCS_API_SCRAPER',
  'AS20241416',
  '어나더브레인',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 28 | 산업코드: 2 | 조성총액: 10.2억원',
  '2031-12-22',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20241416","mother_fund_id":"","investment_character_code":"28","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"10.2","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.211Z"}',
  '2025-06-05T00:42:07.211Z'
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

-- Record 1763: 어나더브레인 메디컬 벤처투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200215',
  '어나더브레인 메디컬 벤처투자조합 1호',
  1000000000,
  '2024-06-12',
  'Active',
  '어나더브레인',
  'VCS_API_SCRAPER',
  'AS20240516',
  '어나더브레인',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 04 | 산업코드: 8 | 조성총액: 10.0억원',
  '2031-06-11',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20240516","mother_fund_id":"","investment_character_code":"04","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"10.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.211Z"}',
  '2025-06-05T00:42:07.211Z'
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

-- Record 1764: 어나더브레인 글로벌 스타트업 벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200215',
  '어나더브레인 글로벌 스타트업 벤처투자조합',
  6550000000,
  '2022-09-20',
  'Active',
  '어나더브레인',
  'VCS_API_SCRAPER',
  'AS20221075',
  '어나더브레인',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 20 | 산업코드: 8 | 조성총액: 65.5억원',
  '2027-09-19',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20221075","mother_fund_id":"","investment_character_code":"20","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"65.5","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.211Z"}',
  '2025-06-05T00:42:07.211Z'
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

-- Record 1765: 어나더브레인 개인투자조합3호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200215',
  '어나더브레인 개인투자조합3호',
  550000000,
  '2024-12-17',
  'Active',
  '어나더브레인',
  'VCS_API_SCRAPER',
  'AS20241324',
  '어나더브레인',
  '산업코드: 8 | 조성총액: 5.5억원',
  '2029-12-31',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20241324","mother_fund_id":"","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"5.5","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.211Z"}',
  '2025-06-05T00:42:07.211Z'
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

-- Record 1766: 어나더브레인 개인투자조합 7호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200215',
  '어나더브레인 개인투자조합 7호',
  100000000,
  '2024-12-30',
  'Active',
  '어나더브레인',
  'VCS_API_SCRAPER',
  'AS20241393',
  '어나더브레인',
  '산업코드: 5 | 조성총액: 1.0억원',
  '2029-12-31',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20241393","mother_fund_id":"","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"1.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.211Z"}',
  '2025-06-05T00:42:07.211Z'
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

-- Record 1767: 어나더브레인 개인투자조합 6호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200215',
  '어나더브레인 개인투자조합 6호',
  110000000,
  '2024-12-10',
  'Active',
  '어나더브레인',
  'VCS_API_SCRAPER',
  'AS20241256',
  '어나더브레인',
  '산업코드: 8 | 조성총액: 1.1억원',
  '2029-12-31',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20241256","mother_fund_id":"","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"1.1","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.211Z"}',
  '2025-06-05T00:42:07.211Z'
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

-- Record 1768: 어나더브레인 개인투자조합 5호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200215',
  '어나더브레인 개인투자조합 5호',
  100000000,
  '2024-12-02',
  'Active',
  '어나더브레인',
  'VCS_API_SCRAPER',
  'AS20241229',
  '어나더브레인',
  '산업코드: 8 | 조성총액: 1.0억원',
  '2029-12-31',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20241229","mother_fund_id":"","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"1.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.211Z"}',
  '2025-06-05T00:42:07.212Z'
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

-- Record 1769: 어나더브레인 개인투자조합 4호 
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200215',
  '어나더브레인 개인투자조합 4호 ',
  100000000,
  '2024-11-27',
  'Active',
  '어나더브레인',
  'VCS_API_SCRAPER',
  'AS20241193',
  '어나더브레인',
  '산업코드: 8 | 조성총액: 1.0억원',
  '2029-12-31',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20241193","mother_fund_id":"","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"1.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.212Z"}',
  '2025-06-05T00:42:07.212Z'
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

-- Record 1770: 어나더브레인 개인투자조합 2호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200215',
  '어나더브레인 개인투자조합 2호',
  100000000,
  '2024-10-22',
  'Active',
  '어나더브레인',
  'VCS_API_SCRAPER',
  'AS20240957',
  '어나더브레인',
  '산업코드: 2 | 조성총액: 1.0억원',
  '2029-12-31',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20240957","mother_fund_id":"","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"1.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.212Z"}',
  '2025-06-05T00:42:07.212Z'
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

-- Record 1771: 어나더브레인 개인투자조합 1호 
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200215',
  '어나더브레인 개인투자조합 1호 ',
  510000000,
  '2024-05-28',
  'Active',
  '어나더브레인',
  'VCS_API_SCRAPER',
  'AS20240457',
  '어나더브레인',
  '산업코드: 8 | 조성총액: 5.1억원',
  '2029-12-31',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20240457","mother_fund_id":"","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"5.1","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.212Z"}',
  '2025-06-05T00:42:07.212Z'
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

-- Record 1772: 어 모어 뷰티풀 챌린지 펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20110015',
  '어 모어 뷰티풀 챌린지 펀드',
  3000000000,
  '2022-11-29',
  'Active',
  '엠와이소셜컴퍼니',
  'VCS_API_SCRAPER',
  'AS20221371',
  '엠와이소셜컴퍼니',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 20 | 산업코드: 2 | 조성총액: 30.0억원',
  '2029-11-28',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20221371","mother_fund_id":"","investment_character_code":"20","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"30.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.212Z"}',
  '2025-06-05T00:42:07.212Z'
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

-- Record 1773: 앨리스파트너스 9호 벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20240710',
  '앨리스파트너스 9호 벤처투자조합',
  2020000000,
  '2025-01-14',
  'Active',
  '앨리스파트너스',
  'VCS_API_SCRAPER',
  'AS20250045',
  '앨리스파트너스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 25 | 산업코드: 9 | 조성총액: 20.2억원',
  '2030-01-13',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20250045","mother_fund_id":"","investment_character_code":"25","industry_code":"9","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"20.2","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.212Z"}',
  '2025-06-05T00:42:07.212Z'
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

-- Record 1774: 앤파트너스제일호벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20220350',
  '앤파트너스제일호벤처투자조합',
  18890000000,
  '2022-06-28',
  'Active',
  '앤파트너스',
  'VCS_API_SCRAPER',
  'AS20220719',
  '앤파트너스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 02 | 산업코드: 2 | 조성총액: 188.9억원',
  '2030-06-27',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20220719","mother_fund_id":"","investment_character_code":"02","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"188.9","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.212Z"}',
  '2025-06-05T00:42:07.212Z'
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

-- Record 1775: 앤틀러울트라얼리펀드1-A
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20210653',
  '앤틀러울트라얼리펀드1-A',
  13240000000,
  '2022-07-25',
  'Active',
  '앤틀러코리아',
  'VCS_API_SCRAPER',
  'AS20220852',
  '앤틀러코리아',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 20 | 산업코드: 2 | 조성총액: 132.4억원',
  '2030-07-24',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20220852","mother_fund_id":"","investment_character_code":"20","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"132.4","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.212Z"}',
  '2025-06-05T00:42:07.212Z'
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

-- Record 1776: 앤틀러울트라얼리투자조합1-B
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20210653',
  '앤틀러울트라얼리투자조합1-B',
  5200000000,
  '2022-08-12',
  'Active',
  '앤틀러코리아',
  'VCS_API_SCRAPER',
  'AS20220869',
  '앤틀러코리아',
  '산업코드: 2 | 조성총액: 52.0억원',
  '2030-08-11',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20220869","mother_fund_id":"","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"52.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.212Z"}',
  '2025-06-05T00:42:07.212Z'
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

-- Record 1777: 앤콘텐츠벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20220350',
  '앤콘텐츠벤처투자조합',
  11200000000,
  '2022-04-18',
  'Active',
  '앤파트너스',
  'VCS_API_SCRAPER',
  'AS20220433',
  '앤파트너스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 24 | 산업코드: 6 | 조성총액: 112.0억원',
  '2027-04-17',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20220433","mother_fund_id":"","investment_character_code":"24","industry_code":"6","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"112.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.212Z"}',
  '2025-06-05T00:42:07.212Z'
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

-- Record 1778: 앤디스-비디씨투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20220578',
  '앤디스-비디씨투자조합1호',
  2000000000,
  '2025-03-10',
  'Active',
  '비디씨엑셀러레이터',
  'VCS_API_SCRAPER',
  'AS20250175',
  '비디씨엑셀러레이터',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 01 | 산업코드: 9 | 조성총액: 20.0억원',
  '2030-03-09',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20250175","mother_fund_id":"","investment_character_code":"01","industry_code":"9","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"20.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.212Z"}',
  '2025-06-05T00:42:07.212Z'
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

-- Record 1779: 액틴개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200370',
  '액틴개인투자조합',
  100000000,
  '2022-04-19',
  'Active',
  '액틴',
  'VCS_API_SCRAPER',
  'AS20220081',
  '액틴',
  '산업코드: 8 | 조성총액: 1.0억원',
  '2027-04-18',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20220081","mother_fund_id":"","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"1.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.212Z"}',
  '2025-06-05T00:42:07.212Z'
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

-- Record 1780: 액티브시니어초기스타트업 개인투자조합2호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20140013',
  '액티브시니어초기스타트업 개인투자조합2호',
  370000000,
  '2023-05-24',
  'Active',
  '더인벤션랩',
  'VCS_API_SCRAPER',
  'AS20230401',
  '더인벤션랩',
  '산업코드: 2 | 조성총액: 3.7억원',
  '2028-05-23',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20230401","mother_fund_id":"","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"3.7","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.212Z"}',
  '2025-06-05T00:42:07.212Z'
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

-- Record 1781: 액티브시니어초기스타트업 개인투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20140013',
  '액티브시니어초기스타트업 개인투자조합1호',
  280000000,
  '2022-05-09',
  'Active',
  '더인벤션랩',
  'VCS_API_SCRAPER',
  'AS20220474',
  '더인벤션랩',
  '산업코드: 2 | 조성총액: 2.8억원',
  '2027-06-30',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20220474","mother_fund_id":"","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"2.8","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.212Z"}',
  '2025-06-05T00:42:07.212Z'
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

-- Record 1782: 애드벤처스이에스지개인투자조합제1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20210679',
  '애드벤처스이에스지개인투자조합제1호',
  620000000,
  '2022-07-25',
  'Active',
  '애드벤처스',
  'VCS_API_SCRAPER',
  'AS20220821',
  '애드벤처스',
  '산업코드: 3 | 조성총액: 6.2억원',
  '2028-07-24',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20220821","mother_fund_id":"","investment_character_code":"","industry_code":"3","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"6.2","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.212Z"}',
  '2025-06-05T00:42:07.212Z'
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

-- Record 1783: 애드벤처스에이아이 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20210679',
  '애드벤처스에이아이 개인투자조합',
  300000000,
  '2024-01-02',
  'Active',
  '애드벤처스',
  'VCS_API_SCRAPER',
  'AS20231340',
  '애드벤처스',
  '산업코드: 2 | 조성총액: 3.0억원',
  '2030-01-01',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20231340","mother_fund_id":"","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"3.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.212Z"}',
  '2025-06-05T00:42:07.212Z'
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

-- Record 1784: 알파원 프로젝트 투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20180010',
  '알파원 프로젝트 투자조합 1호',
  6900000000,
  '2022-03-02',
  'Active',
  '델타인베스트먼트',
  'VCS_API_SCRAPER',
  'AS20220212',
  '델타인베스트먼트',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 16 | 산업코드: 2 | 조성총액: 69.0억원',
  '2027-03-01',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20220212","mother_fund_id":"","investment_character_code":"16","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"69.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.212Z"}',
  '2025-06-05T00:42:07.212Z'
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

-- Record 1785: 알파원 프로젝트 투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200373',
  '알파원 프로젝트 투자조합 1호',
  6900000000,
  '2022-03-02',
  'Active',
  '알파원인베스트먼트',
  'VCS_API_SCRAPER',
  'AS20220212',
  '알파원인베스트먼트',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 16 | 산업코드: 2 | 조성총액: 69.0억원',
  '2027-03-01',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20220212","mother_fund_id":"","investment_character_code":"16","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"69.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.212Z"}',
  '2025-06-05T00:42:07.212Z'
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

-- Record 1786: 알파원 알파라이징 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200373',
  '알파원 알파라이징 투자조합',
  17300000000,
  '2022-12-14',
  'Active',
  '알파원인베스트먼트',
  'VCS_API_SCRAPER',
  'AS20221480',
  '알파원인베스트먼트',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 20 | 산업코드: 5 | 조성총액: 173.0억원',
  '2030-12-13',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20221480","mother_fund_id":"MF00000001","investment_character_code":"20","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"173.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.212Z"}',
  '2025-06-05T00:42:07.212Z'
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

-- Record 1787: 알파랩xTSB 외식벤처 2호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20210169',
  '알파랩xTSB 외식벤처 2호',
  600000000,
  '2024-05-16',
  'Active',
  '알파랩',
  'VCS_API_SCRAPER',
  'AS20240411',
  '알파랩',
  '산업코드: 8 | 조성총액: 6.0억원',
  '2029-05-15',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20240411","mother_fund_id":"","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"6.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.212Z"}',
  '2025-06-05T00:42:07.212Z'
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

-- Record 1788: 알파랩xTSB 외식벤처 1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20210169',
  '알파랩xTSB 외식벤처 1호',
  270000000,
  '2023-11-20',
  'Active',
  '알파랩',
  'VCS_API_SCRAPER',
  'AS20231098',
  '알파랩',
  '산업코드: 8 | 조성총액: 2.7억원',
  '2028-11-19',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20231098","mother_fund_id":"","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"2.7","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.212Z"}',
  '2025-06-05T00:42:07.212Z'
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

-- Record 1789: 알파랩(xTSB) 외식벤처 3호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20210169',
  '알파랩(xTSB) 외식벤처 3호',
  960000000,
  '2024-10-22',
  'Active',
  '알파랩',
  'VCS_API_SCRAPER',
  'AS20240976',
  '알파랩',
  '산업코드: 8 | 조성총액: 9.6억원',
  '2029-10-21',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20240976","mother_fund_id":"","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"9.6","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.212Z"}',
  '2025-06-05T00:42:07.212Z'
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

-- Record 1790: 알파랩 알로하앤코 투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20210169',
  '알파랩 알로하앤코 투자조합 1호',
  100000000,
  '2025-01-22',
  'Active',
  '알파랩',
  'VCS_API_SCRAPER',
  'AS20250042',
  '알파랩',
  '산업코드: 9 | 조성총액: 1.0억원',
  '2030-01-21',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20250042","mother_fund_id":"","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"1.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.212Z"}',
  '2025-06-05T00:42:07.212Z'
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

-- Record 1791: 알파랩 다니엘(X Daniel) 외식벤처개인투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20210169',
  '알파랩 다니엘(X Daniel) 외식벤처개인투자조합 1호',
  100000000,
  '2024-08-01',
  'Active',
  '알파랩',
  'VCS_API_SCRAPER',
  'AS20240694',
  '알파랩',
  '산업코드: 9 | 조성총액: 1.0억원',
  '2029-07-31',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20240694","mother_fund_id":"","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"1.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.212Z"}',
  '2025-06-05T00:42:07.212Z'
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

-- Record 1792: 알파랩 공간로드 투자조합 2호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20210169',
  '알파랩 공간로드 투자조합 2호',
  200000000,
  '2025-01-14',
  'Active',
  '알파랩',
  'VCS_API_SCRAPER',
  'AS20250020',
  '알파랩',
  '산업코드: 9 | 조성총액: 2.0억원',
  '2029-01-13',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20250020","mother_fund_id":"","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"2.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.212Z"}',
  '2025-06-05T00:42:07.213Z'
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

-- Record 1793: 알파랩 공간로드 투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20210169',
  '알파랩 공간로드 투자조합 1호',
  200000000,
  '2024-11-18',
  'Active',
  '알파랩',
  'VCS_API_SCRAPER',
  'AS20241107',
  '알파랩',
  '산업코드: 9 | 조성총액: 2.0억원',
  '2029-11-17',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20241107","mother_fund_id":"","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"2.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.213Z"}',
  '2025-06-05T00:42:07.213Z'
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

-- Record 1794: 알파넥스트미디어이노베이션펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20000027',
  '알파넥스트미디어이노베이션펀드',
  197300000000,
  '2016-12-13',
  'Active',
  '에스비브이에이',
  'VCS_API_SCRAPER',
  'AS20160224',
  '에스비브이에이',
  '투자분야: 일반 | 세부분야: IT | 투자성격코드: 24 | 산업코드: 2 | 조성총액: 1973.0억원',
  '2026-12-12',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20160224","mother_fund_id":"MF00000001","investment_character_code":"24","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"IT","formation_total_amount":"1973.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.213Z"}',
  '2025-06-05T00:42:07.213Z'
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

-- Record 1795: 알토란5호유니콘창업투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200418',
  '알토란5호유니콘창업투자조합',
  600000000,
  '2024-05-14',
  'Active',
  '알토란벤처스',
  'VCS_API_SCRAPER',
  'AS20240406',
  '알토란벤처스',
  '산업코드: 2 | 조성총액: 6.0억원',
  '2029-05-13',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20240406","mother_fund_id":"","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"6.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.213Z"}',
  '2025-06-05T00:42:07.213Z'
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

-- Record 1796: 알토란4호유니콘창업투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200418',
  '알토란4호유니콘창업투자조합',
  170000000,
  '2023-06-20',
  'Active',
  '알토란벤처스',
  'VCS_API_SCRAPER',
  'AS20230490',
  '알토란벤처스',
  '산업코드: 8 | 조성총액: 1.7억원',
  '2028-06-19',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20230490","mother_fund_id":"","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"1.7","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.213Z"}',
  '2025-06-05T00:42:07.213Z'
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

-- Record 1797: 알토란3호 유니콘창업투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200418',
  '알토란3호 유니콘창업투자조합',
  130000000,
  '2022-12-20',
  'Active',
  '알토란벤처스',
  'VCS_API_SCRAPER',
  'AS20221461',
  '알토란벤처스',
  '산업코드: 8 | 조성총액: 1.3억원',
  '2027-12-19',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20221461","mother_fund_id":"","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"1.3","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.213Z"}',
  '2025-06-05T00:42:07.213Z'
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

-- Record 1798: 알토란2호유니콘창업투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200418',
  '알토란2호유니콘창업투자조합',
  100000000,
  '2022-07-08',
  'Active',
  '알토란벤처스',
  'VCS_API_SCRAPER',
  'AS20220743',
  '알토란벤처스',
  '산업코드: 1 | 조성총액: 1.0억원',
  '2027-07-07',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20220743","mother_fund_id":"","investment_character_code":"","industry_code":"1","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"1.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.213Z"}',
  '2025-06-05T00:42:07.213Z'
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

-- Record 1799: 알토란1호유니콘창업 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200418',
  '알토란1호유니콘창업 투자조합',
  100000000,
  '2021-12-14',
  'Active',
  '알토란벤처스',
  'VCS_API_SCRAPER',
  'AS20211283',
  '알토란벤처스',
  '산업코드: 1 | 조성총액: 1.0억원',
  '2026-12-13',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20211283","mother_fund_id":"","investment_character_code":"","industry_code":"1","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"1.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.213Z"}',
  '2025-06-05T00:42:07.213Z'
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

-- Record 1800: 알에스 개인투자조합 5호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20220541',
  '알에스 개인투자조합 5호',
  110000000,
  '2024-12-13',
  'Active',
  '시드버스',
  'VCS_API_SCRAPER',
  'AS20241301',
  '시드버스',
  '산업코드: 8 | 조성총액: 1.1억원',
  '2029-12-12',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20241301","mother_fund_id":"","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"1.1","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.213Z"}',
  '2025-06-05T00:42:07.213Z'
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

-- Exact Batch 36 completed! 50 fund records processed.
-- Progress: 1800/3689 total records

