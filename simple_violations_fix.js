const { createClient } = require('@supabase/supabase-js');

async function fixViolationsColumn() {
    console.log('🔧 Adding missing classification_name column to diva_violation_raw...');
    
    const supabase = createClient(
        'https://udfgtccxbqmalgpqyxzz.supabase.co',
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InVkZmd0Y2N4YnFtYWxncHF5eHp6Iiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc0ODk0NjY5NiwiZXhwIjoyMDY0NTIyNjk2fQ.JgyEKjOhuZpNCCOadsaK90Q8CcoPf_rgdtSXh-1BU18'
    );
    
    // Test data that matches what the scraper is trying to insert
    const testRecord = {
        number: 'TEST_' + Date.now(),
        company_name: '테스트회사',
        action_date: '2025-06-06',
        action_end_date: null,
        classification_name: '-',
        correction_type: '전자보고',
        violation_type: '1년간 미투자',
        action_type: '경고',
        extracted_at: new Date().toISOString(),
        source_url: 'http://test.url'
    };
    
    console.log('📝 Testing insert with expected data structure...');
    
    const { data, error } = await supabase
        .from('diva_violation_raw')
        .insert(testRecord)
        .select();
    
    if (error) {
        console.error('❌ Insert failed:', error.message);
        
        if (error.message.includes('classification_name')) {
            console.log('');
            console.log('🔧 SOLUTION REQUIRED:');
            console.log('The classification_name column is missing from diva_violation_raw table.');
            console.log('');
            console.log('Please run this SQL command in Supabase dashboard:');
            console.log('');
            console.log('ALTER TABLE diva_violation_raw ADD COLUMN classification_name TEXT;');
            console.log('');
            console.log('Steps:');
            console.log('1. Go to https://supabase.com/dashboard');
            console.log('2. Select your project');
            console.log('3. Go to SQL Editor');
            console.log('4. Paste and run the ALTER TABLE command above');
            console.log('5. Re-run your Apify scraper');
        }
    } else {
        console.log('✅ Insert successful! Schema is correct.');
        console.log('Data inserted:', data[0]);
        
        // Clean up test record
        await supabase
            .from('diva_violation_raw')
            .delete()
            .eq('number', testRecord.number);
        console.log('✅ Test record cleaned up');
    }
}

fixViolationsColumn().catch(console.error); 