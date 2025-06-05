/**
 * 🧪 SUPABASE CONNECTION TEST
 * ===========================
 * 
 * Quick test to verify Supabase connection and table schema
 */

const { createClient } = require('@supabase/supabase-js');
require('dotenv').config();

async function testSupabaseConnection() {
    console.log('🧪 Testing Supabase connection...');
    
    // Check environment variables
    const SUPABASE_URL = process.env.SUPABASE_URL;
    const SUPABASE_KEY = process.env.SUPABASE_SERVICE_ROLE_KEY;
    
    if (!SUPABASE_URL || !SUPABASE_KEY) {
        console.error('❌ Missing Supabase credentials in .env file');
        console.error('Please check SUPABASE_URL and SUPABASE_SERVICE_ROLE_KEY');
        return;
    }
    
    console.log(`✅ Environment variables loaded`);
    console.log(`📍 URL: ${SUPABASE_URL}`);
    console.log(`🔑 Key: ${SUPABASE_KEY.substring(0, 20)}...`);
    
    try {
        // Initialize Supabase client
        const supabase = createClient(SUPABASE_URL, SUPABASE_KEY);
        console.log('✅ Supabase client created');
        
        // Test vc_table connection
        console.log('\n🏢 Testing vc_table...');
        const { data: vcData, error: vcError } = await supabase
            .from('vc_table')
            .select('*')
            .limit(1);
            
        if (vcError) {
            console.error('❌ vc_table error:', vcError.message);
        } else {
            console.log(`✅ vc_table accessible - ${vcData.length} sample records`);
            if (vcData.length > 0) {
                console.log('📋 Sample vc_table fields:', Object.keys(vcData[0]));
            }
        }
        
        // Test fund_table connection
        console.log('\n🏦 Testing fund_table...');
        const { data: fundData, error: fundError } = await supabase
            .from('fund_table')
            .select('*')
            .limit(1);
            
        if (fundError) {
            console.error('❌ fund_table error:', fundError.message);
        } else {
            console.log(`✅ fund_table accessible - ${fundData.length} sample records`);
            if (fundData.length > 0) {
                console.log('📋 Sample fund_table fields:', Object.keys(fundData[0]));
            }
        }
        
        // Test insert permissions (with a dry run)
        console.log('\n🔐 Testing insert permissions...');
        const testData = {
            company_id: 'test_' + Date.now(),
            company_name: 'Test Company',
            data_source: 'Connection Test'
        };
        
        const { data: insertTest, error: insertError } = await supabase
            .from('vc_table')
            .insert(testData)
            .select();
            
        if (insertError) {
            console.error('❌ Insert permission error:', insertError.message);
        } else {
            console.log('✅ Insert permissions working');
            
            // Clean up test data
            await supabase
                .from('vc_table')
                .delete()
                .eq('company_id', testData.company_id);
            console.log('🧹 Test data cleaned up');
        }
        
        console.log('\n🎉 Supabase connection test completed!');
        console.log('✅ Ready to run scrapers');
        
    } catch (error) {
        console.error('💥 Connection test failed:', error.message);
    }
}

// Run the test
testSupabaseConnection(); 