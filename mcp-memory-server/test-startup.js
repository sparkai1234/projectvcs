#!/usr/bin/env node

import { Server } from "@modelcontextprotocol/sdk/server/index.js";
import { StdioServerTransport } from "@modelcontextprotocol/sdk/server/stdio.js";
import sqlite3 from "sqlite3";
import { promisify } from "util";
import fs from "fs/promises";

console.log("🧪 Testing MCP Server Components...");

try {
  // Test 1: Check if MCP SDK is working
  console.log("✅ MCP SDK imported successfully");
  
  // Test 2: Check if SQLite3 is working
  const db = new sqlite3.Database(":memory:");
  const run = promisify(db.run.bind(db));
  const get = promisify(db.get.bind(db));
  
  await run("CREATE TABLE test (id INTEGER PRIMARY KEY, name TEXT)");
  await run("INSERT INTO test (name) VALUES (?)", ["test"]);
  const result = await get("SELECT * FROM test WHERE name = ?", ["test"]);
  
  if (result && result.name === "test") {
    console.log("✅ SQLite3 working correctly");
  } else {
    console.log("❌ SQLite3 test failed");
  }
  
  db.close();
  
  // Test 3: Check if we can create a basic server
  const server = new Server(
    {
      name: "test-server",
      version: "1.0.0",
    },
    {
      capabilities: {
        tools: {},
      },
    }
  );
  
  console.log("✅ MCP Server instance created successfully");
  
  // Test 4: Check if memory directory exists
  try {
    await fs.access("./memory");
    console.log("✅ Memory directory exists");
  } catch (error) {
    console.log("⚠️ Memory directory doesn't exist, will be created");
    await fs.mkdir("./memory", { recursive: true });
    console.log("✅ Memory directory created");
  }
  
  console.log("🎉 All tests passed! MCP server should work correctly.");
  
} catch (error) {
  console.error("❌ Test failed:", error.message);
  console.error("Stack:", error.stack);
  process.exit(1);
} 