#!/bin/bash

if [[ $(apt --query --all jdk1.8*) ]]; then
    exit 0
else
    exit 1
fi
