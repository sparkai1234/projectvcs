# Airtable Configuration
# Replace with your actual values

AIRTABLE_CONFIG = {
    # Your Airtable API Key (starts with 'pat')
    "API_KEY": "patOUfAsek4nbpvHm.49789...",  # Replace with your full API key
    
    # Your Airtable Base ID  
    "BASE_ID": "appdR8V9lJaRW8VkR",
    
    # Table Names (must match exactly)
    "VC_TABLE": "VC Table",
    "FUND_TABLE": "Fund Table", 
    "CONTACTS_TABLE": "Contacts Table",
    
    # Field Names (must match exactly)  
    "VC_COMPANY_FIELD": "Company Name",
    "FUND_COMPANY_FIELD": "Company Name",
    "CONTACTS_COMPANY_FIELD": "회사",
    
    # Fuzzy Matching Settings
    "FUZZY_THRESHOLD": 80,  # Minimum similarity percentage (60-90 recommended)
    "MAX_MATCHES_PER_CONTACT": 1,  # How many matches per contact company
    
    # API Settings
    "REQUEST_DELAY": 0.2,  # Seconds between API calls
    "BATCH_SIZE": 10       # Records to process in batch
} 