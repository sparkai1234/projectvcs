// 🔍 Verify DIVA Scraping Results
require('dotenv').config();
const { createClient } = require('@supabase/supabase-js');

const supabase = createClient(process.env.SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

async function verifyDIVAData() {
    console.log('🔍 === VERIFYING DIVA SCRAPING RESULTS ===\n');

    try {
        // Check VC MAP data
        console.log('🗺️ CHECKING VC MAP DATA...');
        const { data: vcmapSample, error: vcmapError } = await supabase
            .from('diva_vcmap_raw')
            .select('*')
            .limit(3);
        
        if (vcmapError) {
            console.error('❌ VC MAP error:', vcmapError);
        } else {
            console.log(`✅ VC MAP Records: ${vcmapSample.length} sample records`);
            if (vcmapSample.length > 0) {
                console.log('📊 Sample VC MAP record:');
                console.log(`   Company: ${vcmapSample[0].company_name}`);
                console.log(`   Ranking: ${vcmapSample[0].ranking}`);
                console.log(`   Map Type: ${vcmapSample[0].map_type}`);
                console.log(`   Personnel: ${vcmapSample[0].total_personnel || 'N/A'}`);
            }
        }

        // Check Violations data
        console.log('\n⚖️ CHECKING VIOLATIONS DATA...');
        const { data: violationsSample, error: violationsError } = await supabase
            .from('diva_violation_raw')
            .select('*')
            .limit(3);
        
        if (violationsError) {
            console.error('❌ Violations error:', violationsError);
        } else {
            console.log(`✅ Violations Records: ${violationsSample.length} sample records`);
            if (violationsSample.length > 0) {
                console.log('📊 Sample Violation record:');
                console.log(`   Company: ${violationsSample[0].company_name}`);
                console.log(`   Violation Type: ${violationsSample[0].violation_type}`);
                console.log(`   Severity: ${violationsSample[0].violation_severity}`);
                console.log(`   Date: ${violationsSample[0].violation_date}`);
            }
        }

        // Test Competitive Intelligence View
        console.log('\n🏆 TESTING COMPETITIVE INTELLIGENCE VIEW...');
        const { data: intelData, error: intelError } = await supabase
            .from('vc_competitive_intelligence')
            .select('*')
            .limit(5);
        
        if (intelError) {
            console.error('❌ Intelligence view error:', intelError);
        } else {
            console.log(`✅ Competitive Intelligence: ${intelData.length} integrated records`);
            if (intelData.length > 0) {
                console.log('🧠 Sample Intelligence record:');
                const sample = intelData[0];
                console.log(`   Company: ${sample.company_name}`);
                console.log(`   Location: ${sample.location || 'N/A'}`);
                console.log(`   Personnel Ranking: ${sample.personnel_ranking || 'N/A'}`);
                console.log(`   Total Violations: ${sample.total_violations || 0}`);
                console.log(`   Risk Assessment: ${sample.risk_assessment || 'No Data'}`);
            }
        }

        // Test Risk Dashboard View
        console.log('\n🚨 TESTING RISK DASHBOARD VIEW...');
        const { data: riskData, error: riskError } = await supabase
            .from('vc_risk_dashboard')
            .select('*')
            .limit(5);
        
        if (riskError) {
            console.error('❌ Risk dashboard error:', riskError);
        } else {
            console.log(`✅ Risk Dashboard: ${riskData.length} risk records`);
            if (riskData.length > 0) {
                console.log('⚠️ Sample Risk record:');
                const sample = riskData[0];
                console.log(`   Company: ${sample.company_name}`);
                console.log(`   Violation: ${sample.violation_type}`);
                console.log(`   Severity: ${sample.violation_severity}`);
                console.log(`   Business Impact: ${sample.business_impact}`);
                console.log(`   Days Since: ${sample.days_since_violation || 'N/A'}`);
            }
        }

        // Get totals
        console.log('\n📊 === FINAL SUMMARY ===');
        
        const { count: vcmapCount } = await supabase
            .from('diva_vcmap_raw')
            .select('*', { count: 'exact', head: true });
        
        const { count: violationsCount } = await supabase
            .from('diva_violation_raw')
            .select('*', { count: 'exact', head: true });

        const { count: intelCount } = await supabase
            .from('vc_competitive_intelligence')
            .select('*', { count: 'exact', head: true });

        console.log(`🗺️ Total VC MAP Records: ${vcmapCount || 'Unknown'}`);
        console.log(`⚖️ Total Violation Records: ${violationsCount || 'Unknown'}`);
        console.log(`🧠 Total Intelligence Records: ${intelCount || 'Unknown'}`);
        
        console.log('\n🎉 DIVA INTELLIGENCE SYSTEM READY!');
        console.log('🚀 You now have comprehensive VC competitive intelligence and risk assessment data!');

    } catch (error) {
        console.error('💥 Verification error:', error);
    }
}

verifyDIVAData(); 