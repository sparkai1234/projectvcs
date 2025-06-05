require('dotenv').config();
const { createClient } = require('@supabase/supabase-js');

console.log('🔍 Testing Supabase Connection');
console.log('===============================');

// Show configuration (without revealing the full key)
const supabaseUrl = process.env.SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY;

console.log('📊 Configuration Check:');
console.log(`- URL: ${supabaseUrl}`);
console.log(`- Key length: ${supabaseKey ? supabaseKey.length : 'undefined'}`);
console.log(`- Key starts with: ${supabaseKey ? supabaseKey.substring(0, 20) + '...' : 'undefined'}`);
console.log(`- Key ends with: ${supabaseKey ? '...' + supabaseKey.substring(supabaseKey.length - 10) : 'undefined'}`);

if (!supabaseUrl || !supabaseKey) {
    console.log('❌ Missing environment variables');
    process.exit(1);
}

// Create client
const supabase = createClient(supabaseUrl, supabaseKey);

async function testConnection() {
    console.log('\n🔗 Testing connection...');
    
    try {
        // First, try to access the database metadata
        const { data, error } = await supabase
            .from('information_schema.tables')
            .select('table_name')
            .eq('table_schema', 'public')
            .limit(1);
            
        if (error) {
            console.log('❌ Connection error:', error.message);
            console.log('   Error details:', error);
            return false;
        }
        
        console.log('✅ Connection successful!');
        console.log('📋 Database accessible');
        return true;
        
    } catch (err) {
        console.log('❌ Unexpected error:', err.message);
        return false;
    }
}

testConnection(); 