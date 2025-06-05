-- VCS UPSERT Batch 15/15 (Records 701-717)
-- Uses ON CONFLICT DO UPDATE to insert new or update existing records
-- Safe to run multiple times - handles duplicates gracefully
-- Generated at: 2025-06-05T00:13:14.695Z

-- Record 701: 한양대학교기술지주회사
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20080013',
  '한양대학교기술지주회사',
  '',
  '2009-01-01',
  '서울 성동구',
  '04763',
  '기타운용사',
  'ICT서비스',
  36,
  '16년 9개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"04763"}'::jsonb,
  '{"operator_type_code":"9","operator_type_name":"기타운용사","operating_scale_code":"1","business_category_code":"6","strategy_planner":"Yes","professional_angel":"No","investment_character":"","operating_amount_text":"36.0억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.695Z","founded_original":"16년 9개월"}'::jsonb,
  '2025-06-05T00:13:14.695Z'
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

-- Record 702: 한양대학교에리카산학협력단
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20210508',
  '한양대학교에리카산학협력단',
  '',
  '2012-01-01',
  '경기도 안산시 상록구',
  '15588',
  '기타운용사',
  '기타',
  NULL,
  '13년 5개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"15588"}'::jsonb,
  '{"operator_type_code":"9","operator_type_name":"기타운용사","operating_scale_code":"1","business_category_code":"5","strategy_planner":"Yes","professional_angel":"No","investment_character":"","operating_amount_text":"0.0억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.695Z","founded_original":"13년 5개월"}'::jsonb,
  '2025-06-05T00:13:14.695Z'
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

-- Record 703: 한화투자증권
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP19620001',
  '한화투자증권',
  '',
  '1963-01-01',
  '서울 영등포구',
  '07325',
  '신기술사',
  '전기/기계/장비',
  2586,
  '62년 10개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"07325"}'::jsonb,
  '{"operator_type_code":"2","operator_type_name":"신기술사","operating_scale_code":"5","business_category_code":"6","strategy_planner":"No","professional_angel":"No","investment_character":"","operating_amount_text":"2586.0억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.695Z","founded_original":"62년 10개월"}'::jsonb,
  '2025-06-05T00:13:14.695Z'
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

-- Record 704: 해시드벤처스
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20200386',
  '해시드벤처스',
  '',
  '2021-01-01',
  '서울 강남구',
  '06241',
  '벤처투자회사',
  'ICT서비스',
  3903.5,
  '4년 9개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"06241"}'::jsonb,
  '{"operator_type_code":"1","operator_type_name":"벤처투자회사","operating_scale_code":"5","business_category_code":"3","strategy_planner":"No","professional_angel":"No","investment_character":"","operating_amount_text":"3903.5억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.695Z","founded_original":"4년 9개월"}'::jsonb,
  '2025-06-05T00:13:14.695Z'
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

-- Record 705: 핼리스톤벤처스 주식회사
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20220313',
  '핼리스톤벤처스 주식회사',
  '',
  '2022-01-01',
  '서울 성동구',
  '04792',
  '기타운용사',
  '기타',
  9,
  '3년 1개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"04792"}'::jsonb,
  '{"operator_type_code":"9","operator_type_name":"기타운용사","operating_scale_code":"1","business_category_code":"3","strategy_planner":"Yes","professional_angel":"No","investment_character":"","operating_amount_text":"9.0억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.695Z","founded_original":"3년 1개월"}'::jsonb,
  '2025-06-05T00:13:14.695Z'
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

-- Record 706: 허니팟벤처스
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20240136',
  '허니팟벤처스',
  '',
  '2024-01-01',
  '서울 강남구',
  '06019',
  'LLC',
  '전기/기계/장비',
  116.9,
  '1년 4개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"06019"}'::jsonb,
  '{"operator_type_code":"4","operator_type_name":"LLC","operating_scale_code":"2","business_category_code":"2","strategy_planner":"Yes","professional_angel":"No","investment_character":"","operating_amount_text":"116.9억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.695Z","founded_original":"1년 4개월"}'::jsonb,
  '2025-06-05T00:13:14.695Z'
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

-- Record 707: 헥사곤벤처스
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20200034',
  '헥사곤벤처스',
  '',
  '2017-01-01',
  '서울 강남구',
  '06307',
  '기타운용사',
  'ICT서비스',
  14.8,
  '8년 9개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"06307"}'::jsonb,
  '{"operator_type_code":"9","operator_type_name":"기타운용사","operating_scale_code":"1","business_category_code":"5","strategy_planner":"Yes","professional_angel":"No","investment_character":"","operating_amount_text":"14.8억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.695Z","founded_original":"8년 9개월"}'::jsonb,
  '2025-06-05T00:13:14.695Z'
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

-- Record 708: 헬리오스벤처스
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20240491',
  '헬리오스벤처스',
  '',
  '2025-01-01',
  '서울 강남구',
  '06169',
  '벤처투자회사',
  '바이오/의료',
  40.2,
  '0년 11개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"06169"}'::jsonb,
  '{"operator_type_code":"1","operator_type_name":"벤처투자회사","operating_scale_code":"1","business_category_code":"1","strategy_planner":"No","professional_angel":"No","investment_character":"","operating_amount_text":"40.2억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.696Z","founded_original":"0년 11개월"}'::jsonb,
  '2025-06-05T00:13:14.696Z'
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

-- Record 709: 현대기술투자
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP19970003',
  '현대기술투자',
  '',
  '1997-01-01',
  '서울 강남구',
  '06163',
  '벤처투자회사',
  'ICT서비스',
  3769,
  '28년 1개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"06163"}'::jsonb,
  '{"operator_type_code":"1","operator_type_name":"벤처투자회사","operating_scale_code":"5","business_category_code":"6","strategy_planner":"No","professional_angel":"No","investment_character":"","operating_amount_text":"3769.0억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.696Z","founded_original":"28년 1개월"}'::jsonb,
  '2025-06-05T00:13:14.696Z'
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

-- Record 710: 현대투자파트너스
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20210475',
  '현대투자파트너스',
  '',
  '2008-01-01',
  '서울 종로구',
  '03127',
  '신기술사',
  'ICT서비스',
  370,
  '17년 1개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"03127"}'::jsonb,
  '{"operator_type_code":"2","operator_type_name":"신기술사","operating_scale_code":"3","business_category_code":"6","strategy_planner":"No","professional_angel":"No","investment_character":"","operating_amount_text":"370.0억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.696Z","founded_original":"17년 1개월"}'::jsonb,
  '2025-06-05T00:13:14.696Z'
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

-- Record 711: 호라이즌인베스트먼트
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20220135',
  '호라이즌인베스트먼트',
  '',
  '2022-01-01',
  '서울 강남구',
  '06168',
  'LLC',
  '바이오/의료',
  507.3,
  '3년 4개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"06168"}'::jsonb,
  '{"operator_type_code":"4","operator_type_name":"LLC","operating_scale_code":"4","business_category_code":"3","strategy_planner":"No","professional_angel":"No","investment_character":"","operating_amount_text":"507.3억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.696Z","founded_original":"3년 4개월"}'::jsonb,
  '2025-06-05T00:13:14.696Z'
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

-- Record 712: 호서대학교산학협력단
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20180037',
  '호서대학교산학협력단',
  '',
  NULL,
  '충청남도 아산시',
  '31499',
  '기타운용사',
  '기타',
  NULL,
  '',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"31499"}'::jsonb,
  '{"operator_type_code":"9","operator_type_name":"기타운용사","operating_scale_code":"1","business_category_code":"1","strategy_planner":"Yes","professional_angel":"No","investment_character":"","operating_amount_text":"0.0억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.696Z","founded_original":""}'::jsonb,
  '2025-06-05T00:13:14.696Z'
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

-- Record 713: 효성벤처스
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20240316',
  '효성벤처스',
  '',
  '2023-01-01',
  '서울 중구',
  '04529',
  '신기술사',
  '기타',
  1000,
  '2년 10개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"04529"}'::jsonb,
  '{"operator_type_code":"2","operator_type_name":"신기술사","operating_scale_code":"5","business_category_code":"2","strategy_planner":"No","professional_angel":"No","investment_character":"","operating_amount_text":"1000.0억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.696Z","founded_original":"2년 10개월"}'::jsonb,
  '2025-06-05T00:13:14.696Z'
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

-- Record 714: 후앤후
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20150039',
  '후앤후',
  '',
  '2015-01-01',
  '서울 강남구',
  '06160',
  '기타운용사',
  '유통/서비스',
  13.4,
  '10년 5개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"06160"}'::jsonb,
  '{"operator_type_code":"9","operator_type_name":"기타운용사","operating_scale_code":"1","business_category_code":"5","strategy_planner":"Yes","professional_angel":"No","investment_character":"","operating_amount_text":"13.4억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.696Z","founded_original":"10년 5개월"}'::jsonb,
  '2025-06-05T00:13:14.696Z'
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

-- Record 715: 휴넷벤처스
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20210556',
  '휴넷벤처스',
  '',
  '2022-01-01',
  '서울 구로구',
  '08389',
  '기타운용사',
  '기타',
  NULL,
  '3년 10개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"08389"}'::jsonb,
  '{"operator_type_code":"9","operator_type_name":"기타운용사","operating_scale_code":"1","business_category_code":"3","strategy_planner":"Yes","professional_angel":"No","investment_character":"","operating_amount_text":"0.0억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.696Z","founded_original":"3년 10개월"}'::jsonb,
  '2025-06-05T00:13:14.696Z'
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

-- Record 716: 히스토리벤처투자
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20200140',
  '히스토리벤처투자',
  '',
  '2020-01-01',
  '서울 영등포구',
  '07327',
  '벤처투자회사',
  'ICT서비스',
  27,
  '5년 4개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"07327"}'::jsonb,
  '{"operator_type_code":"1","operator_type_name":"벤처투자회사","operating_scale_code":"1","business_category_code":"4","strategy_planner":"Yes","professional_angel":"No","investment_character":"","operating_amount_text":"27.0억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.696Z","founded_original":"5년 4개월"}'::jsonb,
  '2025-06-05T00:13:14.696Z'
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

-- Record 717: 힐스프링인베스트먼트
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20220223',
  '힐스프링인베스트먼트',
  '',
  '2022-01-01',
  '서울 마포구',
  '04168',
  '벤처투자회사',
  '기타',
  436,
  '3년 3개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"04168"}'::jsonb,
  '{"operator_type_code":"1","operator_type_name":"벤처투자회사","operating_scale_code":"3","business_category_code":"3","strategy_planner":"No","professional_angel":"No","investment_character":"","operating_amount_text":"436.0억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-05T00:13:14.696Z","founded_original":"3년 3개월"}'::jsonb,
  '2025-06-05T00:13:14.696Z'
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

-- Batch 15 completed! 17 records processed.
-- Progress: 717/717 total records

-- Final verification query
SELECT 
  'VCS UPSERT Batch Import Completed' as status,
  COUNT(*) as total_vcs_records,
  COUNT(DISTINCT company_id) as unique_companies,
  MAX(updated_at) as last_updated
FROM vc_table WHERE apify_source = 'VCS_API_SCRAPER';
