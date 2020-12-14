#!/bin/bash

CACHEDIR="/var/cache/fedy/Google-Music";

mkdir -p "$CACHEDIR"
cd "$CACHEDIR"

URL=$(curl -Ls -o /dev/null -w %{url_effective} https://github.com/MarshallOfSound/Google-Play-Music-Desktop-Player-UNOFFICIAL-/releases/latest)
VER=${URL##*/}

wget -c https://github.com/MarshallOfSound/Google-Play-Music-Desktop-Player-UNOFFICIAL-/releases/download/${URL##*/}/google-play-music-desktop-player-$(echo $VER | cut -c 2-).$(uname -m).apt -O google-music.apt

dnf -y install ./google-music.apt
