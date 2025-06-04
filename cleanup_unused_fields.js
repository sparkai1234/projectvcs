// Script to automatically delete unused fields from both Fund Table and VC Table
const https = require('https');

const CONFIG = {
    airtableApiKey: 'patOUfAsek4nbpvHm.49789ced0e2b0304bdc507f110d936277cd3da18ec3efc9347c93e6a1810919e',
    airtableBaseId: 'appdR8V9lJaRW8VkR'
};

// Fields to delete from each table
const FIELDS_TO_DELETE = {
    'Fund Table': [
        'Attachments',
        'Location', 
        'Company Type',
        'Assignee',
        'Operating Scale',
        'Zip Code'
    ],
    'VC Table': [
        'Data Type',
        'PF Angel',
        'Assignee',
        'Status',
        'Attachments'
    ]
};

// Function to get table schema
const getTableSchema = (tableName) => {
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
                    const schema = JSON.parse(responseBody);
                    const targetTable = schema.tables.find(table => table.name === tableName);
                    resolve(targetTable);
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

// Function to delete a field
const deleteField = (tableId, fieldId, fieldName) => {
    return new Promise((resolve, reject) => {
        const options = {
            hostname: 'api.airtable.com',
            path: `/v0/meta/bases/${CONFIG.airtableBaseId}/tables/${tableId}/fields/${fieldId}`,
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
                    console.log(`✅ Successfully deleted field: "${fieldName}"`);
                    resolve(true);
                } else {
                    console.error(`❌ Failed to delete field "${fieldName}": ${responseBody}`);
                    reject(new Error(`HTTP ${res.statusCode}: ${responseBody}`));
                }
            });
        });

        req.on('error', (error) => {
            console.error(`❌ Error deleting field "${fieldName}":`, error.message);
            reject(error);
        });

        req.end();
    });
};

// Function to clean up a single table
const cleanupTable = async (tableName) => {
    try {
        console.log(`\n🧹 Cleaning up ${tableName}...`);
        console.log('='.repeat(40));
        
        // Get table schema
        const tableSchema = await getTableSchema(tableName);
        if (!tableSchema) {
            throw new Error(`Table "${tableName}" not found`);
        }
        
        const fieldsToDelete = FIELDS_TO_DELETE[tableName];
        if (!fieldsToDelete || fieldsToDelete.length === 0) {
            console.log(`ℹ️  No fields marked for deletion in ${tableName}`);
            return;
        }
        
        console.log(`📋 Found ${tableSchema.fields.length} total fields in ${tableName}`);
        console.log(`🎯 Will attempt to delete ${fieldsToDelete.length} unused fields...`);
        
        let deletedCount = 0;
        let skippedCount = 0;
        
        // Delete each field
        for (const fieldName of fieldsToDelete) {
            const field = tableSchema.fields.find(f => f.name === fieldName);
            
            if (field) {
                try {
                    await deleteField(tableSchema.id, field.id, fieldName);
                    deletedCount++;
                    
                    // Small delay between deletions to be nice to the API
                    await new Promise(resolve => setTimeout(resolve, 500));
                } catch (error) {
                    console.log(`⚠️  Skipped field "${fieldName}": ${error.message}`);
                    skippedCount++;
                }
            } else {
                console.log(`⚠️  Field "${fieldName}" not found in ${tableName} (may have been deleted already)`);
                skippedCount++;
            }
        }
        
        console.log(`\n📊 ${tableName} cleanup summary:`);
        console.log(`  ✅ Successfully deleted: ${deletedCount} fields`);
        console.log(`  ⚠️  Skipped/Failed: ${skippedCount} fields`);
        console.log(`  🎯 Table is now cleaner and more focused!`);
        
    } catch (error) {
        console.error(`❌ Failed to cleanup ${tableName}:`, error.message);
    }
};

// Main cleanup function
const cleanupUnusedFields = async () => {
    try {
        console.log('🚀 Starting automatic cleanup of unused fields...');
        console.log('This will make your tables cleaner and more focused!\n');
        
        // Cleanup both tables
        await cleanupTable('Fund Table');
        await cleanupTable('VC Table');
        
        console.log('\n🎉 CLEANUP COMPLETE!');
        console.log('='.repeat(50));
        console.log('✨ Your tables are now much cleaner and more focused!');
        console.log('📈 This will improve performance and usability');
        console.log('🔧 You can always add new fields later when needed');
        
    } catch (error) {
        console.error('❌ Cleanup failed:', error.message);
    }
};

// Run the cleanup
cleanupUnusedFields(); 