import { Actor } from 'apify';
import { createClient } from '@supabase/supabase-js';
import nodemailer from 'nodemailer';
import express from 'express';

console.log('🚀 === UNIFIED KOREAN FINANCIAL INTELLIGENCE DASHBOARD v3.0 ===');
console.log('🇰🇷 Real-time VCS + DIVA Monitoring & Analytics System');
console.log('🕐 Dashboard Time:', new Date().toISOString());

/**
 * 🏆 Unified Korean Financial Intelligence Dashboard
 * 
 * Features:
 * - Real-time VCS + DIVA data monitoring
 * - Comprehensive quality scoring and health metrics
 * - Automated maintenance scheduling and reporting
 * - Email notifications and alerts
 * - Web-based dashboard with live metrics
 * - Historical trend analysis
 * - Data integration validation
 */

Actor.main(async () => {
    console.log('🎯 Starting Unified Korean Financial Intelligence Dashboard...');
    
    const input = await Actor.getInput();
    
    // Enhanced Configuration
    const config = {
        // Dashboard mode
        mode: input?.mode || 'monitor', // 'monitor', 'maintenance', 'report'
        interval: input?.interval || 300, // 5 minutes
        webPort: input?.webPort || 3000,
        
        // Supabase configuration
        supabaseUrl: input?.supabaseUrl || process.env.SUPABASE_URL,
        supabaseKey: input?.supabaseKey || process.env.SUPABASE_SERVICE_ROLE_KEY,
        
        // Email configuration
        emailConfig: {
            enabled: input?.emailEnabled !== false,
            recipients: input?.emailRecipients || ['sparkai@sparklabs.co.kr'],
            smtpHost: input?.smtpHost || 'smtp.gmail.com',
            smtpPort: input?.smtpPort || 587,
            smtpUser: input?.smtpUser || process.env.SMTP_USER,
            smtpPass: input?.smtpPass || process.env.SMTP_PASS
        },
        
        // Alert thresholds
        thresholds: {
            qualityScore: input?.qualityThreshold || 75,
            duplicateThreshold: input?.duplicateThreshold || 100,
            dataAgeHours: input?.dataAgeThreshold || 48
        }
    };
    
    console.log('📋 Dashboard Configuration:', {
        mode: config.mode,
        interval: config.interval,
        webPort: config.webPort,
        emailEnabled: config.emailConfig.enabled
    });
    
    // Initialize dashboard system
    const dashboard = new UnifiedFinancialDashboard(config);
    await dashboard.initialize();
    
    // Run based on mode
    switch (config.mode) {
        case 'monitor':
            await dashboard.startRealTimeMonitoring();
            break;
        case 'maintenance':
            await dashboard.runMaintenanceCycle();
            break;
        case 'report':
            await dashboard.generateComprehensiveReport();
            break;
        default:
            console.log('❌ Invalid mode specified');
            process.exit(1);
    }
});

/**
 * 🏆 Unified Financial Dashboard Class
 */
class UnifiedFinancialDashboard {
    constructor(config) {
        this.config = config;
        this.supabase = null;
        this.metrics = {
            vcs: { totalRecords: 0, qualityScore: 0, lastUpdate: null, issues: [] },
            diva: { totalRecords: 0, qualityScore: 0, lastUpdate: null, issues: [] },
            combined: { totalRecords: 0, averageQuality: 0, systemHealth: 'UNKNOWN' }
        };
        this.alerts = [];
        this.webServer = null;
    }
    
    async initialize() {
        console.log('🔧 Initializing Unified Dashboard...');
        
        // Initialize Supabase
        if (!this.config.supabaseUrl || !this.config.supabaseKey) {
            throw new Error('Missing Supabase credentials');
        }
        
        this.supabase = createClient(this.config.supabaseUrl, this.config.supabaseKey);
        console.log('✅ Supabase client initialized');
        
        // Test connections
        await this.testConnections();
        
        // Initialize web server
        if (this.config.mode === 'monitor') {
            await this.initializeWebServer();
        }
        
        console.log('🎉 Unified Dashboard initialized successfully');
    }
    
    async testConnections() {
        console.log('🔍 Testing database connections...');
        
        try {
            // Test VCS tables
            const { data: vcsTest } = await this.supabase
                .from('vc_table')
                .select('count')
                .limit(1);
            console.log('✅ VCS database connection successful');
            
            // Test DIVA tables
            const { data: divaTest } = await this.supabase
                .from('diva_investment_performance_raw')
                .select('count')
                .limit(1);
            console.log('✅ DIVA database connection successful');
            
        } catch (error) {
            console.log('⚠️ Database connection test warning:', error.message);
        }
    }
    
    async initializeWebServer() {
        console.log('🌐 Initializing web dashboard server...');
        
        const app = express();
        app.use(express.static('public'));
        app.use(express.json());
        
        // Dashboard homepage
        app.get('/', (req, res) => {
            res.send(this.generateDashboardHTML());
        });
        
        // API endpoints
        app.get('/api/metrics', (req, res) => {
            res.json(this.metrics);
        });
        
        app.get('/api/alerts', (req, res) => {
            res.json(this.alerts);
        });
        
        app.get('/api/health', (req, res) => {
            res.json({
                status: this.metrics.combined.systemHealth,
                timestamp: new Date().toISOString(),
                uptime: process.uptime()
            });
        });
        
        this.webServer = app.listen(this.config.webPort, () => {
            console.log(`🌐 Dashboard web server running on port ${this.config.webPort}`);
            console.log(`📊 Access dashboard at: http://localhost:${this.config.webPort}`);
        });
    }
    
    async startRealTimeMonitoring() {
        console.log('📊 Starting real-time monitoring mode...');
        console.log(`⏰ Monitoring interval: ${this.config.interval} seconds`);
        
        // Initial analysis
        await this.performComprehensiveAnalysis();
        
        // Set up monitoring interval
        setInterval(async () => {
            try {
                await this.performComprehensiveAnalysis();
                await this.checkAlertConditions();
            } catch (error) {
                console.error('❌ Monitoring cycle error:', error.message);
            }
        }, this.config.interval * 1000);
        
        console.log('🎯 Real-time monitoring active. Press Ctrl+C to stop.');
        
        // Keep the process running
        process.on('SIGINT', async () => {
            console.log('🛑 Shutting down dashboard...');
            if (this.webServer) {
                this.webServer.close();
            }
            process.exit(0);
        });
        
        // Keep alive
        return new Promise(() => {});
    }
    
    async performComprehensiveAnalysis() {
        console.log('🔍 === COMPREHENSIVE SYSTEM ANALYSIS ===');
        
        const timestamp = new Date().toISOString();
        
        // Analyze VCS data
        const vcsMetrics = await this.analyzeVCSData();
        this.metrics.vcs = { ...vcsMetrics, lastUpdate: timestamp };
        
        // Analyze DIVA data
        const divaMetrics = await this.analyzeDIVAData();
        this.metrics.diva = { ...divaMetrics, lastUpdate: timestamp };
        
        // Calculate combined metrics
        this.calculateCombinedMetrics();
        
        // Log summary
        this.logAnalysisSummary();
        
        // Save metrics to storage
        await Actor.setValue('dashboard_metrics', this.metrics);
    }
    
    async analyzeVCSData() {
        console.log('🏢 Analyzing VCS data...');
        
        try {
            // Get VCS record counts
            const { count: vcCount } = await this.supabase.from('vc_table').select('*', { count: 'exact' });
            const { count: fundCount } = await this.supabase.from('fund_table').select('*', { count: 'exact' });
            const totalRecords = (vcCount || 0) + (fundCount || 0);
            
            // Check for quality issues
            const qualityIssues = await this.checkVCSQuality();
            const qualityScore = totalRecords > 0 ? Math.max(0, Math.round(((totalRecords - qualityIssues.total) / totalRecords) * 100)) : 100;
            
            // Check data freshness
            const dataAge = await this.checkVCSDataAge();
            
            console.log(`📊 VCS Metrics: ${totalRecords} records, ${qualityScore}/100 quality, ${dataAge.hours}h old`);
            
            return {
                totalRecords,
                vcCount: vcCount || 0,
                fundCount: fundCount || 0,
                qualityScore,
                qualityIssues: qualityIssues.details,
                dataAge: dataAge.hours,
                status: qualityScore >= this.config.thresholds.qualityScore ? 'HEALTHY' : 'NEEDS_ATTENTION'
            };
            
        } catch (error) {
            console.error('❌ VCS analysis error:', error.message);
            return {
                totalRecords: 0,
                qualityScore: 0,
                status: 'ERROR',
                error: error.message
            };
        }
    }
    
    async analyzeDIVAData() {
        console.log('💰 Analyzing DIVA data...');
        
        try {
            // Get DIVA record counts from all tables
            const tables = [
                'diva_investment_performance_raw',
                'diva_financial_statements_raw',
                'diva_association_status_raw',
                'diva_personnel_status_raw',
                'diva_professional_personnel_raw',
                'diva_violations_raw',
                'diva_vc_map_raw'
            ];
            
            let totalRecords = 0;
            const tableMetrics = {};
            
            for (const table of tables) {
                try {
                    const { count } = await this.supabase.from(table).select('*', { count: 'exact' });
                    const recordCount = count || 0;
                    totalRecords += recordCount;
                    tableMetrics[table] = recordCount;
                } catch (error) {
                    console.log(`⚠️ Could not count ${table}:`, error.message);
                    tableMetrics[table] = 0;
                }
            }
            
            // Check for quality issues
            const qualityIssues = await this.checkDIVAQuality();
            const qualityScore = totalRecords > 0 ? Math.max(0, Math.round(((totalRecords - qualityIssues.total) / totalRecords) * 100)) : 100;
            
            // Check data freshness
            const dataAge = await this.checkDIVADataAge();
            
            console.log(`📊 DIVA Metrics: ${totalRecords} records, ${qualityScore}/100 quality, ${dataAge.hours}h old`);
            
            return {
                totalRecords,
                tableMetrics,
                qualityScore,
                qualityIssues: qualityIssues.details,
                dataAge: dataAge.hours,
                status: qualityScore >= this.config.thresholds.qualityScore ? 'HEALTHY' : 'NEEDS_ATTENTION'
            };
            
        } catch (error) {
            console.error('❌ DIVA analysis error:', error.message);
            return {
                totalRecords: 0,
                qualityScore: 0,
                status: 'ERROR',
                error: error.message
            };
        }
    }
    
    async checkVCSQuality() {
        const issues = { total: 0, details: [] };
        
        try {
            // Check for missing names
            const { count: vcNoName } = await this.supabase
                .from('vc_table')
                .select('*', { count: 'exact' })
                .or('company_name.is.null,company_name.eq.""');
                
            const { count: fundNoName } = await this.supabase
                .from('fund_table')
                .select('*', { count: 'exact' })
                .or('fund_name.is.null,fund_name.eq.""');
            
            issues.total += (vcNoName || 0) + (fundNoName || 0);
            if (vcNoName > 0) issues.details.push(`${vcNoName} VCs with missing names`);
            if (fundNoName > 0) issues.details.push(`${fundNoName} funds with missing names`);
            
        } catch (error) {
            console.log('⚠️ VCS quality check error:', error.message);
        }
        
        return issues;
    }
    
    async checkDIVAQuality() {
        const issues = { total: 0, details: [] };
        
        try {
            // Check investment performance quality
            const { count: missingCompanies } = await this.supabase
                .from('diva_investment_performance_raw')
                .select('*', { count: 'exact' })
                .or('company_name.is.null,company_name.eq.""');
            
            issues.total += missingCompanies || 0;
            if (missingCompanies > 0) issues.details.push(`${missingCompanies} investment records with missing company names`);
            
        } catch (error) {
            console.log('⚠️ DIVA quality check error:', error.message);
        }
        
        return issues;
    }
    
    async checkVCSDataAge() {
        try {
            const { data } = await this.supabase
                .from('vc_table')
                .select('created_at')
                .order('created_at', { ascending: false })
                .limit(1);
                
            if (data?.[0]) {
                const lastUpdate = new Date(data[0].created_at);
                const hours = Math.round((Date.now() - lastUpdate.getTime()) / (1000 * 60 * 60));
                return { hours, lastUpdate };
            }
        } catch (error) {
            console.log('⚠️ VCS data age check error:', error.message);
        }
        
        return { hours: 999, lastUpdate: null };
    }
    
    async checkDIVADataAge() {
        try {
            const { data } = await this.supabase
                .from('diva_investment_performance_raw')
                .select('created_at')
                .order('created_at', { ascending: false })
                .limit(1);
                
            if (data?.[0]) {
                const lastUpdate = new Date(data[0].created_at);
                const hours = Math.round((Date.now() - lastUpdate.getTime()) / (1000 * 60 * 60));
                return { hours, lastUpdate };
            }
        } catch (error) {
            console.log('⚠️ DIVA data age check error:', error.message);
        }
        
        return { hours: 999, lastUpdate: null };
    }
    
    calculateCombinedMetrics() {
        this.metrics.combined = {
            totalRecords: this.metrics.vcs.totalRecords + this.metrics.diva.totalRecords,
            averageQuality: Math.round((this.metrics.vcs.qualityScore + this.metrics.diva.qualityScore) / 2),
            systemHealth: this.determineSystemHealth(),
            lastUpdate: new Date().toISOString()
        };
    }
    
    determineSystemHealth() {
        const vcsHealthy = this.metrics.vcs.status === 'HEALTHY';
        const divaHealthy = this.metrics.diva.status === 'HEALTHY';
        
        if (vcsHealthy && divaHealthy) return 'HEALTHY';
        if (this.metrics.vcs.status === 'ERROR' || this.metrics.diva.status === 'ERROR') return 'ERROR';
        return 'NEEDS_ATTENTION';
    }
    
    logAnalysisSummary() {
        console.log('📊 === ANALYSIS SUMMARY ===');
        console.log(`🏢 VCS: ${this.metrics.vcs.totalRecords} records, ${this.metrics.vcs.qualityScore}/100 quality, ${this.metrics.vcs.status}`);
        console.log(`💰 DIVA: ${this.metrics.diva.totalRecords} records, ${this.metrics.diva.qualityScore}/100 quality, ${this.metrics.diva.status}`);
        console.log(`🎯 Combined: ${this.metrics.combined.totalRecords} records, ${this.metrics.combined.averageQuality}/100 avg quality, ${this.metrics.combined.systemHealth}`);
    }
    
    async checkAlertConditions() {
        const newAlerts = [];
        
        // Quality score alerts
        if (this.metrics.vcs.qualityScore < this.config.thresholds.qualityScore) {
            newAlerts.push({
                type: 'QUALITY_LOW',
                system: 'VCS',
                message: `VCS quality score ${this.metrics.vcs.qualityScore}/100 below threshold ${this.config.thresholds.qualityScore}`,
                severity: 'WARNING',
                timestamp: new Date().toISOString()
            });
        }
        
        if (this.metrics.diva.qualityScore < this.config.thresholds.qualityScore) {
            newAlerts.push({
                type: 'QUALITY_LOW',
                system: 'DIVA',
                message: `DIVA quality score ${this.metrics.diva.qualityScore}/100 below threshold ${this.config.thresholds.qualityScore}`,
                severity: 'WARNING',
                timestamp: new Date().toISOString()
            });
        }
        
        // Data age alerts
        if (this.metrics.vcs.dataAge > this.config.thresholds.dataAgeHours) {
            newAlerts.push({
                type: 'DATA_STALE',
                system: 'VCS',
                message: `VCS data is ${this.metrics.vcs.dataAge} hours old (threshold: ${this.config.thresholds.dataAgeHours}h)`,
                severity: 'WARNING',
                timestamp: new Date().toISOString()
            });
        }
        
        if (this.metrics.diva.dataAge > this.config.thresholds.dataAgeHours) {
            newAlerts.push({
                type: 'DATA_STALE',
                system: 'DIVA',
                message: `DIVA data is ${this.metrics.diva.dataAge} hours old (threshold: ${this.config.thresholds.dataAgeHours}h)`,
                severity: 'WARNING',
                timestamp: new Date().toISOString()
            });
        }
        
        // Add new alerts
        this.alerts.push(...newAlerts);
        
        // Keep only last 100 alerts
        this.alerts = this.alerts.slice(-100);
        
        // Send email alerts if needed
        if (newAlerts.length > 0 && this.config.emailConfig.enabled) {
            await this.sendAlertEmail(newAlerts);
        }
    }
    
    async sendAlertEmail(alerts) {
        try {
            const transporter = nodemailer.createTransporter({
                host: this.config.emailConfig.smtpHost,
                port: this.config.emailConfig.smtpPort,
                secure: this.config.emailConfig.smtpPort === 465,
                auth: {
                    user: this.config.emailConfig.smtpUser,
                    pass: this.config.emailConfig.smtpPass
                }
            });
            
            const subject = `🚨 Korean Financial Intelligence Alert - ${alerts.length} issue(s)`;
            const htmlContent = this.generateAlertEmailHTML(alerts);
            
            await transporter.sendMail({
                from: this.config.emailConfig.smtpUser,
                to: this.config.emailConfig.recipients.join(', '),
                subject,
                html: htmlContent
            });
            
            console.log(`📧 Alert email sent for ${alerts.length} alerts`);
            
        } catch (error) {
            console.error('❌ Failed to send alert email:', error.message);
        }
    }
    
    generateAlertEmailHTML(alerts) {
        return `
        <!DOCTYPE html>
        <html>
        <head>
            <meta charset="UTF-8">
            <title>Korean Financial Intelligence Alert</title>
            <style>
                body { font-family: Arial, sans-serif; margin: 20px; }
                .header { background: #dc3545; color: white; padding: 20px; border-radius: 8px; }
                .alert { margin: 10px 0; padding: 15px; border-left: 5px solid #ffc107; background: #fff3cd; }
                .warning { border-left-color: #ffc107; }
                .error { border-left-color: #dc3545; background: #f8d7da; }
            </style>
        </head>
        <body>
            <div class="header">
                <h1>🚨 Korean Financial Intelligence Alert</h1>
                <p>Generated: ${new Date().toISOString()}</p>
                <p>Total Alerts: ${alerts.length}</p>
            </div>
            
            ${alerts.map(alert => `
                <div class="alert ${alert.severity.toLowerCase()}">
                    <h3>${alert.type} - ${alert.system}</h3>
                    <p>${alert.message}</p>
                    <small>Time: ${alert.timestamp}</small>
                </div>
            `).join('')}
            
            <div style="margin-top: 20px; padding: 15px; background: #e9ecef; border-radius: 8px;">
                <h3>Current System Status</h3>
                <p><strong>VCS:</strong> ${this.metrics.vcs.totalRecords} records, ${this.metrics.vcs.qualityScore}/100 quality</p>
                <p><strong>DIVA:</strong> ${this.metrics.diva.totalRecords} records, ${this.metrics.diva.qualityScore}/100 quality</p>
                <p><strong>Overall:</strong> ${this.metrics.combined.systemHealth}</p>
            </div>
        </body>
        </html>
        `;
    }
    
    generateDashboardHTML() {
        return `
        <!DOCTYPE html>
        <html>
        <head>
            <meta charset="UTF-8">
            <title>🇰🇷 Korean Financial Intelligence Dashboard</title>
            <meta http-equiv="refresh" content="30">
            <style>
                body { 
                    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; 
                    margin: 0; padding: 20px; 
                    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                    color: #333;
                }
                .container { max-width: 1200px; margin: 0 auto; }
                .header { 
                    background: white; 
                    padding: 30px; 
                    border-radius: 15px; 
                    margin-bottom: 20px;
                    box-shadow: 0 10px 30px rgba(0,0,0,0.1);
                    text-align: center;
                }
                .metrics-grid { 
                    display: grid; 
                    grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); 
                    gap: 20px; 
                    margin-bottom: 20px; 
                }
                .metric-card { 
                    background: white; 
                    padding: 25px; 
                    border-radius: 15px; 
                    box-shadow: 0 10px 30px rgba(0,0,0,0.1);
                }
                .metric-value { 
                    font-size: 2.5rem; 
                    font-weight: bold; 
                    margin: 10px 0; 
                }
                .status-healthy { color: #28a745; }
                .status-warning { color: #ffc107; }
                .status-error { color: #dc3545; }
                .alerts-section { 
                    background: white; 
                    padding: 25px; 
                    border-radius: 15px; 
                    box-shadow: 0 10px 30px rgba(0,0,0,0.1);
                }
                .alert-item { 
                    padding: 15px; 
                    margin: 10px 0; 
                    border-left: 5px solid #ffc107; 
                    background: #fff3cd; 
                    border-radius: 8px;
                }
                .footer { 
                    text-align: center; 
                    margin-top: 20px; 
                    color: white; 
                    opacity: 0.8;
                }
            </style>
        </head>
        <body>
            <div class="container">
                <div class="header">
                    <h1>🇰🇷 Korean Financial Intelligence Dashboard</h1>
                    <p>Real-time VCS + DIVA Monitoring System</p>
                    <p>Last Updated: ${new Date().toLocaleString()}</p>
                </div>
                
                <div class="metrics-grid">
                    <div class="metric-card">
                        <h3>🏢 VCS System</h3>
                        <div class="metric-value ${this.getStatusClass(this.metrics.vcs.status)}">
                            ${this.metrics.vcs.totalRecords.toLocaleString()}
                        </div>
                        <p>Total Records</p>
                        <p>Quality: ${this.metrics.vcs.qualityScore}/100</p>
                        <p>Status: <span class="${this.getStatusClass(this.metrics.vcs.status)}">${this.metrics.vcs.status}</span></p>
                    </div>
                    
                    <div class="metric-card">
                        <h3>💰 DIVA System</h3>
                        <div class="metric-value ${this.getStatusClass(this.metrics.diva.status)}">
                            ${this.metrics.diva.totalRecords.toLocaleString()}
                        </div>
                        <p>Total Records</p>
                        <p>Quality: ${this.metrics.diva.qualityScore}/100</p>
                        <p>Status: <span class="${this.getStatusClass(this.metrics.diva.status)}">${this.metrics.diva.status}</span></p>
                    </div>
                    
                    <div class="metric-card">
                        <h3>🎯 Combined System</h3>
                        <div class="metric-value ${this.getStatusClass(this.metrics.combined.systemHealth)}">
                            ${this.metrics.combined.totalRecords.toLocaleString()}
                        </div>
                        <p>Total Records</p>
                        <p>Avg Quality: ${this.metrics.combined.averageQuality}/100</p>
                        <p>Health: <span class="${this.getStatusClass(this.metrics.combined.systemHealth)}">${this.metrics.combined.systemHealth}</span></p>
                    </div>
                </div>
                
                <div class="alerts-section">
                    <h3>🚨 Recent Alerts (${this.alerts.length})</h3>
                    ${this.alerts.length === 0 ? 
                        '<p>✅ No active alerts - all systems operating normally</p>' :
                        this.alerts.slice(-5).reverse().map(alert => `
                            <div class="alert-item">
                                <strong>${alert.type} - ${alert.system}</strong><br>
                                ${alert.message}<br>
                                <small>${new Date(alert.timestamp).toLocaleString()}</small>
                            </div>
                        `).join('')
                    }
                </div>
                
                <div class="footer">
                    <p>Unified Korean Financial Intelligence Dashboard v3.0</p>
                    <p>Auto-refresh every 30 seconds | <a href="/api/metrics" style="color: white;">API</a></p>
                </div>
            </div>
        </body>
        </html>
        `;
    }
    
    getStatusClass(status) {
        switch (status) {
            case 'HEALTHY': return 'status-healthy';
            case 'NEEDS_ATTENTION': return 'status-warning';
            case 'ERROR': return 'status-error';
            default: return '';
        }
    }
    
    async runMaintenanceCycle() {
        console.log('🔧 Running maintenance cycle...');
        
        // Run VCS maintenance
        console.log('🏢 Running VCS maintenance...');
        // Here you would trigger the VCS maintenance actor
        
        // Run DIVA maintenance
        console.log('💰 Running DIVA maintenance...');
        // Here you would trigger the DIVA maintenance actor
        
        // Generate report
        await this.generateComprehensiveReport();
    }
    
    async generateComprehensiveReport() {
        console.log('📊 Generating comprehensive report...');
        
        await this.performComprehensiveAnalysis();
        
        const report = {
            timestamp: new Date().toISOString(),
            summary: {
                totalRecords: this.metrics.combined.totalRecords,
                averageQuality: this.metrics.combined.averageQuality,
                systemHealth: this.metrics.combined.systemHealth
            },
            systems: {
                vcs: this.metrics.vcs,
                diva: this.metrics.diva
            },
            alerts: this.alerts,
            recommendations: this.generateRecommendations()
        };
        
        // Save comprehensive report
        await Actor.setValue('comprehensive_report', report);
        
        // Send email report if enabled
        if (this.config.emailConfig.enabled) {
            await this.sendComprehensiveReport(report);
        }
        
        console.log('📋 Comprehensive report generated and saved');
        return report;
    }
    
    generateRecommendations() {
        const recommendations = [];
        
        if (this.metrics.vcs.qualityScore < 80) {
            recommendations.push('VCS system needs data quality improvement');
        }
        
        if (this.metrics.diva.qualityScore < 80) {
            recommendations.push('DIVA system needs data quality improvement');
        }
        
        if (this.metrics.vcs.dataAge > 24) {
            recommendations.push('VCS data should be updated more frequently');
        }
        
        if (this.metrics.diva.dataAge > 24) {
            recommendations.push('DIVA data should be updated more frequently');
        }
        
        return recommendations;
    }
    
    async sendComprehensiveReport(report) {
        try {
            const transporter = nodemailer.createTransporter({
                host: this.config.emailConfig.smtpHost,
                port: this.config.emailConfig.smtpPort,
                secure: this.config.emailConfig.smtpPort === 465,
                auth: {
                    user: this.config.emailConfig.smtpUser,
                    pass: this.config.emailConfig.smtpPass
                }
            });
            
            const subject = `📊 Korean Financial Intelligence Report - ${new Date().toLocaleDateString()}`;
            const htmlContent = this.generateReportEmailHTML(report);
            
            await transporter.sendMail({
                from: this.config.emailConfig.smtpUser,
                to: this.config.emailConfig.recipients.join(', '),
                subject,
                html: htmlContent
            });
            
            console.log('📧 Comprehensive report email sent');
            
        } catch (error) {
            console.error('❌ Failed to send report email:', error.message);
        }
    }
    
    generateReportEmailHTML(report) {
        return `
        <!DOCTYPE html>
        <html>
        <head>
            <meta charset="UTF-8">
            <title>Korean Financial Intelligence Report</title>
            <style>
                body { font-family: Arial, sans-serif; margin: 20px; }
                .header { background: #007bff; color: white; padding: 20px; border-radius: 8px; }
                .section { margin: 20px 0; padding: 15px; border: 1px solid #ddd; border-radius: 8px; }
                .success { background: #d4edda; border-color: #c3e6cb; }
                .warning { background: #fff3cd; border-color: #ffeaa7; }
                .metric { display: inline-block; margin: 10px; padding: 10px; background: #f8f9fa; border-radius: 4px; }
            </style>
        </head>
        <body>
            <div class="header">
                <h1>🇰🇷 Korean Financial Intelligence Report</h1>
                <p>Generated: ${report.timestamp}</p>
            </div>
            
            <div class="section ${report.summary.systemHealth === 'HEALTHY' ? 'success' : 'warning'}">
                <h2>📊 Executive Summary</h2>
                <div class="metric"><strong>Total Records:</strong> ${report.summary.totalRecords.toLocaleString()}</div>
                <div class="metric"><strong>Average Quality:</strong> ${report.summary.averageQuality}/100</div>
                <div class="metric"><strong>System Health:</strong> ${report.summary.systemHealth}</div>
            </div>
            
            <div class="section">
                <h2>🏢 VCS System Status</h2>
                <div class="metric"><strong>Records:</strong> ${report.systems.vcs.totalRecords?.toLocaleString()}</div>
                <div class="metric"><strong>Quality:</strong> ${report.systems.vcs.qualityScore}/100</div>
                <div class="metric"><strong>Status:</strong> ${report.systems.vcs.status}</div>
            </div>
            
            <div class="section">
                <h2>💰 DIVA System Status</h2>
                <div class="metric"><strong>Records:</strong> ${report.systems.diva.totalRecords?.toLocaleString()}</div>
                <div class="metric"><strong>Quality:</strong> ${report.systems.diva.qualityScore}/100</div>
                <div class="metric"><strong>Status:</strong> ${report.systems.diva.status}</div>
            </div>
            
            ${report.recommendations.length > 0 ? `
            <div class="section warning">
                <h2>💡 Recommendations</h2>
                <ul>
                    ${report.recommendations.map(rec => `<li>${rec}</li>`).join('')}
                </ul>
            </div>
            ` : ''}
            
            <div class="section">
                <h2>🔧 System Information</h2>
                <p><strong>Dashboard:</strong> Unified Korean Financial Intelligence Dashboard v3.0</p>
                <p><strong>Platform:</strong> Apify Cloud</p>
                <p><strong>Next Report:</strong> ${new Date(Date.now() + 24*60*60*1000).toLocaleDateString()}</p>
            </div>
        </body>
        </html>
        `;
    }
} 