-- VCS Fund EXACT UPSERT Batch 20/74 (Records 951-1000)
-- EXACT: Uses actual fund_table schema columns
-- Generated from VCS API Scraper fund data
-- Generated at: 2025-06-05T00:42:07.142Z
-- Schema: Exact match to actual fund_table structure

-- EXACT FUND DATA (UPSERT - Safe for Duplicates)
-- Processing 50 fund records
-- Will INSERT new records or UPDATE existing ones

-- Record 951: 일신 뉴코리안웨이브 2호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP19900005',
  '일신 뉴코리안웨이브 2호 투자조합',
  15100000000,
  '2018-01-08',
  'Active',
  '일신창업투자',
  'VCS_API_SCRAPER',
  'AS20180070',
  '일신창업투자',
  '투자분야: 문화 | 세부분야: 영상(영화+드라마+애니메이션) | 투자성격코드: 24 | 산업코드: 6 | 조성총액: 151.0억원',
  '2026-01-07',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20180070","mother_fund_id":"MF00000001","investment_character_code":"24","industry_code":"6","investment_field_type":"문화","investment_field_detail_type":"영상(영화+드라마+애니메이션)","formation_total_amount":"151.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.142Z"}',
  '2025-06-05T00:42:07.142Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 952: 일신 뉴어드벤쳐 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP19900005',
  '일신 뉴어드벤쳐 투자조합',
  30000000000,
  '2022-10-05',
  'Active',
  '일신창업투자',
  'VCS_API_SCRAPER',
  'AS20221143',
  '일신창업투자',
  '투자분야: 문화 | 세부분야: 영상(영화+드라마+애니메이션) | 투자성격코드: 24 | 산업코드: 6 | 조성총액: 300.0억원',
  '2030-10-04',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20221143","mother_fund_id":"MF00000001","investment_character_code":"24","industry_code":"6","investment_field_type":"문화","investment_field_detail_type":"영상(영화+드라마+애니메이션)","formation_total_amount":"300.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.142Z"}',
  '2025-06-05T00:42:07.142Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 953: 일신 뉴어드벤쳐 2호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP19900005',
  '일신 뉴어드벤쳐 2호 투자조합',
  37500000000,
  '2024-11-22',
  'Active',
  '일신창업투자',
  'VCS_API_SCRAPER',
  'AS20241188',
  '일신창업투자',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 24 | 산업코드: 6 | 조성총액: 375.0억원',
  '2032-11-21',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20241188","mother_fund_id":"MF00000001","investment_character_code":"24","industry_code":"6","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"375.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.142Z"}',
  '2025-06-05T00:42:07.142Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 954: 일상의감동 개인투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20220313',
  '일상의감동 개인투자조합 1호',
  900000000,
  '2023-07-06',
  'Active',
  '핼리스톤벤처스 주식회사',
  'VCS_API_SCRAPER',
  'AS20230554',
  '핼리스톤벤처스 주식회사',
  '산업코드: 9 | 조성총액: 9.0억원',
  '2028-07-05',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20230554","mother_fund_id":"","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"9.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.142Z"}',
  '2025-06-05T00:42:07.142Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 955: 인하비룡ㆍ인천창조 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20150032',
  '인하비룡ㆍ인천창조 투자조합',
  630000000,
  '2023-02-02',
  'Active',
  '인천창조경제혁신센터',
  'VCS_API_SCRAPER',
  'AS20230058',
  '인천창조경제혁신센터',
  '산업코드: 9 | 조성총액: 6.3억원',
  '2030-02-01',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20230058","mother_fund_id":"","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"6.3","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.142Z"}',
  '2025-06-05T00:42:07.142Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 956: 인하 비룡 개인투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20180036',
  '인하 비룡 개인투자조합 1호',
  200000000,
  '2021-01-20',
  'Active',
  '아이스타트업랩',
  'VCS_API_SCRAPER',
  'AS20210052',
  '아이스타트업랩',
  '산업코드: 2 | 조성총액: 2.0억원',
  '2026-03-31',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20210052","mother_fund_id":"","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"2.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.142Z"}',
  '2025-06-05T00:42:07.142Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 957: 인피니툼스포츠4호딥테크펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200206',
  '인피니툼스포츠4호딥테크펀드',
  12000000000,
  '2025-02-26',
  'Active',
  '인피니툼파트너스',
  'VCS_API_SCRAPER',
  'AS20250148',
  '인피니툼파트너스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 17 | 산업코드: 7 | 조성총액: 120.0억원',
  '2030-02-25',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20250148","mother_fund_id":"","investment_character_code":"17","industry_code":"7","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"120.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.142Z"}',
  '2025-06-05T00:42:07.142Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 958: 인피니툼스포츠3호펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200206',
  '인피니툼스포츠3호펀드',
  18400000000,
  '2023-11-15',
  'Active',
  '인피니툼파트너스',
  'VCS_API_SCRAPER',
  'AS20231082',
  '인피니툼파트너스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 07 | 산업코드: 9 | 조성총액: 184.0억원',
  '2031-11-14',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20231082","mother_fund_id":"MF00000001","investment_character_code":"07","industry_code":"9","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"184.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.142Z"}',
  '2025-06-05T00:42:07.142Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 959: 인피니툼스포츠2호펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200206',
  '인피니툼스포츠2호펀드',
  18500000000,
  '2021-10-14',
  'Active',
  '인피니툼파트너스',
  'VCS_API_SCRAPER',
  'AS20210983',
  '인피니툼파트너스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 07 | 산업코드: 8 | 조성총액: 185.0억원',
  '2029-10-13',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20210983","mother_fund_id":"MF00000001","investment_character_code":"07","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"185.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.142Z"}',
  '2025-06-05T00:42:07.142Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 960: 인피니툼스포츠1호펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200206',
  '인피니툼스포츠1호펀드',
  14300000000,
  '2020-12-24',
  'Active',
  '인피니툼파트너스',
  'VCS_API_SCRAPER',
  'AS20200839',
  '인피니툼파트너스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 07 | 산업코드: 8 | 조성총액: 143.0억원',
  '2028-12-23',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20200839","mother_fund_id":"MF00000001","investment_character_code":"07","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"143.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.142Z"}',
  '2025-06-05T00:42:07.142Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 961: 인피니툼라이프스타일3호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200206',
  '인피니툼라이프스타일3호',
  2530000000,
  '2022-05-18',
  'Active',
  '인피니툼파트너스',
  'VCS_API_SCRAPER',
  'AS20220548',
  '인피니툼파트너스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 07 | 산업코드: 8 | 조성총액: 25.3억원',
  '2027-05-17',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20220548","mother_fund_id":"","investment_character_code":"07","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"25.3","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.142Z"}',
  '2025-06-05T00:42:07.142Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 962: 인피니툼관광혁신1호펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200206',
  '인피니툼관광혁신1호펀드',
  21500000000,
  '2023-11-10',
  'Active',
  '인피니툼파트너스',
  'VCS_API_SCRAPER',
  'AS20231067',
  '인피니툼파트너스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 10 | 산업코드: 7 | 조성총액: 215.0억원',
  '2031-11-09',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20231067","mother_fund_id":"MF00000001","investment_character_code":"10","industry_code":"7","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"215.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.142Z"}',
  '2025-06-05T00:42:07.142Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 963: 인피니툼-DSNP라이프스타일2호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200206',
  '인피니툼-DSNP라이프스타일2호',
  2000000000,
  '2023-07-31',
  'Active',
  '인피니툼파트너스',
  'VCS_API_SCRAPER',
  'AS20230656',
  '인피니툼파트너스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 25 | 산업코드: 8 | 조성총액: 20.0억원',
  '2028-07-30',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20230656","mother_fund_id":"","investment_character_code":"25","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"20.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.142Z"}',
  '2025-06-05T00:42:07.142Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 964: 인피니툼-DSNP라이프스타일1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20200206',
  '인피니툼-DSNP라이프스타일1호',
  3000000000,
  '2022-04-18',
  'Active',
  '인피니툼파트너스',
  'VCS_API_SCRAPER',
  'AS20220430',
  '인피니툼파트너스',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 02 | 산업코드: 9 | 조성총액: 30.0억원',
  '2027-04-17',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20220430","mother_fund_id":"","investment_character_code":"02","industry_code":"9","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"30.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.142Z"}',
  '2025-06-05T00:42:07.142Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 965: 인프라 뉴딜 조합 1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20180065',
  '인프라 뉴딜 조합 1호',
  110000000,
  '2021-07-14',
  'Active',
  '엔피프틴파트너스',
  'VCS_API_SCRAPER',
  'AS20210564',
  '엔피프틴파트너스',
  '산업코드: 2 | 조성총액: 1.1억원',
  '2028-03-31',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20210564","mother_fund_id":"","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"1.1","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.142Z"}',
  '2025-06-05T00:42:07.142Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 966: 인포뱅크-서울바이오허브 메디컬 개인투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP19950002',
  '인포뱅크-서울바이오허브 메디컬 개인투자조합 1호',
  1400000000,
  '2024-08-01',
  'Active',
  '인포뱅크',
  'VCS_API_SCRAPER',
  'AS20240695',
  '인포뱅크',
  '산업코드: 5 | 조성총액: 14.0억원',
  '2031-07-31',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20240695","mother_fund_id":"","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"14.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.142Z"}',
  '2025-06-05T00:42:07.142Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 967: 인포뱅크-대구창조경제혁신센터 개인투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP19950002',
  '인포뱅크-대구창조경제혁신센터 개인투자조합 1호',
  9400000000,
  '2023-12-13',
  'Active',
  '인포뱅크',
  'VCS_API_SCRAPER',
  'AS20231183',
  '인포뱅크',
  '산업코드: 2 | 조성총액: 94.0억원',
  '2030-12-12',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20231183","mother_fund_id":"MF00000021","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"94.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.142Z"}',
  '2025-06-05T00:42:07.142Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 968: 인포뱅크 핀테크혁신펀드 1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP19950002',
  '인포뱅크 핀테크혁신펀드 1호',
  10000000000,
  '2022-06-07',
  'Active',
  '인포뱅크',
  'VCS_API_SCRAPER',
  'AS20220637',
  '인포뱅크',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 20 | 산업코드: 2 | 조성총액: 100.0억원',
  '2029-06-06',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20220637","mother_fund_id":"","investment_character_code":"20","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"100.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.142Z"}',
  '2025-06-05T00:42:07.142Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 969: 인포뱅크 창업초기 혁신펀드 1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP19950002',
  '인포뱅크 창업초기 혁신펀드 1호',
  17500000000,
  '2022-08-08',
  'Active',
  '인포뱅크',
  'VCS_API_SCRAPER',
  'AS20220914',
  '인포뱅크',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 20 | 산업코드: 2 | 조성총액: 175.0억원',
  '2029-08-07',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20220914","mother_fund_id":"MF00000001","investment_character_code":"20","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"175.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.142Z"}',
  '2025-06-05T00:42:07.142Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 970: 인포뱅크 벤처이노베이션 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP19950002',
  '인포뱅크 벤처이노베이션 개인투자조합',
  1010000000,
  '2022-10-14',
  'Active',
  '인포뱅크',
  'VCS_API_SCRAPER',
  'AS20221123',
  '인포뱅크',
  '산업코드: 2 | 조성총액: 10.1억원',
  '2029-10-13',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20221123","mother_fund_id":"","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"10.1","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.142Z"}',
  '2025-06-05T00:42:07.142Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 971: 인포뱅크 바이오 개인투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP19950002',
  '인포뱅크 바이오 개인투자조합 1호',
  850000000,
  '2021-05-25',
  'Active',
  '인포뱅크',
  'VCS_API_SCRAPER',
  'AS20210380',
  '인포뱅크',
  '산업코드: 4 | 조성총액: 8.5억원',
  '2028-05-24',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20210380","mother_fund_id":"","investment_character_code":"","industry_code":"4","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"8.5","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.142Z"}',
  '2025-06-05T00:42:07.142Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 972: 인포뱅크 미래환경 혁신기술 펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP19950002',
  '인포뱅크 미래환경 혁신기술 펀드',
  5000000000,
  '2024-08-30',
  'Active',
  '인포뱅크',
  'VCS_API_SCRAPER',
  'AS20240849',
  '인포뱅크',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 05 | 산업코드: 8 | 조성총액: 50.0억원',
  '2031-08-29',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20240849","mother_fund_id":"MF00000001","investment_character_code":"05","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"50.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.142Z"}',
  '2025-06-05T00:42:07.142Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 973: 인포뱅크 메타버스 개인투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP19950002',
  '인포뱅크 메타버스 개인투자조합 1호',
  900000000,
  '2022-06-27',
  'Active',
  '인포뱅크',
  'VCS_API_SCRAPER',
  'AS20220656',
  '인포뱅크',
  '산업코드: 5 | 조성총액: 9.0억원',
  '2027-06-26',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20220656","mother_fund_id":"","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"9.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.142Z"}',
  '2025-06-05T00:42:07.142Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 974: 인포뱅크 개인투자조합 3호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP19950002',
  '인포뱅크 개인투자조합 3호',
  7000000000,
  '2021-08-27',
  'Active',
  '인포뱅크',
  'VCS_API_SCRAPER',
  'AS20210772',
  '인포뱅크',
  '산업코드: 2 | 조성총액: 70.0억원',
  '2028-08-27',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20210772","mother_fund_id":"MF00000001","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"70.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.142Z"}',
  '2025-06-05T00:42:07.142Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 975: 인포뱅크 개인투자조합 2호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP19950002',
  '인포뱅크 개인투자조합 2호',
  6000000000,
  '2020-05-26',
  'Active',
  '인포뱅크',
  'VCS_API_SCRAPER',
  'AS20200218',
  '인포뱅크',
  '산업코드: 8 | 조성총액: 60.0억원',
  '2027-05-25',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20200218","mother_fund_id":"MF00000001","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"60.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.142Z"}',
  '2025-06-05T00:42:07.142Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 976: 인포뱅크 개인투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP19950002',
  '인포뱅크 개인투자조합 1호',
  5000000000,
  '2019-08-13',
  'Active',
  '인포뱅크',
  'VCS_API_SCRAPER',
  'AS20190350',
  '인포뱅크',
  '산업코드: 2 | 조성총액: 50.0억원',
  '2026-08-11',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20190350","mother_fund_id":"MF00000008","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"50.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.142Z"}',
  '2025-06-05T00:42:07.142Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 977: 인포뱅크 SPAC 개인투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP19950002',
  '인포뱅크 SPAC 개인투자조합 1호',
  1370000000,
  '2022-05-13',
  'Active',
  '인포뱅크',
  'VCS_API_SCRAPER',
  'AS20220514',
  '인포뱅크',
  '산업코드: 2 | 조성총액: 13.7억원',
  '2027-05-12',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20220514","mother_fund_id":"","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"13.7","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.142Z"}',
  '2025-06-05T00:42:07.142Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 978: 인포뱅크 iAccel 개인투자조합 5호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP19950002',
  '인포뱅크 iAccel 개인투자조합 5호',
  1020000000,
  '2024-12-11',
  'Active',
  '인포뱅크',
  'VCS_API_SCRAPER',
  'AS20241269',
  '인포뱅크',
  '산업코드: 8 | 조성총액: 10.2억원',
  '2031-12-10',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20241269","mother_fund_id":"","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"10.2","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.142Z"}',
  '2025-06-05T00:42:07.142Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 979: 인포뱅크 iAccel 개인투자조합 4호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP19950002',
  '인포뱅크 iAccel 개인투자조합 4호',
  540000000,
  '2023-07-18',
  'Active',
  '인포뱅크',
  'VCS_API_SCRAPER',
  'AS20230582',
  '인포뱅크',
  '산업코드: 5 | 조성총액: 5.4억원',
  '2028-07-17',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20230582","mother_fund_id":"","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"5.4","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.142Z"}',
  '2025-06-05T00:42:07.142Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 980: 인포뱅크 iAccel 개인투자조합 3호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP19950002',
  '인포뱅크 iAccel 개인투자조합 3호',
  400000000,
  '2023-04-11',
  'Active',
  '인포뱅크',
  'VCS_API_SCRAPER',
  'AS20230245',
  '인포뱅크',
  '산업코드: 2 | 조성총액: 4.0억원',
  '2028-04-10',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20230245","mother_fund_id":"","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"4.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.142Z"}',
  '2025-06-05T00:42:07.142Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 981: 인포뱅크 iAccel 개인투자조합 2호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP19950002',
  '인포뱅크 iAccel 개인투자조합 2호',
  880000000,
  '2022-10-21',
  'Active',
  '인포뱅크',
  'VCS_API_SCRAPER',
  'AS20221092',
  '인포뱅크',
  '산업코드: 2 | 조성총액: 8.8억원',
  '2027-10-20',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20221092","mother_fund_id":"","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"8.8","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.142Z"}',
  '2025-06-05T00:42:07.142Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 982: 인포뱅크 iAccel 개인투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP19950002',
  '인포뱅크 iAccel 개인투자조합 1호',
  1990000000,
  '2022-03-04',
  'Active',
  '인포뱅크',
  'VCS_API_SCRAPER',
  'AS20220207',
  '인포뱅크',
  '산업코드: 8 | 조성총액: 19.9억원',
  '2028-03-03',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20220207","mother_fund_id":"","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"19.9","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.142Z"}',
  '2025-06-05T00:42:07.142Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 983: 인포뱅크 ESG 개인투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP19950002',
  '인포뱅크 ESG 개인투자조합 1호',
  1300000000,
  '2021-10-18',
  'Active',
  '인포뱅크',
  'VCS_API_SCRAPER',
  'AS20210981',
  '인포뱅크',
  '산업코드: 5 | 조성총액: 13.0억원',
  '2026-10-17',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20210981","mother_fund_id":"","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"13.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.142Z"}',
  '2025-06-05T00:42:07.142Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 984: 인트윈 로켓 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20210573',
  '인트윈 로켓 투자조합',
  200000000,
  '2022-12-28',
  'Active',
  '인트윈벤쳐스',
  'VCS_API_SCRAPER',
  'AS20221534',
  '인트윈벤쳐스',
  '산업코드: 2 | 조성총액: 2.0억원',
  '2027-12-27',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20221534","mother_fund_id":"","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"2.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.142Z"}',
  '2025-06-05T00:42:07.142Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 985: 인트로매그나 제4호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20170051',
  '인트로매그나 제4호 투자조합',
  170000000,
  '2022-03-29',
  'Active',
  '인트로매그나',
  'VCS_API_SCRAPER',
  'AS20220351',
  '인트로매그나',
  '산업코드: 8 | 조성총액: 1.7억원',
  '2027-04-30',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20220351","mother_fund_id":"","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"1.7","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.142Z"}',
  '2025-06-05T00:42:07.142Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 986: 인트로매그나 제3호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20170051',
  '인트로매그나 제3호 투자조합',
  210000000,
  '2021-12-21',
  'Active',
  '인트로매그나',
  'VCS_API_SCRAPER',
  'AS20211352',
  '인트로매그나',
  '산업코드: 2 | 조성총액: 2.1억원',
  '2026-12-20',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20211352","mother_fund_id":"","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"2.1","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.142Z"}',
  '2025-06-05T00:42:07.142Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 987: 인트로매그나 제2호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20170051',
  '인트로매그나 제2호 투자조합',
  310000000,
  '2021-10-20',
  'Active',
  '인트로매그나',
  'VCS_API_SCRAPER',
  'AS20210960',
  '인트로매그나',
  '산업코드: 4 | 조성총액: 3.1억원',
  '2026-10-31',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20210960","mother_fund_id":"","investment_character_code":"","industry_code":"4","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"3.1","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.142Z"}',
  '2025-06-05T00:42:07.142Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 988: 인트로매그나 제1호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP20170051',
  '인트로매그나 제1호 투자조합',
  600000000,
  '2020-07-22',
  'Active',
  '인트로매그나',
  'VCS_API_SCRAPER',
  'AS20200341',
  '인트로매그나',
  '산업코드: 8 | 조성총액: 6.0억원',
  '2025-08-31',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20200341","mother_fund_id":"","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","formation_total_amount":"6.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.142Z"}',
  '2025-06-05T00:42:07.142Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 989: 인터베스트청년창업투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP19990013',
  '인터베스트청년창업투자조합',
  55000000000,
  '2022-02-11',
  'Active',
  '인터베스트',
  'VCS_API_SCRAPER',
  'AS20220134',
  '인터베스트',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 21 | 산업코드: 2 | 조성총액: 550.0억원',
  '2030-02-10',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20220134","mother_fund_id":"MF00000001","investment_character_code":"21","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"550.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.143Z"}',
  '2025-06-05T00:42:07.143Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 990: 인터베스트바이오전문투자조합(한국모태펀드05-01)
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP19990013',
  '인터베스트바이오전문투자조합(한국모태펀드05-01)',
  28000000000,
  '2005-10-21',
  'Active',
  '인터베스트',
  'VCS_API_SCRAPER',
  'AS20050013',
  '인터베스트',
  '투자분야: 일반 | 세부분야: 바이오 | 투자성격코드: 04 | 산업코드: 5 | 조성총액: 280.0억원',
  '2025-09-30',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20050013","mother_fund_id":"MF00000001","investment_character_code":"04","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"바이오","formation_total_amount":"280.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.143Z"}',
  '2025-06-05T00:42:07.143Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 991: 인터베스트말레이시아OIF A
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP19990013',
  '인터베스트말레이시아OIF A',
  52000000000,
  '2024-09-05',
  'Active',
  '인터베스트',
  'VCS_API_SCRAPER',
  'AS20240873',
  '인터베스트',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 15 | 산업코드: 1 | 조성총액: 520.0억원',
  '2034-09-04',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20240873","mother_fund_id":"","investment_character_code":"15","industry_code":"1","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"520.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.143Z"}',
  '2025-06-05T00:42:07.143Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 992: 인터베스트딥테크투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP19990013',
  '인터베스트딥테크투자조합',
  312200000000,
  '2022-12-09',
  'Active',
  '인터베스트',
  'VCS_API_SCRAPER',
  'AS20221448',
  '인터베스트',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 02 | 산업코드: 5 | 조성총액: 3122.0억원',
  '2030-12-08',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20221448","mother_fund_id":"","investment_character_code":"02","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"3122.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.143Z"}',
  '2025-06-05T00:42:07.143Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 993: 인터베스트넥스트G-펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP19990013',
  '인터베스트넥스트G-펀드',
  55000000000,
  '2023-12-21',
  'Active',
  '인터베스트',
  'VCS_API_SCRAPER',
  'AS20231326',
  '인터베스트',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 20 | 산업코드: 1 | 조성총액: 550.0억원',
  '2030-12-20',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20231326","mother_fund_id":"MF00000001","investment_character_code":"20","industry_code":"1","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"550.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.143Z"}',
  '2025-06-05T00:42:07.143Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 994: 인터베스트글로벌스케일업펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP19990013',
  '인터베스트글로벌스케일업펀드',
  60000000000,
  '2021-07-19',
  'Active',
  '인터베스트',
  'VCS_API_SCRAPER',
  'AS20210615',
  '인터베스트',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 08 | 산업코드: 2 | 조성총액: 600.0억원',
  '2031-07-18',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20210615","mother_fund_id":"","investment_character_code":"08","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"600.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.143Z"}',
  '2025-06-05T00:42:07.143Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 995: 인터베스트그로스세컨더리펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP19990013',
  '인터베스트그로스세컨더리펀드',
  101400000000,
  '2020-12-24',
  'Active',
  '인터베스트',
  'VCS_API_SCRAPER',
  'AS20200842',
  '인터베스트',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 16 | 산업코드: 2 | 조성총액: 1014.0억원',
  '2028-12-23',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20200842","mother_fund_id":"","investment_character_code":"16","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"1014.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.143Z"}',
  '2025-06-05T00:42:07.143Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 996: 인터베스트WEB3투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP19990013',
  '인터베스트WEB3투자조합',
  20000000000,
  '2022-06-03',
  'Active',
  '인터베스트',
  'VCS_API_SCRAPER',
  'AS20220634',
  '인터베스트',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 06 | 산업코드: 2 | 조성총액: 200.0억원',
  '2030-06-02',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20220634","mother_fund_id":"","investment_character_code":"06","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"200.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.143Z"}',
  '2025-06-05T00:42:07.143Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 997: 인터베스트4차산업혁명투자조합Ⅱ
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP19990013',
  '인터베스트4차산업혁명투자조합Ⅱ',
  158500000000,
  '2018-12-28',
  'Active',
  '인터베스트',
  'VCS_API_SCRAPER',
  'AS20190012',
  '인터베스트',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 02 | 산업코드: 5 | 조성총액: 1585.0억원',
  '2026-12-27',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20190012","mother_fund_id":"MF00000001","investment_character_code":"02","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"1585.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.143Z"}',
  '2025-06-05T00:42:07.143Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 998: 인터베스트4차산업혁명투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP19990013',
  '인터베스트4차산업혁명투자조합',
  110000000000,
  '2017-12-29',
  'Active',
  '인터베스트',
  'VCS_API_SCRAPER',
  'AS20180036',
  '인터베스트',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 02 | 산업코드: 5 | 조성총액: 1100.0억원',
  '2025-12-28',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20180036","mother_fund_id":"MF00000001","investment_character_code":"02","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"1100.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.143Z"}',
  '2025-06-05T00:42:07.143Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 999: 인터베스트 크로스보더 바이오 벤처투자조합 2호
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP19990013',
  '인터베스트 크로스보더 바이오 벤처투자조합 2호',
  16700000000,
  '2021-12-08',
  'Active',
  '인터베스트',
  'VCS_API_SCRAPER',
  'AS20211249',
  '인터베스트',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 04 | 산업코드: 5 | 조성총액: 167.0억원',
  '2026-12-07',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20211249","mother_fund_id":"","investment_character_code":"04","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"167.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.143Z"}',
  '2025-06-05T00:42:07.143Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 1000: 인터베스트 창업초기 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_size, establishment_date, fund_status,
  representative, apify_source, fund_id, company_name, investment_detail,
  expiry_date, notes, import_date
) VALUES (
  'OP19990013',
  '인터베스트 창업초기 투자조합',
  38000000000,
  '2020-10-06',
  'Active',
  '인터베스트',
  'VCS_API_SCRAPER',
  'AS20200550',
  '인터베스트',
  '투자분야: 일반 | 세부분야: 중소/벤처일반 | 투자성격코드: 20 | 산업코드: 2 | 조성총액: 380.0억원',
  '2028-10-05',
  '{"fund_type":"VCS Registered Fund","vcs_fund_id":"AS20200550","mother_fund_id":"MF00000001","investment_character_code":"20","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","formation_total_amount":"380.0","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:42:07.143Z"}',
  '2025-06-05T00:42:07.143Z'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  apify_source = EXCLUDED.apify_source,
  fund_id = EXCLUDED.fund_id,
  company_name = EXCLUDED.company_name,
  investment_detail = EXCLUDED.investment_detail,
  expiry_date = EXCLUDED.expiry_date,
  notes = EXCLUDED.notes,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Exact Batch 20 completed! 50 fund records processed.
-- Progress: 1000/3689 total records

