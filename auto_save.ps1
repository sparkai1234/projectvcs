# Auto-save script for Git repository
# This script monitors changes and automatically commits them

$repoPath = $PSScriptRoot
$lastCommit = git rev-parse HEAD
$watchPath = Join-Path $repoPath "src"

Write-Host "Starting auto-save for repository at: $repoPath"
Write-Host "Watching directory: $watchPath"
Write-Host "Press Ctrl+C to stop"

try {
    while ($true) {
        # Check for changes
        $currentCommit = git rev-parse HEAD
        $status = git status --porcelain

        if ($status -and $currentCommit -eq $lastCommit) {
            $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
            Write-Host "`n[$timestamp] Changes detected, committing..."
            
            # Add all changes
            git add .
            
            # Create commit with timestamp
            $commitMessage = "Auto-save: $timestamp"
            git commit -m $commitMessage
            
            # Push changes
            git push
            
            Write-Host "Changes committed and pushed successfully"
            $lastCommit = git rev-parse HEAD
        }
        
        # Wait for 30 seconds before next check
        Start-Sleep -Seconds 30
    }
} catch {
    Write-Host "`nScript stopped by user or error occurred"
    Write-Host $_.Exception.Message
} 