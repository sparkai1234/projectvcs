// Basic test of DIVA v3.0 methods
import { Actor } from 'apify';

// Mock Actor for testing
if (!Actor.getValue) {
    Actor.setValue = async (key, value) => {
        console.log(`📁 Actor.setValue: ${key}`);
    };
    Actor.getValue = async (key) => {
        console.log(`📁 Actor.getValue: ${key}`);
        return null;
    };
}

// Set environment variables
process.env.SUPABASE_URL = 'https://udfgtccxbqmalgpqyxzz.supabase.co';
process.env.SUPABASE_SERVICE_ROLE_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InVkZmd0Y2N4YnFtYWxncHF5eHp6Iiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc0ODk0NjY5NiwiZXhwIjoyMDY0NTIyNjk2fQ.JgyEKjOhuZpNCCOadsaK90Q8CcoPf_rgdtSXh-1BU18';

// Import and test DIVA maintenance
async function testDIVAMethods() {
    try {
        console.log('🚀 Testing DIVA Maintenance v3.0 Methods');
        
        // Import the DIVA maintenance system
        const { DIVAMaintenanceSystem } = await import('./main-v3-standalone.js');
        
        // Create test input
        const testInput = {
            performCleanup: false, // Don't actually clean anything in test
            dashboard: {
                enabled: true
            },
            email: {
                enabled: false
            }
        };
        
        // Initialize DIVA system
        const divaSystem = new DIVAMaintenanceSystem(testInput);
        
        console.log('✅ DIVA system initialized');
        
        // Test individual methods
        console.log('\n🔧 Testing checkDatabaseHealth...');
        const healthResult = await divaSystem.checkDatabaseHealth();
        console.log('Health check result:', healthResult ? '✅ SUCCESS' : '❌ FAILED');
        
        console.log('\n🔧 Testing detectDuplicates...');
        const duplicateResult = await divaSystem.detectDuplicates();
        console.log('Duplicate detection result:', duplicateResult ? '✅ SUCCESS' : '❌ FAILED');
        
        console.log('\n🔧 Testing analyzeDataQuality...');
        const qualityResult = await divaSystem.analyzeDataQuality();
        console.log('Quality analysis result:', qualityResult ? '✅ SUCCESS' : '❌ FAILED');
        
        console.log('\n🎯 All method tests completed!');
        
    } catch (error) {
        console.error('❌ Test failed:', error.message);
        console.error('Stack:', error.stack);
    }
}

testDIVAMethods(); 