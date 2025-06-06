# 🧠 ProjectVCS MCP Memory Server

Comprehensive workspace context and state management for the ProjectVCS ecosystem.

## 🌟 Features

- **Project Tracking**: Register and monitor all projects in the workspace
- **Memory Storage**: Store decisions, learnings, issues, achievements, and context
- **Session Recording**: Track development sessions with summaries and next steps
- **File Tracking**: Monitor important files across projects
- **Smart Search**: Find context across all workspace content
- **Workspace Status**: Get real-time overview of all projects and activities

## 🚀 Quick Start

### 1. Installation
```bash
npm install
```

### 2. Initialize with Current Workspace
```bash
npm run init
```

### 3. Start the Server
```bash
npm start
# or for development
npm run dev
```

## 🔧 MCP Client Integration

### Cursor IDE
Add to your Cursor MCP configuration:
```json
{
  "mcpServers": {
    "projectvcs-memory": {
      "command": "node",
      "args": ["src/server.js"],
      "cwd": "./mcp-memory-server"
    }
  }
}
```

## 🛠️ Available Tools

### 📝 Memory Management
- **store_memory**: Store important context, decisions, or learnings
- **retrieve_memories**: Retrieve stored memories with filtering
- **search_workspace**: Search across all workspace content

### 📁 Project Management  
- **create_project**: Register a new project
- **list_projects**: List all projects with filtering
- **workspace_status**: Get comprehensive workspace overview

### 📊 Session Tracking
- **record_session**: Record development session summaries
- **track_file**: Track important files in the workspace

## 📋 Current Workspace State

### Projects
- **diva-scraper**: Korean VC intelligence scraper (web-scraper)
- **diva-health-monitor**: Data quality monitoring system (data-analysis)  
- **mcp-memory-server**: Workspace context management (other)

### Key Memories
- ⚠️ **CRITICAL**: DIVA scraper only collecting 41 records (should be hundreds/thousands)
- ✅ **SUCCESS**: Deduplication system completed with Korean text matching
- 🎯 **TODO**: Investigate data extraction logic in DIVA scraper

## 🔍 Usage Examples

### Store a Memory
```javascript
{
  "tool": "store_memory",
  "args": {
    "project": "diva-scraper",
    "type": "issue",
    "title": "Pagination Problem",
    "content": "Scraper stops after first page, need to debug pagination logic",
    "tags": "pagination, debugging, high-priority",
    "importance": 4
  }
}
```

### Retrieve Project Memories
```javascript
{
  "tool": "retrieve_memories", 
  "args": {
    "project": "diva-scraper",
    "type": "issue",
    "limit": 10
  }
}
```

### Record Session
```javascript
{
  "tool": "record_session",
  "args": {
    "project": "diva-scraper",
    "summary": "Investigated data extraction issue",
    "achievements": "Identified table parsing problems",
    "next_steps": "Fix CSS selectors for Korean table headers",
    "issues": "Korean text encoding in table headers",
    "duration_minutes": 120
  }
}
```

## 🎯 Priority Actions

1. **🔍 Investigate DIVA Data Extraction**: Only 41 records collected vs expected hundreds
2. **🐛 Debug Table Parsing**: Korean text handling in DIVA page tables  
3. **📄 Check Pagination Logic**: Ensure all pages are being processed
4. **🔧 Optimize Selectors**: Improve CSS selectors for Korean content

## 📊 Database Schema

### Projects
- id, name, path, type, status, description, timestamps

### Memories  
- id, project_id, type, title, content, tags, importance, created_at

### Sessions
- id, project_id, summary, achievements, next_steps, issues, duration

### Files Tracked
- id, project_id, file_path, file_type, size, importance, notes

## 🔧 Development

```bash
# Start in development mode with auto-reload
npm run dev

# Run tests
npm test

# Re-initialize (clears existing data)
npm run init
```

## 📈 Monitoring

The server automatically tracks:
- File changes in the workspace
- Project status updates
- Memory storage patterns
- Session frequency and duration

## 🤝 Contributing

1. Store decisions and learnings as memories
2. Record session summaries regularly  
3. Track important files and their purposes
4. Update project status when major milestones reached

---

**🎯 Current Focus**: Investigating DIVA scraper data extraction to increase from 41 to expected hundreds/thousands of Korean VC records. 