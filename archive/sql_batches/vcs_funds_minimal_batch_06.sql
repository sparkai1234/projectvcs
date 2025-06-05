-- VCS Fund MINIMAL UPSERT Batch 6/74 (Records 251-300)
-- MINIMAL: Only using basic columns that definitely exist
-- Generated from VCS API Scraper fund data
-- Generated at: 2025-06-05T00:40:21.650Z
-- Schema: Minimal fund_table structure (basic columns only)

-- MINIMAL FUND DATA (UPSERT - Safe for Duplicates)
-- Processing 50 fund records
-- Will INSERT new records or UPDATE existing ones

-- Record 251: 페인터즈 앤 MLBS 벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190103',
  '페인터즈 앤 MLBS 벤처투자조합',
  1140000000,
  '2025-04-09',
  '{"fund_id":"AS20250276","registration_date":"2025-04-09","expiry_date":"2030-04-08","formation_total_amount":"11.4","investment_character_code":"16","industry_code":"9","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20190103","operator_company_name":"페인터즈앤벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"페인터즈앤벤처스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.650Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 252: 페인터즈 앤 LdV 벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190103',
  '페인터즈 앤 LdV 벤처투자조합',
  1000000000,
  '2025-04-14',
  '{"fund_id":"AS20250285","registration_date":"2025-04-14","expiry_date":"2035-04-13","formation_total_amount":"10.0","investment_character_code":"20","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20190103","operator_company_name":"페인터즈앤벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"페인터즈앤벤처스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.650Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 253: 페인터즈 앤 JSB 조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190103',
  '페인터즈 앤 JSB 조합',
  460000000,
  '2025-03-04',
  '{"fund_id":"AS20250138","registration_date":"2025-03-04","expiry_date":"2032-03-03","formation_total_amount":"4.6","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190103","operator_company_name":"페인터즈앤벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"페인터즈앤벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.650Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 254: 페이스메이커스4호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20170041',
  '페이스메이커스4호',
  100000000,
  '2024-12-30',
  '{"fund_id":"AS20241445","registration_date":"2024-12-30","expiry_date":"2030-01-31","formation_total_amount":"1.0","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20170041","operator_company_name":"페이스메이커스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"페이스메이커스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.650Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 255: 페이스메이커스3호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20170041',
  '페이스메이커스3호',
  1910000000,
  '2021-12-13',
  '{"fund_id":"AS20211272","registration_date":"2021-12-13","expiry_date":"2026-12-31","formation_total_amount":"19.1","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20170041","operator_company_name":"페이스메이커스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"페이스메이커스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.650Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 256: 페이스메이커스2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20170041',
  '페이스메이커스2호',
  100000000,
  '2020-12-22',
  '{"fund_id":"AS20200802","registration_date":"2020-12-22","expiry_date":"2025-12-31","formation_total_amount":"1.0","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20170041","operator_company_name":"페이스메이커스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"페이스메이커스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.650Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 257: 페이서파트너스 개인투자조합 5호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210452',
  '페이서파트너스 개인투자조합 5호',
  310000000,
  '2024-09-24',
  '{"fund_id":"AS20240917","registration_date":"2024-09-24","expiry_date":"2029-09-23","formation_total_amount":"3.1","investment_character_code":"","industry_code":"4","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20210452","operator_company_name":"(주)페이서파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"(주)페이서파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.650Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 258: 페이서파트너스 개인투자조합 3호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210452',
  '페이서파트너스 개인투자조합 3호',
  140000000,
  '2024-05-13',
  '{"fund_id":"AS20240398","registration_date":"2024-05-13","expiry_date":"2029-09-30","formation_total_amount":"1.4","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20210452","operator_company_name":"(주)페이서파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"(주)페이서파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.650Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 259: 페이서파트너스 개인투자조합 2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210452',
  '페이서파트너스 개인투자조합 2호',
  220000000,
  '2019-10-22',
  '{"fund_id":"AS20190455","registration_date":"2019-10-22","expiry_date":"2026-10-21","formation_total_amount":"2.2","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20210452","operator_company_name":"(주)페이서파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"(주)페이서파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.650Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 260: 페이서파트너스 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210452',
  '페이서파트너스 개인투자조합',
  230000000,
  '2023-02-07',
  '{"fund_id":"AS20230077","registration_date":"2023-02-07","expiry_date":"2028-08-31","formation_total_amount":"2.3","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20210452","operator_company_name":"(주)페이서파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"(주)페이서파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.650Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 261: 페블즈오픈워터 핀테크 투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190245',
  '페블즈오픈워터 핀테크 투자조합1호',
  3850000000,
  '2021-06-11',
  '{"fund_id":"AS20210472","registration_date":"2021-06-11","expiry_date":"2026-06-10","formation_total_amount":"38.5","investment_character_code":"25","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20190245","operator_company_name":"오픈워터인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"오픈워터인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.650Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 262: 퍼포먼스 마케팅 신기술 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20140013',
  '퍼포먼스 마케팅 신기술 투자조합',
  100000000,
  '2019-08-19',
  '{"fund_id":"AS20190357","registration_date":"2019-08-19","expiry_date":"2026-08-31","formation_total_amount":"1.0","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20140013","operator_company_name":"더인벤션랩","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"더인벤션랩","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.650Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 263: 퍼스트인클라스6호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190103',
  '퍼스트인클라스6호',
  340000000,
  '2020-06-08',
  '{"fund_id":"AS20200253","registration_date":"2020-06-08","expiry_date":"2025-06-07","formation_total_amount":"3.4","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190103","operator_company_name":"페인터즈앤벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"페인터즈앤벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.650Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 264: 퍼스트인클라스 9호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190103',
  '퍼스트인클라스 9호',
  380000000,
  '2020-11-23',
  '{"fund_id":"AS20200665","registration_date":"2020-11-23","expiry_date":"2025-11-22","formation_total_amount":"3.8","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190103","operator_company_name":"페인터즈앤벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"페인터즈앤벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.650Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 265: 퍼스트인클라스 8호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190103',
  '퍼스트인클라스 8호',
  120000000,
  '2020-11-05',
  '{"fund_id":"AS20200613","registration_date":"2020-11-05","expiry_date":"2025-11-04","formation_total_amount":"1.2","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190103","operator_company_name":"페인터즈앤벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"페인터즈앤벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.650Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 266: 퍼스트인클라스 7호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190103',
  '퍼스트인클라스 7호',
  110000000,
  '2020-09-04',
  '{"fund_id":"AS20200459","registration_date":"2020-09-04","expiry_date":"2025-09-03","formation_total_amount":"1.1","investment_character_code":"","industry_code":"4","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190103","operator_company_name":"페인터즈앤벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"페인터즈앤벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.650Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 267: 퍼스트인클라스 19호 조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190103',
  '퍼스트인클라스 19호 조합',
  140000000,
  '2022-09-08',
  '{"fund_id":"AS20220998","registration_date":"2022-09-08","expiry_date":"2027-09-07","formation_total_amount":"1.4","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190103","operator_company_name":"페인터즈앤벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"페인터즈앤벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.650Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 268: 퍼스트인클라스 18호 조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190103',
  '퍼스트인클라스 18호 조합',
  220000000,
  '2021-08-23',
  '{"fund_id":"AS20210735","registration_date":"2021-08-23","expiry_date":"2026-08-22","formation_total_amount":"2.2","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190103","operator_company_name":"페인터즈앤벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"페인터즈앤벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.650Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 269: 퍼스트인클라스 17호 조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190103',
  '퍼스트인클라스 17호 조합',
  740000000,
  '2021-09-10',
  '{"fund_id":"AS20210838","registration_date":"2021-09-10","expiry_date":"2026-09-09","formation_total_amount":"7.4","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190103","operator_company_name":"페인터즈앤벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"페인터즈앤벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.650Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 270: 퍼스트인클라스 16호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190103',
  '퍼스트인클라스 16호',
  190000000,
  '2021-07-15',
  '{"fund_id":"AS20210548","registration_date":"2021-07-15","expiry_date":"2026-06-30","formation_total_amount":"1.9","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190103","operator_company_name":"페인터즈앤벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"페인터즈앤벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.650Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 271: 퍼스트인클라스 15호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190103',
  '퍼스트인클라스 15호',
  210000000,
  '2021-05-11',
  '{"fund_id":"AS20210354","registration_date":"2021-05-11","expiry_date":"2026-05-10","formation_total_amount":"2.1","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190103","operator_company_name":"페인터즈앤벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"페인터즈앤벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.650Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 272: 퍼스트인클라스 14호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190103',
  '퍼스트인클라스 14호',
  100000000,
  '2021-05-10',
  '{"fund_id":"AS20210346","registration_date":"2021-05-10","expiry_date":"2026-05-09","formation_total_amount":"1.0","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190103","operator_company_name":"페인터즈앤벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"페인터즈앤벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.650Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 273: 퍼스트인클라스 13호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190103',
  '퍼스트인클라스 13호',
  260000000,
  '2021-03-11',
  '{"fund_id":"AS20210163","registration_date":"2021-03-11","expiry_date":"2026-03-10","formation_total_amount":"2.6","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190103","operator_company_name":"페인터즈앤벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"페인터즈앤벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.650Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 274: 퍼스트인클라스 12호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190103',
  '퍼스트인클라스 12호',
  150000000,
  '2021-03-02',
  '{"fund_id":"AS20210146","registration_date":"2021-03-02","expiry_date":"2026-03-01","formation_total_amount":"1.5","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190103","operator_company_name":"페인터즈앤벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"페인터즈앤벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.650Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 275: 퍼스트인클라스 11호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190103',
  '퍼스트인클라스 11호',
  280000000,
  '2021-01-12',
  '{"fund_id":"AS20210027","registration_date":"2021-01-12","expiry_date":"2026-01-11","formation_total_amount":"2.8","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190103","operator_company_name":"페인터즈앤벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"페인터즈앤벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.650Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 276: 퍼스트인클라스 10호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190103',
  '퍼스트인클라스 10호',
  280000000,
  '2020-11-23',
  '{"fund_id":"AS20200686","registration_date":"2020-11-23","expiry_date":"2025-11-22","formation_total_amount":"2.8","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190103","operator_company_name":"페인터즈앤벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"페인터즈앤벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.650Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 277: 퍼스트스텝제6호조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200377',
  '퍼스트스텝제6호조합',
  550000000,
  '2024-12-18',
  '{"fund_id":"AS20241340","registration_date":"2024-12-18","expiry_date":"2029-12-17","formation_total_amount":"5.5","investment_character_code":"","industry_code":"7","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200377","operator_company_name":"퍼스트스텝랩스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"퍼스트스텝랩스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.651Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 278: 퍼스트스텝제5호조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200377',
  '퍼스트스텝제5호조합',
  1990000000,
  '2023-06-26',
  '{"fund_id":"AS20230508","registration_date":"2023-06-26","expiry_date":"2031-06-25","formation_total_amount":"19.9","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200377","operator_company_name":"퍼스트스텝랩스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"퍼스트스텝랩스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.651Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 279: 퍼스트스텝제4호조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200377',
  '퍼스트스텝제4호조합',
  1680000000,
  '2022-04-18',
  '{"fund_id":"AS20220337","registration_date":"2022-04-18","expiry_date":"2030-04-17","formation_total_amount":"16.8","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200377","operator_company_name":"퍼스트스텝랩스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"퍼스트스텝랩스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.651Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 280: 퍼스트스텝제3호조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200377',
  '퍼스트스텝제3호조합',
  1800000000,
  '2022-04-08',
  '{"fund_id":"AS20220336","registration_date":"2022-04-08","expiry_date":"2030-04-07","formation_total_amount":"18.0","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200377","operator_company_name":"퍼스트스텝랩스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"퍼스트스텝랩스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.651Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 281: 퍼스트스텝제2호조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200377',
  '퍼스트스텝제2호조합',
  1000000000,
  '2021-12-27',
  '{"fund_id":"AS20211402","registration_date":"2021-12-27","expiry_date":"2029-12-26","formation_total_amount":"10.0","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200377","operator_company_name":"퍼스트스텝랩스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"퍼스트스텝랩스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.651Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 282: 퍼스트스텝제1호조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200377',
  '퍼스트스텝제1호조합',
  990000000,
  '2021-08-26',
  '{"fund_id":"AS20210754","registration_date":"2021-08-26","expiry_date":"2029-08-25","formation_total_amount":"9.9","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200377","operator_company_name":"퍼스트스텝랩스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"퍼스트스텝랩스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.651Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 283: 퍼스트게이트 특허창업기업 개인투자조합 2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200436',
  '퍼스트게이트 특허창업기업 개인투자조합 2호',
  5000000000,
  '2022-10-06',
  '{"fund_id":"AS20221106","registration_date":"2022-10-06","expiry_date":"2028-10-05","formation_total_amount":"50.0","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"MF00000001","operator_company_id":"OP20200436","operator_company_name":"퍼스트게이트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"퍼스트게이트","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.651Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 284: 퍼스트게이트 개인투자조합 5호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200436',
  '퍼스트게이트 개인투자조합 5호',
  550000000,
  '2023-12-19',
  '{"fund_id":"AS20231266","registration_date":"2023-12-19","expiry_date":"2028-12-18","formation_total_amount":"5.5","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200436","operator_company_name":"퍼스트게이트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"퍼스트게이트","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.651Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 285: 퍼스트게이트 개인투자조합 4호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200436',
  '퍼스트게이트 개인투자조합 4호',
  120000000,
  '2023-09-27',
  '{"fund_id":"AS20230862","registration_date":"2023-09-27","expiry_date":"2028-09-26","formation_total_amount":"1.2","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200436","operator_company_name":"퍼스트게이트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"퍼스트게이트","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.651Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 286: 퍼스트게이트 개인투자조합 3호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200436',
  '퍼스트게이트 개인투자조합 3호',
  140000000,
  '2023-08-22',
  '{"fund_id":"AS20230719","registration_date":"2023-08-22","expiry_date":"2028-08-21","formation_total_amount":"1.4","investment_character_code":"","industry_code":"3","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200436","operator_company_name":"퍼스트게이트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"퍼스트게이트","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.651Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 287: 퍼스트게이트 개인투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200436',
  '퍼스트게이트 개인투자조합 1호',
  600000000,
  '2021-07-02',
  '{"fund_id":"AS20210488","registration_date":"2021-07-02","expiry_date":"2026-07-01","formation_total_amount":"6.0","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200436","operator_company_name":"퍼스트게이트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"퍼스트게이트","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.651Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 288: 패스파인더-IBK혁신솔루션펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20160016',
  '패스파인더-IBK혁신솔루션펀드',
  8500000000,
  '2022-08-08',
  '{"fund_id":"AS20220900","registration_date":"2022-08-08","expiry_date":"2030-08-07","formation_total_amount":"85.0","investment_character_code":"20","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20160016","operator_company_name":"패스파인더에이치","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"패스파인더에이치","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.651Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 289: 패스파인더 청년창업 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20160016',
  '패스파인더 청년창업 투자조합',
  15000000000,
  '2017-09-04',
  '{"fund_id":"AS20170100","registration_date":"2017-09-04","expiry_date":"2025-09-03","formation_total_amount":"150.0","investment_character_code":"21","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"일반 기타","mother_fund_id":"MF00000001","operator_company_id":"OP20160016","operator_company_name":"패스파인더에이치","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"패스파인더에이치","investment_focus":["일반 기타","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.651Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 290: 패스파인더 스타트업 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20160016',
  '패스파인더 스타트업 투자조합',
  20000000000,
  '2019-11-15',
  '{"fund_id":"AS20190520","registration_date":"2019-11-15","expiry_date":"2027-11-14","formation_total_amount":"200.0","investment_character_code":"20","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20160016","operator_company_name":"패스파인더에이치","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"패스파인더에이치","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.651Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 291: 패스파인더 미래환경산업 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20160016',
  '패스파인더 미래환경산업 투자조합',
  20000000000,
  '2024-09-05',
  '{"fund_id":"AS20240868","registration_date":"2024-09-05","expiry_date":"2032-09-04","formation_total_amount":"200.0","investment_character_code":"05","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20160016","operator_company_name":"패스파인더에이치","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"패스파인더에이치","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.651Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 292: 패스파인더 리본 투자조합 2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20160016',
  '패스파인더 리본 투자조합 2호',
  30000000000,
  '2022-12-09',
  '{"fund_id":"AS20221433","registration_date":"2022-12-09","expiry_date":"2030-12-08","formation_total_amount":"300.0","investment_character_code":"22","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20160016","operator_company_name":"패스파인더에이치","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"패스파인더에이치","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.651Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 293: 패스파인더 리본 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20160016',
  '패스파인더 리본 투자조합',
  20000000000,
  '2017-12-29',
  '{"fund_id":"AS20180022","registration_date":"2017-12-29","expiry_date":"2025-12-28","formation_total_amount":"200.0","investment_character_code":"22","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"일반 기타","mother_fund_id":"MF00000001","operator_company_id":"OP20160016","operator_company_name":"패스파인더에이치","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"패스파인더에이치","investment_focus":["일반 기타","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.651Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 294: 패스파인더 국토교통혁신 투자조합 2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20160016',
  '패스파인더 국토교통혁신 투자조합 2호',
  18000000000,
  '2022-03-29',
  '{"fund_id":"AS20220355","registration_date":"2022-03-29","expiry_date":"2030-03-28","formation_total_amount":"180.0","investment_character_code":"02","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20160016","operator_company_name":"패스파인더에이치","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"패스파인더에이치","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.651Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 295: 패스파인더 국토교통혁신 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20160016',
  '패스파인더 국토교통혁신 투자조합',
  17000000000,
  '2020-09-09',
  '{"fund_id":"AS20200488","registration_date":"2020-09-09","expiry_date":"2028-09-08","formation_total_amount":"170.0","investment_character_code":"10","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20160016","operator_company_name":"패스파인더에이치","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"패스파인더에이치","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.651Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 296: 패스트 벤처투자조합 코어 1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190427',
  '패스트 벤처투자조합 코어 1호',
  8900000000,
  '2024-12-24',
  '{"fund_id":"AS20241434","registration_date":"2024-12-24","expiry_date":"2032-12-23","formation_total_amount":"89.0","investment_character_code":"06","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20190427","operator_company_name":"패스트벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"패스트벤처스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.651Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 297: 패스트 벤처투자조합 스타일 1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190427',
  '패스트 벤처투자조합 스타일 1호',
  2030000000,
  '2025-01-14',
  '{"fund_id":"AS20250046","registration_date":"2025-01-14","expiry_date":"2030-01-13","formation_total_amount":"20.3","investment_character_code":"25","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"일반 기타","mother_fund_id":"","operator_company_id":"OP20190427","operator_company_name":"패스트벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"패스트벤처스","investment_focus":["일반 기타","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.651Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 298: 패스트 2022 Seed 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190427',
  '패스트 2022 Seed 투자조합',
  19700000000,
  '2022-09-27',
  '{"fund_id":"AS20221114","registration_date":"2022-09-27","expiry_date":"2030-09-26","formation_total_amount":"197.0","investment_character_code":"02","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20190427","operator_company_name":"패스트벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"패스트벤처스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.651Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 299: 패스트 2021 Seed 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190427',
  '패스트 2021 Seed 투자조합',
  11200000000,
  '2021-08-06',
  '{"fund_id":"AS20210690","registration_date":"2021-08-06","expiry_date":"2029-08-05","formation_total_amount":"112.0","investment_character_code":"02","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20190427","operator_company_name":"패스트벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"패스트벤처스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.651Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 300: 패스트 2020 Seed 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190427',
  '패스트 2020 Seed 투자조합',
  7100000000,
  '2020-02-24',
  '{"fund_id":"AS20200084","registration_date":"2020-02-24","expiry_date":"2028-02-23","formation_total_amount":"71.0","investment_character_code":"01","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20190427","operator_company_name":"패스트벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"패스트벤처스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.651Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Minimal Batch 6 completed! 50 fund records processed.
-- Progress: 300/3689 total records

