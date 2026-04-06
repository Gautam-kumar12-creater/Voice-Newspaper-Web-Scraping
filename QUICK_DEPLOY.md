# QUICK DEPLOY GUIDE - How to Run

## If You're in PowerShell (Your Current Situation)

### Option 1: Use the Simple Script (Recommended)
```powershell
.\DEPLOY_SIMPLE.ps1
```

### Option 2: Use the Full PowerShell Script
```powershell
.\DEPLOY.ps1
```

### Option 3: Use the Batch File from PowerShell
```powershell
cmd /c DEPLOY.bat
```

---

## If You're in Command Prompt (CMD)

### Use the Batch File
```cmd
DEPLOY.bat
```

Or:
```cmd
cd c:\Users\Gautam\project\Voice-Newspaper-Web-Scraping
DEPLOY.bat
```

---

## If You're on macOS/Linux

```bash
bash DEPLOY.sh
```

---

## What You Need to Know

### Three Deployment Scripts Available:

| File | OS | Command | Best For |
|------|----|---------| ---------|
| `DEPLOY_SIMPLE.ps1` | Windows | `.\DEPLOY_SIMPLE.ps1` | ⭐ **EASIEST** - Simple, works great |
| `DEPLOY.ps1` | Windows | `.\DEPLOY.ps1` | PowerShell users who want details |
| `DEPLOY.bat` | Windows | `cmd /c DEPLOY.bat` | Command Prompt users |
| `DEPLOY.sh` | Linux/macOS | `bash DEPLOY.sh` | Linux/macOS users |

---

## 🚀 RIGHT NOW (You're in PowerShell):

### Just copy and paste this:
```powershell
.\DEPLOY_SIMPLE.ps1
```

That's it! Everything will be deployed automatically.

---

## What Happens When You Run It:

1. **Stages all changes** → `git add .`
2. **Creates a commit** → `git commit -m "Deployment: ..."`
3. **Pushes to GitHub** → `git push origin main`
4. **Shows status** → Last 3 commits displayed
5. **Optional: Creates a release tag** → `git tag v1.0`

All in **one command**! ✅

---

## Troubleshooting

### If you see "is not recognized" error:
Make sure you're in your project directory first:
```powershell
cd c:\Users\Gautam\project\Voice-Newspaper-Web-Scraping
.\DEPLOY_SIMPLE.ps1
```

### If you see permission errors:
Run this first (one time only):
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

Then run the script:
```powershell
.\DEPLOY_SIMPLE.ps1
```

---

## After Deployment

1. **Check GitHub**: https://github.com/YOUR_USERNAME/Voice-Newspaper-Web-Scraping
2. **Check your releases** (if you created a tag): https://github.com/YOUR_USERNAME/Voice-Newspaper-Web-Scraping/releases
3. **Share the link** with anyone to showcase your project!

---

## Still Having Issues?

Check your git configuration:
```powershell
git config --global user.name
git config --global user.email
git config --list
```

If git isn't responding, check your internet connection and try again.

Enjoy! 🚀
