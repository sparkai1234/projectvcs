-- VCS Fund MINIMAL UPSERT Batch 21/74 (Records 1001-1050)
-- MINIMAL: Only using basic columns that definitely exist
-- Generated from VCS API Scraper fund data
-- Generated at: 2025-06-05T00:40:21.794Z
-- Schema: Minimal fund_table structure (basic columns only)

-- MINIMAL FUND DATA (UPSERT - Safe for Duplicates)
-- Processing 50 fund records
-- Will INSERT new records or UPDATE existing ones

-- Record 1001: 인터베스트 신성장투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19990013',
  '인터베스트 신성장투자조합',
  100000000000,
  '2009-04-28',
  '{"fund_id":"AS20090022","registration_date":"2009-04-28","expiry_date":"2025-09-30","formation_total_amount":"1000.0","investment_character_code":"17","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP19990013","operator_company_name":"인터베스트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"인터베스트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.794Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1002: 인터밸류7호 KGrowth-경기 규제샌드박스 스타트업 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20160019',
  '인터밸류7호 KGrowth-경기 규제샌드박스 스타트업 투자조합',
  17500000000,
  '2024-07-02',
  '{"fund_id":"AS20240591","registration_date":"2024-07-02","expiry_date":"2032-07-01","formation_total_amount":"175.0","investment_character_code":"30","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20160019","operator_company_name":"인터밸류파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"인터밸류파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.795Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1003: 인터밸류6호 특허기술사업화 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20160019',
  '인터밸류6호 특허기술사업화 투자조합',
  21500000000,
  '2024-02-14',
  '{"fund_id":"AS20240096","registration_date":"2024-02-14","expiry_date":"2032-02-13","formation_total_amount":"215.0","investment_character_code":"09","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20160019","operator_company_name":"인터밸류파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"인터밸류파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.795Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1004: 인터밸류5호 Next Unicorn 청년창업 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20160019',
  '인터밸류5호 Next Unicorn 청년창업 투자조합',
  33200000000,
  '2021-12-27',
  '{"fund_id":"AS20211421","registration_date":"2021-12-27","expiry_date":"2027-12-26","formation_total_amount":"332.0","investment_character_code":"21","industry_code":"1","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20160019","operator_company_name":"인터밸류파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"인터밸류파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.795Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1005: 인터밸류3호 혁신창업 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20160019',
  '인터밸류3호 혁신창업 투자조합',
  20000000000,
  '2019-07-26',
  '{"fund_id":"AS20190308","registration_date":"2019-07-26","expiry_date":"2027-07-25","formation_total_amount":"200.0","investment_character_code":"20","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20160019","operator_company_name":"인터밸류파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"인터밸류파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.795Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1006: 인터밸류2호 혁신창업 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20160019',
  '인터밸류2호 혁신창업 투자조합',
  20000000000,
  '2018-08-16',
  '{"fund_id":"AS20180202","registration_date":"2018-08-16","expiry_date":"2026-08-15","formation_total_amount":"200.0","investment_character_code":"20","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20160019","operator_company_name":"인터밸류파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"인터밸류파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.795Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1007: 인터밸류 첨단 반도체 팹리스 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20160019',
  '인터밸류 첨단 반도체 팹리스 투자조합',
  2350000000,
  '2022-09-19',
  '{"fund_id":"AS20221071","registration_date":"2022-09-19","expiry_date":"2027-09-18","formation_total_amount":"23.5","investment_character_code":"16","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20160019","operator_company_name":"인터밸류파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"인터밸류파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.795Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1008: 인터밸류 고급기술인력창업 1호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20160019',
  '인터밸류 고급기술인력창업 1호 투자조합',
  12500000000,
  '2017-07-12',
  '{"fund_id":"AS20170069","registration_date":"2017-07-12","expiry_date":"2025-07-11","formation_total_amount":"125.0","investment_character_code":"20","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20160019","operator_company_name":"인터밸류파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"인터밸류파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.795Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1009: 인탑스-인라이트 지역뉴딜 스마트워터시티 펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20220645',
  '인탑스-인라이트 지역뉴딜 스마트워터시티 펀드',
  23000000000,
  '2022-01-10',
  '{"fund_id":"AS20220035","registration_date":"2022-01-10","expiry_date":"2030-01-09","formation_total_amount":"230.0","investment_character_code":"02","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000013","operator_company_id":"OP20220645","operator_company_name":"인라이트벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"인라이트벤처스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.795Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1010: 인천창조경제 벤처펀드 2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20150032',
  '인천창조경제 벤처펀드 2호',
  100000000,
  '2019-01-03',
  '{"fund_id":"AS20190087","registration_date":"2019-01-03","expiry_date":"2027-01-31","formation_total_amount":"1.0","investment_character_code":"","industry_code":"1","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20150032","operator_company_name":"인천창조경제혁신센터","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"인천창조경제혁신센터","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.795Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1011: 인천창조경제 벤처펀드 1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20150032',
  '인천창조경제 벤처펀드 1호',
  100000000,
  '2018-07-16',
  '{"fund_id":"AS20180499","registration_date":"2018-07-16","expiry_date":"2026-07-15","formation_total_amount":"1.0","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20150032","operator_company_name":"인천창조경제혁신센터","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"인천창조경제혁신센터","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.795Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1012: 인천창경뉴본 투자조합 제 1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210207',
  '인천창경뉴본 투자조합 제 1호',
  850000000,
  '2024-02-02',
  '{"fund_id":"AS20240068","registration_date":"2024-02-02","expiry_date":"2030-02-01","formation_total_amount":"8.5","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20210207","operator_company_name":"뉴본벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"뉴본벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.795Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1013: 인천창경-씨엔티테크 제1호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20150032',
  '인천창경-씨엔티테크 제1호 개인투자조합',
  1300000000,
  '2024-02-14',
  '{"fund_id":"AS20240084","registration_date":"2024-02-14","expiry_date":"2030-02-06","formation_total_amount":"13.0","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20150032","operator_company_name":"인천창조경제혁신센터","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"인천창조경제혁신센터","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.795Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1014: 인천지식재산 제2호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20150032',
  '인천지식재산 제2호 투자조합',
  4800000000,
  '2019-08-23',
  '{"fund_id":"AS20190371","registration_date":"2019-08-23","expiry_date":"2027-08-22","formation_total_amount":"48.0","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"MF00000008","operator_company_id":"OP20150032","operator_company_name":"인천창조경제혁신센터","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"인천창조경제혁신센터","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.795Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1015: 인천지식재산 제1호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20150032',
  '인천지식재산 제1호 투자조합',
  880000000,
  '2019-12-20',
  '{"fund_id":"AS20190611","registration_date":"2019-12-20","expiry_date":"2027-12-19","formation_total_amount":"8.8","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20150032","operator_company_name":"인천창조경제혁신센터","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"인천창조경제혁신센터","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.795Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1016: 인천메타리얼벤처투자조합제일호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200259',
  '인천메타리얼벤처투자조합제일호',
  2000000000,
  '2023-11-10',
  '{"fund_id":"AS20231064","registration_date":"2023-11-10","expiry_date":"2028-11-09","formation_total_amount":"20.0","investment_character_code":"28","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20200259","operator_company_name":"메타리얼벤처캐피탈","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"메타리얼벤처캐피탈","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.795Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1017: 인천 혁신 창업 투자조합 제2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190269',
  '인천 혁신 창업 투자조합 제2호',
  4050000000,
  '2022-09-28',
  '{"fund_id":"AS20221052","registration_date":"2022-09-28","expiry_date":"2027-09-27","formation_total_amount":"40.5","investment_character_code":"","industry_code":"3","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"MF00000001","operator_company_id":"OP20190269","operator_company_name":"탭엔젤파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"탭엔젤파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.795Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1018: 인천 혁신 창업 투자조합 제1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190269',
  '인천 혁신 창업 투자조합 제1호',
  1960000000,
  '2022-01-12',
  '{"fund_id":"AS20220011","registration_date":"2022-01-12","expiry_date":"2028-01-11","formation_total_amount":"19.6","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190269","operator_company_name":"탭엔젤파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"탭엔젤파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.795Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1019: 인사이트비전1호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20170008',
  '인사이트비전1호 투자조합',
  20400000000,
  '2018-11-08',
  '{"fund_id":"AS20180334","registration_date":"2018-11-08","expiry_date":"2026-11-07","formation_total_amount":"204.0","investment_character_code":"21","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20170008","operator_company_name":"인사이트에퀴티파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"인사이트에퀴티파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.795Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1020: 인사이트V3스마트(디지털)헬스케어투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20170008',
  '인사이트V3스마트(디지털)헬스케어투자조합',
  31800000000,
  '2021-10-08',
  '{"fund_id":"AS20210971","registration_date":"2021-10-08","expiry_date":"2029-10-07","formation_total_amount":"318.0","investment_character_code":"10","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20170008","operator_company_name":"인사이트에퀴티파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"인사이트에퀴티파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.795Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1021: 인사이트V2 디지털헬스케어 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20170008',
  '인사이트V2 디지털헬스케어 투자조합',
  20000000000,
  '2020-10-19',
  '{"fund_id":"AS20200587","registration_date":"2020-10-19","expiry_date":"2028-10-18","formation_total_amount":"200.0","investment_character_code":"20","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20170008","operator_company_name":"인사이트에퀴티파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"인사이트에퀴티파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.795Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1022: 인비저닝클라이밋솔루션 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210487',
  '인비저닝클라이밋솔루션 투자조합',
  76800000000,
  '2021-10-07',
  '{"fund_id":"AS20210962","registration_date":"2021-10-07","expiry_date":"2030-10-06","formation_total_amount":"768.0","investment_character_code":"03","industry_code":"9","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20210487","operator_company_name":"인비저닝파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"인비저닝파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.795Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1023: 인비저닝 플로우 세컨더리 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210487',
  '인비저닝 플로우 세컨더리 투자조합',
  2250000000,
  '2023-11-15',
  '{"fund_id":"AS20231081","registration_date":"2023-11-15","expiry_date":"2028-11-14","formation_total_amount":"22.5","investment_character_code":"11","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20210487","operator_company_name":"인비저닝파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"인비저닝파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.795Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1024: 인비저닝 임팩트 솔루션 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210487',
  '인비저닝 임팩트 솔루션 투자조합',
  32900000000,
  '2023-08-08',
  '{"fund_id":"AS20230683","registration_date":"2023-08-08","expiry_date":"2031-08-07","formation_total_amount":"329.0","investment_character_code":"05","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20210487","operator_company_name":"인비저닝파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"인비저닝파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.795Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1025: 인비저닝 임팩트 솔루션 병행 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210487',
  '인비저닝 임팩트 솔루션 병행 투자조합',
  11110000000,
  '2023-10-25',
  '{"fund_id":"AS20230978","registration_date":"2023-10-25","expiry_date":"2032-10-24","formation_total_amount":"111.1","investment_character_code":"05","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20210487","operator_company_name":"인비저닝파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"인비저닝파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.795Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1026: 인라이트9호 넥스트유니콘 벤처펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20220645',
  '인라이트9호 넥스트유니콘 벤처펀드',
  22000000000,
  '2020-11-09',
  '{"fund_id":"AS20200640","registration_date":"2020-11-09","expiry_date":"2028-11-08","formation_total_amount":"220.0","investment_character_code":"20","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20220645","operator_company_name":"인라이트벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"인라이트벤처스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.795Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1027: 인라이트19호 퓨처모빌리티 벤처펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20220645',
  '인라이트19호 퓨처모빌리티 벤처펀드',
  10000000000,
  '2022-10-18',
  '{"fund_id":"AS20221194","registration_date":"2022-10-18","expiry_date":"2027-10-17","formation_total_amount":"100.0","investment_character_code":"16","industry_code":"1","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20220645","operator_company_name":"인라이트벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"인라이트벤처스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.795Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1028: 인라이트17호 에스에스 벤처펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20220645',
  '인라이트17호 에스에스 벤처펀드',
  2230000000,
  '2022-07-08',
  '{"fund_id":"AS20220763","registration_date":"2022-07-08","expiry_date":"2027-07-07","formation_total_amount":"22.3","investment_character_code":"25","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20220645","operator_company_name":"인라이트벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"인라이트벤처스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.795Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1029: 인라이트10호 오션스타펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20220645',
  '인라이트10호 오션스타펀드',
  14300000000,
  '2021-01-04',
  '{"fund_id":"AS20210020","registration_date":"2021-01-04","expiry_date":"2029-01-03","formation_total_amount":"143.0","investment_character_code":"10","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20220645","operator_company_name":"인라이트벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"인라이트벤처스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.795Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1030: 인라이트 넥스트 슈퍼스타 벤처펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20220645',
  '인라이트 넥스트 슈퍼스타 벤처펀드',
  59500000000,
  '2025-01-09',
  '{"fund_id":"AS20250023","registration_date":"2025-01-09","expiry_date":"2033-01-08","formation_total_amount":"595.0","investment_character_code":"09","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20220645","operator_company_name":"인라이트벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"인라이트벤처스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.795Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1031: 인라이트 SD전략펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20220645',
  '인라이트 SD전략펀드',
  35010000000,
  '2021-08-06',
  '{"fund_id":"AS20210694","registration_date":"2021-08-06","expiry_date":"2026-08-05","formation_total_amount":"350.1","investment_character_code":"02","industry_code":"4","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20220645","operator_company_name":"인라이트벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"인라이트벤처스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.795Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1032: 인라이트 SD3호 전략펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20220645',
  '인라이트 SD3호 전략펀드',
  21220000000,
  '2021-11-11',
  '{"fund_id":"AS20211118","registration_date":"2021-11-11","expiry_date":"2026-11-10","formation_total_amount":"212.2","investment_character_code":"25","industry_code":"6","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20220645","operator_company_name":"인라이트벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"인라이트벤처스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.796Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1033: 인라이트 SD2호 전략펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20220645',
  '인라이트 SD2호 전략펀드',
  11150000000,
  '2021-10-12',
  '{"fund_id":"AS20210974","registration_date":"2021-10-12","expiry_date":"2026-10-11","formation_total_amount":"111.5","investment_character_code":"02","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20220645","operator_company_name":"인라이트벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"인라이트벤처스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.796Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1034: 인라이트 CG2호 펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20220645',
  '인라이트 CG2호 펀드',
  12150000000,
  '2020-04-10',
  '{"fund_id":"AS20200154","registration_date":"2020-04-10","expiry_date":"2027-04-09","formation_total_amount":"121.5","investment_character_code":"01","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20220645","operator_company_name":"인라이트벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"인라이트벤처스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.796Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1035: 인라이트 AB전략펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20220645',
  '인라이트 AB전략펀드',
  2030000000,
  '2022-04-29',
  '{"fund_id":"AS20220488","registration_date":"2022-04-29","expiry_date":"2027-04-28","formation_total_amount":"20.3","investment_character_code":"04","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20220645","operator_company_name":"인라이트벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"인라이트벤처스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.796Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1036: 인라이트 6호 CD펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20220645',
  '인라이트 6호 CD펀드',
  12150000000,
  '2020-02-06',
  '{"fund_id":"AS20200077","registration_date":"2020-02-06","expiry_date":"2027-02-05","formation_total_amount":"121.5","investment_character_code":"18","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20220645","operator_company_name":"인라이트벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"인라이트벤처스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.796Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1037: 인라이트 4호 엔제이아이 펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20220645',
  '인라이트 4호 엔제이아이 펀드',
  14760000000,
  '2018-09-06',
  '{"fund_id":"AS20180265","registration_date":"2018-09-06","expiry_date":"2026-09-05","formation_total_amount":"147.6","investment_character_code":"20","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20220645","operator_company_name":"인라이트벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"인라이트벤처스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.796Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1038: 인라이트 3호 CG 펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20220645',
  '인라이트 3호 CG 펀드',
  20250000000,
  '2018-08-28',
  '{"fund_id":"AS20180209","registration_date":"2018-08-28","expiry_date":"2027-04-22","formation_total_amount":"202.5","investment_character_code":"18","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20220645","operator_company_name":"인라이트벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"인라이트벤처스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.796Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1039: 인라이트 2호 CD펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20220645',
  '인라이트 2호 CD펀드',
  20250000000,
  '2018-01-10',
  '{"fund_id":"AS20180074","registration_date":"2018-01-10","expiry_date":"2026-12-30","formation_total_amount":"202.5","investment_character_code":"18","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20220645","operator_company_name":"인라이트벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"인라이트벤처스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.796Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1040: 인라이트 1호 청년창업펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20220645',
  '인라이트 1호 청년창업펀드',
  16200000000,
  '2017-11-14',
  '{"fund_id":"AS20170130","registration_date":"2017-11-14","expiry_date":"2025-11-13","formation_total_amount":"162.0","investment_character_code":"21","industry_code":"9","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20220645","operator_company_name":"인라이트벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"인라이트벤처스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.796Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1041: 인구활력 HGI-MYSC 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20140018',
  '인구활력 HGI-MYSC 투자조합',
  7750000000,
  '2025-04-29',
  '{"fund_id":"AS20250338","registration_date":"2025-04-29","expiry_date":"2033-04-28","formation_total_amount":"77.5","investment_character_code":"18","industry_code":"9","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20140018","operator_company_name":"에이치지이니셔티브","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"에이치지이니셔티브","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.796Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1042: 익스포넨셜 제3호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210221',
  '익스포넨셜 제3호 개인투자조합',
  250000000,
  '2023-05-02',
  '{"fund_id":"AS20230347","registration_date":"2023-05-02","expiry_date":"2028-12-31","formation_total_amount":"2.5","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20210221","operator_company_name":"리얼비즌","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"리얼비즌","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.796Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1043: 익스포넨셜 제2호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210221',
  '익스포넨셜 제2호 개인투자조합',
  300000000,
  '2022-06-08',
  '{"fund_id":"AS20220635","registration_date":"2022-06-08","expiry_date":"2027-06-30","formation_total_amount":"3.0","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20210221","operator_company_name":"리얼비즌","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"리얼비즌","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.796Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1044: 익스포넨셜 제1호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210221',
  '익스포넨셜 제1호 개인투자조합',
  240000000,
  '2021-11-03',
  '{"fund_id":"AS20211065","registration_date":"2021-11-03","expiry_date":"2026-11-30","formation_total_amount":"2.4","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20210221","operator_company_name":"리얼비즌","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"리얼비즌","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.796Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1045: 이크럭스애니메이션캐릭터투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200111',
  '이크럭스애니메이션캐릭터투자조합',
  11650000000,
  '2020-08-07',
  '{"fund_id":"AS20200432","registration_date":"2020-08-07","expiry_date":"2027-08-06","formation_total_amount":"116.5","investment_character_code":"24","industry_code":"6","investment_field_type":"문화","investment_field_detail_type":"문화 기타","mother_fund_id":"MF00000001","operator_company_id":"OP20200111","operator_company_name":"이크럭스벤처파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"이크럭스벤처파트너스","investment_focus":["문화 기타","문화"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.796Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1046: 이크럭스신성장1호투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200111',
  '이크럭스신성장1호투자조합',
  2100000000,
  '2021-07-20',
  '{"fund_id":"AS20210618","registration_date":"2021-07-20","expiry_date":"2026-07-19","formation_total_amount":"21.0","investment_character_code":"06","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20200111","operator_company_name":"이크럭스벤처파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"이크럭스벤처파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.796Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1047: 이크럭스-넥스트지 세컨더리 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200111',
  '이크럭스-넥스트지 세컨더리 투자조합',
  20000000000,
  '2023-08-29',
  '{"fund_id":"AS20230765","registration_date":"2023-08-29","expiry_date":"2031-08-28","formation_total_amount":"200.0","investment_character_code":"16","industry_code":"9","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20200111","operator_company_name":"이크럭스벤처파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"이크럭스벤처파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.796Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1048: 이커머스서비스플랫폼개발 투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20180065',
  '이커머스서비스플랫폼개발 투자조합1호',
  100000000,
  '2020-05-12',
  '{"fund_id":"AS20200200","registration_date":"2020-05-12","expiry_date":"2027-03-31","formation_total_amount":"1.0","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20180065","operator_company_name":"엔피프틴파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"엔피프틴파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.796Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1049: 이커머스 스타트업 개인투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20140013',
  '이커머스 스타트업 개인투자조합1호',
  360000000,
  '2022-05-25',
  '{"fund_id":"AS20220570","registration_date":"2022-05-25","expiry_date":"2027-07-30","formation_total_amount":"3.6","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20140013","operator_company_name":"더인벤션랩","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"더인벤션랩","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.796Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1050: 이에스에스프리디지털콘텐츠창업초기투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20000026',
  '이에스에스프리디지털콘텐츠창업초기투자조합',
  16300000000,
  '2015-12-23',
  '{"fund_id":"AS20150025","registration_date":"2015-12-23","expiry_date":"2025-12-22","formation_total_amount":"163.0","investment_character_code":"20","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20000026","operator_company_name":"이에스인베스터","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"이에스인베스터","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.796Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Minimal Batch 21 completed! 50 fund records processed.
-- Progress: 1050/3689 total records

