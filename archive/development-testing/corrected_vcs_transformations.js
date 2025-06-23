/**
 * 🔧 CORRECTED VCS TRANSFORMATIONS
 * ================================
 * 
 * Fixed field mapping using actual Korean API field names
 * Critical: Company ID (operInstId) is the universal linking field
 */

/**
 * Transform VC Investor data with correct Korean field mapping
 */
function transformInvestorForSupabase(investorData) {
    return {
        // 🎯 CRITICAL: Company ID is the universal linking field
        company_id: investorData.operInstId || `vc_${Date.now()}_${Math.random().toString(36).substr(2, 9)}`,
        
        // Basic company information using Korean API field names
        company_name: investorData.operInstNm || 'Unknown Company',
        company_name_en: null,
        location: investorData.sigunguNm || null,  // 서울 강남구
        representative: null, // Not provided in API
        established_date: investorData.foundYy || null, // 6년 1개월
        company_type: investorData.operInstTpNm || null, // 기타운용사
        website_url: null, // Not provided in API
        
        // Contact information
        contact_info: {
            address: null, // Not provided in detail
            zip_code: investorData.headofcZipcd || null, // 06164
            phone: null, // Not provided in API
            fax: null,
            email: null
        },
        
        // 🏢 Business data using Korean field names
        disclosure_data: {
            industry: investorData.comIndNm || null, // 유통/서비스
            business_category: investorData.comBzcarrCd || null, // 4
            operating_scale: investorData.operScaleCd || null, // 1
            operating_amount: investorData.operBoundAmt ? parseFloat(investorData.operBoundAmt) : null, // 1.0
            operating_amount_text: investorData.operBoundAmt || null,
            strategy_planner: investorData.strtplanerYn === 'Y' ? true : false, // Y/N
            pf_angel: investorData.pfAnglYn === 'Y' ? true : false, // Y/N
            investment_character: null,
            raw_data: investorData // Store complete original data
        },
        
        // Metadata
        apify_source: 'VCS_SCRAPER_V2.2.0_CORRECTED_KOREAN_MAPPING',
        created_at: new Date().toISOString(),
        updated_at: new Date().toISOString()
    };
}

/**
 * Transform Fund data with correct Korean field mapping
 */
function transformFundForSupabase(fundData) {
    return {
        // 🎯 CRITICAL: Company ID links to VC table (same operInstId)
        company_id: fundData.operInstId || `fund_mgmt_${Date.now()}_${Math.random().toString(36).substr(2, 9)}`,
        
        // Fund identification using Korean API field names
        fund_name: fundData.fundNm || 'Unknown Fund', // 힐스프링투자조합 제1호
        fund_name_en: null,
        fund_type: fundData.invstFldTpNm || null, // 일반
        
        // Financial information
        commitment_amount: null,
        fund_size: fundData.formTotamt ? parseFloat(fundData.formTotamt) : null, // 200.0
        
        // Dates using Korean API field names
        establishment_date: fundData.regDd || null, // 2023-04-26
        fund_status: null, // Not directly provided
        representative: null, // Not provided
        
        // Investment focus
        investment_focus: fundData.invstFldDtlTpNm ? [fundData.invstFldDtlTpNm] : [], // 중소/벤처일반
        
        // 💰 Fund details using Korean field names
        fund_details: {
            fund_code: fundData.fundId || null, // AS20230326
            fund_id: fundData.fundId || null, // AS20230326
            management_company: fundData.operInstNm || null, // 힐스프링인베스트먼트
            management_company_id: fundData.operInstId || null, // OP20220223 (LINKS TO VC TABLE!)
            fund_scale_text: fundData.formTotamt ? `${fundData.formTotamt}억원` : null,
            registration_date: fundData.regDd || null, // 2023-04-26
            expiry_date: fundData.expDd || null, // 2031-04-25
            investment_stage: fundData.invstFldTpNm || null, // 일반
            investment_character_code: fundData.invstCharcCd || null, // 02
            company_industry_code: fundData.comIndCd || null, // 9
            raw_data: fundData // Store complete original data
        },
        
        // Metadata
        apify_source: 'VCS_SCRAPER_V2.2.0_CORRECTED_KOREAN_MAPPING',
        created_at: new Date().toISOString(),
        updated_at: new Date().toISOString()
    };
}

/**
 * Test the corrected transformations
 */
function testCorrectedTransformations() {
    console.log('🧪 Testing corrected transformations...');
    
    // Sample VC data from actual API
    const sampleVC = {
        "operInstId": "OP20220559",
        "operInstNm": "(주)에이치앤벤처스",
        "operInstTpCd": "9",
        "headofcZipcd": "06164", 
        "strtplanerYn": "Y",
        "pfAnglYn": "N",
        "operBoundAmt": "1.0",
        "operScaleCd": "1",
        "comBzcarrCd": "4",
        "foundYy": "6년 1개월",
        "sigunguNm": "서울 강남구",
        "comIndNm": "유통/서비스",
        "operInstTpNm": "기타운용사"
    };
    
    // Sample Fund data from actual API
    const sampleFund = {
        "fundId": "AS20230326",
        "regDd": "2023-04-26",
        "fundNm": "힐스프링투자조합 제1호",
        "formTotamt": "200.0",
        "invstCharcCd": "02",
        "comIndCd": "9",
        "operInstId": "OP20220223", // LINKS TO VC!
        "operInstNm": "힐스프링인베스트먼트",
        "expDd": "2031-04-25",
        "invstFldTpNm": "일반",
        "invstFldDtlTpNm": "중소/벤처일반"
    };
    
    console.log('\n👥 VC Transformation Result:');
    const transformedVC = transformInvestorForSupabase(sampleVC);
    console.log(JSON.stringify(transformedVC, null, 2));
    
    console.log('\n💰 Fund Transformation Result:');  
    const transformedFund = transformFundForSupabase(sampleFund);
    console.log(JSON.stringify(transformedFund, null, 2));
    
    console.log('\n🔗 COMPANY ID LINKING VERIFICATION:');
    console.log(`VC Company ID: ${transformedVC.company_id}`);
    console.log(`Fund Management Company ID: ${transformedFund.company_id}`);
    console.log(`Fund Details Management Company ID: ${transformedFund.fund_details.management_company_id}`);
    
    // Verify no NULL data
    console.log('\n✅ DATA QUALITY CHECK:');
    console.log(`VC Company Name: ${transformedVC.company_name !== 'Unknown Company' ? '✅' : '❌'}`);
    console.log(`VC Industry: ${transformedVC.disclosure_data.industry ? '✅' : '❌'}`);
    console.log(`VC Location: ${transformedVC.location ? '✅' : '❌'}`);
    console.log(`Fund Name: ${transformedFund.fund_name !== 'Unknown Fund' ? '✅' : '❌'}`);
    console.log(`Fund Size: ${transformedFund.fund_size ? '✅' : '❌'}`);
    console.log(`Fund Company Link: ${transformedFund.fund_details.management_company_id ? '✅' : '❌'}`);
}

// Run test
testCorrectedTransformations(); 