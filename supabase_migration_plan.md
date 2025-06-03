# 🚀 DIVA → Supabase Migration Plan (Plan B)

## 📋 **PROJECT STATUS**
- ✅ **Supabase Project Created**: ProjectVCS 
- ✅ **API Ready**: Your project is deployed with its own API
- 🎯 **Goal**: Migrate 4,448+ VC/Fund records from Airtable to Supabase

---

## 🏗️ **PHASE 1: Database Schema Setup (30 minutes)**

### **Step 1: Create VC Companies Table**
```sql
-- Create VC Companies table (equivalent to your Airtable base)
CREATE TABLE vc_companies (
    id SERIAL PRIMARY KEY,
    company_id VARCHAR(50) UNIQUE NOT NULL, -- e.g., 'OP20190375'
    company_name VARCHAR(255) NOT NULL,     -- Korean company names
    company_name_en VARCHAR(255),           -- English names if available
    location VARCHAR(255),
    representative VARCHAR(255),
    established_date DATE,
    company_type VARCHAR(100),
    website_url VARCHAR(500),
    contact_info JSONB,                     -- Phone, email, address
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

-- Create indexes for performance
CREATE INDEX idx_vc_companies_company_id ON vc_companies(company_id);
CREATE INDEX idx_vc_companies_name ON vc_companies(company_name);
```

### **Step 2: Create Fund Data Table**
```sql
-- Create Fund Data table
CREATE TABLE fund_data (
    id SERIAL PRIMARY KEY,
    company_id VARCHAR(50) REFERENCES vc_companies(company_id),
    fund_name VARCHAR(255) NOT NULL,
    fund_name_en VARCHAR(255),
    fund_type VARCHAR(100),
    commitment_amount BIGINT,               -- Amount in KRW (won)
    fund_size BIGINT,
    establishment_date DATE,
    fund_status VARCHAR(50),
    representative VARCHAR(255),
    investment_focus TEXT[],                -- Array of focus areas
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

CREATE INDEX idx_fund_data_company_id ON fund_data(company_id);
CREATE INDEX idx_fund_data_name ON fund_data(fund_name);
```

### **Step 3: Create Personnel Data Table**
```sql
-- Create Personnel Data table
CREATE TABLE personnel_data (
    id SERIAL PRIMARY KEY,
    company_id VARCHAR(50) REFERENCES vc_companies(company_id),
    total_personnel INTEGER DEFAULT 0,
    professional_staff INTEGER DEFAULT 0,
    investment_review_staff INTEGER DEFAULT 0,
    management_staff INTEGER DEFAULT 0,
    other_staff INTEGER DEFAULT 0,
    personnel_breakdown JSONB,              -- Detailed breakdown
    last_updated DATE,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

CREATE INDEX idx_personnel_data_company_id ON personnel_data(company_id);
```

### **Step 4: Create Professional Staff Table**
```sql
-- Create individual professional staff records
CREATE TABLE professional_staff (
    id SERIAL PRIMARY KEY,
    company_id VARCHAR(50) REFERENCES vc_companies(company_id),
    staff_name VARCHAR(255),
    position_type VARCHAR(100),
    work_experience INTEGER DEFAULT 0,     -- Years of experience
    specialized_experience INTEGER DEFAULT 0,
    performance_score DECIMAL(5,2),
    education_background TEXT,
    specialization_areas TEXT[],
    contact_info JSONB,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

CREATE INDEX idx_professional_staff_company_id ON professional_staff(company_id);
```

### **Step 5: Create Investment Statistics Table**
```sql
-- Create investment statistics table
CREATE TABLE investment_statistics (
    id SERIAL PRIMARY KEY,
    company_id VARCHAR(50) REFERENCES vc_companies(company_id),
    investment_count INTEGER DEFAULT 0,
    investment_amount BIGINT DEFAULT 0,     -- Total invested amount
    recovery_amount BIGINT DEFAULT 0,       -- Total recovered amount
    net_performance BIGINT DEFAULT 0,       -- Net performance
    performance_period VARCHAR(50),         -- e.g., '2023', '2020-2023'
    calculation_date DATE,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

CREATE INDEX idx_investment_stats_company_id ON investment_statistics(company_id);
```

---

## 📥 **PHASE 2: Data Migration Script (1 hour)**

### **Create Migration Script**
```python
# supabase_migration.py
#!/usr/bin/env python3
"""
DIVA Airtable → Supabase Migration Script
Migrates all VC/Fund data from Airtable to Supabase PostgreSQL
"""

import json
import os
from datetime import datetime
from supabase import create_client, Client
from api_config import get_config

def setup_supabase_client():
    """Initialize Supabase client"""
    # Add these to your api_config.py
    config = get_config()
    
    SUPABASE_URL = "https://udjtccbgmalgpqvzz.supabase.co"  # Your project URL
    SUPABASE_KEY = "your-anon-key-here"  # Get from Supabase dashboard
    
    supabase: Client = create_client(SUPABASE_URL, SUPABASE_KEY)
    return supabase

def migrate_airtable_to_supabase():
    """Main migration function"""
    print("🚀 Starting DIVA Airtable → Supabase Migration")
    print("=" * 60)
    
    supabase = setup_supabase_client()
    
    # Load your existing Airtable data
    # Option 1: From your existing reports
    with open('diva_integration_report_20250603_181600.json', 'r', encoding='utf-8') as f:
        airtable_data = json.load(f)
    
    print(f"📊 Found {len(airtable_data)} companies to migrate")
    
    migrated_companies = 0
    migrated_funds = 0
    
    for company_id, company_data in airtable_data.items():
        try:
            # 1. Migrate company basic info
            company_record = {
                'company_id': company_id,
                'company_name': company_data.get('company_name', ''),
                'location': company_data.get('disclosure_data', {}).get('location', ''),
                'representative': company_data.get('disclosure_data', {}).get('representative', ''),
                'company_type': company_data.get('company_type', 'VC'),
                'contact_info': company_data.get('contact_info', {})
            }
            
            # Insert company
            result = supabase.table('vc_companies').upsert(company_record).execute()
            
            # 2. Migrate fund data
            if company_data.get('fund_data'):
                for fund in company_data['fund_data']:
                    fund_record = {
                        'company_id': company_id,
                        'fund_name': fund.get('fund_name', ''),
                        'fund_type': fund.get('fund_type', ''),
                        'commitment_amount': fund.get('commitment_amount', 0),
                        'representative': fund.get('representative', ''),
                        'fund_status': fund.get('fund_status', 'Active')
                    }
                    
                    supabase.table('fund_data').upsert(fund_record).execute()
                    migrated_funds += 1
            
            # 3. Migrate personnel data
            if company_data.get('personnel_data'):
                personnel = company_data['personnel_data']
                personnel_record = {
                    'company_id': company_id,
                    'total_personnel': personnel.get('total_personnel', 0),
                    'professional_staff': personnel.get('professional_staff', 0),
                    'investment_review_staff': personnel.get('investment_review_staff', 0),
                    'management_staff': personnel.get('management_staff', 0),
                    'personnel_breakdown': personnel
                }
                
                supabase.table('personnel_data').upsert(personnel_record).execute()
            
            # 4. Migrate professional staff
            if company_data.get('professional_data'):
                for staff in company_data['professional_data']:
                    staff_record = {
                        'company_id': company_id,
                        'staff_name': staff.get('staff_name', ''),
                        'position_type': staff.get('position_type', ''),
                        'work_experience': staff.get('work_experience', 0),
                        'specialized_experience': staff.get('specialized_experience', 0),
                        'performance_score': staff.get('performance_score', 0),
                        'specialization_areas': staff.get('specialization_areas', [])
                    }
                    
                    supabase.table('professional_staff').upsert(staff_record).execute()
            
            # 5. Migrate investment statistics
            if company_data.get('statistical_data'):
                stats = company_data['statistical_data']
                stats_record = {
                    'company_id': company_id,
                    'investment_count': stats.get('investment_count', 0),
                    'investment_amount': stats.get('investment_amount', 0),
                    'recovery_amount': stats.get('recovery_amount', 0),
                    'net_performance': stats.get('net_performance', 0),
                    'performance_period': '2024',
                    'calculation_date': datetime.now().date()
                }
                
                supabase.table('investment_statistics').upsert(stats_record).execute()
            
            migrated_companies += 1
            print(f"✅ Migrated: {company_data.get('company_name', company_id)} ({migrated_companies}/{len(airtable_data)})")
            
        except Exception as e:
            print(f"❌ Error migrating {company_id}: {e}")
    
    print("\n" + "=" * 60)
    print("📊 MIGRATION COMPLETE!")
    print(f"✅ Companies migrated: {migrated_companies}")
    print(f"✅ Funds migrated: {migrated_funds}")
    print(f"🚀 Your data is now in Supabase PostgreSQL!")

if __name__ == "__main__":
    migrate_airtable_to_supabase()
```

---

## 🔧 **PHASE 3: Update Existing Scripts (45 minutes)**

### **Update API Configuration**
```python
# Update api_config.py to include Supabase
#!/usr/bin/env python3
"""
API Configuration for DIVA Intelligence System
Now includes Supabase as backup/primary database
"""

import os

# Existing configuration
AIRTABLE_BASE_ID = "appdR8V9lJaRW8VkR"
AIRTABLE_API_KEY = "patOUfAsek4nbpvHm.49789ced0e2b0304bdc507f110d936277cd3da18ec3efc9347c93e6a1810919e"
OPENAI_API_KEY = "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"

# NEW: Supabase Configuration
SUPABASE_URL = "https://udjtccbgmalgpqvzz.supabase.co"
SUPABASE_ANON_KEY = "your-anon-key-here"  # Get from Supabase dashboard → Settings → API
SUPABASE_SERVICE_KEY = "your-service-key-here"  # For admin operations

# Database selection (switch between airtable/supabase)
DATABASE_PROVIDER = "supabase"  # Change this to switch providers

def set_environment_variables():
    """Set environment variables from this config"""
    os.environ['AIRTABLE_BASE_ID'] = AIRTABLE_BASE_ID
    os.environ['AIRTABLE_API_KEY'] = AIRTABLE_API_KEY
    os.environ['OPENAI_API_KEY'] = OPENAI_API_KEY
    os.environ['SUPABASE_URL'] = SUPABASE_URL
    os.environ['SUPABASE_ANON_KEY'] = SUPABASE_ANON_KEY
    os.environ['SUPABASE_SERVICE_KEY'] = SUPABASE_SERVICE_KEY
    
def get_config():
    """Get configuration values"""
    return {
        'airtable_base_id': AIRTABLE_BASE_ID,
        'airtable_api_key': AIRTABLE_API_KEY,
        'openai_api_key': OPENAI_API_KEY,
        'supabase_url': SUPABASE_URL,
        'supabase_anon_key': SUPABASE_ANON_KEY,
        'supabase_service_key': SUPABASE_SERVICE_KEY,
        'database_provider': DATABASE_PROVIDER
    }
```

### **Create Supabase Data Access Layer**
```python
# supabase_client.py
#!/usr/bin/env python3
"""
Supabase Data Access Layer for DIVA System
Provides same interface as Airtable but uses Supabase PostgreSQL
"""

from supabase import create_client, Client
from api_config import get_config
from typing import List, Dict, Optional

class SupabaseDIVAClient:
    def __init__(self):
        config = get_config()
        self.supabase: Client = create_client(
            config['supabase_url'],
            config['supabase_anon_key']
        )
    
    def get_all_companies(self) -> List[Dict]:
        """Get all VC companies - replaces Airtable API calls"""
        try:
            # Get companies with related data
            result = self.supabase.table('vc_companies')\
                .select('*, fund_data(*), personnel_data(*), professional_staff(*), investment_statistics(*)')\
                .execute()
            
            return result.data
        except Exception as e:
            print(f"Error fetching companies: {e}")
            return []
    
    def get_company_by_id(self, company_id: str) -> Optional[Dict]:
        """Get specific company with all related data"""
        try:
            result = self.supabase.table('vc_companies')\
                .select('*, fund_data(*), personnel_data(*), professional_staff(*), investment_statistics(*)')\
                .eq('company_id', company_id)\
                .execute()
            
            return result.data[0] if result.data else None
        except Exception as e:
            print(f"Error fetching company {company_id}: {e}")
            return None
    
    def search_companies(self, query: str) -> List[Dict]:
        """Search companies by name (Korean/English)"""
        try:
            result = self.supabase.table('vc_companies')\
                .select('*, fund_data(*), personnel_data(*)')\
                .or(f'company_name.ilike.%{query}%,company_name_en.ilike.%{query}%')\
                .execute()
            
            return result.data
        except Exception as e:
            print(f"Error searching companies: {e}")
            return []
    
    def get_fund_statistics(self) -> Dict:
        """Get aggregate fund statistics"""
        try:
            # Total funds and amounts
            funds_result = self.supabase.table('fund_data')\
                .select('commitment_amount')\
                .execute()
            
            total_funds = len(funds_result.data)
            total_amount = sum(fund.get('commitment_amount', 0) for fund in funds_result.data)
            
            return {
                'total_funds': total_funds,
                'total_commitment': total_amount,
                'average_fund_size': total_amount / total_funds if total_funds > 0 else 0
            }
        except Exception as e:
            print(f"Error getting fund statistics: {e}")
            return {}
    
    def update_company_data(self, company_id: str, data: Dict) -> bool:
        """Update company data (from Apify scrapers)"""
        try:
            result = self.supabase.table('vc_companies')\
                .update(data)\
                .eq('company_id', company_id)\
                .execute()
            
            return len(result.data) > 0
        except Exception as e:
            print(f"Error updating company {company_id}: {e}")
            return False
```

---

## 🤖 **PHASE 4: Update OpenAI Integration (15 minutes)**

### **Update OpenAI Integration to Use Supabase**
```python
# Update openai_diva_integration.py
# Add this method to your OpenAIDIVAAnalyzer class

def load_supabase_data(self) -> Dict:
    """Load DIVA data from Supabase instead of JSON file"""
    try:
        from supabase_client import SupabaseDIVAClient
        
        client = SupabaseDIVAClient()
        companies = client.get_all_companies()
        
        # Convert to same format as Airtable data for compatibility
        converted_data = {}
        for company in companies:
            company_id = company['company_id']
            converted_data[company_id] = {
                'company_name': company['company_name'],
                'fund_data': company.get('fund_data', []),
                'personnel_data': company.get('personnel_data', []),
                'professional_data': company.get('professional_staff', []),
                'statistical_data': company.get('investment_statistics', [])
            }
        
        logger.info(f"Loaded {len(converted_data)} companies from Supabase")
        return converted_data
        
    except Exception as e:
        logger.error(f"Error loading Supabase data: {e}")
        return {}
```

---

## 🧪 **PHASE 5: Testing Plan (30 minutes)**

### **Create Test Script**
```python
# test_supabase_migration.py
#!/usr/bin/env python3
"""
Test Supabase migration and integration
"""

def test_supabase_connection():
    """Test basic Supabase connectivity"""
    print("🧪 Testing Supabase Connection")
    
    from supabase_client import SupabaseDIVAClient
    client = SupabaseDIVAClient()
    
    # Test data retrieval
    companies = client.get_all_companies()
    print(f"✅ Retrieved {len(companies)} companies from Supabase")
    
    if companies:
        # Test Korean text support
        sample_company = companies[0]
        print(f"✅ Sample company: {sample_company.get('company_name', 'N/A')}")
        
        # Test search
        search_results = client.search_companies("벤처")
        print(f"✅ Search test: Found {len(search_results)} companies with '벤처'")

def test_openai_with_supabase():
    """Test OpenAI integration with Supabase data"""
    print("\n🤖 Testing OpenAI + Supabase Integration")
    
    from openai_diva_integration import OpenAIDIVAAnalyzer
    from api_config import get_config
    
    config = get_config()
    analyzer = OpenAIDIVAAnalyzer(
        api_key=config['openai_api_key'],
        default_language='korean'
    )
    
    # Load data from Supabase
    supabase_data = analyzer.load_supabase_data()
    print(f"✅ Loaded {len(supabase_data)} companies for AI analysis")
    
    if supabase_data:
        # Test analysis
        sample_id = list(supabase_data.keys())[0]
        sample_data = supabase_data[sample_id]
        
        analysis = analyzer.analyze_company_profile(
            company_id=sample_id,
            company_data=sample_data,
            analysis_type='comprehensive'
        )
        
        print(f"✅ AI analysis completed: {analysis[:200]}...")

if __name__ == "__main__":
    test_supabase_connection()
    test_openai_with_supabase()
    print("\n🎉 All tests completed! Supabase is ready as Plan B.")
```

---

## 📋 **IMPLEMENTATION CHECKLIST**

### **Today (Setup - 2 hours)**
- [ ] **Get Supabase API Keys** (Dashboard → Settings → API)
- [ ] **Run SQL Schema** (Copy tables above into SQL Editor)
- [ ] **Install Supabase Python Client**: `pip install supabase`
- [ ] **Update api_config.py** with Supabase credentials
- [ ] **Create migration script** (supabase_migration.py)

### **This Week (Migration - 3 hours)**
- [ ] **Run migration script** (migrate your 4,448 records)
- [ ] **Test data integrity** (verify Korean text, record counts)
- [ ] **Update OpenAI integration** (load_supabase_data method)
- [ ] **Test Korean AI analysis** with Supabase data
- [ ] **Update Apify scripts** to write to Supabase (optional)

### **Backup Plan Ready (1 hour)**
- [ ] **Document switch procedure** (change DATABASE_PROVIDER setting)
- [ ] **Test full system** with Supabase as primary
- [ ] **Performance benchmark** (API response times)
- [ ] **Create rollback plan** (if needed)

---

## 🚨 **EMERGENCY SWITCH PROCEDURE**

If Airtable support fails to fix the API bug:

1. **Change one line in api_config.py**:
   ```python
   DATABASE_PROVIDER = "supabase"  # Switch from "airtable"
   ```

2. **Run migration**: `python supabase_migration.py`

3. **Update scripts**: Point Apify to Supabase endpoints

4. **Verify**: Test OpenAI + Korean language + all 4,448 records

**Total switch time**: ~2 hours

---

## 💰 **COST COMPARISON**

| **Provider** | **Current Cost** | **Supabase Cost** | **Monthly Savings** |
|--------------|------------------|-------------------|---------------------|
| Airtable     | $50+/month      | $25/month         | $25+/month          |
| **Features** | **Limited API**  | **Full PostgreSQL** | **Better Performance** |

Your VC intelligence system will be **faster, cheaper, and more reliable** with Supabase! 🚀

Ready to get started? Let's begin with getting your API keys from the Supabase dashboard! 