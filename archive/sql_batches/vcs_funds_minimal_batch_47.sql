-- VCS Fund MINIMAL UPSERT Batch 47/74 (Records 2301-2350)
-- MINIMAL: Only using basic columns that definitely exist
-- Generated from VCS API Scraper fund data
-- Generated at: 2025-06-05T00:40:21.914Z
-- Schema: Minimal fund_table structure (basic columns only)

-- MINIMAL FUND DATA (UPSERT - Safe for Duplicates)
-- Processing 50 fund records
-- Will INSERT new records or UPDATE existing ones

-- Record 2301: 솔트룩스-아카라펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210152',
  '솔트룩스-아카라펀드',
  2300000000,
  '2022-09-08',
  '{"fund_id":"AS20221048","registration_date":"2022-09-08","expiry_date":"2027-09-07","formation_total_amount":"23.0","investment_character_code":"25","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20210152","operator_company_name":"솔트룩스벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"솔트룩스벤처스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.914Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2302: 솔트룩스 한국영화 르네상스 펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210152',
  '솔트룩스 한국영화 르네상스 펀드',
  23300000000,
  '2024-08-07',
  '{"fund_id":"AS20240753","registration_date":"2024-08-07","expiry_date":"2030-08-06","formation_total_amount":"233.0","investment_character_code":"10","industry_code":"6","investment_field_type":"문화","investment_field_detail_type":"영상(영화+드라마+애니메이션)","mother_fund_id":"MF00000001","operator_company_id":"OP20210152","operator_company_name":"솔트룩스벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"솔트룩스벤처스","investment_focus":["영상(영화+드라마+애니메이션)","문화"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.914Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2303: 솔리드원2호투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20220555',
  '솔리드원2호투자조합',
  1620000000,
  '2023-02-07',
  '{"fund_id":"AS20230081","registration_date":"2023-02-07","expiry_date":"2028-02-06","formation_total_amount":"16.2","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20220555","operator_company_name":"솔리드원파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"솔리드원파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.914Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2304: 솔리드원1호투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20220555',
  '솔리드원1호투자조합',
  900000000,
  '2023-02-06',
  '{"fund_id":"AS20230078","registration_date":"2023-02-06","expiry_date":"2028-02-05","formation_total_amount":"9.0","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20220555","operator_company_name":"솔리드원파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"솔리드원파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.914Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2305: 솔리더스 스타벤처 투자조합 2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20110008',
  '솔리더스 스타벤처 투자조합 2호',
  4050000000,
  '2023-10-12',
  '{"fund_id":"AS20230926","registration_date":"2023-10-12","expiry_date":"2028-10-11","formation_total_amount":"40.5","investment_character_code":"04","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20110008","operator_company_name":"솔리더스인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"솔리더스인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.914Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2306: 솔리더스 스타벤처 투자조합 1호 
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20110008',
  '솔리더스 스타벤처 투자조합 1호 ',
  5000000000,
  '2021-01-14',
  '{"fund_id":"AS20210063","registration_date":"2021-01-14","expiry_date":"2026-01-13","formation_total_amount":"50.0","investment_character_code":"04","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"바이오","mother_fund_id":"","operator_company_id":"OP20110008","operator_company_name":"솔리더스인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"솔리더스인베스트먼트","investment_focus":["바이오","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.914Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2307: 솔리더스 스마트바이오 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20110008',
  '솔리더스 스마트바이오 투자조합',
  100000000000,
  '2021-04-08',
  '{"fund_id":"AS20210276","registration_date":"2021-04-08","expiry_date":"2029-04-07","formation_total_amount":"1000.0","investment_character_code":"04","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"바이오","mother_fund_id":"MF00000011,MF00000012","operator_company_id":"OP20110008","operator_company_name":"솔리더스인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"솔리더스인베스트먼트","investment_focus":["바이오","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.914Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2308: 솔루션캐피탈제3호투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20160007',
  '솔루션캐피탈제3호투자조합',
  2900000000,
  '2021-02-23',
  '{"fund_id":"AS20210134","registration_date":"2021-02-23","expiry_date":"2026-02-22","formation_total_amount":"29.0","investment_character_code":"20","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20160007","operator_company_name":"더웰스인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"더웰스인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.914Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2309: 솔루션캐피탈 제5호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20160007',
  '솔루션캐피탈 제5호 투자조합',
  5250000000,
  '2022-04-21',
  '{"fund_id":"AS20220439","registration_date":"2022-04-21","expiry_date":"2027-04-20","formation_total_amount":"52.5","investment_character_code":"02","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20160007","operator_company_name":"더웰스인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"더웰스인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.914Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2310: 솔루션캐피탈 제4호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20160007',
  '솔루션캐피탈 제4호 투자조합',
  3400000000,
  '2021-05-25',
  '{"fund_id":"AS20210416","registration_date":"2021-05-25","expiry_date":"2026-05-24","formation_total_amount":"34.0","investment_character_code":"25","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20160007","operator_company_name":"더웰스인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"더웰스인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.914Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2311: 솔루션캐피탈 제1호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20160007',
  '솔루션캐피탈 제1호 투자조합',
  5500000000,
  '2016-11-14',
  '{"fund_id":"AS20160202","registration_date":"2016-11-14","expiry_date":"2025-11-12","formation_total_amount":"55.0","investment_character_code":"01","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20160007","operator_company_name":"더웰스인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"더웰스인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.914Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2312: 소프트산업육성투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20230027',
  '소프트산업육성투자조합',
  21000000000,
  '2024-07-17',
  '{"fund_id":"AS20240664","registration_date":"2024-07-17","expiry_date":"2032-07-16","formation_total_amount":"210.0","investment_character_code":"19","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20230027","operator_company_name":"엘에프인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"엘에프인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.914Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2313: 소풍 지역혁신 투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190413',
  '소풍 지역혁신 투자조합 1호',
  14100000000,
  '2023-10-13',
  '{"fund_id":"AS20230929","registration_date":"2023-10-13","expiry_date":"2031-10-12","formation_total_amount":"141.0","investment_character_code":"18","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000019","operator_company_id":"OP20190413","operator_company_name":"소풍벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"소풍벤처스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.914Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2314: 소셜벤처 피크닉 1호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190413',
  '소셜벤처 피크닉 1호 투자조합',
  3800000000,
  '2020-02-28',
  '{"fund_id":"AS20200094","registration_date":"2020-02-28","expiry_date":"2028-02-27","formation_total_amount":"38.0","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190413","operator_company_name":"소풍벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"소풍벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.914Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2315: 소셜 AI 솔루션 펀드 1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20180065',
  '소셜 AI 솔루션 펀드 1호',
  100000000,
  '2021-08-23',
  '{"fund_id":"AS20210745","registration_date":"2021-08-23","expiry_date":"2026-08-19","formation_total_amount":"1.0","investment_character_code":"","industry_code":"6","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20180065","operator_company_name":"엔피프틴파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"엔피프틴파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.914Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2316: 센틱스 오퍼튜니티 세컨더리 펀드 1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20240693',
  '센틱스 오퍼튜니티 세컨더리 펀드 1호',
  2100000000,
  '2024-11-20',
  '{"fund_id":"AS20241175","registration_date":"2024-11-20","expiry_date":"2029-11-19","formation_total_amount":"21.0","investment_character_code":"11","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20240693","operator_company_name":"센틱스벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"센틱스벤처스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.914Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2317: 센트럴케이제이앤5G융합콘텐츠투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20120005',
  '센트럴케이제이앤5G융합콘텐츠투자조합',
  33400000000,
  '2020-08-10',
  '{"fund_id":"AS20200425","registration_date":"2020-08-10","expiry_date":"2028-08-09","formation_total_amount":"334.0","investment_character_code":"02","industry_code":"7","investment_field_type":"문화","investment_field_detail_type":"영상(영화+드라마+애니메이션)","mother_fund_id":"MF00000001","operator_company_id":"OP20120005","operator_company_name":"센트럴투자파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"센트럴투자파트너스","investment_focus":["영상(영화+드라마+애니메이션)","문화"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.914Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2318: 센트럴중저영화전문투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20120005',
  '센트럴중저영화전문투자조합',
  13000000000,
  '2021-11-26',
  '{"fund_id":"AS20211195","registration_date":"2021-11-26","expiry_date":"2026-11-25","formation_total_amount":"130.0","investment_character_code":"24","industry_code":"6","investment_field_type":"문화","investment_field_detail_type":"영상(영화+드라마+애니메이션)","mother_fund_id":"MF00000001","operator_company_id":"OP20120005","operator_company_name":"센트럴투자파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"센트럴투자파트너스","investment_focus":["영상(영화+드라마+애니메이션)","문화"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.914Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2319: 센트럴중저영화레벨업투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20120005',
  '센트럴중저영화레벨업투자조합',
  20100000000,
  '2023-09-07',
  '{"fund_id":"AS20230794","registration_date":"2023-09-07","expiry_date":"2029-09-06","formation_total_amount":"201.0","investment_character_code":"24","industry_code":"6","investment_field_type":"문화","investment_field_detail_type":"영상(영화+드라마+애니메이션)","mother_fund_id":"MF00000001","operator_company_id":"OP20120005","operator_company_name":"센트럴투자파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"센트럴투자파트너스","investment_focus":["영상(영화+드라마+애니메이션)","문화"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.914Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2320: 센트럴융합콘텐츠기술투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20120005',
  '센트럴융합콘텐츠기술투자조합',
  40000000000,
  '2015-11-23',
  '{"fund_id":"AS20150122","registration_date":"2015-11-23","expiry_date":"2025-11-22","formation_total_amount":"400.0","investment_character_code":"24","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20120005","operator_company_name":"센트럴투자파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"센트럴투자파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.914Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2321: 센트럴애니드림투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20120005',
  '센트럴애니드림투자조합',
  21000000000,
  '2013-09-16',
  '{"fund_id":"AS20130035","registration_date":"2013-09-16","expiry_date":"2025-09-15","formation_total_amount":"210.0","investment_character_code":"24","industry_code":"6","investment_field_type":"문화","investment_field_detail_type":"영상(영화+드라마+애니메이션)","mother_fund_id":"MF00000001","operator_company_id":"OP20120005","operator_company_name":"센트럴투자파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"센트럴투자파트너스","investment_focus":["영상(영화+드라마+애니메이션)","문화"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.914Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2322: 센트럴스포츠투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20120005',
  '센트럴스포츠투자조합',
  17000000000,
  '2017-12-19',
  '{"fund_id":"AS20170152","registration_date":"2017-12-19","expiry_date":"2025-12-18","formation_total_amount":"170.0","investment_character_code":"07","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20120005","operator_company_name":"센트럴투자파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"센트럴투자파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.914Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2323: 센트럴소셜임팩트투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20120005',
  '센트럴소셜임팩트투자조합',
  16700000000,
  '2021-12-03',
  '{"fund_id":"AS20211227","registration_date":"2021-12-03","expiry_date":"2029-12-02","formation_total_amount":"167.0","investment_character_code":"05","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20120005","operator_company_name":"센트럴투자파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"센트럴투자파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.914Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2324: 센트럴모험콘텐츠투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20120005',
  '센트럴모험콘텐츠투자조합',
  42000000000,
  '2021-10-26',
  '{"fund_id":"AS20211029","registration_date":"2021-10-26","expiry_date":"2029-10-25","formation_total_amount":"420.0","investment_character_code":"24","industry_code":"6","investment_field_type":"문화","investment_field_detail_type":"영상(영화+드라마+애니메이션)","mother_fund_id":"MF00000001","operator_company_id":"OP20120005","operator_company_name":"센트럴투자파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"센트럴투자파트너스","investment_focus":["영상(영화+드라마+애니메이션)","문화"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.914Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2325: 센트럴K-밸류콘텐츠레벨업투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20120005',
  '센트럴K-밸류콘텐츠레벨업투자조합',
  20100000000,
  '2023-12-04',
  '{"fund_id":"AS20231199","registration_date":"2023-12-04","expiry_date":"2030-12-03","formation_total_amount":"201.0","investment_character_code":"24","industry_code":"6","investment_field_type":"문화","investment_field_detail_type":"문화 기타","mother_fund_id":"MF00000001","operator_company_id":"OP20120005","operator_company_name":"센트럴투자파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"센트럴투자파트너스","investment_focus":["문화 기타","문화"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.914Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2326: 세쿼이아트리5호 세컨더리 벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210725',
  '세쿼이아트리5호 세컨더리 벤처투자조합',
  3000000000,
  '2023-02-10',
  '{"fund_id":"AS20230092","registration_date":"2023-02-10","expiry_date":"2028-02-09","formation_total_amount":"30.0","investment_character_code":"16","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20210725","operator_company_name":"포레스트벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"포레스트벤처스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.914Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2327: 세쿼이아트리4호 세컨더리 벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210725',
  '세쿼이아트리4호 세컨더리 벤처투자조합',
  16100000000,
  '2022-03-29',
  '{"fund_id":"AS20220353","registration_date":"2022-03-29","expiry_date":"2027-03-28","formation_total_amount":"161.0","investment_character_code":"16","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20210725","operator_company_name":"포레스트벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"포레스트벤처스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.914Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2328: 세쿼이아트리3호 세컨더리 벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210725',
  '세쿼이아트리3호 세컨더리 벤처투자조합',
  6600000000,
  '2022-01-26',
  '{"fund_id":"AS20220092","registration_date":"2022-01-26","expiry_date":"2027-01-25","formation_total_amount":"66.0","investment_character_code":"16","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20210725","operator_company_name":"포레스트벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"포레스트벤처스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.914Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2329: 세종한누리더드림개인투자조합2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190369',
  '세종한누리더드림개인투자조합2호',
  190000000,
  '2024-02-08',
  '{"fund_id":"AS20240102","registration_date":"2024-02-08","expiry_date":"2029-02-07","formation_total_amount":"1.9","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190369","operator_company_name":"세종창조경제혁신센터","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"세종창조경제혁신센터","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.914Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2330: 세종한누리개인투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190369',
  '세종한누리개인투자조합1호',
  100000000,
  '2022-12-27',
  '{"fund_id":"AS20221518","registration_date":"2022-12-27","expiry_date":"2027-12-31","formation_total_amount":"1.0","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190369","operator_company_name":"세종창조경제혁신센터","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"세종창조경제혁신센터","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.914Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2331: 세종 창조성장 청년창업 벤처펀드 1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20130002',
  '세종 창조성장 청년창업 벤처펀드 1호',
  10000000000,
  '2014-09-04',
  '{"fund_id":"AS20140078","registration_date":"2014-09-04","expiry_date":"2025-09-03","formation_total_amount":"100.0","investment_character_code":"20","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20130002","operator_company_name":"로이투자파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"로이투자파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.914Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2332: 세종 스마트기술 강소기업 투자조합 2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20130002',
  '세종 스마트기술 강소기업 투자조합 2호',
  10000000000,
  '2019-12-31',
  '{"fund_id":"AS20200006","registration_date":"2019-12-31","expiry_date":"2027-12-30","formation_total_amount":"100.0","investment_character_code":"18","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20130002","operator_company_name":"로이투자파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"로이투자파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.914Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2333: 세종 글로벌 청년창업 벤처펀드 2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20130002',
  '세종 글로벌 청년창업 벤처펀드 2호',
  10000000000,
  '2017-09-05',
  '{"fund_id":"AS20170101","registration_date":"2017-09-05","expiry_date":"2025-09-04","formation_total_amount":"100.0","investment_character_code":"21","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20130002","operator_company_name":"로이투자파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"로이투자파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.914Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2334: 세종 JNP 벤처스타 동행 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20130005',
  '세종 JNP 벤처스타 동행 투자조합',
  1000000000,
  '2023-12-05',
  '{"fund_id":"AS20231185","registration_date":"2023-12-05","expiry_date":"2031-11-30","formation_total_amount":"10.0","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"MF00000021","operator_company_id":"OP20130005","operator_company_name":"제이엔피글로벌","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"제이엔피글로벌","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.914Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2335: 세이지원에너지1호투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20230520',
  '세이지원에너지1호투자조합',
  2300000000,
  '2025-04-18',
  '{"fund_id":"AS20250301","registration_date":"2025-04-18","expiry_date":"2030-04-17","formation_total_amount":"23.0","investment_character_code":"16","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20230520","operator_company_name":"세이지원파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"세이지원파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.914Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2336: 세이지원세컨더리투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20230520',
  '세이지원세컨더리투자조합',
  2000000000,
  '2024-06-05',
  '{"fund_id":"AS20240495","registration_date":"2024-06-05","expiry_date":"2029-06-04","formation_total_amount":"20.0","investment_character_code":"28","industry_code":"7","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20230520","operator_company_name":"세이지원파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"세이지원파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.914Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2337: 세아-오픈워터 2024 부산지역혁신 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190245',
  '세아-오픈워터 2024 부산지역혁신 투자조합',
  34300000000,
  '2025-04-02',
  '{"fund_id":"AS20250262","registration_date":"2025-04-02","expiry_date":"2033-04-01","formation_total_amount":"343.0","investment_character_code":"01","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000022","operator_company_id":"OP20190245","operator_company_name":"오픈워터인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"오픈워터인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.914Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2338: 세아 에스앤에스 2024 지역혁신 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20220288',
  '세아 에스앤에스 2024 지역혁신 투자조합',
  37800000000,
  '2024-10-18',
  '{"fund_id":"AS20241007","registration_date":"2024-10-18","expiry_date":"2032-10-17","formation_total_amount":"378.0","investment_character_code":"18","industry_code":"4","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000018","operator_company_id":"OP20220288","operator_company_name":"에스앤에스인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"에스앤에스인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.914Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2339: 세브란스-이노큐브 벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20220423',
  '세브란스-이노큐브 벤처투자조합',
  9100000000,
  '2024-12-23',
  '{"fund_id":"AS20241413","registration_date":"2024-12-23","expiry_date":"2032-12-22","formation_total_amount":"91.0","investment_character_code":"04","industry_code":"9","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20220423","operator_company_name":"이노큐브","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"이노큐브","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.914Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2340: 세브란스-리젠트 MD 오아시스2 벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20220192',
  '세브란스-리젠트 MD 오아시스2 벤처투자조합',
  5100000000,
  '2024-11-05',
  '{"fund_id":"AS20241083","registration_date":"2024-11-05","expiry_date":"2032-11-04","formation_total_amount":"51.0","investment_character_code":"01","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20220192","operator_company_name":"리젠트파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"리젠트파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.914Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2341: 세마소부장스케일업투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20150005',
  '세마소부장스케일업투자조합',
  30500000000,
  '2024-07-03',
  '{"fund_id":"AS20240592","registration_date":"2024-07-03","expiry_date":"2032-07-02","formation_total_amount":"305.0","investment_character_code":"03","industry_code":"4","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20150005","operator_company_name":"세마인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"세마인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.914Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2342: 세마공공기술사업화투자조합2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20150005',
  '세마공공기술사업화투자조합2호',
  20500000000,
  '2022-11-18',
  '{"fund_id":"AS20221325","registration_date":"2022-11-18","expiry_date":"2030-11-17","formation_total_amount":"205.0","investment_character_code":"02","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20150005","operator_company_name":"세마인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"세마인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.915Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2343: 세마공공기술사업화투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20150005',
  '세마공공기술사업화투자조합',
  20500000000,
  '2021-07-26',
  '{"fund_id":"AS20210638","registration_date":"2021-07-26","expiry_date":"2029-07-25","formation_total_amount":"205.0","investment_character_code":"02","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20150005","operator_company_name":"세마인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"세마인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.915Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2344: 세르파벤처스 프로젝트 투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210191',
  '세르파벤처스 프로젝트 투자조합 1호',
  170000000,
  '2023-10-27',
  '{"fund_id":"AS20230964","registration_date":"2023-10-27","expiry_date":"2028-10-26","formation_total_amount":"1.7","investment_character_code":"","industry_code":"6","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20210191","operator_company_name":"세르파벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"세르파벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.915Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2345: 세르파벤처스 투자조합4호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210191',
  '세르파벤처스 투자조합4호',
  100000000,
  '2022-07-15',
  '{"fund_id":"AS20220769","registration_date":"2022-07-15","expiry_date":"2027-07-14","formation_total_amount":"1.0","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20210191","operator_company_name":"세르파벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"세르파벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.915Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2346: 세르파벤처스 투자조합 5호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210191',
  '세르파벤처스 투자조합 5호',
  260000000,
  '2023-08-08',
  '{"fund_id":"AS20230660","registration_date":"2023-08-08","expiry_date":"2028-08-07","formation_total_amount":"2.6","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20210191","operator_company_name":"세르파벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"세르파벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.915Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2347: 세르파벤처스 개인투자조합 3호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210191',
  '세르파벤처스 개인투자조합 3호',
  350000000,
  '2022-05-31',
  '{"fund_id":"AS20220617","registration_date":"2022-05-31","expiry_date":"2027-05-30","formation_total_amount":"3.5","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20210191","operator_company_name":"세르파벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"세르파벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.915Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2348: 세르파벤처스 개인투자조합 2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210191',
  '세르파벤처스 개인투자조합 2호',
  500000000,
  '2021-07-30',
  '{"fund_id":"AS20210660","registration_date":"2021-07-30","expiry_date":"2026-07-29","formation_total_amount":"5.0","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20210191","operator_company_name":"세르파벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"세르파벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.915Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2349: 세르파벤처스 개인투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210191',
  '세르파벤처스 개인투자조합 1호',
  100000000,
  '2021-07-20',
  '{"fund_id":"AS20210559","registration_date":"2021-07-20","expiry_date":"2026-07-19","formation_total_amount":"1.0","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20210191","operator_company_name":"세르파벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"세르파벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.915Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2350: 세르파개인투자조합3호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20170044',
  '세르파개인투자조합3호',
  550000000,
  '2023-11-27',
  '{"fund_id":"AS20231075","registration_date":"2023-11-27","expiry_date":"2028-12-20","formation_total_amount":"5.5","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20170044","operator_company_name":"한국바이오투자파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"한국바이오투자파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.915Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Minimal Batch 47 completed! 50 fund records processed.
-- Progress: 2350/3689 total records

