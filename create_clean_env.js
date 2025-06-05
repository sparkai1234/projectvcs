const fs = require('fs');

// The exact key provided by the user
const exactKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InVkZmd0Y2N4YnFtYWxncHF5eHp6Iiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc0ODk0NjY5NiwiZXhwIjoyMDY0NTIyNjk2fQ.JgyEKjOhuZpNCCOadsaK90Q8CcoPf_rgdtSXh-1BU18';

const envContent = `SUPABASE_URL=https://udfgtccxbqmalgpqyxzz.supabase.co
SUPABASE_SERVICE_ROLE_KEY=${exactKey}
OPENAI_API_KEY=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
KVIC_API_KEY=pending_email_tomorrow`;

// Delete old .env file if it exists
try {
    fs.unlinkSync('.env');
    console.log('✅ Deleted old .env file');
} catch (err) {
    console.log('ℹ️  No old .env file found');
}

// Write new .env file
fs.writeFileSync('.env', envContent, 'utf8');

console.log('🔧 Created new .env file');
console.log('📏 Key length:', exactKey.length);
console.log('🏁 Key ends with:', exactKey.substring(exactKey.length - 20));

// Verify the file was written correctly
const readBack = fs.readFileSync('.env', 'utf8');
const lines = readBack.split('\n');
const keyLine = lines.find(line => line.startsWith('SUPABASE_SERVICE_ROLE_KEY='));

if (keyLine) {
    const extractedKey = keyLine.substring('SUPABASE_SERVICE_ROLE_KEY='.length);
    console.log('✅ Verification: Key written correctly');
    console.log('📏 Written key length:', extractedKey.length);
    console.log('🏁 Written key ends with:', extractedKey.substring(extractedKey.length - 20));
    
    if (extractedKey === exactKey) {
        console.log('🎉 Perfect match! Key written successfully');
    } else {
        console.log('❌ Key mismatch detected');
    }
} else {
    console.log('❌ Could not find key line in written file');
} 