#!/bin/bash

# Navigate to your project directory (modify this path as needed)
cd "C:\Users\ansht\OneDrive\Pictures\Pictures\Desktop\Mentify SAP\Mentify>"

# Add all changes
git add .

# Commit with a custom or default message
echo "Enter commit message: "
read commit_message
if [ -z "$commit_message" ]; then
    commit_message="Updated project - $(date)"
fi
git commit -m "$commit_message"

# Pull latest changes from the repository to avoid conflicts
git pull origin main  # Change 'main' to 'master' if needed

# Push changes to GitHub
git push origin main  # Change 'main' to your branch name if different

echo "Project successfully updated and deployed to GitHub!"
