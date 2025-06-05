import { createClient } from '@supabase/supabase-js';

async function runDebug() {
console.log('🔍 === APIFY SUPABASE INTEGRATION DEBUG ===');
console.log(`🕐 Debug Time: ${new Date().toISOString()}`);

// Test environment variable reading (how Apify actor gets them)
const supabaseUrl = process.env.SUPABASE_URL || 'https://udfgtccxbqmalgpqyxzz.supabase.co';
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY;

console.log('\n📋 ENVIRONMENT VARIABLE CHECK:');
console.log(`SUPABASE_URL: ${supabaseUrl || 'NOT SET'}`);
console.log(`SUPABASE_SERVICE_ROLE_KEY: ${supabaseKey ? 'SET (' + supabaseKey.substring(0, 20) + '...)' : 'NOT SET'}`);

// Test input configuration (how Apify actor would receive it)
const mockInput = {
    exportToSupabase: true,
    supabaseUrl: supabaseUrl,
    supabaseKey: supabaseKey
};

console.log('\n⚙️ MOCK INPUT CONFIGURATION:');
console.log(`exportToSupabase: ${mockInput.exportToSupabase}`);
console.log(`supabaseUrl from input: ${mockInput.supabaseUrl || 'NOT PROVIDED'}`);
console.log(`supabaseKey from input: ${mockInput.supabaseKey ? 'PROVIDED' : 'NOT PROVIDED'}`);

// Test Supabase client initialization (exactly like in main.js)
let supabaseClient = null;
if (mockInput.exportToSupabase) {
    const finalUrl = mockInput.supabaseUrl || process.env.SUPABASE_URL || 'https://udfgtccxbqmalgpqyxzz.supabase.co';
    const finalKey = mockInput.supabaseKey || process.env.SUPABASE_SERVICE_ROLE_KEY;
    
    console.log('\n🔧 SUPABASE CLIENT INITIALIZATION:');
    console.log(`Final URL: ${finalUrl}`);
    console.log(`Final Key: ${finalKey ? 'AVAILABLE' : 'MISSING'}`);
    
    if (finalUrl && finalKey) {
        try {
            supabaseClient = createClient(finalUrl, finalKey);
            console.log('✅ Supabase client created successfully');
            
            // Test actual connection
            console.log('\n🧪 TESTING SUPABASE CONNECTION:');
            const { data, error } = await supabaseClient
                .from('vc_table')
                .select('count(*)', { count: 'exact', head: true });
                
            if (error) {
                console.log('❌ Connection test failed:', error.message);
            } else {
                console.log('✅ Connection test successful');
                console.log(`📊 Current VC records: ${data || 'Unable to count'}`);
            }
            
        } catch (error) {
            console.error('❌ Failed to initialize Supabase client:', error.message);
        }
    } else {
        console.log('❌ Missing Supabase credentials');
        console.log(`URL missing: ${!finalUrl}`);
        console.log(`Key missing: ${!finalKey}`);
    }
} else {
    console.log('\n⚠️ exportToSupabase is false - skipping Supabase setup');
}

// Test the exact transformation logic from main.js
console.log('\n🔄 TESTING DATA TRANSFORMATION:');

const mockInvestorData = {
    company_name: 'Test VC Company',
    company_id: 'test_123',
    location: 'Seoul',
    business_type: 'VC',
    raw_api_data: JSON.stringify({ test: 'data' })
};

function transformInvestorForSupabase(investorData) {
    return {
        company_id: investorData.company_id || `vc_${Date.now()}_${Math.random().toString(36).substr(2, 9)}`,
        company_name: investorData.company_name || 'Unknown Company',
        company_name_en: null,
        location: investorData.location || null,
        representative: investorData.representative || null,
        established_date: investorData.establishment_date || null,
        company_type: investorData.business_type || null,
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
            raw_data: JSON.parse(investorData.raw_api_data || '{}')
        },
        apify_source: 'DEBUG_TEST',
        created_at: new Date().toISOString(),
        updated_at: new Date().toISOString()
    };
}

const transformedData = transformInvestorForSupabase(mockInvestorData);
console.log('📊 Transformed data sample:', JSON.stringify(transformedData, null, 2));

// Test upsert function if client is available
if (supabaseClient) {
    console.log('\n💾 TESTING UPSERT FUNCTION:');
    try {
        const { data, error } = await supabaseClient
            .from('vc_table')
            .upsert(transformedData, {
                onConflict: 'company_id',
                ignoreDuplicates: false
            })
            .select();
            
        if (error) {
            console.log('❌ Upsert test failed:', error.message);
            console.log('Error details:', error);
        } else {
            console.log('✅ Upsert test successful');
            console.log('Result:', data);
        }
    } catch (error) {
        console.log('💥 Upsert exception:', error.message);
    }
}

console.log('\n🔍 === DEBUG COMPLETE ===');
console.log('Key Findings:');
console.log('1. Environment variables accessible:', !!process.env.SUPABASE_SERVICE_ROLE_KEY);
console.log('2. Client initialization successful:', !!supabaseClient);
console.log('3. Data transformation working:', !!transformedData.company_id);
console.log('\nIf all tests pass, the issue is likely:');
console.log('- Environment variables not set in Apify runtime');
console.log('- Input configuration not being passed correctly');
console.log('- Network/authentication issues in Apify environment');
}

runDebug().catch(console.error); 