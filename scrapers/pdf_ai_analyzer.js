/**
 * 📊 PDF AI ANALYZER - FUND OF FUNDS ANNUAL REPORTS
 * =================================================
 * 
 * AI-powered analysis of Korean Fund of Funds annual reports:
 * - KDB (Korea Development Bank) annual investment reports
 * - K-Growth annual performance reports
 * - OpenAI-powered content extraction and summarization
 * - Trend analysis and insights generation
 * - Structured data extraction for database storage
 * 
 * ULTIMATE VALUE: Transform unstructured PDF reports into actionable intelligence
 */

require('dotenv').config();
const fs = require('fs');
const path = require('path');
const { createClient } = require('@supabase/supabase-js');
const OpenAI = require('openai');
const pdf = require('pdf-parse');

// Configuration
const CONFIG = {
    // OpenAI Configuration
    openai: {
        model: 'gpt-4-turbo-preview',
        maxTokens: 4000,
        temperature: 0.1 // Low temperature for factual extraction
    },
    
    // PDF Processing
    pdfDir: './pdf_reports',
    supportedFormats: ['.pdf'],
    maxFileSize: 50 * 1024 * 1024, // 50MB max
    
    // Analysis Categories
    analysisTypes: [
        'investment_summary',
        'portfolio_performance', 
        'market_trends',
        'risk_assessment',
        'future_outlook',
        'sector_analysis',
        'geographic_allocation',
        'exit_activity'
    ],
    
    // Fund Sources
    fundSources: {
        'KDB': {
            name: 'Korea Development Bank',
            type: 'Government Fund of Funds',
            reportTypes: ['Annual Report', 'Investment Report', 'Performance Report']
        },
        'K-Growth': {
            name: 'K-Growth Fund of Funds',
            type: 'Private Fund of Funds',
            reportTypes: ['Annual Report', 'Portfolio Update', 'Market Analysis']
        }
    }
};

// Initialize clients
const supabaseUrl = process.env.SUPABASE_URL || 'https://udfgtccxbqmalgpqyxzz.supabase.co';
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY;
const openaiKey = process.env.OPENAI_API_KEY;

if (!supabaseKey) {
    console.error('❌ SUPABASE_SERVICE_ROLE_KEY environment variable is required');
    process.exit(1);
}

if (!openaiKey) {
    console.error('❌ OPENAI_API_KEY environment variable is required');
    console.log('💡 Get your API key from: https://platform.openai.com/api-keys');
    process.exit(1);
}

const supabase = createClient(supabaseUrl, supabaseKey);
const openai = new OpenAI({ apiKey: openaiKey });

console.log('🤖 PDF AI Analyzer Started');
console.log(`🎯 Target: Korean Fund of Funds Annual Reports (KDB & K-Growth)`);

/**
 * Extract text content from PDF file
 */
async function extractPDFText(filePath) {
    try {
        console.log(`📄 Extracting text from: ${path.basename(filePath)}`);
        
        const fileStats = fs.statSync(filePath);
        if (fileStats.size > CONFIG.maxFileSize) {
            throw new Error(`File too large: ${fileStats.size} bytes (max: ${CONFIG.maxFileSize})`);
        }
        
        const dataBuffer = fs.readFileSync(filePath);
        const pdfData = await pdf(dataBuffer);
        
        console.log(`✅ Extracted ${pdfData.text.length} characters from PDF`);
        console.log(`📊 PDF Info: ${pdfData.numpages} pages`);
        
        return {
            text: pdfData.text,
            pages: pdfData.numpages,
            info: pdfData.info,
            metadata: pdfData.metadata
        };
        
    } catch (error) {
        console.error(`❌ Error extracting PDF text: ${error.message}`);
        throw error;
    }
}

/**
 * Analyze PDF content with OpenAI
 */
async function analyzeWithOpenAI(text, fileName, analysisType) {
    try {
        console.log(`🤖 Analyzing with OpenAI: ${analysisType} for ${fileName}`);
        
        const prompts = {
            investment_summary: `
Analyze this Korean Fund of Funds annual report and extract key investment metrics:

REQUIRED OUTPUT FORMAT (JSON):
{
    "total_investments": "amount in KRW",
    "number_of_funds": "count",
    "number_of_companies": "count", 
    "top_sectors": ["sector1", "sector2", "sector3"],
    "investment_stages": {"seed": "amount", "early": "amount", "growth": "amount"},
    "geographic_distribution": {"domestic": "percentage", "international": "percentage"},
    "key_highlights": ["highlight1", "highlight2", "highlight3"]
}

Report text:
${text.substring(0, 8000)}
`,
            
            portfolio_performance: `
Extract portfolio performance data from this Korean Fund of Funds report:

REQUIRED OUTPUT FORMAT (JSON):
{
    "total_portfolio_value": "amount in KRW",
    "realized_returns": "amount in KRW",
    "unrealized_gains": "amount in KRW",
    "irr": "percentage",
    "multiple": "x.xx",
    "successful_exits": "count",
    "ipo_exits": "count",
    "ma_exits": "count",
    "top_performing_investments": ["company1", "company2", "company3"],
    "underperforming_investments": ["company1", "company2"],
    "year_over_year_growth": "percentage"
}

Report text:
${text.substring(0, 8000)}
`,
            
            market_trends: `
Identify market trends and insights from this Korean Fund of Funds report:

REQUIRED OUTPUT FORMAT (JSON):
{
    "market_outlook": "positive/neutral/negative",
    "hot_sectors": ["sector1", "sector2", "sector3"],
    "emerging_trends": ["trend1", "trend2", "trend3"],
    "risk_factors": ["risk1", "risk2", "risk3"],
    "investment_themes": ["theme1", "theme2", "theme3"],
    "market_size_estimates": {"total_market": "amount", "addressable_market": "amount"},
    "competitive_landscape": "description",
    "regulatory_changes": ["change1", "change2"]
}

Report text:
${text.substring(0, 8000)}
`,
            
            future_outlook: `
Extract future outlook and strategic direction from this Korean Fund of Funds report:

REQUIRED OUTPUT FORMAT (JSON):
{
    "investment_strategy": "description",
    "target_sectors": ["sector1", "sector2", "sector3"],
    "geographic_expansion": "plans",
    "fund_size_targets": "amount in KRW",
    "expected_returns": "percentage",
    "risk_management": "approach",
    "esg_focus": "description",
    "technology_focus": ["tech1", "tech2", "tech3"],
    "timeline": "years",
    "challenges": ["challenge1", "challenge2"]
}

Report text:
${text.substring(0, 8000)}
`
        };
        
        const prompt = prompts[analysisType] || prompts.investment_summary;
        
        const response = await openai.chat.completions.create({
            model: CONFIG.openai.model,
            messages: [
                {
                    role: "system",
                    content: "You are an expert financial analyst specializing in Korean venture capital and private equity. Extract accurate data from Fund of Funds reports and provide structured JSON responses. Handle Korean text appropriately."
                },
                {
                    role: "user", 
                    content: prompt
                }
            ],
            max_tokens: CONFIG.openai.maxTokens,
            temperature: CONFIG.openai.temperature
        });
        
        const analysis = response.choices[0].message.content;
        console.log(`✅ OpenAI analysis completed (${analysis.length} characters)`);
        
        // Try to parse as JSON
        try {
            const jsonAnalysis = JSON.parse(analysis);
            return {
                type: analysisType,
                content: jsonAnalysis,
                raw_response: analysis,
                success: true
            };
        } catch (parseError) {
            console.log(`⚠️ Response not valid JSON, storing as text`);
            return {
                type: analysisType,
                content: analysis,
                raw_response: analysis,
                success: true,
                format: 'text'
            };
        }
        
    } catch (error) {
        console.error(`❌ OpenAI analysis failed: ${error.message}`);
        return {
            type: analysisType,
            content: null,
            error: error.message,
            success: false
        };
    }
}

/**
 * Generate comprehensive trend report
 */
async function generateTrendReport(analyses, fileName, fundSource) {
    try {
        console.log(`📈 Generating trend report for ${fileName}`);
        
        const trendPrompt = `
Based on these extracted insights from a ${fundSource} annual report, generate a comprehensive trend analysis:

INSIGHTS:
${JSON.stringify(analyses, null, 2)}

REQUIRED OUTPUT FORMAT (JSON):
{
    "executive_summary": "key findings in 2-3 sentences",
    "investment_trends": {
        "volume_trend": "increasing/decreasing/stable",
        "sector_shifts": ["from sector A to sector B"],
        "stage_preferences": "description",
        "geographic_changes": "description"
    },
    "performance_insights": {
        "returns_trend": "description", 
        "success_rate": "percentage or description",
        "exit_activity": "description",
        "risk_profile": "description"
    },
    "market_dynamics": {
        "growth_drivers": ["driver1", "driver2"],
        "headwinds": ["challenge1", "challenge2"],
        "opportunities": ["opportunity1", "opportunity2"]
    },
    "strategic_implications": {
        "investment_recommendations": ["rec1", "rec2"],
        "risk_mitigation": ["strategy1", "strategy2"],
        "portfolio_optimization": "suggestions"
    },
    "outlook": {
        "short_term": "6-12 months",
        "medium_term": "1-3 years", 
        "long_term": "3+ years"
    }
}
`;
        
        const response = await openai.chat.completions.create({
            model: CONFIG.openai.model,
            messages: [
                {
                    role: "system",
                    content: "You are a senior investment strategist providing trend analysis for Korean Fund of Funds. Generate actionable insights and strategic recommendations."
                },
                {
                    role: "user",
                    content: trendPrompt
                }
            ],
            max_tokens: CONFIG.openai.maxTokens,
            temperature: 0.2
        });
        
        const trendReport = response.choices[0].message.content;
        
        try {
            return JSON.parse(trendReport);
        } catch (parseError) {
            return { raw_trend_report: trendReport };
        }
        
    } catch (error) {
        console.error(`❌ Trend report generation failed: ${error.message}`);
        return { error: error.message };
    }
}

/**
 * Save analysis results to database
 */
async function saveAnalysisResults(fileName, fundSource, pdfInfo, analyses, trendReport) {
    try {
        console.log(`💾 Saving analysis results for ${fileName}`);
        
        const record = {
            file_name: fileName,
            fund_source: fundSource,
            report_type: 'Annual Report',
            
            // PDF metadata
            pdf_pages: pdfInfo.pages,
            pdf_info: pdfInfo.info,
            
            // AI Analysis results
            investment_summary: analyses.find(a => a.type === 'investment_summary')?.content,
            portfolio_performance: analyses.find(a => a.type === 'portfolio_performance')?.content,
            market_trends: analyses.find(a => a.type === 'market_trends')?.content,
            future_outlook: analyses.find(a => a.type === 'future_outlook')?.content,
            
            // Trend report
            trend_report: trendReport,
            
            // Metadata
            processed_at: new Date().toISOString(),
            ai_model: CONFIG.openai.model,
            analysis_version: '1.0'
        };
        
        const { data, error } = await supabase
            .from('pdf_analysis_results')
            .upsert([record], {
                onConflict: 'file_name,fund_source',
                ignoreDuplicates: false
            });
        
        if (error) {
            console.error(`❌ Database save error:`, error);
            throw error;
        }
        
        console.log(`✅ Analysis results saved to database`);
        return { success: true };
        
    } catch (error) {
        console.error(`❌ Error saving analysis results: ${error.message}`);
        return { success: false, error: error.message };
    }
}

/**
 * Process a single PDF file
 */
async function processPDFFile(filePath) {
    const fileName = path.basename(filePath);
    console.log(`\n📄 === PROCESSING PDF: ${fileName} ===`);
    
    try {
        // Determine fund source from filename
        let fundSource = 'Unknown';
        if (fileName.toLowerCase().includes('kdb') || fileName.toLowerCase().includes('korea development')) {
            fundSource = 'KDB';
        } else if (fileName.toLowerCase().includes('kgrowth') || fileName.toLowerCase().includes('k-growth')) {
            fundSource = 'K-Growth';
        }
        
        // Extract PDF text
        const pdfInfo = await extractPDFText(filePath);
        
        // Run multiple analysis types
        const analyses = [];
        for (const analysisType of CONFIG.analysisTypes.slice(0, 4)) { // Process first 4 types
            const analysis = await analyzeWithOpenAI(pdfInfo.text, fileName, analysisType);
            analyses.push(analysis);
            
            // Rate limiting for OpenAI API
            await new Promise(resolve => setTimeout(resolve, 1000));
        }
        
        // Generate comprehensive trend report
        const trendReport = await generateTrendReport(analyses, fileName, fundSource);
        
        // Save results to database
        await saveAnalysisResults(fileName, fundSource, pdfInfo, analyses, trendReport);
        
        console.log(`✅ Successfully processed ${fileName}`);
        return { success: true, fileName, analyses: analyses.length };
        
    } catch (error) {
        console.error(`❌ Error processing ${fileName}: ${error.message}`);
        return { success: false, fileName, error: error.message };
    }
}

/**
 * Main PDF analysis function
 */
async function analyzePDFReports() {
    console.log('\n🚀 === STARTING PDF AI ANALYSIS ===');
    
    const startTime = Date.now();
    let totalProcessed = 0;
    let totalErrors = 0;
    
    try {
        // Ensure PDF directory exists
        if (!fs.existsSync(CONFIG.pdfDir)) {
            fs.mkdirSync(CONFIG.pdfDir, { recursive: true });
            console.log(`📁 Created PDF reports directory: ${CONFIG.pdfDir}`);
            console.log(`💡 Please place KDB and K-Growth annual reports (PDF format) in this directory`);
            return;
        }
        
        // Get all PDF files
        const files = fs.readdirSync(CONFIG.pdfDir)
            .filter(file => CONFIG.supportedFormats.includes(path.extname(file).toLowerCase()))
            .map(file => path.join(CONFIG.pdfDir, file));
        
        if (files.length === 0) {
            console.log(`⚠️ No PDF files found in ${CONFIG.pdfDir}`);
            console.log(`💡 Please add KDB and K-Growth annual reports to analyze`);
            return;
        }
        
        console.log(`📚 Found ${files.length} PDF files to analyze`);
        
        // Process each PDF file
        for (const filePath of files) {
            const result = await processPDFFile(filePath);
            
            if (result.success) {
                totalProcessed++;
            } else {
                totalErrors++;
            }
            
            // Brief pause between files
            await new Promise(resolve => setTimeout(resolve, 2000));
        }
        
        const duration = (Date.now() - startTime) / 1000;
        
        console.log('\n🎉 === PDF AI ANALYSIS COMPLETED ===');
        console.log(`📄 Files Processed: ${totalProcessed}`);
        console.log(`❌ Errors: ${totalErrors}`);
        console.log(`⏱️ Duration: ${duration.toFixed(2)} seconds`);
        console.log(`🤖 AI Model: ${CONFIG.openai.model}`);
        
        if (totalProcessed > 0) {
            console.log('\n🚀 Next steps:');
            console.log('1. Review AI-generated insights in database');
            console.log('2. Cross-reference with scraped fund data');
            console.log('3. Generate investment opportunity reports');
            console.log('4. Create trend dashboards');
        }
        
    } catch (error) {
        console.error('💥 Critical error in PDF analysis:', error);
        throw error;
    }
}

// Execute if run directly
if (require.main === module) {
    (async () => {
        try {
            await analyzePDFReports();
            console.log('✅ PDF AI analysis completed successfully!');
        } catch (error) {
            console.error('💥 PDF AI analysis failed:', error);
            process.exit(1);
        }
    })();
}

module.exports = {
    analyzePDFReports,
    processPDFFile,
    extractPDFText,
    analyzeWithOpenAI,
    generateTrendReport,
    CONFIG
}; 