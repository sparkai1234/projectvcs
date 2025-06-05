-- VCS Fund MINIMAL UPSERT Batch 37/74 (Records 1801-1850)
-- MINIMAL: Only using basic columns that definitely exist
-- Generated from VCS API Scraper fund data
-- Generated at: 2025-06-05T00:40:21.868Z
-- Schema: Minimal fund_table structure (basic columns only)

-- MINIMAL FUND DATA (UPSERT - Safe for Duplicates)
-- Processing 50 fund records
-- Will INSERT new records or UPDATE existing ones

-- Record 1801: 알에스 개인투자조합 4호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20220541',
  '알에스 개인투자조합 4호',
  340000000,
  '2024-10-31',
  '{"fund_id":"AS20241031","registration_date":"2024-10-31","expiry_date":"2029-10-30","formation_total_amount":"3.4","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20220541","operator_company_name":"시드버스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"시드버스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.868Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1802: 알에스 개인투자조합 2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20220541',
  '알에스 개인투자조합 2호',
  120000000,
  '2024-08-01',
  '{"fund_id":"AS20240668","registration_date":"2024-08-01","expiry_date":"2029-07-31","formation_total_amount":"1.2","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20220541","operator_company_name":"시드버스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"시드버스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.868Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1803: 알에스 개인투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20220541',
  '알에스 개인투자조합 1호',
  580000000,
  '2023-12-14',
  '{"fund_id":"AS20231268","registration_date":"2023-12-14","expiry_date":"2028-12-13","formation_total_amount":"5.8","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20220541","operator_company_name":"시드버스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"시드버스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.868Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1804: 알바트로스하이플라이펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20080001',
  '알바트로스하이플라이펀드',
  27500000000,
  '2024-09-03',
  '{"fund_id":"AS20240856","registration_date":"2024-09-03","expiry_date":"2032-09-02","formation_total_amount":"275.0","investment_character_code":"20","industry_code":"4","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20080001","operator_company_name":"알바트로스인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"알바트로스인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.868Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1805: 알바트로스퓨처코리아투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20080001',
  '알바트로스퓨처코리아투자조합',
  29000000000,
  '2017-03-16',
  '{"fund_id":"AS20170025","registration_date":"2017-03-16","expiry_date":"2026-03-15","formation_total_amount":"290.0","investment_character_code":"26","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"일반 기타","mother_fund_id":"","operator_company_id":"OP20080001","operator_company_name":"알바트로스인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"알바트로스인베스트먼트","investment_focus":["일반 기타","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.868Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1806: 알바트로스퓨처모빌리티펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20080001',
  '알바트로스퓨처모빌리티펀드',
  58000000000,
  '2021-10-29',
  '{"fund_id":"AS20211049","registration_date":"2021-10-29","expiry_date":"2029-10-28","formation_total_amount":"580.0","investment_character_code":"10","industry_code":"1","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20080001","operator_company_name":"알바트로스인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"알바트로스인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.868Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1807: 알바트로스오아시너지펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20080001',
  '알바트로스오아시너지펀드',
  9000000000,
  '2020-09-23',
  '{"fund_id":"AS20200528","registration_date":"2020-09-23","expiry_date":"2025-09-22","formation_total_amount":"90.0","investment_character_code":"01","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20080001","operator_company_name":"알바트로스인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"알바트로스인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.868Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1808: 알바트로스뉴웨이브펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20080001',
  '알바트로스뉴웨이브펀드',
  14000000000,
  '2020-08-10',
  '{"fund_id":"AS20200409","registration_date":"2020-08-10","expiry_date":"2028-08-09","formation_total_amount":"140.0","investment_character_code":"10","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20080001","operator_company_name":"알바트로스인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"알바트로스인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.868Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1809: 알바트로스넥스트제너레이션펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20080001',
  '알바트로스넥스트제너레이션펀드',
  29000000000,
  '2018-01-09',
  '{"fund_id":"AS20180091","registration_date":"2018-01-09","expiry_date":"2026-01-08","formation_total_amount":"290.0","investment_character_code":"21","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20080001","operator_company_name":"알바트로스인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"알바트로스인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.868Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1810: 알바트로스 특허가치 창출펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20080001',
  '알바트로스 특허가치 창출펀드',
  15000000000,
  '2016-06-21',
  '{"fund_id":"AS20160073","registration_date":"2016-06-21","expiry_date":"2025-06-20","formation_total_amount":"150.0","investment_character_code":"09","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"특허","mother_fund_id":"MF00000001","operator_company_id":"OP20080001","operator_company_name":"알바트로스인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"알바트로스인베스트먼트","investment_focus":["특허","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.868Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1811: 알마덴개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190424',
  '알마덴개인투자조합',
  150000000,
  '2021-01-22',
  '{"fund_id":"AS20210025","registration_date":"2021-01-22","expiry_date":"2026-01-21","formation_total_amount":"1.5","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190424","operator_company_name":"알마덴디자인리서치","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"알마덴디자인리서치","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.868Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1812: 알로이스-지온 PGK 펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20090005',
  '알로이스-지온 PGK 펀드',
  3790000000,
  '2022-03-04',
  '{"fund_id":"AS20220223","registration_date":"2022-03-04","expiry_date":"2027-03-03","formation_total_amount":"37.9","investment_character_code":"25","industry_code":"6","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20090005","operator_company_name":"지온인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"지온인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.868Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1813: 안다하림전북강원전주지역혁신펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210663',
  '안다하림전북강원전주지역혁신펀드',
  18000000000,
  '2023-10-13',
  '{"fund_id":"AS20230930","registration_date":"2023-10-13","expiry_date":"2031-10-12","formation_total_amount":"180.0","investment_character_code":"10","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000019","operator_company_id":"OP20210663","operator_company_name":"안다아시아벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"안다아시아벤처스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.868Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1814: 안다탄소제로투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210663',
  '안다탄소제로투자조합1호',
  15000000000,
  '2022-09-06',
  '{"fund_id":"AS20221029","registration_date":"2022-09-06","expiry_date":"2027-09-05","formation_total_amount":"150.0","investment_character_code":"25","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20210663","operator_company_name":"안다아시아벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"안다아시아벤처스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.868Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1815: 안다아시아벤처투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210663',
  '안다아시아벤처투자조합1호',
  7530000000,
  '2021-12-16',
  '{"fund_id":"AS20211326","registration_date":"2021-12-16","expiry_date":"2026-12-15","formation_total_amount":"75.3","investment_character_code":"04","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20210663","operator_company_name":"안다아시아벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"안다아시아벤처스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.868Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1816: 안다소재부품벤처투자조합2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210663',
  '안다소재부품벤처투자조합2호',
  12000000000,
  '2022-03-22',
  '{"fund_id":"AS20220328","registration_date":"2022-03-22","expiry_date":"2027-03-21","formation_total_amount":"120.0","investment_character_code":"16","industry_code":"1","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20210663","operator_company_name":"안다아시아벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"안다아시아벤처스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.868Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1817: 안다소재부품벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210663',
  '안다소재부품벤처투자조합',
  7410000000,
  '2022-02-07',
  '{"fund_id":"AS20220117","registration_date":"2022-02-07","expiry_date":"2027-02-06","formation_total_amount":"74.1","investment_character_code":"25","industry_code":"1","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20210663","operator_company_name":"안다아시아벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"안다아시아벤처스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.868Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1818: 안다바이오벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210663',
  '안다바이오벤처투자조합',
  4100000000,
  '2023-10-27',
  '{"fund_id":"AS20230991","registration_date":"2023-10-27","expiry_date":"2028-10-26","formation_total_amount":"41.0","investment_character_code":"25","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20210663","operator_company_name":"안다아시아벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"안다아시아벤처스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.868Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1819: 안다모빌리티인프라투자조합3호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210663',
  '안다모빌리티인프라투자조합3호',
  2000000000,
  '2024-12-05',
  '{"fund_id":"AS20241272","registration_date":"2024-12-05","expiry_date":"2029-12-04","formation_total_amount":"20.0","investment_character_code":"25","industry_code":"9","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20210663","operator_company_name":"안다아시아벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"안다아시아벤처스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.868Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1820: 안다모빌리티인프라투자조합2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210663',
  '안다모빌리티인프라투자조합2호',
  12400000000,
  '2023-06-20',
  '{"fund_id":"AS20230519","registration_date":"2023-06-20","expiry_date":"2028-06-19","formation_total_amount":"124.0","investment_character_code":"25","industry_code":"9","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20210663","operator_company_name":"안다아시아벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"안다아시아벤처스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.868Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1821: 안다모빌리티인프라투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210663',
  '안다모빌리티인프라투자조합1호',
  7600000000,
  '2022-12-09',
  '{"fund_id":"AS20221443","registration_date":"2022-12-09","expiry_date":"2027-12-08","formation_total_amount":"76.0","investment_character_code":"25","industry_code":"9","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20210663","operator_company_name":"안다아시아벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"안다아시아벤처스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.868Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1822: 아트임팩트 투자조합2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20220535',
  '아트임팩트 투자조합2호',
  200000000,
  '2023-04-18',
  '{"fund_id":"AS20230286","registration_date":"2023-04-18","expiry_date":"2028-04-17","formation_total_amount":"2.0","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20220535","operator_company_name":"아트임팩트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"아트임팩트","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.868Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1823: 아트임팩트 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20220535',
  '아트임팩트 투자조합',
  110000000,
  '2023-02-01',
  '{"fund_id":"AS20230060","registration_date":"2023-02-01","expiry_date":"2028-01-31","formation_total_amount":"1.1","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20220535","operator_company_name":"아트임팩트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"아트임팩트","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.868Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1824: 아타카마-벤처스개인투자조합7호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210403',
  '아타카마-벤처스개인투자조합7호',
  120000000,
  '2024-10-11',
  '{"fund_id":"AS20240919","registration_date":"2024-10-11","expiry_date":"2029-10-10","formation_total_amount":"1.2","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20210403","operator_company_name":"미라벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"미라벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.868Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1825: 아타카마-벤처스개인투자조합6호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210403',
  '아타카마-벤처스개인투자조합6호',
  320000000,
  '2024-07-31',
  '{"fund_id":"AS20240672","registration_date":"2024-07-31","expiry_date":"2029-07-30","formation_total_amount":"3.2","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20210403","operator_company_name":"미라벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"미라벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.869Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1826: 아타카마-벤처스개인투자조합5호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210403',
  '아타카마-벤처스개인투자조합5호',
  330000000,
  '2024-05-09',
  '{"fund_id":"AS20240372","registration_date":"2024-05-09","expiry_date":"2029-05-08","formation_total_amount":"3.3","investment_character_code":"","industry_code":"3","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20210403","operator_company_name":"미라벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"미라벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.869Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1827: 아타카마-벤처스개인투자조합4호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210403',
  '아타카마-벤처스개인투자조합4호',
  120000000,
  '2024-01-31',
  '{"fund_id":"AS20240063","registration_date":"2024-01-31","expiry_date":"2029-01-30","formation_total_amount":"1.2","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20210403","operator_company_name":"미라벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"미라벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.869Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1828: 아타카마-벤처스개인투자조합3호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210403',
  '아타카마-벤처스개인투자조합3호',
  1090000000,
  '2023-12-26',
  '{"fund_id":"AS20231317","registration_date":"2023-12-26","expiry_date":"2028-12-25","formation_total_amount":"10.9","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20210403","operator_company_name":"미라벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"미라벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.869Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1829: 아타카마-벤처스개인투자조합2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210403',
  '아타카마-벤처스개인투자조합2호',
  190000000,
  '2022-12-23',
  '{"fund_id":"AS20230014","registration_date":"2022-12-23","expiry_date":"2027-12-22","formation_total_amount":"1.9","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20210403","operator_company_name":"미라벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"미라벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.869Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1830: 아타카마-벤처스개인투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210403',
  '아타카마-벤처스개인투자조합1호',
  230000000,
  '2022-08-26',
  '{"fund_id":"AS20220939","registration_date":"2022-08-26","expiry_date":"2027-08-25","formation_total_amount":"2.3","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20210403","operator_company_name":"미라벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"미라벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.869Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1831: 아타카마-바이오개인투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210403',
  '아타카마-바이오개인투자조합1호',
  230000000,
  '2022-02-17',
  '{"fund_id":"AS20220151","registration_date":"2022-02-17","expiry_date":"2027-02-16","formation_total_amount":"2.3","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20210403","operator_company_name":"미라벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"미라벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.869Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1832: 아크로셀 개인투자조합 제2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190163',
  '아크로셀 개인투자조합 제2호',
  270000000,
  '2022-08-12',
  '{"fund_id":"AS20220882","registration_date":"2022-08-12","expiry_date":"2027-08-11","formation_total_amount":"2.7","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190163","operator_company_name":"컴퍼니엑스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"컴퍼니엑스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.869Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1833: 아주Life Science 해외진출 Platform 펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19740001',
  '아주Life Science 해외진출 Platform 펀드',
  60000000000,
  '2013-11-29',
  '{"fund_id":"AS20130056","registration_date":"2013-11-29","expiry_date":"2025-11-27","formation_total_amount":"600.0","investment_character_code":"15","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP19740001","operator_company_name":"아주아이비투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"아주아이비투자","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.869Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1834: 아주 중소·벤처 해외진출 지원 펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19740001',
  '아주 중소·벤처 해외진출 지원 펀드',
  50000000000,
  '2015-08-31',
  '{"fund_id":"AS20150073","registration_date":"2015-08-31","expiry_date":"2025-08-30","formation_total_amount":"500.0","investment_character_code":"15","industry_code":"4","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP19740001","operator_company_name":"아주아이비투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"아주아이비투자","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.869Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1835: 아주 좋은 초격차 스케일업 펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19740001',
  '아주 좋은 초격차 스케일업 펀드',
  100000000000,
  '2023-12-26',
  '{"fund_id":"AS20231342","registration_date":"2023-12-26","expiry_date":"2031-12-25","formation_total_amount":"1000.0","investment_character_code":"03","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP19740001","operator_company_name":"아주아이비투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"아주아이비투자","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.869Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1836: 아주 좋은 창업초기 펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19740001',
  '아주 좋은 창업초기 펀드',
  14500000000,
  '2021-06-21',
  '{"fund_id":"AS20210505","registration_date":"2021-06-21","expiry_date":"2029-06-20","formation_total_amount":"145.0","investment_character_code":"20","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP19740001","operator_company_name":"아주아이비투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"아주아이비투자","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.869Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1837: 아일럼 에이아이-애그리 벤처투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20220146',
  '아일럼 에이아이-애그리 벤처투자조합 1호',
  2200000000,
  '2023-09-18',
  '{"fund_id":"AS20230837","registration_date":"2023-09-18","expiry_date":"2028-09-17","formation_total_amount":"22.0","investment_character_code":"28","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20220146","operator_company_name":"아일럼인베스트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"아일럼인베스트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.869Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1838: 아이피텍코리아 진화 개인투자조합 9호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200369',
  '아이피텍코리아 진화 개인투자조합 9호',
  650000000,
  '2022-04-12',
  '{"fund_id":"AS20220386","registration_date":"2022-04-12","expiry_date":"2032-04-04","formation_total_amount":"6.5","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200369","operator_company_name":"아이피텍코리아","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"아이피텍코리아","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.869Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1839: 아이피텍코리아 진화 개인투자조합 7호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200369',
  '아이피텍코리아 진화 개인투자조합 7호',
  320000000,
  '2022-03-07',
  '{"fund_id":"AS20220198","registration_date":"2022-03-07","expiry_date":"2027-02-27","formation_total_amount":"3.2","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200369","operator_company_name":"아이피텍코리아","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"아이피텍코리아","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.869Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1840: 아이피텍코리아 진화 개인투자조합 6호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200369',
  '아이피텍코리아 진화 개인투자조합 6호',
  540000000,
  '2021-12-28',
  '{"fund_id":"AS20211428","registration_date":"2021-12-28","expiry_date":"2026-12-27","formation_total_amount":"5.4","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200369","operator_company_name":"아이피텍코리아","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"아이피텍코리아","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.869Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1841: 아이피텍코리아 진화 개인투자조합 5호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200369',
  '아이피텍코리아 진화 개인투자조합 5호',
  870000000,
  '2021-08-04',
  '{"fund_id":"AS20210661","registration_date":"2021-08-04","expiry_date":"2026-08-03","formation_total_amount":"8.7","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200369","operator_company_name":"아이피텍코리아","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"아이피텍코리아","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.869Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1842: 아이피텍코리아 진화 개인투자조합 4호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200369',
  '아이피텍코리아 진화 개인투자조합 4호',
  870000000,
  '2021-07-21',
  '{"fund_id":"AS20210563","registration_date":"2021-07-21","expiry_date":"2026-07-20","formation_total_amount":"8.7","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200369","operator_company_name":"아이피텍코리아","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"아이피텍코리아","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.869Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1843: 아이피텍코리아 진화 개인투자조합 2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200369',
  '아이피텍코리아 진화 개인투자조합 2호',
  2480000000,
  '2021-06-16',
  '{"fund_id":"AS20210445","registration_date":"2021-06-16","expiry_date":"2026-06-15","formation_total_amount":"24.8","investment_character_code":"","industry_code":"4","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200369","operator_company_name":"아이피텍코리아","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"아이피텍코리아","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.869Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1844: 아이피텍코리아 개인투자조합12호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200369',
  '아이피텍코리아 개인투자조합12호',
  310000000,
  '2024-11-21',
  '{"fund_id":"AS20241172","registration_date":"2024-11-21","expiry_date":"2029-11-19","formation_total_amount":"3.1","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200369","operator_company_name":"아이피텍코리아","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"아이피텍코리아","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.869Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1845: 아이피텍코리아 개인투자조합 11호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200369',
  '아이피텍코리아 개인투자조합 11호',
  270000000,
  '2023-05-25',
  '{"fund_id":"AS20230413","registration_date":"2023-05-25","expiry_date":"2028-05-21","formation_total_amount":"2.7","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200369","operator_company_name":"아이피텍코리아","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"아이피텍코리아","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.869Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1846: 아이피에스(IPS)스타트업프로젝트7호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190084',
  '아이피에스(IPS)스타트업프로젝트7호 투자조합',
  210000000,
  '2024-05-30',
  '{"fund_id":"AS20240471","registration_date":"2024-05-30","expiry_date":"2029-05-29","formation_total_amount":"2.1","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190084","operator_company_name":"아이피에스벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"아이피에스벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.869Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1847: 아이피에스(IPS)스타트업프로젝트6호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190084',
  '아이피에스(IPS)스타트업프로젝트6호 투자조합',
  830000000,
  '2023-07-19',
  '{"fund_id":"AS20230594","registration_date":"2023-07-19","expiry_date":"2028-07-18","formation_total_amount":"8.3","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190084","operator_company_name":"아이피에스벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"아이피에스벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.869Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1848: 아이피에스(IPS)스타트업프로젝트5호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190084',
  '아이피에스(IPS)스타트업프로젝트5호 투자조합',
  300000000,
  '2022-06-08',
  '{"fund_id":"AS20220552","registration_date":"2022-06-08","expiry_date":"2027-06-07","formation_total_amount":"3.0","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190084","operator_company_name":"아이피에스벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"아이피에스벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.869Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1849: 아이피에스(IPS)스타트업프로젝트4호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190084',
  '아이피에스(IPS)스타트업프로젝트4호 투자조합',
  600000000,
  '2022-04-01',
  '{"fund_id":"AS20220269","registration_date":"2022-04-01","expiry_date":"2027-03-30","formation_total_amount":"6.0","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190084","operator_company_name":"아이피에스벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"아이피에스벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.869Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1850: 아이피에스(IPS)스타트업프로젝트3호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190084',
  '아이피에스(IPS)스타트업프로젝트3호 투자조합',
  3390000000,
  '2022-01-05',
  '{"fund_id":"AS20211458","registration_date":"2022-01-05","expiry_date":"2027-01-04","formation_total_amount":"33.9","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190084","operator_company_name":"아이피에스벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"아이피에스벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.869Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Minimal Batch 37 completed! 50 fund records processed.
-- Progress: 1850/3689 total records

