-- VCS Fund MINIMAL UPSERT Batch 25/74 (Records 1201-1250)
-- MINIMAL: Only using basic columns that definitely exist
-- Generated from VCS API Scraper fund data
-- Generated at: 2025-06-05T00:40:21.811Z
-- Schema: Minimal fund_table structure (basic columns only)

-- MINIMAL FUND DATA (UPSERT - Safe for Duplicates)
-- Processing 50 fund records
-- Will INSERT new records or UPDATE existing ones

-- Record 1201: 유스업86호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190212',
  '유스업86호 개인투자조합',
  1040000000,
  '2023-12-14',
  '{"fund_id":"AS20231236","registration_date":"2023-12-14","expiry_date":"2028-12-13","formation_total_amount":"10.4","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190212","operator_company_name":"유스업파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"유스업파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.811Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1202: 유스업85호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190212',
  '유스업85호 개인투자조합',
  910000000,
  '2023-12-06',
  '{"fund_id":"AS20231171","registration_date":"2023-12-06","expiry_date":"2028-12-05","formation_total_amount":"9.1","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190212","operator_company_name":"유스업파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"유스업파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.811Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1203: 유스업84호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190212',
  '유스업84호 개인투자조합',
  950000000,
  '2023-11-27',
  '{"fund_id":"AS20231127","registration_date":"2023-11-27","expiry_date":"2028-11-26","formation_total_amount":"9.5","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190212","operator_company_name":"유스업파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"유스업파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.811Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1204: 유스업83호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190212',
  '유스업83호 개인투자조합',
  1000000000,
  '2023-11-20',
  '{"fund_id":"AS20231086","registration_date":"2023-11-20","expiry_date":"2028-11-19","formation_total_amount":"10.0","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190212","operator_company_name":"유스업파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"유스업파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.811Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1205: 유스업82호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190212',
  '유스업82호 개인투자조합',
  1140000000,
  '2023-11-01',
  '{"fund_id":"AS20230981","registration_date":"2023-11-01","expiry_date":"2028-10-31","formation_total_amount":"11.4","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190212","operator_company_name":"유스업파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"유스업파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.811Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1206: 유스업81호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190212',
  '유스업81호 개인투자조합',
  900000000,
  '2023-10-24',
  '{"fund_id":"AS20230958","registration_date":"2023-10-24","expiry_date":"2028-10-23","formation_total_amount":"9.0","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190212","operator_company_name":"유스업파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"유스업파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.811Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1207: 유스업103호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190212',
  '유스업103호 개인투자조합',
  760000000,
  '2025-03-31',
  '{"fund_id":"AS20250209","registration_date":"2025-03-31","expiry_date":"2030-03-30","formation_total_amount":"7.6","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190212","operator_company_name":"유스업파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"유스업파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.811Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1208: 유스업102호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190212',
  '유스업102호 개인투자조합',
  1110000000,
  '2025-03-25',
  '{"fund_id":"AS20250184","registration_date":"2025-03-25","expiry_date":"2030-03-24","formation_total_amount":"11.1","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190212","operator_company_name":"유스업파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"유스업파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.811Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1209: 유스업101호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190212',
  '유스업101호 개인투자조합',
  860000000,
  '2024-12-19',
  '{"fund_id":"AS20241335","registration_date":"2024-12-19","expiry_date":"2029-12-18","formation_total_amount":"8.6","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190212","operator_company_name":"유스업파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"유스업파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.811Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1210: 유스업100호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190212',
  '유스업100호 개인투자조합',
  930000000,
  '2024-12-19',
  '{"fund_id":"AS20241334","registration_date":"2024-12-19","expiry_date":"2029-12-18","formation_total_amount":"9.3","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190212","operator_company_name":"유스업파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"유스업파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.811Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1211: 유성 유스타 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20150041',
  '유성 유스타 개인투자조합',
  3850000000,
  '2024-08-02',
  '{"fund_id":"AS20240732","registration_date":"2024-08-02","expiry_date":"2031-08-01","formation_total_amount":"38.5","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"MF00000001","operator_company_id":"OP20150041","operator_company_name":"울산창조경제혁신센터","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"울산창조경제혁신센터","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.811Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1212: 유니콘펀드1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20180067',
  '유니콘펀드1호',
  230000000,
  '2020-08-28',
  '{"fund_id":"AS20200452","registration_date":"2020-08-28","expiry_date":"2025-12-31","formation_total_amount":"2.3","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20180067","operator_company_name":"와이플래닛","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"와이플래닛","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.811Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1213: 유니콘브릿지 개인투자조합 제6호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20160040',
  '유니콘브릿지 개인투자조합 제6호',
  230000000,
  '2025-01-06',
  '{"fund_id":"AS20241456","registration_date":"2025-01-06","expiry_date":"2030-01-05","formation_total_amount":"2.3","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20160040","operator_company_name":"에스와이피","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"에스와이피","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.811Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1214: 유니콘브릿지 개인투자조합 제4호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20160040',
  '유니콘브릿지 개인투자조합 제4호',
  100000000,
  '2024-12-10',
  '{"fund_id":"AS20241251","registration_date":"2024-12-10","expiry_date":"2032-12-09","formation_total_amount":"1.0","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20160040","operator_company_name":"에스와이피","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"에스와이피","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.811Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1215: 유니콘브릿지 개인투자조합 제3호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20160040',
  '유니콘브릿지 개인투자조합 제3호',
  110000000,
  '2024-09-05',
  '{"fund_id":"AS20240829","registration_date":"2024-09-05","expiry_date":"2032-09-04","formation_total_amount":"1.1","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20160040","operator_company_name":"에스와이피","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"에스와이피","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.811Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1216: 유니콘브릿지 개인투자조합 제2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20160040',
  '유니콘브릿지 개인투자조합 제2호',
  110000000,
  '2024-09-05',
  '{"fund_id":"AS20240846","registration_date":"2024-09-05","expiry_date":"2032-09-04","formation_total_amount":"1.1","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20160040","operator_company_name":"에스와이피","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"에스와이피","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.811Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1217: 유니콘브릿지 개인투자조합 제1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20160040',
  '유니콘브릿지 개인투자조합 제1호',
  370000000,
  '2024-03-13',
  '{"fund_id":"AS20240178","registration_date":"2024-03-13","expiry_date":"2032-03-12","formation_total_amount":"3.7","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20160040","operator_company_name":"에스와이피","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"에스와이피","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.811Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1218: 유니콘개인투자조합6호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210361',
  '유니콘개인투자조합6호',
  110000000,
  '2023-12-19',
  '{"fund_id":"AS20231278","registration_date":"2023-12-19","expiry_date":"2028-12-18","formation_total_amount":"1.1","investment_character_code":"","industry_code":"3","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20210361","operator_company_name":"더피플앤파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"더피플앤파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.811Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1219: 유니콘개인투자조합 5호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210361',
  '유니콘개인투자조합 5호',
  100000000,
  '2023-07-11',
  '{"fund_id":"AS20230573","registration_date":"2023-07-11","expiry_date":"2028-07-10","formation_total_amount":"1.0","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20210361","operator_company_name":"더피플앤파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"더피플앤파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.811Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1220: 유니온피씨씨포트폴리오투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20000008',
  '유니온피씨씨포트폴리오투자조합',
  10620000000,
  '2019-01-10',
  '{"fund_id":"AS20190029","registration_date":"2019-01-10","expiry_date":"2026-01-09","formation_total_amount":"106.2","investment_character_code":"16","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20000008","operator_company_name":"유니온투자파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"유니온투자파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.811Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1221: 유니온프롭테크투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20000008',
  '유니온프롭테크투자조합1호',
  13600000000,
  '2019-07-24',
  '{"fund_id":"AS20190333","registration_date":"2019-07-24","expiry_date":"2025-07-23","formation_total_amount":"136.0","investment_character_code":"16","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20000008","operator_company_name":"유니온투자파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"유니온투자파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.811Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1222: 유니온푸드테크투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20000008',
  '유니온푸드테크투자조합1호',
  4700000000,
  '2019-08-26',
  '{"fund_id":"AS20190391","registration_date":"2019-08-26","expiry_date":"2026-08-25","formation_total_amount":"47.0","investment_character_code":"25","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20000008","operator_company_name":"유니온투자파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"유니온투자파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.811Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1223: 유니온포트폴리오투자조합2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20000008',
  '유니온포트폴리오투자조합2호',
  2530000000,
  '2020-12-11',
  '{"fund_id":"AS20200769","registration_date":"2020-12-11","expiry_date":"2025-12-10","formation_total_amount":"25.3","investment_character_code":"06","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20000008","operator_company_name":"유니온투자파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"유니온투자파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.811Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1224: 유니온팔로우온투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20000008',
  '유니온팔로우온투자조합',
  20000000000,
  '2018-09-18',
  '{"fund_id":"AS20180272","registration_date":"2018-09-18","expiry_date":"2026-09-17","formation_total_amount":"200.0","investment_character_code":"20","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20000008","operator_company_name":"유니온투자파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"유니온투자파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.811Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1225: 유니온콘텐츠벨류업투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20000008',
  '유니온콘텐츠벨류업투자조합',
  11000000000,
  '2014-05-09',
  '{"fund_id":"AS20140024","registration_date":"2014-05-09","expiry_date":"2026-12-31","formation_total_amount":"110.0","investment_character_code":"01","industry_code":"6","investment_field_type":"문화","investment_field_detail_type":"문화 기타","mother_fund_id":"","operator_company_id":"OP20000008","operator_company_name":"유니온투자파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"유니온투자파트너스","investment_focus":["문화 기타","문화"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.811Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1226: 유니온와이즈투자조합2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20000008',
  '유니온와이즈투자조합2호',
  3980000000,
  '2019-07-24',
  '{"fund_id":"AS20190335","registration_date":"2019-07-24","expiry_date":"2025-07-23","formation_total_amount":"39.8","investment_character_code":"16","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20000008","operator_company_name":"유니온투자파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"유니온투자파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.811Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1227: 유니온와이즈투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20000008',
  '유니온와이즈투자조합1호',
  3000000000,
  '2018-09-07',
  '{"fund_id":"AS20180274","registration_date":"2018-09-07","expiry_date":"2025-09-06","formation_total_amount":"30.0","investment_character_code":"16","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20000008","operator_company_name":"유니온투자파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"유니온투자파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.811Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1228: 유니온어센도헬스케어 슈퍼플랫폼투자조합2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20000008',
  '유니온어센도헬스케어 슈퍼플랫폼투자조합2호',
  8680000000,
  '2022-03-07',
  '{"fund_id":"AS20220236","registration_date":"2022-03-07","expiry_date":"2027-03-06","formation_total_amount":"86.8","investment_character_code":"25","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20000008","operator_company_name":"유니온투자파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"유니온투자파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.811Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1229: 유니온애드테크투자조합3호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20000008',
  '유니온애드테크투자조합3호',
  2280000000,
  '2022-09-27',
  '{"fund_id":"AS20221113","registration_date":"2022-09-27","expiry_date":"2027-09-26","formation_total_amount":"22.8","investment_character_code":"16","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20000008","operator_company_name":"유니온투자파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"유니온투자파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.811Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1230: 유니온애드테크투자조합2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20000008',
  '유니온애드테크투자조합2호',
  3000000000,
  '2019-12-20',
  '{"fund_id":"AS20200022","registration_date":"2019-12-20","expiry_date":"2026-12-19","formation_total_amount":"30.0","investment_character_code":"16","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20000008","operator_company_name":"유니온투자파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"유니온투자파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.811Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1231: 유니온애드테크투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20000008',
  '유니온애드테크투자조합1호',
  7920000000,
  '2019-12-20',
  '{"fund_id":"AS20200013","registration_date":"2019-12-20","expiry_date":"2026-12-19","formation_total_amount":"79.2","investment_character_code":"16","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20000008","operator_company_name":"유니온투자파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"유니온투자파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.812Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1232: 유니온시네마2호투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20000008',
  '유니온시네마2호투자조합',
  17500000000,
  '2022-09-20',
  '{"fund_id":"AS20221083","registration_date":"2022-09-20","expiry_date":"2028-09-19","formation_total_amount":"175.0","investment_character_code":"24","industry_code":"6","investment_field_type":"문화","investment_field_detail_type":"영상(영화+드라마+애니메이션)","mother_fund_id":"MF00000001","operator_company_id":"OP20000008","operator_company_name":"유니온투자파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"유니온투자파트너스","investment_focus":["영상(영화+드라마+애니메이션)","문화"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.812Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1233: 유니온슈퍼아이피투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20000008',
  '유니온슈퍼아이피투자조합',
  15600000000,
  '2017-10-17',
  '{"fund_id":"AS20170123","registration_date":"2017-10-17","expiry_date":"2025-10-16","formation_total_amount":"156.0","investment_character_code":"24","industry_code":"6","investment_field_type":"문화","investment_field_detail_type":"문화 기타","mother_fund_id":"MF00000001","operator_company_id":"OP20000008","operator_company_name":"유니온투자파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"유니온투자파트너스","investment_focus":["문화 기타","문화"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.812Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1234: 유니온슈퍼아이피2호투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20000008',
  '유니온슈퍼아이피2호투자조합',
  26000000000,
  '2020-11-09',
  '{"fund_id":"AS20200643","registration_date":"2020-11-09","expiry_date":"2027-11-08","formation_total_amount":"260.0","investment_character_code":"09","industry_code":"6","investment_field_type":"문화","investment_field_detail_type":"문화 기타","mother_fund_id":"MF00000001","operator_company_id":"OP20000008","operator_company_name":"유니온투자파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"유니온투자파트너스","investment_focus":["문화 기타","문화"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.812Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1235: 유니온빌랑스모빌리티투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20000008',
  '유니온빌랑스모빌리티투자조합',
  3150000000,
  '2021-12-29',
  '{"fund_id":"AS20211433","registration_date":"2021-12-29","expiry_date":"2026-12-28","formation_total_amount":"31.5","investment_character_code":"25","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20000008","operator_company_name":"유니온투자파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"유니온투자파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.812Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1236: 유니온바이오투자조합3호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20000008',
  '유니온바이오투자조합3호',
  2220000000,
  '2022-01-24',
  '{"fund_id":"AS20220088","registration_date":"2022-01-24","expiry_date":"2027-01-23","formation_total_amount":"22.2","investment_character_code":"25","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20000008","operator_company_name":"유니온투자파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"유니온투자파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.812Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1237: 유니온바이오투자조합2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20000008',
  '유니온바이오투자조합2호',
  2020000000,
  '2021-12-08',
  '{"fund_id":"AS20211252","registration_date":"2021-12-08","expiry_date":"2026-12-07","formation_total_amount":"20.2","investment_character_code":"25","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20000008","operator_company_name":"유니온투자파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"유니온투자파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.812Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1238: 유니온미래브이에프엑스투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20000008',
  '유니온미래브이에프엑스투자조합',
  25500000000,
  '2016-12-28',
  '{"fund_id":"AS20160228","registration_date":"2016-12-28","expiry_date":"2025-12-27","formation_total_amount":"255.0","investment_character_code":"24","industry_code":"6","investment_field_type":"문화","investment_field_detail_type":"문화 기타","mother_fund_id":"MF00000001","operator_company_id":"OP20000008","operator_company_name":"유니온투자파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"유니온투자파트너스","investment_focus":["문화 기타","문화"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.812Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1239: 유니온미디어앤콘텐츠투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20000008',
  '유니온미디어앤콘텐츠투자조합',
  10000000000,
  '2015-12-08',
  '{"fund_id":"AS20150054","registration_date":"2015-12-08","expiry_date":"2025-12-07","formation_total_amount":"100.0","investment_character_code":"24","industry_code":"7","investment_field_type":"문화","investment_field_detail_type":"문화 기타","mother_fund_id":"MF00000001","operator_company_id":"OP20000008","operator_company_name":"유니온투자파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"유니온투자파트너스","investment_focus":["문화 기타","문화"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.812Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1240: 유니온디지털혁신투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20000008',
  '유니온디지털혁신투자조합',
  36500000000,
  '2022-08-08',
  '{"fund_id":"AS20220902","registration_date":"2022-08-08","expiry_date":"2030-08-07","formation_total_amount":"365.0","investment_character_code":"09","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"특허","mother_fund_id":"","operator_company_id":"OP20000008","operator_company_name":"유니온투자파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"유니온투자파트너스","investment_focus":["특허","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.812Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1241: 유니온넥스트투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20000008',
  '유니온넥스트투자조합',
  2500000000,
  '2021-08-30',
  '{"fund_id":"AS20210789","registration_date":"2021-08-30","expiry_date":"2026-08-29","formation_total_amount":"25.0","investment_character_code":"25","industry_code":"7","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20000008","operator_company_name":"유니온투자파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"유니온투자파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.812Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1242: 유니온기술금융투자조합2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20000008',
  '유니온기술금융투자조합2호',
  40500000000,
  '2023-07-11',
  '{"fund_id":"AS20230588","registration_date":"2023-07-11","expiry_date":"2031-07-10","formation_total_amount":"405.0","investment_character_code":"09","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"특허","mother_fund_id":"MF00000001","operator_company_id":"OP20000008","operator_company_name":"유니온투자파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"유니온투자파트너스","investment_focus":["특허","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.812Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1243: 유니온기술금융투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20000008',
  '유니온기술금융투자조합',
  50500000000,
  '2020-12-16',
  '{"fund_id":"AS20200803","registration_date":"2020-12-16","expiry_date":"2028-12-15","formation_total_amount":"505.0","investment_character_code":"09","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"특허","mother_fund_id":"MF00000001","operator_company_id":"OP20000008","operator_company_name":"유니온투자파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"유니온투자파트너스","investment_focus":["특허","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.812Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1244: 유니온글로벌익스페디션투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20000008',
  '유니온글로벌익스페디션투자조합',
  24680000000,
  '2018-11-07',
  '{"fund_id":"AS20180327","registration_date":"2018-11-07","expiry_date":"2025-11-06","formation_total_amount":"246.8","investment_character_code":"24","industry_code":"6","investment_field_type":"문화","investment_field_detail_type":"문화 기타","mother_fund_id":"MF00000001","operator_company_id":"OP20000008","operator_company_name":"유니온투자파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"유니온투자파트너스","investment_focus":["문화 기타","문화"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.812Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1245: 유니온K-문화콘텐츠투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20000008',
  '유니온K-문화콘텐츠투자조합',
  30000000000,
  '2019-11-25',
  '{"fund_id":"AS20190527","registration_date":"2019-11-25","expiry_date":"2026-11-24","formation_total_amount":"300.0","investment_character_code":"24","industry_code":"6","investment_field_type":"문화","investment_field_detail_type":"문화 기타","mother_fund_id":"MF00000001","operator_company_id":"OP20000008","operator_company_name":"유니온투자파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"유니온투자파트너스","investment_focus":["문화 기타","문화"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.812Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1246: 유니스트에이티피창업벤처조합제2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210025',
  '유니스트에이티피창업벤처조합제2호',
  2000000000,
  '2024-02-05',
  '{"fund_id":"AS20240080","registration_date":"2024-02-05","expiry_date":"2031-02-04","formation_total_amount":"20.0","investment_character_code":"18","industry_code":"1","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20210025","operator_company_name":"에이티피벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"에이티피벤처스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.812Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1247: 유니스트에이티피창업벤처조합제1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210025',
  '유니스트에이티피창업벤처조합제1호',
  4200000000,
  '2022-03-03',
  '{"fund_id":"AS20220224","registration_date":"2022-03-03","expiry_date":"2029-03-02","formation_total_amount":"42.0","investment_character_code":"20","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20210025","operator_company_name":"에이티피벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"에이티피벤처스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.812Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1248: 윈베스트27호투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20000032',
  '윈베스트27호투자조합',
  2750000000,
  '2025-03-24',
  '{"fund_id":"AS20250218","registration_date":"2025-03-24","expiry_date":"2030-03-23","formation_total_amount":"27.5","investment_character_code":"06","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20000032","operator_company_name":"윈베스트벤처투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"윈베스트벤처투자","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.812Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1249: 윈베스트26호투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20000032',
  '윈베스트26호투자조합',
  6300000000,
  '2024-08-21',
  '{"fund_id":"AS20240802","registration_date":"2024-08-21","expiry_date":"2029-08-20","formation_total_amount":"63.0","investment_character_code":"03","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20000032","operator_company_name":"윈베스트벤처투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"윈베스트벤처투자","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.812Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1250: 윈베스트25호투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20000032',
  '윈베스트25호투자조합',
  2990000000,
  '2024-08-21',
  '{"fund_id":"AS20240801","registration_date":"2024-08-21","expiry_date":"2029-08-20","formation_total_amount":"29.9","investment_character_code":"03","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20000032","operator_company_name":"윈베스트벤처투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"윈베스트벤처투자","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.812Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Minimal Batch 25 completed! 50 fund records processed.
-- Progress: 1250/3689 total records

