// 🔍 SIMPLE SUPABASE CONNECTION TEST
import { createClient } from '@supabase/supabase-js';

console.log('🧪 Testing Supabase connection...');

// Supabase configuration
const supabaseUrl = 'https://udfgtccxbqmalgpqyxzz.supabase.co';
const supabaseKey = process.env.SUPABASE_KEY || 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InVkZmd0Y2N4YnFtYWxncHF5eHp6Iiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTczNDA5Mjg5MCwiZXhwIjoyMDQ5NjY4ODkwfQ.I9sDa9j4R0OYWLxgF7wq3djQRnHGmAmwJJgn5-ZWoZ4';

console.log(`📍 URL: ${supabaseUrl}`);
console.log(`🔑 Key: ${supabaseKey ? 'SET' : 'NOT SET'}`);

const supabase = createClient(supabaseUrl, supabaseKey);

try {
    console.log('\n📊 Testing table counts...');
    
    const tables = [
        'diva_investment_performance',
        'diva_financial_statements', 
        'diva_association_status',
        'diva_personnel_status',
        'diva_professional_personnel',
        'diva_violations',
        'diva_vc_map'
    ];
    
    for (const table of tables) {
        const { data, error, count } = await supabase
            .from(table)
            .select('*', { count: 'exact', head: true });
            
        if (error) {
            console.log(`   ❌ ${table}: ${error.message}`);
        } else {
            console.log(`   ✅ ${table}: ${count} records`);
        }
    }
    
} catch (err) {
    console.error('❌ Error:', err);
} 