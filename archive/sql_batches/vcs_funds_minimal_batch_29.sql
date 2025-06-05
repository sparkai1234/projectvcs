-- VCS Fund MINIMAL UPSERT Batch 29/74 (Records 1401-1450)
-- MINIMAL: Only using basic columns that definitely exist
-- Generated from VCS API Scraper fund data
-- Generated at: 2025-06-05T00:40:21.828Z
-- Schema: Minimal fund_table structure (basic columns only)

-- MINIMAL FUND DATA (UPSERT - Safe for Duplicates)
-- Processing 50 fund records
-- Will INSERT new records or UPDATE existing ones

-- Record 1401: 엠에스브이 엠앤에이 투자조합 제1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210105',
  '엠에스브이 엠앤에이 투자조합 제1호',
  3900000000,
  '2024-05-01',
  '{"fund_id":"AS20240375","registration_date":"2024-05-01","expiry_date":"2029-04-30","formation_total_amount":"39.0","investment_character_code":"17","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20210105","operator_company_name":"메인스트리트벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"메인스트리트벤처스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.828Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1402: 엠에스브이 브랜드 글로벌화 제1호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210105',
  '엠에스브이 브랜드 글로벌화 제1호 투자조합',
  31500000000,
  '2024-07-10',
  '{"fund_id":"AS20240632","registration_date":"2024-07-10","expiry_date":"2031-07-09","formation_total_amount":"315.0","investment_character_code":"01","industry_code":"7","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20210105","operator_company_name":"메인스트리트벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"메인스트리트벤처스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.828Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1403: 엠에스 티원 라이프스타일 펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210105',
  '엠에스 티원 라이프스타일 펀드',
  10110000000,
  '2022-03-18',
  '{"fund_id":"AS20220314","registration_date":"2022-03-18","expiry_date":"2027-03-17","formation_total_amount":"101.1","investment_character_code":"20","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20210105","operator_company_name":"메인스트리트벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"메인스트리트벤처스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.828Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1404: 엠아이피(MIP)컬처테크융합투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20080012',
  '엠아이피(MIP)컬처테크융합투자조합',
  25500000000,
  '2023-11-13',
  '{"fund_id":"AS20231069","registration_date":"2023-11-13","expiry_date":"2031-11-12","formation_total_amount":"255.0","investment_character_code":"24","industry_code":"6","investment_field_type":"문화","investment_field_detail_type":"문화 기타","mother_fund_id":"MF00000001","operator_company_id":"OP20080012","operator_company_name":"메이플투자파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"메이플투자파트너스","investment_focus":["문화 기타","문화"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.828Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1405: 엠아이피(MIP)글로벌콘텐츠투자조합2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20080012',
  '엠아이피(MIP)글로벌콘텐츠투자조합2호',
  10500000000,
  '2021-07-26',
  '{"fund_id":"AS20210637","registration_date":"2021-07-26","expiry_date":"2026-07-25","formation_total_amount":"105.0","investment_character_code":"25","industry_code":"6","investment_field_type":"문화","investment_field_detail_type":"문화 기타","mother_fund_id":"","operator_company_id":"OP20080012","operator_company_name":"메이플투자파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"메이플투자파트너스","investment_focus":["문화 기타","문화"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.828Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1406: 엠아이피(MIP) 혁신M&A 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20080012',
  '엠아이피(MIP) 혁신M&A 투자조합',
  50000000000,
  '2022-01-14',
  '{"fund_id":"AS20220056","registration_date":"2022-01-14","expiry_date":"2030-01-13","formation_total_amount":"500.0","investment_character_code":"17","industry_code":"4","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20080012","operator_company_name":"메이플투자파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"메이플투자파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.828Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1407: 엠아이피 제7호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210593',
  '엠아이피 제7호 개인투자조합',
  210000000,
  '2025-02-13',
  '{"fund_id":"AS20250090","registration_date":"2025-02-13","expiry_date":"2030-02-12","formation_total_amount":"2.1","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20210593","operator_company_name":"메디이노파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"메디이노파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.828Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1408: 엠아이피 제5호 세나투스 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210593',
  '엠아이피 제5호 세나투스 개인투자조합',
  570000000,
  '2024-12-24',
  '{"fund_id":"AS20241363","registration_date":"2024-12-24","expiry_date":"2029-12-23","formation_total_amount":"5.7","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20210593","operator_company_name":"메디이노파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"메디이노파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.828Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1409: 엠아이피 제3호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210593',
  '엠아이피 제3호 개인투자조합',
  400000000,
  '2024-10-08',
  '{"fund_id":"AS20240921","registration_date":"2024-10-08","expiry_date":"2029-10-07","formation_total_amount":"4.0","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20210593","operator_company_name":"메디이노파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"메디이노파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.828Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1410: 엠아이피 제2호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210593',
  '엠아이피 제2호 개인투자조합',
  510000000,
  '2023-12-14',
  '{"fund_id":"AS20231225","registration_date":"2023-12-14","expiry_date":"2028-12-13","formation_total_amount":"5.1","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20210593","operator_company_name":"메디이노파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"메디이노파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.828Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1411: 엠아이피 제1호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210593',
  '엠아이피 제1호 개인투자조합',
  900000000,
  '2023-12-06',
  '{"fund_id":"AS20231191","registration_date":"2023-12-06","expiry_date":"2028-12-05","formation_total_amount":"9.0","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20210593","operator_company_name":"메디이노파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"메디이노파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.828Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1412: 엠-소재부품장비1호투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19860003',
  '엠-소재부품장비1호투자조합',
  10000000000,
  '2021-09-29',
  '{"fund_id":"AS20210928","registration_date":"2021-09-29","expiry_date":"2026-09-28","formation_total_amount":"100.0","investment_character_code":"02","industry_code":"1","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP19860003","operator_company_name":"엠벤처투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"엠벤처투자","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.828Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1413: 엘케이위드스타트업
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190222',
  '엘케이위드스타트업',
  100000000,
  '2019-09-27',
  '{"fund_id":"AS20190428","registration_date":"2019-09-27","expiry_date":"2029-09-26","formation_total_amount":"1.0","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190222","operator_company_name":"엘케이경영연구원","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"엘케이경영연구원","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.828Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1414: 엘지유플러스 블루포인트 에이엑스 쉬프트 벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20140008',
  '엘지유플러스 블루포인트 에이엑스 쉬프트 벤처투자조합',
  5000000000,
  '2025-03-20',
  '{"fund_id":"AS20250207","registration_date":"2025-03-20","expiry_date":"2033-03-19","formation_total_amount":"50.0","investment_character_code":"28","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20140008","operator_company_name":"블루포인트파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"블루포인트파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.828Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1415: 엘지생활건강-인포뱅크 뷰티테크 벨류업 벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19950002',
  '엘지생활건강-인포뱅크 뷰티테크 벨류업 벤처투자조합',
  2200000000,
  '2025-01-10',
  '{"fund_id":"AS20250036","registration_date":"2025-01-10","expiry_date":"2032-01-09","formation_total_amount":"22.0","investment_character_code":"04","industry_code":"9","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP19950002","operator_company_name":"인포뱅크","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"인포뱅크","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.829Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1416: 엘에이치-MY신성장밸류업펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20170010',
  '엘에이치-MY신성장밸류업펀드',
  5000000000,
  '2021-10-08',
  '{"fund_id":"AS20210969","registration_date":"2021-10-08","expiry_date":"2027-10-07","formation_total_amount":"50.0","investment_character_code":"02","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20170010","operator_company_name":"라이트하우스컴바인인베스트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"라이트하우스컴바인인베스트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.829Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1417: 엘에스케이 헬스케어 5호 펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20160010',
  '엘에스케이 헬스케어 5호 펀드',
  46000000000,
  '2022-12-23',
  '{"fund_id":"AS20221540","registration_date":"2022-12-23","expiry_date":"2030-12-22","formation_total_amount":"460.0","investment_character_code":"04","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"바이오","mother_fund_id":"MF00000001","operator_company_id":"OP20160010","operator_company_name":"엘에스케이인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"엘에스케이인베스트먼트","investment_focus":["바이오","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.829Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1418: 엘에스케이 헬스케어 4호 펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20160010',
  '엘에스케이 헬스케어 4호 펀드',
  17500000000,
  '2022-01-24',
  '{"fund_id":"AS20220086","registration_date":"2022-01-24","expiry_date":"2027-01-23","formation_total_amount":"175.0","investment_character_code":"04","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20160010","operator_company_name":"엘에스케이인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"엘에스케이인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.829Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1419: 엘앤에스-리 글로벌 고성장 혁신펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20220231',
  '엘앤에스-리 글로벌 고성장 혁신펀드',
  56000000000,
  '2024-03-27',
  '{"fund_id":"AS20240224","registration_date":"2024-03-27","expiry_date":"2034-03-26","formation_total_amount":"560.0","investment_character_code":"03","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20220231","operator_company_name":"리인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"리인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.829Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1420: 엘앤에스 헬스케어 1호 벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20060007',
  '엘앤에스 헬스케어 1호 벤처투자조합',
  2300000000,
  '2024-11-12',
  '{"fund_id":"AS20241121","registration_date":"2024-11-12","expiry_date":"2029-11-11","formation_total_amount":"23.0","investment_character_code":"25","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"일반 기타","mother_fund_id":"","operator_company_id":"OP20060007","operator_company_name":"엘앤에스벤처캐피탈","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"엘앤에스벤처캐피탈","investment_focus":["일반 기타","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.829Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1421: 엘앤에스 지디 청년창업 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20060007',
  '엘앤에스 지디 청년창업 투자조합',
  30000000000,
  '2014-02-20',
  '{"fund_id":"AS20140016","registration_date":"2014-02-20","expiry_date":"2026-02-19","formation_total_amount":"300.0","investment_character_code":"20","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20060007","operator_company_name":"엘앤에스벤처캐피탈","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"엘앤에스벤처캐피탈","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.829Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1422: 엘앤에스 아이씨티 밸류업 3호 세컨더리 벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20060007',
  '엘앤에스 아이씨티 밸류업 3호 세컨더리 벤처투자조합',
  5600000000,
  '2022-08-23',
  '{"fund_id":"AS20220987","registration_date":"2022-08-23","expiry_date":"2027-08-22","formation_total_amount":"56.0","investment_character_code":"06","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20060007","operator_company_name":"엘앤에스벤처캐피탈","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"엘앤에스벤처캐피탈","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.829Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1423: 엘앤에스 아이씨티 밸류업 2호 세컨더리 벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20060007',
  '엘앤에스 아이씨티 밸류업 2호 세컨더리 벤처투자조합',
  19000000000,
  '2022-03-14',
  '{"fund_id":"AS20220293","registration_date":"2022-03-14","expiry_date":"2027-03-13","formation_total_amount":"190.0","investment_character_code":"16","industry_code":"9","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20060007","operator_company_name":"엘앤에스벤처캐피탈","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"엘앤에스벤처캐피탈","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.829Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1424: 엘앤에스 아이씨티 밸류업 2-1호 벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20060007',
  '엘앤에스 아이씨티 밸류업 2-1호 벤처투자조합',
  7500000000,
  '2022-08-23',
  '{"fund_id":"AS20220981","registration_date":"2022-08-23","expiry_date":"2027-08-22","formation_total_amount":"75.0","investment_character_code":"25","industry_code":"9","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20060007","operator_company_name":"엘앤에스벤처캐피탈","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"엘앤에스벤처캐피탈","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.829Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1425: 엘앤에스 신성장동력 Global Star 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20060007',
  '엘앤에스 신성장동력 Global Star 투자조합',
  52500000000,
  '2015-08-21',
  '{"fund_id":"AS20150049","registration_date":"2015-08-21","expiry_date":"2025-08-20","formation_total_amount":"525.0","investment_character_code":"27","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"신성장","mother_fund_id":"MF00000001","operator_company_id":"OP20060007","operator_company_name":"엘앤에스벤처캐피탈","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"엘앤에스벤처캐피탈","investment_focus":["신성장","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.829Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1426: 엘앤에스 시스템반도체 상생 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20060007',
  '엘앤에스 시스템반도체 상생 투자조합',
  30000000000,
  '2021-10-26',
  '{"fund_id":"AS20211028","registration_date":"2021-10-26","expiry_date":"2031-10-25","formation_total_amount":"300.0","investment_character_code":"03","industry_code":"1","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20060007","operator_company_name":"엘앤에스벤처캐피탈","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"엘앤에스벤처캐피탈","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.829Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1427: 엘앤에스 소부장 혁신기업 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20060007',
  '엘앤에스 소부장 혁신기업 투자조합',
  30000000000,
  '2021-06-11',
  '{"fund_id":"AS20210471","registration_date":"2021-06-11","expiry_date":"2029-06-10","formation_total_amount":"300.0","investment_character_code":"03","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20060007","operator_company_name":"엘앤에스벤처캐피탈","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"엘앤에스벤처캐피탈","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.829Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1428: 엘앤에스 글로벌 반도체성장 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20060007',
  '엘앤에스 글로벌 반도체성장 투자조합',
  60000000000,
  '2018-02-23',
  '{"fund_id":"AS20180136","registration_date":"2018-02-23","expiry_date":"2026-02-22","formation_total_amount":"600.0","investment_character_code":"06","industry_code":"1","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20060007","operator_company_name":"엘앤에스벤처캐피탈","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"엘앤에스벤처캐피탈","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.829Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1429: 엘앤에스 EarlyStageIV ICT 소부장 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20060007',
  '엘앤에스 EarlyStageIV ICT 소부장 투자조합',
  45000000000,
  '2023-01-11',
  '{"fund_id":"AS20230042","registration_date":"2023-01-11","expiry_date":"2031-01-10","formation_total_amount":"450.0","investment_character_code":"03","industry_code":"1","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20060007","operator_company_name":"엘앤에스벤처캐피탈","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"엘앤에스벤처캐피탈","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.829Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1430: 엘앤에스 7호 동남권 상생 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20060007',
  '엘앤에스 7호 동남권 상생 투자조합',
  9660000000,
  '2014-11-03',
  '{"fund_id":"AS20140044","registration_date":"2014-11-03","expiry_date":"2025-11-02","formation_total_amount":"96.6","investment_character_code":"18","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20060007","operator_company_name":"엘앤에스벤처캐피탈","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"엘앤에스벤처캐피탈","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.829Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1431: 엘앤에스 10호 Early Stage III 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20060007',
  '엘앤에스 10호 Early Stage III 투자조합',
  20500000000,
  '2019-11-11',
  '{"fund_id":"AS20190515","registration_date":"2019-11-11","expiry_date":"2027-11-10","formation_total_amount":"205.0","investment_character_code":"20","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20060007","operator_company_name":"엘앤에스벤처캐피탈","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"엘앤에스벤처캐피탈","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.829Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1432: 엘스톤투자조합4호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20010009',
  '엘스톤투자조합4호',
  100000000,
  '2021-04-30',
  '{"fund_id":"AS20210344","registration_date":"2021-04-30","expiry_date":"2026-04-29","formation_total_amount":"1.0","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20010009","operator_company_name":"엘스톤","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"엘스톤","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.829Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1433: 엘스톤투자조합2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20010009',
  '엘스톤투자조합2호',
  150000000,
  '2020-08-28',
  '{"fund_id":"AS20200450","registration_date":"2020-08-28","expiry_date":"2025-08-27","formation_total_amount":"1.5","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20010009","operator_company_name":"엘스톤","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"엘스톤","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.829Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1434: 엘스톤부산투자조합3호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20010009',
  '엘스톤부산투자조합3호',
  150000000,
  '2020-08-25',
  '{"fund_id":"AS20200441","registration_date":"2020-08-25","expiry_date":"2025-08-24","formation_total_amount":"1.5","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20010009","operator_company_name":"엘스톤","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"엘스톤","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.829Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1435: 엘비혁신성장펀드Ⅱ
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19960002',
  '엘비혁신성장펀드Ⅱ',
  280300000000,
  '2022-12-16',
  '{"fund_id":"AS20221496","registration_date":"2022-12-16","expiry_date":"2030-12-15","formation_total_amount":"2803.0","investment_character_code":"02","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP19960002","operator_company_name":"엘비인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"엘비인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.829Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1436: 엘비넥스트이노베이션펀드1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19960002',
  '엘비넥스트이노베이션펀드1호',
  43820000000,
  '2022-03-31',
  '{"fund_id":"AS20220359","registration_date":"2022-03-31","expiry_date":"2029-12-17","formation_total_amount":"438.2","investment_character_code":"16","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP19960002","operator_company_name":"엘비인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"엘비인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.829Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1437: 엔피혁신성장팔로우온제4호개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20160026',
  '엔피혁신성장팔로우온제4호개인투자조합',
  2700000000,
  '2020-12-09',
  '{"fund_id":"AS20200731","registration_date":"2020-12-09","expiry_date":"2025-12-31","formation_total_amount":"27.0","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20160026","operator_company_name":"뉴패러다임인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"뉴패러다임인베스트먼트","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.829Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1438: 엔피프틴파트너스AI펀드1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20180065',
  '엔피프틴파트너스AI펀드1호',
  100000000,
  '2020-07-29',
  '{"fund_id":"AS20200360","registration_date":"2020-07-29","expiry_date":"2027-03-31","formation_total_amount":"1.0","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20180065","operator_company_name":"엔피프틴파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"엔피프틴파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.829Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1439: 엔피프틴파트너스 이커머스 투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20180065',
  '엔피프틴파트너스 이커머스 투자조합 1호',
  100000000,
  '2023-02-06',
  '{"fund_id":"AS20230069","registration_date":"2023-02-06","expiry_date":"2028-06-01","formation_total_amount":"1.0","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20180065","operator_company_name":"엔피프틴파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"엔피프틴파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.829Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1440: 엔피프틴파트너스 이노베이션 투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20180065',
  '엔피프틴파트너스 이노베이션 투자조합 1호',
  100000000,
  '2022-07-06',
  '{"fund_id":"AS20220724","registration_date":"2022-07-06","expiry_date":"2028-03-31","formation_total_amount":"1.0","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20180065","operator_company_name":"엔피프틴파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"엔피프틴파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.829Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1441: 엔피프틴파트너스 모빌리티 이노베이션 투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20180065',
  '엔피프틴파트너스 모빌리티 이노베이션 투자조합 1호',
  100000000,
  '2022-06-27',
  '{"fund_id":"AS20220686","registration_date":"2022-06-27","expiry_date":"2028-03-31","formation_total_amount":"1.0","investment_character_code":"","industry_code":"3","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20180065","operator_company_name":"엔피프틴파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"엔피프틴파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.829Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1442: 엔피프틴 파트너스 벤처펀드 1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20180065',
  '엔피프틴 파트너스 벤처펀드 1호',
  200000000,
  '2019-03-26',
  '{"fund_id":"AS20190132","registration_date":"2019-03-26","expiry_date":"2029-03-31","formation_total_amount":"2.0","investment_character_code":"","industry_code":"9","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20180065","operator_company_name":"엔피프틴파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"엔피프틴파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.829Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1443: 엔케이에스-1호 벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20230004',
  '엔케이에스-1호 벤처투자조합',
  2380000000,
  '2023-09-14',
  '{"fund_id":"AS20230820","registration_date":"2023-09-14","expiry_date":"2028-09-13","formation_total_amount":"23.8","investment_character_code":"24","industry_code":"6","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20230004","operator_company_name":"엔케이에스인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"엔케이에스인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.829Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1444: 엔젤넷(ANGELNET) 10호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200492',
  '엔젤넷(ANGELNET) 10호 개인투자조합',
  310000000,
  '2021-03-24',
  '{"fund_id":"AS20210214","registration_date":"2021-03-24","expiry_date":"2026-03-23","formation_total_amount":"3.1","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200492","operator_company_name":"리벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"리벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.829Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1445: 엔젤 모펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20000029',
  '엔젤 모펀드',
  73950000000,
  '2015-11-18',
  '{"fund_id":"AS20150075","registration_date":"2015-11-18","expiry_date":"2035-11-17","formation_total_amount":"739.5","investment_character_code":"20","industry_code":"9","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20000029","operator_company_name":"한국벤처투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"한국벤처투자","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.829Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1446: 엔에이치-디엑스오픈이노베이션펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190174',
  '엔에이치-디엑스오픈이노베이션펀드',
  23000000000,
  '2022-07-01',
  '{"fund_id":"AS20220728","registration_date":"2022-07-01","expiry_date":"2029-06-30","formation_total_amount":"230.0","investment_character_code":"02","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20190174","operator_company_name":"위벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"위벤처스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.829Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1447: 엔에이치 소풍 청년 그로우 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190413',
  '엔에이치 소풍 청년 그로우 투자조합',
  8000000000,
  '2025-01-09',
  '{"fund_id":"AS20250025","registration_date":"2025-01-09","expiry_date":"2033-01-08","formation_total_amount":"80.0","investment_character_code":"04","industry_code":"9","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20190413","operator_company_name":"소풍벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"소풍벤처스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.829Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1448: 엔슬청년창업펀드 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20160031',
  '엔슬청년창업펀드 개인투자조합',
  3000000000,
  '2018-12-10',
  '{"fund_id":"AS20180355","registration_date":"2018-12-10","expiry_date":"2025-12-09","formation_total_amount":"30.0","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"MF00000008","operator_company_id":"OP20160031","operator_company_name":"엔슬파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"엔슬파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.829Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1449: 엔슬5호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20160031',
  '엔슬5호 개인투자조합',
  180000000,
  '2021-03-19',
  '{"fund_id":"AS20210188","registration_date":"2021-03-19","expiry_date":"2028-03-18","formation_total_amount":"1.8","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20160031","operator_company_name":"엔슬파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"엔슬파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.829Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1450: 엔슬-콴티파이 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20160031',
  '엔슬-콴티파이 개인투자조합',
  520000000,
  '2024-07-10',
  '{"fund_id":"AS20240598","registration_date":"2024-07-10","expiry_date":"2031-07-09","formation_total_amount":"5.2","investment_character_code":"","industry_code":"6","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20160031","operator_company_name":"엔슬파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"엔슬파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.829Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Minimal Batch 29 completed! 50 fund records processed.
-- Progress: 1450/3689 total records

