-- VCS Fund MINIMAL UPSERT Batch 56/74 (Records 2751-2800)
-- MINIMAL: Only using basic columns that definitely exist
-- Generated from VCS API Scraper fund data
-- Generated at: 2025-06-05T00:40:21.960Z
-- Schema: Minimal fund_table structure (basic columns only)

-- MINIMAL FUND DATA (UPSERT - Safe for Duplicates)
-- Processing 50 fund records
-- Will INSERT new records or UPDATE existing ones

-- Record 2751: 미리어드-아벨로스 바이오 투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210268',
  '미리어드-아벨로스 바이오 투자조합 1호',
  900000000,
  '2021-12-22',
  '{"fund_id":"AS20211370","registration_date":"2021-12-22","expiry_date":"2027-12-21","formation_total_amount":"9.0","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20210268","operator_company_name":"미리어드파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"미리어드파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.960Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2752: 미리어드-새로젠 바이오 투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210268',
  '미리어드-새로젠 바이오 투자조합 1호',
  380000000,
  '2024-12-06',
  '{"fund_id":"AS20241191","registration_date":"2024-12-06","expiry_date":"2030-12-05","formation_total_amount":"3.8","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20210268","operator_company_name":"미리어드파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"미리어드파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.960Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2753: 미리어드-메디치바이오 투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210268',
  '미리어드-메디치바이오 투자조합 1호',
  790000000,
  '2022-05-06',
  '{"fund_id":"AS20220464","registration_date":"2022-05-06","expiry_date":"2027-05-05","formation_total_amount":"7.9","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20210268","operator_company_name":"미리어드파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"미리어드파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.960Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2754: 미리어드 바이오 퀀텀리프 펀드 1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210268',
  '미리어드 바이오 퀀텀리프 펀드 1호',
  3000000000,
  '2022-10-06',
  '{"fund_id":"AS20221154","registration_date":"2022-10-06","expiry_date":"2027-10-05","formation_total_amount":"30.0","investment_character_code":"20","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20210268","operator_company_name":"미리어드파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"미리어드파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.960Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2755: 미래푸드테크 개인투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20140013',
  '미래푸드테크 개인투자조합1호',
  110000000,
  '2021-05-31',
  '{"fund_id":"AS20210383","registration_date":"2021-05-31","expiry_date":"2026-07-30","formation_total_amount":"1.1","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20140013","operator_company_name":"더인벤션랩","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"더인벤션랩","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.960Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2756: 미래창조 티에스 M&A7호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20080008',
  '미래창조 티에스 M&A7호 투자조합',
  45300000000,
  '2014-01-29',
  '{"fund_id":"AS20140092","registration_date":"2014-01-29","expiry_date":"2026-01-28","formation_total_amount":"453.0","investment_character_code":"17","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20080008","operator_company_name":"티에스인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"티에스인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.960Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2757: 미래창조 알파 스타트업 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20000027',
  '미래창조 알파 스타트업 투자조합',
  27000000000,
  '2014-01-14',
  '{"fund_id":"AS20140080","registration_date":"2014-01-14","expiry_date":"2026-01-13","formation_total_amount":"270.0","investment_character_code":"20","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20000027","operator_company_name":"에스비브이에이","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"에스비브이에이","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.960Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2758: 미래창조 다우키움시너지 M&A 세컨더리 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19990010',
  '미래창조 다우키움시너지 M&A 세컨더리 투자조합',
  45000000000,
  '2014-01-03',
  '{"fund_id":"AS20140010","registration_date":"2014-01-03","expiry_date":"2025-06-30","formation_total_amount":"450.0","investment_character_code":"17","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP19990010","operator_company_name":"키움인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"키움인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.960Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2759: 미래창조 네오플럭스 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20000041',
  '미래창조 네오플럭스 투자조합',
  72000000000,
  '2014-03-06',
  '{"fund_id":"AS20140068","registration_date":"2014-03-06","expiry_date":"2026-03-05","formation_total_amount":"720.0","investment_character_code":"01","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20000041","operator_company_name":"신한벤처투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"신한벤처투자","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.960Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2760: 미래지주-IBKVC 딥테크 제1호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20240307',
  '미래지주-IBKVC 딥테크 제1호 투자조합',
  11000000000,
  '2025-02-20',
  '{"fund_id":"AS20250129","registration_date":"2025-02-20","expiry_date":"2033-02-19","formation_total_amount":"110.0","investment_character_code":"10","industry_code":"9","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20240307","operator_company_name":"아이비케이벤처투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"아이비케이벤처투자","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.960Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2761: 미래지주 창업투자 제5호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20140015',
  '미래지주 창업투자 제5호 개인투자조합',
  4600000000,
  '2023-11-16',
  '{"fund_id":"AS20230985","registration_date":"2023-11-16","expiry_date":"2033-11-15","formation_total_amount":"46.0","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"MF00000001","operator_company_id":"OP20140015","operator_company_name":"미래과학기술지주","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"미래과학기술지주","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.960Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2762: 미래지주 창업투자 제4호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20140015',
  '미래지주 창업투자 제4호 개인투자조합',
  6000000000,
  '2020-09-08',
  '{"fund_id":"AS20200470","registration_date":"2020-09-08","expiry_date":"2028-09-07","formation_total_amount":"60.0","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"MF00000001","operator_company_id":"OP20140015","operator_company_name":"미래과학기술지주","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"미래과학기술지주","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.960Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2763: 미래지주 창업투자 제3호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20140015',
  '미래지주 창업투자 제3호 개인투자조합',
  5000000000,
  '2020-07-14',
  '{"fund_id":"AS20200326","registration_date":"2020-07-14","expiry_date":"2030-07-13","formation_total_amount":"50.0","investment_character_code":"","industry_code":"3","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"MF00000001","operator_company_id":"OP20140015","operator_company_name":"미래과학기술지주","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"미래과학기술지주","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.960Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2764: 미래지주 창업투자 제2호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20140015',
  '미래지주 창업투자 제2호 개인투자조합',
  7000000000,
  '2019-11-25',
  '{"fund_id":"AS20190522","registration_date":"2019-11-25","expiry_date":"2027-11-24","formation_total_amount":"70.0","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"MF00000001","operator_company_id":"OP20140015","operator_company_name":"미래과학기술지주","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"미래과학기술지주","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.960Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2765: 미래지주 지역 AC 세컨더리 제1호 벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20140015',
  '미래지주 지역 AC 세컨더리 제1호 벤처투자조합',
  8500000000,
  '2024-07-16',
  '{"fund_id":"AS20240656","registration_date":"2024-07-16","expiry_date":"2032-07-15","formation_total_amount":"85.0","investment_character_code":"18","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20140015","operator_company_name":"미래과학기술지주","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"미래과학기술지주","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.960Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2766: 미래의료과학 G1 제1호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20170030',
  '미래의료과학 G1 제1호 개인투자조합',
  460000000,
  '2022-04-26',
  '{"fund_id":"AS20220414","registration_date":"2022-04-26","expiry_date":"2028-04-25","formation_total_amount":"4.6","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20170030","operator_company_name":"특허법인지원","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"특허법인지원","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.960Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2767: 미래에셋-플럭스 핀테크 혁신 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19990017',
  '미래에셋-플럭스 핀테크 혁신 투자조합',
  30000000000,
  '2022-11-10',
  '{"fund_id":"AS20221286","registration_date":"2022-11-10","expiry_date":"2030-11-09","formation_total_amount":"300.0","investment_character_code":"06","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP19990017","operator_company_name":"미래에셋벤처투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"미래에셋벤처투자","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.960Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2768: 미래에셋-그린프로그 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19990017',
  '미래에셋-그린프로그 투자조합',
  10000000000,
  '2019-05-15',
  '{"fund_id":"AS20190205","registration_date":"2019-05-15","expiry_date":"2026-05-14","formation_total_amount":"100.0","investment_character_code":"01","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP19990017","operator_company_name":"미래에셋벤처투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"미래에셋벤처투자","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.960Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2769: 미래에셋 하이테크 프론티어 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19990017',
  '미래에셋 하이테크 프론티어 투자조합',
  25000000000,
  '2017-09-19',
  '{"fund_id":"AS20170109","registration_date":"2017-09-19","expiry_date":"2025-09-18","formation_total_amount":"250.0","investment_character_code":"20","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP19990017","operator_company_name":"미래에셋벤처투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"미래에셋벤처투자","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.960Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2770: 미래에셋 콘텐츠판다 iMBC 콘텐츠 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19990017',
  '미래에셋 콘텐츠판다 iMBC 콘텐츠 투자조합',
  2050000000,
  '2018-08-16',
  '{"fund_id":"AS20180204","registration_date":"2018-08-16","expiry_date":"2025-08-15","formation_total_amount":"20.5","investment_character_code":"01","industry_code":"6","investment_field_type":"문화","investment_field_detail_type":"문화 기타","mother_fund_id":"","operator_company_id":"OP19990017","operator_company_name":"미래에셋벤처투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"미래에셋벤처투자","investment_focus":["문화 기타","문화"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.960Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2771: 미래에셋 청년창업 투자조합 3호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19990017',
  '미래에셋 청년창업 투자조합 3호',
  20000000000,
  '2018-11-20',
  '{"fund_id":"AS20180346","registration_date":"2018-11-20","expiry_date":"2026-11-19","formation_total_amount":"200.0","investment_character_code":"21","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP19990017","operator_company_name":"미래에셋벤처투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"미래에셋벤처투자","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.960Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2772: 미래에셋 청년창업 투자조합 2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19990017',
  '미래에셋 청년창업 투자조합 2호',
  25000000000,
  '2017-12-28',
  '{"fund_id":"AS20180031","registration_date":"2017-12-28","expiry_date":"2025-12-27","formation_total_amount":"250.0","investment_character_code":"21","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP19990017","operator_company_name":"미래에셋벤처투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"미래에셋벤처투자","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.960Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2773: 미래에셋 좋은기업 세컨더리 투자조합 2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19990017',
  '미래에셋 좋은기업 세컨더리 투자조합 2호',
  20000000000,
  '2016-07-13',
  '{"fund_id":"AS20160082","registration_date":"2016-07-13","expiry_date":"2025-07-12","formation_total_amount":"200.0","investment_character_code":"16","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP19990017","operator_company_name":"미래에셋벤처투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"미래에셋벤처투자","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.960Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2774: 미래에셋 이마트 신성장투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19990017',
  '미래에셋 이마트 신성장투자조합 1호',
  100000000000,
  '2022-08-31',
  '{"fund_id":"AS20221006","registration_date":"2022-08-31","expiry_date":"2032-08-30","formation_total_amount":"1000.0","investment_character_code":"02","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP19990017","operator_company_name":"미래에셋벤처투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"미래에셋벤처투자","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.960Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2775: 미래에셋 신성장 좋은기업 투자조합 21-1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19990017',
  '미래에셋 신성장 좋은기업 투자조합 21-1호',
  30000000000,
  '2021-06-04',
  '{"fund_id":"AS20210453","registration_date":"2021-06-04","expiry_date":"2028-06-03","formation_total_amount":"300.0","investment_character_code":"01","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP19990017","operator_company_name":"미래에셋벤처투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"미래에셋벤처투자","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.960Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2776: 미래에셋 신성장 좋은기업 투자조합 19-2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19990017',
  '미래에셋 신성장 좋은기업 투자조합 19-2호',
  18000000000,
  '2019-11-15',
  '{"fund_id":"AS20190531","registration_date":"2019-11-15","expiry_date":"2026-11-14","formation_total_amount":"180.0","investment_character_code":"01","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP19990017","operator_company_name":"미래에셋벤처투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"미래에셋벤처투자","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.960Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2777: 미래에셋 신성장 좋은기업 투자조합 19-1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19990017',
  '미래에셋 신성장 좋은기업 투자조합 19-1호',
  22000000000,
  '2019-03-29',
  '{"fund_id":"AS20190146","registration_date":"2019-03-29","expiry_date":"2026-03-28","formation_total_amount":"220.0","investment_character_code":"01","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP19990017","operator_company_name":"미래에셋벤처투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"미래에셋벤처투자","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.960Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2778: 미래에셋 신성장 좋은기업 투자조합 17-1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19990017',
  '미래에셋 신성장 좋은기업 투자조합 17-1호',
  16500000000,
  '2017-05-12',
  '{"fund_id":"AS20170043","registration_date":"2017-05-12","expiry_date":"2026-05-11","formation_total_amount":"165.0","investment_character_code":"01","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP19990017","operator_company_name":"미래에셋벤처투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"미래에셋벤처투자","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.960Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2779: 미래에셋 신성장 좋은기업 투자조합 16-1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19990017',
  '미래에셋 신성장 좋은기업 투자조합 16-1호',
  14000000000,
  '2016-12-15',
  '{"fund_id":"AS20160222","registration_date":"2016-12-15","expiry_date":"2025-12-14","formation_total_amount":"140.0","investment_character_code":"01","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP19990017","operator_company_name":"미래에셋벤처투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"미래에셋벤처투자","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.960Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2780: 미래에셋 세이지 투자조합 2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19990017',
  '미래에셋 세이지 투자조합 2호',
  211160000000,
  '2021-12-07',
  '{"fund_id":"AS20211236","registration_date":"2021-12-07","expiry_date":"2029-12-06","formation_total_amount":"2111.6","investment_character_code":"02","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP19990017","operator_company_name":"미래에셋벤처투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"미래에셋벤처투자","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.960Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2781: 미래에셋 바이오 프론티어 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19990017',
  '미래에셋 바이오 프론티어 투자조합',
  45050000000,
  '2022-03-03',
  '{"fund_id":"AS20220221","registration_date":"2022-03-03","expiry_date":"2029-03-02","formation_total_amount":"450.5","investment_character_code":"02","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP19990017","operator_company_name":"미래에셋벤처투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"미래에셋벤처투자","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.960Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2782: 미래에셋 데모테크 프론티어 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19990017',
  '미래에셋 데모테크 프론티어 투자조합',
  123000000000,
  '2022-11-16',
  '{"fund_id":"AS20221306","registration_date":"2022-11-16","expiry_date":"2030-11-15","formation_total_amount":"1230.0","investment_character_code":"02","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP19990017","operator_company_name":"미래에셋벤처투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"미래에셋벤처투자","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.960Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2783: 미래에셋 넥스트 코리아 지능정보 벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19990017',
  '미래에셋 넥스트 코리아 지능정보 벤처투자조합',
  100000000000,
  '2019-12-30',
  '{"fund_id":"AS20200035","registration_date":"2019-12-30","expiry_date":"2027-12-29","formation_total_amount":"1000.0","investment_character_code":"02","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP19990017","operator_company_name":"미래에셋벤처투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"미래에셋벤처투자","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.960Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2784: 미래에셋 글로벌 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19990017',
  '미래에셋 글로벌 투자조합',
  40000000000,
  '2015-07-10',
  '{"fund_id":"AS20150099","registration_date":"2015-07-10","expiry_date":"2025-07-09","formation_total_amount":"400.0","investment_character_code":"15","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP19990017","operator_company_name":"미래에셋벤처투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"미래에셋벤처투자","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.960Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2785: 미래에셋 글로벌 유니콘 투자조합 2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19990017',
  '미래에셋 글로벌 유니콘 투자조합 2호',
  22000000000,
  '2022-01-27',
  '{"fund_id":"AS20220099","registration_date":"2022-01-27","expiry_date":"2027-01-26","formation_total_amount":"220.0","investment_character_code":"02","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP19990017","operator_company_name":"미래에셋벤처투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"미래에셋벤처투자","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.960Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2786: 미래에셋 글로벌 유니콘 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19990017',
  '미래에셋 글로벌 유니콘 투자조합',
  24200000000,
  '2021-07-21',
  '{"fund_id":"AS20210620","registration_date":"2021-07-21","expiry_date":"2026-07-20","formation_total_amount":"242.0","investment_character_code":"01","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP19990017","operator_company_name":"미래에셋벤처투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"미래에셋벤처투자","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.960Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2787: 미래에셋 글로벌 유니콘 벤처투자조합 6호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19990017',
  '미래에셋 글로벌 유니콘 벤처투자조합 6호',
  3900000000,
  '2024-05-22',
  '{"fund_id":"AS20240445","registration_date":"2024-05-22","expiry_date":"2029-05-21","formation_total_amount":"39.0","investment_character_code":"28","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP19990017","operator_company_name":"미래에셋벤처투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"미래에셋벤처투자","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.960Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2788: 미래에셋 글로벌 유니콘 벤처투자조합 5호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19990017',
  '미래에셋 글로벌 유니콘 벤처투자조합 5호',
  36000000000,
  '2022-10-06',
  '{"fund_id":"AS20221151","registration_date":"2022-10-06","expiry_date":"2027-10-05","formation_total_amount":"360.0","investment_character_code":"16","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP19990017","operator_company_name":"미래에셋벤처투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"미래에셋벤처투자","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.960Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2789: 미래에셋 글로벌 유니콘 벤처투자조합 4호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19990017',
  '미래에셋 글로벌 유니콘 벤처투자조합 4호',
  5500000000,
  '2022-03-24',
  '{"fund_id":"AS20220335","registration_date":"2022-03-24","expiry_date":"2027-03-23","formation_total_amount":"55.0","investment_character_code":"02","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP19990017","operator_company_name":"미래에셋벤처투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"미래에셋벤처투자","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.960Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2790: 미래에셋 글로벌 유니콘 벤처투자조합 3호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19990017',
  '미래에셋 글로벌 유니콘 벤처투자조합 3호',
  28000000000,
  '2022-03-08',
  '{"fund_id":"AS20220260","registration_date":"2022-03-08","expiry_date":"2027-03-07","formation_total_amount":"280.0","investment_character_code":"02","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP19990017","operator_company_name":"미래에셋벤처투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"미래에셋벤처투자","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.960Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2791: 미래에셋 Next Revolution 투자조합 2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19990017',
  '미래에셋 Next Revolution 투자조합 2호',
  11600000000,
  '2021-12-16',
  '{"fund_id":"AS20211314","registration_date":"2021-12-16","expiry_date":"2026-12-15","formation_total_amount":"116.0","investment_character_code":"25","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP19990017","operator_company_name":"미래에셋벤처투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"미래에셋벤처투자","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.960Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2792: 미래에셋 Next Revolution 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19990017',
  '미래에셋 Next Revolution 투자조합',
  20000000000,
  '2021-12-16',
  '{"fund_id":"AS20211313","registration_date":"2021-12-16","expiry_date":"2026-12-15","formation_total_amount":"200.0","investment_character_code":"25","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP19990017","operator_company_name":"미래에셋벤처투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"미래에셋벤처투자","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.960Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2793: 미래에셋 Innovative Growth 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19990017',
  '미래에셋 Innovative Growth 투자조합',
  80100000000,
  '2020-11-12',
  '{"fund_id":"AS20200653","registration_date":"2020-11-12","expiry_date":"2028-11-11","formation_total_amount":"801.0","investment_character_code":"02","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP19990017","operator_company_name":"미래에셋벤처투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"미래에셋벤처투자","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.960Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2794: 미래에셋 AI 프론티어 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19990017',
  '미래에셋 AI 프론티어 투자조합',
  110000000000,
  '2025-01-10',
  '{"fund_id":"AS20250035","registration_date":"2025-01-10","expiry_date":"2035-01-09","formation_total_amount":"1100.0","investment_character_code":"28","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP19990017","operator_company_name":"미래에셋벤처투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"미래에셋벤처투자","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.960Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2795: 미래에그리테크 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20140013',
  '미래에그리테크 개인투자조합',
  210000000,
  '2020-12-03',
  '{"fund_id":"AS20200715","registration_date":"2020-12-03","expiry_date":"2025-12-30","formation_total_amount":"2.1","investment_character_code":"","industry_code":"3","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20140013","operator_company_name":"더인벤션랩","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"더인벤션랩","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.960Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2796: 미래-과기특성화대학 창업투자 제1호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20140015',
  '미래-과기특성화대학 창업투자 제1호 개인투자조합',
  6750000000,
  '2018-07-23',
  '{"fund_id":"AS20180187","registration_date":"2018-07-23","expiry_date":"2028-07-22","formation_total_amount":"67.5","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"MF00000001","operator_company_id":"OP20140015","operator_company_name":"미래과학기술지주","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"미래과학기술지주","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.960Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2797: 미래 유니콘 투자조합 제1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190387',
  '미래 유니콘 투자조합 제1호',
  200000000,
  '2020-10-07',
  '{"fund_id":"AS20200556","registration_date":"2020-10-07","expiry_date":"2025-10-06","formation_total_amount":"2.0","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190387","operator_company_name":"광운대학교산학협력단","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"광운대학교산학협력단","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.960Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2798: 미래 ESV 개인투자조합 제1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20110010',
  '미래 ESV 개인투자조합 제1호',
  12500000000,
  '2019-01-03',
  '{"fund_id":"AS20190023","registration_date":"2019-01-03","expiry_date":"2027-01-02","formation_total_amount":"125.0","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"MF00000001","operator_company_id":"OP20110010","operator_company_name":"전북지역대학연합기술지주","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"전북지역대학연합기술지주","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.960Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2799: 뮤어우즈-더웰스 바이오신성장투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20160007',
  '뮤어우즈-더웰스 바이오신성장투자조합',
  3850000000,
  '2019-07-02',
  '{"fund_id":"AS20190296","registration_date":"2019-07-02","expiry_date":"2026-07-01","formation_total_amount":"38.5","investment_character_code":"25","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"바이오","mother_fund_id":"","operator_company_id":"OP20160007","operator_company_name":"더웰스인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"더웰스인베스트먼트","investment_focus":["바이오","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.961Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 2800: 뮤어우즈 에어 모빌리티 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200321',
  '뮤어우즈 에어 모빌리티 투자조합',
  2020000000,
  '2023-09-14',
  '{"fund_id":"AS20230825","registration_date":"2023-09-14","expiry_date":"2030-09-13","formation_total_amount":"20.2","investment_character_code":"15","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20200321","operator_company_name":"뮤어우즈벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"뮤어우즈벤처스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.961Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Minimal Batch 56 completed! 50 fund records processed.
-- Progress: 2800/3689 total records

