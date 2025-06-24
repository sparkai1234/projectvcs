import { Actor } from 'apify';
import { createClient } from '@supabase/supabase-js';

console.log('🔧 === DIVA MAINTENANCE SYSTEM v3.0 (APIFY STANDALONE) ===');
console.log('🕐 Maintenance Time:', new Date().toISOString());

/**
 * 🏗️ EMBEDDED MAINTENANCE SYSTEM CORE
 * Base class for all maintenance systems (VCS, DIVA, etc.)
 * Embedded directly for Apify deployment
 */
class MaintenanceSystemCore {
    constructor(systemType, input = {}) {
        this.systemType = systemType;
        this.input = input;
        this.startTime = Date.now();
        
        // Initialize metrics
        this.metrics = {
            totalRecords: 0,
            duplicatesFound: 0,
            duplicatesRemoved: 0,
            dataQualityIssues: 0,
            qualityScore: 0,
            errorsFound: 0
        };
        
        // Initialize change tracking
        this.changes = {
            additions: [],
            duplicateResolutions: [],
            qualityImprovements: []
        };
        
        // Initialize Supabase client
        this.initializeSupabase();
    }
    
    /**
     * 🔌 Initialize Supabase Client
     */
    initializeSupabase() {
        const supabaseUrl = this.input.supabaseUrl || process.env.SUPABASE_URL;
        const supabaseKey = this.input.supabaseKey || process.env.SUPABASE_SERVICE_ROLE_KEY || process.env.SUPABASE_KEY;
        
        if (!supabaseUrl || !supabaseKey) {
            throw new Error('Missing Supabase credentials. Please provide SUPABASE_URL and SUPABASE_SERVICE_ROLE_KEY');
        }
        
        this.supabase = createClient(supabaseUrl, supabaseKey);
        this.log('✅ Supabase client initialized successfully');
    }
    
    /**
     * 📝 Enhanced Logging with System Type
     */
    log(message, level = 'info') {
        const timestamp = new Date().toISOString();
        const prefix = level === 'error' ? '❌' : level === 'warning' ? '⚠️' : level === 'success' ? '✅' : '📋';
        console.log(`${prefix} [${this.systemType}] ${message}`);
    }
    
    /**
     * 🚀 Main Maintenance Execution
     */
    async performMaintenance() {
        this.log(`=== ${this.systemType} MAINTENANCE STARTED ===`);
        
        try {
            // 1. Database Health Check
            const healthResult = await this.checkDatabaseHealth();
            if (!healthResult) {
                this.log('Database health check failed', 'error');
                return false;
            }
            
            // 2. Duplicate Detection
            const duplicateResult = await this.detectDuplicates();
            if (!duplicateResult) {
                this.log('Duplicate detection failed', 'error');
                return false;
            }
            
            // 3. Cleanup (if enabled)
            let cleanupResult = 0;
            if (this.input.performCleanup !== false && duplicateResult) {
                cleanupResult = await this.performCleanup(duplicateResult);
            }
            
            // 4. Data Quality Analysis
            const qualityResult = await this.analyzeDataQuality();
            if (!qualityResult) {
                this.log('Data quality analysis failed', 'error');
                return false;
            }
            
            // 5. Generate Report
            const report = this.generateMaintenanceReport(healthResult, duplicateResult, qualityResult);
            
            // 6. Save to Actor Storage
            await this.saveToActorStorage(report);
            
            // 7. Dashboard Integration (if enabled)
            if (this.input.dashboard?.enabled !== false) {
                await this.saveToDashboard(report);
            }
            
            // 8. Prepare Consolidated Email Data
            await this.prepareConsolidatedEmailData(report);
            
            this.log(`=== ${this.systemType} MAINTENANCE COMPLETED SUCCESSFULLY ===`, 'success');
            return true;
            
        } catch (error) {
            this.log(`Fatal maintenance error: ${error.message}`, 'error');
            this.metrics.errorsFound++;
            return false;
        }
    }
    
    /**
     * 📊 Generate Maintenance Report
     */
    generateMaintenanceReport(healthResult, duplicateResult, qualityResult) {
        const duration = Math.round((Date.now() - this.startTime) / 1000);
        
        const report = {
            system_type: this.systemType,
            timestamp: new Date().toISOString(),
            duration_seconds: duration,
            performance: {
                status: this.metrics.errorsFound === 0 ? 
                    (this.metrics.qualityScore >= 90 ? 'HEALTHY' : 'NEEDS_ATTENTION') : 'ERROR',
                quality_score: this.metrics.qualityScore,
                records_processed: this.metrics.totalRecords,
                duplicates_found: this.metrics.duplicatesFound,
                duplicates_removed: this.metrics.duplicatesRemoved,
                data_quality_issues: this.metrics.dataQualityIssues,
                errors_found: this.metrics.errorsFound
            },
            details: {
                health_check: healthResult,
                duplicate_analysis: duplicateResult,
                quality_analysis: qualityResult,
                changes_made: this.changes
            },
            input_configuration: this.input
        };
        
        this.log(`📊 Report generated - Status: ${report.performance.status}, Quality: ${this.metrics.qualityScore}/100`);
        return report;
    }
    
    /**
     * 💾 Save Report to Actor Storage
     */
    async saveToActorStorage(report) {
        try {
            const storageKey = `${this.systemType.toLowerCase()}_maintenance_report`;
            const summaryKey = `${this.systemType.toLowerCase()}_maintenance_summary`;
            
            await Actor.setValue(storageKey, report);
            await Actor.setValue(summaryKey, {
                system_type: report.system_type,
                status: report.performance.status,
                quality_score: report.performance.quality_score,
                duration_seconds: report.duration_seconds,
                timestamp: report.timestamp
            });
            
            this.log(`💾 ${this.systemType} report saved to Actor storage`);
        } catch (error) {
            this.log(`Failed to save to Actor storage: ${error.message}`, 'error');
        }
    }
    
    /**
     * 📊 Save to Unified Dashboard
     */
    async saveToDashboard(report) {
        try {
            const { error } = await this.supabase
                .from('unified_maintenance_reports')
                .insert({
                    system_type: report.system_type,
                    status: report.performance.status,
                    duration_seconds: report.duration_seconds,
                    quality_score: report.performance.quality_score,
                    duplicates_removed: report.performance.duplicates_removed,
                    records_processed: report.performance.records_processed,
                    report_data: report
                });
                
            if (error) {
                this.log(`Dashboard save error: ${error.message}`, 'warning');
            } else {
                this.log(`💾 ${this.systemType} report saved to unified dashboard successfully`);
            }
        } catch (error) {
            this.log(`Dashboard integration failed: ${error.message}`, 'warning');
        }
    }
    
    /**
     * 📧 Prepare Consolidated Email Data
     */
    async prepareConsolidatedEmailData(report) {
        try {
            const emailData = {
                system_type: report.system_type,
                status: report.performance.status,
                quality_score: report.performance.quality_score,
                records_processed: report.performance.records_processed,
                duplicates_removed: report.performance.duplicates_removed,
                duration_seconds: report.duration_seconds,
                timestamp: report.timestamp,
                summary: `${report.system_type} maintenance completed with ${report.performance.status} status`
            };
            
            await Actor.setValue('consolidated_email_data', emailData);
            this.log(`📧 ${this.systemType} email data prepared for consolidated reporting`);
            
        } catch (error) {
            this.log(`Failed to prepare email data: ${error.message}`, 'warning');
        }
    }
    
    /**
     * 🧠 Retrieve System Memories
     */
    async retrieveMemories(options = {}) {
        try {
            const memories = await Actor.getValue('system_memories') || [];
            const systemMemories = memories.filter(memory => 
                memory.system_type === this.systemType || memory.system_type === 'ALL'
            );
            
            if (options.limit) {
                return systemMemories.slice(0, options.limit);
            }
            
            return systemMemories;
            
        } catch (error) {
            this.log(`Failed to retrieve memories: ${error.message}`, 'warning');
            return [];
        }
    }
    
    // Abstract methods that must be implemented by subclasses
    async checkDatabaseHealth() { throw new Error('checkDatabaseHealth must be implemented'); }
    async detectDuplicates() { throw new Error('detectDuplicates must be implemented'); }
    async performCleanup(duplicatesData) { throw new Error('performCleanup must be implemented'); }
    async analyzeDataQuality() { throw new Error('analyzeDataQuality must be implemented'); }
}

/**
 * 🏢 DIVA-SPECIFIC MAINTENANCE SYSTEM
 * Handles all DIVA tables: investment_performance, financial_statements, 
 * association_status, personnel_status, professional_personnel, violations, vc_map
 */
class DIVAMaintenanceSystem extends MaintenanceSystemCore {
    constructor(input = {}) {
        super('DIVA', input);
    }

    /**
     * 🏥 DIVA DATABASE HEALTH CHECK
     */
    async checkDatabaseHealth() {
        this.log('=== DIVA DATABASE HEALTH CHECK ===');
        
        try {
            // Get current record counts for all DIVA tables (Financial Statements DISABLED)
            const tableChecks = await Promise.all([
                this.supabase.from('diva_investment_performance').select('*', { count: 'exact', head: true }),
                // this.supabase.from('diva_financial_statements').select('*', { count: 'exact', head: true }), // DISABLED
                this.supabase.from('diva_association_status').select('*', { count: 'exact', head: true }),
                this.supabase.from('diva_personnel_status').select('*', { count: 'exact', head: true }),
                this.supabase.from('diva_professional_personnel').select('*', { count: 'exact', head: true }),
                this.supabase.from('diva_violations').select('*', { count: 'exact', head: true }),
                this.supabase.from('diva_vc_map').select('*', { count: 'exact', head: true })
            ]);

            const tableCounts = {
                investment_performance: tableChecks[0].count || 0,
                // financial_statements: tableChecks[1].count || 0, // DISABLED
                association_status: tableChecks[1].count || 0,
                personnel_status: tableChecks[2].count || 0,
                professional_personnel: tableChecks[3].count || 0,
                violations: tableChecks[4].count || 0,
                vc_map: tableChecks[5].count || 0
            };

            const totalRecords = Object.values(tableCounts).reduce((sum, count) => sum + count, 0);
            this.metrics.totalRecords = totalRecords;

            this.log(`📊 DIVA Records Summary (Financial Statements DISABLED):`);
            this.log(`   • Investment Performance: ${tableCounts.investment_performance.toLocaleString()}`);
            // this.log(`   • Financial Statements: ${tableCounts.financial_statements.toLocaleString()}`); // DISABLED
            this.log(`   • Association Status: ${tableCounts.association_status.toLocaleString()}`);
            this.log(`   • Personnel Status: ${tableCounts.personnel_status.toLocaleString()}`);
            this.log(`   • Professional Personnel: ${tableCounts.professional_personnel.toLocaleString()}`);
            this.log(`   • Violations: ${tableCounts.violations.toLocaleString()}`);
            this.log(`   • VC Map: ${tableCounts.vc_map.toLocaleString()}`);
            this.log(`📊 Total DIVA Records: ${totalRecords.toLocaleString()}`);
            
            // Check for recent activity (data freshness)
            await this.checkDataFreshness();
            
            return { ...tableCounts, totalRecords };
            
        } catch (error) {
            this.log(`DIVA health check failed: ${error.message}`, 'error');
            this.metrics.errorsFound++;
            return null;
        }
    }

    /**
     * 📅 CHECK DIVA DATA FRESHNESS
     */
    async checkDataFreshness() {
        try {
            const oneHourAgo = new Date(Date.now() - 60 * 60 * 1000).toISOString();
            
            // Check recent activity across key DIVA tables (Financial Statements DISABLED)
            const recentChecks = await Promise.all([
                this.supabase.from('diva_investment_performance').select('*', { count: 'exact', head: true }).gte('created_at', oneHourAgo),
                // this.supabase.from('diva_financial_statements').select('*', { count: 'exact', head: true }).gte('created_at', oneHourAgo), // DISABLED
                this.supabase.from('diva_association_status').select('*', { count: 'exact', head: true }).gte('created_at', oneHourAgo)
            ]);

            const recentActivity = {
                investment_performance: recentChecks[0].count || 0,
                // financial_statements: recentChecks[1].count || 0, // DISABLED
                association_status: recentChecks[1].count || 0
            };

            const totalRecentActivity = Object.values(recentActivity).reduce((sum, count) => sum + count, 0);

            if (totalRecentActivity > 0) {
                this.log(`🔥 Recent DIVA Activity: ${totalRecentActivity} new records in last hour`);
                this.changes.additions.push({
                    type: 'recent_diva_activity',
                    ...recentActivity,
                    timeframe: '1 hour'
                });
            } else {
                this.log(`📊 No recent DIVA activity (expected for maintenance runs)`);
            }
            
            // Financial statements data span check DISABLED - no longer tracking this data
            /*
            const { data: oldestFS } = await this.supabase
                .from('diva_financial_statements')
                .select('data_year, company_name')
                .order('data_year', { ascending: true })
                .limit(1);
                
            const { data: newestFS } = await this.supabase
                .from('diva_financial_statements')
                .select('data_year, company_name')
                .order('data_year', { ascending: false })
                .limit(1);
                
            if (oldestFS?.[0] && newestFS?.[0]) {
                const yearSpan = newestFS[0].data_year - oldestFS[0].data_year;
                this.log(`📅 Financial Data Span: ${yearSpan} years (${oldestFS[0].data_year} to ${newestFS[0].data_year})`);
                this.log(`🏢 Oldest: ${oldestFS[0].company_name} | Newest: ${newestFS[0].company_name}`);
            }
            */
            
        } catch (error) {
            this.log(`DIVA data freshness check failed: ${error.message}`, 'warning');
        }
    }

    /**
     * 🔍 DIVA DUPLICATE DETECTION
     */
    async detectDuplicates() {
        this.log('=== DIVA DUPLICATE DETECTION ===');
        
        try {
            const duplicateDetails = {
                // financialStatements: [], // DISABLED
                investmentPerformance: [],
                associationStatus: [],
                professionalPersonnel: [],
                violations: []
            };
            
            let totalDuplicates = 0;

            // 📊 Financial Statements - DISABLED - no longer checking for duplicates
            /*
            const { data: allFinancialStatements } = await this.supabase
                .from('diva_financial_statements')
                .select('id, company_name, data_year, tab_type, created_at')
                .order('company_name, data_year, tab_type, created_at');
                
            if (allFinancialStatements && allFinancialStatements.length > 0) {
                const fsGroups = new Map();
                
                allFinancialStatements.forEach(fs => {
                    if (fs.company_name && fs.data_year && fs.tab_type) {
                        const key = `${fs.company_name.toLowerCase().trim()}_${fs.data_year}_${fs.tab_type}`;
                        if (!fsGroups.has(key)) {
                            fsGroups.set(key, []);
                        }
                        fsGroups.get(key).push(fs);
                    }
                });
                
                fsGroups.forEach((group, key) => {
                    if (group.length > 1) {
                        const duplicateCount = group.length - 1;
                        totalDuplicates += duplicateCount;
                        duplicateDetails.financialStatements.push({
                            key: key,
                            count: group.length,
                            records: group,
                            duplicateIds: group.slice(1).map(fs => fs.id)
                        });
                    }
                });
            }
            */

            // 💼 Investment Performance - Check by company_name + data_year
            const { data: allInvestmentPerformance } = await this.supabase
                .from('diva_investment_performance')
                .select('id, company_name, data_year, created_at')
                .order('company_name, data_year, created_at');
                
            if (allInvestmentPerformance && allInvestmentPerformance.length > 0) {
                const ipGroups = new Map();
                
                allInvestmentPerformance.forEach(ip => {
                    if (ip.company_name && ip.data_year) {
                        const key = `${ip.company_name.toLowerCase().trim()}_${ip.data_year}`;
                        if (!ipGroups.has(key)) {
                            ipGroups.set(key, []);
                        }
                        ipGroups.get(key).push(ip);
                    }
                });
                
                ipGroups.forEach((group, key) => {
                    if (group.length > 1) {
                        const duplicateCount = group.length - 1;
                        totalDuplicates += duplicateCount;
                        duplicateDetails.investmentPerformance.push({
                            key: key,
                            count: group.length,
                            records: group,
                            duplicateIds: group.slice(1).map(ip => ip.id)
                        });
                    }
                });
            }

            // 🏢 Association Status - Check by company_name + fund_name (VC firms can have multiple funds)
            const { data: allAssociationStatus } = await this.supabase
                .from('diva_association_status')
                .select('id, company_name, fund_name, created_at')
                .order('company_name, fund_name, created_at');
                
            if (allAssociationStatus && allAssociationStatus.length > 0) {
                const asGroups = new Map();
                
                allAssociationStatus.forEach(as => {
                    if (as.company_name && as.fund_name) {
                        // Use company_name + fund_name as key since VCs can operate multiple funds
                        const key = `${as.company_name.toLowerCase().trim()}_${as.fund_name.toLowerCase().trim()}`;
                        if (!asGroups.has(key)) {
                            asGroups.set(key, []);
                        }
                        asGroups.get(key).push(as);
                    }
                });
                
                asGroups.forEach((group, key) => {
                    if (group.length > 1) {
                        const duplicateCount = group.length - 1;
                        totalDuplicates += duplicateCount;
                        duplicateDetails.associationStatus.push({
                            key: key,
                            count: group.length,
                            records: group,
                            duplicateIds: group.slice(1).map(as => as.id)
                        });
                    }
                });
            }

            // 👥 Professional Personnel - Check by company_name + name
            const { data: allProfessionalPersonnel } = await this.supabase
                .from('diva_professional_personnel')
                .select('id, company_name, name, created_at')
                .order('company_name, name, created_at');
                
            if (allProfessionalPersonnel && allProfessionalPersonnel.length > 0) {
                const ppGroups = new Map();
                
                allProfessionalPersonnel.forEach(pp => {
                    if (pp.company_name && pp.name) {
                        const key = `${pp.company_name.toLowerCase().trim()}_${pp.name.toLowerCase().trim()}`;
                        if (!ppGroups.has(key)) {
                            ppGroups.set(key, []);
                        }
                        ppGroups.get(key).push(pp);
                    }
                });
                
                ppGroups.forEach((group, key) => {
                    if (group.length > 1) {
                        const duplicateCount = group.length - 1;
                        totalDuplicates += duplicateCount;
                        duplicateDetails.professionalPersonnel.push({
                            key: key,
                            count: group.length,
                            records: group,
                            duplicateIds: group.slice(1).map(pp => pp.id)
                        });
                    }
                });
            }

            // ⚠️ Violations - Check by company_name + violation_type + data_year
            const { data: allViolations } = await this.supabase
                .from('diva_violations')
                .select('id, company_name, violation_type, data_year, created_at')
                .order('company_name, violation_type, data_year, created_at');
                
            if (allViolations && allViolations.length > 0) {
                const vGroups = new Map();
                
                allViolations.forEach(v => {
                    if (v.company_name && v.violation_type && v.data_year) {
                        const key = `${v.company_name.toLowerCase().trim()}_${v.violation_type}_${v.data_year}`;
                        if (!vGroups.has(key)) {
                            vGroups.set(key, []);
                        }
                        vGroups.get(key).push(v);
                    }
                });
                
                vGroups.forEach((group, key) => {
                    if (group.length > 1) {
                        const duplicateCount = group.length - 1;
                        totalDuplicates += duplicateCount;
                        duplicateDetails.violations.push({
                            key: key,
                            count: group.length,
                            records: group,
                            duplicateIds: group.slice(1).map(v => v.id)
                        });
                    }
                });
            }

            this.metrics.duplicatesFound = totalDuplicates;
            
            if (totalDuplicates > 0) {
                this.log(`🔍 DIVA Duplicates Found: ${totalDuplicates} total`, 'warning');
                this.log(`   • Investment Performance: ${duplicateDetails.investmentPerformance.length} groups`);
                this.log(`   • Association Status: ${duplicateDetails.associationStatus.length} groups`);
                this.log(`   • Professional Personnel: ${duplicateDetails.professionalPersonnel.length} groups`);
                this.log(`   • Violations: ${duplicateDetails.violations.length} groups`);
            } else {
                this.log(`✅ No duplicates detected - DIVA database is clean!`, 'success');
            }
            
            return {
                totalDuplicates,
                details: duplicateDetails
            };
            
        } catch (error) {
            this.log(`DIVA duplicate detection failed: ${error.message}`, 'error');
            this.metrics.errorsFound++;
            return null;
        }
    }

    /**
     * 🧹 DIVA DUPLICATE CLEANUP
     */
    async performCleanup(duplicatesData) {
        if (!duplicatesData || duplicatesData.totalDuplicates === 0) {
            this.log('✅ No DIVA duplicates to clean up');
            return 0;
        }
        
        this.log('=== DIVA DUPLICATE CLEANUP ===');
        
        let totalRemoved = 0;
        const batchSize = 100;
        
        try {
            // Clean Investment Performance duplicates
            for (const duplicateGroup of duplicatesData.details.investmentPerformance) {
                if (duplicateGroup.duplicateIds.length > 0) {
                    for (let i = 0; i < duplicateGroup.duplicateIds.length; i += batchSize) {
                        const batch = duplicateGroup.duplicateIds.slice(i, i + batchSize);
                        const { error } = await this.supabase
                            .from('diva_investment_performance')
                            .delete()
                            .in('id', batch);
                            
                        if (!error) {
                            totalRemoved += batch.length;
                        } else {
                            this.log(`❌ Failed to remove investment performance batch: ${error.message}`, 'error');
                            this.metrics.errorsFound++;
                        }
                    }
                    
                    this.log(`🗑️ Removed ${duplicateGroup.duplicateIds.length} duplicate Investment Performance for: ${duplicateGroup.key}`);
                    
                    this.changes.duplicateResolutions.push({
                        type: 'investment_performance_duplicates_removed',
                        key: duplicateGroup.key,
                        count: duplicateGroup.duplicateIds.length,
                        keptRecord: duplicateGroup.records[0].id,
                        removedIds: duplicateGroup.duplicateIds
                    });
                }
            }
            
            // Clean Association Status duplicates
            for (const duplicateGroup of duplicatesData.details.associationStatus) {
                if (duplicateGroup.duplicateIds.length > 0) {
                    const { error } = await this.supabase
                        .from('diva_association_status')
                        .delete()
                        .in('id', duplicateGroup.duplicateIds);
                        
                    if (!error) {
                        totalRemoved += duplicateGroup.duplicateIds.length;
                        this.log(`🗑️ Removed ${duplicateGroup.duplicateIds.length} duplicate Association Status for: ${duplicateGroup.key}`);
                        
                        this.changes.duplicateResolutions.push({
                            type: 'association_status_duplicates_removed',
                            key: duplicateGroup.key,
                            count: duplicateGroup.duplicateIds.length,
                            keptRecord: duplicateGroup.records[0].id,
                            removedIds: duplicateGroup.duplicateIds
                        });
                    } else {
                        this.log(`❌ Failed to remove association status duplicates: ${error.message}`, 'error');
                        this.metrics.errorsFound++;
                    }
                }
            }
            
            // Clean Professional Personnel duplicates
            for (const duplicateGroup of duplicatesData.details.professionalPersonnel) {
                if (duplicateGroup.duplicateIds.length > 0) {
                    const { error } = await this.supabase
                        .from('diva_professional_personnel')
                        .delete()
                        .in('id', duplicateGroup.duplicateIds);
                        
                    if (!error) {
                        totalRemoved += duplicateGroup.duplicateIds.length;
                        this.log(`🗑️ Removed ${duplicateGroup.duplicateIds.length} duplicate Professional Personnel for: ${duplicateGroup.key}`);
                        
                        this.changes.duplicateResolutions.push({
                            type: 'professional_personnel_duplicates_removed',
                            key: duplicateGroup.key,
                            count: duplicateGroup.duplicateIds.length,
                            keptRecord: duplicateGroup.records[0].id,
                            removedIds: duplicateGroup.duplicateIds
                        });
                    } else {
                        this.log(`❌ Failed to remove professional personnel duplicates: ${error.message}`, 'error');
                        this.metrics.errorsFound++;
                    }
                }
            }
            
            // Clean Violations duplicates
            for (const duplicateGroup of duplicatesData.details.violations) {
                if (duplicateGroup.duplicateIds.length > 0) {
                    const { error } = await this.supabase
                        .from('diva_violations')
                        .delete()
                        .in('id', duplicateGroup.duplicateIds);
                        
                    if (!error) {
                        totalRemoved += duplicateGroup.duplicateIds.length;
                        this.log(`🗑️ Removed ${duplicateGroup.duplicateIds.length} duplicate Violations for: ${duplicateGroup.key}`);
                        
                        this.changes.duplicateResolutions.push({
                            type: 'violations_duplicates_removed',
                            key: duplicateGroup.key,
                            count: duplicateGroup.duplicateIds.length,
                            keptRecord: duplicateGroup.records[0].id,
                            removedIds: duplicateGroup.duplicateIds
                        });
                    } else {
                        this.log(`❌ Failed to remove violations duplicates: ${error.message}`, 'error');
                        this.metrics.errorsFound++;
                    }
                }
            }

            this.metrics.duplicatesRemoved = totalRemoved;
            this.log(`✅ Total DIVA duplicates cleaned: ${totalRemoved}`, 'success');
            
        } catch (error) {
            this.log(`DIVA duplicate cleanup failed: ${error.message}`, 'error');
            this.metrics.errorsFound++;
        }
        
        return totalRemoved;
    }

    /**
     * 🔍 DIVA DATA QUALITY ANALYSIS
     */
    async analyzeDataQuality() {
        this.log('=== DIVA DATA QUALITY ANALYSIS ===');
        
        try {
            const qualityIssues = {
                // financialMissingData: 0, // DISABLED
                investmentMissingData: 0,
                associationMissingData: 0,
                personnelMissingData: 0,
                violationsMissingData: 0,
                // invalidFinancialAmounts: 0, // DISABLED
                missingCompanyNames: 0
            };
            
            // Financial Statements quality checks DISABLED - no longer tracking this data
            /*
            const { count: fsMissingData } = await this.supabase
                .from('diva_financial_statements')
                .select('*', { count: 'exact', head: true })
                .or('company_name.is.null,data_year.is.null,tab_type.is.null');
                
            const { count: fsInvalidAmounts } = await this.supabase
                .from('diva_financial_statements')
                .select('*', { count: 'exact', head: true })
                .or('total_assets.lt.0,total_liabilities.lt.0,total_equity.lt.0');
                
            qualityIssues.financialMissingData = fsMissingData || 0;
            qualityIssues.invalidFinancialAmounts = fsInvalidAmounts || 0;
            */
            
            // Check Investment Performance quality
            const { count: ipMissingData } = await this.supabase
                .from('diva_investment_performance')
                .select('*', { count: 'exact', head: true })
                .or('company_name.is.null,data_year.is.null');
                
            qualityIssues.investmentMissingData = ipMissingData || 0;
            
            // Check Association Status quality
            const { count: asMissingData } = await this.supabase
                .from('diva_association_status')
                .select('*', { count: 'exact', head: true })
                .or('company_name.is.null,status.is.null');
                
            qualityIssues.associationMissingData = asMissingData || 0;
            
            // Check Professional Personnel quality
            const { count: ppMissingData } = await this.supabase
                .from('diva_professional_personnel')
                .select('*', { count: 'exact', head: true })
                .or('company_name.is.null,name.is.null');
                
            qualityIssues.personnelMissingData = ppMissingData || 0;
            
            // Check Violations quality
            const { count: vMissingData } = await this.supabase
                .from('diva_violations')
                .select('*', { count: 'exact', head: true })
                .or('company_name.is.null,violation_type.is.null');
                
            qualityIssues.violationsMissingData = vMissingData || 0;
            
            // Overall missing company names check
            const companyNameChecks = await Promise.all([
                this.supabase.from('diva_financial_statements').select('*', { count: 'exact', head: true }).is('company_name', null),
                this.supabase.from('diva_investment_performance').select('*', { count: 'exact', head: true }).is('company_name', null),
                this.supabase.from('diva_association_status').select('*', { count: 'exact', head: true }).is('company_name', null)
            ]);
            
            qualityIssues.missingCompanyNames = (companyNameChecks[0].count || 0) + 
                                              (companyNameChecks[1].count || 0) + 
                                              (companyNameChecks[2].count || 0);
            
            const totalIssues = Object.values(qualityIssues).reduce((sum, count) => sum + count, 0);
            this.metrics.dataQualityIssues = totalIssues;
            this.metrics.qualityScore = this.metrics.totalRecords > 0 ? 
                Math.max(0, Math.round(((this.metrics.totalRecords - totalIssues) / this.metrics.totalRecords) * 100)) : 100;
            
            if (totalIssues > 0) {
                this.log(`⚠️ DIVA Data Quality Issues Found: ${totalIssues} total`, 'warning');
                this.log(`💼 Investment Performance - Missing data: ${qualityIssues.investmentMissingData}`);
                this.log(`🏢 Association Status - Missing data: ${qualityIssues.associationMissingData}`);
                this.log(`👥 Professional Personnel - Missing data: ${qualityIssues.personnelMissingData}`);
                this.log(`⚠️ Violations - Missing data: ${qualityIssues.violationsMissingData}`);
                this.log(`🏷️ Missing Company Names: ${qualityIssues.missingCompanyNames}`);
            } else {
                this.log(`✅ DIVA data quality is excellent - no issues found!`, 'success');
            }
            
            return qualityIssues;
            
        } catch (error) {
            this.log(`DIVA data quality check failed: ${error.message}`, 'error');
            this.metrics.errorsFound++;
            return null;
        }
    }
}

// ==========================================
// APIFY ACTOR MAIN EXECUTION
// ==========================================

Actor.main(async () => {
    console.log('🇰🇷 DIVA Maintenance Actor v3.0 Started (Apify Standalone)');
    console.log('🕐 Execution time:', new Date().toISOString());
    
    // Get input configuration
    const input = await Actor.getInput();
    console.log('⚙️ Input configuration:', JSON.stringify(input, null, 2));
    
    try {
        // Initialize and run DIVA maintenance system
        const divaMaintenanceSystem = new DIVAMaintenanceSystem(input);
        
        // Check for action type
        if (input?.action === 'retrieveMemories') {
            console.log('🧠 ACTION: Retrieving DIVA maintenance memories...');
            const memories = await divaMaintenanceSystem.retrieveMemories(input.memoryOptions || {});
            
            if (memories) {
                console.log(`✅ Retrieved ${memories.length} DIVA memories successfully.`);
            } else {
                console.log('❌ Failed to retrieve DIVA memories.');
                process.exit(1);
            }
            
        } else {
            console.log('🚀 ACTION: Performing DIVA maintenance...');
            const success = await divaMaintenanceSystem.performMaintenance();
        
            if (success) {
                console.log('🎉 === DIVA MAINTENANCE COMPLETED SUCCESSFULLY ===');
            } else {
                console.log('❌ === DIVA MAINTENANCE FAILED ===');
                process.exit(1);
            }
        }
        
    } catch (error) {
        console.error('💥 Fatal DIVA maintenance error:', error.message);
        process.exit(1);
    }
});

// Export for testing and external usage
export { DIVAMaintenanceSystem }; 