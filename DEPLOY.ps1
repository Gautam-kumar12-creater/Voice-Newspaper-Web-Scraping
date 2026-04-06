# GitHub Deployment Script - PowerShell Version
# Usage: .\DEPLOY.ps1

# Color output functions
function Write-Header {
    param([string]$Message)
    Write-Host ""
    Write-Host "================================================" -ForegroundColor Cyan
    Write-Host "  $Message" -ForegroundColor Cyan
    Write-Host "================================================" -ForegroundColor Cyan
    Write-Host ""
}

function Write-Success {
    param([string]$Message)
    Write-Host "[OK] $Message" -ForegroundColor Green
}

function Write-ErrorMsg {
    param([string]$Message)
    Write-Host "[ERROR] $Message" -ForegroundColor Red
}

function Write-Info {
    param([string]$Message)
    Write-Host "[INFO] $Message" -ForegroundColor Yellow
}

# Get current directory
$ProjectRoot = Get-Location
Write-Host ""
Write-Host "============================================" -ForegroundColor Magenta
Write-Host "  VOICE NEWSPAPER - GitHub Deployment" -ForegroundColor Magenta
Write-Host "============================================" -ForegroundColor Magenta
Write-Host ""

Write-Info "Project Location: $ProjectRoot"
Write-Host ""

# Check if git is available
if ((Get-Command git -ErrorAction SilentlyContinue) -eq $null) {
    Write-ErrorMsg "Git is not installed or not in PATH"
    Write-Info "Please install Git from https://git-scm.com/"
    exit 1
}

$gitVersion = git --version
Write-Success "Git is installed: $gitVersion"

# Check if we're in a git repository
$gitDirCheck = git rev-parse --git-dir 2>$null
if ($LASTEXITCODE -ne 0) {
    Write-ErrorMsg "This is not a Git repository"
    Write-Info "Please run this script from your project root directory"
    exit 1
}

# Get current branch
$currentBranch = git rev-parse --abbrev-ref HEAD
Write-Info "Current Branch: $currentBranch"

# Generate timestamp
$timestamp = Get-Date -Format "yyyy-MM-dd_HHmmss"

Write-Header "Step 1: Stage Files"
Write-Info "Adding all files to staging area..."
git add .
if ($LASTEXITCODE -eq 0) {
    Write-Success "Files staged successfully"
} else {
    Write-ErrorMsg "Failed to stage files"
    exit 1
}

Write-Header "Step 2: Commit Changes"
$CommitMessage = "Deployment: Update code - $timestamp"
Write-Info "Commit Message: $CommitMessage"
git commit -m "$CommitMessage"
if ($LASTEXITCODE -eq 0) {
    Write-Success "Changes committed"
} else {
    Write-Info "Nothing to commit (repository up to date)"
}

Write-Header "Step 3: Push to GitHub"
Write-Info "Pushing to branch: $currentBranch"
git push origin $currentBranch
if ($LASTEXITCODE -eq 0) {
    Write-Success "Pushed to GitHub successfully"
} else {
    Write-ErrorMsg "Failed to push to GitHub"
    Write-Info "Please check your internet connection and GitHub credentials"
    exit 1
}

Write-Header "Step 4: Create Release Tag (Optional)"
Write-Info "Enter release version (e.g., v1.0.0, v2.1)"
Write-Info "Press Enter to skip tag creation"
$ReleaseVersion = Read-Host "Version"

if ($ReleaseVersion -ne "") {
    Write-Info "Creating tag: $ReleaseVersion"
    git tag -a $ReleaseVersion -m "Release $ReleaseVersion - $timestamp"
    if ($LASTEXITCODE -eq 0) {
        Write-Info "Pushing tag to GitHub..."
        git push origin $ReleaseVersion
        if ($LASTEXITCODE -eq 0) {
            Write-Success "Tag created and pushed"
        } else {
            Write-ErrorMsg "Failed to push tag"
            exit 1
        }
    } else {
        Write-ErrorMsg "Failed to create tag (might already exist)"
        exit 1
    }
} else {
    Write-Info "Tag creation skipped"
}

Write-Header "Step 5: Verify Deployment"
Write-Info "Current git status:"
Write-Host ""
git status
Write-Host ""
Write-Info "Last 3 commits:"
Write-Host ""
git log --oneline -3
Write-Host ""

Write-Header "DEPLOYMENT COMPLETE!"
Write-Host "Your changes are now live on GitHub!" -ForegroundColor Green
Write-Host ""
Write-Info "Repository: https://github.com/YOUR_USERNAME/Voice-Newspaper-Web-Scraping"
Write-Info "If GitHub Pages is enabled, your site will update in 2-5 minutes"

Write-Host ""
$response = Read-Host "Open GitHub in browser? (y/n)"
if ($response -eq 'y' -or $response -eq 'Y') {
    Start-Process "https://github.com"
}

Write-Host ""
Write-Host "Deployment script finished!" -ForegroundColor Cyan
Write-Host ""
