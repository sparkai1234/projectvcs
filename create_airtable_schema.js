// Script to create proper Airtable schema for Korean VC/Fund data

const https = require('https');
require('dotenv').config();

const AIRTABLE_API_KEY = process.env.AIRTABLE_API_KEY;
const AIRTABLE_BASE_ID = process.env.AIRTABLE_BASE_ID;

if (!AIRTABLE_API_KEY || !AIRTABLE_BASE_ID) {
    console.error('Error: Missing AIRTABLE_API_KEY or AIRTABLE_BASE_ID in .env file');
    process.exit(1);
}

// Function to make API requests to Airtable
const makeAirtableRequest = (path, method = 'GET', data = null) => {
    return new Promise((resolve, reject) => {
        const options = {
            hostname: 'api.airtable.com',
            path: `/v0/meta/bases/${AIRTABLE_BASE_ID}${path}`,
            method: method,
            headers: {
                'Authorization': `Bearer ${AIRTABLE_API_KEY}`,
                'Content-Type': 'application/json'
            }
        };

        if (data) {
            options.headers['Content-Length'] = Buffer.byteLength(JSON.stringify(data));
        }

        const req = https.request(options, (res) => {
            let responseBody = '';
            res.on('data', (chunk) => {
                responseBody += chunk;
            });
            res.on('end', () => {
                try {
                    const result = JSON.parse(responseBody);
                    if (res.statusCode >= 200 && res.statusCode < 300) {
                        resolve(result);
                    } else {
                        reject(new Error(`HTTP ${res.statusCode}: ${responseBody}`));
                    }
                } catch (error) {
                    reject(new Error(`Failed to parse response: ${error.message}`));
                }
            });
        });

        req.on('error', (error) => {
            reject(error);
        });

        if (data) {
            req.write(JSON.stringify(data));
        }
        req.end();
    });
};

// Define the field structure for Korean VC/Fund data
const createFieldStructure = () => {
    return [
        {
            name: 'Company Name (Korean)',
            type: 'singleLineText',
            description: 'Korean company name (operInstNm)'
        },
        {
            name: 'Company ID',
            type: 'singleLineText',
            description: 'Unique company identifier (operInstId)'
        },
        {
            name: 'Industry',
            type: 'singleLineText',
            description: 'Company industry category (comIndNm)'
        },
        {
            name: 'Location',
            type: 'singleLineText',
            description: 'Company location (sigunguNm)'
        },
        {
            name: 'Founded',
            type: 'singleLineText',
            description: 'Years since founding (foundYy)'
        },
        {
            name: 'Company Type',
            type: 'singleLineText',
            description: 'Type of company (operInstTpNm)'
        },
        {
            name: 'Operating Scale',
            type: 'singleLineText',
            description: 'Operating scale code (operScaleCd)'
        },
        {
            name: 'Operating Amount',
            type: 'number',
            options: {
                precision: 1
            },
            description: 'Operating amount in millions (operBoundAmt)'
        },
        {
            name: 'Business Category',
            type: 'singleLineText',
            description: 'Business category code (comBzcarrCd)'
        },
        {
            name: 'Zip Code',
            type: 'singleLineText',
            description: 'Head office zip code (headofcZipcd)'
        },
        {
            name: 'Strategy Planner',
            type: 'singleSelect',
            options: {
                choices: [
                    { name: 'Yes' },
                    { name: 'No' }
                ]
            },
            description: 'Has strategy planner (strtplanerYn)'
        },
        {
            name: 'PF Angel',
            type: 'singleSelect',
            options: {
                choices: [
                    { name: 'Yes' },
                    { name: 'No' }
                ]
            },
            description: 'PF Angel status (pfAnglYn)'
        },
        {
            name: 'Data Type',
            type: 'singleSelect',
            options: {
                choices: [
                    { name: 'VC Company' },
                    { name: 'Fund Company' }
                ]
            },
            description: 'Whether this is VC or Fund data'
        },
        {
            name: 'Import Date',
            type: 'dateTime',
            description: 'When this record was imported'
        }
    ];
};

async function createTableSchema() {
    try {
        console.log('🔄 Getting current base schema...');
        
        // Get current base info
        const baseInfo = await makeAirtableRequest('/tables');
        console.log(`📊 Found ${baseInfo.tables.length} tables in base`);
        
        // Find VC and Fund tables
        const vcTable = baseInfo.tables.find(table => table.name === 'VC Table');
        const fundTable = baseInfo.tables.find(table => table.name === 'Fund Table');
        
        if (!vcTable || !fundTable) {
            console.error('❌ Could not find VC Table or Fund Table');
            return;
        }
        
        console.log(`📋 VC Table ID: ${vcTable.id}`);
        console.log(`📋 Fund Table ID: ${fundTable.id}`);
        
        // Create field structure
        const fields = createFieldStructure();
        
        // Add fields to both tables
        for (const table of [vcTable, fundTable]) {
            console.log(`\n🔧 Adding fields to ${table.name}...`);
            
            for (const field of fields) {
                try {
                    // Check if field already exists
                    const existingField = table.fields.find(f => f.name === field.name);
                    if (existingField) {
                        console.log(`   ⏭️  Field "${field.name}" already exists`);
                        continue;
                    }
                    
                    // Create the field
                    await makeAirtableRequest(`/tables/${table.id}/fields`, 'POST', field);
                    console.log(`   ✅ Created field: ${field.name}`);
                    
                    // Small delay to avoid rate limits
                    await new Promise(resolve => setTimeout(resolve, 100));
                } catch (error) {
                    console.log(`   ❌ Failed to create field "${field.name}": ${error.message}`);
                }
            }
        }
        
        console.log('\n🎉 Schema creation completed!');
        console.log('\n📝 Next steps:');
        console.log('1. Check your Airtable tables for the new fields');
        console.log('2. Run the updated scraper scripts to populate data');
        
    } catch (error) {
        console.error('❌ Error creating schema:', error.message);
    }
}

createTableSchema(); 