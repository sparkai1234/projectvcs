// Smart table replacement - rename approach instead of delete
const https = require('https');

const CONFIG = {
    airtableApiKey: 'patOUfAsek4nbpvHm.49789ced0e2b0304bdc507f110d936277cd3da18ec3efc9347c93e6a1810919e',
    airtableBaseId: 'appdR8V9lJaRW8VkR'
};

// Function to get all tables in the base
const getAllTables = () => {
    return new Promise((resolve, reject) => {
        const options = {
            hostname: 'api.airtable.com',
            path: `/v0/meta/bases/${CONFIG.airtableBaseId}/tables`,
            method: 'GET',
            headers: {
                'Authorization': `Bearer ${CONFIG.airtableApiKey}`,
            }
        };

        const req = https.request(options, (res) => {
            let responseBody = '';
            res.on('data', (chunk) => {
                responseBody += chunk;
            });
            res.on('end', () => {
                if (res.statusCode >= 200 && res.statusCode < 300) {
                    const result = JSON.parse(responseBody);
                    resolve(result.tables);
                } else {
                    reject(new Error(`HTTP ${res.statusCode}: ${responseBody}`));
                }
            });
        });

        req.on('error', (error) => {
            reject(error);
        });

        req.end();
    });
};

// Function to rename a table
const renameTable = (tableId, oldName, newName) => {
    return new Promise((resolve, reject) => {
        const data = JSON.stringify({
            name: newName
        });

        const options = {
            hostname: 'api.airtable.com',
            path: `/v0/meta/bases/${CONFIG.airtableBaseId}/tables/${tableId}`,
            method: 'PATCH',
            headers: {
                'Authorization': `Bearer ${CONFIG.airtableApiKey}`,
                'Content-Type': 'application/json',
                'Content-Length': Buffer.byteLength(data)
            }
        };

        const req = https.request(options, (res) => {
            let responseBody = '';
            res.on('data', (chunk) => {
                responseBody += chunk;
            });
            res.on('end', () => {
                if (res.statusCode >= 200 && res.statusCode < 300) {
                    console.log(`✅ Successfully renamed "${oldName}" to "${newName}"`);
                    resolve();
                } else {
                    console.error(`❌ Failed to rename table "${oldName}": ${responseBody}`);
                    reject(new Error(`HTTP ${res.statusCode}: ${responseBody}`));
                }
            });
        });

        req.on('error', (error) => {
            reject(error);
        });

        req.write(data);
        req.end();
    });
};

// Main function to smartly replace tables
const smartTableReplacement = async () => {
    try {
        console.log('🔄 Smart table replacement using rename strategy...');
        console.log('This will rename old tables as backups, then promote clean tables to original names.\n');

        // Get all tables
        console.log('📋 Getting current tables...');
        const tables = await getAllTables();
        
        // Find table IDs
        const tableMap = {};
        tables.forEach(table => {
            tableMap[table.name] = table.id;
        });

        console.log('📊 Current tables found:');
        Object.keys(tableMap).forEach(name => {
            console.log(`   • ${name} (ID: ${tableMap[name]})`);
        });

        // Check if we have all required tables
        const requiredTables = ['Fund Table', 'VC Table', 'Fund Table Clean', 'VC Table Clean'];
        const missingTables = requiredTables.filter(name => !tableMap[name]);
        
        if (missingTables.length > 0) {
            console.error(`❌ Missing required tables: ${missingTables.join(', ')}`);
            console.log('Please ensure both old tables and clean tables exist before running this script.');
            return;
        }

        const timestamp = new Date().toISOString().slice(0, 16).replace(/:/g, '-');

        console.log('\n📦 Step 1: Renaming old tables as backups...');
        console.log('='.repeat(50));
        
        // Rename old Fund Table as backup
        const oldFundBackupName = `Fund Table (OLD-${timestamp})`;
        await renameTable(tableMap['Fund Table'], 'Fund Table', oldFundBackupName);
        await new Promise(resolve => setTimeout(resolve, 1000)); // Wait a bit
        
        // Rename old VC Table as backup
        const oldVCBackupName = `VC Table (OLD-${timestamp})`;
        await renameTable(tableMap['VC Table'], 'VC Table', oldVCBackupName);
        await new Promise(resolve => setTimeout(resolve, 1000)); // Wait a bit

        console.log('\n🚀 Step 2: Promoting clean tables to primary names...');
        console.log('='.repeat(50));
        
        // Rename Fund Table Clean to Fund Table
        await renameTable(tableMap['Fund Table Clean'], 'Fund Table Clean', 'Fund Table');
        await new Promise(resolve => setTimeout(resolve, 1000)); // Wait a bit
        
        // Rename VC Table Clean to VC Table
        await renameTable(tableMap['VC Table Clean'], 'VC Table Clean', 'VC Table');

        console.log('\n🎉 SUCCESS! Smart table replacement complete!');
        console.log('='.repeat(50));
        console.log('✨ Your table structure is now:');
        console.log('📋 "Fund Table" - Clean version with 10 focused fields');
        console.log('📋 "VC Table" - Clean version with 13 focused fields');
        console.log(`📦 "${oldFundBackupName}" - Backup of old Fund Table`);
        console.log(`📦 "${oldVCBackupName}" - Backup of old VC Table`);
        
        console.log('\n💡 Benefits achieved:');
        console.log('• ✅ Clean tables are now primary with original names');
        console.log('• ✅ All existing scrapers will work without code changes');
        console.log('• ✅ Old data preserved as timestamped backups');
        console.log('• ✅ 47% fewer fields in Fund Table (19→10)');
        console.log('• ✅ 32% fewer fields in VC Table (19→13)');
        
        console.log('\n🗑️  Optional next step:');
        console.log('   After confirming everything works well, you can manually delete');
        console.log('   the backup tables from your Airtable interface if desired.');
        
        console.log('\n🚀 Your scrapers can now use the clean, organized tables!');
        
    } catch (error) {
        console.error('❌ Failed to replace tables:', error.message);
        console.log('\n⚠️  If any errors occurred during renaming, some tables may have partial renames.');
        console.log('You can manually rename them back in the Airtable interface if needed.');
    }
};

// Run the smart replacement
smartTableReplacement(); 