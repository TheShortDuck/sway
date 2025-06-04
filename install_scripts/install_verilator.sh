#!/bin/bash

# Function to check if verilator is already installed
check_verilator_installed() {
    # Check if the nwg-look executable exists in PATH
    command -v verilator >/dev/null 2>&1
}

# Check if verilator is already installed
if check_verilator_installed; then
    echo "verilator is already installed."
    exit 0
fi

# Dependencies
sudo apt install -y git help2man perl python3 make g++ libfl2 ccache mold libgoogle-perftools-dev numactl perl-doc autoconf flex bison

# Clone
git clone https://github.com/verilator/verilator ~/sway/verilator
cd ~/sway/verilator

# Get latest version
latesttag=$(git describe --tag --abbrev=0)
echo Checking Out: ${latesttag}
git checkout ${latesttag}

# Configure and build
autoconf

./configure

make -j 6

make test

sudo make install

