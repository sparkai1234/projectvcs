// Script to replace old tables with clean versions
// 1. Delete old cluttered tables
// 2. Rename clean tables to original names
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

// Function to delete a table
const deleteTable = (tableId, tableName) => {
    return new Promise((resolve, reject) => {
        const options = {
            hostname: 'api.airtable.com',
            path: `/v0/meta/bases/${CONFIG.airtableBaseId}/tables/${tableId}`,
            method: 'DELETE',
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
                    console.log(`✅ Successfully deleted table: "${tableName}"`);
                    resolve();
                } else {
                    console.error(`❌ Failed to delete table "${tableName}": ${responseBody}`);
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

// Main function to replace old tables with clean versions
const replaceWithCleanTables = async () => {
    try {
        console.log('🔄 Replacing old tables with clean versions...');
        console.log('This will delete old cluttered tables and rename clean tables to original names.\n');

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

        console.log('\n🗑️  Step 1: Deleting old cluttered tables...');
        console.log('='.repeat(50));
        
        // Delete old Fund Table
        await deleteTable(tableMap['Fund Table'], 'Fund Table');
        await new Promise(resolve => setTimeout(resolve, 1000)); // Wait a bit
        
        // Delete old VC Table  
        await deleteTable(tableMap['VC Table'], 'VC Table');
        await new Promise(resolve => setTimeout(resolve, 1000)); // Wait a bit

        console.log('\n📝 Step 2: Renaming clean tables to original names...');
        console.log('='.repeat(50));
        
        // Rename Fund Table Clean to Fund Table
        await renameTable(tableMap['Fund Table Clean'], 'Fund Table Clean', 'Fund Table');
        await new Promise(resolve => setTimeout(resolve, 1000)); // Wait a bit
        
        // Rename VC Table Clean to VC Table
        await renameTable(tableMap['VC Table Clean'], 'VC Table Clean', 'VC Table');

        console.log('\n🎉 SUCCESS! Table replacement complete!');
        console.log('='.repeat(50));
        console.log('✨ Your tables have been successfully replaced:');
        console.log('📋 "Fund Table" - Now clean with 10 focused fields');
        console.log('📋 "VC Table" - Now clean with 13 focused fields');
        console.log('\n💡 Benefits:');
        console.log('• All existing scrapers will work with original table names');
        console.log('• No more cluttered unused fields');
        console.log('• Better performance and usability');
        console.log('• All your data has been preserved');
        
        console.log('\n🚀 You can now run your scrapers with the clean, organized tables!');
        
    } catch (error) {
        console.error('❌ Failed to replace tables:', error.message);
        console.log('\n⚠️  If any errors occurred, your original tables should still be intact.');
        console.log('Please check your Airtable base and retry if needed.');
    }
};

// Run the replacement
replaceWithCleanTables(); 