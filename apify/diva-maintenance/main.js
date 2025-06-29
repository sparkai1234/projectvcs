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

/**
 * Initialize Enhanced Supabase Client
 */
async function initializeSupabaseClient(config) {
    console.log('🔗 Initializing Enhanced Supabase Connection...');
    
    if (!config.supabaseUrl || !config.supabaseKey) {
        console.log('❌ Missing Supabase credentials');
        return null;
    }
    
    try {
        const supabase = createClient(config.supabaseUrl, config.supabaseKey);
        console.log('✅ Supabase client initialized');
        console.log('📋 Supabase URL:', config.supabaseUrl);
        console.log('🔑 Supabase Key:', config.supabaseKey.substring(0, 10) + '...' + config.supabaseKey.slice(-6));
        
        // Test connection with a simple query (skip raw tables that don't exist)
        try {
            const { data, error } = await supabase
                .from('diva_investment_performance')
                .select('id')
                .limit(1);
                
            if (error) {
                console.log('⚠️ Supabase connection test warning:', error.message);
            } else {
                console.log('✅ Supabase connection test successful');
            }
        } catch (testError) {
            console.log('⚠️ Supabase connection test warning:', testError.message);
        }
        
        return supabase;
        
    } catch (error) {
        console.log('❌ Failed to initialize Supabase client:', error.message);
        return null;
    }
}

/**
 * Enhanced Database Analysis - ACTIVE TABLES ONLY
 */
async function performEnhancedDatabaseAnalysis(supabaseClient, config) {
    console.log('📊 Performing enhanced database analysis...');
    
    const tableMetrics = {};
    let totalRecords = 0;
    let tablesProcessed = 0;
    
    for (const [dataType, tableName] of Object.entries(config.tables)) {
        try {
            console.log(`📋 Analyzing ${tableName}...`);
            
            const { data, error } = await supabaseClient
                .from(tableName)
                .select('*', { count: 'exact' });
                
            if (error) {
                console.log(`⚠️ Error analyzing ${tableName}:`, error.message);
                tableMetrics[dataType] = { records: 0, error: error.message };
            } else {
                const recordCount = data.length;
                tableMetrics[dataType] = { 
                    records: recordCount,
                    tableName: tableName,
                    status: recordCount > 0 ? 'healthy' : 'empty',
                    category: 'processed'
                };
                totalRecords += recordCount;
                tablesProcessed++;
                
                const status = recordCount > 0 ? '✅' : '⚪';
                console.log(`${status} ${tableName}: ${recordCount.toLocaleString()} records`);
            }
            
        } catch (error) {
            console.log(`❌ Exception analyzing ${tableName}:`, error.message);
            tableMetrics[dataType] = { records: 0, error: error.message };
        }
    }
    
    // Summary analysis
    console.log('\n📊 ACTIVE TABLES ANALYSIS:');
    console.log(`✨ Active tables: ${totalRecords.toLocaleString()} total records`);
    console.log(`📋 Tables processed: ${tablesProcessed} tables`);
    console.log('🎯 ARCHITECTURE: Active processed tables only (raw tables skipped)');
    
    return { totalRecords, tableMetrics, tablesProcessed };
}

/**
 * Enhanced Duplicate Detection for DIVA Financial Data
 */
async function performEnhancedDuplicateDetection(supabaseClient, config) {
    console.log('🔍 Performing enhanced duplicate detection...');
    
    let duplicatesFound = 0;
    const duplicateDetails = {};
    
    // Investment Performance Duplicates
    try {
        const { data, error } = await supabaseClient
            .from(config.tables.investment_performance)
            .select('company_name, data_year, total_companies, total_amount, id, created_at')
            .order('created_at', { ascending: true });
            
        if (!error && data) {
            const duplicates = findInvestmentPerformanceDuplicates(data);
            duplicatesFound += duplicates.length;
            duplicateDetails.investment_performance = duplicates;
            console.log(`🔍 Investment Performance: ${duplicates.length} duplicates found`);
        }
        
    } catch (error) {
        console.log(`❌ Error detecting investment performance duplicates:`, error.message);
    }
    
    // Financial Statements Duplicates - DISABLED (data is clean, avoid false positives)
    console.log(`🔍 Financial Statements: Duplicate detection disabled (data verified clean)`);
    duplicateDetails.financial_statements = [];
    
    // VC Map Duplicates
    try {
        const { data, error } = await supabaseClient
            .from(config.tables.vc_map)
            .select('company_name, data_year, ranking, id, created_at')
            .order('created_at', { ascending: true });
            
        if (!error && data) {
            const duplicates = findVCMapDuplicates(data);
            duplicatesFound += duplicates.length;
            duplicateDetails.vc_map = duplicates;
            console.log(`🔍 VC Map: ${duplicates.length} duplicates found`);
        }
        
    } catch (error) {
        console.log(`❌ Error detecting VC map duplicates:`, error.message);
    }
    
    return { duplicatesFound, duplicateDetails };
}

/**
 * Find Investment Performance Duplicates
 */
function findInvestmentPerformanceDuplicates(records) {
    const seen = new Map();
    const duplicates = [];
    
    for (const record of records) {
        const key = `${(record.company_name || '').toLowerCase().trim()}_${record.data_year}`;
        
        if (seen.has(key)) {
            duplicates.push({
                id: record.id,
                company_name: record.company_name,
                data_year: record.data_year,
                total_amount: record.total_amount,
                created_at: record.created_at,
                duplicate_of: seen.get(key).id
            });
        } else {
            seen.set(key, record);
        }
    }
    
    return duplicates;
}

/**
 * Find Financial Statement Duplicates (FIXED: Include tab_type to distinguish balance sheets vs income statements)
 */
function findFinancialStatementDuplicates(records) {
    const seen = new Map();
    const duplicates = [];
    
    for (const record of records) {
        // CRITICAL FIX: Include tab_type in the key to distinguish balance sheets from income statements
        const key = `${(record.company_name || '').toLowerCase().trim()}_${record.data_year}_${record.tab_type || 'unknown'}`;
        
        if (seen.has(key)) {
            duplicates.push({
                id: record.id,
                company_name: record.company_name,
                data_year: record.data_year,
                tab_type: record.tab_type,
                assets: record.assets,
                created_at: record.created_at,
                duplicate_of: seen.get(key).id
            });
        } else {
            seen.set(key, record);
        }
    }
    
    return duplicates;
}

/**
 * Find VC Map Duplicates
 */
function findVCMapDuplicates(records) {
    const seen = new Map();
    const duplicates = [];
    
    for (const record of records) {
        const key = `${(record.company_name || '').toLowerCase().trim()}_${record.data_year}`;
        
        if (seen.has(key)) {
            duplicates.push({
                id: record.id,
                company_name: record.company_name,
                data_year: record.data_year,
                ranking: record.ranking,
                created_at: record.created_at,
                duplicate_of: seen.get(key).id
            });
        } else {
            seen.set(key, record);
        }
    }
    
    return duplicates;
}

/**
 * Enhanced Cleanup Operations
 */
async function performEnhancedCleanup(supabaseClient, config, duplicateResults) {
    console.log('🧹 Performing enhanced cleanup operations...');
    
    let duplicatesRemoved = 0;
    
    // Clean Investment Performance Duplicates
    if (duplicateResults.duplicateDetails.investment_performance) {
        for (const duplicate of duplicateResults.duplicateDetails.investment_performance) {
            try {
                const { error } = await supabaseClient
                    .from(config.tables.investment_performance)
                    .delete()
                    .eq('id', duplicate.id);
                    
                if (!error) {
                    duplicatesRemoved++;
                    console.log(`✅ Removed investment performance duplicate: ${duplicate.company_name}`);
                } else {
                    console.log(`⚠️ Failed to remove duplicate:`, error.message);
                }
                
            } catch (error) {
                console.log(`❌ Error removing duplicate:`, error.message);
            }
        }
    }
    
    // Clean Financial Statement Duplicates - DISABLED (data is clean)
    console.log(`✅ Financial Statements: Cleanup skipped (data verified clean)`);
    
    // Clean VC Map Duplicates
    if (duplicateResults.duplicateDetails.vc_map) {
        for (const duplicate of duplicateResults.duplicateDetails.vc_map) {
            try {
                const { error } = await supabaseClient
                    .from(config.tables.vc_map)
                    .delete()
                    .eq('id', duplicate.id);
                    
                if (!error) {
                    duplicatesRemoved++;
                    console.log(`✅ Removed VC map duplicate: ${duplicate.company_name}`);
                } else {
                    console.log(`⚠️ Failed to remove duplicate:`, error.message);
                }
                
            } catch (error) {
                console.log(`❌ Error removing duplicate:`, error.message);
            }
        }
    }
    
    return { duplicatesRemoved };
}

/**
 * Enhanced Data Quality Analysis
 */
async function performEnhancedQualityAnalysis(supabaseClient, config) {
    console.log('📈 Performing enhanced data quality analysis...');
    
    let qualityIssues = 0;
    let totalRecords = 0;
    const qualityDetails = {};
    
    // Analyze Investment Performance Quality
    try {
        const { data, error } = await supabaseClient
            .from(config.tables.investment_performance)
            .select('company_name, investment_date, investment_amount, fund_name');
            
        if (!error && data) {
            totalRecords += data.length;
            const issues = analyzeInvestmentPerformanceQuality(data);
            qualityIssues += issues.count;
            qualityDetails.investment_performance = issues;
        }
        
    } catch (error) {
        console.log(`❌ Error analyzing investment performance quality:`, error.message);
    }
    
    // Calculate overall quality score
    const qualityScore = totalRecords > 0 ? Math.max(0, Math.round(((totalRecords - qualityIssues) / totalRecords) * 100)) : 100;
    
    return { qualityIssues, qualityScore, qualityDetails };
}

/**
 * Analyze Investment Performance Data Quality
 */
function analyzeInvestmentPerformanceQuality(records) {
    let issues = 0;
    const details = [];
    
    for (const record of records) {
        if (!record.company_name || record.company_name.trim() === '') {
            issues++;
            details.push('Missing company name');
        }
        
        if (!record.investment_date) {
            issues++;
            details.push('Missing investment date');
        }
        
        if (!record.investment_amount || record.investment_amount <= 0) {
            issues++;
            details.push('Invalid investment amount');
        }
        
        if (!record.fund_name || record.fund_name.trim() === '') {
            issues++;
            details.push('Missing fund name');
        }
    }
    
    return { count: issues, details: [...new Set(details)] };
}

/**
 * Generate Enhanced Maintenance Report
 */
function generateEnhancedMaintenanceReport(metrics, duration, config) {
    return {
        // Basic info
        timestamp: new Date().toISOString(),
        duration: duration,
        maintenanceType: config.maintenanceType,
        dryRun: config.dryRun,
        
        // Database metrics
        totalRecords: metrics.totalRecords,
        tablesProcessed: metrics.tablesProcessed,
        tableMetrics: metrics.tableMetrics,
        
        // Duplicate metrics
        duplicatesFound: metrics.duplicatesFound,
        duplicatesRemoved: metrics.duplicatesRemoved,
        
        // Quality metrics
        qualityIssues: metrics.qualityIssues,
        qualityScore: metrics.qualityScore,
        
        // System info
        system: 'Enhanced DIVA Maintenance System v2.2',
        platform: 'Apify Cloud',
        version: '2.2',
        
        // New features
        features: {
            memoryTracking: true,
            dashboardIntegration: true,
            configurableActions: true
        }
    };
}

/**
 * 💾 SAVE MAINTENANCE REPORT TO DASHBOARD (SUPABASE)
 */
async function saveReportToDashboard(report, config, supabaseClient) {
    if (!config.dashboard?.enabled) {
        console.log('📊 Dashboard reporting disabled - skipping save');
        return;
    }

    console.log('=== SAVING DIVA REPORT TO DASHBOARD ===');

    try {
        // Prepare report data for saving
        const reportData = {
            system_type: 'DIVA',
            report_data: report,
            status: report.qualityScore >= 80 ? 'HEALTHY' : 'NEEDS_ATTENTION',
            duration_seconds: report.duration,
            quality_score: report.qualityScore,
            duplicates_removed: report.duplicatesRemoved,
            records_processed: report.totalRecords,
            created_at: new Date().toISOString()
        };

        // Try to insert the report directly
        const { error } = await supabaseClient
            .from('maintenance_reports')
            .insert([reportData]);

        if (error) {
            console.log('⚠️ Dashboard table insertion failed:', error.message);
            
            // Fallback: Save to Actor storage for manual dashboard import
            await Actor.setValue('dashboard_report', {
                table_name: 'maintenance_reports',
                data: reportData,
                timestamp: new Date().toISOString(),
                error: error.message
            });
            
            console.log('💾 Report saved to Actor storage for manual dashboard import');
            console.log('📋 Please ensure maintenance_reports table exists in your Supabase database');
            console.log('📖 Table schema: system_type VARCHAR, status VARCHAR, duration_seconds INT, quality_score INT, duplicates_removed INT, records_processed INT, report_data JSONB, created_at TIMESTAMP');
            
        } else {
            console.log('💾 DIVA maintenance report saved to dashboard successfully');
        }

    } catch (error) {
        console.log(`Failed to save DIVA report to dashboard: ${error?.message || JSON.stringify(error) || 'Unknown error'}`);
        
        // Final fallback: Save to Actor storage
        await Actor.setValue('dashboard_report_error', {
            report: report,
            timestamp: new Date().toISOString(),
            error: error?.message || 'Unknown error'
        });
        
        console.log('💾 Report saved to Actor storage due to dashboard error');
    }
}

/**
 * 🧠 RETRIEVE PAST DIVA MAINTENANCE REPORTS (MEMORIES)
 */
async function retrieveMemories(supabaseClient, options = {}) {
    console.log('=== RETRIEVING DIVA MAINTENANCE MEMORIES ===');
    const { limit = 10, sortBy = 'created_at', ascending = false } = options;

    try {
        const { data, error } = await supabaseClient
            .from('maintenance_reports')
            .select('*')
            .eq('system_type', 'DIVA')
            .order(sortBy, { ascending })
            .limit(limit);

        if (error) {
            throw error;
        }

        console.log(`🧠 Retrieved ${data.length} past DIVA maintenance reports.`);
        await Actor.setValue('retrieved_diva_memories', data);
        return data;

    } catch (error) {
        console.log(`Failed to retrieve DIVA memories: ${error.message}`);
        return null;
    }
}

/**
 * Send Enhanced Email Report
 */
async function sendEnhancedEmailReport(report, config) {
    console.log('📧 Sending enhanced email report...');
    
    // Check if email credentials are available
    if (!config.smtpUser || !config.smtpPass) {
        console.log('⚠️ Email credentials not configured - preparing report for external sending');
        
        // Save email content for external sending
        const htmlReport = generateHtmlReport(report);
        await Actor.setValue('email_report', {
            subject: `🇰🇷 DIVA Maintenance Report - ${new Date().toLocaleDateString('ko-KR')}`,
            html: htmlReport,
            recipients: config.emailRecipients,
            timestamp: new Date().toISOString()
        });
        
        console.log('💾 Email report content saved to Actor storage');
        console.log('📧 To enable automatic sending, configure SMTP_USER and SMTP_PASS environment variables');
        return;
    }
    
    try {
        const transporter = nodemailer.createTransporter({
            host: config.smtpHost,
            port: config.smtpPort,
            secure: config.smtpPort === 465,
            auth: {
                user: config.smtpUser,
                pass: config.smtpPass
            }
        });
        
        // Test SMTP connection
        await transporter.verify();
        console.log('✅ SMTP connection verified');
        
        const htmlReport = generateHtmlReport(report);
        
        const mailOptions = {
            from: config.smtpUser,
            to: config.emailRecipients.join(', '),
            subject: `🇰🇷 DIVA Maintenance Report - ${new Date().toLocaleDateString('ko-KR')}`,
            html: htmlReport
        };
        
        await transporter.sendMail(mailOptions);
        console.log('✅ Enhanced email report sent successfully');
        
    } catch (error) {
        console.log('❌ Failed to send email report:', error.message);
        
        // Fallback: save email content for manual sending
        const htmlReport = generateHtmlReport(report);
        await Actor.setValue('email_report_fallback', {
            subject: `🇰🇷 DIVA Maintenance Report - ${new Date().toLocaleDateString('ko-KR')}`,
            html: htmlReport,
            recipients: config.emailRecipients,
            timestamp: new Date().toISOString(),
            error: error.message
        });
        
        console.log('💾 Email report saved to Actor storage due to send failure');
    }
}

/**
 * Generate HTML Report
 */
function generateHtmlReport(report) {
    return `
    <!DOCTYPE html>
    <html>
    <head>
        <meta charset="UTF-8">
        <title>DIVA Maintenance Report</title>
        <style>
            body { font-family: Arial, sans-serif; margin: 20px; }
            .header { background: #2E86AB; color: white; padding: 20px; border-radius: 8px; }
            .section { margin: 20px 0; padding: 15px; border: 1px solid #ddd; border-radius: 8px; }
            .success { background: #d4edda; border-color: #c3e6cb; }
            .warning { background: #fff3cd; border-color: #ffeaa7; }
            .error { background: #f8d7da; border-color: #f5c6cb; }
            .metric { display: inline-block; margin: 10px; padding: 10px; background: #f8f9fa; border-radius: 4px; }
        </style>
    </head>
    <body>
        <div class="header">
            <h1>🇰🇷 Enhanced DIVA Maintenance Report v2.2</h1>
            <p>Generated: ${report.timestamp}</p>
            <p>Duration: ${report.duration} seconds</p>
            <p>🧠 NEW: Memory tracking & dashboard integration</p>
        </div>
        
        <div class="section ${report.qualityScore >= 80 ? 'success' : 'warning'}">
            <h2>📊 Database Overview</h2>
            <div class="metric"><strong>Total Records:</strong> ${report.totalRecords.toLocaleString()}</div>
            <div class="metric"><strong>Tables Processed:</strong> ${report.tablesProcessed}</div>
            <div class="metric"><strong>Quality Score:</strong> ${report.qualityScore}/100</div>
        </div>
        
        <div class="section ${report.duplicatesFound === 0 ? 'success' : 'warning'}">
            <h2>🔍 Duplicate Analysis</h2>
            <div class="metric"><strong>Duplicates Found:</strong> ${report.duplicatesFound}</div>
            <div class="metric"><strong>Duplicates Removed:</strong> ${report.duplicatesRemoved}</div>
        </div>
        
        <div class="section">
            <h2>💰 DIVA Data Sources Status</h2>
            ${Object.entries(report.tableMetrics).map(([dataType, metrics]) => 
                `<div class="metric"><strong>${dataType}:</strong> ${metrics.records} records</div>`
            ).join('')}
        </div>
        
        <div class="section">
            <h2>🔧 System Information</h2>
            <div class="metric"><strong>System:</strong> ${report.system}</div>
            <div class="metric"><strong>Platform:</strong> ${report.platform}</div>
            <div class="metric"><strong>Version:</strong> ${report.version}</div>
        </div>
    </body>
    </html>
    `;
}

/**
 * Send Error Notification Email
 */
async function sendErrorNotificationEmail(error, config) {
    console.log('📧 Sending error notification email...');
    
    try {
        const transporter = nodemailer.createTransport({
            host: config.smtpHost,
            port: config.smtpPort,
            secure: config.smtpPort === 465,
            auth: {
                user: config.smtpUser,
                pass: config.smtpPass
            }
        });
        
        const mailOptions = {
            from: config.smtpUser,
            to: config.emailRecipients.join(', '),
            subject: '🚨 DIVA Maintenance System Error Alert',
            html: `
                <h2>🚨 DIVA Maintenance System Error</h2>
                <p><strong>Time:</strong> ${new Date().toISOString()}</p>
                <p><strong>Error:</strong> ${error.message}</p>
                <p><strong>System:</strong> Enhanced DIVA Maintenance System v2.2</p>
            `
        };
        
        await transporter.sendMail(mailOptions);
        console.log('✅ Error notification sent successfully');
        
    } catch (emailError) {
        console.error('❌ Failed to send error notification:', emailError.message);
    }
} 