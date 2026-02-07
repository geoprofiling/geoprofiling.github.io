#!/bin/bash
# Script to push with authentication prompt

cd /data3/abhipsa/datacomp/laion-en/project_page

echo "=========================================="
echo "Pushing to GitHub"
echo "=========================================="
echo ""
echo "You will be prompted for:"
echo "  Username: abhipsabasu"
echo "  Password: <paste your personal access token>"
echo ""
echo "Note: Use your PERSONAL ACCESS TOKEN, not your GitHub password!"
echo ""

# Clear any cached credentials
git config --local --unset credential.helper 2>/dev/null || true
unset GIT_ASKPASS

# Push - this should prompt for credentials
git push -u origin main

echo ""
echo "If successful, your code is now on GitHub!"
echo "Next: Enable GitHub Pages in repository settings."
