#!/bin/bash
# Script to push to geoprofiling.github.io with authentication prompt

cd /data3/abhipsa/datacomp/laion-en/project_page

echo "=========================================="
echo "Pushing to GitHub (geoprofiling.github.io)"
echo "=========================================="
echo ""
echo "You will be prompted for:"
echo "  Username: geoprofiling"
echo "  Password: <paste your personal access token>"
echo ""
echo "Note: Use your PERSONAL ACCESS TOKEN, not your GitHub password!"
echo "      If you don't have one, create it at: https://github.com/settings/tokens"
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

# Clear any cached credentials
git config --local --unset credential.helper 2>/dev/null || true
unset GIT_ASKPASS

# Push - this should prompt for credentials
echo ""
echo "Pushing to GitHub..."
git push -u origin main

echo ""
echo "=========================================="
echo "Done!"
echo "=========================================="
echo ""
echo "If successful, your code is now on GitHub!"
echo "Your site should be available at: https://geoprofiling.github.io"
echo "(It may take a few minutes for changes to appear)"
echo ""
