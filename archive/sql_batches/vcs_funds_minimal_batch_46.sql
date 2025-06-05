-- VCS Fund MINIMAL UPSERT Batch 46/74 (Records 2251-2300)
-- MINIMAL: Only using basic columns that definitely exist
-- Generated from VCS API Scraper fund data
-- Generated at: 2025-06-05T00:40:21.907Z
-- Schema: Minimal fund_table structure (basic columns only)

-- MINIMAL FUND DATA (UPSERT - Safe for Duplicates)
-- Processing 50 fund records
-- Will INSERT new records or UPDATE existing ones

-- Record 2251: 스마일게이트넥스트커머스1호펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19990003',
  '스마일게이트넥스트커머스1호펀드',
  7200000000,
  '2021-06-03',
  '{"fund_id":"AS20210451","registration_date":"2021-06-03","expiry_date":"2026-06-02","formation_total_amount":"72.0","investment_character_code":"01","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP19990003","operator_company_name":"스마일게이트인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"스마일게이트인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.907Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2252: 스마일게이트넥스트웨이브1호펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19990003',
  '스마일게이트넥스트웨이브1호펀드',
  31500000000,
  '2023-06-12',
  '{"fund_id":"AS20230475","registration_date":"2023-06-12","expiry_date":"2032-06-11","formation_total_amount":"315.0","investment_character_code":"15","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP19990003","operator_company_name":"스마일게이트인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"스마일게이트인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.907Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2253: 스마일게이트글로벌유니콘2호펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19990003',
  '스마일게이트글로벌유니콘2호펀드',
  8550000000,
  '2021-11-08',
  '{"fund_id":"AS20211100","registration_date":"2021-11-08","expiry_date":"2026-11-07","formation_total_amount":"85.5","investment_character_code":"01","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP19990003","operator_company_name":"스마일게이트인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"스마일게이트인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.907Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2254: 스마일게이트글로벌유니콘1호펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19990003',
  '스마일게이트글로벌유니콘1호펀드',
  13010000000,
  '2021-03-30',
  '{"fund_id":"AS20210240","registration_date":"2021-03-30","expiry_date":"2026-03-29","formation_total_amount":"130.1","investment_character_code":"25","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP19990003","operator_company_name":"스마일게이트인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"스마일게이트인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.907Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2255: 스마일게이트Follow-on투자펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19990003',
  '스마일게이트Follow-on투자펀드',
  32000000000,
  '2017-02-10',
  '{"fund_id":"AS20170021","registration_date":"2017-02-10","expiry_date":"2026-02-09","formation_total_amount":"320.0","investment_character_code":"20","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP19990003","operator_company_name":"스마일게이트인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"스마일게이트인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.907Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2256: 스마일게이트 엑스알 콘텐츠펀드2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19990003',
  '스마일게이트 엑스알 콘텐츠펀드2호',
  47000000000,
  '2021-09-29',
  '{"fund_id":"AS20210914","registration_date":"2021-09-29","expiry_date":"2029-09-28","formation_total_amount":"470.0","investment_character_code":"24","industry_code":"2","investment_field_type":"문화","investment_field_detail_type":"문화 기타","mother_fund_id":"MF00000001","operator_company_id":"OP19990003","operator_company_name":"스마일게이트인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"스마일게이트인베스트먼트","investment_focus":["문화 기타","문화"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.907Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2257: 스마일게이트 엑스알 콘텐츠펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19990003',
  '스마일게이트 엑스알 콘텐츠펀드',
  15000000000,
  '2019-12-31',
  '{"fund_id":"AS20200008","registration_date":"2019-12-31","expiry_date":"2026-12-30","formation_total_amount":"150.0","investment_character_code":"02","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP19990003","operator_company_name":"스마일게이트인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"스마일게이트인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.907Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2258: 스마일게이트 소재부품 투자펀드 2014-3호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19990003',
  '스마일게이트 소재부품 투자펀드 2014-3호',
  30000000000,
  '2014-11-07',
  '{"fund_id":"AS20140060","registration_date":"2014-11-07","expiry_date":"2025-11-06","formation_total_amount":"300.0","investment_character_code":"03","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"부품소재","mother_fund_id":"MF00000001","operator_company_id":"OP19990003","operator_company_name":"스마일게이트인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"스마일게이트인베스트먼트","investment_focus":["부품소재","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.907Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2259: 스닉픽 팔로우온3호 조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190183',
  '스닉픽 팔로우온3호 조합',
  2100000000,
  '2024-12-16',
  '{"fund_id":"AS20241352","registration_date":"2024-12-16","expiry_date":"2029-12-15","formation_total_amount":"21.0","investment_character_code":"04","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"바이오","mother_fund_id":"","operator_company_id":"OP20190183","operator_company_name":"스닉픽인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"스닉픽인베스트먼트","investment_focus":["바이오","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.907Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2260: 스닉픽 팔로우온2호 조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190183',
  '스닉픽 팔로우온2호 조합',
  2100000000,
  '2021-07-05',
  '{"fund_id":"AS20210555","registration_date":"2021-07-05","expiry_date":"2026-07-04","formation_total_amount":"21.0","investment_character_code":"04","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"바이오","mother_fund_id":"","operator_company_id":"OP20190183","operator_company_name":"스닉픽인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"스닉픽인베스트먼트","investment_focus":["바이오","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.907Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2261: 스닉픽 팔로우온1호 조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190183',
  '스닉픽 팔로우온1호 조합',
  2100000000,
  '2021-05-27',
  '{"fund_id":"AS20210422","registration_date":"2021-05-27","expiry_date":"2026-05-26","formation_total_amount":"21.0","investment_character_code":"04","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"바이오","mother_fund_id":"","operator_company_id":"OP20190183","operator_company_name":"스닉픽인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"스닉픽인베스트먼트","investment_focus":["바이오","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.907Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2262: 스닉픽 바이오소부장 국산화 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190183',
  '스닉픽 바이오소부장 국산화 투자조합',
  20000000000,
  '2024-08-01',
  '{"fund_id":"AS20240722","registration_date":"2024-08-01","expiry_date":"2031-07-31","formation_total_amount":"200.0","investment_character_code":"04","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20190183","operator_company_name":"스닉픽인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"스닉픽인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.907Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2263: 스닉픽 바이오3호 조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190183',
  '스닉픽 바이오3호 조합',
  5100000000,
  '2021-11-03',
  '{"fund_id":"AS20211079","registration_date":"2021-11-03","expiry_date":"2026-11-02","formation_total_amount":"51.0","investment_character_code":"04","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20190183","operator_company_name":"스닉픽인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"스닉픽인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.907Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2264: 스닉픽 바이오2호 조합 
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190183',
  '스닉픽 바이오2호 조합 ',
  4500000000,
  '2020-06-30',
  '{"fund_id":"AS20200295","registration_date":"2020-06-30","expiry_date":"2025-06-29","formation_total_amount":"45.0","investment_character_code":"01","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"바이오","mother_fund_id":"","operator_company_id":"OP20190183","operator_company_name":"스닉픽인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"스닉픽인베스트먼트","investment_focus":["바이오","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.907Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2265: 스노우볼투자조합 3호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20130001',
  '스노우볼투자조합 3호',
  2000000000,
  '2017-09-14',
  '{"fund_id":"AS20170108","registration_date":"2017-09-14","expiry_date":"2025-09-13","formation_total_amount":"20.0","investment_character_code":"01","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20130001","operator_company_name":"마이다스동아인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"마이다스동아인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.907Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2266: 슈미트팔로우온개인벤처조합제1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20180015',
  '슈미트팔로우온개인벤처조합제1호',
  1570000000,
  '2020-04-06',
  '{"fund_id":"AS20200155","registration_date":"2020-04-06","expiry_date":"2026-04-05","formation_total_amount":"15.7","investment_character_code":"","industry_code":"3","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20180015","operator_company_name":"슈미트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"슈미트","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.908Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2267: 슈미트밸류업개인투자조합제9호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20180015',
  '슈미트밸류업개인투자조합제9호',
  4300000000,
  '2021-04-15',
  '{"fund_id":"AS20210288","registration_date":"2021-04-15","expiry_date":"2029-04-14","formation_total_amount":"43.0","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20180015","operator_company_name":"슈미트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"슈미트","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.908Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2268: 슈미트밸류업개인투자조합제8호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20180015',
  '슈미트밸류업개인투자조합제8호',
  4450000000,
  '2021-03-15',
  '{"fund_id":"AS20210172","registration_date":"2021-03-15","expiry_date":"2029-03-14","formation_total_amount":"44.5","investment_character_code":"","industry_code":"3","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20180015","operator_company_name":"슈미트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"슈미트","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.908Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2269: 슈미트밸류업개인투자조합제7호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20180015',
  '슈미트밸류업개인투자조합제7호',
  3800000000,
  '2021-02-09',
  '{"fund_id":"AS20210090","registration_date":"2021-02-09","expiry_date":"2029-02-08","formation_total_amount":"38.0","investment_character_code":"","industry_code":"3","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20180015","operator_company_name":"슈미트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"슈미트","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.908Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2270: 슈미트밸류업개인투자조합제6호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20180015',
  '슈미트밸류업개인투자조합제6호',
  2500000000,
  '2020-08-10',
  '{"fund_id":"AS20200395","registration_date":"2020-08-10","expiry_date":"2028-08-09","formation_total_amount":"25.0","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20180015","operator_company_name":"슈미트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"슈미트","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.908Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2271: 슈미트밸류업개인투자조합제5호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20180015',
  '슈미트밸류업개인투자조합제5호',
  3000000000,
  '2020-06-01',
  '{"fund_id":"AS20200237","registration_date":"2020-06-01","expiry_date":"2028-05-31","formation_total_amount":"30.0","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20180015","operator_company_name":"슈미트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"슈미트","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.908Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2272: 슈미트밸류업개인투자조합제18호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20180015',
  '슈미트밸류업개인투자조합제18호',
  5200000000,
  '2025-02-24',
  '{"fund_id":"AS20250126","registration_date":"2025-02-24","expiry_date":"2033-02-23","formation_total_amount":"52.0","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20180015","operator_company_name":"슈미트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"슈미트","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.908Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2273: 슈미트밸류업개인투자조합제17호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20180015',
  '슈미트밸류업개인투자조합제17호',
  5700000000,
  '2024-05-20',
  '{"fund_id":"AS20240431","registration_date":"2024-05-20","expiry_date":"2032-05-19","formation_total_amount":"57.0","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20180015","operator_company_name":"슈미트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"슈미트","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.908Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2274: 슈미트밸류업개인투자조합제16호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20180015',
  '슈미트밸류업개인투자조합제16호',
  5700000000,
  '2024-04-12',
  '{"fund_id":"AS20240257","registration_date":"2024-04-12","expiry_date":"2032-04-11","formation_total_amount":"57.0","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20180015","operator_company_name":"슈미트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"슈미트","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.908Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2275: 슈미트밸류업개인투자조합제15호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20180015',
  '슈미트밸류업개인투자조합제15호',
  5400000000,
  '2023-03-29',
  '{"fund_id":"AS20230214","registration_date":"2023-03-29","expiry_date":"2031-03-28","formation_total_amount":"54.0","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20180015","operator_company_name":"슈미트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"슈미트","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.908Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2276: 슈미트밸류업개인투자조합제14호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20180015',
  '슈미트밸류업개인투자조합제14호',
  5600000000,
  '2023-02-15',
  '{"fund_id":"AS20230089","registration_date":"2023-02-15","expiry_date":"2031-02-14","formation_total_amount":"56.0","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20180015","operator_company_name":"슈미트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"슈미트","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.908Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2277: 슈미트밸류업개인투자조합제13호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20180015',
  '슈미트밸류업개인투자조합제13호',
  5500000000,
  '2022-09-27',
  '{"fund_id":"AS20221051","registration_date":"2022-09-27","expiry_date":"2030-09-26","formation_total_amount":"55.0","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20180015","operator_company_name":"슈미트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"슈미트","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.908Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2278: 슈미트밸류업개인투자조합제12호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20180015',
  '슈미트밸류업개인투자조합제12호',
  5300000000,
  '2022-04-14',
  '{"fund_id":"AS20220361","registration_date":"2022-04-14","expiry_date":"2030-04-13","formation_total_amount":"53.0","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20180015","operator_company_name":"슈미트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"슈미트","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.908Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2279: 슈미트밸류업개인투자조합제11호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20180015',
  '슈미트밸류업개인투자조합제11호',
  4850000000,
  '2022-02-07',
  '{"fund_id":"AS20220108","registration_date":"2022-02-07","expiry_date":"2030-02-06","formation_total_amount":"48.5","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20180015","operator_company_name":"슈미트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"슈미트","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.908Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2280: 슈미트밸류업개인투자조합제10호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20180015',
  '슈미트밸류업개인투자조합제10호',
  4600000000,
  '2021-08-20',
  '{"fund_id":"AS20210742","registration_date":"2021-08-20","expiry_date":"2029-08-19","formation_total_amount":"46.0","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20180015","operator_company_name":"슈미트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"슈미트","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.908Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2281: 슈미트밸류업개인벤처조합제4호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20180015',
  '슈미트밸류업개인벤처조합제4호',
  2000000000,
  '2019-11-08',
  '{"fund_id":"AS20190489","registration_date":"2019-11-08","expiry_date":"2027-11-07","formation_total_amount":"20.0","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20180015","operator_company_name":"슈미트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"슈미트","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.908Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2282: 슈미트밸류업개인벤처조합제3호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20180015',
  '슈미트밸류업개인벤처조합제3호',
  4200000000,
  '2019-08-19',
  '{"fund_id":"AS20190358","registration_date":"2019-08-19","expiry_date":"2027-08-18","formation_total_amount":"42.0","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20180015","operator_company_name":"슈미트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"슈미트","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.908Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2283: 슈미트밸류업개인벤처조합제2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20180015',
  '슈미트밸류업개인벤처조합제2호',
  3700000000,
  '2019-05-01',
  '{"fund_id":"AS20190157","registration_date":"2019-05-01","expiry_date":"2027-04-30","formation_total_amount":"37.0","investment_character_code":"","industry_code":"3","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20180015","operator_company_name":"슈미트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"슈미트","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.908Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2284: 슈미트밸류업개인벤처조합제1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20180015',
  '슈미트밸류업개인벤처조합제1호',
  3700000000,
  '2018-08-08',
  '{"fund_id":"AS20180287","registration_date":"2018-08-08","expiry_date":"2026-08-26","formation_total_amount":"37.0","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20180015","operator_company_name":"슈미트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"슈미트","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.908Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2285: 슈미트마이스터벤처투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20180015',
  '슈미트마이스터벤처투자조합1호',
  9000000000,
  '2021-04-20',
  '{"fund_id":"AS20210308","registration_date":"2021-04-20","expiry_date":"2029-04-19","formation_total_amount":"90.0","investment_character_code":"20","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20180015","operator_company_name":"슈미트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"슈미트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.908Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2286: 슈미트-DSC 미래모빌리티펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20180015',
  '슈미트-DSC 미래모빌리티펀드',
  80000000000,
  '2021-12-30',
  '{"fund_id":"AS20220003","registration_date":"2021-12-30","expiry_date":"2031-12-29","formation_total_amount":"800.0","investment_character_code":"20","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20180015","operator_company_name":"슈미트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"슈미트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.908Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2287: 수인베스트먼트 플랫폼 유니콘 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20170014',
  '수인베스트먼트 플랫폼 유니콘 투자조합',
  30000000000,
  '2019-12-13',
  '{"fund_id":"AS20190591","registration_date":"2019-12-13","expiry_date":"2029-12-12","formation_total_amount":"300.0","investment_character_code":"02","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20170014","operator_company_name":"수인베스트먼트캐피탈","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"수인베스트먼트캐피탈","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.908Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2288: 수인베스트먼트 동북지역뉴딜 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20170014',
  '수인베스트먼트 동북지역뉴딜 투자조합',
  10000000000,
  '2022-07-06',
  '{"fund_id":"AS20220747","registration_date":"2022-07-06","expiry_date":"2030-07-05","formation_total_amount":"100.0","investment_character_code":"18","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20170014","operator_company_name":"수인베스트먼트캐피탈","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"수인베스트먼트캐피탈","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.908Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2289: 수이제네리스 제1호 벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20220057',
  '수이제네리스 제1호 벤처투자조합',
  17500000000,
  '2022-05-26',
  '{"fund_id":"AS20220592","registration_date":"2022-05-26","expiry_date":"2028-05-25","formation_total_amount":"175.0","investment_character_code":"02","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20220057","operator_company_name":"수이제네리스파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"수이제네리스파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.908Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2290: 수이제네리스 루모스 제4호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20220057',
  '수이제네리스 루모스 제4호 투자조합',
  2000000000,
  '2025-04-29',
  '{"fund_id":"AS20250337","registration_date":"2025-04-29","expiry_date":"2030-04-28","formation_total_amount":"20.0","investment_character_code":"25","industry_code":"9","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20220057","operator_company_name":"수이제네리스파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"수이제네리스파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.908Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2291: 수이제네리스 루모스 제3호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20220057',
  '수이제네리스 루모스 제3호 투자조합',
  8500000000,
  '2025-03-24',
  '{"fund_id":"AS20250217","registration_date":"2025-03-24","expiry_date":"2032-03-23","formation_total_amount":"85.0","investment_character_code":"25","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20220057","operator_company_name":"수이제네리스파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"수이제네리스파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.908Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2292: 수이제네리스 루모스 제2호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20220057',
  '수이제네리스 루모스 제2호 투자조합',
  20250000000,
  '2024-10-17',
  '{"fund_id":"AS20241000","registration_date":"2024-10-17","expiry_date":"2029-10-16","formation_total_amount":"202.5","investment_character_code":"16","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20220057","operator_company_name":"수이제네리스파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"수이제네리스파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.908Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2293: 수이제네리스 루모스 제1호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20220057',
  '수이제네리스 루모스 제1호 투자조합',
  3210000000,
  '2024-07-30',
  '{"fund_id":"AS20240706","registration_date":"2024-07-30","expiry_date":"2029-07-29","formation_total_amount":"32.1","investment_character_code":"04","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20220057","operator_company_name":"수이제네리스파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"수이제네리스파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.908Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2294: 수이제네리스 글로벌 스케일업 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20220057',
  '수이제네리스 글로벌 스케일업 투자조합',
  4200000000,
  '2023-12-28',
  '{"fund_id":"AS20231351","registration_date":"2023-12-28","expiry_date":"2029-12-27","formation_total_amount":"42.0","investment_character_code":"28","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20220057","operator_company_name":"수이제네리스파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"수이제네리스파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.908Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2295: 수 하이비젼 엠씨엠 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20170014',
  '수 하이비젼 엠씨엠 투자조합',
  16700000000,
  '2022-09-16',
  '{"fund_id":"AS20221064","registration_date":"2022-09-16","expiry_date":"2030-09-15","formation_total_amount":"167.0","investment_character_code":"06","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20170014","operator_company_name":"수인베스트먼트캐피탈","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"수인베스트먼트캐피탈","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.908Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2296: 송현-바로 스마트워터 지역혁신 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20120004',
  '송현-바로 스마트워터 지역혁신 투자조합',
  20000000000,
  '2024-07-03',
  '{"fund_id":"AS20240595","registration_date":"2024-07-03","expiry_date":"2032-07-02","formation_total_amount":"200.0","investment_character_code":"18","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000016","operator_company_id":"OP20120004","operator_company_name":"송현인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"송현인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.908Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2297: 송현-바로 스마트워터 지역혁신 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20230054',
  '송현-바로 스마트워터 지역혁신 투자조합',
  20000000000,
  '2024-07-03',
  '{"fund_id":"AS20240595","registration_date":"2024-07-03","expiry_date":"2032-07-02","formation_total_amount":"200.0","investment_character_code":"18","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000016","operator_company_id":"OP20230054","operator_company_name":"바로벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"바로벤처스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.908Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2298: 송현 K-크라우드 펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20120004',
  '송현 K-크라우드 펀드',
  4700000000,
  '2016-03-24',
  '{"fund_id":"AS20160029","registration_date":"2016-03-24","expiry_date":"2026-03-23","formation_total_amount":"47.0","investment_character_code":"02","industry_code":"9","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20120004","operator_company_name":"송현인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"송현인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.908Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2299: 송현 e-신산업 펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20120004',
  '송현 e-신산업 펀드',
  93000000000,
  '2017-11-16',
  '{"fund_id":"AS20170131","registration_date":"2017-11-16","expiry_date":"2025-11-15","formation_total_amount":"930.0","investment_character_code":"11","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"에너지","mother_fund_id":"MF00000001","operator_company_id":"OP20120004","operator_company_name":"송현인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"송현인베스트먼트","investment_focus":["에너지","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.908Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2300: 솔트룩스-인라이트 K-컬처 신기술투자펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20220645',
  '솔트룩스-인라이트 K-컬처 신기술투자펀드',
  33400000000,
  '2024-08-13',
  '{"fund_id":"AS20240778","registration_date":"2024-08-13","expiry_date":"2032-08-12","formation_total_amount":"334.0","investment_character_code":"10","industry_code":"6","investment_field_type":"일반","investment_field_detail_type":"일반 기타","mother_fund_id":"MF00000001","operator_company_id":"OP20220645","operator_company_name":"인라이트벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"인라이트벤처스","investment_focus":["일반 기타","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.908Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Minimal Batch 46 completed! 50 fund records processed.
-- Progress: 2300/3689 total records

