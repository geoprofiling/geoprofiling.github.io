#!/bin/bash
# Quick push script for geoprofiling.github.io repository

set -e

cd /data3/abhipsa/datacomp/laion-en/project_page

echo "Adding all changes..."
git add .

if ! git diff --staged --quiet 2>/dev/null; then
    echo "Committing changes..."
    git commit -m "Update project page"
else
    echo "No changes to commit."
fi

echo "Pushing to GitHub..."
git push origin main

echo ""
echo "Done! Your site should be available at: https://geoprofiling.github.io"
echo "Note: It may take a few minutes for changes to appear."
