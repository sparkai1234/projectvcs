/**
 * 📦 MEGA BATCH CREATOR
 * ====================
 * 
 * Combines 74 small batches into 10 larger batches
 * Reduces manual work from 74 copy-pastes to just 10!
 */

const fs = require('fs');

console.log('📦 Creating MEGA batches for easier import...');

/**
 * Configuration
 */
const CONFIG = {
    smallBatchPrefix: 'vcs_funds_simple_batch_',
    megaBatchPrefix: 'vcs_funds_mega_batch_',
    totalSmallBatches: 74,
    recordsPerMegaBatch: 400, // ~400 records per mega batch
    megaBatchSize: 10 // Create 10 mega batches
};

/**
 * Create mega batches by combining small batches
 */
function createMegaBatches() {
    console.log('\n📦 === CREATING MEGA BATCHES ===');
    
    const batchesPerMega = Math.ceil(CONFIG.totalSmallBatches / CONFIG.megaBatchSize);
    console.log(`📊 Combining ${CONFIG.totalSmallBatches} small batches into ${CONFIG.megaBatchSize} mega batches`);
    console.log(`📋 Each mega batch will contain ~${batchesPerMega} small batches`);
    
    for (let megaNumber = 1; megaNumber <= CONFIG.megaBatchSize; megaNumber++) {
        let megaContent = '';
        let totalRecords = 0;
        
        // Calculate range of small batches for this mega batch
        const startBatch = (megaNumber - 1) * batchesPerMega + 1;
        const endBatch = Math.min(megaNumber * batchesPerMega, CONFIG.totalSmallBatches);
        
        megaContent += `-- VCS Fund MEGA BATCH ${megaNumber}/${CONFIG.megaBatchSize}\n`;
        megaContent += `-- Combines small batches ${startBatch} to ${endBatch}\n`;
        megaContent += `-- Generated at: ${new Date().toISOString()}\n`;
        megaContent += `-- MEGA BATCH: Larger batches for faster import\n\n`;
        
        // Combine small batches
        for (let smallBatch = startBatch; smallBatch <= endBatch; smallBatch++) {
            const fileName = `${CONFIG.smallBatchPrefix}${smallBatch.toString().padStart(2, '0')}.sql`;
            
            if (fs.existsSync(fileName)) {
                console.log(`  📁 Adding ${fileName}...`);
                
                const content = fs.readFileSync(fileName, 'utf8');
                
                // Extract just the INSERT statements and record count
                const lines = content.split('\n');
                const insertLines = lines.filter(line => 
                    line.trim().startsWith('INSERT INTO fund_table') ||
                    line.trim().startsWith('  \'') ||
                    line.trim().startsWith('  ') && line.includes('\'') ||
                    line.trim().endsWith(');')
                );
                
                // Count records in this batch
                const recordCount = lines.filter(line => line.includes('-- Record')).length;
                totalRecords += recordCount;
                
                megaContent += `-- From ${fileName} (${recordCount} records)\n`;
                megaContent += insertLines.join('\n') + '\n\n';
            }
        }
        
        // Add summary
        megaContent += `-- Mega Batch ${megaNumber} Summary:\n`;
        megaContent += `-- Combined batches: ${startBatch}-${endBatch}\n`;
        megaContent += `-- Total records: ${totalRecords}\n`;
        megaContent += `-- Progress: ${(megaNumber / CONFIG.megaBatchSize * 100).toFixed(1)}% of mega batches\n\n`;
        
        if (megaNumber === CONFIG.megaBatchSize) {
            megaContent += `-- Final verification query for mega batch import\n`;
            megaContent += `SELECT \n`;
            megaContent += `  'VCS Fund MEGA Import Progress' as status,\n`;
            megaContent += `  COUNT(*) as total_vcs_funds,\n`;
            megaContent += `  COUNT(DISTINCT company_id) as unique_operators,\n`;
            megaContent += `  SUM(fund_size) / 1000000000 as total_fund_size_billions_krw\n`;
            megaContent += `FROM fund_table WHERE apify_source = 'VCS_API_SCRAPER';\n`;
        }
        
        // Write mega batch file
        const megaFileName = `${CONFIG.megaBatchPrefix}${megaNumber.toString().padStart(2, '0')}.sql`;
        fs.writeFileSync(megaFileName, megaContent);
        
        const fileSizeKB = Math.round(fs.statSync(megaFileName).size / 1024);
        console.log(`  ✅ Created: ${megaFileName} (${totalRecords} records, ${fileSizeKB}KB)`);
    }
    
    console.log('\n🎉 === MEGA BATCH CREATION COMPLETED ===');
    console.log(`📊 Created ${CONFIG.megaBatchSize} mega batch files`);
    console.log('📋 Files created:');
    for (let i = 1; i <= CONFIG.megaBatchSize; i++) {
        console.log(`  • vcs_funds_mega_batch_${i.toString().padStart(2, '0')}.sql`);
    }
    console.log('\n🚀 USAGE:');
    console.log('1. Copy/paste mega batch files into Supabase SQL Editor');
    console.log('2. Only 10 copy-paste operations instead of 74!');
    console.log('3. Each mega batch imports ~400 records');
    console.log('4. Much faster than individual small batches');
}

// Execute mega batch creation
createMegaBatches(); 