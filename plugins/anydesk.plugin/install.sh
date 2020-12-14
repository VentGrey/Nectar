#!/bin/bash

# Instructions adopted from
# http://apt.anydesk.com/howto.html

# Add anydesk repo key
wget -qO - https://keys.anydesk.com/repos/DEB-GPG-KEY | apt-key add -

# Create a new source list file
echo "deb http://deb.anydesk.com/ all main" > /etc/apt/sources.list.d/anydesk-stable.list

# Update apt
apt update

# Install anydesk
apt install anydesk
