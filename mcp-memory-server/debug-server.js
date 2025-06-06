#!/usr/bin/env node

// Debug logging for MCP server
console.error("🐛 DEBUG: MCP Server starting...");
console.error("🐛 DEBUG: Working directory:", process.cwd());
console.error("🐛 DEBUG: Arguments:", process.argv);
console.error("🐛 DEBUG: Environment:", process.env.NODE_ENV);

// Import and run the main server
import('./src/server.js').catch(err => {
  console.error("🐛 DEBUG: Error starting server:", err);
  process.exit(1);
}); 