#!/bin/bash

# Function to check if vscode is already installed
check_vscode_installed() {
    # Check if the nwg-look executable exists in PATH
    command -v code >/dev/null 2>&1
}

# Check if vscode is already installed
if check_vscode_installed; then
    echo "vscode is already installed."
    #exit 0
fi

# Deps
sudo apt install -y wget gpg
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" |sudo tee /etc/apt/sources.list.d/vscode.list > /dev/null
rm -f packages.microsoft.gpg

# Install Code
sudo apt install -y apt-transport-https
sudo apt update
sudo apt install -y code