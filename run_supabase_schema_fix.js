const { createClient } = require('@supabase/supabase-js');

async function fixDivaPersonnelSchema() {
    console.log('🔧 Fixing DIVA Personnel Schema...');
    
    // Initialize Supabase client
    const supabase = createClient(
        'https://udfgtccxbqmalgpqyxzz.supabase.co',
        process.env.SUPABASE_KEY || 'YOUR_SERVICE_ROLE_KEY_HERE'
    );
    
    try {
        // Add missing column
        const { data, error } = await supabase.rpc('exec_sql', {
            sql: `
                ALTER TABLE diva_personnel_raw 
                ADD COLUMN IF NOT EXISTS management_support_staff INTEGER;
            `
        });
        
        if (error) {
            console.log('⚠️ Using direct column add method...');
            
            // Alternative method - check current structure first
            const { data: columns, error: colError } = await supabase
                .from('information_schema.columns')
                .select('column_name')
                .eq('table_name', 'diva_personnel_raw');
            
            if (colError) {
                console.error('❌ Error checking columns:', colError);
                return;
            }
            
            console.log('📋 Current columns:', columns?.map(c => c.column_name));
            
            const hasManagementColumn = columns?.some(c => c.column_name === 'management_support_staff');
            
            if (!hasManagementColumn) {
                console.log('➕ Adding management_support_staff column...');
                // The column needs to be added via Supabase dashboard or direct SQL
                console.log('🔗 Please run this SQL in Supabase dashboard:');
                console.log('ALTER TABLE diva_personnel_raw ADD COLUMN management_support_staff INTEGER;');
            } else {
                console.log('✅ Column already exists!');
            }
        } else {
            console.log('✅ Schema fix completed successfully!');
        }
        
        // Test insert with the new structure
        const testRecord = {
            company_name: 'Test Company',
            total_personnel: 10,
            professional_staff: 5,
            investment_review_staff: 3,
            management_support_staff: 2,
            extracted_at: new Date().toISOString(),
            source_url: 'test'
        };
        
        const { data: insertData, error: insertError } = await supabase
            .from('diva_personnel_raw')
            .insert(testRecord);
            
        if (insertError) {
            console.error('❌ Test insert failed:', insertError.message);
            console.log('💡 Manual schema fix needed in Supabase dashboard');
        } else {
            console.log('✅ Test insert successful - schema is working!');
            
            // Clean up test record
            await supabase
                .from('diva_personnel_raw')
                .delete()
                .eq('company_name', 'Test Company');
        }
        
    } catch (error) {
        console.error('❌ Schema fix error:', error.message);
        console.log('💡 Please add the column manually in Supabase dashboard:');
        console.log('ALTER TABLE diva_personnel_raw ADD COLUMN management_support_staff INTEGER;');
    }
}

// Run the fix
if (require.main === module) {
    fixDivaPersonnelSchema().catch(console.error);
}

module.exports = { fixDivaPersonnelSchema }; 