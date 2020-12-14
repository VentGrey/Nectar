#!/bin/bash

URL=$(wget "https://www.rstudio.com/products/rstudio/download/" -O - | tr ' ' '\n' | grep -o "http*.\?://.*rstudio.*.$(uname -m).apt" | head -n 1)

dnf -y install "$URL"
