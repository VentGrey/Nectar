#!/bin/bash

URL=$(wget "https://vivaldi.com/download/" -O - | tr ' ' '\n' | grep -o "http*.\?://.*vivaldi.*.$(uname -m).apt" | head -n 1)
dnf -y install "$URL"
