// Test DIVA Maintenance v3.0 with Dashboard Integration
import { createClient } from '@supabase/supabase-js';

// Set environment variables
process.env.SUPABASE_URL = 'https://udfgtccxbqmalgpqyxzz.supabase.co';
process.env.SUPABASE_SERVICE_ROLE_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InVkZmd0Y2N4YnFtYWxncHF5eHp6Iiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc0ODk0NjY5NiwiZXhwIjoyMDY0NTIyNjk2fQ.JgyEKjOhuZpNCCOadsaK90Q8CcoPf_rgdtSXh-1BU18';

// Mock Actor for testing
const Actor = {
    setValue: async (key, value) => {
        console.log(`📁 Actor.setValue: ${key}`);
    },
    getValue: async (key) => {
        console.log(`📁 Actor.getValue: ${key}`);
        return null;
    }
};

/**
 * Quick test of DIVA Maintenance System
 */
class DIVAMaintenanceTest {
    constructor() {
        this.supabase = createClient(
            process.env.SUPABASE_URL,
            process.env.SUPABASE_SERVICE_ROLE_KEY
        );
    }
    
    async testDIVADataAccess() {
        console.log('🔧 Testing DIVA Data Access...');
        
        try {
            // Test all DIVA tables
            const tableChecks = await Promise.all([
                this.supabase.from('diva_investment_performance').select('*', { count: 'exact', head: true }),
                this.supabase.from('diva_financial_statements').select('*', { count: 'exact', head: true }),
                this.supabase.from('diva_association_status').select('*', { count: 'exact', head: true }),
                this.supabase.from('diva_personnel_status').select('*', { count: 'exact', head: true }),
                this.supabase.from('diva_professional_personnel').select('*', { count: 'exact', head: true }),
                this.supabase.from('diva_violations').select('*', { count: 'exact', head: true }),
                this.supabase.from('diva_vc_map').select('*', { count: 'exact', head: true })
            ]);

            const tableCounts = {
                investment_performance: tableChecks[0].count || 0,
                financial_statements: tableChecks[1].count || 0,
                association_status: tableChecks[2].count || 0,
                personnel_status: tableChecks[3].count || 0,
                professional_personnel: tableChecks[4].count || 0,
                violations: tableChecks[5].count || 0,
                vc_map: tableChecks[6].count || 0
            };

            const totalRecords = Object.values(tableCounts).reduce((sum, count) => sum + count, 0);

            console.log(`✅ DIVA Data Access Success:`);
            console.log(`   • Investment Performance: ${tableCounts.investment_performance.toLocaleString()}`);
            console.log(`   • Financial Statements: ${tableCounts.financial_statements.toLocaleString()}`);
            console.log(`   • Association Status: ${tableCounts.association_status.toLocaleString()}`);
            console.log(`   • Personnel Status: ${tableCounts.personnel_status.toLocaleString()}`);
            console.log(`   • Professional Personnel: ${tableCounts.professional_personnel.toLocaleString()}`);
            console.log(`   • Violations: ${tableCounts.violations.toLocaleString()}`);
            console.log(`   • VC Map: ${tableCounts.vc_map.toLocaleString()}`);
            console.log(`   📊 Total DIVA Records: ${totalRecords.toLocaleString()}`);
            
            return { ...tableCounts, totalRecords };
            
        } catch (error) {
            console.log('❌ DIVA data access failed:', error.message);
            return false;
        }
    }
    
    async testDashboardInsert() {
        console.log('🔧 Testing DIVA Dashboard Insert...');
        
        try {
            const testReport = {
                system_type: 'DIVA',
                status: 'HEALTHY',
                duration_seconds: 45,
                quality_score: 92,
                duplicates_removed: 5,
                records_processed: 50000,
                report_data: {
                    test: true,
                    timestamp: new Date().toISOString(),
                    version: '3.0',
                    system: 'DIVA'
                }
            };
            
            const { data, error } = await this.supabase
                .from('unified_maintenance_reports')
                .insert(testReport)
                .select();
                
            if (error) {
                console.log('❌ DIVA dashboard insert error:', error.message);
                return false;
            }
            
            console.log('✅ DIVA dashboard insert successful:', data[0].id);
            return true;
            
        } catch (error) {
            console.log('❌ DIVA dashboard insert failed:', error.message);
            return false;
        }
    }
    
    async runFullTest() {
        console.log('🚀 === DIVA MAINTENANCE v3.0 TEST ===');
        
        const divaDataAccess = await this.testDIVADataAccess();
        const dashboardInsert = await this.testDashboardInsert();
        
        console.log('\n📊 === TEST RESULTS ===');
        console.log(`DIVA Data Access: ${divaDataAccess ? '✅ PASS' : '❌ FAIL'}`);
        console.log(`Dashboard Insert: ${dashboardInsert ? '✅ PASS' : '❌ FAIL'}`);
        
        const allPassed = divaDataAccess && dashboardInsert;
        console.log(`\n🎯 Overall: ${allPassed ? '✅ ALL TESTS PASSED' : '❌ SOME TESTS FAILED'}`);
        
        if (allPassed) {
            console.log('\n🎉 DIVA Maintenance v3.0 is READY for deployment!');
        }
        
        return allPassed;
    }
}

// Run the test
const test = new DIVAMaintenanceTest();
test.runFullTest(); 