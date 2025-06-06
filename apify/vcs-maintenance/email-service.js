import nodemailer from 'nodemailer';

/**
 * Enhanced Email Service for VCS Maintenance Reports
 */
export class EmailService {
    constructor(config = {}) {
        this.config = config;
        this.transporter = null;
        this.initializeTransporter();
    }

    initializeTransporter() {
        // Option 1: Gmail SMTP
        if (this.config.gmail) {
            this.transporter = nodemailer.createTransporter({
                service: 'gmail',
                auth: {
                    user: this.config.gmail.user,
                    pass: this.config.gmail.appPassword // Use app-specific password
                }
            });
        }
        
        // Option 2: Custom SMTP
        else if (this.config.smtp) {
            this.transporter = nodemailer.createTransporter({
                host: this.config.smtp.host,
                port: this.config.smtp.port || 587,
                secure: this.config.smtp.secure || false,
                auth: {
                    user: this.config.smtp.user,
                    pass: this.config.smtp.password
                }
            });
        }
        
        // Option 3: SendGrid
        else if (this.config.sendgrid) {
            this.transporter = nodemailer.createTransporter({
                service: 'SendGrid',
                auth: {
                    user: 'apikey',
                    pass: this.config.sendgrid.apiKey
                }
            });
        }
        
        // Option 4: AWS SES
        else if (this.config.aws) {
            this.transporter = nodemailer.createTransporter({
                service: 'SES',
                region: this.config.aws.region || 'us-east-1',
                auth: {
                    user: this.config.aws.accessKeyId,
                    pass: this.config.aws.secretAccessKey
                }
            });
        }
    }

    async sendMaintenanceReport(report, recipients, subject) {
        if (!this.transporter) {
            console.log('📧 No email transporter configured - saving to storage only');
            return false;
        }

        try {
            const htmlContent = this.generateHTMLReport(report);
            
            const mailOptions = {
                from: this.config.fromEmail || 'vcs-maintenance@yourcompany.com',
                to: recipients.join(', '),
                subject: subject || `VCS Maintenance Report - ${report.performance.status}`,
                html: htmlContent,
                text: this.generateTextReport(report)
            };

            const result = await this.transporter.sendMail(mailOptions);
            console.log('📧 Email sent successfully:', result.messageId);
            return true;
            
        } catch (error) {
            console.error('❌ Email sending failed:', error.message);
            return false;
        }
    }

    generateHTMLReport(report) {
        const status = report.performance.status;
        const statusColor = status === 'HEALTHY' ? '#28a745' : '#dc3545';
        const statusEmoji = status === 'HEALTHY' ? '✅' : '⚠️';
        
        return `
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <style>
        body { font-family: Arial, sans-serif; line-height: 1.6; color: #333; }
        .header { background: ${statusColor}; color: white; padding: 20px; text-align: center; }
        .content { padding: 20px; }
        .metrics { display: flex; flex-wrap: wrap; gap: 20px; margin: 20px 0; }
        .metric { background: #f8f9fa; padding: 15px; border-radius: 5px; flex: 1; min-width: 200px; }
        .metric h3 { margin: 0 0 10px 0; color: #495057; }
        .metric .value { font-size: 24px; font-weight: bold; color: ${statusColor}; }
        .alert { background: #fff3cd; border: 1px solid #ffeaa7; padding: 15px; border-radius: 5px; margin: 20px 0; }
        .success { background: #d1edff; border: 1px solid #74c0fc; }
        .footer { background: #f8f9fa; padding: 20px; text-align: center; color: #6c757d; }
    </style>
</head>
<body>
    <div class="header">
        <h1>${statusEmoji} VCS Maintenance Report</h1>
        <p>Database Health & Quality Report</p>
    </div>
    
    <div class="content">
        <div class="metrics">
            <div class="metric">
                <h3>📊 Total Records</h3>
                <div class="value">${report.database_health.total_records.toLocaleString()}</div>
                <small>${report.database_health.vc_count} VCs + ${report.database_health.fund_count} Funds</small>
            </div>
            
            <div class="metric">
                <h3>🔍 Duplicates Removed</h3>
                <div class="value">${report.duplicate_analysis.duplicates_removed}</div>
                <small>Found: ${report.duplicate_analysis.duplicates_found}</small>
            </div>
            
            <div class="metric">
                <h3>🎯 Quality Score</h3>
                <div class="value">${report.data_quality.quality_score}/100</div>
                <small>${report.data_quality.quality_score >= 95 ? 'Excellent' : report.data_quality.quality_score >= 80 ? 'Good' : 'Needs Attention'}</small>
            </div>
            
            <div class="metric">
                <h3>⏱️ Duration</h3>
                <div class="value">${report.duration_seconds}s</div>
                <small>Success Rate: ${report.success_rate}%</small>
            </div>
        </div>
        
        <div class="${status === 'HEALTHY' ? 'success' : 'alert'}">
            <h3>🎯 System Status: ${status}</h3>
            <p><strong>Execution Time:</strong> ${new Date(report.timestamp).toLocaleString()}</p>
            <p><strong>Processing Speed:</strong> ${Math.round(report.performance.processing_speed)} records/second</p>
            <p><strong>Errors Encountered:</strong> ${report.performance.errors_encountered}</p>
        </div>
        
        ${report.duplicate_analysis.duplicates_removed > 0 ? `
        <div class="alert">
            <h3>🧹 Cleanup Actions Performed</h3>
            <ul>
                <li><strong>VC Duplicates:</strong> ${report.duplicate_analysis.vc_duplicates} removed</li>
                <li><strong>Fund Duplicates:</strong> ${report.duplicate_analysis.fund_duplicates} removed</li>
                <li><strong>Total Cleaned:</strong> ${report.duplicate_analysis.duplicates_removed} records</li>
            </ul>
        </div>
        ` : ''}
        
        <div class="metric">
            <h3>📈 Recent Activity</h3>
            <p><strong>New VCs:</strong> ${report.database_health.recent_activity.vc_recent}</p>
            <p><strong>New Funds:</strong> ${report.database_health.recent_activity.fund_recent}</p>
            <p><strong>Total New:</strong> ${report.database_health.recent_activity.vc_recent + report.database_health.recent_activity.fund_recent} records in last hour</p>
        </div>
    </div>
    
    <div class="footer">
        <p>🔗 <strong>View Full Report:</strong> Apify Console → enhanced-vcs-maintenance → Latest Run → Storage</p>
        <p>📊 <strong>Dashboard:</strong> <a href="https://console.apify.com/actors">Apify Console</a></p>
        <p><small>Generated by Enhanced VCS Maintenance System v2.0</small></p>
    </div>
</body>
</html>
        `.trim();
    }

    generateTextReport(report) {
        return `
🔧 VCS MAINTENANCE REPORT ${report.performance.status === 'HEALTHY' ? '✅' : '⚠️'}
=====================================

📅 Date: ${new Date(report.timestamp).toLocaleString()}
⏱️ Duration: ${report.duration_seconds} seconds
📊 Success Rate: ${report.success_rate}%
🎯 Status: ${report.performance.status}

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

View full report: Apify Console → enhanced-vcs-maintenance → Latest Run → Storage
        `.trim();
    }
}

// Email configuration examples
export const emailConfigs = {
    gmail: {
        gmail: {
            user: 'your-email@gmail.com',
            appPassword: 'your-app-specific-password'
        },
        fromEmail: 'vcs-maintenance@yourcompany.com'
    },
    
    sendgrid: {
        sendgrid: {
            apiKey: 'SG.your-sendgrid-api-key'
        },
        fromEmail: 'noreply@yourcompany.com'
    },
    
    outlook: {
        smtp: {
            host: 'smtp-mail.outlook.com',
            port: 587,
            secure: false,
            user: 'your-email@outlook.com',
            password: 'your-password'
        },
        fromEmail: 'maintenance@yourcompany.com'
    }
}; 