@echo off
echo 🗂️ DIVA Project File Organizer
echo ===============================
echo.

REM Create directories if they don't exist
if not exist "src" mkdir src
if not exist "config" mkdir config
if not exist "docs" mkdir docs
if not exist "data" mkdir data
if not exist "scripts" mkdir scripts

echo ✅ Directories created/verified:
echo    - src/        (Python source files)
echo    - config/     (Configuration files)
echo    - docs/       (Documentation)
echo    - data/       (Data files)
echo    - scripts/    (Utility scripts)
echo.

echo 📋 Instructions for organizing your files:
echo.
echo 1. Open File Explorer and navigate to your source directory
echo    (The one containing fuzzy_company_matcher.py, DIVA_SETUP_GUIDE, etc.)
echo.
echo 2. Select and move files according to this guide:
echo.
echo    📁 src/ - Move these files here:
echo       • All .py files (fuzzy_company_matcher.py, fixed_complete_migration.py, etc.)
echo       • openai_diva_integration
echo       • move_files
echo.
echo    📁 config/ - Move these files here:
echo       • api_config
echo       • package
echo       • Any configuration files
echo.
echo    📁 docs/ - Move these files here:
echo       • DIVA_SETUP_GUIDE
echo       • korean_ai_usage_guide
echo       • README
echo       • FUZZY_MATCHING_SETUP
echo       • Any documentation files
echo.
echo    📁 data/ - Move these files here:
echo       • auto_save (if it contains data)
echo       • Any .csv, .json, .sql files
echo.
echo 3. After moving files, run this command to see the organized structure:
echo    tree /F
echo.
echo Press any key to open File Explorer to this directory...
pause >nul
explorer .
echo.
echo ✅ File Explorer opened. You can now organize your files!
echo.
pause 