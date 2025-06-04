/**
 * 📈 COMPREHENSIVE TREND REPORTER
 * ==============================
 * 
 * Combines AI insights from PDF analysis with live scraped data to generate
 * comprehensive investment trend reports:
 * - Cross-reference PDF AI insights with current market data
 * - Generate actionable investment recommendations
 * - Track trend changes over time
 * - Identify emerging opportunities and risks
 * 
 * ULTIMATE VALUE: Turn multiple data sources into strategic intelligence
 */

require('dotenv').config();
const fs = require('fs');
const path = require('path');
const { createClient } = require('@supabase/supabase-js');
const OpenAI = require('openai');

// Configuration
const CONFIG = {
    // Report Configuration
    reports: {
        outputDir: './trend_reports',
        formats: ['json', 'markdown', 'html'],
        updateFrequency: 'weekly' // daily, weekly, monthly
    },
    
    // Analysis Parameters
    analysis: {
        lookbackPeriod: 365, // days
        confidenceThreshold: 0.7,
        minimumDataPoints: 3,
        trendSignificanceThreshold: 0.1 // 10% change threshold
    },
    
    // OpenAI Configuration for trend synthesis
    openai: {
        model: 'gpt-4-turbo-preview',
        maxTokens: 3000,
        temperature: 0.2
    },
    
    // Report Categories
    reportTypes: [
        'market_overview',
        'sector_analysis', 
        'fund_performance',
        'emerging_opportunities',
        'risk_assessment',
        'investment_recommendations'
    ]
};

// Initialize clients
const supabaseUrl = process.env.SUPABASE_URL || 'https://udfgtccxbqmalgpqyxzz.supabase.co';
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY;
const openaiKey = process.env.OPENAI_API_KEY;

if (!supabaseKey || !openaiKey) {
    console.error('❌ Required environment variables missing');
    console.log('💡 Required: SUPABASE_SERVICE_ROLE_KEY, OPENAI_API_KEY');
    process.exit(1);
}

const supabase = createClient(supabaseUrl, supabaseKey);
const openai = new OpenAI({ apiKey: openaiKey });

console.log('📈 Comprehensive Trend Reporter Started');

/**
 * Fetch PDF AI insights from database
 */
async function fetchPDFInsights() {
    try {
        console.log('🤖 Fetching AI insights from PDF analysis...');
        
        const { data: pdfInsights, error } = await supabase
            .from('pdf_analysis_results')
            .select(`
                fund_source,
                report_year,
                investment_summary,
                portfolio_performance,
                market_trends,
                future_outlook,
                trend_report,
                processed_at
            `)
            .eq('extraction_success', true)
            .order('processed_at', { ascending: false });
        
        if (error) throw error;
        
        console.log(`✅ Retrieved ${pdfInsights?.length || 0} PDF analysis results`);
        return pdfInsights || [];
        
    } catch (error) {
        console.error('❌ Error fetching PDF insights:', error.message);
        return [];
    }
}

/**
 * Fetch live scraped fund data
 */
async function fetchScrapedFundData() {
    try {
        console.log('🔄 Fetching live scraped fund data...');
        
        // Get KDB Fund of Funds data
        const { data: kdbData, error: kdbError } = await supabase
            .from('kdb_fund_of_funds_raw')
            .select('*')
            .order('extracted_at', { ascending: false })
            .limit(1000);
        
        // Get K-Growth Fund of Funds data  
        const { data: kgrowthData, error: kgrowthError } = await supabase
            .from('kgrowth_fund_of_funds_raw')
            .select('*')
            .order('extracted_at', { ascending: false })
            .limit(1000);
        
        // Get KVIC data
        const { data: kvicData, error: kvicError } = await supabase
            .from('kvic_investment_raw')
            .select('*')
            .order('extracted_at', { ascending: false })
            .limit(1000);
        
        if (kdbError || kgrowthError || kvicError) {
            console.log('⚠️ Some data sources had errors, continuing with available data');
        }
        
        const scrapedData = {
            kdb: kdbData || [],
            kgrowth: kgrowthData || [],
            kvic: kvicData || []
        };
        
        const totalRecords = Object.values(scrapedData).reduce((sum, arr) => sum + arr.length, 0);
        console.log(`✅ Retrieved ${totalRecords} live scraped records`);
        
        return scrapedData;
        
    } catch (error) {
        console.error('❌ Error fetching scraped data:', error.message);
        return { kdb: [], kgrowth: [], kvic: [] };
    }
}

/**
 * Analyze market trends from combined data
 */
async function analyzeMarketTrends(pdfInsights, scrapedData) {
    try {
        console.log('📊 Analyzing market trends...');
        
        // Extract key metrics from PDF insights
        const pdfTrends = pdfInsights.map(insight => ({
            source: insight.fund_source,
            year: insight.report_year,
            market_outlook: insight.market_trends?.market_outlook,
            hot_sectors: insight.market_trends?.hot_sectors,
            investment_volume: insight.investment_summary?.total_investments,
            performance_irr: insight.portfolio_performance?.irr,
            growth_rate: insight.portfolio_performance?.year_over_year_growth
        }));
        
        // Analyze live data trends
        const currentTrends = {
            total_active_funds: {
                kdb: scrapedData.kdb.length,
                kgrowth: scrapedData.kgrowth.length,
                kvic: scrapedData.kvic.length
            },
            recent_activity: {
                kdb: scrapedData.kdb.filter(d => 
                    new Date(d.extracted_at) > new Date(Date.now() - 30*24*60*60*1000)
                ).length,
                kgrowth: scrapedData.kgrowth.filter(d => 
                    new Date(d.extracted_at) > new Date(Date.now() - 30*24*60*60*1000)
                ).length
            },
            sector_distribution: analyzeSectorDistribution(scrapedData)
        };
        
        return {
            historical_trends: pdfTrends,
            current_market: currentTrends,
            analysis_date: new Date().toISOString()
        };
        
    } catch (error) {
        console.error('❌ Error analyzing market trends:', error.message);
        return null;
    }
}

/**
 * Analyze sector distribution from scraped data
 */
function analyzeSectorDistribution(scrapedData) {
    const sectors = {};
    
    // Analyze KDB sectors
    scrapedData.kdb.forEach(fund => {
        if (fund.sector_focus) {
            sectors[fund.sector_focus] = (sectors[fund.sector_focus] || 0) + 1;
        }
    });
    
    // Analyze K-Growth sectors
    scrapedData.kgrowth.forEach(fund => {
        if (fund.sector_focus) {
            sectors[fund.sector_focus] = (sectors[fund.sector_focus] || 0) + 1;
        }
    });
    
    // Analyze KVIC sectors
    scrapedData.kvic.forEach(investment => {
        if (investment.company_sector) {
            sectors[investment.company_sector] = (sectors[investment.company_sector] || 0) + 1;
        }
    });
    
    // Sort by frequency
    return Object.entries(sectors)
        .sort(([,a], [,b]) => b - a)
        .slice(0, 10) // Top 10 sectors
        .map(([sector, count]) => ({ sector, count }));
}

/**
 * Generate AI-powered trend synthesis
 */
async function generateTrendSynthesis(trendData) {
    try {
        console.log('🤖 Generating AI trend synthesis...');
        
        const synthesisPrompt = `
Based on this comprehensive Korean VC market data, generate a strategic investment trend report:

HISTORICAL INSIGHTS (from Fund of Funds annual reports):
${JSON.stringify(trendData.historical_trends, null, 2)}

CURRENT MARKET DATA (live scraped data):
${JSON.stringify(trendData.current_market, null, 2)}

REQUIRED OUTPUT FORMAT (JSON):
{
    "executive_summary": "3-sentence overview of Korean VC market trends",
    "key_trends": [
        {
            "trend": "trend name",
            "direction": "increasing/decreasing/stable", 
            "significance": "high/medium/low",
            "description": "detailed description",
            "timeframe": "current/short-term/long-term"
        }
    ],
    "sector_insights": [
        {
            "sector": "sector name",
            "status": "hot/stable/declining",
            "opportunity_level": "high/medium/low",
            "rationale": "explanation"
        }
    ],
    "investment_recommendations": [
        {
            "recommendation": "specific recommendation",
            "rationale": "why this recommendation",
            "urgency": "immediate/short-term/long-term",
            "risk_level": "low/medium/high"
        }
    ],
    "market_outlook": {
        "6_months": "outlook description",
        "12_months": "outlook description", 
        "24_months": "outlook description"
    },
    "risk_factors": [
        "risk factor 1",
        "risk factor 2", 
        "risk factor 3"
    ]
}
`;
        
        const response = await openai.chat.completions.create({
            model: CONFIG.openai.model,
            messages: [
                {
                    role: "system",
                    content: "You are a senior investment analyst specializing in Korean venture capital markets. Provide strategic insights based on both historical trends and current market data."
                },
                {
                    role: "user",
                    content: synthesisPrompt
                }
            ],
            max_tokens: CONFIG.openai.maxTokens,
            temperature: CONFIG.openai.temperature
        });
        
        const synthesis = response.choices[0].message.content;
        
        try {
            return JSON.parse(synthesis);
        } catch (parseError) {
            console.log('⚠️ AI response not valid JSON, returning raw text');
            return { raw_synthesis: synthesis };
        }
        
    } catch (error) {
        console.error('❌ Error generating trend synthesis:', error.message);
        return null;
    }
}

/**
 * Generate comprehensive trend report
 */
async function generateTrendReport() {
    console.log('\n🚀 === GENERATING COMPREHENSIVE TREND REPORT ===');
    
    const startTime = Date.now();
    
    try {
        // Ensure output directory exists
        if (!fs.existsSync(CONFIG.reports.outputDir)) {
            fs.mkdirSync(CONFIG.reports.outputDir, { recursive: true });
            console.log(`📁 Created reports directory: ${CONFIG.reports.outputDir}`);
        }
        
        // Fetch all data sources
        console.log('📥 Gathering data from all sources...');
        const [pdfInsights, scrapedData] = await Promise.all([
            fetchPDFInsights(),
            fetchScrapedFundData()
        ]);
        
        // Analyze trends
        const trendData = await analyzeMarketTrends(pdfInsights, scrapedData);
        if (!trendData) {
            throw new Error('Failed to analyze market trends');
        }
        
        // Generate AI synthesis
        const aiSynthesis = await generateTrendSynthesis(trendData);
        
        // Compile comprehensive report
        const report = {
            report_metadata: {
                generated_at: new Date().toISOString(),
                report_type: 'comprehensive_trend_analysis',
                data_sources: ['PDF_AI_Analysis', 'KDB_FoF', 'K-Growth_FoF', 'KVIC_API'],
                analysis_period: `${CONFIG.analysis.lookbackPeriod} days`,
                ai_model: CONFIG.openai.model
            },
            
            data_summary: {
                pdf_insights_count: pdfInsights.length,
                live_data_points: Object.values(scrapedData).reduce((sum, arr) => sum + arr.length, 0),
                coverage: {
                    kdb_funds: scrapedData.kdb.length,
                    kgrowth_funds: scrapedData.kgrowth.length,
                    kvic_investments: scrapedData.kvic.length
                }
            },
            
            trend_analysis: trendData,
            ai_synthesis: aiSynthesis,
            
            recommendations: {
                immediate_actions: extractImmediateActions(aiSynthesis),
                monitoring_areas: extractMonitoringAreas(trendData),
                strategic_considerations: extractStrategicConsiderations(aiSynthesis)
            }
        };
        
        // Save report in multiple formats
        const timestamp = new Date().toISOString().split('T')[0];
        const reportBaseName = `korean_vc_trend_report_${timestamp}`;
        
        // Save JSON
        const jsonPath = path.join(CONFIG.reports.outputDir, `${reportBaseName}.json`);
        fs.writeFileSync(jsonPath, JSON.stringify(report, null, 2));
        
        // Save Markdown
        const markdownPath = path.join(CONFIG.reports.outputDir, `${reportBaseName}.md`);
        fs.writeFileSync(markdownPath, generateMarkdownReport(report));
        
        const duration = (Date.now() - startTime) / 1000;
        
        console.log('\n🎉 === TREND REPORT GENERATED ===');
        console.log(`📄 JSON Report: ${jsonPath}`);
        console.log(`📝 Markdown Report: ${markdownPath}`);
        console.log(`📊 Data Sources: ${report.data_summary.live_data_points} live records + ${report.data_summary.pdf_insights_count} AI insights`);
        console.log(`⏱️ Generation Time: ${duration.toFixed(2)} seconds`);
        
        // Save to database
        await saveTrendReportToDatabase(report);
        
        return report;
        
    } catch (error) {
        console.error('💥 Error generating trend report:', error.message);
        throw error;
    }
}

/**
 * Extract immediate actions from AI synthesis
 */
function extractImmediateActions(aiSynthesis) {
    if (!aiSynthesis?.investment_recommendations) return [];
    
    return aiSynthesis.investment_recommendations
        .filter(rec => rec.urgency === 'immediate')
        .map(rec => rec.recommendation);
}

/**
 * Extract monitoring areas from trend data
 */
function extractMonitoringAreas(trendData) {
    const areas = [];
    
    // Monitor top sectors
    if (trendData.current_market?.sector_distribution) {
        areas.push(`Top growing sectors: ${trendData.current_market.sector_distribution.slice(0,3).map(s => s.sector).join(', ')}`);
    }
    
    // Monitor fund activity
    if (trendData.current_market?.recent_activity) {
        areas.push('Recent fund activity levels');
        areas.push('New fund launches and closures');
    }
    
    return areas;
}

/**
 * Extract strategic considerations
 */
function extractStrategicConsiderations(aiSynthesis) {
    const considerations = [];
    
    if (aiSynthesis?.market_outlook) {
        considerations.push(`12-month outlook: ${aiSynthesis.market_outlook['12_months']}`);
    }
    
    if (aiSynthesis?.risk_factors) {
        considerations.push(`Key risks: ${aiSynthesis.risk_factors.slice(0,2).join(', ')}`);
    }
    
    return considerations;
}

/**
 * Generate Markdown format report
 */
function generateMarkdownReport(report) {
    const md = `# Korean VC Market Trend Report

**Generated:** ${report.report_metadata.generated_at}
**Analysis Period:** ${report.report_metadata.analysis_period}

## Executive Summary

${report.ai_synthesis?.executive_summary || 'Analysis in progress...'}

## Data Coverage

- **PDF Insights:** ${report.data_summary.pdf_insights_count} reports analyzed
- **Live Data:** ${report.data_summary.live_data_points} current records
- **KDB Funds:** ${report.data_summary.coverage.kdb_funds}
- **K-Growth Funds:** ${report.data_summary.coverage.kgrowth_funds}
- **KVIC Investments:** ${report.data_summary.coverage.kvic_investments}

## Key Trends

${report.ai_synthesis?.key_trends?.map(trend => 
    `### ${trend.trend} (${trend.significance} significance)
**Direction:** ${trend.direction}
**Timeframe:** ${trend.timeframe}

${trend.description}`
).join('\n\n') || 'Trend analysis in progress...'}

## Investment Recommendations

${report.ai_synthesis?.investment_recommendations?.map(rec => 
    `### ${rec.recommendation}
**Urgency:** ${rec.urgency}
**Risk Level:** ${rec.risk_level}

${rec.rationale}`
).join('\n\n') || 'Recommendations being generated...'}

## Market Outlook

${report.ai_synthesis?.market_outlook ? Object.entries(report.ai_synthesis.market_outlook).map(([period, outlook]) => 
    `**${period.replace('_', ' ')}:** ${outlook}`
).join('\n\n') : 'Outlook analysis in progress...'}

---
*Report generated by Korean VC Intelligence System*
`;
    
    return md;
}

/**
 * Save trend report to database
 */
async function saveTrendReportToDatabase(report) {
    try {
        console.log('💾 Saving trend report to database...');
        
        const record = {
            report_date: new Date().toISOString().split('T')[0],
            report_type: 'comprehensive_trend_analysis',
            report_data: report,
            data_sources: report.report_metadata.data_sources,
            generated_at: report.report_metadata.generated_at,
            ai_model: report.report_metadata.ai_model
        };
        
        const { error } = await supabase
            .from('trend_reports')
            .upsert([record], {
                onConflict: 'report_date,report_type',
                ignoreDuplicates: false
            });
        
        if (error) {
            console.error('❌ Database save error:', error);
        } else {
            console.log('✅ Trend report saved to database');
        }
        
    } catch (error) {
        console.error('❌ Error saving to database:', error.message);
    }
}

// Execute if run directly
if (require.main === module) {
    (async () => {
        try {
            await generateTrendReport();
            console.log('✅ Comprehensive trend report generation completed!');
        } catch (error) {
            console.error('💥 Trend report generation failed:', error);
            process.exit(1);
        }
    })();
}

module.exports = {
    generateTrendReport,
    fetchPDFInsights,
    fetchScrapedFundData,
    analyzeMarketTrends,
    generateTrendSynthesis,
    CONFIG
}; 