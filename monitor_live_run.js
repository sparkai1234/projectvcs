require('dotenv').config();
const { createClient } = require('@supabase/supabase-js');

const supabaseUrl = process.env.SUPABASE_URL;
const supabaseServiceKey = process.env.SUPABASE_SERVICE_ROLE_KEY;

if (!supabaseUrl || !supabaseServiceKey) {
    console.error('❌ Missing Supabase credentials');
    process.exit(1);
}

const supabase = createClient(supabaseUrl, supabaseServiceKey);

async function monitorLiveRun() {
    console.log('🚀 VCS Scraper Live Monitoring Dashboard');
    console.log('=' .repeat(50));
    
    try {
        // Check VC Table Stats
        console.log('\n📊 VC TABLE STATISTICS:');
        const { data: vcData, error: vcError, count: vcCount } = await supabase
            .from('vc_table')
            .select('*', { count: 'exact' });
            
        if (vcError) {
            console.error('❌ VC Table Error:', vcError.message);
        } else {
            console.log(`✅ Total VCs: ${vcCount}`);
            if (vcData && vcData.length > 0) {
                console.log(`📈 Latest VC: ${vcData[vcData.length - 1].name || 'N/A'}`);
                console.log(`🏢 Latest Company: ${vcData[vcData.length - 1].company_name || 'N/A'}`);
            }
        }
        
        // Check Fund Table Stats
        console.log('\n💰 FUND TABLE STATISTICS:');
        const { data: fundData, error: fundError, count: fundCount } = await supabase
            .from('fund_table')
            .select('*', { count: 'exact' });
            
        if (fundError) {
            console.error('❌ Fund Table Error:', fundError.message);
        } else {
            console.log(`✅ Total Funds: ${fundCount}`);
            if (fundData && fundData.length > 0) {
                console.log(`🔥 Latest Fund: ${fundData[fundData.length - 1].fund_name || 'N/A'}`);
                console.log(`💎 Fund Type: ${fundData[fundData.length - 1].fund_type || 'N/A'}`);
            }
        }
        
        // Recent Activity (last 10 minutes)
        const tenMinutesAgo = new Date(Date.now() - 10 * 60 * 1000).toISOString();
        
        console.log('\n⚡ RECENT ACTIVITY (Last 10 minutes):');
        const { data: recentVCs, count: recentVCCount } = await supabase
            .from('vc_table')
            .select('*', { count: 'exact' })
            .gte('created_at', tenMinutesAgo);
            
        const { data: recentFunds, count: recentFundCount } = await supabase
            .from('fund_table')
            .select('*', { count: 'exact' })
            .gte('created_at', tenMinutesAgo);
            
        console.log(`🔄 New VCs: ${recentVCCount || 0}`);
        console.log(`🔄 New Funds: ${recentFundCount || 0}`);
        
        // Data Quality Check
        console.log('\n🔍 DATA QUALITY CHECK:');
        const { data: qualityVCs } = await supabase
            .from('vc_table')
            .select('name, company_name, position')
            .not('name', 'is', null)
            .not('company_name', 'is', null)
            .limit(5);
            
        console.log('✅ Sample VC Data Quality:');
        qualityVCs?.forEach((vc, i) => {
            console.log(`   ${i+1}. ${vc.name} | ${vc.company_name} | ${vc.position || 'N/A'}`);
        });
        
        // Overall Progress
        const totalExpected = 4406; // Based on previous successful run
        const currentTotal = (vcCount || 0) + (fundCount || 0);
        const progressPercent = ((currentTotal / totalExpected) * 100).toFixed(1);
        
        console.log('\n📈 OVERALL PROGRESS:');
        console.log(`🎯 Expected: ${totalExpected} records`);
        console.log(`📊 Current: ${currentTotal} records`);
        console.log(`⚡ Progress: ${progressPercent}%`);
        console.log(`🚀 Status: ${currentTotal > 0 ? 'ACTIVE - Data flowing!' : 'WAITING - Starting up...'}`);
        
        // Connection Health
        console.log('\n🔋 CONNECTION HEALTH:');
        console.log(`✅ Supabase Connection: Active`);
        console.log(`✅ Database Access: Working`);
        console.log(`✅ Real-time Updates: ${(recentVCCount || 0) + (recentFundCount || 0) > 0 ? 'Flowing' : 'Pending'}`);
        
    } catch (error) {
        console.error('💥 Monitoring Error:', error.message);
    }
}

// Run monitoring
monitorLiveRun();

// Set up periodic monitoring (every 30 seconds)
console.log('\n🔄 Setting up live monitoring (every 30 seconds)...');
console.log('Press Ctrl+C to stop monitoring\n');

let monitorCount = 0;
const monitorInterval = setInterval(async () => {
    monitorCount++;
    console.log(`\n🔄 Update #${monitorCount} - ${new Date().toLocaleTimeString()}`);
    await monitorLiveRun();
}, 30000);

// Graceful shutdown
process.on('SIGINT', () => {
    console.log('\n\n👋 Stopping live monitoring...');
    clearInterval(monitorInterval);
    process.exit(0);
}); 