#!/usr/bin/env node

import sqlite3 from "sqlite3";
import { promisify } from "util";
import { v4 as uuidv4 } from "uuid";
import fs from "fs/promises";

/**
 * 🏗️ Initialize ProjectVCS Memory with Current Workspace State
 */

async function initializeWorkspace() {
    console.log('🏗️ Initializing ProjectVCS Memory Server...');
    
    // Create memory directory
    await fs.mkdir("./memory", { recursive: true }).catch(() => {});
    
    // Initialize database
    const db = new sqlite3.Database("./memory/projectvcs-memory.db");
    db.run = promisify(db.run.bind(db));
    db.get = promisify(db.get.bind(db));
    
    // Create tables first
    await db.run(`
      CREATE TABLE IF NOT EXISTS projects (
        id TEXT PRIMARY KEY,
        name TEXT NOT NULL,
        path TEXT NOT NULL,
        type TEXT,
        status TEXT DEFAULT 'active',
        description TEXT,
        created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
        updated_at DATETIME DEFAULT CURRENT_TIMESTAMP
      )
    `);

    await db.run(`
      CREATE TABLE IF NOT EXISTS memories (
        id TEXT PRIMARY KEY,
        project_id TEXT,
        type TEXT NOT NULL,
        title TEXT NOT NULL,
        content TEXT NOT NULL,
        tags TEXT,
        importance INTEGER DEFAULT 1,
        created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
        FOREIGN KEY (project_id) REFERENCES projects (id)
      )
    `);

    await db.run(`
      CREATE TABLE IF NOT EXISTS sessions (
        id TEXT PRIMARY KEY,
        project_id TEXT,
        summary TEXT NOT NULL,
        achievements TEXT,
        next_steps TEXT,
        issues TEXT,
        duration_minutes INTEGER,
        created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
        FOREIGN KEY (project_id) REFERENCES projects (id)
      )
    `);
    
    try {
        // Record current workspace state
        const projects = [
            {
                name: "diva-scraper",
                path: "apify/diva-scraper",
                type: "web-scraper",
                description: "Korean VC intelligence scraper for DIVA data sources - Investment performance, financial statements, personnel, violations, VC MAP"
            },
            {
                name: "diva-health-monitor", 
                path: "diva-health-monitor",
                type: "data-analysis",
                description: "Health monitoring and deduplication system for DIVA data quality management"
            },
            {
                name: "mcp-memory-server",
                path: "mcp-memory-server", 
                type: "other",
                description: "MCP memory server for comprehensive workspace context management"
            }
        ];
        
        // Store initial memories about current state
        const memories = [
            {
                type: "context",
                title: "DIVA Scraper Current Status",
                content: "Scraper is working but only collecting 41 unique records after deduplication. This is too low - should be hundreds/thousands of Korean VC companies. Need to investigate data extraction logic.",
                tags: "diva, scraper, data-extraction, issue",
                importance: 5,
                project: "diva-scraper"
            },
            {
                type: "achievement", 
                title: "Deduplication System Completed",
                content: "Successfully implemented smart deduplication with Korean text fuzzy matching. Removed 618 duplicates from 659 records. System includes automated weekly cleanup and health monitoring.",
                tags: "deduplication, health-monitoring, success",
                importance: 4,
                project: "diva-health-monitor"
            },
            {
                type: "issue",
                title: "Low Data Volume Problem",
                content: "After scraping and deduplication, only 41 unique records remain across all tables. This suggests the scraper is not properly extracting data from DIVA pages or hitting pagination limits.",
                tags: "data-volume, scraping, investigation-needed",
                importance: 5,
                project: "diva-scraper"
            },
            {
                type: "learning",
                title: "Timeout Optimization Success", 
                content: "Ultra-generous timeout settings (10min protocol, 30min request handler) eliminated all timeout errors. Scraper now runs 12+ minutes with stability.",
                tags: "timeouts, optimization, stability",
                importance: 3,
                project: "diva-scraper"
            },
            {
                type: "todo",
                title: "Investigate DIVA Data Extraction",
                content: "Need to analyze why scraper is only collecting 41 records. Check: 1) Pagination logic 2) Data extraction selectors 3) Table parsing 4) Korean text handling",
                tags: "investigation, data-extraction, priority-high",
                importance: 5,
                project: "diva-scraper"
            }
        ];
        
        console.log('📁 Creating projects...');
        for (const project of projects) {
            const id = uuidv4();
            await db.run(
                "INSERT INTO projects (id, name, path, type, description) VALUES (?, ?, ?, ?, ?)",
                [id, project.name, project.path, project.type, project.description]
            );
            console.log(`   ✅ ${project.name}`);
        }
        
        console.log('🧠 Storing initial memories...');
        for (const memory of memories) {
            const id = uuidv4();
            let projectId = null;
            
            if (memory.project) {
                const proj = await db.get("SELECT id FROM projects WHERE name = ?", [memory.project]);
                if (proj) projectId = proj.id;
            }
            
            await db.run(
                "INSERT INTO memories (id, project_id, type, title, content, tags, importance) VALUES (?, ?, ?, ?, ?, ?, ?)",
                [id, projectId, memory.type, memory.title, memory.content, memory.tags, memory.importance]
            );
            console.log(`   ✅ ${memory.title}`);
        }
        
        // Record current session
        const sessionId = uuidv4();
        await db.run(
            "INSERT INTO sessions (id, project_id, summary, achievements, next_steps, issues) VALUES (?, ?, ?, ?, ?, ?)",
            [
                sessionId, 
                null,
                "Initialized MCP memory server and identified data extraction issues",
                "1) Built comprehensive deduplication system 2) Optimized scraper timeouts 3) Set up memory server",
                "1) Investigate low data volume in DIVA scraper 2) Analyze page extraction logic 3) Test with sample DIVA pages",
                "DIVA scraper only collecting 41 records instead of expected hundreds/thousands"
            ]
        );
        
        console.log('\n🎉 ProjectVCS Memory Server initialized successfully!');
        console.log('\n📋 Summary:');
        console.log(`   📁 Projects: ${projects.length}`);
        console.log(`   🧠 Memories: ${memories.length}`);
        console.log(`   📝 Sessions: 1`);
        
        console.log('\n🚀 To start the server:');
        console.log('   npm start');
        
        console.log('\n🔧 Next Steps:');
        console.log('   1. Start memory server in background');
        console.log('   2. Configure MCP client to connect');
        console.log('   3. Begin DIVA scraper investigation');
        
    } catch (error) {
        console.error('❌ Initialization failed:', error);
    } finally {
        db.close();
    }
}

initializeWorkspace(); 