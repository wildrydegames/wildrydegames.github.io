#!/bin/bash

# Exit immediately on error
set -e

# Build site using Zola
echo "🛠 Building site with Zola..."
zola build

# Sync public output to docs folder
echo "📁 Syncing public/ to docs/..."
rsync -a --delete public/ docs/

# Ensure CNAME is correct for custom domain
echo "www.wildrydegames.com" > docs/CNAME

# Stage all changes
echo "📦 Staging changes..."
git add .

# Commit with a generic message (you can modify if needed)
echo "✏️ Committing..."
git commit -m "Deploy updated Zola site"

# Push to GitHub
echo "🚀 Pushing to GitHub..."
git push origin main

echo "✅ Done! Your site should update in ~30 seconds at https://www.wildrydegames.com"