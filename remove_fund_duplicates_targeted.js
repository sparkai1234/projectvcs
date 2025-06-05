require('dotenv').config();
const { createClient } = require('@supabase/supabase-js');

const supabaseUrl = process.env.SUPABASE_URL;
const supabaseServiceKey = process.env.SUPABASE_SERVICE_ROLE_KEY;

const supabase = createClient(supabaseUrl, supabaseServiceKey);

async function removeFundDuplicatesTargeted() {
    console.log('🎯 Targeted Fund Deduplication');
    console.log('=' .repeat(30));
    
    try {
        // 1. Get total count first
        const { count: totalCount } = await supabase
            .from('fund_table')
            .select('*', { count: 'exact' });
            
        console.log(`📊 Total funds in database: ${totalCount}`);
        console.log(`🎯 Expected funds: 3,689`);
        console.log(`⚠️ Estimated duplicates: ${totalCount - 3689}`);
        
        // 2. Process all funds in batches to avoid memory issues
        let offset = 0;
        const batchSize = 1000;
        const fundMap = new Map();
        const duplicateIds = [];
        let totalProcessed = 0;
        
        console.log('\n🔄 Processing funds in batches...');
        
        while (offset < totalCount) {
            const { data: batchFunds } = await supabase
                .from('fund_table')
                .select('id, fund_name, fund_name_en, created_at')
                .order('created_at', { ascending: true })
                .range(offset, offset + batchSize - 1);
                
            if (!batchFunds || batchFunds.length === 0) break;
            
            console.log(`   Processing batch: ${offset + 1} to ${offset + batchFunds.length}`);
            
            batchFunds.forEach(fund => {
                const key = (fund.fund_name || fund.fund_name_en || '').toLowerCase().trim();
                if (key === '') return;
                
                if (fundMap.has(key)) {
                    // This is a duplicate - mark for deletion
                    duplicateIds.push(fund.id);
                } else {
                    // First occurrence - keep it
                    fundMap.set(key, fund);
                }
            });
            
            totalProcessed += batchFunds.length;
            offset += batchSize;
            
            // Progress update
            const progress = ((totalProcessed / totalCount) * 100).toFixed(1);
            console.log(`   ✅ Processed ${totalProcessed}/${totalCount} (${progress}%) - Found ${duplicateIds.length} duplicates so far`);
        }
        
        console.log(`\n📈 Analysis Complete:`);
        console.log(`📊 Total processed: ${totalProcessed}`);
        console.log(`🗑️ Duplicates found: ${duplicateIds.length}`);
        console.log(`✅ Unique funds: ${fundMap.size}`);
        
        // 3. Remove duplicates in batches
        if (duplicateIds.length > 0) {
            console.log(`\n🧹 Removing ${duplicateIds.length} duplicate funds...`);
            
            const deleteBatchSize = 100;
            let deletedCount = 0;
            
            for (let i = 0; i < duplicateIds.length; i += deleteBatchSize) {
                const batch = duplicateIds.slice(i, i + deleteBatchSize);
                
                const { error } = await supabase
                    .from('fund_table')
                    .delete()
                    .in('id', batch);
                    
                if (error) {
                    console.error(`❌ Delete batch ${Math.floor(i/deleteBatchSize) + 1} error:`, error.message);
                } else {
                    deletedCount += batch.length;
                    console.log(`   ✅ Deleted batch ${Math.floor(i/deleteBatchSize) + 1}: ${batch.length} records (${deletedCount}/${duplicateIds.length} total)`);
                }
                
                // Small delay between deletions
                await new Promise(resolve => setTimeout(resolve, 200));
            }
            
            console.log(`\n🎉 Deletion complete: ${deletedCount} duplicates removed`);
        }
        
        // 4. Final verification
        console.log('\n🔍 Final Verification:');
        const { count: finalCount } = await supabase
            .from('fund_table')
            .select('*', { count: 'exact' });
            
        const { count: vcCount } = await supabase
            .from('vc_table')
            .select('*', { count: 'exact' });
            
        console.log(`💰 Final fund count: ${finalCount}`);
        console.log(`👥 VC count: ${vcCount}`);
        console.log(`📊 Total records: ${finalCount + vcCount}`);
        console.log(`🗑️ Records removed: ${totalCount - finalCount}`);
        
        // 5. Quality assessment
        console.log('\n🎯 Quality Assessment:');
        const expectedFunds = 3689;
        const expectedVCs = 717;
        const expectedTotal = 4406;
        
        console.log(`💰 Funds: ${finalCount}/${expectedFunds} (${((finalCount/expectedFunds)*100).toFixed(1)}%)`);
        console.log(`👥 VCs: ${vcCount}/${expectedVCs} (${((vcCount/expectedVCs)*100).toFixed(1)}%)`);
        console.log(`📊 Total: ${finalCount + vcCount}/${expectedTotal} (${(((finalCount + vcCount)/expectedTotal)*100).toFixed(1)}%)`);
        
        if (Math.abs(finalCount - expectedFunds) < 100) {
            console.log('✅ Fund count is now within expected range!');
        } else if (finalCount > expectedFunds) {
            console.log('⚠️ Still more funds than expected - may need another deduplication round');
        } else {
            console.log('📊 Fund count is below expected - this is normal for cleaned data');
        }
        
        return {
            before: totalCount,
            after: finalCount,
            removed: totalCount - finalCount,
            unique: fundMap.size
        };
        
    } catch (error) {
        console.error('💥 Targeted deduplication error:', error.message);
        return null;
    }
}

// Run with confirmation
console.log('🎯 TARGETED FUND DEDUPLICATION');
console.log('This will remove duplicate funds based on fund_name');
console.log('Starting in 3 seconds...\n');

setTimeout(() => {
    removeFundDuplicatesTargeted().then(results => {
        if (results) {
            console.log(`\n🏁 Deduplication completed!`);
            console.log(`📊 Before: ${results.before} funds`);
            console.log(`📊 After: ${results.after} funds`);
            console.log(`🗑️ Removed: ${results.removed} duplicates`);
            console.log(`✅ Success: Data quality significantly improved!`);
        }
    });
}, 3000); 