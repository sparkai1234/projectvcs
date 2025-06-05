const token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InVkZmd0Y2N4YnFtYWxncHF5eHp6Iiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc0ODk0NjY5NiwiZXhwIjoyMDY0NTIyNjk2fQ.JgyEKjOhuZpNCCOadsaK90Q8CcoPf_rgdtSXh-1BU18';

try {
    const parts = token.split('.');
    const payload = JSON.parse(Buffer.from(parts[1], 'base64').toString());
    
    console.log('🔍 New Token Analysis');
    console.log('====================');
    console.log('Role:', payload.role);
    console.log('Project:', payload.ref);
    console.log('Issued at:', new Date(payload.iat * 1000).toISOString());
    console.log('Expires at:', new Date(payload.exp * 1000).toISOString());
    console.log('Current time:', new Date().toISOString());
    console.log('Is expired?', new Date() > new Date(payload.exp * 1000));
    console.log('Token ending:', token.slice(-20));
    
} catch (error) {
    console.log('❌ Error decoding token:', error.message);
} 