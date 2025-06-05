-- VCS UPSERT Batch 14/15 (Records 651-700)
-- Uses ON CONFLICT DO UPDATE to insert new or update existing records
-- Safe to run multiple times - handles duplicates gracefully
-- Generated at: 2025-06-05T00:13:14.691Z

-- Record 651: 포스코기술투자
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP19970007',
  '포스코기술투자',
  '',
  '1998-01-01',
  '경상북도 포항시 남구',
  '37673',
  '신기술사',
  'ICT서비스',
  3748.9,
  '27년 11개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"37673"}'::jsonb,
  '{"operator_type_code":"2","operator_type_name":"신기술사","operating_scale_code":"5","business_category_code":"6","strategy_planner":"No","professional_angel":"No","investment_character":"","operating_amount_text":"3748.9억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.691Z","founded_original":"27년 11개월"}'::jsonb,
  '2025-06-05T00:13:14.691Z'
)
ON CONFLICT (company_id) DO UPDATE SET
  company_name = EXCLUDED.company_name,
  representative = EXCLUDED.representative,
  established_date = EXCLUDED.established_date,
  location = EXCLUDED.location,
  zip_code = EXCLUDED.zip_code,
  company_type = EXCLUDED.company_type,
  industry = EXCLUDED.industry,
  operating_amount = EXCLUDED.operating_amount,
  founded = EXCLUDED.founded,
  status = EXCLUDED.status,
  apify_source = EXCLUDED.apify_source,
  contact_info = EXCLUDED.contact_info,
  disclosure_data = EXCLUDED.disclosure_data,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 652: 포지티브인베스트먼트
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20220322',
  '포지티브인베스트먼트',
  '',
  '2022-01-01',
  '서울 강남구',
  '06166',
  '벤처투자회사',
  '유통/서비스',
  764.5,
  '3년 2개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"06166"}'::jsonb,
  '{"operator_type_code":"1","operator_type_name":"벤처투자회사","operating_scale_code":"4","business_category_code":"3","strategy_planner":"No","professional_angel":"No","investment_character":"","operating_amount_text":"764.5억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.691Z","founded_original":"3년 2개월"}'::jsonb,
  '2025-06-05T00:13:14.691Z'
)
ON CONFLICT (company_id) DO UPDATE SET
  company_name = EXCLUDED.company_name,
  representative = EXCLUDED.representative,
  established_date = EXCLUDED.established_date,
  location = EXCLUDED.location,
  zip_code = EXCLUDED.zip_code,
  company_type = EXCLUDED.company_type,
  industry = EXCLUDED.industry,
  operating_amount = EXCLUDED.operating_amount,
  founded = EXCLUDED.founded,
  status = EXCLUDED.status,
  apify_source = EXCLUDED.apify_source,
  contact_info = EXCLUDED.contact_info,
  disclosure_data = EXCLUDED.disclosure_data,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 653: 포항공과대학교기술지주
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20120010',
  '포항공과대학교기술지주',
  '',
  '2013-01-01',
  '경상북도 포항시 남구',
  '37673',
  '기타운용사',
  'ICT서비스',
  421,
  '12년 11개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"37673"}'::jsonb,
  '{"operator_type_code":"9","operator_type_name":"기타운용사","operating_scale_code":"3","business_category_code":"5","strategy_planner":"Yes","professional_angel":"No","investment_character":"","operating_amount_text":"421.0억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.691Z","founded_original":"12년 11개월"}'::jsonb,
  '2025-06-05T00:13:14.691Z'
)
ON CONFLICT (company_id) DO UPDATE SET
  company_name = EXCLUDED.company_name,
  representative = EXCLUDED.representative,
  established_date = EXCLUDED.established_date,
  location = EXCLUDED.location,
  zip_code = EXCLUDED.zip_code,
  company_type = EXCLUDED.company_type,
  industry = EXCLUDED.industry,
  operating_amount = EXCLUDED.operating_amount,
  founded = EXCLUDED.founded,
  status = EXCLUDED.status,
  apify_source = EXCLUDED.apify_source,
  contact_info = EXCLUDED.contact_info,
  disclosure_data = EXCLUDED.disclosure_data,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 654: 퓨처플레이
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20160003',
  '퓨처플레이',
  '',
  '2013-01-01',
  '서울 성동구',
  '04769',
  '벤처투자회사',
  'ICT서비스',
  1731.7,
  '12년 2개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"04769"}'::jsonb,
  '{"operator_type_code":"1","operator_type_name":"벤처투자회사","operating_scale_code":"5","business_category_code":"5","strategy_planner":"Yes","professional_angel":"No","investment_character":"","operating_amount_text":"1731.7억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.691Z","founded_original":"12년 2개월"}'::jsonb,
  '2025-06-05T00:13:14.691Z'
)
ON CONFLICT (company_id) DO UPDATE SET
  company_name = EXCLUDED.company_name,
  representative = EXCLUDED.representative,
  established_date = EXCLUDED.established_date,
  location = EXCLUDED.location,
  zip_code = EXCLUDED.zip_code,
  company_type = EXCLUDED.company_type,
  industry = EXCLUDED.industry,
  operating_amount = EXCLUDED.operating_amount,
  founded = EXCLUDED.founded,
  status = EXCLUDED.status,
  apify_source = EXCLUDED.apify_source,
  contact_info = EXCLUDED.contact_info,
  disclosure_data = EXCLUDED.disclosure_data,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 655: 프라이머시즌5
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20170039',
  '프라이머시즌5',
  '',
  '2018-01-01',
  '서울 마포구',
  '04213',
  '기타운용사',
  '유통/서비스',
  359.6,
  '7년 10개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"04213"}'::jsonb,
  '{"operator_type_code":"9","operator_type_name":"기타운용사","operating_scale_code":"3","business_category_code":"5","strategy_planner":"Yes","professional_angel":"No","investment_character":"","operating_amount_text":"359.6억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.691Z","founded_original":"7년 10개월"}'::jsonb,
  '2025-06-05T00:13:14.691Z'
)
ON CONFLICT (company_id) DO UPDATE SET
  company_name = EXCLUDED.company_name,
  representative = EXCLUDED.representative,
  established_date = EXCLUDED.established_date,
  location = EXCLUDED.location,
  zip_code = EXCLUDED.zip_code,
  company_type = EXCLUDED.company_type,
  industry = EXCLUDED.industry,
  operating_amount = EXCLUDED.operating_amount,
  founded = EXCLUDED.founded,
  status = EXCLUDED.status,
  apify_source = EXCLUDED.apify_source,
  contact_info = EXCLUDED.contact_info,
  disclosure_data = EXCLUDED.disclosure_data,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 656: 프렌즈
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20200051',
  '프렌즈',
  '',
  '2020-01-01',
  '서울 서초구',
  '06744',
  '기타운용사',
  '기타',
  NULL,
  '5년 9개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"06744"}'::jsonb,
  '{"operator_type_code":"9","operator_type_name":"기타운용사","operating_scale_code":"1","business_category_code":"4","strategy_planner":"Yes","professional_angel":"No","investment_character":"","operating_amount_text":"0.0억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.691Z","founded_original":"5년 9개월"}'::jsonb,
  '2025-06-05T00:13:14.691Z'
)
ON CONFLICT (company_id) DO UPDATE SET
  company_name = EXCLUDED.company_name,
  representative = EXCLUDED.representative,
  established_date = EXCLUDED.established_date,
  location = EXCLUDED.location,
  zip_code = EXCLUDED.zip_code,
  company_type = EXCLUDED.company_type,
  industry = EXCLUDED.industry,
  operating_amount = EXCLUDED.operating_amount,
  founded = EXCLUDED.founded,
  status = EXCLUDED.status,
  apify_source = EXCLUDED.apify_source,
  contact_info = EXCLUDED.contact_info,
  disclosure_data = EXCLUDED.disclosure_data,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 657: 프로디지인베스트먼트
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20180001',
  '프로디지인베스트먼트',
  '',
  '2018-01-01',
  '서울 강남구',
  '06147',
  '벤처투자회사',
  '바이오/의료',
  436.6,
  '7년 5개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"06147"}'::jsonb,
  '{"operator_type_code":"1","operator_type_name":"벤처투자회사","operating_scale_code":"3","business_category_code":"5","strategy_planner":"Yes","professional_angel":"No","investment_character":"","operating_amount_text":"436.6억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.691Z","founded_original":"7년 5개월"}'::jsonb,
  '2025-06-05T00:13:14.691Z'
)
ON CONFLICT (company_id) DO UPDATE SET
  company_name = EXCLUDED.company_name,
  representative = EXCLUDED.representative,
  established_date = EXCLUDED.established_date,
  location = EXCLUDED.location,
  zip_code = EXCLUDED.zip_code,
  company_type = EXCLUDED.company_type,
  industry = EXCLUDED.industry,
  operating_amount = EXCLUDED.operating_amount,
  founded = EXCLUDED.founded,
  status = EXCLUDED.status,
  apify_source = EXCLUDED.apify_source,
  contact_info = EXCLUDED.contact_info,
  disclosure_data = EXCLUDED.disclosure_data,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 658: 프로텍벤처스
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20190277',
  '프로텍벤처스',
  '',
  '2020-01-01',
  '서울 강남구',
  '06193',
  '벤처투자회사',
  'ICT제조',
  157.5,
  '5년 10개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"06193"}'::jsonb,
  '{"operator_type_code":"1","operator_type_name":"벤처투자회사","operating_scale_code":"2","business_category_code":"4","strategy_planner":"No","professional_angel":"No","investment_character":"","operating_amount_text":"157.5억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.691Z","founded_original":"5년 10개월"}'::jsonb,
  '2025-06-05T00:13:14.691Z'
)
ON CONFLICT (company_id) DO UPDATE SET
  company_name = EXCLUDED.company_name,
  representative = EXCLUDED.representative,
  established_date = EXCLUDED.established_date,
  location = EXCLUDED.location,
  zip_code = EXCLUDED.zip_code,
  company_type = EXCLUDED.company_type,
  industry = EXCLUDED.industry,
  operating_amount = EXCLUDED.operating_amount,
  founded = EXCLUDED.founded,
  status = EXCLUDED.status,
  apify_source = EXCLUDED.apify_source,
  contact_info = EXCLUDED.contact_info,
  disclosure_data = EXCLUDED.disclosure_data,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 659: 프롤로그벤처스
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20220484',
  '프롤로그벤처스',
  '',
  '2022-01-01',
  '서울 강남구',
  '06166',
  '신기술사',
  '영상/공연/음반',
  285,
  '3년 6개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"06166"}'::jsonb,
  '{"operator_type_code":"2","operator_type_name":"신기술사","operating_scale_code":"2","business_category_code":"3","strategy_planner":"No","professional_angel":"No","investment_character":"","operating_amount_text":"285.0억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.691Z","founded_original":"3년 6개월"}'::jsonb,
  '2025-06-05T00:13:14.691Z'
)
ON CONFLICT (company_id) DO UPDATE SET
  company_name = EXCLUDED.company_name,
  representative = EXCLUDED.representative,
  established_date = EXCLUDED.established_date,
  location = EXCLUDED.location,
  zip_code = EXCLUDED.zip_code,
  company_type = EXCLUDED.company_type,
  industry = EXCLUDED.industry,
  operating_amount = EXCLUDED.operating_amount,
  founded = EXCLUDED.founded,
  status = EXCLUDED.status,
  apify_source = EXCLUDED.apify_source,
  contact_info = EXCLUDED.contact_info,
  disclosure_data = EXCLUDED.disclosure_data,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 660: 프리미어파트너스
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20050002',
  '프리미어파트너스',
  '',
  '2006-01-01',
  '서울 강남구',
  '06176',
  'LLC',
  'ICT서비스',
  8821.3,
  '19년 9개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"06176"}'::jsonb,
  '{"operator_type_code":"4","operator_type_name":"LLC","operating_scale_code":"5","business_category_code":"6","strategy_planner":"No","professional_angel":"No","investment_character":"","operating_amount_text":"8821.3억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.691Z","founded_original":"19년 9개월"}'::jsonb,
  '2025-06-05T00:13:14.691Z'
)
ON CONFLICT (company_id) DO UPDATE SET
  company_name = EXCLUDED.company_name,
  representative = EXCLUDED.representative,
  established_date = EXCLUDED.established_date,
  location = EXCLUDED.location,
  zip_code = EXCLUDED.zip_code,
  company_type = EXCLUDED.company_type,
  industry = EXCLUDED.industry,
  operating_amount = EXCLUDED.operating_amount,
  founded = EXCLUDED.founded,
  status = EXCLUDED.status,
  apify_source = EXCLUDED.apify_source,
  contact_info = EXCLUDED.contact_info,
  disclosure_data = EXCLUDED.disclosure_data,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 661: 프리코
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20200265',
  '프리코',
  '',
  '2016-01-01',
  '서울 성동구',
  '04779',
  '기타운용사',
  '기타',
  NULL,
  '9년 2개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"04779"}'::jsonb,
  '{"operator_type_code":"9","operator_type_name":"기타운용사","operating_scale_code":"1","business_category_code":"5","strategy_planner":"Yes","professional_angel":"No","investment_character":"","operating_amount_text":"0.0억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.691Z","founded_original":"9년 2개월"}'::jsonb,
  '2025-06-05T00:13:14.691Z'
)
ON CONFLICT (company_id) DO UPDATE SET
  company_name = EXCLUDED.company_name,
  representative = EXCLUDED.representative,
  established_date = EXCLUDED.established_date,
  location = EXCLUDED.location,
  zip_code = EXCLUDED.zip_code,
  company_type = EXCLUDED.company_type,
  industry = EXCLUDED.industry,
  operating_amount = EXCLUDED.operating_amount,
  founded = EXCLUDED.founded,
  status = EXCLUDED.status,
  apify_source = EXCLUDED.apify_source,
  contact_info = EXCLUDED.contact_info,
  disclosure_data = EXCLUDED.disclosure_data,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 662: 플래티넘기술투자
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20000023',
  '플래티넘기술투자',
  '',
  '2000-01-01',
  '서울 강남구',
  '06162',
  '벤처투자회사',
  '전기/기계/장비',
  1938,
  '25년 4개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"06162"}'::jsonb,
  '{"operator_type_code":"1","operator_type_name":"벤처투자회사","operating_scale_code":"5","business_category_code":"6","strategy_planner":"No","professional_angel":"No","investment_character":"","operating_amount_text":"1938.0억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.691Z","founded_original":"25년 4개월"}'::jsonb,
  '2025-06-05T00:13:14.691Z'
)
ON CONFLICT (company_id) DO UPDATE SET
  company_name = EXCLUDED.company_name,
  representative = EXCLUDED.representative,
  established_date = EXCLUDED.established_date,
  location = EXCLUDED.location,
  zip_code = EXCLUDED.zip_code,
  company_type = EXCLUDED.company_type,
  industry = EXCLUDED.industry,
  operating_amount = EXCLUDED.operating_amount,
  founded = EXCLUDED.founded,
  status = EXCLUDED.status,
  apify_source = EXCLUDED.apify_source,
  contact_info = EXCLUDED.contact_info,
  disclosure_data = EXCLUDED.disclosure_data,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 663: 플랜에이치벤처스
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20190231',
  '플랜에이치벤처스',
  '',
  '2019-01-01',
  '서울 서초구',
  '06768',
  '벤처투자회사',
  '유통/서비스',
  488.5,
  '6년 3개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"06768"}'::jsonb,
  '{"operator_type_code":"1","operator_type_name":"벤처투자회사","operating_scale_code":"3","business_category_code":"4","strategy_planner":"Yes","professional_angel":"No","investment_character":"","operating_amount_text":"488.5억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.691Z","founded_original":"6년 3개월"}'::jsonb,
  '2025-06-05T00:13:14.691Z'
)
ON CONFLICT (company_id) DO UPDATE SET
  company_name = EXCLUDED.company_name,
  representative = EXCLUDED.representative,
  established_date = EXCLUDED.established_date,
  location = EXCLUDED.location,
  zip_code = EXCLUDED.zip_code,
  company_type = EXCLUDED.company_type,
  industry = EXCLUDED.industry,
  operating_amount = EXCLUDED.operating_amount,
  founded = EXCLUDED.founded,
  status = EXCLUDED.status,
  apify_source = EXCLUDED.apify_source,
  contact_info = EXCLUDED.contact_info,
  disclosure_data = EXCLUDED.disclosure_data,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 664: 플럭스벤처스
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20220015',
  '플럭스벤처스',
  '',
  '2022-01-01',
  '서울 강남구',
  '06014',
  '벤처투자회사',
  '전기/기계/장비',
  423.8,
  '3년 6개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"06014"}'::jsonb,
  '{"operator_type_code":"1","operator_type_name":"벤처투자회사","operating_scale_code":"3","business_category_code":"3","strategy_planner":"No","professional_angel":"No","investment_character":"","operating_amount_text":"423.8억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.691Z","founded_original":"3년 6개월"}'::jsonb,
  '2025-06-05T00:13:14.691Z'
)
ON CONFLICT (company_id) DO UPDATE SET
  company_name = EXCLUDED.company_name,
  representative = EXCLUDED.representative,
  established_date = EXCLUDED.established_date,
  location = EXCLUDED.location,
  zip_code = EXCLUDED.zip_code,
  company_type = EXCLUDED.company_type,
  industry = EXCLUDED.industry,
  operating_amount = EXCLUDED.operating_amount,
  founded = EXCLUDED.founded,
  status = EXCLUDED.status,
  apify_source = EXCLUDED.apify_source,
  contact_info = EXCLUDED.contact_info,
  disclosure_data = EXCLUDED.disclosure_data,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 665: 플린토파트너스
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20220565',
  '플린토파트너스',
  '',
  '2023-01-01',
  '서울 서초구',
  '06621',
  '기타운용사',
  '기타',
  NULL,
  '2년 10개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"06621"}'::jsonb,
  '{"operator_type_code":"9","operator_type_name":"기타운용사","operating_scale_code":"1","business_category_code":"2","strategy_planner":"Yes","professional_angel":"No","investment_character":"","operating_amount_text":"0.0억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.691Z","founded_original":"2년 10개월"}'::jsonb,
  '2025-06-05T00:13:14.691Z'
)
ON CONFLICT (company_id) DO UPDATE SET
  company_name = EXCLUDED.company_name,
  representative = EXCLUDED.representative,
  established_date = EXCLUDED.established_date,
  location = EXCLUDED.location,
  zip_code = EXCLUDED.zip_code,
  company_type = EXCLUDED.company_type,
  industry = EXCLUDED.industry,
  operating_amount = EXCLUDED.operating_amount,
  founded = EXCLUDED.founded,
  status = EXCLUDED.status,
  apify_source = EXCLUDED.apify_source,
  contact_info = EXCLUDED.contact_info,
  disclosure_data = EXCLUDED.disclosure_data,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 666: 피앤리
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20220519',
  '피앤리',
  '',
  '2022-01-01',
  '서울 서초구',
  '06554',
  '기타운용사',
  '기타',
  NULL,
  '3년 1개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"06554"}'::jsonb,
  '{"operator_type_code":"9","operator_type_name":"기타운용사","operating_scale_code":"1","business_category_code":"3","strategy_planner":"Yes","professional_angel":"No","investment_character":"","operating_amount_text":"0.0억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.692Z","founded_original":"3년 1개월"}'::jsonb,
  '2025-06-05T00:13:14.692Z'
)
ON CONFLICT (company_id) DO UPDATE SET
  company_name = EXCLUDED.company_name,
  representative = EXCLUDED.representative,
  established_date = EXCLUDED.established_date,
  location = EXCLUDED.location,
  zip_code = EXCLUDED.zip_code,
  company_type = EXCLUDED.company_type,
  industry = EXCLUDED.industry,
  operating_amount = EXCLUDED.operating_amount,
  founded = EXCLUDED.founded,
  status = EXCLUDED.status,
  apify_source = EXCLUDED.apify_source,
  contact_info = EXCLUDED.contact_info,
  disclosure_data = EXCLUDED.disclosure_data,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 667: 피앤아이인베스트먼트
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20150012',
  '피앤아이인베스트먼트',
  '',
  '2015-01-01',
  '서울 강남구',
  '06162',
  '벤처투자회사',
  '영상/공연/음반',
  1226.2,
  '10년 2개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"06162"}'::jsonb,
  '{"operator_type_code":"1","operator_type_name":"벤처투자회사","operating_scale_code":"5","business_category_code":"5","strategy_planner":"No","professional_angel":"No","investment_character":"","operating_amount_text":"1226.2억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.692Z","founded_original":"10년 2개월"}'::jsonb,
  '2025-06-05T00:13:14.692Z'
)
ON CONFLICT (company_id) DO UPDATE SET
  company_name = EXCLUDED.company_name,
  representative = EXCLUDED.representative,
  established_date = EXCLUDED.established_date,
  location = EXCLUDED.location,
  zip_code = EXCLUDED.zip_code,
  company_type = EXCLUDED.company_type,
  industry = EXCLUDED.industry,
  operating_amount = EXCLUDED.operating_amount,
  founded = EXCLUDED.founded,
  status = EXCLUDED.status,
  apify_source = EXCLUDED.apify_source,
  contact_info = EXCLUDED.contact_info,
  disclosure_data = EXCLUDED.disclosure_data,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 668: 피앤피인베스트먼트
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20180049',
  '피앤피인베스트먼트',
  '',
  '2019-01-01',
  '경기도 성남시 분당구',
  '13487',
  '벤처투자회사',
  '전기/기계/장비',
  791.3,
  '6년 8개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"13487"}'::jsonb,
  '{"operator_type_code":"1","operator_type_name":"벤처투자회사","operating_scale_code":"4","business_category_code":"4","strategy_planner":"No","professional_angel":"No","investment_character":"","operating_amount_text":"791.3억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.692Z","founded_original":"6년 8개월"}'::jsonb,
  '2025-06-05T00:13:14.692Z'
)
ON CONFLICT (company_id) DO UPDATE SET
  company_name = EXCLUDED.company_name,
  representative = EXCLUDED.representative,
  established_date = EXCLUDED.established_date,
  location = EXCLUDED.location,
  zip_code = EXCLUDED.zip_code,
  company_type = EXCLUDED.company_type,
  industry = EXCLUDED.industry,
  operating_amount = EXCLUDED.operating_amount,
  founded = EXCLUDED.founded,
  status = EXCLUDED.status,
  apify_source = EXCLUDED.apify_source,
  contact_info = EXCLUDED.contact_info,
  disclosure_data = EXCLUDED.disclosure_data,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 669: 피에이알벤처스
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20210568',
  '피에이알벤처스',
  '',
  '2022-01-01',
  '경기도 수원시 영통구',
  '16514',
  '기타운용사',
  '기타',
  NULL,
  '3년 9개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"16514"}'::jsonb,
  '{"operator_type_code":"9","operator_type_name":"기타운용사","operating_scale_code":"1","business_category_code":"3","strategy_planner":"Yes","professional_angel":"No","investment_character":"","operating_amount_text":"0.0억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.692Z","founded_original":"3년 9개월"}'::jsonb,
  '2025-06-05T00:13:14.692Z'
)
ON CONFLICT (company_id) DO UPDATE SET
  company_name = EXCLUDED.company_name,
  representative = EXCLUDED.representative,
  established_date = EXCLUDED.established_date,
  location = EXCLUDED.location,
  zip_code = EXCLUDED.zip_code,
  company_type = EXCLUDED.company_type,
  industry = EXCLUDED.industry,
  operating_amount = EXCLUDED.operating_amount,
  founded = EXCLUDED.founded,
  status = EXCLUDED.status,
  apify_source = EXCLUDED.apify_source,
  contact_info = EXCLUDED.contact_info,
  disclosure_data = EXCLUDED.disclosure_data,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 670: 피지벤처스
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20220282',
  '피지벤처스',
  '',
  '2022-01-01',
  '경기도 성남시 수정구',
  '13449',
  '기타운용사',
  '유통/서비스',
  1.1,
  '3년 3개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"13449"}'::jsonb,
  '{"operator_type_code":"9","operator_type_name":"기타운용사","operating_scale_code":"1","business_category_code":"3","strategy_planner":"Yes","professional_angel":"No","investment_character":"","operating_amount_text":"1.1억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.692Z","founded_original":"3년 3개월"}'::jsonb,
  '2025-06-05T00:13:14.692Z'
)
ON CONFLICT (company_id) DO UPDATE SET
  company_name = EXCLUDED.company_name,
  representative = EXCLUDED.representative,
  established_date = EXCLUDED.established_date,
  location = EXCLUDED.location,
  zip_code = EXCLUDED.zip_code,
  company_type = EXCLUDED.company_type,
  industry = EXCLUDED.industry,
  operating_amount = EXCLUDED.operating_amount,
  founded = EXCLUDED.founded,
  status = EXCLUDED.status,
  apify_source = EXCLUDED.apify_source,
  contact_info = EXCLUDED.contact_info,
  disclosure_data = EXCLUDED.disclosure_data,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 671: 핀업파트너스
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20210690',
  '핀업파트너스',
  '',
  '2022-01-01',
  '서울 강남구',
  '06157',
  '기타운용사',
  '기타',
  NULL,
  '3년 6개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"06157"}'::jsonb,
  '{"operator_type_code":"9","operator_type_name":"기타운용사","operating_scale_code":"1","business_category_code":"3","strategy_planner":"Yes","professional_angel":"No","investment_character":"","operating_amount_text":"0.0억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.692Z","founded_original":"3년 6개월"}'::jsonb,
  '2025-06-05T00:13:14.692Z'
)
ON CONFLICT (company_id) DO UPDATE SET
  company_name = EXCLUDED.company_name,
  representative = EXCLUDED.representative,
  established_date = EXCLUDED.established_date,
  location = EXCLUDED.location,
  zip_code = EXCLUDED.zip_code,
  company_type = EXCLUDED.company_type,
  industry = EXCLUDED.industry,
  operating_amount = EXCLUDED.operating_amount,
  founded = EXCLUDED.founded,
  status = EXCLUDED.status,
  apify_source = EXCLUDED.apify_source,
  contact_info = EXCLUDED.contact_info,
  disclosure_data = EXCLUDED.disclosure_data,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 672: 필로소피아벤처스
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20220489',
  '필로소피아벤처스',
  '',
  '2023-01-01',
  '서울 강남구',
  '06013',
  '벤처투자회사',
  'ICT서비스',
  119.5,
  '2년 11개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"06013"}'::jsonb,
  '{"operator_type_code":"1","operator_type_name":"벤처투자회사","operating_scale_code":"2","business_category_code":"2","strategy_planner":"Yes","professional_angel":"No","investment_character":"","operating_amount_text":"119.5억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.692Z","founded_original":"2년 11개월"}'::jsonb,
  '2025-06-05T00:13:14.692Z'
)
ON CONFLICT (company_id) DO UPDATE SET
  company_name = EXCLUDED.company_name,
  representative = EXCLUDED.representative,
  established_date = EXCLUDED.established_date,
  location = EXCLUDED.location,
  zip_code = EXCLUDED.zip_code,
  company_type = EXCLUDED.company_type,
  industry = EXCLUDED.industry,
  operating_amount = EXCLUDED.operating_amount,
  founded = EXCLUDED.founded,
  status = EXCLUDED.status,
  apify_source = EXCLUDED.apify_source,
  contact_info = EXCLUDED.contact_info,
  disclosure_data = EXCLUDED.disclosure_data,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 673: 필리안벤처투자
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20210430',
  '필리안벤처투자',
  '',
  '2022-01-01',
  '서울 서초구',
  '06627',
  '벤처투자회사',
  '기타',
  NULL,
  '3년 11개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"06627"}'::jsonb,
  '{"operator_type_code":"1","operator_type_name":"벤처투자회사","operating_scale_code":"1","business_category_code":"3","strategy_planner":"No","professional_angel":"No","investment_character":"","operating_amount_text":"0.0억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.692Z","founded_original":"3년 11개월"}'::jsonb,
  '2025-06-05T00:13:14.692Z'
)
ON CONFLICT (company_id) DO UPDATE SET
  company_name = EXCLUDED.company_name,
  representative = EXCLUDED.representative,
  established_date = EXCLUDED.established_date,
  location = EXCLUDED.location,
  zip_code = EXCLUDED.zip_code,
  company_type = EXCLUDED.company_type,
  industry = EXCLUDED.industry,
  operating_amount = EXCLUDED.operating_amount,
  founded = EXCLUDED.founded,
  status = EXCLUDED.status,
  apify_source = EXCLUDED.apify_source,
  contact_info = EXCLUDED.contact_info,
  disclosure_data = EXCLUDED.disclosure_data,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 674: 하나금융티아이
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20190185',
  '하나금융티아이',
  '',
  '1991-01-01',
  '인천 서구',
  '22742',
  '기타운용사',
  '기타',
  NULL,
  '34년 8개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"22742"}'::jsonb,
  '{"operator_type_code":"9","operator_type_name":"기타운용사","operating_scale_code":"1","business_category_code":"6","strategy_planner":"Yes","professional_angel":"No","investment_character":"","operating_amount_text":"0.0억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.692Z","founded_original":"34년 8개월"}'::jsonb,
  '2025-06-05T00:13:14.692Z'
)
ON CONFLICT (company_id) DO UPDATE SET
  company_name = EXCLUDED.company_name,
  representative = EXCLUDED.representative,
  established_date = EXCLUDED.established_date,
  location = EXCLUDED.location,
  zip_code = EXCLUDED.zip_code,
  company_type = EXCLUDED.company_type,
  industry = EXCLUDED.industry,
  operating_amount = EXCLUDED.operating_amount,
  founded = EXCLUDED.founded,
  status = EXCLUDED.status,
  apify_source = EXCLUDED.apify_source,
  contact_info = EXCLUDED.contact_info,
  disclosure_data = EXCLUDED.disclosure_data,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 675: 하나벤처스
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20190414',
  '하나벤처스',
  '',
  '2019-01-01',
  '서울 강남구',
  '06169',
  '신기술사',
  'ICT서비스',
  2790,
  '6년 8개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"06169"}'::jsonb,
  '{"operator_type_code":"2","operator_type_name":"신기술사","operating_scale_code":"5","business_category_code":"4","strategy_planner":"No","professional_angel":"No","investment_character":"","operating_amount_text":"2790.0억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.692Z","founded_original":"6년 8개월"}'::jsonb,
  '2025-06-05T00:13:14.692Z'
)
ON CONFLICT (company_id) DO UPDATE SET
  company_name = EXCLUDED.company_name,
  representative = EXCLUDED.representative,
  established_date = EXCLUDED.established_date,
  location = EXCLUDED.location,
  zip_code = EXCLUDED.zip_code,
  company_type = EXCLUDED.company_type,
  industry = EXCLUDED.industry,
  operating_amount = EXCLUDED.operating_amount,
  founded = EXCLUDED.founded,
  status = EXCLUDED.status,
  apify_source = EXCLUDED.apify_source,
  contact_info = EXCLUDED.contact_info,
  disclosure_data = EXCLUDED.disclosure_data,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 676: 하이버프파트너스
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20210269',
  '하이버프파트너스',
  '',
  '2021-01-01',
  '부산 남구',
  '48400',
  '기타운용사',
  '기타',
  NULL,
  '4년 1개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"48400"}'::jsonb,
  '{"operator_type_code":"9","operator_type_name":"기타운용사","operating_scale_code":"1","business_category_code":"3","strategy_planner":"Yes","professional_angel":"No","investment_character":"","operating_amount_text":"0.0억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.692Z","founded_original":"4년 1개월"}'::jsonb,
  '2025-06-05T00:13:14.692Z'
)
ON CONFLICT (company_id) DO UPDATE SET
  company_name = EXCLUDED.company_name,
  representative = EXCLUDED.representative,
  established_date = EXCLUDED.established_date,
  location = EXCLUDED.location,
  zip_code = EXCLUDED.zip_code,
  company_type = EXCLUDED.company_type,
  industry = EXCLUDED.industry,
  operating_amount = EXCLUDED.operating_amount,
  founded = EXCLUDED.founded,
  status = EXCLUDED.status,
  apify_source = EXCLUDED.apify_source,
  contact_info = EXCLUDED.contact_info,
  disclosure_data = EXCLUDED.disclosure_data,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 677: 하이테크벤처스
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20220163',
  '하이테크벤처스',
  '',
  '2022-01-01',
  '서울 강서구',
  '07807',
  'LLC',
  '기타',
  NULL,
  '3년 5개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"07807"}'::jsonb,
  '{"operator_type_code":"4","operator_type_name":"LLC","operating_scale_code":"1","business_category_code":"3","strategy_planner":"Yes","professional_angel":"No","investment_character":"","operating_amount_text":"0.0억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.692Z","founded_original":"3년 5개월"}'::jsonb,
  '2025-06-05T00:13:14.692Z'
)
ON CONFLICT (company_id) DO UPDATE SET
  company_name = EXCLUDED.company_name,
  representative = EXCLUDED.representative,
  established_date = EXCLUDED.established_date,
  location = EXCLUDED.location,
  zip_code = EXCLUDED.zip_code,
  company_type = EXCLUDED.company_type,
  industry = EXCLUDED.industry,
  operating_amount = EXCLUDED.operating_amount,
  founded = EXCLUDED.founded,
  status = EXCLUDED.status,
  apify_source = EXCLUDED.apify_source,
  contact_info = EXCLUDED.contact_info,
  disclosure_data = EXCLUDED.disclosure_data,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 678: 한국가치투자
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20210747',
  '한국가치투자',
  '',
  '2022-01-01',
  '전라남도 목포시',
  '58662',
  '벤처투자회사',
  '영상/공연/음반',
  243,
  '3년 6개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"58662"}'::jsonb,
  '{"operator_type_code":"1","operator_type_name":"벤처투자회사","operating_scale_code":"2","business_category_code":"3","strategy_planner":"Yes","professional_angel":"No","investment_character":"","operating_amount_text":"243.0억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.692Z","founded_original":"3년 6개월"}'::jsonb,
  '2025-06-05T00:13:14.692Z'
)
ON CONFLICT (company_id) DO UPDATE SET
  company_name = EXCLUDED.company_name,
  representative = EXCLUDED.representative,
  established_date = EXCLUDED.established_date,
  location = EXCLUDED.location,
  zip_code = EXCLUDED.zip_code,
  company_type = EXCLUDED.company_type,
  industry = EXCLUDED.industry,
  operating_amount = EXCLUDED.operating_amount,
  founded = EXCLUDED.founded,
  status = EXCLUDED.status,
  apify_source = EXCLUDED.apify_source,
  contact_info = EXCLUDED.contact_info,
  disclosure_data = EXCLUDED.disclosure_data,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 679: 한국경영인증원
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20200499',
  '한국경영인증원',
  '',
  '2002-01-01',
  '서울 영등포구',
  '07299',
  '기타운용사',
  '기타',
  NULL,
  '23년 6개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"07299"}'::jsonb,
  '{"operator_type_code":"9","operator_type_name":"기타운용사","operating_scale_code":"1","business_category_code":"6","strategy_planner":"Yes","professional_angel":"No","investment_character":"","operating_amount_text":"0.0억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.692Z","founded_original":"23년 6개월"}'::jsonb,
  '2025-06-05T00:13:14.692Z'
)
ON CONFLICT (company_id) DO UPDATE SET
  company_name = EXCLUDED.company_name,
  representative = EXCLUDED.representative,
  established_date = EXCLUDED.established_date,
  location = EXCLUDED.location,
  zip_code = EXCLUDED.zip_code,
  company_type = EXCLUDED.company_type,
  industry = EXCLUDED.industry,
  operating_amount = EXCLUDED.operating_amount,
  founded = EXCLUDED.founded,
  status = EXCLUDED.status,
  apify_source = EXCLUDED.apify_source,
  contact_info = EXCLUDED.contact_info,
  disclosure_data = EXCLUDED.disclosure_data,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 680: 한국과학기술지주
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20180016',
  '한국과학기술지주',
  '',
  '2014-01-01',
  '대전 유성구',
  '34112',
  '기타운용사',
  '바이오/의료',
  173,
  '11년 6개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"34112"}'::jsonb,
  '{"operator_type_code":"9","operator_type_name":"기타운용사","operating_scale_code":"2","business_category_code":"5","strategy_planner":"Yes","professional_angel":"No","investment_character":"","operating_amount_text":"173.0억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.692Z","founded_original":"11년 6개월"}'::jsonb,
  '2025-06-05T00:13:14.692Z'
)
ON CONFLICT (company_id) DO UPDATE SET
  company_name = EXCLUDED.company_name,
  representative = EXCLUDED.representative,
  established_date = EXCLUDED.established_date,
  location = EXCLUDED.location,
  zip_code = EXCLUDED.zip_code,
  company_type = EXCLUDED.company_type,
  industry = EXCLUDED.industry,
  operating_amount = EXCLUDED.operating_amount,
  founded = EXCLUDED.founded,
  status = EXCLUDED.status,
  apify_source = EXCLUDED.apify_source,
  contact_info = EXCLUDED.contact_info,
  disclosure_data = EXCLUDED.disclosure_data,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 681: 한국바이오투자파트너스
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20170044',
  '한국바이오투자파트너스',
  '',
  '2018-01-01',
  '경기도 성남시 분당구',
  '13496',
  '기타운용사',
  '바이오/의료',
  34.5,
  '7년 5개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"13496"}'::jsonb,
  '{"operator_type_code":"9","operator_type_name":"기타운용사","operating_scale_code":"1","business_category_code":"5","strategy_planner":"Yes","professional_angel":"No","investment_character":"","operating_amount_text":"34.5억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.692Z","founded_original":"7년 5개월"}'::jsonb,
  '2025-06-05T00:13:14.692Z'
)
ON CONFLICT (company_id) DO UPDATE SET
  company_name = EXCLUDED.company_name,
  representative = EXCLUDED.representative,
  established_date = EXCLUDED.established_date,
  location = EXCLUDED.location,
  zip_code = EXCLUDED.zip_code,
  company_type = EXCLUDED.company_type,
  industry = EXCLUDED.industry,
  operating_amount = EXCLUDED.operating_amount,
  founded = EXCLUDED.founded,
  status = EXCLUDED.status,
  apify_source = EXCLUDED.apify_source,
  contact_info = EXCLUDED.contact_info,
  disclosure_data = EXCLUDED.disclosure_data,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 682: 한국벤처투자
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20000029',
  '한국벤처투자',
  '',
  '2000-01-01',
  '서울 서초구',
  '06595',
  '벤처투자회사',
  '기타',
  23966.3,
  '25년 2개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"06595"}'::jsonb,
  '{"operator_type_code":"1","operator_type_name":"벤처투자회사","operating_scale_code":"5","business_category_code":"6","strategy_planner":"No","professional_angel":"No","investment_character":"","operating_amount_text":"23966.3억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.692Z","founded_original":"25년 2개월"}'::jsonb,
  '2025-06-05T00:13:14.692Z'
)
ON CONFLICT (company_id) DO UPDATE SET
  company_name = EXCLUDED.company_name,
  representative = EXCLUDED.representative,
  established_date = EXCLUDED.established_date,
  location = EXCLUDED.location,
  zip_code = EXCLUDED.zip_code,
  company_type = EXCLUDED.company_type,
  industry = EXCLUDED.industry,
  operating_amount = EXCLUDED.operating_amount,
  founded = EXCLUDED.founded,
  status = EXCLUDED.status,
  apify_source = EXCLUDED.apify_source,
  contact_info = EXCLUDED.contact_info,
  disclosure_data = EXCLUDED.disclosure_data,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 683: 한국사회투자
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20200171',
  '한국사회투자',
  '',
  '2013-01-01',
  '서울 마포구',
  '03992',
  '기타운용사',
  '유통/서비스',
  27.6,
  '12년 5개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"03992"}'::jsonb,
  '{"operator_type_code":"9","operator_type_name":"기타운용사","operating_scale_code":"1","business_category_code":"5","strategy_planner":"Yes","professional_angel":"No","investment_character":"","operating_amount_text":"27.6억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.692Z","founded_original":"12년 5개월"}'::jsonb,
  '2025-06-05T00:13:14.692Z'
)
ON CONFLICT (company_id) DO UPDATE SET
  company_name = EXCLUDED.company_name,
  representative = EXCLUDED.representative,
  established_date = EXCLUDED.established_date,
  location = EXCLUDED.location,
  zip_code = EXCLUDED.zip_code,
  company_type = EXCLUDED.company_type,
  industry = EXCLUDED.industry,
  operating_amount = EXCLUDED.operating_amount,
  founded = EXCLUDED.founded,
  status = EXCLUDED.status,
  apify_source = EXCLUDED.apify_source,
  contact_info = EXCLUDED.contact_info,
  disclosure_data = EXCLUDED.disclosure_data,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 684: 한국사회혁신금융
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20190203',
  '한국사회혁신금융',
  '',
  '2016-01-01',
  '서울 성동구',
  '04793',
  '기타운용사',
  '기타',
  NULL,
  '9년 2개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"04793"}'::jsonb,
  '{"operator_type_code":"9","operator_type_name":"기타운용사","operating_scale_code":"1","business_category_code":"5","strategy_planner":"Yes","professional_angel":"No","investment_character":"","operating_amount_text":"0.0억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.692Z","founded_original":"9년 2개월"}'::jsonb,
  '2025-06-05T00:13:14.692Z'
)
ON CONFLICT (company_id) DO UPDATE SET
  company_name = EXCLUDED.company_name,
  representative = EXCLUDED.representative,
  established_date = EXCLUDED.established_date,
  location = EXCLUDED.location,
  zip_code = EXCLUDED.zip_code,
  company_type = EXCLUDED.company_type,
  industry = EXCLUDED.industry,
  operating_amount = EXCLUDED.operating_amount,
  founded = EXCLUDED.founded,
  status = EXCLUDED.status,
  apify_source = EXCLUDED.apify_source,
  contact_info = EXCLUDED.contact_info,
  disclosure_data = EXCLUDED.disclosure_data,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 685: 한국산업지능화협회
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20200282',
  '한국산업지능화협회',
  '',
  '2016-01-01',
  '경기도 성남시 중원구',
  '13211',
  '기타운용사',
  'ICT제조',
  3.3,
  '9년 9개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"13211"}'::jsonb,
  '{"operator_type_code":"9","operator_type_name":"기타운용사","operating_scale_code":"1","business_category_code":"5","strategy_planner":"Yes","professional_angel":"No","investment_character":"","operating_amount_text":"3.3억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.692Z","founded_original":"9년 9개월"}'::jsonb,
  '2025-06-05T00:13:14.692Z'
)
ON CONFLICT (company_id) DO UPDATE SET
  company_name = EXCLUDED.company_name,
  representative = EXCLUDED.representative,
  established_date = EXCLUDED.established_date,
  location = EXCLUDED.location,
  zip_code = EXCLUDED.zip_code,
  company_type = EXCLUDED.company_type,
  industry = EXCLUDED.industry,
  operating_amount = EXCLUDED.operating_amount,
  founded = EXCLUDED.founded,
  status = EXCLUDED.status,
  apify_source = EXCLUDED.apify_source,
  contact_info = EXCLUDED.contact_info,
  disclosure_data = EXCLUDED.disclosure_data,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 686: 한국생산성본부
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20200158',
  '한국생산성본부',
  '',
  '1987-01-01',
  '서울 종로구',
  '03170',
  '기타운용사',
  '기타',
  NULL,
  '38년 11개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"03170"}'::jsonb,
  '{"operator_type_code":"9","operator_type_name":"기타운용사","operating_scale_code":"1","business_category_code":"6","strategy_planner":"Yes","professional_angel":"No","investment_character":"","operating_amount_text":"0.0억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.692Z","founded_original":"38년 11개월"}'::jsonb,
  '2025-06-05T00:13:14.692Z'
)
ON CONFLICT (company_id) DO UPDATE SET
  company_name = EXCLUDED.company_name,
  representative = EXCLUDED.representative,
  established_date = EXCLUDED.established_date,
  location = EXCLUDED.location,
  zip_code = EXCLUDED.zip_code,
  company_type = EXCLUDED.company_type,
  industry = EXCLUDED.industry,
  operating_amount = EXCLUDED.operating_amount,
  founded = EXCLUDED.founded,
  status = EXCLUDED.status,
  apify_source = EXCLUDED.apify_source,
  contact_info = EXCLUDED.contact_info,
  disclosure_data = EXCLUDED.disclosure_data,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 687: 한국엔젤투자협회
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20120017',
  '한국엔젤투자협회',
  '',
  '2013-01-01',
  '서울 강남구',
  '06247',
  '기타운용사',
  'ICT서비스',
  250,
  '12년 8개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"06247"}'::jsonb,
  '{"operator_type_code":"9","operator_type_name":"기타운용사","operating_scale_code":"2","business_category_code":"5","strategy_planner":"Yes","professional_angel":"No","investment_character":"","operating_amount_text":"250.0억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.692Z","founded_original":"12년 8개월"}'::jsonb,
  '2025-06-05T00:13:14.692Z'
)
ON CONFLICT (company_id) DO UPDATE SET
  company_name = EXCLUDED.company_name,
  representative = EXCLUDED.representative,
  established_date = EXCLUDED.established_date,
  location = EXCLUDED.location,
  zip_code = EXCLUDED.zip_code,
  company_type = EXCLUDED.company_type,
  industry = EXCLUDED.industry,
  operating_amount = EXCLUDED.operating_amount,
  founded = EXCLUDED.founded,
  status = EXCLUDED.status,
  apify_source = EXCLUDED.apify_source,
  contact_info = EXCLUDED.contact_info,
  disclosure_data = EXCLUDED.disclosure_data,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 688: 한국인증융합연구원
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20210701',
  '한국인증융합연구원',
  '',
  '2019-01-01',
  '서울 서대문구',
  '03699',
  '기타운용사',
  '기타',
  NULL,
  '6년 9개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"03699"}'::jsonb,
  '{"operator_type_code":"9","operator_type_name":"기타운용사","operating_scale_code":"1","business_category_code":"4","strategy_planner":"Yes","professional_angel":"No","investment_character":"","operating_amount_text":"0.0억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.693Z","founded_original":"6년 9개월"}'::jsonb,
  '2025-06-05T00:13:14.693Z'
)
ON CONFLICT (company_id) DO UPDATE SET
  company_name = EXCLUDED.company_name,
  representative = EXCLUDED.representative,
  established_date = EXCLUDED.established_date,
  location = EXCLUDED.location,
  zip_code = EXCLUDED.zip_code,
  company_type = EXCLUDED.company_type,
  industry = EXCLUDED.industry,
  operating_amount = EXCLUDED.operating_amount,
  founded = EXCLUDED.founded,
  status = EXCLUDED.status,
  apify_source = EXCLUDED.apify_source,
  contact_info = EXCLUDED.contact_info,
  disclosure_data = EXCLUDED.disclosure_data,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 689: 한국인증협회
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20190266',
  '한국인증협회',
  '',
  '2016-01-01',
  '대전 유성구',
  '34074',
  '기타운용사',
  '기타',
  NULL,
  '9년 1개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"34074"}'::jsonb,
  '{"operator_type_code":"9","operator_type_name":"기타운용사","operating_scale_code":"1","business_category_code":"5","strategy_planner":"Yes","professional_angel":"No","investment_character":"","operating_amount_text":"0.0억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.693Z","founded_original":"9년 1개월"}'::jsonb,
  '2025-06-05T00:13:14.693Z'
)
ON CONFLICT (company_id) DO UPDATE SET
  company_name = EXCLUDED.company_name,
  representative = EXCLUDED.representative,
  established_date = EXCLUDED.established_date,
  location = EXCLUDED.location,
  zip_code = EXCLUDED.zip_code,
  company_type = EXCLUDED.company_type,
  industry = EXCLUDED.industry,
  operating_amount = EXCLUDED.operating_amount,
  founded = EXCLUDED.founded,
  status = EXCLUDED.status,
  apify_source = EXCLUDED.apify_source,
  contact_info = EXCLUDED.contact_info,
  disclosure_data = EXCLUDED.disclosure_data,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 690: 한국투자액셀러레이터
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20220008',
  '한국투자액셀러레이터',
  '',
  '2022-01-01',
  '서울 강남구',
  '06182',
  '기타운용사',
  'ICT서비스',
  450,
  '3년 5개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"06182"}'::jsonb,
  '{"operator_type_code":"9","operator_type_name":"기타운용사","operating_scale_code":"3","business_category_code":"3","strategy_planner":"Yes","professional_angel":"No","investment_character":"","operating_amount_text":"450.0억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.693Z","founded_original":"3년 5개월"}'::jsonb,
  '2025-06-05T00:13:14.693Z'
)
ON CONFLICT (company_id) DO UPDATE SET
  company_name = EXCLUDED.company_name,
  representative = EXCLUDED.representative,
  established_date = EXCLUDED.established_date,
  location = EXCLUDED.location,
  zip_code = EXCLUDED.zip_code,
  company_type = EXCLUDED.company_type,
  industry = EXCLUDED.industry,
  operating_amount = EXCLUDED.operating_amount,
  founded = EXCLUDED.founded,
  status = EXCLUDED.status,
  apify_source = EXCLUDED.apify_source,
  contact_info = EXCLUDED.contact_info,
  disclosure_data = EXCLUDED.disclosure_data,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 691: 한국투자파트너스
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP19860004',
  '한국투자파트너스',
  '',
  '1987-01-01',
  '서울 강남구',
  '06164',
  '벤처투자회사',
  'ICT서비스',
  29350.7,
  '38년 6개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"06164"}'::jsonb,
  '{"operator_type_code":"1","operator_type_name":"벤처투자회사","operating_scale_code":"5","business_category_code":"6","strategy_planner":"No","professional_angel":"No","investment_character":"","operating_amount_text":"29350.7억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.693Z","founded_original":"38년 6개월"}'::jsonb,
  '2025-06-05T00:13:14.693Z'
)
ON CONFLICT (company_id) DO UPDATE SET
  company_name = EXCLUDED.company_name,
  representative = EXCLUDED.representative,
  established_date = EXCLUDED.established_date,
  location = EXCLUDED.location,
  zip_code = EXCLUDED.zip_code,
  company_type = EXCLUDED.company_type,
  industry = EXCLUDED.industry,
  operating_amount = EXCLUDED.operating_amount,
  founded = EXCLUDED.founded,
  status = EXCLUDED.status,
  apify_source = EXCLUDED.apify_source,
  contact_info = EXCLUDED.contact_info,
  disclosure_data = EXCLUDED.disclosure_data,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 692: 한국특허투자
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20220544',
  '한국특허투자',
  '',
  '2017-01-01',
  '서울 영등포구',
  '07324',
  '기타운용사',
  '기타',
  NULL,
  '8년 6개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"07324"}'::jsonb,
  '{"operator_type_code":"9","operator_type_name":"기타운용사","operating_scale_code":"1","business_category_code":"5","strategy_planner":"Yes","professional_angel":"No","investment_character":"","operating_amount_text":"0.0억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.693Z","founded_original":"8년 6개월"}'::jsonb,
  '2025-06-05T00:13:14.693Z'
)
ON CONFLICT (company_id) DO UPDATE SET
  company_name = EXCLUDED.company_name,
  representative = EXCLUDED.representative,
  established_date = EXCLUDED.established_date,
  location = EXCLUDED.location,
  zip_code = EXCLUDED.zip_code,
  company_type = EXCLUDED.company_type,
  industry = EXCLUDED.industry,
  operating_amount = EXCLUDED.operating_amount,
  founded = EXCLUDED.founded,
  status = EXCLUDED.status,
  apify_source = EXCLUDED.apify_source,
  contact_info = EXCLUDED.contact_info,
  disclosure_data = EXCLUDED.disclosure_data,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 693: 한국표준협회
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20200181',
  '한국표준협회',
  '',
  '1962-01-01',
  '서울 강남구',
  '06160',
  '기타운용사',
  '기타',
  NULL,
  '63년 2개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"06160"}'::jsonb,
  '{"operator_type_code":"9","operator_type_name":"기타운용사","operating_scale_code":"1","business_category_code":"6","strategy_planner":"Yes","professional_angel":"No","investment_character":"","operating_amount_text":"0.0억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.693Z","founded_original":"63년 2개월"}'::jsonb,
  '2025-06-05T00:13:14.693Z'
)
ON CONFLICT (company_id) DO UPDATE SET
  company_name = EXCLUDED.company_name,
  representative = EXCLUDED.representative,
  established_date = EXCLUDED.established_date,
  location = EXCLUDED.location,
  zip_code = EXCLUDED.zip_code,
  company_type = EXCLUDED.company_type,
  industry = EXCLUDED.industry,
  operating_amount = EXCLUDED.operating_amount,
  founded = EXCLUDED.founded,
  status = EXCLUDED.status,
  apify_source = EXCLUDED.apify_source,
  contact_info = EXCLUDED.contact_info,
  disclosure_data = EXCLUDED.disclosure_data,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 694: 한국해양벤처투자
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20210104',
  '한국해양벤처투자',
  '',
  '2021-01-01',
  '부산 남구',
  '48400',
  '기타운용사',
  '기타',
  NULL,
  '4년 3개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"48400"}'::jsonb,
  '{"operator_type_code":"9","operator_type_name":"기타운용사","operating_scale_code":"1","business_category_code":"3","strategy_planner":"Yes","professional_angel":"No","investment_character":"","operating_amount_text":"0.0억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.693Z","founded_original":"4년 3개월"}'::jsonb,
  '2025-06-05T00:13:14.693Z'
)
ON CONFLICT (company_id) DO UPDATE SET
  company_name = EXCLUDED.company_name,
  representative = EXCLUDED.representative,
  established_date = EXCLUDED.established_date,
  location = EXCLUDED.location,
  zip_code = EXCLUDED.zip_code,
  company_type = EXCLUDED.company_type,
  industry = EXCLUDED.industry,
  operating_amount = EXCLUDED.operating_amount,
  founded = EXCLUDED.founded,
  status = EXCLUDED.status,
  apify_source = EXCLUDED.apify_source,
  contact_info = EXCLUDED.contact_info,
  disclosure_data = EXCLUDED.disclosure_data,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 695: 한길
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20190393',
  '한길',
  '',
  '2007-01-01',
  '경상북도 포항시 북구',
  '37601',
  '기타운용사',
  '기타',
  NULL,
  '18년 4개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"37601"}'::jsonb,
  '{"operator_type_code":"9","operator_type_name":"기타운용사","operating_scale_code":"1","business_category_code":"6","strategy_planner":"Yes","professional_angel":"No","investment_character":"","operating_amount_text":"0.0억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.693Z","founded_original":"18년 4개월"}'::jsonb,
  '2025-06-05T00:13:14.693Z'
)
ON CONFLICT (company_id) DO UPDATE SET
  company_name = EXCLUDED.company_name,
  representative = EXCLUDED.representative,
  established_date = EXCLUDED.established_date,
  location = EXCLUDED.location,
  zip_code = EXCLUDED.zip_code,
  company_type = EXCLUDED.company_type,
  industry = EXCLUDED.industry,
  operating_amount = EXCLUDED.operating_amount,
  founded = EXCLUDED.founded,
  status = EXCLUDED.status,
  apify_source = EXCLUDED.apify_source,
  contact_info = EXCLUDED.contact_info,
  disclosure_data = EXCLUDED.disclosure_data,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 696: 한림대학교기술지주
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20220754',
  '한림대학교기술지주',
  '',
  '2021-01-01',
  '경기도 안양시 동안구',
  '14055',
  '기타운용사',
  'ICT서비스',
  15.8,
  '4년 8개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"14055"}'::jsonb,
  '{"operator_type_code":"9","operator_type_name":"기타운용사","operating_scale_code":"1","business_category_code":"3","strategy_planner":"Yes","professional_angel":"No","investment_character":"","operating_amount_text":"15.8억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.693Z","founded_original":"4년 8개월"}'::jsonb,
  '2025-06-05T00:13:14.693Z'
)
ON CONFLICT (company_id) DO UPDATE SET
  company_name = EXCLUDED.company_name,
  representative = EXCLUDED.representative,
  established_date = EXCLUDED.established_date,
  location = EXCLUDED.location,
  zip_code = EXCLUDED.zip_code,
  company_type = EXCLUDED.company_type,
  industry = EXCLUDED.industry,
  operating_amount = EXCLUDED.operating_amount,
  founded = EXCLUDED.founded,
  status = EXCLUDED.status,
  apify_source = EXCLUDED.apify_source,
  contact_info = EXCLUDED.contact_info,
  disclosure_data = EXCLUDED.disclosure_data,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 697: 한림제약
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20210148',
  '한림제약',
  '',
  '1989-01-01',
  '경기도 용인시 처인구',
  '17040',
  '기타운용사',
  '바이오/의료',
  15.5,
  '36년 2개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"17040"}'::jsonb,
  '{"operator_type_code":"9","operator_type_name":"기타운용사","operating_scale_code":"1","business_category_code":"6","strategy_planner":"Yes","professional_angel":"No","investment_character":"","operating_amount_text":"15.5억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.693Z","founded_original":"36년 2개월"}'::jsonb,
  '2025-06-05T00:13:14.693Z'
)
ON CONFLICT (company_id) DO UPDATE SET
  company_name = EXCLUDED.company_name,
  representative = EXCLUDED.representative,
  established_date = EXCLUDED.established_date,
  location = EXCLUDED.location,
  zip_code = EXCLUDED.zip_code,
  company_type = EXCLUDED.company_type,
  industry = EXCLUDED.industry,
  operating_amount = EXCLUDED.operating_amount,
  founded = EXCLUDED.founded,
  status = EXCLUDED.status,
  apify_source = EXCLUDED.apify_source,
  contact_info = EXCLUDED.contact_info,
  disclosure_data = EXCLUDED.disclosure_data,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 698: 한빛인베스트먼트
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP19990023',
  '한빛인베스트먼트',
  '',
  '1999-01-01',
  '서울 서초구',
  '06724',
  '신기술사',
  '유통/서비스',
  100,
  '26년 1개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"06724"}'::jsonb,
  '{"operator_type_code":"2","operator_type_name":"신기술사","operating_scale_code":"2","business_category_code":"6","strategy_planner":"No","professional_angel":"No","investment_character":"","operating_amount_text":"100.0억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.693Z","founded_original":"26년 1개월"}'::jsonb,
  '2025-06-05T00:13:14.693Z'
)
ON CONFLICT (company_id) DO UPDATE SET
  company_name = EXCLUDED.company_name,
  representative = EXCLUDED.representative,
  established_date = EXCLUDED.established_date,
  location = EXCLUDED.location,
  zip_code = EXCLUDED.zip_code,
  company_type = EXCLUDED.company_type,
  industry = EXCLUDED.industry,
  operating_amount = EXCLUDED.operating_amount,
  founded = EXCLUDED.founded,
  status = EXCLUDED.status,
  apify_source = EXCLUDED.apify_source,
  contact_info = EXCLUDED.contact_info,
  disclosure_data = EXCLUDED.disclosure_data,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 699: 한성케이에스콘
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20210369',
  '한성케이에스콘',
  '',
  '2000-01-01',
  '서울 금천구',
  '08502',
  '기타운용사',
  '기타',
  NULL,
  '25년 2개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"08502"}'::jsonb,
  '{"operator_type_code":"9","operator_type_name":"기타운용사","operating_scale_code":"1","business_category_code":"6","strategy_planner":"Yes","professional_angel":"No","investment_character":"","operating_amount_text":"0.0억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.693Z","founded_original":"25년 2개월"}'::jsonb,
  '2025-06-05T00:13:14.693Z'
)
ON CONFLICT (company_id) DO UPDATE SET
  company_name = EXCLUDED.company_name,
  representative = EXCLUDED.representative,
  established_date = EXCLUDED.established_date,
  location = EXCLUDED.location,
  zip_code = EXCLUDED.zip_code,
  company_type = EXCLUDED.company_type,
  industry = EXCLUDED.industry,
  operating_amount = EXCLUDED.operating_amount,
  founded = EXCLUDED.founded,
  status = EXCLUDED.status,
  apify_source = EXCLUDED.apify_source,
  contact_info = EXCLUDED.contact_info,
  disclosure_data = EXCLUDED.disclosure_data,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Record 700: 한세예스24파트너스
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20200489',
  '한세예스24파트너스',
  '',
  '2021-01-01',
  '서울 영등포구',
  '07242',
  '기타운용사',
  '화학/소재',
  NULL,
  '4년 9개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"07242"}'::jsonb,
  '{"operator_type_code":"9","operator_type_name":"기타운용사","operating_scale_code":"1","business_category_code":"3","strategy_planner":"Yes","professional_angel":"No","investment_character":"","operating_amount_text":"0.0억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.693Z","founded_original":"4년 9개월"}'::jsonb,
  '2025-06-05T00:13:14.693Z'
)
ON CONFLICT (company_id) DO UPDATE SET
  company_name = EXCLUDED.company_name,
  representative = EXCLUDED.representative,
  established_date = EXCLUDED.established_date,
  location = EXCLUDED.location,
  zip_code = EXCLUDED.zip_code,
  company_type = EXCLUDED.company_type,
  industry = EXCLUDED.industry,
  operating_amount = EXCLUDED.operating_amount,
  founded = EXCLUDED.founded,
  status = EXCLUDED.status,
  apify_source = EXCLUDED.apify_source,
  contact_info = EXCLUDED.contact_info,
  disclosure_data = EXCLUDED.disclosure_data,
  import_date = EXCLUDED.import_date,
  updated_at = NOW();

-- Batch 14 completed! 50 records processed.
-- Progress: 700/717 total records

