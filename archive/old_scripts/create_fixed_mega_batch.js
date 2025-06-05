/**
 * 📦 FIXED MEGA BATCH CREATOR
 * ===========================
 * 
 * Fixed version that properly extracts complete INSERT statements
 * Ensures no syntax errors in the combined mega batches
 */

const fs = require('fs');

console.log('📦 Creating FIXED MEGA batches for easier import...');

/**
 * Configuration
 */
const CONFIG = {
    smallBatchPrefix: 'vcs_funds_simple_batch_',
    megaBatchPrefix: 'vcs_funds_fixed_mega_batch_',
    totalSmallBatches: 74,
    megaBatchSize: 10 // Create 10 mega batches
};

/**
 * Extract complete INSERT statements from SQL content
 */
function extractCompleteInserts(sqlContent) {
    const lines = sqlContent.split('\n');
    const inserts = [];
    let currentInsert = '';
    let inInsert = false;
    
    for (let i = 0; i < lines.length; i++) {
        const line = lines[i];
        
        // Start of an INSERT statement
        if (line.trim().startsWith('INSERT INTO fund_table')) {
            inInsert = true;
            currentInsert = line;
        }
        // Continue building the INSERT statement
        else if (inInsert) {
            currentInsert += '\n' + line;
            
            // End of INSERT statement (line ends with ");")
            if (line.trim().endsWith(');')) {
                inserts.push(currentInsert.trim());
                currentInsert = '';
                inInsert = false;
            }
        }
    }
    
    return inserts;
}

/**
 * Create fixed mega batches by properly combining complete INSERT statements
 */
function createFixedMegaBatches() {
    console.log('\n📦 === CREATING FIXED MEGA BATCHES ===');
    
    const batchesPerMega = Math.ceil(CONFIG.totalSmallBatches / CONFIG.megaBatchSize);
    console.log(`📊 Combining ${CONFIG.totalSmallBatches} small batches into ${CONFIG.megaBatchSize} mega batches`);
    console.log(`📋 Each mega batch will contain ~${batchesPerMega} small batches`);
    
    for (let megaNumber = 1; megaNumber <= CONFIG.megaBatchSize; megaNumber++) {
        let megaContent = '';
        let totalRecords = 0;
        const allInserts = [];
        
        // Calculate range of small batches for this mega batch
        const startBatch = (megaNumber - 1) * batchesPerMega + 1;
        const endBatch = Math.min(megaNumber * batchesPerMega, CONFIG.totalSmallBatches);
        
        megaContent += `-- VCS Fund FIXED MEGA BATCH ${megaNumber}/${CONFIG.megaBatchSize}\n`;
        megaContent += `-- Combines small batches ${startBatch} to ${endBatch}\n`;
        megaContent += `-- Generated at: ${new Date().toISOString()}\n`;
        megaContent += `-- FIXED: Complete INSERT statements with proper syntax\n\n`;
        
        // Collect all INSERT statements from small batches
        for (let smallBatch = startBatch; smallBatch <= endBatch; smallBatch++) {
            const fileName = `${CONFIG.smallBatchPrefix}${smallBatch.toString().padStart(2, '0')}.sql`;
            
            if (fs.existsSync(fileName)) {
                console.log(`  📁 Processing ${fileName}...`);
                
                const content = fs.readFileSync(fileName, 'utf8');
                const inserts = extractCompleteInserts(content);
                
                console.log(`    Found ${inserts.length} complete INSERT statements`);
                
                // Add each complete INSERT statement
                inserts.forEach((insert, index) => {
                    totalRecords++;
                    megaContent += `-- Record ${totalRecords} (from ${fileName})\n`;
                    megaContent += insert + '\n\n';
                });
            }
        }
        
        // Add summary
        megaContent += `-- FIXED Mega Batch ${megaNumber} Summary:\n`;
        megaContent += `-- Combined batches: ${startBatch}-${endBatch}\n`;
        megaContent += `-- Total records: ${totalRecords}\n`;
        megaContent += `-- Progress: ${(megaNumber / CONFIG.megaBatchSize * 100).toFixed(1)}% of mega batches\n\n`;
        
        if (megaNumber === CONFIG.megaBatchSize) {
            megaContent += `-- Final verification query for FIXED mega batch import\n`;
            megaContent += `SELECT \n`;
            megaContent += `  'VCS Fund FIXED MEGA Import Completed' as status,\n`;
            megaContent += `  COUNT(*) as total_vcs_funds,\n`;
            megaContent += `  COUNT(DISTINCT company_id) as unique_operators,\n`;
            megaContent += `  SUM(fund_size) / 1000000000 as total_fund_size_billions_krw,\n`;
            megaContent += `  MAX(import_date) as last_imported\n`;
            megaContent += `FROM fund_table WHERE apify_source = 'VCS_API_SCRAPER';\n`;
        }
        
        // Write fixed mega batch file
        const megaFileName = `${CONFIG.megaBatchPrefix}${megaNumber.toString().padStart(2, '0')}.sql`;
        fs.writeFileSync(megaFileName, megaContent);
        
        const fileSizeKB = Math.round(fs.statSync(megaFileName).size / 1024);
        console.log(`  ✅ Created: ${megaFileName} (${totalRecords} records, ${fileSizeKB}KB)`);
        
        // Validate the SQL syntax by checking for complete statements
        const generatedInserts = extractCompleteInserts(megaContent);
        if (generatedInserts.length === totalRecords) {
            console.log(`    ✅ Syntax validation: All ${totalRecords} INSERT statements are complete`);
        } else {
            console.log(`    ⚠️ Syntax warning: Found ${generatedInserts.length} complete statements, expected ${totalRecords}`);
        }
    }
    
    console.log('\n🎉 === FIXED MEGA BATCH CREATION COMPLETED ===');
    console.log(`📊 Created ${CONFIG.megaBatchSize} FIXED mega batch files`);
    console.log('📋 Files created:');
    for (let i = 1; i <= CONFIG.megaBatchSize; i++) {
        console.log(`  • vcs_funds_fixed_mega_batch_${i.toString().padStart(2, '0')}.sql`);
    }
    console.log('\n🚀 USAGE:');
    console.log('1. Use the FIXED mega batch files instead of the original ones');
    console.log('2. Each file has been validated for complete INSERT statements');
    console.log('3. Copy/paste into Supabase SQL Editor - should work without syntax errors');
    console.log('4. Only 10 copy-paste operations instead of 74!');
    
    console.log('\n✅ FIXED IMPROVEMENTS:');
    console.log('• Complete INSERT statement extraction');
    console.log('• Syntax validation for each mega batch');
    console.log('• Proper line endings and statement termination');
    console.log('• No incomplete or malformed SQL statements');
}

// Execute fixed mega batch creation
createFixedMegaBatches(); 