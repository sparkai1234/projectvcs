/**
 * 🧪 SUPABASE CONNECTION TEST
 * ===========================
 * 
 * Quick test to verify Supabase connection and table schema
 */

import { createClient } from '@supabase/supabase-js';
require('dotenv').config();

console.log('🧪 Testing Supabase connection...');

// Supabase configuration
const supabaseUrl = 'https://udfgtccxbqmalgpqyxzz.supabase.co';
const supabaseKey = process.env.SUPABASE_KEY || 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InVkZmd0Y2N4YnFtYWxncHF5eHp6Iiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTczNDA5Mjg5MCwiZXhwIjoyMDQ5NjY4ODkwfQ.I9sDa9j4R0OYWLxgF7wq3djQRnHGmAmwJJgn5-ZWoZ4';

console.log('Creating Supabase client...');
const supabase = createClient(supabaseUrl, supabaseKey);

console.log('Testing connection by counting diva_investment_performance records...');

try {
    const { data, error, count } = await supabase
        .from('diva_investment_performance')
        .select('*', { count: 'exact', head: true });
        
    if (error) {
        console.error('❌ Connection failed:', error);
    } else {
        console.log(`✅ Connection successful! Found ${count} records in diva_investment_performance`);
    }
} catch (err) {
    console.error('❌ Error:', err);
}

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