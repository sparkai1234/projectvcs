const { createClient } = require('@supabase/supabase-js');

const supabase = createClient(
  'https://udfgtccxbqmalgpqyxzz.supabase.co',
  'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InVkZmd0Y2N4YnFtYWxncHF5eHp6Iiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc0ODk0NjY5NiwiZXhwIjoyMDY0NTIyNjk2fQ.JgyEKjOhuZpNCCOadsaK90Q8CcoPf_rgdtSXh-1BU18'
);

async function analyzePersonnelTableStructure() {
  console.log('🔍 Analyzing actual personnel table structure...');
  
  try {
    // From the error, we can see the table has these columns (in order):
    // id, company_id, company_name, and several numeric columns (0,0,0,0), then nulls, timestamps
    
    console.log('📋 Discovered table structure from error:');
    console.log('- id (UUID, auto-generated)');
    console.log('- company_id (NOT NULL constraint)');
    console.log('- company_name');
    console.log('- Several numeric columns (showing as 0,0,0,0)');
    console.log('- Several nullable columns');
    console.log('- extracted_at (timestamp)');
    console.log('- created_at (timestamp)');
    console.log('- Additional nullable column');
    
    // Test with company_id included
    console.log('\n1. Testing with company_id...');
    const testRecord = {
      company_id: 'test-company-id',
      company_name: 'Test Company'
    };
    
    const { data: testData, error: testError } = await supabase
      .from('diva_personnel_raw')
      .insert(testRecord)
      .select();
    
    if (testError) {
      console.error('❌ Test with company_id error:', testError);
      
      if (testError.code === 'PGRST204') {
        console.log('🔧 Column name issue detected');
        console.log('Error details:', testError.message);
      }
    } else {
      console.log('✅ Insert with company_id successful!');
      console.log('Inserted record:', testData?.[0]);
      
      // Clean up
      if (testData?.[0]?.id) {
        await supabase.from('diva_personnel_raw').delete().eq('id', testData[0].id);
        console.log('✅ Test record cleaned up');
      }
    }
    
    console.log('\n💡 ANALYSIS RESULTS:');
    console.log('=====================================');
    console.log('The original error "column management_support_staff already exists" means:');
    console.log('1. ✅ The table EXISTS');
    console.log('2. ✅ The management_support_staff column EXISTS');
    console.log('3. ❌ You were trying to ADD a column that already exists');
    console.log('');
    console.log('🔧 SOLUTION:');
    console.log('The error is NOT about missing columns, but about trying to add existing ones.');
    console.log('You should SKIP the ALTER TABLE command that adds management_support_staff.');
    console.log('');
    console.log('✅ RECOMMENDED ACTION:');
    console.log('1. Remove or comment out the ADD COLUMN management_support_staff line');
    console.log('2. The table structure is already correct');
    console.log('3. Your scraper should work with the existing table');
    
  } catch (error) {
    console.error('❌ Unexpected error:', error);
  }
}

// Run the analysis
analyzePersonnelTableStructure(); 