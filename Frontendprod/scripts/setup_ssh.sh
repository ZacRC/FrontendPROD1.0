#!/bin/bash

# Generate SSH key
ssh-keygen -t rsa -b 4096 -C "frontendprod@example.com" -f ~/.ssh/frontendprod_rsa -N ""

# Set up SSH config
echo "Host github.com-frontendprod
    HostName github.com
    User git
    IdentityFile ~/.ssh/frontendprod_rsa" >> ~/.ssh/config

# Display the public key
echo "Add the following public key to your GitHub account:"
cat ~/.ssh/frontendprod_rsa.pub

echo "Once you've added the key to GitHub, press any key to continue..."
read -n 1 -s

# Test the SSH connection
ssh -T git@github.com-frontendprod

echo "SSH setup complete."