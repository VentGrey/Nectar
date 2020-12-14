#!/bin/bash

dnf -y install http://linuxdownload.adobe.com/adobe-release/adobe-release-$(uname -i)-1.0-1.noarch.apt
apt --import /etc/pki/apt-gpg/RPM-GPG-KEY-adobe-linux
dnf -y install flash-player-ppapi
