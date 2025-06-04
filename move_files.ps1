# Move Apify files
if (Test-Path "mainjsapify.json") {
    Move-Item -Path "mainjsapify.json" -Destination "src\apify\" -Force
}
if (Test-Path "apifynodejs.groovy") {
    Move-Item -Path "apifynodejs.groovy" -Destination "src\apify\" -Force
}

# Move Google Drive files
if (Test-Path "Gdrive Agent Webhook.json") {
    Move-Item -Path "Gdrive Agent Webhook.json" -Destination "src\gdrive\webhook.json" -Force
}
if (Test-Path "Gdrive Agent Webhook.py") {
    Move-Item -Path "Gdrive Agent Webhook.py" -Destination "src\gdrive\webhook.py" -Force
}

Write-Host "File movement completed. Please check the directories to verify." 