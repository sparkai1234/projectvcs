-- VCS Fund MINIMAL UPSERT Batch 20/74 (Records 951-1000)
-- MINIMAL: Only using basic columns that definitely exist
-- Generated from VCS API Scraper fund data
-- Generated at: 2025-06-05T00:40:21.790Z
-- Schema: Minimal fund_table structure (basic columns only)

-- MINIMAL FUND DATA (UPSERT - Safe for Duplicates)
-- Processing 50 fund records
-- Will INSERT new records or UPDATE existing ones

-- Record 951: 일신 뉴코리안웨이브 2호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19900005',
  '일신 뉴코리안웨이브 2호 투자조합',
  15100000000,
  '2018-01-08',
  '{"fund_id":"AS20180070","registration_date":"2018-01-08","expiry_date":"2026-01-07","formation_total_amount":"151.0","investment_character_code":"24","industry_code":"6","investment_field_type":"문화","investment_field_detail_type":"영상(영화+드라마+애니메이션)","mother_fund_id":"MF00000001","operator_company_id":"OP19900005","operator_company_name":"일신창업투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"일신창업투자","investment_focus":["영상(영화+드라마+애니메이션)","문화"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.790Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 952: 일신 뉴어드벤쳐 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19900005',
  '일신 뉴어드벤쳐 투자조합',
  30000000000,
  '2022-10-05',
  '{"fund_id":"AS20221143","registration_date":"2022-10-05","expiry_date":"2030-10-04","formation_total_amount":"300.0","investment_character_code":"24","industry_code":"6","investment_field_type":"문화","investment_field_detail_type":"영상(영화+드라마+애니메이션)","mother_fund_id":"MF00000001","operator_company_id":"OP19900005","operator_company_name":"일신창업투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"일신창업투자","investment_focus":["영상(영화+드라마+애니메이션)","문화"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.790Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 953: 일신 뉴어드벤쳐 2호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19900005',
  '일신 뉴어드벤쳐 2호 투자조합',
  37500000000,
  '2024-11-22',
  '{"fund_id":"AS20241188","registration_date":"2024-11-22","expiry_date":"2032-11-21","formation_total_amount":"375.0","investment_character_code":"24","industry_code":"6","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP19900005","operator_company_name":"일신창업투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"일신창업투자","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.790Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 954: 일상의감동 개인투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20220313',
  '일상의감동 개인투자조합 1호',
  900000000,
  '2023-07-06',
  '{"fund_id":"AS20230554","registration_date":"2023-07-06","expiry_date":"2028-07-05","formation_total_amount":"9.0","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20220313","operator_company_name":"핼리스톤벤처스 주식회사","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"핼리스톤벤처스 주식회사","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.790Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 955: 인하비룡ㆍ인천창조 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20150032',
  '인하비룡ㆍ인천창조 투자조합',
  630000000,
  '2023-02-02',
  '{"fund_id":"AS20230058","registration_date":"2023-02-02","expiry_date":"2030-02-01","formation_total_amount":"6.3","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20150032","operator_company_name":"인천창조경제혁신센터","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"인천창조경제혁신센터","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.790Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 956: 인하 비룡 개인투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20180036',
  '인하 비룡 개인투자조합 1호',
  200000000,
  '2021-01-20',
  '{"fund_id":"AS20210052","registration_date":"2021-01-20","expiry_date":"2026-03-31","formation_total_amount":"2.0","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20180036","operator_company_name":"아이스타트업랩","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"아이스타트업랩","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.790Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 957: 인피니툼스포츠4호딥테크펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200206',
  '인피니툼스포츠4호딥테크펀드',
  12000000000,
  '2025-02-26',
  '{"fund_id":"AS20250148","registration_date":"2025-02-26","expiry_date":"2030-02-25","formation_total_amount":"120.0","investment_character_code":"17","industry_code":"7","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20200206","operator_company_name":"인피니툼파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"인피니툼파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.790Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 958: 인피니툼스포츠3호펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200206',
  '인피니툼스포츠3호펀드',
  18400000000,
  '2023-11-15',
  '{"fund_id":"AS20231082","registration_date":"2023-11-15","expiry_date":"2031-11-14","formation_total_amount":"184.0","investment_character_code":"07","industry_code":"9","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20200206","operator_company_name":"인피니툼파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"인피니툼파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.790Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 959: 인피니툼스포츠2호펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200206',
  '인피니툼스포츠2호펀드',
  18500000000,
  '2021-10-14',
  '{"fund_id":"AS20210983","registration_date":"2021-10-14","expiry_date":"2029-10-13","formation_total_amount":"185.0","investment_character_code":"07","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20200206","operator_company_name":"인피니툼파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"인피니툼파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.790Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 960: 인피니툼스포츠1호펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200206',
  '인피니툼스포츠1호펀드',
  14300000000,
  '2020-12-24',
  '{"fund_id":"AS20200839","registration_date":"2020-12-24","expiry_date":"2028-12-23","formation_total_amount":"143.0","investment_character_code":"07","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20200206","operator_company_name":"인피니툼파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"인피니툼파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.790Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 961: 인피니툼라이프스타일3호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200206',
  '인피니툼라이프스타일3호',
  2530000000,
  '2022-05-18',
  '{"fund_id":"AS20220548","registration_date":"2022-05-18","expiry_date":"2027-05-17","formation_total_amount":"25.3","investment_character_code":"07","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20200206","operator_company_name":"인피니툼파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"인피니툼파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.790Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 962: 인피니툼관광혁신1호펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200206',
  '인피니툼관광혁신1호펀드',
  21500000000,
  '2023-11-10',
  '{"fund_id":"AS20231067","registration_date":"2023-11-10","expiry_date":"2031-11-09","formation_total_amount":"215.0","investment_character_code":"10","industry_code":"7","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20200206","operator_company_name":"인피니툼파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"인피니툼파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.790Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 963: 인피니툼-DSNP라이프스타일2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200206',
  '인피니툼-DSNP라이프스타일2호',
  2000000000,
  '2023-07-31',
  '{"fund_id":"AS20230656","registration_date":"2023-07-31","expiry_date":"2028-07-30","formation_total_amount":"20.0","investment_character_code":"25","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20200206","operator_company_name":"인피니툼파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"인피니툼파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.790Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 964: 인피니툼-DSNP라이프스타일1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200206',
  '인피니툼-DSNP라이프스타일1호',
  3000000000,
  '2022-04-18',
  '{"fund_id":"AS20220430","registration_date":"2022-04-18","expiry_date":"2027-04-17","formation_total_amount":"30.0","investment_character_code":"02","industry_code":"9","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20200206","operator_company_name":"인피니툼파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"인피니툼파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.790Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 965: 인프라 뉴딜 조합 1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20180065',
  '인프라 뉴딜 조합 1호',
  110000000,
  '2021-07-14',
  '{"fund_id":"AS20210564","registration_date":"2021-07-14","expiry_date":"2028-03-31","formation_total_amount":"1.1","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20180065","operator_company_name":"엔피프틴파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"엔피프틴파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.790Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 966: 인포뱅크-서울바이오허브 메디컬 개인투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19950002',
  '인포뱅크-서울바이오허브 메디컬 개인투자조합 1호',
  1400000000,
  '2024-08-01',
  '{"fund_id":"AS20240695","registration_date":"2024-08-01","expiry_date":"2031-07-31","formation_total_amount":"14.0","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP19950002","operator_company_name":"인포뱅크","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"인포뱅크","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.790Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 967: 인포뱅크-대구창조경제혁신센터 개인투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19950002',
  '인포뱅크-대구창조경제혁신센터 개인투자조합 1호',
  9400000000,
  '2023-12-13',
  '{"fund_id":"AS20231183","registration_date":"2023-12-13","expiry_date":"2030-12-12","formation_total_amount":"94.0","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"MF00000021","operator_company_id":"OP19950002","operator_company_name":"인포뱅크","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"인포뱅크","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.790Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 968: 인포뱅크 핀테크혁신펀드 1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19950002',
  '인포뱅크 핀테크혁신펀드 1호',
  10000000000,
  '2022-06-07',
  '{"fund_id":"AS20220637","registration_date":"2022-06-07","expiry_date":"2029-06-06","formation_total_amount":"100.0","investment_character_code":"20","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP19950002","operator_company_name":"인포뱅크","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"인포뱅크","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.790Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 969: 인포뱅크 창업초기 혁신펀드 1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19950002',
  '인포뱅크 창업초기 혁신펀드 1호',
  17500000000,
  '2022-08-08',
  '{"fund_id":"AS20220914","registration_date":"2022-08-08","expiry_date":"2029-08-07","formation_total_amount":"175.0","investment_character_code":"20","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP19950002","operator_company_name":"인포뱅크","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"인포뱅크","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.790Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 970: 인포뱅크 벤처이노베이션 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19950002',
  '인포뱅크 벤처이노베이션 개인투자조합',
  1010000000,
  '2022-10-14',
  '{"fund_id":"AS20221123","registration_date":"2022-10-14","expiry_date":"2029-10-13","formation_total_amount":"10.1","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP19950002","operator_company_name":"인포뱅크","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"인포뱅크","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.790Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 971: 인포뱅크 바이오 개인투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19950002',
  '인포뱅크 바이오 개인투자조합 1호',
  850000000,
  '2021-05-25',
  '{"fund_id":"AS20210380","registration_date":"2021-05-25","expiry_date":"2028-05-24","formation_total_amount":"8.5","investment_character_code":"","industry_code":"4","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP19950002","operator_company_name":"인포뱅크","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"인포뱅크","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.790Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 972: 인포뱅크 미래환경 혁신기술 펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19950002',
  '인포뱅크 미래환경 혁신기술 펀드',
  5000000000,
  '2024-08-30',
  '{"fund_id":"AS20240849","registration_date":"2024-08-30","expiry_date":"2031-08-29","formation_total_amount":"50.0","investment_character_code":"05","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP19950002","operator_company_name":"인포뱅크","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"인포뱅크","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.790Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 973: 인포뱅크 메타버스 개인투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19950002',
  '인포뱅크 메타버스 개인투자조합 1호',
  900000000,
  '2022-06-27',
  '{"fund_id":"AS20220656","registration_date":"2022-06-27","expiry_date":"2027-06-26","formation_total_amount":"9.0","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP19950002","operator_company_name":"인포뱅크","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"인포뱅크","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.790Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 974: 인포뱅크 개인투자조합 3호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19950002',
  '인포뱅크 개인투자조합 3호',
  7000000000,
  '2021-08-27',
  '{"fund_id":"AS20210772","registration_date":"2021-08-27","expiry_date":"2028-08-27","formation_total_amount":"70.0","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"MF00000001","operator_company_id":"OP19950002","operator_company_name":"인포뱅크","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"인포뱅크","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.790Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 975: 인포뱅크 개인투자조합 2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19950002',
  '인포뱅크 개인투자조합 2호',
  6000000000,
  '2020-05-26',
  '{"fund_id":"AS20200218","registration_date":"2020-05-26","expiry_date":"2027-05-25","formation_total_amount":"60.0","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"MF00000001","operator_company_id":"OP19950002","operator_company_name":"인포뱅크","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"인포뱅크","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.791Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 976: 인포뱅크 개인투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19950002',
  '인포뱅크 개인투자조합 1호',
  5000000000,
  '2019-08-13',
  '{"fund_id":"AS20190350","registration_date":"2019-08-13","expiry_date":"2026-08-11","formation_total_amount":"50.0","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"MF00000008","operator_company_id":"OP19950002","operator_company_name":"인포뱅크","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"인포뱅크","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.791Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 977: 인포뱅크 SPAC 개인투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19950002',
  '인포뱅크 SPAC 개인투자조합 1호',
  1370000000,
  '2022-05-13',
  '{"fund_id":"AS20220514","registration_date":"2022-05-13","expiry_date":"2027-05-12","formation_total_amount":"13.7","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP19950002","operator_company_name":"인포뱅크","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"인포뱅크","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.791Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 978: 인포뱅크 iAccel 개인투자조합 5호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19950002',
  '인포뱅크 iAccel 개인투자조합 5호',
  1020000000,
  '2024-12-11',
  '{"fund_id":"AS20241269","registration_date":"2024-12-11","expiry_date":"2031-12-10","formation_total_amount":"10.2","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP19950002","operator_company_name":"인포뱅크","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"인포뱅크","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.791Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 979: 인포뱅크 iAccel 개인투자조합 4호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19950002',
  '인포뱅크 iAccel 개인투자조합 4호',
  540000000,
  '2023-07-18',
  '{"fund_id":"AS20230582","registration_date":"2023-07-18","expiry_date":"2028-07-17","formation_total_amount":"5.4","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP19950002","operator_company_name":"인포뱅크","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"인포뱅크","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.791Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 980: 인포뱅크 iAccel 개인투자조합 3호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19950002',
  '인포뱅크 iAccel 개인투자조합 3호',
  400000000,
  '2023-04-11',
  '{"fund_id":"AS20230245","registration_date":"2023-04-11","expiry_date":"2028-04-10","formation_total_amount":"4.0","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP19950002","operator_company_name":"인포뱅크","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"인포뱅크","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.791Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 981: 인포뱅크 iAccel 개인투자조합 2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19950002',
  '인포뱅크 iAccel 개인투자조합 2호',
  880000000,
  '2022-10-21',
  '{"fund_id":"AS20221092","registration_date":"2022-10-21","expiry_date":"2027-10-20","formation_total_amount":"8.8","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP19950002","operator_company_name":"인포뱅크","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"인포뱅크","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.791Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 982: 인포뱅크 iAccel 개인투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19950002',
  '인포뱅크 iAccel 개인투자조합 1호',
  1990000000,
  '2022-03-04',
  '{"fund_id":"AS20220207","registration_date":"2022-03-04","expiry_date":"2028-03-03","formation_total_amount":"19.9","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP19950002","operator_company_name":"인포뱅크","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"인포뱅크","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.791Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 983: 인포뱅크 ESG 개인투자조합 1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19950002',
  '인포뱅크 ESG 개인투자조합 1호',
  1300000000,
  '2021-10-18',
  '{"fund_id":"AS20210981","registration_date":"2021-10-18","expiry_date":"2026-10-17","formation_total_amount":"13.0","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP19950002","operator_company_name":"인포뱅크","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"인포뱅크","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.791Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 984: 인트윈 로켓 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20210573',
  '인트윈 로켓 투자조합',
  200000000,
  '2022-12-28',
  '{"fund_id":"AS20221534","registration_date":"2022-12-28","expiry_date":"2027-12-27","formation_total_amount":"2.0","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20210573","operator_company_name":"인트윈벤쳐스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"인트윈벤쳐스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.791Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 985: 인트로매그나 제4호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20170051',
  '인트로매그나 제4호 투자조합',
  170000000,
  '2022-03-29',
  '{"fund_id":"AS20220351","registration_date":"2022-03-29","expiry_date":"2027-04-30","formation_total_amount":"1.7","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20170051","operator_company_name":"인트로매그나","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"인트로매그나","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.791Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 986: 인트로매그나 제3호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20170051',
  '인트로매그나 제3호 투자조합',
  210000000,
  '2021-12-21',
  '{"fund_id":"AS20211352","registration_date":"2021-12-21","expiry_date":"2026-12-20","formation_total_amount":"2.1","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20170051","operator_company_name":"인트로매그나","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"인트로매그나","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.791Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 987: 인트로매그나 제2호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20170051',
  '인트로매그나 제2호 투자조합',
  310000000,
  '2021-10-20',
  '{"fund_id":"AS20210960","registration_date":"2021-10-20","expiry_date":"2026-10-31","formation_total_amount":"3.1","investment_character_code":"","industry_code":"4","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20170051","operator_company_name":"인트로매그나","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"인트로매그나","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.791Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 988: 인트로매그나 제1호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20170051',
  '인트로매그나 제1호 투자조합',
  600000000,
  '2020-07-22',
  '{"fund_id":"AS20200341","registration_date":"2020-07-22","expiry_date":"2025-08-31","formation_total_amount":"6.0","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20170051","operator_company_name":"인트로매그나","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"인트로매그나","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.791Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 989: 인터베스트청년창업투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19990013',
  '인터베스트청년창업투자조합',
  55000000000,
  '2022-02-11',
  '{"fund_id":"AS20220134","registration_date":"2022-02-11","expiry_date":"2030-02-10","formation_total_amount":"550.0","investment_character_code":"21","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP19990013","operator_company_name":"인터베스트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"인터베스트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.791Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 990: 인터베스트바이오전문투자조합(한국모태펀드05-01)
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19990013',
  '인터베스트바이오전문투자조합(한국모태펀드05-01)',
  28000000000,
  '2005-10-21',
  '{"fund_id":"AS20050013","registration_date":"2005-10-21","expiry_date":"2025-09-30","formation_total_amount":"280.0","investment_character_code":"04","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"바이오","mother_fund_id":"MF00000001","operator_company_id":"OP19990013","operator_company_name":"인터베스트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"인터베스트","investment_focus":["바이오","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.791Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 991: 인터베스트말레이시아OIF A
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19990013',
  '인터베스트말레이시아OIF A',
  52000000000,
  '2024-09-05',
  '{"fund_id":"AS20240873","registration_date":"2024-09-05","expiry_date":"2034-09-04","formation_total_amount":"520.0","investment_character_code":"15","industry_code":"1","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP19990013","operator_company_name":"인터베스트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"인터베스트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.791Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 992: 인터베스트딥테크투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19990013',
  '인터베스트딥테크투자조합',
  312200000000,
  '2022-12-09',
  '{"fund_id":"AS20221448","registration_date":"2022-12-09","expiry_date":"2030-12-08","formation_total_amount":"3122.0","investment_character_code":"02","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP19990013","operator_company_name":"인터베스트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"인터베스트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.791Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 993: 인터베스트넥스트G-펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19990013',
  '인터베스트넥스트G-펀드',
  55000000000,
  '2023-12-21',
  '{"fund_id":"AS20231326","registration_date":"2023-12-21","expiry_date":"2030-12-20","formation_total_amount":"550.0","investment_character_code":"20","industry_code":"1","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP19990013","operator_company_name":"인터베스트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"인터베스트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.791Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 994: 인터베스트글로벌스케일업펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19990013',
  '인터베스트글로벌스케일업펀드',
  60000000000,
  '2021-07-19',
  '{"fund_id":"AS20210615","registration_date":"2021-07-19","expiry_date":"2031-07-18","formation_total_amount":"600.0","investment_character_code":"08","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP19990013","operator_company_name":"인터베스트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"인터베스트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.791Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 995: 인터베스트그로스세컨더리펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19990013',
  '인터베스트그로스세컨더리펀드',
  101400000000,
  '2020-12-24',
  '{"fund_id":"AS20200842","registration_date":"2020-12-24","expiry_date":"2028-12-23","formation_total_amount":"1014.0","investment_character_code":"16","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP19990013","operator_company_name":"인터베스트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"인터베스트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.791Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 996: 인터베스트WEB3투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19990013',
  '인터베스트WEB3투자조합',
  20000000000,
  '2022-06-03',
  '{"fund_id":"AS20220634","registration_date":"2022-06-03","expiry_date":"2030-06-02","formation_total_amount":"200.0","investment_character_code":"06","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP19990013","operator_company_name":"인터베스트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"인터베스트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.791Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 997: 인터베스트4차산업혁명투자조합Ⅱ
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19990013',
  '인터베스트4차산업혁명투자조합Ⅱ',
  158500000000,
  '2018-12-28',
  '{"fund_id":"AS20190012","registration_date":"2018-12-28","expiry_date":"2026-12-27","formation_total_amount":"1585.0","investment_character_code":"02","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP19990013","operator_company_name":"인터베스트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"인터베스트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.791Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 998: 인터베스트4차산업혁명투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19990013',
  '인터베스트4차산업혁명투자조합',
  110000000000,
  '2017-12-29',
  '{"fund_id":"AS20180036","registration_date":"2017-12-29","expiry_date":"2025-12-28","formation_total_amount":"1100.0","investment_character_code":"02","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP19990013","operator_company_name":"인터베스트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"인터베스트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.791Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 999: 인터베스트 크로스보더 바이오 벤처투자조합 2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19990013',
  '인터베스트 크로스보더 바이오 벤처투자조합 2호',
  16700000000,
  '2021-12-08',
  '{"fund_id":"AS20211249","registration_date":"2021-12-08","expiry_date":"2026-12-07","formation_total_amount":"167.0","investment_character_code":"04","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP19990013","operator_company_name":"인터베스트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"인터베스트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.791Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 1000: 인터베스트 창업초기 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19990013',
  '인터베스트 창업초기 투자조합',
  38000000000,
  '2020-10-06',
  '{"fund_id":"AS20200550","registration_date":"2020-10-06","expiry_date":"2028-10-05","formation_total_amount":"380.0","investment_character_code":"20","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP19990013","operator_company_name":"인터베스트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"인터베스트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:21.791Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Minimal Batch 20 completed! 50 fund records processed.
-- Progress: 1000/3689 total records

