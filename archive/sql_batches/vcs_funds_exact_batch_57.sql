-- VCS Fund EXACT UPSERT Batch 57/74 (Records 2801-2850)
-- EXACT: Uses actual fund_table schema columns
-- Generated from VCS API Scraper fund data
-- Generated at: 2025-06-05T00:42:07.297Z
-- Schema: Exact match to actual fund_table structure

-- EXACT FUND DATA (UPSERT - Safe for Duplicates)
-- Processing 50 fund records
-- Will INSERT new records or UPDATE existing ones

-- Record 2801: 뮤어우즈 딥테크 투자조합 제1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200321',
  '뮤어우즈 딥테크 투자조합 제1호',
  3800000000,
  '2024-05-03',
  'Active',
  '뮤어우즈벤처스',
  'VCS_API_SCRAPER',
  'AS20240383',
  '뮤어우즈벤처스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 04 | 산업코드: 5 | 조성총액: 38.0억원',
  '2029-05-02',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20240383","mother_fund_id":"","investment_character_code":"04","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"38.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.297Z"}',
  '2025-06-05T00:42:07.297Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 2802: 뮤어우즈 K-초격차 밸류업 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200321',
  '뮤어우즈 K-초격차 밸류업 투자조합',
  22230000000,
  '2024-03-27',
  'Active',
  '뮤어우즈벤처스',
  'VCS_API_SCRAPER',
  'AS20240226',
  '뮤어우즈벤처스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 20 | 산업코드: 5 | 조성총액: 222.3억원',
  '2032-03-26',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20240226","mother_fund_id":"MF00000001","investment_character_code":"20","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"222.3","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.297Z"}',
  '2025-06-05T00:42:07.297Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 2803: 뮤어우즈 AI딥테크 투자조합 제2호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200321',
  '뮤어우즈 AI딥테크 투자조합 제2호',
  4750000000,
  '2023-12-21',
  'Active',
  '뮤어우즈벤처스',
  'VCS_API_SCRAPER',
  'AS20231324',
  '뮤어우즈벤처스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 28 | 산업코드: 5 | 조성총액: 47.5억원',
  '2028-12-20',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20231324","mother_fund_id":"","investment_character_code":"28","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"47.5","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.297Z"}',
  '2025-06-05T00:42:07.297Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 2804: 뮤어우즈 AI딥테크 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200321',
  '뮤어우즈 AI딥테크 투자조합',
  6800000000,
  '2021-09-30',
  'Active',
  '뮤어우즈벤처스',
  'VCS_API_SCRAPER',
  'AS20210945',
  '뮤어우즈벤처스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 25 | 산업코드: 8 | 조성총액: 68.0억원',
  '2026-09-29',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20210945","mother_fund_id":"","investment_character_code":"25","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"68.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.297Z"}',
  '2025-06-05T00:42:07.297Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 2805: 뮤렉스퍼플3호투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20170034',
  '뮤렉스퍼플3호투자조합',
  44500000000,
  '2022-08-31',
  'Active',
  '뮤렉스파트너스',
  'VCS_API_SCRAPER',
  'AS20221000',
  '뮤렉스파트너스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 21 | 산업코드: 2 | 조성총액: 445.0억원',
  '2030-08-30',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20221000","mother_fund_id":"MF00000001","investment_character_code":"21","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"445.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.297Z"}',
  '2025-06-05T00:42:07.297Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 2806: 뮤렉스퍼플2호어반테크투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20170034',
  '뮤렉스퍼플2호어반테크투자조합',
  31600000000,
  '2020-12-22',
  'Active',
  '뮤렉스파트너스',
  'VCS_API_SCRAPER',
  'AS20200828',
  '뮤렉스파트너스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 20 | 산업코드: 2 | 조성총액: 316.0억원',
  '2028-12-21',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20200828","mother_fund_id":"","investment_character_code":"20","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"316.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.297Z"}',
  '2025-06-05T00:42:07.297Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 2807: 뮤렉스퍼플1호투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20170034',
  '뮤렉스퍼플1호투자조합',
  38700000000,
  '2018-09-12',
  'Active',
  '뮤렉스파트너스',
  'VCS_API_SCRAPER',
  'AS20180260',
  '뮤렉스파트너스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 20 | 산업코드: 2 | 조성총액: 387.0억원',
  '2026-09-11',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20180260","mother_fund_id":"MF00000001","investment_character_code":"20","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"387.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.297Z"}',
  '2025-06-05T00:42:07.297Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 2808: 뮤렉스웨이브액티브시니어투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20170034',
  '뮤렉스웨이브액티브시니어투자조합',
  6130000000,
  '2021-04-08',
  'Active',
  '뮤렉스파트너스',
  'VCS_API_SCRAPER',
  'AS20210277',
  '뮤렉스파트너스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 20 | 산업코드: 2 | 조성총액: 61.3억원',
  '2029-04-07',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20210277","mother_fund_id":"","investment_character_code":"20","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"61.3","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.297Z"}',
  '2025-06-05T00:42:07.297Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 2809: 뮤렉스웨이브3호벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20170034',
  '뮤렉스웨이브3호벤처투자조합',
  131600000000,
  '2022-12-29',
  'Active',
  '뮤렉스파트너스',
  'VCS_API_SCRAPER',
  'AS20230001',
  '뮤렉스파트너스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 06 | 산업코드: 2 | 조성총액: 1316.0억원',
  '2030-12-28',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20230001","mother_fund_id":"MF00000001","investment_character_code":"06","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"1316.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.297Z"}',
  '2025-06-05T00:42:07.297Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 2810: 뮤렉스웨이브2호액티브시니어투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20170034',
  '뮤렉스웨이브2호액티브시니어투자조합',
  55350000000,
  '2020-12-02',
  'Active',
  '뮤렉스파트너스',
  'VCS_API_SCRAPER',
  'AS20200721',
  '뮤렉스파트너스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 14 | 산업코드: 2 | 조성총액: 553.5억원',
  '2028-12-01',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20200721","mother_fund_id":"","investment_character_code":"14","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"553.5","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.297Z"}',
  '2025-06-05T00:42:07.297Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 2811: 뮤렉스웨이브1호1코노미투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20170034',
  '뮤렉스웨이브1호1코노미투자조합',
  30100000000,
  '2018-10-19',
  'Active',
  '뮤렉스파트너스',
  'VCS_API_SCRAPER',
  'AS20180314',
  '뮤렉스파트너스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 01 | 산업코드: 8 | 조성총액: 301.0억원',
  '2026-10-18',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20180314","mother_fund_id":"","investment_character_code":"01","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"301.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.297Z"}',
  '2025-06-05T00:42:07.297Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 2812: 뮤렉스서치2호투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20170034',
  '뮤렉스서치2호투자조합',
  10400000000,
  '2021-09-29',
  'Active',
  '뮤렉스파트너스',
  'VCS_API_SCRAPER',
  'AS20210924',
  '뮤렉스파트너스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 25 | 산업코드: 2 | 조성총액: 104.0억원',
  '2026-09-28',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20210924","mother_fund_id":"","investment_character_code":"25","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"104.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.297Z"}',
  '2025-06-05T00:42:07.297Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 2813: 뮤렉스보이저1호투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20170034',
  '뮤렉스보이저1호투자조합',
  28900000000,
  '2022-03-18',
  'Active',
  '뮤렉스파트너스',
  'VCS_API_SCRAPER',
  'AS20220313',
  '뮤렉스파트너스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 25 | 산업코드: 2 | 조성총액: 289.0억원',
  '2028-03-17',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20220313","mother_fund_id":"","investment_character_code":"25","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"289.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.297Z"}',
  '2025-06-05T00:42:07.297Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 2814: 무신사 여성 디자이너 펀드 1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200253',
  '무신사 여성 디자이너 펀드 1호',
  15000000000,
  '2022-07-25',
  'Active',
  '무신사파트너스',
  'VCS_API_SCRAPER',
  'AS20220853',
  '무신사파트너스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 08 | 산업코드: 9 | 조성총액: 150.0억원',
  '2029-07-24',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20220853","mother_fund_id":"","investment_character_code":"08","industry_code":"9","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"150.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.297Z"}',
  '2025-06-05T00:42:07.297Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 2815: 무신사 넥스트 패션 펀드 1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200253',
  '무신사 넥스트 패션 펀드 1호',
  2500000000,
  '2022-04-21',
  'Active',
  '무신사파트너스',
  'VCS_API_SCRAPER',
  'AS20220443',
  '무신사파트너스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 08 | 산업코드: 8 | 조성총액: 25.0억원',
  '2029-04-20',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20220443","mother_fund_id":"","investment_character_code":"08","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"25.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.297Z"}',
  '2025-06-05T00:42:07.297Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 2816: 모빌리티 초기스타트업 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20140013',
  '모빌리티 초기스타트업 투자조합',
  110000000,
  '2023-04-07',
  'Active',
  '더인벤션랩',
  'VCS_API_SCRAPER',
  'AS20230259',
  '더인벤션랩',
  '산업코드: 2 | 조성총액: 1.1억원',
  '2028-04-06',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20230259","mother_fund_id":"","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"1.1","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.297Z"}',
  '2025-06-05T00:42:07.297Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 2817: 모비딕스타트업플러스 투자조합2호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20210408',
  '모비딕스타트업플러스 투자조합2호',
  10200000000,
  '2023-08-18',
  'Active',
  '모비딕벤처스',
  'VCS_API_SCRAPER',
  'AS20230735',
  '모비딕벤처스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 01 | 산업코드: 2 | 조성총액: 102.0억원',
  '2030-08-17',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20230735","mother_fund_id":"","investment_character_code":"01","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"102.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.297Z"}',
  '2025-06-05T00:42:07.297Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 2818: 메이트 케이콘텐츠 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20210746',
  '메이트 케이콘텐츠 투자조합',
  200000000,
  '2024-05-14',
  'Active',
  '코업파트너스',
  'VCS_API_SCRAPER',
  'AS20240395',
  '코업파트너스',
  '산업코드: 9 | 조성총액: 2.0억원',
  '2029-05-08',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20240395","mother_fund_id":"","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"2.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.297Z"}',
  '2025-06-05T00:42:07.297Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 2819: 메이트 케이 푸드테크 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20210746',
  '메이트 케이 푸드테크 투자조합',
  100000000,
  '2024-10-31',
  'Active',
  '코업파트너스',
  'VCS_API_SCRAPER',
  'AS20241060',
  '코업파트너스',
  '산업코드: 9 | 조성총액: 1.0억원',
  '2029-10-29',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20241060","mother_fund_id":"","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"1.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.297Z"}',
  '2025-06-05T00:42:07.297Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 2820: 메이슨-메이플콘텐츠M&A세컨더리투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20080012',
  '메이슨-메이플콘텐츠M&A세컨더리투자조합',
  34000000000,
  '2025-02-26',
  'Active',
  '메이플투자파트너스',
  'VCS_API_SCRAPER',
  'AS20250149',
  '메이플투자파트너스',
  '투자분야: 일반 | 세부분야: 일반 기타 | 투자성격코드: 24 | 산업코드: 2 | 조성총액: 340.0억원',
  '2033-02-25',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20250149","mother_fund_id":"MF00000001","investment_character_code":"24","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"일반 기타","formation_total_amount":"340.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.297Z"}',
  '2025-06-05T00:42:07.297Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 2821: 메디톡스투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20170020',
  '메디톡스투자조합1호',
  30000000000,
  '2019-07-12',
  'Active',
  '메디톡스벤처투자',
  'VCS_API_SCRAPER',
  'AS20190301',
  '메디톡스벤처투자',
  '투자분야: 일반 | 세부분야: 바이오 | 투자성격코드: 20 | 산업코드: 5 | 조성총액: 300.0억원',
  '2027-07-11',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20190301","mother_fund_id":"MF00000001","investment_character_code":"20","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"바이오","formation_total_amount":"300.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.297Z"}',
  '2025-06-05T00:42:07.297Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 2822: 메디치중소선도기업투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20110002',
  '메디치중소선도기업투자조합',
  50000000000,
  '2017-07-10',
  'Active',
  '메디치인베스트먼트',
  'VCS_API_SCRAPER',
  'AS20170071',
  '메디치인베스트먼트',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 01 | 산업코드: 8 | 조성총액: 500.0억원',
  '2025-07-09',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20170071","mother_fund_id":"","investment_character_code":"01","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"500.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.297Z"}',
  '2025-06-05T00:42:07.297Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 2823: 메디치-IBKC 세컨더리 투자조합 2호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20110002',
  '메디치-IBKC 세컨더리 투자조합 2호',
  50000000000,
  '2021-12-27',
  'Active',
  '메디치인베스트먼트',
  'VCS_API_SCRAPER',
  'AS20211427',
  '메디치인베스트먼트',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 16 | 산업코드: 2 | 조성총액: 500.0억원',
  '2026-12-26',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20211427","mother_fund_id":"","investment_character_code":"16","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"500.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.297Z"}',
  '2025-06-05T00:42:07.297Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 2824: 메디치 중소-중견 녹색 성장사다리 창업투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20110002',
  '메디치 중소-중견 녹색 성장사다리 창업투자조합',
  20000000000,
  '2013-09-16',
  'Active',
  '메디치인베스트먼트',
  'VCS_API_SCRAPER',
  'AS20130030',
  '메디치인베스트먼트',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 20 | 산업코드: 1 | 조성총액: 200.0억원',
  '2025-09-15',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20130030","mother_fund_id":"MF00000001","investment_character_code":"20","industry_code":"1","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"200.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.297Z"}',
  '2025-06-05T00:42:07.297Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 2825: 메디치 2023-1 뉴스페이스 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20110002',
  '메디치 2023-1 뉴스페이스 투자조합',
  10000000000,
  '2023-09-19',
  'Active',
  '메디치인베스트먼트',
  'VCS_API_SCRAPER',
  'AS20230845',
  '메디치인베스트먼트',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 10 | 산업코드: 3 | 조성총액: 100.0억원',
  '2033-09-18',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20230845","mother_fund_id":"MF00000001","investment_character_code":"10","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"100.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.297Z"}',
  '2025-06-05T00:42:07.297Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 2826: 메디치 2022-1 그로쓰 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20110002',
  '메디치 2022-1 그로쓰 투자조합',
  6500000000,
  '2022-11-16',
  'Active',
  '메디치인베스트먼트',
  'VCS_API_SCRAPER',
  'AS20221308',
  '메디치인베스트먼트',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 25 | 산업코드: 4 | 조성총액: 65.0억원',
  '2027-11-15',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20221308","mother_fund_id":"","investment_character_code":"25","industry_code":"4","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"65.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.297Z"}',
  '2025-06-05T00:42:07.297Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 2827: 메디치 2020-2 스케일업 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20110002',
  '메디치 2020-2 스케일업 투자조합',
  112000000000,
  '2020-12-16',
  'Active',
  '메디치인베스트먼트',
  'VCS_API_SCRAPER',
  'AS20200778',
  '메디치인베스트먼트',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 08 | 산업코드: 5 | 조성총액: 1120.0억원',
  '2028-12-15',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20200778","mother_fund_id":"","investment_character_code":"08","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"1120.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.297Z"}',
  '2025-06-05T00:42:07.297Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 2828: 메디치 2018-2 중소선도기업 창업투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20110002',
  '메디치 2018-2 중소선도기업 창업투자조합',
  78500000000,
  '2018-12-28',
  'Active',
  '메디치인베스트먼트',
  'VCS_API_SCRAPER',
  'AS20190006',
  '메디치인베스트먼트',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 09 | 산업코드: 2 | 조성총액: 785.0억원',
  '2026-12-27',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20190006","mother_fund_id":"MF00000001","investment_character_code":"09","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"785.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.297Z"}',
  '2025-06-05T00:42:07.297Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 2829: 메디치 2014-2 스타트업 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20110002',
  '메디치 2014-2 스타트업 투자조합',
  30000000000,
  '2014-11-17',
  'Active',
  '메디치인베스트먼트',
  'VCS_API_SCRAPER',
  'AS20140067',
  '메디치인베스트먼트',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 20 | 산업코드: 2 | 조성총액: 300.0억원',
  '2025-11-16',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20140067","mother_fund_id":"","investment_character_code":"20","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"300.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.297Z"}',
  '2025-06-05T00:42:07.297Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 2830: 메가트렌드스타트업2호투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20120002',
  '메가트렌드스타트업2호투자조합',
  25000000000,
  '2020-08-07',
  'Active',
  '제이비인베스트먼트',
  'VCS_API_SCRAPER',
  'AS20200424',
  '제이비인베스트먼트',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 20 | 산업코드: 5 | 조성총액: 250.0억원',
  '2028-08-06',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20200424","mother_fund_id":"MF00000001","investment_character_code":"20","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"250.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.297Z"}',
  '2025-06-05T00:42:07.297Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 2831: 메가스터디-윤민-마크 벤처투자조합 2호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200328',
  '메가스터디-윤민-마크 벤처투자조합 2호',
  5000000000,
  '2023-06-02',
  'Active',
  '마크앤컴퍼니',
  'VCS_API_SCRAPER',
  'AS20230451',
  '마크앤컴퍼니',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 20 | 산업코드: 2 | 조성총액: 50.0억원',
  '2030-06-01',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20230451","mother_fund_id":"","investment_character_code":"20","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"50.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.297Z"}',
  '2025-06-05T00:42:07.297Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 2832: 메가스터디-윤민-마크 벤처투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200328',
  '메가스터디-윤민-마크 벤처투자조합 1호',
  5000000000,
  '2021-07-23',
  'Active',
  '마크앤컴퍼니',
  'VCS_API_SCRAPER',
  'AS20210630',
  '마크앤컴퍼니',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 06 | 산업코드: 2 | 조성총액: 50.0억원',
  '2028-07-22',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20210630","mother_fund_id":"","investment_character_code":"06","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"50.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.297Z"}',
  '2025-06-05T00:42:07.297Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 2833: 메가-엔피 아기유니콘 팔로우온 제1호 벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20160026',
  '메가-엔피 아기유니콘 팔로우온 제1호 벤처투자조합',
  5000000000,
  '2024-03-27',
  'Active',
  '뉴패러다임인베스트먼트',
  'VCS_API_SCRAPER',
  'AS20240225',
  '뉴패러다임인베스트먼트',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 20 | 산업코드: 2 | 조성총액: 50.0억원',
  '2032-03-26',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20240225","mother_fund_id":"","investment_character_code":"20","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"50.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.297Z"}',
  '2025-06-05T00:42:07.297Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 2834: 메가-HGI 더블임팩트 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20140018',
  '메가-HGI 더블임팩트 투자조합',
  20500000000,
  '2021-07-01',
  'Active',
  '에이치지이니셔티브',
  'VCS_API_SCRAPER',
  'AS20210544',
  '에이치지이니셔티브',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 10 | 산업코드: 5 | 조성총액: 205.0억원',
  '2031-06-30',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20210544","mother_fund_id":"","investment_character_code":"10","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"205.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.297Z"}',
  '2025-06-05T00:42:07.297Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 2835: 머큐리 Secondary 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP19860004',
  '머큐리 Secondary 투자조합',
  22500000000,
  '2021-09-29',
  'Active',
  '한국투자파트너스',
  'VCS_API_SCRAPER',
  'AS20210925',
  '한국투자파트너스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 16 | 산업코드: 2 | 조성총액: 225.0억원',
  '2026-09-28',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20210925","mother_fund_id":"","investment_character_code":"16","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"225.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.297Z"}',
  '2025-06-05T00:42:07.298Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 2836: 머스트액셀러레이터 투자조합 2호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20220244',
  '머스트액셀러레이터 투자조합 2호',
  250000000,
  '2024-05-20',
  'Active',
  '(주)티비지파트너스',
  'VCS_API_SCRAPER',
  'AS20240419',
  '(주)티비지파트너스',
  '산업코드: 5 | 조성총액: 2.5억원',
  '2029-05-15',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20240419","mother_fund_id":"","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"2.5","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.298Z"}',
  '2025-06-05T00:42:07.298Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 2837: 머스트액셀러레이터 투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20220244',
  '머스트액셀러레이터 투자조합 1호',
  270000000,
  '2023-04-14',
  'Active',
  '(주)티비지파트너스',
  'VCS_API_SCRAPER',
  'AS20230285',
  '(주)티비지파트너스',
  '산업코드: 2 | 조성총액: 2.7억원',
  '2028-04-13',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20230285","mother_fund_id":"","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"2.7","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.298Z"}',
  '2025-06-05T00:42:07.298Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 2838: 머스트4호벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200378',
  '머스트4호벤처투자조합',
  10000000000,
  '2022-08-08',
  'Active',
  '머스트벤처스',
  'VCS_API_SCRAPER',
  'AS20220904',
  '머스트벤처스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 02 | 산업코드: 8 | 조성총액: 100.0억원',
  '2029-08-07',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20220904","mother_fund_id":"","investment_character_code":"02","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"100.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.298Z"}',
  '2025-06-05T00:42:07.298Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 2839: 머스트3호벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200378',
  '머스트3호벤처투자조합',
  25000000000,
  '2021-06-03',
  'Active',
  '머스트벤처스',
  'VCS_API_SCRAPER',
  'AS20210450',
  '머스트벤처스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 02 | 산업코드: 8 | 조성총액: 250.0억원',
  '2026-06-02',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20210450","mother_fund_id":"","investment_character_code":"02","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"250.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.298Z"}',
  '2025-06-05T00:42:07.298Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 2840: 머스트2호벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200378',
  '머스트2호벤처투자조합',
  10000000000,
  '2021-02-24',
  'Active',
  '머스트벤처스',
  'VCS_API_SCRAPER',
  'AS20210151',
  '머스트벤처스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 02 | 산업코드: 8 | 조성총액: 100.0억원',
  '2026-02-23',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20210151","mother_fund_id":"","investment_character_code":"02","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"100.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.298Z"}',
  '2025-06-05T00:42:07.298Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 2841: 머스트1호벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200378',
  '머스트1호벤처투자조합',
  10500000000,
  '2020-11-30',
  'Active',
  '머스트벤처스',
  'VCS_API_SCRAPER',
  'AS20200716',
  '머스트벤처스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 01 | 산업코드: 8 | 조성총액: 105.0억원',
  '2025-11-29',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20200716","mother_fund_id":"","investment_character_code":"01","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"105.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.298Z"}',
  '2025-06-05T00:42:07.298Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 2842: 매츠 ABB 테크 제1호 벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20220803',
  '매츠 ABB 테크 제1호 벤처투자조합',
  3000000000,
  '2023-08-21',
  'Active',
  '삼익매츠벤처스',
  'VCS_API_SCRAPER',
  'AS20230739',
  '삼익매츠벤처스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 20 | 산업코드: 2 | 조성총액: 30.0억원',
  '2030-08-20',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20230739","mother_fund_id":"","investment_character_code":"20","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"30.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.298Z"}',
  '2025-06-05T00:42:07.298Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 2843: 매쉬업엔젤스 개인투자조합2호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20170024',
  '매쉬업엔젤스 개인투자조합2호',
  7700000000,
  '2019-02-07',
  'Active',
  '매쉬업벤처스',
  'VCS_API_SCRAPER',
  'AS20190101',
  '매쉬업벤처스',
  '산업코드: 2 | 조성총액: 77.0억원',
  '2029-02-06',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20190101","mother_fund_id":"","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"77.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.298Z"}',
  '2025-06-05T00:42:07.298Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 2844: 매쉬업엔젤스 개인투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20170024',
  '매쉬업엔젤스 개인투자조합1호',
  2500000000,
  '2018-02-21',
  'Active',
  '매쉬업벤처스',
  'VCS_API_SCRAPER',
  'AS20180158',
  '매쉬업벤처스',
  '산업코드: 2 | 조성총액: 25.0억원',
  '2026-02-20',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20180158","mother_fund_id":"","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"25.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.298Z"}',
  '2025-06-05T00:42:07.298Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 2845: 매쉬업엔젤스 가치성장벤처투자조합3호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20170024',
  '매쉬업엔젤스 가치성장벤처투자조합3호',
  13750000000,
  '2023-11-02',
  'Active',
  '매쉬업벤처스',
  'VCS_API_SCRAPER',
  'AS20231015',
  '매쉬업벤처스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 06 | 산업코드: 2 | 조성총액: 137.5억원',
  '2033-11-01',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20231015","mother_fund_id":"","investment_character_code":"06","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"137.5","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.298Z"}',
  '2025-06-05T00:42:07.298Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 2846: 매쉬업엔젤스 가치성장벤처투자조합2호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20170024',
  '매쉬업엔젤스 가치성장벤처투자조합2호',
  13750000000,
  '2023-10-25',
  'Active',
  '매쉬업벤처스',
  'VCS_API_SCRAPER',
  'AS20230977',
  '매쉬업벤처스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 06 | 산업코드: 2 | 조성총액: 137.5억원',
  '2033-10-24',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20230977","mother_fund_id":"","investment_character_code":"06","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"137.5","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.298Z"}',
  '2025-06-05T00:42:07.298Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 2847: 매쉬업엔젤스 가치성장벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20170024',
  '매쉬업엔젤스 가치성장벤처투자조합',
  17000000000,
  '2021-05-14',
  'Active',
  '매쉬업벤처스',
  'VCS_API_SCRAPER',
  'AS20210391',
  '매쉬업벤처스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 20 | 산업코드: 2 | 조성총액: 170.0억원',
  '2031-05-13',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20210391","mother_fund_id":"","investment_character_code":"20","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"170.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.298Z"}',
  '2025-06-05T00:42:07.298Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 2848: 마크앤컴퍼니 개인투자조합 3호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200328',
  '마크앤컴퍼니 개인투자조합 3호',
  320000000,
  '2024-01-31',
  'Active',
  '마크앤컴퍼니',
  'VCS_API_SCRAPER',
  'AS20240064',
  '마크앤컴퍼니',
  '산업코드: 2 | 조성총액: 3.2억원',
  '2029-01-30',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20240064","mother_fund_id":"","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"3.2","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.298Z"}',
  '2025-06-05T00:42:07.298Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 2849: 마크앤컴퍼니 개인투자조합 2호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200328',
  '마크앤컴퍼니 개인투자조합 2호',
  480000000,
  '2023-04-25',
  'Active',
  '마크앤컴퍼니',
  'VCS_API_SCRAPER',
  'AS20230320',
  '마크앤컴퍼니',
  '산업코드: 2 | 조성총액: 4.8억원',
  '2028-04-24',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20230320","mother_fund_id":"","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"4.8","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.298Z"}',
  '2025-06-05T00:42:07.298Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 2850: 마크앤컴퍼니 개인투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200328',
  '마크앤컴퍼니 개인투자조합 1호',
  400000000,
  '2022-11-25',
  'Active',
  '마크앤컴퍼니',
  'VCS_API_SCRAPER',
  'AS20221305',
  '마크앤컴퍼니',
  '산업코드: 8 | 조성총액: 4.0억원',
  '2027-11-24',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20221305","mother_fund_id":"","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"4.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.298Z"}',
  '2025-06-05T00:42:07.298Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Exact Batch 57 completed! 50 fund records processed.
-- Progress: 2850/3689 total records

