// Script to examine Fund API data structure
const https = require('https');
const { URL } = require('url');

// Function to make HTTPS requests
const makeRequest = (url) => {
    return new Promise((resolve, reject) => {
        const urlObj = new URL(url);
        const options = {
            hostname: urlObj.hostname,
            path: urlObj.pathname + urlObj.search,
            method: 'GET',
            headers: {
                'Accept': 'application/json, text/javascript, */*; q=0.01',
                'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36',
                'X-Requested-With': 'XMLHttpRequest',
            }
        };

        const req = https.request(options, (res) => {
            let data = '';
            res.on('data', (chunk) => {
                data += chunk;
            });
            res.on('end', () => {
                try {
                    const jsonData = JSON.parse(data);
                    resolve({ body: jsonData, statusCode: res.statusCode });
                } catch (error) {
                    reject(new Error(`Failed to parse JSON: ${error.message}`));
                }
            });
        });

        req.on('error', (error) => {
            reject(error);
        });

        req.end();
    });
};

// Examine Fund data structure
const examineFundData = async () => {
    try {
        console.log('🔍 Examining Fund API data structure...');
        
        const baseUrl = 'https://www.vcs.go.kr/web/portal/investor/search';
        const tabMenu = 2; // Fund data
        const commonQueryParams = 'sortOrder=&sortDirection=&comIndCdArr=1&_comIndCdArr=on&comIndCdArr=2&_comIndCdArr=on&comIndCdArr=3&_comIndCdArr=on&comIndCdArr=4&_comIndCdArr=on&comIndCdArr=5&_comIndCdArr=on&comIndCdArr=6&_comIndCdArr=on&comIndCdArr=7&_comIndCdArr=on&comIndCdArr=8&_comIndCdArr=on&comIndCdArr=9&_comIndCdArr=on&_invstComLocCdArr=on&_invstComLocCdArr=on&_invstComLocCdArr=on&_localCdArr=on&_localCdArr=on&_localCdArr=on&_localCdArr=on&_localCdArr=on&_localCdArr=on&_localCdArr=on&_localCdArr=on&_localCdArr=on&_operScaleCdArr=on&_operScaleCdArr=on&_operScaleCdArr=on&_operScaleCdArr=on&_operScaleCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_invstCharcCdArr=on&_comBzcarrCdArr=on&_comBzcarrCdArr=on&_comBzcarrCdArr=on&_comBzcarrCdArr=on&_comBzcarrCdArr=on&_comBzcarrCdArr=on&_invstorTpCdArr=on&_invstorTpCdArr=on&_invstorTpCdArr=on&_invstorTpCdArr=on&_invstorTpCdArr=on&_invstorTpCdArr=on&_invstorTpCdArr=on&_invstorTpCdArr=on&sc=operInstNm&sv=';
        
        const url = `${baseUrl}?tabMenu=${tabMenu}&cp=1&${commonQueryParams}`;
        
        console.log('📄 Fetching first page of Fund data...');
        const response = await makeRequest(url);
        const json = response.body;
        
        console.log(`📊 Found ${json.total} total Fund entries`);
        console.log('📝 Sample Fund record structure:');
        
        if (json.list && json.list.length > 0) {
            const sampleRecord = json.list[0];
            console.log('\n=== FUND API FIELDS ===');
            console.log(JSON.stringify(sampleRecord, null, 2));
            
            console.log('\n=== AVAILABLE FIELDS ===');
            Object.keys(sampleRecord).forEach(key => {
                console.log(`- ${key}: ${sampleRecord[key]}`);
            });
            
            console.log('\n=== FIELD ANALYSIS ===');
            console.log('Fields that might contain fund-specific info:');
            Object.keys(sampleRecord).forEach(key => {
                if (sampleRecord[key] && sampleRecord[key] !== '') {
                    console.log(`✅ ${key}: "${sampleRecord[key]}"`);
                } else {
                    console.log(`❌ ${key}: (empty)`);
                }
            });
        } else {
            console.log('❌ No fund records found');
        }
        
    } catch (error) {
        console.error('❌ Error examining fund data:', error.message);
    }
};

examineFundData(); 