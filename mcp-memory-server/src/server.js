#!/usr/bin/env node

import { Server } from "@modelcontextprotocol/sdk/server/index.js";
import { StdioServerTransport } from "@modelcontextprotocol/sdk/server/stdio.js";
import {
  CallToolRequestSchema,
  ListToolsRequestSchema,
} from "@modelcontextprotocol/sdk/types.js";
import sqlite3 from "sqlite3";
import { promisify } from "util";
import { v4 as uuidv4 } from "uuid";
import { z } from "zod";
import fs from "fs/promises";
import path from "path";
import chokidar from "chokidar";
import glob from "fast-glob";

/**
 * 🧠 ProjectVCS MCP Memory Server
 * Comprehensive workspace context and state management
 */

class ProjectVCSMemoryServer {
  constructor() {
    this.server = new Server(
      {
        name: "projectvcs-memory-server",
        version: "1.0.0",
      },
      {
        capabilities: {
          tools: {},
        },
      }
    );

    this.setupDatabase();
    this.setupTools();
    this.setupHandlers();
    this.startFileWatcher();
  }

  async setupDatabase() {
    this.db = new sqlite3.Database("./memory/projectvcs-memory.db");
    this.db.run = promisify(this.db.run.bind(this.db));
    this.db.get = promisify(this.db.get.bind(this.db));
    this.db.all = promisify(this.db.all.bind(this.db));

    // Create tables for comprehensive workspace tracking
    await this.db.run(`
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

    await this.db.run(`
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

    await this.db.run(`
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

    await this.db.run(`
      CREATE TABLE IF NOT EXISTS files_tracked (
        id TEXT PRIMARY KEY,
        project_id TEXT,
        file_path TEXT NOT NULL,
        file_type TEXT,
        last_modified DATETIME,
        size_bytes INTEGER,
        importance INTEGER DEFAULT 1,
        notes TEXT,
        created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
        FOREIGN KEY (project_id) REFERENCES projects (id)
      )
    `);

    await this.db.run(`
      CREATE TABLE IF NOT EXISTS project_relationships (
        id TEXT PRIMARY KEY,
        source_project_id TEXT,
        target_project_id TEXT,
        relationship_type TEXT,
        description TEXT,
        created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
        FOREIGN KEY (source_project_id) REFERENCES projects (id),
        FOREIGN KEY (target_project_id) REFERENCES projects (id)
      )
    `);

    console.log("🗄️ Database initialized successfully");
  }

  setupTools() {
    // Tool definitions for comprehensive workspace management
    this.tools = [
      {
        name: "store_memory",
        description: "Store important context, decisions, or learnings",
        inputSchema: {
          type: "object",
          properties: {
            project: { type: "string", description: "Project name or 'global'" },
            type: { type: "string", enum: ["decision", "learning", "issue", "achievement", "context", "todo"] },
            title: { type: "string", description: "Memory title" },
            content: { type: "string", description: "Detailed content" },
            tags: { type: "string", description: "Comma-separated tags" },
            importance: { type: "number", minimum: 1, maximum: 5, description: "Importance level" }
          },
          required: ["type", "title", "content"]
        }
      },
      {
        name: "retrieve_memories",
        description: "Retrieve stored memories with optional filtering",
        inputSchema: {
          type: "object",
          properties: {
            project: { type: "string", description: "Filter by project" },
            type: { type: "string", description: "Filter by memory type" },
            tags: { type: "string", description: "Filter by tags (comma-separated)" },
            search: { type: "string", description: "Search in title/content" },
            limit: { type: "number", default: 20, description: "Max results" }
          }
        }
      },
      {
        name: "create_project",
        description: "Register a new project in the workspace",
        inputSchema: {
          type: "object",
          properties: {
            name: { type: "string", description: "Project name" },
            path: { type: "string", description: "Project path relative to workspace" },
            type: { type: "string", enum: ["web-scraper", "api", "frontend", "backend", "data-analysis", "ml", "other"] },
            description: { type: "string", description: "Project description" }
          },
          required: ["name", "path", "type"]
        }
      },
      {
        name: "list_projects",
        description: "List all projects in the workspace",
        inputSchema: {
          type: "object",
          properties: {
            status: { type: "string", enum: ["active", "paused", "completed", "archived"] },
            type: { type: "string", description: "Filter by project type" }
          }
        }
      },
      {
        name: "record_session",
        description: "Record a development session summary",
        inputSchema: {
          type: "object",
          properties: {
            project: { type: "string", description: "Project name" },
            summary: { type: "string", description: "Session summary" },
            achievements: { type: "string", description: "What was accomplished" },
            next_steps: { type: "string", description: "Next actions planned" },
            issues: { type: "string", description: "Problems encountered" },
            duration_minutes: { type: "number", description: "Session duration" }
          },
          required: ["summary"]
        }
      },
      {
        name: "track_file",
        description: "Track important files in the workspace",
        inputSchema: {
          type: "object",
          properties: {
            project: { type: "string", description: "Project name" },
            file_path: { type: "string", description: "File path" },
            file_type: { type: "string", description: "File type/purpose" },
            importance: { type: "number", minimum: 1, maximum: 5 },
            notes: { type: "string", description: "Notes about the file" }
          },
          required: ["file_path"]
        }
      },
      {
        name: "workspace_status",
        description: "Get comprehensive workspace status",
        inputSchema: {
          type: "object",
          properties: {
            detailed: { type: "boolean", default: false, description: "Include detailed information" }
          }
        }
      },
      {
        name: "search_workspace",
        description: "Search across all workspace content",
        inputSchema: {
          type: "object",
          properties: {
            query: { type: "string", description: "Search query" },
            scope: { type: "string", enum: ["memories", "projects", "sessions", "files", "all"], default: "all" }
          },
          required: ["query"]
        }
      }
    ];
  }

  setupHandlers() {
    this.server.setRequestHandler(ListToolsRequestSchema, async () => ({
      tools: this.tools,
    }));

    this.server.setRequestHandler(CallToolRequestSchema, async (request) => {
      const { name, arguments: args } = request.params;

      try {
        switch (name) {
          case "store_memory":
            return await this.storeMemory(args);
          case "retrieve_memories":
            return await this.retrieveMemories(args);
          case "create_project":
            return await this.createProject(args);
          case "list_projects":
            return await this.listProjects(args);
          case "record_session":
            return await this.recordSession(args);
          case "track_file":
            return await this.trackFile(args);
          case "workspace_status":
            return await this.getWorkspaceStatus(args);
          case "search_workspace":
            return await this.searchWorkspace(args);
          default:
            throw new Error(`Unknown tool: ${name}`);
        }
      } catch (error) {
        return {
          content: [
            {
              type: "text",
              text: `Error: ${error.message}`,
            },
          ],
        };
      }
    });
  }

  async storeMemory(args) {
    const { project = 'global', type, title, content, tags = '', importance = 1 } = args;
    
    let projectId = null;
    if (project !== 'global') {
      const proj = await this.db.get("SELECT id FROM projects WHERE name = ?", [project]);
      if (proj) projectId = proj.id;
    }

    const id = uuidv4();
    await this.db.run(
      "INSERT INTO memories (id, project_id, type, title, content, tags, importance) VALUES (?, ?, ?, ?, ?, ?, ?)",
      [id, projectId, type, title, content, tags, importance]
    );

    return {
      content: [
        {
          type: "text",
          text: `✅ Memory stored successfully!\n📝 Title: ${title}\n🏷️ Type: ${type}\n⭐ Importance: ${importance}/5`,
        },
      ],
    };
  }

  async retrieveMemories(args) {
    const { project, type, tags, search, limit = 20 } = args;
    
    let query = "SELECT * FROM memories m LEFT JOIN projects p ON m.project_id = p.id WHERE 1=1";
    const params = [];

    if (project && project !== 'global') {
      query += " AND p.name = ?";
      params.push(project);
    }
    if (type) {
      query += " AND m.type = ?";
      params.push(type);
    }
    if (tags) {
      query += " AND m.tags LIKE ?";
      params.push(`%${tags}%`);
    }
    if (search) {
      query += " AND (m.title LIKE ? OR m.content LIKE ?)";
      params.push(`%${search}%`, `%${search}%`);
    }

    query += " ORDER BY m.importance DESC, m.created_at DESC LIMIT ?";
    params.push(limit);

    const memories = await this.db.all(query, params);

    const formatted = memories.map(m => 
      `📝 **${m.title}** (${m.type}) - ⭐${m.importance}/5\n` +
      `🗂️ Project: ${m.name || 'Global'}\n` +
      `📅 ${new Date(m.created_at).toLocaleDateString()}\n` +
      `💭 ${m.content}\n` +
      (m.tags ? `🏷️ Tags: ${m.tags}\n` : '') +
      `---`
    ).join('\n\n');

    return {
      content: [
        {
          type: "text",
          text: `🧠 Found ${memories.length} memories:\n\n${formatted}`,
        },
      ],
    };
  }

  async createProject(args) {
    const { name, path, type, description = '' } = args;
    const id = uuidv4();

    await this.db.run(
      "INSERT INTO projects (id, name, path, type, description) VALUES (?, ?, ?, ?, ?)",
      [id, name, path, type, description]
    );

    return {
      content: [
        {
          type: "text",
          text: `✅ Project created successfully!\n📁 ${name} (${type})\n📂 Path: ${path}\n📝 ${description}`,
        },
      ],
    };
  }

  async listProjects(args) {
    const { status, type } = args;
    
    let query = "SELECT * FROM projects WHERE 1=1";
    const params = [];

    if (status) {
      query += " AND status = ?";
      params.push(status);
    }
    if (type) {
      query += " AND type = ?";
      params.push(type);
    }

    query += " ORDER BY updated_at DESC";

    const projects = await this.db.all(query, params);

    const formatted = projects.map(p => 
      `📁 **${p.name}** (${p.type}) - ${p.status}\n` +
      `📂 ${p.path}\n` +
      `📝 ${p.description}\n` +
      `📅 Updated: ${new Date(p.updated_at).toLocaleDateString()}`
    ).join('\n\n');

    return {
      content: [
        {
          type: "text",
          text: `📁 Found ${projects.length} projects:\n\n${formatted}`,
        },
      ],
    };
  }

  async recordSession(args) {
    const { project = 'global', summary, achievements = '', next_steps = '', issues = '', duration_minutes = 0 } = args;
    
    let projectId = null;
    if (project !== 'global') {
      const proj = await this.db.get("SELECT id FROM projects WHERE name = ?", [project]);
      if (proj) projectId = proj.id;
    }

    const id = uuidv4();
    await this.db.run(
      "INSERT INTO sessions (id, project_id, summary, achievements, next_steps, issues, duration_minutes) VALUES (?, ?, ?, ?, ?, ?, ?)",
      [id, projectId, summary, achievements, next_steps, issues, duration_minutes]
    );

    return {
      content: [
        {
          type: "text",
          text: `✅ Session recorded!\n📝 Summary: ${summary}\n🎯 Achievements: ${achievements}\n➡️ Next: ${next_steps}`,
        },
      ],
    };
  }

  async trackFile(args) {
    const { project = 'global', file_path, file_type = 'unknown', importance = 1, notes = '' } = args;
    
    let projectId = null;
    if (project !== 'global') {
      const proj = await this.db.get("SELECT id FROM projects WHERE name = ?", [project]);
      if (proj) projectId = proj.id;
    }

    const id = uuidv4();
    const stats = await fs.stat(file_path).catch(() => null);
    const size_bytes = stats ? stats.size : 0;
    const last_modified = stats ? stats.mtime.toISOString() : new Date().toISOString();

    await this.db.run(
      "INSERT INTO files_tracked (id, project_id, file_path, file_type, last_modified, size_bytes, importance, notes) VALUES (?, ?, ?, ?, ?, ?, ?, ?)",
      [id, projectId, file_path, file_type, last_modified, size_bytes, importance, notes]
    );

    return {
      content: [
        {
          type: "text",
          text: `✅ File tracked!\n📄 ${file_path}\n🔧 Type: ${file_type}\n⭐ Importance: ${importance}/5`,
        },
      ],
    };
  }

  async getWorkspaceStatus(args) {
    const { detailed = false } = args;

    const projectCount = await this.db.get("SELECT COUNT(*) as count FROM projects");
    const memoryCount = await this.db.get("SELECT COUNT(*) as count FROM memories");
    const sessionCount = await this.db.get("SELECT COUNT(*) as count FROM sessions");
    const fileCount = await this.db.get("SELECT COUNT(*) as count FROM files_tracked");

    let status = `🏗️ **ProjectVCS Workspace Status**\n\n` +
                `📁 Projects: ${projectCount.count}\n` +
                `🧠 Memories: ${memoryCount.count}\n` +
                `📝 Sessions: ${sessionCount.count}\n` +
                `📄 Files Tracked: ${fileCount.count}`;

    if (detailed) {
      const recentProjects = await this.db.all("SELECT name, type, status FROM projects ORDER BY updated_at DESC LIMIT 5");
      const recentMemories = await this.db.all("SELECT title, type FROM memories ORDER BY created_at DESC LIMIT 5");
      
      status += `\n\n📊 **Recent Projects:**\n` + 
                recentProjects.map(p => `• ${p.name} (${p.type}) - ${p.status}`).join('\n');
      
      status += `\n\n🧠 **Recent Memories:**\n` + 
                recentMemories.map(m => `• ${m.title} (${m.type})`).join('\n');
    }

    return {
      content: [
        {
          type: "text",
          text: status,
        },
      ],
    };
  }

  async searchWorkspace(args) {
    const { query, scope = 'all' } = args;
    const results = [];

    if (scope === 'all' || scope === 'memories') {
      const memories = await this.db.all(
        "SELECT 'memory' as type, title, content FROM memories WHERE title LIKE ? OR content LIKE ? LIMIT 10",
        [`%${query}%`, `%${query}%`]
      );
      results.push(...memories);
    }

    if (scope === 'all' || scope === 'projects') {
      const projects = await this.db.all(
        "SELECT 'project' as type, name as title, description as content FROM projects WHERE name LIKE ? OR description LIKE ? LIMIT 10",
        [`%${query}%`, `%${query}%`]
      );
      results.push(...projects);
    }

    const formatted = results.map(r => 
      `${r.type === 'memory' ? '🧠' : '📁'} **${r.title}**\n${r.content?.substring(0, 100)}...`
    ).join('\n\n');

    return {
      content: [
        {
          type: "text",
          text: `🔍 Search results for "${query}":\n\n${formatted}`,
        },
      ],
    };
  }

  startFileWatcher() {
    // Watch workspace for file changes
    const watcher = chokidar.watch('../**/*', {
      ignored: /(^|[\/\\])\../, // ignore dotfiles
      persistent: true,
      ignoreInitial: true
    });

    watcher.on('change', async (filePath) => {
      console.log(`📝 File changed: ${filePath}`);
      // Could auto-update tracked files here
    });

    console.log("👁️ File watcher started");
  }

  async run() {
    const transport = new StdioServerTransport();
    await this.server.connect(transport);
    console.log("🧠 ProjectVCS MCP Memory Server running...");
  }
}

// Create memory directory if it doesn't exist
await fs.mkdir("./memory", { recursive: true }).catch(() => {});

// Start the server
const server = new ProjectVCSMemoryServer();
await server.run(); 