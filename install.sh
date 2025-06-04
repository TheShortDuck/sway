#!/bin/bash

# Check if git is installed
if ! command -v git &> /dev/null; then
    echo "Git is not installed. Attempting to install Git..."
    
    # Use apt to install git
    if command -v apt &> /dev/null; then
        sudo apt update
        sudo apt install git -y
    else
        echo "Cannot install Git automatically using apt. Please install Git manually and run this script again."
        exit 1
    fi
    
    # Check again if git is installed after attempting to install
    if ! command -v git &> /dev/null; then
        echo "Git installation failed. Please install Git manually and run this script again."
        exit 1
    fi
fi

echo "Git is installed. Continuing with the script..."
# Add further commands here after ensuring Git is installed



# Clone the repository into the home directory
git clone https://github.com/TheShortDuck/sway ~/sway


clear
echo "
###############################################################################
#  SWAY Custom Install Script                                                 #
#                                                                             #
#  Based on JustAGuyLinux Sway install script                                 #
###############################################################################
"

# Make setup.sh executable (if needed, though it's typically already executable)
# chmod +x setup.sh packages.sh

# Run the custom install script
bash ~/sway/install_scripts/custom_sway.sh

clear

# Run the ghostty install script
bash ~/sway/install_scripts/install_ghostty.sh

clear

# Run the fish install script
bash ~/sway/install_scripts/install_fish.sh

clear

# Run the vscode install script
bash ~/sway/install_scripts/install_vscode.sh

clear

# Run the Discord install script
bash ~/sway/install_scripts/discord_install.sh

clear

# Run the tailscale install script
bash ~/sway/install_scripts/install_tailscale.sh

clear

# Run the verilator install script
bash ~/sway/install_scripts/install_verilator.sh

clear

echo "Make sure a Display Manager is installed"

# make sure gdm3 is installed
bash ~/sway/install_scripts/gdm.sh

clear
 
bash ~/sway/install_scripts/printers.sh

clear 

bash ~/sway/install_scripts/bluetooth.sh
sudo apt autoremove

printf "\e[1;32mYou can now reboot! Thank you.\e[0m\n"

