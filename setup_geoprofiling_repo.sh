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
echo "IMPORTANT: Prerequisites"
echo "=========================================="
echo ""
echo "Before proceeding, make sure you have:"
echo "1. Created a GitHub account with username: ${USERNAME}"
echo "   If not, go to: https://github.com/signup"
echo ""
echo "2. Created a Personal Access Token (PAT) for authentication:"
echo "   - Go to: https://github.com/settings/tokens"
echo "   - Click 'Generate new token' -> 'Generate new token (classic)'"
echo "   - Give it a name (e.g., 'geoprofiling-pages')"
echo "   - Select scope: 'repo' (full control of private repositories)"
echo "   - Click 'Generate token' and COPY IT (you won't see it again!)"
echo ""
echo "=========================================="
echo "Next Steps:"
echo "=========================================="
echo ""
echo "1. Create the repository on GitHub:"
echo "   - Log in to GitHub as: ${USERNAME}"
echo "   - Go to: https://github.com/new"
echo "   - Repository name: ${REPO_NAME} (must be exact!)"
echo "   - Make it Public (required for free GitHub Pages)"
echo "   - DO NOT initialize with README, .gitignore, or license"
echo "   - Click 'Create repository'"
echo ""
echo "2. Once created, push the code:"
echo "   Option A: Use the push script with authentication:"
echo "     ./push_geoprofiling_with_auth.sh"
echo ""
echo "   Option B: Push manually:"
echo "     cd /data3/abhipsa/datacomp/laion-en/project_page"
echo "     git push -u origin main"
echo "     (You'll be prompted for username: ${USERNAME} and password: <paste your PAT>)"
echo ""
echo "3. Enable GitHub Pages (usually automatic for .github.io repos):"
echo "   - Go to: https://github.com/${USERNAME}/${REPO_NAME}/settings/pages"
echo "   - Source: Deploy from a branch"
echo "   - Branch: main"
echo "   - Folder: / (root)"
echo "   - Click 'Save'"
echo ""
echo "Your page will be live at:"
echo "https://${USERNAME}.github.io/"
echo ""
echo "Note: For .github.io repositories, GitHub Pages is usually enabled automatically"
echo "      and the site will be available at the root URL (geoprofiling.github.io)"
echo "      It may take a few minutes for the site to be live after the first push."
echo ""
