#!/bin/bash

echo "Welcome to the Frontend Deployment Script"
echo "1. Fresh Deploy"
echo "2. Update Deploy"
echo "3. Setup SSH"
read -p "Enter your choice (1, 2, or 3): " choice

case $choice in
    1)
        echo "Starting Fresh Deploy..."
        ./scripts/fresh_deploy.sh
        ;;
    2)
        echo "Starting Update Deploy..."
        ./scripts/update_deploy.sh
        ;;
    3)
        echo "Setting up SSH..."
        ./scripts/setup_ssh.sh
        ;;
    *)
        echo "Invalid choice. Exiting."
        exit 1
        ;;
esac