#!/bin/bash
# Setup script for GitHub repository: geoprofiling.github.io
# This will create a repository that serves at https://geoprofiling.github.io

set -e

REPO_NAME="geoprofiling.github.io"
USERNAME="geoprofiling"
REPO_URL="https://github.com/${USERNAME}/${REPO_NAME}.git"

echo "=========================================="
echo "Setting up GitHub repository for geoprofiling.github.io"
echo "=========================================="
echo "Repository: ${REPO_NAME}"
echo "Username: ${USERNAME}"
echo ""

# Navigate to project_page directory
cd /data3/abhipsa/datacomp/laion-en/project_page

# Initialize git if not already done
if [ ! -d .git ]; then
    echo "Initializing git repository..."
    git init
    git branch -M main
else
    echo "Git repository already initialized."
    # Ensure we're on main branch
    git branch -M main 2>/dev/null || true
fi

# Add all files
echo "Adding files to git..."
git add .

# Check if there are changes to commit
if git diff --staged --quiet 2>/dev/null && [ -n "$(git log --oneline 2>/dev/null)" ]; then
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
echo "   Username: ${USERNAME}"
echo "   DO NOT initialize with README, .gitignore, or license"
echo "   Click 'Create repository'"
echo ""
echo "2. Once created, run this command to push:"
echo "   cd /data3/abhipsa/datacomp/laion-en/project_page"
echo "   git push -u origin main"
echo ""
echo "3. Enable GitHub Pages (usually automatic for .github.io repos):"
echo "   Go to: https://github.com/${USERNAME}/${REPO_NAME}/settings/pages"
echo "   Source: Deploy from a branch"
echo "   Branch: main"
echo "   Folder: / (root)"
echo "   Click 'Save'"
echo ""
echo "Your page will be live at:"
echo "https://${USERNAME}.github.io/"
echo ""
echo "Note: For .github.io repositories, GitHub Pages is usually enabled automatically"
echo "      and the site will be available at the root URL (geoprofiling.github.io)"
echo ""
