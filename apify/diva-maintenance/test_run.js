#!/usr/bin/env node
/**
 * Test runner for DIVA Maintenance System
 * Runs the maintenance with proper configuration
 */

const { Actor } = require('apify');

async function runDivaMaintenance() {
    console.log('🧪 Starting DIVA Maintenance Test Run...');
    
    // Mock Apify input for local testing
    const mockInput = {
        maintenanceType: 'standard',
        performCleanup: true,
        sendEmailReport: false,  // Disable email for now
        dryRun: false,
        emailRecipients: ['sparkai@sparklabs.co.kr'],
        dashboard: {
            enabled: true
        }
    };
    
    // Override Actor.getInput() to return our mock input
    const originalGetInput = Actor.getInput;
    Actor.getInput = async () => mockInput;
    
    try {
        // Import and run the main script
        require('./main.js');
        
    } catch (error) {
        console.error('❌ Test run failed:', error.message);
        process.exit(1);
    } finally {
        // Restore original function
        Actor.getInput = originalGetInput;
    }
}

// Only run if this script is executed directly
if (require.main === module) {
    runDivaMaintenance();
} 