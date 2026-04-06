#!/bin/bash
# =====================================================
# GitHub Deployment Script - Linux/macOS Version
# =====================================================
# This script automates all deployment steps:
# 1. Add all files to git
# 2. Commit with timestamp
# 3. Push to main branch
# 4. Create and push release tag
# =====================================================
# Usage: bash DEPLOY.sh

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Functions
print_header() {
    echo -e "${CYAN}
=====================================================
  $1
=====================================================\n${NC}"
}

print_success() {
    echo -e "${GREEN}[✓] $1${NC}"
}

print_error() {
    echo -e "${RED}[✗] $1${NC}"
}

print_info() {
    echo -e "${YELLOW}[i] $1${NC}"
}

# Get current directory
PROJECT_ROOT=$(pwd)

echo -e "${CYAN}
╔═══════════════════════════════════════════════════╗
║  VOICE NEWSPAPER - GitHub Deployment Script      ║
╚═══════════════════════════════════════════════════╝
${NC}"

print_info "Project Location: $PROJECT_ROOT"

# Check if git is available
if ! command -v git &> /dev/null; then
    print_error "Git is not installed"
    print_info "Please install Git from https://git-scm.com/"
    exit 1
fi

GIT_VERSION=$(git --version)
print_success "Git is installed: $GIT_VERSION"

# Check if we're in a git repository
if ! git rev-parse --git-dir > /dev/null 2>&1; then
    print_error "This is not a Git repository"
    print_info "Please run this script from your project root directory"
    exit 1
fi

# Get current branch
CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
print_info "Current Branch: $CURRENT_BRANCH"

# Generate timestamp
TIMESTAMP=$(date +"%Y-%m-%d_%H%M%S")

print_header "Step 1: Stage Files"
print_info "Adding all files to staging area..."
git add .
if [ $? -eq 0 ]; then
    print_success "Files staged"
else
    print_error "Failed to stage files"
    exit 1
fi

print_header "Step 2: Commit Changes"
COMMIT_MSG="Deployment: Update code - $TIMESTAMP"
print_info "Commit Message: $COMMIT_MSG"
git commit -m "$COMMIT_MSG"
if [ $? -eq 0 ]; then
    print_success "Changes committed"
else
    print_info "Nothing to commit (repository up to date)"
fi

print_header "Step 3: Push to GitHub"
print_info "Pushing to branch: $CURRENT_BRANCH"
git push origin $CURRENT_BRANCH
if [ $? -eq 0 ]; then
    print_success "Pushed to GitHub"
else
    print_error "Failed to push to GitHub"
    print_info "Please check your internet connection and GitHub credentials"
    exit 1
fi

print_header "Step 4: Create Release Tag (Optional)"
print_info "Enter release version (e.g., v1.0.0, v2.1)"
print_info "Press Enter to skip tag creation"
read -p "Version: " RELEASE_VERSION

if [ ! -z "$RELEASE_VERSION" ]; then
    print_info "Creating tag: $RELEASE_VERSION"
    git tag -a $RELEASE_VERSION -m "Release $RELEASE_VERSION - $TIMESTAMP"
    if [ $? -eq 0 ]; then
        print_info "Pushing tag to GitHub..."
        git push origin $RELEASE_VERSION
        if [ $? -eq 0 ]; then
            print_success "Tag created and pushed"
        else
            print_error "Failed to push tag"
            exit 1
        fi
    else
        print_error "Failed to create tag (might already exist)"
        exit 1
    fi
else
    print_info "Tag creation skipped"
fi

print_header "Step 5: Verify Deployment"
print_info "Current git status:"
echo ""
git status
echo ""
print_info "Last 3 commits:"
echo ""
git log --oneline -3
echo ""

echo -e "${GREEN}
═══════════════════════════════════════════════════
  ✅ DEPLOYMENT COMPLETE!
═══════════════════════════════════════════════════${NC}

Your changes are now live on GitHub!

"
print_info "Repository: https://github.com/YOUR_USERNAME/Voice-Newspaper-Web-Scraping"
print_info "If GitHub Pages is enabled, your site will update in 2-5 minutes"

echo ""
read -p "Open GitHub in browser? (y/n): " RESPONSE
if [ "$RESPONSE" = "y" ] || [ "$RESPONSE" = "Y" ]; then
    open "https://github.com" 2>/dev/null || xdg-open "https://github.com" 2>/dev/null || echo "Please open https://github.com manually"
fi

echo -e "\n${CYAN}Deployment script finished!${NC}\n"
