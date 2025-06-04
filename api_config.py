#!/usr/bin/env python3
"""
API Configuration for DIVA Intelligence System
Replace the placeholder values with your actual API keys
"""

import os

# Airtable Configuration (KEEP - for transition period)
AIRTABLE_BASE_ID = "appdR8V9lJaRW8VkR"
AIRTABLE_API_KEY = "patOUfAsek4nbpvHm.49789ced0e2b0304bdc507f110d936277cd3da18ec3efc9347c93e6a1810919e"

# OpenAI Configuration  
OPENAI_API_KEY = "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"

# Supabase Configuration (NEW - Plan B Database)
SUPABASE_URL = "https://udfgtccxbqmalgpqyxzz.supabase.co"
SUPABASE_ANON_KEY = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InVkZmd0Y2N4YnFtYWxncHF5eHp6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDg5NDY2OTYsImV4cCI6MjA2NDUyMjY5Nn0.ecx422hs05qMSVITNnbAiLMuPvx1k59FUIjqqpsV8iI"
SUPABASE_SERVICE_KEY = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InVkZmd0Y2N4YnFtYWxncHF5eHp6Iiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc0ODk0NjY5NiwiZXhwIjoyMDY0NTIyNjk2fQ.JgyEKjOhuZpNCCOadsaK90Q8CcoPf_rgdtSXh-1BU18"


def set_environment_variables():
    """Set environment variables from this config"""
    os.environ['AIRTABLE_BASE_ID'] = AIRTABLE_BASE_ID
    os.environ['AIRTABLE_API_KEY'] = AIRTABLE_API_KEY
    os.environ['OPENAI_API_KEY'] = OPENAI_API_KEY
    os.environ['SUPABASE_URL'] = SUPABASE_URL
    os.environ['SUPABASE_ANON_KEY'] = SUPABASE_ANON_KEY
    os.environ['SUPABASE_SERVICE_KEY'] = SUPABASE_SERVICE_KEY
    
def get_config():
    """Get configuration values"""
    return {
        'airtable_base_id': AIRTABLE_BASE_ID,
        'airtable_api_key': AIRTABLE_API_KEY,
        'openai_api_key': OPENAI_API_KEY,
        'supabase_url': SUPABASE_URL,
        'supabase_anon_key': SUPABASE_ANON_KEY,
        'supabase_service_key': SUPABASE_SERVICE_KEY
    }

def get_supabase_config(use_service_role=False):
    """Get Supabase-specific configuration"""
    key = SUPABASE_SERVICE_KEY if use_service_role else SUPABASE_ANON_KEY
    return {
        'url': SUPABASE_URL,
        'key': key
    } 