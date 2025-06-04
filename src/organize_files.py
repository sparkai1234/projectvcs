#!/usr/bin/env python3
"""
File Organization Script for DIVA Intelligence System
This script helps organize project files into the proper directory structure.
"""

import os
import shutil
from pathlib import Path

def organize_files(source_dir, target_dir):
    """
    Organize files from source directory into proper structure
    
    Args:
        source_dir: Path to directory containing the files to organize
        target_dir: Path to the organized project directory (should be current dir)
    """
    
    # Create target directories if they don't exist
    directories = {
        'src': 'Python source files',
        'config': 'Configuration files',
        'docs': 'Documentation files', 
        'data': 'Data files',
        'scripts': 'Utility scripts',
        'tests': 'Test files'
    }
    
    for dir_name in directories:
        dir_path = Path(target_dir) / dir_name
        dir_path.mkdir(exist_ok=True)
        print(f"✅ Created/verified directory: {dir_path}")
    
    # File categorization rules
    python_files = ['.py']
    config_files = ['api_config', 'package', '.env', '.config', 'config']
    doc_files = ['README', 'SETUP', 'GUIDE', '.md', '.txt', '.rst']
    data_files = ['.csv', '.json', '.xlsx', '.sql']
    
    if not os.path.exists(source_dir):
        print(f"❌ Source directory not found: {source_dir}")
        print("Please update the source_dir path in this script")
        return
    
    print(f"\n📁 Scanning source directory: {source_dir}")
    
    # List all files in source directory
    for item in os.listdir(source_dir):
        source_path = Path(source_dir) / item
        
        if source_path.is_file():
            filename = item.lower()
            moved = False
            
            # Categorize and move files
            if any(filename.endswith(ext) for ext in python_files):
                target_path = Path(target_dir) / 'src' / item
                category = "Python file"
                
            elif any(keyword in filename for keyword in ['config', 'api_config', 'package']):
                target_path = Path(target_dir) / 'config' / item
                category = "Config file"
                
            elif any(keyword in filename for keyword in ['readme', 'setup', 'guide', 'doc']):
                target_path = Path(target_dir) / 'docs' / item
                category = "Documentation"
                
            elif any(filename.endswith(ext) for ext in data_files):
                target_path = Path(target_dir) / 'data' / item
                category = "Data file"
                
            elif 'test' in filename:
                target_path = Path(target_dir) / 'tests' / item
                category = "Test file"
                
            else:
                target_path = Path(target_dir) / 'src' / item
                category = "Source file (default)"
            
            try:
                shutil.copy2(source_path, target_path)
                print(f"✅ Moved {item} → {target_path.parent.name}/ ({category})")
                moved = True
            except Exception as e:
                print(f"❌ Error moving {item}: {e}")

def main():
    """Main function to run the file organization"""
    print("🗂️  DIVA Project File Organizer")
    print("=" * 50)
    
    # Update this path to where your existing files are located
    # Based on your File Explorer, it might be something like:
    source_dir = input("Enter the full path to your source directory with existing files: ").strip()
    
    # Target is current directory
    target_dir = "."
    
    if source_dir:
        organize_files(source_dir, target_dir)
        print("\n✅ File organization complete!")
        print("📋 Summary of organized directories:")
        for dir_name in ['src', 'config', 'docs', 'data', 'tests']:
            dir_path = Path(dir_name)
            if dir_path.exists():
                file_count = len(list(dir_path.glob('*')))
                print(f"   {dir_name}/: {file_count} files")
    else:
        print("❌ No source directory provided")

if __name__ == "__main__":
    main() 