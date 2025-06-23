import https from 'https';

console.log('🔍 Testing VCS FUND API response structure...');

const req = https.get('https://www.vcs.go.kr/web/portal/investor/search?sortOrder=&sortDirection=&cp=1&sc=&sv=&tabMenu=2', (res) => {
  let data = '';
  res.on('data', chunk => data += chunk);
  res.on('end', () => {
    try {
      const json = JSON.parse(data);
      console.log('\n📊 Fund API Response Keys:', Object.keys(json));
      console.log('📈 Total fund count:', json.total);
      
      if (json.list && json.list[0]) {
        console.log('\n🔍 First fund record keys:', Object.keys(json.list[0]));
        console.log('\n📋 Sample fund record:');
        console.log(JSON.stringify(json.list[0], null, 2));
        
        console.log('\n❌ FUND FIELD MAPPING ANALYSIS:');
        const record = json.list[0];
        
        // Check what fields we expect vs what we get for funds
        console.log('Expected "fund_name", got:', record.fund_name || 'MISSING');
        console.log('Expected "company_id", got:', record.company_id || 'MISSING');
        console.log('Expected "fund_type", got:', record.fund_type || 'MISSING');
        console.log('Expected "fund_size", got:', record.fund_size || 'MISSING');
        
        console.log('\n✅ Available fund fields:');
        Object.keys(record).forEach(key => {
          console.log(`  ${key}: ${record[key]}`);
        });
        
        console.log('\n🔗 COMPANY ID ANALYSIS:');
        console.log('Looking for company identifier fields...');
        Object.keys(record).forEach(key => {
          if (key.toLowerCase().includes('id') || key.toLowerCase().includes('cd')) {
            console.log(`  🎯 ${key}: ${record[key]} (potential ID field)`);
          }
        });
      }
    } catch (e) {
      console.error('❌ JSON parse error:', e.message);
      console.log('Raw response:', data.substring(0, 500));
    }
  });
});

req.on('error', err => {
  console.error('❌ Request error:', err.message);
});

req.end(); 