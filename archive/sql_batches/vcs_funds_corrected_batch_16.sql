-- VCS Fund CORRECTED UPSERT Batch 16/74 (Records 751-800)
-- FIXED: Removed fund_name_en column that does not exist
-- Generated from VCS API Scraper fund data
-- Generated at: 2025-06-05T00:34:30.197Z
-- Schema: Matches actual fund_table structure (no fund_name_en)

-- CORRECTED FUND DATA (UPSERT - Safe for Duplicates)
-- Processing 50 fund records
-- Will INSERT new records or UPDATE existing ones

-- Record 751: 충남대학혁신펀드 개인투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20190432',
  '충남대학혁신펀드 개인투자조합 1호',
  'VCS Registered Fund',
  300000000,
  300000000,
  '2022-12-15',
  'Active',
  '충남창조경제혁신센터',
  NULL,
  '{"fund_id":"AS20221431","registration_date":"2022-12-15","expiry_date":"2027-12-08","formation_total_amount":"3.0","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190432","operator_company_name":"충남창조경제혁신센터","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.197Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 752: 충남대학교기술지주(주)지방개인투자조합 제1호
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20170035',
  '충남대학교기술지주(주)지방개인투자조합 제1호',
  'VCS Registered Fund',
  3000000000,
  3000000000,
  '2020-08-14',
  'Active',
  '충남대학교기술지주',
  NULL,
  '{"fund_id":"AS20200434","registration_date":"2020-08-14","expiry_date":"2028-08-13","formation_total_amount":"30.0","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"MF00000001","operator_company_id":"OP20170035","operator_company_name":"충남대학교기술지주","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.197Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 753: 충남대-로우 충북 혁신 창업 펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20150026',
  '충남대-로우 충북 혁신 창업 펀드',
  'VCS Registered Fund',
  4000000000,
  4000000000,
  '2024-01-30',
  'Active',
  '로우파트너스',
  NULL,
  '{"fund_id":"AS20240028","registration_date":"2024-01-30","expiry_date":"2032-01-10","formation_total_amount":"40.0","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"MF00000021","operator_company_id":"OP20150026","operator_company_name":"로우파트너스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.197Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 754: 충남대-로우 아이피(IP)기반 창업기업 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20150026',
  '충남대-로우 아이피(IP)기반 창업기업 투자조합',
  'VCS Registered Fund',
  5100000000,
  5100000000,
  '2022-10-17',
  'Active',
  '로우파트너스',
  NULL,
  '{"fund_id":"AS20221142","registration_date":"2022-10-17","expiry_date":"2029-10-03","formation_total_amount":"51.0","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"MF00000001","operator_company_id":"OP20150026","operator_company_name":"로우파트너스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.197Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 755: 충남대-로우 라이콘 투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20150026',
  '충남대-로우 라이콘 투자조합 1호',
  'VCS Registered Fund',
  5000000000,
  5000000000,
  '2024-08-12',
  'Active',
  '로우파트너스',
  NULL,
  '{"fund_id":"AS20240720","registration_date":"2024-08-12","expiry_date":"2032-07-31","formation_total_amount":"50.0","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"MF00000001","operator_company_id":"OP20150026","operator_company_name":"로우파트너스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.197Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 756: 충남대-로우 대학창업투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20170035',
  '충남대-로우 대학창업투자조합 1호',
  'VCS Registered Fund',
  2000000000,
  2000000000,
  '2021-11-01',
  'Active',
  '충남대학교기술지주',
  NULL,
  '{"fund_id":"AS20211043","registration_date":"2021-11-01","expiry_date":"2029-10-28","formation_total_amount":"20.0","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"MF00000001","operator_company_id":"OP20170035","operator_company_name":"충남대학교기술지주","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.197Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 757: 충남-NCK디지털관광조합
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20180005',
  '충남-NCK디지털관광조합',
  'VCS Registered Fund',
  21500000000,
  21500000000,
  '2023-11-21',
  'Active',
  '코스넷기술투자',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20231115","registration_date":"2023-11-21","expiry_date":"2031-11-20","formation_total_amount":"215.0","investment_character_code":"10","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20180005","operator_company_name":"코스넷기술투자","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.197Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 758: 충남 엔젤투자매칭펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20120017',
  '충남 엔젤투자매칭펀드',
  'VCS Registered Fund',
  5000000000,
  5000000000,
  '2015-10-27',
  'Active',
  '한국엔젤투자협회',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20150121","registration_date":"2015-10-27","expiry_date":"2025-10-26","formation_total_amount":"50.0","investment_character_code":"20","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20120017","operator_company_name":"한국엔젤투자협회","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.197Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 759: 춘천 중소기업 성장지원 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20160011',
  '춘천 중소기업 성장지원 투자조합',
  'VCS Registered Fund',
  20000000000,
  20000000000,
  '2020-05-29',
  'Active',
  '어니스트벤처스',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20200246","registration_date":"2020-05-29","expiry_date":"2028-05-28","formation_total_amount":"200.0","investment_character_code":"18","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20160011","operator_company_name":"어니스트벤처스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.197Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 760: 청년창업사관학교 스타트업 펀드 1호
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20210609',
  '청년창업사관학교 스타트업 펀드 1호',
  'VCS Registered Fund',
  1000000000,
  1000000000,
  '2024-01-22',
  'Active',
  '제이씨에이치인베스트먼트',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20240052","registration_date":"2024-01-22","expiry_date":"2032-01-21","formation_total_amount":"10.0","investment_character_code":"21","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20210609","operator_company_name":"제이씨에이치인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.197Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 761: 첨단리딩바이오 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20000042',
  '첨단리딩바이오 투자조합',
  'VCS Registered Fund',
  3000000000,
  3000000000,
  '2023-08-18',
  'Active',
  '에스엠비투자파트너스',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20230732","registration_date":"2023-08-18","expiry_date":"2028-08-17","formation_total_amount":"30.0","investment_character_code":"04","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20000042","operator_company_name":"에스엠비투자파트너스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.197Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 762: 천안-그래비티 지역유망기업 투자조합 제1호
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20210260',
  '천안-그래비티 지역유망기업 투자조합 제1호',
  'VCS Registered Fund',
  2250000000,
  2250000000,
  '2025-02-26',
  'Active',
  '그래비티벤처스',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20250150","registration_date":"2025-02-26","expiry_date":"2030-02-25","formation_total_amount":"22.5","investment_character_code":"03","industry_code":"9","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20210260","operator_company_name":"그래비티벤처스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.197Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 763: 창업사업화지원 매칭펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20000029',
  '창업사업화지원 매칭펀드',
  'VCS Registered Fund',
  4050000000,
  4050000000,
  '2024-08-12',
  'Active',
  '한국벤처투자',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20240774","registration_date":"2024-08-12","expiry_date":"2032-08-11","formation_total_amount":"40.5","investment_character_code":"01","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20000029","operator_company_name":"한국벤처투자","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.197Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 764: 창업보육투자조합2호
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20170029',
  '창업보육투자조합2호',
  'VCS Registered Fund',
  130000000,
  130000000,
  '2024-10-10',
  'Active',
  '벤처박스',
  NULL,
  '{"fund_id":"AS20240943","registration_date":"2024-10-10","expiry_date":"2029-10-06","formation_total_amount":"1.3","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20170029","operator_company_name":"벤처박스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.197Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 765: 창업보육투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20170029',
  '창업보육투자조합1호',
  'VCS Registered Fund',
  230000000,
  230000000,
  '2022-07-15',
  'Active',
  '벤처박스',
  NULL,
  '{"fund_id":"AS20220766","registration_date":"2022-07-15","expiry_date":"2027-07-14","formation_total_amount":"2.3","investment_character_code":"","industry_code":"6","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20170029","operator_company_name":"벤처박스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.197Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 766: 차세대에너지 벤처투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20000021',
  '차세대에너지 벤처투자조합1호',
  'VCS Registered Fund',
  11260000000,
  11260000000,
  '2023-05-18',
  'Active',
  '이수창업투자',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20230408","registration_date":"2023-05-18","expiry_date":"2028-05-17","formation_total_amount":"112.6","investment_character_code":"25","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20000021","operator_company_name":"이수창업투자","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.197Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 767: 차세대 지역뉴딜&바이오 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20190375',
  '차세대 지역뉴딜&바이오 투자조합',
  'VCS Registered Fund',
  20000000000,
  20000000000,
  '2022-11-21',
  'Active',
  '경남벤처투자',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20221326","registration_date":"2022-11-21","expiry_date":"2030-11-20","formation_total_amount":"200.0","investment_character_code":"02","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000016","operator_company_id":"OP20190375","operator_company_name":"경남벤처투자","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.197Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 768: 차세대 신소재융합 R&D 펀드 1호
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20180065',
  '차세대 신소재융합 R&D 펀드 1호',
  'VCS Registered Fund',
  100000000,
  100000000,
  '2019-11-29',
  'Active',
  '엔피프틴파트너스',
  NULL,
  '{"fund_id":"AS20190538","registration_date":"2019-11-29","expiry_date":"2026-11-28","formation_total_amount":"1.0","investment_character_code":"","industry_code":"1","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20180065","operator_company_name":"엔피프틴파트너스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.197Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 769: 진앤-케이 메디테크 1호 벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20200240',
  '진앤-케이 메디테크 1호 벤처투자조합',
  'VCS Registered Fund',
  3700000000,
  3700000000,
  '2025-04-09',
  'Active',
  '진앤투자파트너스',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20250275","registration_date":"2025-04-09","expiry_date":"2030-04-08","formation_total_amount":"37.0","investment_character_code":"25","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20200240","operator_company_name":"진앤투자파트너스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.197Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 770: 진앤-액시스 넥스트덴탈 벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20200240',
  '진앤-액시스 넥스트덴탈 벤처투자조합',
  'VCS Registered Fund',
  6410000000,
  6410000000,
  '2023-10-19',
  'Active',
  '진앤투자파트너스',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20230950","registration_date":"2023-10-19","expiry_date":"2028-10-18","formation_total_amount":"64.1","investment_character_code":"25","industry_code":"4","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20200240","operator_company_name":"진앤투자파트너스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.197Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 771: 지이피에스 글로벌 VC 펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20000029',
  '지이피에스 글로벌 VC 펀드',
  'VCS Registered Fund',
  50500000000,
  50500000000,
  '2023-04-26',
  'Active',
  '한국벤처투자',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20230325","registration_date":"2023-04-26","expiry_date":"2038-04-25","formation_total_amount":"505.0","investment_character_code":"15","industry_code":"9","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20000029","operator_company_name":"한국벤처투자","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.197Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 772: 지이에프개인투자조합2호
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20160034',
  '지이에프개인투자조합2호',
  'VCS Registered Fund',
  100000000,
  100000000,
  '2024-08-05',
  'Active',
  '글로벌청년창업가재단',
  NULL,
  '{"fund_id":"AS20240683","registration_date":"2024-08-05","expiry_date":"2029-08-04","formation_total_amount":"1.0","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20160034","operator_company_name":"글로벌청년창업가재단","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.197Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 773: 지이에프개인투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20160034',
  '지이에프개인투자조합1호',
  'VCS Registered Fund',
  780000000,
  780000000,
  '2022-02-10',
  'Active',
  '글로벌청년창업가재단',
  NULL,
  '{"fund_id":"AS20220126","registration_date":"2022-02-10","expiry_date":"2027-02-08","formation_total_amount":"7.8","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20160034","operator_company_name":"글로벌청년창업가재단","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.197Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 774: 지유시스템반도체상생투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20170009',
  '지유시스템반도체상생투자조합',
  'VCS Registered Fund',
  30500000000,
  30500000000,
  '2020-08-06',
  'Active',
  '지유투자',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20200417","registration_date":"2020-08-06","expiry_date":"2030-08-05","formation_total_amount":"305.0","investment_character_code":"10","industry_code":"1","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20170009","operator_company_name":"지유투자","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.197Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 775: 지유소부장프로젝트일호조합
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20170009',
  '지유소부장프로젝트일호조합',
  'VCS Registered Fund',
  12500000000,
  12500000000,
  '2023-05-18',
  'Active',
  '지유투자',
  '{"부품소재","일반"}',
  '{"fund_id":"AS20230409","registration_date":"2023-05-18","expiry_date":"2028-05-17","formation_total_amount":"125.0","investment_character_code":"25","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"부품소재","mother_fund_id":"","operator_company_id":"OP20170009","operator_company_name":"지유투자","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.197Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 776: 지유성장벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20170009',
  '지유성장벤처투자조합',
  'VCS Registered Fund',
  3250000000,
  3250000000,
  '2021-04-26',
  'Active',
  '지유투자',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20210333","registration_date":"2021-04-26","expiry_date":"2026-04-25","formation_total_amount":"32.5","investment_character_code":"02","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20170009","operator_company_name":"지유투자","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.197Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 777: 지유반도체성장투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20170009',
  '지유반도체성장투자조합',
  'VCS Registered Fund',
  27300000000,
  27300000000,
  '2017-08-24',
  'Active',
  '지유투자',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20170093","registration_date":"2017-08-24","expiry_date":"2025-08-23","formation_total_amount":"273.0","investment_character_code":"06","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20170009","operator_company_name":"지유투자","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.197Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 778: 지유딥테크특허투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20170009',
  '지유딥테크특허투자조합',
  'VCS Registered Fund',
  16750000000,
  16750000000,
  '2023-10-12',
  'Active',
  '지유투자',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20230931","registration_date":"2023-10-12","expiry_date":"2031-10-11","formation_total_amount":"167.5","investment_character_code":"09","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20170009","operator_company_name":"지유투자","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.197Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 779: 지유과학기술일자리창출투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20170009',
  '지유과학기술일자리창출투자조합',
  'VCS Registered Fund',
  16000000000,
  16000000000,
  '2019-10-01',
  'Active',
  '지유투자',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20190462","registration_date":"2019-10-01","expiry_date":"2027-09-30","formation_total_amount":"160.0","investment_character_code":"14","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20170009","operator_company_name":"지유투자","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.197Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 780: 지온 재기지원 펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20090005',
  '지온 재기지원 펀드',
  'VCS Registered Fund',
  20000000000,
  20000000000,
  '2018-01-05',
  'Active',
  '지온인베스트먼트',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20180064","registration_date":"2018-01-05","expiry_date":"2026-01-04","formation_total_amount":"200.0","investment_character_code":"22","industry_code":"6","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20090005","operator_company_name":"지온인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.197Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 781: 지온 NEW-K콘텐츠 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20090005',
  '지온 NEW-K콘텐츠 투자조합',
  'VCS Registered Fund',
  25000000000,
  25000000000,
  '2022-09-02',
  'Active',
  '지온인베스트먼트',
  '{"문화 기타","문화"}',
  '{"fund_id":"AS20221018","registration_date":"2022-09-02","expiry_date":"2029-09-01","formation_total_amount":"250.0","investment_character_code":"24","industry_code":"6","investment_field_type":"문화","investment_field_detail_type":"문화 기타","mother_fund_id":"MF00000001","operator_company_id":"OP20090005","operator_company_name":"지온인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.197Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 782: 지역혁신워터이노베이션펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20170010',
  '지역혁신워터이노베이션펀드',
  'VCS Registered Fund',
  20000000000,
  20000000000,
  '2023-07-31',
  'Active',
  '라이트하우스컴바인인베스트',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20230658","registration_date":"2023-07-31","expiry_date":"2031-07-30","formation_total_amount":"200.0","investment_character_code":"28","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000016","operator_company_id":"OP20170010","operator_company_name":"라이트하우스컴바인인베스트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.197Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 783: 지역혁신 스마트시티 D3 벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20180011',
  '지역혁신 스마트시티 D3 벤처투자조합',
  'VCS Registered Fund',
  20000000000,
  20000000000,
  '2023-05-12',
  'Active',
  '디쓰리쥬빌리파트너스',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20230380","registration_date":"2023-05-12","expiry_date":"2031-05-11","formation_total_amount":"200.0","investment_character_code":"02","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000013","operator_company_id":"OP20180011","operator_company_name":"디쓰리쥬빌리파트너스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.197Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 784: 지역엔젤투자 재간접펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20000029',
  '지역엔젤투자 재간접펀드',
  'VCS Registered Fund',
  22800000000,
  22800000000,
  '2023-09-18',
  'Active',
  '한국벤처투자',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20230838","registration_date":"2023-09-18","expiry_date":"2035-09-17","formation_total_amount":"228.0","investment_character_code":"18","industry_code":"9","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20000029","operator_company_name":"한국벤처투자","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.197Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 785: 지앤텍프로젝트투자조합2호
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20000045',
  '지앤텍프로젝트투자조합2호',
  'VCS Registered Fund',
  9100000000,
  9100000000,
  '2024-07-05',
  'Active',
  '지앤텍벤처투자',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20240603","registration_date":"2024-07-05","expiry_date":"2029-07-04","formation_total_amount":"91.0","investment_character_code":"25","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20000045","operator_company_name":"지앤텍벤처투자","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.197Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 786: 지앤텍프로젝트투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20000045',
  '지앤텍프로젝트투자조합1호',
  'VCS Registered Fund',
  3720000000,
  3720000000,
  '2024-01-03',
  'Active',
  '지앤텍벤처투자',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20240009","registration_date":"2024-01-03","expiry_date":"2029-01-02","formation_total_amount":"37.2","investment_character_code":"30","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20000045","operator_company_name":"지앤텍벤처투자","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.197Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 787: 지앤텍스마트시티지역혁신펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20000045',
  '지앤텍스마트시티지역혁신펀드',
  'VCS Registered Fund',
  23000000000,
  23000000000,
  '2024-04-08',
  'Active',
  '지앤텍벤처투자',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20240279","registration_date":"2024-04-08","expiry_date":"2032-04-07","formation_total_amount":"230.0","investment_character_code":"18","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000013","operator_company_id":"OP20000045","operator_company_name":"지앤텍벤처투자","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.197Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 788: 지앤텍빅점프투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20000045',
  '지앤텍빅점프투자조합',
  'VCS Registered Fund',
  111200000000,
  111200000000,
  '2018-12-26',
  'Active',
  '지앤텍벤처투자',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20180367","registration_date":"2018-12-26","expiry_date":"2026-12-25","formation_total_amount":"1112.0","investment_character_code":"02","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20000045","operator_company_name":"지앤텍벤처투자","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.197Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 789: 지앤텍명장세컨더리2호투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20000045',
  '지앤텍명장세컨더리2호투자조합',
  'VCS Registered Fund',
  33500000000,
  33500000000,
  '2024-04-17',
  'Active',
  '지앤텍벤처투자',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20240312","registration_date":"2024-04-17","expiry_date":"2030-04-16","formation_total_amount":"335.0","investment_character_code":"16","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20000045","operator_company_name":"지앤텍벤처투자","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.197Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 790: 지앤텍3호벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20000045',
  '지앤텍3호벤처투자조합',
  'VCS Registered Fund',
  31000000000,
  31000000000,
  '2017-02-03',
  'Active',
  '지앤텍벤처투자',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20170018","registration_date":"2017-02-03","expiry_date":"2026-02-02","formation_total_amount":"310.0","investment_character_code":"01","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20000045","operator_company_name":"지앤텍벤처투자","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.197Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 791: 지스트롱(G-StRONG) 혁신창업펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20170046',
  '지스트롱(G-StRONG) 혁신창업펀드',
  'VCS Registered Fund',
  5010000000,
  5010000000,
  '2020-11-26',
  'Active',
  '시리즈벤처스',
  NULL,
  '{"fund_id":"AS20200693","registration_date":"2020-11-26","expiry_date":"2027-11-25","formation_total_amount":"50.1","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"MF00000001","operator_company_id":"OP20170046","operator_company_name":"시리즈벤처스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.197Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 792: 지스타트업(G-Startup) 대학창업 뉴딜펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20110011',
  '지스타트업(G-Startup) 대학창업 뉴딜펀드',
  'VCS Registered Fund',
  4000000000,
  4000000000,
  '2021-09-09',
  'Active',
  '전남대학교기술지주회사',
  NULL,
  '{"fund_id":"AS20210823","registration_date":"2021-09-09","expiry_date":"2029-09-08","formation_total_amount":"40.0","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"MF00000001","operator_company_id":"OP20110011","operator_company_name":"전남대학교기술지주회사","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.197Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 793: 지비-지에스(GB-GS)챌린지 유니버스 제1호 벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20140014',
  '지비-지에스(GB-GS)챌린지 유니버스 제1호 벤처투자조합',
  'VCS Registered Fund',
  6000000000,
  6000000000,
  '2024-07-09',
  'Active',
  '대경지역대학공동기술지주',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20240721","registration_date":"2024-07-09","expiry_date":"2034-07-08","formation_total_amount":"60.0","investment_character_code":"18","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20140014","operator_company_name":"대경지역대학공동기술지주","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.197Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 794: 지비 바이오투자조합 제1호
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20200392',
  '지비 바이오투자조합 제1호',
  'VCS Registered Fund',
  3400000000,
  3400000000,
  '2021-05-25',
  'Active',
  '지비벤처스',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20210419","registration_date":"2021-05-25","expiry_date":"2026-05-24","formation_total_amount":"34.0","investment_character_code":"25","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20200392","operator_company_name":"지비벤처스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.197Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 795: 지비 글로벌배터리 펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20200392',
  '지비 글로벌배터리 펀드',
  'VCS Registered Fund',
  5500000000,
  5500000000,
  '2023-10-18',
  'Active',
  '지비벤처스',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20230949","registration_date":"2023-10-18","expiry_date":"2028-10-17","formation_total_amount":"55.0","investment_character_code":"25","industry_code":"9","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20200392","operator_company_name":"지비벤처스","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.198Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 796: 지밸리-플래티넘청년창업펀드
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20000023',
  '지밸리-플래티넘청년창업펀드',
  'VCS Registered Fund',
  11100000000,
  11100000000,
  '2016-08-04',
  'Active',
  '플래티넘기술투자',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20160096","registration_date":"2016-08-04","expiry_date":"2025-08-03","formation_total_amount":"111.0","investment_character_code":"20","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20000023","operator_company_name":"플래티넘기술투자","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.198Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 797: 지란지교 투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20170039',
  '지란지교 투자조합 1호',
  'VCS Registered Fund',
  2120000000,
  2120000000,
  '2022-09-20',
  'Active',
  '프라이머시즌5',
  '{"중소/벤처일반","일반"}',
  '{"fund_id":"AS20221074","registration_date":"2022-09-20","expiry_date":"2029-09-19","formation_total_amount":"21.2","investment_character_code":"20","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20170039","operator_company_name":"프라이머시즌5","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.198Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 798: 지라이징(G-Rising) 개인투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20190227',
  '지라이징(G-Rising) 개인투자조합 1호',
  'VCS Registered Fund',
  100000000,
  100000000,
  '2020-07-08',
  'Active',
  '경북창조경제혁신센터',
  NULL,
  '{"fund_id":"AS20200305","registration_date":"2020-07-08","expiry_date":"2025-12-31","formation_total_amount":"1.0","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190227","operator_company_name":"경북창조경제혁신센터","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.198Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 799: 지담씨케이유 조합 1호
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20190366',
  '지담씨케이유 조합 1호',
  'VCS Registered Fund',
  100000000,
  100000000,
  '2022-01-19',
  'Active',
  '특허법인지담',
  NULL,
  '{"fund_id":"AS20211451","registration_date":"2022-01-19","expiry_date":"2027-01-18","formation_total_amount":"1.0","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190366","operator_company_name":"특허법인지담","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.198Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 800: 지노바 4호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, fund_type,
  commitment_amount, fund_size, establishment_date, fund_status,
  representative, investment_focus, fund_details, apify_source
) VALUES (
  'OP20210102',
  '지노바 4호 투자조합',
  'VCS Registered Fund',
  2220000000,
  2220000000,
  '2025-03-18',
  'Active',
  '지노바인베스트먼트',
  '{"일반 기타","일반"}',
  '{"fund_id":"AS20250198","registration_date":"2025-03-18","expiry_date":"2030-03-17","formation_total_amount":"22.2","investment_character_code":"25","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"일반 기타","mother_fund_id":"","operator_company_id":"OP20210102","operator_company_name":"지노바인베스트먼트","source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:34:30.198Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  fund_type = EXCLUDED.fund_type,
  commitment_amount = EXCLUDED.commitment_amount,
  fund_size = EXCLUDED.fund_size,
  establishment_date = EXCLUDED.establishment_date,
  fund_status = EXCLUDED.fund_status,
  representative = EXCLUDED.representative,
  investment_focus = EXCLUDED.investment_focus,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Corrected Batch 16 completed! 50 fund records processed.
-- Progress: 800/3689 total records

