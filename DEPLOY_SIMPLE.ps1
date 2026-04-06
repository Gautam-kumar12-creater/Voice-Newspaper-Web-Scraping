# Simple GitHub Deployment Script
# Run: .\DEPLOY_SIMPLE.ps1

Write-Host ""
Write-Host "============================================" -ForegroundColor Green
Write-Host "  VOICE NEWSPAPER - GitHub Deployment" -ForegroundColor Green
Write-Host "============================================" -ForegroundColor Green
Write-Host ""

# Step 1: Stage files
Write-Host "[1/4] Staging files..." -ForegroundColor Cyan
git add .
if ($LASTEXITCODE -ne 0) {
    Write-Host "ERROR: Failed to stage files" -ForegroundColor Red
    exit 1
}
Write-Host "OK - Files staged" -ForegroundColor Green

# Step 2: Commit
Write-Host "[2/4] Committing changes..." -ForegroundColor Cyan
$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
git commit -m "Deployment: $timestamp"
if ($LASTEXITCODE -eq 0) {
    Write-Host "OK - Changes committed" -ForegroundColor Green
} else {
    Write-Host "INFO - Nothing new to commit" -ForegroundColor Yellow
}

# Step 3: Push
Write-Host "[3/4] Pushing to GitHub..." -ForegroundColor Cyan
$branch = git rev-parse --abbrev-ref HEAD
git push origin $branch
if ($LASTEXITCODE -ne 0) {
    Write-Host "ERROR: Failed to push" -ForegroundColor Red
    exit 1
}
Write-Host "OK - Pushed to GitHub" -ForegroundColor Green

# Step 4: Show status
Write-Host "[4/4] Verifying deployment..." -ForegroundColor Cyan
Write-Host ""
git log --oneline -3
Write-Host ""

Write-Host "============================================" -ForegroundColor Green
Write-Host "  DEPLOYMENT COMPLETE!" -ForegroundColor Green
Write-Host "============================================" -ForegroundColor Green
Write-Host ""
Write-Host "Your code is now live on GitHub!" -ForegroundColor Green
Write-Host ""

# Ask about creating a release
$createRelease = Read-Host "Create a release tag? (y/n)"
if ($createRelease -eq 'y' -or $createRelease -eq 'Y') {
    $version = Read-Host "Enter version (e.g., v1.0)"
    if ($version -ne "") {
        Write-Host "Creating tag $version..." -ForegroundColor Cyan
        git tag -a $version -m "Release $version"
        git push origin $version
        Write-Host "OK - Tag created and pushed" -ForegroundColor Green
    }
}

Write-Host ""
