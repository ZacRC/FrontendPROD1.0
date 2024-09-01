#!/bin/bash

# Navigate to the frontend directory
cd frontend

# Build the React app
npm run build

# Check for changes
if [[ -z $(git status -s) ]]; then
    echo "No changes to commit in the frontend."
    exit 0
fi

# Stage all changes
git add .

# Commit changes
git commit -m "Update frontend: $(date +'%Y-%m-%d %H:%M:%S')"

# Push changes to the development branch
git push origin development

echo "Frontend changes have been built and committed to the development branch."