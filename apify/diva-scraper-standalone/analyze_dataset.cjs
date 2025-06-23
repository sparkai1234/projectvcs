// 📊 ANALYZE LATEST DATASET - Validate Production Data
const fs = require('fs').promises;
const path = require('path');

// Expected record counts (from perfect production run)
const EXPECTED_COUNTS = {
    'investment_performance': 333,
    'financial_statements': 500,
    'association_status': 2231,
    'personnel_status': 251,
    'professional_personnel': 1685,
    'violations': 92,
    'vc_map': 251
};

const TOTAL_EXPECTED = 5343;

async function analyzeDataset() {
    console.log('📊 ANALYZING LATEST DATASET - Production Data Validation');
    console.log('=' .repeat(60));
    
    try {
        // Find the most recent dataset file
        const files = await fs.readdir('.');
        const datasetFiles = files
            .filter(file => file.startsWith('dataset_') && file.endsWith('.json'))
            .sort()
            .reverse();
            
        if (datasetFiles.length === 0) {
            console.log('❌ No dataset files found');
            return false;
        }
        
        const latestFile = datasetFiles[0];
        console.log(`📁 Latest dataset: ${latestFile}`);
        
        // Read and parse the dataset
        const fileContent = await fs.readFile(latestFile, 'utf8');
        const dataset = JSON.parse(fileContent);
        
        console.log(`📈 Total records in dataset: ${dataset.length}`);
        
        // Group records by dataType
        const groupedData = {};
        dataset.forEach(record => {
            const dataType = record.dataType;
            if (!groupedData[dataType]) {
                groupedData[dataType] = [];
            }
            groupedData[dataType].push(record);
        });
        
        console.log('\n🔍 DATASET BREAKDOWN BY DATA TYPE:');
        console.log('-'.repeat(50));
        
        let totalRecords = 0;
        let perfectMatches = 0;
        const results = [];
        
        for (const [dataType, expectedCount] of Object.entries(EXPECTED_COUNTS)) {
            const actualRecords = groupedData[dataType] || [];
            const actualCount = actualRecords.length;
            totalRecords += actualCount;
            
            const isValid = actualCount === expectedCount;
            const accuracy = expectedCount > 0 ? ((actualCount / expectedCount) * 100).toFixed(1) : 0;
            const status = isValid ? '✅ PERFECT' : '❌ MISMATCH';
            
            console.log(`${status} ${dataType}:`);
            console.log(`   Expected: ${expectedCount} | Actual: ${actualCount} | Accuracy: ${accuracy}%`);
            
            if (isValid) perfectMatches++;
            
            results.push({
                dataType,
                expected: expectedCount,
                actual: actualCount,
                accuracy: parseFloat(accuracy),
                status: isValid ? 'PERFECT' : 'MISMATCH',
                records: actualRecords
            });
            
            // Show sample data for verification
            if (actualRecords.length > 0) {
                const sampleRecord = actualRecords[0];
                const keys = Object.keys(sampleRecord).filter(k => k !== 'dataType' && k !== 'url' && k !== 'timestamp');
                console.log(`   Sample fields: ${keys.slice(0, 5).join(', ')}${keys.length > 5 ? '...' : ''}`);
            }
            console.log('');
        }
        
        // Check for unexpected data types
        const unexpectedTypes = Object.keys(groupedData).filter(type => !EXPECTED_COUNTS[type]);
        if (unexpectedTypes.length > 0) {
            console.log('⚠️  UNEXPECTED DATA TYPES FOUND:');
            unexpectedTypes.forEach(type => {
                console.log(`   ${type}: ${groupedData[type].length} records`);
            });
            console.log('');
        }
        
        // Overall summary
        console.log('🎯 OVERALL VALIDATION SUMMARY:');
        console.log('=' .repeat(50));
        console.log(`📊 Total Expected Records: ${TOTAL_EXPECTED}`);
        console.log(`📈 Total Actual Records: ${totalRecords}`);
        console.log(`🎯 Overall Accuracy: ${((totalRecords / TOTAL_EXPECTED) * 100).toFixed(1)}%`);
        console.log(`✅ Perfect Tables: ${perfectMatches}/${Object.keys(EXPECTED_COUNTS).length}`);
        console.log(`📁 Dataset File: ${latestFile}`);
        
        const isValid = perfectMatches === Object.keys(EXPECTED_COUNTS).length && totalRecords === TOTAL_EXPECTED;
        console.log(`🏆 FINAL STATUS: ${isValid ? 'PERFECT ✅' : 'HAS ISSUES ❌'}`);
        
        // Save analysis results
        const analysisReport = {
            timestamp: new Date().toISOString(),
            dataset_file: latestFile,
            total_expected_records: TOTAL_EXPECTED,
            total_actual_records: totalRecords,
            perfect_tables: perfectMatches,
            total_tables: Object.keys(EXPECTED_COUNTS).length,
            overall_accuracy: ((totalRecords / TOTAL_EXPECTED) * 100).toFixed(1),
            validation_results: results.map(r => ({
                dataType: r.dataType,
                expected: r.expected,
                actual: r.actual,
                accuracy: r.accuracy,
                status: r.status
            })),
            unexpected_types: unexpectedTypes,
            overall_status: isValid ? 'PERFECT' : 'HAS_ISSUES'
        };
        
        await fs.writeFile('dataset_analysis_report.json', JSON.stringify(analysisReport, null, 2));
        console.log('\n💾 Analysis report saved to: dataset_analysis_report.json');
        
        // Generate recommendations
        console.log('\n💡 RECOMMENDATIONS:');
        if (isValid) {
            console.log('   🎉 PERFECT! Dataset validation successful.');
            console.log('   🚀 Production data is complete and accurate.');
            console.log('   📊 Ready for business intelligence and analytics.');
        } else {
            console.log('   ⚠️  Some issues detected in the dataset.');
            console.log('   🔧 Review the breakdown above for specific problems.');
        }
        
        return isValid;
        
    } catch (error) {
        console.error('❌ Dataset analysis failed:', error);
        return false;
    }
}

// Run the analysis
analyzeDataset()
    .then((success) => {
        console.log(`\n🎯 Dataset validation: ${success ? 'PASSED ✅' : 'FAILED ❌'}`);
        process.exit(success ? 0 : 1);
    })
    .catch((error) => {
        console.error('Fatal error:', error);
        process.exit(1);
    }); 