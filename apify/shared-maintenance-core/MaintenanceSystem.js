import { Actor } from 'apify';
import { createClient } from '@supabase/supabase-js';

/**
 * 🔧 SHARED MAINTENANCE SYSTEM CORE v3.0
 * Base class for VCS and DIVA maintenance systems
 * Provides unified logic, reporting, and dashboard integration
 */
export class MaintenanceSystemCore {
    constructor(systemType, input = {}) {
        this.systemType = systemType; // 'VCS' or 'DIVA'
        this.input = input;
        this.maintenanceLog = [];
        this.metrics = {
            systemType: systemType,
            startTime: Date.now(),
            endTime: null,
            duration: 0,
            totalRecords: 0,
            duplicatesFound: 0,
            duplicatesRemoved: 0,
            dataQualityIssues: 0,
            errorsFound: 0,
            successRate: 100,
            qualityScore: 100
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
        const logEntry = { timestamp, type, message, system: this.systemType };
        this.maintenanceLog.push(logEntry);
        
        const icon = type === 'error' ? '❌' : type === 'warning' ? '⚠️' : type === 'success' ? '🎉' : '✅';
        console.log(`${icon} [${this.systemType}] ${message}`);
    }

    /**
     * 🏥 ABSTRACT: Database Health Check
     * Must be implemented by child classes
     */
    async checkDatabaseHealth() {
        throw new Error('checkDatabaseHealth must be implemented by child class');
    }

    /**
     * 🔍 ABSTRACT: Duplicate Detection
     * Must be implemented by child classes
     */
    async detectDuplicates() {
        throw new Error('detectDuplicates must be implemented by child class');
    }

    /**
     * 🧹 ABSTRACT: Cleanup Operations
     * Must be implemented by child classes
     */
    async performCleanup(duplicatesData) {
        throw new Error('performCleanup must be implemented by child class');
    }

    /**
     * 📈 ABSTRACT: Data Quality Analysis
     * Must be implemented by child classes
     */
    async analyzeDataQuality() {
        throw new Error('analyzeDataQuality must be implemented by child class');
    }

    /**
     * 📊 GENERATE COMPREHENSIVE MAINTENANCE REPORT
     */
    generateMaintenanceReport(health, duplicates, quality) {
        this.metrics.endTime = Date.now();
        this.metrics.duration = Math.round((this.metrics.endTime - this.metrics.startTime) / 1000);
        this.metrics.successRate = this.metrics.errorsFound === 0 ? 100 : Math.max(0, 100 - (this.metrics.errorsFound * 10));
        
        const report = {
            system_type: this.systemType,
            timestamp: new Date().toISOString(),
            maintenance_type: this.input.maintenanceType || 'standard',
            duration_seconds: this.metrics.duration,
            success_rate: this.metrics.successRate,
            
            // Database Health
            database_health: {
                total_records: this.metrics.totalRecords,
                ...health
            },
            
            // Duplicate Analysis
            duplicate_analysis: {
                duplicates_found: this.metrics.duplicatesFound,
                duplicates_removed: this.metrics.duplicatesRemoved,
                cleanup_success: this.metrics.duplicatesRemoved === this.metrics.duplicatesFound,
                ...duplicates
            },
            
            // Data Quality
            data_quality: {
                issues_found: this.metrics.dataQualityIssues,
                quality_score: this.metrics.qualityScore,
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
     * 💾 SAVE REPORT TO UNIFIED DASHBOARD
     */
    async saveReportToUnifiedDashboard(report) {
        this.log('=== SAVING TO UNIFIED DASHBOARD ===');

        try {
            const reportData = {
                system_type: this.systemType,
                status: report.performance.status,
                duration_seconds: report.duration_seconds,
                quality_score: report.data_quality.quality_score,
                duplicates_removed: report.duplicate_analysis.duplicates_removed,
                records_processed: report.database_health.total_records,
                report_data: report,
                created_at: new Date().toISOString()
            };

            // Save to unified maintenance reports table
            const { error } = await this.supabase
                .from('unified_maintenance_reports')
                .insert([reportData]);

            if (error) {
                throw error;
            }

            this.log(`💾 ${this.systemType} report saved to unified dashboard successfully`, 'success');

        } catch (error) {
            this.log(`Failed to save ${this.systemType} report to dashboard: ${error.message}`, 'error');
            this.metrics.errorsFound++;
        }
    }

    /**
     * 📧 PREPARE REPORT FOR CONSOLIDATED EMAIL
     */
    async prepareConsolidatedEmailData(report) {
        try {
            // Save individual report data for email consolidation
            await Actor.setValue(`${this.systemType.toLowerCase()}_maintenance_report`, {
                system: this.systemType,
                report: report,
                timestamp: new Date().toISOString(),
                summary: {
                    status: report.performance.status,
                    duration: report.duration_seconds,
                    records: report.database_health.total_records,
                    duplicates_removed: report.duplicate_analysis.duplicates_removed,
                    quality_score: report.data_quality.quality_score
                }
            });

            this.log(`📧 ${this.systemType} report prepared for consolidated email`, 'success');

        } catch (error) {
            this.log(`Failed to prepare ${this.systemType} email data: ${error.message}`, 'error');
        }
    }

    /**
     * 🧠 RETRIEVE MAINTENANCE MEMORIES
     */
    async retrieveMemories(options = {}) {
        this.log('=== RETRIEVING MAINTENANCE MEMORIES ===');
        const { limit = 10, sortBy = 'created_at', ascending = false } = options;

        try {
            const { data, error } = await this.supabase
                .from('unified_maintenance_reports')
                .select('*')
                .eq('system_type', this.systemType)
                .order(sortBy, { ascending })
                .limit(limit);

            if (error) {
                throw error;
            }

            this.log(`🧠 Retrieved ${data.length} past ${this.systemType} maintenance reports.`);
            await Actor.setValue(`${this.systemType.toLowerCase()}_retrieved_memories`, data);
            return data;

        } catch (error) {
            this.log(`Failed to retrieve ${this.systemType} memories: ${error.message}`, 'error');
            this.metrics.errorsFound++;
            return null;
        }
    }

    /**
     * 🚀 MAIN MAINTENANCE EXECUTION TEMPLATE
     */
    async performMaintenance() {
        this.log(`🚀 STARTING ${this.systemType} MAINTENANCE`, 'success');
        
        try {
            // 1. Database Health Check
            const health = await this.checkDatabaseHealth();
            if (!health) {
                this.log(`❌ ${this.systemType} health check failed - aborting maintenance`, 'error');
                return false;
            }
            
            // 2. Duplicate Detection
            const duplicates = await this.detectDuplicates();
            
            // 3. Cleanup (if enabled)
            let cleanupCount = 0;
            if (this.input.performCleanup !== false && duplicates) {
                cleanupCount = await this.performCleanup(duplicates);
            }
            
            // 4. Data Quality Analysis
            const quality = await this.analyzeDataQuality();
            
            // 5. Generate Comprehensive Report
            const report = this.generateMaintenanceReport(health, duplicates, quality);
            
            // 6. Save Report to Actor Storage
            await Actor.setValue(`${this.systemType.toLowerCase()}_maintenance_report`, report);
            await Actor.setValue(`${this.systemType.toLowerCase()}_maintenance_summary`, {
                system: this.systemType,
                timestamp: report.timestamp,
                status: report.performance.status,
                duration: report.duration_seconds,
                records_processed: report.database_health.total_records,
                duplicates_removed: report.duplicate_analysis.duplicates_removed,
                quality_score: report.data_quality.quality_score
            });
            
            // 7. Save to Unified Dashboard
            await this.saveReportToUnifiedDashboard(report);
            
            // 8. Prepare for Consolidated Email
            await this.prepareConsolidatedEmailData(report);
            
            // 9. Final Summary
            this.log(`=== ${this.systemType} MAINTENANCE SUMMARY ===`);
            this.log(`⏱️ Duration: ${report.duration_seconds} seconds`);
            this.log(`📊 Records Processed: ${report.database_health.total_records.toLocaleString()}`);
            this.log(`🧹 Duplicates Removed: ${report.duplicate_analysis.duplicates_removed}`);
            this.log(`🎯 Quality Score: ${report.data_quality.quality_score}/100`);
            this.log(`✅ Status: ${report.performance.status}`, 'success');
            
            return true;
            
        } catch (error) {
            this.log(`Critical ${this.systemType} maintenance error: ${error.message}`, 'error');
            return false;
        }
    }
} 