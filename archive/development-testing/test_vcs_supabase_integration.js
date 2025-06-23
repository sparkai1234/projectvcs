/**
 * 🧪 VCS SUPABASE INTEGRATION TEST
 * ================================
 * 
 * Test the VCS v2.1.3 scraper with Supabase integration
 * Simulates Apify Actor environment for local testing
 */

const { createClient } = require('@supabase/supabase-js');
require('dotenv').config();

// Mock Apify Actor for local testing
const Actor = {
    getInput: async () => ({
        updateMode: 'incremental',
        maxPages: 2, // Test with just 2 pages
        dataSource: 'both',
        exportToSupabase: true,
        testMode: true,
        unlimitedExtraction: false,
        supabaseUrl: 'https://udfgtccxbqmalgpqyxzz.supabase.co',
        supabaseKey: process.env.SUPABASE_SERVICE_ROLE_KEY
    }),
    pushData: async (data) => {
        console.log('📤 Mock Apify pushData:', JSON.stringify(data, null, 2));
    },
    main: (fn) => fn()
};

// Import the main scraper functions (simulate)
async function testSupabaseIntegration() {
    console.log('🧪 === VCS SUPABASE INTEGRATION TEST ===');
    console.log(`🕐 Test started: ${new Date().toISOString()}`);
    
    try {
        // Test Supabase connection
        const input = await Actor.getInput();
        console.log('📋 Test configuration:', input);
        
        if (!input.supabaseKey) {
            console.error('❌ Missing SUPABASE_SERVICE_ROLE_KEY in .env file');
            console.log('💡 Create a .env file with: SUPABASE_SERVICE_ROLE_KEY=your_key_here');
            return;
        }
        
        // Initialize Supabase client
        console.log('\n🔗 Initializing Supabase client...');
        const supabaseClient = createClient(input.supabaseUrl, input.supabaseKey);
        console.log('✅ Supabase client created');
        
        // Test database connection
        console.log('\n🏥 Testing database connection...');
        const { data: healthCheck, error: healthError } = await supabaseClient
            .from('vc_table')
            .select('*')
            .limit(1);
            
        if (healthError) {
            console.error('❌ Database connection failed:', healthError.message);
            return;
        }
        
        console.log('✅ Database connection successful');
        
        // Test data transformation
        console.log('\n🔄 Testing data transformation...');
        
        // Mock VCS investor data
        const mockInvestorData = {
            company_name: 'Test VC Company',
            company_id: 'test_vc_001',
            registration_number: 'test_vc_001', 
            representative: 'Test Representative',
            establishment_date: '2020-01-01',
            address: 'Seoul, South Korea',
            phone: '02-1234-5678',
            business_type: 'Venture Capital',
            industry: 'Technology',
            operating_scale: 'Large',
            raw_api_data: JSON.stringify({ test: true })
        };
        
        // Mock VCS fund data
        const mockFundData = {
            fund_name: 'Test Growth Fund',
            fund_id: 'test_fund_001',
            management_company: 'Test VC Company',
            management_company_id: 'test_vc_001',
            fund_type: 'Growth Fund',
            fund_scale: 50000, // 500억원
            establishment_date: '2021-01-01',
            investment_field: 'Technology',
            raw_api_data: JSON.stringify({ test: true })
        };
        
        // Test transformation functions
        const transformedInvestor = transformInvestorForSupabase(mockInvestorData);
        const transformedFund = transformFundForSupabase(mockFundData);
        
        console.log('✅ Data transformation successful');
        console.log('📊 Transformed investor sample:', JSON.stringify(transformedInvestor, null, 2));
        console.log('📊 Transformed fund sample:', JSON.stringify(transformedFund, null, 2));
        
        // Test Supabase upsert
        console.log('\n💾 Testing Supabase upsert...');
        
        const investorResult = await upsertInvestorToSupabase(supabaseClient, mockInvestorData);
        console.log('👥 Investor upsert result:', investorResult);
        
        const fundResult = await upsertFundToSupabase(supabaseClient, mockFundData);
        console.log('💰 Fund upsert result:', fundResult);
        
        if (investorResult.success && fundResult.success) {
            console.log('\n🎉 === SUPABASE INTEGRATION TEST PASSED ===');
            console.log('✅ Ready for Apify deployment with Supabase integration!');
        } else {
            console.log('\n❌ === SUPABASE INTEGRATION TEST FAILED ===');
            console.log('⚠️ Check error messages above');
        }
        
    } catch (error) {
        console.error('💥 Test failed with error:', error);
    }
}

// Transformation functions (copied from main.js)
function transformInvestorForSupabase(investorData) {
    return {
        company_id: investorData.company_id || investorData.registration_number || `vc_${Date.now()}_${Math.random().toString(36).substr(2, 9)}`,
        company_name: investorData.company_name || 'Unknown Company',
        company_name_en: null,
        location: investorData.location || investorData.address || null,
        representative: investorData.representative || null,
        established_date: investorData.establishment_date || null,
        company_type: investorData.business_type || investorData.business_category || null,
        website_url: null,
        contact_info: {
            address: investorData.address || null,
            zip_code: investorData.zip_code || null,
            phone: investorData.phone || null,
            fax: null,
            email: null
        },
        disclosure_data: {
            industry: investorData.industry || null,
            business_category: investorData.business_category || null,
            operating_scale: investorData.operating_scale || null,
            operating_amount: investorData.operating_amount || null,
            operating_amount_text: investorData.operating_amount_text || null,
            strategy_planner: investorData.strategy_planner || null,
            pf_angel: investorData.professional_angel || null,
            investment_character: investorData.investment_character || null,
            raw_data: JSON.parse(investorData.raw_api_data || '{}')
        },
        apify_source: 'VCS_SCRAPER_V2.1.3_SUPABASE_INTEGRATED_TEST',
        created_at: new Date().toISOString(),
        updated_at: new Date().toISOString()
    };
}

function transformFundForSupabase(fundData) {
    return {
        company_id: fundData.management_company_id || fundData.fund_id || `fund_mgmt_${Date.now()}_${Math.random().toString(36).substr(2, 9)}`,
        fund_name: fundData.fund_name || 'Unknown Fund',
        fund_name_en: null,
        fund_type: fundData.fund_type || null,
        commitment_amount: null,
        fund_size: fundData.fund_scale || null,
        establishment_date: fundData.establishment_date ? new Date(fundData.establishment_date).toISOString().split('T')[0] : null,
        fund_status: fundData.fund_status || fundData.closing_status || null,
        representative: null,
        investment_focus: fundData.investment_field ? [fundData.investment_field] : [],
        fund_details: {
            fund_code: fundData.fund_code || null,
            management_company: fundData.management_company || null,
            management_company_id: fundData.management_company_id || null,
            fund_scale_text: fundData.fund_scale_text || null,
            duration_years: fundData.duration_years || null,
            investment_stage: fundData.investment_stage || null,
            investment_region: fundData.investment_region || null,
            closing_status: fundData.closing_status || null,
            raw_data: JSON.parse(fundData.raw_api_data || '{}')
        },
        apify_source: 'VCS_SCRAPER_V2.1.3_SUPABASE_INTEGRATED_TEST',
        created_at: new Date().toISOString(),
        updated_at: new Date().toISOString()
    };
}

async function upsertInvestorToSupabase(supabaseClient, investorData) {
    if (!supabaseClient) return { success: false, error: 'No Supabase client' };
    
    try {
        const supabaseData = transformInvestorForSupabase(investorData);
        
        const { data, error } = await supabaseClient
            .from('vc_table')
            .upsert(supabaseData, {
                onConflict: 'company_id',
                ignoreDuplicates: false
            })
            .select();
            
        if (error) {
            console.error(`❌ Supabase upsert error for ${supabaseData.company_name}:`, error.message);
            return { success: false, error: error.message };
        }
        
        console.log(`✅ Upserted investor: ${supabaseData.company_name}`);
        return { success: true, data };
        
    } catch (error) {
        console.error(`💥 Critical error upserting investor:`, error.message);
        return { success: false, error: error.message };
    }
}

async function upsertFundToSupabase(supabaseClient, fundData) {
    if (!supabaseClient) return { success: false, error: 'No Supabase client' };
    
    try {
        const supabaseData = transformFundForSupabase(fundData);
        
        const { data, error } = await supabaseClient
            .from('fund_table')
            .insert(supabaseData)
            .select();
            
        if (error) {
            console.error(`❌ Supabase upsert error for ${supabaseData.fund_name}:`, error.message);
            return { success: false, error: error.message };
        }
        
        console.log(`✅ Upserted fund: ${supabaseData.fund_name}`);
        return { success: true, data };
        
    } catch (error) {
        console.error(`💥 Critical error upserting fund:`, error.message);
        return { success: false, error: error.message };
    }
}

// Run the test
if (require.main === module) {
    testSupabaseIntegration();
} 