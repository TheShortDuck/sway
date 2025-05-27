#!/bin/bash

# Function to check if tailscale is already installed
check_tailscale_installed() {
    # Check if the nwg-look executable exists in PATH
    command -v tailscale >/dev/null 2>&1
}

# Check if tailscale is already installed
if check_tailscale_installed; then
    echo "tailscale is already installed."
    exit 0
fi

curl -fsSL https://pkgs.tailscale.com/stable/debian/bookworm.noarmor.gpg | sudo tee /usr/share/keyrings/tailscale-archive-keyring.gpg >/dev/null
curl -fsSL https://pkgs.tailscale.com/stable/debian/bookworm.tailscale-keyring.list | sudo tee /etc/apt/sources.list.d/tailscale.list

sudo apt update
sudo apt install -y tailscale
