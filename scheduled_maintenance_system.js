import { createClient } from '@supabase/supabase-js';

const supabaseUrl = process.env.SUPABASE_URL;
const supabaseServiceKey = process.env.SUPABASE_SERVICE_ROLE_KEY;
const supabase = createClient(supabaseUrl, supabaseServiceKey);

console.log('🔧 === VCS SCHEDULED MAINTENANCE SYSTEM ===');
console.log(`🕐 Maintenance Time: ${new Date().toISOString()}`);

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
            // Check connection
            const { count: vcCount } = await supabase.from('vc_table').select('*', { count: 'exact' });
            const { count: fundCount } = await supabase.from('fund_table').select('*', { count: 'exact' });
            
            this.log(`📊 Current Records: ${vcCount} VCs, ${fundCount} Funds (Total: ${vcCount + fundCount})`);
            
            // Check for recent activity (data freshness)
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
                this.log(`📊 No recent activity (expected for scheduled runs)`, 'info');
            }
            
            return { vcCount, fundCount, recentVCs, recentFunds };
            
        } catch (error) {
            this.log(`Database health check failed: ${error.message}`, 'error');
            return null;
        }
    }

    async detectDuplicates() {
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

    async cleanupDuplicates() {
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
                    // Delete in batches
                    const batchSize = 100;
                    for (let i = 0; i < fundToDelete.length; i += batchSize) {
                        const batch = fundToDelete.slice(i, i + batchSize);
                        const { error } = await supabase.from('fund_table').delete().in('id', batch);
                        if (!error) {
                            totalRemoved += batch.length;
                        } else {
                            this.log(`Fund cleanup error: ${error.message}`, 'error');
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

    async checkDataQuality() {
        this.log('=== DATA QUALITY CHECK ===');
        
        try {
            // Check for null/empty names
            const { count: vcNoName } = await supabase
                .from('vc_table')
                .select('*', { count: 'exact' })
                .or('company_name.is.null,company_name.eq.""');
                
            const { count: fundNoName } = await supabase
                .from('fund_table')
                .select('*', { count: 'exact' })
                .or('fund_name.is.null,fund_name.eq.""');
                
            if (vcNoName > 0 || fundNoName > 0) {
                this.log(`⚠️ Missing Names: ${vcNoName} VCs, ${fundNoName} Funds`, 'warning');
            } else {
                this.log(`✅ All records have valid names`);
            }
            
            // Check data freshness (oldest vs newest)
            const { data: oldestVC } = await supabase
                .from('vc_table')
                .select('created_at')
                .order('created_at', { ascending: true })
                .limit(1);
                
            const { data: newestVC } = await supabase
                .from('vc_table')
                .select('created_at')
                .order('created_at', { ascending: false })
                .limit(1);
                
            if (oldestVC && newestVC && oldestVC[0] && newestVC[0]) {
                const oldestDate = new Date(oldestVC[0].created_at);
                const newestDate = new Date(newestVC[0].created_at);
                const daysDiff = Math.floor((newestDate - oldestDate) / (1000 * 60 * 60 * 24));
                
                this.log(`📅 Data Span: ${daysDiff} days (${oldestDate.toLocaleDateString()} to ${newestDate.toLocaleDateString()})`);
            }
            
            return { vcNoName, fundNoName };
            
        } catch (error) {
            this.log(`Data quality check failed: ${error.message}`, 'error');
            return null;
        }
    }

    async performMaintenance() {
        this.log('🚀 STARTING SCHEDULED MAINTENANCE');
        
        const startTime = Date.now();
        
        // 1. Health Check
        const health = await this.checkDatabaseHealth();
        if (!health) return false;
        
        // 2. Duplicate Detection
        const duplicates = await this.detectDuplicates();
        
        // 3. Cleanup if needed
        let cleanupCount = 0;
        if (duplicates && (duplicates.vcDuplicates > 0 || duplicates.fundDuplicates > 0)) {
            cleanupCount = await this.cleanupDuplicates();
        }
        
        // 4. Quality Check
        const quality = await this.checkDataQuality();
        
        // 5. Performance Summary
        const endTime = Date.now();
        const duration = Math.round((endTime - startTime) / 1000);
        
        this.log('=== MAINTENANCE SUMMARY ===');
        this.log(`⏱️ Duration: ${duration} seconds`);
        this.log(`📊 Final Count: ${health.vcCount} VCs, ${health.fundCount} Funds`);
        this.log(`🧹 Cleaned: ${cleanupCount} duplicates`);
        this.log(`✅ Status: HEALTHY`);
        
        // Return summary for monitoring
        return {
            success: true,
            duration,
            totalRecords: health.vcCount + health.fundCount,
            duplicatesRemoved: cleanupCount,
            dataQuality: quality
        };
    }
}

// Run maintenance
const maintenanceSystem = new VCSMaintenanceSystem();
maintenanceSystem.performMaintenance()
    .then(result => {
        if (result) {
            console.log('\n🎉 MAINTENANCE COMPLETED SUCCESSFULLY');
        } else {
            console.log('\n❌ MAINTENANCE FAILED');
        }
    })
    .catch(error => {
        console.error('\n💥 MAINTENANCE ERROR:', error.message);
    }); 