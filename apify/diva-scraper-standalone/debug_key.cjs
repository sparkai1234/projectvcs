// 🔍 DEBUG SUPABASE KEY - Test different keys
const { createClient } = require('@supabase/supabase-js');

const supabaseUrl = 'https://udfgtccxbqmalgpqyxzz.supabase.co';

// Test different keys
const keys = [
    {
        name: 'SUPABASE_SERVICE_ROLE_KEY env',
        key: process.env.SUPABASE_SERVICE_ROLE_KEY
    },
    {
        name: 'SUPABASE_KEY env', 
        key: process.env.SUPABASE_KEY
    },
    {
        name: 'Hardcoded service key',
        key: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InVkZmd0Y2N4YnFtYWxncHF5eHp6Iiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTczNDA5Mjg5MCwiZXhwIjoyMDQ5NjY4ODkwfQ.I9sDa9j4R0OYWLxgF7wq3djQRnHGmAmwJJgn5-ZWoZ4'
    },
    {
        name: 'Anon key (from logs)',
        key: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InVkZmd0Y2N4YnFtYWxncHF5eHp6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzQwOTI4OTAsImV4cCI6MjA0OTY2ODg5MH0.Ej8rNqZ8xNxqzNQN5B5B5B5B5B5B5B5B5B5B5B5B5B5'
    }
];

async function testKey(name, key) {
    if (!key) {
        console.log(`❌ ${name}: NOT SET`);
        return false;
    }
    
    console.log(`🧪 Testing ${name}...`);
    console.log(`   Key: ${key.substring(0, 20)}...${key.substring(key.length - 10)}`);
    
    try {
        const supabase = createClient(supabaseUrl, key);
        
        const { data, error, count } = await supabase
            .from('diva_investment_performance')
            .select('*', { count: 'exact', head: true });
            
        if (error) {
            console.log(`   ❌ ${name}: ${error.message}`);
            return false;
        } else {
            console.log(`   ✅ ${name}: SUCCESS! Found ${count} records`);
            return true;
        }
    } catch (err) {
        console.log(`   ❌ ${name}: ${err.message}`);
        return false;
    }
}

async function main() {
    console.log('🔍 TESTING DIFFERENT SUPABASE KEYS\n');
    
    for (const keyInfo of keys) {
        const success = await testKey(keyInfo.name, keyInfo.key);
        if (success) {
            console.log(`\n🎯 WORKING KEY FOUND: ${keyInfo.name}`);
            break;
        }
        console.log('');
    }
}

main().catch(console.error); 