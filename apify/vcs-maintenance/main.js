import { Actor } from 'apify';
import { createClient } from '@supabase/supabase-js';

// Initialize Actor
await Actor.init();

console.log('🔧 === VCS MAINTENANCE ACTOR STARTED ===');
console.log(`🕐 Maintenance Time: ${new Date().toISOString()}`);

// Get Actor input
const input = await Actor.getInput() ?? {};
const {
    supabaseUrl = process.env.SUPABASE_URL,
    supabaseKey = process.env.SUPABASE_KEY || process.env.SUPABASE_SERVICE_ROLE_KEY,
    maintenanceType = 'full', // 'full', 'quick', 'weekly'
    cleanupDuplicates = true,
    generateReport = true
} = input;

class VCSMaintenanceSystem {
    constructor() {
        this.maintenanceLog = [];
    }

    log(message, type = 'info') {
        const timestamp = new Date().toISOString();
        const logEntry = { timestamp, type, message };
        this.maintenanceLog.push(logEntry);
        
        const icon = type === 'error' ? '❌' : type === 'warning' ? '⚠️' : '✅';
        console.log(`${icon} ${message}`);
    }

    async checkDatabaseHealth() {
        this.log('=== DATABASE HEALTH CHECK ===');
        
        try {
            const supabase = createClient(supabaseUrl, supabaseKey);
            
            // Check connection
            const { count: vcCount } = await supabase.from('vc_table').select('*', { count: 'exact' });
            const { count: fundCount } = await supabase.from('fund_table').select('*', { count: 'exact' });
            
            this.log(`📊 Current Records: ${vcCount} VCs, ${fundCount} Funds (Total: ${vcCount + fundCount})`);
            
            // Check for recent activity
            const oneHourAgo = new Date(Date.now() - 60 * 60 * 1000).toISOString();
            const { count: recentVCs } = await supabase
                .from('vc_table')
                .select('*', { count: 'exact' })
                .gte('created_at', oneHourAgo);
                
            const { count: recentFunds } = await supabase
                .from('fund_table')
                .select('*', { count: 'exact' })
                .gte('created_at', oneHourAgo);
                
            if (recentVCs > 0 || recentFunds > 0) {
                this.log(`🔥 Recent Activity: ${recentVCs} VCs, ${recentFunds} Funds in last hour`);
            } else {
                this.log(`📊 No recent activity (normal for maintenance runs)`);
            }
            
            return { vcCount, fundCount, recentVCs, recentFunds, supabase };
            
        } catch (error) {
            this.log(`Database health check failed: ${error.message}`, 'error');
            return null;
        }
    }

    async detectDuplicates(supabase) {
        this.log('=== DUPLICATE DETECTION ===');
        
        try {
            // Check VC duplicates
            const { data: allVCs } = await supabase.from('vc_table').select('company_name');
            const vcNames = new Map();
            let vcDuplicates = 0;
            
            if (allVCs) {
                allVCs.forEach(vc => {
                    const name = vc.company_name?.toLowerCase().trim();
                    if (name) {
                        if (vcNames.has(name)) {
                            vcDuplicates++;
                        } else {
                            vcNames.set(name, 1);
                        }
                    }
                });
            }
            
            // Check Fund duplicates
            const { data: allFunds } = await supabase.from('fund_table').select('fund_name');
            const fundNames = new Map();
            let fundDuplicates = 0;
            
            if (allFunds) {
                allFunds.forEach(fund => {
                    const name = fund.fund_name?.toLowerCase().trim();
                    if (name) {
                        if (fundNames.has(name)) {
                            fundDuplicates++;
                        } else {
                            fundNames.set(name, 1);
                        }
                    }
                });
            }
            
            if (vcDuplicates > 0 || fundDuplicates > 0) {
                this.log(`🔄 Duplicates Found: ${vcDuplicates} VCs, ${fundDuplicates} Funds`, 'warning');
                return { vcDuplicates, fundDuplicates };
            } else {
                this.log(`✅ No duplicates detected`);
                return { vcDuplicates: 0, fundDuplicates: 0 };
            }
            
        } catch (error) {
            this.log(`Duplicate detection failed: ${error.message}`, 'error');
            return null;
        }
    }

    async cleanupDuplicates(supabase) {
        if (!cleanupDuplicates) {
            this.log('⏭️ Duplicate cleanup skipped (disabled in config)');
            return 0;
        }
        
        this.log('=== DUPLICATE CLEANUP ===');
        
        try {
            let totalRemoved = 0;
            
            // Cleanup VCs
            const { data: vcData } = await supabase
                .from('vc_table')
                .select('id, company_name, created_at')
                .order('company_name, created_at desc');
                
            if (vcData) {
                const vcToDelete = [];
                const seen = new Set();
                
                vcData.forEach(vc => {
                    const name = vc.company_name?.toLowerCase().trim();
                    if (name) {
                        if (seen.has(name)) {
                            vcToDelete.push(vc.id);
                        } else {
                            seen.add(name);
                        }
                    }
                });
                
                if (vcToDelete.length > 0) {
                    const { error } = await supabase.from('vc_table').delete().in('id', vcToDelete);
                    if (!error) {
                        this.log(`🗑️ Removed ${vcToDelete.length} duplicate VCs`);
                        totalRemoved += vcToDelete.length;
                    } else {
                        this.log(`VC cleanup error: ${error.message}`, 'error');
                    }
                }
            }
            
            // Cleanup Funds (in batches)
            const { data: fundData } = await supabase
                .from('fund_table')
                .select('id, fund_name, created_at')
                .order('fund_name, created_at desc');
                
            if (fundData) {
                const fundToDelete = [];
                const seen = new Set();
                
                fundData.forEach(fund => {
                    const name = fund.fund_name?.toLowerCase().trim();
                    if (name) {
                        if (seen.has(name)) {
                            fundToDelete.push(fund.id);
                        } else {
                            seen.add(name);
                        }
                    }
                });
                
                if (fundToDelete.length > 0) {
                    // Delete in batches for performance
                    const batchSize = 100;
                    for (let i = 0; i < fundToDelete.length; i += batchSize) {
                        const batch = fundToDelete.slice(i, i + batchSize);
                        const { error } = await supabase.from('fund_table').delete().in('id', batch);
                        if (!error) {
                            totalRemoved += batch.length;
                        } else {
                            this.log(`Fund cleanup batch error: ${error.message}`, 'error');
                        }
                    }
                    this.log(`🗑️ Removed ${fundToDelete.length} duplicate Funds`);
                }
            }
            
            this.log(`✅ Total duplicates removed: ${totalRemoved}`);
            return totalRemoved;
            
        } catch (error) {
            this.log(`Duplicate cleanup failed: ${error.message}`, 'error');
            return 0;
        }
    }

    async performMaintenance() {
        this.log('🚀 STARTING VCS MAINTENANCE');
        const startTime = Date.now();
        
        // 1. Health Check
        const health = await this.checkDatabaseHealth();
        if (!health) {
            await Actor.fail('Database health check failed');
            return;
        }
        
        // 2. Duplicate Detection
        const duplicates = await this.detectDuplicates(health.supabase);
        
        // 3. Cleanup if needed
        let cleanupCount = 0;
        if (duplicates && (duplicates.vcDuplicates > 0 || duplicates.fundDuplicates > 0)) {
            cleanupCount = await this.cleanupDuplicates(health.supabase);
        }
        
        // 4. Generate Results
        const endTime = Date.now();
        const duration = Math.round((endTime - startTime) / 1000);
        
        const results = {
            success: true,
            duration,
            timestamp: new Date().toISOString(),
            totalRecords: health.vcCount + health.fundCount,
            vcCount: health.vcCount,
            fundCount: health.fundCount,
            duplicatesRemoved: cleanupCount,
            recentActivity: {
                vcs: health.recentVCs,
                funds: health.recentFunds
            },
            maintenanceType,
            logs: this.maintenanceLog
        };
        
        this.log('=== MAINTENANCE SUMMARY ===');
        this.log(`⏱️ Duration: ${duration} seconds`);
        this.log(`📊 Final Count: ${health.vcCount} VCs, ${health.fundCount} Funds`);
        this.log(`🧹 Cleaned: ${cleanupCount} duplicates`);
        this.log(`✅ Status: HEALTHY`);
        
        // Store results
        if (generateReport) {
            await Actor.setValue('MAINTENANCE_REPORT', results);
            this.log('📋 Maintenance report saved to Actor storage');
        }
        
        return results;
    }
}

// Main execution
try {
    if (!supabaseUrl || !supabaseKey) {
        console.error('❌ Missing Supabase credentials');
        await Actor.fail('Missing Supabase credentials');
    } else {
        console.log('🔧 Supabase credentials loaded successfully');
        console.log(`📊 Maintenance Type: ${maintenanceType}`);
        console.log(`🧹 Cleanup Enabled: ${cleanupDuplicates}`);
        
        const maintenanceSystem = new VCSMaintenanceSystem();
        const results = await maintenanceSystem.performMaintenance();
        
        if (results && results.success) {
            console.log('\n🎉 VCS MAINTENANCE COMPLETED SUCCESSFULLY');
            await Actor.exit();
        } else {
            console.log('\n❌ VCS MAINTENANCE FAILED');
            await Actor.fail('Maintenance failed');
        }
    }
} catch (error) {
    console.error('\n💥 VCS MAINTENANCE ERROR:', error.message);
    await Actor.fail(error.message);
}

await Actor.exit(); 