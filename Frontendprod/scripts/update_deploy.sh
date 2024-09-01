#!/bin/bash

# Update Deploy Script

# Navigate to the project directory
cd /root/Frontendprod

# Fetch latest changes
git fetch origin

# Merge development branch into main (production)
git checkout main
git merge origin/development

# Install any new dependencies
npm install

# Build the React app
npm run build

# Copy new build files to Nginx serve directory
sudo cp -r build/* /var/www/html/

# Restart Nginx
sudo systemctl restart nginx

echo "Update deployment completed successfully!"