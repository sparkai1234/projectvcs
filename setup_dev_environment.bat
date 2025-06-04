@echo off
echo 🚀 DIVA Intelligence System v2.0 - Development Environment Setup
echo ================================================================

:: Check if Python is installed
python --version >nul 2>&1
if errorlevel 1 (
    echo ❌ Python is not installed or not in PATH
    echo Please install Python 3.8+ from https://python.org
    pause
    exit /b 1
)

echo ✅ Python detected
python --version

:: Create virtual environment if it doesn't exist
if not exist ".venv" (
    echo 📦 Creating virtual environment...
    python -m venv .venv
    if errorlevel 1 (
        echo ❌ Failed to create virtual environment
        pause
        exit /b 1
    )
    echo ✅ Virtual environment created
) else (
    echo ✅ Virtual environment already exists
)

:: Activate virtual environment
echo 🔄 Activating virtual environment...
call .venv\Scripts\activate.bat

:: Upgrade pip
echo 📦 Upgrading pip...
python -m pip install --upgrade pip

:: Install requirements
echo 📦 Installing dependencies...
if exist "requirements.txt" (
    pip install -r requirements.txt
    if errorlevel 1 (
        echo ❌ Failed to install some dependencies
        echo ⚠️  Please check the error messages above
        pause
    ) else (
        echo ✅ All dependencies installed successfully
    )
) else (
    echo ❌ requirements.txt not found
    echo Please ensure you're in the correct directory
    pause
    exit /b 1
)

:: Check if .env file exists
if not exist ".env" (
    echo 📝 Creating .env template...
    echo # DIVA Intelligence System v2.0 - Environment Configuration > .env
    echo # Airtable Configuration >> .env
    echo AIRTABLE_API_KEY=pat...your_key_here >> .env
    echo AIRTABLE_BASE_ID=appdR8V9lJaRW8VkR >> .env
    echo. >> .env
    echo # Supabase Configuration >> .env
    echo SUPABASE_URL=your_supabase_url >> .env
    echo SUPABASE_KEY=your_supabase_key >> .env
    echo. >> .env
    echo # OpenAI Configuration >> .env
    echo OPENAI_API_KEY=sk-...your_key_here >> .env
    echo. >> .env
    echo ✅ Created .env template
    echo ⚠️  Please edit .env file with your actual API keys
) else (
    echo ✅ .env file already exists
)

:: Display system status
echo.
echo 🎯 DIVA Intelligence System v2.0 - Ready for Development!
echo ============================================================
echo.
echo 📊 System Status:
echo   ✅ Virtual Environment: Active
echo   ✅ Dependencies: Installed
echo   ✅ Configuration: Template Ready
echo.
echo 🚀 Next Steps:
echo   1. Edit .env file with your API keys
echo   2. Run: python final_system_status.py
echo   3. Run: python diva_enhancement_system_fixed.py
echo.
echo 📚 Documentation:
echo   - HOME_WORK_CONTINUATION_GUIDE.md
echo   - README.md
echo   - COMPREHENSIVE_DIVA_SYSTEM_GUIDE.md
echo.
echo 🏠 Happy coding at home! 🇰🇷
echo.
pause 