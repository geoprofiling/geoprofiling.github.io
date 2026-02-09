#!/bin/bash
# Script to push using Personal Access Token directly
# Usage: ./push_geoprofiling_token.sh <your_personal_access_token>

cd /data3/abhipsa/datacomp/laion-en/project_page

if [ -z "$1" ]; then
    echo "=========================================="
    echo "Usage: $0 <personal_access_token>"
    echo "=========================================="
    echo ""
    echo "This script pushes using your Personal Access Token directly."
    echo "Get your token from: https://github.com/settings/tokens"
    echo ""
    echo "Example:"
    echo "  $0 ghp_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
    echo ""
    exit 1
fi

TOKEN=$1

echo "=========================================="
echo "Pushing to GitHub (geoprofiling.github.io)"
echo "=========================================="
echo ""

# Add all changes first
echo "Adding all changes..."
git add .

# Commit if there are changes
if ! git diff --staged --quiet 2>/dev/null; then
    echo "Committing changes..."
    git commit -m "Update project page"
else
    echo "No changes to commit."
fi

# Update remote URL with token
echo ""
echo "Pushing to GitHub..."
git remote set-url origin https://geoprofiling:${TOKEN}@github.com/geoprofiling/geoprofiling.github.io.git

# Push
git push -u origin main

# Remove token from URL for security
git remote set-url origin https://geoprofiling@github.com/geoprofiling/geoprofiling.github.io.git

echo ""
echo "=========================================="
echo "Done!"
echo "=========================================="
echo ""
echo "Your code is now on GitHub!"
echo "Your site should be available at: https://geoprofiling.github.io"
echo "(It may take a few minutes for changes to appear)"
echo ""
