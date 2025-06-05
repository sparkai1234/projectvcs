-- VCS Fund EXACT UPSERT Batch 10/74 (Records 451-500)
-- EXACT: Uses actual fund_table schema columns
-- Generated from VCS API Scraper fund data
-- Generated at: 2025-06-05T00:42:07.102Z
-- Schema: Exact match to actual fund_table structure

-- EXACT FUND DATA (UPSERT - Safe for Duplicates)
-- Processing 50 fund records
-- Will INSERT new records or UPDATE existing ones

-- Record 451: 쿼드7호벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20190180',
  '쿼드7호벤처투자조합',
  24200000000,
  '2024-07-29',
  'Active',
  '쿼드벤처스',
  'VCS_API_SCRAPER',
  'AS20240697',
  '쿼드벤처스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 10 | 산업코드: 3 | 조성총액: 242.0억원',
  '2031-07-28',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20240697","mother_fund_id":"MF00000001","investment_character_code":"10","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"242.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.102Z"}',
  '2025-06-05T00:42:07.102Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 452: 쿼드4호벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20190180',
  '쿼드4호벤처투자조합',
  20000000000,
  '2022-09-19',
  'Active',
  '쿼드벤처스',
  'VCS_API_SCRAPER',
  'AS20221070',
  '쿼드벤처스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 20 | 산업코드: 2 | 조성총액: 200.0억원',
  '2030-09-18',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20221070","mother_fund_id":"MF00000001","investment_character_code":"20","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"200.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.102Z"}',
  '2025-06-05T00:42:07.102Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 453: 쿼드2호벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20190180',
  '쿼드2호벤처투자조합',
  4950000000,
  '2019-10-08',
  'Active',
  '쿼드벤처스',
  'VCS_API_SCRAPER',
  'AS20190466',
  '쿼드벤처스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 16 | 산업코드: 8 | 조성총액: 49.5억원',
  '2026-10-07',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20190466","mother_fund_id":"","investment_character_code":"16","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"49.5","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.102Z"}',
  '2025-06-05T00:42:07.102Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 454: 쿼드 프로젝트 8 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20220281',
  '쿼드 프로젝트 8 투자조합',
  10750000000,
  '2024-07-22',
  'Active',
  '쿼드자산운용',
  'VCS_API_SCRAPER',
  'AS20240678',
  '쿼드자산운용',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 25 | 산업코드: 3 | 조성총액: 107.5억원',
  '2029-07-21',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20240678","mother_fund_id":"","investment_character_code":"25","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"107.5","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.102Z"}',
  '2025-06-05T00:42:07.102Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 455: 쿼드 콜라보 오퍼스2 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20220281',
  '쿼드 콜라보 오퍼스2 투자조합',
  90200000000,
  '2022-06-16',
  'Active',
  '쿼드자산운용',
  'VCS_API_SCRAPER',
  'AS20220675',
  '쿼드자산운용',
  '투자분야: 일반 | 세부분야: 바이오 | 투자성격코드: 04 | 산업코드: 5 | 조성총액: 902.0억원',
  '2030-06-15',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20220675","mother_fund_id":"","investment_character_code":"04","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"바이오","formation_total_amount":"902.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.102Z"}',
  '2025-06-05T00:42:07.102Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 456: 쿼드 콜라보 메가트렌드 2 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20220281',
  '쿼드 콜라보 메가트렌드 2 투자조합',
  7000000000,
  '2023-10-17',
  'Active',
  '쿼드자산운용',
  'VCS_API_SCRAPER',
  'AS20230944',
  '쿼드자산운용',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 25 | 산업코드: 2 | 조성총액: 70.0억원',
  '2028-10-16',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20230944","mother_fund_id":"","investment_character_code":"25","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"70.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.102Z"}',
  '2025-06-05T00:42:07.102Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 457: 쿼드 그래비티 멀티스트래티지 4 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20220281',
  '쿼드 그래비티 멀티스트래티지 4 투자조합',
  11760000000,
  '2023-11-27',
  'Active',
  '쿼드자산운용',
  'VCS_API_SCRAPER',
  'AS20231148',
  '쿼드자산운용',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 25 | 산업코드: 3 | 조성총액: 117.6억원',
  '2028-11-26',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20231148","mother_fund_id":"","investment_character_code":"25","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"117.6","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.102Z"}',
  '2025-06-05T00:42:07.102Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 458: 쿼드 그래비티 멀티스트래티지 3 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20220281',
  '쿼드 그래비티 멀티스트래티지 3 투자조합',
  10900000000,
  '2022-12-23',
  'Active',
  '쿼드자산운용',
  'VCS_API_SCRAPER',
  'AS20221538',
  '쿼드자산운용',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 16 | 산업코드: 9 | 조성총액: 109.0억원',
  '2027-12-22',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20221538","mother_fund_id":"","investment_character_code":"16","industry_code":"9","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"109.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.102Z"}',
  '2025-06-05T00:42:07.102Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 459: 쿱차이즈 외식벤처 개인투자조합 2022 09호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20220537',
  '쿱차이즈 외식벤처 개인투자조합 2022 09호',
  160000000,
  '2022-12-26',
  'Active',
  '쿱앤파트너스',
  'VCS_API_SCRAPER',
  'AS20221499',
  '쿱앤파트너스',
  '산업코드: 8 | 조성총액: 1.6억원',
  '2027-12-25',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20221499","mother_fund_id":"","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"1.6","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.102Z"}',
  '2025-06-05T00:42:07.102Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 460: 쿱차이즈 외식벤처 개인투자조합 03호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20220537',
  '쿱차이즈 외식벤처 개인투자조합 03호',
  100000000,
  '2024-04-30',
  'Active',
  '쿱앤파트너스',
  'VCS_API_SCRAPER',
  'AS20240363',
  '쿱앤파트너스',
  '산업코드: 8 | 조성총액: 1.0억원',
  '2029-04-25',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20240363","mother_fund_id":"","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"1.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.102Z"}',
  '2025-06-05T00:42:07.102Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 461: 쿱차이즈 외식벤처 개인투자조합 02호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20220537',
  '쿱차이즈 외식벤처 개인투자조합 02호',
  100000000,
  '2023-11-10',
  'Active',
  '쿱앤파트너스',
  'VCS_API_SCRAPER',
  'AS20231058',
  '쿱앤파트너스',
  '산업코드: 8 | 조성총액: 1.0억원',
  '2028-11-08',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20231058","mother_fund_id":"","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"1.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.102Z"}',
  '2025-06-05T00:42:07.102Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 462: 콜즈다이나믹스 프롭테크 제1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20190241',
  '콜즈다이나믹스 프롭테크 제1호',
  110000000,
  '2020-07-21',
  'Active',
  '콜즈다이나믹스',
  'VCS_API_SCRAPER',
  'AS20200342',
  '콜즈다이나믹스',
  '산업코드: 2 | 조성총액: 1.1억원',
  '2026-12-31',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20200342","mother_fund_id":"","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"1.1","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.102Z"}',
  '2025-06-05T00:42:07.102Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 463: 콜즈다이나믹스 소상공마켓혁신 개인투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20190241',
  '콜즈다이나믹스 소상공마켓혁신 개인투자조합 1호',
  200000000,
  '2023-06-20',
  'Active',
  '콜즈다이나믹스',
  'VCS_API_SCRAPER',
  'AS20230511',
  '콜즈다이나믹스',
  '산업코드: 2 | 조성총액: 2.0억원',
  '2028-12-31',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20230511","mother_fund_id":"","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"2.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.102Z"}',
  '2025-06-05T00:42:07.102Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 464: 콜즈다이나믹스 기업형소상공 개인투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20190241',
  '콜즈다이나믹스 기업형소상공 개인투자조합 1호',
  110000000,
  '2024-01-04',
  'Active',
  '콜즈다이나믹스',
  'VCS_API_SCRAPER',
  'AS20240005',
  '콜즈다이나믹스',
  '산업코드: 8 | 조성총액: 1.1억원',
  '2031-01-02',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20240005","mother_fund_id":"","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"1.1","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.102Z"}',
  '2025-06-05T00:42:07.102Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 465: 콘탱고 알파 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20220466',
  '콘탱고 알파 투자조합',
  100000000,
  '2022-10-24',
  'Active',
  '콘탱고파트너스',
  'VCS_API_SCRAPER',
  'AS20221165',
  '콘탱고파트너스',
  '산업코드: 9 | 조성총액: 1.0억원',
  '2027-10-23',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20221165","mother_fund_id":"","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"1.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.102Z"}',
  '2025-06-05T00:42:07.102Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 466: 콘탱고 세이프인컴 투자조합 4호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20220466',
  '콘탱고 세이프인컴 투자조합 4호',
  1270000000,
  '2023-04-13',
  'Active',
  '콘탱고파트너스',
  'VCS_API_SCRAPER',
  'AS20230261',
  '콘탱고파트너스',
  '산업코드: 9 | 조성총액: 12.7억원',
  '2028-04-12',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20230261","mother_fund_id":"","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"12.7","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.102Z"}',
  '2025-06-05T00:42:07.102Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 467: 콘탱고 세이프인컴 투자조합 3호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20220466',
  '콘탱고 세이프인컴 투자조합 3호',
  2320000000,
  '2024-07-15',
  'Active',
  '콘탱고파트너스',
  'VCS_API_SCRAPER',
  'AS20240636',
  '콘탱고파트너스',
  '산업코드: 9 | 조성총액: 23.2억원',
  '2029-07-14',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20240636","mother_fund_id":"","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"23.2","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.102Z"}',
  '2025-06-05T00:42:07.102Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 468: 코헬레트 제6호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20210593',
  '코헬레트 제6호 개인투자조합',
  840000000,
  '2022-09-08',
  'Active',
  '메디이노파트너스',
  'VCS_API_SCRAPER',
  'AS20221007',
  '메디이노파트너스',
  '산업코드: 2 | 조성총액: 8.4억원',
  '2027-09-07',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20221007","mother_fund_id":"","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"8.4","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.102Z"}',
  '2025-06-05T00:42:07.102Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 469: 코헬레트 제5호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20210593',
  '코헬레트 제5호 개인투자조합',
  650000000,
  '2022-10-25',
  'Active',
  '메디이노파트너스',
  'VCS_API_SCRAPER',
  'AS20221185',
  '메디이노파트너스',
  '산업코드: 2 | 조성총액: 6.5억원',
  '2027-10-24',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20221185","mother_fund_id":"","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"6.5","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.102Z"}',
  '2025-06-05T00:42:07.102Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 470: 코헬레트 제3호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20210593',
  '코헬레트 제3호 개인투자조합',
  630000000,
  '2022-09-23',
  'Active',
  '메디이노파트너스',
  'VCS_API_SCRAPER',
  'AS20221034',
  '메디이노파트너스',
  '산업코드: 2 | 조성총액: 6.3억원',
  '2027-09-22',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20221034","mother_fund_id":"","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"6.3","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.102Z"}',
  '2025-06-05T00:42:07.102Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 471: 코웰 유니콘 K-반도체 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20190375',
  '코웰 유니콘 K-반도체 투자조합',
  5550000000,
  '2023-12-19',
  'Active',
  '경남벤처투자',
  'VCS_API_SCRAPER',
  'AS20231313',
  '경남벤처투자',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 25 | 산업코드: 1 | 조성총액: 55.5억원',
  '2028-12-18',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20231313","mother_fund_id":"","investment_character_code":"25","industry_code":"1","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"55.5","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.102Z"}',
  '2025-06-05T00:42:07.102Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 472: 코오롱 소재부품 투자펀드 2014-2호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20000052',
  '코오롱 소재부품 투자펀드 2014-2호',
  43000000000,
  '2014-10-24',
  'Active',
  '코오롱인베스트먼트',
  'VCS_API_SCRAPER',
  'AS20140040',
  '코오롱인베스트먼트',
  '투자분야: 일반 | 세부분야: 부품소재 | 투자성격코드: 03 | 산업코드: 1 | 조성총액: 430.0억원',
  '2025-10-23',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20140040","mother_fund_id":"MF00000001","investment_character_code":"03","industry_code":"1","investment_field_type":"일반","investment_field_detail_type":"부품소재","formation_total_amount":"430.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.102Z"}',
  '2025-06-05T00:42:07.102Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 473: 코오롱 2024 청년창업 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20000052',
  '코오롱 2024 청년창업 투자조합',
  25000000000,
  '2024-07-30',
  'Active',
  '코오롱인베스트먼트',
  'VCS_API_SCRAPER',
  'AS20240708',
  '코오롱인베스트먼트',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 21 | 산업코드: 5 | 조성총액: 250.0억원',
  '2032-07-29',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20240708","mother_fund_id":"MF00000001","investment_character_code":"21","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"250.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.102Z"}',
  '2025-06-05T00:42:07.102Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 474: 코오롱 2024 기술혁신전문 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20000052',
  '코오롱 2024 기술혁신전문 투자조합',
  70000000000,
  '2025-04-03',
  'Active',
  '코오롱인베스트먼트',
  'VCS_API_SCRAPER',
  'AS20250266',
  '코오롱인베스트먼트',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 10 | 산업코드: 9 | 조성총액: 700.0억원',
  '2033-04-02',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20250266","mother_fund_id":"","investment_character_code":"10","industry_code":"9","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"700.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.102Z"}',
  '2025-06-05T00:42:07.102Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 475: 코오롱 2021 이노베이션 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20000052',
  '코오롱 2021 이노베이션 투자조합',
  195000000000,
  '2021-09-29',
  'Active',
  '코오롱인베스트먼트',
  'VCS_API_SCRAPER',
  'AS20210927',
  '코오롱인베스트먼트',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 10 | 산업코드: 2 | 조성총액: 1950.0억원',
  '2029-09-28',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20210927","mother_fund_id":"MF00000001","investment_character_code":"10","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"1950.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.102Z"}',
  '2025-06-05T00:42:07.102Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 476: 코오롱 2020 소재부품장비 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20000052',
  '코오롱 2020 소재부품장비 투자조합',
  67500000000,
  '2020-05-26',
  'Active',
  '코오롱인베스트먼트',
  'VCS_API_SCRAPER',
  'AS20200223',
  '코오롱인베스트먼트',
  '투자분야: 일반 | 세부분야: 부품소재 | 투자성격코드: 03 | 산업코드: 3 | 조성총액: 675.0억원',
  '2029-05-25',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20200223","mother_fund_id":"MF00000001","investment_character_code":"03","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"부품소재","formation_total_amount":"675.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.102Z"}',
  '2025-06-05T00:42:07.102Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 477: 코오롱 2019 유니콘 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20000052',
  '코오롱 2019 유니콘 투자조합',
  70000000000,
  '2019-11-20',
  'Active',
  '코오롱인베스트먼트',
  'VCS_API_SCRAPER',
  'AS20190523',
  '코오롱인베스트먼트',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 12 | 산업코드: 5 | 조성총액: 700.0억원',
  '2027-11-19',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20190523","mother_fund_id":"MF00000011","investment_character_code":"12","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"700.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.102Z"}',
  '2025-06-05T00:42:07.102Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 478: 코오롱 2017 신산업 육성 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20000052',
  '코오롱 2017 신산업 육성 투자조합',
  52000000000,
  '2017-09-28',
  'Active',
  '코오롱인베스트먼트',
  'VCS_API_SCRAPER',
  'AS20170116',
  '코오롱인베스트먼트',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 02 | 산업코드: 5 | 조성총액: 520.0억원',
  '2025-09-27',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20170116","mother_fund_id":"","investment_character_code":"02","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"520.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.102Z"}',
  '2025-06-05T00:42:07.102Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 479: 코오롱 2017 4차 산업혁명 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20000052',
  '코오롱 2017 4차 산업혁명 투자조합',
  67000000000,
  '2017-12-28',
  'Active',
  '코오롱인베스트먼트',
  'VCS_API_SCRAPER',
  'AS20180030',
  '코오롱인베스트먼트',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 02 | 산업코드: 5 | 조성총액: 670.0억원',
  '2025-12-27',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20180030","mother_fund_id":"MF00000001","investment_character_code":"02","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"670.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.102Z"}',
  '2025-06-05T00:42:07.102Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 480: 코오롱 2015 K-ICT 디지털콘텐츠 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20000052',
  '코오롱 2015 K-ICT 디지털콘텐츠 투자조합',
  20000000000,
  '2016-04-12',
  'Active',
  '코오롱인베스트먼트',
  'VCS_API_SCRAPER',
  'AS20160101',
  '코오롱인베스트먼트',
  '투자분야: 문화 | 세부분야: 문화 기타 | 투자성격코드: 24 | 산업코드: 2 | 조성총액: 200.0억원',
  '2026-04-11',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20160101","mother_fund_id":"MF00000001","investment_character_code":"24","industry_code":"2","investment_field_type":"문화","investment_field_detail_type":"문화 기타","formation_total_amount":"200.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.102Z"}',
  '2025-06-05T00:42:07.102Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 481: 코스콤-미래에셋 핀테크 투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP19990017',
  '코스콤-미래에셋 핀테크 투자조합1호',
  2000000000,
  '2015-11-16',
  'Active',
  '미래에셋벤처투자',
  'VCS_API_SCRAPER',
  'AS20150013',
  '미래에셋벤처투자',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 02 | 산업코드: 2 | 조성총액: 20.0억원',
  '2025-11-15',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20150013","mother_fund_id":"","investment_character_code":"02","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"20.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.102Z"}',
  '2025-06-05T00:42:07.102Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 482: 코스메틱 제조혁신 펀드 1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20180065',
  '코스메틱 제조혁신 펀드 1호',
  120000000,
  '2021-07-29',
  'Active',
  '엔피프틴파트너스',
  'VCS_API_SCRAPER',
  'AS20210644',
  '엔피프틴파트너스',
  '산업코드: 8 | 조성총액: 1.2억원',
  '2028-03-31',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20210644","mother_fund_id":"","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"1.2","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.102Z"}',
  '2025-06-05T00:42:07.102Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 483: 코스넷 세미콘 투 벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20180005',
  '코스넷 세미콘 투 벤처투자조합',
  8050000000,
  '2023-05-26',
  'Active',
  '코스넷기술투자',
  'VCS_API_SCRAPER',
  'AS20230423',
  '코스넷기술투자',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 25 | 산업코드: 1 | 조성총액: 80.5억원',
  '2028-05-25',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20230423","mother_fund_id":"","investment_character_code":"25","industry_code":"1","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"80.5","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.102Z"}',
  '2025-06-05T00:42:07.102Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 484: 코벤트 피델리티 조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200104',
  '코벤트 피델리티 조합',
  400000000,
  '2023-11-27',
  'Active',
  '코벤트캐피탈파트너스',
  'VCS_API_SCRAPER',
  'AS20231125',
  '코벤트캐피탈파트너스',
  '산업코드: 9 | 조성총액: 4.0억원',
  '2028-11-26',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20231125","mother_fund_id":"","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"4.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.102Z"}',
  '2025-06-05T00:42:07.102Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 485: 코벤트 엘릭서 펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200104',
  '코벤트 엘릭서 펀드',
  2510000000,
  '2021-12-21',
  'Active',
  '코벤트캐피탈파트너스',
  'VCS_API_SCRAPER',
  'AS20211382',
  '코벤트캐피탈파트너스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 03 | 산업코드: 8 | 조성총액: 25.1억원',
  '2026-12-20',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20211382","mother_fund_id":"","investment_character_code":"03","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"25.1","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.102Z"}',
  '2025-06-05T00:42:07.103Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 486: 코메스에스앤에스2024투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20170001',
  '코메스에스앤에스2024투자조합',
  40000000000,
  '2024-08-01',
  'Active',
  '코메스인베스트먼트',
  'VCS_API_SCRAPER',
  'AS20240723',
  '코메스인베스트먼트',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 20 | 산업코드: 4 | 조성총액: 400.0억원',
  '2032-07-31',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20240723","mother_fund_id":"MF00000001","investment_character_code":"20","industry_code":"4","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"400.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.103Z"}',
  '2025-06-05T00:42:07.103Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 487: 코메스2022-1소재부품장비투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20170001',
  '코메스2022-1소재부품장비투자조합',
  30000000000,
  '2022-07-08',
  'Active',
  '코메스인베스트먼트',
  'VCS_API_SCRAPER',
  'AS20220762',
  '코메스인베스트먼트',
  '투자분야: 일반 | 세부분야: 부품소재 | 투자성격코드: 03 | 산업코드: 3 | 조성총액: 300.0억원',
  '2030-07-07',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20220762","mother_fund_id":"MF00000001","investment_character_code":"03","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"부품소재","formation_total_amount":"300.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.103Z"}',
  '2025-06-05T00:42:07.103Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 488: 코메스2021-2신소재성장투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20170001',
  '코메스2021-2신소재성장투자조합',
  22500000000,
  '2022-01-06',
  'Active',
  '코메스인베스트먼트',
  'VCS_API_SCRAPER',
  'AS20220026',
  '코메스인베스트먼트',
  '투자분야: 일반 | 세부분야: 부품소재 | 투자성격코드: 03 | 산업코드: 4 | 조성총액: 225.0억원',
  '2027-01-05',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20220026","mother_fund_id":"","investment_character_code":"03","industry_code":"4","investment_field_type":"일반","investment_field_detail_type":"부품소재","formation_total_amount":"225.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.103Z"}',
  '2025-06-05T00:42:07.103Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 489: 코메스2021-1일자리창출투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20170001',
  '코메스2021-1일자리창출투자조합',
  30000000000,
  '2022-01-04',
  'Active',
  '코메스인베스트먼트',
  'VCS_API_SCRAPER',
  'AS20220018',
  '코메스인베스트먼트',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 14 | 산업코드: 2 | 조성총액: 300.0억원',
  '2032-01-03',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20220018","mother_fund_id":"","investment_character_code":"14","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"300.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.103Z"}',
  '2025-06-05T00:42:07.103Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 490: 코메스2018-2 소셜임팩트투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20170001',
  '코메스2018-2 소셜임팩트투자조합',
  10000000000,
  '2018-11-16',
  'Active',
  '코메스인베스트먼트',
  'VCS_API_SCRAPER',
  'AS20180335',
  '코메스인베스트먼트',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 23 | 산업코드: 4 | 조성총액: 100.0억원',
  '2026-11-15',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20180335","mother_fund_id":"MF00000001","investment_character_code":"23","industry_code":"4","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"100.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.103Z"}',
  '2025-06-05T00:42:07.103Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 491: 코메스 2017-1 스타트업 그린투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20170001',
  '코메스 2017-1 스타트업 그린투자조합',
  14500000000,
  '2017-09-12',
  'Active',
  '코메스인베스트먼트',
  'VCS_API_SCRAPER',
  'AS20170105',
  '코메스인베스트먼트',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 20 | 산업코드: 5 | 조성총액: 145.0억원',
  '2025-09-11',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20170105","mother_fund_id":"MF00000001","investment_character_code":"20","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"145.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.103Z"}',
  '2025-06-05T00:42:07.103Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 492: 코맥스벤처러스개인투자조합 9호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20170023',
  '코맥스벤처러스개인투자조합 9호',
  200000000,
  '2023-03-20',
  'Active',
  '코맥스벤처러스',
  'VCS_API_SCRAPER',
  'AS20230184',
  '코맥스벤처러스',
  '산업코드: 8 | 조성총액: 2.0억원',
  '2028-03-19',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20230184","mother_fund_id":"","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"2.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.103Z"}',
  '2025-06-05T00:42:07.103Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 493: 코맥스벤처러스개인투자조합 11호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20170023',
  '코맥스벤처러스개인투자조합 11호',
  150000000,
  '2024-03-13',
  'Active',
  '코맥스벤처러스',
  'VCS_API_SCRAPER',
  'AS20240170',
  '코맥스벤처러스',
  '산업코드: 5 | 조성총액: 1.5억원',
  '2029-03-12',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20240170","mother_fund_id":"","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"1.5","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.103Z"}',
  '2025-06-05T00:42:07.103Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 494: 코맥스벤처러스-히스토리2021-2디지털콘텐츠투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20170023',
  '코맥스벤처러스-히스토리2021-2디지털콘텐츠투자조합',
  220000000,
  '2021-07-30',
  'Active',
  '코맥스벤처러스',
  'VCS_API_SCRAPER',
  'AS20210654',
  '코맥스벤처러스',
  '산업코드: 9 | 조성총액: 2.2억원',
  '2026-07-29',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20210654","mother_fund_id":"","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"2.2","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.103Z"}',
  '2025-06-05T00:42:07.103Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 495: 코맥스벤처러스-히스토리 2020-2 디지털 콘텐츠 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20170023',
  '코맥스벤처러스-히스토리 2020-2 디지털 콘텐츠 투자조합',
  450000000,
  '2020-12-29',
  'Active',
  '코맥스벤처러스',
  'VCS_API_SCRAPER',
  'AS20200840',
  '코맥스벤처러스',
  '산업코드: 8 | 조성총액: 4.5억원',
  '2025-12-28',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20200840","mother_fund_id":"","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"4.5","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.103Z"}',
  '2025-06-05T00:42:07.103Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 496: 코맥스벤처러스-히스토리 2020-1 디지털 콘텐츠 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20170023',
  '코맥스벤처러스-히스토리 2020-1 디지털 콘텐츠 투자조합',
  110000000,
  '2020-10-14',
  'Active',
  '코맥스벤처러스',
  'VCS_API_SCRAPER',
  'AS20200566',
  '코맥스벤처러스',
  '산업코드: 8 | 조성총액: 1.1억원',
  '2025-10-31',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20200566","mother_fund_id":"","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"1.1","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.103Z"}',
  '2025-06-05T00:42:07.103Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 497: 코맥스벤처러스-글로벌고 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20170023',
  '코맥스벤처러스-글로벌고 개인투자조합',
  120000000,
  '2022-08-30',
  'Active',
  '코맥스벤처러스',
  'VCS_API_SCRAPER',
  'AS20220949',
  '코맥스벤처러스',
  '산업코드: 9 | 조성총액: 1.2억원',
  '2027-08-29',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20220949","mother_fund_id":"","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"1.2","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.103Z"}',
  '2025-06-05T00:42:07.103Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 498: 코맥스벤처러스 개인투자조합 8호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20170023',
  '코맥스벤처러스 개인투자조합 8호',
  120000000,
  '2022-11-25',
  'Active',
  '코맥스벤처러스',
  'VCS_API_SCRAPER',
  'AS20221341',
  '코맥스벤처러스',
  '산업코드: 2 | 조성총액: 1.2억원',
  '2027-11-24',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20221341","mother_fund_id":"","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"1.2","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.103Z"}',
  '2025-06-05T00:42:07.103Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 499: 코맥스벤처러스 개인투자조합 7호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20170023',
  '코맥스벤처러스 개인투자조합 7호',
  120000000,
  '2022-11-30',
  'Active',
  '코맥스벤처러스',
  'VCS_API_SCRAPER',
  'AS20221275',
  '코맥스벤처러스',
  '산업코드: 2 | 조성총액: 1.2억원',
  '2027-11-29',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20221275","mother_fund_id":"","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"1.2","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.103Z"}',
  '2025-06-05T00:42:07.103Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 500: 코맥스벤처러스 개인투자조합 6호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20170023',
  '코맥스벤처러스 개인투자조합 6호',
  120000000,
  '2022-10-24',
  'Active',
  '코맥스벤처러스',
  'VCS_API_SCRAPER',
  'AS20221169',
  '코맥스벤처러스',
  '산업코드: 5 | 조성총액: 1.2억원',
  '2027-10-23',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20221169","mother_fund_id":"","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"1.2","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.103Z"}',
  '2025-06-05T00:42:07.103Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Exact Batch 10 completed! 50 fund records processed.
-- Progress: 500/3689 total records

