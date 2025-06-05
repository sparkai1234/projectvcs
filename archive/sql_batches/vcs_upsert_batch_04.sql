-- VCS UPSERT Batch 4/15 (Records 151-200)
-- Uses ON CONFLICT DO UPDATE to insert new or update existing records
-- Safe to run multiple times - handles duplicates gracefully
-- Generated at: 2025-06-05T00:13:14.654Z

-- Record 151: 미래과학기술지주
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20140015',
  '미래과학기술지주',
  '',
  '2014-01-01',
  '대전 유성구',
  '34051',
  '벤처투자회사',
  '유통/서비스',
  395,
  '11년 2개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"34051"}'::jsonb,
  '{"operator_type_code":"1","operator_type_name":"벤처투자회사","operating_scale_code":"3","business_category_code":"5","strategy_planner":"Yes","professional_angel":"No","investment_character":"","operating_amount_text":"395.0억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.654Z","founded_original":"11년 2개월"}'::jsonb,
  '2025-06-05T00:13:14.654Z'
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

-- Record 152: 미래에셋벤처투자
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP19990017',
  '미래에셋벤처투자',
  '',
  '2000-01-01',
  '경기도 성남시 분당구',
  '13494',
  '벤처투자회사',
  'ICT서비스',
  13070.6,
  '25년 11개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"13494"}'::jsonb,
  '{"operator_type_code":"1","operator_type_name":"벤처투자회사","operating_scale_code":"5","business_category_code":"6","strategy_planner":"No","professional_angel":"No","investment_character":"","operating_amount_text":"13070.6억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.655Z","founded_original":"25년 11개월"}'::jsonb,
  '2025-06-05T00:13:14.655Z'
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

-- Record 153: 미래의학연구재단
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20220104',
  '미래의학연구재단',
  '',
  '2016-01-01',
  '서울 성동구',
  '04768',
  '기타운용사',
  '기타',
  NULL,
  '9년 1개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"04768"}'::jsonb,
  '{"operator_type_code":"9","operator_type_name":"기타운용사","operating_scale_code":"1","business_category_code":"5","strategy_planner":"Yes","professional_angel":"No","investment_character":"","operating_amount_text":"0.0억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.655Z","founded_original":"9년 1개월"}'::jsonb,
  '2025-06-05T00:13:14.655Z'
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

-- Record 154: 미리어드파트너스
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20210268',
  '미리어드파트너스',
  '',
  '2017-01-01',
  '서울 강남구',
  '06039',
  '기타운용사',
  '바이오/의료',
  30,
  '8년 5개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"06039"}'::jsonb,
  '{"operator_type_code":"9","operator_type_name":"기타운용사","operating_scale_code":"1","business_category_code":"5","strategy_planner":"Yes","professional_angel":"No","investment_character":"","operating_amount_text":"30.0억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.655Z","founded_original":"8년 5개월"}'::jsonb,
  '2025-06-05T00:13:14.655Z'
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

-- Record 155: 미시간벤처캐피탈
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20020003',
  '미시간벤처캐피탈',
  '',
  '2003-01-01',
  '서울 강남구',
  '06055',
  '벤처투자회사',
  '영상/공연/음반',
  2594.4,
  '22년 11개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"06055"}'::jsonb,
  '{"operator_type_code":"1","operator_type_name":"벤처투자회사","operating_scale_code":"5","business_category_code":"6","strategy_planner":"No","professional_angel":"No","investment_character":"","operating_amount_text":"2594.4억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.655Z","founded_original":"22년 11개월"}'::jsonb,
  '2025-06-05T00:13:14.655Z'
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

-- Record 156: 민트스퀘어
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20220623',
  '민트스퀘어',
  '',
  '2023-01-01',
  '서울 강남구',
  '06158',
  '기타운용사',
  '기타',
  NULL,
  '2년 10개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"06158"}'::jsonb,
  '{"operator_type_code":"9","operator_type_name":"기타운용사","operating_scale_code":"1","business_category_code":"2","strategy_planner":"Yes","professional_angel":"No","investment_character":"","operating_amount_text":"0.0억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.655Z","founded_original":"2년 10개월"}'::jsonb,
  '2025-06-05T00:13:14.655Z'
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

-- Record 157: 바로벤처스
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20230054',
  '바로벤처스',
  '',
  '2021-01-01',
  '서울 영등포구',
  '07292',
  '신기술사',
  '전기/기계/장비',
  460,
  '4년 8개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"07292"}'::jsonb,
  '{"operator_type_code":"2","operator_type_name":"신기술사","operating_scale_code":"3","business_category_code":"3","strategy_planner":"No","professional_angel":"No","investment_character":"","operating_amount_text":"460.0억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.655Z","founded_original":"4년 8개월"}'::jsonb,
  '2025-06-05T00:13:14.655Z'
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

-- Record 158: 바로운파트너스
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20220639',
  '바로운파트너스',
  '',
  '2022-01-01',
  '서울 금천구',
  '08511',
  '기타운용사',
  '기타',
  NULL,
  '3년 1개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"08511"}'::jsonb,
  '{"operator_type_code":"9","operator_type_name":"기타운용사","operating_scale_code":"1","business_category_code":"3","strategy_planner":"Yes","professional_angel":"No","investment_character":"","operating_amount_text":"0.0억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.655Z","founded_original":"3년 1개월"}'::jsonb,
  '2025-06-05T00:13:14.655Z'
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

-- Record 159: 바이씨엠씨
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20210272',
  '바이씨엠씨',
  '',
  '2013-01-01',
  '서울 도봉구',
  '01330',
  '기타운용사',
  '기타',
  NULL,
  '12년 8개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"01330"}'::jsonb,
  '{"operator_type_code":"9","operator_type_name":"기타운용사","operating_scale_code":"1","business_category_code":"5","strategy_planner":"Yes","professional_angel":"No","investment_character":"","operating_amount_text":"0.0억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.655Z","founded_original":"12년 8개월"}'::jsonb,
  '2025-06-05T00:13:14.655Z'
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

-- Record 160: 바이텐파트너스
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20210436',
  '바이텐파트너스',
  '',
  '2021-01-01',
  '서울 송파구',
  '05664',
  'LLC',
  '유통/서비스',
  3.9,
  '4년 6개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"05664"}'::jsonb,
  '{"operator_type_code":"4","operator_type_name":"LLC","operating_scale_code":"1","business_category_code":"3","strategy_planner":"Yes","professional_angel":"No","investment_character":"","operating_amount_text":"3.9억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.655Z","founded_original":"4년 6개월"}'::jsonb,
  '2025-06-05T00:13:14.655Z'
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

-- Record 161: 바인벤처스
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20220145',
  '바인벤처스',
  '',
  '2022-01-01',
  '인천 연수구',
  '21985',
  '벤처투자회사',
  '바이오/의료',
  228,
  '3년 5개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"21985"}'::jsonb,
  '{"operator_type_code":"1","operator_type_name":"벤처투자회사","operating_scale_code":"2","business_category_code":"3","strategy_planner":"Yes","professional_angel":"No","investment_character":"","operating_amount_text":"228.0억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.655Z","founded_original":"3년 5개월"}'::jsonb,
  '2025-06-05T00:13:14.655Z'
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

-- Record 162: 밴드
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20200264',
  '밴드',
  '',
  '2020-01-01',
  '서울 서대문구',
  '03715',
  '기타운용사',
  '유통/서비스',
  2.7,
  '5년 7개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"03715"}'::jsonb,
  '{"operator_type_code":"9","operator_type_name":"기타운용사","operating_scale_code":"1","business_category_code":"4","strategy_planner":"Yes","professional_angel":"No","investment_character":"","operating_amount_text":"2.7억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.655Z","founded_original":"5년 7개월"}'::jsonb,
  '2025-06-05T00:13:14.655Z'
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

-- Record 163: 밸류업그라운드
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20180055',
  '밸류업그라운드',
  '',
  '2018-01-01',
  '대전 중구',
  '34863',
  '기타운용사',
  '바이오/의료',
  8.3,
  '7년 1개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"34863"}'::jsonb,
  '{"operator_type_code":"9","operator_type_name":"기타운용사","operating_scale_code":"1","business_category_code":"5","strategy_planner":"Yes","professional_angel":"No","investment_character":"","operating_amount_text":"8.3억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.655Z","founded_original":"7년 1개월"}'::jsonb,
  '2025-06-05T00:13:14.655Z'
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

-- Record 164: 베드록벤처스
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20230037',
  '베드록벤처스',
  '',
  '2022-01-01',
  '서울 강남구',
  '06267',
  '벤처투자회사',
  'ICT서비스',
  20,
  '3년 1개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"06267"}'::jsonb,
  '{"operator_type_code":"1","operator_type_name":"벤처투자회사","operating_scale_code":"1","business_category_code":"3","strategy_planner":"Yes","professional_angel":"No","investment_character":"","operating_amount_text":"20.0억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.655Z","founded_original":"3년 1개월"}'::jsonb,
  '2025-06-05T00:13:14.655Z'
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

-- Record 165: 베드록벤처스
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20240167',
  '베드록벤처스',
  '',
  '2022-01-01',
  '서울 강남구',
  '06267',
  '벤처투자회사',
  '기타',
  20,
  '3년 1개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"06267"}'::jsonb,
  '{"operator_type_code":"1","operator_type_name":"벤처투자회사","operating_scale_code":"1","business_category_code":"2","strategy_planner":"Yes","professional_angel":"No","investment_character":"","operating_amount_text":"20.0억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.655Z","founded_original":"3년 1개월"}'::jsonb,
  '2025-06-05T00:13:14.655Z'
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

-- Record 166: 베스트프랜즈파트너스
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20210393',
  '베스트프랜즈파트너스',
  '',
  '2021-01-01',
  '서울 서초구',
  '06541',
  'LLC',
  '기타',
  NULL,
  '4년 1개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"06541"}'::jsonb,
  '{"operator_type_code":"4","operator_type_name":"LLC","operating_scale_code":"1","business_category_code":"3","strategy_planner":"Yes","professional_angel":"No","investment_character":"","operating_amount_text":"0.0억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.655Z","founded_original":"4년 1개월"}'::jsonb,
  '2025-06-05T00:13:14.655Z'
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

-- Record 167: 베이스벤처스
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20210601',
  '베이스벤처스',
  '',
  '2018-01-01',
  '서울 강남구',
  '06097',
  '벤처투자회사',
  'ICT서비스',
  1280,
  '7년 3개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"06097"}'::jsonb,
  '{"operator_type_code":"1","operator_type_name":"벤처투자회사","operating_scale_code":"5","business_category_code":"5","strategy_planner":"No","professional_angel":"No","investment_character":"","operating_amount_text":"1280.0억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.655Z","founded_original":"7년 3개월"}'::jsonb,
  '2025-06-05T00:13:14.655Z'
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

-- Record 168: 베터그라운드
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20210382',
  '베터그라운드',
  '',
  '2021-01-01',
  '서울 강남구',
  '06159',
  '기타운용사',
  'ICT서비스',
  119.3,
  '4년 1개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"06159"}'::jsonb,
  '{"operator_type_code":"9","operator_type_name":"기타운용사","operating_scale_code":"2","business_category_code":"3","strategy_planner":"Yes","professional_angel":"No","investment_character":"","operating_amount_text":"119.3억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.655Z","founded_original":"4년 1개월"}'::jsonb,
  '2025-06-05T00:13:14.655Z'
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

-- Record 169: 벤처기업협회
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20190187',
  '벤처기업협회',
  '',
  '1996-01-01',
  '서울 구로구',
  '08389',
  '기타운용사',
  'ICT서비스',
  1,
  '29년 5개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"08389"}'::jsonb,
  '{"operator_type_code":"9","operator_type_name":"기타운용사","operating_scale_code":"1","business_category_code":"6","strategy_planner":"Yes","professional_angel":"No","investment_character":"","operating_amount_text":"1.0억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.655Z","founded_original":"29년 5개월"}'::jsonb,
  '2025-06-05T00:13:14.655Z'
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

-- Record 170: 벤처박스
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20170029',
  '벤처박스',
  '',
  '2018-01-01',
  '경기도 성남시 수정구',
  '13449',
  '기타운용사',
  'ICT서비스',
  61.9,
  '7년 11개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"13449"}'::jsonb,
  '{"operator_type_code":"9","operator_type_name":"기타운용사","operating_scale_code":"1","business_category_code":"5","strategy_planner":"Yes","professional_angel":"No","investment_character":"","operating_amount_text":"61.9억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.655Z","founded_original":"7년 11개월"}'::jsonb,
  '2025-06-05T00:13:14.655Z'
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

-- Record 171: 벤처스퀘어
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20100016',
  '벤처스퀘어',
  '',
  '2011-01-01',
  '서울 강남구',
  '06078',
  '기타운용사',
  'ICT서비스',
  77.4,
  '14년 9개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"06078"}'::jsonb,
  '{"operator_type_code":"9","operator_type_name":"기타운용사","operating_scale_code":"1","business_category_code":"6","strategy_planner":"Yes","professional_angel":"No","investment_character":"","operating_amount_text":"77.4억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.655Z","founded_original":"14년 9개월"}'::jsonb,
  '2025-06-05T00:13:14.655Z'
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

-- Record 172: 벤처필드
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20170045',
  '벤처필드',
  '',
  '2018-01-01',
  '서울 마포구',
  '04147',
  '기타운용사',
  '유통/서비스',
  52.8,
  '7년 11개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"04147"}'::jsonb,
  '{"operator_type_code":"9","operator_type_name":"기타운용사","operating_scale_code":"1","business_category_code":"5","strategy_planner":"Yes","professional_angel":"No","investment_character":"","operating_amount_text":"52.8억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.655Z","founded_original":"7년 11개월"}'::jsonb,
  '2025-06-05T00:13:14.655Z'
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

-- Record 173: 보광인베스트먼트
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP19890005',
  '보광인베스트먼트',
  '',
  '1990-01-01',
  '서울 강남구',
  '06181',
  '벤처투자회사',
  'ICT서비스',
  2400.6,
  '35년 11개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"06181"}'::jsonb,
  '{"operator_type_code":"1","operator_type_name":"벤처투자회사","operating_scale_code":"5","business_category_code":"6","strategy_planner":"No","professional_angel":"No","investment_character":"","operating_amount_text":"2400.6억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.655Z","founded_original":"35년 11개월"}'::jsonb,
  '2025-06-05T00:13:14.655Z'
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

-- Record 174: 본엔젤스벤처파트너스
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20100008',
  '본엔젤스벤처파트너스',
  '',
  '2010-01-01',
  '서울 강남구',
  '06129',
  '벤처투자회사',
  'ICT서비스',
  4055,
  '15년 2개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"06129"}'::jsonb,
  '{"operator_type_code":"1","operator_type_name":"벤처투자회사","operating_scale_code":"5","business_category_code":"6","strategy_planner":"Yes","professional_angel":"No","investment_character":"","operating_amount_text":"4055.0억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.655Z","founded_original":"15년 2개월"}'::jsonb,
  '2025-06-05T00:13:14.655Z'
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

-- Record 175: 볼드벤처스
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20220283',
  '볼드벤처스',
  '',
  '2022-01-01',
  '서울 강남구',
  '06168',
  '기타운용사',
  '기타',
  NULL,
  '3년 4개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"06168"}'::jsonb,
  '{"operator_type_code":"9","operator_type_name":"기타운용사","operating_scale_code":"1","business_category_code":"3","strategy_planner":"Yes","professional_angel":"No","investment_character":"","operating_amount_text":"0.0억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.655Z","founded_original":"3년 4개월"}'::jsonb,
  '2025-06-05T00:13:14.655Z'
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

-- Record 176: 부산대학교기술지주
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20100019',
  '부산대학교기술지주',
  '',
  '2010-01-01',
  '부산 금정구',
  '46241',
  '기타운용사',
  'ICT서비스',
  172,
  '15년 3개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"46241"}'::jsonb,
  '{"operator_type_code":"9","operator_type_name":"기타운용사","operating_scale_code":"2","business_category_code":"6","strategy_planner":"Yes","professional_angel":"No","investment_character":"","operating_amount_text":"172.0억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.655Z","founded_original":"15년 3개월"}'::jsonb,
  '2025-06-05T00:13:14.655Z'
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

-- Record 177: 부산지역대학연합기술지주
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20160002',
  '부산지역대학연합기술지주',
  '',
  '2016-01-01',
  '부산 해운대구',
  '48059',
  '기타운용사',
  'ICT서비스',
  223.9,
  '9년 9개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"48059"}'::jsonb,
  '{"operator_type_code":"9","operator_type_name":"기타운용사","operating_scale_code":"2","business_category_code":"5","strategy_planner":"Yes","professional_angel":"No","investment_character":"","operating_amount_text":"223.9억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.655Z","founded_original":"9년 9개월"}'::jsonb,
  '2025-06-05T00:13:14.655Z'
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

-- Record 178: 부산창조경제혁신센터
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20190348',
  '부산창조경제혁신센터',
  '',
  '2015-01-01',
  '부산 해운대구',
  '48059',
  '기타운용사',
  'ICT서비스',
  30,
  '10년 4개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"48059"}'::jsonb,
  '{"operator_type_code":"9","operator_type_name":"기타운용사","operating_scale_code":"1","business_category_code":"5","strategy_planner":"Yes","professional_angel":"No","investment_character":"","operating_amount_text":"30.0억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.655Z","founded_original":"10년 4개월"}'::jsonb,
  '2025-06-05T00:13:14.655Z'
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

-- Record 179: 부산플랜
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20200426',
  '부산플랜',
  '',
  '2020-01-01',
  '부산 부산진구',
  '47293',
  '기타운용사',
  '기타',
  NULL,
  '5년 5개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"47293"}'::jsonb,
  '{"operator_type_code":"9","operator_type_name":"기타운용사","operating_scale_code":"1","business_category_code":"4","strategy_planner":"Yes","professional_angel":"No","investment_character":"","operating_amount_text":"0.0억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.655Z","founded_original":"5년 5개월"}'::jsonb,
  '2025-06-05T00:13:14.655Z'
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

-- Record 180: 브라더스컨설팅
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20210050',
  '브라더스컨설팅',
  '',
  '2020-01-01',
  '대구 동구',
  '41084',
  '기타운용사',
  '기타',
  NULL,
  '5년 4개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"41084"}'::jsonb,
  '{"operator_type_code":"9","operator_type_name":"기타운용사","operating_scale_code":"1","business_category_code":"4","strategy_planner":"Yes","professional_angel":"No","investment_character":"","operating_amount_text":"0.0억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.655Z","founded_original":"5년 4개월"}'::jsonb,
  '2025-06-05T00:13:14.655Z'
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

-- Record 181: 브리즈인베스트먼트
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20200009',
  '브리즈인베스트먼트',
  '',
  '2020-01-01',
  '서울 강남구',
  '06133',
  '벤처투자회사',
  'ICT서비스',
  205,
  '5년 6개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"06133"}'::jsonb,
  '{"operator_type_code":"1","operator_type_name":"벤처투자회사","operating_scale_code":"2","business_category_code":"4","strategy_planner":"Yes","professional_angel":"No","investment_character":"","operating_amount_text":"205.0억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.655Z","founded_original":"5년 6개월"}'::jsonb,
  '2025-06-05T00:13:14.655Z'
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

-- Record 182: 브리티시인터내셔널
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20210463',
  '브리티시인터내셔널',
  '',
  '2020-01-01',
  '부산 해운대구',
  '48060',
  '기타운용사',
  '기타',
  NULL,
  '5년 10개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"48060"}'::jsonb,
  '{"operator_type_code":"9","operator_type_name":"기타운용사","operating_scale_code":"1","business_category_code":"4","strategy_planner":"Yes","professional_angel":"No","investment_character":"","operating_amount_text":"0.0억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.655Z","founded_original":"5년 10개월"}'::jsonb,
  '2025-06-05T00:13:14.655Z'
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

-- Record 183: 브릭인베스트
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20230327',
  '브릭인베스트',
  '',
  '2024-01-01',
  '서울 영등포구',
  '07333',
  '벤처투자회사',
  'ICT서비스',
  47,
  '1년 11개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"07333"}'::jsonb,
  '{"operator_type_code":"1","operator_type_name":"벤처투자회사","operating_scale_code":"1","business_category_code":"2","strategy_planner":"No","professional_angel":"No","investment_character":"","operating_amount_text":"47.0억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.655Z","founded_original":"1년 11개월"}'::jsonb,
  '2025-06-05T00:13:14.655Z'
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

-- Record 184: 브릿지스퀘어
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20200362',
  '브릿지스퀘어',
  '',
  '2020-01-01',
  '제주 제주시',
  '63249',
  '기타운용사',
  'ICT서비스',
  6.7,
  '5년 1개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"63249"}'::jsonb,
  '{"operator_type_code":"9","operator_type_name":"기타운용사","operating_scale_code":"1","business_category_code":"4","strategy_planner":"Yes","professional_angel":"No","investment_character":"","operating_amount_text":"6.7억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.655Z","founded_original":"5년 1개월"}'::jsonb,
  '2025-06-05T00:13:14.655Z'
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

-- Record 185: 브이엔티지
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20210177',
  '브이엔티지',
  '',
  '2020-01-01',
  '서울 마포구',
  '04036',
  '기타운용사',
  '기타',
  NULL,
  '5년 1개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"04036"}'::jsonb,
  '{"operator_type_code":"9","operator_type_name":"기타운용사","operating_scale_code":"1","business_category_code":"3","strategy_planner":"Yes","professional_angel":"No","investment_character":"","operating_amount_text":"0.0억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.656Z","founded_original":"5년 1개월"}'::jsonb,
  '2025-06-05T00:13:14.656Z'
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

-- Record 186: 브이플랫폼인베스트먼트
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20180006',
  '브이플랫폼인베스트먼트',
  '',
  '2018-01-01',
  '서울 강남구',
  '06075',
  '벤처투자회사',
  'ICT제조',
  585.3,
  '7년 3개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"06075"}'::jsonb,
  '{"operator_type_code":"1","operator_type_name":"벤처투자회사","operating_scale_code":"4","business_category_code":"5","strategy_planner":"No","professional_angel":"No","investment_character":"","operating_amount_text":"585.3억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.656Z","founded_original":"7년 3개월"}'::jsonb,
  '2025-06-05T00:13:14.656Z'
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

-- Record 187: 블랙펄벤처스
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20220039',
  '블랙펄벤처스',
  '',
  '2022-01-01',
  '서울 강남구',
  '06163',
  '벤처투자회사',
  'ICT서비스',
  579.9,
  '3년 7개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"06163"}'::jsonb,
  '{"operator_type_code":"1","operator_type_name":"벤처투자회사","operating_scale_code":"4","business_category_code":"3","strategy_planner":"No","professional_angel":"No","investment_character":"","operating_amount_text":"579.9억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.656Z","founded_original":"3년 7개월"}'::jsonb,
  '2025-06-05T00:13:14.656Z'
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

-- Record 188: 블록크래프터스
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20200102',
  '블록크래프터스',
  '',
  '2018-01-01',
  '서울 서초구',
  '06627',
  '기타운용사',
  'ICT서비스',
  10.6,
  '7년 1개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"06627"}'::jsonb,
  '{"operator_type_code":"9","operator_type_name":"기타운용사","operating_scale_code":"1","business_category_code":"5","strategy_planner":"Yes","professional_angel":"No","investment_character":"","operating_amount_text":"10.6억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.656Z","founded_original":"7년 1개월"}'::jsonb,
  '2025-06-05T00:13:14.656Z'
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

-- Record 189: 블루버스인베스트먼트
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20220691',
  '블루버스인베스트먼트',
  '',
  '2023-01-01',
  '경기도 하남시',
  '13003',
  '기타운용사',
  '전기/기계/장비',
  30.1,
  '2년 7개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"13003"}'::jsonb,
  '{"operator_type_code":"9","operator_type_name":"기타운용사","operating_scale_code":"1","business_category_code":"2","strategy_planner":"Yes","professional_angel":"No","investment_character":"","operating_amount_text":"30.1억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.656Z","founded_original":"2년 7개월"}'::jsonb,
  '2025-06-05T00:13:14.656Z'
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

-- Record 190: 블루오션벤처스
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20210183',
  '블루오션벤처스',
  '',
  '2020-01-01',
  '서울 용산구',
  '04410',
  '기타운용사',
  'ICT서비스',
  20.3,
  '5년 4개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"04410"}'::jsonb,
  '{"operator_type_code":"9","operator_type_name":"기타운용사","operating_scale_code":"1","business_category_code":"4","strategy_planner":"Yes","professional_angel":"No","investment_character":"","operating_amount_text":"20.3억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.656Z","founded_original":"5년 4개월"}'::jsonb,
  '2025-06-05T00:13:14.656Z'
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

-- Record 191: 블루웨일인베스트
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20220258',
  '블루웨일인베스트',
  '',
  '2020-01-01',
  '경상북도 경산시',
  '38542',
  '기타운용사',
  '기타',
  NULL,
  '5년 6개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"38542"}'::jsonb,
  '{"operator_type_code":"9","operator_type_name":"기타운용사","operating_scale_code":"1","business_category_code":"4","strategy_planner":"Yes","professional_angel":"No","investment_character":"","operating_amount_text":"0.0억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.656Z","founded_original":"5년 6개월"}'::jsonb,
  '2025-06-05T00:13:14.656Z'
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

-- Record 192: 블루포인트파트너스
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20140008',
  '블루포인트파트너스',
  '',
  '2015-01-01',
  '대전 유성구',
  '34126',
  '기타운용사',
  'ICT서비스',
  606,
  '10년 11개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"34126"}'::jsonb,
  '{"operator_type_code":"9","operator_type_name":"기타운용사","operating_scale_code":"4","business_category_code":"5","strategy_planner":"Yes","professional_angel":"No","investment_character":"","operating_amount_text":"606.0억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.656Z","founded_original":"10년 11개월"}'::jsonb,
  '2025-06-05T00:13:14.656Z'
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

-- Record 193: 블리스바인벤처스
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20210212',
  '블리스바인벤처스',
  '',
  '2021-01-01',
  '서울 용산구',
  '04372',
  '기타운용사',
  '유통/서비스',
  138.3,
  '4년 3개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"04372"}'::jsonb,
  '{"operator_type_code":"9","operator_type_name":"기타운용사","operating_scale_code":"2","business_category_code":"3","strategy_planner":"Yes","professional_angel":"No","investment_character":"","operating_amount_text":"138.3억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.656Z","founded_original":"4년 3개월"}'::jsonb,
  '2025-06-05T00:13:14.656Z'
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

-- Record 194: 비디씨엑셀러레이터
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20220578',
  '비디씨엑셀러레이터',
  '',
  '2019-01-01',
  '서울 강남구',
  '06156',
  '기타운용사',
  'ICT서비스',
  153,
  '6년 11개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"06156"}'::jsonb,
  '{"operator_type_code":"9","operator_type_name":"기타운용사","operating_scale_code":"2","business_category_code":"4","strategy_planner":"Yes","professional_angel":"No","investment_character":"","operating_amount_text":"153.0억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.656Z","founded_original":"6년 11개월"}'::jsonb,
  '2025-06-05T00:13:14.656Z'
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

-- Record 195: 비바체랩
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20220314',
  '비바체랩',
  '',
  '2022-01-01',
  '서울 마포구',
  '03925',
  '기타운용사',
  '기타',
  NULL,
  '3년 1개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"03925"}'::jsonb,
  '{"operator_type_code":"9","operator_type_name":"기타운용사","operating_scale_code":"1","business_category_code":"3","strategy_planner":"Yes","professional_angel":"No","investment_character":"","operating_amount_text":"0.0억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.656Z","founded_original":"3년 1개월"}'::jsonb,
  '2025-06-05T00:13:14.656Z'
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

-- Record 196: 비비드인베스트먼트
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20160009',
  '비비드인베스트먼트',
  '',
  '2016-01-01',
  '경기도 성남시 수정구',
  '13449',
  'LLC',
  '전기/기계/장비',
  854.5,
  '9년 2개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"13449"}'::jsonb,
  '{"operator_type_code":"4","operator_type_name":"LLC","operating_scale_code":"4","business_category_code":"5","strategy_planner":"No","professional_angel":"No","investment_character":"","operating_amount_text":"854.5억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.656Z","founded_original":"9년 2개월"}'::jsonb,
  '2025-06-05T00:13:14.656Z'
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

-- Record 197: 비스마트
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20160032',
  '비스마트',
  '',
  '2016-01-01',
  '충청북도 청주시 흥덕구',
  '28406',
  '기타운용사',
  '화학/소재',
  1,
  '9년 3개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"28406"}'::jsonb,
  '{"operator_type_code":"9","operator_type_name":"기타운용사","operating_scale_code":"1","business_category_code":"5","strategy_planner":"Yes","professional_angel":"No","investment_character":"","operating_amount_text":"1.0억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.656Z","founded_original":"9년 3개월"}'::jsonb,
  '2025-06-05T00:13:14.656Z'
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

-- Record 198: 비스퀘어
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20200024',
  '비스퀘어',
  '',
  '2016-01-01',
  '부산 해운대구',
  '48059',
  '기타운용사',
  'ICT서비스',
  2.2,
  '9년 7개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"48059"}'::jsonb,
  '{"operator_type_code":"9","operator_type_name":"기타운용사","operating_scale_code":"1","business_category_code":"5","strategy_planner":"Yes","professional_angel":"No","investment_character":"","operating_amount_text":"2.2억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.656Z","founded_original":"9년 7개월"}'::jsonb,
  '2025-06-05T00:13:14.656Z'
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

-- Record 199: 비에스케이인베스트먼트
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20100012',
  '비에스케이인베스트먼트',
  '',
  '2010-01-01',
  '서울 강남구',
  '06164',
  '벤처투자회사',
  '바이오/의료',
  3150.7,
  '15년 1개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"06164"}'::jsonb,
  '{"operator_type_code":"1","operator_type_name":"벤처투자회사","operating_scale_code":"5","business_category_code":"6","strategy_planner":"Yes","professional_angel":"No","investment_character":"","operating_amount_text":"3150.7억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.656Z","founded_original":"15년 1개월"}'::jsonb,
  '2025-06-05T00:13:14.656Z'
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

-- Record 200: 비에이파트너스
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20170004',
  '비에이파트너스',
  '',
  '2017-01-01',
  '서울 강남구',
  '06166',
  'LLC',
  'ICT서비스',
  1369.8,
  '8년 1개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"06166"}'::jsonb,
  '{"operator_type_code":"4","operator_type_name":"LLC","operating_scale_code":"5","business_category_code":"5","strategy_planner":"No","professional_angel":"No","investment_character":"","operating_amount_text":"1369.8억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.656Z","founded_original":"8년 1개월"}'::jsonb,
  '2025-06-05T00:13:14.656Z'
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

-- Batch 4 completed! 50 records processed.
-- Progress: 200/717 total records

