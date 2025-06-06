const { createClient } = require('@supabase/supabase-js');

const supabase = createClient(
  'https://udfgtccxbqmalgpqyxzz.supabase.co',
  'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InVkZmd0Y2N4YnFtYWxncHF5eHp6Iiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY5MDQ3MjIzNiwiZXhwIjoyMDA2MDQ4MjM2fQ.U5zlqhHlVNZaBzOjWMjcQcQRgxnxM1sHY5lOOoJcF0o'
);

async function checkPersonnelTableStructure() {
  try {
    // Check table columns using information_schema
    const { data, error } = await supabase
      .from('information_schema.columns')
      .select('column_name, data_type, is_nullable, column_default')
      .eq('table_name', 'diva_personnel_raw')
      .order('ordinal_position');

    if (error) {
      console.log('Error checking table structure:', error);
      return;
    }

    console.log('Current diva_personnel_raw table structure:');
    console.log('=====================================');
    
    if (data && data.length > 0) {
      data.forEach((col, index) => {
        console.log(`${index + 1}. ${col.column_name} (${col.data_type}) - Nullable: ${col.is_nullable}`);
      });
      
      // Check if management_support_staff already exists
      const hasManagementSupport = data.some(col => col.column_name === 'management_support_staff');
      console.log('\n=====================================');
      console.log(`management_support_staff column exists: ${hasManagementSupport}`);
      
    } else {
      console.log('Table diva_personnel_raw does not exist or has no columns');
    }

  } catch (err) {
    console.error('Error:', err);
  }
}

checkPersonnelTableStructure(); 