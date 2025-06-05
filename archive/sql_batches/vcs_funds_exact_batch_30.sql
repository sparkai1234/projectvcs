-- VCS Fund EXACT UPSERT Batch 30/74 (Records 1451-1500)
-- EXACT: Uses actual fund_table schema columns
-- Generated from VCS API Scraper fund data
-- Generated at: 2025-06-05T00:42:07.180Z
-- Schema: Exact match to actual fund_table structure

-- EXACT FUND DATA (UPSERT - Safe for Duplicates)
-- Processing 50 fund records
-- Will INSERT new records or UPDATE existing ones

-- Record 1451: 엔슬 8호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20160031',
  '엔슬 8호 개인투자조합',
  180000000,
  '2022-04-08',
  'Active',
  '엔슬파트너스',
  'VCS_API_SCRAPER',
  'AS20220288',
  '엔슬파트너스',
  '산업코드: 8 | 조성총액: 1.8억원',
  '2027-04-07',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20220288","mother_fund_id":"","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"1.8","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.180Z"}',
  '2025-06-05T00:42:07.180Z'
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

-- Record 1452: 엔슬 7호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20160031',
  '엔슬 7호 개인투자조합',
  320000000,
  '2021-11-08',
  'Active',
  '엔슬파트너스',
  'VCS_API_SCRAPER',
  'AS20211041',
  '엔슬파트너스',
  '산업코드: 2 | 조성총액: 3.2억원',
  '2028-11-07',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20211041","mother_fund_id":"","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"3.2","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.180Z"}',
  '2025-06-05T00:42:07.180Z'
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

-- Record 1453: 엔슬 6호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20160031',
  '엔슬 6호 개인투자조합',
  210000000,
  '2021-10-29',
  'Active',
  '엔슬파트너스',
  'VCS_API_SCRAPER',
  'AS20211040',
  '엔슬파트너스',
  '산업코드: 2 | 조성총액: 2.1억원',
  '2028-10-28',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20211040","mother_fund_id":"","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"2.1","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.180Z"}',
  '2025-06-05T00:42:07.180Z'
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

-- Record 1454: 엔슬 4호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20160031',
  '엔슬 4호 개인투자조합',
  300000000,
  '2020-03-20',
  'Active',
  '엔슬파트너스',
  'VCS_API_SCRAPER',
  'AS20200133',
  '엔슬파트너스',
  '산업코드: 2 | 조성총액: 3.0억원',
  '2027-03-19',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20200133","mother_fund_id":"","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"3.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.180Z"}',
  '2025-06-05T00:42:07.180Z'
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

-- Record 1455: 엔슬 16호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20160031',
  '엔슬 16호 개인투자조합',
  110000000,
  '2024-02-13',
  'Active',
  '엔슬파트너스',
  'VCS_API_SCRAPER',
  'AS20240072',
  '엔슬파트너스',
  '산업코드: 3 | 조성총액: 1.1억원',
  '2030-02-12',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20240072","mother_fund_id":"","investment_character_code":"","industry_code":"3","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"1.1","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.180Z"}',
  '2025-06-05T00:42:07.180Z'
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

-- Record 1456: 엔슬 15호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20160031',
  '엔슬 15호 개인투자조합',
  200000000,
  '2023-06-27',
  'Active',
  '엔슬파트너스',
  'VCS_API_SCRAPER',
  'AS20230536',
  '엔슬파트너스',
  '산업코드: 2 | 조성총액: 2.0억원',
  '2029-06-26',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20230536","mother_fund_id":"","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"2.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.180Z"}',
  '2025-06-05T00:42:07.180Z'
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

-- Record 1457: 엔슬 14호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20160031',
  '엔슬 14호 개인투자조합',
  420000000,
  '2023-05-03',
  'Active',
  '엔슬파트너스',
  'VCS_API_SCRAPER',
  'AS20230339',
  '엔슬파트너스',
  '산업코드: 2 | 조성총액: 4.2억원',
  '2030-05-02',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20230339","mother_fund_id":"","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"4.2","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.180Z"}',
  '2025-06-05T00:42:07.180Z'
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

-- Record 1458: 엔슬 13호 벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20160031',
  '엔슬 13호 벤처투자조합',
  2050000000,
  '2023-05-03',
  'Active',
  '엔슬파트너스',
  'VCS_API_SCRAPER',
  'AS20230354',
  '엔슬파트너스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 20 | 산업코드: 2 | 조성총액: 20.5억원',
  '2030-05-02',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20230354","mother_fund_id":"","investment_character_code":"20","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"20.5","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.180Z"}',
  '2025-06-05T00:42:07.180Z'
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

-- Record 1459: 엔슬 11호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20160031',
  '엔슬 11호 개인투자조합',
  430000000,
  '2022-04-29',
  'Active',
  '엔슬파트너스',
  'VCS_API_SCRAPER',
  'AS20220428',
  '엔슬파트너스',
  '산업코드: 2 | 조성총액: 4.3억원',
  '2029-04-28',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20220428","mother_fund_id":"","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"4.3","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.180Z"}',
  '2025-06-05T00:42:07.180Z'
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

-- Record 1460: 엔슬 10호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20160031',
  '엔슬 10호 개인투자조합',
  550000000,
  '2022-03-31',
  'Active',
  '엔슬파트너스',
  'VCS_API_SCRAPER',
  'AS20220287',
  '엔슬파트너스',
  '산업코드: 2 | 조성총액: 5.5억원',
  '2028-03-30',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20220287","mother_fund_id":"","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"5.5","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.180Z"}',
  '2025-06-05T00:42:07.180Z'
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

-- Record 1461: 엔비에이치-코스넷 세미콘 넥스트 벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20160017',
  '엔비에이치-코스넷 세미콘 넥스트 벤처투자조합',
  2200000000,
  '2022-01-11',
  'Active',
  'NBH캐피탈',
  'VCS_API_SCRAPER',
  'AS20220036',
  'NBH캐피탈',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 25 | 산업코드: 3 | 조성총액: 22.0억원',
  '2027-01-10',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20220036","mother_fund_id":"","investment_character_code":"25","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"22.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.180Z"}',
  '2025-06-05T00:42:07.180Z'
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

-- Record 1462: 엔비에이치-코스넷 세미콘 그로스 벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20160017',
  '엔비에이치-코스넷 세미콘 그로스 벤처투자조합',
  10000000000,
  '2021-12-30',
  'Active',
  'NBH캐피탈',
  'VCS_API_SCRAPER',
  'AS20220001',
  'NBH캐피탈',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 25 | 산업코드: 1 | 조성총액: 100.0억원',
  '2026-12-29',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20220001","mother_fund_id":"","investment_character_code":"25","industry_code":"1","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"100.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.181Z"}',
  '2025-06-05T00:42:07.181Z'
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

-- Record 1463: 엔블록셀렉트투자조합제1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20210507',
  '엔블록셀렉트투자조합제1호',
  2020000000,
  '2024-03-18',
  'Active',
  '엔블록인베스트먼트',
  'VCS_API_SCRAPER',
  'AS20240208',
  '엔블록인베스트먼트',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 28 | 산업코드: 2 | 조성총액: 20.2억원',
  '2031-03-17',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20240208","mother_fund_id":"","investment_character_code":"28","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"20.2","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.181Z"}',
  '2025-06-05T00:42:07.181Z'
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

-- Record 1464: 엔브이씨-케이클라비스 2024 부산지역혁신 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20180040',
  '엔브이씨-케이클라비스 2024 부산지역혁신 투자조합',
  14000000000,
  '2025-04-23',
  'Active',
  '엔브이씨파트너스',
  'VCS_API_SCRAPER',
  'AS20250318',
  '엔브이씨파트너스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 18 | 산업코드: 9 | 조성총액: 140.0억원',
  '2033-04-22',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20250318","mother_fund_id":"MF00000022","investment_character_code":"18","industry_code":"9","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"140.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.181Z"}',
  '2025-06-05T00:42:07.181Z'
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

-- Record 1465: 엔브이씨 소부장 8호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20180040',
  '엔브이씨 소부장 8호 투자조합',
  4300000000,
  '2021-12-06',
  'Active',
  '엔브이씨파트너스',
  'VCS_API_SCRAPER',
  'AS20211235',
  '엔브이씨파트너스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 25 | 산업코드: 3 | 조성총액: 43.0억원',
  '2026-12-05',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20211235","mother_fund_id":"","investment_character_code":"25","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"43.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.181Z"}',
  '2025-06-05T00:42:07.181Z'
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

-- Record 1466: 엔브이씨 세컨더리 9호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20180040',
  '엔브이씨 세컨더리 9호 투자조합',
  4180000000,
  '2023-09-21',
  'Active',
  '엔브이씨파트너스',
  'VCS_API_SCRAPER',
  'AS20230854',
  '엔브이씨파트너스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 16 | 산업코드: 3 | 조성총액: 41.8억원',
  '2028-09-20',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20230854","mother_fund_id":"","investment_character_code":"16","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"41.8","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.181Z"}',
  '2025-06-05T00:42:07.181Z'
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

-- Record 1467: 엔브이씨 바이오헬스케어 2호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20180040',
  '엔브이씨 바이오헬스케어 2호 투자조합',
  3440000000,
  '2020-10-28',
  'Active',
  '엔브이씨파트너스',
  'VCS_API_SCRAPER',
  'AS20200601',
  '엔브이씨파트너스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 01 | 산업코드: 5 | 조성총액: 34.4억원',
  '2025-10-27',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20200601","mother_fund_id":"","investment_character_code":"01","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"34.4","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.181Z"}',
  '2025-06-05T00:42:07.181Z'
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

-- Record 1468: 엔브이씨 디지털 콘텐츠 6호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20180040',
  '엔브이씨 디지털 콘텐츠 6호 투자조합',
  2000000000,
  '2021-03-12',
  'Active',
  '엔브이씨파트너스',
  'VCS_API_SCRAPER',
  'AS20210193',
  '엔브이씨파트너스',
  '투자분야: 문화 | 세부분야: 문화 기타 | 투자성격코드: 24 | 산업코드: 6 | 조성총액: 20.0억원',
  '2026-03-11',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20210193","mother_fund_id":"","investment_character_code":"24","industry_code":"6","investment_field_type":"문화","investment_field_detail_type":"문화 기타","formation_total_amount":"20.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.181Z"}',
  '2025-06-05T00:42:07.181Z'
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

-- Record 1469: 엔브이씨 기술혁신 7호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20180040',
  '엔브이씨 기술혁신 7호 투자조합',
  2310000000,
  '2021-11-25',
  'Active',
  '엔브이씨파트너스',
  'VCS_API_SCRAPER',
  'AS20211190',
  '엔브이씨파트너스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 02 | 산업코드: 3 | 조성총액: 23.1억원',
  '2026-11-24',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20211190","mother_fund_id":"","investment_character_code":"02","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"23.1","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.181Z"}',
  '2025-06-05T00:42:07.181Z'
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

-- Record 1470: 엔브이씨 게임-컨텐츠 3호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20180040',
  '엔브이씨 게임-컨텐츠 3호 투자조합',
  3200000000,
  '2019-01-18',
  'Active',
  '엔브이씨파트너스',
  'VCS_API_SCRAPER',
  'AS20190030',
  '엔브이씨파트너스',
  '투자분야: 문화 | 세부분야: 문화 기타 | 투자성격코드: 25 | 산업코드: 6 | 조성총액: 32.0억원',
  '2025-12-31',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20190030","mother_fund_id":"","investment_character_code":"25","industry_code":"6","investment_field_type":"문화","investment_field_detail_type":"문화 기타","formation_total_amount":"32.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.181Z"}',
  '2025-06-05T00:42:07.181Z'
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

-- Record 1471: 엔브이씨 4차 산업혁명 5호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20180040',
  '엔브이씨 4차 산업혁명 5호 투자조합',
  2040000000,
  '2020-08-10',
  'Active',
  '엔브이씨파트너스',
  'VCS_API_SCRAPER',
  'AS20200408',
  '엔브이씨파트너스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 01 | 산업코드: 6 | 조성총액: 20.4억원',
  '2025-08-09',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20200408","mother_fund_id":"","investment_character_code":"01","industry_code":"6","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"20.4","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.181Z"}',
  '2025-06-05T00:42:07.181Z'
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

-- Record 1472: 엔브이씨 2019 바이오헬스케어 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20180040',
  '엔브이씨 2019 바이오헬스케어 투자조합',
  6120000000,
  '2019-10-22',
  'Active',
  '엔브이씨파트너스',
  'VCS_API_SCRAPER',
  'AS20190467',
  '엔브이씨파트너스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 04 | 산업코드: 5 | 조성총액: 61.2억원',
  '2026-10-21',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20190467","mother_fund_id":"","investment_character_code":"04","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"61.2","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.181Z"}',
  '2025-06-05T00:42:07.181Z'
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

-- Record 1473: 엔더블류브이피-BSK 코스메틱 투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20100012',
  '엔더블류브이피-BSK 코스메틱 투자조합 1호',
  2170000000,
  '2024-11-15',
  'Active',
  '비에스케이인베스트먼트',
  'VCS_API_SCRAPER',
  'AS20241142',
  '비에스케이인베스트먼트',
  '투자분야: 일반 | 세부분야: 부품소재 | 투자성격코드: 03 | 산업코드: 8 | 조성총액: 21.7억원',
  '2029-11-14',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20241142","mother_fund_id":"","investment_character_code":"03","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"부품소재","formation_total_amount":"21.7","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.181Z"}',
  '2025-06-05T00:42:07.181Z'
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

-- Record 1474: 엑스트라마일 임팩트 6호 벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20110015',
  '엑스트라마일 임팩트 6호 벤처투자조합',
  10000000000,
  '2023-11-13',
  'Active',
  '엠와이소셜컴퍼니',
  'VCS_API_SCRAPER',
  'AS20231070',
  '엠와이소셜컴퍼니',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 20 | 산업코드: 8 | 조성총액: 100.0억원',
  '2031-11-12',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20231070","mother_fund_id":"MF00000001","investment_character_code":"20","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"100.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.181Z"}',
  '2025-06-05T00:42:07.181Z'
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

-- Record 1475: 엑스트라마일 임팩트 5호 벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20110015',
  '엑스트라마일 임팩트 5호 벤처투자조합',
  6000000000,
  '2021-12-20',
  'Active',
  '엠와이소셜컴퍼니',
  'VCS_API_SCRAPER',
  'AS20211360',
  '엠와이소셜컴퍼니',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 24 | 산업코드: 2 | 조성총액: 60.0억원',
  '2029-12-19',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20211360","mother_fund_id":"MF00000001","investment_character_code":"24","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"60.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.181Z"}',
  '2025-06-05T00:42:07.181Z'
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

-- Record 1476: 엑스트라마일 임팩트 4호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20110015',
  '엑스트라마일 임팩트 4호 개인투자조합',
  640000000,
  '2022-06-21',
  'Active',
  '엠와이소셜컴퍼니',
  'VCS_API_SCRAPER',
  'AS20220666',
  '엠와이소셜컴퍼니',
  '산업코드: 8 | 조성총액: 6.4억원',
  '2029-06-20',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20220666","mother_fund_id":"","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"6.4","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.181Z"}',
  '2025-06-05T00:42:07.181Z'
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

-- Record 1477: 엑스트라마일 임팩트 3호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20110015',
  '엑스트라마일 임팩트 3호 개인투자조합',
  1050000000,
  '2021-08-12',
  'Active',
  '엠와이소셜컴퍼니',
  'VCS_API_SCRAPER',
  'AS20210701',
  '엠와이소셜컴퍼니',
  '산업코드: 2 | 조성총액: 10.5억원',
  '2028-08-11',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20210701","mother_fund_id":"","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"10.5","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.181Z"}',
  '2025-06-05T00:42:07.181Z'
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

-- Record 1478: 엑스트라마일 임팩트 2호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20110015',
  '엑스트라마일 임팩트 2호 개인투자조합',
  2000000000,
  '2020-02-25',
  'Active',
  '엠와이소셜컴퍼니',
  'VCS_API_SCRAPER',
  'AS20200085',
  '엠와이소셜컴퍼니',
  '산업코드: 8 | 조성총액: 20.0억원',
  '2027-02-24',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20200085","mother_fund_id":"MF00000001","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"20.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.181Z"}',
  '2025-06-05T00:42:07.181Z'
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

-- Record 1479: 엑스트라마일 임팩트 1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20110015',
  '엑스트라마일 임팩트 1호',
  1000000000,
  '2019-07-04',
  'Active',
  '엠와이소셜컴퍼니',
  'VCS_API_SCRAPER',
  'AS20190277',
  '엠와이소셜컴퍼니',
  '산업코드: 8 | 조성총액: 10.0억원',
  '2026-07-03',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20190277","mother_fund_id":"","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"10.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.181Z"}',
  '2025-06-05T00:42:07.181Z'
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

-- Record 1480: 엑스트라마일 베트남 1호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20110015',
  '엑스트라마일 베트남 1호 개인투자조합',
  260000000,
  '2023-07-12',
  'Active',
  '엠와이소셜컴퍼니',
  'VCS_API_SCRAPER',
  'AS20230579',
  '엠와이소셜컴퍼니',
  '산업코드: 8 | 조성총액: 2.6억원',
  '2031-07-11',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20230579","mother_fund_id":"","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"2.6","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.181Z"}',
  '2025-06-05T00:42:07.181Z'
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

-- Record 1481: 엑스퀘어드 포디움 벤처펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20220038',
  '엑스퀘어드 포디움 벤처펀드',
  2000000000,
  '2022-06-27',
  'Active',
  '엑스퀘어드',
  'VCS_API_SCRAPER',
  'AS20220713',
  '엑스퀘어드',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 16 | 산업코드: 8 | 조성총액: 20.0억원',
  '2027-06-26',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20220713","mother_fund_id":"","investment_character_code":"16","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"20.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.181Z"}',
  '2025-06-05T00:42:07.181Z'
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

-- Record 1482: 엑스퀘어드 디스커버리 벤처펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20220038',
  '엑스퀘어드 디스커버리 벤처펀드',
  2580000000,
  '2022-04-04',
  'Active',
  '엑스퀘어드',
  'VCS_API_SCRAPER',
  'AS20220378',
  '엑스퀘어드',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 16 | 산업코드: 8 | 조성총액: 25.8억원',
  '2027-04-03',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20220378","mother_fund_id":"","investment_character_code":"16","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"25.8","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.181Z"}',
  '2025-06-05T00:42:07.181Z'
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

-- Record 1483: 엑스퀘어드 넥스트 벤처펀드 제3호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20220038',
  '엑스퀘어드 넥스트 벤처펀드 제3호',
  25000000000,
  '2024-01-08',
  'Active',
  '엑스퀘어드',
  'VCS_API_SCRAPER',
  'AS20240019',
  '엑스퀘어드',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 20 | 산업코드: 2 | 조성총액: 250.0억원',
  '2034-01-07',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20240019","mother_fund_id":"MF00000001","investment_character_code":"20","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"250.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.181Z"}',
  '2025-06-05T00:42:07.181Z'
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

-- Record 1484: 엑스퀘어드 넥스트 벤처펀드 제2호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20220038',
  '엑스퀘어드 넥스트 벤처펀드 제2호',
  6260000000,
  '2022-03-22',
  'Active',
  '엑스퀘어드',
  'VCS_API_SCRAPER',
  'AS20220327',
  '엑스퀘어드',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 20 | 산업코드: 2 | 조성총액: 62.6억원',
  '2027-03-21',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20220327","mother_fund_id":"","investment_character_code":"20","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"62.6","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.181Z"}',
  '2025-06-05T00:42:07.181Z'
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

-- Record 1485: 엑스퀘어드 넥스트 벤처펀드 제1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20220038',
  '엑스퀘어드 넥스트 벤처펀드 제1호',
  9000000000,
  '2022-01-27',
  'Active',
  '엑스퀘어드',
  'VCS_API_SCRAPER',
  'AS20220098',
  '엑스퀘어드',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 16 | 산업코드: 2 | 조성총액: 90.0억원',
  '2027-01-26',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20220098","mother_fund_id":"","investment_character_code":"16","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"90.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.181Z"}',
  '2025-06-05T00:42:07.181Z'
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

-- Record 1486: 엑스코나 배터리 얼라이언스 펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20220038',
  '엑스코나 배터리 얼라이언스 펀드',
  11110000000,
  '2024-07-16',
  'Active',
  '엑스퀘어드',
  'VCS_API_SCRAPER',
  'AS20240659',
  '엑스퀘어드',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 20 | 산업코드: 4 | 조성총액: 111.1억원',
  '2029-07-15',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20240659","mother_fund_id":"","investment_character_code":"20","industry_code":"4","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"111.1","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.181Z"}',
  '2025-06-05T00:42:07.181Z'
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

-- Record 1487: 엑스엘바이오-이노스타트업 개인투자조합 4호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200331',
  '엑스엘바이오-이노스타트업 개인투자조합 4호',
  430000000,
  '2021-04-26',
  'Active',
  '더이노베이터스',
  'VCS_API_SCRAPER',
  'AS20210314',
  '더이노베이터스',
  '산업코드: 5 | 조성총액: 4.3억원',
  '2026-04-25',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20210314","mother_fund_id":"","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"4.3","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.181Z"}',
  '2025-06-05T00:42:07.181Z'
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

-- Record 1488: 엑스시공(X-SIGONG) IP 투자조합 제2호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20190163',
  '엑스시공(X-SIGONG) IP 투자조합 제2호',
  100000000,
  '2021-04-12',
  'Active',
  '컴퍼니엑스',
  'VCS_API_SCRAPER',
  'AS20210274',
  '컴퍼니엑스',
  '산업코드: 8 | 조성총액: 1.0억원',
  '2026-04-11',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20210274","mother_fund_id":"","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"1.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.181Z"}',
  '2025-06-05T00:42:07.181Z'
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

-- Record 1489: 엑스 시공특허 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20190163',
  '엑스 시공특허 투자조합',
  470000000,
  '2022-07-29',
  'Active',
  '컴퍼니엑스',
  'VCS_API_SCRAPER',
  'AS20220846',
  '컴퍼니엑스',
  '산업코드: 2 | 조성총액: 4.7억원',
  '2027-07-28',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20220846","mother_fund_id":"","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"4.7","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.181Z"}',
  '2025-06-05T00:42:07.181Z'
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

-- Record 1490: 엑스 시공아이피 투자조합 제8호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20190163',
  '엑스 시공아이피 투자조합 제8호',
  420000000,
  '2023-09-21',
  'Active',
  '컴퍼니엑스',
  'VCS_API_SCRAPER',
  'AS20230792',
  '컴퍼니엑스',
  '산업코드: 8 | 조성총액: 4.2억원',
  '2028-09-20',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20230792","mother_fund_id":"","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"4.2","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.181Z"}',
  '2025-06-05T00:42:07.181Z'
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

-- Record 1491: 엑스 시공아이피 투자조합 제7호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20190163',
  '엑스 시공아이피 투자조합 제7호',
  120000000,
  '2023-08-25',
  'Active',
  '컴퍼니엑스',
  'VCS_API_SCRAPER',
  'AS20230744',
  '컴퍼니엑스',
  '산업코드: 2 | 조성총액: 1.2억원',
  '2028-08-24',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20230744","mother_fund_id":"","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"1.2","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.181Z"}',
  '2025-06-05T00:42:07.181Z'
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

-- Record 1492: 엑스 시공아이피 투자조합 제6호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20190163',
  '엑스 시공아이피 투자조합 제6호',
  230000000,
  '2023-08-25',
  'Active',
  '컴퍼니엑스',
  'VCS_API_SCRAPER',
  'AS20230708',
  '컴퍼니엑스',
  '산업코드: 8 | 조성총액: 2.3억원',
  '2028-08-24',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20230708","mother_fund_id":"","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"2.3","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.181Z"}',
  '2025-06-05T00:42:07.181Z'
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

-- Record 1493: 엑스 시공아이피 투자조합 제5호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20190163',
  '엑스 시공아이피 투자조합 제5호',
  230000000,
  '2023-01-11',
  'Active',
  '컴퍼니엑스',
  'VCS_API_SCRAPER',
  'AS20230034',
  '컴퍼니엑스',
  '산업코드: 2 | 조성총액: 2.3억원',
  '2028-01-10',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20230034","mother_fund_id":"","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"2.3","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.181Z"}',
  '2025-06-05T00:42:07.181Z'
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

-- Record 1494: 엑스 시공아이피 투자조합 제3호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20190163',
  '엑스 시공아이피 투자조합 제3호',
  120000000,
  '2022-02-17',
  'Active',
  '컴퍼니엑스',
  'VCS_API_SCRAPER',
  'AS20220153',
  '컴퍼니엑스',
  '산업코드: 5 | 조성총액: 1.2억원',
  '2027-02-16',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20220153","mother_fund_id":"","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"1.2","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.181Z"}',
  '2025-06-05T00:42:07.181Z'
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

-- Record 1495: 엑스 시공 아이피 개인투자조합 제4호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20190163',
  '엑스 시공 아이피 개인투자조합 제4호',
  500000000,
  '2023-01-30',
  'Active',
  '컴퍼니엑스',
  'VCS_API_SCRAPER',
  'AS20230046',
  '컴퍼니엑스',
  '산업코드: 9 | 조성총액: 5.0억원',
  '2028-01-29',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20230046","mother_fund_id":"","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"5.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.181Z"}',
  '2025-06-05T00:42:07.181Z'
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

-- Record 1496: 엑셀이노베이션펀드3호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200224',
  '엑셀이노베이션펀드3호',
  200000000,
  '2022-09-23',
  'Active',
  '로간',
  'VCS_API_SCRAPER',
  'AS20221039',
  '로간',
  '산업코드: 2 | 조성총액: 2.0억원',
  '2027-09-30',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20221039","mother_fund_id":"","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"2.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.181Z"}',
  '2025-06-05T00:42:07.181Z'
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

-- Record 1497: 엑셀이노베이션펀드2호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200224',
  '엑셀이노베이션펀드2호',
  200000000,
  '2022-10-04',
  'Active',
  '로간',
  'VCS_API_SCRAPER',
  'AS20221091',
  '로간',
  '산업코드: 2 | 조성총액: 2.0억원',
  '2027-10-10',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20221091","mother_fund_id":"","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"2.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.181Z"}',
  '2025-06-05T00:42:07.181Z'
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

-- Record 1498: 엑셀이노베이션펀드1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200224',
  '엑셀이노베이션펀드1호',
  420000000,
  '2022-09-28',
  'Active',
  '로간',
  'VCS_API_SCRAPER',
  'AS20221087',
  '로간',
  '산업코드: 2 | 조성총액: 4.2억원',
  '2027-09-30',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20221087","mother_fund_id":"","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"4.2","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.181Z"}',
  '2025-06-05T00:42:07.181Z'
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

-- Record 1499: 엑셀비전펀드3호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200224',
  '엑셀비전펀드3호',
  250000000,
  '2022-09-20',
  'Active',
  '로간',
  'VCS_API_SCRAPER',
  'AS20221024',
  '로간',
  '산업코드: 2 | 조성총액: 2.5억원',
  '2027-09-30',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20221024","mother_fund_id":"","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"2.5","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.181Z"}',
  '2025-06-05T00:42:07.182Z'
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

-- Record 1500: 엑셀비전펀드2호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200224',
  '엑셀비전펀드2호',
  100000000,
  '2021-08-05',
  'Active',
  '로간',
  'VCS_API_SCRAPER',
  'AS20210666',
  '로간',
  '산업코드: 2 | 조성총액: 1.0억원',
  '2026-08-04',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20210666","mother_fund_id":"","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"1.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.182Z"}',
  '2025-06-05T00:42:07.182Z'
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

-- Exact Batch 30 completed! 50 fund records processed.
-- Progress: 1500/3689 total records

