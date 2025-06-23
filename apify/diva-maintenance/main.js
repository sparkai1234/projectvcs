const { Actor } = require('apify');
const { createClient } = require('@supabase/supabase-js');
const nodemailer = require('nodemailer');

console.log('🔧 === ENHANCED DIVA MAINTENANCE SYSTEM v2.1 ===');
console.log('🕐 Enhanced Time:', new Date().toISOString());

/**
 * 🇰🇷 Enhanced DIVA Maintenance System v2.1
 * Based on successful VCS maintenance architecture
 * 
 * FEATURES:
 * - Advanced duplicate detection for DIVA financial data
 * - Smart cleanup operations with conflict resolution
 * - Comprehensive financial data quality analysis
 * - Enhanced email reporting with HTML formatting
 * - Memory/history tracking system for past maintenance reports
 * - Dashboard integration with unified maintenance_reports table
 * - Configurable actions (maintenance vs memory retrieval)
 * - Real-time metrics and performance tracking
 */

Actor.main(async () => {
    console.log('🚀 Starting Enhanced DIVA Maintenance System v2.1...');
    console.log('💰 Target: Korean DIVA Financial Intelligence Database');
    console.log('🧠 NEW: Memory tracking & dashboard integration enabled');
    
    const input = await Actor.getInput();
    
    // Enhanced Configuration (based on VCS success)
    const config = {
        maintenanceType: input?.maintenanceType || 'standard',
        performCleanup: input?.performCleanup !== false,
        sendEmailReport: input?.sendEmailReport !== false,
        dryRun: input?.dryRun || false,
        
        // Email configuration
        emailRecipients: input?.emailRecipients ? input.emailRecipients.split(',').map(email => email.trim()) : ['sparkai@sparklabs.co.kr'],
        smtpHost: input?.smtpHost || 'smtp.gmail.com',
        smtpPort: input?.smtpPort || 587,
        smtpUser: input?.smtpUser || process.env.SMTP_USER,
        smtpPass: input?.smtpPass || process.env.SMTP_PASS,
        
        // Dashboard configuration - NEW FEATURE!
        dashboard: {
            enabled: input?.dashboard?.enabled !== false
        },
        
        // Supabase configuration
        supabaseUrl: input?.supabaseUrl || process.env.SUPABASE_URL,
        supabaseKey: input?.supabaseKey || process.env.SUPABASE_SERVICE_ROLE_KEY || process.env.SUPABASE_KEY,
        
        // DIVA-specific table configuration
        tables: {
            investment_performance: 'diva_investment_performance_raw',
            financial_statements: 'diva_financial_statements_raw',
            association_status: 'diva_association_status_raw',
            personnel_status: 'diva_personnel_status_raw',
            professional_personnel: 'diva_professional_personnel_raw',
            violations: 'diva_violations_raw',
            vc_map: 'diva_vc_map_raw',
            statistics: 'diva_statistics_raw'
        }
    };
    
    console.log('📋 Enhanced DIVA Maintenance Configuration:', {
        maintenanceType: config.maintenanceType,
        performCleanup: config.performCleanup,
        sendEmailReport: config.sendEmailReport,
        dryRun: config.dryRun,
        emailRecipients: config.emailRecipients
    });
    
    // Initialize Enhanced Supabase Client
    const supabaseClient = await initializeSupabaseClient(config);
    if (!supabaseClient) {
        console.log('❌ Cannot proceed without Supabase connection');
        process.exit(1);
    }
    
    // Initialize metrics tracking
    const metrics = {
        startTime: Date.now(),
        tablesProcessed: 0,
        totalRecords: 0,
        duplicatesFound: 0,
        duplicatesRemoved: 0,
        qualityIssues: 0,
        qualityScore: 0,
        tableMetrics: {}
    };
    
    try {
        // Check for action type - NEW FEATURE!
        if (input.action === 'retrieveMemories') {
            console.log('🧠 ACTION: Retrieving DIVA maintenance memories...');
            const memories = await retrieveMemories(supabaseClient, input.memoryOptions || {});
            
            if (memories) {
                console.log(`✅ Retrieved ${memories.length} DIVA memories successfully.`);
                console.log('🎉 === DIVA MEMORY RETRIEVAL COMPLETED ===');
            } else {
                console.log('❌ Failed to retrieve DIVA memories.');
                process.exit(1);
            }
            return;
        }
        
        console.log('🔍 === STARTING ENHANCED DIVA MAINTENANCE ===');
        
        // Phase 1: Database Analysis
        console.log('📊 Phase 1: Enhanced Database Analysis...');
        const analysisResults = await performEnhancedDatabaseAnalysis(supabaseClient, config);
        metrics.totalRecords = analysisResults.totalRecords;
        metrics.tableMetrics = analysisResults.tableMetrics;
        
        // Phase 2: Duplicate Detection & Resolution
        console.log('🔍 Phase 2: Enhanced Duplicate Detection...');
        const duplicateResults = await performEnhancedDuplicateDetection(supabaseClient, config);
        metrics.duplicatesFound = duplicateResults.duplicatesFound;
        
        if (config.performCleanup && !config.dryRun) {
            console.log('🧹 Phase 3: Enhanced Cleanup Operations...');
            const cleanupResults = await performEnhancedCleanup(supabaseClient, config, duplicateResults);
            metrics.duplicatesRemoved = cleanupResults.duplicatesRemoved;
        } else {
            console.log('🔬 Phase 3: Dry Run - No Cleanup Performed');
        }
        
        // Phase 4: Data Quality Analysis
        console.log('📈 Phase 4: Enhanced Data Quality Analysis...');
        const qualityResults = await performEnhancedQualityAnalysis(supabaseClient, config);
        metrics.qualityIssues = qualityResults.qualityIssues;
        metrics.qualityScore = qualityResults.qualityScore;
        
        // Phase 5: Generate Enhanced Report
        const endTime = Date.now();
        const duration = Math.round((endTime - metrics.startTime) / 1000);
        
        const maintenanceReport = generateEnhancedMaintenanceReport(metrics, duration, config);
        
        // Phase 6: Send Email Report
        if (config.sendEmailReport) {
            console.log('📧 Phase 6: Sending Enhanced Email Report...');
            await sendEnhancedEmailReport(maintenanceReport, config);
        }
        
        // Phase 7: Save Report to Dashboard - NEW FEATURE!
        console.log('💾 Phase 7: Saving Report to Dashboard...');
        await saveReportToDashboard(maintenanceReport, config, supabaseClient);
        
        // Export final results
        await Actor.setValue('maintenance_report', maintenanceReport);
        
        console.log('🎉 === ENHANCED DIVA MAINTENANCE COMPLETED ===');
        console.log(`📊 Processed ${metrics.totalRecords} total records`);
        console.log(`🔍 Found ${metrics.duplicatesFound} duplicates`);
        console.log(`🧹 Removed ${metrics.duplicatesRemoved} duplicates`);
        console.log(`📈 Quality score: ${metrics.qualityScore}/100`);
        console.log(`⏱️ Duration: ${duration} seconds`);
        
    } catch (error) {
        console.error('❌ Enhanced DIVA Maintenance System error:', error.message);
        
        // Send error notification email
        if (config.sendEmailReport) {
            await sendErrorNotificationEmail(error, config);
        }
        
        throw error;
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
        console.log(`📋 Supabase URL: ${config.supabaseUrl}`);
        console.log(`🔑 Supabase Key: ...${config.supabaseKey.slice(-8)}`);
        
        // Test connection with DIVA table
        const { data, error } = await supabase
            .from('diva_investment_performance_raw')
            .select('count')
            .limit(1);
            
        if (error) {
            console.log('⚠️ Supabase connection test warning:', error.message);
        } else {
            console.log('✅ Supabase connection test passed');
        }
        
        return supabase;
        
    } catch (error) {
        console.error('❌ Failed to initialize Supabase:', error.message);
        return null;
    }
}

/**
 * Enhanced Database Analysis
 */
async function performEnhancedDatabaseAnalysis(supabaseClient, config) {
    console.log('📊 Performing enhanced database analysis...');
    
    const tableMetrics = {};
    let totalRecords = 0;
    
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
                    status: 'healthy'
                };
                totalRecords += recordCount;
                console.log(`✅ ${tableName}: ${recordCount} records`);
            }
            
        } catch (error) {
            console.log(`❌ Exception analyzing ${tableName}:`, error.message);
            tableMetrics[dataType] = { records: 0, error: error.message };
        }
    }
    
    return { totalRecords, tableMetrics };
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
            .select('company_name, investment_date, investment_amount, id, created_at')
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
    
    // Financial Statements Duplicates
    try {
        const { data, error } = await supabaseClient
            .from(config.tables.financial_statements)
            .select('company_name, reporting_year, id, created_at')
            .order('created_at', { ascending: true });
            
        if (!error && data) {
            const duplicates = findFinancialStatementDuplicates(data);
            duplicatesFound += duplicates.length;
            duplicateDetails.financial_statements = duplicates;
            console.log(`🔍 Financial Statements: ${duplicates.length} duplicates found`);
        }
        
    } catch (error) {
        console.log(`❌ Error detecting financial statement duplicates:`, error.message);
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
        const key = `${(record.company_name || '').toLowerCase().trim()}_${record.investment_date}_${record.investment_amount}`;
        
        if (seen.has(key)) {
            duplicates.push({
                id: record.id,
                company_name: record.company_name,
                investment_date: record.investment_date,
                investment_amount: record.investment_amount,
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
 * Find Financial Statement Duplicates
 */
function findFinancialStatementDuplicates(records) {
    const seen = new Map();
    const duplicates = [];
    
    for (const record of records) {
        const key = `${(record.company_name || '').toLowerCase().trim()}_${record.reporting_year}`;
        
        if (seen.has(key)) {
            duplicates.push({
                id: record.id,
                company_name: record.company_name,
                reporting_year: record.reporting_year,
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
    
    // Clean Financial Statement Duplicates
    if (duplicateResults.duplicateDetails.financial_statements) {
        for (const duplicate of duplicateResults.duplicateDetails.financial_statements) {
            try {
                const { error } = await supabaseClient
                    .from(config.tables.financial_statements)
                    .delete()
                    .eq('id', duplicate.id);
                    
                if (!error) {
                    duplicatesRemoved++;
                    console.log(`✅ Removed financial statement duplicate: ${duplicate.company_name}`);
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
        tablesProcessed: Object.keys(config.tables).length,
        tableMetrics: metrics.tableMetrics,
        
        // Duplicate metrics
        duplicatesFound: metrics.duplicatesFound,
        duplicatesRemoved: metrics.duplicatesRemoved,
        
        // Quality metrics
        qualityIssues: metrics.qualityIssues,
        qualityScore: metrics.qualityScore,
        
        // System info
        system: 'Enhanced DIVA Maintenance System v2.1',
        platform: 'Apify Cloud',
        version: '2.1',
        
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
        // First, check if maintenance_reports table exists
        const { data: tableExists, error: tableError } = await supabaseClient
            .from('maintenance_reports')
            .select('id')
            .limit(1);
        
        if (tableError) {
            console.log('⚠️ maintenance_reports table does not exist or is not accessible:', tableError.message);
            console.log('📋 Creating maintenance_reports table...');
            
            // Create the table using SQL
            const { error: createError } = await supabaseClient.rpc('exec_sql', {
                sql: `
                CREATE TABLE IF NOT EXISTS maintenance_reports (
                    id SERIAL PRIMARY KEY,
                    system_type VARCHAR(50) NOT NULL,
                    status VARCHAR(50) NOT NULL,
                    duration_seconds INTEGER,
                    quality_score INTEGER,
                    duplicates_removed INTEGER,
                    records_processed INTEGER,
                    report_data JSONB,
                    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
                );
                `
            });
            
            if (createError) {
                console.log('❌ Failed to create maintenance_reports table:', createError.message);
                throw new Error(`Cannot create maintenance_reports table: ${createError.message}`);
            }
            
            console.log('✅ maintenance_reports table created successfully');
        } else {
            console.log('✅ maintenance_reports table accessible');
        }
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

        const { error } = await supabaseClient
            .from('maintenance_reports')
            .insert([reportData]);

        if (error) {
            throw error;
        }

        console.log('💾 DIVA maintenance report saved to dashboard successfully');

    } catch (error) {
        console.log(`Failed to save DIVA report to dashboard: ${error?.message || JSON.stringify(error) || 'Unknown error'}`);
        console.log('Dashboard save error details:', error);
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
        console.error('❌ Failed to send email report:', error.message);
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
            <h1>🇰🇷 Enhanced DIVA Maintenance Report v2.1</h1>
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
                <p><strong>System:</strong> Enhanced DIVA Maintenance System v2.0</p>
            `
        };
        
        await transporter.sendMail(mailOptions);
        console.log('✅ Error notification sent successfully');
        
    } catch (emailError) {
        console.error('❌ Failed to send error notification:', emailError.message);
    }
} 