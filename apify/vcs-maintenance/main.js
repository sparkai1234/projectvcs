import { Actor } from 'apify';
import { createClient } from '@supabase/supabase-js';

console.log('🔧 === ENHANCED VCS MAINTENANCE SYSTEM v2.0 ===');
console.log('🕐 Maintenance Time:', new Date().toISOString());

/**
 * Enhanced VCS Maintenance System with Email Reporting & Dashboard Integration
 */
class EnhancedVCSMaintenanceSystem {
    constructor(input = {}) {
        this.input = input;
        this.maintenanceLog = [];
        this.metrics = {
            startTime: Date.now(),
            endTime: null,
            duration: 0,
            totalRecords: 0,
            duplicatesFound: 0,
            duplicatesRemoved: 0,
            dataQualityIssues: 0,
            errorsFound: 0,
            successRate: 100
        };
        this.changes = {
            additions: [],
            deletions: [],
            duplicateResolutions: [],
            dataQualityFixes: []
        };
        
        // Initialize Supabase
        this.supabase = null;
        this.initializeSupabase();
    }

    initializeSupabase() {
        const supabaseUrl = this.input.supabaseUrl || process.env.SUPABASE_URL;
        const supabaseKey = this.input.supabaseKey || process.env.SUPABASE_SERVICE_ROLE_KEY || process.env.SUPABASE_KEY;
        
        if (supabaseUrl && supabaseKey) {
            this.supabase = createClient(supabaseUrl, supabaseKey);
            this.log('✅ Supabase client initialized successfully');
        } else {
            this.log('❌ Failed to initialize Supabase client', 'error');
            throw new Error('Missing Supabase credentials');
        }
    }

    log(message, type = 'info') {
        const timestamp = new Date().toISOString();
        const logEntry = { timestamp, type, message };
        this.maintenanceLog.push(logEntry);
        
        const icon = type === 'error' ? '❌' : type === 'warning' ? '⚠️' : type === 'success' ? '🎉' : '✅';
        console.log(`${icon} ${message}`);
    }

    /**
     * 🏥 COMPREHENSIVE DATABASE HEALTH CHECK
     */
    async checkDatabaseHealth() {
        this.log('=== DATABASE HEALTH CHECK ===');
        
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
            this.log(`Database health check failed: ${error.message}`, 'error');
            this.metrics.errorsFound++;
            return null;
        }
    }

    /**
     * 📅 CHECK DATA FRESHNESS AND AGE DISTRIBUTION
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
            this.log(`Data freshness check failed: ${error.message}`, 'warning');
        }
    }

    /**
     * 🔍 ADVANCED DUPLICATE DETECTION WITH DETAILED ANALYSIS
     */
    async detectDuplicates() {
        this.log('=== ADVANCED DUPLICATE DETECTION ===');
        
        try {
            let totalVcDuplicates = 0;
            let totalFundDuplicates = 0;
            const duplicateDetails = {
                vcDuplicates: [],
                fundDuplicates: []
            };
            
            // 🏢 Detect VC duplicates with detailed analysis
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
                        totalVcDuplicates += group.length - 1; // Count extras
                        duplicateDetails.vcDuplicates.push({
                            company_name: name,
                            count: group.length,
                            records: group,
                            duplicateIds: group.slice(1).map(vc => vc.id) // Keep first, mark rest as duplicates
                        });
                    }
                });
            }
            
            // 💰 Detect Fund duplicates with detailed analysis
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
                        totalFundDuplicates += group.length - 1; // Count extras
                        duplicateDetails.fundDuplicates.push({
                            fund_name: name,
                            count: group.length,
                            records: group,
                            duplicateIds: group.slice(1).map(fund => fund.id) // Keep first, mark rest as duplicates
                        });
                    }
                });
            }
            
            this.metrics.duplicatesFound = totalVcDuplicates + totalFundDuplicates;
            
            if (totalVcDuplicates > 0 || totalFundDuplicates > 0) {
                this.log(`🔄 Duplicates Found: ${totalVcDuplicates} VCs, ${totalFundDuplicates} Funds`, 'warning');
                this.log(`📋 Duplicate Groups: ${duplicateDetails.vcDuplicates.length} VC groups, ${duplicateDetails.fundDuplicates.length} Fund groups`);
                
                // Log sample duplicates for visibility
                if (duplicateDetails.vcDuplicates.length > 0) {
                    this.log(`💼 Sample VC duplicates: ${duplicateDetails.vcDuplicates.slice(0, 3).map(d => d.company_name).join(', ')}`);
                }
                if (duplicateDetails.fundDuplicates.length > 0) {
                    this.log(`💰 Sample Fund duplicates: ${duplicateDetails.fundDuplicates.slice(0, 3).map(d => d.fund_name).join(', ')}`);
                }
            } else {
                this.log(`✅ No duplicates detected - database is clean!`, 'success');
            }
            
            return { 
                vcDuplicates: totalVcDuplicates, 
                fundDuplicates: totalFundDuplicates,
                details: duplicateDetails
            };
            
        } catch (error) {
            this.log(`Duplicate detection failed: ${error.message}`, 'error');
            this.metrics.errorsFound++;
            return null;
        }
    }

    /**
     * 🧹 SMART DUPLICATE CLEANUP WITH DETAILED TRACKING
     */
    async cleanupDuplicates(duplicatesData) {
        if (!duplicatesData || (!duplicatesData.details.vcDuplicates.length && !duplicatesData.details.fundDuplicates.length)) {
            this.log('✅ No duplicates to clean up');
            return 0;
        }
        
        this.log('=== SMART DUPLICATE CLEANUP ===');
        
        let totalRemoved = 0;
        
        try {
            // 🏢 Clean VC duplicates
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
            
            // 💰 Clean Fund duplicates
            for (const duplicateGroup of duplicatesData.details.fundDuplicates) {
                if (duplicateGroup.duplicateIds.length > 0) {
                    // Process in batches for large duplicates
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
            this.log(`✅ Total duplicates cleaned: ${totalRemoved}`, 'success');
            
        } catch (error) {
            this.log(`Duplicate cleanup failed: ${error.message}`, 'error');
            this.metrics.errorsFound++;
        }
        
        return totalRemoved;
    }

    /**
     * 🔍 COMPREHENSIVE DATA QUALITY CHECK
     */
    async checkDataQuality() {
        this.log('=== DATA QUALITY ANALYSIS ===');
        
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
            
            if (totalIssues > 0) {
                this.log(`⚠️ Data Quality Issues Found: ${totalIssues} total`, 'warning');
                this.log(`🏢 VCs - Missing names: ${qualityIssues.vcNoName}, Missing data: ${qualityIssues.vcMissingData}`);
                this.log(`💰 Funds - Missing names: ${qualityIssues.fundNoName}, Missing data: ${qualityIssues.fundMissingData}, Invalid amounts: ${qualityIssues.invalidAmounts}`);
            } else {
                this.log(`✅ Data quality is excellent - no issues found!`, 'success');
            }
            
            return qualityIssues;
            
        } catch (error) {
            this.log(`Data quality check failed: ${error.message}`, 'error');
            this.metrics.errorsFound++;
            return null;
        }
    }

    /**
     * 📊 GENERATE COMPREHENSIVE MAINTENANCE REPORT
     */
    generateMaintenanceReport(health, duplicates, quality) {
        this.metrics.endTime = Date.now();
        this.metrics.duration = Math.round((this.metrics.endTime - this.metrics.startTime) / 1000);
        this.metrics.successRate = this.metrics.errorsFound === 0 ? 100 : Math.max(0, 100 - (this.metrics.errorsFound * 10));
        
        const report = {
            timestamp: new Date().toISOString(),
            maintenance_type: this.input.maintenanceType || 'standard',
            duration_seconds: this.metrics.duration,
            success_rate: this.metrics.successRate,
            
            // Database Health
            database_health: {
                total_records: this.metrics.totalRecords,
                vc_count: health?.vcCount || 0,
                fund_count: health?.fundCount || 0,
                recent_activity: {
                    vc_recent: health?.recentVCs || 0,
                    fund_recent: health?.recentFunds || 0
                }
            },
            
            // Duplicate Analysis
            duplicate_analysis: {
                duplicates_found: this.metrics.duplicatesFound,
                duplicates_removed: this.metrics.duplicatesRemoved,
                vc_duplicates: duplicates?.vcDuplicates || 0,
                fund_duplicates: duplicates?.fundDuplicates || 0,
                cleanup_success: this.metrics.duplicatesRemoved === this.metrics.duplicatesFound
            },
            
            // Data Quality
            data_quality: {
                issues_found: this.metrics.dataQualityIssues,
                quality_score: Math.max(0, 100 - this.metrics.dataQualityIssues),
                details: quality || {}
            },
            
            // Changes Made
            changes: this.changes,
            
            // System Performance
            performance: {
                errors_encountered: this.metrics.errorsFound,
                processing_speed: this.metrics.totalRecords / Math.max(1, this.metrics.duration),
                status: this.metrics.errorsFound === 0 ? 'HEALTHY' : 'NEEDS_ATTENTION'
            },
            
            // Maintenance Log
            full_log: this.maintenanceLog
        };
        
        return report;
    }

    /**
     * 📧 SEND EMAIL NOTIFICATION WITH MAINTENANCE REPORT
     */
    async sendEmailReport(report) {
        if (!this.input.emailConfig?.enabled) {
            this.log('📧 Email reporting disabled - skipping email notification');
            return;
        }
        
        try {
            const emailContent = this.formatEmailReport(report);
            
            // Here you would integrate with your preferred email service
            // For now, we'll log the email content and save it for external sending
            await Actor.setValue('email_report', {
                subject: `VCS Maintenance Report - ${report.performance.status}`,
                content: emailContent,
                timestamp: report.timestamp,
                recipients: this.input.emailConfig?.recipients || []
            });
            
            this.log('📧 Email report prepared and saved to Actor storage', 'success');
            
        } catch (error) {
            this.log(`Email report generation failed: ${error.message}`, 'error');
        }
    }

    /**
     * 📝 FORMAT EMAIL REPORT CONTENT
     */
    formatEmailReport(report) {
        const status = report.performance.status;
        const statusEmoji = status === 'HEALTHY' ? '✅' : '⚠️';
        
        return `
🔧 VCS MAINTENANCE REPORT ${statusEmoji}
=====================================

📅 Date: ${new Date(report.timestamp).toLocaleString()}
⏱️ Duration: ${report.duration_seconds} seconds
📊 Success Rate: ${report.success_rate}%
🎯 Status: ${status}

📊 DATABASE HEALTH
==================
• Total Records: ${report.database_health.total_records.toLocaleString()}
• VCs: ${report.database_health.vc_count.toLocaleString()}
• Funds: ${report.database_health.fund_count.toLocaleString()}
• Recent Activity: ${report.database_health.recent_activity.vc_recent + report.database_health.recent_activity.fund_recent} new records

🔍 DUPLICATE ANALYSIS
====================
• Duplicates Found: ${report.duplicate_analysis.duplicates_found}
• Duplicates Removed: ${report.duplicate_analysis.duplicates_removed}
• VC Duplicates: ${report.duplicate_analysis.vc_duplicates}
• Fund Duplicates: ${report.duplicate_analysis.fund_duplicates}
• Cleanup Success: ${report.duplicate_analysis.cleanup_success ? 'YES' : 'NO'}

🎯 DATA QUALITY
===============
• Quality Score: ${report.data_quality.quality_score}/100
• Issues Found: ${report.data_quality.issues_found}
• Overall Quality: ${report.data_quality.quality_score >= 95 ? 'Excellent' : report.data_quality.quality_score >= 80 ? 'Good' : 'Needs Attention'}

📝 CHANGES MADE
===============
• Duplicate Resolutions: ${report.changes.duplicateResolutions.length}
• Data Quality Fixes: ${report.changes.dataQualityFixes.length}
• Recent Additions: ${report.changes.additions.length}

${status === 'NEEDS_ATTENTION' ? '⚠️ ATTENTION REQUIRED: Please review the maintenance log for details.' : '✅ All systems operating normally.'}

🔗 View full report: Apify Console → vcs-maintenance → Latest Run → Storage
        `.trim();
    }

    /**
     * 🚀 MAIN MAINTENANCE EXECUTION
     */
    async performMaintenance() {
        this.log('🚀 STARTING ENHANCED VCS MAINTENANCE', 'success');
        
        try {
            // 1. Database Health Check
            const health = await this.checkDatabaseHealth();
            if (!health) {
                this.log('❌ Health check failed - aborting maintenance', 'error');
                return false;
            }
            
            // 2. Advanced Duplicate Detection
            const duplicates = await this.detectDuplicates();
            
            // 3. Smart Duplicate Cleanup (if enabled)
            let cleanupCount = 0;
            if (this.input.cleanupDuplicates !== false && duplicates) {
                cleanupCount = await this.cleanupDuplicates(duplicates);
            }
            
            // 4. Data Quality Analysis
            const quality = await this.checkDataQuality();
            
            // 5. Generate Comprehensive Report
            const report = this.generateMaintenanceReport(health, duplicates, quality);
            
            // 6. Save Report to Actor Storage
            await Actor.setValue('maintenance_report', report);
            await Actor.setValue('maintenance_summary', {
                timestamp: report.timestamp,
                status: report.performance.status,
                duration: report.duration_seconds,
                records_processed: report.database_health.total_records,
                duplicates_removed: report.duplicate_analysis.duplicates_removed,
                quality_score: report.data_quality.quality_score
            });
            
            // 7. Send Email Report (if configured)
            await this.sendEmailReport(report);
            
            // 8. Final Summary
            this.log('=== MAINTENANCE SUMMARY ===');
            this.log(`⏱️ Duration: ${report.duration_seconds} seconds`);
            this.log(`📊 Records Processed: ${report.database_health.total_records.toLocaleString()}`);
            this.log(`🧹 Duplicates Removed: ${report.duplicate_analysis.duplicates_removed}`);
            this.log(`🎯 Quality Score: ${report.data_quality.quality_score}/100`);
            this.log(`✅ Status: ${report.performance.status}`, 'success');
            
            return true;
            
        } catch (error) {
            this.log(`Critical maintenance error: ${error.message}`, 'error');
            return false;
        }
    }
}

// ==========================================
// APIFY ACTOR MAIN EXECUTION
// ==========================================

Actor.main(async () => {
    console.log('🇰🇷 Enhanced VCS Maintenance Actor Started');
    console.log('🕐 Execution time:', new Date().toISOString());
    
    // Get input configuration
    const input = await Actor.getInput();
    console.log('⚙️ Input configuration:', JSON.stringify(input, null, 2));
    
    try {
        // Initialize and run maintenance system
        const maintenanceSystem = new EnhancedVCSMaintenanceSystem(input);
        const success = await maintenanceSystem.performMaintenance();
        
        if (success) {
            console.log('🎉 === ENHANCED VCS MAINTENANCE COMPLETED SUCCESSFULLY ===');
        } else {
            console.log('❌ === VCS MAINTENANCE FAILED ===');
            process.exit(1);
        }
        
    } catch (error) {
        console.error('💥 Fatal maintenance error:', error.message);
        process.exit(1);
    }
}); 