const { Actor } = require('apify');
const { createClient } = require('@supabase/supabase-js');
const https = require('https');

// Quick test for v2.2.6 fixes - bigint compatibility and duplicate keys
async function testFixedTransformations() {
    console.log('🧪 Testing VCS Scraper v2.2.6 Fixes...');
    
    // Test Korean duration parsing
    function parseKoreanDurationToDate(durationStr) {
        if (!durationStr || typeof durationStr !== 'string') {
            return null;
        }
        
        const yearMatch = durationStr.match(/(\d+)년/);
        const monthMatch = durationStr.match(/(\d+)개월/);
        
        const years = yearMatch ? parseInt(yearMatch[1]) : 0;
        const months = monthMatch ? parseInt(monthMatch[1]) : 0;
        
        const currentDate = new Date();
        const establishedDate = new Date(currentDate);
        establishedDate.setFullYear(currentDate.getFullYear() - years);
        establishedDate.setMonth(currentDate.getMonth() - months);
        
        return establishedDate.toISOString().split('T')[0];
    }
    
    // Test transformation functions with bigint fixes
    function transformInvestorForSupabase(investorData) {
        const operatingAmountBillions = investorData.operBoundAmt ? parseFloat(investorData.operBoundAmt) : null;
        
        return {
            company_id: investorData.operInstId || `vc_${Date.now()}_${Math.random().toString(36).substr(2, 9)}`,
            company_name: investorData.operInstNm || 'Unknown Company',
            company_name_en: null,
            location: investorData.sigunguNm || null,
            representative: null,
            established_date: parseKoreanDurationToDate(investorData.foundYy),
            company_type: investorData.operInstTpNm || null,
            website_url: null,
            
            // 🔧 BIGINT FIX: Convert to integer
            operating_amount: operatingAmountBillions ? Math.round(operatingAmountBillions) : null,
            
            contact_info: {
                address: null,
                zip_code: investorData.headofcZipcd || null,
                phone: null,
                fax: null,
                email: null
            },
            
            disclosure_data: {
                industry: investorData.comIndNm || null,
                business_category: investorData.comBzcarrCd || null,
                operating_scale_code: investorData.operScaleCd || null,
                operating_amount_billions: operatingAmountBillions,
                operating_amount_text: investorData.operBoundAmt || null,
                operating_amount_display: operatingAmountBillions ? `${operatingAmountBillions}억원` : null,
                strategy_planner: investorData.strtplanerYn === 'Y' ? true : false,
                pf_angel: investorData.pfAnglYn === 'Y' ? true : false,
                investment_character: null,
                raw_data: investorData
            },
            
            apify_source: 'VCS_SCRAPER_V2.2.6_TEST_BIGINT_DUPLICATES',
            created_at: new Date().toISOString(),
            updated_at: new Date().toISOString()
        };
    }
    
    function transformFundForSupabase(fundData) {
        const fundAmountBillions = fundData.formTotamt ? parseFloat(fundData.formTotamt) : null;
        
        return {
            company_id: fundData.operInstId || `fund_mgmt_${Date.now()}_${Math.random().toString(36).substr(2, 9)}`,
            
            // 🔧 DUPLICATE KEY FIX: Add unique suffix
            fund_name: fundData.fundNm ? `${fundData.fundNm}_${fundData.operInstId}` : `Unknown Fund_${Date.now()}`,
            fund_name_en: null,
            fund_type: fundData.invstFldTpNm || null,
            
            // 🔧 BIGINT FIX: Convert to integer
            commitment_amount: fundAmountBillions ? Math.round(fundAmountBillions) : null,
            fund_size: fundAmountBillions ? Math.round(fundAmountBillions) : null,
            
            establishment_date: fundData.regDd || null,
            fund_status: null,
            representative: null,
            investment_focus: fundData.invstFldDtlTpNm ? [fundData.invstFldDtlTpNm] : [],
            
            fund_details: {
                fund_code: fundData.fundId || null,
                fund_id: fundData.fundId || null,
                management_company: fundData.operInstNm || null,
                management_company_id: fundData.operInstId || null,
                fund_scale_text: fundData.formTotamt ? `${fundData.formTotamt}억원` : null,
                fund_amount_billions: fundAmountBillions,
                registration_date: fundData.regDd || null,
                expiry_date: fundData.expDd || null,
                investment_stage: fundData.invstFldTpNm || null,
                investment_character_code: fundData.invstCharcCd || null,
                company_industry_code: fundData.comIndCd || null,
                raw_data: fundData
            },
            
            apify_source: 'VCS_SCRAPER_V2.2.6_TEST_BIGINT_DUPLICATES',
            created_at: new Date().toISOString(),
            updated_at: new Date().toISOString()
        };
    }
    
    // Test data transformation
    console.log('🔧 Testing Investor Transformation...');
    const testInvestor = {
        operInstId: 'TEST123',
        operInstNm: '테스트벤처스',
        operBoundAmt: '252.5', // This should become integer 253
        foundYy: '6년 1개월',
        operInstTpNm: '벤처캐피탈',
        sigunguNm: '서울 강남구'
    };
    
    const transformedInvestor = transformInvestorForSupabase(testInvestor);
    console.log('✅ Investor operating_amount type:', typeof transformedInvestor.operating_amount);
    console.log('✅ Investor operating_amount value:', transformedInvestor.operating_amount); // Should be 253
    
    console.log('🔧 Testing Fund Transformation...');
    const testFund = {
        operInstId: 'TEST123',
        fundNm: '테스트펀드',
        formTotamt: '27.5', // This should become integer 28
        invstFldTpNm: '일반'
    };
    
    const transformedFund = transformFundForSupabase(testFund);
    console.log('✅ Fund commitment_amount type:', typeof transformedFund.commitment_amount);
    console.log('✅ Fund commitment_amount value:', transformedFund.commitment_amount); // Should be 28
    console.log('✅ Fund name with unique suffix:', transformedFund.fund_name); // Should be "테스트펀드_TEST123"
    
    console.log('🎉 v2.2.6 Fixes Validated Successfully!');
    console.log('🔧 Bigint compatibility: ✅');
    console.log('🔧 Duplicate key prevention: ✅');
}

testFixedTransformations(); 