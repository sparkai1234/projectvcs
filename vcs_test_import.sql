-- VCS Data Import SQL (TEST - First 3 Records)
-- This is for testing the schema before importing all 717 records
-- Generated from VCS API Scraper data

-- Test with first 3 investor records
INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20220559',
  '(주)에이치앤벤처스',
  '',
  '2019-01-01',
  '서울 강남구',
  '06164',
  '기타운용사',
  '유통/서비스',
  1.0,
  '6년 1개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"06164"}'::jsonb,
  '{"operator_type_code":"9","operator_type_name":"기타운용사","operating_scale_code":"1","business_category_code":"4","strategy_planner":"Yes","professional_angel":"No","investment_character":"","operating_amount_text":"1.0억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-04T23:58:56.714Z","founded_original":"6년 1개월"}'::jsonb,
  '2025-06-04T23:58:56.714Z'
);

INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20190371',
  '(주)테라벤처스',
  '',
  '2020-01-01',
  '인천 미추홀구',
  '22106',
  '기타운용사',
  '기타',
  NULL,
  '5년 6개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"22106"}'::jsonb,
  '{"operator_type_code":"9","operator_type_name":"기타운용사","operating_scale_code":"1","business_category_code":"4","strategy_planner":"Yes","professional_angel":"No","investment_character":"","operating_amount_text":"0.0억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-04T23:58:56.714Z","founded_original":"5년 6개월"}'::jsonb,
  '2025-06-04T23:58:56.714Z'
);

INSERT INTO vc_table (
  company_id, company_name, representative, established_date,
  location, zip_code, company_type, industry,
  operating_amount, founded, status, apify_source,
  contact_info, disclosure_data, import_date
) VALUES (
  'OP20220244',
  '(주)티비지파트너스',
  '',
  '2007-01-01',
  '인천 연수구',
  '22004',
  '기타운용사',
  'ICT서비스',
  5.2,
  '18년 3개월',
  'Active',
  'VCS_API_SCRAPER',
  '{"phone":"","address":"","zip_code":"22004"}'::jsonb,
  '{"operator_type_code":"9","operator_type_name":"기타운용사","operating_scale_code":"1","business_category_code":"6","strategy_planner":"Yes","professional_angel":"No","investment_character":"","operating_amount_text":"5.2억원","source_url":"https://www.vcs.go.kr/web/portal/investor/search","extracted_at":"2025-06-04T23:58:56.714Z","founded_original":"18년 3개월"}'::jsonb,
  '2025-06-04T23:58:56.714Z'
);

-- Test completed! If this works, you can run the full vcs_data_corrected.sql file
SELECT 'Test import successful! 3 VCS investor records added.' AS result; 