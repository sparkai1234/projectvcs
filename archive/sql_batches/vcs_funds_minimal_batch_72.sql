-- VCS Fund MINIMAL UPSERT Batch 72/74 (Records 3551-3600)
-- MINIMAL: Only using basic columns that definitely exist
-- Generated from VCS API Scraper fund data
-- Generated at: 2025-06-05T00:40:22.053Z
-- Schema: Minimal fund_table structure (basic columns only)

-- MINIMAL FUND DATA (UPSERT - Safe for Duplicates)
-- Processing 50 fund records
-- Will INSERT new records or UPDATE existing ones

-- Record 3551: IDV-IP 수산전문투자조합 2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20120009',
  'IDV-IP 수산전문투자조합 2호',
  15000000000,
  '2019-12-03',
  '{"fund_id":"AS20190600","registration_date":"2019-12-03","expiry_date":"2027-12-02","formation_total_amount":"150.0","investment_character_code":"10","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"일반 기타","mother_fund_id":"MF00000001","operator_company_id":"OP20120009","operator_company_name":"아이디벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"아이디벤처스","investment_focus":["일반 기타","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.053Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3552: IDV IP 창조성장 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20120009',
  'IDV IP 창조성장 투자조합',
  15000000000,
  '2016-06-23',
  '{"fund_id":"AS20160054","registration_date":"2016-06-23","expiry_date":"2025-06-22","formation_total_amount":"150.0","investment_character_code":"09","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"특허","mother_fund_id":"MF00000001","operator_company_id":"OP20120009","operator_company_name":"아이디벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"아이디벤처스","investment_focus":["특허","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.053Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3553: IDV IP Value-Creation 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20120009',
  'IDV IP Value-Creation 투자조합',
  15000000000,
  '2015-11-13',
  '{"fund_id":"AS20150110","registration_date":"2015-11-13","expiry_date":"2025-11-12","formation_total_amount":"150.0","investment_character_code":"09","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"특허","mother_fund_id":"MF00000001","operator_company_id":"OP20120009","operator_company_name":"아이디벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"아이디벤처스","investment_focus":["특허","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.053Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3554: IDV IP STAR 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20120009',
  'IDV IP STAR 투자조합',
  30000000000,
  '2019-12-27',
  '{"fund_id":"AS20200024","registration_date":"2019-12-27","expiry_date":"2027-12-26","formation_total_amount":"300.0","investment_character_code":"09","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"특허","mother_fund_id":"MF00000001","operator_company_id":"OP20120009","operator_company_name":"아이디벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"아이디벤처스","investment_focus":["특허","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.053Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3555: IDV Global IP Growth 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20120009',
  'IDV Global IP Growth 투자조합',
  11800000000,
  '2018-12-19',
  '{"fund_id":"AS20180372","registration_date":"2018-12-19","expiry_date":"2026-12-18","formation_total_amount":"118.0","investment_character_code":"09","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"특허","mother_fund_id":"MF00000001","operator_company_id":"OP20120009","operator_company_name":"아이디벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"아이디벤처스","investment_focus":["특허","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.053Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3556: ICT융합펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20000044',
  'ICT융합펀드',
  28350000000,
  '2017-01-06',
  '{"fund_id":"AS20170010","registration_date":"2017-01-06","expiry_date":"2026-01-05","formation_total_amount":"283.5","investment_character_code":"01","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"IT","mother_fund_id":"","operator_company_id":"OP20000044","operator_company_name":"씨제이인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"씨제이인베스트먼트","investment_focus":["IT","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.053Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3557: IBP IP Value 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20160009',
  'IBP IP Value 투자조합',
  45000000000,
  '2016-09-09',
  '{"fund_id":"AS20160063","registration_date":"2016-09-09","expiry_date":"2025-09-08","formation_total_amount":"450.0","investment_character_code":"09","industry_code":"9","investment_field_type":"일반","investment_field_detail_type":"특허","mother_fund_id":"MF00000001","operator_company_id":"OP20160009","operator_company_name":"비비드인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"비비드인베스트먼트","investment_focus":["특허","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.053Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3558: IBKC-케이앤 세컨더리1호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20150011',
  'IBKC-케이앤 세컨더리1호 투자조합',
  19000000000,
  '2017-09-29',
  '{"fund_id":"AS20170121","registration_date":"2017-09-29","expiry_date":"2025-09-27","formation_total_amount":"190.0","investment_character_code":"16","industry_code":"4","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20150011","operator_company_name":"케이앤투자파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"케이앤투자파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.053Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3559: IBKC-메디치 세컨더리 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20110002',
  'IBKC-메디치 세컨더리 투자조합',
  35000000000,
  '2016-07-20',
  '{"fund_id":"AS20160006","registration_date":"2016-07-20","expiry_date":"2025-07-19","formation_total_amount":"350.0","investment_character_code":"16","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20110002","operator_company_name":"메디치인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"메디치인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.053Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3560: IBKC-UNION세컨더리메자닌투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20000008',
  'IBKC-UNION세컨더리메자닌투자조합',
  10000000000,
  '2017-06-13',
  '{"fund_id":"AS20170056","registration_date":"2017-06-13","expiry_date":"2025-06-12","formation_total_amount":"100.0","investment_character_code":"16","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20000008","operator_company_name":"유니온투자파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"유니온투자파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.053Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3561: IBKC-SBI 바이오펀드 제1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19860008',
  'IBKC-SBI 바이오펀드 제1호',
  30000000000,
  '2016-03-17',
  '{"fund_id":"AS20160011","registration_date":"2016-03-17","expiry_date":"2025-12-16","formation_total_amount":"300.0","investment_character_code":"04","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"바이오","mother_fund_id":"","operator_company_id":"OP19860008","operator_company_name":"에스비아이인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"에스비아이인베스트먼트","investment_focus":["바이오","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.053Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3562: IBKC-MGI신성장특화pre-IPO펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20080012',
  'IBKC-MGI신성장특화pre-IPO펀드',
  20000000000,
  '2017-04-11',
  '{"fund_id":"AS20170037","registration_date":"2017-04-11","expiry_date":"2026-04-09","formation_total_amount":"200.0","investment_character_code":"01","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20080012","operator_company_name":"메이플투자파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"메이플투자파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.053Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3563: I-GEN개인투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190053',
  'I-GEN개인투자조합1호',
  100000000,
  '2019-10-10',
  '{"fund_id":"AS20190445","registration_date":"2019-10-10","expiry_date":"2026-10-09","formation_total_amount":"1.0","investment_character_code":"","industry_code":"8","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190053","operator_company_name":"경남창조경제혁신센터","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"경남창조경제혁신센터","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.053Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3564: I-Gen 커넥팅닷 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200234',
  'I-Gen 커넥팅닷 개인투자조합',
  150000000,
  '2021-01-05',
  '{"fund_id":"AS20200827","registration_date":"2021-01-05","expiry_date":"2026-01-04","formation_total_amount":"1.5","investment_character_code":"","industry_code":"5","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200234","operator_company_name":"커넥팅닷유나이티드","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"커넥팅닷유나이티드","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.053Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3565: HUAYI-IDV 글로벌 콘텐츠 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20120009',
  'HUAYI-IDV 글로벌 콘텐츠 투자조합',
  35200000000,
  '2017-10-19',
  '{"fund_id":"AS20170124","registration_date":"2017-10-19","expiry_date":"2025-10-18","formation_total_amount":"352.0","investment_character_code":"24","industry_code":"2","investment_field_type":"문화","investment_field_detail_type":"문화 기타","mother_fund_id":"MF00000001","operator_company_id":"OP20120009","operator_company_name":"아이디벤처스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"아이디벤처스","investment_focus":["문화 기타","문화"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.053Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3566: HDI 패스트이노베이션펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20170010',
  'HDI 패스트이노베이션펀드',
  10000000000,
  '2019-11-11',
  '{"fund_id":"AS20190517","registration_date":"2019-11-11","expiry_date":"2026-11-10","formation_total_amount":"100.0","investment_character_code":"01","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20170010","operator_company_name":"라이트하우스컴바인인베스트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"라이트하우스컴바인인베스트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.053Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3567: HB-KIS 2019 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19990005',
  'HB-KIS 2019 투자조합',
  14000000000,
  '2019-10-22',
  '{"fund_id":"AS20190464","registration_date":"2019-10-22","expiry_date":"2025-10-21","formation_total_amount":"140.0","investment_character_code":"01","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP19990005","operator_company_name":"에이치비인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"에이치비인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.053Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3568: HB-KIS 2018 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19990005',
  'HB-KIS 2018 투자조합',
  15900000000,
  '2018-10-19',
  '{"fund_id":"AS20180310","registration_date":"2018-10-19","expiry_date":"2025-10-18","formation_total_amount":"159.0","investment_character_code":"01","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP19990005","operator_company_name":"에이치비인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"에이치비인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.053Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3569: HB 청년창업 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19990005',
  'HB 청년창업 투자조합',
  75000000000,
  '2017-12-29',
  '{"fund_id":"AS20180032","registration_date":"2017-12-29","expiry_date":"2025-12-28","formation_total_amount":"750.0","investment_character_code":"21","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP19990005","operator_company_name":"에이치비인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"에이치비인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.053Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3570: FMC 제1호 Sand Box 지역특구 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190397',
  'FMC 제1호 Sand Box 지역특구 투자조합',
  10350000000,
  '2020-10-05',
  '{"fund_id":"AS20200545","registration_date":"2020-10-05","expiry_date":"2027-10-04","formation_total_amount":"103.5","investment_character_code":"10","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20190397","operator_company_name":"에프엠씨인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"에프엠씨인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.053Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3571: e-신산업 LB펀드 1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19960002',
  'e-신산업 LB펀드 1호',
  33500000000,
  '2017-11-07',
  '{"fund_id":"AS20170132","registration_date":"2017-11-07","expiry_date":"2027-11-06","formation_total_amount":"335.0","investment_character_code":"11","industry_code":"3","investment_field_type":"일반","investment_field_detail_type":"에너지","mother_fund_id":"","operator_company_id":"OP19960002","operator_company_name":"엘비인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"엘비인베스트먼트","investment_focus":["에너지","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.053Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3572: DTNI-창업초기 혁신 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20150009',
  'DTNI-창업초기 혁신 투자조합',
  58830000000,
  '2018-11-29',
  '{"fund_id":"AS20180349","registration_date":"2018-11-29","expiry_date":"2026-11-28","formation_total_amount":"588.3","investment_character_code":"20","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20150009","operator_company_name":"디티앤인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"디티앤인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.053Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3573: DTNI-전남 창조경제혁신펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20150009',
  'DTNI-전남 창조경제혁신펀드',
  11500000000,
  '2016-03-30',
  '{"fund_id":"AS20160071","registration_date":"2016-03-30","expiry_date":"2026-03-29","formation_total_amount":"115.0","investment_character_code":"18","industry_code":"9","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20150009","operator_company_name":"디티앤인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"디티앤인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.053Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3574: DTNI-스타트업 창조성장 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20150009',
  'DTNI-스타트업 창조성장 투자조합',
  11500000000,
  '2016-06-21',
  '{"fund_id":"AS20160056","registration_date":"2016-06-21","expiry_date":"2025-06-20","formation_total_amount":"115.0","investment_character_code":"20","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20150009","operator_company_name":"디티앤인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"디티앤인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.053Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3575: DTNI-소프트산업육성 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20150009',
  'DTNI-소프트산업육성 투자조합',
  15000000000,
  '2017-09-12',
  '{"fund_id":"AS20170102","registration_date":"2017-09-12","expiry_date":"2025-09-11","formation_total_amount":"150.0","investment_character_code":"19","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20150009","operator_company_name":"디티앤인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"디티앤인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.053Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3576: DTNI-KVIC 판교 창조경제 밸리 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20150009',
  'DTNI-KVIC 판교 창조경제 밸리 투자조합',
  22780000000,
  '2015-12-03',
  '{"fund_id":"AS20150071","registration_date":"2015-12-03","expiry_date":"2025-12-02","formation_total_amount":"227.8","investment_character_code":"18","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20150009","operator_company_name":"디티앤인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"디티앤인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.053Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3577: DTN-KIS 유니콘 2020 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20150009',
  'DTN-KIS 유니콘 2020 투자조합',
  10340000000,
  '2020-07-16',
  '{"fund_id":"AS20200334","registration_date":"2020-07-16","expiry_date":"2025-07-15","formation_total_amount":"103.4","investment_character_code":"01","industry_code":"4","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20150009","operator_company_name":"디티앤인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"디티앤인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.053Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3578: DSC초기기업스케일업펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20120007',
  'DSC초기기업스케일업펀드',
  170000000000,
  '2020-12-02',
  '{"fund_id":"AS20200722","registration_date":"2020-12-02","expiry_date":"2030-12-01","formation_total_amount":"1700.0","investment_character_code":"20","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20120007","operator_company_name":"디에스씨인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"디에스씨인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.053Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3579: DSC초기기업성장지원펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20120007',
  'DSC초기기업성장지원펀드',
  120000000000,
  '2018-12-26',
  '{"fund_id":"AS20180371","registration_date":"2018-12-26","expiry_date":"2028-12-25","formation_total_amount":"1200.0","investment_character_code":"20","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20120007","operator_company_name":"디에스씨인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"디에스씨인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.053Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3580: DSC세컨더리벤처펀드제3호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20120007',
  'DSC세컨더리벤처펀드제3호',
  41200000000,
  '2021-04-19',
  '{"fund_id":"AS20210307","registration_date":"2021-04-19","expiry_date":"2026-04-18","formation_total_amount":"412.0","investment_character_code":"16","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20120007","operator_company_name":"디에스씨인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"디에스씨인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.053Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3581: DSC세컨더리벤처펀드제2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20120007',
  'DSC세컨더리벤처펀드제2호',
  9000000000,
  '2021-02-18',
  '{"fund_id":"AS20210121","registration_date":"2021-02-18","expiry_date":"2026-02-17","formation_total_amount":"90.0","investment_character_code":"16","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20120007","operator_company_name":"디에스씨인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"디에스씨인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.053Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3582: DSC드림X청년창업펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20120007',
  'DSC드림X청년창업펀드',
  50000000000,
  '2017-12-29',
  '{"fund_id":"AS20180041","registration_date":"2017-12-29","expiry_date":"2025-12-28","formation_total_amount":"500.0","investment_character_code":"21","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20120007","operator_company_name":"디에스씨인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"디에스씨인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.053Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3583: DSC 유망서비스산업펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20120007',
  'DSC 유망서비스산업펀드',
  58000000000,
  '2016-12-28',
  '{"fund_id":"AS20170002","registration_date":"2016-12-28","expiry_date":"2025-12-26","formation_total_amount":"580.0","investment_character_code":"26","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20120007","operator_company_name":"디에스씨인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"디에스씨인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.053Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3584: DSC Tech 밸류업 펀드 2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20120007',
  'DSC Tech 밸류업 펀드 2호',
  21200000000,
  '2020-09-17',
  '{"fund_id":"AS20200509","registration_date":"2020-09-17","expiry_date":"2025-09-16","formation_total_amount":"212.0","investment_character_code":"01","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20120007","operator_company_name":"디에스씨인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"디에스씨인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.053Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3585: DSC Tech 밸류업 펀드 1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20120007',
  'DSC Tech 밸류업 펀드 1호',
  15010000000,
  '2019-10-29',
  '{"fund_id":"AS20190486","registration_date":"2019-10-29","expiry_date":"2026-10-28","formation_total_amount":"150.1","investment_character_code":"01","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20120007","operator_company_name":"디에스씨인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"디에스씨인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.053Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3586: DSC Follow-on 성장사다리펀드
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20120007',
  'DSC Follow-on 성장사다리펀드',
  42000000000,
  '2016-12-28',
  '{"fund_id":"AS20170001","registration_date":"2016-12-28","expiry_date":"2025-12-26","formation_total_amount":"420.0","investment_character_code":"20","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20120007","operator_company_name":"디에스씨인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"디에스씨인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.053Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3587: DKI 글로벌 콘텐츠 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20110006',
  'DKI 글로벌 콘텐츠 투자조합',
  3550000000,
  '2021-04-06',
  '{"fund_id":"AS20210265","registration_date":"2021-04-06","expiry_date":"2026-04-05","formation_total_amount":"35.5","investment_character_code":"25","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20110006","operator_company_name":"대교인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"대교인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.053Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3588: DKI Growing Star 5호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20110006',
  'DKI Growing Star 5호 투자조합',
  22000000000,
  '2019-11-07',
  '{"fund_id":"AS20190500","registration_date":"2019-11-07","expiry_date":"2027-11-06","formation_total_amount":"220.0","investment_character_code":"19","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20110006","operator_company_name":"대교인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"대교인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.053Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3589: DKI Growing Star 4호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20110006',
  'DKI Growing Star 4호 투자조합',
  12500000000,
  '2018-11-16',
  '{"fund_id":"AS20180330","registration_date":"2018-11-16","expiry_date":"2026-11-15","formation_total_amount":"125.0","investment_character_code":"20","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20110006","operator_company_name":"대교인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"대교인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.054Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3590: DKI Growing Star 3호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20110006',
  'DKI Growing Star 3호 투자조합',
  30000000000,
  '2017-02-07',
  '{"fund_id":"AS20170020","registration_date":"2017-02-07","expiry_date":"2026-02-06","formation_total_amount":"300.0","investment_character_code":"26","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20110006","operator_company_name":"대교인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"대교인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.054Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3591: DKI Growing Star 2호 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20110006',
  'DKI Growing Star 2호 투자조합',
  13000000000,
  '2015-08-24',
  '{"fund_id":"AS20150065","registration_date":"2015-08-24","expiry_date":"2025-08-23","formation_total_amount":"130.0","investment_character_code":"21","industry_code":"2","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20110006","operator_company_name":"대교인베스트먼트","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"대교인베스트먼트","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.054Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3592: DHP개인투자조합2호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190042',
  'DHP개인투자조합2호',
  320000000,
  '2019-05-30',
  '{"fund_id":"AS20190207","registration_date":"2019-05-30","expiry_date":"2026-05-31","formation_total_amount":"3.2","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190042","operator_company_name":"디지털헬스케어파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"디지털헬스케어파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.054Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3593: DHP 개인투자조합 제3호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20190042',
  'DHP 개인투자조합 제3호',
  790000000,
  '2020-03-30',
  '{"fund_id":"AS20200144","registration_date":"2020-03-30","expiry_date":"2027-03-29","formation_total_amount":"7.9","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20190042","operator_company_name":"디지털헬스케어파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"디지털헬스케어파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.054Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3594: D3 임팩트 벤처투자조합 제1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20180011',
  'D3 임팩트 벤처투자조합 제1호',
  15000000000,
  '2018-08-17',
  '{"fund_id":"AS20180203","registration_date":"2018-08-17","expiry_date":"2026-08-16","formation_total_amount":"150.0","investment_character_code":"23","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP20180011","operator_company_name":"디쓰리쥬빌리파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"디쓰리쥬빌리파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.054Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3595: CVL-텐원더스투자조합1호
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200089',
  'CVL-텐원더스투자조합1호',
  110000000,
  '2020-08-10',
  '{"fund_id":"AS20200399","registration_date":"2020-08-10","expiry_date":"2025-08-09","formation_total_amount":"1.1","investment_character_code":"","industry_code":"2","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200089","operator_company_name":"텐원더스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"텐원더스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.054Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3596: CSF 스타트업 성장1호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20170035',
  'CSF 스타트업 성장1호 개인투자조합',
  310000000,
  '2019-04-02',
  '{"fund_id":"AS20190165","registration_date":"2019-04-02","expiry_date":"2027-05-31","formation_total_amount":"3.1","investment_character_code":"","industry_code":"9","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20170035","operator_company_name":"충남대학교기술지주","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"충남대학교기술지주","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.054Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3597: CNVP 컨버전스 1호 개인투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20200126',
  'CNVP 컨버전스 1호 개인투자조합',
  740000000,
  '2020-11-23',
  '{"fund_id":"AS20200666","registration_date":"2020-11-23","expiry_date":"2025-11-22","formation_total_amount":"7.4","investment_character_code":"","industry_code":"3","investment_field_type":"","investment_field_detail_type":"","mother_fund_id":"","operator_company_id":"OP20200126","operator_company_name":"씨앤벤처파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"씨앤벤처파트너스","investment_focus":[],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.054Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3598: CKP-KIS 2020 투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP20060010',
  'CKP-KIS 2020 투자조합',
  22000000000,
  '2020-10-19',
  '{"fund_id":"AS20200586","registration_date":"2020-10-19","expiry_date":"2025-10-18","formation_total_amount":"220.0","investment_character_code":"01","industry_code":"8","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"","operator_company_id":"OP20060010","operator_company_name":"컴퍼니케이파트너스","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"컴퍼니케이파트너스","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.054Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3599: CKD6호 Brain Leaders 벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19970005',
  'CKD6호 Brain Leaders 벤처투자조합',
  15000000000,
  '2016-12-15',
  '{"fund_id":"AS20160221","registration_date":"2016-12-15","expiry_date":"2025-12-14","formation_total_amount":"150.0","investment_character_code":"20","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP19970005","operator_company_name":"씨케이디창업투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"씨케이디창업투자","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.054Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Record 3600: CKD-BS Start-Up 벤처투자조합
INSERT INTO fund_table (
  company_id, fund_name, commitment_amount, establishment_date,
  fund_details, apify_source
) VALUES (
  'OP19970005',
  'CKD-BS Start-Up 벤처투자조합',
  30000000000,
  '2018-11-09',
  '{"fund_id":"AS20180345","registration_date":"2018-11-09","expiry_date":"2026-11-08","formation_total_amount":"300.0","investment_character_code":"20","industry_code":"5","investment_field_type":"일반","investment_field_detail_type":"중소/벤처일반","mother_fund_id":"MF00000001","operator_company_id":"OP19970005","operator_company_name":"씨케이디창업투자","fund_type":"VCS Registered Fund","fund_status":"Active","representative":"씨케이디창업투자","investment_focus":["중소/벤처일반","일반"],"source_url":"https://www.vcs.go.kr/web/portal/fund/search","extracted_at":"2025-06-05T00:40:22.054Z"}'::jsonb,
  'VCS_API_SCRAPER'
)
ON CONFLICT (company_id, fund_name) DO UPDATE SET
  commitment_amount = EXCLUDED.commitment_amount,
  establishment_date = EXCLUDED.establishment_date,
  fund_details = EXCLUDED.fund_details,
  apify_source = EXCLUDED.apify_source,
  updated_at = NOW();

-- Minimal Batch 72 completed! 50 fund records processed.
-- Progress: 3600/3689 total records

