-- VCS Fund EXACT UPSERT Batch 68/74 (Records 3351-3400)
-- EXACT: Uses actual fund_table schema columns
-- Generated from VCS API Scraper fund data
-- Generated at: 2025-06-05T00:42:07.339Z
-- Schema: Exact match to actual fund_table structure

-- EXACT FUND DATA (UPSERT - Safe for Duplicates)
-- Processing 50 fund records
-- Will INSERT new records or UPDATE existing ones

-- Record 3351: 경남 엔젤투자매칭펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20000029',
  '경남 엔젤투자매칭펀드',
  5000000000,
  '2012-06-05',
  'Active',
  '한국벤처투자',
  'VCS_API_SCRAPER',
  'AS20120026',
  '한국벤처투자',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 20 | 산업코드: 3 | 조성총액: 50.0억원',
  '2025-09-13',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20120026","mother_fund_id":"MF00000001","investment_character_code":"20","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"50.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.339Z"}',
  '2025-06-05T00:42:07.339Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 3352: 경남 리버스이노베이션투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20190375',
  '경남 리버스이노베이션투자조합',
  20000000000,
  '2020-12-16',
  'Active',
  '경남벤처투자',
  'VCS_API_SCRAPER',
  'AS20200788',
  '경남벤처투자',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 18 | 산업코드: 3 | 조성총액: 200.0억원',
  '2028-12-15',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20200788","mother_fund_id":"MF00000001","investment_character_code":"18","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"200.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.339Z"}',
  '2025-06-05T00:42:07.339Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 3353: 경기혁신 유니콘 브릿지 조합 2호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20150037',
  '경기혁신 유니콘 브릿지 조합 2호',
  140000000,
  '2023-04-19',
  'Active',
  '경기창조경제혁신센터',
  'VCS_API_SCRAPER',
  'AS20230281',
  '경기창조경제혁신센터',
  '산업코드: 2 | 조성총액: 1.4억원',
  '2028-04-18',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20230281","mother_fund_id":"","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"1.4","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.339Z"}',
  '2025-06-05T00:42:07.339Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 3354: 경기혁신 유니콘 브릿지 조합 1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20150037',
  '경기혁신 유니콘 브릿지 조합 1호',
  220000000,
  '2023-04-19',
  'Active',
  '경기창조경제혁신센터',
  'VCS_API_SCRAPER',
  'AS20230280',
  '경기창조경제혁신센터',
  '산업코드: 8 | 조성총액: 2.2억원',
  '2028-04-18',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20230280","mother_fund_id":"","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"2.2","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.339Z"}',
  '2025-06-05T00:42:07.339Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 3355: 경기혁신 메디컬조합 1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20150037',
  '경기혁신 메디컬조합 1호',
  360000000,
  '2023-01-10',
  'Active',
  '경기창조경제혁신센터',
  'VCS_API_SCRAPER',
  'AS20221555',
  '경기창조경제혁신센터',
  '산업코드: 8 | 조성총액: 3.6억원',
  '2028-01-09',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20221555","mother_fund_id":"","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"3.6","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.339Z"}',
  '2025-06-05T00:42:07.339Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 3356: 경기하나버팀목재기지원펀드2호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20190414',
  '경기하나버팀목재기지원펀드2호',
  45000000000,
  '2021-09-29',
  'Active',
  '하나벤처스',
  'VCS_API_SCRAPER',
  'AS20210918',
  '하나벤처스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 02 | 산업코드: 8 | 조성총액: 450.0억원',
  '2029-09-28',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20210918","mother_fund_id":"MF00000001","investment_character_code":"02","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"450.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.339Z"}',
  '2025-06-05T00:42:07.339Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 3357: 경기창조경제혁신센터 개인투자조합 6호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20150037',
  '경기창조경제혁신센터 개인투자조합 6호',
  110000000,
  '2023-01-10',
  'Active',
  '경기창조경제혁신센터',
  'VCS_API_SCRAPER',
  'AS20230008',
  '경기창조경제혁신센터',
  '산업코드: 2 | 조성총액: 1.1억원',
  '2028-01-09',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20230008","mother_fund_id":"","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"1.1","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.339Z"}',
  '2025-06-05T00:42:07.339Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 3358: 경기창조경제혁신센터 개인투자조합 5호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20150037',
  '경기창조경제혁신센터 개인투자조합 5호',
  110000000,
  '2023-01-10',
  'Active',
  '경기창조경제혁신센터',
  'VCS_API_SCRAPER',
  'AS20221556',
  '경기창조경제혁신센터',
  '산업코드: 2 | 조성총액: 1.1억원',
  '2028-01-09',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20221556","mother_fund_id":"","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"1.1","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.339Z"}',
  '2025-06-05T00:42:07.339Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 3359: 경기창조경제혁신센터 개인투자조합 4호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20150037',
  '경기창조경제혁신센터 개인투자조합 4호',
  320000000,
  '2022-05-13',
  'Active',
  '경기창조경제혁신센터',
  'VCS_API_SCRAPER',
  'AS20220532',
  '경기창조경제혁신센터',
  '산업코드: 8 | 조성총액: 3.2억원',
  '2027-05-12',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20220532","mother_fund_id":"","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"3.2","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.339Z"}',
  '2025-06-05T00:42:07.339Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 3360: 경기창조경제혁신센터 개인투자조합 3호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20150037',
  '경기창조경제혁신센터 개인투자조합 3호',
  210000000,
  '2022-06-14',
  'Active',
  '경기창조경제혁신센터',
  'VCS_API_SCRAPER',
  'AS20220621',
  '경기창조경제혁신센터',
  '산업코드: 3 | 조성총액: 2.1억원',
  '2027-06-13',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20220621","mother_fund_id":"","investment_character_code":"","industry_code":"3","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"2.1","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.339Z"}',
  '2025-06-05T00:42:07.339Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 3361: 경기창조경제혁신센터 개인투자조합 2호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20150037',
  '경기창조경제혁신센터 개인투자조합 2호',
  950000000,
  '2021-09-10',
  'Active',
  '경기창조경제혁신센터',
  'VCS_API_SCRAPER',
  'AS20210830',
  '경기창조경제혁신센터',
  '산업코드: 6 | 조성총액: 9.5억원',
  '2028-09-09',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20210830","mother_fund_id":"","investment_character_code":"","industry_code":"6","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"9.5","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.339Z"}',
  '2025-06-05T00:42:07.339Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 3362: 경기창조경제혁신센터 개인투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20150037',
  '경기창조경제혁신센터 개인투자조합 1호',
  150000000,
  '2021-01-05',
  'Active',
  '경기창조경제혁신센터',
  'VCS_API_SCRAPER',
  'AS20210006',
  '경기창조경제혁신센터',
  '산업코드: 2 | 조성총액: 1.5억원',
  '2026-01-04',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20210006","mother_fund_id":"","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"1.5","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.339Z"}',
  '2025-06-05T00:42:07.339Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 3363: 경기-퀀텀&코리아오메가Follow-on슈퍼맨투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20170021',
  '경기-퀀텀&코리아오메가Follow-on슈퍼맨투자조합',
  31500000000,
  '2018-07-16',
  'Active',
  '퀀텀벤처스코리아',
  'VCS_API_SCRAPER',
  'AS20180192',
  '퀀텀벤처스코리아',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 20 | 산업코드: 5 | 조성총액: 315.0억원',
  '2026-07-15',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20180192","mother_fund_id":"","investment_character_code":"20","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"315.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.339Z"}',
  '2025-06-05T00:42:07.339Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 3364: 경기-네오플럭스 슈퍼맨투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20000041',
  '경기-네오플럭스 슈퍼맨투자조합',
  34000000000,
  '2017-09-06',
  'Active',
  '신한벤처투자',
  'VCS_API_SCRAPER',
  'AS20170104',
  '신한벤처투자',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 15 | 산업코드: 5 | 조성총액: 340.0억원',
  '2025-09-05',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20170104","mother_fund_id":"MF00000001","investment_character_code":"15","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"340.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.339Z"}',
  '2025-06-05T00:42:07.339Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 3365: 경기-KT 슈퍼맨투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20000023',
  '경기-KT 슈퍼맨투자조합',
  18200000000,
  '2016-10-10',
  'Active',
  '플래티넘기술투자',
  'VCS_API_SCRAPER',
  'AS20160105',
  '플래티넘기술투자',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 18 | 산업코드: 3 | 조성총액: 182.0억원',
  '2025-10-09',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20160105","mother_fund_id":"","investment_character_code":"18","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"182.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.339Z"}',
  '2025-06-05T00:42:07.339Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 3366: 경기-DSC슈퍼맨투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20120007',
  '경기-DSC슈퍼맨투자조합1호',
  20000000000,
  '2015-08-03',
  'Active',
  '디에스씨인베스트먼트',
  'VCS_API_SCRAPER',
  'AS20150094',
  '디에스씨인베스트먼트',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 20 | 산업코드: 5 | 조성총액: 200.0억원',
  '2025-12-31',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20150094","mother_fund_id":"","investment_character_code":"20","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"200.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.339Z"}',
  '2025-06-05T00:42:07.339Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 3367: 경기 엔젤투자매칭펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20000029',
  '경기 엔젤투자매칭펀드',
  5000000000,
  '2013-11-12',
  'Active',
  '한국벤처투자',
  'VCS_API_SCRAPER',
  'AS20130041',
  '한국벤처투자',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 20 | 산업코드: 2 | 조성총액: 50.0억원',
  '2025-09-13',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20130041","mother_fund_id":"MF00000001","investment_character_code":"20","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"50.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.339Z"}',
  '2025-06-05T00:42:07.339Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 3368: 겟투개인투자조합3호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200113',
  '겟투개인투자조합3호',
  670000000,
  '2021-12-14',
  'Active',
  '겟투',
  'VCS_API_SCRAPER',
  'AS20211282',
  '겟투',
  '산업코드: 8 | 조성총액: 6.7억원',
  '2026-12-31',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20211282","mother_fund_id":"","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"6.7","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.339Z"}',
  '2025-06-05T00:42:07.339Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 3369: 겟투 개인투자조합 5호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200113',
  '겟투 개인투자조합 5호',
  100000000,
  '2024-01-02',
  'Active',
  '겟투',
  'VCS_API_SCRAPER',
  'AS20231344',
  '겟투',
  '산업코드: 8 | 조성총액: 1.0억원',
  '2029-01-01',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20231344","mother_fund_id":"","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"1.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.339Z"}',
  '2025-06-05T00:42:07.339Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 3370: 겟투 개인투자조합 4호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200113',
  '겟투 개인투자조합 4호',
  400000000,
  '2022-12-28',
  'Active',
  '겟투',
  'VCS_API_SCRAPER',
  'AS20221542',
  '겟투',
  '산업코드: 5 | 조성총액: 4.0억원',
  '2027-12-27',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20221542","mother_fund_id":"","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"4.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.339Z"}',
  '2025-06-05T00:42:07.339Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 3371: 겟투 개인투자조합 2호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200113',
  '겟투 개인투자조합 2호',
  360000000,
  '2021-01-05',
  'Active',
  '겟투',
  'VCS_API_SCRAPER',
  'AS20200851',
  '겟투',
  '산업코드: 8 | 조성총액: 3.6억원',
  '2026-01-04',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20200851","mother_fund_id":"","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"3.6","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.339Z"}',
  '2025-06-05T00:42:07.339Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 3372: 개인투자조합 케이스케일업101펀드3호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200159',
  '개인투자조합 케이스케일업101펀드3호',
  140000000,
  '2024-02-15',
  'Active',
  '강쎈',
  'VCS_API_SCRAPER',
  'AS20240093',
  '강쎈',
  '산업코드: 9 | 조성총액: 1.4억원',
  '2029-12-31',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20240093","mother_fund_id":"","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"1.4","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.339Z"}',
  '2025-06-05T00:42:07.339Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 3373: 개인투자조합 케이스케일업101펀드2호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200159',
  '개인투자조합 케이스케일업101펀드2호',
  100000000,
  '2022-01-11',
  'Active',
  '강쎈',
  'VCS_API_SCRAPER',
  'AS20211444',
  '강쎈',
  '산업코드: 2 | 조성총액: 1.0억원',
  '2027-01-10',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20211444","mother_fund_id":"","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"1.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.339Z"}',
  '2025-06-05T00:42:07.339Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 3374: 개인투자조합 JB 샛별 1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20190155',
  '개인투자조합 JB 샛별 1호',
  290000000,
  '2021-07-12',
  'Active',
  '유닉',
  'VCS_API_SCRAPER',
  'AS20210562',
  '유닉',
  '산업코드: 8 | 조성총액: 2.9억원',
  '2026-07-11',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20210562","mother_fund_id":"","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"2.9","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.339Z"}',
  '2025-06-05T00:42:07.339Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 3375: 같이하다 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20210487',
  '같이하다 투자조합',
  20200000000,
  '2018-07-11',
  'Active',
  '인비저닝파트너스',
  'VCS_API_SCRAPER',
  'AS20180188',
  '인비저닝파트너스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 23 | 산업코드: 8 | 조성총액: 202.0억원',
  '2027-07-10',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20180188","mother_fund_id":"MF00000001","investment_character_code":"23","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"202.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.339Z"}',
  '2025-06-05T00:42:07.339Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 3376: 같이가자 카카오게임즈 상생 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20180002',
  '같이가자 카카오게임즈 상생 투자조합',
  25860000000,
  '2021-12-13',
  'Active',
  '코나벤처파트너스',
  'VCS_API_SCRAPER',
  'AS20211270',
  '코나벤처파트너스',
  '투자분야: 문화 | 세부분야: 영상(영화+드라마+애니메이션) | 투자성격코드: 24 | 산업코드: 7 | 조성총액: 258.6억원',
  '2029-12-12',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20211270","mother_fund_id":"MF00000001","investment_character_code":"24","industry_code":"7","investment_field_type":"문화","investment_field_detail_type":"영상(영화+드라마+애니메이션)","formation_total_amount":"258.6","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.339Z"}',
  '2025-06-05T00:42:07.339Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 3377: 강원혁신창업1호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20150036',
  '강원혁신창업1호 투자조합',
  1000000000,
  '2023-11-21',
  'Active',
  '강원창조경제혁신센터',
  'VCS_API_SCRAPER',
  'AS20231106',
  '강원창조경제혁신센터',
  '산업코드: 8 | 조성총액: 10.0억원',
  '2031-11-19',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20231106","mother_fund_id":"MF00000021","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"10.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.339Z"}',
  '2025-06-05T00:42:07.339Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 3378: 강원청년창업펀드 1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20190413',
  '강원청년창업펀드 1호',
  5000000000,
  '2021-08-03',
  'Active',
  '소풍벤처스',
  'VCS_API_SCRAPER',
  'AS20210675',
  '소풍벤처스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 20 | 산업코드: 5 | 조성총액: 50.0억원',
  '2029-08-02',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20210675","mother_fund_id":"","investment_character_code":"20","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"50.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.339Z"}',
  '2025-06-05T00:42:07.339Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 3379: 강원대기술지주더존비즈온강원특별자치도대학창업펀드제1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200081',
  '강원대기술지주더존비즈온강원특별자치도대학창업펀드제1호',
  2800000000,
  '2023-10-13',
  'Active',
  '강원대학교기술지주회사',
  'VCS_API_SCRAPER',
  'AS20230909',
  '강원대학교기술지주회사',
  '산업코드: 8 | 조성총액: 28.0억원',
  '2031-10-10',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20230909","mother_fund_id":"MF00000001","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"28.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.339Z"}',
  '2025-06-05T00:42:07.339Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 3380: 강원대기술지주 강원특별자치도 대학창업펀드 제2호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200081',
  '강원대기술지주 강원특별자치도 대학창업펀드 제2호 개인투자조합',
  3400000000,
  '2024-09-26',
  'Active',
  '강원대학교기술지주회사',
  'VCS_API_SCRAPER',
  'AS20240925',
  '강원대학교기술지주회사',
  '산업코드: 8 | 조성총액: 34.0억원',
  '2032-09-24',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20240925","mother_fund_id":"MF00000001","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"34.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.339Z"}',
  '2025-06-05T00:42:07.339Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 3381: 강원-아이스퀘어 중소벤처펀드 2호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200340',
  '강원-아이스퀘어 중소벤처펀드 2호',
  10000000000,
  '2021-08-06',
  'Active',
  '에코프로파트너스',
  'VCS_API_SCRAPER',
  'AS20210691',
  '에코프로파트너스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 03 | 산업코드: 1 | 조성총액: 100.0억원',
  '2029-08-05',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20210691","mother_fund_id":"","investment_character_code":"03","industry_code":"1","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"100.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.339Z"}',
  '2025-06-05T00:42:07.339Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 3382: 강원-세종 중소벤처펀드 1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20130002',
  '강원-세종 중소벤처펀드 1호',
  10600000000,
  '2021-09-06',
  'Active',
  '로이투자파트너스',
  'VCS_API_SCRAPER',
  'AS20210816',
  '로이투자파트너스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 03 | 산업코드: 5 | 조성총액: 106.0억원',
  '2029-09-05',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20210816","mother_fund_id":"","investment_character_code":"03","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"106.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.339Z"}',
  '2025-06-05T00:42:07.339Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 3383: 강원-세종 강소기업육성 상생 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20130002',
  '강원-세종 강소기업육성 상생 투자조합',
  14250000000,
  '2015-10-12',
  'Active',
  '로이투자파트너스',
  'VCS_API_SCRAPER',
  'AS20150118',
  '로이투자파트너스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 18 | 산업코드: 5 | 조성총액: 142.5억원',
  '2025-10-11',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20150118","mother_fund_id":"MF00000001","investment_character_code":"18","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"142.5","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.339Z"}',
  '2025-06-05T00:42:07.339Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 3384: 강원 피크닉 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20190413',
  '강원 피크닉 투자조합',
  3230000000,
  '2021-01-20',
  'Active',
  '소풍벤처스',
  'VCS_API_SCRAPER',
  'AS20210042',
  '소풍벤처스',
  '산업코드: 8 | 조성총액: 32.3억원',
  '2029-01-19',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20210042","mother_fund_id":"MF00000001","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"32.3","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.339Z"}',
  '2025-06-05T00:42:07.339Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 3385: 강원 엔젤투자매칭펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20000029',
  '강원 엔젤투자매칭펀드',
  3000000000,
  '2012-10-19',
  'Active',
  '한국벤처투자',
  'VCS_API_SCRAPER',
  'AS20120035',
  '한국벤처투자',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 20 | 산업코드: 5 | 조성총액: 30.0억원',
  '2025-09-13',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20120035","mother_fund_id":"MF00000001","investment_character_code":"20","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"30.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.339Z"}',
  '2025-06-05T00:42:07.339Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 3386: 강소신재생에너지혁신펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP19620001',
  '강소신재생에너지혁신펀드',
  100000000000,
  '2015-09-18',
  'Active',
  '한화투자증권',
  'VCS_API_SCRAPER',
  'AS20150039',
  '한화투자증권',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 11 | 산업코드: 9 | 조성총액: 1000.0억원',
  '2025-09-17',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20150039","mother_fund_id":"","investment_character_code":"11","industry_code":"9","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"1000.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.339Z"}',
  '2025-06-05T00:42:07.339Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 3387: 가이아혁신성장마케팅투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20150008',
  '가이아혁신성장마케팅투자조합1호',
  10010000000,
  '2019-01-30',
  'Active',
  '가이아벤처파트너스',
  'VCS_API_SCRAPER',
  'AS20190037',
  '가이아벤처파트너스',
  '투자분야: 일반 | 세부분야: 일반 기타 | 투자성격코드: 10 | 산업코드: 6 | 조성총액: 100.1억원',
  '2027-01-29',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20190037","mother_fund_id":"MF00000001","investment_character_code":"10","industry_code":"6","investment_field_type":"일반","investment_field_detail_type":"일반 기타","formation_total_amount":"100.1","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.339Z"}',
  '2025-06-05T00:42:07.339Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 3388: 가이아재기지원투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20150008',
  '가이아재기지원투자조합1호',
  20000000000,
  '2017-12-27',
  'Active',
  '가이아벤처파트너스',
  'VCS_API_SCRAPER',
  'AS20180007',
  '가이아벤처파트너스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 22 | 산업코드: 9 | 조성총액: 200.0억원',
  '2025-12-26',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20180007","mother_fund_id":"MF00000001","investment_character_code":"22","industry_code":"9","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"200.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.339Z"}',
  '2025-06-05T00:42:07.339Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 3389: 가이아영화투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20150008',
  '가이아영화투자조합',
  13140000000,
  '2021-08-18',
  'Active',
  '가이아벤처파트너스',
  'VCS_API_SCRAPER',
  'AS20210733',
  '가이아벤처파트너스',
  '투자분야: 문화 | 세부분야: 영상(영화+드라마+애니메이션) | 투자성격코드: 24 | 산업코드: 6 | 조성총액: 131.4억원',
  '2026-08-17',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20210733","mother_fund_id":"MF00000001","investment_character_code":"24","industry_code":"6","investment_field_type":"문화","investment_field_detail_type":"영상(영화+드라마+애니메이션)","formation_total_amount":"131.4","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.339Z"}',
  '2025-06-05T00:42:07.339Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 3390: 가이아사회서비스투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20150008',
  '가이아사회서비스투자조합',
  14500000000,
  '2023-10-05',
  'Active',
  '가이아벤처파트너스',
  'VCS_API_SCRAPER',
  'AS20230894',
  '가이아벤처파트너스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 10 | 산업코드: 2 | 조성총액: 145.0억원',
  '2031-10-04',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20230894","mother_fund_id":"MF00000001","investment_character_code":"10","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"145.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.339Z"}',
  '2025-06-05T00:42:07.339Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 3391: 가이아방송콘텐츠투자조합2호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20150008',
  '가이아방송콘텐츠투자조합2호',
  15060000000,
  '2021-11-11',
  'Active',
  '가이아벤처파트너스',
  'VCS_API_SCRAPER',
  'AS20211108',
  '가이아벤처파트너스',
  '투자분야: 문화 | 세부분야: 문화 기타 | 투자성격코드: 24 | 산업코드: 6 | 조성총액: 150.6억원',
  '2028-11-10',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20211108","mother_fund_id":"MF00000001","investment_character_code":"24","industry_code":"6","investment_field_type":"문화","investment_field_detail_type":"문화 기타","formation_total_amount":"150.6","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.339Z"}',
  '2025-06-05T00:42:07.339Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 3392: 가이아방송콘텐츠투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20150008',
  '가이아방송콘텐츠투자조합1호',
  10320000000,
  '2017-12-13',
  'Active',
  '가이아벤처파트너스',
  'VCS_API_SCRAPER',
  'AS20170153',
  '가이아벤처파트너스',
  '투자분야: 문화 | 세부분야: 문화 기타 | 투자성격코드: 24 | 산업코드: 6 | 조성총액: 103.2억원',
  '2025-06-12',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20170153","mother_fund_id":"MF00000001","investment_character_code":"24","industry_code":"6","investment_field_type":"문화","investment_field_detail_type":"문화 기타","formation_total_amount":"103.2","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.339Z"}',
  '2025-06-05T00:42:07.339Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 3393: 가이아바이오투자조합4호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20150008',
  '가이아바이오투자조합4호',
  3340000000,
  '2023-07-18',
  'Active',
  '가이아벤처파트너스',
  'VCS_API_SCRAPER',
  'AS20230610',
  '가이아벤처파트너스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 25 | 산업코드: 5 | 조성총액: 33.4억원',
  '2028-07-17',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20230610","mother_fund_id":"","investment_character_code":"25","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"33.4","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.339Z"}',
  '2025-06-05T00:42:07.339Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 3394: 가이아바이오투자조합3호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20150008',
  '가이아바이오투자조합3호',
  2000000000,
  '2022-09-19',
  'Active',
  '가이아벤처파트너스',
  'VCS_API_SCRAPER',
  'AS20221065',
  '가이아벤처파트너스',
  '투자분야: 일반 | 세부분야: 바이오 | 투자성격코드: 25 | 산업코드: 5 | 조성총액: 20.0억원',
  '2027-09-18',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20221065","mother_fund_id":"","investment_character_code":"25","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"바이오","formation_total_amount":"20.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.339Z"}',
  '2025-06-05T00:42:07.340Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 3395: 가이아바이오투자조합2호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20150008',
  '가이아바이오투자조합2호',
  3260000000,
  '2022-01-14',
  'Active',
  '가이아벤처파트너스',
  'VCS_API_SCRAPER',
  'AS20220064',
  '가이아벤처파트너스',
  '투자분야: 일반 | 세부분야: 바이오 | 투자성격코드: 04 | 산업코드: 5 | 조성총액: 32.6억원',
  '2027-01-13',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20220064","mother_fund_id":"","investment_character_code":"04","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"바이오","formation_total_amount":"32.6","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.340Z"}',
  '2025-06-05T00:42:07.340Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 3396: 가이아바이오투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20150008',
  '가이아바이오투자조합1호',
  6100000000,
  '2018-09-12',
  'Active',
  '가이아벤처파트너스',
  'VCS_API_SCRAPER',
  'AS20180268',
  '가이아벤처파트너스',
  '투자분야: 일반 | 세부분야: 바이오 | 투자성격코드: 25 | 산업코드: 5 | 조성총액: 61.0억원',
  '2025-09-11',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20180268","mother_fund_id":"","investment_character_code":"25","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"바이오","formation_total_amount":"61.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.340Z"}',
  '2025-06-05T00:42:07.340Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 3397: 가이아문화콘텐츠투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20150008',
  '가이아문화콘텐츠투자조합',
  18420000000,
  '2016-09-28',
  'Active',
  '가이아벤처파트너스',
  'VCS_API_SCRAPER',
  'AS20160035',
  '가이아벤처파트너스',
  '투자분야: 문화 | 세부분야: 문화 기타 | 투자성격코드: 24 | 산업코드: 6 | 조성총액: 184.2억원',
  '2026-04-27',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20160035","mother_fund_id":"MF00000001","investment_character_code":"24","industry_code":"6","investment_field_type":"문화","investment_field_detail_type":"문화 기타","formation_total_amount":"184.2","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.340Z"}',
  '2025-06-05T00:42:07.340Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 3398: 가이아모험콘텐츠투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20150008',
  '가이아모험콘텐츠투자조합',
  20000000000,
  '2020-05-26',
  'Active',
  '가이아벤처파트너스',
  'VCS_API_SCRAPER',
  'AS20200229',
  '가이아벤처파트너스',
  '투자분야: 문화 | 세부분야: 문화 기타 | 투자성격코드: 24 | 산업코드: 6 | 조성총액: 200.0억원',
  '2027-05-25',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20200229","mother_fund_id":"MF00000001","investment_character_code":"24","industry_code":"6","investment_field_type":"문화","investment_field_detail_type":"문화 기타","formation_total_amount":"200.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.340Z"}',
  '2025-06-05T00:42:07.340Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 3399: 가이아관광기업육성투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20150008',
  '가이아관광기업육성투자조합',
  27080000000,
  '2024-12-20',
  'Active',
  '가이아벤처파트너스',
  'VCS_API_SCRAPER',
  'AS20241399',
  '가이아벤처파트너스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 10 | 산업코드: 6 | 조성총액: 270.8억원',
  '2032-12-19',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20241399","mother_fund_id":"MF00000001","investment_character_code":"10","industry_code":"6","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"270.8","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.340Z"}',
  '2025-06-05T00:42:07.340Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 3400: 가이아K콘텐츠IP투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20150008',
  '가이아K콘텐츠IP투자조합',
  26070000000,
  '2023-08-09',
  'Active',
  '가이아벤처파트너스',
  'VCS_API_SCRAPER',
  'AS20230690',
  '가이아벤처파트너스',
  '투자분야: 문화 | 세부분야: 문화 기타 | 투자성격코드: 24 | 산업코드: 6 | 조성총액: 260.7억원',
  '2031-08-08',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20230690","mother_fund_id":"MF00000001","investment_character_code":"24","industry_code":"6","investment_field_type":"문화","investment_field_detail_type":"문화 기타","formation_total_amount":"260.7","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.340Z"}',
  '2025-06-05T00:42:07.340Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Exact Batch 68 completed! 50 fund records processed.
-- Progress: 3400/3689 total records

