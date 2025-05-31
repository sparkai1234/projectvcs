# Project VCS

This project contains scripts and configurations for web scraping and automation tasks, with integrated chat history and version control.

## Project Structure

```
projectvcs/
├── src/                    # Source code
│   ├── apify/             # Apify related scripts
│   │   ├── mainjsapify.json
│   │   └── apifynodejs.groovy
│   └── gdrive/            # Google Drive integration
│       ├── webhook.json
│       └── webhook.py
├── docs/                   # Documentation
│   ├── chat_history/      # Cursor chat history
│   └── api_docs/          # API documentation
├── .env.example           # Example environment variables
├── .gitignore            # Git ignore rules
└── README.md             # This file
```

## Setup Instructions

1. Install dependencies:
   ```bash
   # For Python
   pip install -r requirements.txt
   
   # For Node.js
   npm install
   ```

2. Configure environment variables:
   - Copy `.env.example` to `.env`
   - Add necessary API keys and credentials

3. Run the scripts:
   ```bash
   # Run Python script
   python src/gdrive/webhook.py
   
   # Run Node.js script
   node src/apify/mainjsapify.json
   ```

## Development Environment

- Python 3.x
- Node.js
- Required packages listed in requirements.txt
- Cursor IDE for chat history preservation

## Version Control and Chat History

This project uses Git for version control and Cursor for chat history preservation:

1. Git Version Control:
   ```bash
   git add .
   git commit -m "Your commit message"
   git push origin main
   ```

2. Chat History Management:
   - All Cursor chat sessions are automatically saved
   - Chat history is stored in `docs/chat_history/`
   - Each chat session is timestamped and categorized

3. Project Merging:
   - Use Git branches for feature development
   - Merge branches using pull requests
   - Document all major changes in chat history

## Backup Strategy

1. Version Control:
   - Regular Git pushes to remote repository
   - Branch protection rules
   - Automated CI/CD pipelines

2. Chat History:
   - Regular exports of Cursor chat history
   - Documentation of important decisions
   - Integration with project documentation

3. Environment:
   - Cloud storage backup of important files
   - Document all environment changes
   - Keep dependencies list updated

## Troubleshooting

If you encounter any issues:
1. Check the logs in the respective script directories
2. Verify environment variables are set correctly
3. Ensure all dependencies are installed
4. Review chat history for similar issues
5. Check Git history for related changes 