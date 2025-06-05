-- VCS Fund MINIMAL UPSERT Batch 36/74 (Records 1751-1800)
-- MINIMAL: Only using basic columns that definitely exist
-- Generated from VCS API Scraper fund data
-- Generated at: 2025-06-05T00:40:21.862Z
-- Schema: Minimal fund_table structure (basic columns only)

-- MINIMAL FUND DATA (UPSERT - Safe for Duplicates)
-- Processing 50 fund records
-- Will INSERT new records or UPDATE existing ones

-- Record 1751: 어나더브레인 엔젤시드 개인투자조합6호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200215',
  '어나더브레인 엔젤시드 개인투자조합6호',
  100000000,
  '2023-09-21',
  '{"fund_id":"AS20230800","registration_date":"2023-09-21","expiry_date":"2028-09-20","formation_total_amount":"1.0","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200215","operator_company_name":"어나더브레인","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"어나더브레인","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.862Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1752: 어나더브레인 엔젤시드 개인투자조합5호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200215',
  '어나더브레인 엔젤시드 개인투자조합5호',
  100000000,
  '2023-11-29',
  '{"fund_id":"AS20231129","registration_date":"2023-11-29","expiry_date":"2028-11-28","formation_total_amount":"1.0","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200215","operator_company_name":"어나더브레인","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"어나더브레인","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.862Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1753: 어나더브레인 엔젤시드 개인투자조합 9호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200215',
  '어나더브레인 엔젤시드 개인투자조합 9호',
  100000000,
  '2024-04-29',
  '{"fund_id":"AS20240354","registration_date":"2024-04-29","expiry_date":"2029-12-31","formation_total_amount":"1.0","investment_character_code":"","industry_code":"7","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200215","operator_company_name":"어나더브레인","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"어나더브레인","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.862Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1754: 어나더브레인 엔젤시드 개인투자조합 8호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200215',
  '어나더브레인 엔젤시드 개인투자조합 8호',
  1330000000,
  '2024-04-18',
  '{"fund_id":"AS20240291","registration_date":"2024-04-18","expiry_date":"2029-12-31","formation_total_amount":"13.3","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200215","operator_company_name":"어나더브레인","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"어나더브레인","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.862Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1755: 어나더브레인 엔젤시드 개인투자조합 7호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200215',
  '어나더브레인 엔젤시드 개인투자조합 7호',
  700000000,
  '2023-12-21',
  '{"fund_id":"AS20231304","registration_date":"2023-12-21","expiry_date":"2028-12-20","formation_total_amount":"7.0","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200215","operator_company_name":"어나더브레인","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"어나더브레인","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.862Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1756: 어나더브레인 엔젤시드 개인투자조합 4호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200215',
  '어나더브레인 엔젤시드 개인투자조합 4호',
  610000000,
  '2022-12-19',
  '{"fund_id":"AS20221460","registration_date":"2022-12-19","expiry_date":"2027-12-31","formation_total_amount":"6.1","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200215","operator_company_name":"어나더브레인","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"어나더브레인","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.862Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1757: 어나더브레인 엔젤시드 개인투자조합 3호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200215',
  '어나더브레인 엔젤시드 개인투자조합 3호',
  120000000,
  '2023-06-08',
  '{"fund_id":"AS20230466","registration_date":"2023-06-08","expiry_date":"2028-12-31","formation_total_amount":"1.2","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200215","operator_company_name":"어나더브레인","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"어나더브레인","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.862Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1758: 어나더브레인 엔젤시드 개인투자조합 2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200215',
  '어나더브레인 엔젤시드 개인투자조합 2호',
  390000000,
  '2022-10-05',
  '{"fund_id":"AS20221089","registration_date":"2022-10-05","expiry_date":"2027-12-31","formation_total_amount":"3.9","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200215","operator_company_name":"어나더브레인","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"어나더브레인","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.862Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1759: 어나더브레인 엔젤시드 개인투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200215',
  '어나더브레인 엔젤시드 개인투자조합 1호',
  110000000,
  '2022-07-08',
  '{"fund_id":"AS20220752","registration_date":"2022-07-08","expiry_date":"2027-12-31","formation_total_amount":"1.1","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200215","operator_company_name":"어나더브레인","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"어나더브레인","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.862Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1760: 어나더브레인 엔젤시드 개인투자조합 10호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200215',
  '어나더브레인 엔젤시드 개인투자조합 10호',
  220000000,
  '2024-08-08',
  '{"fund_id":"AS20240719","registration_date":"2024-08-08","expiry_date":"2029-12-31","formation_total_amount":"2.2","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200215","operator_company_name":"어나더브레인","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"어나더브레인","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.862Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1761: 어나더브레인 에스비엔젤 클럽 개인투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200215',
  '어나더브레인 에스비엔젤 클럽 개인투자조합1호',
  1000000000,
  '2024-08-05',
  '{"fund_id":"AS20240691","registration_date":"2024-08-05","expiry_date":"2029-12-31","formation_total_amount":"10.0","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200215","operator_company_name":"어나더브레인","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"어나더브레인","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.862Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1762: 어나더브레인 벤처투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200215',
  '어나더브레인 벤처투자조합 1호',
  1020000000,
  '2024-12-23',
  '{"fund_id":"AS20241416","registration_date":"2024-12-23","expiry_date":"2031-12-22","formation_total_amount":"10.2","investment_character_code":"28","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20200215","operator_company_name":"어나더브레인","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"어나더브레인","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.862Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1763: 어나더브레인 메디컬 벤처투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200215',
  '어나더브레인 메디컬 벤처투자조합 1호',
  1000000000,
  '2024-06-12',
  '{"fund_id":"AS20240516","registration_date":"2024-06-12","expiry_date":"2031-06-11","formation_total_amount":"10.0","investment_character_code":"04","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20200215","operator_company_name":"어나더브레인","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"어나더브레인","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.862Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1764: 어나더브레인 글로벌 스타트업 벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200215',
  '어나더브레인 글로벌 스타트업 벤처투자조합',
  6550000000,
  '2022-09-20',
  '{"fund_id":"AS20221075","registration_date":"2022-09-20","expiry_date":"2027-09-19","formation_total_amount":"65.5","investment_character_code":"20","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20200215","operator_company_name":"어나더브레인","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"어나더브레인","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.862Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1765: 어나더브레인 개인투자조합3호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200215',
  '어나더브레인 개인투자조합3호',
  550000000,
  '2024-12-17',
  '{"fund_id":"AS20241324","registration_date":"2024-12-17","expiry_date":"2029-12-31","formation_total_amount":"5.5","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200215","operator_company_name":"어나더브레인","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"어나더브레인","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.862Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1766: 어나더브레인 개인투자조합 7호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200215',
  '어나더브레인 개인투자조합 7호',
  100000000,
  '2024-12-30',
  '{"fund_id":"AS20241393","registration_date":"2024-12-30","expiry_date":"2029-12-31","formation_total_amount":"1.0","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200215","operator_company_name":"어나더브레인","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"어나더브레인","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.862Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1767: 어나더브레인 개인투자조합 6호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200215',
  '어나더브레인 개인투자조합 6호',
  110000000,
  '2024-12-10',
  '{"fund_id":"AS20241256","registration_date":"2024-12-10","expiry_date":"2029-12-31","formation_total_amount":"1.1","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200215","operator_company_name":"어나더브레인","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"어나더브레인","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.862Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1768: 어나더브레인 개인투자조합 5호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200215',
  '어나더브레인 개인투자조합 5호',
  100000000,
  '2024-12-02',
  '{"fund_id":"AS20241229","registration_date":"2024-12-02","expiry_date":"2029-12-31","formation_total_amount":"1.0","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200215","operator_company_name":"어나더브레인","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"어나더브레인","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.862Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1769: 어나더브레인 개인투자조합 4호 
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200215',
  '어나더브레인 개인투자조합 4호 ',
  100000000,
  '2024-11-27',
  '{"fund_id":"AS20241193","registration_date":"2024-11-27","expiry_date":"2029-12-31","formation_total_amount":"1.0","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200215","operator_company_name":"어나더브레인","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"어나더브레인","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.862Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1770: 어나더브레인 개인투자조합 2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200215',
  '어나더브레인 개인투자조합 2호',
  100000000,
  '2024-10-22',
  '{"fund_id":"AS20240957","registration_date":"2024-10-22","expiry_date":"2029-12-31","formation_total_amount":"1.0","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200215","operator_company_name":"어나더브레인","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"어나더브레인","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.862Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1771: 어나더브레인 개인투자조합 1호 
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200215',
  '어나더브레인 개인투자조합 1호 ',
  510000000,
  '2024-05-28',
  '{"fund_id":"AS20240457","registration_date":"2024-05-28","expiry_date":"2029-12-31","formation_total_amount":"5.1","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200215","operator_company_name":"어나더브레인","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"어나더브레인","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.862Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1772: 어 모어 뷰티풀 챌린지 펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20110015',
  '어 모어 뷰티풀 챌린지 펀드',
  3000000000,
  '2022-11-29',
  '{"fund_id":"AS20221371","registration_date":"2022-11-29","expiry_date":"2029-11-28","formation_total_amount":"30.0","investment_character_code":"20","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20110015","operator_company_name":"엠와이소셜컴퍼니","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"엠와이소셜컴퍼니","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.862Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1773: 앨리스파트너스 9호 벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20240710',
  '앨리스파트너스 9호 벤처투자조합',
  2020000000,
  '2025-01-14',
  '{"fund_id":"AS20250045","registration_date":"2025-01-14","expiry_date":"2030-01-13","formation_total_amount":"20.2","investment_character_code":"25","industry_code":"9","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20240710","operator_company_name":"앨리스파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"앨리스파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.862Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1774: 앤파트너스제일호벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20220350',
  '앤파트너스제일호벤처투자조합',
  18890000000,
  '2022-06-28',
  '{"fund_id":"AS20220719","registration_date":"2022-06-28","expiry_date":"2030-06-27","formation_total_amount":"188.9","investment_character_code":"02","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20220350","operator_company_name":"앤파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"앤파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.862Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1775: 앤틀러울트라얼리펀드1-A
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210653',
  '앤틀러울트라얼리펀드1-A',
  13240000000,
  '2022-07-25',
  '{"fund_id":"AS20220852","registration_date":"2022-07-25","expiry_date":"2030-07-24","formation_total_amount":"132.4","investment_character_code":"20","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20210653","operator_company_name":"앤틀러코리아","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"앤틀러코리아","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.862Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1776: 앤틀러울트라얼리투자조합1-B
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210653',
  '앤틀러울트라얼리투자조합1-B',
  5200000000,
  '2022-08-12',
  '{"fund_id":"AS20220869","registration_date":"2022-08-12","expiry_date":"2030-08-11","formation_total_amount":"52.0","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20210653","operator_company_name":"앤틀러코리아","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"앤틀러코리아","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.862Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1777: 앤콘텐츠벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20220350',
  '앤콘텐츠벤처투자조합',
  11200000000,
  '2022-04-18',
  '{"fund_id":"AS20220433","registration_date":"2022-04-18","expiry_date":"2027-04-17","formation_total_amount":"112.0","investment_character_code":"24","industry_code":"6","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20220350","operator_company_name":"앤파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"앤파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.862Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1778: 앤디스-비디씨투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20220578',
  '앤디스-비디씨투자조합1호',
  2000000000,
  '2025-03-10',
  '{"fund_id":"AS20250175","registration_date":"2025-03-10","expiry_date":"2030-03-09","formation_total_amount":"20.0","investment_character_code":"01","industry_code":"9","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20220578","operator_company_name":"비디씨엑셀러레이터","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"비디씨엑셀러레이터","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.862Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1779: 액틴개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200370',
  '액틴개인투자조합',
  100000000,
  '2022-04-19',
  '{"fund_id":"AS20220081","registration_date":"2022-04-19","expiry_date":"2027-04-18","formation_total_amount":"1.0","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200370","operator_company_name":"액틴","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"액틴","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.862Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1780: 액티브시니어초기스타트업 개인투자조합2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20140013',
  '액티브시니어초기스타트업 개인투자조합2호',
  370000000,
  '2023-05-24',
  '{"fund_id":"AS20230401","registration_date":"2023-05-24","expiry_date":"2028-05-23","formation_total_amount":"3.7","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20140013","operator_company_name":"더인벤션랩","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"더인벤션랩","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.862Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1781: 액티브시니어초기스타트업 개인투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20140013',
  '액티브시니어초기스타트업 개인투자조합1호',
  280000000,
  '2022-05-09',
  '{"fund_id":"AS20220474","registration_date":"2022-05-09","expiry_date":"2027-06-30","formation_total_amount":"2.8","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20140013","operator_company_name":"더인벤션랩","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"더인벤션랩","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.862Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1782: 애드벤처스이에스지개인투자조합제1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210679',
  '애드벤처스이에스지개인투자조합제1호',
  620000000,
  '2022-07-25',
  '{"fund_id":"AS20220821","registration_date":"2022-07-25","expiry_date":"2028-07-24","formation_total_amount":"6.2","investment_character_code":"","industry_code":"3","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20210679","operator_company_name":"애드벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"애드벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.862Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1783: 애드벤처스에이아이 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210679',
  '애드벤처스에이아이 개인투자조합',
  300000000,
  '2024-01-02',
  '{"fund_id":"AS20231340","registration_date":"2024-01-02","expiry_date":"2030-01-01","formation_total_amount":"3.0","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20210679","operator_company_name":"애드벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"애드벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.862Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1784: 알파원 프로젝트 투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20180010',
  '알파원 프로젝트 투자조합 1호',
  6900000000,
  '2022-03-02',
  '{"fund_id":"AS20220212","registration_date":"2022-03-02","expiry_date":"2027-03-01","formation_total_amount":"69.0","investment_character_code":"16","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20180010","operator_company_name":"델타인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"델타인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.862Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1785: 알파원 프로젝트 투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200373',
  '알파원 프로젝트 투자조합 1호',
  6900000000,
  '2022-03-02',
  '{"fund_id":"AS20220212","registration_date":"2022-03-02","expiry_date":"2027-03-01","formation_total_amount":"69.0","investment_character_code":"16","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20200373","operator_company_name":"알파원인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"알파원인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.862Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1786: 알파원 알파라이징 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200373',
  '알파원 알파라이징 투자조합',
  17300000000,
  '2022-12-14',
  '{"fund_id":"AS20221480","registration_date":"2022-12-14","expiry_date":"2030-12-13","formation_total_amount":"173.0","investment_character_code":"20","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20200373","operator_company_name":"알파원인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"알파원인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.862Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1787: 알파랩xTSB 외식벤처 2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210169',
  '알파랩xTSB 외식벤처 2호',
  600000000,
  '2024-05-16',
  '{"fund_id":"AS20240411","registration_date":"2024-05-16","expiry_date":"2029-05-15","formation_total_amount":"6.0","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20210169","operator_company_name":"알파랩","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"알파랩","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.862Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1788: 알파랩xTSB 외식벤처 1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210169',
  '알파랩xTSB 외식벤처 1호',
  270000000,
  '2023-11-20',
  '{"fund_id":"AS20231098","registration_date":"2023-11-20","expiry_date":"2028-11-19","formation_total_amount":"2.7","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20210169","operator_company_name":"알파랩","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"알파랩","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.862Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1789: 알파랩(xTSB) 외식벤처 3호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210169',
  '알파랩(xTSB) 외식벤처 3호',
  960000000,
  '2024-10-22',
  '{"fund_id":"AS20240976","registration_date":"2024-10-22","expiry_date":"2029-10-21","formation_total_amount":"9.6","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20210169","operator_company_name":"알파랩","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"알파랩","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.862Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1790: 알파랩 알로하앤코 투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210169',
  '알파랩 알로하앤코 투자조합 1호',
  100000000,
  '2025-01-22',
  '{"fund_id":"AS20250042","registration_date":"2025-01-22","expiry_date":"2030-01-21","formation_total_amount":"1.0","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20210169","operator_company_name":"알파랩","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"알파랩","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.862Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1791: 알파랩 다니엘(X Daniel) 외식벤처개인투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210169',
  '알파랩 다니엘(X Daniel) 외식벤처개인투자조합 1호',
  100000000,
  '2024-08-01',
  '{"fund_id":"AS20240694","registration_date":"2024-08-01","expiry_date":"2029-07-31","formation_total_amount":"1.0","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20210169","operator_company_name":"알파랩","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"알파랩","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.862Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1792: 알파랩 공간로드 투자조합 2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210169',
  '알파랩 공간로드 투자조합 2호',
  200000000,
  '2025-01-14',
  '{"fund_id":"AS20250020","registration_date":"2025-01-14","expiry_date":"2029-01-13","formation_total_amount":"2.0","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20210169","operator_company_name":"알파랩","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"알파랩","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.862Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1793: 알파랩 공간로드 투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210169',
  '알파랩 공간로드 투자조합 1호',
  200000000,
  '2024-11-18',
  '{"fund_id":"AS20241107","registration_date":"2024-11-18","expiry_date":"2029-11-17","formation_total_amount":"2.0","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20210169","operator_company_name":"알파랩","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"알파랩","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.862Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1794: 알파넥스트미디어이노베이션펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20000027',
  '알파넥스트미디어이노베이션펀드',
  197300000000,
  '2016-12-13',
  '{"fund_id":"AS20160224","registration_date":"2016-12-13","expiry_date":"2026-12-12","formation_total_amount":"1973.0","investment_character_code":"24","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"IT","mother_fund_id":"MF00000001","operator_company_id":"OP20000027","operator_company_name":"에스비브이에이","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"에스비브이에이","investment_focus":["IT","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.862Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1795: 알토란5호유니콘창업투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200418',
  '알토란5호유니콘창업투자조합',
  600000000,
  '2024-05-14',
  '{"fund_id":"AS20240406","registration_date":"2024-05-14","expiry_date":"2029-05-13","formation_total_amount":"6.0","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200418","operator_company_name":"알토란벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"알토란벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.862Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1796: 알토란4호유니콘창업투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200418',
  '알토란4호유니콘창업투자조합',
  170000000,
  '2023-06-20',
  '{"fund_id":"AS20230490","registration_date":"2023-06-20","expiry_date":"2028-06-19","formation_total_amount":"1.7","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200418","operator_company_name":"알토란벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"알토란벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.863Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1797: 알토란3호 유니콘창업투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200418',
  '알토란3호 유니콘창업투자조합',
  130000000,
  '2022-12-20',
  '{"fund_id":"AS20221461","registration_date":"2022-12-20","expiry_date":"2027-12-19","formation_total_amount":"1.3","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200418","operator_company_name":"알토란벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"알토란벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.863Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1798: 알토란2호유니콘창업투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200418',
  '알토란2호유니콘창업투자조합',
  100000000,
  '2022-07-08',
  '{"fund_id":"AS20220743","registration_date":"2022-07-08","expiry_date":"2027-07-07","formation_total_amount":"1.0","investment_character_code":"","industry_code":"1","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200418","operator_company_name":"알토란벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"알토란벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.863Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1799: 알토란1호유니콘창업 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200418',
  '알토란1호유니콘창업 투자조합',
  100000000,
  '2021-12-14',
  '{"fund_id":"AS20211283","registration_date":"2021-12-14","expiry_date":"2026-12-13","formation_total_amount":"1.0","investment_character_code":"","industry_code":"1","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200418","operator_company_name":"알토란벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"알토란벤처스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.863Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1800: 알에스 개인투자조합 5호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20220541',
  '알에스 개인투자조합 5호',
  110000000,
  '2024-12-13',
  '{"fund_id":"AS20241301","registration_date":"2024-12-13","expiry_date":"2029-12-12","formation_total_amount":"1.1","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20220541","operator_company_name":"시드버스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"시드버스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.863Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Minimal Batch 36 completed! 50 fund records processed.
-- Progress: 1800/3689 total records

