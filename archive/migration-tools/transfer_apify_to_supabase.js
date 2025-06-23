require('dotenv').config();
const { createClient } = require('@supabase/supabase-js');
const { ApifyApi } = require('apify-client');

const supabase = createClient(process.env.SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);
const apifyClient = new ApifyApi({
    token: process.env.APIFY_API_TOKEN || 'YOUR_APIFY_TOKEN_HERE'
});

async function transferApifyToSupabase() {
    console.log('🔄 Transferring Fresh Data: Apify → Supabase');
    console.log('=' .repeat(45));
    
    try {
        // Get the latest dataset from the actor run
        console.log('📊 Fetching fresh data from Apify...');
        
        // You'll need to replace this with your actual actor run ID
        const runId = 'dwgov3btGBHA66QUt'; // From the logs URL
        
        const dataset = await apifyClient.dataset(runId).downloadItems('json');
        
        console.log(`📈 Retrieved ${dataset.length} records from Apify`);
        
        // Separate VCs and Funds
        const vcs = dataset.filter(item => item.type === 'investor' || !item.fund_name);
        const funds = dataset.filter(item => item.type === 'fund' || item.fund_name);
        
        console.log(`👥 VCs to transfer: ${vcs.length}`);
        console.log(`💰 Funds to transfer: ${funds.length}`);
        
        // Transform and insert VCs
        if (vcs.length > 0) {
            console.log('\n🔄 Transferring VCs to Supabase...');
            
            const transformedVCs = vcs.map(vc => ({
                name: vc.name,
                company_name: vc.company_name || vc.companyName,
                position: vc.position,
                contact_info: vc.contact_info || vc.contactInfo,
                company_name_en: vc.company_name_en,
                created_at: new Date().toISOString()
            }));
            
            const { error: vcError } = await supabase
                .from('vc_table')
                .insert(transformedVCs);
                
            if (vcError) {
                console.error('❌ VC insertion error:', vcError.message);
            } else {
                console.log(`✅ Successfully inserted ${vcs.length} VCs`);
            }
        }
        
        // Transform and insert Funds
        if (funds.length > 0) {
            console.log('\n🔄 Transferring Funds to Supabase...');
            
            const transformedFunds = funds.map(fund => ({
                fund_name: fund.fund_name || fund.fundName,
                fund_name_en: fund.fund_name_en,
                fund_type: fund.fund_type || fund.fundType,
                investment_focus: fund.investment_focus || fund.investmentFocus,
                commitment_amount: fund.commitment_amount || fund.commitmentAmount,
                fund_details: fund.fund_details || fund.fundDetails,
                created_at: new Date().toISOString()
            }));
            
            // Insert in batches to avoid timeout
            const batchSize = 100;
            let insertedCount = 0;
            
            for (let i = 0; i < transformedFunds.length; i += batchSize) {
                const batch = transformedFunds.slice(i, i + batchSize);
                
                const { error: fundError } = await supabase
                    .from('fund_table')
                    .insert(batch);
                    
                if (fundError) {
                    console.error(`❌ Fund batch ${Math.floor(i/batchSize) + 1} error:`, fundError.message);
                } else {
                    insertedCount += batch.length;
                    console.log(`✅ Inserted batch ${Math.floor(i/batchSize) + 1}: ${batch.length} funds (${insertedCount}/${funds.length} total)`);
                }
                
                // Small delay between batches
                await new Promise(resolve => setTimeout(resolve, 100));
            }
        }
        
        // Final verification
        console.log('\n🔍 Transfer Verification:');
        const { count: finalVCs } = await supabase.from('vc_table').select('*', { count: 'exact' });
        const { count: finalFunds } = await supabase.from('fund_table').select('*', { count: 'exact' });
        
        console.log(`👥 VCs in Supabase: ${finalVCs || 0}/717`);
        console.log(`💰 Funds in Supabase: ${finalFunds || 0}/3689`);
        console.log(`📊 Total in Supabase: ${(finalVCs || 0) + (finalFunds || 0)}/4406`);
        
        if ((finalVCs || 0) === 717 && (finalFunds || 0) === 3689) {
            console.log('\n🎉 PERFECT TRANSFER COMPLETED!');
            console.log('✅ 100% authentic data now in Supabase');
            console.log('🚀 Fresh baseline achieved');
        }
        
    } catch (error) {
        console.error('💥 Transfer error:', error.message);
        console.log('\n📋 Manual transfer options:');
        console.log('1. Download data from Apify console');
        console.log('2. Enable Supabase export in actor config');
        console.log('3. Re-run with correct settings');
    }
}

transferApifyToSupabase(); 