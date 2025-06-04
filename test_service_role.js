// 🔧 Test Service Role Key Connection
require('dotenv').config();
const { createClient } = require('@supabase/supabase-js');

console.log('🔑 Testing SUPABASE_SERVICE_ROLE_KEY...');

const supabaseUrl = process.env.SUPABASE_URL;
const serviceKey = process.env.SUPABASE_SERVICE_ROLE_KEY;

console.log('URL:', supabaseUrl);
console.log('Service Key exists:', !!serviceKey);
console.log('Service Key length:', serviceKey ? serviceKey.length : 'N/A');

if (!serviceKey) {
    console.error('❌ SUPABASE_SERVICE_ROLE_KEY not found in .env');
    process.exit(1);
}

const supabase = createClient(supabaseUrl, serviceKey);

async function testConnection() {
    try {
        console.log('\n🧪 Testing connection to diva_vcmap_raw...');
        
        const { data, error } = await supabase
            .from('diva_vcmap_raw')
            .select('count(*)', { count: 'exact', head: true });
        
        if (error) {
            console.error('❌ Connection error:', error);
            console.error('Error details:', JSON.stringify(error, null, 2));
        } else {
            console.log('✅ Connection successful!');
            console.log('Current record count:', data);
        }
        
        // Test insert permissions
        console.log('\n🧪 Testing insert permissions...');
        const testRecord = {
            company_name: 'TEST_COMPANY_' + Date.now(),
            company_id: 'TEST_ID',
            ranking: 999,
            map_type: 'test',
            sort_criteria: 'test',
            extracted_at: new Date().toISOString()
        };
        
        const { data: insertData, error: insertError } = await supabase
            .from('diva_vcmap_raw')
            .insert([testRecord])
            .select();
        
        if (insertError) {
            console.error('❌ Insert error:', insertError);
        } else {
            console.log('✅ Insert successful!');
            
            // Clean up test record
            await supabase
                .from('diva_vcmap_raw')
                .delete()
                .eq('company_name', testRecord.company_name);
            console.log('🧹 Test record cleaned up');
        }
        
    } catch (error) {
        console.error('💥 Critical error:', error);
    }
}

testConnection(); 