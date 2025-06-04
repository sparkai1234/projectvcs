#!/usr/bin/env python3
"""
Safe Project Cleanup - Move non-essential files to archive
"""

import os
import shutil
from pathlib import Path

def safe_project_cleanup():
    print("🧹 SAFE PROJECT CLEANUP")
    print("=" * 50)
    
    # Create archive directory
    archive_dir = Path("archive_migration_files")
    archive_dir.mkdir(exist_ok=True)
    
    # Files to KEEP (essential)
    keep_files = {
        'api_config.py',
        'cleanup_fund_table_final.sql',
        'cleanup_vc_table_final.sql', 
        'verify_cleanup_success.py',
        'create_supabase_schema.sql',
        'fixed_complete_migration.py',
        'supabase_migration_plan.md',
        'openai_diva_integration.py',
        'test_korean_openai.py',
        'korean_ai_usage_guide.md',
        'airtable_alternatives_analysis.md',
        'safe_project_cleanup.py'  # This script
    }
    
    # Patterns to archive (move, not delete)
    archive_patterns = [
        'test_',
        'check_', 
        'debug_',
        'quick_',
        'verify_',
        'fix_',
        'diagnose_',
        'monitor_',
        'comprehensive_',
        'final_duplicate_',
        'complete_field_'
    ]
    
    current_dir = Path('.')
    
    print("📦 ARCHIVING NON-ESSENTIAL FILES:")
    archived_count = 0
    kept_count = 0
    
    for file_path in current_dir.iterdir():
        if file_path.is_file():
            filename = file_path.name
            
            # Skip essential files
            if filename in keep_files:
                print(f"   ✅ KEEP: {filename}")
                kept_count += 1
                continue
            
            # Archive test/debug files
            should_archive = False
            for pattern in archive_patterns:
                if filename.startswith(pattern):
                    should_archive = True
                    break
            
            # Archive specific file types
            if (filename.endswith('.txt') or 
                filename.endswith('_old.py') or
                'duplicate' in filename.lower() or
                'migration' in filename and filename != 'supabase_migration_plan.md'):
                should_archive = True
            
            if should_archive:
                try:
                    shutil.move(str(file_path), str(archive_dir / filename))
                    print(f"   📦 ARCHIVED: {filename}")
                    archived_count += 1
                except Exception as e:
                    print(f"   ⚠️  Error archiving {filename}: {e}")
            else:
                print(f"   ✅ KEEP: {filename}")
                kept_count += 1
    
    # Handle __pycache__ directory
    pycache_dir = current_dir / '__pycache__'
    if pycache_dir.exists():
        try:
            shutil.rmtree(pycache_dir)
            print(f"   🗑️  DELETED: __pycache__/ (Python cache)")
        except Exception as e:
            print(f"   ⚠️  Error deleting __pycache__: {e}")
    
    print(f"\n📊 CLEANUP SUMMARY:")
    print(f"   ✅ Files kept: {kept_count}")
    print(f"   📦 Files archived: {archived_count}")
    print(f"   📁 Archive location: {archive_dir}")
    
    print(f"\n💡 RESULT:")
    print(f"   🎯 Project folder is now clean and organized")
    print(f"   ✅ All essential files preserved")
    print(f"   📦 Non-essential files safely archived (not deleted)")
    print(f"   🔄 You can restore any file from archive if needed")
    
    print(f"\n📋 NEXT STEPS FOR TOMORROW:")
    print(f"   🤖 Fuzzy Matching for Contacts")
    print(f"   🧠 OpenAI Integration") 
    print(f"   🚀 Production optimization")

if __name__ == "__main__":
    safe_project_cleanup() 