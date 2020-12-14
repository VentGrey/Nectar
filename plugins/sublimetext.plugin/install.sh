#!/bin/bash

apt -v --import https://download.sublimetext.com/sublimehq-apt-pub.gpg
dnf config-manager --add-repo https://download.sublimetext.com/apt/stable/x86_64/sublime-text.repo
dnf -y install sublime-text
