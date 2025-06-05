-- VCS Fund EXACT UPSERT Batch 6/74 (Records 251-300)
-- EXACT: Uses actual fund_table schema columns
-- Generated from VCS API Scraper fund data
-- Generated at: 2025-06-05T00:42:07.085Z
-- Schema: Exact match to actual fund_table structure

-- EXACT FUND DATA (UPSERT - Safe for Duplicates)
-- Processing 50 fund records
-- Will INSERT new records or UPDATE existing ones

-- Record 251: 페인터즈 앤 MLBS 벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20190103',
  '페인터즈 앤 MLBS 벤처투자조합',
  1140000000,
  '2025-04-09',
  'Active',
  '페인터즈앤벤처스',
  'VCS_API_SCRAPER',
  'AS20250276',
  '페인터즈앤벤처스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 16 | 산업코드: 9 | 조성총액: 11.4억원',
  '2030-04-08',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20250276","mother_fund_id":"","investment_character_code":"16","industry_code":"9","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"11.4","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.085Z"}',
  '2025-06-05T00:42:07.085Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 252: 페인터즈 앤 LdV 벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20190103',
  '페인터즈 앤 LdV 벤처투자조합',
  1000000000,
  '2025-04-14',
  'Active',
  '페인터즈앤벤처스',
  'VCS_API_SCRAPER',
  'AS20250285',
  '페인터즈앤벤처스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 20 | 산업코드: 8 | 조성총액: 10.0억원',
  '2035-04-13',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20250285","mother_fund_id":"","investment_character_code":"20","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"10.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.085Z"}',
  '2025-06-05T00:42:07.085Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 253: 페인터즈 앤 JSB 조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20190103',
  '페인터즈 앤 JSB 조합',
  460000000,
  '2025-03-04',
  'Active',
  '페인터즈앤벤처스',
  'VCS_API_SCRAPER',
  'AS20250138',
  '페인터즈앤벤처스',
  '산업코드: 9 | 조성총액: 4.6억원',
  '2032-03-03',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20250138","mother_fund_id":"","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"4.6","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.085Z"}',
  '2025-06-05T00:42:07.085Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 254: 페이스메이커스4호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20170041',
  '페이스메이커스4호',
  100000000,
  '2024-12-30',
  'Active',
  '페이스메이커스',
  'VCS_API_SCRAPER',
  'AS20241445',
  '페이스메이커스',
  '산업코드: 2 | 조성총액: 1.0억원',
  '2030-01-31',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20241445","mother_fund_id":"","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"1.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.085Z"}',
  '2025-06-05T00:42:07.085Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 255: 페이스메이커스3호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20170041',
  '페이스메이커스3호',
  1910000000,
  '2021-12-13',
  'Active',
  '페이스메이커스',
  'VCS_API_SCRAPER',
  'AS20211272',
  '페이스메이커스',
  '산업코드: 2 | 조성총액: 19.1억원',
  '2026-12-31',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20211272","mother_fund_id":"","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"19.1","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.085Z"}',
  '2025-06-05T00:42:07.085Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 256: 페이스메이커스2호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20170041',
  '페이스메이커스2호',
  100000000,
  '2020-12-22',
  'Active',
  '페이스메이커스',
  'VCS_API_SCRAPER',
  'AS20200802',
  '페이스메이커스',
  '산업코드: 8 | 조성총액: 1.0억원',
  '2025-12-31',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20200802","mother_fund_id":"","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"1.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.085Z"}',
  '2025-06-05T00:42:07.085Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 257: 페이서파트너스 개인투자조합 5호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20210452',
  '페이서파트너스 개인투자조합 5호',
  310000000,
  '2024-09-24',
  'Active',
  '(주)페이서파트너스',
  'VCS_API_SCRAPER',
  'AS20240917',
  '(주)페이서파트너스',
  '산업코드: 4 | 조성총액: 3.1억원',
  '2029-09-23',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20240917","mother_fund_id":"","investment_character_code":"","industry_code":"4","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"3.1","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.085Z"}',
  '2025-06-05T00:42:07.085Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 258: 페이서파트너스 개인투자조합 3호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20210452',
  '페이서파트너스 개인투자조합 3호',
  140000000,
  '2024-05-13',
  'Active',
  '(주)페이서파트너스',
  'VCS_API_SCRAPER',
  'AS20240398',
  '(주)페이서파트너스',
  '산업코드: 9 | 조성총액: 1.4억원',
  '2029-09-30',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20240398","mother_fund_id":"","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"1.4","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.085Z"}',
  '2025-06-05T00:42:07.085Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 259: 페이서파트너스 개인투자조합 2호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20210452',
  '페이서파트너스 개인투자조합 2호',
  220000000,
  '2019-10-22',
  'Active',
  '(주)페이서파트너스',
  'VCS_API_SCRAPER',
  'AS20190455',
  '(주)페이서파트너스',
  '산업코드: 9 | 조성총액: 2.2억원',
  '2026-10-21',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20190455","mother_fund_id":"","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"2.2","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.085Z"}',
  '2025-06-05T00:42:07.085Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 260: 페이서파트너스 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20210452',
  '페이서파트너스 개인투자조합',
  230000000,
  '2023-02-07',
  'Active',
  '(주)페이서파트너스',
  'VCS_API_SCRAPER',
  'AS20230077',
  '(주)페이서파트너스',
  '산업코드: 2 | 조성총액: 2.3억원',
  '2028-08-31',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20230077","mother_fund_id":"","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"2.3","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.085Z"}',
  '2025-06-05T00:42:07.085Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 261: 페블즈오픈워터 핀테크 투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20190245',
  '페블즈오픈워터 핀테크 투자조합1호',
  3850000000,
  '2021-06-11',
  'Active',
  '오픈워터인베스트먼트',
  'VCS_API_SCRAPER',
  'AS20210472',
  '오픈워터인베스트먼트',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 25 | 산업코드: 8 | 조성총액: 38.5억원',
  '2026-06-10',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20210472","mother_fund_id":"","investment_character_code":"25","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"38.5","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.085Z"}',
  '2025-06-05T00:42:07.085Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 262: 퍼포먼스 마케팅 신기술 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20140013',
  '퍼포먼스 마케팅 신기술 투자조합',
  100000000,
  '2019-08-19',
  'Active',
  '더인벤션랩',
  'VCS_API_SCRAPER',
  'AS20190357',
  '더인벤션랩',
  '산업코드: 8 | 조성총액: 1.0억원',
  '2026-08-31',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20190357","mother_fund_id":"","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"1.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.085Z"}',
  '2025-06-05T00:42:07.085Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 263: 퍼스트인클라스6호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20190103',
  '퍼스트인클라스6호',
  340000000,
  '2020-06-08',
  'Active',
  '페인터즈앤벤처스',
  'VCS_API_SCRAPER',
  'AS20200253',
  '페인터즈앤벤처스',
  '산업코드: 8 | 조성총액: 3.4억원',
  '2025-06-07',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20200253","mother_fund_id":"","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"3.4","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.085Z"}',
  '2025-06-05T00:42:07.085Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 264: 퍼스트인클라스 9호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20190103',
  '퍼스트인클라스 9호',
  380000000,
  '2020-11-23',
  'Active',
  '페인터즈앤벤처스',
  'VCS_API_SCRAPER',
  'AS20200665',
  '페인터즈앤벤처스',
  '산업코드: 5 | 조성총액: 3.8억원',
  '2025-11-22',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20200665","mother_fund_id":"","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"3.8","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.085Z"}',
  '2025-06-05T00:42:07.085Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 265: 퍼스트인클라스 8호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20190103',
  '퍼스트인클라스 8호',
  120000000,
  '2020-11-05',
  'Active',
  '페인터즈앤벤처스',
  'VCS_API_SCRAPER',
  'AS20200613',
  '페인터즈앤벤처스',
  '산업코드: 5 | 조성총액: 1.2억원',
  '2025-11-04',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20200613","mother_fund_id":"","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"1.2","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.085Z"}',
  '2025-06-05T00:42:07.085Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 266: 퍼스트인클라스 7호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20190103',
  '퍼스트인클라스 7호',
  110000000,
  '2020-09-04',
  'Active',
  '페인터즈앤벤처스',
  'VCS_API_SCRAPER',
  'AS20200459',
  '페인터즈앤벤처스',
  '산업코드: 4 | 조성총액: 1.1억원',
  '2025-09-03',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20200459","mother_fund_id":"","investment_character_code":"","industry_code":"4","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"1.1","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.085Z"}',
  '2025-06-05T00:42:07.085Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 267: 퍼스트인클라스 19호 조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20190103',
  '퍼스트인클라스 19호 조합',
  140000000,
  '2022-09-08',
  'Active',
  '페인터즈앤벤처스',
  'VCS_API_SCRAPER',
  'AS20220998',
  '페인터즈앤벤처스',
  '산업코드: 5 | 조성총액: 1.4억원',
  '2027-09-07',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20220998","mother_fund_id":"","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"1.4","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.085Z"}',
  '2025-06-05T00:42:07.085Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 268: 퍼스트인클라스 18호 조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20190103',
  '퍼스트인클라스 18호 조합',
  220000000,
  '2021-08-23',
  'Active',
  '페인터즈앤벤처스',
  'VCS_API_SCRAPER',
  'AS20210735',
  '페인터즈앤벤처스',
  '산업코드: 5 | 조성총액: 2.2억원',
  '2026-08-22',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20210735","mother_fund_id":"","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"2.2","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.085Z"}',
  '2025-06-05T00:42:07.085Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 269: 퍼스트인클라스 17호 조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20190103',
  '퍼스트인클라스 17호 조합',
  740000000,
  '2021-09-10',
  'Active',
  '페인터즈앤벤처스',
  'VCS_API_SCRAPER',
  'AS20210838',
  '페인터즈앤벤처스',
  '산업코드: 2 | 조성총액: 7.4억원',
  '2026-09-09',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20210838","mother_fund_id":"","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"7.4","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.085Z"}',
  '2025-06-05T00:42:07.085Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 270: 퍼스트인클라스 16호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20190103',
  '퍼스트인클라스 16호',
  190000000,
  '2021-07-15',
  'Active',
  '페인터즈앤벤처스',
  'VCS_API_SCRAPER',
  'AS20210548',
  '페인터즈앤벤처스',
  '산업코드: 2 | 조성총액: 1.9억원',
  '2026-06-30',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20210548","mother_fund_id":"","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"1.9","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.085Z"}',
  '2025-06-05T00:42:07.085Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 271: 퍼스트인클라스 15호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20190103',
  '퍼스트인클라스 15호',
  210000000,
  '2021-05-11',
  'Active',
  '페인터즈앤벤처스',
  'VCS_API_SCRAPER',
  'AS20210354',
  '페인터즈앤벤처스',
  '산업코드: 8 | 조성총액: 2.1억원',
  '2026-05-10',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20210354","mother_fund_id":"","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"2.1","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.085Z"}',
  '2025-06-05T00:42:07.085Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 272: 퍼스트인클라스 14호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20190103',
  '퍼스트인클라스 14호',
  100000000,
  '2021-05-10',
  'Active',
  '페인터즈앤벤처스',
  'VCS_API_SCRAPER',
  'AS20210346',
  '페인터즈앤벤처스',
  '산업코드: 2 | 조성총액: 1.0억원',
  '2026-05-09',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20210346","mother_fund_id":"","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"1.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.085Z"}',
  '2025-06-05T00:42:07.085Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 273: 퍼스트인클라스 13호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20190103',
  '퍼스트인클라스 13호',
  260000000,
  '2021-03-11',
  'Active',
  '페인터즈앤벤처스',
  'VCS_API_SCRAPER',
  'AS20210163',
  '페인터즈앤벤처스',
  '산업코드: 8 | 조성총액: 2.6억원',
  '2026-03-10',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20210163","mother_fund_id":"","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"2.6","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.085Z"}',
  '2025-06-05T00:42:07.085Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 274: 퍼스트인클라스 12호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20190103',
  '퍼스트인클라스 12호',
  150000000,
  '2021-03-02',
  'Active',
  '페인터즈앤벤처스',
  'VCS_API_SCRAPER',
  'AS20210146',
  '페인터즈앤벤처스',
  '산업코드: 2 | 조성총액: 1.5억원',
  '2026-03-01',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20210146","mother_fund_id":"","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"1.5","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.085Z"}',
  '2025-06-05T00:42:07.085Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 275: 퍼스트인클라스 11호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20190103',
  '퍼스트인클라스 11호',
  280000000,
  '2021-01-12',
  'Active',
  '페인터즈앤벤처스',
  'VCS_API_SCRAPER',
  'AS20210027',
  '페인터즈앤벤처스',
  '산업코드: 5 | 조성총액: 2.8억원',
  '2026-01-11',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20210027","mother_fund_id":"","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"2.8","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.085Z"}',
  '2025-06-05T00:42:07.085Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 276: 퍼스트인클라스 10호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20190103',
  '퍼스트인클라스 10호',
  280000000,
  '2020-11-23',
  'Active',
  '페인터즈앤벤처스',
  'VCS_API_SCRAPER',
  'AS20200686',
  '페인터즈앤벤처스',
  '산업코드: 2 | 조성총액: 2.8억원',
  '2025-11-22',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20200686","mother_fund_id":"","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"2.8","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.086Z"}',
  '2025-06-05T00:42:07.086Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 277: 퍼스트스텝제6호조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200377',
  '퍼스트스텝제6호조합',
  550000000,
  '2024-12-18',
  'Active',
  '퍼스트스텝랩스',
  'VCS_API_SCRAPER',
  'AS20241340',
  '퍼스트스텝랩스',
  '산업코드: 7 | 조성총액: 5.5억원',
  '2029-12-17',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20241340","mother_fund_id":"","investment_character_code":"","industry_code":"7","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"5.5","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.086Z"}',
  '2025-06-05T00:42:07.086Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 278: 퍼스트스텝제5호조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200377',
  '퍼스트스텝제5호조합',
  1990000000,
  '2023-06-26',
  'Active',
  '퍼스트스텝랩스',
  'VCS_API_SCRAPER',
  'AS20230508',
  '퍼스트스텝랩스',
  '산업코드: 2 | 조성총액: 19.9억원',
  '2031-06-25',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20230508","mother_fund_id":"","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"19.9","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.086Z"}',
  '2025-06-05T00:42:07.086Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 279: 퍼스트스텝제4호조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200377',
  '퍼스트스텝제4호조합',
  1680000000,
  '2022-04-18',
  'Active',
  '퍼스트스텝랩스',
  'VCS_API_SCRAPER',
  'AS20220337',
  '퍼스트스텝랩스',
  '산업코드: 8 | 조성총액: 16.8억원',
  '2030-04-17',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20220337","mother_fund_id":"","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"16.8","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.086Z"}',
  '2025-06-05T00:42:07.086Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 280: 퍼스트스텝제3호조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200377',
  '퍼스트스텝제3호조합',
  1800000000,
  '2022-04-08',
  'Active',
  '퍼스트스텝랩스',
  'VCS_API_SCRAPER',
  'AS20220336',
  '퍼스트스텝랩스',
  '산업코드: 8 | 조성총액: 18.0억원',
  '2030-04-07',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20220336","mother_fund_id":"","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"18.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.086Z"}',
  '2025-06-05T00:42:07.086Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 281: 퍼스트스텝제2호조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200377',
  '퍼스트스텝제2호조합',
  1000000000,
  '2021-12-27',
  'Active',
  '퍼스트스텝랩스',
  'VCS_API_SCRAPER',
  'AS20211402',
  '퍼스트스텝랩스',
  '산업코드: 2 | 조성총액: 10.0억원',
  '2029-12-26',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20211402","mother_fund_id":"","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"10.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.086Z"}',
  '2025-06-05T00:42:07.086Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 282: 퍼스트스텝제1호조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200377',
  '퍼스트스텝제1호조합',
  990000000,
  '2021-08-26',
  'Active',
  '퍼스트스텝랩스',
  'VCS_API_SCRAPER',
  'AS20210754',
  '퍼스트스텝랩스',
  '산업코드: 2 | 조성총액: 9.9억원',
  '2029-08-25',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20210754","mother_fund_id":"","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"9.9","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.086Z"}',
  '2025-06-05T00:42:07.086Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 283: 퍼스트게이트 특허창업기업 개인투자조합 2호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200436',
  '퍼스트게이트 특허창업기업 개인투자조합 2호',
  5000000000,
  '2022-10-06',
  'Active',
  '퍼스트게이트',
  'VCS_API_SCRAPER',
  'AS20221106',
  '퍼스트게이트',
  '산업코드: 5 | 조성총액: 50.0억원',
  '2028-10-05',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20221106","mother_fund_id":"MF00000001","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"50.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.086Z"}',
  '2025-06-05T00:42:07.086Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 284: 퍼스트게이트 개인투자조합 5호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200436',
  '퍼스트게이트 개인투자조합 5호',
  550000000,
  '2023-12-19',
  'Active',
  '퍼스트게이트',
  'VCS_API_SCRAPER',
  'AS20231266',
  '퍼스트게이트',
  '산업코드: 8 | 조성총액: 5.5억원',
  '2028-12-18',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20231266","mother_fund_id":"","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"5.5","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.086Z"}',
  '2025-06-05T00:42:07.086Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 285: 퍼스트게이트 개인투자조합 4호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200436',
  '퍼스트게이트 개인투자조합 4호',
  120000000,
  '2023-09-27',
  'Active',
  '퍼스트게이트',
  'VCS_API_SCRAPER',
  'AS20230862',
  '퍼스트게이트',
  '산업코드: 5 | 조성총액: 1.2억원',
  '2028-09-26',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20230862","mother_fund_id":"","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"1.2","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.086Z"}',
  '2025-06-05T00:42:07.086Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 286: 퍼스트게이트 개인투자조합 3호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200436',
  '퍼스트게이트 개인투자조합 3호',
  140000000,
  '2023-08-22',
  'Active',
  '퍼스트게이트',
  'VCS_API_SCRAPER',
  'AS20230719',
  '퍼스트게이트',
  '산업코드: 3 | 조성총액: 1.4억원',
  '2028-08-21',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20230719","mother_fund_id":"","investment_character_code":"","industry_code":"3","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"1.4","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.086Z"}',
  '2025-06-05T00:42:07.086Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 287: 퍼스트게이트 개인투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200436',
  '퍼스트게이트 개인투자조합 1호',
  600000000,
  '2021-07-02',
  'Active',
  '퍼스트게이트',
  'VCS_API_SCRAPER',
  'AS20210488',
  '퍼스트게이트',
  '산업코드: 5 | 조성총액: 6.0억원',
  '2026-07-01',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20210488","mother_fund_id":"","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"6.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.086Z"}',
  '2025-06-05T00:42:07.086Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 288: 패스파인더-IBK혁신솔루션펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20160016',
  '패스파인더-IBK혁신솔루션펀드',
  8500000000,
  '2022-08-08',
  'Active',
  '패스파인더에이치',
  'VCS_API_SCRAPER',
  'AS20220900',
  '패스파인더에이치',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 20 | 산업코드: 2 | 조성총액: 85.0억원',
  '2030-08-07',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20220900","mother_fund_id":"","investment_character_code":"20","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"85.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.086Z"}',
  '2025-06-05T00:42:07.086Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 289: 패스파인더 청년창업 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20160016',
  '패스파인더 청년창업 투자조합',
  15000000000,
  '2017-09-04',
  'Active',
  '패스파인더에이치',
  'VCS_API_SCRAPER',
  'AS20170100',
  '패스파인더에이치',
  '투자분야: 일반 | 세부분야: 일반 기타 | 투자성격코드: 21 | 산업코드: 2 | 조성총액: 150.0억원',
  '2025-09-03',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20170100","mother_fund_id":"MF00000001","investment_character_code":"21","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"일반 기타","formation_total_amount":"150.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.086Z"}',
  '2025-06-05T00:42:07.086Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 290: 패스파인더 스타트업 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20160016',
  '패스파인더 스타트업 투자조합',
  20000000000,
  '2019-11-15',
  'Active',
  '패스파인더에이치',
  'VCS_API_SCRAPER',
  'AS20190520',
  '패스파인더에이치',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 20 | 산업코드: 5 | 조성총액: 200.0억원',
  '2027-11-14',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20190520","mother_fund_id":"MF00000001","investment_character_code":"20","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"200.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.086Z"}',
  '2025-06-05T00:42:07.086Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 291: 패스파인더 미래환경산업 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20160016',
  '패스파인더 미래환경산업 투자조합',
  20000000000,
  '2024-09-05',
  'Active',
  '패스파인더에이치',
  'VCS_API_SCRAPER',
  'AS20240868',
  '패스파인더에이치',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 05 | 산업코드: 8 | 조성총액: 200.0억원',
  '2032-09-04',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20240868","mother_fund_id":"MF00000001","investment_character_code":"05","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"200.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.086Z"}',
  '2025-06-05T00:42:07.086Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 292: 패스파인더 리본 투자조합 2호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20160016',
  '패스파인더 리본 투자조합 2호',
  30000000000,
  '2022-12-09',
  'Active',
  '패스파인더에이치',
  'VCS_API_SCRAPER',
  'AS20221433',
  '패스파인더에이치',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 22 | 산업코드: 2 | 조성총액: 300.0억원',
  '2030-12-08',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20221433","mother_fund_id":"MF00000001","investment_character_code":"22","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"300.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.086Z"}',
  '2025-06-05T00:42:07.086Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 293: 패스파인더 리본 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20160016',
  '패스파인더 리본 투자조합',
  20000000000,
  '2017-12-29',
  'Active',
  '패스파인더에이치',
  'VCS_API_SCRAPER',
  'AS20180022',
  '패스파인더에이치',
  '투자분야: 일반 | 세부분야: 일반 기타 | 투자성격코드: 22 | 산업코드: 3 | 조성총액: 200.0억원',
  '2025-12-28',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20180022","mother_fund_id":"MF00000001","investment_character_code":"22","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"일반 기타","formation_total_amount":"200.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.086Z"}',
  '2025-06-05T00:42:07.086Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 294: 패스파인더 국토교통혁신 투자조합 2호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20160016',
  '패스파인더 국토교통혁신 투자조합 2호',
  18000000000,
  '2022-03-29',
  'Active',
  '패스파인더에이치',
  'VCS_API_SCRAPER',
  'AS20220355',
  '패스파인더에이치',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 02 | 산업코드: 2 | 조성총액: 180.0억원',
  '2030-03-28',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20220355","mother_fund_id":"MF00000001","investment_character_code":"02","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"180.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.086Z"}',
  '2025-06-05T00:42:07.086Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 295: 패스파인더 국토교통혁신 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20160016',
  '패스파인더 국토교통혁신 투자조합',
  17000000000,
  '2020-09-09',
  'Active',
  '패스파인더에이치',
  'VCS_API_SCRAPER',
  'AS20200488',
  '패스파인더에이치',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 10 | 산업코드: 2 | 조성총액: 170.0억원',
  '2028-09-08',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20200488","mother_fund_id":"MF00000001","investment_character_code":"10","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"170.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.086Z"}',
  '2025-06-05T00:42:07.086Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 296: 패스트 벤처투자조합 코어 1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20190427',
  '패스트 벤처투자조합 코어 1호',
  8900000000,
  '2024-12-24',
  'Active',
  '패스트벤처스',
  'VCS_API_SCRAPER',
  'AS20241434',
  '패스트벤처스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 06 | 산업코드: 2 | 조성총액: 89.0억원',
  '2032-12-23',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20241434","mother_fund_id":"","investment_character_code":"06","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"89.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.086Z"}',
  '2025-06-05T00:42:07.086Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 297: 패스트 벤처투자조합 스타일 1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20190427',
  '패스트 벤처투자조합 스타일 1호',
  2030000000,
  '2025-01-14',
  'Active',
  '패스트벤처스',
  'VCS_API_SCRAPER',
  'AS20250046',
  '패스트벤처스',
  '투자분야: 일반 | 세부분야: 일반 기타 | 투자성격코드: 25 | 산업코드: 8 | 조성총액: 20.3억원',
  '2030-01-13',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20250046","mother_fund_id":"","investment_character_code":"25","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"일반 기타","formation_total_amount":"20.3","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.086Z"}',
  '2025-06-05T00:42:07.086Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 298: 패스트 2022 Seed 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20190427',
  '패스트 2022 Seed 투자조합',
  19700000000,
  '2022-09-27',
  'Active',
  '패스트벤처스',
  'VCS_API_SCRAPER',
  'AS20221114',
  '패스트벤처스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 02 | 산업코드: 8 | 조성총액: 197.0억원',
  '2030-09-26',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20221114","mother_fund_id":"","investment_character_code":"02","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"197.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.086Z"}',
  '2025-06-05T00:42:07.086Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 299: 패스트 2021 Seed 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20190427',
  '패스트 2021 Seed 투자조합',
  11200000000,
  '2021-08-06',
  'Active',
  '패스트벤처스',
  'VCS_API_SCRAPER',
  'AS20210690',
  '패스트벤처스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 02 | 산업코드: 8 | 조성총액: 112.0억원',
  '2029-08-05',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20210690","mother_fund_id":"","investment_character_code":"02","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"112.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.086Z"}',
  '2025-06-05T00:42:07.086Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 300: 패스트 2020 Seed 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20190427',
  '패스트 2020 Seed 투자조합',
  7100000000,
  '2020-02-24',
  'Active',
  '패스트벤처스',
  'VCS_API_SCRAPER',
  'AS20200084',
  '패스트벤처스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 01 | 산업코드: 8 | 조성총액: 71.0억원',
  '2028-02-23',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20200084","mother_fund_id":"","investment_character_code":"01","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"71.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.086Z"}',
  '2025-06-05T00:42:07.086Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Exact Batch 6 completed! 50 fund records processed.
-- Progress: 300/3689 total records

