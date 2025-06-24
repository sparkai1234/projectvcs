// Check Dashboard Reports
import { createClient } from '@supabase/supabase-js';

const supabase = createClient(
    'https://udfgtccxbqmalgpqyxzz.supabase.co',
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InVkZmd0Y2N4YnFtYWxncHF5eHp6Iiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc0ODk0NjY5NiwiZXhwIjoyMDY0NTIyNjk2fQ.JgyEKjOhuZpNCCOadsaK90Q8CcoPf_rgdtSXh-1BU18'
);

async function checkDashboard() {
    console.log('📊 === UNIFIED DASHBOARD REPORTS ===');
    
    try {
        // Get all reports
        const { data: reports, error } = await supabase
            .from('unified_maintenance_reports')
            .select('*')
            .order('created_at', { ascending: false });
            
        if (error) {
            console.log('❌ Error:', error.message);
            return;
        }
        
        console.log(`\n📈 Total Reports: ${reports.length}`);
        
        reports.forEach((report, index) => {
            console.log(`\n${index + 1}. ${report.system_type} - ${report.status}`);
            console.log(`   📅 Created: ${new Date(report.created_at).toLocaleString()}`);
            console.log(`   ⏱️  Duration: ${report.duration_seconds}s`);
            console.log(`   🎯 Quality: ${report.quality_score}/100`);
            console.log(`   📊 Records: ${report.records_processed}`);
            console.log(`   🗑️  Duplicates: ${report.duplicates_removed}`);
        });
        
        // Test dashboard views
        console.log('\n📊 === DASHBOARD VIEWS ===');
        
        const { data: latest } = await supabase
            .from('unified_maintenance_latest_status')
            .select('*');
            
        console.log('\n🔄 Latest Status per System:');
        latest?.forEach(status => {
            console.log(`   ${status.system_type}: ${status.status} (Quality: ${status.quality_score})`);
        });
        
        const { data: health } = await supabase
            .from('unified_maintenance_health_overview')
            .select('*');
            
        console.log('\n🏥 Health Overview (24h):');
        if (health?.[0]) {
            const h = health[0];
            console.log(`   Systems: ${h.total_systems}, Reports: ${h.total_reports}`);
            console.log(`   Healthy: ${h.healthy_reports}, Attention: ${h.attention_reports}, Errors: ${h.error_reports}`);
            console.log(`   Avg Quality: ${h.avg_quality_score || 'N/A'}`);
        }
        
    } catch (error) {
        console.log('❌ Dashboard check failed:', error.message);
    }
}

checkDashboard(); 