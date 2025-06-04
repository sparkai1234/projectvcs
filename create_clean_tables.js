// Script to create new clean tables with only essential fields and migrate data
const https = require('https');

const CONFIG = {
    airtableApiKey: 'patOUfAsek4nbpvHm.49789ced0e2b0304bdc507f110d936277cd3da18ec3efc9347c93e6a1810919e',
    airtableBaseId: 'appdR8V9lJaRW8VkR'
};

// Define clean table structures with only essential fields
const CLEAN_TABLE_STRUCTURES = {
    'Fund Table Clean': {
        description: 'Clean version of Fund Table with only essential fields',
        fields: [
            {
                name: 'Name',
                type: 'singleLineText',
                description: 'Fund name'
            },
            {
                name: 'Company Name (Korean)',
                type: 'singleLineText',
                description: 'Operating company name in Korean'
            },
            {
                name: 'Company ID',
                type: 'singleLineText',
                description: 'Unique company identifier'
            },
            {
                name: 'Industry',
                type: 'singleLineText',
                description: 'Investment field/industry'
            },
            {
                name: 'Founded',
                type: 'singleLineText',
                description: 'Registration/founding date'
            },
            {
                name: 'Operating Amount',
                type: 'number',
                options: {
                    precision: 1
                },
                description: 'Fund amount in billions KRW'
            },
            {
                name: 'Business Category',
                type: 'singleLineText',
                description: 'Investment character code'
            },
            {
                name: 'Data Type',
                type: 'singleSelect',
                options: {
                    choices: [
                        { name: 'Fund Company' },
                        { name: 'VC Company' }
                    ]
                },
                description: 'Type of entity'
            },
            {
                name: 'Status',
                type: 'singleSelect',
                options: {
                    choices: [
                        { name: 'Todo', color: 'redBright' },
                        { name: 'In progress', color: 'yellowBright' },
                        { name: 'Done', color: 'greenBright' }
                    ]
                },
                description: 'Processing status'
            },
            {
                name: 'Notes',
                type: 'multilineText',
                description: 'Detailed fund information'
            }
        ]
    },
    'VC Table Clean': {
        description: 'Clean version of VC Table with only essential fields',
        fields: [
            {
                name: 'Company Name',
                type: 'singleLineText',
                description: 'Company name'
            },
            {
                name: 'Company Name (Korean)',
                type: 'singleLineText',
                description: 'Company name in Korean'
            },
            {
                name: 'Company ID',
                type: 'singleLineText',
                description: 'Unique company identifier'
            },
            {
                name: 'Industry',
                type: 'singleLineText',
                description: 'Industry sector'
            },
            {
                name: 'Location',
                type: 'singleLineText',
                description: 'Company location'
            },
            {
                name: 'Founded',
                type: 'singleLineText',
                description: 'Company age/founding info'
            },
            {
                name: 'Company Type',
                type: 'singleLineText',
                description: 'Type of company (LLC, etc.)'
            },
            {
                name: 'Operating Scale',
                type: 'singleLineText',
                description: 'Operating scale code'
            },
            {
                name: 'Operating Amount',
                type: 'number',
                options: {
                    precision: 1
                },
                description: 'Operating amount'
            },
            {
                name: 'Business Category',
                type: 'singleLineText',
                description: 'Business category code'
            },
            {
                name: 'Zip Code',
                type: 'singleLineText',
                description: 'Postal code'
            },
            {
                name: 'Strategy Planner',
                type: 'singleSelect',
                options: {
                    choices: [
                        { name: 'Yes', color: 'greenBright' },
                        { name: 'No', color: 'grayBright' }
                    ]
                },
                description: 'Has strategy planner'
            },
            {
                name: 'Notes',
                type: 'multilineText',
                description: 'Detailed company information'
            }
        ]
    }
};

// Function to create a new table
const createTable = (tableName, tableStructure) => {
    return new Promise((resolve, reject) => {
        const data = JSON.stringify({
            name: tableName,
            description: tableStructure.description,
            fields: tableStructure.fields
        });

        const options = {
            hostname: 'api.airtable.com',
            path: `/v0/meta/bases/${CONFIG.airtableBaseId}/tables`,
            method: 'POST',
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
                    const result = JSON.parse(responseBody);
                    console.log(`✅ Successfully created table: "${tableName}"`);
                    console.log(`   📋 Table ID: ${result.id}`);
                    console.log(`   🔧 Fields: ${result.fields.length} fields created`);
                    resolve(result);
                } else {
                    console.error(`❌ Failed to create table "${tableName}": ${responseBody}`);
                    reject(new Error(`HTTP ${res.statusCode}: ${responseBody}`));
                }
            });
        });

        req.on('error', (error) => {
            console.error(`❌ Error creating table "${tableName}":`, error.message);
            reject(error);
        });

        req.write(data);
        req.end();
    });
};

// Function to get existing records from a table
const getExistingRecords = (tableName) => {
    return new Promise((resolve, reject) => {
        const getAllRecords = async (offset = '') => {
            const path = `/v0/${CONFIG.airtableBaseId}/${encodeURIComponent(tableName)}?maxRecords=100${offset ? `&offset=${offset}` : ''}`;
            
            const options = {
                hostname: 'api.airtable.com',
                path: path,
                method: 'GET',
                headers: {
                    'Authorization': `Bearer ${CONFIG.airtableApiKey}`,
                }
            };

            return new Promise((resolve, reject) => {
                const req = https.request(options, (res) => {
                    let responseBody = '';
                    res.on('data', (chunk) => {
                        responseBody += chunk;
                    });
                    res.on('end', () => {
                        if (res.statusCode >= 200 && res.statusCode < 300) {
                            resolve(JSON.parse(responseBody));
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

        const allRecords = [];
        const fetchBatch = async (offset = '') => {
            try {
                const result = await getAllRecords(offset);
                allRecords.push(...result.records);
                
                if (result.offset) {
                    await fetchBatch(result.offset);
                }
            } catch (error) {
                throw error;
            }
        };

        fetchBatch().then(() => resolve(allRecords)).catch(reject);
    });
};

// Function to migrate data from old table to new table
const migrateData = async (oldTableName, newTableName, fieldMapping) => {
    try {
        console.log(`\n📦 Migrating data from "${oldTableName}" to "${newTableName}"...`);
        
        // Get existing records
        const existingRecords = await getExistingRecords(oldTableName);
        console.log(`📊 Found ${existingRecords.length} records to migrate`);
        
        if (existingRecords.length === 0) {
            console.log('ℹ️  No records to migrate');
            return;
        }

        // Transform records for new table
        const transformedRecords = existingRecords.map(record => {
            const newFields = {};
            Object.keys(fieldMapping).forEach(newFieldName => {
                const oldFieldName = fieldMapping[newFieldName];
                if (record.fields[oldFieldName] !== undefined) {
                    newFields[newFieldName] = record.fields[oldFieldName];
                }
            });
            return { fields: newFields };
        });

        // Send data in batches of 10
        let migratedCount = 0;
        for (let i = 0; i < transformedRecords.length; i += 10) {
            const batch = transformedRecords.slice(i, i + 10);
            
            const data = JSON.stringify({ records: batch });
            
            const options = {
                hostname: 'api.airtable.com',
                path: `/v0/${CONFIG.airtableBaseId}/${encodeURIComponent(newTableName)}`,
                method: 'POST',
                headers: {
                    'Authorization': `Bearer ${CONFIG.airtableApiKey}`,
                    'Content-Type': 'application/json',
                    'Content-Length': Buffer.byteLength(data)
                }
            };

            await new Promise((resolve, reject) => {
                const req = https.request(options, (res) => {
                    let responseBody = '';
                    res.on('data', (chunk) => {
                        responseBody += chunk;
                    });
                    res.on('end', () => {
                        if (res.statusCode >= 200 && res.statusCode < 300) {
                            migratedCount += batch.length;
                            console.log(`   ✅ Migrated batch ${Math.floor(i / 10) + 1} (${migratedCount}/${existingRecords.length} records)`);
                            resolve();
                        } else {
                            console.error(`❌ Failed to migrate batch: ${responseBody}`);
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

            // Small delay between batches
            await new Promise(resolve => setTimeout(resolve, 200));
        }

        console.log(`🎉 Successfully migrated ${migratedCount} records to "${newTableName}"`);
        
    } catch (error) {
        console.error(`❌ Migration failed for ${oldTableName}:`, error.message);
    }
};

// Main function to create clean tables
const createCleanTables = async () => {
    try {
        console.log('🚀 Creating clean tables with only essential fields...');
        console.log('This approach creates new tables rather than modifying existing ones.\n');

        // Create clean Fund Table
        console.log('🏦 Creating clean Fund Table...');
        console.log('='.repeat(50));
        
        try {
            const fundTable = await createTable('Fund Table Clean', CLEAN_TABLE_STRUCTURES['Fund Table Clean']);
            
            // Define field mapping for Fund Table
            const fundFieldMapping = {
                'Name': 'Name',
                'Company Name (Korean)': 'Company Name (Korean)',
                'Company ID': 'Company ID',
                'Industry': 'Industry',
                'Founded': 'Founded',
                'Operating Amount': 'Operating Amount',
                'Business Category': 'Business Category',
                'Data Type': 'Data Type',
                'Status': 'Status',
                'Notes': 'Notes'
            };
            
            await migrateData('Fund Table', 'Fund Table Clean', fundFieldMapping);
            
        } catch (error) {
            if (error.message.includes('DUPLICATE_TABLE_NAME')) {
                console.log('ℹ️  Table "Fund Table Clean" already exists - skipping creation');
            } else {
                throw error;
            }
        }

        // Create clean VC Table
        console.log('\n🧪 Creating clean VC Table...');
        console.log('='.repeat(50));
        
        try {
            const vcTable = await createTable('VC Table Clean', CLEAN_TABLE_STRUCTURES['VC Table Clean']);
            
            // Define field mapping for VC Table
            const vcFieldMapping = {
                'Company Name': 'Company Name',
                'Company Name (Korean)': 'Company Name (Korean)',
                'Company ID': 'Company ID',
                'Industry': 'Industry',
                'Location': 'Location',
                'Founded': 'Founded',
                'Company Type': 'Company Type',
                'Operating Scale': 'Operating Scale',
                'Operating Amount': 'Operating Amount',
                'Business Category': 'Business Category',
                'Zip Code': 'Zip Code',
                'Strategy Planner': 'Strategy Planner',
                'Notes': 'Notes'
            };
            
            await migrateData('VC Table', 'VC Table Clean', vcFieldMapping);
            
        } catch (error) {
            if (error.message.includes('DUPLICATE_TABLE_NAME')) {
                console.log('ℹ️  Table "VC Table Clean" already exists - skipping creation');
            } else {
                throw error;
            }
        }

        console.log('\n🎉 CLEAN TABLES CREATED!');
        console.log('='.repeat(50));
        console.log('✨ New clean tables with only essential fields have been created!');
        console.log('📋 Fund Table Clean: 10 focused fields');
        console.log('📋 VC Table Clean: 13 focused fields');
        console.log('\n💡 Next steps:');
        console.log('1. Review the new clean tables in Airtable');
        console.log('2. Verify the data migration was successful');
        console.log('3. Update your scrapers to use the new clean tables');
        console.log('4. Archive or delete the old tables when satisfied');
        
    } catch (error) {
        console.error('❌ Failed to create clean tables:', error.message);
    }
};

// Run the clean table creation
createCleanTables(); 