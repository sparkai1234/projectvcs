const { createClient } = require('@supabase/supabase-js');

async function fixViolationsTableSchema() {
    console.log('🔧 Fixing DIVA Violations Table Schema...');
    
    // Initialize Supabase client
    const supabase = createClient(
        'https://udfgtccxbqmalgpqyxzz.supabase.co',
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InVkZmd0Y2N4YnFtYWxncHF5eHp6Iiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc0ODk0NjY5NiwiZXhwIjoyMDY0NTIyNjk2fQ.JgyEKjOhuZpNCCOadsaK90Q8CcoPf_rgdtSXh-1BU18'
    );
    
    try {
        console.log('1. Checking current violations table structure...');
        
        // Check current table structure
        const { data: columns, error: colError } = await supabase
            .from('information_schema.columns')
            .select('column_name, data_type, is_nullable')
            .eq('table_name', 'diva_violation_raw')
            .order('ordinal_position');
        
        if (colError) {
            console.error('❌ Error checking table structure:', colError);
            return;
        }
        
        console.log('📋 Current columns:', columns?.map(c => c.column_name));
        
        // Check if classification_name column exists
        const hasClassificationName = columns?.some(c => c.column_name === 'classification_name');
        
        if (hasClassificationName) {
            console.log('✅ classification_name column already exists!');
        } else {
            console.log('❌ classification_name column is missing - needs to be added manually');
            console.log('');
            console.log('🔧 MANUAL FIX REQUIRED:');
            console.log('Please run this SQL command in your Supabase dashboard SQL editor:');
            console.log('');
            console.log('ALTER TABLE diva_violation_raw ADD COLUMN classification_name TEXT;');
            console.log('');
        }
        
        console.log('2. Testing data insertion with expected structure...');
        
        // Test data structure that matches what the scraper is trying to insert
        const testRecord = {
            number: 'TEST_' + Date.now(),
            company_name: 'Test Company',
            action_date: '2025-06-06',
            action_end_date: null,
            classification_name: '-',
            correction_type: '전자보고',
            violation_type: '1년간 미투자',
            action_type: '경고',
            extracted_at: new Date().toISOString(),
            source_url: 'http://test.url'
        };
        
        console.log('📝 Testing with data structure:', testRecord);
        
        const { data: insertData, error: insertError } = await supabase
            .from('diva_violation_raw')
            .insert(testRecord)
            .select();
        
        if (insertError) {
            console.error('❌ Test insert failed:', insertError.message);
            console.log('');
            console.log('💡 SOLUTION:');
            console.log('1. Go to your Supabase dashboard');
            console.log('2. Navigate to SQL Editor');
            console.log('3. Run this command:');
            console.log('   ALTER TABLE diva_violation_raw ADD COLUMN classification_name TEXT;');
            console.log('4. Re-run your Apify scraper');
        } else {
            console.log('✅ Test insert successful!');
            console.log('Inserted record:', insertData?.[0]);
            
            // Clean up test record
            if (insertData?.[0]?.id) {
                await supabase
                    .from('diva_violation_raw')
                    .delete()
                    .eq('id', insertData[0].id);
                console.log('✅ Test record cleaned up');
            }
            
            console.log('🎉 Violations table schema is now correct!');
        }
        
    } catch (error) {
        console.error('❌ Unexpected error:', error.message);
    }
}

// Run the fix
if (require.main === module) {
    fixViolationsTableSchema().catch(console.error);
}

module.exports = { fixViolationsTableSchema }; 