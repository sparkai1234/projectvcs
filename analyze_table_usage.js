// Script to analyze which fields are actually being used vs unused in both tables
const https = require('https');

const CONFIG = {
    airtableApiKey: 'patOUfAsek4nbpvHm.49789ced0e2b0304bdc507f110d936277cd3da18ec3efc9347c93e6a1810919e',
    airtableBaseId: 'appdR8V9lJaRW8VkR'
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

// Function to get sample records from a table
const getSampleRecords = (tableName, maxRecords = 10) => {
    return new Promise((resolve, reject) => {
        const options = {
            hostname: 'api.airtable.com',
            path: `/v0/${CONFIG.airtableBaseId}/${encodeURIComponent(tableName)}?maxRecords=${maxRecords}`,
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

// Function to analyze field usage
const analyzeFieldUsage = (tableSchema, sampleRecords) => {
    const fieldUsage = {};
    
    // Initialize all fields
    tableSchema.fields.forEach(field => {
        fieldUsage[field.name] = {
            type: field.type,
            totalRecords: sampleRecords.records.length,
            populatedRecords: 0,
            emptyRecords: 0,
            sampleValues: [],
            usage: 'unused'
        };
    });
    
    // Analyze sample records
    sampleRecords.records.forEach(record => {
        tableSchema.fields.forEach(field => {
            const fieldName = field.name;
            const value = record.fields[fieldName];
            
            if (value !== undefined && value !== null && value !== '') {
                fieldUsage[fieldName].populatedRecords++;
                if (fieldUsage[fieldName].sampleValues.length < 3) {
                    let displayValue = value;
                    if (typeof value === 'string' && value.length > 50) {
                        displayValue = value.substring(0, 50) + '...';
                    }
                    fieldUsage[fieldName].sampleValues.push(displayValue);
                }
            } else {
                fieldUsage[fieldName].emptyRecords++;
            }
        });
    });
    
    // Determine usage status
    Object.keys(fieldUsage).forEach(fieldName => {
        const field = fieldUsage[fieldName];
        const usagePercentage = (field.populatedRecords / field.totalRecords) * 100;
        
        if (usagePercentage === 0) {
            field.usage = 'completely_unused';
        } else if (usagePercentage < 20) {
            field.usage = 'rarely_used';
        } else if (usagePercentage < 80) {
            field.usage = 'partially_used';
        } else {
            field.usage = 'frequently_used';
        }
    });
    
    return fieldUsage;
};

// Main analysis function
const analyzeTableUsage = async () => {
    try {
        console.log('🔍 Analyzing field usage in both Fund Table and VC Table...\n');
        
        // Analyze Fund Table
        console.log('📊 FUND TABLE ANALYSIS');
        console.log('='.repeat(50));
        
        const fundTableSchema = await getTableSchema('Fund Table');
        const fundSampleRecords = await getSampleRecords('Fund Table', 10);
        const fundFieldUsage = analyzeFieldUsage(fundTableSchema, fundSampleRecords);
        
        console.log(`Analyzed ${fundSampleRecords.records.length} Fund Table records\n`);
        
        const fundUnused = [];
        const fundRarelyUsed = [];
        const fundUsed = [];
        
        Object.entries(fundFieldUsage).forEach(([fieldName, usage]) => {
            const usagePercent = ((usage.populatedRecords / usage.totalRecords) * 100).toFixed(0);
            const line = `"${fieldName}" (${usage.type}) - ${usagePercent}% populated`;
            
            if (usage.usage === 'completely_unused') {
                fundUnused.push(line);
            } else if (usage.usage === 'rarely_used') {
                fundRarelyUsed.push(line);
            } else {
                fundUsed.push(line + ` - Sample: ${usage.sampleValues.join(', ')}`);
            }
        });
        
        console.log('✅ FREQUENTLY USED FIELDS (Keep these):');
        fundUsed.forEach(field => console.log(`  ${field}`));
        
        console.log('\n⚠️  RARELY USED FIELDS (Consider removing):');
        fundRarelyUsed.forEach(field => console.log(`  ${field}`));
        
        console.log('\n❌ COMPLETELY UNUSED FIELDS (Definitely remove):');
        fundUnused.forEach(field => console.log(`  ${field}`));
        
        // Analyze VC Table
        console.log('\n\n📊 VC TABLE ANALYSIS');
        console.log('='.repeat(50));
        
        const vcTableSchema = await getTableSchema('VC Table');
        const vcSampleRecords = await getSampleRecords('VC Table', 10);
        const vcFieldUsage = analyzeFieldUsage(vcTableSchema, vcSampleRecords);
        
        console.log(`Analyzed ${vcSampleRecords.records.length} VC Table records\n`);
        
        const vcUnused = [];
        const vcRarelyUsed = [];
        const vcUsed = [];
        
        Object.entries(vcFieldUsage).forEach(([fieldName, usage]) => {
            const usagePercent = ((usage.populatedRecords / usage.totalRecords) * 100).toFixed(0);
            const line = `"${fieldName}" (${usage.type}) - ${usagePercent}% populated`;
            
            if (usage.usage === 'completely_unused') {
                vcUnused.push(line);
            } else if (usage.usage === 'rarely_used') {
                vcRarelyUsed.push(line);
            } else {
                vcUsed.push(line + ` - Sample: ${usage.sampleValues.join(', ')}`);
            }
        });
        
        console.log('✅ FREQUENTLY USED FIELDS (Keep these):');
        vcUsed.forEach(field => console.log(`  ${field}`));
        
        console.log('\n⚠️  RARELY USED FIELDS (Consider removing):');
        vcRarelyUsed.forEach(field => console.log(`  ${field}`));
        
        console.log('\n❌ COMPLETELY UNUSED FIELDS (Definitely remove):');
        vcUnused.forEach(field => console.log(`  ${field}`));
        
        // Summary and recommendations
        console.log('\n\n💡 CLEANUP RECOMMENDATIONS');
        console.log('='.repeat(50));
        console.log(`🏦 Fund Table: Remove ${fundUnused.length + fundRarelyUsed.length} unused/rarely used fields`);
        console.log(`🧪 VC Table: Remove ${vcUnused.length + vcRarelyUsed.length} unused/rarely used fields`);
        console.log('\nThis will create much cleaner, focused tables! 🎯');
        
    } catch (error) {
        console.error('❌ Analysis failed:', error.message);
    }
};

analyzeTableUsage(); 