require('dotenv').config();

const key = process.env.SUPABASE_SERVICE_ROLE_KEY;

if (key) {
    try {
        const parts = key.split('.');
        const payload = JSON.parse(Buffer.from(parts[1], 'base64').toString());
        
        console.log('🔍 Token Analysis');
        console.log('================');
        console.log('Role:', payload.role);
        console.log('Project:', payload.ref);
        console.log('Issued at:', new Date(payload.iat * 1000).toISOString());
        console.log('Expires at:', new Date(payload.exp * 1000).toISOString());
        console.log('Current time:', new Date().toISOString());
        console.log('Is expired?', new Date() > new Date(payload.exp * 1000));
        
    } catch (error) {
        console.log('❌ Error parsing token:', error.message);
    }
} else {
    console.log('❌ No SUPABASE_SERVICE_ROLE_KEY found');
} 