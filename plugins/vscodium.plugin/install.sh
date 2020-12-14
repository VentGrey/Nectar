#!/bin/bash

# Get gpg
wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-apt-repo/raw/master/pub.gpg | gpg --dearmor | sudo dd of=/etc/apt/trusted.gpg.d/vscodium.gpg

# Add repository
echo 'deb https://paulcarroty.gitlab.io/vscodium-deb-apt-repo/debs/ vscodium main' | sudo tee --append /etc/apt/sources.list.d/vscodium.list

# Update Sources
apt update && apt install codium
