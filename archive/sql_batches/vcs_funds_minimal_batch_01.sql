-- VCS Fund MINIMAL UPSERT Batch 1/74 (Records 1-50)
-- MINIMAL: Only using basic columns that definitely exist
-- Generated from VCS API Scraper fund data
-- Generated at: 2025-06-05T00:40:21.620Z
-- Schema: Minimal fund_table structure (basic columns only)

-- MINIMAL FUND DATA (UPSERT - Safe for Duplicates)
-- Processing 50 fund records
-- Will INSERT new records or UPDATE existing ones

-- Record 1: 힐스프링투자조합 제1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20220223',
  '힐스프링투자조합 제1호',
  20000000000,
  '2023-04-26',
  '{"fund_id":"AS20230326","registration_date":"2023-04-26","expiry_date":"2031-04-25","formation_total_amount":"200.0","investment_character_code":"02","industry_code":"9","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20220223","operator_company_name":"힐스프링인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"힐스프링인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.620Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2: 히스토리액트원4호프롭테크투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200140',
  '히스토리액트원4호프롭테크투자조합',
  210000000,
  '2023-11-02',
  '{"fund_id":"AS20231006","registration_date":"2023-11-02","expiry_date":"2028-11-01","formation_total_amount":"2.1","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200140","operator_company_name":"히스토리벤처투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"히스토리벤처투자","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.620Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3: 히스토리액트원3호소부장투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200140',
  '히스토리액트원3호소부장투자조합',
  720000000,
  '2023-07-10',
  '{"fund_id":"AS20230564","registration_date":"2023-07-10","expiry_date":"2028-07-09","formation_total_amount":"7.2","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200140","operator_company_name":"히스토리벤처투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"히스토리벤처투자","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.620Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 4: 히스토리액트원2023-3호콘텐츠투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200140',
  '히스토리액트원2023-3호콘텐츠투자조합',
  1040000000,
  '2023-05-31',
  '{"fund_id":"AS20230440","registration_date":"2023-05-31","expiry_date":"2028-05-30","formation_total_amount":"10.4","investment_character_code":"","industry_code":"6","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200140","operator_company_name":"히스토리벤처투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"히스토리벤처투자","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.620Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 5: 히스토리액트원2023-1호블라인드콘텐츠투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200140',
  '히스토리액트원2023-1호블라인드콘텐츠투자조합',
  1100000000,
  '2023-04-17',
  '{"fund_id":"AS20230278","registration_date":"2023-04-17","expiry_date":"2028-04-16","formation_total_amount":"11.0","investment_character_code":"","industry_code":"6","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200140","operator_company_name":"히스토리벤처투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"히스토리벤처투자","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.620Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 6: 히스토리8호고성장해양수산투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200140',
  '히스토리8호고성장해양수산투자조합',
  130000000,
  '2025-03-17',
  '{"fund_id":"AS20250172","registration_date":"2025-03-17","expiry_date":"2030-03-16","formation_total_amount":"1.3","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200140","operator_company_name":"히스토리벤처투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"히스토리벤처투자","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.620Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 7: 히스토리7호관광투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200140',
  '히스토리7호관광투자조합',
  1040000000,
  '2024-11-18',
  '{"fund_id":"AS20241133","registration_date":"2024-11-18","expiry_date":"2029-11-17","formation_total_amount":"10.4","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200140","operator_company_name":"히스토리벤처투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"히스토리벤처투자","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.620Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 8: 히스토리6호해양수산투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200140',
  '히스토리6호해양수산투자조합',
  120000000,
  '2024-11-01',
  '{"fund_id":"AS20241325","registration_date":"2024-11-01","expiry_date":"2029-10-31","formation_total_amount":"1.2","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200140","operator_company_name":"히스토리벤처투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"히스토리벤처투자","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.620Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 9: 히스토리5호방송콘텐츠투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200140',
  '히스토리5호방송콘텐츠투자조합',
  330000000,
  '2024-05-29',
  '{"fund_id":"AS20240466","registration_date":"2024-05-29","expiry_date":"2029-05-28","formation_total_amount":"3.3","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200140","operator_company_name":"히스토리벤처투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"히스토리벤처투자","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.620Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 10: 히스토리2022-1헬스케어투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200140',
  '히스토리2022-1헬스케어투자조합',
  110000000,
  '2023-02-28',
  '{"fund_id":"AS20230098","registration_date":"2023-02-28","expiry_date":"2028-02-27","formation_total_amount":"1.1","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200140","operator_company_name":"히스토리벤처투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"히스토리벤처투자","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.620Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 11: 히스토리2022-1디지털콘텐츠투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200140',
  '히스토리2022-1디지털콘텐츠투자조합',
  220000000,
  '2022-10-27',
  '{"fund_id":"AS20221206","registration_date":"2022-10-27","expiry_date":"2027-10-26","formation_total_amount":"2.2","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200140","operator_company_name":"히스토리벤처투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"히스토리벤처투자","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.620Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 12: 히스토리2022-1NFT투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200140',
  '히스토리2022-1NFT투자조합',
  1170000000,
  '2022-08-12',
  '{"fund_id":"AS20220868","registration_date":"2022-08-12","expiry_date":"2027-08-11","formation_total_amount":"11.7","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200140","operator_company_name":"히스토리벤처투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"히스토리벤처투자","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.620Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 13: 히스토리2021-1바이오투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200140',
  '히스토리2021-1바이오투자조합',
  670000000,
  '2021-07-15',
  '{"fund_id":"AS20210527","registration_date":"2021-07-15","expiry_date":"2026-07-14","formation_total_amount":"6.7","investment_character_code":"","industry_code":"4","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200140","operator_company_name":"히스토리벤처투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"히스토리벤처투자","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.620Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 14: 히스토리2021-1디지털콘텐츠투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200140',
  '히스토리2021-1디지털콘텐츠투자조합',
  2560000000,
  '2021-08-09',
  '{"fund_id":"AS20210683","registration_date":"2021-08-09","expiry_date":"2026-08-08","formation_total_amount":"25.6","investment_character_code":"","industry_code":"6","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200140","operator_company_name":"히스토리벤처투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"히스토리벤처투자","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.620Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 15: 히스토리-솔트룩스 벤처투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200140',
  '히스토리-솔트룩스 벤처투자조합 1호',
  2700000000,
  '2023-05-18',
  '{"fund_id":"AS20230407","registration_date":"2023-05-18","expiry_date":"2028-05-17","formation_total_amount":"27.0","investment_character_code":"25","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20200140","operator_company_name":"히스토리벤처투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"히스토리벤처투자","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.620Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 16: 히스토리-KJSME 2020-1 디지털콘텐츠 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200140',
  '히스토리-KJSME 2020-1 디지털콘텐츠 투자조합',
  280000000,
  '2020-11-03',
  '{"fund_id":"AS20200602","registration_date":"2020-11-03","expiry_date":"2025-12-31","formation_total_amount":"2.8","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200140","operator_company_name":"히스토리벤처투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"히스토리벤처투자","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.620Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 17: 히스토리 2020-2 디지털콘텐츠 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200140',
  '히스토리 2020-2 디지털콘텐츠 투자조합',
  200000000,
  '2020-12-10',
  '{"fund_id":"AS20200743","registration_date":"2020-12-10","expiry_date":"2025-12-31","formation_total_amount":"2.0","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200140","operator_company_name":"히스토리벤처투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"히스토리벤처투자","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.620Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 18: 히스토리 2020-1 디지털콘텐츠 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200140',
  '히스토리 2020-1 디지털콘텐츠 투자조합',
  930000000,
  '2020-12-03',
  '{"fund_id":"AS20200709","registration_date":"2020-12-03","expiry_date":"2025-12-31","formation_total_amount":"9.3","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200140","operator_company_name":"히스토리벤처투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"히스토리벤처투자","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.620Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 19: 휴머스원-서울랩 투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210719',
  '휴머스원-서울랩 투자조합1호',
  500000000,
  '2022-12-21',
  '{"fund_id":"AS20221466","registration_date":"2022-12-21","expiry_date":"2027-12-20","formation_total_amount":"5.0","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20210719","operator_company_name":"서울랩파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"서울랩파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.620Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 20: 효성신성장산업펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20120006',
  '효성신성장산업펀드',
  10110000000,
  '2015-07-23',
  '{"fund_id":"AS20150069","registration_date":"2015-07-23","expiry_date":"2025-07-31","formation_total_amount":"101.1","investment_character_code":"18","industry_code":"7","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20120006","operator_company_name":"레오파트너스인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"레오파트너스인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.620Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 21: 화이-코바코 콘텐츠투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20060017',
  '화이-코바코 콘텐츠투자조합',
  10000000000,
  '2017-04-19',
  '{"fund_id":"AS20170039","registration_date":"2017-04-19","expiry_date":"2025-12-31","formation_total_amount":"100.0","investment_character_code":"24","industry_code":"6","investment_field_type":"문화","investment_field_detail_type":"문화 기타","mother_fund_id":"","operator_company_id":"OP20060017","operator_company_name":"넥스트지인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"넥스트지인베스트먼트","investment_focus":["문화 기타","문화"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.620Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 22: 호라이즌유니콘투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20220135',
  '호라이즌유니콘투자조합1호',
  24760000000,
  '2023-04-27',
  '{"fund_id":"AS20230329","registration_date":"2023-04-27","expiry_date":"2031-04-26","formation_total_amount":"247.6","investment_character_code":"20","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20220135","operator_company_name":"호라이즌인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"호라이즌인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.620Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 23: 호라이즌세컨더리투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20220135',
  '호라이즌세컨더리투자조합1호',
  3740000000,
  '2020-08-07',
  '{"fund_id":"AS20200431","registration_date":"2020-08-07","expiry_date":"2025-08-06","formation_total_amount":"37.4","investment_character_code":"16","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20220135","operator_company_name":"호라이즌인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"호라이즌인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.620Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 24: 호라이즌벤처펀드1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20220135',
  '호라이즌벤처펀드1호',
  22230000000,
  '2024-07-16',
  '{"fund_id":"AS20240661","registration_date":"2024-07-16","expiry_date":"2032-07-15","formation_total_amount":"222.3","investment_character_code":"04","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20220135","operator_company_name":"호라이즌인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"호라이즌인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.621Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 25: 호남제주권 EK 징검다리 펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20120017',
  '호남제주권 EK 징검다리 펀드',
  5000000000,
  '2023-02-02',
  '{"fund_id":"AS20230085","registration_date":"2023-02-02","expiry_date":"2031-02-01","formation_total_amount":"50.0","investment_character_code":"20","industry_code":"9","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20120017","operator_company_name":"한국엔젤투자협회","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"한국엔젤투자협회","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.621Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 26: 호남엔젤투자허브 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20120017',
  '호남엔젤투자허브 개인투자조합',
  5000000000,
  '2022-01-05',
  '{"fund_id":"AS20220015","registration_date":"2022-01-05","expiry_date":"2027-01-04","formation_total_amount":"50.0","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"MF00000001","operator_company_id":"OP20120017","operator_company_name":"한국엔젤투자협회","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"한국엔젤투자협회","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.621Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 27: 현대초기기업세컨더리펀드1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19970003',
  '현대초기기업세컨더리펀드1호',
  40000000000,
  '2018-09-19',
  '{"fund_id":"AS20180292","registration_date":"2018-09-19","expiry_date":"2026-09-18","formation_total_amount":"400.0","investment_character_code":"16","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP19970003","operator_company_name":"현대기술투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"현대기술투자","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.621Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 28: 현대청년펀드2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19970003',
  '현대청년펀드2호',
  60000000000,
  '2017-12-28',
  '{"fund_id":"AS20180004","registration_date":"2017-12-28","expiry_date":"2025-12-27","formation_total_amount":"600.0","investment_character_code":"21","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP19970003","operator_company_name":"현대기술투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"현대기술투자","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.621Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 29: 현대청년펀드 1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19970003',
  '현대청년펀드 1호',
  20000000000,
  '2015-07-28',
  '{"fund_id":"AS20150010","registration_date":"2015-07-28","expiry_date":"2025-07-27","formation_total_amount":"200.0","investment_character_code":"21","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP19970003","operator_company_name":"현대기술투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"현대기술투자","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.621Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 30: 현대차증권 코스넷 미래성장 제2호 벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20180005',
  '현대차증권 코스넷 미래성장 제2호 벤처투자조합',
  10750000000,
  '2024-07-02',
  '{"fund_id":"AS20240585","registration_date":"2024-07-02","expiry_date":"2029-07-01","formation_total_amount":"107.5","investment_character_code":"25","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20180005","operator_company_name":"코스넷기술투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"코스넷기술투자","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.621Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 31: 현대차증권 코스넷 미래성장 벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20180005',
  '현대차증권 코스넷 미래성장 벤처투자조합',
  11400000000,
  '2023-06-20',
  '{"fund_id":"AS20230513","registration_date":"2023-06-20","expiry_date":"2028-06-19","formation_total_amount":"114.0","investment_character_code":"25","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20180005","operator_company_name":"코스넷기술투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"코스넷기술투자","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.621Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 32: 현대지역혁신성장펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19970003',
  '현대지역혁신성장펀드',
  40000000000,
  '2023-05-12',
  '{"fund_id":"AS20230381","registration_date":"2023-05-12","expiry_date":"2033-05-11","formation_total_amount":"400.0","investment_character_code":"08","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP19970003","operator_company_name":"현대기술투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"현대기술투자","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.621Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 33: 현대일자리창출펀드1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19970003',
  '현대일자리창출펀드1호',
  40000000000,
  '2022-01-06',
  '{"fund_id":"AS20220029","registration_date":"2022-01-06","expiry_date":"2030-01-05","formation_total_amount":"400.0","investment_character_code":"14","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP19970003","operator_company_name":"현대기술투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"현대기술투자","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.621Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 34: 현대문화신기술유니콘펀드1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19970003',
  '현대문화신기술유니콘펀드1호',
  33800000000,
  '2024-08-05',
  '{"fund_id":"AS20240742","registration_date":"2024-08-05","expiry_date":"2032-08-04","formation_total_amount":"338.0","investment_character_code":"24","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP19970003","operator_company_name":"현대기술투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"현대기술투자","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.621Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 35: 현대기술투자수소펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19970003',
  '현대기술투자수소펀드',
  16100000000,
  '2015-07-16',
  '{"fund_id":"AS20150063","registration_date":"2015-07-16","expiry_date":"2025-07-15","formation_total_amount":"161.0","investment_character_code":"01","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP19970003","operator_company_name":"현대기술투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"현대기술투자","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.621Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 36: 현대-유니온모험콘텐츠투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20000008',
  '현대-유니온모험콘텐츠투자조합',
  35000000000,
  '2021-08-13',
  '{"fund_id":"AS20210726","registration_date":"2021-08-13","expiry_date":"2028-08-12","formation_total_amount":"350.0","investment_character_code":"24","industry_code":"6","investment_field_type":"문화","investment_field_detail_type":"문화 기타","mother_fund_id":"MF00000001","operator_company_id":"OP20000008","operator_company_name":"유니온투자파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"유니온투자파트너스","investment_focus":["문화 기타","문화"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.621Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 37: 현대-수림 챔피언십 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19970003',
  '현대-수림 챔피언십 투자조합',
  50000000000,
  '2017-06-28',
  '{"fund_id":"AS20170068","registration_date":"2017-06-28","expiry_date":"2025-06-27","formation_total_amount":"500.0","investment_character_code":"10","industry_code":"4","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP19970003","operator_company_name":"현대기술투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"현대기술투자","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.621Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 38: 혁신바이오첨단IT기술융합성장투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200270',
  '혁신바이오첨단IT기술융합성장투자조합1호',
  520000000,
  '2022-02-16',
  '{"fund_id":"AS20220148","registration_date":"2022-02-16","expiry_date":"2027-02-15","formation_total_amount":"5.2","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200270","operator_company_name":"아이엑스브이","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"아이엑스브이","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.621Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 39: 혁신 IP 기술사업화 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20180050',
  '혁신 IP 기술사업화 투자조합',
  29540000000,
  '2023-06-26',
  '{"fund_id":"AS20230528","registration_date":"2023-06-26","expiry_date":"2030-06-25","formation_total_amount":"295.4","investment_character_code":"03","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20180050","operator_company_name":"케이그라운드벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"케이그라운드벤처스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.621Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 40: 헬스케어 신성장 조합 제1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200340',
  '헬스케어 신성장 조합 제1호',
  4400000000,
  '2024-07-22',
  '{"fund_id":"AS20240677","registration_date":"2024-07-22","expiry_date":"2029-07-21","formation_total_amount":"44.0","investment_character_code":"04","industry_code":"4","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20200340","operator_company_name":"에코프로파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"에코프로파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.621Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 41: 헬리오스테이아벤처투자조합제1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20240491',
  '헬리오스테이아벤처투자조합제1호',
  4020000000,
  '2024-12-17',
  '{"fund_id":"AS20241367","registration_date":"2024-12-17","expiry_date":"2029-12-16","formation_total_amount":"40.2","investment_character_code":"25","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"일반 기타","mother_fund_id":"","operator_company_id":"OP20240491","operator_company_name":"헬리오스벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"헬리오스벤처스","investment_focus":["일반 기타","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.621Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 42: 헥토콘 2호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20180020',
  '헥토콘 2호 투자조합',
  2500000000,
  '2024-08-27',
  '{"fund_id":"AS20240838","registration_date":"2024-08-27","expiry_date":"2031-08-26","formation_total_amount":"25.0","investment_character_code":"28","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20180020","operator_company_name":"씨엔티테크","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"씨엔티테크","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.621Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 43: 헥토콘 1호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20180020',
  '헥토콘 1호 투자조합',
  2000000000,
  '2021-11-11',
  '{"fund_id":"AS20211109","registration_date":"2021-11-11","expiry_date":"2028-11-10","formation_total_amount":"20.0","investment_character_code":"02","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20180020","operator_company_name":"씨엔티테크","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"씨엔티테크","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.621Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 44: 헥사곤 블록체인 투자조합 4호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200034',
  '헥사곤 블록체인 투자조합 4호',
  150000000,
  '2022-10-25',
  '{"fund_id":"AS20221178","registration_date":"2022-10-25","expiry_date":"2027-12-31","formation_total_amount":"1.5","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200034","operator_company_name":"헥사곤벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"헥사곤벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.621Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 45: 헥사곤 블록체인 투자조합 3호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200034',
  '헥사곤 블록체인 투자조합 3호',
  100000000,
  '2022-10-11',
  '{"fund_id":"AS20221126","registration_date":"2022-10-11","expiry_date":"2027-12-31","formation_total_amount":"1.0","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200034","operator_company_name":"헥사곤벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"헥사곤벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.621Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 46: 헥사곤 블록체인 투자조합 2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200034',
  '헥사곤 블록체인 투자조합 2호',
  110000000,
  '2022-05-31',
  '{"fund_id":"AS20220610","registration_date":"2022-05-31","expiry_date":"2027-12-31","formation_total_amount":"1.1","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200034","operator_company_name":"헥사곤벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"헥사곤벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.621Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 47: 헥사곤 블록체인 투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200034',
  '헥사곤 블록체인 투자조합 1호',
  200000000,
  '2022-05-04',
  '{"fund_id":"AS20220454","registration_date":"2022-05-04","expiry_date":"2027-12-31","formation_total_amount":"2.0","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200034","operator_company_name":"헥사곤벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"헥사곤벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.621Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 48: 헤이브이씨(Hey VC) 개인투자조합2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20160040',
  '헤이브이씨(Hey VC) 개인투자조합2호',
  560000000,
  '2021-07-06',
  '{"fund_id":"AS20210517","registration_date":"2021-07-06","expiry_date":"2029-07-05","formation_total_amount":"5.6","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20160040","operator_company_name":"에스와이피","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"에스와이피","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.621Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 49: 헤이브이씨(Hey VC) 개인투자조합 제5호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20160040',
  '헤이브이씨(Hey VC) 개인투자조합 제5호',
  100000000,
  '2023-12-06',
  '{"fund_id":"AS20231135","registration_date":"2023-12-06","expiry_date":"2028-12-05","formation_total_amount":"1.0","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20160040","operator_company_name":"에스와이피","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"에스와이피","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.621Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 50: 헤이브이씨(Hey VC) 개인투자조합 제3호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20160040',
  '헤이브이씨(Hey VC) 개인투자조합 제3호',
  250000000,
  '2023-03-20',
  '{"fund_id":"AS20230178","registration_date":"2023-03-20","expiry_date":"2028-03-19","formation_total_amount":"2.5","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20160040","operator_company_name":"에스와이피","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"에스와이피","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.621Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Minimal Batch 1 completed! 50 fund records processed.
-- Progress: 50/3689 total records

