require('dotenv').config();

console.log('🔍 Environment Debug');
console.log('==================');

const key = process.env.SUPABASE_SERVICE_ROLE_KEY;

console.log('Key length:', key ? key.length : 'undefined');
console.log('Key first 30 chars:', key ? key.substring(0, 30) : 'undefined');
console.log('Key last 20 chars:', key ? key.substring(key.length - 20) : 'undefined');
console.log('Contains line breaks:', key ? key.includes('\n') || key.includes('\r') : 'undefined');

// Show the exact raw key (for debugging only)
console.log('\n--- RAW KEY (first 100 chars) ---');
console.log(key ? key.substring(0, 100) : 'undefined');
console.log('\n--- RAW KEY (last 50 chars) ---');
console.log(key ? key.substring(key.length - 50) : 'undefined');

// Check if it's a valid JWT format
if (key) {
    const parts = key.split('.');
    console.log('\nJWT parts count:', parts.length);
    console.log('Should be 3 parts for valid JWT');
    
    if (parts.length === 3) {
        console.log('✅ JWT format looks correct');
    } else {
        console.log('❌ JWT format is invalid');
    }
} 