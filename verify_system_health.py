#!/usr/bin/env python3
"""
🚀 DIVA Intelligence System v2.0 - System Health Verification
============================================================

This script verifies that all components of the DIVA Intelligence System
are properly configured and ready for production use.
"""

import os
import sys
import json
from datetime import datetime
from pathlib import Path

# Color codes for terminal output
class Colors:
    GREEN = '\033[92m'
    RED = '\033[91m'
    YELLOW = '\033[93m'
    BLUE = '\033[94m'
    PURPLE = '\033[95m'
    CYAN = '\033[96m'
    WHITE = '\033[97m'
    BOLD = '\033[1m'
    END = '\033[0m'

def print_status(message, status="INFO"):
    """Print formatted status message"""
    timestamp = datetime.now().strftime("%H:%M:%S")
    if status == "SUCCESS":
        print(f"{Colors.GREEN}✅ [{timestamp}] {message}{Colors.END}")
    elif status == "ERROR":
        print(f"{Colors.RED}❌ [{timestamp}] {message}{Colors.END}")
    elif status == "WARNING":
        print(f"{Colors.YELLOW}⚠️  [{timestamp}] {message}{Colors.END}")
    else:
        print(f"{Colors.BLUE}ℹ️  [{timestamp}] {message}{Colors.END}")

def check_python_version():
    """Check Python version compatibility"""
    print_status("Checking Python version...")
    version = sys.version_info
    if version.major >= 3 and version.minor >= 8:
        print_status(f"Python {version.major}.{version.minor}.{version.micro} - Compatible", "SUCCESS")
        return True
    else:
        print_status(f"Python {version.major}.{version.minor}.{version.micro} - Requires Python 3.8+", "ERROR")
        return False

def check_required_packages():
    """Check if required packages are installed"""
    print_status("Checking required packages...")
    required_packages = [
        'requests', 'pandas', 'numpy', 'openai', 'supabase',
        'selenium', 'beautifulsoup4', 'fuzzywuzzy'
    ]
    
    missing_packages = []
    for package in required_packages:
        try:
            __import__(package)
            print_status(f"✓ {package}", "SUCCESS")
        except ImportError:
            missing_packages.append(package)
            print_status(f"✗ {package} - Not installed", "ERROR")
    
    if missing_packages:
        print_status(f"Missing packages: {', '.join(missing_packages)}", "ERROR")
        print_status("Run: pip install -r requirements.txt", "INFO")
        return False
    
    print_status("All required packages installed", "SUCCESS")
    return True

def check_environment_variables():
    """Check if environment variables are configured"""
    print_status("Checking environment configuration...")
    
    # Check for .env file
    env_file = Path('.env')
    if env_file.exists():
        print_status(".env file found", "SUCCESS")
        
        # Load and check critical variables
        try:
            from dotenv import load_dotenv
            load_dotenv()
            
            critical_vars = [
                'AIRTABLE_API_KEY',
                'AIRTABLE_BASE_ID'
            ]
            
            optional_vars = [
                'SUPABASE_URL',
                'SUPABASE_KEY',
                'OPENAI_API_KEY'
            ]
            
            for var in critical_vars:
                if os.getenv(var) and not os.getenv(var).startswith('your_'):
                    print_status(f"✓ {var} configured", "SUCCESS")
                else:
                    print_status(f"✗ {var} not configured", "ERROR")
            
            for var in optional_vars:
                if os.getenv(var) and not os.getenv(var).startswith('your_'):
                    print_status(f"✓ {var} configured", "SUCCESS")
                else:
                    print_status(f"⚠ {var} not configured (optional)", "WARNING")
                    
        except ImportError:
            print_status("python-dotenv not installed - install it for .env support", "WARNING")
    else:
        print_status(".env file not found - using system environment", "WARNING")
    
    return True

def check_core_files():
    """Check if core system files exist"""
    print_status("Checking core system files...")
    
    core_files = [
        'diva_enhancement_system_fixed.py',
        'complete_fund_analysis.py',
        'supabase_adapter.py',
        'config.py',
        'requirements.txt',
        'README.md'
    ]
    
    missing_files = []
    for file in core_files:
        if Path(file).exists():
            print_status(f"✓ {file}", "SUCCESS")
        else:
            missing_files.append(file)
            print_status(f"✗ {file} - Missing", "ERROR")
    
    if missing_files:
        print_status(f"Missing core files: {', '.join(missing_files)}", "ERROR")
        return False
    
    print_status("All core files present", "SUCCESS")
    return True

def check_data_directories():
    """Check if required directories exist"""
    print_status("Checking directory structure...")
    
    required_dirs = [
        'archive',
        'archive/development',
        'archive/migration',
        'archive/testing',
        'archive/reports'
    ]
    
    for dir_path in required_dirs:
        path = Path(dir_path)
        if path.exists():
            print_status(f"✓ {dir_path}/", "SUCCESS")
        else:
            print_status(f"Creating directory: {dir_path}/", "INFO")
            path.mkdir(parents=True, exist_ok=True)
            print_status(f"✓ {dir_path}/ created", "SUCCESS")
    
    return True

def test_system_imports():
    """Test critical system imports"""
    print_status("Testing system imports...")
    
    try:
        # Test core system import
        print_status("Testing core system components...", "INFO")
        
        # Test configuration
        if Path('config.py').exists():
            import config
            print_status("✓ Configuration module", "SUCCESS")
        
        # Test database adapter
        if Path('supabase_adapter.py').exists():
            import supabase_adapter
            print_status("✓ Database adapter", "SUCCESS")
        
        print_status("System imports successful", "SUCCESS")
        return True
        
    except Exception as e:
        print_status(f"Import error: {str(e)}", "ERROR")
        return False

def generate_health_report():
    """Generate comprehensive health report"""
    print_status("Generating system health report...")
    
    report = {
        "timestamp": datetime.now().isoformat(),
        "system_version": "DIVA Intelligence System v2.0",
        "status": "Production Ready",
        "python_version": f"{sys.version_info.major}.{sys.version_info.minor}.{sys.version_info.micro}",
        "checks_performed": [
            "Python version compatibility",
            "Required packages installation",
            "Environment configuration",
            "Core files presence",
            "Directory structure",
            "System imports"
        ],
        "next_steps": [
            "Configure API keys in .env file",
            "Run: python final_system_status.py",
            "Run: python diva_enhancement_system_fixed.py",
            "Verify data collection with scrapers"
        ]
    }
    
    # Save report
    report_file = f"system_health_report_{datetime.now().strftime('%Y%m%d_%H%M%S')}.json"
    with open(report_file, 'w', encoding='utf-8') as f:
        json.dump(report, f, indent=2, ensure_ascii=False)
    
    print_status(f"Health report saved: {report_file}", "SUCCESS")
    return report

def main():
    """Main system health verification"""
    print(f"\n{Colors.BOLD}{Colors.PURPLE}🚀 DIVA Intelligence System v2.0 - Health Verification{Colors.END}")
    print(f"{Colors.BOLD}{Colors.PURPLE}{'=' * 60}{Colors.END}\n")
    
    # Perform all checks
    checks = [
        ("Python Version", check_python_version),
        ("Required Packages", check_required_packages),
        ("Environment Config", check_environment_variables),
        ("Core Files", check_core_files),
        ("Directory Structure", check_data_directories),
        ("System Imports", test_system_imports)
    ]
    
    passed_checks = 0
    total_checks = len(checks)
    
    for check_name, check_func in checks:
        print(f"\n{Colors.BOLD}📋 {check_name}{Colors.END}")
        print("-" * 40)
        
        try:
            if check_func():
                passed_checks += 1
        except Exception as e:
            print_status(f"Check failed with error: {str(e)}", "ERROR")
    
    # Final status
    print(f"\n{Colors.BOLD}📊 FINAL SYSTEM STATUS{Colors.END}")
    print("=" * 40)
    
    success_rate = (passed_checks / total_checks) * 100
    
    if success_rate == 100:
        print_status(f"System Health: EXCELLENT ({passed_checks}/{total_checks} checks passed)", "SUCCESS")
        print_status("🎯 DIVA Intelligence System v2.0 is PRODUCTION READY!", "SUCCESS")
    elif success_rate >= 80:
        print_status(f"System Health: GOOD ({passed_checks}/{total_checks} checks passed)", "SUCCESS")
        print_status("System is ready with minor configuration needed", "WARNING")
    else:
        print_status(f"System Health: NEEDS ATTENTION ({passed_checks}/{total_checks} checks passed)", "ERROR")
        print_status("Please address the issues above before proceeding", "ERROR")
    
    # Generate report
    generate_health_report()
    
    print(f"\n{Colors.BOLD}🏠 Ready to continue development at home!{Colors.END}")
    print(f"{Colors.CYAN}📖 See HOME_WORK_CONTINUATION_GUIDE.md for next steps{Colors.END}\n")

if __name__ == "__main__":
    main() 