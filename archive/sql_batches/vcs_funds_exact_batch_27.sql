-- VCS Fund EXACT UPSERT Batch 27/74 (Records 1301-1350)
-- EXACT: Uses actual fund_table schema columns
-- Generated from VCS API Scraper fund data
-- Generated at: 2025-06-05T00:42:07.168Z
-- Schema: Exact match to actual fund_table structure

-- EXACT FUND DATA (UPSERT - Safe for Duplicates)
-- Processing 50 fund records
-- Will INSERT new records or UPDATE existing ones

-- Record 1301: 와이앤아처 히어로즈 개인투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20150027',
  '와이앤아처 히어로즈 개인투자조합 1호',
  4500000000,
  '2022-08-31',
  'Active',
  '와이앤아처',
  'VCS_API_SCRAPER',
  'AS20220929',
  '와이앤아처',
  '산업코드: 9 | 조성총액: 45.0억원',
  '2029-08-30',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20220929","mother_fund_id":"MF00000001","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"45.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.168Z"}',
  '2025-06-05T00:42:07.168Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 1302: 와이앤아처 핀테크 개인투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20150027',
  '와이앤아처 핀테크 개인투자조합 1호',
  110000000,
  '2019-10-10',
  'Active',
  '와이앤아처',
  'VCS_API_SCRAPER',
  'AS20190446',
  '와이앤아처',
  '산업코드: 8 | 조성총액: 1.1억원',
  '2025-10-09',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20190446","mother_fund_id":"","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"1.1","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.168Z"}',
  '2025-06-05T00:42:07.168Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 1303: 와이앤아처 쥬빌리 투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20150027',
  '와이앤아처 쥬빌리 투자조합 1호',
  150000000,
  '2021-10-01',
  'Active',
  '와이앤아처',
  'VCS_API_SCRAPER',
  'AS20210943',
  '와이앤아처',
  '산업코드: 2 | 조성총액: 1.5억원',
  '2026-09-30',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20210943","mother_fund_id":"","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"1.5","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.168Z"}',
  '2025-06-05T00:42:07.168Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 1304: 와이앤아처 제이콘 투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20150027',
  '와이앤아처 제이콘 투자조합 1호',
  400000000,
  '2023-04-24',
  'Active',
  '와이앤아처',
  'VCS_API_SCRAPER',
  'AS20230314',
  '와이앤아처',
  '산업코드: 9 | 조성총액: 4.0억원',
  '2030-04-23',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20230314","mother_fund_id":"","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"4.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.168Z"}',
  '2025-06-05T00:42:07.168Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 1305: 와이앤아처 위드미 투자조합 3호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20150027',
  '와이앤아처 위드미 투자조합 3호',
  130000000,
  '2025-03-31',
  'Active',
  '와이앤아처',
  'VCS_API_SCRAPER',
  'AS20250205',
  '와이앤아처',
  '산업코드: 9 | 조성총액: 1.3억원',
  '2030-03-30',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20250205","mother_fund_id":"","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"1.3","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.168Z"}',
  '2025-06-05T00:42:07.168Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 1306: 와이앤아처 위드미 투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20150027',
  '와이앤아처 위드미 투자조합 1호',
  130000000,
  '2024-04-23',
  'Active',
  '와이앤아처',
  'VCS_API_SCRAPER',
  'AS20240327',
  '와이앤아처',
  '산업코드: 2 | 조성총액: 1.3억원',
  '2029-04-22',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20240327","mother_fund_id":"","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"1.3","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.168Z"}',
  '2025-06-05T00:42:07.168Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 1307: 와이앤아처 올어라운드 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20150027',
  '와이앤아처 올어라운드 투자조합',
  2000000000,
  '2024-01-02',
  'Active',
  '와이앤아처',
  'VCS_API_SCRAPER',
  'AS20231319',
  '와이앤아처',
  '산업코드: 2 | 조성총액: 20.0억원',
  '2029-01-01',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20231319","mother_fund_id":"MF00000021","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"20.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.168Z"}',
  '2025-06-05T00:42:07.168Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 1308: 와이앤아처 오브라운 벤처투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20150027',
  '와이앤아처 오브라운 벤처투자조합 1호',
  1000000000,
  '2024-12-03',
  'Active',
  '와이앤아처',
  'VCS_API_SCRAPER',
  'AS20241253',
  '와이앤아처',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 20 | 산업코드: 9 | 조성총액: 10.0억원',
  '2034-12-02',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20241253","mother_fund_id":"","investment_character_code":"20","industry_code":"9","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"10.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.168Z"}',
  '2025-06-05T00:42:07.168Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 1309: 와이앤아처 씨앤알 투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20150027',
  '와이앤아처 씨앤알 투자조합 1호',
  120000000,
  '2021-09-06',
  'Active',
  '와이앤아처',
  'VCS_API_SCRAPER',
  'AS20210788',
  '와이앤아처',
  '산업코드: 5 | 조성총액: 1.2억원',
  '2026-09-05',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20210788","mother_fund_id":"","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"1.2","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.168Z"}',
  '2025-06-05T00:42:07.168Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 1310: 와이앤아처 스타트업 개인투자조합 5호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20150027',
  '와이앤아처 스타트업 개인투자조합 5호',
  160000000,
  '2024-09-05',
  'Active',
  '와이앤아처',
  'VCS_API_SCRAPER',
  'AS20240835',
  '와이앤아처',
  '산업코드: 2 | 조성총액: 1.6억원',
  '2029-09-04',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20240835","mother_fund_id":"","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"1.6","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.168Z"}',
  '2025-06-05T00:42:07.168Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 1311: 와이앤아처 스타트업 개인투자조합 4호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20150027',
  '와이앤아처 스타트업 개인투자조합 4호',
  1000000000,
  '2022-05-25',
  'Active',
  '와이앤아처',
  'VCS_API_SCRAPER',
  'AS20220551',
  '와이앤아처',
  '산업코드: 8 | 조성총액: 10.0억원',
  '2027-05-24',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20220551","mother_fund_id":"","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"10.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.168Z"}',
  '2025-06-05T00:42:07.168Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 1312: 와이앤아처 스타트업 개인투자조합 3호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20150027',
  '와이앤아처 스타트업 개인투자조합 3호',
  980000000,
  '2021-10-14',
  'Active',
  '와이앤아처',
  'VCS_API_SCRAPER',
  'AS20210975',
  '와이앤아처',
  '산업코드: 8 | 조성총액: 9.8억원',
  '2028-10-13',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20210975","mother_fund_id":"","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"9.8","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.168Z"}',
  '2025-06-05T00:42:07.168Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 1313: 와이앤아처 스타트업 개인투자조합 2호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20150027',
  '와이앤아처 스타트업 개인투자조합 2호',
  2000000000,
  '2018-11-06',
  'Active',
  '와이앤아처',
  'VCS_API_SCRAPER',
  'AS20180320',
  '와이앤아처',
  '산업코드: 8 | 조성총액: 20.0억원',
  '2025-11-08',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20180320","mother_fund_id":"MF00000008","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"20.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.168Z"}',
  '2025-06-05T00:42:07.168Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 1314: 와이앤아처 빌드업 투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20150027',
  '와이앤아처 빌드업 투자조합 1호',
  340000000,
  '2021-12-15',
  'Active',
  '와이앤아처',
  'VCS_API_SCRAPER',
  'AS20211269',
  '와이앤아처',
  '산업코드: 9 | 조성총액: 3.4억원',
  '2026-12-14',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20211269","mother_fund_id":"","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"3.4","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.168Z"}',
  '2025-06-05T00:42:07.168Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 1315: 와이앤아처 브이엔 투자조합 3-1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20150027',
  '와이앤아처 브이엔 투자조합 3-1호',
  610000000,
  '2021-09-06',
  'Active',
  '와이앤아처',
  'VCS_API_SCRAPER',
  'AS20210806',
  '와이앤아처',
  '산업코드: 5 | 조성총액: 6.1억원',
  '2026-09-05',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20210806","mother_fund_id":"","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"6.1","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.168Z"}',
  '2025-06-05T00:42:07.168Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 1316: 와이앤아처 바스켓 투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20150027',
  '와이앤아처 바스켓 투자조합 1호',
  170000000,
  '2023-04-13',
  'Active',
  '와이앤아처',
  'VCS_API_SCRAPER',
  'AS20230267',
  '와이앤아처',
  '산업코드: 2 | 조성총액: 1.7억원',
  '2028-04-12',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20230267","mother_fund_id":"","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"1.7","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.168Z"}',
  '2025-06-05T00:42:07.168Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 1317: 와이앤아처 로컬펌프업 투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20150027',
  '와이앤아처 로컬펌프업 투자조합 1호',
  5020000000,
  '2023-01-11',
  'Active',
  '와이앤아처',
  'VCS_API_SCRAPER',
  'AS20230041',
  '와이앤아처',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 20 | 산업코드: 2 | 조성총액: 50.2억원',
  '2030-01-10',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20230041","mother_fund_id":"MF00000001","investment_character_code":"20","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"50.2","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.168Z"}',
  '2025-06-05T00:42:07.168Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 1318: 와이앤아처 딜라이트 투자조합 6호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20150027',
  '와이앤아처 딜라이트 투자조합 6호',
  670000000,
  '2023-09-22',
  'Active',
  '와이앤아처',
  'VCS_API_SCRAPER',
  'AS20230833',
  '와이앤아처',
  '산업코드: 9 | 조성총액: 6.7억원',
  '2028-09-21',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20230833","mother_fund_id":"","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"6.7","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.168Z"}',
  '2025-06-05T00:42:07.168Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 1319: 와이앤아처 딜라이트 투자조합 5호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20150027',
  '와이앤아처 딜라이트 투자조합 5호',
  590000000,
  '2022-08-16',
  'Active',
  '와이앤아처',
  'VCS_API_SCRAPER',
  'AS20220884',
  '와이앤아처',
  '산업코드: 8 | 조성총액: 5.9억원',
  '2027-08-15',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20220884","mother_fund_id":"","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"5.9","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.168Z"}',
  '2025-06-05T00:42:07.168Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 1320: 와이앤아처 딜라이트 투자조합 4호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20150027',
  '와이앤아처 딜라이트 투자조합 4호',
  350000000,
  '2022-02-23',
  'Active',
  '와이앤아처',
  'VCS_API_SCRAPER',
  'AS20220178',
  '와이앤아처',
  '산업코드: 2 | 조성총액: 3.5억원',
  '2027-02-22',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20220178","mother_fund_id":"","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"3.5","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.168Z"}',
  '2025-06-05T00:42:07.168Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 1321: 와이앤아처 딜라이트 투자조합 3호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20150027',
  '와이앤아처 딜라이트 투자조합 3호',
  300000000,
  '2021-12-28',
  'Active',
  '와이앤아처',
  'VCS_API_SCRAPER',
  'AS20211409',
  '와이앤아처',
  '산업코드: 8 | 조성총액: 3.0억원',
  '2028-12-27',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20211409","mother_fund_id":"","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"3.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.168Z"}',
  '2025-06-05T00:42:07.168Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 1322: 와이앤아처 딜라이트 개인투자조합 2호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20150027',
  '와이앤아처 딜라이트 개인투자조합 2호',
  500000000,
  '2021-08-30',
  'Active',
  '와이앤아처',
  'VCS_API_SCRAPER',
  'AS20210774',
  '와이앤아처',
  '산업코드: 5 | 조성총액: 5.0억원',
  '2026-08-29',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20210774","mother_fund_id":"","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"5.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.168Z"}',
  '2025-06-05T00:42:07.168Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 1323: 와이앤아처 딜라이트 개인투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20150027',
  '와이앤아처 딜라이트 개인투자조합 1호',
  360000000,
  '2021-08-30',
  'Active',
  '와이앤아처',
  'VCS_API_SCRAPER',
  'AS20210773',
  '와이앤아처',
  '산업코드: 8 | 조성총액: 3.6억원',
  '2026-08-29',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20210773","mother_fund_id":"","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"3.6","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.168Z"}',
  '2025-06-05T00:42:07.168Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 1324: 와이앤아처 디에듀 투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20150027',
  '와이앤아처 디에듀 투자조합 1호',
  120000000,
  '2023-08-22',
  'Active',
  '와이앤아처',
  'VCS_API_SCRAPER',
  'AS20230681',
  '와이앤아처',
  '산업코드: 2 | 조성총액: 1.2억원',
  '2028-08-21',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20230681","mother_fund_id":"","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"1.2","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.168Z"}',
  '2025-06-05T00:42:07.168Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 1325: 와이앤아처 글로컬라이프 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20150027',
  '와이앤아처 글로컬라이프 투자조합',
  2000000000,
  '2024-08-05',
  'Active',
  '와이앤아처',
  'VCS_API_SCRAPER',
  'AS20240743',
  '와이앤아처',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 20 | 산업코드: 8 | 조성총액: 20.0억원',
  '2031-08-04',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20240743","mother_fund_id":"MF00000001","investment_character_code":"20","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"20.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.168Z"}',
  '2025-06-05T00:42:07.168Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 1326: 와이벤처스 아이티시드 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200234',
  '와이벤처스 아이티시드 개인투자조합',
  150000000,
  '2022-04-20',
  'Active',
  '커넥팅닷유나이티드',
  'VCS_API_SCRAPER',
  'AS20220190',
  '커넥팅닷유나이티드',
  '산업코드: 9 | 조성총액: 1.5억원',
  '2027-04-19',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20220190","mother_fund_id":"","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"1.5","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.168Z"}',
  '2025-06-05T00:42:07.168Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 1327: 옥타곤 LWEF 1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20230601',
  '옥타곤 LWEF 1호',
  10000000000,
  '2023-12-27',
  'Active',
  '옥타곤벤처파트너스',
  'VCS_API_SCRAPER',
  'AS20231350',
  '옥타곤벤처파트너스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 28 | 산업코드: 2 | 조성총액: 100.0억원',
  '2030-12-26',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20231350","mother_fund_id":"","investment_character_code":"28","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"100.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.168Z"}',
  '2025-06-05T00:42:07.168Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 1328: 오픈이노베이션투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20180065',
  '오픈이노베이션투자조합1호',
  370000000,
  '2020-06-15',
  'Active',
  '엔피프틴파트너스',
  'VCS_API_SCRAPER',
  'AS20200264',
  '엔피프틴파트너스',
  '산업코드: 8 | 조성총액: 3.7억원',
  '2027-03-31',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20200264","mother_fund_id":"","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"3.7","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.168Z"}',
  '2025-06-05T00:42:07.168Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 1329: 오픈워터프론티어투자조합1호 
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20180048',
  '오픈워터프론티어투자조합1호 ',
  1100000000,
  '2024-05-21',
  'Active',
  '오픈워터엔젤스',
  'VCS_API_SCRAPER',
  'AS20240435',
  '오픈워터엔젤스',
  '산업코드: 3 | 조성총액: 11.0억원',
  '2029-05-20',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20240435","mother_fund_id":"","investment_character_code":"","industry_code":"3","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"11.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.168Z"}',
  '2025-06-05T00:42:07.168Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 1330: 오픈워터케이그로쓰투자조합8호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20190245',
  '오픈워터케이그로쓰투자조합8호',
  12560000000,
  '2021-07-14',
  'Active',
  '오픈워터인베스트먼트',
  'VCS_API_SCRAPER',
  'AS20210592',
  '오픈워터인베스트먼트',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 16 | 산업코드: 7 | 조성총액: 125.6억원',
  '2026-07-13',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20210592","mother_fund_id":"","investment_character_code":"16","industry_code":"7","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"125.6","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.168Z"}',
  '2025-06-05T00:42:07.168Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 1331: 오픈워터케이그로쓰1호펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20190245',
  '오픈워터케이그로쓰1호펀드',
  2050000000,
  '2023-09-14',
  'Active',
  '오픈워터인베스트먼트',
  'VCS_API_SCRAPER',
  'AS20230821',
  '오픈워터인베스트먼트',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 04 | 산업코드: 8 | 조성총액: 20.5억원',
  '2033-09-13',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20230821","mother_fund_id":"","investment_character_code":"04","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"20.5","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.168Z"}',
  '2025-06-05T00:42:07.168Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 1332: 오픈워터카이스트투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20180048',
  '오픈워터카이스트투자조합1호',
  830000000,
  '2024-11-18',
  'Active',
  '오픈워터엔젤스',
  'VCS_API_SCRAPER',
  'AS20241109',
  '오픈워터엔젤스',
  '산업코드: 5 | 조성총액: 8.3억원',
  '2029-11-17',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20241109","mother_fund_id":"","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"8.3","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.168Z"}',
  '2025-06-05T00:42:07.168Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 1333: 오픈워터창업초기투자조합2호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20190245',
  '오픈워터창업초기투자조합2호',
  15000000000,
  '2019-07-19',
  'Active',
  '오픈워터인베스트먼트',
  'VCS_API_SCRAPER',
  'AS20190317',
  '오픈워터인베스트먼트',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 20 | 산업코드: 2 | 조성총액: 150.0억원',
  '2026-07-18',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20190317","mother_fund_id":"MF00000001","investment_character_code":"20","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"150.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.168Z"}',
  '2025-06-05T00:42:07.168Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 1334: 오픈워터엔젤스투자조합8호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20180048',
  '오픈워터엔젤스투자조합8호',
  150000000,
  '2025-03-28',
  'Active',
  '오픈워터엔젤스',
  'VCS_API_SCRAPER',
  'AS20250199',
  '오픈워터엔젤스',
  '산업코드: 9 | 조성총액: 1.5억원',
  '2030-03-27',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20250199","mother_fund_id":"","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"1.5","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.168Z"}',
  '2025-06-05T00:42:07.168Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 1335: 오픈워터엔젤스투자조합7호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20180048',
  '오픈워터엔젤스투자조합7호',
  2100000000,
  '2023-04-25',
  'Active',
  '오픈워터엔젤스',
  'VCS_API_SCRAPER',
  'AS20230319',
  '오픈워터엔젤스',
  '산업코드: 3 | 조성총액: 21.0억원',
  '2028-04-24',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20230319","mother_fund_id":"","investment_character_code":"","industry_code":"3","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"21.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.168Z"}',
  '2025-06-05T00:42:07.168Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 1336: 오픈워터엔젤스투자조합6호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20180048',
  '오픈워터엔젤스투자조합6호',
  1030000000,
  '2023-04-04',
  'Active',
  '오픈워터엔젤스',
  'VCS_API_SCRAPER',
  'AS20230227',
  '오픈워터엔젤스',
  '산업코드: 8 | 조성총액: 10.3억원',
  '2028-04-03',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20230227","mother_fund_id":"","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"10.3","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.168Z"}',
  '2025-06-05T00:42:07.168Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 1337: 오픈워터엔젤스투자조합5호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20180048',
  '오픈워터엔젤스투자조합5호',
  1990000000,
  '2023-03-20',
  'Active',
  '오픈워터엔젤스',
  'VCS_API_SCRAPER',
  'AS20230163',
  '오픈워터엔젤스',
  '산업코드: 8 | 조성총액: 19.9억원',
  '2028-03-19',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20230163","mother_fund_id":"","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"19.9","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.168Z"}',
  '2025-06-05T00:42:07.168Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 1338: 오픈워터엔젤스투자조합4호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20180048',
  '오픈워터엔젤스투자조합4호',
  2320000000,
  '2022-08-31',
  'Active',
  '오픈워터엔젤스',
  'VCS_API_SCRAPER',
  'AS20220961',
  '오픈워터엔젤스',
  '산업코드: 2 | 조성총액: 23.2억원',
  '2027-08-30',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20220961","mother_fund_id":"","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"23.2","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.168Z"}',
  '2025-06-05T00:42:07.168Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 1339: 오픈워터엔젤스투자조합3호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20180048',
  '오픈워터엔젤스투자조합3호',
  640000000,
  '2022-05-18',
  'Active',
  '오픈워터엔젤스',
  'VCS_API_SCRAPER',
  'AS20220536',
  '오픈워터엔젤스',
  '산업코드: 4 | 조성총액: 6.4억원',
  '2029-05-17',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20220536","mother_fund_id":"","investment_character_code":"","industry_code":"4","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"6.4","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.168Z"}',
  '2025-06-05T00:42:07.168Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 1340: 오픈워터엔젤스투자조합2호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20180048',
  '오픈워터엔젤스투자조합2호',
  1990000000,
  '2021-11-12',
  'Active',
  '오픈워터엔젤스',
  'VCS_API_SCRAPER',
  'AS20211115',
  '오픈워터엔젤스',
  '산업코드: 2 | 조성총액: 19.9억원',
  '2026-11-11',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20211115","mother_fund_id":"","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"19.9","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.168Z"}',
  '2025-06-05T00:42:07.168Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 1341: 오픈워터엔젤스투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20180048',
  '오픈워터엔젤스투자조합1호',
  2900000000,
  '2021-04-12',
  'Active',
  '오픈워터엔젤스',
  'VCS_API_SCRAPER',
  'AS20210269',
  '오픈워터엔젤스',
  '산업코드: 2 | 조성총액: 29.0억원',
  '2026-04-11',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20210269","mother_fund_id":"","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"29.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.168Z"}',
  '2025-06-05T00:42:07.168Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 1342: 오픈워터신성장1호펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20190245',
  '오픈워터신성장1호펀드',
  3040000000,
  '2024-02-23',
  'Active',
  '오픈워터인베스트먼트',
  'VCS_API_SCRAPER',
  'AS20240131',
  '오픈워터인베스트먼트',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 16 | 산업코드: 3 | 조성총액: 30.4억원',
  '2029-02-22',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20240131","mother_fund_id":"","investment_character_code":"16","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"30.4","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.168Z"}',
  '2025-06-05T00:42:07.168Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 1343: 오픈워터소부장2호펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20190245',
  '오픈워터소부장2호펀드',
  2750000000,
  '2024-03-08',
  'Active',
  '오픈워터인베스트먼트',
  'VCS_API_SCRAPER',
  'AS20240180',
  '오픈워터인베스트먼트',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 03 | 산업코드: 2 | 조성총액: 27.5억원',
  '2029-03-07',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20240180","mother_fund_id":"","investment_character_code":"03","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"27.5","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.168Z"}',
  '2025-06-05T00:42:07.168Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 1344: 오픈워터소부장1호펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20190245',
  '오픈워터소부장1호펀드',
  2800000000,
  '2022-11-10',
  'Active',
  '오픈워터인베스트먼트',
  'VCS_API_SCRAPER',
  'AS20221288',
  '오픈워터인베스트먼트',
  '투자분야: 일반 | 세부분야: 부품소재 | 투자성격코드: 25 | 산업코드: 2 | 조성총액: 28.0억원',
  '2029-11-09',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20221288","mother_fund_id":"","investment_character_code":"25","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"부품소재","formation_total_amount":"28.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.168Z"}',
  '2025-06-05T00:42:07.168Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 1345: 오픈워터박원장바이오테크투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20190245',
  '오픈워터박원장바이오테크투자조합1호',
  4050000000,
  '2020-12-23',
  'Active',
  '오픈워터인베스트먼트',
  'VCS_API_SCRAPER',
  'AS20200838',
  '오픈워터인베스트먼트',
  '투자분야: 일반 | 세부분야: 바이오 | 투자성격코드: 25 | 산업코드: 5 | 조성총액: 40.5억원',
  '2027-12-22',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20200838","mother_fund_id":"","investment_character_code":"25","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"바이오","formation_total_amount":"40.5","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.168Z"}',
  '2025-06-05T00:42:07.168Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 1346: 오픈워터바이오테크투자조합4호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20190245',
  '오픈워터바이오테크투자조합4호',
  14200000000,
  '2020-08-07',
  'Active',
  '오픈워터인베스트먼트',
  'VCS_API_SCRAPER',
  'AS20200423',
  '오픈워터인베스트먼트',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 16 | 산업코드: 5 | 조성총액: 142.0억원',
  '2025-08-06',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20200423","mother_fund_id":"","investment_character_code":"16","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"142.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.168Z"}',
  '2025-06-05T00:42:07.168Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 1347: 오픈워터메타버스투자조합11호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20190245',
  '오픈워터메타버스투자조합11호',
  4060000000,
  '2022-01-14',
  'Active',
  '오픈워터인베스트먼트',
  'VCS_API_SCRAPER',
  'AS20220057',
  '오픈워터인베스트먼트',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 16 | 산업코드: 2 | 조성총액: 40.6억원',
  '2027-01-13',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20220057","mother_fund_id":"","investment_character_code":"16","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"40.6","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.168Z"}',
  '2025-06-05T00:42:07.168Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 1348: 오픈워터메타버스1호펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20190245',
  '오픈워터메타버스1호펀드',
  2570000000,
  '2023-06-16',
  'Active',
  '오픈워터인베스트먼트',
  'VCS_API_SCRAPER',
  'AS20230495',
  '오픈워터인베스트먼트',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 02 | 산업코드: 2 | 조성총액: 25.7억원',
  '2030-06-15',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20230495","mother_fund_id":"","investment_character_code":"02","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"25.7","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.168Z"}',
  '2025-06-05T00:42:07.168Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 1349: 오픈워터럭키1호조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20190245',
  '오픈워터럭키1호조합',
  4400000000,
  '2024-06-13',
  'Active',
  '오픈워터인베스트먼트',
  'VCS_API_SCRAPER',
  'AS20240530',
  '오픈워터인베스트먼트',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 25 | 산업코드: 4 | 조성총액: 44.0억원',
  '2029-06-12',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20240530","mother_fund_id":"","investment_character_code":"25","industry_code":"4","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"44.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.168Z"}',
  '2025-06-05T00:42:07.168Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 1350: 오픈워터뉴웨이브투자조합5호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20190245',
  '오픈워터뉴웨이브투자조합5호',
  4100000000,
  '2021-01-15',
  'Active',
  '오픈워터인베스트먼트',
  'VCS_API_SCRAPER',
  'AS20210064',
  '오픈워터인베스트먼트',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 16 | 산업코드: 2 | 조성총액: 41.0억원',
  '2028-01-14',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20210064","mother_fund_id":"","investment_character_code":"16","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"41.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.168Z"}',
  '2025-06-05T00:42:07.168Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Exact Batch 27 completed! 50 fund records processed.
-- Progress: 1350/3689 total records

