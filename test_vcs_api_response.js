import https from 'https';

console.log('🔍 Testing VCS API response structure...');

const req = https.get('https://www.vcs.go.kr/web/portal/investor/search?sortOrder=&sortDirection=&cp=1&sc=&sv=&tabMenu=1', (res) => {
  let data = '';
  res.on('data', chunk => data += chunk);
  res.on('end', () => {
    try {
      const json = JSON.parse(data);
      console.log('\n📊 API Response Keys:', Object.keys(json));
      console.log('📈 Total count:', json.total);
      
      if (json.list && json.list[0]) {
        console.log('\n🔍 First record keys:', Object.keys(json.list[0]));
        console.log('\n📋 Sample investor record:');
        console.log(JSON.stringify(json.list[0], null, 2));
        
        console.log('\n❌ FIELD MAPPING ANALYSIS:');
        const record = json.list[0];
        
        // Check what fields we expect vs what we get
        console.log('Expected "company_name", got:', record.company_name || 'MISSING');
        console.log('Expected "industry", got:', record.industry || 'MISSING');
        console.log('Expected "zip_code", got:', record.zip_code || 'MISSING');
        console.log('Expected "location", got:', record.location || 'MISSING');
        
        console.log('\n✅ Available fields:');
        Object.keys(record).forEach(key => {
          console.log(`  ${key}: ${record[key]}`);
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