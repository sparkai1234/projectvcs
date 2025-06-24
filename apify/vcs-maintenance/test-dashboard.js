// Test VCS Maintenance v3.0 with Dashboard Integration
import { Actor } from 'apify';

// Mock Actor for local testing
if (!Actor.getValue) {
    Actor.setValue = async (key, value) => {
        console.log(`📁 Actor.setValue: ${key} = ${JSON.stringify(value, null, 2)}`);
    };
    Actor.getValue = async (key) => {
        console.log(`📁 Actor.getValue: ${key}`);
        return null;
    };
}

// Set environment variables
process.env.SUPABASE_URL = 'https://udfgtccxbqmalgpqyxzz.supabase.co';
process.env.SUPABASE_SERVICE_ROLE_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InVkZmd0Y2N4YnFtYWxncHF5eHp6Iiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc0ODk0NjY5NiwiZXhwIjoyMDY0NTIyNjk2fQ.JgyEKjOhuZpNCCOadsaK90Q8CcoPf_rgdtSXh-1BU18';

// Import and run VCS Maintenance
async function testVCSMaintenance() {
    try {
        console.log('🚀 Testing VCS Maintenance v3.0 with Dashboard Integration');
        
        // Import the VCS maintenance system
        const { VCSMaintenanceSystem } = await import('./main.js');
        
        // Create test input
        const testInput = {
            performCleanup: true,
            dashboard: {
                enabled: true
            },
            email: {
                enabled: false
            }
        };
        
        // Initialize and run maintenance
        const vcsSystem = new VCSMaintenanceSystem(testInput);
        const result = await vcsSystem.performMaintenance();
        
        console.log(`✅ VCS Maintenance completed: ${result ? 'SUCCESS' : 'FAILED'}`);
        
    } catch (error) {
        console.error('❌ Test failed:', error.message);
    }
}

testVCSMaintenance(); 