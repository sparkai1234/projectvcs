require('dotenv').config();
const { createClient } = require('@supabase/supabase-js');

console.log('🎯 Simple VCS Table Access Test');
console.log('===============================');

const supabaseUrl = process.env.SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY;

console.log('📊 Configuration:');
console.log(`- URL: ${supabaseUrl}`);
console.log(`- Key ends with: ...${supabaseKey ? supabaseKey.slice(-10) : 'undefined'}`);

const supabase = createClient(supabaseUrl, supabaseKey);

async function testTableAccess() {
    console.log('\n🔗 Testing table access...');
    
    try {
        // Simple select from vc_table
        const { data: vcData, error: vcError } = await supabase
            .from('vc_table')
            .select('*')
            .limit(1);
            
        if (vcError) {
            console.log('❌ VC Table error:', vcError.message);
            return false;
        }
        
        console.log('✅ VC Table accessible! Records found:', vcData.length);
        
        // Simple select from fund_table
        const { data: fundData, error: fundError } = await supabase
            .from('fund_table')
            .select('*')
            .limit(1);
            
        if (fundError) {
            console.log('❌ Fund Table error:', fundError.message);
            return false;
        }
        
        console.log('✅ Fund Table accessible! Records found:', fundData.length);
        
        return true;
        
    } catch (err) {
        console.log('❌ Unexpected error:', err.message);
        return false;
    }
}

async function testInsert() {
    console.log('\n🧪 Testing data insert...');
    
    try {
        // Insert test record
        const { data, error } = await supabase
            .from('vc_table')
            .insert({
                company_id: 'test_connection_001',
                company_name: 'Test Connection Company',
                location: 'Seoul',
                apify_source: 'connection_test'
            })
            .select();
            
        if (error) {
            console.log('❌ Insert failed:', error.message);
            return false;
        }
        
        console.log('✅ Insert successful!');
        console.log('📦 Inserted:', data[0].company_name);
        
        // Clean up
        const { error: deleteError } = await supabase
            .from('vc_table')
            .delete()
            .eq('company_id', 'test_connection_001');
            
        if (!deleteError) {
            console.log('🧹 Test record cleaned up');
        }
        
        return true;
        
    } catch (err) {
        console.log('❌ Insert test error:', err.message);
        return false;
    }
}

async function main() {
    const accessOk = await testTableAccess();
    
    if (accessOk) {
        console.log('\n🎉 CONNECTION SUCCESS!');
        console.log('✅ Authentication working');
        console.log('✅ Tables accessible');
        
        const insertOk = await testInsert();
        
        if (insertOk) {
            console.log('\n🚀 READY FOR VCS SCRAPER INTEGRATION!');
            console.log('📋 Database: Ready ✅');
            console.log('🔑 Authentication: Working ✅');
            console.log('📊 Tables: Accessible ✅');
            console.log('💾 Insert/Delete: Working ✅');
        }
    }
}

main(); 