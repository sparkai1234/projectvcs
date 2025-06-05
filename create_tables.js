require('dotenv').config();
const { createClient } = require('@supabase/supabase-js');

const supabaseUrl = process.env.SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY;

const supabase = createClient(supabaseUrl, supabaseKey);

async function createTables() {
    console.log('🚀 Creating VCS database tables...');
    
    // Create the essential VCS tables
    const createTablesSQL = `
        -- Enable UUID extension
        CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
        
        -- VC Table
        CREATE TABLE IF NOT EXISTS vc_table (
            id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
            company_id VARCHAR(50) UNIQUE NOT NULL,
            company_name VARCHAR(255) NOT NULL,
            company_name_en VARCHAR(255),
            location VARCHAR(255),
            representative VARCHAR(255),
            established_date DATE,
            company_type VARCHAR(100),
            website_url VARCHAR(500),
            contact_info JSONB,
            disclosure_data JSONB,
            apify_source VARCHAR(100),
            created_at TIMESTAMP DEFAULT NOW(),
            updated_at TIMESTAMP DEFAULT NOW()
        );

        -- Fund Table
        CREATE TABLE IF NOT EXISTS fund_table (
            id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
            company_id VARCHAR(50) NOT NULL,
            fund_name VARCHAR(255) NOT NULL,
            fund_name_en VARCHAR(255),
            fund_type VARCHAR(100),
            commitment_amount BIGINT,
            fund_size BIGINT,
            establishment_date DATE,
            fund_status VARCHAR(50),
            representative VARCHAR(255),
            investment_focus TEXT[],
            fund_details JSONB,
            apify_source VARCHAR(100),
            created_at TIMESTAMP DEFAULT NOW(),
            updated_at TIMESTAMP DEFAULT NOW(),
            FOREIGN KEY (company_id) REFERENCES vc_table(company_id)
        );

        -- Indexes
        CREATE INDEX IF NOT EXISTS idx_vc_table_company_id ON vc_table(company_id);
        CREATE INDEX IF NOT EXISTS idx_fund_table_company_id ON fund_table(company_id);
    `;

    try {
        const { data, error } = await supabase.rpc('exec_sql', { 
            sql: createTablesSQL 
        });
        
        if (error) {
            console.error('❌ Error creating tables:', error);
            return false;
        }
        
        console.log('✅ Tables created successfully!');
        return true;
        
    } catch (err) {
        console.error('❌ Unexpected error:', err);
        return false;
    }
}

async function testConnection() {
    console.log('🔗 Testing Supabase connection...');
    
    try {
        const { data, error } = await supabase
            .from('vc_table')
            .select('count(*)');
            
        if (error) {
            console.error('❌ Connection test failed:', error);
            return false;
        }
        
        console.log('✅ Connection successful!');
        return true;
        
    } catch (err) {
        console.error('❌ Connection error:', err);
        return false;
    }
}

async function main() {
    console.log('=== VCS Database Setup ===\n');
    
    // Test connection first
    const connected = await testConnection();
    if (!connected) {
        console.log('\n❌ Failed to connect. Please check your Supabase credentials.');
        return;
    }
    
    // Create tables
    const created = await createTables();
    if (!created) {
        console.log('\n❌ Failed to create tables.');
        return;
    }
    
    console.log('\n🎉 Database setup complete! Ready for VCS scraper integration.');
}

main().catch(console.error); 