// 🧹 CLEAR DIVA TABLES - Safe Data Reset Script
// Clears only DIVA tables, preserves all other data
// Date: June 10, 2025

const { createClient } = require('@supabase/supabase-js');

// Supabase configuration
const supabaseUrl = 'https://your-project.supabase.co';
const supabaseKey = 'your-anon-key';
const supabase = createClient(supabaseUrl, supabaseKey);

async function clearDivaTables() {
    console.log('🧹 Starting DIVA tables cleanup...');
    console.log('⚠️  Only DIVA tables will be affected - all other data preserved');
    
    const tables = [
        'diva_investment_performance',
        'diva_financial_statements', 
        'diva_association_status',
        'diva_personnel_status',
        'diva_professional_personnel',
        'diva_violations',
        'diva_vc_map'
    ];
    
    let totalDeleted = 0;
    
    for (const table of tables) {
        try {
            console.log(`\n🗑️  Clearing ${table}...`);
            
            // Get count before deletion
            const { count: beforeCount } = await supabase
                .from(table)
                .select('*', { count: 'exact', head: true });
                
            console.log(`   Found ${beforeCount} records`);
            
            // Delete all records
            const { error } = await supabase
                .from(table)
                .delete()
                .neq('id', 0); // Delete all records (id != 0 catches everything)
                
            if (error) {
                console.error(`   ❌ Error clearing ${table}:`, error);
                continue;
            }
            
            // Verify deletion
            const { count: afterCount } = await supabase
                .from(table)
                .select('*', { count: 'exact', head: true });
                
            console.log(`   ✅ Deleted ${beforeCount} records, ${afterCount} remaining`);
            totalDeleted += beforeCount || 0;
            
        } catch (err) {
            console.error(`   ❌ Failed to clear ${table}:`, err.message);
        }
    }
    
    console.log(`\n🎯 CLEANUP COMPLETE!`);
    console.log(`📊 Total records deleted: ${totalDeleted}`);
    console.log(`✅ All DIVA tables cleared - ready for fresh production run`);
    console.log(`🔒 All other database tables remain untouched`);
}

// Run the cleanup
if (require.main === module) {
    clearDivaTables()
        .then(() => {
            console.log('\n🚀 Ready for clean DIVA scraper deployment!');
            process.exit(0);
        })
        .catch((error) => {
            console.error('\n❌ Cleanup failed:', error);
            process.exit(1);
        });
}

module.exports = { clearDivaTables }; 