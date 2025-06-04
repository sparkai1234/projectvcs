# 🔄 Git Commands Reference Card

## 📥 **Download Files FROM GitHub TO Local**

### Get Latest Changes
```bash
cd C:\Users\a\projectvcs
&"C:\Program Files\Git\bin\git.exe" pull origin main
```

### Check for Updates Available
```bash
&"C:\Program Files\Git\bin\git.exe" fetch origin
&"C:\Program Files\Git\bin\git.exe" status
```

### See What's Different
```bash
&"C:\Program Files\Git\bin\git.exe" diff origin/main
```

## 📤 **Upload Files FROM Local TO GitHub**

### Save Your Work to Cloud
```bash
# Stage all changes
&"C:\Program Files\Git\bin\git.exe" add .

# Commit with message
&"C:\Program Files\Git\bin\git.exe" commit -m "Describe what you changed"

# Push to GitHub
&"C:\Program Files\Git\bin\git.exe" push origin main
```

### Quick Upload Workflow
```bash
&"C:\Program Files\Git\bin\git.exe" add .
&"C:\Program Files\Git\bin\git.exe" commit -m "Update"
&"C:\Program Files\Git\bin\git.exe" push origin main
```

## 🔍 **Check Status & History**

```bash
&"C:\Program Files\Git\bin\git.exe" status           # See current changes
&"C:\Program Files\Git\bin\git.exe" log --oneline    # See commit history  
&"C:\Program Files\Git\bin\git.exe" remote -v        # Show GitHub connection
```

## 🚨 **Emergency Commands**

### Reset Local to Match GitHub Exactly
```bash
&"C:\Program Files\Git\bin\git.exe" fetch origin
&"C:\Program Files\Git\bin\git.exe" reset --hard origin/main
```

### Discard Local Changes
```bash
&"C:\Program Files\Git\bin\git.exe" checkout -- .
```

## 💡 **Daily Workflow**

1. **Start work**: `&"C:\Program Files\Git\bin\git.exe" pull origin main`
2. **Make changes**: Edit files in VS Code
3. **Save to cloud**: 
   ```bash
   &"C:\Program Files\Git\bin\git.exe" add .
   &"C:\Program Files\Git\bin\git.exe" commit -m "What I did"
   &"C:\Program Files\Git\bin\git.exe" push origin main
   ```

## 🛠️ **Alternative: Add Git to PATH (Optional)**

To use just `git` instead of the full path, add Git to your system PATH:
1. Open System Properties → Environment Variables
2. Edit PATH variable
3. Add: `C:\Program Files\Git\bin`
4. Restart PowerShell

---
*Your local folder: `C:\Users\a\projectvcs`*  
*Your GitHub repo: `https://github.com/sparkai1234/projectvcs`* 