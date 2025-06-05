const { createClient } = require('@supabase/supabase-js');
require('dotenv').config();

async function checkTablesExist() {
    console.log('🔍 Checking if database tables exist...');
    
    const supabaseUrl = process.env.SUPABASE_URL;
    const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY;
    
    if (!supabaseKey) {
        console.log('❌ No service role key found');
        return;
    }
    
    try {
        const supabase = createClient(supabaseUrl, supabaseKey);
        
        // Try to get table information from Supabase
        console.log('\n📋 Checking table existence...');
        
        // Method 1: Try to select from tables (will fail if table doesn't exist)
        const { data: vcData, error: vcError } = await supabase
            .from('vc_table')
            .select('count(*)', { count: 'exact' })
            .limit(0);
            
        if (vcError) {
            console.log('❌ vc_table error:', vcError.message);
            if (vcError.message.includes('relation') && vcError.message.includes('does not exist')) {
                console.log('💡 The vc_table does not exist in your database!');
            }
        } else {
            console.log('✅ vc_table exists');
        }
        
        const { data: fundData, error: fundError } = await supabase
            .from('fund_table')
            .select('count(*)', { count: 'exact' })
            .limit(0);
            
        if (fundError) {
            console.log('❌ fund_table error:', fundError.message);
            if (fundError.message.includes('relation') && fundError.message.includes('does not exist')) {
                console.log('💡 The fund_table does not exist in your database!');
            }
        } else {
            console.log('✅ fund_table exists');
        }
        
    } catch (error) {
        console.log('💥 Error checking tables:', error.message);
    }
}

checkTablesExist(); 