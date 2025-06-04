# 🔄 Git Commands Reference Card

## 📥 **Download Files FROM GitHub TO Local**

### Get Latest Changes
```bash
cd C:\Users\a\projectvcs
git pull origin main
```

### Check for Updates Available
```bash
git fetch origin
git status
```

### See What's Different
```bash
git diff origin/main
```

## 📤 **Upload Files FROM Local TO GitHub**

### Save Your Work to Cloud
```bash
# Stage all changes
git add .

# Commit with message
git commit -m "Describe what you changed"

# Push to GitHub
git push origin main
```

### Quick One-Liner (After Initial Setup)
```bash
git add . && git commit -m "Update" && git push origin main
```

## 🔍 **Check Status & History**

```bash
git status           # See current changes
git log --oneline    # See commit history  
git remote -v        # Show GitHub connection
```

## 🚨 **Emergency Commands**

### Reset Local to Match GitHub Exactly
```bash
git fetch origin
git reset --hard origin/main
```

### Discard Local Changes
```bash
git checkout -- .
```

## 💡 **Daily Workflow**

1. **Start work**: `git pull origin main`
2. **Make changes**: Edit files in VS Code
3. **Save to cloud**: `git add . && git commit -m "What I did" && git push origin main`

---
*Your local folder: `C:\Users\a\projectvcs`*  
*Your GitHub repo: `https://github.com/sparkai1234/projectvcs`* 