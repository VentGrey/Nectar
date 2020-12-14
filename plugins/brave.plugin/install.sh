#!/bin/bash

# Brave for Pop!

# Install pre-requisites
apt install apt-transport-https curl gnupg

# Add gpg key
echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list

# Update sources
apt update

# Install brave
apt install brave-browser
