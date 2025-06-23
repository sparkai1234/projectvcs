import { Actor } from 'apify';
import { createClient } from '@supabase/supabase-js';
import nodemailer from 'nodemailer';

console.log('📧 === CONSOLIDATED EMAIL REPORTER v1.0 ===');
console.log('🕐 Report Time:', new Date().toISOString());

/**
 * 📧 Consolidated Email Reporter
 * Combines VCS and DIVA maintenance reports into unified email
 */
class ConsolidatedEmailReporter {
    constructor(input = {}) {
        this.input = input;
        this.supabase = null;
        this.emailConfig = {
            recipients: input?.emailRecipients || ['sparkai@sparklabs.co.kr'],
            smtpHost: input?.smtpHost || process.env.SMTP_HOST || 'smtp.gmail.com',
            smtpPort: input?.smtpPort || process.env.SMTP_PORT || 587,
            smtpUser: input?.smtpUser || process.env.SMTP_USER,
            smtpPass: input?.smtpPass || process.env.SMTP_PASS
        };
        this.initializeSupabase();
    }

    initializeSupabase() {
        const supabaseUrl = this.input.supabaseUrl || process.env.SUPABASE_URL;
        const supabaseKey = this.input.supabaseKey || process.env.SUPABASE_SERVICE_ROLE_KEY || process.env.SUPABASE_KEY;
        
        if (supabaseUrl && supabaseKey) {
            this.supabase = createClient(supabaseUrl, supabaseKey);
            console.log('✅ Supabase client initialized for email reporting');
        } else {
            console.log('❌ Failed to initialize Supabase client');
            throw new Error('Missing Supabase credentials');
        }
    }

    /**
     * 📊 RETRIEVE LATEST MAINTENANCE REPORTS
     */
    async retrieveLatestReports() {
        console.log('📊 Retrieving latest maintenance reports...');
        
        try {
            // Get latest VCS and DIVA reports from unified table
            const { data: latestReports, error } = await this.supabase
                .from('unified_maintenance_reports')
                .select('*')
                .in('system_type', ['VCS', 'DIVA'])
                .order('created_at', { ascending: false })
                .limit(10);

            if (error) {
                throw error;
            }

            // Group by system type and get most recent
            const reportsBySystem = {};
            latestReports.forEach(report => {
                if (!reportsBySystem[report.system_type] || 
                    new Date(report.created_at) > new Date(reportsBySystem[report.system_type].created_at)) {
                    reportsBySystem[report.system_type] = report;
                }
            });

            console.log(`📊 Retrieved reports for: ${Object.keys(reportsBySystem).join(', ')}`);
            return reportsBySystem;

        } catch (error) {
            console.error('❌ Failed to retrieve maintenance reports:', error.message);
            return null;
        }
    }

    /**
     * 📊 RETRIEVE ACTOR STORAGE REPORTS (FALLBACK)
     */
    async retrieveActorStorageReports() {
        console.log('📊 Retrieving reports from Actor storage...');
        
        try {
            const vcsReport = await Actor.getValue('vcs_maintenance_report');
            const divaReport = await Actor.getValue('diva_maintenance_report');
            
            const reports = {};
            if (vcsReport) reports.VCS = vcsReport;
            if (divaReport) reports.DIVA = divaReport;
            
            console.log(`📊 Retrieved storage reports for: ${Object.keys(reports).join(', ')}`);
            return reports;
            
        } catch (error) {
            console.error('❌ Failed to retrieve Actor storage reports:', error.message);
            return {};
        }
    }

    /**
     * 📊 GENERATE CONSOLIDATED DASHBOARD SUMMARY
     */
    async generateDashboardSummary() {
        console.log('📊 Generating dashboard summary...');
        
        try {
            // Get summary statistics from unified table
            const { data: recentReports, error } = await this.supabase
                .from('unified_maintenance_reports')
                .select('system_type, status, quality_score, duplicates_removed, records_processed, created_at')
                .gte('created_at', new Date(Date.now() - 24 * 60 * 60 * 1000).toISOString()) // Last 24 hours
                .order('created_at', { ascending: false });

            if (error) {
                throw error;
            }

            const summary = {
                totalSystems: new Set(recentReports.map(r => r.system_type)).size,
                totalReports: recentReports.length,
                healthySystems: recentReports.filter(r => r.status === 'HEALTHY').length,
                averageQualityScore: recentReports.length > 0 ? 
                    Math.round(recentReports.reduce((sum, r) => sum + (r.quality_score || 0), 0) / recentReports.length) : 0,
                totalDuplicatesRemoved: recentReports.reduce((sum, r) => sum + (r.duplicates_removed || 0), 0),
                totalRecordsProcessed: recentReports.reduce((sum, r) => sum + (r.records_processed || 0), 0),
                lastUpdated: recentReports[0]?.created_at || new Date().toISOString()
            };

            console.log('📊 Dashboard summary generated:', summary);
            return summary;

        } catch (error) {
            console.error('❌ Failed to generate dashboard summary:', error.message);
            return null;
        }
    }

    /**
     * 📧 GENERATE CONSOLIDATED EMAIL CONTENT
     */
    generateConsolidatedEmailContent(reports, dashboardSummary) {
        const timestamp = new Date().toLocaleString('ko-KR', { timeZone: 'Asia/Seoul' });
        const vcsReport = reports.VCS;
        const divaReport = reports.DIVA;
        
        // Determine overall status
        const vcsStatus = vcsReport?.report?.performance?.status || vcsReport?.status || 'UNKNOWN';
        const divaStatus = divaReport?.report?.performance?.status || divaReport?.status || 'UNKNOWN';
        const overallStatus = (vcsStatus === 'HEALTHY' && divaStatus === 'HEALTHY') ? 'HEALTHY' : 'NEEDS_ATTENTION';
        const statusEmoji = overallStatus === 'HEALTHY' ? '✅' : '⚠️';

        return `
🔧 UNIFIED MAINTENANCE REPORT ${statusEmoji}
==========================================

📅 Report Date: ${timestamp}
🎯 Overall Status: ${overallStatus}
📊 Systems Monitored: VCS & DIVA

📊 DASHBOARD SUMMARY
===================
• Total Systems: ${dashboardSummary?.totalSystems || 2}
• Reports Generated: ${dashboardSummary?.totalReports || 0}
• Healthy Systems: ${dashboardSummary?.healthySystems || 0}
• Average Quality Score: ${dashboardSummary?.averageQualityScore || 0}/100
• Total Duplicates Removed: ${dashboardSummary?.totalDuplicatesRemoved || 0}
• Total Records Processed: ${(dashboardSummary?.totalRecordsProcessed || 0).toLocaleString()}

🏢 VCS SYSTEM STATUS
===================
${vcsReport ? this.formatSystemReport(vcsReport, 'VCS') : '❌ No VCS report available'}

💰 DIVA SYSTEM STATUS
====================
${divaReport ? this.formatSystemReport(divaReport, 'DIVA') : '❌ No DIVA report available'}

📈 SYSTEM COMPARISON
===================
${this.generateSystemComparison(vcsReport, divaReport)}

${overallStatus === 'NEEDS_ATTENTION' ? 
    '⚠️ ATTENTION REQUIRED: One or more systems need attention. Please review the detailed reports.' : 
    '✅ All systems operating normally. Regular maintenance completed successfully.'}

🔗 Access Full Reports:
• VCS Maintenance: Apify Console → vcs-maintenance → Latest Run
• DIVA Maintenance: Apify Console → diva-maintenance → Latest Run
• Unified Dashboard: Supabase → unified_maintenance_reports table

🤖 This is an automated report from the Unified Maintenance System v3.0
        `.trim();
    }

    /**
     * 📊 FORMAT INDIVIDUAL SYSTEM REPORT
     */
    formatSystemReport(report, systemType) {
        const reportData = report.report || report;
        const summary = report.summary || {};
        
        const status = reportData?.performance?.status || report.status || 'UNKNOWN';
        const duration = reportData?.duration_seconds || summary.duration || 0;
        const records = reportData?.database_health?.total_records || summary.records || 0;
        const duplicatesRemoved = reportData?.duplicate_analysis?.duplicates_removed || summary.duplicates_removed || 0;
        const qualityScore = reportData?.data_quality?.quality_score || summary.quality_score || 0;

        return `
Status: ${status} ${status === 'HEALTHY' ? '✅' : '⚠️'}
Duration: ${duration} seconds
Records Processed: ${records.toLocaleString()}
Duplicates Removed: ${duplicatesRemoved}
Quality Score: ${qualityScore}/100
Processing Speed: ${records > 0 && duration > 0 ? Math.round(records / duration) : 0} records/sec`;
    }

    /**
     * 📊 GENERATE SYSTEM COMPARISON
     */
    generateSystemComparison(vcsReport, divaReport) {
        if (!vcsReport || !divaReport) {
            return 'Comparison unavailable - missing report data';
        }

        const vcsData = vcsReport.report || vcsReport;
        const divaData = divaReport.report || divaReport;
        
        const vcsRecords = vcsData?.database_health?.total_records || vcsReport.summary?.records || 0;
        const divaRecords = divaData?.database_health?.total_records || divaReport.summary?.records || 0;
        
        const vcsQuality = vcsData?.data_quality?.quality_score || vcsReport.summary?.quality_score || 0;
        const divaQuality = divaData?.data_quality?.quality_score || divaReport.summary?.quality_score || 0;

        return `
• VCS Records: ${vcsRecords.toLocaleString()} | DIVA Records: ${divaRecords.toLocaleString()}
• VCS Quality: ${vcsQuality}/100 | DIVA Quality: ${divaQuality}/100
• Total Database Size: ${(vcsRecords + divaRecords).toLocaleString()} records
• Combined Quality: ${Math.round((vcsQuality + divaQuality) / 2)}/100`;
    }

    /**
     * 📧 SEND CONSOLIDATED EMAIL
     */
    async sendConsolidatedEmail(emailContent) {
        if (!this.emailConfig.smtpUser || !this.emailConfig.smtpPass) {
            console.log('📧 Email credentials not configured - saving report to storage');
            await Actor.setValue('consolidated_email_report', {
                subject: 'Unified Maintenance Report',
                content: emailContent,
                timestamp: new Date().toISOString(),
                recipients: this.emailConfig.recipients
            });
            return true;
        }

        try {
            console.log('📧 Sending consolidated email report...');
            
            const transporter = nodemailer.createTransporter({
                host: this.emailConfig.smtpHost,
                port: this.emailConfig.smtpPort,
                secure: false,
                auth: {
                    user: this.emailConfig.smtpUser,
                    pass: this.emailConfig.smtpPass
                }
            });

            const mailOptions = {
                from: `"Unified Maintenance System" <${this.emailConfig.smtpUser}>`,
                to: this.emailConfig.recipients.join(', '),
                subject: 'Unified Maintenance Report - VCS & DIVA Systems',
                text: emailContent,
                html: this.generateHtmlEmail(emailContent)
            };

            await transporter.sendMail(mailOptions);
            console.log('✅ Consolidated email sent successfully');
            return true;

        } catch (error) {
            console.error('❌ Failed to send consolidated email:', error.message);
            
            // Save to storage as fallback
            await Actor.setValue('consolidated_email_report', {
                subject: 'Unified Maintenance Report (Failed to Send)',
                content: emailContent,
                error: error.message,
                timestamp: new Date().toISOString(),
                recipients: this.emailConfig.recipients
            });
            return false;
        }
    }

    /**
     * 🎨 GENERATE HTML EMAIL
     */
    generateHtmlEmail(textContent) {
        return `
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Unified Maintenance Report</title>
    <style>
        body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; line-height: 1.6; color: #333; margin: 0; padding: 20px; background-color: #f5f5f5; }
        .container { max-width: 800px; margin: 0 auto; background: white; padding: 30px; border-radius: 10px; box-shadow: 0 4px 6px rgba(0,0,0,0.1); }
        .header { text-align: center; border-bottom: 3px solid #007acc; padding-bottom: 20px; margin-bottom: 30px; }
        .header h1 { color: #007acc; margin: 0; font-size: 24px; }
        .status-healthy { color: #28a745; font-weight: bold; }
        .status-warning { color: #ffc107; font-weight: bold; }
        .status-error { color: #dc3545; font-weight: bold; }
        .section { margin: 25px 0; padding: 20px; background: #f8f9fa; border-radius: 8px; border-left: 4px solid #007acc; }
        .section h2 { color: #007acc; margin-top: 0; font-size: 18px; }
        .metrics { display: grid; grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); gap: 15px; margin: 20px 0; }
        .metric { background: white; padding: 15px; border-radius: 6px; text-align: center; box-shadow: 0 2px 4px rgba(0,0,0,0.1); }
        .metric-value { font-size: 24px; font-weight: bold; color: #007acc; }
        .metric-label { font-size: 12px; color: #666; text-transform: uppercase; }
        .footer { text-align: center; margin-top: 30px; padding-top: 20px; border-top: 1px solid #dee2e6; color: #666; font-size: 12px; }
        pre { background: #f8f9fa; padding: 15px; border-radius: 6px; overflow-x: auto; font-size: 13px; }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>🔧 Unified Maintenance Report</h1>
            <p>VCS & DIVA Systems Status</p>
        </div>
        
        <div class="section">
            <pre>${textContent}</pre>
        </div>
        
        <div class="footer">
            <p>🤖 Generated by Unified Maintenance System v3.0</p>
            <p>📧 Automated report delivered at ${new Date().toLocaleString('ko-KR', { timeZone: 'Asia/Seoul' })}</p>
        </div>
    </div>
</body>
</html>`;
    }

    /**
     * 🚀 MAIN EXECUTION
     */
    async generateAndSendReport() {
        console.log('🚀 Starting consolidated email report generation...');
        
        try {
            // 1. Retrieve latest maintenance reports
            let reports = await this.retrieveLatestReports();
            
            // 2. Fallback to Actor storage if database reports not available
            if (!reports || Object.keys(reports).length === 0) {
                console.log('📊 Falling back to Actor storage reports...');
                reports = await this.retrieveActorStorageReports();
            }
            
            // 3. Generate dashboard summary
            const dashboardSummary = await this.generateDashboardSummary();
            
            // 4. Generate consolidated email content
            const emailContent = this.generateConsolidatedEmailContent(reports, dashboardSummary);
            
            // 5. Send consolidated email
            const emailSent = await this.sendConsolidatedEmail(emailContent);
            
            // 6. Save final report
            await Actor.setValue('consolidated_maintenance_report', {
                timestamp: new Date().toISOString(),
                reports: reports,
                dashboardSummary: dashboardSummary,
                emailContent: emailContent,
                emailSent: emailSent
            });
            
            console.log('🎉 Consolidated email report completed successfully');
            return true;
            
        } catch (error) {
            console.error('❌ Consolidated email report failed:', error.message);
            return false;
        }
    }
}

// ==========================================
// APIFY ACTOR MAIN EXECUTION
// ==========================================

Actor.main(async () => {
    console.log('📧 Consolidated Email Reporter Started');
    console.log('🕐 Execution time:', new Date().toISOString());
    
    const input = await Actor.getInput();
    console.log('⚙️ Input configuration:', JSON.stringify(input, null, 2));
    
    try {
        const emailReporter = new ConsolidatedEmailReporter(input);
        const success = await emailReporter.generateAndSendReport();
        
        if (success) {
            console.log('🎉 === CONSOLIDATED EMAIL REPORT COMPLETED SUCCESSFULLY ===');
        } else {
            console.log('❌ === CONSOLIDATED EMAIL REPORT FAILED ===');
            process.exit(1);
        }
        
    } catch (error) {
        console.error('💥 Fatal email reporter error:', error.message);
        process.exit(1);
    }
}); 