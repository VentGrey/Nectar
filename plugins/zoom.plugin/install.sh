#!/bin/bash

CACHEDIR="/var/cache/fedy/zoom";

mkdir -p "$CACHEDIR"
cd "$CACHEDIR"

wget https://zoom.us/client/latest/zoom_$(uname -m).apt -O zoom.apt

dnf -y install ./zoom.apt
