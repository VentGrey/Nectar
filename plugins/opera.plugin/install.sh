#!/bin/bash

apt --import https://apt.opera.com/aptrepo.key

echo "[opera]
name=Opera packages
type=apt-md
baseurl=https://apt.opera.com/apt
gpgcheck=1
gpgkey=https://apt.opera.com/aptrepo.key
enabled=1" | tee /etc/yum.repos.d/opera.repo

dnf -y install opera-stable
