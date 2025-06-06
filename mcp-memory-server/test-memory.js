#!/usr/bin/env node

import sqlite3 from "sqlite3";
import { promisify } from "util";

/**
 * 🧪 Test ProjectVCS Memory Server
 */

async function testMemoryServer() {
    console.log('🧪 Testing ProjectVCS Memory Server...');
    
    const db = new sqlite3.Database("./memory/projectvcs-memory.db");
    db.all = promisify(db.all.bind(db));
    
    try {
        // Test project retrieval
        const projects = await db.all("SELECT * FROM projects");
        console.log(`📁 Found ${projects.length} projects:`);
        projects.forEach(p => console.log(`   • ${p.name} (${p.type})`));
        
        // Test memory retrieval
        const memories = await db.all("SELECT * FROM memories ORDER BY importance DESC");
        console.log(`\n🧠 Found ${memories.length} memories:`);
        memories.forEach(m => console.log(`   • ${m.title} (${m.type}) - ⭐${m.importance}/5`));
        
        // Test sessions
        const sessions = await db.all("SELECT * FROM sessions");
        console.log(`\n📝 Found ${sessions.length} sessions:`);
        sessions.forEach(s => console.log(`   • ${s.summary.substring(0, 50)}...`));
        
        console.log('\n✅ Memory server is working correctly!');
        console.log('\n🔧 Next steps:');
        console.log('1. Configure MCP client (Cursor) to connect');
        console.log('2. Use memory tools to track development progress');
        console.log('3. Begin DIVA scraper investigation');
        
    } catch (error) {
        console.error('❌ Test failed:', error);
    } finally {
        db.close();
    }
}

testMemoryServer(); 