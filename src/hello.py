#!/usr/bin/env python3
"""
A simple hello world program to test your development environment
"""

def greet(name="Developer"):
    """Greet someone with a friendly message"""
    return f"Hello, {name}! Welcome to ProjectVCS! 🚀"

def main():
    print(greet())
    print("Your development environment is working perfectly!")
    
    # Try some basic Python
    numbers = [1, 2, 3, 4, 5]
    print(f"Sum of numbers {numbers} = {sum(numbers)}")

if __name__ == "__main__":
    main() 