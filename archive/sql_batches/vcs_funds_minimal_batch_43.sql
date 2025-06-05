-- VCS Fund MINIMAL UPSERT Batch 43/74 (Records 2101-2150)
-- MINIMAL: Only using basic columns that definitely exist
-- Generated from VCS API Scraper fund data
-- Generated at: 2025-06-05T00:40:21.895Z
-- Schema: Minimal fund_table structure (basic columns only)

-- MINIMAL FUND DATA (UPSERT - Safe for Duplicates)
-- Processing 50 fund records
-- Will INSERT new records or UPDATE existing ones

-- Record 2101: 스타트업혁신성장투자조합5호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20220489',
  '스타트업혁신성장투자조합5호',
  250000000,
  '2024-11-11',
  '{"fund_id":"AS20241087","registration_date":"2024-11-11","expiry_date":"2029-11-10","formation_total_amount":"2.5","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20220489","operator_company_name":"필로소피아벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"필로소피아벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.895Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2102: 스타트업혁신성장투자조합4호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20220489',
  '스타트업혁신성장투자조합4호',
  350000000,
  '2024-11-01',
  '{"fund_id":"AS20241030","registration_date":"2024-11-01","expiry_date":"2029-10-31","formation_total_amount":"3.5","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20220489","operator_company_name":"필로소피아벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"필로소피아벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.895Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2103: 스타트업혁신성장투자조합3호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20220489',
  '스타트업혁신성장투자조합3호',
  100000000,
  '2024-11-07',
  '{"fund_id":"AS20241057","registration_date":"2024-11-07","expiry_date":"2029-11-06","formation_total_amount":"1.0","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20220489","operator_company_name":"필로소피아벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"필로소피아벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.895Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2104: 스타트업혁신성장투자조합2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20220489',
  '스타트업혁신성장투자조합2호',
  120000000,
  '2024-10-17',
  '{"fund_id":"AS20240946","registration_date":"2024-10-17","expiry_date":"2029-10-14","formation_total_amount":"1.2","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20220489","operator_company_name":"필로소피아벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"필로소피아벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.895Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2105: 스타트업혁신성장투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20220489',
  '스타트업혁신성장투자조합1호',
  240000000,
  '2024-09-23',
  '{"fund_id":"AS20240891","registration_date":"2024-09-23","expiry_date":"2029-09-22","formation_total_amount":"2.4","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20220489","operator_company_name":"필로소피아벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"필로소피아벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.895Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2106: 스타트업파트너스 제6호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20180053',
  '스타트업파트너스 제6호 개인투자조합',
  100000000,
  '2024-08-09',
  '{"fund_id":"AS20240718","registration_date":"2024-08-09","expiry_date":"2029-07-31","formation_total_amount":"1.0","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20180053","operator_company_name":"스타트업파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"스타트업파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.895Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2107: 스타트업파트너스 제5호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20180053',
  '스타트업파트너스 제5호 개인투자조합',
  100000000,
  '2023-08-07',
  '{"fund_id":"AS20230665","registration_date":"2023-08-07","expiry_date":"2028-08-02","formation_total_amount":"1.0","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20180053","operator_company_name":"스타트업파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"스타트업파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.895Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2108: 스타트업파트너스 제3호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20180053',
  '스타트업파트너스 제3호 개인투자조합',
  190000000,
  '2021-11-26',
  '{"fund_id":"AS20211178","registration_date":"2021-11-26","expiry_date":"2026-11-22","formation_total_amount":"1.9","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20180053","operator_company_name":"스타트업파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"스타트업파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.895Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2109: 스타트업코리아센틱스안다전북혁신펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210663',
  '스타트업코리아센틱스안다전북혁신펀드',
  30000000000,
  '2025-01-06',
  '{"fund_id":"AS20250010","registration_date":"2025-01-06","expiry_date":"2033-01-05","formation_total_amount":"300.0","investment_character_code":"10","industry_code":"9","investment_field_type":"일반","investment_field_detail_type":"일반 기타","mother_fund_id":"MF00000001","operator_company_id":"OP20210663","operator_company_name":"안다아시아벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"안다아시아벤처스","investment_focus":["일반 기타","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.895Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2110: 스타트업코리아IBK-스틱테크챔피언펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19990012',
  '스타트업코리아IBK-스틱테크챔피언펀드',
  123500000000,
  '2025-01-14',
  '{"fund_id":"AS20250052","registration_date":"2025-01-14","expiry_date":"2033-01-13","formation_total_amount":"1235.0","investment_character_code":"03","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP19990012","operator_company_name":"스틱벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"스틱벤처스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.895Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2111: 스타트업코리아 삼천리제1호초격차투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20240069',
  '스타트업코리아 삼천리제1호초격차투자조합',
  20000000000,
  '2024-10-29',
  '{"fund_id":"AS20241052","registration_date":"2024-10-29","expiry_date":"2032-10-28","formation_total_amount":"200.0","investment_character_code":"10","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"일반 기타","mother_fund_id":"MF00000001","operator_company_id":"OP20240069","operator_company_name":"삼천리인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"삼천리인베스트먼트","investment_focus":["일반 기타","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.895Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2112: 스타트업엑스브리온개인투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20220208',
  '스타트업엑스브리온개인투자조합1호',
  100000000,
  '2022-07-18',
  '{"fund_id":"AS20220786","registration_date":"2022-07-18","expiry_date":"2027-07-17","formation_total_amount":"1.0","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20220208","operator_company_name":"스타트업엑스유한책임회사","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"스타트업엑스유한책임회사","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.895Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2113: 스타트업아일랜드 제주 개인투자조합 2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190236',
  '스타트업아일랜드 제주 개인투자조합 2호',
  270000000,
  '2023-02-24',
  '{"fund_id":"AS20230093","registration_date":"2023-02-24","expiry_date":"2028-02-23","formation_total_amount":"2.7","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190236","operator_company_name":"제주창조경제혁신센터","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"제주창조경제혁신센터","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.895Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2114: 스타트업아일랜드 제주 개인투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190236',
  '스타트업아일랜드 제주 개인투자조합 1호',
  910000000,
  '2021-06-30',
  '{"fund_id":"AS20210468","registration_date":"2021-06-30","expiry_date":"2026-06-29","formation_total_amount":"9.1","investment_character_code":"","industry_code":"3","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190236","operator_company_name":"제주창조경제혁신센터","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"제주창조경제혁신센터","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.895Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2115: 스타트업동반성장22 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20140013',
  '스타트업동반성장22 개인투자조합',
  190000000,
  '2022-07-15',
  '{"fund_id":"AS20220776","registration_date":"2022-07-15","expiry_date":"2027-07-14","formation_total_amount":"1.9","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20140013","operator_company_name":"더인벤션랩","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"더인벤션랩","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.895Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2116: 스타트업 코리아 효성 딥테크 벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20240316',
  '스타트업 코리아 효성 딥테크 벤처투자조합',
  100000000000,
  '2024-12-20',
  '{"fund_id":"AS20241398","registration_date":"2024-12-20","expiry_date":"2034-12-19","formation_total_amount":"1000.0","investment_character_code":"10","industry_code":"9","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20240316","operator_company_name":"효성벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"효성벤처스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.895Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2117: 스타트업 코리아 패스파인더-IBK 초격차 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20160016',
  '스타트업 코리아 패스파인더-IBK 초격차 투자조합',
  15000000000,
  '2024-12-23',
  '{"fund_id":"AS20241419","registration_date":"2024-12-23","expiry_date":"2032-12-22","formation_total_amount":"150.0","investment_character_code":"28","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20160016","operator_company_name":"패스파인더에이치","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"패스파인더에이치","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.895Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2118: 스타트업 코리아 케이씨 초격차 펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20230049',
  '스타트업 코리아 케이씨 초격차 펀드',
  17500000000,
  '2024-12-12',
  '{"fund_id":"AS20241329","registration_date":"2024-12-12","expiry_date":"2032-12-11","formation_total_amount":"175.0","investment_character_code":"03","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20230049","operator_company_name":"케이씨투자파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"케이씨투자파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.895Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2119: 스타트업 코리아 케이비 세컨더리 펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19900001',
  '스타트업 코리아 케이비 세컨더리 펀드',
  107500000000,
  '2025-01-06',
  '{"fund_id":"AS20250007","registration_date":"2025-01-06","expiry_date":"2033-01-05","formation_total_amount":"1075.0","investment_character_code":"16","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP19900001","operator_company_name":"케이비인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"케이비인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.895Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2120: 스타트업 코리아 카카오 코파일럿 펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20120008',
  '스타트업 코리아 카카오 코파일럿 펀드',
  40000000000,
  '2025-03-11',
  '{"fund_id":"AS20250177","registration_date":"2025-03-11","expiry_date":"2033-03-10","formation_total_amount":"400.0","investment_character_code":"06","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20120008","operator_company_name":"카카오벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"카카오벤처스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.895Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2121: 스타트업 코리아 엘앤에스 글로벌스타Ⅱ 펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20060007',
  '스타트업 코리아 엘앤에스 글로벌스타Ⅱ 펀드',
  32500000000,
  '2025-02-20',
  '{"fund_id":"AS20250130","registration_date":"2025-02-20","expiry_date":"2033-02-19","formation_total_amount":"325.0","investment_character_code":"28","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20060007","operator_company_name":"엘앤에스벤처캐피탈","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"엘앤에스벤처캐피탈","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.895Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2122: 스타트업 코리아 엔코어 티케이지 1호 펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20230058',
  '스타트업 코리아 엔코어 티케이지 1호 펀드',
  28500000000,
  '2024-12-17',
  '{"fund_id":"AS20241370","registration_date":"2024-12-17","expiry_date":"2032-12-16","formation_total_amount":"285.0","investment_character_code":"28","industry_code":"9","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20230058","operator_company_name":"엔코어벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"엔코어벤처스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.895Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2123: 스타트업 코리아 삼성 SBI 초격차 펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19860008',
  '스타트업 코리아 삼성 SBI 초격차 펀드',
  101000000000,
  '2024-11-26',
  '{"fund_id":"AS20241215","registration_date":"2024-11-26","expiry_date":"2032-11-25","formation_total_amount":"1010.0","investment_character_code":"28","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP19860008","operator_company_name":"에스비아이인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"에스비아이인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.895Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2124: 스타트업 코리아 비전 2024 펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20000041',
  '스타트업 코리아 비전 2024 펀드',
  32250000000,
  '2025-01-06',
  '{"fund_id":"AS20250009","registration_date":"2025-01-06","expiry_date":"2033-01-05","formation_total_amount":"322.5","investment_character_code":"28","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20000041","operator_company_name":"신한벤처투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"신한벤처투자","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.896Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2125: 스타트업 코리아 with CKD 2025 펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19970005',
  '스타트업 코리아 with CKD 2025 펀드',
  20000000000,
  '2025-01-22',
  '{"fund_id":"AS20250066","registration_date":"2025-01-22","expiry_date":"2033-01-21","formation_total_amount":"200.0","investment_character_code":"01","industry_code":"9","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP19970005","operator_company_name":"씨케이디창업투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"씨케이디창업투자","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.896Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2126: 스타트업 코리아 IBKVC-코오롱 2024 펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20240307',
  '스타트업 코리아 IBKVC-코오롱 2024 펀드',
  50000000000,
  '2024-11-20',
  '{"fund_id":"AS20241179","registration_date":"2024-11-20","expiry_date":"2032-11-19","formation_total_amount":"500.0","investment_character_code":"10","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20240307","operator_company_name":"아이비케이벤처투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"아이비케이벤처투자","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.896Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2127: 스타트업 코리아 IBKVC-FP 2024 펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20240307',
  '스타트업 코리아 IBKVC-FP 2024 펀드',
  50000000000,
  '2024-11-20',
  '{"fund_id":"AS20241177","registration_date":"2024-11-20","expiry_date":"2032-11-19","formation_total_amount":"500.0","investment_character_code":"10","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20240307","operator_company_name":"아이비케이벤처투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"아이비케이벤처투자","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.896Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2128: 스타트업 코리아 IBK-슈미트펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20180015',
  '스타트업 코리아 IBK-슈미트펀드',
  15000000000,
  '2024-11-22',
  '{"fund_id":"AS20241195","registration_date":"2024-11-22","expiry_date":"2032-11-21","formation_total_amount":"150.0","investment_character_code":"20","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"일반 기타","mother_fund_id":"MF00000001","operator_company_id":"OP20180015","operator_company_name":"슈미트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"슈미트","investment_focus":["일반 기타","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.896Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2129: 스타트업 코리아 IBK-DTNI 세컨더리 펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20150009',
  '스타트업 코리아 IBK-DTNI 세컨더리 펀드',
  30000000000,
  '2025-01-06',
  '{"fund_id":"AS20250006","registration_date":"2025-01-06","expiry_date":"2031-01-05","formation_total_amount":"300.0","investment_character_code":"16","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20150009","operator_company_name":"디티앤인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"디티앤인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.896Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2130: 스타트업 코리아 IBK 초격차 KIAMCO인라이트 벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20220645',
  '스타트업 코리아 IBK 초격차 KIAMCO인라이트 벤처투자조합',
  20500000000,
  '2025-01-09',
  '{"fund_id":"AS20250022","registration_date":"2025-01-09","expiry_date":"2032-01-08","formation_total_amount":"205.0","investment_character_code":"09","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20220645","operator_company_name":"인라이트벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"인라이트벤처스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.896Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2131: 스타트업 코리아 IBK 뮤렉스보이저2호투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20170034',
  '스타트업 코리아 IBK 뮤렉스보이저2호투자조합',
  25000000000,
  '2025-02-24',
  '{"fund_id":"AS20250139","registration_date":"2025-02-24","expiry_date":"2033-02-23","formation_total_amount":"250.0","investment_character_code":"16","industry_code":"9","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20170034","operator_company_name":"뮤렉스파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"뮤렉스파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.896Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2132: 스타트업 코리아 IB 초격차 펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19950002',
  '스타트업 코리아 IB 초격차 펀드',
  19050000000,
  '2025-03-11',
  '{"fund_id":"AS20250176","registration_date":"2025-03-11","expiry_date":"2032-03-10","formation_total_amount":"190.5","investment_character_code":"27","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP19950002","operator_company_name":"인포뱅크","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"인포뱅크","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.896Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2133: 스타트업 지원1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200224',
  '스타트업 지원1호',
  100000000,
  '2020-09-28',
  '{"fund_id":"AS20200537","registration_date":"2020-09-28","expiry_date":"2026-09-30","formation_total_amount":"1.0","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200224","operator_company_name":"로간","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"로간","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.896Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2134: 스타트업 임팩트 혁신 펀드2호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190401',
  '스타트업 임팩트 혁신 펀드2호 개인투자조합',
  230000000,
  '2021-01-05',
  '{"fund_id":"AS20210003","registration_date":"2021-01-05","expiry_date":"2026-01-04","formation_total_amount":"2.3","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190401","operator_company_name":"임팩트재단","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"임팩트재단","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.896Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2135: 스타트업 임팩트 혁신 펀드1호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190401',
  '스타트업 임팩트 혁신 펀드1호 개인투자조합',
  110000000,
  '2020-09-25',
  '{"fund_id":"AS20200521","registration_date":"2020-09-25","expiry_date":"2025-09-24","formation_total_amount":"1.1","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190401","operator_company_name":"임팩트재단","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"임팩트재단","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.896Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2136: 스타트업 엔젤 브릿지 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190375',
  '스타트업 엔젤 브릿지 투자조합',
  6150000000,
  '2023-01-18',
  '{"fund_id":"AS20230055","registration_date":"2023-01-18","expiry_date":"2031-01-17","formation_total_amount":"61.5","investment_character_code":"20","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20190375","operator_company_name":"경남벤처투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"경남벤처투자","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.896Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2137: 스타트업 신성장지원 기술사 투자조합 3호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200270',
  '스타트업 신성장지원 기술사 투자조합 3호',
  610000000,
  '2022-08-31',
  '{"fund_id":"AS20220937","registration_date":"2022-08-31","expiry_date":"2027-08-30","formation_total_amount":"6.1","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200270","operator_company_name":"아이엑스브이","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"아이엑스브이","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.896Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2138: 스타트업 신성장지원 기술사 투자조합 2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200270',
  '스타트업 신성장지원 기술사 투자조합 2호',
  530000000,
  '2021-07-21',
  '{"fund_id":"AS20210582","registration_date":"2021-07-21","expiry_date":"2026-07-20","formation_total_amount":"5.3","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200270","operator_company_name":"아이엑스브이","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"아이엑스브이","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.896Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2139: 스타트업 신성장지원 기술사 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200270',
  '스타트업 신성장지원 기술사 투자조합',
  460000000,
  '2020-11-23',
  '{"fund_id":"AS20200680","registration_date":"2020-11-23","expiry_date":"2025-11-22","formation_total_amount":"4.6","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200270","operator_company_name":"아이엑스브이","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"아이엑스브이","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.896Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2140: 스타트업 신성장 첨단기술융합 투자조합 2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200270',
  '스타트업 신성장 첨단기술융합 투자조합 2호',
  430000000,
  '2024-08-21',
  '{"fund_id":"AS20240768","registration_date":"2024-08-21","expiry_date":"2029-08-20","formation_total_amount":"4.3","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200270","operator_company_name":"아이엑스브이","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"아이엑스브이","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.896Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2141: 스타트업 신성장 첨단기술융합 투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200270',
  '스타트업 신성장 첨단기술융합 투자조합 1호',
  550000000,
  '2023-08-11',
  '{"fund_id":"AS20230680","registration_date":"2023-08-11","expiry_date":"2028-08-10","formation_total_amount":"5.5","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200270","operator_company_name":"아이엑스브이","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"아이엑스브이","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.896Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2142: 스타트업 밸류업 CNVP 2호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200126',
  '스타트업 밸류업 CNVP 2호 개인투자조합',
  5250000000,
  '2021-09-03',
  '{"fund_id":"AS20210783","registration_date":"2021-09-03","expiry_date":"2028-09-02","formation_total_amount":"52.5","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"MF00000001","operator_company_id":"OP20200126","operator_company_name":"씨앤벤처파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"씨앤벤처파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.896Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2143: 스타트업 GL-JCH 펀드 2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210609',
  '스타트업 GL-JCH 펀드 2호',
  5100000000,
  '2023-09-15',
  '{"fund_id":"AS20230828","registration_date":"2023-09-15","expiry_date":"2028-09-14","formation_total_amount":"51.0","investment_character_code":"25","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20210609","operator_company_name":"제이씨에이치인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"제이씨에이치인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.896Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2144: 스타트업 GL-JCH 펀드 1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210609',
  '스타트업 GL-JCH 펀드 1호',
  2100000000,
  '2022-03-07',
  '{"fund_id":"AS20220246","registration_date":"2022-03-07","expiry_date":"2028-03-06","formation_total_amount":"21.0","investment_character_code":"02","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20210609","operator_company_name":"제이씨에이치인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"제이씨에이치인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.896Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2145: 스타이노베이션 제2호 벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210394',
  '스타이노베이션 제2호 벤처투자조합',
  1010000000,
  '2024-05-10',
  '{"fund_id":"AS20240412","registration_date":"2024-05-10","expiry_date":"2032-05-09","formation_total_amount":"10.1","investment_character_code":"20","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20210394","operator_company_name":"스타벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"스타벤처스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.896Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2146: 스타벤처스 개인투자조합 3호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210394',
  '스타벤처스 개인투자조합 3호',
  230000000,
  '2025-02-14',
  '{"fund_id":"AS20250093","registration_date":"2025-02-14","expiry_date":"2031-02-13","formation_total_amount":"2.3","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20210394","operator_company_name":"스타벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"스타벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.896Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2147: 스타벤처스 개인투자조합 2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210394',
  '스타벤처스 개인투자조합 2호',
  370000000,
  '2023-08-01',
  '{"fund_id":"AS20230640","registration_date":"2023-08-01","expiry_date":"2031-07-31","formation_total_amount":"3.7","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20210394","operator_company_name":"스타벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"스타벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.896Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2148: 스타벤처스 개인투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210394',
  '스타벤처스 개인투자조합 1호',
  350000000,
  '2022-08-26',
  '{"fund_id":"AS20220936","registration_date":"2022-08-26","expiry_date":"2028-08-25","formation_total_amount":"3.5","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20210394","operator_company_name":"스타벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"스타벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.896Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2149: 스타디움 공공기술사업화 1호 펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20120010',
  '스타디움 공공기술사업화 1호 펀드',
  7500000000,
  '2024-10-16',
  '{"fund_id":"AS20240981","registration_date":"2024-10-16","expiry_date":"2034-10-15","formation_total_amount":"75.0","investment_character_code":"09","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20120010","operator_company_name":"포항공과대학교기술지주","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"포항공과대학교기술지주","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.896Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2150: 스퀘어 뉴패러다임 투자조합 2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190052',
  '스퀘어 뉴패러다임 투자조합 2호',
  3270000000,
  '2024-02-08',
  '{"fund_id":"AS20240091","registration_date":"2024-02-08","expiry_date":"2029-02-07","formation_total_amount":"32.7","investment_character_code":"04","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20190052","operator_company_name":"스퀘어벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"스퀘어벤처스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.896Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Minimal Batch 43 completed! 50 fund records processed.
-- Progress: 2150/3689 total records

