@echo off
REM =====================================================
REM GitHub Deployment Script - Run in One Go
REM =====================================================
REM This script automates all deployment steps:
REM 1. Add all files to git
REM 2. Commit with timestamp
REM 3. Push to main branch
REM 4. Create and push release tag
REM =====================================================

setlocal enabledelayedexpansion

REM Get current directory
cd /d "%~dp0"

echo.
echo =====================================================
echo   VOICE NEWSPAPER - GitHub Deployment Script
echo =====================================================
echo.

REM Check if git is installed
git --version >nul 2>&1
if errorlevel 1 (
    echo ERROR: Git is not installed or not in PATH
    echo Please install Git from https://git-scm.com/
    pause
    exit /b 1
)

REM Check if we're in a git repository
git rev-parse --git-dir >nul 2>&1
if errorlevel 1 (
    echo ERROR: This is not a Git repository
    echo Please run this script from your project root directory
    pause
    exit /b 1
)

REM Get current branch
for /f "tokens=*" %%i in ('git rev-parse --abbrev-ref HEAD') do set CURRENT_BRANCH=%%i
echo Current Branch: %CURRENT_BRANCH%

REM Get current date and time for commit message
for /f "tokens=2-4 delims=/ " %%a in ('date /t') do set mydate=%%c-%%a-%%b
for /f "tokens=1-2 delims=/:" %%a in ('time /t') do set mytime=%%a%%b
set TIMESTAMP=%mydate%_%mytime%

echo.
echo =====================================================
echo   Step 1: Stage Files
echo =====================================================
echo Adding all files to staging area...
git add .
if errorlevel 1 (
    echo ERROR: Failed to add files
    pause
    exit /b 1
)
echo [OK] Files staged

echo.
echo =====================================================
echo   Step 2: Commit Changes
echo =====================================================
set COMMIT_MSG=Deployment: Update code - %TIMESTAMP%
echo Commit Message: %COMMIT_MSG%
git commit -m "%COMMIT_MSG%"
if errorlevel 1 (
    echo Warning: Nothing to commit (repository up to date)
) else (
    echo [OK] Changes committed
)

echo.
echo =====================================================
echo   Step 3: Push to GitHub
echo =====================================================
echo Pushing to branch: %CURRENT_BRANCH%
git push origin %CURRENT_BRANCH%
if errorlevel 1 (
    echo ERROR: Failed to push to GitHub
    echo Please check your internet connection and GitHub credentials
    pause
    exit /b 1
)
echo [OK] Pushed to GitHub

echo.
echo =====================================================
echo   Step 4: Create Release Tag
echo =====================================================
REM Get version from user or auto-generate
echo.
echo Enter release version (e.g., v1.0.0, v2.1 - press Enter to skip tag):
set /p VERSION=
if not "!VERSION!"=="" (
    echo Creating tag: !VERSION!
    git tag -a !VERSION! -m "Release !VERSION! - !TIMESTAMP!"
    if errorlevel 1 (
        echo ERROR: Failed to create tag
        echo Tag might already exist, try a different version
        pause
        exit /b 1
    )
    
    echo Pushing tag to GitHub...
    git push origin !VERSION!
    if errorlevel 1 (
        echo ERROR: Failed to push tag
        pause
        exit /b 1
    )
    echo [OK] Tag created and pushed
) else (
    echo Skipped tag creation
)

echo.
echo =====================================================
echo   Step 5: Verify Deployment
echo =====================================================
echo.
echo Checking git status...
git status
echo.
echo Current commits (last 3):
echo.
git log --oneline -3
echo.

echo =====================================================
echo   ✅ DEPLOYMENT COMPLETE!
echo =====================================================
echo.
echo Your changes are now live on GitHub!
echo Repository: https://github.com/YOUR_USERNAME/Voice-Newspaper-Web-Scraping
echo.

REM Open GitHub in browser (optional)
echo.
set /p OPEN_GITHUB=Open GitHub in browser? (y/n): 
if /i "!OPEN_GITHUB!"=="y" (
    start https://github.com
)

echo.
pause
