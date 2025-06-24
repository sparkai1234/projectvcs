// Direct test of VCS Maintenance v3.0 with Dashboard Integration
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
 * Quick test of VCS Maintenance System
 */
class VCSMaintenanceTest {
    constructor() {
        this.supabase = createClient(
            process.env.SUPABASE_URL,
            process.env.SUPABASE_SERVICE_ROLE_KEY
        );
    }
    
    async testDashboardConnection() {
        console.log('🔧 Testing Dashboard Connection...');
        
        try {
            // Test dashboard table exists
            const { count, error } = await this.supabase
                .from('unified_maintenance_reports')
                .select('*', { count: 'exact', head: true });
                
            if (error) {
                console.log('❌ Dashboard table error:', error.message);
                return false;
            }
            
            console.log(`✅ Dashboard table accessible (${count} reports)`);
            return true;
            
        } catch (error) {
            console.log('❌ Dashboard connection failed:', error.message);
            return false;
        }
    }
    
    async testDashboardInsert() {
        console.log('🔧 Testing Dashboard Insert...');
        
        try {
            const testReport = {
                system_type: 'VCS',
                status: 'HEALTHY',
                duration_seconds: 30,
                quality_score: 95,
                duplicates_removed: 0,
                records_processed: 4404,
                report_data: {
                    test: true,
                    timestamp: new Date().toISOString(),
                    version: '3.0'
                }
            };
            
            const { data, error } = await this.supabase
                .from('unified_maintenance_reports')
                .insert(testReport)
                .select();
                
            if (error) {
                console.log('❌ Dashboard insert error:', error.message);
                return false;
            }
            
            console.log('✅ Dashboard insert successful:', data[0].id);
            return true;
            
        } catch (error) {
            console.log('❌ Dashboard insert failed:', error.message);
            return false;
        }
    }
    
    async testVCSDataAccess() {
        console.log('🔧 Testing VCS Data Access...');
        
        try {
            // Test VC table
            const { count: vcCount, error: vcError } = await this.supabase
                .from('vc_table')
                .select('*', { count: 'exact', head: true });
                
            if (vcError) {
                console.log('❌ VC table error:', vcError.message);
                return false;
            }
            
            // Test Fund table
            const { count: fundCount, error: fundError } = await this.supabase
                .from('fund_table')
                .select('*', { count: 'exact', head: true });
                
            if (fundError) {
                console.log('❌ Fund table error:', fundError.message);
                return false;
            }
            
            console.log(`✅ VCS Data Access: ${vcCount} VCs, ${fundCount} Funds`);
            return { vcCount, fundCount };
            
        } catch (error) {
            console.log('❌ VCS data access failed:', error.message);
            return false;
        }
    }
    
    async runFullTest() {
        console.log('🚀 === VCS MAINTENANCE v3.0 DASHBOARD TEST ===');
        
        const dashboardConnection = await this.testDashboardConnection();
        const vcsDataAccess = await this.testVCSDataAccess();
        const dashboardInsert = await this.testDashboardInsert();
        
        console.log('\n📊 === TEST RESULTS ===');
        console.log(`Dashboard Connection: ${dashboardConnection ? '✅ PASS' : '❌ FAIL'}`);
        console.log(`VCS Data Access: ${vcsDataAccess ? '✅ PASS' : '❌ FAIL'}`);
        console.log(`Dashboard Insert: ${dashboardInsert ? '✅ PASS' : '❌ FAIL'}`);
        
        const allPassed = dashboardConnection && vcsDataAccess && dashboardInsert;
        console.log(`\n🎯 Overall: ${allPassed ? '✅ ALL TESTS PASSED' : '❌ SOME TESTS FAILED'}`);
        
        if (allPassed) {
            console.log('\n🎉 VCS Maintenance v3.0 Dashboard Integration is READY!');
        }
        
        return allPassed;
    }
}

// Run the test
const test = new VCSMaintenanceTest();
test.runFullTest(); 