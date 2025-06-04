"""
Test file for main.py
"""
import sys
import os

# Add src directory to path for importing
sys.path.append(os.path.join(os.path.dirname(__file__), '..', 'src'))

try:
    from main import main
except ImportError:
    print("Could not import main function. Make sure src/main.py exists.")

def test_main_runs():
    """Test that main function runs without errors"""
    try:
        main()
        print("✅ main() function runs successfully!")
        return True
    except Exception as e:
        print(f"❌ Error running main(): {e}")
        return False

if __name__ == "__main__":
    print("Running basic tests...")
    test_main_runs()
    print("Tests completed!") 