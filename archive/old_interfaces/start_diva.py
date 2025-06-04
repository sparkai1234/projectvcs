#!/usr/bin/env python3
"""
DIVA Intelligence System - Main Startup Script
Choose what you want to do with your DIVA system
"""

import sys
import os
from api_config import set_environment_variables, get_config

def display_banner():
    """Display the DIVA system banner"""
    print("🚀 DIVA Intelligence System")
    print("="*50)
    print("🏢 VC Portfolio & Company Intelligence Platform")
    print("📊 Data Scraping, Analysis & Fuzzy Matching")
    print("="*50)
    print()

def display_menu():
    """Display main menu options"""
    print("🎯 What would you like to do?")
    print()
    print("1. 🔍 Fuzzy Company Matching (Link VC/Fund/Contact data)")
    print("2. 🇰🇷 Korean Company Matcher (85% threshold - 회사 → VC Table)")
    print("3. 🌐 Test OpenAI Integration (Korean language)")
    print("4. 🤖 Comprehensive AI Analysis (All Supabase Tables)")
    print("5. 📊 Run DIVA Personnel Data Scraper")
    print("6. 🗄️ Database Migration/Setup")
    print("7. ⚙️ Test API Configurations")
    print("8. 📋 View System Status & Files")
    print("9. 🆘 Help & Documentation")
    print("0. 🚪 Exit")
    print()

def test_api_config():
    """Test API configurations"""
    print("⚙️ Testing API Configurations...")
    print("-" * 30)
    
    config = get_config()
    
    # Test OpenAI
    if config['openai_api_key'].startswith('sk-'):
        print("✅ OpenAI API Key: Configured")
    else:
        print("❌ OpenAI API Key: Missing or invalid")
    
    # Test Supabase
    if config['supabase_url'] and config['supabase_anon_key']:
        print("✅ Supabase: Configured")
    else:
        print("❌ Supabase: Missing configuration")
    
    # Test Airtable
    if config['airtable_api_key'] and config['airtable_base_id']:
        print("✅ Airtable: Configured")
    else:
        print("❌ Airtable: Missing configuration")
    
    print()

def run_fuzzy_matching():
    """Run the fuzzy company matcher"""
    print("🔍 Starting Fuzzy Company Matching...")
    
    try:
        # Import and run the fuzzy matcher
        from fuzzy_company_matcher import AirtableFuzzyMatcher, main as fuzzy_main
        fuzzy_main()
    except ImportError as e:
        print(f"❌ Error importing fuzzy matcher: {e}")
        print("Make sure all dependencies are installed.")
    except Exception as e:
        print(f"❌ Error running fuzzy matcher: {e}")

def run_korean_matching():
    """Run the Korean company matcher"""
    print("🇰🇷 Starting Korean Company Matching (85% threshold)...")
    print("Matching '회사' fields with VC Table company_name fields")
    print()
    
    try:
        # Import and run the Korean matcher
        from custom_fuzzy_matcher import KoreanCompanyMatcher, main as korean_main
        korean_main()
    except ImportError as e:
        print(f"❌ Error importing Korean matcher: {e}")
        print("Make sure all dependencies are installed.")
    except Exception as e:
        print(f"❌ Error running Korean matcher: {e}")

def test_openai():
    """Test OpenAI Korean integration"""
    print("🌐 Testing OpenAI Integration...")
    
    try:
        # Import and run the OpenAI test
        import subprocess
        result = subprocess.run([sys.executable, "test_korean_openai.py"], 
                               capture_output=True, text=True)
        print(result.stdout)
        if result.stderr:
            print(f"Errors: {result.stderr}")
    except Exception as e:
        print(f"❌ Error testing OpenAI: {e}")

def run_comprehensive_ai():
    """Run the comprehensive AI analysis interface"""
    print("🤖 Starting Comprehensive AI Analysis...")
    print("📊 Accessing all Supabase tables for intelligent queries")
    print()
    
    try:
        # Import and run the comprehensive AI interface
        from supabase_openai_interface import SupabaseOpenAIInterface
        interface = SupabaseOpenAIInterface()
        interface.interactive_chat()
    except ImportError as e:
        print(f"❌ Error importing AI interface: {e}")
        print("Make sure all dependencies are installed.")
    except Exception as e:
        print(f"❌ Error running AI interface: {e}")

def show_system_status():
    """Show system status and available files"""
    print("📋 DIVA System Status")
    print("-" * 30)
    
    # Count files in each directory
    directories = ['src', 'config', 'docs', 'data', 'tests']
    total_files = 0
    
    for directory in directories:
        if os.path.exists(directory):
            files = os.listdir(directory)
            file_count = len([f for f in files if os.path.isfile(os.path.join(directory, f))])
            print(f"📁 {directory}/: {file_count} files")
            total_files += file_count
        else:
            print(f"📁 {directory}/: Not found")
    
    # Count root Python files
    root_py_files = len([f for f in os.listdir('.') if f.endswith('.py')])
    total_files += root_py_files
    print(f"📁 Root Python files: {root_py_files}")
    
    print(f"\n📊 Total Project Files: {total_files}")
    
    # Key files check
    key_files = [
        'fuzzy_company_matcher.py',
        'custom_fuzzy_matcher.py',
        'openai_diva_integration.py', 
        'api_config.py',
        'DIVA_SETUP_GUIDE.md'
    ]
    
    print("\n🔑 Key Files Status:")
    for file in key_files:
        if os.path.exists(file):
            print(f"✅ {file}")
        else:
            print(f"❌ {file} - Not found")

def show_help():
    """Show help and documentation"""
    print("🆘 DIVA System Help")
    print("-" * 30)
    print()
    print("📖 Documentation Files:")
    print("• DIVA_SETUP_GUIDE.md - Complete setup instructions")
    print("• FUZZY_MATCHING_SETUP.md - Fuzzy matching guide")
    print("• korean_ai_usage_guide.md - Korean AI integration")
    print("• GIT_COMMANDS.md - Git workflow commands")
    print()
    print("🛠️ Main System Files:")
    print("• fuzzy_company_matcher.py - Company relationship analysis")
    print("• custom_fuzzy_matcher.py - Korean company matching (85%)")
    print("• openai_diva_integration.py - AI integration")
    print("• api_config.py - API keys and configuration")
    print()
    print("💡 Getting Started:")
    print("1. Test your API configs (option 7)")
    print("2. Try Korean company matching (option 2)")
    print("3. Try general fuzzy matching (option 1)")
    print("4. Test OpenAI integration (option 3)")
    print()

def main():
    """Main function"""
    # Set environment variables
    set_environment_variables()
    
    while True:
        display_banner()
        display_menu()
        
        try:
            choice = input("👉 Enter your choice (0-9): ").strip()
            print()
            
            if choice == "1":
                run_fuzzy_matching()
            elif choice == "2":
                run_korean_matching()
            elif choice == "3":
                test_openai()
            elif choice == "4":
                run_comprehensive_ai()
            elif choice == "5":
                print("📊 DIVA Scraper - Feature coming soon!")
                print("Check DIVA_SETUP_GUIDE.md for manual instructions")
            elif choice == "6":
                print("🗄️ Database Migration - Feature coming soon!")
                print("Check the .sql files for manual migration")
            elif choice == "7":
                test_api_config()
            elif choice == "8":
                show_system_status()
            elif choice == "9":
                show_help()
            elif choice == "0":
                print("👋 Goodbye! Happy analyzing!")
                break
            else:
                print("❌ Invalid choice. Please try again.")
            
            input("\nPress Enter to continue...")
            print("\n" * 2)
            
        except KeyboardInterrupt:
            print("\n👋 Goodbye!")
            break
        except Exception as e:
            print(f"❌ Error: {e}")
            input("\nPress Enter to continue...")

if __name__ == "__main__":
    main() 