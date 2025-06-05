-- VCS Fund EXACT UPSERT Batch 37/74 (Records 1801-1850)
-- EXACT: Uses actual fund_table schema columns
-- Generated from VCS API Scraper fund data
-- Generated at: 2025-06-05T00:42:07.216Z
-- Schema: Exact match to actual fund_table structure

-- EXACT FUND DATA (UPSERT - Safe for Duplicates)
-- Processing 50 fund records
-- Will INSERT new records or UPDATE existing ones

-- Record 1801: 알에스 개인투자조합 4호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20220541',
  '알에스 개인투자조합 4호',
  340000000,
  '2024-10-31',
  'Active',
  '시드버스',
  'VCS_API_SCRAPER',
  'AS20241031',
  '시드버스',
  '산업코드: 8 | 조성총액: 3.4억원',
  '2029-10-30',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20241031","mother_fund_id":"","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"3.4","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.216Z"}',
  '2025-06-05T00:42:07.216Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 1802: 알에스 개인투자조합 2호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20220541',
  '알에스 개인투자조합 2호',
  120000000,
  '2024-08-01',
  'Active',
  '시드버스',
  'VCS_API_SCRAPER',
  'AS20240668',
  '시드버스',
  '산업코드: 8 | 조성총액: 1.2억원',
  '2029-07-31',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20240668","mother_fund_id":"","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"1.2","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.216Z"}',
  '2025-06-05T00:42:07.216Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 1803: 알에스 개인투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20220541',
  '알에스 개인투자조합 1호',
  580000000,
  '2023-12-14',
  'Active',
  '시드버스',
  'VCS_API_SCRAPER',
  'AS20231268',
  '시드버스',
  '산업코드: 8 | 조성총액: 5.8억원',
  '2028-12-13',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20231268","mother_fund_id":"","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"5.8","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.216Z"}',
  '2025-06-05T00:42:07.216Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 1804: 알바트로스하이플라이펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20080001',
  '알바트로스하이플라이펀드',
  27500000000,
  '2024-09-03',
  'Active',
  '알바트로스인베스트먼트',
  'VCS_API_SCRAPER',
  'AS20240856',
  '알바트로스인베스트먼트',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 20 | 산업코드: 4 | 조성총액: 275.0억원',
  '2032-09-02',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20240856","mother_fund_id":"MF00000001","investment_character_code":"20","industry_code":"4","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"275.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.216Z"}',
  '2025-06-05T00:42:07.216Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 1805: 알바트로스퓨처코리아투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20080001',
  '알바트로스퓨처코리아투자조합',
  29000000000,
  '2017-03-16',
  'Active',
  '알바트로스인베스트먼트',
  'VCS_API_SCRAPER',
  'AS20170025',
  '알바트로스인베스트먼트',
  '투자분야: 일반 | 세부분야: 일반 기타 | 투자성격코드: 26 | 산업코드: 5 | 조성총액: 290.0억원',
  '2026-03-15',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20170025","mother_fund_id":"","investment_character_code":"26","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"일반 기타","formation_total_amount":"290.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.216Z"}',
  '2025-06-05T00:42:07.216Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 1806: 알바트로스퓨처모빌리티펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20080001',
  '알바트로스퓨처모빌리티펀드',
  58000000000,
  '2021-10-29',
  'Active',
  '알바트로스인베스트먼트',
  'VCS_API_SCRAPER',
  'AS20211049',
  '알바트로스인베스트먼트',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 10 | 산업코드: 1 | 조성총액: 580.0억원',
  '2029-10-28',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20211049","mother_fund_id":"","investment_character_code":"10","industry_code":"1","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"580.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.216Z"}',
  '2025-06-05T00:42:07.216Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 1807: 알바트로스오아시너지펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20080001',
  '알바트로스오아시너지펀드',
  9000000000,
  '2020-09-23',
  'Active',
  '알바트로스인베스트먼트',
  'VCS_API_SCRAPER',
  'AS20200528',
  '알바트로스인베스트먼트',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 01 | 산업코드: 8 | 조성총액: 90.0억원',
  '2025-09-22',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20200528","mother_fund_id":"","investment_character_code":"01","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"90.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.216Z"}',
  '2025-06-05T00:42:07.216Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 1808: 알바트로스뉴웨이브펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20080001',
  '알바트로스뉴웨이브펀드',
  14000000000,
  '2020-08-10',
  'Active',
  '알바트로스인베스트먼트',
  'VCS_API_SCRAPER',
  'AS20200409',
  '알바트로스인베스트먼트',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 10 | 산업코드: 2 | 조성총액: 140.0억원',
  '2028-08-09',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20200409","mother_fund_id":"MF00000001","investment_character_code":"10","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"140.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.216Z"}',
  '2025-06-05T00:42:07.216Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 1809: 알바트로스넥스트제너레이션펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20080001',
  '알바트로스넥스트제너레이션펀드',
  29000000000,
  '2018-01-09',
  'Active',
  '알바트로스인베스트먼트',
  'VCS_API_SCRAPER',
  'AS20180091',
  '알바트로스인베스트먼트',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 21 | 산업코드: 5 | 조성총액: 290.0억원',
  '2026-01-08',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20180091","mother_fund_id":"MF00000001","investment_character_code":"21","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"290.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.216Z"}',
  '2025-06-05T00:42:07.216Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 1810: 알바트로스 특허가치 창출펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20080001',
  '알바트로스 특허가치 창출펀드',
  15000000000,
  '2016-06-21',
  'Active',
  '알바트로스인베스트먼트',
  'VCS_API_SCRAPER',
  'AS20160073',
  '알바트로스인베스트먼트',
  '투자분야: 일반 | 세부분야: 특허 | 투자성격코드: 09 | 산업코드: 8 | 조성총액: 150.0억원',
  '2025-06-20',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20160073","mother_fund_id":"MF00000001","investment_character_code":"09","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"특허","formation_total_amount":"150.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.216Z"}',
  '2025-06-05T00:42:07.216Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 1811: 알마덴개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20190424',
  '알마덴개인투자조합',
  150000000,
  '2021-01-22',
  'Active',
  '알마덴디자인리서치',
  'VCS_API_SCRAPER',
  'AS20210025',
  '알마덴디자인리서치',
  '산업코드: 2 | 조성총액: 1.5억원',
  '2026-01-21',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20210025","mother_fund_id":"","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"1.5","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.216Z"}',
  '2025-06-05T00:42:07.216Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 1812: 알로이스-지온 PGK 펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20090005',
  '알로이스-지온 PGK 펀드',
  3790000000,
  '2022-03-04',
  'Active',
  '지온인베스트먼트',
  'VCS_API_SCRAPER',
  'AS20220223',
  '지온인베스트먼트',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 25 | 산업코드: 6 | 조성총액: 37.9억원',
  '2027-03-03',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20220223","mother_fund_id":"","investment_character_code":"25","industry_code":"6","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"37.9","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.216Z"}',
  '2025-06-05T00:42:07.216Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 1813: 안다하림전북강원전주지역혁신펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20210663',
  '안다하림전북강원전주지역혁신펀드',
  18000000000,
  '2023-10-13',
  'Active',
  '안다아시아벤처스',
  'VCS_API_SCRAPER',
  'AS20230930',
  '안다아시아벤처스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 10 | 산업코드: 3 | 조성총액: 180.0억원',
  '2031-10-12',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20230930","mother_fund_id":"MF00000019","investment_character_code":"10","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"180.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.217Z"}',
  '2025-06-05T00:42:07.217Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 1814: 안다탄소제로투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20210663',
  '안다탄소제로투자조합1호',
  15000000000,
  '2022-09-06',
  'Active',
  '안다아시아벤처스',
  'VCS_API_SCRAPER',
  'AS20221029',
  '안다아시아벤처스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 25 | 산업코드: 3 | 조성총액: 150.0억원',
  '2027-09-05',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20221029","mother_fund_id":"","investment_character_code":"25","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"150.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.217Z"}',
  '2025-06-05T00:42:07.217Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 1815: 안다아시아벤처투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20210663',
  '안다아시아벤처투자조합1호',
  7530000000,
  '2021-12-16',
  'Active',
  '안다아시아벤처스',
  'VCS_API_SCRAPER',
  'AS20211326',
  '안다아시아벤처스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 04 | 산업코드: 5 | 조성총액: 75.3억원',
  '2026-12-15',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20211326","mother_fund_id":"","investment_character_code":"04","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"75.3","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.217Z"}',
  '2025-06-05T00:42:07.217Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 1816: 안다소재부품벤처투자조합2호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20210663',
  '안다소재부품벤처투자조합2호',
  12000000000,
  '2022-03-22',
  'Active',
  '안다아시아벤처스',
  'VCS_API_SCRAPER',
  'AS20220328',
  '안다아시아벤처스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 16 | 산업코드: 1 | 조성총액: 120.0억원',
  '2027-03-21',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20220328","mother_fund_id":"","investment_character_code":"16","industry_code":"1","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"120.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.217Z"}',
  '2025-06-05T00:42:07.217Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 1817: 안다소재부품벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20210663',
  '안다소재부품벤처투자조합',
  7410000000,
  '2022-02-07',
  'Active',
  '안다아시아벤처스',
  'VCS_API_SCRAPER',
  'AS20220117',
  '안다아시아벤처스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 25 | 산업코드: 1 | 조성총액: 74.1억원',
  '2027-02-06',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20220117","mother_fund_id":"","investment_character_code":"25","industry_code":"1","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"74.1","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.217Z"}',
  '2025-06-05T00:42:07.217Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 1818: 안다바이오벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20210663',
  '안다바이오벤처투자조합',
  4100000000,
  '2023-10-27',
  'Active',
  '안다아시아벤처스',
  'VCS_API_SCRAPER',
  'AS20230991',
  '안다아시아벤처스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 25 | 산업코드: 5 | 조성총액: 41.0억원',
  '2028-10-26',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20230991","mother_fund_id":"","investment_character_code":"25","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"41.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.217Z"}',
  '2025-06-05T00:42:07.217Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 1819: 안다모빌리티인프라투자조합3호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20210663',
  '안다모빌리티인프라투자조합3호',
  2000000000,
  '2024-12-05',
  'Active',
  '안다아시아벤처스',
  'VCS_API_SCRAPER',
  'AS20241272',
  '안다아시아벤처스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 25 | 산업코드: 9 | 조성총액: 20.0억원',
  '2029-12-04',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20241272","mother_fund_id":"","investment_character_code":"25","industry_code":"9","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"20.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.217Z"}',
  '2025-06-05T00:42:07.217Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 1820: 안다모빌리티인프라투자조합2호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20210663',
  '안다모빌리티인프라투자조합2호',
  12400000000,
  '2023-06-20',
  'Active',
  '안다아시아벤처스',
  'VCS_API_SCRAPER',
  'AS20230519',
  '안다아시아벤처스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 25 | 산업코드: 9 | 조성총액: 124.0억원',
  '2028-06-19',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20230519","mother_fund_id":"","investment_character_code":"25","industry_code":"9","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"124.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.217Z"}',
  '2025-06-05T00:42:07.217Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 1821: 안다모빌리티인프라투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20210663',
  '안다모빌리티인프라투자조합1호',
  7600000000,
  '2022-12-09',
  'Active',
  '안다아시아벤처스',
  'VCS_API_SCRAPER',
  'AS20221443',
  '안다아시아벤처스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 25 | 산업코드: 9 | 조성총액: 76.0억원',
  '2027-12-08',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20221443","mother_fund_id":"","investment_character_code":"25","industry_code":"9","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"76.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.217Z"}',
  '2025-06-05T00:42:07.217Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 1822: 아트임팩트 투자조합2호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20220535',
  '아트임팩트 투자조합2호',
  200000000,
  '2023-04-18',
  'Active',
  '아트임팩트',
  'VCS_API_SCRAPER',
  'AS20230286',
  '아트임팩트',
  '산업코드: 9 | 조성총액: 2.0억원',
  '2028-04-17',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20230286","mother_fund_id":"","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"2.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.217Z"}',
  '2025-06-05T00:42:07.217Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 1823: 아트임팩트 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20220535',
  '아트임팩트 투자조합',
  110000000,
  '2023-02-01',
  'Active',
  '아트임팩트',
  'VCS_API_SCRAPER',
  'AS20230060',
  '아트임팩트',
  '산업코드: 8 | 조성총액: 1.1억원',
  '2028-01-31',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20230060","mother_fund_id":"","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"1.1","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.217Z"}',
  '2025-06-05T00:42:07.217Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 1824: 아타카마-벤처스개인투자조합7호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20210403',
  '아타카마-벤처스개인투자조합7호',
  120000000,
  '2024-10-11',
  'Active',
  '미라벤처스',
  'VCS_API_SCRAPER',
  'AS20240919',
  '미라벤처스',
  '산업코드: 9 | 조성총액: 1.2억원',
  '2029-10-10',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20240919","mother_fund_id":"","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"1.2","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.217Z"}',
  '2025-06-05T00:42:07.217Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 1825: 아타카마-벤처스개인투자조합6호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20210403',
  '아타카마-벤처스개인투자조합6호',
  320000000,
  '2024-07-31',
  'Active',
  '미라벤처스',
  'VCS_API_SCRAPER',
  'AS20240672',
  '미라벤처스',
  '산업코드: 5 | 조성총액: 3.2억원',
  '2029-07-30',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20240672","mother_fund_id":"","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"3.2","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.217Z"}',
  '2025-06-05T00:42:07.217Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 1826: 아타카마-벤처스개인투자조합5호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20210403',
  '아타카마-벤처스개인투자조합5호',
  330000000,
  '2024-05-09',
  'Active',
  '미라벤처스',
  'VCS_API_SCRAPER',
  'AS20240372',
  '미라벤처스',
  '산업코드: 3 | 조성총액: 3.3억원',
  '2029-05-08',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20240372","mother_fund_id":"","investment_character_code":"","industry_code":"3","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"3.3","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.217Z"}',
  '2025-06-05T00:42:07.217Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 1827: 아타카마-벤처스개인투자조합4호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20210403',
  '아타카마-벤처스개인투자조합4호',
  120000000,
  '2024-01-31',
  'Active',
  '미라벤처스',
  'VCS_API_SCRAPER',
  'AS20240063',
  '미라벤처스',
  '산업코드: 2 | 조성총액: 1.2억원',
  '2029-01-30',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20240063","mother_fund_id":"","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"1.2","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.217Z"}',
  '2025-06-05T00:42:07.217Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 1828: 아타카마-벤처스개인투자조합3호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20210403',
  '아타카마-벤처스개인투자조합3호',
  1090000000,
  '2023-12-26',
  'Active',
  '미라벤처스',
  'VCS_API_SCRAPER',
  'AS20231317',
  '미라벤처스',
  '산업코드: 5 | 조성총액: 10.9억원',
  '2028-12-25',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20231317","mother_fund_id":"","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"10.9","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.217Z"}',
  '2025-06-05T00:42:07.217Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 1829: 아타카마-벤처스개인투자조합2호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20210403',
  '아타카마-벤처스개인투자조합2호',
  190000000,
  '2022-12-23',
  'Active',
  '미라벤처스',
  'VCS_API_SCRAPER',
  'AS20230014',
  '미라벤처스',
  '산업코드: 9 | 조성총액: 1.9억원',
  '2027-12-22',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20230014","mother_fund_id":"","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"1.9","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.217Z"}',
  '2025-06-05T00:42:07.217Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 1830: 아타카마-벤처스개인투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20210403',
  '아타카마-벤처스개인투자조합1호',
  230000000,
  '2022-08-26',
  'Active',
  '미라벤처스',
  'VCS_API_SCRAPER',
  'AS20220939',
  '미라벤처스',
  '산업코드: 8 | 조성총액: 2.3억원',
  '2027-08-25',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20220939","mother_fund_id":"","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"2.3","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.217Z"}',
  '2025-06-05T00:42:07.217Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 1831: 아타카마-바이오개인투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20210403',
  '아타카마-바이오개인투자조합1호',
  230000000,
  '2022-02-17',
  'Active',
  '미라벤처스',
  'VCS_API_SCRAPER',
  'AS20220151',
  '미라벤처스',
  '산업코드: 5 | 조성총액: 2.3억원',
  '2027-02-16',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20220151","mother_fund_id":"","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"2.3","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.217Z"}',
  '2025-06-05T00:42:07.217Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 1832: 아크로셀 개인투자조합 제2호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20190163',
  '아크로셀 개인투자조합 제2호',
  270000000,
  '2022-08-12',
  'Active',
  '컴퍼니엑스',
  'VCS_API_SCRAPER',
  'AS20220882',
  '컴퍼니엑스',
  '산업코드: 5 | 조성총액: 2.7억원',
  '2027-08-11',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20220882","mother_fund_id":"","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"2.7","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.217Z"}',
  '2025-06-05T00:42:07.217Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 1833: 아주Life Science 해외진출 Platform 펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP19740001',
  '아주Life Science 해외진출 Platform 펀드',
  60000000000,
  '2013-11-29',
  'Active',
  '아주아이비투자',
  'VCS_API_SCRAPER',
  'AS20130056',
  '아주아이비투자',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 15 | 산업코드: 5 | 조성총액: 600.0억원',
  '2025-11-27',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20130056","mother_fund_id":"MF00000001","investment_character_code":"15","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"600.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.217Z"}',
  '2025-06-05T00:42:07.217Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 1834: 아주 중소·벤처 해외진출 지원 펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP19740001',
  '아주 중소·벤처 해외진출 지원 펀드',
  50000000000,
  '2015-08-31',
  'Active',
  '아주아이비투자',
  'VCS_API_SCRAPER',
  'AS20150073',
  '아주아이비투자',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 15 | 산업코드: 4 | 조성총액: 500.0억원',
  '2025-08-30',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20150073","mother_fund_id":"MF00000001","investment_character_code":"15","industry_code":"4","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"500.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.217Z"}',
  '2025-06-05T00:42:07.217Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 1835: 아주 좋은 초격차 스케일업 펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP19740001',
  '아주 좋은 초격차 스케일업 펀드',
  100000000000,
  '2023-12-26',
  'Active',
  '아주아이비투자',
  'VCS_API_SCRAPER',
  'AS20231342',
  '아주아이비투자',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 03 | 산업코드: 8 | 조성총액: 1000.0억원',
  '2031-12-25',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20231342","mother_fund_id":"MF00000001","investment_character_code":"03","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"1000.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.217Z"}',
  '2025-06-05T00:42:07.217Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 1836: 아주 좋은 창업초기 펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP19740001',
  '아주 좋은 창업초기 펀드',
  14500000000,
  '2021-06-21',
  'Active',
  '아주아이비투자',
  'VCS_API_SCRAPER',
  'AS20210505',
  '아주아이비투자',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 20 | 산업코드: 5 | 조성총액: 145.0억원',
  '2029-06-20',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20210505","mother_fund_id":"MF00000001","investment_character_code":"20","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"145.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.217Z"}',
  '2025-06-05T00:42:07.217Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 1837: 아일럼 에이아이-애그리 벤처투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20220146',
  '아일럼 에이아이-애그리 벤처투자조합 1호',
  2200000000,
  '2023-09-18',
  'Active',
  '아일럼인베스트',
  'VCS_API_SCRAPER',
  'AS20230837',
  '아일럼인베스트',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 28 | 산업코드: 2 | 조성총액: 22.0억원',
  '2028-09-17',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20230837","mother_fund_id":"","investment_character_code":"28","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"22.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.217Z"}',
  '2025-06-05T00:42:07.217Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 1838: 아이피텍코리아 진화 개인투자조합 9호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200369',
  '아이피텍코리아 진화 개인투자조합 9호',
  650000000,
  '2022-04-12',
  'Active',
  '아이피텍코리아',
  'VCS_API_SCRAPER',
  'AS20220386',
  '아이피텍코리아',
  '산업코드: 5 | 조성총액: 6.5억원',
  '2032-04-04',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20220386","mother_fund_id":"","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"6.5","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.217Z"}',
  '2025-06-05T00:42:07.217Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 1839: 아이피텍코리아 진화 개인투자조합 7호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200369',
  '아이피텍코리아 진화 개인투자조합 7호',
  320000000,
  '2022-03-07',
  'Active',
  '아이피텍코리아',
  'VCS_API_SCRAPER',
  'AS20220198',
  '아이피텍코리아',
  '산업코드: 8 | 조성총액: 3.2억원',
  '2027-02-27',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20220198","mother_fund_id":"","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"3.2","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.217Z"}',
  '2025-06-05T00:42:07.217Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 1840: 아이피텍코리아 진화 개인투자조합 6호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200369',
  '아이피텍코리아 진화 개인투자조합 6호',
  540000000,
  '2021-12-28',
  'Active',
  '아이피텍코리아',
  'VCS_API_SCRAPER',
  'AS20211428',
  '아이피텍코리아',
  '산업코드: 8 | 조성총액: 5.4억원',
  '2026-12-27',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20211428","mother_fund_id":"","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"5.4","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.217Z"}',
  '2025-06-05T00:42:07.217Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 1841: 아이피텍코리아 진화 개인투자조합 5호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200369',
  '아이피텍코리아 진화 개인투자조합 5호',
  870000000,
  '2021-08-04',
  'Active',
  '아이피텍코리아',
  'VCS_API_SCRAPER',
  'AS20210661',
  '아이피텍코리아',
  '산업코드: 2 | 조성총액: 8.7억원',
  '2026-08-03',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20210661","mother_fund_id":"","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"8.7","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.217Z"}',
  '2025-06-05T00:42:07.217Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 1842: 아이피텍코리아 진화 개인투자조합 4호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200369',
  '아이피텍코리아 진화 개인투자조합 4호',
  870000000,
  '2021-07-21',
  'Active',
  '아이피텍코리아',
  'VCS_API_SCRAPER',
  'AS20210563',
  '아이피텍코리아',
  '산업코드: 2 | 조성총액: 8.7억원',
  '2026-07-20',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20210563","mother_fund_id":"","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"8.7","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.217Z"}',
  '2025-06-05T00:42:07.217Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 1843: 아이피텍코리아 진화 개인투자조합 2호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200369',
  '아이피텍코리아 진화 개인투자조합 2호',
  2480000000,
  '2021-06-16',
  'Active',
  '아이피텍코리아',
  'VCS_API_SCRAPER',
  'AS20210445',
  '아이피텍코리아',
  '산업코드: 4 | 조성총액: 24.8억원',
  '2026-06-15',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20210445","mother_fund_id":"","investment_character_code":"","industry_code":"4","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"24.8","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.217Z"}',
  '2025-06-05T00:42:07.217Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 1844: 아이피텍코리아 개인투자조합12호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200369',
  '아이피텍코리아 개인투자조합12호',
  310000000,
  '2024-11-21',
  'Active',
  '아이피텍코리아',
  'VCS_API_SCRAPER',
  'AS20241172',
  '아이피텍코리아',
  '산업코드: 8 | 조성총액: 3.1억원',
  '2029-11-19',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20241172","mother_fund_id":"","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"3.1","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.217Z"}',
  '2025-06-05T00:42:07.217Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 1845: 아이피텍코리아 개인투자조합 11호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200369',
  '아이피텍코리아 개인투자조합 11호',
  270000000,
  '2023-05-25',
  'Active',
  '아이피텍코리아',
  'VCS_API_SCRAPER',
  'AS20230413',
  '아이피텍코리아',
  '산업코드: 2 | 조성총액: 2.7억원',
  '2028-05-21',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20230413","mother_fund_id":"","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"2.7","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.217Z"}',
  '2025-06-05T00:42:07.217Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 1846: 아이피에스(IPS)스타트업프로젝트7호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20190084',
  '아이피에스(IPS)스타트업프로젝트7호 투자조합',
  210000000,
  '2024-05-30',
  'Active',
  '아이피에스벤처스',
  'VCS_API_SCRAPER',
  'AS20240471',
  '아이피에스벤처스',
  '산업코드: 2 | 조성총액: 2.1억원',
  '2029-05-29',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20240471","mother_fund_id":"","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"2.1","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.217Z"}',
  '2025-06-05T00:42:07.217Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 1847: 아이피에스(IPS)스타트업프로젝트6호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20190084',
  '아이피에스(IPS)스타트업프로젝트6호 투자조합',
  830000000,
  '2023-07-19',
  'Active',
  '아이피에스벤처스',
  'VCS_API_SCRAPER',
  'AS20230594',
  '아이피에스벤처스',
  '산업코드: 5 | 조성총액: 8.3억원',
  '2028-07-18',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20230594","mother_fund_id":"","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"8.3","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.217Z"}',
  '2025-06-05T00:42:07.217Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 1848: 아이피에스(IPS)스타트업프로젝트5호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20190084',
  '아이피에스(IPS)스타트업프로젝트5호 투자조합',
  300000000,
  '2022-06-08',
  'Active',
  '아이피에스벤처스',
  'VCS_API_SCRAPER',
  'AS20220552',
  '아이피에스벤처스',
  '산업코드: 2 | 조성총액: 3.0억원',
  '2027-06-07',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20220552","mother_fund_id":"","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"3.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.217Z"}',
  '2025-06-05T00:42:07.217Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 1849: 아이피에스(IPS)스타트업프로젝트4호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20190084',
  '아이피에스(IPS)스타트업프로젝트4호 투자조합',
  600000000,
  '2022-04-01',
  'Active',
  '아이피에스벤처스',
  'VCS_API_SCRAPER',
  'AS20220269',
  '아이피에스벤처스',
  '산업코드: 5 | 조성총액: 6.0억원',
  '2027-03-30',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20220269","mother_fund_id":"","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"6.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.217Z"}',
  '2025-06-05T00:42:07.217Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 1850: 아이피에스(IPS)스타트업프로젝트3호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20190084',
  '아이피에스(IPS)스타트업프로젝트3호 투자조합',
  3390000000,
  '2022-01-05',
  'Active',
  '아이피에스벤처스',
  'VCS_API_SCRAPER',
  'AS20211458',
  '아이피에스벤처스',
  '산업코드: 2 | 조성총액: 33.9억원',
  '2027-01-04',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20211458","mother_fund_id":"","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"33.9","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.217Z"}',
  '2025-06-05T00:42:07.217Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Exact Batch 37 completed! 50 fund records processed.
-- Progress: 1850/3689 total records

