#!/bin/bash
# Complete script to push project_page to GitHub
# Repository: abhipsabasu/geoprofile-multimodal-datasets

set -e

echo "=========================================="
echo "GitHub Repository Setup"
echo "=========================================="
echo ""

# Navigate to project_page directory
cd /data3/abhipsa/datacomp/laion-en/project_page

# Initialize git if needed
if [ ! -d .git ]; then
    echo "Initializing git repository..."
    git init
    git branch -M main
fi

# Add all files
echo "Adding files..."
git add .

# Commit if there are changes
if ! git diff --staged --quiet 2>/dev/null || [ -z "$(git log --oneline 2>/dev/null)" ]; then
    echo "Making initial commit..."
    git commit -m "Initial commit: Project page for geographical profiling of vision-language datasets"
else
    echo "Already committed."
fi

# Set up remote
echo "Setting up remote..."
git remote remove origin 2>/dev/null || true
git remote add origin https://github.com/abhipsabasu/geoprofile-multimodal-datasets.git

echo ""
echo "=========================================="
echo "Ready to push!"
echo "=========================================="
echo ""
echo "IMPORTANT: First create the repository on GitHub:"
echo "1. Go to: https://github.com/new"
echo "2. Repository name: geoprofile-multimodal-datasets"
echo "3. DO NOT initialize with README, .gitignore, or license"
echo "4. Click 'Create repository'"
echo ""
echo "Then run this command to push:"
echo "  git push -u origin main"
echo ""
echo "After pushing, enable GitHub Pages:"
echo "1. Go to: https://github.com/abhipsabasu/geoprofile-multimodal-datasets/settings/pages"
echo "2. Source: Deploy from a branch"
echo "3. Branch: main, Folder: / (root)"
echo "4. Click 'Save'"
echo ""
echo "Your page will be at: https://abhipsabasu.github.io/geoprofile-multimodal-datasets/"
echo ""
