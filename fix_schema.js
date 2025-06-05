require('dotenv').config();
const { createClient } = require('@supabase/supabase-js');

console.log('🔧 Fixing VCS Table Schema');
console.log('==========================');

const supabaseUrl = process.env.SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY;

const supabase = createClient(supabaseUrl, supabaseKey);

async function fixSchema() {
    console.log('📋 Adding missing columns to tables...');
    
    try {
        // Note: Supabase JS client doesn't support ALTER TABLE
        // We need to check what columns exist and adjust our data transformation instead
        
        // Let's check current vc_table structure
        console.log('\n🔍 Checking vc_table structure...');
        const { data: vcData, error: vcError } = await supabase
            .from('vc_table')
            .select('*')
            .limit(0);
            
        if (vcError) {
            console.log('VC Table columns based on error:', vcError.message);
        } else {
            console.log('✅ VC Table accessible');
        }
        
        // Check fund_table structure
        console.log('\n🔍 Checking fund_table structure...');
        const { data: fundData, error: fundError } = await supabase
            .from('fund_table')
            .select('*')
            .limit(0);
            
        if (fundError) {
            console.log('Fund Table columns based on error:', fundError.message);
        } else {
            console.log('✅ Fund Table accessible');
        }
        
        console.log('\n📝 Schema fix needed: Use SQL Editor to add missing columns');
        console.log('Run this SQL in Supabase SQL Editor:');
        console.log(`
-- Add missing columns to vc_table
ALTER TABLE vc_table ADD COLUMN IF NOT EXISTS company_name_en VARCHAR(255);

-- Add missing columns to fund_table  
ALTER TABLE fund_table ADD COLUMN IF NOT EXISTS commitment_amount BIGINT;

-- Verify changes
SELECT column_name, data_type 
FROM information_schema.columns 
WHERE table_name IN ('vc_table', 'fund_table') 
AND table_schema = 'public'
ORDER BY table_name, ordinal_position;
        `);
        
    } catch (err) {
        console.error('❌ Error checking schema:', err.message);
    }
}

fixSchema(); 