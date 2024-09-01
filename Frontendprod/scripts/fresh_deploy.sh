#!/bin/bash

# Fresh Deploy Script

# Update system packages
sudo apt update
sudo apt upgrade -y

# Install Node.js and npm
curl -fsSL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt-get install -y nodejs

# Install Nginx
sudo apt install nginx -y

# Clone the repository using SSH
git clone git@github.com-frontendprod:ZacRC/FrontendPROD1.0.git frontend
cd frontend

# Install dependencies
npm install

# Build the React app
npm run build

# Copy build files to Nginx serve directory
sudo cp -r build/* /var/www/html/

# Copy Nginx configuration
sudo cp nginx/frontend.conf /etc/nginx/sites-available/frontend
sudo ln -s /etc/nginx/sites-available/frontend /etc/nginx/sites-enabled/

# Remove default Nginx configuration
sudo rm /etc/nginx/sites-enabled/default

# Restart Nginx
sudo systemctl restart nginx

echo "Fresh deployment completed successfully!"