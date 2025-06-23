import { Actor } from 'apify';
import { createClient } from '@supabase/supabase-js';
import { MaintenanceSystemCore } from '../shared-maintenance-core/MaintenanceSystem.js';

console.log('🔧 === DIVA MAINTENANCE SYSTEM v3.0 ===');
console.log('🕐 Maintenance Time:', new Date().toISOString());

/**
 * DIVA-Specific Maintenance System extending shared core
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
            // Get current record counts for all DIVA tables
            const tableChecks = await Promise.all([
                this.supabase.from('diva_investment_performance').select('*', { count: 'exact' }),
                this.supabase.from('diva_financial_statements').select('*', { count: 'exact' }),
                this.supabase.from('diva_association_status').select('*', { count: 'exact' }),
                this.supabase.from('diva_personnel_status').select('*', { count: 'exact' }),
                this.supabase.from('diva_professional_personnel').select('*', { count: 'exact' }),
                this.supabase.from('diva_violations').select('*', { count: 'exact' }),
                this.supabase.from('diva_vc_map').select('*', { count: 'exact' })
            ]);

            const tableCounts = {
                investment_performance: tableChecks[0].count || 0,
                financial_statements: tableChecks[1].count || 0,
                association_status: tableChecks[2].count || 0,
                personnel_status: tableChecks[3].count || 0,
                professional_personnel: tableChecks[4].count || 0,
                violations: tableChecks[5].count || 0,
                vc_map: tableChecks[6].count || 0
            };

            const totalRecords = Object.values(tableCounts).reduce((sum, count) => sum + count, 0);
            this.metrics.totalRecords = totalRecords;

            this.log(`📊 DIVA Records Summary:`);
            this.log(`   • Investment Performance: ${tableCounts.investment_performance}`);
            this.log(`   • Financial Statements: ${tableCounts.financial_statements}`);
            this.log(`   • Association Status: ${tableCounts.association_status}`);
            this.log(`   • Personnel Status: ${tableCounts.personnel_status}`);
            this.log(`   • Professional Personnel: ${tableCounts.professional_personnel}`);
            this.log(`   • Violations: ${tableCounts.violations}`);
            this.log(`   • VC Map: ${tableCounts.vc_map}`);
            this.log(`📊 Total DIVA Records: ${totalRecords}`);
            
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
            
            // Check recent activity across DIVA tables
            const recentChecks = await Promise.all([
                this.supabase.from('diva_investment_performance').select('*', { count: 'exact' }).gte('created_at', oneHourAgo),
                this.supabase.from('diva_financial_statements').select('*', { count: 'exact' }).gte('created_at', oneHourAgo),
                this.supabase.from('diva_association_status').select('*', { count: 'exact' }).gte('created_at', oneHourAgo)
            ]);

            const recentActivity = {
                investment_performance: recentChecks[0].count || 0,
                financial_statements: recentChecks[1].count || 0,
                association_status: recentChecks[2].count || 0
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
                financialStatements: [],
                investmentPerformance: [],
                associationStatus: [],
                professionalPersonnel: []
            };
            
            let totalDuplicates = 0;

            // 📊 Financial Statements - Check by company_name + data_year + tab_type
            const { data: allFinancialStatements } = await this.supabase
                .from('diva_financial_statements')
                .select('id, company_name, data_year, tab_type, created_at')
                .order('company_name, data_year, tab_type, created_at');
                
            if (allFinancialStatements) {
                const fsGroups = new Map();
                
                allFinancialStatements.forEach(fs => {
                    const key = `${fs.company_name?.toLowerCase().trim()}_${fs.data_year}_${fs.tab_type}`;
                    if (!fsGroups.has(key)) {
                        fsGroups.set(key, []);
                    }
                    fsGroups.get(key).push(fs);
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

            // 💼 Investment Performance - Check by company_name + data_year
            const { data: allInvestmentPerformance } = await this.supabase
                .from('diva_investment_performance')
                .select('id, company_name, data_year, created_at')
                .order('company_name, data_year, created_at');
                
            if (allInvestmentPerformance) {
                const ipGroups = new Map();
                
                allInvestmentPerformance.forEach(ip => {
                    const key = `${ip.company_name?.toLowerCase().trim()}_${ip.data_year}`;
                    if (!ipGroups.has(key)) {
                        ipGroups.set(key, []);
                    }
                    ipGroups.get(key).push(ip);
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

            // 🏢 Association Status - Check by company_name
            const { data: allAssociationStatus } = await this.supabase
                .from('diva_association_status')
                .select('id, company_name, created_at')
                .order('company_name, created_at');
                
            if (allAssociationStatus) {
                const asGroups = new Map();
                
                allAssociationStatus.forEach(as => {
                    const key = as.company_name?.toLowerCase().trim();
                    if (!asGroups.has(key)) {
                        asGroups.set(key, []);
                    }
                    asGroups.get(key).push(as);
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

            // 👥 Professional Personnel - Check by company_name + person_name
            const { data: allProfessionalPersonnel } = await this.supabase
                .from('diva_professional_personnel')
                .select('id, company_name, person_name, created_at')
                .order('company_name, person_name, created_at');
                
            if (allProfessionalPersonnel) {
                const ppGroups = new Map();
                
                allProfessionalPersonnel.forEach(pp => {
                    const key = `${pp.company_name?.toLowerCase().trim()}_${pp.person_name?.toLowerCase().trim()}`;
                    if (!ppGroups.has(key)) {
                        ppGroups.set(key, []);
                    }
                    ppGroups.get(key).push(pp);
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
            
            this.metrics.duplicatesFound = totalDuplicates;
            
            if (totalDuplicates > 0) {
                this.log(`🔄 DIVA Duplicates Found: ${totalDuplicates} total`, 'warning');
                this.log(`   • Financial Statements: ${duplicateDetails.financialStatements.length} groups`);
                this.log(`   • Investment Performance: ${duplicateDetails.investmentPerformance.length} groups`);
                this.log(`   • Association Status: ${duplicateDetails.associationStatus.length} groups`);
                this.log(`   • Professional Personnel: ${duplicateDetails.professionalPersonnel.length} groups`);
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
        
        try {
            // Clean Financial Statements duplicates
            for (const duplicateGroup of duplicatesData.details.financialStatements) {
                if (duplicateGroup.duplicateIds.length > 0) {
                    const { error } = await this.supabase
                        .from('diva_financial_statements')
                        .delete()
                        .in('id', duplicateGroup.duplicateIds);
                        
                    if (!error) {
                        const removedCount = duplicateGroup.duplicateIds.length;
                        totalRemoved += removedCount;
                        this.log(`🗑️ Removed ${removedCount} duplicate Financial Statements for: ${duplicateGroup.key}`);
                        
                        this.changes.duplicateResolutions.push({
                            type: 'financial_statements_duplicates_removed',
                            key: duplicateGroup.key,
                            count: removedCount,
                            keptRecord: duplicateGroup.records[0].id,
                            removedIds: duplicateGroup.duplicateIds
                        });
                    } else {
                        this.log(`❌ Failed to remove Financial Statements duplicates for ${duplicateGroup.key}: ${error.message}`, 'error');
                        this.metrics.errorsFound++;
                    }
                }
            }

            // Clean Investment Performance duplicates
            for (const duplicateGroup of duplicatesData.details.investmentPerformance) {
                if (duplicateGroup.duplicateIds.length > 0) {
                    const { error } = await this.supabase
                        .from('diva_investment_performance')
                        .delete()
                        .in('id', duplicateGroup.duplicateIds);
                        
                    if (!error) {
                        const removedCount = duplicateGroup.duplicateIds.length;
                        totalRemoved += removedCount;
                        this.log(`🗑️ Removed ${removedCount} duplicate Investment Performance for: ${duplicateGroup.key}`);
                        
                        this.changes.duplicateResolutions.push({
                            type: 'investment_performance_duplicates_removed',
                            key: duplicateGroup.key,
                            count: removedCount,
                            keptRecord: duplicateGroup.records[0].id,
                            removedIds: duplicateGroup.duplicateIds
                        });
                    } else {
                        this.log(`❌ Failed to remove Investment Performance duplicates for ${duplicateGroup.key}: ${error.message}`, 'error');
                        this.metrics.errorsFound++;
                    }
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
                        const removedCount = duplicateGroup.duplicateIds.length;
                        totalRemoved += removedCount;
                        this.log(`🗑️ Removed ${removedCount} duplicate Association Status for: ${duplicateGroup.key}`);
                        
                        this.changes.duplicateResolutions.push({
                            type: 'association_status_duplicates_removed',
                            key: duplicateGroup.key,
                            count: removedCount,
                            keptRecord: duplicateGroup.records[0].id,
                            removedIds: duplicateGroup.duplicateIds
                        });
                    } else {
                        this.log(`❌ Failed to remove Association Status duplicates for ${duplicateGroup.key}: ${error.message}`, 'error');
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
                        const removedCount = duplicateGroup.duplicateIds.length;
                        totalRemoved += removedCount;
                        this.log(`🗑️ Removed ${removedCount} duplicate Professional Personnel for: ${duplicateGroup.key}`);
                        
                        this.changes.duplicateResolutions.push({
                            type: 'professional_personnel_duplicates_removed',
                            key: duplicateGroup.key,
                            count: removedCount,
                            keptRecord: duplicateGroup.records[0].id,
                            removedIds: duplicateGroup.duplicateIds
                        });
                    } else {
                        this.log(`❌ Failed to remove Professional Personnel duplicates for ${duplicateGroup.key}: ${error.message}`, 'error');
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
                financialStatementsNoCompany: 0,
                investmentPerformanceNoCompany: 0,
                associationStatusNoCompany: 0,
                professionalPersonnelNoName: 0,
                missingDataYears: 0,
                invalidNumericValues: 0
            };
            
            // Check for missing company names in financial statements
            const { count: fsNoCompany } = await this.supabase
                .from('diva_financial_statements')
                .select('*', { count: 'exact' })
                .or('company_name.is.null,company_name.eq.""');
                
            qualityIssues.financialStatementsNoCompany = fsNoCompany || 0;

            // Check for missing company names in investment performance
            const { count: ipNoCompany } = await this.supabase
                .from('diva_investment_performance')
                .select('*', { count: 'exact' })
                .or('company_name.is.null,company_name.eq.""');
                
            qualityIssues.investmentPerformanceNoCompany = ipNoCompany || 0;

            // Check for missing company names in association status
            const { count: asNoCompany } = await this.supabase
                .from('diva_association_status')
                .select('*', { count: 'exact' })
                .or('company_name.is.null,company_name.eq.""');
                
            qualityIssues.associationStatusNoCompany = asNoCompany || 0;

            // Check for missing person names in professional personnel
            const { count: ppNoName } = await this.supabase
                .from('diva_professional_personnel')
                .select('*', { count: 'exact' })
                .or('person_name.is.null,person_name.eq.""');
                
            qualityIssues.professionalPersonnelNoName = ppNoName || 0;

            // Check for missing data years
            const { count: missingDataYears } = await this.supabase
                .from('diva_financial_statements')
                .select('*', { count: 'exact' })
                .or('data_year.is.null,data_year.eq.""');
                
            qualityIssues.missingDataYears = missingDataYears || 0;
            
            const totalIssues = Object.values(qualityIssues).reduce((sum, count) => sum + count, 0);
            this.metrics.dataQualityIssues = totalIssues;
            this.metrics.qualityScore = this.metrics.totalRecords > 0 ? 
                Math.max(0, Math.round(((this.metrics.totalRecords - totalIssues) / this.metrics.totalRecords) * 100)) : 100;
            
            if (totalIssues > 0) {
                this.log(`⚠️ DIVA Data Quality Issues Found: ${totalIssues} total`, 'warning');
                this.log(`   • Financial Statements missing company: ${qualityIssues.financialStatementsNoCompany}`);
                this.log(`   • Investment Performance missing company: ${qualityIssues.investmentPerformanceNoCompany}`);
                this.log(`   • Association Status missing company: ${qualityIssues.associationStatusNoCompany}`);
                this.log(`   • Professional Personnel missing name: ${qualityIssues.professionalPersonnelNoName}`);
                this.log(`   • Missing data years: ${qualityIssues.missingDataYears}`);
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
    console.log('🇰🇷 DIVA Maintenance Actor v3.0 Started');
    console.log('🕐 Execution time:', new Date().toISOString());
    
    // Get input configuration
    const input = await Actor.getInput();
    console.log('⚙️ Input configuration:', JSON.stringify(input, null, 2));
    
    try {
        // Initialize and run DIVA maintenance system
        const divaMaintenanceSystem = new DIVAMaintenanceSystem(input);
        
        // Check for action type
        if (input.action === 'retrieveMemories') {
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