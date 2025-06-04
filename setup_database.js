/**
 * 🗄️ DATABASE SETUP SCRIPT
 * =========================
 * 
 * Alternative method to create all database tables programmatically
 * for Korean VC Intelligence System
 */

require('dotenv').config();
const { createClient } = require('@supabase/supabase-js');
const fs = require('fs');
const path = require('path');

// Initialize Supabase client
const supabaseUrl = process.env.SUPABASE_URL;
const supabaseKey = process.env.SUPABASE_SERVICE_ROLE_KEY;

if (!supabaseUrl || !supabaseKey) {
    console.error('❌ Missing environment variables:');
    console.error('- SUPABASE_URL');
    console.error('- SUPABASE_SERVICE_ROLE_KEY');
    process.exit(1);
}

const supabase = createClient(supabaseUrl, supabaseKey);

console.log('🗄️ Database Setup Script Started');
console.log(`🎯 Target: ${supabaseUrl}`);

/**
 * Execute SQL file
 */
async function executeSQLFile(filePath, description) {
    try {
        console.log(`\n📄 === ${description} ===`);
        console.log(`📁 File: ${filePath}`);
        
        if (!fs.existsSync(filePath)) {
            throw new Error(`SQL file not found: ${filePath}`);
        }
        
        const sqlContent = fs.readFileSync(filePath, 'utf8');
        console.log(`📊 SQL Content: ${sqlContent.length} characters`);
        
        // Execute SQL using Supabase RPC
        const { data, error } = await supabase.rpc('exec_sql', {
            sql_query: sqlContent
        });
        
        if (error) {
            // If RPC doesn't work, try direct SQL execution
            console.log(`⚠️ RPC method failed, trying direct execution...`);
            
            // Split SQL into individual statements and execute them
            const statements = sqlContent
                .split(';')
                .map(stmt => stmt.trim())
                .filter(stmt => stmt.length > 0 && !stmt.startsWith('--'));
            
            console.log(`🔄 Executing ${statements.length} SQL statements...`);
            
            for (let i = 0; i < statements.length; i++) {
                const statement = statements[i];
                if (statement.toLowerCase().startsWith('select')) {
                    // Skip SELECT statements (like success messages)
                    continue;
                }
                
                try {
                    const { error: stmtError } = await supabase
                        .from('_temp_sql_execution')
                        .select('*')
                        .limit(1);
                    
                    // This is a workaround - we'll use a different approach
                    console.log(`⚠️ Statement ${i + 1}: Cannot execute raw SQL via client library`);
                } catch (execError) {
                    console.log(`⚠️ Statement ${i + 1}: Execution method not available`);
                }
            }
            
            console.log(`⚠️ Direct SQL execution not supported via client library`);
            console.log(`💡 Please use Supabase Dashboard SQL Editor instead`);
            return false;
        }
        
        console.log(`✅ ${description} completed successfully!`);
        return true;
        
    } catch (error) {
        console.error(`❌ Error executing ${description}:`, error.message);
        return false;
    }
}

/**
 * Verify tables exist
 */
async function verifyTables() {
    try {
        console.log('\n🔍 === VERIFYING TABLES ===');
        
        const expectedTables = [
            'kdb_fund_of_funds_raw',
            'kgrowth_fund_of_funds_raw',
            'kvic_investment_raw', 
            'kvic_fund_raw',
            'kvic_portfolio_raw',
            'pdf_analysis_results',
            'ai_trend_insights',
            'investment_intelligence_insights',
            'trend_reports'
        ];
        
        for (const tableName of expectedTables) {
            try {
                const { data, error } = await supabase
                    .from(tableName)
                    .select('*')
                    .limit(1);
                
                if (error) {
                    console.log(`❌ Table '${tableName}': ${error.message}`);
                } else {
                    console.log(`✅ Table '${tableName}': EXISTS`);
                }
            } catch (err) {
                console.log(`❌ Table '${tableName}': ERROR - ${err.message}`);
            }
        }
        
    } catch (error) {
        console.error('❌ Error verifying tables:', error.message);
    }
}

/**
 * Main setup function
 */
async function setupDatabase() {
    console.log('\n🚀 === STARTING DATABASE SETUP ===');
    
    const sqlFiles = [
        {
            path: 'sql/create_fund_of_funds_tables.sql',
            description: 'Fund of Funds Tables (KDB & K-Growth)'
        },
        {
            path: 'sql/create_kvic_tables.sql', 
            description: 'KVIC API Tables (Government VC Data)'
        },
        {
            path: 'sql/create_pdf_analysis_tables.sql',
            description: 'PDF AI Analysis Tables'
        }
    ];
    
    let successCount = 0;
    
    for (const sqlFile of sqlFiles) {
        const filePath = path.join(__dirname, sqlFile.path);
        const success = await executeSQLFile(filePath, sqlFile.description);
        if (success) successCount++;
        
        // Brief pause between operations
        await new Promise(resolve => setTimeout(resolve, 1000));
    }
    
    console.log(`\n📊 === SETUP SUMMARY ===`);
    console.log(`✅ Successfully executed: ${successCount}/${sqlFiles.length} SQL files`);
    
    if (successCount < sqlFiles.length) {
        console.log('\n💡 MANUAL SETUP REQUIRED:');
        console.log('1. Go to https://supabase.com/dashboard/projects');
        console.log('2. Select your project');
        console.log('3. Navigate to SQL Editor');
        console.log('4. Copy and paste each SQL file content and run:');
        
        sqlFiles.forEach((file, index) => {
            console.log(`   ${index + 1}. ${file.path}`);
        });
    }
    
    // Verify what was created
    await verifyTables();
    
    console.log('\n🎉 Database setup process completed!');
}

// Execute setup
(async () => {
    try {
        await setupDatabase();
    } catch (error) {
        console.error('💥 Database setup failed:', error);
        process.exit(1);
    }
})(); 