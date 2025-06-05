import { createClient } from '@supabase/supabase-js';

const supabaseUrl = 'https://udfgtccxbqmalgpqyxzz.supabase.co';
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY;

console.log('🔧 === FIXING DATABASE CONSTRAINTS ===');
console.log(`🕐 Time: ${new Date().toISOString()}`);

if (!supabaseKey) {
    console.error('❌ SUPABASE_SERVICE_ROLE_KEY not found in environment');
    process.exit(1);
}

const supabase = createClient(supabaseUrl, supabaseKey);

async function fixConstraints() {
    try {
        console.log('\n📋 CHECKING CURRENT CONSTRAINTS...');
        
        // Check existing constraints
        const { data: constraints, error: constraintError } = await supabase.rpc('exec_sql', {
            sql: `
                SELECT 
                    tc.table_name, 
                    tc.constraint_name, 
                    tc.constraint_type,
                    kcu.column_name
                FROM information_schema.table_constraints tc
                JOIN information_schema.key_column_usage kcu 
                    ON tc.constraint_name = kcu.constraint_name
                WHERE tc.table_schema = 'public' 
                    AND tc.table_name IN ('vc_table', 'fund_table')
                    AND tc.constraint_type = 'UNIQUE'
                ORDER BY tc.table_name, tc.constraint_name;
            `
        });

        if (constraintError) {
            console.log('⚠️ Unable to check constraints via RPC, trying direct query...');
            
            // Try direct query instead
            const { data: directConstraints, error: directError } = await supabase
                .from('information_schema.table_constraints')
                .select('table_name, constraint_name, constraint_type')
                .in('table_name', ['vc_table', 'fund_table'])
                .eq('constraint_type', 'UNIQUE');
                
            if (directError) {
                console.log('⚠️ Direct constraint check also failed, proceeding with fix...');
            } else {
                console.log('📊 Current constraints:', directConstraints);
            }
        } else {
            console.log('📊 Current constraints:', constraints);
        }

        console.log('\n🔧 ADDING UNIQUE CONSTRAINT FOR fund_name...');
        
        // Add unique constraint for fund_name
        const { data, error } = await supabase.rpc('exec_sql', {
            sql: 'ALTER TABLE fund_table ADD CONSTRAINT fund_table_fund_name_unique UNIQUE (fund_name);'
        });

        if (error) {
            if (error.message.includes('already exists')) {
                console.log('✅ Constraint already exists - no action needed');
            } else {
                console.error('❌ Error adding constraint:', error.message);
                
                // Try alternative approach - check if we can query the table structure
                console.log('\n🔍 CHECKING TABLE STRUCTURE...');
                const { data: tableInfo } = await supabase
                    .from('fund_table')
                    .select('fund_name')
                    .limit(1);
                    
                if (tableInfo) {
                    console.log('✅ fund_table is accessible');
                    
                    // Try manual constraint addition via SQL editor approach
                    console.log('\n⚠️ MANUAL ACTION REQUIRED:');
                    console.log('Go to Supabase SQL Editor and run:');
                    console.log('ALTER TABLE fund_table ADD CONSTRAINT fund_table_fund_name_unique UNIQUE (fund_name);');
                }
            }
        } else {
            console.log('✅ Unique constraint added successfully!');
        }

        console.log('\n🧪 TESTING CONSTRAINT...');
        
        // Test if the constraint works by trying to insert duplicate
        const testData = {
            fund_name: 'TEST_DUPLICATE_CHECK',
            company_id: 'test_company',
            fund_name_en: null,
            fund_type: 'test',
            commitment_amount: null,
            fund_size: 100,
            establishment_date: '2023-01-01',
            fund_status: 'active',
            representative: null,
            investment_focus: [],
            fund_details: {},
            apify_source: 'CONSTRAINT_TEST',
            created_at: new Date().toISOString(),
            updated_at: new Date().toISOString()
        };

        // First insert
        const { error: insertError1 } = await supabase
            .from('fund_table')
            .insert(testData);

        if (insertError1) {
            console.log('❌ Test insert 1 failed:', insertError1.message);
        } else {
            console.log('✅ Test insert 1 successful');

            // Second insert (should fail if constraint works)
            const { error: insertError2 } = await supabase
                .from('fund_table')
                .insert(testData);

            if (insertError2) {
                console.log('✅ Constraint working! Duplicate rejected:', insertError2.message);
            } else {
                console.log('⚠️ No duplicate rejection - constraint may not be working');
            }

            // Clean up test data
            await supabase
                .from('fund_table')
                .delete()
                .eq('fund_name', 'TEST_DUPLICATE_CHECK');
            
            console.log('🧹 Test data cleaned up');
        }

    } catch (error) {
        console.error('💥 Critical error:', error.message);
    }
}

fixConstraints(); 