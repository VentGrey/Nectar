#!/bin/bash

rm /etc/apt/sources.list.d/vscodium.list
apt update
apt remove --autoremove --purge codium
