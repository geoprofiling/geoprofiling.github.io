#!/bin/bash
# Setup script for GitHub repository: geoprofile-multimodal-datasets

set -e

REPO_NAME="geoprofile-multimodal-datasets"
USERNAME="abhipsabasu"
REPO_URL="https://github.com/${USERNAME}/${REPO_NAME}.git"

echo "=========================================="
echo "Setting up GitHub repository"
echo "=========================================="
echo "Repository: ${REPO_NAME}"
echo "Username: ${USERNAME}"
echo ""

# Initialize git if not already done
if [ ! -d .git ]; then
    echo "Initializing git repository..."
    git init
else
    echo "Git repository already initialized."
fi

# Add all files
echo "Adding files to git..."
git add .

# Check if there are changes to commit
if git diff --staged --quiet 2>/dev/null; then
    echo "No changes to commit (files may already be committed)."
else
    echo "Making initial commit..."
    git commit -m "Initial commit: Project page for geographical profiling of vision-language datasets"
fi

# Set up remote
echo ""
echo "Setting up remote repository..."
if git remote get-url origin >/dev/null 2>&1; then
    echo "Remote 'origin' already exists. Removing it..."
    git remote remove origin
fi
git remote add origin ${REPO_URL}

echo ""
echo "=========================================="
echo "Next Steps:"
echo "=========================================="
echo ""
echo "1. Create the repository on GitHub:"
echo "   Go to: https://github.com/new"
echo "   Repository name: ${REPO_NAME}"
echo "   DO NOT initialize with README, .gitignore, or license"
echo "   Click 'Create repository'"
echo ""
echo "2. Once created, run these commands:"
echo "   cd /data3/abhipsa/datacomp/laion-en/project_page"
echo "   git push -u origin main"
echo ""
echo "   OR if your default branch is 'master':"
echo "   git branch -M main"
echo "   git push -u origin main"
echo ""
echo "3. Enable GitHub Pages:"
echo "   Go to: https://github.com/${USERNAME}/${REPO_NAME}/settings/pages"
echo "   Source: Deploy from a branch"
echo "   Branch: main"
echo "   Folder: / (root)"
echo "   Click 'Save'"
echo ""
echo "Your page will be live at:"
echo "https://${USERNAME}.github.io/${REPO_NAME}/"
echo ""
