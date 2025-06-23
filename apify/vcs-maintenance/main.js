import { Actor } from 'apify';
import { createClient } from '@supabase/supabase-js';
import { MaintenanceSystemCore } from '../shared-maintenance-core/MaintenanceSystem.js';

console.log('🔧 === VCS MAINTENANCE SYSTEM v3.0 ===');
console.log('🕐 Maintenance Time:', new Date().toISOString());

/**
 * VCS-Specific Maintenance System extending shared core
 */
class VCSMaintenanceSystem extends MaintenanceSystemCore {
    constructor(input = {}) {
        super('VCS', input);
    }

    /**
     * 🏥 VCS DATABASE HEALTH CHECK
     */
    async checkDatabaseHealth() {
        this.log('=== VCS DATABASE HEALTH CHECK ===');
        
        try {
            // Get current record counts
            const { count: vcCount } = await this.supabase.from('vc_table').select('*', { count: 'exact' });
            const { count: fundCount } = await this.supabase.from('fund_table').select('*', { count: 'exact' });
            const totalRecords = (vcCount || 0) + (fundCount || 0);
            
            this.metrics.totalRecords = totalRecords;
            this.log(`📊 Current Records: ${vcCount} VCs, ${fundCount} Funds (Total: ${totalRecords})`);
            
            // Check for recent activity (data freshness)
            const oneHourAgo = new Date(Date.now() - 60 * 60 * 1000).toISOString();
            const { count: recentVCs } = await this.supabase
                .from('vc_table')
                .select('*', { count: 'exact' })
                .gte('created_at', oneHourAgo);
                
            const { count: recentFunds } = await this.supabase
                .from('fund_table')
                .select('*', { count: 'exact' })
                .gte('created_at', oneHourAgo);
                
            if (recentVCs > 0 || recentFunds > 0) {
                this.log(`🔥 Recent Activity: ${recentVCs} VCs, ${recentFunds} Funds in last hour`);
                this.changes.additions.push({
                    type: 'recent_activity',
                    vcCount: recentVCs,
                    fundCount: recentFunds,
                    timeframe: '1 hour'
                });
            } else {
                this.log(`📊 No recent activity (expected for maintenance runs)`);
            }
            
            // Check data age and freshness
            await this.checkDataFreshness();
            
            return { vcCount, fundCount, recentVCs, recentFunds, totalRecords };
            
        } catch (error) {
            this.log(`VCS health check failed: ${error.message}`, 'error');
            this.metrics.errorsFound++;
            return null;
        }
    }

    /**
     * 📅 CHECK VCS DATA FRESHNESS AND AGE DISTRIBUTION
     */
    async checkDataFreshness() {
        try {
            // Get oldest and newest records
            const { data: oldestVC } = await this.supabase
                .from('vc_table')
                .select('created_at, company_name')
                .order('created_at', { ascending: true })
                .limit(1);
                
            const { data: newestVC } = await this.supabase
                .from('vc_table')
                .select('created_at, company_name')
                .order('created_at', { ascending: false })
                .limit(1);
                
            if (oldestVC?.[0] && newestVC?.[0]) {
                const oldestDate = new Date(oldestVC[0].created_at);
                const newestDate = new Date(newestVC[0].created_at);
                const daysDiff = Math.floor((newestDate - oldestDate) / (1000 * 60 * 60 * 24));
                
                this.log(`📅 Data Span: ${daysDiff} days (${oldestDate.toLocaleDateString()} to ${newestDate.toLocaleDateString()})`);
                this.log(`🏢 Oldest: ${oldestVC[0].company_name} | Newest: ${newestVC[0].company_name}`);
            }
            
        } catch (error) {
            this.log(`VCS data freshness check failed: ${error.message}`, 'warning');
        }
    }

    /**
     * 🔍 VCS DUPLICATE DETECTION
     */
    async detectDuplicates() {
        this.log('=== VCS DUPLICATE DETECTION ===');
        
        try {
            let totalVcDuplicates = 0;
            let totalFundDuplicates = 0;
            const duplicateDetails = {
                vcDuplicates: [],
                fundDuplicates: []
            };
            
            // 🏢 Detect VC duplicates
            const { data: allVCs } = await this.supabase
                .from('vc_table')
                .select('id, company_name, created_at, apify_source')
                .order('company_name, created_at');
                
            if (allVCs) {
                const vcGroups = new Map();
                
                allVCs.forEach(vc => {
                    const name = vc.company_name?.toLowerCase().trim();
                    if (name) {
                        if (!vcGroups.has(name)) {
                            vcGroups.set(name, []);
                        }
                        vcGroups.get(name).push(vc);
                    }
                });
                
                // Find groups with duplicates
                vcGroups.forEach((group, name) => {
                    if (group.length > 1) {
                        totalVcDuplicates += group.length - 1;
                        duplicateDetails.vcDuplicates.push({
                            company_name: name,
                            count: group.length,
                            records: group,
                            duplicateIds: group.slice(1).map(vc => vc.id)
                        });
                    }
                });
            }
            
            // 💰 Detect Fund duplicates
            const { data: allFunds } = await this.supabase
                .from('fund_table')
                .select('id, fund_name, created_at, company_id, apify_source')
                .order('fund_name, created_at');
                
            if (allFunds) {
                const fundGroups = new Map();
                
                allFunds.forEach(fund => {
                    const name = fund.fund_name?.toLowerCase().trim();
                    if (name) {
                        if (!fundGroups.has(name)) {
                            fundGroups.set(name, []);
                        }
                        fundGroups.get(name).push(fund);
                    }
                });
                
                // Find groups with duplicates
                fundGroups.forEach((group, name) => {
                    if (group.length > 1) {
                        totalFundDuplicates += group.length - 1;
                        duplicateDetails.fundDuplicates.push({
                            fund_name: name,
                            count: group.length,
                            records: group,
                            duplicateIds: group.slice(1).map(fund => fund.id)
                        });
                    }
                });
            }
            
            this.metrics.duplicatesFound = totalVcDuplicates + totalFundDuplicates;
            
            if (totalVcDuplicates > 0 || totalFundDuplicates > 0) {
                this.log(`🔄 Duplicates Found: ${totalVcDuplicates} VCs, ${totalFundDuplicates} Funds`, 'warning');
            } else {
                this.log(`✅ No duplicates detected - VCS database is clean!`, 'success');
            }
            
            return { 
                vcDuplicates: totalVcDuplicates, 
                fundDuplicates: totalFundDuplicates,
                details: duplicateDetails
            };
            
        } catch (error) {
            this.log(`VCS duplicate detection failed: ${error.message}`, 'error');
            this.metrics.errorsFound++;
            return null;
        }
    }

    /**
     * 🧹 VCS DUPLICATE CLEANUP
     */
    async performCleanup(duplicatesData) {
        if (!duplicatesData || (!duplicatesData.details.vcDuplicates.length && !duplicatesData.details.fundDuplicates.length)) {
            this.log('✅ No VCS duplicates to clean up');
            return 0;
        }
        
        this.log('=== VCS DUPLICATE CLEANUP ===');
        
        let totalRemoved = 0;
        
        try {
            // Clean VC duplicates
            for (const duplicateGroup of duplicatesData.details.vcDuplicates) {
                if (duplicateGroup.duplicateIds.length > 0) {
                    const { error } = await this.supabase
                        .from('vc_table')
                        .delete()
                        .in('id', duplicateGroup.duplicateIds);
                        
                    if (!error) {
                        const removedCount = duplicateGroup.duplicateIds.length;
                        totalRemoved += removedCount;
                        this.log(`🗑️ Removed ${removedCount} duplicate VCs for: ${duplicateGroup.company_name}`);
                        
                        this.changes.duplicateResolutions.push({
                            type: 'vc_duplicates_removed',
                            company_name: duplicateGroup.company_name,
                            count: removedCount,
                            keptRecord: duplicateGroup.records[0].id,
                            removedIds: duplicateGroup.duplicateIds
                        });
                    } else {
                        this.log(`❌ Failed to remove VC duplicates for ${duplicateGroup.company_name}: ${error.message}`, 'error');
                        this.metrics.errorsFound++;
                    }
                }
            }
            
            // Clean Fund duplicates
            for (const duplicateGroup of duplicatesData.details.fundDuplicates) {
                if (duplicateGroup.duplicateIds.length > 0) {
                    const batchSize = 100;
                    for (let i = 0; i < duplicateGroup.duplicateIds.length; i += batchSize) {
                        const batch = duplicateGroup.duplicateIds.slice(i, i + batchSize);
                        const { error } = await this.supabase
                            .from('fund_table')
                            .delete()
                            .in('id', batch);
                            
                        if (!error) {
                            totalRemoved += batch.length;
                        } else {
                            this.log(`❌ Failed to remove fund batch for ${duplicateGroup.fund_name}: ${error.message}`, 'error');
                            this.metrics.errorsFound++;
                        }
                    }
                    
                    this.log(`🗑️ Removed ${duplicateGroup.duplicateIds.length} duplicate Funds for: ${duplicateGroup.fund_name}`);
                    
                    this.changes.duplicateResolutions.push({
                        type: 'fund_duplicates_removed',
                        fund_name: duplicateGroup.fund_name,
                        count: duplicateGroup.duplicateIds.length,
                        keptRecord: duplicateGroup.records[0].id,
                        removedIds: duplicateGroup.duplicateIds
                    });
                }
            }
            
            this.metrics.duplicatesRemoved = totalRemoved;
            this.log(`✅ Total VCS duplicates cleaned: ${totalRemoved}`, 'success');
            
        } catch (error) {
            this.log(`VCS duplicate cleanup failed: ${error.message}`, 'error');
            this.metrics.errorsFound++;
        }
        
        return totalRemoved;
    }

    /**
     * 🔍 VCS DATA QUALITY ANALYSIS
     */
    async analyzeDataQuality() {
        this.log('=== VCS DATA QUALITY ANALYSIS ===');
        
        try {
            const qualityIssues = {
                vcNoName: 0,
                fundNoName: 0,
                vcMissingData: 0,
                fundMissingData: 0,
                invalidAmounts: 0
            };
            
            // Check for missing names
            const { count: vcNoName } = await this.supabase
                .from('vc_table')
                .select('*', { count: 'exact' })
                .or('company_name.is.null,company_name.eq.""');
                
            const { count: fundNoName } = await this.supabase
                .from('fund_table')
                .select('*', { count: 'exact' })
                .or('fund_name.is.null,fund_name.eq.""');
                
            qualityIssues.vcNoName = vcNoName || 0;
            qualityIssues.fundNoName = fundNoName || 0;
            
            // Check for missing critical data
            const { count: vcMissingData } = await this.supabase
                .from('vc_table')
                .select('*', { count: 'exact' })
                .or('company_id.is.null,location.is.null');
                
            const { count: fundMissingData } = await this.supabase
                .from('fund_table')
                .select('*', { count: 'exact' })
                .or('company_id.is.null,fund_type.is.null');
                
            qualityIssues.vcMissingData = vcMissingData || 0;
            qualityIssues.fundMissingData = fundMissingData || 0;
            
            // Check for invalid fund amounts
            const { count: invalidAmounts } = await this.supabase
                .from('fund_table')
                .select('*', { count: 'exact' })
                .or('commitment_amount.lt.0,fund_size.lt.0');
                
            qualityIssues.invalidAmounts = invalidAmounts || 0;
            
            const totalIssues = Object.values(qualityIssues).reduce((sum, count) => sum + count, 0);
            this.metrics.dataQualityIssues = totalIssues;
            this.metrics.qualityScore = this.metrics.totalRecords > 0 ? 
                Math.max(0, Math.round(((this.metrics.totalRecords - totalIssues) / this.metrics.totalRecords) * 100)) : 100;
            
            if (totalIssues > 0) {
                this.log(`⚠️ VCS Data Quality Issues Found: ${totalIssues} total`, 'warning');
                this.log(`🏢 VCs - Missing names: ${qualityIssues.vcNoName}, Missing data: ${qualityIssues.vcMissingData}`);
                this.log(`💰 Funds - Missing names: ${qualityIssues.fundNoName}, Missing data: ${qualityIssues.fundMissingData}, Invalid amounts: ${qualityIssues.invalidAmounts}`);
            } else {
                this.log(`✅ VCS data quality is excellent - no issues found!`, 'success');
            }
            
            return qualityIssues;
            
        } catch (error) {
            this.log(`VCS data quality check failed: ${error.message}`, 'error');
            this.metrics.errorsFound++;
            return null;
        }
    }
}

// ==========================================
// APIFY ACTOR MAIN EXECUTION
// ==========================================

Actor.main(async () => {
    console.log('🇰🇷 VCS Maintenance Actor v3.0 Started');
    console.log('🕐 Execution time:', new Date().toISOString());
    
    // Get input configuration
    const input = await Actor.getInput();
    console.log('⚙️ Input configuration:', JSON.stringify(input, null, 2));
    
    try {
        // Initialize and run VCS maintenance system
        const vcsMaintenanceSystem = new VCSMaintenanceSystem(input);
        
        // Check for action type
        if (input.action === 'retrieveMemories') {
            console.log('🧠 ACTION: Retrieving VCS maintenance memories...');
            const memories = await vcsMaintenanceSystem.retrieveMemories(input.memoryOptions || {});
            
            if (memories) {
                console.log(`✅ Retrieved ${memories.length} VCS memories successfully.`);
            } else {
                console.log('❌ Failed to retrieve VCS memories.');
                process.exit(1);
            }
            
        } else {
            console.log('🚀 ACTION: Performing VCS maintenance...');
            const success = await vcsMaintenanceSystem.performMaintenance();
        
            if (success) {
                console.log('🎉 === VCS MAINTENANCE COMPLETED SUCCESSFULLY ===');
            } else {
                console.log('❌ === VCS MAINTENANCE FAILED ===');
                process.exit(1);
            }
        }
        
    } catch (error) {
        console.error('💥 Fatal VCS maintenance error:', error.message);
        process.exit(1);
    }
});

// Export for testing and external usage
export { VCSMaintenanceSystem }; 