#!/bin/bash

# Set repository URL
REPO_URL="https://github.com/AnshTank/MindMingle.git"

# Confirm before proceeding
echo "⚠️  WARNING: This will DELETE all Git history and reset the repository."
read -p "Are you sure you want to continue? (yes/no): " choice
if [[ "$choice" != "yes" ]]; then
    echo "Operation cancelled."
    exit 1
fi

# Navigate to the project directory (optional, change this if needed)
# cd /path/to/your/project

# Remove .git history
echo "🔄 Removing Git history..."
rm -rf .git

# Reinitialize Git
echo "🔄 Initializing new Git repository..."
git init

# Add all files
echo "➕ Adding files..."
git add .

# Create a new commit
echo "📝 Creating initial commit..."
git commit -m "Initial commit"

# Add remote repository
echo "🔗 Adding remote repository..."
git remote add origin "$REPO_URL"

# Force push to overwrite history
echo "🚀 Pushing to GitHub (this will overwrite previous history)..."
git push --force --set-upstream origin main

echo "✅ Git history reset and pushed successfully!"
