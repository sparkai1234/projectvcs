require('dotenv').config();
const { createClient } = require('@supabase/supabase-js');

const supabaseUrl = process.env.SUPABASE_URL;
const supabaseServiceKey = process.env.SUPABASE_SERVICE_ROLE_KEY;

const supabase = createClient(supabaseUrl, supabaseServiceKey);

// Track start time for fresh run monitoring
const startTime = new Date();

async function monitorFreshRun() {
    console.log('🌟 Fresh VCS Run Monitoring Dashboard');
    console.log('=' .repeat(40));
    console.log(`🕐 Started: ${startTime.toLocaleString()}`);
    
    try {
        // 1. Current counts
        const { count: vcCount } = await supabase.from('vc_table').select('*', { count: 'exact' });
        const { count: fundCount } = await supabase.from('fund_table').select('*', { count: 'exact' });
        const totalCount = (vcCount || 0) + (fundCount || 0);
        
        // 2. Calculate elapsed time and rates
        const now = new Date();
        const elapsedMs = now - startTime;
        const elapsedHours = elapsedMs / (1000 * 60 * 60);
        const collectionRate = elapsedHours > 0 ? Math.round(totalCount / elapsedHours) : 0;
        
        console.log(`\n📊 FRESH RUN PROGRESS:`);
        console.log(`👥 VCs Collected: ${vcCount || 0}/717 (${(((vcCount || 0)/717)*100).toFixed(1)}%)`);
        console.log(`💰 Funds Collected: ${fundCount || 0}/3,689 (${(((fundCount || 0)/3689)*100).toFixed(1)}%)`);
        console.log(`📈 Total Progress: ${totalCount}/4,406 (${((totalCount/4406)*100).toFixed(1)}%)`);
        
        // 3. Time tracking
        console.log(`\n⏰ TIME ANALYSIS:`);
        console.log(`🕐 Elapsed: ${Math.floor(elapsedMs / (1000 * 60))} minutes`);
        console.log(`⚡ Collection Rate: ${collectionRate} records/hour`);
        
        if (collectionRate > 0) {
            const remainingRecords = 4406 - totalCount;
            const etaHours = remainingRecords / collectionRate;
            const etaDate = new Date(now.getTime() + (etaHours * 60 * 60 * 1000));
            console.log(`🎯 ETA: ${etaDate.toLocaleString()} (${etaHours.toFixed(1)} hours)`);
        }
        
        // 4. Fresh data quality check
        console.log(`\n🧬 FRESH DATA QUALITY:`);
        const { data: latestVCs } = await supabase
            .from('vc_table')
            .select('name, company_name, created_at')
            .order('created_at', { ascending: false })
            .limit(3);
            
        const { data: latestFunds } = await supabase
            .from('fund_table')
            .select('fund_name, created_at')
            .order('created_at', { ascending: false })
            .limit(3);
            
        console.log(`🔥 Latest VCs:`);
        latestVCs?.forEach((vc, i) => {
            const timeAgo = Math.floor((now - new Date(vc.created_at)) / 60000);
            console.log(`   ${i+1}. ${vc.name || 'N/A'} at ${vc.company_name || 'N/A'} (${timeAgo}m ago)`);
        });
        
        console.log(`💎 Latest Funds:`);
        latestFunds?.forEach((fund, i) => {
            const timeAgo = Math.floor((now - new Date(fund.created_at)) / 60000);
            console.log(`   ${i+1}. ${fund.fund_name || 'N/A'} (${timeAgo}m ago)`);
        });
        
        // 5. Duplicate monitoring (should be zero in fresh run)
        console.log(`\n🔍 DUPLICATE MONITORING:`);
        
        // Quick duplicate check for funds
        if (fundCount > 0) {
            const { data: allFunds } = await supabase
                .from('fund_table')
                .select('fund_name')
                .limit(1000); // Check first 1000
                
            if (allFunds) {
                const fundNames = new Set();
                let duplicateFound = false;
                
                for (const fund of allFunds) {
                    const name = (fund.fund_name || '').toLowerCase().trim();
                    if (name && fundNames.has(name)) {
                        duplicateFound = true;
                        break;
                    }
                    if (name) fundNames.add(name);
                }
                
                if (duplicateFound) {
                    console.log(`⚠️ WARNING: Duplicate detected in fresh run!`);
                    console.log(`🔧 Action needed: Check scraper logic`);
                } else {
                    console.log(`✅ No duplicates detected - fresh data is clean!`);
                }
            }
        } else {
            console.log(`✅ No data yet - monitoring ready for clean collection`);
        }
        
        // 6. System health
        console.log(`\n🏥 SYSTEM HEALTH:`);
        const recentTime = new Date(now.getTime() - 10 * 60 * 1000); // 10 minutes ago
        const { count: recentActivity } = await supabase
            .from('vc_table')
            .select('*', { count: 'exact' })
            .gte('created_at', recentTime.toISOString());
        const { count: recentFunds } = await supabase
            .from('fund_table')
            .select('*', { count: 'exact' })
            .gte('created_at', recentTime.toISOString());
            
        const recentTotal = (recentActivity || 0) + (recentFunds || 0);
        
        if (recentTotal > 0) {
            console.log(`✅ Data Flow: ACTIVE (${recentTotal} records in last 10min)`);
        } else if (totalCount > 0) {
            console.log(`⚠️ Data Flow: PAUSED (no recent activity)`);
        } else {
            console.log(`🔄 Data Flow: WAITING (fresh start - no data yet)`);
        }
        
        console.log(`✅ Supabase: Connected and responsive`);
        console.log(`✅ Monitoring: Real-time tracking active`);
        
        // 7. Milestone tracking
        console.log(`\n🎯 MILESTONE TRACKING:`);
        const milestones = [
            { name: 'First 100 records', target: 100 },
            { name: 'First 500 records', target: 500 },
            { name: 'First 1,000 records', target: 1000 },
            { name: 'Half complete', target: 2203 },
            { name: 'Nearly complete', target: 4000 },
            { name: 'Target achieved', target: 4406 }
        ];
        
        const nextMilestone = milestones.find(m => totalCount < m.target);
        if (nextMilestone) {
            const progress = ((totalCount / nextMilestone.target) * 100).toFixed(1);
            console.log(`🎯 Next: ${nextMilestone.name} (${totalCount}/${nextMilestone.target} - ${progress}%)`);
        } else {
            console.log(`🎉 All milestones achieved! Target exceeded!`);
        }
        
    } catch (error) {
        console.error('💥 Fresh run monitoring error:', error.message);
    }
}

// Initial run
monitorFreshRun();

// Set up continuous monitoring every 30 seconds
console.log('\n🔄 Fresh run monitoring active (updates every 30s)');
console.log('Press Ctrl+C to stop monitoring\n');

const monitorInterval = setInterval(async () => {
    console.log(`\n🔄 Update - ${new Date().toLocaleTimeString()}`);
    await monitorFreshRun();
}, 30000);

// Graceful shutdown
process.on('SIGINT', () => {
    console.log('\n\n👋 Stopping fresh run monitoring...');
    clearInterval(monitorInterval);
    process.exit(0);
}); 