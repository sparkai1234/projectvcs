const { createClient } = require('@supabase/supabase-js');

const supabase = createClient(
    'https://udfgtccxbqmalgpqyxzz.supabase.co',
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InVkZmd0Y2N4YnFtYWxncHF5eHp6Iiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc0ODk0NjY5NiwiZXhwIjoyMDY0NTIyNjk2fQ.JgyEKjOhuZpNCCOadsaK90Q8CcoPf_rgdtSXh-1BU18'
);

async function checkViolationsSchema() {
    console.log('🔍 Checking violations table schema...');
    
    // Test violations table structure
    const testData = {
        violation_number: 1,
        company_name: 'Test Company',
        action_date: '2024-01-01',
        expected_action_date: '2024-01-01', 
        correction_completion_date: '2024-01-01',
        inspection_category: 'Test',
        violation_type: 'Test',
        action_category: 'Test',
        data_year: 2024,
        source_url: 'test',
        extracted_at: new Date().toISOString()
    };
    
    const { data, error } = await supabase
        .from('diva_violations')
        .insert([testData])
        .select();
        
    if (error) {
        console.log('❌ Schema error:', error.message);
        console.log('💡 Error details:', error.details);
        console.log('🔧 Hint:', error.hint);
    } else {
        console.log('✅ Schema test passed!');
        console.log('Inserted data:', data[0]);
        // Cleanup
        await supabase.from('diva_violations').delete().eq('violation_number', 1);
        console.log('🧹 Test record cleaned up');
    }
}

checkViolationsSchema().catch(console.error); 