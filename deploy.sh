#!/bin/bash

# Exit on error
set -e

# Build the project with base-href for GitHub Pages
echo "Building the project..."
npm run build -- --base-href /dnd-2026-site/

# Navigate to the output directory
cd dist/dnd-2026-site/browser

# Initialize a temporary git repository
echo "Initializing temporary git repo..."
git init -b main
git add .
git commit -m "Deploy to GitHub Pages"

# Force push to the gh-pages branch of the remote repository
echo "Pushing to gh-pages branch..."
REMOTE_URL=$(git -C ../../../ remote get-url origin)
git push --force "$REMOTE_URL" main:gh-pages

# Clean up
echo "Cleaning up..."
cd ../../../
rm -rf dist/dnd-2026-site/browser/.git

echo "Deployment complete!"
