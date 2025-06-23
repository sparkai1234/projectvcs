// 📊 CSV EXPORT SCRIPT - Convert Supabase JSON data to CSV
// Easy manual inspection of downloaded data
// Date: June 10, 2025

const fs = require('fs').promises;
const path = require('path');

function jsonToCSV(jsonData, tableName) {
    if (!jsonData || jsonData.length === 0) {
        return `${tableName} - No data available\n`;
    }
    
    // Get all unique keys from all records
    const allKeys = [...new Set(jsonData.flatMap(obj => Object.keys(obj)))];
    
    // Create header row
    const header = allKeys.join(',');
    
    // Create data rows
    const rows = jsonData.map(record => {
        return allKeys.map(key => {
            const value = record[key];
            // Handle null/undefined values and escape commas/quotes
            if (value === null || value === undefined) return '';
            const stringValue = String(value);
            // If contains comma or quote, wrap in quotes and escape internal quotes
            if (stringValue.includes(',') || stringValue.includes('"') || stringValue.includes('\n')) {
                return `"${stringValue.replace(/"/g, '""')}"`;
            }
            return stringValue;
        }).join(',');
    });
    
    return [header, ...rows].join('\n');
}

async function exportToCSV() {
    console.log('📊 CSV EXPORT SCRIPT - Converting JSON to CSV');
    console.log('📁 Looking for downloaded data...\n');
    
    const downloadsDir = './supabase_downloads';
    const csvDir = './csv_exports';
    
    try {
        // Create CSV export directory
        await fs.mkdir(csvDir, { recursive: true });
        
        // Read all JSON files from downloads directory
        const files = await fs.readdir(downloadsDir);
        const jsonFiles = files.filter(file => file.endsWith('.json') && file !== 'validation_summary.json');
        
        console.log(`Found ${jsonFiles.length} data files to convert...\n`);
        
        for (const filename of jsonFiles) {
            try {
                console.log(`🔄 Converting ${filename}...`);
                
                // Read JSON data
                const jsonPath = path.join(downloadsDir, filename);
                const jsonContent = await fs.readFile(jsonPath, 'utf8');
                const jsonData = JSON.parse(jsonContent);
                
                // Get table name from filename
                const tableName = filename.replace('_downloaded.json', '');
                
                // Convert to CSV
                const csvContent = jsonToCSV(jsonData, tableName);
                
                // Save CSV file
                const csvFilename = `${tableName}.csv`;
                const csvPath = path.join(csvDir, csvFilename);
                await fs.writeFile(csvPath, csvContent);
                
                console.log(`   ✅ Converted ${jsonData.length} records to ${csvFilename}`);
                
            } catch (err) {
                console.error(`   ❌ Failed to convert ${filename}:`, err.message);
            }
        }
        
        // Create summary of what was exported
        const summaryContent = `DIVA Supabase Data Export Summary
Generated: ${new Date().toISOString()}
Source: Supabase production database
Total Files: ${jsonFiles.length}

Files Exported:
${jsonFiles.map(f => `- ${f.replace('_downloaded.json', '.csv')}`).join('\n')}

Usage:
- Open CSV files in Excel/Google Sheets for manual inspection
- Compare with your validation dataset
- Look for data quality, completeness, and accuracy
- Verify Korean text encoding is correct
- Check company names, financial figures, and dates

Expected Record Counts:
- diva_investment_performance: 333 records
- diva_financial_statements: 500 records (250 Balance + 250 Income)
- diva_association_status: 2,231 records
- diva_personnel_status: 251 records
- diva_professional_personnel: 1,685 records
- diva_violations: 92 records
- diva_vc_map: 251 records
TOTAL: 5,343 records
`;
        
        await fs.writeFile(path.join(csvDir, 'README.txt'), summaryContent);
        
        console.log('\n🎯 CSV EXPORT COMPLETE!');
        console.log(`📁 CSV files saved to: ${csvDir}/`);
        console.log('📊 Open CSV files in Excel/Google Sheets for manual review');
        console.log('✅ Ready for validation against your control dataset!');
        
    } catch (error) {
        console.error('❌ CSV export failed:', error);
    }
}

// Run the export
if (require.main === module) {
    exportToCSV().catch(console.error);
}

module.exports = { exportToCSV, jsonToCSV }; 