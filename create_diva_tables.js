const { createClient } = require('@supabase/supabase-js');

const supabase = createClient(
  'https://udfgtccxbqmalgpqyxzz.supabase.co',
  'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InVkZmd0Y2N4YnFtYWxncHF5eHp6Iiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc0ODk0NjY5NiwiZXhwIjoyMDY0NTIyNjk2fQ.JgyEKjOhuZpNCCOadsaK90Q8CcoPf_rgdtSXh-1BU18'
);

async function createDivaTables() {
  console.log('🔧 Creating missing DIVA tables...');
  
  const tables = [
    {
      name: 'diva_investment_performance_raw',
      sql: `
        CREATE TABLE IF NOT EXISTS diva_investment_performance_raw (
          id BIGSERIAL PRIMARY KEY,
          company_name TEXT,
          individual_avoidance_count INTEGER,
          individual_amount BIGINT,
          partnership_avoidance_count INTEGER,
          partnership_amount BIGINT,
          total_avoidance_count INTEGER,
          total_amount BIGINT,
          extracted_at TIMESTAMPTZ DEFAULT NOW(),
          source_url TEXT,
          created_at TIMESTAMPTZ DEFAULT NOW()
        );`
    },
    {
      name: 'diva_financial_raw',
      sql: `
        CREATE TABLE IF NOT EXISTS diva_financial_raw (
          id BIGSERIAL PRIMARY KEY,
          company_name TEXT,
          fiscal_year TEXT,
          accounting_standard TEXT,
          total_assets BIGINT,
          total_liabilities BIGINT,
          total_equity BIGINT,
          operating_revenue BIGINT,
          operating_profit BIGINT,
          net_income BIGINT,
          startup_investment_assets BIGINT,
          extracted_at TIMESTAMPTZ DEFAULT NOW(),
          source_url TEXT,
          created_at TIMESTAMPTZ DEFAULT NOW()
        );`
    },
    {
      name: 'diva_association_raw',
      sql: `
        CREATE TABLE IF NOT EXISTS diva_association_raw (
          id BIGSERIAL PRIMARY KEY,
          company_name TEXT,
          fund_name TEXT,
          fund_number TEXT,
          total_investment BIGINT,
          formation_investment_krw BIGINT,
          maturity_date DATE,
          investment_purpose TEXT,
          development_type TEXT,
          support_type TEXT,
          extracted_at TIMESTAMPTZ DEFAULT NOW(),
          source_url TEXT,
          created_at TIMESTAMPTZ DEFAULT NOW()
        );`
    },
    {
      name: 'diva_professional_raw',
      sql: `
        CREATE TABLE IF NOT EXISTS diva_professional_raw (
          id BIGSERIAL PRIMARY KEY,
          company_name TEXT,
          name TEXT,
          work_experience TEXT,
          professional_experience TEXT,
          education_vca TEXT,
          extracted_at TIMESTAMPTZ DEFAULT NOW(),
          source_url TEXT,
          created_at TIMESTAMPTZ DEFAULT NOW()
        );`
    },
    {
      name: 'diva_violation_raw',
      sql: `
        CREATE TABLE IF NOT EXISTS diva_violation_raw (
          id BIGSERIAL PRIMARY KEY,
          violation_number TEXT,
          company_name TEXT,
          action_date DATE,
          action_end_date DATE,
          classification_name TEXT,
          correction_type TEXT,
          violation_type TEXT,
          action_type TEXT,
          extracted_at TIMESTAMPTZ DEFAULT NOW(),
          source_url TEXT,
          created_at TIMESTAMPTZ DEFAULT NOW()
        );`
    }
  ];

  try {
    for (const table of tables) {
      console.log(`Creating table: ${table.name}`);
      
      const { error } = await supabase.rpc('exec_sql', {
        sql: table.sql
      });
      
      if (error) {
        console.error(`❌ Error creating ${table.name}:`, error.message);
        
        // Try alternative direct SQL execution
        const { error: directError } = await supabase
          .from(table.name)
          .select('id')
          .limit(1);
          
        if (directError && directError.code === '42P01') {
          console.log(`💡 Table ${table.name} doesn't exist - create manually in Supabase dashboard`);
          console.log(`SQL to run: ${table.sql}`);
        } else if (!directError) {
          console.log(`✅ Table ${table.name} already exists`);
        }
      } else {
        console.log(`✅ Table ${table.name} created successfully`);
      }
    }

    // Test insertion to verify tables work
    console.log('\n🧪 Testing table access...');
    const testTables = ['diva_investment_performance_raw', 'diva_financial_raw'];
    
    for (const tableName of testTables) {
      const { data, error } = await supabase
        .from(tableName)
        .select('count')
        .limit(1);
        
      if (error) {
        console.log(`❌ ${tableName}: ${error.message}`);
      } else {
        console.log(`✅ ${tableName}: accessible`);
      }
    }

    console.log('\n🎯 SOLUTION SUMMARY:');
    console.log('If tables couldn\'t be created via script, manually run this in Supabase SQL Editor:');
    console.log('https://udfgtccxbqmalgpqyxzz.supabase.co/project/udfgtccxbqmalgpqyxzz/sql');
    console.log('\nSQL to copy-paste:');
    tables.forEach(table => {
      console.log(`-- ${table.name}`);
      console.log(table.sql);
      console.log('');
    });

  } catch (error) {
    console.error('❌ Error:', error.message);
  }
}

createDivaTables(); 