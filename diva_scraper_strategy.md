# DIVA Fund Disclosure Scraper Strategy

## 🎯 Objective
Scrape comprehensive fund disclosure data from `http://diva.kvca.or.kr/div/cmn/DivDisclsMainInq` to enhance our VC AI portal with missing fund performance and regulatory information.

## 📊 Data Gap Analysis

### Currently Available (from VCS portal):
- Basic fund information
- Company associations
- Investment focus areas
- Geographic data

### Missing Data (available on DIVA):
- **Fund Performance Metrics**
  - 기준수익률 (Benchmark Returns)
  - 결성약정총액 (Capital Commitment Amount)
  - 실적 데이터 (Performance Data)
  
- **Regulatory Information**
  - 등록일자 (Registration Date)
  - 만기일 (Maturity Date)
  - 결산월 (Settlement Period)
  
- **Fund Classification Details**
  - 지한구분 (Duration Classification)
  - 계정구분 (Account Classification)  
  - 목적구분 (Purpose Classification)
  - 투자분야구분 (Investment Sector Classification)

## 🛠 Technical Implementation Plan

### Option 1: Apify Custom Actor (Recommended)
**Pros:**
- Handles JavaScript-heavy sites
- Built-in proxy rotation
- Scheduled runs capability
- Direct Airtable integration

**Implementation:**
1. Create custom Apify actor for DIVA scraping
2. Handle dynamic form submissions
3. Parse Korean fund disclosure tables
4. Match with existing VC/Fund data
5. Upload to separate "Fund Disclosures" table

### Option 2: Python + Selenium Approach
**Pros:**
- Full control over scraping logic
- Easy debugging and modification
- Direct integration with existing Python codebase

**Implementation:**
1. Set up Selenium with Korean language support
2. Navigate fund disclosure forms
3. Extract tabular data
4. Cross-reference with existing records
5. Update Airtable via API

### Option 3: Hybrid Approach (Best of Both)
**Implementation:**
1. Use Apify for robust data extraction
2. Python for data processing and matching
3. Airtable API for intelligent updates

## 🏗 Recommended Architecture

### New Airtable Table Structure
```
Table: "Fund Disclosures"
Fields:
- 회사명 (Company Name) [Link to VC Table]
- 조합명 (Fund Name) [Link to Fund Table]  
- 등록일자 (Registration Date)
- 만기일 (Maturity Date)
- 결산월 (Settlement Month)
- 지한구분 (Duration Type)
- 계정구분 (Account Type)
- 목적구분 (Purpose Type)
- 투자분야구분 (Investment Sector)
- 기준수익률 (Benchmark Return Rate)
- 결성약정총액 (Total Commitment Amount)
- DIVA_URL (Source URL)
- Last_Updated (Timestamp)
```

### Data Flow
```
DIVA Portal → Apify Actor → Raw JSON Data → Python Processor → Airtable API → Enhanced VC Portal
```

## 🎯 Phase Implementation

### Phase 1: Setup & Testing (Week 1)
1. **Apify Actor Development**
   - Create DIVA scraping actor
   - Test on sample fund pages
   - Implement error handling

2. **Data Schema Design**  
   - Create Fund Disclosures table
   - Set up linking relationships
   - Test data validation

### Phase 2: Data Extraction (Week 2)
1. **Full Site Scraping**
   - Run comprehensive data extraction
   - Handle pagination and forms
   - Implement rate limiting

2. **Data Processing**
   - Clean and normalize Korean text
   - Match company names with existing data
   - Validate financial figures

### Phase 3: Integration & Enhancement (Week 3)
1. **Airtable Integration**
   - Upload disclosure data
   - Create linked records
   - Set up automated matching

2. **AI Enhancement**
   - Update AI system with new data fields
   - Add fund performance analysis
   - Create disclosure-based insights

## 🔧 Technical Considerations

### Korean Text Handling
- Ensure UTF-8 encoding throughout
- Handle special financial characters (₩, %, etc.)
- Normalize company name variations

### Data Matching Strategy
- Fuzzy matching for company names (similar to existing system)
- Date-based correlation with fund registration
- Manual verification for low-confidence matches

### Rate Limiting & Ethics
- Respect robots.txt guidelines  
- Implement reasonable delays
- Cache results to minimize requests
- Follow KVCA data usage policies

## 📈 Success Metrics

### Data Quality
- **Target:** 95%+ accurate company matching
- **Coverage:** Capture 90%+ of available disclosures
- **Freshness:** Weekly automated updates

### Integration Success  
- **Linking:** 80%+ of disclosures linked to existing VC/Fund records
- **Completeness:** Fill 90%+ of missing fund performance data
- **Usability:** Enable advanced filtering and analysis in Airtable

## 🚨 Risk Mitigation

### Technical Risks
- **Site Structure Changes:** Implement robust selectors and fallbacks
- **Rate Limiting:** Use proxy rotation and intelligent delays  
- **Data Format Changes:** Build flexible parsing logic

### Legal/Compliance Risks
- **Data Usage:** Ensure compliance with KVCA terms
- **Rate Limits:** Stay within reasonable usage bounds
- **Attribution:** Properly credit data sources

## 💡 Advanced Features (Future)

### Real-time Monitoring
- Set up change detection for disclosure updates
- Automated alerts for new fund registrations
- Performance benchmark tracking

### AI-Powered Insights
- Fund performance prediction models
- Investment trend analysis
- Risk assessment based on disclosure patterns

## 🎯 Immediate Next Steps

1. **Create Apify Custom Actor** for DIVA scraping
2. **Design Fund Disclosures table** in Airtable
3. **Test scraping** on sample pages
4. **Implement matching logic** for existing data
5. **Set up automated pipeline** for regular updates 