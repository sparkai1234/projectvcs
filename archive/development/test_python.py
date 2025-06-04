#!/usr/bin/env python3
"""
Simple test to verify Python execution
"""

print("🐍 Python is working!")
print("Testing imports...")

try:
    import requests
    print("✅ requests - OK")
except ImportError:
    print("❌ requests - Missing")

try:
    from fuzzywuzzy import fuzz
    print("✅ fuzzywuzzy - OK")
except ImportError:
    print("❌ fuzzywuzzy - Missing")

try:
    import json
    print("✅ json - OK")
except ImportError:
    print("❌ json - Missing")

print("Test complete!") 