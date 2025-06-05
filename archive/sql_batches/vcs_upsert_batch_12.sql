-- VCS UPSERT Batch 12/15 (Records 551-600)
-- Uses ON CONFLICT DO UPDATE to insert new or update existing records
-- Safe to run multiple times - handles duplicates gracefully
-- Generated at: 2025-06-05T00:13:14.684Z

-- Record 551: 컴퍼니엑스
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20190163',
  '컴퍼니엑스',
  '',
  '2019-01-01',
  '서울 서초구',
  '06785',
  '기타운용사',
  'ICT서비스',
  37.5,
  '6년 4개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"06785"}'::jsonb,
  '{"operator_type_code":"9","operator_type_name":"기타운용사","operating_scale_code":"1","business_category_code":"4","strategy_planner":"Yes","professional_angel":"No","investment_character":"","operating_amount_text":"37.5억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.684Z","founded_original":"6년 4개월"}'::jsonb,
  '2025-06-05T00:13:14.684Z'
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

-- Record 552: 컴퍼니케이파트너스
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20060010',
  '컴퍼니케이파트너스',
  '',
  '2007-01-01',
  '서울 강남구',
  '06174',
  '벤처투자회사',
  'ICT서비스',
  9215,
  '18년 7개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"06174"}'::jsonb,
  '{"operator_type_code":"1","operator_type_name":"벤처투자회사","operating_scale_code":"5","business_category_code":"6","strategy_planner":"No","professional_angel":"No","investment_character":"","operating_amount_text":"9215.0억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.684Z","founded_original":"18년 7개월"}'::jsonb,
  '2025-06-05T00:13:14.684Z'
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

-- Record 553: 케이그라운드벤처스
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20180050',
  '케이그라운드벤처스',
  '',
  '2019-01-01',
  '서울 강남구',
  '06118',
  'LLC',
  '바이오/의료',
  474.5,
  '6년 9개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"06118"}'::jsonb,
  '{"operator_type_code":"4","operator_type_name":"LLC","operating_scale_code":"3","business_category_code":"4","strategy_planner":"No","professional_angel":"No","investment_character":"","operating_amount_text":"474.5억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.684Z","founded_original":"6년 9개월"}'::jsonb,
  '2025-06-05T00:13:14.684Z'
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

-- Record 554: 케이넷투자파트너스
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20080005',
  '케이넷투자파트너스',
  '',
  '2009-01-01',
  '서울 서초구',
  '06644',
  'LLC',
  '바이오/의료',
  2714,
  '16년 6개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"06644"}'::jsonb,
  '{"operator_type_code":"4","operator_type_name":"LLC","operating_scale_code":"5","business_category_code":"6","strategy_planner":"No","professional_angel":"No","investment_character":"","operating_amount_text":"2714.0억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.684Z","founded_original":"16년 6개월"}'::jsonb,
  '2025-06-05T00:13:14.684Z'
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

-- Record 555: 케이런벤처스
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20150019',
  '케이런벤처스',
  '',
  '2016-01-01',
  '서울 강남구',
  '06181',
  'LLC',
  '화학/소재',
  1553,
  '9년 7개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"06181"}'::jsonb,
  '{"operator_type_code":"4","operator_type_name":"LLC","operating_scale_code":"5","business_category_code":"5","strategy_planner":"No","professional_angel":"No","investment_character":"","operating_amount_text":"1553.0억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.684Z","founded_original":"9년 7개월"}'::jsonb,
  '2025-06-05T00:13:14.684Z'
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

-- Record 556: 케이브레인컴퍼니
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20200031',
  '케이브레인컴퍼니',
  '',
  '2011-01-01',
  '서울 마포구',
  '03920',
  '기타운용사',
  '기타',
  NULL,
  '14년 9개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"03920"}'::jsonb,
  '{"operator_type_code":"9","operator_type_name":"기타운용사","operating_scale_code":"1","business_category_code":"6","strategy_planner":"Yes","professional_angel":"No","investment_character":"","operating_amount_text":"0.0억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.684Z","founded_original":"14년 9개월"}'::jsonb,
  '2025-06-05T00:13:14.684Z'
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

-- Record 557: 케이브릿지벤처스
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20210271',
  '케이브릿지벤처스',
  '',
  '2021-01-01',
  '서울 강남구',
  '06141',
  'LLC',
  'ICT서비스',
  356,
  '4년 1개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"06141"}'::jsonb,
  '{"operator_type_code":"4","operator_type_name":"LLC","operating_scale_code":"3","business_category_code":"3","strategy_planner":"No","professional_angel":"No","investment_character":"","operating_amount_text":"356.0억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.684Z","founded_original":"4년 1개월"}'::jsonb,
  '2025-06-05T00:13:14.684Z'
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

-- Record 558: 케이브릿지인베스트먼트
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20160005',
  '케이브릿지인베스트먼트',
  '',
  '2016-01-01',
  '부산 해운대구',
  '48059',
  'LLC',
  '바이오/의료',
  317.2,
  '9년 4개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"48059"}'::jsonb,
  '{"operator_type_code":"4","operator_type_name":"LLC","operating_scale_code":"3","business_category_code":"5","strategy_planner":"No","professional_angel":"No","investment_character":"","operating_amount_text":"317.2억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.684Z","founded_original":"9년 4개월"}'::jsonb,
  '2025-06-05T00:13:14.684Z'
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

-- Record 559: 케이브이에이액셀러레이터
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20200133',
  '케이브이에이액셀러레이터',
  '',
  '2020-01-01',
  '서울 강남구',
  '06126',
  '기타운용사',
  '유통/서비스',
  1.2,
  '5년 2개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"06126"}'::jsonb,
  '{"operator_type_code":"9","operator_type_name":"기타운용사","operating_scale_code":"1","business_category_code":"4","strategy_planner":"Yes","professional_angel":"No","investment_character":"","operating_amount_text":"1.2억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.684Z","founded_original":"5년 2개월"}'::jsonb,
  '2025-06-05T00:13:14.684Z'
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

-- Record 560: 케이비인베스트먼트
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP19900001',
  '케이비인베스트먼트',
  '',
  '1990-01-01',
  '서울 강남구',
  '06072',
  '벤처투자회사',
  'ICT서비스',
  23473.8,
  '35년 2개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"06072"}'::jsonb,
  '{"operator_type_code":"1","operator_type_name":"벤처투자회사","operating_scale_code":"5","business_category_code":"6","strategy_planner":"No","professional_angel":"No","investment_character":"","operating_amount_text":"23473.8억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.684Z","founded_original":"35년 2개월"}'::jsonb,
  '2025-06-05T00:13:14.684Z'
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

-- Record 561: 케이스톤파트너스
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20230048',
  '케이스톤파트너스',
  '',
  '2008-01-01',
  '서울 영등포구',
  '07326',
  '벤처투자회사',
  '유통/서비스',
  20,
  '17년 10개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"07326"}'::jsonb,
  '{"operator_type_code":"1","operator_type_name":"벤처투자회사","operating_scale_code":"1","business_category_code":"6","strategy_planner":"No","professional_angel":"No","investment_character":"","operating_amount_text":"20.0억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.684Z","founded_original":"17년 10개월"}'::jsonb,
  '2025-06-05T00:13:14.684Z'
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

-- Record 562: 케이씨벤처스
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20190006',
  '케이씨벤처스',
  '',
  '2019-01-01',
  '서울 강남구',
  '06212',
  '벤처투자회사',
  '영상/공연/음반',
  2052,
  '6년 5개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"06212"}'::jsonb,
  '{"operator_type_code":"1","operator_type_name":"벤처투자회사","operating_scale_code":"5","business_category_code":"4","strategy_planner":"No","professional_angel":"No","investment_character":"","operating_amount_text":"2052.0억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.684Z","founded_original":"6년 5개월"}'::jsonb,
  '2025-06-05T00:13:14.684Z'
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

-- Record 563: 케이씨투자파트너스
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20230049',
  '케이씨투자파트너스',
  '',
  '2022-01-01',
  '서울 강남구',
  '06180',
  '신기술사',
  '유통/서비스',
  475,
  '3년 4개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"06180"}'::jsonb,
  '{"operator_type_code":"2","operator_type_name":"신기술사","operating_scale_code":"3","business_category_code":"3","strategy_planner":"No","professional_angel":"No","investment_character":"","operating_amount_text":"475.0억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.684Z","founded_original":"3년 4개월"}'::jsonb,
  '2025-06-05T00:13:14.684Z'
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

-- Record 564: 케이아이엠씨
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20200357',
  '케이아이엠씨',
  '',
  '2020-01-01',
  '서울 동작구',
  '07023',
  'LLC',
  '기타',
  2.6,
  '5년 8개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"07023"}'::jsonb,
  '{"operator_type_code":"4","operator_type_name":"LLC","operating_scale_code":"1","business_category_code":"4","strategy_planner":"Yes","professional_angel":"No","investment_character":"","operating_amount_text":"2.6억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.684Z","founded_original":"5년 8개월"}'::jsonb,
  '2025-06-05T00:13:14.684Z'
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

-- Record 565: 케이액셀러레이터
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20190073',
  '케이액셀러레이터',
  '',
  '2019-01-01',
  '서울 영등포구',
  '07327',
  '기타운용사',
  'ICT서비스',
  27,
  '6년 3개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"07327"}'::jsonb,
  '{"operator_type_code":"9","operator_type_name":"기타운용사","operating_scale_code":"1","business_category_code":"4","strategy_planner":"Yes","professional_angel":"No","investment_character":"","operating_amount_text":"27.0억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.684Z","founded_original":"6년 3개월"}'::jsonb,
  '2025-06-05T00:13:14.684Z'
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

-- Record 566: 케이앤투자파트너스
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20150011',
  '케이앤투자파트너스',
  '',
  '2016-01-01',
  '서울 강남구',
  '06236',
  '벤처투자회사',
  '화학/소재',
  4186.9,
  '9년 9개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"06236"}'::jsonb,
  '{"operator_type_code":"1","operator_type_name":"벤처투자회사","operating_scale_code":"5","business_category_code":"5","strategy_planner":"No","professional_angel":"No","investment_character":"","operating_amount_text":"4186.9억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.684Z","founded_original":"9년 9개월"}'::jsonb,
  '2025-06-05T00:13:14.684Z'
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

-- Record 567: 케이에이치벤처파트너스
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20230586',
  '케이에이치벤처파트너스',
  '',
  '2024-01-01',
  '서울 강남구',
  '06040',
  '벤처투자회사',
  '전기/기계/장비',
  103,
  '1년 7개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"06040"}'::jsonb,
  '{"operator_type_code":"1","operator_type_name":"벤처투자회사","operating_scale_code":"2","business_category_code":"2","strategy_planner":"No","professional_angel":"No","investment_character":"","operating_amount_text":"103.0억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.684Z","founded_original":"1년 7개월"}'::jsonb,
  '2025-06-05T00:13:14.684Z'
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

-- Record 568: 케이엘피인베스트먼트
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20210688',
  '케이엘피인베스트먼트',
  '',
  '2022-01-01',
  '서울 영등포구',
  '07332',
  '벤처투자회사',
  'ICT제조',
  49.1,
  '3년 7개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"07332"}'::jsonb,
  '{"operator_type_code":"1","operator_type_name":"벤처투자회사","operating_scale_code":"1","business_category_code":"3","strategy_planner":"No","professional_angel":"No","investment_character":"","operating_amount_text":"49.1억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.684Z","founded_original":"3년 7개월"}'::jsonb,
  '2025-06-05T00:13:14.684Z'
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

-- Record 569: 케이오씨파트너스
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20200200',
  '케이오씨파트너스',
  '',
  '2020-01-01',
  '서울 동대문구',
  '02455',
  '기타운용사',
  'ICT서비스',
  40.4,
  '5년 1개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"02455"}'::jsonb,
  '{"operator_type_code":"9","operator_type_name":"기타운용사","operating_scale_code":"1","business_category_code":"4","strategy_planner":"Yes","professional_angel":"No","investment_character":"","operating_amount_text":"40.4억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.684Z","founded_original":"5년 1개월"}'::jsonb,
  '2025-06-05T00:13:14.684Z'
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

-- Record 570: 케이제이액셀
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20200255',
  '케이제이액셀',
  '',
  '2012-01-01',
  '서울 중구',
  '04502',
  '기타운용사',
  '기타',
  NULL,
  '13년 6개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"04502"}'::jsonb,
  '{"operator_type_code":"9","operator_type_name":"기타운용사","operating_scale_code":"1","business_category_code":"5","strategy_planner":"Yes","professional_angel":"No","investment_character":"","operating_amount_text":"0.0억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.685Z","founded_original":"13년 6개월"}'::jsonb,
  '2025-06-05T00:13:14.685Z'
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

-- Record 571: 케이제이앤투자파트너스
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20190047',
  '케이제이앤투자파트너스',
  '',
  '2018-01-01',
  '서울 강남구',
  '06194',
  'LLC',
  '영상/공연/음반',
  1234,
  '7년 1개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"06194"}'::jsonb,
  '{"operator_type_code":"4","operator_type_name":"LLC","operating_scale_code":"5","business_category_code":"4","strategy_planner":"No","professional_angel":"No","investment_character":"","operating_amount_text":"1234.0억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.685Z","founded_original":"7년 1개월"}'::jsonb,
  '2025-06-05T00:13:14.685Z'
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

-- Record 572: 케이클라비스인베스트먼트
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20150022',
  '케이클라비스인베스트먼트',
  '',
  '2016-01-01',
  '서울 영등포구',
  '07326',
  '신기술사',
  '바이오/의료',
  377.5,
  '9년 7개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"07326"}'::jsonb,
  '{"operator_type_code":"2","operator_type_name":"신기술사","operating_scale_code":"3","business_category_code":"5","strategy_planner":"No","professional_angel":"No","investment_character":"","operating_amount_text":"377.5억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.685Z","founded_original":"9년 7개월"}'::jsonb,
  '2025-06-05T00:13:14.685Z'
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

-- Record 573: 케이투인베스트먼트파트너스
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20110005',
  '케이투인베스트먼트파트너스',
  '',
  '2012-01-01',
  '서울 강남구',
  '06173',
  'LLC',
  '유통/서비스',
  6524.2,
  '13년 10개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"06173"}'::jsonb,
  '{"operator_type_code":"4","operator_type_name":"LLC","operating_scale_code":"5","business_category_code":"5","strategy_planner":"No","professional_angel":"No","investment_character":"","operating_amount_text":"6524.2억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.685Z","founded_original":"13년 10개월"}'::jsonb,
  '2025-06-05T00:13:14.685Z'
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

-- Record 574: 케이티인베스트먼트
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20150023',
  '케이티인베스트먼트',
  '',
  '2016-01-01',
  '서울 강남구',
  '06133',
  '신기술사',
  'ICT서비스',
  1085,
  '9년 8개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"06133"}'::jsonb,
  '{"operator_type_code":"2","operator_type_name":"신기술사","operating_scale_code":"5","business_category_code":"5","strategy_planner":"No","professional_angel":"No","investment_character":"","operating_amount_text":"1085.0억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.685Z","founded_original":"9년 8개월"}'::jsonb,
  '2025-06-05T00:13:14.685Z'
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

-- Record 575: 코나벤처파트너스
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20180002',
  '코나벤처파트너스',
  '',
  '2018-01-01',
  '서울 강남구',
  '06164',
  'LLC',
  '게임',
  2205.6,
  '7년 4개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"06164"}'::jsonb,
  '{"operator_type_code":"4","operator_type_name":"LLC","operating_scale_code":"5","business_category_code":"5","strategy_planner":"No","professional_angel":"No","investment_character":"","operating_amount_text":"2205.6억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.685Z","founded_original":"7년 4개월"}'::jsonb,
  '2025-06-05T00:13:14.685Z'
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

-- Record 576: 코나인베스트먼트
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20180004',
  '코나인베스트먼트',
  '',
  '2018-01-01',
  '서울 강남구',
  '06197',
  '벤처투자회사',
  'ICT서비스',
  357.2,
  '7년 4개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"06197"}'::jsonb,
  '{"operator_type_code":"1","operator_type_name":"벤처투자회사","operating_scale_code":"3","business_category_code":"5","strategy_planner":"No","professional_angel":"No","investment_character":"","operating_amount_text":"357.2억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.685Z","founded_original":"7년 4개월"}'::jsonb,
  '2025-06-05T00:13:14.685Z'
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

-- Record 577: 코난인베스트먼트
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20230275',
  '코난인베스트먼트',
  '',
  '2023-01-01',
  '서울 강남구',
  '06178',
  '벤처투자회사',
  'ICT제조',
  188,
  '2년 1개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"06178"}'::jsonb,
  '{"operator_type_code":"1","operator_type_name":"벤처투자회사","operating_scale_code":"2","business_category_code":"2","strategy_planner":"No","professional_angel":"No","investment_character":"","operating_amount_text":"188.0억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.685Z","founded_original":"2년 1개월"}'::jsonb,
  '2025-06-05T00:13:14.685Z'
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

-- Record 578: 코로프라넥스트코리아
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20220813',
  '코로프라넥스트코리아',
  '',
  '2023-01-01',
  '서울 영등포구',
  '07327',
  '벤처투자회사',
  '기타',
  500,
  '2년 6개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"07327"}'::jsonb,
  '{"operator_type_code":"1","operator_type_name":"벤처투자회사","operating_scale_code":"4","business_category_code":"2","strategy_planner":"No","professional_angel":"No","investment_character":"","operating_amount_text":"500.0억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.685Z","founded_original":"2년 6개월"}'::jsonb,
  '2025-06-05T00:13:14.685Z'
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

-- Record 579: 코리아스타트업빌더
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20210197',
  '코리아스타트업빌더',
  '',
  '2020-01-01',
  '서울 영등포구',
  '07255',
  '기타운용사',
  '전기/기계/장비',
  2.3,
  '5년 9개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"07255"}'::jsonb,
  '{"operator_type_code":"9","operator_type_name":"기타운용사","operating_scale_code":"1","business_category_code":"4","strategy_planner":"Yes","professional_angel":"No","investment_character":"","operating_amount_text":"2.3억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.685Z","founded_original":"5년 9개월"}'::jsonb,
  '2025-06-05T00:13:14.685Z'
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

-- Record 580: 코리아에셋투자증권
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20000066',
  '코리아에셋투자증권',
  '',
  '2000-01-01',
  '서울 영등포구',
  '07327',
  '신기술사',
  'ICT서비스',
  650.5,
  '25년 4개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"07327"}'::jsonb,
  '{"operator_type_code":"2","operator_type_name":"신기술사","operating_scale_code":"4","business_category_code":"6","strategy_planner":"No","professional_angel":"No","investment_character":"","operating_amount_text":"650.5억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.685Z","founded_original":"25년 4개월"}'::jsonb,
  '2025-06-05T00:13:14.685Z'
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

-- Record 581: 코맥스벤처러스
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20170023',
  '코맥스벤처러스',
  '',
  '2017-01-01',
  '경기도 성남시 중원구',
  '13229',
  '기타운용사',
  'ICT서비스',
  22.3,
  '8년 1개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"13229"}'::jsonb,
  '{"operator_type_code":"9","operator_type_name":"기타운용사","operating_scale_code":"1","business_category_code":"5","strategy_planner":"Yes","professional_angel":"No","investment_character":"","operating_amount_text":"22.3억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.685Z","founded_original":"8년 1개월"}'::jsonb,
  '2025-06-05T00:13:14.685Z'
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

-- Record 582: 코메스인베스트먼트
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20170001',
  '코메스인베스트먼트',
  '',
  '2017-01-01',
  '서울 강남구',
  '06173',
  '벤처투자회사',
  '화학/소재',
  1470,
  '8년 4개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"06173"}'::jsonb,
  '{"operator_type_code":"1","operator_type_name":"벤처투자회사","operating_scale_code":"5","business_category_code":"5","strategy_planner":"No","professional_angel":"No","investment_character":"","operating_amount_text":"1470.0억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.685Z","founded_original":"8년 4개월"}'::jsonb,
  '2025-06-05T00:13:14.685Z'
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

-- Record 583: 코벤트캐피탈파트너스
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20200104',
  '코벤트캐피탈파트너스',
  '',
  '2020-01-01',
  '서울 마포구',
  '04147',
  'LLC',
  '유통/서비스',
  25.1,
  '5년 7개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"04147"}'::jsonb,
  '{"operator_type_code":"4","operator_type_name":"LLC","operating_scale_code":"1","business_category_code":"4","strategy_planner":"Yes","professional_angel":"No","investment_character":"","operating_amount_text":"25.1억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.685Z","founded_original":"5년 7개월"}'::jsonb,
  '2025-06-05T00:13:14.685Z'
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

-- Record 584: 코스넷기술투자
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20180005',
  '코스넷기술투자',
  '',
  '2014-01-01',
  '강원도 강릉시',
  '25566',
  '벤처투자회사',
  '전기/기계/장비',
  774,
  '11년 3개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"25566"}'::jsonb,
  '{"operator_type_code":"1","operator_type_name":"벤처투자회사","operating_scale_code":"4","business_category_code":"5","strategy_planner":"No","professional_angel":"No","investment_character":"","operating_amount_text":"774.0억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.685Z","founded_original":"11년 3개월"}'::jsonb,
  '2025-06-05T00:13:14.685Z'
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

-- Record 585: 코업파트너스
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20210746',
  '코업파트너스',
  '',
  '2021-01-01',
  '경상남도 창원시 의창구',
  '51395',
  '기타운용사',
  '전기/기계/장비',
  12.7,
  '4년 1개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"51395"}'::jsonb,
  '{"operator_type_code":"9","operator_type_name":"기타운용사","operating_scale_code":"1","business_category_code":"3","strategy_planner":"Yes","professional_angel":"No","investment_character":"","operating_amount_text":"12.7억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.685Z","founded_original":"4년 1개월"}'::jsonb,
  '2025-06-05T00:13:14.685Z'
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

-- Record 586: 코오롱인베스트먼트
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20000052',
  '코오롱인베스트먼트',
  '',
  '2000-01-01',
  '서울 강남구',
  '06174',
  '벤처투자회사',
  '바이오/의료',
  7555,
  '25년 2개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"06174"}'::jsonb,
  '{"operator_type_code":"1","operator_type_name":"벤처투자회사","operating_scale_code":"5","business_category_code":"6","strategy_planner":"No","professional_angel":"No","investment_character":"","operating_amount_text":"7555.0억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.685Z","founded_original":"25년 2개월"}'::jsonb,
  '2025-06-05T00:13:14.685Z'
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

-- Record 587: 콘탱고파트너스
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20220466',
  '콘탱고파트너스',
  '',
  '2022-01-01',
  '서울 강남구',
  '06164',
  '기타운용사',
  '기타',
  NULL,
  '3년 5개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"06164"}'::jsonb,
  '{"operator_type_code":"9","operator_type_name":"기타운용사","operating_scale_code":"1","business_category_code":"3","strategy_planner":"Yes","professional_angel":"No","investment_character":"","operating_amount_text":"0.0억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.685Z","founded_original":"3년 5개월"}'::jsonb,
  '2025-06-05T00:13:14.685Z'
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

-- Record 588: 콜즈다이나믹스
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20190241',
  '콜즈다이나믹스',
  '',
  '2013-01-01',
  '부산 남구',
  '48411',
  '기타운용사',
  'ICT서비스',
  10.7,
  '12년 3개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"48411"}'::jsonb,
  '{"operator_type_code":"9","operator_type_name":"기타운용사","operating_scale_code":"1","business_category_code":"5","strategy_planner":"Yes","professional_angel":"No","investment_character":"","operating_amount_text":"10.7억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.685Z","founded_original":"12년 3개월"}'::jsonb,
  '2025-06-05T00:13:14.685Z'
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

-- Record 589: 쿨리지코너인베스트먼트
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20100009',
  '쿨리지코너인베스트먼트',
  '',
  '2010-01-01',
  '서울 강남구',
  '06180',
  '벤처투자회사',
  'ICT서비스',
  1750.3,
  '15년 2개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"06180"}'::jsonb,
  '{"operator_type_code":"1","operator_type_name":"벤처투자회사","operating_scale_code":"5","business_category_code":"6","strategy_planner":"Yes","professional_angel":"No","investment_character":"","operating_amount_text":"1750.3억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.685Z","founded_original":"15년 2개월"}'::jsonb,
  '2025-06-05T00:13:14.685Z'
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

-- Record 590: 쿱앤파트너스
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20220537',
  '쿱앤파트너스',
  '',
  '2022-01-01',
  '인천 부평구',
  '21319',
  '기타운용사',
  '유통/서비스',
  3.6,
  '3년 10개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"21319"}'::jsonb,
  '{"operator_type_code":"9","operator_type_name":"기타운용사","operating_scale_code":"1","business_category_code":"3","strategy_planner":"Yes","professional_angel":"No","investment_character":"","operating_amount_text":"3.6억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.685Z","founded_original":"3년 10개월"}'::jsonb,
  '2025-06-05T00:13:14.685Z'
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

-- Record 591: 쿼드벤처스
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20190180',
  '쿼드벤처스',
  '',
  '2020-01-01',
  '서울 강남구',
  '06167',
  '벤처투자회사',
  '유통/서비스',
  711.5,
  '5년 11개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"06167"}'::jsonb,
  '{"operator_type_code":"1","operator_type_name":"벤처투자회사","operating_scale_code":"4","business_category_code":"4","strategy_planner":"Yes","professional_angel":"No","investment_character":"","operating_amount_text":"711.5억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.685Z","founded_original":"5년 11개월"}'::jsonb,
  '2025-06-05T00:13:14.685Z'
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

-- Record 592: 쿼드자산운용
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20220281',
  '쿼드자산운용',
  '',
  '2010-01-01',
  '서울 영등포구',
  '07326',
  '벤처투자회사',
  '전기/기계/장비',
  1306.1,
  '15년 6개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"07326"}'::jsonb,
  '{"operator_type_code":"1","operator_type_name":"벤처투자회사","operating_scale_code":"5","business_category_code":"6","strategy_planner":"No","professional_angel":"No","investment_character":"","operating_amount_text":"1306.1억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.685Z","founded_original":"15년 6개월"}'::jsonb,
  '2025-06-05T00:13:14.685Z'
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

-- Record 593: 퀀텀벤처스코리아
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20170021',
  '퀀텀벤처스코리아',
  '',
  '2018-01-01',
  '서울 강남구',
  '06164',
  '벤처투자회사',
  'ICT서비스',
  3480,
  '7년 7개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"06164"}'::jsonb,
  '{"operator_type_code":"1","operator_type_name":"벤처투자회사","operating_scale_code":"5","business_category_code":"5","strategy_planner":"No","professional_angel":"No","investment_character":"","operating_amount_text":"3480.0억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.685Z","founded_original":"7년 7개월"}'::jsonb,
  '2025-06-05T00:13:14.685Z'
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

-- Record 594: 큐브벤처파트너스
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20090006',
  '큐브벤처파트너스',
  '',
  '2010-01-01',
  '서울 강남구',
  '06161',
  'LLC',
  '유통/서비스',
  270,
  '15년 10개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"06161"}'::jsonb,
  '{"operator_type_code":"4","operator_type_name":"LLC","operating_scale_code":"2","business_category_code":"6","strategy_planner":"No","professional_angel":"No","investment_character":"","operating_amount_text":"270.0억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.685Z","founded_original":"15년 10개월"}'::jsonb,
  '2025-06-05T00:13:14.685Z'
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

-- Record 595: 크로스로드파트너스
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20230065',
  '크로스로드파트너스',
  '',
  '2016-01-01',
  '서울 강남구',
  '06095',
  '벤처투자회사',
  'ICT서비스',
  401,
  '9년 6개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"06095"}'::jsonb,
  '{"operator_type_code":"1","operator_type_name":"벤처투자회사","operating_scale_code":"3","business_category_code":"5","strategy_planner":"No","professional_angel":"No","investment_character":"","operating_amount_text":"401.0억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.685Z","founded_original":"9년 6개월"}'::jsonb,
  '2025-06-05T00:13:14.685Z'
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

-- Record 596: 크리액티브헬스
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20190186',
  '크리액티브헬스',
  '',
  '2015-01-01',
  '서울 용산구',
  '04385',
  '기타운용사',
  '기타',
  NULL,
  '10년 1개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"04385"}'::jsonb,
  '{"operator_type_code":"9","operator_type_name":"기타운용사","operating_scale_code":"1","business_category_code":"5","strategy_planner":"Yes","professional_angel":"No","investment_character":"","operating_amount_text":"0.0억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.685Z","founded_original":"10년 1개월"}'::jsonb,
  '2025-06-05T00:13:14.685Z'
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

-- Record 597: 크립톤
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20110014',
  '크립톤',
  '',
  '2012-01-01',
  '서울 중구',
  '04527',
  '기타운용사',
  '유통/서비스',
  25,
  '13년 10개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"04527"}'::jsonb,
  '{"operator_type_code":"9","operator_type_name":"기타운용사","operating_scale_code":"1","business_category_code":"5","strategy_planner":"Yes","professional_angel":"No","investment_character":"","operating_amount_text":"25.0억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.685Z","founded_original":"13년 10개월"}'::jsonb,
  '2025-06-05T00:13:14.685Z'
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

-- Record 598: 크릿벤처스
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20200352',
  '크릿벤처스',
  '',
  '2021-01-01',
  '서울 강남구',
  '06145',
  '벤처투자회사',
  'ICT서비스',
  2240,
  '4년 9개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"06145"}'::jsonb,
  '{"operator_type_code":"1","operator_type_name":"벤처투자회사","operating_scale_code":"5","business_category_code":"3","strategy_planner":"No","professional_angel":"No","investment_character":"","operating_amount_text":"2240.0억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.685Z","founded_original":"4년 9개월"}'::jsonb,
  '2025-06-05T00:13:14.685Z'
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

-- Record 599: 클러스트벤처스
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20220606',
  '클러스트벤처스',
  '',
  '2018-01-01',
  '서울 강서구',
  '07801',
  '기타운용사',
  '유통/서비스',
  5,
  '7년 10개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"07801"}'::jsonb,
  '{"operator_type_code":"9","operator_type_name":"기타운용사","operating_scale_code":"1","business_category_code":"5","strategy_planner":"Yes","professional_angel":"No","investment_character":"","operating_amount_text":"5.0억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.685Z","founded_original":"7년 10개월"}'::jsonb,
  '2025-06-05T00:13:14.685Z'
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

-- Record 600: 클레어보이언트벤처스
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20140003',
  '클레어보이언트벤처스',
  '',
  '2014-01-01',
  '서울 강남구',
  '06178',
  '벤처투자회사',
  'ICT서비스',
  575,
  '11년 2개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"06178"}'::jsonb,
  '{"operator_type_code":"1","operator_type_name":"벤처투자회사","operating_scale_code":"4","business_category_code":"5","strategy_planner":"No","professional_angel":"No","investment_character":"","operating_amount_text":"575.0억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.685Z","founded_original":"11년 2개월"}'::jsonb,
  '2025-06-05T00:13:14.685Z'
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

-- Batch 12 completed! 50 records processed.
-- Progress: 600/717 total records

