# 🤖📊 PDF AI Analysis System for Korean Fund of Funds

## Overview

This system uses OpenAI GPT-4 to analyze PDF annual reports from Korean Fund of Funds (KDB and K-Growth) and generates structured intelligence data and trend reports.

## 🔧 Setup Requirements

### 1. Environment Variables
Add these to your `.env` file:
```bash
# Existing variables
SUPABASE_URL=your_supabase_url
SUPABASE_SERVICE_ROLE_KEY=your_supabase_key

# New for PDF AI Analysis
OPENAI_API_KEY=your_openai_api_key
```

Get your OpenAI API key from: https://platform.openai.com/api-keys

### 2. Database Setup
```bash
# Create the PDF analysis tables
npm run db:create-pdf-tables

# Or setup all databases at once
npm run db:setup-all
```

### 3. Install Dependencies
```bash
npm install
```

## 📄 PDF Report Analysis

### Step 1: Add PDF Reports
1. Place KDB and K-Growth annual reports in the `pdf_reports/` directory
2. Supported formats: PDF files
3. File naming suggestions:
   - `KDB_Annual_Report_2023.pdf`
   - `K-Growth_Annual_Report_2023.pdf`
   - `Korea_Development_Bank_Investment_Report_2023.pdf`

### Step 2: Run PDF Analysis
```bash
# Analyze all PDF reports in the pdf_reports directory
npm run pdf:analyze

# Or run individual analysis
node scrapers/pdf_ai_analyzer.js
```

### Analysis Features:
- **Investment Summary**: Total investments, fund counts, sector distribution
- **Portfolio Performance**: Returns, IRR, exits, growth metrics
- **Market Trends**: Market outlook, hot sectors, emerging trends
- **Future Outlook**: Investment strategy, target sectors, expected returns
- **Trend Reports**: AI-generated comprehensive trend analysis

## 📈 Trend Report Generation

### Generate Comprehensive Reports
```bash
# Generate trend reports combining PDF insights with live data
npm run trends:generate

# Or run individual trend analysis
node analysis/comprehensive_trend_reporter.js
```

### Output Formats:
- **JSON**: `trend_reports/korean_vc_trend_report_YYYY-MM-DD.json`
- **Markdown**: `trend_reports/korean_vc_trend_report_YYYY-MM-DD.md`
- **Database**: Stored in `trend_reports` table

### Report Content:
- Executive summary of Korean VC market
- Key trends identification
- Sector-specific insights  
- Investment recommendations
- Market outlook (6-month, 12-month, 24-month)
- Risk factor analysis

## 🗃️ Database Tables

### PDF Analysis Results (`pdf_analysis_results`)
Stores AI-extracted insights from annual reports:
- Investment summaries (JSON)
- Portfolio performance data (JSON)
- Market trends analysis (JSON)
- Future outlook insights (JSON)
- Comprehensive trend reports (JSON)

### AI Trend Insights (`ai_trend_insights`)
Normalized trend data for analytics:
- Trend types and categories
- Confidence scores
- Quantitative metrics
- Time-based context

### Investment Intelligence (`investment_intelligence_insights`)
Cross-referenced actionable insights:
- Opportunity identification
- Risk assessments
- Strategic recommendations
- Multi-source validation

### Trend Reports (`trend_reports`)
Comprehensive trend analysis reports:
- Complete report data (JSON)
- Multiple data source synthesis
- AI model metadata
- Quality metrics

## 🔍 Data Views

### Intelligence Summary (`pdf_intelligence_summary`)
```sql
SELECT * FROM pdf_intelligence_summary;
```
High-level overview of analysis quality and coverage.

### Trend Dashboard (`trend_analysis_dashboard`)
```sql
SELECT * FROM trend_analysis_dashboard 
WHERE fund_source = 'KDB' 
ORDER BY trend_count DESC;
```
Aggregated trend data for visualization.

### Investment Opportunities (`ai_investment_opportunities`)
```sql
SELECT * FROM ai_investment_opportunities 
WHERE opportunity_level = 'High Opportunity' 
ORDER BY report_year DESC;
```
AI-identified investment opportunities from reports.

## 🚀 Complete Workflow

### 1. Collect Fund of Funds Data
```bash
# Scrape live fund data
npm run fof:all  # KDB + K-Growth + KVIC

# This populates:
# - kdb_fund_of_funds_raw
# - kgrowth_fund_of_funds_raw  
# - kvic_investment_raw
```

### 2. Analyze PDF Annual Reports
```bash
# Add PDF files to pdf_reports/ directory
# Then run AI analysis
npm run pdf:analyze

# This populates:
# - pdf_analysis_results
# - ai_trend_insights
# - investment_intelligence_insights
```

### 3. Generate Comprehensive Trends
```bash
# Combine all data sources for trend analysis
npm run trends:generate

# This creates:
# - JSON and Markdown reports in trend_reports/
# - Records in trend_reports table
```

## 📊 Sample Analysis Output

### Investment Summary Example:
```json
{
  "total_investments": "2.5조 KRW",
  "number_of_funds": 45,
  "number_of_companies": 234,
  "top_sectors": ["AI/ML", "Biotech", "Fintech"],
  "investment_stages": {
    "seed": "500억 KRW",
    "early": "1.2조 KRW", 
    "growth": "800억 KRW"
  },
  "geographic_distribution": {
    "domestic": "85%",
    "international": "15%"
  }
}
```

### Trend Analysis Example:
```json
{
  "key_trends": [
    {
      "trend": "AI/ML Investment Surge",
      "direction": "increasing",
      "significance": "high",
      "description": "40% increase in AI/ML investments year-over-year",
      "timeframe": "current"
    }
  ],
  "investment_recommendations": [
    {
      "recommendation": "Increase allocation to AI/ML startups",
      "urgency": "immediate",
      "risk_level": "medium",
      "rationale": "Strong government support and growing market demand"
    }
  ]
}
```

## 🎯 Use Cases

### 1. Investment Strategy
- Identify hot sectors and emerging trends
- Benchmark fund performance against peers
- Track government investment patterns

### 2. Risk Assessment
- Monitor market outlook changes
- Identify potential risk factors
- Assess portfolio concentration risks

### 3. Opportunity Discovery
- Find underinvested sectors
- Identify high-performing fund strategies
- Track exit activity and success rates

### 4. Competitive Intelligence
- Compare KDB vs K-Growth strategies
- Analyze government vs private fund performance
- Track investment theme evolution

## 🔄 Automation

### Scheduled Analysis
Set up cron jobs or scheduled tasks to:
1. Monitor for new PDF reports
2. Run analysis automatically
3. Generate weekly/monthly trend reports
4. Send alerts for significant changes

### Integration
- API endpoints for trend data
- Dashboard integration
- Real-time notifications
- Export capabilities

## 🛠️ Troubleshooting

### Common Issues:
1. **OpenAI API Rate Limits**: Add delays between requests
2. **PDF Parsing Errors**: Check file format and size limits
3. **Korean Text Processing**: Ensure UTF-8 encoding
4. **Database Connection**: Verify Supabase credentials

### Debug Mode:
Add console logging to track analysis progress and identify issues.

---

**Ready to transform unstructured Fund of Funds reports into actionable intelligence! 🚀** 