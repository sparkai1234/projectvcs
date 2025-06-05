/**
 * 📦 VCS BATCH SQL CREATOR
 * ========================
 * 
 * Splits the large VCS SQL file into smaller batches
 * for easier Supabase import
 */

const fs = require('fs');

console.log('📦 Creating batch SQL files for easier import...');

const inputFile = 'vcs_data_for_manual_import.sql';
const batchSize = 100; // Records per batch

if (!fs.existsSync(inputFile)) {
    console.error(`❌ Input file not found: ${inputFile}`);
    process.exit(1);
}

// Read the entire SQL file
const sqlContent = fs.readFileSync(inputFile, 'utf8');

// Split by INSERT statements
const lines = sqlContent.split('\n');
const insertLines = lines.filter(line => line.trim().startsWith('INSERT INTO'));

console.log(`📊 Found ${insertLines.length} INSERT statements`);

// Separate investors and funds
const investorInserts = insertLines.filter(line => line.includes('INSERT INTO vc_table'));
const fundInserts = insertLines.filter(line => line.includes('INSERT INTO fund_table'));

console.log(`👥 Investors: ${investorInserts.length} records`);
console.log(`💼 Funds: ${fundInserts.length} records`);

// Create batch files for investors
const investorBatches = Math.ceil(investorInserts.length / batchSize);
for (let i = 0; i < investorBatches; i++) {
    const start = i * batchSize;
    const end = Math.min(start + batchSize, investorInserts.length);
    const batchInserts = investorInserts.slice(start, end);
    
    let batchSQL = `-- VCS Investors Batch ${i + 1} of ${investorBatches}\n`;
    batchSQL += `-- Records ${start + 1} to ${end}\n`;
    batchSQL += `-- Generated at: ${new Date().toISOString()}\n\n`;
    
    // Get the corresponding lines from original content
    batchInserts.forEach(insertLine => {
        const lineIndex = lines.indexOf(insertLine);
        if (lineIndex !== -1) {
            // Include the INSERT and the closing statement
            batchSQL += lines[lineIndex] + '\n';
            if (lineIndex + 1 < lines.length && lines[lineIndex + 1].trim() === ');') {
                batchSQL += ');\n\n';
            } else {
                // Find the next line that ends the INSERT
                for (let j = lineIndex + 1; j < lines.length; j++) {
                    batchSQL += lines[j] + '\n';
                    if (lines[j].trim().endsWith(');')) {
                        batchSQL += '\n';
                        break;
                    }
                }
            }
        }
    });
    
    const filename = `vcs_investors_batch_${String(i + 1).padStart(2, '0')}.sql`;
    fs.writeFileSync(filename, batchSQL);
    console.log(`✅ Created: ${filename} (${end - start} records)`);
}

// Create batch files for funds  
const fundBatches = Math.ceil(fundInserts.length / batchSize);
for (let i = 0; i < fundBatches; i++) {
    const start = i * batchSize;
    const end = Math.min(start + batchSize, fundInserts.length);
    const batchInserts = fundInserts.slice(start, end);
    
    let batchSQL = `-- VCS Funds Batch ${i + 1} of ${fundBatches}\n`;
    batchSQL += `-- Records ${start + 1} to ${end}\n`;
    batchSQL += `-- Generated at: ${new Date().toISOString()}\n\n`;
    
    // Get the corresponding lines from original content
    batchInserts.forEach(insertLine => {
        const lineIndex = lines.indexOf(insertLine);
        if (lineIndex !== -1) {
            // Include the INSERT and the closing statement
            batchSQL += lines[lineIndex] + '\n';
            if (lineIndex + 1 < lines.length && lines[lineIndex + 1].trim() === ');') {
                batchSQL += ');\n\n';
            } else {
                // Find the next line that ends the INSERT
                for (let j = lineIndex + 1; j < lines.length; j++) {
                    batchSQL += lines[j] + '\n';
                    if (lines[j].trim().endsWith(');')) {
                        batchSQL += '\n';
                        break;
                    }
                }
            }
        }
    });
    
    const filename = `vcs_funds_batch_${String(i + 1).padStart(2, '0')}.sql`;
    fs.writeFileSync(filename, batchSQL);
    console.log(`✅ Created: ${filename} (${end - start} records)`);
}

console.log('\n🎉 Batch SQL files created successfully!');
console.log(`📊 Total batches created: ${investorBatches + fundBatches}`);
console.log(`👥 Investor batches: ${investorBatches} files`);
console.log(`💼 Fund batches: ${fundBatches} files`);
console.log('\n🚀 Next steps:');
console.log('1. Go to Supabase Dashboard → SQL Editor');
console.log('2. Run investor batch files first (vcs_investors_batch_*.sql)');
console.log('3. Then run fund batch files (vcs_funds_batch_*.sql)');
console.log('4. Each file contains 100 records for manageable imports'); 