#!/usr/bin/env node

import { Server } from "@modelcontextprotocol/sdk/server/index.js";
import { StdioServerTransport } from "@modelcontextprotocol/sdk/server/stdio.js";
import {
  CallToolRequestSchema,
  ListToolsRequestSchema,
} from "@modelcontextprotocol/sdk/types.js";

console.error("🔧 Simple MCP Test Server Starting...");

const server = new Server(
  {
    name: "simple-test",
    version: "1.0.0",
  },
  {
    capabilities: {
      tools: {},
    },
  }
);

// Define a simple test tool
const tools = [
  {
    name: "test_tool",
    description: "A simple test tool to verify MCP connection",
    inputSchema: {
      type: "object",
      properties: {
        message: { type: "string", description: "Test message" }
      },
      required: ["message"]
    }
  }
];

// Set up handlers
server.setRequestHandler(ListToolsRequestSchema, async () => {
  console.error("🔧 Tools requested by client");
  return { tools };
});

server.setRequestHandler(CallToolRequestSchema, async (request) => {
  const { name, arguments: args } = request.params;
  console.error(`🔧 Tool called: ${name} with args:`, args);
  
  if (name === "test_tool") {
    return {
      content: [
        {
          type: "text",
          text: `✅ Test successful! Message: ${args.message}`,
        },
      ],
    };
  }
  
  throw new Error(`Unknown tool: ${name}`);
});

// Start the server
async function main() {
  const transport = new StdioServerTransport();
  await server.connect(transport);
  console.error("🔧 Simple MCP Test Server running...");
}

main().catch(err => {
  console.error("🔧 Error:", err);
  process.exit(1);
}); 