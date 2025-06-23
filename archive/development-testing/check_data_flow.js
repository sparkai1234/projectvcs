require('dotenv').config();
const { createClient } = require('@supabase/supabase-js');

const supabaseUrl = process.env.SUPABASE_URL;
const supabaseServiceKey = process.env.SUPABASE_SERVICE_ROLE_KEY;

const supabase = createClient(supabaseUrl, supabaseServiceKey);

async function checkDataFlow() {
    console.log('🔍 VCS Data Flow Analysis');
    console.log('=' .repeat(40));
    
    try {
        // 1. Data Volume Analysis
        console.log('\n📊 DATA VOLUME ANALYSIS:');
        const { count: vcCount } = await supabase.from('vc_table').select('*', { count: 'exact' });
        const { count: fundCount } = await supabase.from('fund_table').select('*', { count: 'exact' });
        
        console.log(`👥 VCs in database: ${vcCount || 0}`);
        console.log(`💰 Funds in database: ${fundCount || 0}`);
        console.log(`📈 Total records: ${(vcCount || 0) + (fundCount || 0)}`);
        
        // 2. Data Freshness Check
        console.log('\n⏰ DATA FRESHNESS CHECK:');
        const oneHourAgo = new Date(Date.now() - 60 * 60 * 1000).toISOString();
        const { count: recentVCs } = await supabase
            .from('vc_table')
            .select('*', { count: 'exact' })
            .gte('created_at', oneHourAgo);
        const { count: recentFunds } = await supabase
            .from('fund_table')
            .select('*', { count: 'exact' })
            .gte('created_at', oneHourAgo);
            
        console.log(`🔥 VCs added in last hour: ${recentVCs || 0}`);
        console.log(`🔥 Funds added in last hour: ${recentFunds || 0}`);
        console.log(`⚡ Hourly rate: ${(recentVCs || 0) + (recentFunds || 0)} records/hour`);
        
        // 3. Data Quality Analysis
        console.log('\n🎯 DATA QUALITY ANALYSIS:');
        
        // VC Data Quality
        const { data: vcSample } = await supabase
            .from('vc_table')
            .select('name, company_name, position, contact_info')
            .not('name', 'is', null)
            .limit(10);
            
        const { count: vcWithNames } = await supabase
            .from('vc_table')
            .select('*', { count: 'exact' })
            .not('name', 'is', null);
            
        const { count: vcWithCompanies } = await supabase
            .from('vc_table')
            .select('*', { count: 'exact' })
            .not('company_name', 'is', null);
            
        console.log(`📝 VCs with names: ${vcWithNames || 0}/${vcCount || 0} (${((vcWithNames/vcCount)*100).toFixed(1)}%)`);
        console.log(`🏢 VCs with companies: ${vcWithCompanies || 0}/${vcCount || 0} (${((vcWithCompanies/vcCount)*100).toFixed(1)}%)`);
        
        // Fund Data Quality
        const { count: fundsWithNames } = await supabase
            .from('fund_table')
            .select('*', { count: 'exact' })
            .not('fund_name', 'is', null);
            
        const { count: fundsWithTypes } = await supabase
            .from('fund_table')
            .select('*', { count: 'exact' })
            .not('fund_type', 'is', null);
            
        console.log(`💼 Funds with names: ${fundsWithNames || 0}/${fundCount || 0} (${((fundsWithNames/fundCount)*100).toFixed(1)}%)`);
        console.log(`🎭 Funds with types: ${fundsWithTypes || 0}/${fundCount || 0} (${((fundsWithTypes/fundCount)*100).toFixed(1)}%)`);
        
        // 4. Sample Data Preview
        console.log('\n👀 SAMPLE DATA PREVIEW:');
        console.log('\n🏆 Latest VCs:');
        const { data: latestVCs } = await supabase
            .from('vc_table')
            .select('name, company_name, position')
            .order('created_at', { ascending: false })
            .limit(3);
            
        latestVCs?.forEach((vc, i) => {
            console.log(`   ${i+1}. ${vc.name || 'N/A'} - ${vc.company_name || 'N/A'} (${vc.position || 'N/A'})`);
        });
        
        console.log('\n💎 Latest Funds:');
        const { data: latestFunds } = await supabase
            .from('fund_table')
            .select('fund_name, fund_type, commitment_amount')
            .order('created_at', { ascending: false })
            .limit(3);
            
        latestFunds?.forEach((fund, i) => {
            console.log(`   ${i+1}. ${fund.fund_name || 'N/A'} - ${fund.fund_type || 'N/A'} (${fund.commitment_amount || 'N/A'})`);
        });
        
        // 5. Growth Rate Analysis
        console.log('\n📈 GROWTH RATE ANALYSIS:');
        const now = new Date();
        const intervals = [5, 10, 15, 30]; // minutes
        
        for (const minutes of intervals) {
            const timeAgo = new Date(now.getTime() - minutes * 60 * 1000).toISOString();
            const { count: vcGrowth } = await supabase
                .from('vc_table')
                .select('*', { count: 'exact' })
                .gte('created_at', timeAgo);
            const { count: fundGrowth } = await supabase
                .from('fund_table')
                .select('*', { count: 'exact' })
                .gte('created_at', timeAgo);
                
            const totalGrowth = (vcGrowth || 0) + (fundGrowth || 0);
            const ratePerHour = Math.round((totalGrowth / minutes) * 60);
            console.log(`⏱️  Last ${minutes}min: ${totalGrowth} records (${ratePerHour}/hour rate)`);
        }
        
        // 6. Expected vs Actual Progress
        console.log('\n🎯 PROGRESS TRACKING:');
        const expectedTotal = 4406;
        const currentTotal = (vcCount || 0) + (fundCount || 0);
        const progressPercent = ((currentTotal / expectedTotal) * 100).toFixed(1);
        const expectedVCs = 717;
        const expectedFunds = 3689;
        
        console.log(`📊 Overall: ${currentTotal}/${expectedTotal} (${progressPercent}%)`);
        console.log(`👥 VCs: ${vcCount || 0}/${expectedVCs} (${(((vcCount || 0)/expectedVCs)*100).toFixed(1)}%)`);
        console.log(`💰 Funds: ${fundCount || 0}/${expectedFunds} (${(((fundCount || 0)/expectedFunds)*100).toFixed(1)}%)`);
        
        // 7. Health Status
        console.log('\n🏥 SYSTEM HEALTH:');
        const isHealthy = (recentVCs || 0) + (recentFunds || 0) > 0;
        const dataQuality = ((vcWithNames || 0) + (fundsWithNames || 0)) / ((vcCount || 1) + (fundCount || 1));
        
        console.log(`💓 Data Flow: ${isHealthy ? '✅ ACTIVE' : '⚠️ SLOW/STOPPED'}`);
        console.log(`🎯 Data Quality: ${(dataQuality * 100).toFixed(1)}% complete records`);
        console.log(`🔄 Status: ${progressPercent > 0 ? '🚀 RUNNING' : '⏳ STARTING'}`);
        
    } catch (error) {
        console.error('💥 Data Flow Check Error:', error.message);
    }
}

checkDataFlow(); 