require('dotenv').config();
const { createClient } = require('@supabase/supabase-js');

console.log('🎯 Final VCS Supabase Connection Test');
console.log('=====================================');

const supabaseUrl = process.env.SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY;

console.log('📊 Configuration:');
console.log(`- URL: ${supabaseUrl}`);
console.log(`- Key ends with: ...${supabaseKey ? supabaseKey.slice(-10) : 'undefined'}`);

const supabase = createClient(supabaseUrl, supabaseKey);

async function testVCSTables() {
    console.log('\n🔗 Testing VCS table access...');
    
    try {
        // Test vc_table access
        const { data: vcData, error: vcError } = await supabase
            .from('vc_table')
            .select('count(*)')
            .limit(1);
            
        if (vcError) {
            console.log('❌ VC Table error:', vcError.message);
            return false;
        }
        
        console.log('✅ VC Table accessible!');
        
        // Test fund_table access
        const { data: fundData, error: fundError } = await supabase
            .from('fund_table')
            .select('count(*)')
            .limit(1);
            
        if (fundError) {
            console.log('❌ Fund Table error:', fundError.message);
            return false;
        }
        
        console.log('✅ Fund Table accessible!');
        
        console.log('\n🎉 SUCCESS! Supabase connection working perfectly!');
        console.log('📋 Both VCS tables are accessible');
        console.log('🚀 Ready for VCS scraper integration!');
        
        return true;
        
    } catch (err) {
        console.log('❌ Unexpected error:', err.message);
        return false;
    }
}

async function testInsertSample() {
    console.log('\n🧪 Testing sample data insert...');
    
    try {
        // Insert a test record
        const { data, error } = await supabase
            .from('vc_table')
            .insert({
                company_id: 'test_001',
                company_name: 'Test VC Company',
                location: 'Seoul',
                apify_source: 'connection_test'
            })
            .select();
            
        if (error) {
            console.log('❌ Insert test failed:', error.message);
            return false;
        }
        
        console.log('✅ Sample insert successful!');
        console.log('📦 Inserted record:', data[0]);
        
        // Clean up test record
        await supabase
            .from('vc_table')
            .delete()
            .eq('company_id', 'test_001');
            
        console.log('🧹 Test record cleaned up');
        
        return true;
        
    } catch (err) {
        console.log('❌ Insert test error:', err.message);
        return false;
    }
}

async function main() {
    const tablesOk = await testVCSTables();
    if (tablesOk) {
        await testInsertSample();
    }
}

main(); 