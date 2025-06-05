-- VCS Fund EXACT UPSERT Batch 19/74 (Records 901-950)
-- EXACT: Uses actual fund_table schema columns
-- Generated from VCS API Scraper fund data
-- Generated at: 2025-06-05T00:42:07.137Z
-- Schema: Exact match to actual fund_table structure

-- EXACT FUND DATA (UPSERT - Safe for Duplicates)
-- Processing 50 fund records
-- Will INSERT new records or UPDATE existing ones

-- Record 901: 제이비위드플러스6호 조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200038',
  '제이비위드플러스6호 조합',
  110000000,
  '2025-01-31',
  'Active',
  '제이비벤처스',
  'VCS_API_SCRAPER',
  'AS20250068',
  '제이비벤처스',
  '산업코드: 2 | 조성총액: 1.1억원',
  '2030-01-22',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20250068","mother_fund_id":"","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"1.1","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.137Z"}',
  '2025-06-05T00:42:07.137Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 902: 제이비위드플러스(JB With Plus)1호 조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200038',
  '제이비위드플러스(JB With Plus)1호 조합',
  240000000,
  '2020-03-23',
  'Active',
  '제이비벤처스',
  'VCS_API_SCRAPER',
  'AS20200139',
  '제이비벤처스',
  '산업코드: 9 | 조성총액: 2.4억원',
  '2026-03-19',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20200139","mother_fund_id":"","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"2.4","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.137Z"}',
  '2025-06-05T00:42:07.137Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 903: 제이비위드플러스(JB With PLUS) 2호 조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200038',
  '제이비위드플러스(JB With PLUS) 2호 조합',
  290000000,
  '2020-07-20',
  'Active',
  '제이비벤처스',
  'VCS_API_SCRAPER',
  'AS20200337',
  '제이비벤처스',
  '산업코드: 2 | 조성총액: 2.9억원',
  '2025-07-31',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20200337","mother_fund_id":"","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"2.9","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.137Z"}',
  '2025-06-05T00:42:07.137Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 904: 제이비위드플러스 5호 조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200038',
  '제이비위드플러스 5호 조합',
  810000000,
  '2023-09-22',
  'Active',
  '제이비벤처스',
  'VCS_API_SCRAPER',
  'AS20230842',
  '제이비벤처스',
  '산업코드: 8 | 조성총액: 8.1억원',
  '2028-09-18',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20230842","mother_fund_id":"","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"8.1","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.137Z"}',
  '2025-06-05T00:42:07.137Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 905: 제이비위드플러스 4호 조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200038',
  '제이비위드플러스 4호 조합',
  1150000000,
  '2022-07-25',
  'Active',
  '제이비벤처스',
  'VCS_API_SCRAPER',
  'AS20220842',
  '제이비벤처스',
  '산업코드: 8 | 조성총액: 11.5억원',
  '2027-07-20',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20220842","mother_fund_id":"","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"11.5","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.137Z"}',
  '2025-06-05T00:42:07.137Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 906: 제이비원개인투자조합제3호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20220646',
  '제이비원개인투자조합제3호',
  540000000,
  '2024-11-18',
  'Active',
  '원투자파트너스',
  'VCS_API_SCRAPER',
  'AS20241091',
  '원투자파트너스',
  '산업코드: 3 | 조성총액: 5.4억원',
  '2032-11-05',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20241091","mother_fund_id":"","investment_character_code":"","industry_code":"3","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"5.4","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.137Z"}',
  '2025-06-05T00:42:07.137Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 907: 제이비원개인투자조합제2호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20220646',
  '제이비원개인투자조합제2호',
  350000000,
  '2024-04-23',
  'Active',
  '원투자파트너스',
  'VCS_API_SCRAPER',
  'AS20240305',
  '원투자파트너스',
  '산업코드: 3 | 조성총액: 3.5억원',
  '2032-04-11',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20240305","mother_fund_id":"","investment_character_code":"","industry_code":"3","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"3.5","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.137Z"}',
  '2025-06-05T00:42:07.137Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 908: 제이비원개인투자조합 제1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20220646',
  '제이비원개인투자조합 제1호',
  630000000,
  '2023-12-07',
  'Active',
  '원투자파트너스',
  'VCS_API_SCRAPER',
  'AS20231152',
  '원투자파트너스',
  '산업코드: 3 | 조성총액: 6.3억원',
  '2031-11-26',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20231152","mother_fund_id":"","investment_character_code":"","industry_code":"3","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"6.3","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.137Z"}',
  '2025-06-05T00:42:07.137Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 909: 제이비에듀 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200038',
  '제이비에듀 투자조합',
  220000000,
  '2024-12-30',
  'Active',
  '제이비벤처스',
  'VCS_API_SCRAPER',
  'AS20241440',
  '제이비벤처스',
  '산업코드: 8 | 조성총액: 2.2억원',
  '2029-12-25',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20241440","mother_fund_id":"","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"2.2","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.137Z"}',
  '2025-06-05T00:42:07.137Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 910: 제이비벤처스 라이즈 1호 조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200038',
  '제이비벤처스 라이즈 1호 조합',
  3000000000,
  '2024-01-23',
  'Active',
  '제이비벤처스',
  'VCS_API_SCRAPER',
  'AS20240043',
  '제이비벤처스',
  '산업코드: 8 | 조성총액: 30.0억원',
  '2032-01-16',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20240043","mother_fund_id":"MF00000021","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"30.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.137Z"}',
  '2025-06-05T00:42:07.137Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 911: 제이비벤처스 네발자국 투자 조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200038',
  '제이비벤처스 네발자국 투자 조합',
  150000000,
  '2022-03-22',
  'Active',
  '제이비벤처스',
  'VCS_API_SCRAPER',
  'AS20220272',
  '제이비벤처스',
  '산업코드: 2 | 조성총액: 1.5억원',
  '2027-03-09',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20220272","mother_fund_id":"","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"1.5","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.137Z"}',
  '2025-06-05T00:42:07.137Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 912: 제이비(JB)기술지주 개인투자조합 제2호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20110010',
  '제이비(JB)기술지주 개인투자조합 제2호',
  3000000000,
  '2021-12-09',
  'Active',
  '전북지역대학연합기술지주',
  'VCS_API_SCRAPER',
  'AS20211234',
  '전북지역대학연합기술지주',
  '산업코드: 5 | 조성총액: 30.0억원',
  '2029-12-05',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20211234","mother_fund_id":"MF00000001","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"30.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.137Z"}',
  '2025-06-05T00:42:07.137Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 913: 제이비(JB) 지역특화 밸류업 개인투자조합 제3호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20110010',
  '제이비(JB) 지역특화 밸류업 개인투자조합 제3호',
  3300000000,
  '2024-01-30',
  'Active',
  '전북지역대학연합기술지주',
  'VCS_API_SCRAPER',
  'AS20240049',
  '전북지역대학연합기술지주',
  '산업코드: 8 | 조성총액: 33.0억원',
  '2032-01-17',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20240049","mother_fund_id":"MF00000021","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"33.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.137Z"}',
  '2025-06-05T00:42:07.137Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 914: 제로투앤3호투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20220424',
  '제로투앤3호투자조합',
  110000000,
  '2024-05-30',
  'Active',
  '제로투원파트너스',
  'VCS_API_SCRAPER',
  'AS20240463',
  '제로투원파트너스',
  '산업코드: 9 | 조성총액: 1.1억원',
  '2029-05-29',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20240463","mother_fund_id":"","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"1.1","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.137Z"}',
  '2025-06-05T00:42:07.137Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 915: 제로투앤1호투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20220424',
  '제로투앤1호투자조합',
  110000000,
  '2023-08-01',
  'Active',
  '제로투원파트너스',
  'VCS_API_SCRAPER',
  'AS20230645',
  '제로투원파트너스',
  '산업코드: 6 | 조성총액: 1.1억원',
  '2028-07-31',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20230645","mother_fund_id":"","investment_character_code":"","industry_code":"6","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"1.1","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.138Z"}',
  '2025-06-05T00:42:07.138Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 916: 제5호 G-IN 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20190278',
  '제5호 G-IN 개인투자조합',
  1060000000,
  '2023-12-12',
  'Active',
  '광주창조경제혁신센터',
  'VCS_API_SCRAPER',
  'AS20231235',
  '광주창조경제혁신센터',
  '산업코드: 8 | 조성총액: 10.6억원',
  '2028-12-07',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20231235","mother_fund_id":"","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"10.6","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.138Z"}',
  '2025-06-05T00:42:07.138Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 917: 제4호 G-IN 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20190278',
  '제4호 G-IN 개인투자조합',
  150000000,
  '2023-09-11',
  'Active',
  '광주창조경제혁신센터',
  'VCS_API_SCRAPER',
  'AS20230774',
  '광주창조경제혁신센터',
  '산업코드: 2 | 조성총액: 1.5억원',
  '2028-08-30',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20230774","mother_fund_id":"","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"1.5","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.138Z"}',
  '2025-06-05T00:42:07.138Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 918: 제3호 비티비벤처스 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20210045',
  '제3호 비티비벤처스 개인투자조합',
  700000000,
  '2024-04-03',
  'Active',
  '비티비벤처스',
  'VCS_API_SCRAPER',
  'AS20240214',
  '비티비벤처스',
  '산업코드: 5 | 조성총액: 7.0억원',
  '2032-04-02',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20240214","mother_fund_id":"","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"7.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.138Z"}',
  '2025-06-05T00:42:07.138Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 919: 제3호 G-IN 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20190278',
  '제3호 G-IN 개인투자조합',
  380000000,
  '2022-02-25',
  'Active',
  '광주창조경제혁신센터',
  'VCS_API_SCRAPER',
  'AS20220191',
  '광주창조경제혁신센터',
  '산업코드: 2 | 조성총액: 3.8억원',
  '2029-02-28',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20220191","mother_fund_id":"","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"3.8","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.138Z"}',
  '2025-06-05T00:42:07.138Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 920: 제2호 G-IN 엔젤투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20190278',
  '제2호 G-IN 엔젤투자조합',
  360000000,
  '2022-01-20',
  'Active',
  '광주창조경제혁신센터',
  'VCS_API_SCRAPER',
  'AS20220073',
  '광주창조경제혁신센터',
  '산업코드: 2 | 조성총액: 3.6억원',
  '2027-01-19',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20220073","mother_fund_id":"","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"3.6","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.138Z"}',
  '2025-06-05T00:42:07.138Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 921: 제1호 K-바이오혁신 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20210068',
  '제1호 K-바이오혁신 개인투자조합',
  180000000,
  '2022-04-27',
  'Active',
  '드림벤처스유한책임회사',
  'VCS_API_SCRAPER',
  'AS20220459',
  '드림벤처스유한책임회사',
  '산업코드: 2 | 조성총액: 1.8억원',
  '2027-04-26',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20220459","mother_fund_id":"","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"1.8","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.138Z"}',
  '2025-06-05T00:42:07.138Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 922: 제1호 G-IN 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20190278',
  '제1호 G-IN 개인투자조합',
  240000000,
  '2020-01-06',
  'Active',
  '광주창조경제혁신센터',
  'VCS_API_SCRAPER',
  'AS20200019',
  '광주창조경제혁신센터',
  '산업코드: 8 | 조성총액: 2.4억원',
  '2026-12-31',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20200019","mother_fund_id":"","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"2.4","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.138Z"}',
  '2025-06-05T00:42:07.138Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 923: 전북혁신창업투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20170044',
  '전북혁신창업투자조합1호',
  500000000,
  '2021-12-24',
  'Active',
  '한국바이오투자파트너스',
  'VCS_API_SCRAPER',
  'AS20211386',
  '한국바이오투자파트너스',
  '산업코드: 2 | 조성총액: 5.0억원',
  '2026-12-31',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20211386","mother_fund_id":"","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"5.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.138Z"}',
  '2025-06-05T00:42:07.138Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 924: 전북초기투자 크립톤 혁신펀드1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20110014',
  '전북초기투자 크립톤 혁신펀드1호',
  5000000000,
  '2024-07-29',
  'Active',
  '크립톤',
  'VCS_API_SCRAPER',
  'AS20240649',
  '크립톤',
  '산업코드: 6 | 조성총액: 50.0억원',
  '2032-07-28',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20240649","mother_fund_id":"MF00000001","investment_character_code":"","industry_code":"6","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"50.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.138Z"}',
  '2025-06-05T00:42:07.138Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 925: 전북벤처 혁신투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20190335',
  '전북벤처 혁신투자조합1호',
  200000000,
  '2022-12-15',
  'Active',
  '전북창조경제혁신센터',
  'VCS_API_SCRAPER',
  'AS20221472',
  '전북창조경제혁신센터',
  '산업코드: 8 | 조성총액: 2.0억원',
  '2027-12-20',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20221472","mother_fund_id":"","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"2.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.138Z"}',
  '2025-06-05T00:42:07.138Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 926: 전북대학교 제2호 대학창업 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20170030',
  '전북대학교 제2호 대학창업 개인투자조합',
  2700000000,
  '2021-08-24',
  'Active',
  '특허법인지원',
  'VCS_API_SCRAPER',
  'AS20210711',
  '특허법인지원',
  '산업코드: 2 | 조성총액: 27.0억원',
  '2029-08-23',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20210711","mother_fund_id":"MF00000001","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"27.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.138Z"}',
  '2025-06-05T00:42:07.138Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 927: 전북경제기술벤처개인투자조합제1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200320',
  '전북경제기술벤처개인투자조합제1호',
  310000000,
  '2024-12-02',
  'Active',
  '전북특별자치도경제통상진흥원',
  'VCS_API_SCRAPER',
  'AS20241184',
  '전북특별자치도경제통상진흥원',
  '산업코드: 3 | 조성총액: 3.1억원',
  '2029-11-20',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20241184","mother_fund_id":"","investment_character_code":"","industry_code":"3","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"3.1","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.138Z"}',
  '2025-06-05T00:42:07.138Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 928: 전북·강원 지역혁신 벤처펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20000029',
  '전북·강원 지역혁신 벤처펀드',
  59400000000,
  '2023-03-08',
  'Active',
  '한국벤처투자',
  'VCS_API_SCRAPER',
  'AS20230180',
  '한국벤처투자',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 10 | 산업코드: 9 | 조성총액: 594.0억원',
  '2035-03-07',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20230180","mother_fund_id":"MF00000001","investment_character_code":"10","industry_code":"9","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"594.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.138Z"}',
  '2025-06-05T00:42:07.138Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 929: 전북-효성-에스제이 탄소성장펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20100006',
  '전북-효성-에스제이 탄소성장펀드',
  20000000000,
  '2016-09-13',
  'Active',
  '에스제이투자파트너스',
  'VCS_API_SCRAPER',
  'AS20160018',
  '에스제이투자파트너스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 18 | 산업코드: 4 | 조성총액: 200.0억원',
  '2025-09-12',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20160018","mother_fund_id":"MF00000001","investment_character_code":"18","industry_code":"4","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"200.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.138Z"}',
  '2025-06-05T00:42:07.138Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 930: 전북-에스제이 퍼스트무버 벤처펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20100006',
  '전북-에스제이 퍼스트무버 벤처펀드',
  18000000000,
  '2019-01-22',
  'Active',
  '에스제이투자파트너스',
  'VCS_API_SCRAPER',
  'AS20190036',
  '에스제이투자파트너스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 20 | 산업코드: 5 | 조성총액: 180.0억원',
  '2027-01-21',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20190036","mother_fund_id":"MF00000001","investment_character_code":"20","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"180.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.138Z"}',
  '2025-06-05T00:42:07.138Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 931: 전북 지역혁신 임팩트 투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20110015',
  '전북 지역혁신 임팩트 투자조합 1호',
  1000000000,
  '2023-12-20',
  'Active',
  '엠와이소셜컴퍼니',
  'VCS_API_SCRAPER',
  'AS20231214',
  '엠와이소셜컴퍼니',
  '산업코드: 8 | 조성총액: 10.0억원',
  '2031-12-19',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20231214","mother_fund_id":"MF00000021","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"10.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.138Z"}',
  '2025-06-05T00:42:07.138Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 932: 전남그린에너지펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20070004',
  '전남그린에너지펀드',
  7600000000,
  '2009-01-23',
  'Active',
  '삼호그린인베스트먼트',
  'VCS_API_SCRAPER',
  'AS20090005',
  '삼호그린인베스트먼트',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 18 | 산업코드: 9 | 조성총액: 76.0억원',
  '2025-10-22',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20090005","mother_fund_id":"MF00000001","investment_character_code":"18","industry_code":"9","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"76.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.138Z"}',
  '2025-06-05T00:42:07.138Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 933: 전남-보광 청년창업 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP19890005',
  '전남-보광 청년창업 투자조합',
  10000000000,
  '2018-06-28',
  'Active',
  '보광인베스트먼트',
  'VCS_API_SCRAPER',
  'AS20180185',
  '보광인베스트먼트',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 18 | 산업코드: 8 | 조성총액: 100.0억원',
  '2028-06-27',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20180185","mother_fund_id":"MF00000001","investment_character_code":"18","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"100.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.138Z"}',
  '2025-06-05T00:42:07.138Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 934: 전남 엔젤투자매칭펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20120017',
  '전남 엔젤투자매칭펀드',
  5000000000,
  '2015-11-20',
  'Active',
  '한국엔젤투자협회',
  'VCS_API_SCRAPER',
  'AS20150092',
  '한국엔젤투자협회',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 20 | 산업코드: 8 | 조성총액: 50.0억원',
  '2025-11-19',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20150092","mother_fund_id":"MF00000001","investment_character_code":"20","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"50.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.138Z"}',
  '2025-06-05T00:42:07.138Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 935: 임팩트스퀘어 사회적기업 디딤돌 벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20190342',
  '임팩트스퀘어 사회적기업 디딤돌 벤처투자조합',
  5800000000,
  '2020-11-09',
  'Active',
  '임팩트스퀘어',
  'VCS_API_SCRAPER',
  'AS20200642',
  '임팩트스퀘어',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 23 | 산업코드: 8 | 조성총액: 58.0억원',
  '2028-11-08',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20200642","mother_fund_id":"MF00000001","investment_character_code":"23","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"58.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.138Z"}',
  '2025-06-05T00:42:07.138Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 936: 임팩트스퀘어 사회적기업 디딤돌 2호 벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20190342',
  '임팩트스퀘어 사회적기업 디딤돌 2호 벤처투자조합',
  6000000000,
  '2022-05-11',
  'Active',
  '임팩트스퀘어',
  'VCS_API_SCRAPER',
  'AS20220528',
  '임팩트스퀘어',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 20 | 산업코드: 2 | 조성총액: 60.0억원',
  '2030-05-10',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20220528","mother_fund_id":"MF00000001","investment_character_code":"20","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"60.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.138Z"}',
  '2025-06-05T00:42:07.138Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 937: 임팩트스퀘어 ESG 글로벌 성장지원 벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20190342',
  '임팩트스퀘어 ESG 글로벌 성장지원 벤처투자조합',
  2050000000,
  '2023-01-27',
  'Active',
  '임팩트스퀘어',
  'VCS_API_SCRAPER',
  'AS20230075',
  '임팩트스퀘어',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 20 | 산업코드: 8 | 조성총액: 20.5억원',
  '2031-01-26',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20230075","mother_fund_id":"","investment_character_code":"20","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"20.5","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.138Z"}',
  '2025-06-05T00:42:07.138Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 938: 임팩트벤처투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200156',
  '임팩트벤처투자조합1호',
  2400000000,
  '2021-12-29',
  'Active',
  '임팩트파트너스',
  'VCS_API_SCRAPER',
  'AS20211441',
  '임팩트파트너스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 03 | 산업코드: 2 | 조성총액: 24.0억원',
  '2026-12-28',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20211441","mother_fund_id":"","investment_character_code":"03","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"24.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.138Z"}',
  '2025-06-05T00:42:07.138Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 939: 임팩트 혁신 개인투자조합 4호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20190401',
  '임팩트 혁신 개인투자조합 4호',
  100000000,
  '2023-02-21',
  'Active',
  '임팩트재단',
  'VCS_API_SCRAPER',
  'AS20230090',
  '임팩트재단',
  '산업코드: 7 | 조성총액: 1.0억원',
  '2028-02-20',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20230090","mother_fund_id":"","investment_character_code":"","industry_code":"7","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"1.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.138Z"}',
  '2025-06-05T00:42:07.138Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 940: 임팩트 혁신 개인투자조합 3호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20190401',
  '임팩트 혁신 개인투자조합 3호',
  680000000,
  '2022-01-14',
  'Active',
  '임팩트재단',
  'VCS_API_SCRAPER',
  'AS20220052',
  '임팩트재단',
  '산업코드: 8 | 조성총액: 6.8억원',
  '2027-01-13',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20220052","mother_fund_id":"","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"6.8","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.138Z"}',
  '2025-06-05T00:42:07.138Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 941: 임팩트 피크닉 투자조합 3호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20190413',
  '임팩트 피크닉 투자조합 3호',
  4300000000,
  '2024-10-17',
  'Active',
  '소풍벤처스',
  'VCS_API_SCRAPER',
  'AS20240989',
  '소풍벤처스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 05 | 산업코드: 3 | 조성총액: 43.0억원',
  '2032-10-16',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20240989","mother_fund_id":"MF00000001","investment_character_code":"05","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"43.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.138Z"}',
  '2025-06-05T00:42:07.138Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 942: 임팩트 피크닉 투자조합 2호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20190413',
  '임팩트 피크닉 투자조합 2호',
  3340000000,
  '2024-03-13',
  'Active',
  '소풍벤처스',
  'VCS_API_SCRAPER',
  'AS20240186',
  '소풍벤처스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 05 | 산업코드: 3 | 조성총액: 33.4억원',
  '2032-03-12',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20240186","mother_fund_id":"","investment_character_code":"05","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"33.4","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.138Z"}',
  '2025-06-05T00:42:07.138Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 943: 임팩트 피크닉 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20190413',
  '임팩트 피크닉 투자조합',
  10300000000,
  '2022-04-14',
  'Active',
  '소풍벤처스',
  'VCS_API_SCRAPER',
  'AS20220424',
  '소풍벤처스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 20 | 산업코드: 2 | 조성총액: 103.0억원',
  '2030-04-13',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20220424","mother_fund_id":"","investment_character_code":"20","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"103.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.138Z"}',
  '2025-06-05T00:42:07.138Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 944: 임팩트 컬렉티브 코리아 펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200136',
  '임팩트 컬렉티브 코리아 펀드',
  5000000000,
  '2020-11-18',
  'Active',
  '더벤처스',
  'VCS_API_SCRAPER',
  'AS20200659',
  '더벤처스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 20 | 산업코드: 2 | 조성총액: 50.0억원',
  '2028-11-17',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20200659","mother_fund_id":"","investment_character_code":"20","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"50.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.138Z"}',
  '2025-06-05T00:42:07.138Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 945: 임팩트 그로우 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20190413',
  '임팩트 그로우 투자조합',
  2500000000,
  '2021-12-31',
  'Active',
  '소풍벤처스',
  'VCS_API_SCRAPER',
  'AS20220005',
  '소풍벤처스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 20 | 산업코드: 2 | 조성총액: 25.0억원',
  '2029-12-30',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20220005","mother_fund_id":"","investment_character_code":"20","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"25.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.138Z"}',
  '2025-06-05T00:42:07.138Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 946: 일자리 창출 성장지원 펀드 3호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20000029',
  '일자리 창출 성장지원 펀드 3호',
  20500000000,
  '2022-10-26',
  'Active',
  '한국벤처투자',
  'VCS_API_SCRAPER',
  'AS20221227',
  '한국벤처투자',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 14 | 산업코드: 5 | 조성총액: 205.0억원',
  '2030-10-25',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20221227","mother_fund_id":"MF00000001","investment_character_code":"14","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"205.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.138Z"}',
  '2025-06-05T00:42:07.138Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 947: 일자리 창출 성장지원 펀드 2호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20000029',
  '일자리 창출 성장지원 펀드 2호',
  20500000000,
  '2021-06-25',
  'Active',
  '한국벤처투자',
  'VCS_API_SCRAPER',
  'AS20210523',
  '한국벤처투자',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 14 | 산업코드: 2 | 조성총액: 205.0억원',
  '2029-06-24',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20210523","mother_fund_id":"MF00000001","investment_character_code":"14","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"205.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.138Z"}',
  '2025-06-05T00:42:07.138Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 948: 일자리 창출 성장지원 펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20000029',
  '일자리 창출 성장지원 펀드',
  50600000000,
  '2018-08-16',
  'Active',
  '한국벤처투자',
  'VCS_API_SCRAPER',
  'AS20180207',
  '한국벤처투자',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 10 | 산업코드: 8 | 조성총액: 506.0억원',
  '2029-08-15',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20180207","mother_fund_id":"MF00000001","investment_character_code":"10","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"506.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.138Z"}',
  '2025-06-05T00:42:07.138Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 949: 일신 파이팅코리아 스포츠투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP19900005',
  '일신 파이팅코리아 스포츠투자조합',
  12000000000,
  '2024-11-25',
  'Active',
  '일신창업투자',
  'VCS_API_SCRAPER',
  'AS20241198',
  '일신창업투자',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 07 | 산업코드: 9 | 조성총액: 120.0억원',
  '2030-11-24',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20241198","mother_fund_id":"MF00000001","investment_character_code":"07","industry_code":"9","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"120.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.138Z"}',
  '2025-06-05T00:42:07.138Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 950: 일신 뉴코리안웨이브 3호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP19900005',
  '일신 뉴코리안웨이브 3호 투자조합',
  22000000000,
  '2019-07-30',
  'Active',
  '일신창업투자',
  'VCS_API_SCRAPER',
  'AS20190312',
  '일신창업투자',
  '투자분야: 문화 | 세부분야: 공연 | 투자성격코드: 24 | 산업코드: 6 | 조성총액: 220.0억원',
  '2027-07-29',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20190312","mother_fund_id":"MF00000001","investment_character_code":"24","industry_code":"6","investment_field_type":"문화","investment_field_detail_type":"공연","formation_total_amount":"220.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.138Z"}',
  '2025-06-05T00:42:07.138Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Exact Batch 19 completed! 50 fund records processed.
-- Progress: 950/3689 total records

