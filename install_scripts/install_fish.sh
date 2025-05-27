#!/bin/bash

# Function to check if fish is already installed
check_fish_installed() {
    # Check if the nwg-look executable exists in PATH
    command -v fish >/dev/null 2>&1
}

# Check if fish is already installed
if check_fish_installed; then
    echo "fish is already installed."
    exit 0
fi

echo 'deb http://download.opensuse.org/repositories/shells:/fish:/release:/4/Debian_12/ /' | sudo tee /etc/apt/sources.list.d/shells:fish:release:4.list

curl -fsSL https://download.opensuse.org/repositories/shells:fish:release:4/Debian_12/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/shells_fish_release_4.gpg > /dev/null

sudo apt update

sudo apt install -y fish

echo "
function on_exit --on-event fish_exit
    echo (set_color cyan) Aight Imma head out -_-
end

set -g fish_greeting

function fish_greeting
    echo (set_color purple) Hello! O_O
end
" >> ~/.config/fish/config.fish